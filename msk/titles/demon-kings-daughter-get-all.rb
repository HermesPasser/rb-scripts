require_relative './tycdtn-get-all'
require_relative '../shared'

def download_all
    file = open("the-demon-kings-daughter.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>Even If She’s the Demon King’s Daughter, She’ll Betray Him Because the Hero’s Party is Yuri Heaven!</h1> <p>translated by <a href="foxaholic.com">foxaholic</a></p>'   
    
    (1..48).each do |i|
        url = "https://www.foxaholic.com/novel/even-if-shes-the-demon-kings-daughter-shell-betray-him-because-the-heros-party-is-yuri-heaven/#{i}"
        
        puts "Downloading ch #{i} -> #{url}"
        file << "<h2>Chapter #{i}</h2>"
        file << get_chapter_text(url)
    end

    file << "</body></html>"
    file.close
end

download_all
