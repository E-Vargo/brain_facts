require_relative '../environment.rb'
require 'open-uri'
require 'nokogiri'
require 'pry'

class BrainFacts::Scraper 

    overview_url  = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    DOC = Nokogiri::HTML(open(overview_url))

    def self.scrape_overview_page(overview_url)
        hash = {}
        array = []
        DOC.css("#section3").css("section").each do |e|
        hash = {header: e.css("h3").text, info: e.css("p").text}
        e.css("ul").text == "" ? nil : hash[:list] = e.css("ul").text
        array.push(hash)
        end
        array
    end


    def self.scrape_overview_options(overview_url)
    DOC.css("#section3").css("h3").collect {|e| e.text}
    end

end

=begin
requirements:
need to iterate through each 'section' element within 
the 'section' element where id="section3" and collect following for
each:
all paragraphs, links, and li/ul such that the presentation
of text to the user will be sensible
each section begins with a href for a more info page

get unordered list text = doc.css("#section3").css("#section8").css("ul").text
get to a sections paragraph = doc.css("#section3").css("#section4").css("p").text
section3 header doc.css("#section3").css("h2").text
our item to iterate over = doc.css("#section3").css("section")
=end