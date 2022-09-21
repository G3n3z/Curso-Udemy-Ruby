a = [1,2,3,4,5,6,7,8]

p a.last

x = "a".."z"
p x
p x.to_a
p x.to_a.length
p x.to_a.shuffle

a << 9
a << 9
p a
a.unshift("first")
a.append("last")
p a
p a.uniq
p a.include?(9)
p b = a.join("-")
p b.split("-")

p %w(my name is Daniel)
p z=_