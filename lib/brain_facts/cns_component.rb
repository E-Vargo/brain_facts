require_relative '../environment.rb'

class BrainFacts::CNSComponent

    attr_accessor :header, :list, :info, :link, :index
    
    BASE_PATH = "https://www.kenhub.com/en/library/anatomy/neuroanatomy"

    def initialize(input)
    hash = BrainFacts::Scraper.scrape_overview_page(BASE_PATH)[input.to_i]      #scrape_overview_page returns array of hashes, get hash which corresponds to input
    hash.each {|key, value| self.send(("#{key}="), value)}
    end

end