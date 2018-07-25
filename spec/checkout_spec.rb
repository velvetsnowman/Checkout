require 'checkout'
describe Checkout do
  subject (:checkout) { described_class.new(stock) }
    let(:stock) { double(:stock)}

  let(:scanned_items) do
    {
      coke: 2,
      bread: 1
    }
  end

  it 'should scan an item from the stock' do
    checkout.scan(:coke, 2)
    checkout.scan(:bread, 1)
    expect(checkout.scanned_items).to eq scanned_items
  end

end
