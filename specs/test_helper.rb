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

require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/RandomSequenceClient.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codemaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/round.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/hints.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codebreaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/IOManager.rb"