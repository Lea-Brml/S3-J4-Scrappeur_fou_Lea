def hashage

require 'rspec'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#puts page.class
#page.class = Nokogiri::HTML::Document




crypto_names = page.xpath('//td[3]') #.each do |symbol|

	 if crypto_names.any?
		 puts "success"
	 else
		 puts "error"
	 end

	 #end


crypto_values = page.xpath('//a[@class="price"]')

		#end


tab = []
i = 0

	while i < crypto_names.size
		hash = Hash.new
		hash[crypto_names[i].text] = crypto_values[i].text.delete('$').to_f
		tab << hash
		i = i + 1
	end

		return tab

end

puts hashage



#hash = crypto_names.zip(crypto_values).to_h   fair eun hash avec la methode .zip
