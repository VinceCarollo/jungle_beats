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
    expect(@jb.append('deep doo ditt')).to eq('deep doo ditt')
    expect(@jb.list.head.data).to eq('deep')
    expect(@jb.list.head.next_node.data).to eq('doo')

    expect(@jb.append('woo hoo shu')).to eq('woo hoo shu')
    expect(@jb.count).to eq(6)
  end

end
