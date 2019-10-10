require_relative '../lib/01_Dark_trader.rb'



describe "hashage method, it should return a hash with both arrays" do
  it "Wrong type" do
    expect(hashage("","")).to eq(nil)
  end
end


describe "open_url method, takes a url, return the html" do
  it "TEST empty url" do
    expect(hashage("")).to eq(nil)
  end
  it "TEST good url" do
    expect(hashage("https://www.google.com/")).to be_kind_of(Nokogiri::HTML::Document)
  end
end
