require_relative '../shared'

def get_chapter_text url
    content = get_html_document url
    content = content.xpath('//div[@class="entry-content_wrap"]')[0]
    content
end

def download_parts(ch_number, pt1_url, pt2_url, file)
    success = true

    puts "Downloading ch #{ch_number} pt 1 -> #{pt1_url}"
    text = get_chapter_text(pt1_url)
    file << "<h2>Chapter #{ch_number} part 1</h2>"
    file << text
    file << "<hr>"

    puts "Downloading ch #{ch_number} pt 2 -> #{pt2_url}"
    file << "<h2>Chapter #{ch_number} part 2</h2>"
    file << get_chapter_text(pt2_url)
    file << "<hr>"

rescue => ex # get_chapter_text will raise if the div@ is not found, so we know that the ch is not in the given url
    puts ex
    success = false    
ensure
    return success
end

def download_all
    file = open("the-yandere-that-came-during-the-night.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>The Yandere Came During the Night</h1> <p>translated by <a href="foxaholic.com">foxaholic</a></p>'   
    
    (1..139).each do |i|
        url_full_ch = "https://www.foxaholic.com/tycdtn-chapter-#{i}"
        url_pt1 = "#{url_full_ch}-part-1/"
        url_pt2 = "#{url_full_ch}-part-2/"
        
        if !download_parts(i, url_pt1, url_pt2, file)
            puts "\tPart 1 and 2 not found, trying download the full chapter..."
            puts "Downloading ch #{i}"
            file << "<h2>Chapter #{i}</h2>"
            file << get_chapter_text(url_full_ch)
            file << "<hr>" 
        end
    end

    file << "</body></html>"
    file.close
end

download_all
