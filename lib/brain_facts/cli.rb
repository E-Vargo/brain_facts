#!/usr/bin/env
require_relative '../environment.rb'
require 'nokogiri'
require 'colorize'
require 'pry'


class BrainFacts::CLI
    BASE_PATH = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    def call
       puts "                   WELCOME TO BRAIN FACTS".colorize(:light_cyan)
       puts "This is a selection of educational options regarding nueroanatomy."
       puts "Enter a number for the part of the brain youd like to know mroe about!\n\n\n"
       #welcome user
       #describe options
       #list options
       #get inpput
       #present scraped data
       #represent options to user/ done? 
       options
    input = gets.chomp
    if input == "1"
        puts "#{BrainFacts::CNSComponent.new(BrainFacts::Scraper.scrape_overview_page(BASE_PATH)).header}"
    end
    end

    def options
        BrainFacts::Scraper.scrape_overview_options(BASE_PATH).each_with_index do |e, i|
            puts "                 #{i+1}--- #{e} ---#{i+1}".center(40)
        end
    end

    def display_component(input)

    end
    
end