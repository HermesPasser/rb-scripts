require '../shared'

def scrap_chapter post_url
    doc = get_html_document(post_url)
    title = doc.xpath('//h1[contains(@class, "entry-title")]')
    paragraphs = doc.xpath('//div[contains(@class, "entry-content")]/p')
    title.to_html + "\n" + paragraphs.to_html
end

def get_chapters title
    date_regex = /(\d{4}\/\d{2}\/\d{2})/
    # since the TOC of hopeless sister if very out of date, we're looking
    # for all post using the site map (in the future is possible that
    # older post may disappear from sitemap). We match regex of date so
    # we skip the TOC url
    doc = get_html_document("https://tintanton.wordpress.com/sitemap.xml")
    urls = doc.xpath('//loc').select { |l| l.text.include?(title) && date_regex.match(l.text) }

    # we're reordering based on the url since <changefreq> not always match the order.
    url_map = {}
    urls.each do |l| 
        date = date_regex.match(l.text).match(0).gsub("/", "-")
        url_map[date] = l.text
    end
    url_map.sort.map { |list| list[1] }
end

def scrap_title title
    # Save as "utf8 with bom" since kindle likes it
    File.open("#{title}.html", "w:utf-8") do |file|
        file << "\xEF\xBB\xBF".force_encoding("UTF-8")

        file << "<!DOCTYPE html> <head><title>I, the Hopeless Sister, Love My Sister
</title></head><body>"  
        file << "<h1>#{title}</h1> <p>translated by <a href=\"https://tintanton.wordpress.com\">Tintanton</a></p>" 

        get_chapters(title).each do |url|
            chapter = /chapter-(\d+)/.match(url).match(1)
            print chapter + "\r"
            file << scrap_chapter(url)
        end
        file << "</body></html>"
    end
end

if __FILE__ == $0
    # I'm not making this script generic for titaton site
    # since not all urls in sitemap (aside from hopeless sister ones)
    # have the actual title of the work to scrap, rendering my title-based
    # filter useless
    title = "hopeless-sister"
    scrap_title title
end
