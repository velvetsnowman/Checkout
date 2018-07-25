class Stock
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def price(item)
    items[item]
  end
end
