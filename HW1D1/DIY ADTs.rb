require 'byebug'

class Stack
    def initialize(first_ele = nil)
      # create ivar to store stack here!
      @stack = first_ele == nil ? [] : [first_ele] 
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack.delete_at(-1)
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
end

#Stack class tests:
stack = Stack.new(1)
p stack.peek # => 1
stack.push("hayo")
p stack.peek # => "hayo"
stack.push(false)
stack.push("whatwhaaat")
p stack.pop # => "whatwhaaat"
stack.pop
p stack.peek #=> hayo

class Queue
  def initialize(first = nil)
    @queue = first == nil ? [] : [first]
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    el = @queue[0]
    @queue = @queue.length == 1 ? [] : @queue[1..-1]
    el
  end

  def peek
    @queue[0]
  end
end

queue = Queue.new("Hello")
p queue.peek # => "Hello"
queue.enqueue("Hi")
p queue.peek # => "Hello"
p queue.dequeue #=> "Hello"
p queue.peek # => "Hi"
p queue.dequeue # => "Hi"
p queue.peek # => nil


class Map
  def initialize()
    @map = []
  end

  def set(key, value)
    change_index = include_key?(key)
    change_index == nil ? @map << [key, value] : @map[change_index][1] = value
  end

  def get(key)
    @map.each do |k, v|
      return v if key == k
    end
  end
  
  def delete(key)
    @map.each.with_index do |tuple, i|
      @map.delete_at(i) if key == tuple[0]
      break
    end
  end

  def show
    return @map
  end

  def include_key?(key)
    @map.each.with_index { |pair, index| return index if pair[0] == key }
    return nil
  end
end

map = Map.new
p map.set("hay", "hello")
p map.set(1, 2)
p map.set(5, 6)
p map.set("hay", "hell nah")
p map.get(5)
p map.set(7, 8)
p map.set(9, 10)
p map.set(7, 6)
p map.show
map.delete(7)
p map.show