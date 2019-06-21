require './lib/jungle_beat'

RSpec.describe 'A Jungle Beat' do

  before :each do
    @jb = JungleBeat.new
  end

  it 'exists' do
    expect(@jb).to be_instance_of(JungleBeat)
  end

  it 'starts with an empty linked list attribute' do
    expect(@jb.list).to be_instance_of(LinkedList)
    expect(@jb.list.head).to be nil
  end

  it 'can append beats as linked lists' do
    expect(@jb.append('deep doo ditt')).to eq(3)
    expect(@jb.list.head.data).to eq('deep')
    expect(@jb.list.head.next_node.data).to eq('doo')

    expect(@jb.append('woo hoo shu')).to eq(3)
    expect(@jb.count).to eq(6)
  end

  it 'can play beats' do
    @jb.append('deep doo ditt woo hoo shu')
    expect(@jb.count).to eq(6)
    expect(@jb.list.count).to eq(6)
  end

  it 'cant add invalid beats' do
    @jb = JungleBeat.new('deep')

    expect(@jb.append('Mississippi')).to eq(0)
    expect(@jb.all).to eq('deep')
    expect(@jb.prepend('tee tee tee Mississippi')).to eq(3)
    expect(@jb.all).to eq('tee tee tee deep')
  end

  it 'can set speed of beats' do
    @jb = JungleBeat.new('deep dop dop deep')
    expect(@jb.play).to eq(4)
    @jb.rate = 100
    @jb.voice = 'Alice'
    expect(@jb.play).to eq(4)
    expect(@jb.reset_rate).to eq(500)
    expect(@jb.reset_voice).to eq('Alex')
    expect(@jb.play).to eq(4)
  end

end
