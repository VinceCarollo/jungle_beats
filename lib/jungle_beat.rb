class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data.split.each do |data|
      @list.append(data)
    end
    data
  end

  def count
    @list.count
  end

  def play
    `say -r 180 #{@list.to_string}`
  end
end
