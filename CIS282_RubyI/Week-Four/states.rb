states =
    [
        'Alabama',
        'Alaska',
        'Arizona',
        'Arkansas',
        'California',
        'Colorado',
        'Connecticut',
        'Delaware',
        'Florida',
        'Georgia',
        'Hawaii',
        'Idaho',
        'Illinois',
        'Indiana',
        'Iowa',
        'Kansas',
        'Kentucky',
        'Louisiana',
        'Maine',
        'Maryland',
        'Massachusetts',
        'Michigan',
        'Minnesota',
        'Mississippi',
        'Missouri',
        'Montana',
        'Nebraska',
        'Nevada',
        'New Hampshire',
        'New Jersey',
        'New Mexico',
        'New York',
        'North Carolina',
        'North Dakota',
        'Ohio',
        'Oklahoma',
        'Oregon',
        'Pennsylvania',
        'Rhode Island',
        'South Carolina',
        'South Dakota',
        'Tennessee',
        'Texas',
        'Utah',
        'Vermont',
        'Virginia',
        'Washington',
        'West Virginia',
        'Wisconsin',
        'Wyoming',
        'Dennis'
    ]

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