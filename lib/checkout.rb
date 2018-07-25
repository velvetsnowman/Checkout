class Checkout
  attr_reader :scanned_items, :stock

  def initialize(stock = Stock)
    @scanned_items = {}
    @stock = stock.new
  end

  def scan(item, quantity)
    fail "#{item.capitalize} is not in the supermarket!" unless stock.has_item?(item)
    scanned_items[item] = quantity
  end

  def total
    item_total.inject(:+)
  end

  def item_total
    scanned_items.map do |item, quantity|
      stock.price(item) * quantity
    end
  end
end
