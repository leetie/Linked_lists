#todo-> fix remove_at method
class LinkedList
  include Enumerable
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head 
      find_tail.next = Node.new(value)
    else 
      @head = Node.new(value)
    end
  end

  def find_tail
    node = @head
    if !node.next
      @tail = node
      return node
    else
      while node.next
        node = node.next
      end
      @tail = node
    end
  end

  def prepend(value)
    temp_head = @head
    @head = Node.new(value)
    @head.next = temp_head
  end

  def size
    if !@head
      return 0
    end
    count = 1
    current_node = @head
    while current_node.next
      count += 1
      current_node = current_node.next
    end
    count
  end

  def head
    "Head is #{@head}"
  end

  def tail
    "Tail is #{find_tail}"
  end

  def index(num)
    #starts at index 0
    node = @head
    num.times do |i|
      if node.next
        node = node.next
      else
        return "No node at that index; try again"
      end
    end
    node
  end

  def pop
    node = @head
    until node.next == @tail
      node = node.next
    end
    return_node = node.next #@tail
    @tail = node
    @tail.next = nil
    return_node
  end

  def contains?(value)
    node = @head
    until !node.next
      if node.value == value
        return true
      else
        node = node.next
      end
    end
    false
  end

  def find(value, index=0, node=@head)
    return index if node.value == value
    return nil if node.next == nil
    find(value, index+1, node.next)
  end

  def to_s
    node = @head
    string = ""
    until !node.next
      string << "( #{node.value} ) -> "
      node = node.next
    end
    string << "( #{node.value} ) ->"
    string << " nil"
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    current_node = @head
    prev_node = nil
    next_node = current_node.next
    index.times do |i|
      return puts "Index Argument too high: List is of size #{self.size}" if !current_node.next

      prev_node = current_node
      current_node = current_node.next
    end
    new_node.next = next_node
    prev_node.next = new_node
    new_node
  end

  def remove_at(index)
    current_node = @head
    next_node = current_node.next
    prev_node = nil
    (index).times do |i|
      next_node = current_node.next
      prev_node = current_node
      current_node = current_node.next
      next_node = current_node.next
    end
    prev_node.next = next_node
    current_node = nil
  end

end


  

class Node
  attr_accessor :next, :value

  def initialize(value=nil)
    @value = value
    @next = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end

list = LinkedList.new
list.append(5)
list.append(3)
list.prepend(1)
list.prepend(0)
list.prepend("eggs")
list.append(42)
##--Eggs,0,1,5,3,should_be_last

list_two = LinkedList.new


# puts list.inspect
# puts "List size is: #{list.size}"
# puts "List_two size is #{list_two.size}"
# puts list.head
# puts list.tail

# puts list.index(0)
# puts list.pop
# puts list.inspect
# puts list.contains?(0)
#puts list.find(0)
#list.insert_at("new_value", 1)
puts list
list.remove_at(0)
puts list