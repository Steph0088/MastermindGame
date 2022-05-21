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
    end
end
    