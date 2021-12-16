require_relative '../environment.rb'
require 'open-uri'
require 'nokogiri'
require 'pry'

class BrainFacts::Scraper 
    overview_url  = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"
    def scrape_overview_page(overview_url)
        doc = Nokogiri::HTML(open(overview_url))
        hash = {}
        a = doc.css("#section3").css("#section4").css("p").text
        
        binding.pry
    end
end

=begin
requirements:
need to iterate through each 'section' element within 
'section' element id="section3" and collect following for
each:
all paragraphs, links, and li/ul such that the presentation
of text to the user will be sensible
each section begins with a href for a more info page

get unordered list text = doc.css("#section3").css("#section8").css("ul").text
get to a sections paragraph = doc.css("#section3").css("#section4").css("p").text
section3 header doc.css("#section3").css("h2").text
our item to iterate over = doc.css("#section3").css("section")
=end