# txt2htm2mobi

def read filename
	open(filename, 'r').each_line do |line|
		yield line
	end
end

def convert filename, outputname
	file = open(outputname, 'w+')
	file.write('<html><head></head><body>')
	read(filename) do |line|
		case line
		when "\n"
			file.puts('<br>')
		else
			file.puts("<p>#{line.chomp}</p>")
		end
		file.puts ''
	end
	file.write('</body><html>')
end

if ARGV.count == 2 
	convert ARGV[0], ARGV[1]
	if File.exists? 'kindlegen.exe'
		p 'kindlegen found, converting to .mobi...'
		system('kindlegen.exe', ARGV[1])
		File.delete(ARGV[1])
	end
else 
	p 'ArgumentError'
end
