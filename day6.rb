#!/usr/bin/env ruby

input = ARGF.read

banks = input.split(/\s+/).map(&:to_i)

banks_count = banks.size

states = {}
count = 0

loop do
  hash = banks.join ':'

  # puts hash

  # check if we've had this state before
  if states[hash]
    puts "Part I: #{count}"

    puts "Part II: #{count - states[hash]}"
    break
  else
    states[hash] = count
  end

  # rebalance
  max_value = banks.max
  banks.each_with_index do |bank, bank_index|
    next unless bank == max_value

    banks[bank_index] = 0

    pointer = bank_index + 1

    max_value.times do
      banks[pointer % banks_count] += 1
      pointer += 1
    end

    break
  end

  count += 1
end
