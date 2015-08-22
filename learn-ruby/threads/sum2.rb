def calculate_sum arr
  sleep(2)
  sum = 0
  arr.each do |item|
    sum += item
  end
  sum
end

@items1 = [12, 34, 55]
@items2 = [35, 90, 2]
@items3 = [99, 22, 31]

threads = (1..3).map do |i|
  Thread.new(i) do |i|
    items = instance_variable_get("@items#{i}")
    puts "items#{i} = #{calculate_sum(items)}"
  end
end

threads.each { |t| t.join }
