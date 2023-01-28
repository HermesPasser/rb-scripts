require_relative '../shared'

def get_chapter_text url
    content = get_html_document url
    # there are two <main> elements, so we get by the class
    content = content.xpath("//main[contains(@class, 'roboto-serif')]")
    content
end

def download_all
    file = open("countless-swords-sorcerer.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>Countless Swords Sorcerer</h1> <p>translated by <a href="www.miraslation.net">Mira\'s Cocktail</a></p>'   
    
    # prev chs by other group
    first_release = 13
    last_release = 335
    (first_release..last_release).each do |i|
	base_url = 'https://www.miraslation.net'
	# after the redesing they altered the urls
	if i < 334
		# this redirects to https://www.miraslation.net/novels/css/chapters/<i>/0<i>/
		url = base_url + "/novels/css/" + i.to_s.rjust(4, '0')
	else
		url = base_url + "/novels/css/chapters/" + i.to_s + "/countless-swords-sorcerer-%E2%80%95%E2%80%95-chapter-" + i.to_s
	end        
        
        puts "Downloading ch #{i} -> #{url}"
        file << "<h2>Chapter #{i}</h2>"
        file << get_chapter_text(url)
    end

    file << "</body></html>"
    file.close
end

download_all
