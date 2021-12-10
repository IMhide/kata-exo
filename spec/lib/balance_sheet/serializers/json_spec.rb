describe BalanceSheet::Serializers::Json do
  it 'is a class' do
    expect(described_class).to be_a Class
  end

  context '.call' do
    subject { described_class.new(dataset: dataset).call }
    let(:dataset) do
      [
        BalanceSheet::Entities::Category.new(1, 'énergie'),
        BalanceSheet::Entities::Category.new(2, 'transports'),

        BalanceSheet::Entities::Factor.new(1, 'mix électrique moyen', 1, 'kWh', nil, 0.0571, nil, nil, nil, nil),
        BalanceSheet::Entities::Factor.new(2, 'diesel routier', 2, 'tonne', 'km', 0.124, nil, nil, nil, nil),

        BalanceSheet::Entities::ActivityDatum.new(1, 1, 1, 5500, nil),
        BalanceSheet::Entities::ActivityDatum.new(2, 2, 1, 1000, 6000),

        BalanceSheet::Entities::Site.new(1, 'entrepôt - Limoges')
      ]
    end

    it 'return a collection of entities' do
      expect(subject).to eq(fixture('test_result.json'))
    end
  end
end
