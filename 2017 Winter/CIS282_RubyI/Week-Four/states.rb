states = File.readlines('./states.txt')


# puts states
=begin
state = 0
while state < states.length
  puts states[state]
  state += 1
end

states.each do |x|
  puts x + " is a State!"
end
=end

longest = 0
longest_state = ''
states.each do |state|
  if state.length > longest
    longest = state.length
    longest_state = state
  end
end

puts [longest_state, longest] * ', '

shortest = longest
shortest_name = ''

states.each do |state|
  if state.length < shortest
    shortest = state.length
    shortest_name = state
  end
end

print [shortest_name, shortest] * ', '