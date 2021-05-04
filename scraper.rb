require 'open-uri'
require 'nokogiri'

puts "Running scraper"

url = "https://genshin.honeyhunterworld.com/db/char/characters/?"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

@url_list = html_doc.search('.char_sea_cont')

@links = []

prefix_url = "https://genshin.honeyhunterworld.com"

@url_list.each do |section|
  suffix_url = section.search('a').first
  @links << prefix_url + suffix_url['href']
end

def name_scrape(doc)
  doc.search('.custom_title').text
end

def title_scrape(doc)
  tables = doc.search('.item_main_table tr')
  table = tables[1].search('td')
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

@links.each do |link|
  html_file = open(link).read
  html_doc = Nokogiri::HTML(html_file)
  puts name_scrape(html_doc)
  puts title_scrape(html_doc)
  puts rarity_scrape(html_doc)
  puts weapon_scrape(html_doc)
end
