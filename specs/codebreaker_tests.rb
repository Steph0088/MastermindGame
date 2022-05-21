require_relative "test_helper"

describe "Codebreaker class" do

    describe "Codebreakers name can be set" do
        codebreaker = Codebreaker.new()
        codebreaker.name = "Steph"
        it "Codebreakers name " do
          expect(codebreaker.name).must_be_instance_of String
          expect(codebreaker.name).must_equal "Steph"
        end

        it "Coderbreakers guesses can be added to current guesses" do
            current_guess = codebreaker.guess = ["red","white","blue","purple"]
            total_guesses = codebreaker.add_guess_to_history(current_guess)
            expect(total_guesses).must_be_instance_of Array
            expect(total_guesses[0].length).must_equal 4
            expect(total_guesses[0]).must_equal   current_guess
        end
    end 
end