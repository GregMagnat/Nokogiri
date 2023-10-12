require 'rubygems'
require 'nokogiri'
require 'open-uri' 

#1) Isoler les éléments HTML qui vont bien
#2) En extraire le texte et mettre ça dans un hash
#3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.
#Mets des puts dans ton code pour que ton terminal affiche quelque chose à chaque fois qu'il a pu récupérer une donnée.

def top_10_crypto_scraper
    url = 'https://coinmarketcap.com/all/views/all/' # URL de CoinMarketCap
    response = RestClient.get(url) #Restclient.get permet d'interroger l'url 
    doc = Nokogiri::HTML(response) #Permet de l'intégrer à Nokogiri

  crypto_data = [] #mon array
  //*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[4]/p/span[1] #prix
  //*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1] #nom 
  each.do #ma boucle 

    
     crypto_name =     #nom de crypto 
     crypto_price =     #nom de ma monnaie

    crypto_data { name: crypto_data, price: crypto_price }
   end

   return crypto_data
end

#appel les prix des 10 premières crypto
top_10_crypto_data = top_10_crypto_scraper