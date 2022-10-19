def sum_to(num)
  return nil if num < 0
  return 0 if num == 0
  num + sum_to(num - 1)
end

# # Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

def add_numbers(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

#   # Test Cases
# p  add_numbers([1,2,3,4]) # => returns 10
# p  add_numbers([3]) # => returns 3
# p  add_numbers([-80,34,7]) # => returns -39
# p  add_numbers([]) # => returns nil

def gamma_fnc(num)
  return nil if num <= 0
  return 1 if num == 1
  return 1 if num == 2
  (num-1) * gamma_fnc(num - 1)
end

#   # Test Cases
# p  gamma_fnc(0)  # => returns nil
# p  gamma_fnc(1)  # => returns 1
# p  gamma_fnc(2)  # => returns 1
# p  gamma_fnc(3)  # => returns 2
# p  gamma_fnc(4)  # => returns 6
# p  gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return flavors[0] == favorite if flavors.length == 1
  (flavors[0] == favorite ) || ice_cream_shop(flavors[1..-1], favorite)
end

  # Test Cases
# p  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p  ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(s)
  return '' if s.empty?
  return s if s.length == 1
  reverse(s[1..-1]) + s[0]
end

# # Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""

def pass_hash(hash)
  return hash
end

p pass_hash({a:1, b:2})
p pass_hash(a:1, b:2)
