describe BalanceSheet::Generator do
  it 'is a class' do
    expect(described_class).to be_a Class
  end

  context '.call' do
    subject { described_class.call(input_path: output_path, output_path: output_path) }
    let(:output_path) { 'data/test_output.json' }
    let(:input_path) { 'data/test.json' }

    it 'generate a correct json' do
      subject

      expect(File.read(output_path)).to eq(fixture('test'))
    end
  end
end
