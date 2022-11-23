


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
