out = open(ARGV[1], "w+")
open(ARGV[0], "r+").each do | line |
	unless line =~ /[\p{Han}\p{Hiragana}\p{Katakana}]/
		out.write line
	end
end

out.close