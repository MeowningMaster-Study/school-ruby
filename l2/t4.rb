# variant 10

input = 333

def to_bin(input)
  bin = ""
  while input != 0 do
    bin += (input & 1).to_s
    input >>= 1
  end
  bin
end

puts "my solution #{to_bin(input)}"
puts "built-in solution #{input.to_s(2)}"