require './lib/node'

RSpec.describe 'A node' do

  before :each do
    @node = Node.new('plop')
  end

  it 'exists' do
    expect(@node).to be_instance_of(Node)
  end

  it 'has attributes' do
    expect(@node.data).to eq('plop')
  end

  it 'starts with no next node by default' do
    expect(@node.next_node).to be nil
  end

end
