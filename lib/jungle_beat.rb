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

end
