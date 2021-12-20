require_relative '../environment.rb'

class BrainFacts::CNSComponent

    attr_accessor :header, :list, :info, :link, :index
    
    def initialize(input)
    hash = BrainFacts::Scraper.scrape_overview_page[input.to_i]      #scrape_overview_page returns array of hashes, get hash which corresponds to input
    hash.each {|key, value| self.send(("#{key}="), value)}
    end

end