#!/usr/bin/env
require_relative '../environment.rb'
require 'nokogiri'
require 'colorize'



class BrainFacts::CLI
    BASE_PATH = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"

    def call
    options
    input = gets.chomp.to_i
    if_valid_num(input)
    display_component(input)
    c = BrainFacts::CNSComponent.new(input)
        puts "#{c.info}"
        puts "#{c.list}"
        puts "Would you like to make another selection? y/n"
        input = gets.chomp
        if_valid_str(input)
    end

    def options         #print header for each cns class option
        BrainFacts::Scraper.scrape_overview_options(BASE_PATH).each_with_index do |e, i|
            puts "                 #{i+1}--- #{e} ---#{i+1}".center(40)
        end
    end

    def display_component(input)        #display header for given user input
        puts "You have chosen the #{BrainFacts::CNSComponent.new(input).header}.".colorize(:light_cyan)
    end

    def valid_input_str?(input)
        unless input == "y" || input == "Y" || input == "n" || input == "N"
            false
        end
    end

    def valid_input_num?(input)
        unless input = [1..8]
            false
        end
    end

    def if_valid_num(input)
        if valid_input_num?(input) == false
            puts "Please enter a valid input."
            sleep(1)
            call
        end
    end

    def if_valid_str(input)
        if valid_input_str?(input) == false
            puts "Please enter a valid input."
            sleep(1)
            call
        elsif input == "y" || input == "Y" 
            call
        elsif input == "n" || input == "N"
            exit
        end
    end
end