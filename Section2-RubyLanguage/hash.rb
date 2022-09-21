sample_hash = {"a" => 1, "b" => 2}
p sample_hash
p sample_hash[:a]

sample_hash = {:a => 1, "b" => 2}
p sample_hash
p sample_hash[:a]

another_hash = {a: "a", b: 1}
p another_hash
p another_hash[:a]
p another_hash["a"]
p another_hash.keys
p another_hash.values

another_hash.each do |key, value|
  print key
  print value
end
puts(" ")
p another_hash.select{|key, value| value.is_a?(String)}