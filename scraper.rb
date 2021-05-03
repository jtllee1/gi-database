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
  character_name = doc.search('.custom_title').text
end

@links.each do |link|
  html_file = open(link).read
  html_doc = Nokogiri::HTML(html_file)
  name_scrape(html_doc)
end
