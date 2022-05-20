require_relative "test_helper"


describe "IOManager class" do
    io = IOManager.new
    describe "Interact with commmand line" do
        puts "Enter your name:"
        response = io.get_user_input
        
        it "Saves user response to response" do
          expect(response).must_be_instance_of String
        end

        it "Prints line and clears console if second argument set to true" do
            output = io.print_line(message = "Hi Everyone", clear = false)
            #Use assert_nil if expecting nil from IOManager_tests.rb:15. This will fail in Minitest 6.
            expect(output).must_equal nil 
        end

        it "Prompts player and saves output, clears input if second argument set to true" do
            user_response = io.prompt_player(message = "Enter your Name", clear = false)
            #Use assert_nil if expecting nil from IOManager_tests.rb:15. This will fail in Minitest 6.
            expect(user_response).must_be_instance_of String 
        end
    end
end