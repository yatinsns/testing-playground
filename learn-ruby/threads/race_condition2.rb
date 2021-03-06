class Item
  class << self; attr_accessor :price end

  @price = 0
end

mutex = Mutex.new

threads = (1..10).map do |i|
  Thread.new(i) do |i|
    mutex.synchronize do
      item_price = Item.price
      sleep(rand(0..2))
      item_price += 10
      sleep(rand(0..2))
      Item.price = item_price
    end
  end
end

threads.each { |t| t.join }


puts "Item.price = #{Item.price}"
