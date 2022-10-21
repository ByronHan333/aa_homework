class Queue
  def initialize
    # create ivar to store queue here!
    @data = []

  end

  def enqueue(el)
    # adds an element to the queue
    @data << el
    # @data.unshift(el)
  end

  def dequeue
    # removes one element from the queue
    @data.shift
    # @data.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the queue
    @data.first
    # @data.last
  end
end

s = Queue.new()
s.enqueue(1)
s.enqueue(2)
s.enqueue(3)
p s.dequeue
p s.peek
p s.dequeue
