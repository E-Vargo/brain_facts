#!/usr/bin/env
require_relative '../environment.rb'
require 'nokogiri'
require 'colorize'



class BrainFacts::CLI

    def call
    hello
    options
    interface
    big_brain
    end

    def interface
    input = nil
        while input != "end"
        puts "Enter a number for a part of the brain you want to know more about. Enter 'brain' to see the list 'end' to exit:"
        input = gets.chomp
        if input.to_i >= 1 && input.to_i <= 8
            @c = BrainFacts::CNSComponent.new(input)
            display_component(input) 
            info
            list
        elsif input == "brain"
        options
        end
        end
    end

    def info
        array = @c.info.split(/[!|.|?|;]/)  #removes redundant sentence from end of paragraph
        array.pop 
        puts "#{array.join}"
    end

    def options         #print header for each cns class option
        BrainFacts::Scraper.scrape_overview_options.each_with_index do |e, i|
            puts "#{i+1}--- #{e} ---#{i+1}".center(60)
        end
    end

    def display_component(input)        #display header for given user input
        puts "You have chosen the #{@c.header}.".colorize(:light_cyan)
    end

    def list 
        puts "#{@c.list}"
    end

    def hello
    puts "            -------WELCOME TO BRAIN FACTS-------".colorize(:light_cyan)
    puts "This is a selection of brain facts scraped from kenhub.com\n\n\n"
    end

    def big_brain
        puts "GOODBYE".colorize(:light_cyan)
        puts <<-'EOF'.colorize(:cyan)
        
        .__---~~~(~~-_.
     _-'  ) -~~- ) _-" )_
    (  ( `-,_..`.,_--_ '_,)_
   (  -_)  ( -_-~  -_ `,    )
   (_ -_ _-~-__-~`, ,' )__-'))--___--~~~--__--~~--___--__..
   _ ~`_-'( (____;--==,,_))))--___--~~~--__--~~--__----~~~'`=__-~+_-_.
  (@) (@) `````      `-_(())_-~  mn


        EOF
    end


end