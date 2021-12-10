describe BalanceSheet::Generator do
  it 'is a class' do
    expect(described_class).to be_a Class
  end

  context '.call' do
    subject { described_class.call(input_path: output_path, output_path: output_path) }
    let(:output_path) { '' }
    let(:input_path) { '' }
  end
end
