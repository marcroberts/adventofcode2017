#!/usr/bin/env ruby
#
# ./day1.rb <INPUT>

input = ARGV[0]

chars = input.scan(/./)

prev = input[-1]

count = 0

chars.each do |char|
  count += char.to_i if char == prev
  prev = char
end

puts "Part I: #{count}"

# PART II

count = 0

length = chars.size

chars.each_with_index do |char, index|
  count += char.to_i if char == chars.rotate(length / 2)[index]
end

puts "Part II: #{count}"
