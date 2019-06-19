require './lib/linked_list'
require 'pry'

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
    expect(@linked_list.count).to eq(0)

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

  it 'cant insert nodes into position that doesnt exists' do
    @linked_list.append("plop")
    @linked_list.insert(2, 'woo')

    expected = "plop"
    expect(@linked_list.to_string).to eq(expected)
    expect(@linked_list.count).to eq(1)
  end

  it 'can find nodes by position' do
    @linked_list.append('deep')
    @linked_list.append('woo')
    @linked_list.append('shi')
    @linked_list.append('shu')
    @linked_list.append('blop')

    expect(@linked_list.find(2, 1)).to eq('shi')
    expect(@linked_list.find(1, 3)).to eq('woo shi shu')
  end

  it 'cant find nodes with invalid position' do
    @linked_list.append('deep')

    expect(@linked_list.find(2, 1)).to be nil
  end

  it 'gives whole list if extra length is given' do
    @linked_list.append('deep')
    @linked_list.append('woo')

    expect(@linked_list.find(0, 10)).to eq('deep woo')
  end

  it 'can identify if node data exists' do
    @linked_list.append('deep')
    @linked_list.append('woo')
    @linked_list.append('shi')
    @linked_list.append('shu')
    @linked_list.append('blop')

    expect(@linked_list.includes?("deep")).to be true
    expect(@linked_list.includes?("dep")).to be false
  end

  it 'can pop out last node in list' do
    @linked_list.append('deep')
    @linked_list.append('woo')
    @linked_list.append('shi')
    @linked_list.append('shu')
    @linked_list.append('blop')

    expect(@linked_list.pop).to eq('blop')
    expect(@linked_list.pop).to eq('shu')
    expect(@linked_list.to_string).to eq('deep woo shi')
  end

  it 'doesnt error when popping out nodes more than list length' do
    @linked_list.append('deep')
    @linked_list.append('woo')

    expect(@linked_list.pop).to eq('woo')
    expect(@linked_list.pop).to eq('deep')
    expect(@linked_list.pop).to be nil
    expect(@linked_list.to_string).to eq('')
    expect(@linked_list.count).to eq(0)
  end

end
