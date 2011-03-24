class Commands
  
  class Joke
    
    def self.command_name
      'joke'
    end
    
    def self.description
      "tell typical programmer joke"
    end
    
    def self.syntax
      'joke'
    end
    
    def self.active?
      true
    end
    
    def execute(*args)
      tell_joke
    end
    
    private
    
    def	tell_joke
      str = File.read(File.dirname(__FILE__) + '/../data/jokes.txt')
      str.squeeze!("#").squeeze!(" ")
      jokes = str.split("#")
      jokes[rand(jokes.size)].strip
    end
  end
  
end

