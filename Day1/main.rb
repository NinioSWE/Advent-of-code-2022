file = open("input.txt")
tempNum = 0
sumList = Array.new 
file.each_line { |line|
    tempNum += line.to_i
    if line == "\n"
        sumList << tempNum
        tempNum = 0
    end
}

sortedSumList = sumList.sort
puts "first answer: #{sortedSumList.last}"
puts "second answer: #{sortedSumList.last(3).sum}"

file.close