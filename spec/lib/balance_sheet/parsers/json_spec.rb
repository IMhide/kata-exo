describe BalanceSheet::Parsers::Json do
  context '.call' do
    subject { described_class.new(input_path: input_path).call }
    let(:input_path) { 'data/test.json' }

    it 'return a collection of entities' do
      expect(subject).to eq(
        [
          BalanceSheet::Entities::Category.new(1, 'énergie'),
          BalanceSheet::Entities::Factor.new(1, 'mix électrique moyen', 1, 'kWh', nil, 0.0571, nil, nil, nil, nil),
          BalanceSheet::Entities::ActivityDatum.new(1, 1, 1, 5500, nil),
          BalanceSheet::Entities::Site.new(1, 'entrepôt - Limoges')
        ]
      )
    end
  end
end
