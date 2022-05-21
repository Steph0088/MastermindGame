require_relative "test_helper"


describe "Codemaker class" do
    sequence = []
    client = RandomSequenceClient.new()
    sequence = client.get_random_sequence("easy")

    describe "get_random_sequence and covert to color coded sequence" do
        codemaker = CodeMaker.new()
        converted_sequence = codemaker.convert_to_colors(sequence)
        it "returns an array of strings" do
          expect(converted_sequence).must_be_instance_of Array
          expect(converted_sequence[0]).must_be_instance_of String
        end
    end
end
    