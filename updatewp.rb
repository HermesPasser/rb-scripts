#Hermes Passer in 19-04-20017

require 'net/http'
require 'open-uri'
require 'openssl'

module Hermes
	module Update
		class UpdateByWebPage
			attr_accessor :project_id,  :current_version
			attr_reader   :update_link_domain, :update_link_page
			
			def initialize id, version, link
				@project_id = id
				@current_version = version
				set_update_link link
			end
			
			def set_update_link link
				link = link.gsub("https://", "").gsub("http://", "")
				if link.to_s.include? "/"
					@update_link_domain = link[0, link.index("/")]
					@update_link_page = link[link.index("/"), link.length]
				else
					@update_link_domain = link
					@update_link_page = "/"
				end
			end
			
			def get_update_link
				@update_link_domain + update_link_page
			end
			
			def update directory = ""
				if !update_is_avaliable then return false end
				link_all = get_download_link
				
				#Url
				if link_all.include? "http://"
					link_all = link_all.gsub("http://", "https://")
				elsif !link_all.include? "https://"
					link_all = "https://" + link_all
				end
				
				#File name and destination
				file_name = link_all[link_all.rindex("/") + 1, link_all.length]
				unless directory == "" or nil
					if directory[directory.length - 1] == "/"
						directory = directory[0, directory.length - 1]
					end
					file_name = "#{directory}/#{file_name}"
				end

				#Download
				begin
				  open(file_name, 'wb') do |file|
						file << open(link_all, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
					end
				rescue Exception => e
					puts e
					return false
				end
				
				return true
			end
			
			def update_is_avaliable
				unless get_download_link == nil
					return current_version.to_i <= get_version.to_i
				end
				return false
			end
			
			def get_download_link
				i = get_update_info
				return i[2]
			end
			
			private def get_version
				i = get_update_info
				i[1]
			end
			
			private def get_update_info
				html = get_html.split(/\n/)
				line = ""
				
				html.each do |i|
					if i.include? "updater[" and i.include? "]"
						i = i[i.index("[") + 1, i.length]
						i = i[0, i.index("]")]
						line = i.split(/,/)
						
						if line[0] == project_id then return line end
					end
				end
				return [nil, nil, nil]
			end
			
			public def get_html
				begin
					retries ||= 0
					Net::HTTP.get(@update_link_domain, @update_link_page)
				rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError
					if (retries += 1) < 3 then retry
					else return false
					end
				end
			end
		end
	end
end