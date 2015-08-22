class Item
  class << self; attr_accessor :price end

  @price = 0
end

(1..10).each { Item.price += 10 }

puts "Item.price = #{Item.price}"
