


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
