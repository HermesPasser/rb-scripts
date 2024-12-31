
require_relative '../shared'

def get_toc
    doc = get_html_document("https://nopa15.wordpress.com/swadr/")
    urls  = doc.xpath('// p / a').map { |element| element.attribute("href").value }
    urls = urls.select { |url| url.include?("swadr-") && url.include?("https://nopa15.wordpress.com/") }
    urls
end

def get_chapter url
    doc = get_html_document url
    title = "<h2>#{doc.xpath('// head / title').text}</h2>"
    content =  doc.xpath('//div[contains(@class, "entry-content")]').first
    
    # Removes everything after the prev/next anchors
    content.xpath('//script').each { |e| e.remove}
    node = content.xpath('//a[text()="Home" and @href="https://nopa15.wordpress.com/swadr/"]').first.parent
    while node
        # print(node)
        next_node = node.next_element
        node.remove
        node = next_node
    end
    
    title + content.to_html
end

def main
    File.open("swadr-v4c11-onwards.html", "w") do |file|
        file << "<!DOCTYPE html> <head><title>The Sword and The Dress</title></head><body>"  
        file << "<h1>The Sword and The Dress</h1> <p>translated by <a href=\"https://nopa15.wordpress.com/\">NOPA15</a></p>" 
        get_toc.each { |url| puts (url); file << get_chapter(url) }
        file << "</body></html>"
    end
end


main() if __FILE__ == $0
