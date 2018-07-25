require 'checkout'
describe Checkout do
  subject (:checkout) { described_class.new(stock_class) }
  let (:stock_class) { double :stock_class, new: stock }
  let (:stock) { double :stock_instance }
  let(:scanned_items) do
    {
      coke: 2,
      bread: 1
    }
  end

  before do
    allow(stock).to receive(:price).with(:coke).and_return(2.00)
    allow(stock).to receive(:price).with(:bread).and_return(3.00)

    checkout.scan(:coke, 2)
    checkout.scan(:bread, 1)
  end

  it 'should scan an item from the stock' do
    # checkout.scan(:coke, 2)
    # checkout.scan(:bread, 1)
    expect(checkout.scanned_items).to eq scanned_items
  end

  it 'calculates the total for all scanend items' do
    # checkout.scan(:coke, 2)
    # checkout.scan(:bread, 1)
    total = 7.00
    expect(checkout.total).to eq(total)
  end
end
