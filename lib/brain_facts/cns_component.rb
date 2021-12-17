require_relative '../environment.rb'

class BrainFacts::CNSComponent

    attr_accessor :header, :list, :info, :link, :index
    
    BASE_PATH = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"

    @@all = []

    def initialize(input)
    #@header = BrainFacts::Scraper.scrape_overview_options(BASE_PATH)[input]
    hash = BrainFacts::Scraper.scrape_overview_page(BASE_PATH)[input]
    hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
    end

    def self.create_from_array(array)
        array.each {|e| BrainFacts::CNSComponent.new(e)}
    end
    
end