describe BalanceSheet::Generator do
  context '.call' do
    subject { described_class.call(input_path: input_path, rederer: rederer) }
    let(:input_path) { 'data/test.json' }
    let(:output_path) { 'data/test_output.json' }
    let(:rederer) { BalanceSheet::Renderers::File.new(path: output_path) }

    it 'generate a correct json' do
      subject

      expect(File.read(output_path)).to eq(fixture('test_result_bis.json').delete("\n"))
    end
  end
end
