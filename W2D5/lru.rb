
class LRUCache
    # attr_accessor :data

  def initialize(capacity)
    @capacity = capacity
    @data = {}
  end

  def get(key)
    val = @data.delete key
    if val
      @data[key] = val
    else
      -1
    end
  end
  def count
    p @data.length
  end

  def show
    p @data.keys
  end

  def most_recent
    p @data[@data.keys.last]
  end

  def add(key, value = 0) 
    @data.delete key
    @data[key] = value
    @data.delete @data.first.first if @data.size > @capacity 
  end
end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]


# a = LRUCache.new(4)
# a.add(1,2)
#     a.show
# a.add(3,4)
#     a.show
# a.add(4,5)
#     a.show
# a.add(5,6)
#     a.show
# a.add(6,7)
#     a.show
# a.add(7,8)
#     a.show
# a.add(11,12)
#     a.show
# a.add(13,14)
#     a.show
# a.add(14,15)
#     a.show
# a.add(15,16)
#     a.show
# a.add(17,18)
#     a.show
# a.add(14,15)
#     a.show
#     a.most_recent
# a.add(17,18)
#     a.show
#     a.most_recent