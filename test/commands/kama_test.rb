require File.dirname(__FILE__) + '/../test_helper'

class KamaTest < Test::Unit::TestCase
  include CommandHelper
  
  def setup
    @command = Commands::Kama
  end
  
  def test_execute
    @command.any_instance.stubs(:parse_website).once
    @command.new.execute
  end
end
