require 'rspec'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)

    page = Nokogiri::HTML(open(towhall_url))

    emails = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")

    return emails

end




def get_townhall_city

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    mairies = page.xpath("//a[@class = 'lientxt']")

    return mairies

end




def get_townhall_urls

    tab_email = []
    tab_city = get_townhall_city

    i = 0

    while i < tab.city.size

      tab_email << get_townhall_email("https://https://www.annuaire-des-mairies.com/95/#{tab_city[i]}.html")
      i = i + 1
    end

      return tab_email


end


puts get_townhall_city




#hash = crypto_names.zip(crypto_values).to_h
