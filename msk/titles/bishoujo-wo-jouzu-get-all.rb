require_relative '../shared'

$toc1 = [
    "https://holdxandclick.wordpress.com/2015/06/24/bishoujo-wo-jouzu-ni-niku-suru-houhou-episode-1/",
    "https://holdxandclick.wordpress.com/2015/06/28/184/",
    "https://holdxandclick.wordpress.com/2015/07/08/bishoujo-wo-jouzu-ni-niku-suru-houhou-episode-3/",
    "https://holdxandclick.wordpress.com/2015/07/13/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-episode-4/",
    "https://holdxandclick.wordpress.com/2015/07/22/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-episode-5/",
    "https://holdxandclick.wordpress.com/2015/08/05/episode-six-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/08/17/episode-seven-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/09/03/episode-eight-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/09/10/episode-nine-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/09/17/episode-ten-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/09/25/episode-eleven-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/10/01/episode-twelve-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/10/08/episode-thirteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/10/18/episode-fourteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/11/01/episode-fifteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/11/06/episode-sixteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/11/11/episode-seventeen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/11/19/episode-eighteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/11/26/episode-nineteen-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/03/episode-twenty-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/10/episode-twenty-one-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/17/episode-twenty-two-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/21/episode-twenty-three-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/26/episode-twenty-four-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2015/12/30/episode-twenty-five-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/01/07/episode-twenty-six-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/01/26/episode-twenty-seven-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/02/04/episode-twenty-eight-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/02/11/episode-twenty-nine-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/02/18/episode-thirty-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/02/25/episode-thirty-one-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/03/03/episode-thirty-two-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/03/10/episode-thirty-three-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/03/19/episode-thirty-four-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/03/24/episode-thirty-five-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/03/31/episode-thirty-six-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/04/08/episode-thirty-seven-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/06/02/episode-thirty-eight-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/06/11/episode-thirty-nine-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/06/17/episode-forty-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/06/24/episode-forty-one-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/07/01/episode-forty-two-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/07/08/episode-forty-three-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/07/15/episode-forty-four-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/07/24/episode-forty-five-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/08/01/episode-forty-six-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/09/08/episode-forty-seven-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/09/18/episode-forty-eight-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/09/29/episode-forty-nine-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/10/09/episode-fifty-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/10/30/episode-fifty-one-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2016/12/17/episode-fifty-two-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2017/04/08/episode-fifty-three-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2018/01/13/episode-fifty-four-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2018/02/17/episode-fifty-five-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/",
    "https://holdxandclick.wordpress.com/2018/03/27/episode-fifty-six-bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou/"
]

$toc2 = [
    "https://jatranslates.wordpress.com/2021/02/02/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-57/", 
    "https://jatranslates.wordpress.com/2021/02/16/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-58-2/", 
    "https://jatranslates.wordpress.com/2021/02/22/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-59/", 
    "https://jatranslates.wordpress.com/2021/03/01/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-60/", 
    "https://jatranslates.wordpress.com/2021/03/08/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-61/", 
    "https://jatranslates.wordpress.com/2021/03/15/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-62/", 
    "https://jatranslates.wordpress.com/?p=300",
    "https://jatranslates.wordpress.com/?p=326",
    "https://jatranslates.wordpress.com/?p=337",
    "https://jatranslates.wordpress.com/?p=343",
    "https://jatranslates.wordpress.com/2021/04/05/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-67/", 
    "https://jatranslates.wordpress.com/2021/04/05/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-68/", 
    "https://jatranslates.wordpress.com/2021/04/12/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-69/", 
    "https://jatranslates.wordpress.com/?p=388",
    "https://jatranslates.wordpress.com/?p=391",
    "https://jatranslates.wordpress.com/2021/04/26/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-72/", 
    "https://jatranslates.wordpress.com/2021/04/26/bishoujo-wo-jouzu-ni-nikubenki-ni-suru-houhou-73/"
]

def get_chapter_text url
    content = get_html_document url
    content = content.xpath('//div[@class="entry-content"]')[0]
end

def download_all
    file = open("bishoujo-wo-jouzu-ni-niku-suru-houhou.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>Bishoujo wo Jouzu ni Nikubenki ni Suru Houhou</h1> <p>translated by <a href="holdxandclick.wordpress.com">Hold X and Click</a> and <a href="jatranslates.wordpress.com">JATanslations</a></p>'   
    i = 1

    $toc1.each do |url|
        puts "Dowloading ch. #{i}"
        file << "\n<h2>Chapter #{i}</h2>"
        file << get_chapter_text(url)
        file << "<hr>" # the 2cond group alread add one in the html
        i += 1
    end

    $toc2.each do |url|
        puts "Dowloading ch. #{i}"
        file << "\n<h2>Chapter #{i}</h2>"
        file << get_chapter_text(url)
        i += 1
    end

    file << "</body></html>"
    file.close
end

download_all