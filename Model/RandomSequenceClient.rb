require 'net/http'
require 'uri'

class RandomSequenceClient

    def get_random_sequence(level)
        case level
        when "easy"
            url_code = "https://www.random.org/integers/?"
            #define variables
            number = "num=4"
            min = "min=1"
            max = "max=7"
            col = "col=1"
            base = "base=10" #I just love hex for some reason
            #tail (options that shouldn't change)
            tail = "&format=plain&rnd=new"
            #and sign
            s_and = "&"

            #breaks boolean
            breaks = true

            #modify variables
            0.upto(ARGV.length) { |i|
                if(ARGV[i] == "-n") then number = "num="+ARGV[i+1].to_s end
                if(ARGV[i] == "-mn") then min = "min="+ARGV[i+1].to_s end
                if(ARGV[i] == "-mx") then max = "max="+ARGV[i+1].to_s end
                if(ARGV[i] == "-c") then col = "col="+ARGV[i+1].to_s end
                if(ARGV[i] == "-b") then base = "base="+ARGV[i+1].to_s end
                if(ARGV[i] == "-c") then
                    if(ARGV[i+1].to_s == "0") then
                        col = "col=1"
                        breaks = false
                    end
                end
            }

            response = {statusCode: 0, response_body: 0}
            #create GET command
            url_code += number.to_s+s_and+min.to_s+s_and+max.to_s+s_and+col.to_s+s_and+base.to_s+tail

            request = Net::HTTP.get_response(URI.parse(url_code.to_s))
            body = request.body.split.map(&:to_i)
            response[:statusCode] = request.code
            response[:response_body] = body
            # if(breaks) then
            #     #print request.body
            #     Process.exit
            # end
           
            return response[:response_body]

            # if request.code == "200" then print "Code: 200 is good\n" end
            # if request.code != "200" 
            # then 
            # request.code
            # print "Code: "+request.code+" is not correct"
            # Process.exit
            # end
            # if(breaks) then
            #     print request.body
            #     Process.exit
            # end

            
            # body = request.body.split

            # 0.upto(body.length-1) { |i|
            #     print body[i]
            # }
        when "medium"
           puts "hello"
        when "hard"
            puts "hi"
        else
            "incorrect level format"
        end
    end
end


