require_relative '../environment.rb'
require 'open-uri'
require 'nokogiri'


class BrainFacts::Scraper 

    overview_url  = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    DOC = Nokogiri::HTML(open(overview_url))

    def self.scrape_overview_page(overview_url)     #scrapes page for data regarding the central nervous system. each sections attributes stored in hash, hashes in array
        hash = {}
        array = []

        DOC.css("#section3").css("section").each do |e|
        hash = {header: e.css("h3").text, info: e.css("p").text}
        e.css("ul").text == "" ? nil : hash[:list] = e.css("ul").text       #scrapes ul text only if one exists
        array.push(hash)
        end
        
        array
    end

    def self.scrape_overview_options(overview_url)      #scrapes header text for each section
        DOC.css("#section3").css("h3").collect {|e| e.text}
    end

end
