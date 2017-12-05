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

puts "Part I: #{distance}"

# PART II

directions = ['R','U','L','D']

# initialise the grid
size = 20

grid = Array.new(size) do |row|
  Array.new(size) { 0 }
end

x = 10
y = 10

direction_count = 1

grid[x][y] = 1

found = false

loop do

  direction_count.times do

    case directions[0]
    when 'U'
      y += 1
    when 'D'
      y -= 1
    when 'R'
      x += 1
    when 'L'
      x -= 1
    end

    grid[x][y] = grid[x-1][y+1] + grid[x][y+1] + grid[x+1][y+1] +
                 grid[x-1][y] + grid[x+1][y] +
                 grid[x-1][y-1] + grid[x][y-1] + grid[x+1][y-1]

    found = true and break if grid[x][y] > input
  end

  break if found

  if directions[0] == 'U' || directions[0] == 'D'
    direction_count += 1
  end

  directions.rotate!
end

# Dump the grid to a csv
require 'csv'
CSV.open("day3.csv", "w") do |csv|
  grid.each do |row|
    csv << row
  end
end

puts "Part II: #{grid[x][y]}"
