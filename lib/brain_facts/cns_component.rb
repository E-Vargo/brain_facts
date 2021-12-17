require_relative '../environment.rb'

class BrainFacts::CNSComponent

    attr_accessor :header, :list, :info, :link, :index
    

    @@all = []

    def initialize(index)
    
    end

    def self.create_from_array(array)
        array.each {|e| BrainFacts::CNSComponent.new(e)}
    end
    
end