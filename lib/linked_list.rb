require 'node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      pointer = @head
      until pointer.next_node.nil?
        pointer = pointer.next_node
      end
      pointer.next_node = Node.new(data)
    end
  end

  def count
    pointer = @head
    count = 1
    until pointer.next_node.nil?
      pointer = pointer.next_node
      count += 1
    end
    count
  end

  def to_string
    return_sentence = []
    pointer = @head
    return_sentence << pointer.data
    until pointer.next_node.nil?
      pointer = pointer.next_node
      return_sentence << pointer.data
    end
    return_sentence.join(" ")
  end

  def prepend(data)
    node = Node.new(data)
    node.next_node = @head
    @head = node
  end

  def insert(pos, data)
    parent = @head
    pos_count = 0
    until pos_count == pos - 1
      pos_count += 1
      parent = parent.next_node
    end
    node = Node.new(data)
    node.next_node = parent.next_node
    parent.next_node = node
  end

end
