require_relative "test_helper"


describe "RandomSequenceClient class" do
    sequence = 0
    client = RandomSequenceClient.new()
    sequence = client.get_random_sequence("easy")
    describe "get_random_sequence" do
        
        it "returns an array of numbers" do
          expect(sequence).must_be_instance_of Array
          expect(sequence.length).must_equal 4
        end

        it "Returns an error message if no level is given" do
             "not yet implemented"
        end
    end

    describe "Handles Exceptions" do
        "not yet implemented"
    end

    describe "Gives proper input if incorrect input given to getRandom Sequence method" do
         "not yet implemented"
    end
end
    