require 'set'

def calculatePriority (char)
    index = char.ord
    if index > 91
        return index - 96
    else
        return index - 38 
    end  
end

file = open("input.txt")
sumArray = Array.new
file.each_line { |line|
    hashset = Set.new
    halfLength = line.length / 2;
    for i in 0..halfLength-1
        c = line[i]
        if !hashset.include?(c)
            hashset.add(c)
        end
    end
    for i in halfLength..line.length
        c = line[i]
        if hashset.include?(c)
            sumArray << calculatePriority(c)
            break
        end
    end
}

puts "first: #{sumArray.sum}"

file.close

file = open("input.txt")
sumArray = Array.new
groupCounter = 0
hashset = Set.new
hashset2 = Set.new
file.each_line { |line|
    line.each_char{ |c|
        if groupCounter == 0 && !hashset.include?(c) 
            hashset.add(c)  
        end
        if groupCounter == 1 && hashset.include?(c) 
            hashset2.add(c)
        end
        if groupCounter == 2 && hashset2.include?(c)
            sumArray << calculatePriority(c)
            hashset = Set.new
            hashset2 = Set.new
        end
    }
    groupCounter += 1 
    groupCounter %= 3
}

puts "second: #{sumArray.sum}"

file.close
