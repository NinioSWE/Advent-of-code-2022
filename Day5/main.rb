list = Array.new((File.readlines('input.txt').first.length+1)/4){Array.new}
file = open("input.txt")
isTop = true
file.each_line { |line|
    counter = 1
    i = 0;
    if line == "\n"
        next
    elsif isTop == true && line.index('[') == nil
        isTop = false
        for x in 0..list.length-1
            list[x] = list[x].reverse()
        end
        next
    elsif isTop == true
        while counter < line.length
            c = line[counter]

            if c != " "
                list[i] << c
            end
            i += 1;
            counter += 4
        end

    else 
        delimiters = ["move ", " from ", " to ", "\n"]
        values = line.split(Regexp.union(delimiters))
        
        many = values[1].to_i
        from = values[2].to_i-1
        to = values[3].to_i-1

        for m in 1..many
            list[to] << list[from].pop
        end
    end
}
result = ""
list.each{|temp| result += temp[-1]}
puts "First answer: #{result}"
file.close


list = Array.new((File.readlines('input.txt').first.length+1)/4){Array.new}
file = open("input.txt")
isTop = true
file.each_line { |line|
    counter = 1
    i = 0;
    if line == "\n"
        next
    elsif isTop == true && line.index('[') == nil
        isTop = false
        for x in 0..list.length-1
            list[x] = list[x].reverse()
        end
        next
    elsif isTop == true
        while counter < line.length
            c = line[counter]

            if c != " "
                list[i] << c
            end
            i += 1;
            counter += 4
        end

    else 
        delimiters = ["move ", " from ", " to ", "\n"]
        values = line.split(Regexp.union(delimiters))
        
        many = values[1].to_i
        from = values[2].to_i-1
        to = values[3].to_i-1

        list[to].concat(list[from].pop(many))
    end
}
result = ""
list.each{|temp| result += temp[-1]}
puts "Second answer: #{result}"
file.close
