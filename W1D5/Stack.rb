class Stack
    
    def initialize
        @stack = []
      # create ivar to store stack here!
    end

    def push(el)
        @stack.push(el)
      # adds an element to the stack
    end

    def pop
        @stack.pop()
      # removes one element from the stack
    end

    def peek
        @stack.last()
      # returns, but doesn't remove, the top element in the stack
    end
    
end
