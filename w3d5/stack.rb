class Stack
  def initialize
    # create ivar to store stack here!
    @data = []

  end

  def push(el)
    # adds an element to the stack
    # @data << el
    @data.unshift(el)
  end

  def pop
    # removes one element from the stack
    # @data.pop
    @data.shift
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    # @data.last
    @data.first
  end
end

s = Stack.new()
s.push(1)
s.push(2)
s.push(3)
p s.pop
p s.peek
p s.pop
