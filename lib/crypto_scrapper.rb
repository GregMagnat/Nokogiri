require 'nokogiri'
require 'rest-client'

#1) Isoler les éléments HTML qui vont bien
#2) En extraire le texte et mettre ça dans un hash
#3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.
#Mets des puts dans ton code pour que ton terminal affiche quelque chose à chaque fois qu'il a pu récupérer une donnée.

require 'nokogiri'
require 'rest-client'

def top_10_crypto_scraper 
  url = 'https://coinmarketcap.com/all/views/all/' # URL de CoinMarketCap
  response = RestClient.get(url) #appel l'url
  doc = Nokogiri::HTML(response) #lie Nokogiri à mon URL 

  crypto_data = [] #mon array

  # Utilisez des XPaths pour extraire les noms et les prix des 10 premières cryptomonnaies
  doc.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[position() <= 10]').each do |crypto_row| #Appel d'Xptah localisation de mes lignes, sélection des 10 premières avec ;[position() <=10], ma boucle, qu'on vas nommer crypto row
    crypto_name = crypto_row.at_xpath('.//td[2]/div/a[2]').text.strip #Création de ma variable, avec le crypto_row. On cible avec méthod .at_xpath(dddd), on utilise .text .strip pour supprimer les espaces et le texte.
    crypto_price_element = crypto_row.at_xpath('.//td[5]/div/a/span') #Pareil que ci-dessus
    crypto_price = crypto_price_element.text.strip.gsub(/[^\d.]/, '').to_f #cette ligne nous permet de trier, (/[^\d.]/, '') pas de chiffre, pas d'espaces. le to_f nous permet d'avoir un chiffre

    crypto_data << { name: crypto_name, price: crypto_price } #Push dans ton array grace au <<
  end

  return crypto_data #rappel de la crypto data
end

# la fonction appel le prix des 10 premières cryptomonnaies
top_10_crypto_data = top_10_crypto_scraper

# les 10 premières cryptomonnaies avec son index, son nom, son prix
top_10_crypto_data.each_with_index do |crypto, index|
  puts "Crypto ##{index + 1}: #{crypto[:name]}, Prix: #{crypto[:price]}"
end