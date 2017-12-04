#!/usr/bin/env ruby
#
# ./day3.rb <INPUT>

input = ARGV[0].to_i

directions = ['R','U','L','D']

count = 1

instructions = ['-']

# build the square
loop do

  count.times do 
    instructions.push directions[0]
  end

  if directions[0] == 'U' || directions[0] == 'D'
    count += 1
  end

  directions.rotate!

  break if instructions.size > input
end

# find distance for element
counts = {
  'U' => 0,
  'D' => 0,
  'L' => 0,
  'R' => 0,
  '-' => 0
}

instructions[0..(input-1)].each { |i| counts[i] += 1 }

distance = (counts['U'] - counts['D']).abs + (counts['R'] - counts['L']).abs

print distance

