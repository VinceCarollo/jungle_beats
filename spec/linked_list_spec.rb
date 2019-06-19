require './lib/linked_list'

RSpec.describe 'A Linked List' do

  before :each do
    @linked_list = LinkedList.new
  end

  it 'exists' do
    expect(@linked_list).to be_instance_of(LinkedList)
  end

  it 'starts with nil head by default' do
    expect(@linked_list.head).to be nil
  end

  it 'can append a node' do
    @linked_list.append("doop")
    expect(@linked_list.head).to be_instance_of(Node)
    expect(@linked_list.head.data).to eq("doop")
    expect(@linked_list.head.next_node).to be nil
  end

  it 'can append a node twice' do
    @linked_list.append("doop")
    @linked_list.append("poop")
    expect(@linked_list.head).to be_instance_of(Node)
    expect(@linked_list.head.data).to eq("doop")
    expect(@linked_list.head.next_node.data).to eq("poop")
  end

  it 'can count length of list' do
    @linked_list.append("doop")
    expect(@linked_list.count).to eq(1)
    @linked_list.append("poop")
    expect(@linked_list.count).to eq(2)
  end

  it 'can turn list nodes into string' do
    @linked_list.append("doop")
    expect(@linked_list.to_string).to eq("doop")
    @linked_list.append("poop")
    expect(@linked_list.to_string).to eq("doop poop")
  end

  it 'can prepend nodes' do
    @linked_list.append("plop")
    @linked_list.append("suu")
    @linked_list.prepend("dop")
    expect(@linked_list.to_string).to eq('dop plop suu')
    expect(@linked_list.count).to eq(3)
  end

  it 'can insert nodes into given position' do
    @linked_list.append("plop")
    @linked_list.append("suu")
    @linked_list.prepend("dop")
    @linked_list.insert(1, 'woo')

    expected = "dop woo plop suu"
    expect(@linked_list.to_string).to eq(expected)
  end

  it 'can insert nodes into different position' do
    @linked_list.append("plop")
    @linked_list.append("suu")
    @linked_list.prepend("dop")
    @linked_list.insert(2, 'woo')

    expected = "dop plop woo suu"
    expect(@linked_list.to_string).to eq(expected)
  end

end
