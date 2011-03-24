%w{help kama joke}.each do |filename|
  require File.join(File.dirname(__FILE__), 'commands', filename)
end

class UnknownCommand < StandardError; end
class InvalidArguments < StandardError; end

class Commands
  @@available_commands = self.constants.map{ |com| eval(com) }.select{ |com| com.active? }
  
  def self.execute(command_name, *args)
    command = self.find_command(command_name)
    command.new.execute(*args)
  end
  
  def self.find_command(command_name)
    command = @@available_commands.find{ |com| com.command_name == command_name }
    raise UnknownCommand unless command
    command
  end
  
  def self.available_commands
    @@available_commands
  end
  
end
