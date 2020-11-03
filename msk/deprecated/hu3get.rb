# By Hermes Passer 
# feito para essa para salvar os manhuas do hu3animesfansub.com antes do site fechar como anunciado

require_relative '../shared'
require 'fileutils'

# its like shared::scrap but its name the pages as numbers
# since chapters have disorderer names (ex: p1 => slkdjf.jpg, p2 => aaqrwdaf.jpg)
def scrap_with_numeric_names url, pattern, folder = nil
	FileUtils.mkdir_p(folder || Time.now.nsec.to_s)
	iterator = 1
	pages = match_all(get_url(url), pattern)
	pages.uniq! # removes the duplicates since the site shows each url two in its html	
	pages.each do |page|
		download_image(page, File.join(folder, "0#{iterator}.jpg"))
		iterator += 1
	end
end

def scrap_manga manga_name_snake_case, first_chapter, last_chapter, path_to_save, append_zero = false
	path = path_to_save
	page_name = manga_name_snake_case # the_manga_name
	FileUtils.mkdir_p File.join(path, manga_name_snake_case) if not File.exist? File.join(path, manga_name_snake_case)
		
	(first_chapter..last_chapter).each do |n|
		n = "0#{n}" if append_zero
		url = "https://hu3animesfansub.com/#{page_name}-capitulo-#{n}/"
		
		chapter_folder = File.join(path, manga_name_snake_case, n.to_s)
		
		FileUtils.mkdir_p chapter_folder if not File.exist? chapter_folder
		puts "Downloading #{n} #{url} in #{chapter_folder}"
		scrap_with_numeric_names(url, /i.imgur.com\/(.*?).jpg/, chapter_folder)
	end
end

# ver ser tem algum extra .5
# chapter that weren't on mangadex
scrap_manga "nuzi-xueyuan-de-nansheng", 250, 306, ARGV[0]
scrap_manga "yaoguai-faan", 18, 25, ARGV[0]
scrap_manga "chaoji-shenyi-xitong", 11, 32, ARGV[0]
scrap_manga "island-school", 43, 50, ARGV[0]
scrap_manga "long-hun-te-gong", 1, 9, ARGV[0], true
scrap_manga "human-evolution", 1, 9, ARGV[0], true
scrap_manga "human-evolution", 10, 22, ARGV[0]
scrap_manga "overlord-mask", 10, 22, ARGV[0]
