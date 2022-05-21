class CodeMaker
    
    def convert_to_colors(sequence)
      #TODO move color_reference to its own class or module so other classes can use it. DRY
        color_reference = {0 => "purple", 1 => "red", 2 => "blue", 3 => "green", 4 => "orange", 5 => "white", 6 => "pink", 7 => "teal", 8 => "black", 9 => "magenta"}
        sequence.each do |num|
            if color_reference[num]
              index_of_num = sequence.index(num)
               sequence[index_of_num]  = [color_reference[num]]
            else
              next
            #     raise TypeError, "Unable to convert numbers to color!"
            end
        end
        return sequence.flatten
    end
end



 