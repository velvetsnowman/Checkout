class Checkout

  attr_reader :scanned_items

  def initialize(stock_class = Stock.new)
    @scanned_items = {}
  end

  def scan(item, quantity)
    scanned_items[item] = quantity
  end


end
