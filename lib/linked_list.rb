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

  def find(pos, length)
    pointer = @head
    count = 0
    until pos == count
      pointer = pointer.next_node
      count += 1
    end
    return_sentence = []
    length.times do
      return_sentence << pointer.data
      pointer = pointer.next_node
    end
    return_sentence.join(" ")
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
    pointer = @head
    (count - 2).times do
      pointer = pointer.next_node
    end
    last_node = pointer.next_node
    pointer.next_node = nil
    last_node.data
  end

end
