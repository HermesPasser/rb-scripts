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
    urls = doc.xpath('//loc').select { |l| l.text.include?(title) && date_regex.match(l.text) }.map { |l| l.text}
    
    # text-based reordering since <changefreq> not always match the order
    # https://tintanton.wordpress.com/2022/04/08/hs-chapter-85-the-hopeless-sister-is-confessed-to/
    urls.sort!
    # manually adding chapter 154 since the url pattern is different
    urls.insert(153, "https://tintanton.wordpress.com/2023/04/27/__trashed/")
    urls
end

def scrap_title prefix, display_title
    # Save as "utf8 with bom" since kindle likes it
    File.open("#{display_title}.html", "w:utf-8") do |file|
        file << "\xEF\xBB\xBF".force_encoding("UTF-8")

        file << "<!DOCTYPE html> <head><title>#{display_title}</title></head><body>"  
        file << "<h1>#{display_title}</h1> <p>translated by <a href=\"https://tintanton.wordpress.com\">Tintanton</a></p>" 
    
        chs = get_chapters(prefix)
        chapters_got = []
        first = true
        chs.each do |url|
            match = /chapter-(\d+)/.match(url)
            if match.nil?
                chapter = chapters_got[-1] + 1
            else
                chapter = match.match(1).to_i
            end
            chapters_got.push(chapter)

            print "#{chapter}\r"
            file << scrap_chapter(url)
        end

        # Look for missing chapters since the sitemap does not
        # follow the hs-<number>-<chapter-title> pattern in all
        # urls 
        raise "No chapter scrapped" if chapters_got.size == 0
        chapter_range = (1..chapters_got[-1]).to_a
        missing_chapters = chapter_range.difference chapters_got
        missing_chapters.each do |ch|
            puts "Chapter #{ch} was not found"    
        end

        file << "</body></html>"
    end
end

if __FILE__ == $0
    # I'm not making this script generic for titaton site
    # since not all urls in sitemap (aside from hopeless sister ones)
    # have the actual title of the work to scrap, rendering my title-based
    # filter useless
    scrap_title "hs", "I, the Hopeless Sister, Love My Sister"
end
