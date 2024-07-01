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
end