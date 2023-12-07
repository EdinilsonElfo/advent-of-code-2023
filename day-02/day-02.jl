# Advent of Code - Day 1

file = open("day-02/input.txt", "r")
lines = readlines(file)
close(file)

function getValues(line::String, color::String)
    values = Integer[]
    regex = Regex("($("\\d")+ $(color))")
    for i in eachmatch(regex, line)
        i_string = replace("$(i.match)", " $color" => "")
        i_int = parse(Int64, i_string)
        push!(values, i_int)
    end
    return values
end

function isPossible(line::String)
    red = getValues(line, "red")
    green = getValues(line, "green")
    blue = getValues(line, "blue")
    for i in eachindex(red)
        if red[i] > 12
            return false
        end
    end
    for i in eachindex(green)
        if green[i] > 13
            return false
        end
    end
    for i in eachindex(blue)
        if blue[i] > 14
            return false
        end
    end
    return true
end

possible = map(x -> isPossible(x), lines)

sum = 0
for i in eachindex(possible)
    if possible[i] == true
        global sum += i
    end
end