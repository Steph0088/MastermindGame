require 'simplecov'
SimpleCov.start do
    add_filter 'test/'
end


require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative "../Model/RandomSequenceClient.rb"
require_relative "../Model/codemaker.rb"
require_relative "../Model/round.rb"
require_relative "../Model/hints.rb"
require_relative "../Model/codebreaker.rb"
require_relative "../Model/IOManager.rb"