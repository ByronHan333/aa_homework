f = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
f_length = f.map{|e| e.length}

p f_length
# O(n^2), bubble sort
# O(nlogn), merge sort
# O(n), one iteration loop


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# iterate through array to find the move
# hash to find the move
