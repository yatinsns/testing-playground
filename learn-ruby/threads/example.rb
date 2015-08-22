puts Thread.main
puts ""

t1 = Thread.new {sleep 100}
Thread.list.each {|thread| p thread}

puts "Current thread = " + Thread.current.to_s
puts ""

t2 = Thread.new {sleep 100}
Thread.list.each {|thread| p thread}

puts Thread.current
puts ""

Thread.kill(t1)
Thread.pass
t3 = Thread.new do
  sleep 20
  Thread.exit
end

Thread.kill(t2)
Thread.list.each {|thread| p thread}

Thread.exit
