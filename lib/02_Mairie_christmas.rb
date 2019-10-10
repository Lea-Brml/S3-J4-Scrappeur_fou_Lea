require 'rubygems'
require 'nokogiri'
require 'open-uri'




def get_townhall_city


		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		tab_city = page.xpath("//a[@class = 'lientxt']")


		    return tab_city       #retourne  les <a href=... > et noms des villes du 95 rpz  </a> de l'annuaire

end



def get_townhall_mail(href)


		page = Nokogiri::HTML(open("#{href}"))       #ouvrira grâce à la méthode d'après le lien de l'annuaire avec la fin des lien /95/.... qui correspond à chaque mairie, et la position des mails sur la page de destination
		mail = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()")

		    return mail

end



def get_townhall_urls

		tab_city = get_townhall_city  #méthode qui récupère les noms des villes et les href des liens vers les pages des mairies
    tab_mail = []

		i = 0

    		while i < tab_city.size
    		a = tab_city[i]
    		tab_mail << get_townhall_mail("http://annuaire-des-mairies.com/#{a['href']}")     #recupère la fin de l'url grâce au a=tab_city (=> href 95/....html dans les balises <a> // on cible la fin de l'url grâce au a qui correspond à la balise <a>) où se trouvent les mails des mairies, pour  mettre dansle nouveau tableau les adresses mails une par une en fonction des villes (grâce à la m&thode précédente qui permet d'ouvrir l'url et de recuperer le xpath qui cible le mail)
    		i = i + 1
    		end

	      return tab_mail        #retourne les adresses mails récupérées à chaque tour de boucle dans le tableau tab_mail grâce au get_townhall_mail qui remmene à la position de l'adresse mail via le xpath

end


def hash

    tab_city = get_townhall_city       #tableau avec les liens et noms des villes du 95
    tab_mail = get_townhall_urls       #tableau avec les mails des mairies

    tab = []
    i = 0

      while i < tab_city.size

  		hash = Hash.new
  		hash[tab_city[i].text] = tab_mail[i].text   #tab_city.text pour récupérer le nom des villes SANS le a href, uniquement le texte qui se trouve entre les balises <a></a>, idem pour tab_mail.text
  		tab << hash
  		i = i + 1

      end

		    return tab #youpi.

end

#puts get_townhall_city              #affiche le href où se trouve la fin de l'url où se trouvent les mails de chacune des mairies

#puts get_townhall_urls  #retourne les mails,

puts hash
