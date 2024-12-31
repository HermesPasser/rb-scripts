# NOTE: this site uses somesort of manga reader template
#       so this code may be reusable in others sites

require './shared'
ROOT_URL = "https://fanstranslations.com"

def scrap_chapter title, chapter
	chapter = chapter.to_s.rjust(3, "0")
	url = "#{ROOT_URL}/novel/#{title}/chapter-#{chapter}"
	doc = get_html_document(url)
	content = doc.xpath('//div[@class="reading-content"] // div').first
	content.to_html
end

def scrap_title title, ch_start, ch_end
	pretty_title = title.gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
	builder = HtmlBuilder.new(pretty_title).add_header("Fans Translations", ROOT_URL)

	(ch_start..ch_end).each do |chapter|
		print "Dowloading #{chapter}/#{ch_end}...\r"
		chapter_contents = scrap_chapter(title, chapter)
		builder.add_section(chapter, chapter_contents)
	end
	builder.build
end

if __FILE__ == $0
	if ARGV.size < 3
		puts "Not enough arguments"
		puts "usage: ruby fanstranslations-get.rb <title_id> <start_chapter> <end_chapter>"
		puts "example: ruby fanstranslations-get.rb demon-noble-girl-story-of-a-careless-demon 213 252"
		exit 1
	end

	title, ch_start, ch_end = *ARGV
	scrap_title title, ch_start.to_i, ch_end.to_i
end
