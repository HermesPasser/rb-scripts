require_relative '../shared'

def get_chapter_text url
    content = get_html_document url
    content = content.xpath('//div[@class="entry-content"]')[0]
    content.search('script').remove
    content
end

def download_all
    file = open("countless-swords-sorcerer.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>Countless Swords Sorcerer</h1> <p>translated by <a href="www.miraslation.net">Mira\'s Cocktail</a></p>'   
    
    # prev chs by other group
    first_release = 16
    last_released = 262
    (first_release..last_released).each do |i|
        url = "https://www.miraslation.net/novels/css/" + i.to_s.rjust(4, '0')
        
        puts "Downloading ch #{i} -> #{url}"
        file << "<h2>Chapter #{i}</h2>"
        file << get_chapter_text(url)
    end

    file << "</body></html>"
    file.close
end

download_all
