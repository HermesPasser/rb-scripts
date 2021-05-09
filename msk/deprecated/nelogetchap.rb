# By Hermes Passer 
# feito para essa variação do manga melo: https://manganelo.com/chapter/manga_name

require 'fileutils'
require './shared'

# merge with the other version
def get_page_links_s3_links text
	# dependendo de qual o link do melo pode ser sn sendo que n é qualquer numero
	# begin with 'https://s3' and end with 'jpg'
	urls = []
	
	matchs = text.scan(/(?<=https:\/\/s3)(.*?)(?=jpg)/) # Before was  ()
	puts "Cannot match any link in given url" && exit(1) if matchs.nil?
	matchs.each { |match| urls.push "s3#{match[0]}jpg" }
	urls
end

def get_page_links text
	# dependendo de qual o link do melo pode ser sn sendo que n é qualquer numero
	# starts with //s7, ends with .jpg
	urls = []
	
	matchs = text.scan(/(?<=s7)(.*?)(?=jpg)/)
	puts "Cannot match any link in given url" && exit(1) if matchs.nil?
	matchs.each { |match| urls.push "https://s7#{match[0]}jpg" }
	p urls[0]
	urls
end

def download_all urls, path
	iterator = 1
	urls.each do |url|
		download_image(url, File.join(path, "#{iterator}.jpg"))
		puts "downloading #{url} as #{iterator}.jpg"
		iterator += 1
	end
end

if ARGV.length == 2
	ARGV[0] = "https://#{ARGV[0]}" if not ARGV[0].start_with?("https://")
	FileUtils.mkdir_p ARGV[1] if not File.exist? ARGV[1]
	
	text = get_url(ARGV[0])
	text = get_page_links(text)
	download_all(text, ARGV[1])
	puts "complete"
end
