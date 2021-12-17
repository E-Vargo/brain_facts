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
       puts "Select which part of the brain you would like to know more about!"
       #welcome user
       #describe options
       #list options
       #get inpput
       #present scraped data
       #represent options to user/ done? 
    end

    def options
        BrainFacts::Scraper.scrape_overview_page(BASE_PATH + 'index.html')
    end
end