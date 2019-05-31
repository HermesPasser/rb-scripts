#
# VSR-RLE (Very simple Ruby Run-length encoding)
# (C) Hermes Passer
#
# CAN'T HANDLE NUMBERS ON THE ORIGINAL TEXT
#

module RLE	
	def self.is_numeric?(text)
		Integer(text) != nil rescue false
	end

	def self.get_multi_digit_int(text)
		index = 0
		num_text = ''
		char = text[index]
		while(is_numeric?(char))
			num_text += char
			index += 1
			char = text[index]
		end
		return [num_text.to_i, index] # [number, digits]
	end

	def self.get_next_occ(text, index, char)
		occurrences = 0
		while(char == text[index + 1])
			occurrences += 1
			index += 1
		end
		return occurrences == 0 ? 0 : occurrences + 1
	end
	
	def self.compress(raw_text)
		current_char = ''
		current_index = 0
		occurrences = 0
		new_text = ''
		
		while(raw_text[current_index] != nil)
			current_char = raw_text[current_index]
			occurrences = get_next_occ(raw_text, current_index, current_char)
			
			if occurrences > 0
				new_text += "#{occurrences}#{current_char}"
				current_index += occurrences - 1 # -1 'cause at end of loop has a +1
			else
				new_text += current_char
			end
			
			current_index += 1
		end
		return new_text
	end

	def self.decompress(raw_text)
		current_char = ''
		current_index = 0
		new_text = ''
		
		while(raw_text[current_index] != nil)
			current_char = raw_text[current_index]
			
			if is_numeric?(current_char)
				occ_count, indexes_to_skip = get_multi_digit_int(raw_text[current_index, raw_text.length])
				new_text += raw_text[current_index + indexes_to_skip] * occ_count
				current_index += indexes_to_skip
			else
				new_text += current_char
			end
			
			current_index += 1
		end
		return new_text
	end

	class << self
		private :is_numeric?, :get_multi_digit_int, :get_next_occ
	end
end

if ARGV.length >= 2	
	case ARGV[0]
	when '-c' then puts RLE.compress(ARGV[1])
	when '-d' then puts RLE.decompress(ARGV[1])
	else
		puts "#{ARGV[0]} is not a valid command."
	end
else
	puts "compress: -c <text>"
	puts "decompress: -d <text>"
end

if false
	require "test/unit"
	class Tests < Test::Unit::TestCase
		def compress_test
			assert_equal(RLE.compress('k' * 50), '50k')
			assert_equal(RLE.compress('tttttddaaatttttttt'), '5t2d3a8t')
		end
		
		def decompress_test
			assert_equal(RLE.decompress('50k'), 'k' * 50)
			assert_equal(RLE.decompress('5t2d3a8t'), 'tttttddaaatttttttt')
		end
		
		def test_simple
			compress_test
			decompress_test
		end
	end
end
