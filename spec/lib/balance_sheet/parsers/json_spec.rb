describe BalanceSheet::Parsers::Json do
  it 'is a class' do
    expect(described_class).to be_a Class
  end

  context '.call' do
    subject { described_class.call(input_path: input_path) }
    let(:input_path) { '' }
  end
end
