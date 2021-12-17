#!/usr/bin/env
require_relative '../environment.rb'
require 'nokogiri'
require 'colorize'
require 'pry'


class BrainFacts::CLI
    BASE_PATH = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    def call
        options
        input = gets.chomp.to_i
        display_component(input)
        c = BrainFacts::CNSComponent.new(input)
        puts "#{c.info}"
        puts "#{c.list}"
        puts "Would you like to make another selection? y/n"
    input = gets.chomp
    if input == "y" || input == "Y" 
        call
    elsif input == "n" || input == "N"
        exit
    end
    end

    def options
        BrainFacts::Scraper.scrape_overview_options(BASE_PATH).each_with_index do |e, i|
            puts "                 #{i+1}--- #{e} ---#{i+1}".center(40)
        end
    end

    def display_component(input)
        puts "You have chosen the #{BrainFacts::CNSComponent.new(input).header}.".colorize(:light_cyan)
    end
    
end