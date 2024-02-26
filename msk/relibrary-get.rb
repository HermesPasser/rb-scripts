require './shared'

def scrap_chapter post_url
    doc = get_html_document(post_url)
    content = doc.xpath('//div[@id="content"] // article').first
    
    # Removes some of the prev/index/next chapter links (in recent posts, there is not such class to use)
    content.xpath('//div[contains(@class, "PageLink")]').each { |element| element.remove}
    
    # Removes the comment 'button'
    content.xpath('//a[@href="#respond"]').each { |element| element.remove}
    
    # Removes the "watermark": (This chapter is provided to you by Re:Library) ...
    content.xpath('//div[contains(@class, "code-block")]').each { |element| element.remove}
    
    # Removes the share buttons
    content.xpath('//div[contains(@class, "sharedaddy")]').each { |element| element.remove}
    
    content.to_html
end

def get_index_urls title
    doc = get_html_document("https://re-library.com/translations/#{title}/")

    doc.xpath('//ul[contains(@class, "su-subpages")]').each do |ul|
        volume = ul.parent.previous_element.text
        chapters = ul.xpath('li /a').collect { |element| element.attribute("href").value}
        yield volume, chapters
    end
end

def scrap_title title
    File.open("#{title}.html", "w") do |file|
        file << "<!DOCTYPE html> <head><title>#{title}</title></head><body>"  
        file << "<h1>#{title}</h1> <p>translated by <a href=\"https://re-library.com/\">Re:Library</a></p>" 

        get_index_urls(title) do |volume, urls|
            puts volume
            file << "<h1>#{volume}</h1><hr>"
            urls.each do |url|
                puts "\t#{url}"
                file << scrap_chapter(url)
            end
        end
        file << "</body></html>"
    end
end

if __FILE__ == $0
    if ARGV.size == 0
        puts "No title given"
        puts "usage example: ruby relibrary-get.rb blade-maiden"
        exit 1
    end

    title = ARGV[0]
    scrap_title title
end
