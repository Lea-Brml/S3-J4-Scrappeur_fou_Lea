require_relative '../lib/01_Dark_trader.rb'

describe 'hashage method' do
  it 'should return Success when when we succeed to extract the data' do
    expect(hashage()).to eq('success')
  end
end
