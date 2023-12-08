# Advent of Code - Day 1

function get_values(line::String, color::String)
    values = Integer[]
    regex = Regex("($("\\d")+ $(color))")
    for i in eachmatch(regex, line)
        i_string = replace("$(i.match)", " $color" => "")
        i_int = parse(Int64, i_string)
        push!(values, i_int)
    end
    return values
end

function is_possible(line::String)
    red = get_values(line, "red")
    green = get_values(line, "green")
    blue = get_values(line, "blue")
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

function min_cubes(line::String, color::String)
    cubes = get_values(line, color)
    min_value = 0
    for i in eachindex(cubes)
        if min_value < cubes[i]
            min_value = cubes[i]
        end
    end
    return min_value
end

function get_power(line)
    min_red = min_cubes(line, "red")
    min_green = min_cubes(line, "green")
    min_blue = min_cubes(line, "blue")
    power = min_red * min_green * min_blue
    return power
end

file = open("day-02/input.txt", "r")
lines = readlines(file)
close(file)

possible = map(is_possible, lines)
powers = map(get_power, lines)

sum_possible = 0
for i in eachindex(possible)
    if possible[i] == true
        global sum_possible += i
    end
end

sum_power = 0
for i in eachindex(powers)
    global sum_power += powers[i]
end