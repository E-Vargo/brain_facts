require_relative '../environment.rb'
require 'open-uri'
require 'nokogiri'


class BrainFacts::Scraper 

    @@base  = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    DOC = Nokogiri::HTML(open(@@base))

    def self.scrape_overview_page     #scrapes page for data regarding the central nervous system. each sections attributes stored in hash, hashes in array
        hash = {}
        array = []

        DOC.css("#section3").css("section").each do |e|
        hash = {header: e.css("h3").text, info: e.css("p").text}
        e.css("ul").text == "" ? nil : hash[:list] = e.css("ul").text       #scrapes ul text only if one exists
        array.push(hash)
        end
        
        array
    end

    def self.scrape_overview_options      #scrapes header text for each section
        DOC.css("#section3").css("h3").collect {|e| e.text}
    end

    def self.options         #print header for each cns class option
        BrainFacts::Scraper.scrape_overview_options.each_with_index do |e, i|
            puts "#{i+1}--- #{e} ---#{i+1}".center(60)
        end
    end

end
