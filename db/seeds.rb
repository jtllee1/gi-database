# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

puts "Destroying data..."

Character.destroy_all

puts "Finished!"

url = "https://genshin.honeyhunterworld.com/db/char/characters/?"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

@url_list = html_doc.search('.char_sea_cont')

@links = []

@prefix_url = "https://genshin.honeyhunterworld.com"

@url_list.each do |section|
  suffix_url = section.search('a').first
  @links << @prefix_url + suffix_url['href']
end

def name_scrape(doc)
  doc.search('.custom_title').text
end

def scrape(doc, index)
  tables = doc.search('.item_main_table tr')
  table = tables[index].search('td')
  return table[1].text
end

def rarity_scrape(doc)
  tables = doc.search('.item_main_table')
  table = tables.first
  stars = table.search('.sea_char_stars')
  return stars.length
end

def weapon_scrape(doc)
  tables = doc.search('.item_main_table a')
  return tables.first.text
end

def image_scrape(doc, class_search)
  image = doc.search(class_search)
  return image.first['src'][10..-1]
end

puts "Scraping..."

@links.each do |link|
  html_file = open(link).read
  html_doc = Nokogiri::HTML(html_file)

  puts character_name = name_scrape(html_doc)
  puts title = scrape(html_doc, 1)
  puts rarity = rarity_scrape(html_doc)
  puts weapon = weapon_scrape(html_doc)
  puts birthday = scrape(html_doc, 5)
  puts description = scrape(html_doc, 11)
  puts element = image_scrape(html_doc, ".char_portrait_card_sea_element.sea_enemy_element")
  puts character_image = image_scrape(html_doc, ".itempic")

  if element == "/element/pyro_35.png"
    element = "pyro"
  elsif element == "/element/hydro_35.png"
    element = "hydro"
  elsif element == "/element/electro_35.png"
    element = "electro"
  elsif element == "/element/anemo_35.png"
    element = "anemo"
  elsif element == "/element/cryo_35.png"
    element = "cryo"
  elsif element == "/element/geo_35.png"
    element = "geo"
  end

  character = Character.new(
    name: character_name,
    title: title,
    rarity: rarity,
    weapon: weapon,
    birthday: birthday,
    description: description,
    element: element,
    image: character_image,
    )
  character.save!
end

puts "Finished!"
