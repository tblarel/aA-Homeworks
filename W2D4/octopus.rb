
array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_search(array) #slow search, O(n^2) time complexity
    longest = ""
    array.each_with_index do |ele,idx|
        array.each_with_index do |ele2,idx2|
            longest = ele if ele.length > ele2.length
        end
    end
    return longest
end

def dominant_octopus(array) #faster search, finds longest in O(nlogn) time
    sorted_arr = merge_sort(array) #takes nlogn time to mergesort array
    sorted_arr.last
end

def merge_sort(array)   #sort array by increasing lengths 
    return array if array.length < 2
    mid = array.length / 2
    left = merge_sort(array.take(mid))
    right = merge_sort(array.drop(mid))
    merge(left,right)
end

def merge(left,right)   #mergesorts helper method
    merged = []
    while !left.empty? && !right.empty?
        if left.first.length <= right.first.length
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged.concat(left)
    merged.concat(right)
    merged
end

def clever_octopus(array) #finds longest in n time
    longest = array.first
    array.each do |ele|
        longest = ele if ele.length > longest.length
    end
    return longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)  #finds index of dance direction in linear time
    tiles_array.each_with_index do |ele,idx|
        return idx if ele == direction
    end
end

tiles_hash = { "up" => 0, "right-up" => 1, "right" =>2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
def fast_dance(direction, tiles_hash) #finds index of dance direction in constant time
    return tiles_hash[direction]   #by making use of a hash
end

