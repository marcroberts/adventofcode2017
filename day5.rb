#!/usr/bin/env ruby

input = ARGF.read

original_instructions = input.split("\n").map(&:to_i)

instructions = original_instructions.dup

size = instructions.size
pointer = 0
count = 0

loop do
  jump = instructions[pointer]
  
  count += 1
  break if pointer+jump > size-1

  instructions[pointer] += 1

  pointer += jump
end

puts "Part I: #{count}"





instructions = original_instructions.dup

size = instructions.size
pointer = 0
count = 0

loop do
  jump = instructions[pointer]
  
  count += 1
  break if pointer+jump > size-1

  instructions[pointer] += (jump >= 3 ? -1 : 1)

  pointer += jump
end

puts "Part II: #{count}"
