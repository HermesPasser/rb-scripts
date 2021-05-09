# By Hermes Passer 
# feito para essa variação do manga melo: https://chap.manganelo.com/manga-#{ARGV[0]}"
#https://s51.mkklcdnv51.com/mangakakalot/p1/petit_wildrose/vol0_chapter_0/58.jpg
#https://s7.mkklcdnv7.com/mangakakalot/r1/read_rasetsu_no_hana_manga/vol7_chapter_27/1.jpg

require './shared'

def dputs text
	puts text if ARGV[3].include? '-v'
end

def dprint text
	print text if ARGV[3].include? '-v'
end

def get_page_links text
	# begin with 's7.' and end with 'jpg'
	# urls = []
	# TODO: will brak with another cdn eg. s4.mkklcdnv4...
	# matchs = text.scan(/(?<=s7\.)(.*?)(?=jpg)/)
	# if matchs.nil? || matchs.length == 0
		# return urls
	# end
	# matchs.each { |match| urls.push "s7.#{match[0]}jpg" }
	# urls
	
	# not working since sd+ and jpg are being ommited from the regex
	match_all text, /s\d+\.[\S]+\.jpg/
end

def download_all urls, path
	iterator = 1
	urls.each do |url|
		download_image(url, File.join(path, "#{iterator}.jpg"))
		puts "downloading #{url} as #{iterator}.jpg"
		iterator += 1
	end
end

if ARGV.length >= 3
	urls = [
		"https://mangakakalot.com/chapter/#{ARGV[0]}/chapter_$", # as in mangakakalot.com/chapter/enban_oujo_valkyrie/chapter_1 (mangakakalot)
		"https://chap.manganelo.com/manga-#{ARGV[0]}/chapter-$", # as in chap.manganelo.com/manga-co116960/chapter-1 (manganelo mobile)
		"https://manganelo.com/chapter/#{ARGV[0]}/chapter_$",    # as in manganelo.com/chapter/enban_oujo_valkyrie/chapter_1 (manganelo)
	]

	ch1, ch2 = ARGV[1].to_i, ARGV[2].to_i
	#no working anymore
	(ch1..ch2).each do |chapter|
		paths = ["chapter-#{chapter}", "chapter_#{chapter}"]
		
		# path = "chapter-#{chapter}"
		# path2 = "chapter_#{chapter}"
		
		path = paths[0]
		Dir.mkdir path if not File.exist? path
		
		print "--Downloading #{chapter}\n"
		text = ''
		
		# Since manga kakalot/nelo there is no unique chapter url structure
		# then loop around all and test if any actual chapter image is found
		urls.each do |url|
			
			chapter_url = url.gsub('$', chapter.to_s)#"#{url}/#{path}"
			dprint " from #{chapter_url}."
			text = get_url(chapter_url)
			text = get_page_links(text)
			
			break if text.length != 0
			dputs "\nNo chapter images found in #{chapter_url}, trying the next url...\n"
			
		end
		
		# url = "https://chap.manganelo.com/manga-#{ARGV[0]}"
		# url2 = "https://manganelo.com/chapter/#{ARGV[0]}"
		# puts "\t from #{url}/#{path}" if ARGV[3] == '-v'
		
		# tries from chap.manganelo.com/manga-[name]/chapter-[number]
		# text = get_url("#{url}/#{path}")
		# text = get_page_links(text)
		# tries from manganelo.com/chapter/[name]/chapter_[number]
		# if text.length == 0
			# puts "Cannot match any link in given url #{url}"
			# puts "Trying again with #{url2}"
			
			# text = get_url("#{url2}/#{path2}")
			# text = get_page_links(text)
		# end
		
		download_all(text, path)
		puts  ''
	end
	puts "complete"
else
	puts "usage: manga-id first-chapter-number last-chapter-number [-v]"
	puts "-v: verbose"
	puts "if there any extra, will not be downloaded if is not first-chapter-number or last-chapter-number"
end
