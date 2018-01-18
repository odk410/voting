list = []
puts list.class

list2 = Array.new
puts list2.class

hash = {}
puts hash.class

hash2 = Hash.new(0)
hash2["1key"] += 1
hash2["2key"] += 1
hash2["3key"] += 1
puts hash2.class
puts hash2
