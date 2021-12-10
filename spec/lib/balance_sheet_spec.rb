describe BalanceSheet do
  it "is a module" do
    expect(BalanceSheet).to be_a Module
  end

  xit "loads fixtures" do
    expect(fixture("use_case_1")).to match(/123456789\n\z/)
  end
end
