 require 'byebug'

class LRUCache
attr_accessor :data, :maxsize
def initialize(n)
    @data = Array.new(n)
    @maxsize = n
end

def count
    @data.count
    # returns number of elements currently in cache
end


# [ 1, 3, 5]


def add(el)
    #debugger
    index = data.index(el) if data.include?(el)
    if index
       p "item already exists at #{index}"
        data.delete_at(index)
        data.unshift(el)
        data[1...index].each_with_index do |el, idx|
            data[idx] = data[idx+1] if !data[idx+1].nil?
        end
        data.unshift(el)
       return
    end
    data.unshift(el)
    data.pop
    return self
    # adds element to cache according to LRU principle
end

def show
    p data
    # shows the items in the cache, with the LRU item first
end

private
# helper methods go here!

end

a = LRUCache.new(4)
a.add(2)
    p a.data
a.add(3)
    p a.data
a.add(4)
    p a.data
a.add(5)
    p a.data
a.add(6)
    p a.data
a.add(7)
    p a.data
a.add(11)
    p a.data
a.add(7)
    p a.data
a.add(10)
    p a.data
a.add(7)
    p a.data
a.add(6)
    p a.data
