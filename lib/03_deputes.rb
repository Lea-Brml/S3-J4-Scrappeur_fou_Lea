require 'rubygems'
require 'nokogiri'
require 'open-uri'

def deputes_list

	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	@deputes_name = []
	page.xpath("//ul[@class='col3']//li/a/text()")

end

puts deputes_list



#J'ai la liste des députés, mais mon ordi a planté touuuuuute la journée, c'était pas izy les autres exos, je sens que je vais encore devoir me prendre bien la tête et mon ordi fait toujours la gueule, alors ici se trouve mon abandon face à cet exo.
