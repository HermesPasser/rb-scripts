require_relative '../shared'

def get_chapters_urls
    toc = "https://tigertranslations.org/jack-of-all-trades-7/"
    doc = get_html_document(toc)
    urls = []
    doc.xpath('//a').each do |a|
        urls.push(a['href']) if a.inner_html.include?('Chapter') 
    end

    # Fix the toc with hardcoded links that are missing or duplicated

    # since there is two ch that has two entries and 
    urls.uniq!
    # the ch 141 is linking to 142 url
    urls.insert 140, "https://tigertranslations.org/jack-of-all-trades-141/" 
    # add the ch 344 that was skipped in the toc
    urls.insert 343, "https://tigertranslations.org/2021/04/06/jack-of-all-trades-344/"
    # add the ch 352 that being linked to twice (by <a> 352 and 353 in the toc)
    urls.insert 351, "https://tigertranslations.org/2021/05/05/jack-of-all-trades-352/"
    urls
end

def extract_text document
    # remove all non-novel/textual elements (in the most inefficient way)
    document.search('//a').remove
    document.search('div').remove
    document.to_s
end

def get_chapter_text url
    doc = get_html_document(url)
    
    # from ch 1 to 328, all chs were divided in two pages, with the first linking to the second
    page_2_node = doc.xpath('//a[contains(text(), "PAGE 2")]')
    if !page_2_node.empty?
        page_2_url = page_2_node.first['href']
        doc2 = get_html_document(page_2_url)
        text2 = doc2.xpath('//div[@class="the-content"]')[0]
    end

    text = doc.xpath('//div[@class="the-content"]')[0]
    
    extract_text(text) + if page_2_node.empty? then '' else extract_text(text2) end
end

def download_all
    file = open("jack-of-all-trades.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>jack of all trades</h1> <p>translated by <a href="https://tigertranslations.org">tiger translations</a></p>'   
    
    i = 1
    chapters = get_chapters_urls
    chapters.each do |chapter_url|
        puts "Dowloading #{i} #{chapter_url}"
        file << "<hr><h2>Chapter #{i}</h2>"
        file << get_chapter_text(chapter_url)
        i +=1
    end

    file << "</body></html>"
    file.close
end

download_all
