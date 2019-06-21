require './lib/linked_list'

class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(data=nil)
    @list = LinkedList.new
    @validation = 'tee dee deep bop boop la na doo ditt woo hoo shu dop'
    @rate = 500
    @voice = 'Alex'
    self.append(data) if !data.nil?
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Alex"
  end

  def append(data)
    add_count = 0
    data.split.each do |data|
      if @validation.split.include?(data)
        @list.append(data)
        add_count += 1
      end
    end
    add_count
  end

  def prepend(data)
    add_count = 0
    data.split.each do |data|
      if @validation.split.include?(data)
        @list.prepend(data)
        add_count += 1
      end
    end
    add_count
  end

  def count
    @list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    @list.count
  end

  def all
    @list.to_string
  end
end
