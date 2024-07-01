class LinkedList
    require_relative "node"

    attr_reader :size, :head, :tail

    def initialize
        @size = 0 
        @head = nil
        @tail = nil
    end

    def append(value)
        node = Node.new(value)
        if size == 0     
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
        @size += 1
    end

    def prepend(value)
        node = Node.new(value)
        if size == 0
            @head = node
            @tail = node
        else
            node.next_node = @head
            @head = node
        end
        @size += 1
    end

    def at(index)
        position = 0
        node = @head 
        until position == index
            node = @head.next_node
            position += 1
        end
        return node
    end

    def pop
        if size > 1
            new_tail = @head
            until new_tail.next_node == @tail
                new_tail = new_tail.next_node
            end
            @tail = new_tail
            new_tail.next_node = nil
            @size -= 1
        elsif size == 1
            @head = nil
            @tail = nil
            @size -= 1
        end
    end

    def contains?(value)
        found = find(value)
        if found.nil?
            return false
        else
            return true
        end
    end

    def find(value)
        index = 0
        node = @head
        until node == nil
            if node.value == value
                return index
            end
            node = node.next_node
            index += 1
        end
        return nil
    end

    def to_s
        string = ""
        index = 0
        node = @head
        until index >= size
            string += "( #{node.value} ) -> "
            node = node.next_node
            index += 1
        end
        string += "nil\n"
        return string
    end
end