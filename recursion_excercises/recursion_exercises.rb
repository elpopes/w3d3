require 'pry-byebug'



def range(start, last)
    return [last] if last == start
    return [] if last < start
    
    [start] + range(start+1, last)
end
range(1,1)
range(1,5)



def sum_array(array)
    return array.shift if array.length == 1
    array.shift + sum_array(array)
end


def recursion_1(base, n)
    return 1 if n == 0

    base * recursion_1(base, n - 1)
end

recursion_1(1, 0)
recursion_1(2, 2)

def recursion_2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        recursion_1(recursion_2(b, n / 2), 2)
    else
        b * recursion_1(recursion_2(b, (n - 1) / 2), 2)
    end
end

recursion_2(10, 3)



# class Array
#     def deep_dup
#         return [self] if !self.is_a?(Array)
#         self.map do |ele|
#             ele.deep_dup
#         end
#     end   
# end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


def fibonacci_array(n)
    return [1, 1].take(n) if n <= 2

    last_fib = fibonacci_array(n - 1)

    last_fib << last_fib[-2] + last_fib[-1]
end

fibonacci_array(4)

def bsearch(arr, target)
    return nil if arr.empty?

    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid + 1..-1] 

    if arr[mid] == target
        return mid
    end

    ans = bsearch(left, target)

    if bsearch(right, target) != nil
       ans = bsearch(right, target)
       ans = mid + 1 + ans
    end

    return ans
end

([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil