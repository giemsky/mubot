require 'rubygems'
require 'test/unit'
require 'mocha'
require File.dirname(__FILE__) + '/../commands'

class Test::Unit::TestCase
  
end

module CommandHelper
  def test_command_name
    command_name = @command.command_name
    
    assert_kind_of String, command_name
    assert_operator command_name.size, :>, 0
  end
  
  def test_description
    description = @command.description
    
    assert_kind_of String, description
    assert_operator description.size, :>, 0
  end
  
  def test_syntax
    syntax = @command.syntax
    
    assert_kind_of String, syntax
    assert_operator syntax.size, :>, 0
  end
end