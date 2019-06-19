require 'node'

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

end
