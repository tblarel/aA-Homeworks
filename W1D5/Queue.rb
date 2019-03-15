class Queue
      
    def initialize
        @Queue = []
     end

    def enqueue(el)
        @Queue.unshift(el)
    end

    def dequeue
        @Queue.shift
    end

    def peek
        @Queue.first
    end

end