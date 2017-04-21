#----------- UnpackWin ----------#
# by Hermes Passer				 #
# in 21-04-2017					 #
#--------------------------------#
# Use the WinRar for unzip files #
#--------------------------------#

module Hermes
	class UnpackWin
		@rar_path = "\"%ProgramFiles%/WinRAR/\""
		
		def self.unpack file, final_path
			unless Gem.win_platform? then return end # Return if platform is not windows
			final_path = "\"" + final_path + "\"" 
			file = "\"" + file + "\""
			puts "Calling the WinRAR..."
		
			if system "cd " + @rar_path # Check if WinRAR is installed
				command = "WinRAR\ x "
				system @rar_path + command + file + " " + final_path
			end
		end
	end
end