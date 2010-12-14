require File.dirname(__FILE__) + '/test_helper'

class CommandsTest < Test::Unit::TestCase
  def test_execute
    Commands::Kama.any_instance.stubs(:execute).once
    Commands.execute('kama')
  end
  
  def test_find_command
    assert_equal Commands::Kama, Commands.find_command('kama')
    assert_raise(UnknownCommand){ Commands.find_command('bad_command') }
  end
end
