#!/usr/bin/env ruby
#
# pipe passphrases in to this

input = ARGF.read

valid = 0

input.each_line do |line|
  words = line.split(/\s+/)

  valid += 1 if words.size == words.uniq.size
end

puts "Part I: #{valid}"

# PART II
valid = 0

input.each_line do |line|
  words = line.split(/\s+/)

  valid += 1 if words.size == words.map { |w| w.chars.sort.join }.uniq.size
end

puts "Part II: #{valid}"
