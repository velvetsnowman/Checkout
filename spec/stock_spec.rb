require 'stock'
describe Stock do
  subject (:stock) { described_class.new(items) }

  let(:items) do
    {
      coke: 2.00,
      bread: 3.00
    }
  end

  it 'has a list of stock items' do
    expect(stock.items).to eq items
  end

  it 'should show the price of an item' do
    expect(stock.price(:coke)).to eq(items[:coke])
  end
end
