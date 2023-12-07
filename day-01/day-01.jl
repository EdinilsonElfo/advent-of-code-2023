# Advent of Code - Day 1

global numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

function replaceNumbers(input)
    output = replace(input, "zero" => "zero0zero")
    output = replace(output, "one" => "one1one")
    output = replace(output, "two" => "two2two")
    output = replace(output, "three" => "three3three")
    output = replace(output, "four" => "four4four")
    output = replace(output, "five" => "five5five")
    output = replace(output, "six" => "six6six")
    output = replace(output, "seven" => "seven7seven")
    output = replace(output, "eight" => "eight8eight")
    output = replace(output, "nine" => "nine9nine")
    return output
end

function getFirstDigit(input::String)
    for i in eachindex(input)
        for j in 1:10
            if input[i] == numbers[j]
                return input[i]
            end
        end
    end
end

function getLastDigit(input::String)
    for i in Iterators.reverse(eachindex(input))
        for j in 1:10
            if input[i] == numbers[j]
                return input[i]
            end
        end
    end
end

function getDigits(lines)
    digits = Integer[]
    for i in eachindex(lines)
        lineNumbers = replaceNumbers(lines[i])
        firstDigit = parse(Int64, getFirstDigit(lineNumbers))
        lastDigit = parse(Int64, getLastDigit(lineNumbers))
        twoDigit = 10 * firstDigit + lastDigit
        push!(digits, twoDigit)
    end
    return digits
end

file = open("day-01/input.txt", "r")
lines = readlines(file)
digits = getDigits(lines)
close(file)

sum = 0
for i in eachindex(digits)
    global sum += digits[i]
end

print(sum)