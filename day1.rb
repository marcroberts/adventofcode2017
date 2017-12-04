#!/usr/bin/env ruby
#
# ./day1.rb <INPUT>

input = ARGV[0].to_i

chars = input.scan(/./)

prev = input[-1]

count = 0

chars.each do |char|
	count += char.to_i if char == prev
	prev = char
end

print count
