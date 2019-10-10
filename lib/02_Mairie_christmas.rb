require 'rspec'
require 'rubygems'
require 'nokogiri'
require 'open-uri'





def get_townhall_city   #methode pour recupérer le nom des villes

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    mairies = page.xpath("//a[@class = 'lientxt']/text()")
    return mairies

end



def get_townhall_urls(page)  #methode pour récupérer les adresses web des villes

  url = page.xpath("//a[@class='lientxt']")
  tableau = []

  url.each do |townhall_url|
      tableau << "http://annuaire-des-mairies.com/" + townhall_url['href']
    end

    return tableau

end




puts get_townhall_city

puts get_townhall_urls(get_townhall_city)
