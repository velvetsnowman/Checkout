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

  it 'doesnt allow stock items to be scanned that arent in the supermarket' do
    allow(stock).to receive(:has_item?).with(:milk).and_return(false)
    expect { checkout.scan(:milk, 3) }.to raise_error "Milk is not in the supermarket!"
  end

  before do
    allow(stock).to receive(:has_item?).with(:coke).and_return(true)
    allow(stock).to receive(:has_item?).with(:bread).and_return(true)

    allow(stock).to receive(:price).with(:coke).and_return(2.00)
    allow(stock).to receive(:price).with(:bread).and_return(3.00)

    checkout.scan(:coke, 2)
    checkout.scan(:bread, 1)
  end

  it 'should scan an item from the stock' do
    expect(checkout.scanned_items).to eq scanned_items
  end

  it 'calculates the total for all scanend items' do
    total = 7.00
    expect(checkout.total).to eq(total)
  end
end
