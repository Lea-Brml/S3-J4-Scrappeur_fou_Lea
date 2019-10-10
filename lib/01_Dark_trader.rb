require 'rspec'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#puts page.class
#page.class = Nokogiri::HTML::Document




crypto_names = page.xpath('//td[3]') #.each do |symbol|

	 #end


crypto_values = page.xpath('//a[@class="price"]')

		#end


tab = []
i = 0

	while i < crypto_names.size
		hash = Hash.new
		hash[crypto_names[i].text] = crypto_values[i].text
		tab << hash
		i = i + 1
	end



puts tab

#hash = crypto_names.zip(crypto_values).to_h
