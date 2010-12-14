require File.dirname(__FILE__) + '/../test_helper'

class HelpTest < Test::Unit::TestCase
  include CommandHelper
  
  def setup
    @command = Commands::Help
  end
  
  def test_execute_with_params
    @command.any_instance.stubs(:command_help).once
    @command.new.execute('kama')
  end
  
  def test_execute_without_params
    @command.any_instance.stubs(:general_help).once
    @command.new.execute
  end
end