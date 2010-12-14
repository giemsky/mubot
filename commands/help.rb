class Commands
  
  class Help
    
    def self.command_name
      'help'
    end
    
    def self.description
      'showing all available commands along with descriptions'
    end
    
    def self.syntax
      'help <command name>'
    end
    
    def self.active?
      true
    end
    
    def execute(*args)
      args.empty? ? general_help : command_help(*args)
    end
    
    private
    
    def command_help(*args)
      command_name = args.first
      command = Commands.find_command(command_name)
      String.new.tap do |output|
        output << command.syntax
        output << "\n"
        output << "\t"
        output << command.description
      end
    rescue InvalidCommand
      "Unknown command: #{command_name}"
    end
    
    def general_help
      Commands.available_commands.inject(String.new) do |output, command|
        output << "#{command.command_name}\n\t#{command.description}\n"
      end
    end
  end
  
end