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
    return 0 if @head.nil?
    pointer = @head
    count = 1
    until pointer.next_node.nil?
      pointer = pointer.next_node
      count += 1
    end
    count
  end

  def to_string
    return '' if @head.nil?
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
    if !parent.nil?
      node = Node.new(data)
      node.next_node = parent.next_node
      parent.next_node = node
    end
  end

  def find(pos, length)
    pointer = @head
    if pos < count
      count = 0
      until pos == count
        pointer = pointer.next_node
        count += 1
      end
      return_sentence = []
      length.times do
        break if pointer.nil?
        return_sentence << pointer.data
        pointer = pointer.next_node
      end
      return_sentence.join(" ")
    end
  end

  def includes?(data)
    pointer = @head
    all_data = []
    all_data << pointer.data
    until pointer.next_node.nil?
      pointer = pointer.next_node
      all_data << pointer.data
    end
    all_data.include?(data)
  end

  def pop
    if count == 1
      last_node = @head
      @head = nil
      last_node.data
    elsif count == 0
      nil
    else
      pointer = @head
      (count - 2).times do
        pointer = pointer.next_node
      end
      last_node = pointer.next_node
      pointer.next_node = nil
      last_node.data
    end
  end

end
