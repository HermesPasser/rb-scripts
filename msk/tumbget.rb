# By Hermes Passer in ruby 2.4. Download all images of a page in thumb.

require 'open-uri'
require 'net/http'

def get_url url#, page
	Net::HTTP.get(URI(url))
end

def get_body_content text
	beginwith = "<div class=\"body-text\">"
	endwith = "</div>"
	text.match("\\#{beginwith}(.*?)#{endwith}").to_s
end

def get_page_links text
	# begin with 'https:' and end with '" '
	text.scan(/(?<=https:)(.*?)(?=" )/)
end

def download_image url, path
	File.open(path, 'wb') do |file|
		file.write(open("http:#{url}").read)
	end
end

def download_all urls, path
	iterator = 1
	urls.each do |url|
		download_image(url[0], "#{path}\\#{iterator}.jpg")	
		puts "downloading #{url[0]} as #{path}\\#{iterator}.jpg"
		iterator += 1
	end
end

if ARGV.length == 2
	url = ARGV[0]
	path = ARGV[1]
	
	url = url.include?("https://") ? url : "https://#{url}"
	
	text = get_url(url)
	text = get_body_content(text)
	text = get_page_links(text)
	download_all(text, path)
	puts "complete"
end




