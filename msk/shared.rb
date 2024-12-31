require 'open-uri'
require 'net/http'
require 'fileutils'

# Common web img extension formats (in comics)
$IMG_WEB_EXTS = "(.png)|(.gif)|(.jpg)|(.webp)".freeze
# All web supported img extensions
$IMG_WEB_EXTS_ALL = "#{$IMG_WEB_EXTS}|(.jpeg)|(.apng)|(.jfif)|(.pjpeg)|(.pjp)|(.avif)".freeze

# get the content with nokogiri
def get_html_document url
	require 'nokogiri'
	html = URI.open(url).read
	Nokogiri::HTML(html)
end

# change name to get_html
def get_url url
	Net::HTTP.get(URI(url))
end

# maybe need to close
def download_image url, path
	File.open(path, 'wb') do |file|
		url = url.gsub('https://', '')
		# file.write(open("http://#{url}", 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2866.71 Safari/537.36').read)
		file.write(open("http://#{url}").read)
	end
end

# Matchs all occurrences of _pattern_ in the _text_ returning
# the first capture of each (the one that includes the pattern) and
# converts to string if _stringfy_ is set true
def match_all(text, pattern, stringfy = true)
	match_data = text.to_enum(:scan, pattern).map { Regexp.last_match }
	stringfy ? match_data.map { |match| match.to_s }.uniq : match_data.uniq
end

# TODO: change to use URL obj instead of raw string and some try-catchs
# add debug ops
def scrap url, pattern, folder = nil
	FileUtils.mkdir_p(folder || Time.now.nsec.to_s)
	match_all(get_url(url), pattern).each do |page|
		page_basename = File.basename(URI.parse(page).path) # https://foo.baz/bar.png => bar.png
		download_image(page, File.join(folder, page_basename))
	end
end

# Abstracts the boilerplate of making a UTF-8 DOM encoded HTML document with a table of contents 
class HtmlBuilder
	def initialize title
		@sections = []
		@book_title = title.gsub(" ", "_").downcase
		self._create_file
	end

	def _create_file
		filename = @book_title.gsub(" ", "_").downcase + ".html"
		@file = File.open(filename, "w:utf-8")
        @file << "\xEF\xBB\xBF".force_encoding("UTF-8")
		@file << "<!DOCTYPE html> <head><title>#{@book_title}</title></head><body>"  
	end

	def add_header translator_name, translator_url
		@file << "<h1>#{@book_title}</h1> <p>translated by <a href=\"#{translator_url}\">#{translator_name}</a></p>" 
		@file << "<p>TOC</p><table>"
		self
	end

	def _add_section_to_toc title
		@file << "<tr><td><a href=\"##{title}\">Chapter #{title}</a></td></tr>"
	end

	def add_section title, contents, should_print_title = true
		self._add_section_to_toc title unless title.nil?

		temp = Tempfile.new
		if title
			temp << "<div id=\"#{title}\"></div>"

			temp << "<h2>#{title}</h2>" if should_print_title
			temp << contents
			temp << "</div>"
		else
			temp << "<h2>#{title}</h2>" if should_print_title
			temp << contents
		end
		temp << "<hr>"
		
		@sections << temp
		self
	end

	def build
		@file << "</table><hr>" # Closes the TOC
		@sections.each { |section| section.seek(0); @file << section.read }
		@file << "</body></html>"
	end
end

if __FILE__ == $0
	scrap ARGV[0], ARGV[1], ARGV[2]
end