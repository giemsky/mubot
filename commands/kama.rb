require 'nokogiri'
require 'open-uri'

class Commands
  
  class Kama
    
    def self.command_name
      'kama'
    end
    
    def self.description
      "showing today's Kama Bistro menu"
    end
    
    def self.syntax
      'kama'
    end
    
    def self.active?
      true
    end
    
    def execute(*args)
      parse_website()
    end
    
    private
    
    def	parse_website
    	doc = Nokogiri::HTML(open("http://kamabistro.pl/dania.html"))
    	String.new.tap do |output|
    		output << "\nKama Bistro poleca na dziś:\n"
    		output << doc.xpath('/html/body/table[1]/tr/td[1]/font').map{|row| " - #{row.text}"}.join("\n")
    	end
  	rescue => e
  	  "Error: #{e}"
    end
  end
  
end