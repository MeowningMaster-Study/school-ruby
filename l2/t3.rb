# variant 10

input = "10101010101010"

def to_dec(input)
  dec = 0
  two_pow = 1
  input.reverse.each_char { |x| dec += x.to_i * two_pow; two_pow <<= 1 }
  dec
end


puts "my solution #{to_dec(input)}"
puts "built-in solution #{input.to_i(2)}"