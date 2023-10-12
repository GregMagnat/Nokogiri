#1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide) 
#2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).

require 'rspec'
require_relative '../lib/crypto_scrapper.rb' 

describe 'top_10_crypto_scraper' do
  it 'returns an array with data for the top 10 cryptocurrencies' do
    crypto_data = top_10_crypto_scraper

    #1
    expect(crypto_data).to be_an(Array)

    #2
    expect(crypto_data.length).to be >= 10

    #3
    crypto_data.each do |crypto|
      expect(crypto).to be_a(Hash)
      expect(crypto).to have_key(:name)
      expect(crypto).to have_key(:price)
    end
  end
end