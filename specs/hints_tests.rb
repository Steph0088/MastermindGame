require_relative "test_helper"


describe "Hints class" do
    describe "Given input of colors returns hints " do
        hints = Hints.new
        hints.give_hints(["red","black","white","red"])
        it "returns a hash with the keys being colors and the value as the corresponding hint" do
          expect("red").must_equal "Correct Position and Correct Color"
          expect("white").must_equal "Correct Color but incorrect Position"
          expect("black").must_equal "Incorrect Color and Position"
        end

        it "" do
             "not yet implemented"
        end
    end
end