#!/usr/bin/env ruby
#
# pipe input in to this

input = ARGF.read

rows = input.split "\n"

checksum = 0

rows.each do |row|

  cells = row.split(/\s+/).map(&:to_i)

  checksum += cells.max - cells.min

end

print "Part 1: #{checksum}"



####### PART II

def find_divisor(numbers)

  count = numbers.size

  (0..(count-1)).each do |a|

    ((a+1)..(count-1)).each do |b|

      big = numbers[a]
      small = numbers[b]

      if small > big
        big = numbers[b]
        small = numbers[a]
      end

      if big % small == 0
        return big / small
      end

    end

  end

  return 0

end

checksum = 0

rows.each do |row|
  cells = row.split(/\s+/).map(&:to_i)

  checksum += find_divisor(cells)
end

print "Part 2: #{checksum}"
