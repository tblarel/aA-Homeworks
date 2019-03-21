


#!/usr/bin/env ruby
require 'io/console'
require 'benchmark'

class SortingDemo
    
    array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
   
    def self.sluggish_search(array) #slow search, O(n^2) time complexity
        longest = ""
        array.each_with_index do |ele,idx|
            array.each_with_index do |ele2,idx2|
                longest = ele if ele.length > ele2.length
            end
        end
        return longest
    end

    def self.dominant_octopus(array) #faster search, finds longest in O(nlogn) time
        sorted_arr = merge_sort(array) #takes nlogn time to mergesort array
        sorted_arr.last
    end

    def self.merge_sort(array)   #sort array by increasing lengths 
        return array if array.length < 2
        mid = array.length / 2
        left = merge_sort(array.take(mid))
        right = merge_sort(array.drop(mid))
        merge(left,right)
    end

    def self.merge(left,right)   #mergesorts helper method
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

    def self.clever_octopus(array) #finds longest in n time
        longest = array.first
        array.each do |ele|
            longest = ele if ele.length > longest.length
        end
        return longest
    end

    def self.performance_test(size, count)
        arrays_to_test = Array.new(count) { random_arr(size) }

        Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                "Avg. Sluggish:  ", "Avg. Dominant: " , "Avg. Clever: ") do |b|
        sluggish = b.report("Tot. Sluggish Search:  ") { run_sluggigh_search(arrays_to_test) }
        dominant = b.report("Tot. Dominant Search: ") { run_dominant_octopus(arrays_to_test) }
        clever = b.report("Tot. Clever Search: ") { run_clever_octopus(arrays_to_test) }
        [sluggish/count, dominant/count, clever/count]
        end
    end

    def self.random_arr(n)
        Array.new(n) { rand_name(rand(n)) }
    end

    def self.rand_name(len)
        name = ''

        len.times do
            name << ('a'..'z').to_a.sample
        end
        name
    end

    def self.run_sluggigh_search(arrays)
        arrays.each do |array|
        array_to_test = array.dup
        sluggish_search(array_to_test)
        end
    end

    def self.run_dominant_octopus(arrays)
        arrays.each do |array|
        array_to_test = array.dup
        dominant_octopus(array_to_test)
        end
    end

    def self.run_clever_octopus(arrays)
        arrays.each do |array|
        array_to_test = array.dup
        clever_octopus(array_to_test)
        end
    end

    def self.run_performance_tests(multiplier = 5, rounds = 3)
        [1, 10, 100, 1000, 10000].each do |size|
        size *= multiplier
        wait_for_keypress(
            "Press any key to benchmark sorts for #{size} elements"
        )
        performance_test(size, rounds)
        end
    end

    def self.wait_for_keypress(prompt)
        puts prompt
        STDIN.getch
    end
end

SortingDemo.run_performance_tests()



# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# def slow_dance(direction, tiles_array)  #finds index of dance direction in linear time
#     tiles_array.each_with_index do |ele,idx|
#         return idx if ele == direction
#     end
# end

# tiles_hash = { "up" => 0, "right-up" => 1, "right" =>2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
# def fast_dance(direction, tiles_hash) #finds index of dance direction in constant time
#     return tiles_hash[direction]   #by making use of a hash
# end

