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

end
