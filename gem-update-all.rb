system 'gem update --system'

gems = IO.popen ['gem', 'outdated']
gems.each do |line|
	gem = line.split(' ')[0]
	system("gem update #{gem}")
end
system 'gem cleanup'
