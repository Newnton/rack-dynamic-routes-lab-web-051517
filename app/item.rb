class Item
  attr_accessor :name, :price
  @@all = {}
  def initialize(name,price)
    @name = name
    @price = price
    @@all[name] = price
  end

  def self.find(search_term)
    @@all[search_term]
  end
end
