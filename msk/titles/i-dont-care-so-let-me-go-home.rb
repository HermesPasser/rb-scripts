# script to retrieve the urls:
# document.location = 'https://wwaraitai.co/i-dont-care-so-let-me-go-home/'

# const rs = document.evaluate("//li/a[@href]", document, null, XPathResult.ANY_TYPE, null)
# while(node = rs.iterateNext()) {
#   const name = node.innerText; 
#   const url = node["href"]
#   if (!url.includes('i-dont-care-so'))
#       continue
#   console.log(`["${name}", "${url}"]`)
# }

require_relative '../shared'

$toc = [
    ["I Don't Care, So Do It Yourself!", nil],
    ["Chapter One", "https://wwaraitai.co/2020/10/30/i-dont-care-so-let-me-go-home-chapter-one/"],
    ["Chapter Two", "https://wwaraitai.co/2020/11/01/i-dont-care-so-let-me-go-home-chapter-two/"],
    ["Chapter Three", "https://wwaraitai.co/2020/11/02/i-dont-care-so-let-me-go-home-chapter-three/"],
    ["Idle Talk: It Doesn’t Matter, but the Girl Screams", "https://wwaraitai.co/2020/11/03/i-dont-care-so-let-me-go-home-chapter-four/"],
    ["Background Setting: Maria, Irene, and Rururia", "https://wwaraitai.co/2020/11/06/i-dont-care-so-let-me-go-home-x-background-setting-1/"],

    ["I Don't Care, So Just Dismiss Me!", nil],
    ["Chapter One", "https://wwaraitai.co/2020/11/07/i-dont-care-so-let-me-go-home-chapter-five/"],
    ["Chapter Two", "https://wwaraitai.co/2020/11/09/i-dont-care-so-let-me-go-home-chapter-six/"],
    ["Idle Talk: It Doesn’t Matter, but the Young Man Has Stomach Troubles", "https://wwaraitai.co/2020/11/11/i-dont-care-so-let-me-go-home-chapter-seven/"],
    ["Background Setting: The King, Queen, Royal Prince, Knight Commander, and Rururia", "https://wwaraitai.co/2020/11/11/i-dont-care-so-let-me-go-home-x-background-setting-2/"],

    ["I Don't Care, So Don't Look!", nil],
    ["Chapter One", "https://wwaraitai.co/2020/11/14/i-dont-care-so-let-me-go-home-chapter-eight/"],
    ["Chapter Two", "https://wwaraitai.co/2020/11/16/i-dont-care-so-let-me-go-home-chapter-nine/"],
    ["Chapter Three", "https://wwaraitai.co/2020/11/19/i-dont-care-so-let-me-go-home-chapter-ten/"],
    ["Idle Talk: It Doesn’t Matter, but the Young Lady Laughs Happily", "https://wwaraitai.co/2020/11/19/i-dont-care-so-let-me-go-home-chapter-eleven/"],
    ["Background Setting: Irene, the Royal Prince, Knight Commander, Sara, and Rururia", "https://wwaraitai.co/i-dont-care-so-let-me-go-home-x-background-setting-3/"],

    ["I Don't Care, So Please Let Me Enjoy the Festival!", nil],
    ["Chapter One", "https://wwaraitai.co/i-dont-care-so-let-me-go-home-chapter-twelve/"],
    ["Chapter Two", "https://wwaraitai.co/i-dont-care-so-let-me-go-home-chapter-thirteen/"],
    ["Chapter Three", "https://wwaraitai.co/i-dont-care-so-let-me-go-home-chapter-fourteen/"],
    ["Chapter Four", "https://wwaraitai.co/2020/12/23/i-dont-care-so-let-me-go-home-chapter-fifteen/"],
    ["Chapter Five", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-fifteen-2/"],
    ["Idle Talk: It Doesn’t Matter, but the Knight Wants a Wife", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-seventeen/"],
    ["Background Setting: Knight Commander, Civil Clerk, Solan, Knight, Rururia, Captain of the Dragon Taunters, and Chief Magician", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-x-background-setting-4/"],

    ["I Don't Care, God Save Me!", nil],
    ["Chapter One", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-eighteen/"],
    ["Chapter Two", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-nineteen/"],
    ["Chapter Three", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-twenty/"],
    ["Idle Talk: It Doesn’t Matter, but the Boy Smiles", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-chapter-twenty-one/"],
    ["Background Setting: Solan, The Priestess, and Rururia", "https://wwaraitai.co/2021/01/02/i-dont-care-so-let-me-go-home-x-background-setting-5/"],

    ["I Don't Care, Just Leave Me Alone!", nil],
    ["Chapter One", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-one-2/"],
    ["Chapter Two", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-three/"],
    ["Chapter Three", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-four/"],
    ["Chapter Four", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-five/"],
    ["Chapter Five", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-six/"],
    ["Idle Talk: It Doesn’t Matter, but the Shadow Smiles", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-seven/"],
    ["Background Setting: The Chief Magician, High Priest, Rururia, and Sara", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-x-background-setting-6/"],

    ["I Don't Care, So Don't Get Me Involved!", nil],
    ["Chapter One", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-eight/"],
    ["Chapter Two", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-twenty-nine/"],
    ["Chapter Three", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty/"],
    ["Chapter Four", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-one/"],
    ["Chapter Five", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-two/"],
    ["Chapter Six", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-three/"],
    ["Chapter Seven", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-four/"],
    ["Idle Talk: It Doesn’t Matter, The Twins Realize", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-five/"],
    ["…Epilogue?", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-chapter-thirty-six/"],
    ["Background Setting: Flora, Rururia, and Fake Gatekeeper", "https://wwaraitai.co/2021/01/08/i-dont-care-so-let-me-go-home-x-background-setting-7/"],

    ["I Don't Care, So Let Me Hit You!", nil],
    ["Prologue", "https://wwaraitai.co/2021/02/24/i-dont-care-so-let-me-go-home-chapter-thirty-seven/"],
    ["Chapter One", "https://wwaraitai.co/2021/03/16/i-dont-care-so-let-me-go-home-chapter-thirty-seven-2/"],
    ["Chapter Two", "https://wwaraitai.co/2021/03/16/i-dont-care-so-let-me-go-home-chapter-thirty-eight/"],
    ["Four People, For the Sake of One Person: Sara", "https://wwaraitai.co/2021/03/31/i-dont-care-so-let-me-go-home-chapter-thirty-nine/"],
    ["Four People, For the Sake of One Person: Soran", "https://wwaraitai.co/2021/03/31/i-dont-care-so-let-me-go-home-chapter-forty/"],
    ["Four People, For the Sake of One Person: Irene", "https://wwaraitai.co/2021/04/05/i-dont-care-so-let-me-go-home-chapter-forty-one/"],
    ["Four People, For the Sake of One Person: Knight Commander", "https://wwaraitai.co/2021/04/05/i-dont-care-so-let-me-go-home-chapter-forty-two/"],
    ["Background Setting: Right Marshal Vidika and Left Marsal Isabella", "https://wwaraitai.co/2021/04/05/i-dont-care-so-let-me-go-home-x-background-setting-8/"],
    ["Chapter Three", "https://wwaraitai.co/2021/04/27/i-dont-care-so-let-me-go-home-chapter-forty-three/"],
    ["Chapter Four", "https://wwaraitai.co/2021/04/27/i-dont-care-so-let-me-go-home-chapter-forty-four/"],
    ["Chapter Five", "https://wwaraitai.co/2021/04/27/i-dont-care-so-let-me-go-home-chapter-forty-five/"],
    ["Chapter Six", "https://wwaraitai.co/2021/04/29/i-dont-care-so-let-me-go-home-chapter-forty-six/"],
    ["Background Setting: Sorcerer Commander, Knight Commander, and Rururia", "https://wwaraitai.co/2021/04/29/i-dont-care-so-let-me-go-home-x-background-setting-9/"],
    ["Epilogue", "https://wwaraitai.co/2021/04/29/i-dont-care-so-let-me-go-home-chapter-forty-seven/"],

    ["I Don't Care, So Please Don't Leave!", nil],
    ["Chapter One", "https://wwaraitai.co/2021/05/02/i-dont-care-so-let-me-go-home-chapter-forty-eight/"],
    ["Chapter Two", "https://wwaraitai.co/2021/05/02/i-dont-care-so-let-me-go-home-chapter-forty-nine/"],
    ["Chapter Three", "https://wwaraitai.co/2021/05/02/i-dont-care-so-let-me-go-home-chapter-fifty/"],
    ["Chapter Four", "https://wwaraitai.co/2021/05/04/i-dont-care-so-let-me-go-home-chapter-fifty-one/"],
    ["Idle Talk: It Doesn’t Matter, So the Magician Observes", "https://wwaraitai.co/2021/05/04/i-dont-care-so-let-me-go-home-chapter-fifty-two/"],
    ["Background Setting: Empty Knight’s Training Grounds and Knight of the Kingsguard", "https://wwaraitai.co/2021/05/04/i-dont-care-so-let-me-go-home-x-background-setting-10/"],

    ["I Don't Care, So Please Don't Ask Me!", nil],
    ["Chapter One", "https://wwaraitai.co/2021/05/06/i-dont-care-so-let-me-go-home-chapter-fifty-three/"],
    ["Chapter Two", "https://wwaraitai.co/2021/05/06/i-dont-care-so-let-me-go-home-chapter-fifty-four/"],
    ["Chapter Three", "https://wwaraitai.co/2021/05/06/i-dont-care-so-let-me-go-home-chapter-fifty-five/"],
    ["Chapter Four", "https://wwaraitai.co/2021/05/08/i-dont-care-so-let-me-go-home-chapter-fifty-six/"],
    ["Background Setting: Temple Crest, Cloud Spider, and Rururia", "https://wwaraitai.co/2021/05/08/i-dont-care-so-let-me-go-home-x-background-setting-11/"],
    ["Chapter Five", "https://wwaraitai.co/2021/05/08/i-dont-care-so-let-me-go-home-chapter-fifty-seven/"],
    ["Chapter Six", "https://wwaraitai.co/2021/05/08/i-dont-care-so-let-me-go-home-chapter-fifty-eight/"],
    ["Chapter Seven", "https://wwaraitai.co/2021/05/29/i-dont-care-so-let-me-go-home-chapter-fifty-nine/"],
    ["Chapter Eight", "https://wwaraitai.co/2021/05/29/i-dont-care-so-let-me-go-home-chapter-sixty/"],
    ["Chapter Nine", "https://wwaraitai.co/2021/05/29/i-dont-care-so-let-me-go-home-chapter-sixty-one/"],
    ["Background Setting: Irene, Michelle, and Rururia", "https://wwaraitai.co/2021/05/29/i-dont-care-so-let-me-go-home-x-background-setting-12/"],
    ["Chapter Ten", "https://wwaraitai.co/2021/05/29/i-dont-care-so-let-me-go-home-chapter-sixty-two/"],
    ["Chapter Eleven", "https://wwaraitai.co/2021/05/31/i-dont-care-so-let-me-go-home-chapter-sixty-three/"],
    ["Background Setting: Pillow, Michelle, Margrave’s Hammer, and Rururia", "https://wwaraitai.co/2021/05/31/i-dont-care-so-let-me-go-home-x-background-setting-13/"],
    ["Idle Talk: It Doesn’t Matter, but the Boy Pushes Ahead", "https://wwaraitai.co/2021/05/31/i-dont-care-so-let-me-go-home-chapter-sixty-four/"],

    ["I Don't Care, So Let Me Go Home!", nil],
    ["Prologue", "https://wwaraitai.co/2021/05/31/i-dont-care-so-let-me-go-home-prologue/"],
    ["Chapter One", "https://wwaraitai.co/2021/06/03/i-dont-care-so-let-me-go-home-chapter-sixty-five/"],
    ["Background Setting: The Bet Between Sara and the Crown Prince", "https://wwaraitai.co/2021/06/03/i-dont-care-so-let-me-go-home-x-background-setting-14/"],
    ["Chapter Two", "https://wwaraitai.co/2021/06/03/i-dont-care-so-let-me-go-home-chapter-sixty-six/"],
    ["Chapter Three", "https://wwaraitai.co/2021/06/08/i-dont-care-so-let-me-go-home-chapter-sixty-seven/"],
    ["Chapter Four", "https://wwaraitai.co/2021/06/08/i-dont-care-so-let-me-go-home-chapter-sixty-eight/"],
    ["Chapter Five", "https://wwaraitai.co/2021/06/08/i-dont-care-so-let-me-go-home-chapter-sixty-nine/"],
    ["Chapter Six", "https://wwaraitai.co/2021/06/10/i-dont-care-so-let-me-go-home-chapter-seventy/"],
    ["Chapter Seven", "https://wwaraitai.co/2021/06/10/i-dont-care-so-let-me-go-home-chapter-seventy-one/"],
    ["Chapter Eight", "https://wwaraitai.co/2021/06/10/i-dont-care-so-let-me-go-home-chapter-seventy-two/"],
    ["Chapter Nine", "https://wwaraitai.co/2021/06/19/i-dont-care-so-let-me-go-home-chapter-seventy-three/"],
    ["Chapter Ten", "https://wwaraitai.co/2021/06/19/i-dont-care-so-let-me-go-home-chapter-seventy-four/"],
    ["Chapter Eleven", "https://wwaraitai.co/2021/06/19/i-dont-care-so-let-me-go-home-chapter-seventy-five/"],
    ["Chapter Twelve", "https://wwaraitai.co/2021/06/19/i-dont-care-so-let-me-go-home-chapter-seventy-six/"],
    ["Chapter Thirteen", "https://wwaraitai.co/2021/06/30/i-dont-care-so-let-me-go-home-chapter-seventy-seven/"],
    ["Chapter Fourteen", "https://wwaraitai.co/2021/06/30/i-dont-care-so-let-me-go-home-chapter-seventy-eight/"],
    ["Ending (Part I)", "https://wwaraitai.co/2021/06/30/i-dont-care-so-let-me-go-home-chapter-seventy-nine/"],
    ["Ending (Part II)", "https://wwaraitai.co/2021/06/30/i-dont-care-so-let-me-go-home-chapter-eighty"]
]

def get_chapter_text url
    content = get_html_document url
    content = content.xpath('//div[@class="entry-content"]')[0]

    content.search('div').remove
    content.search('script').remove
    content.to_s.gsub('<hr class="wp-block-separator">', '--------')
end

def download_all
    file = open("i-dont-care-so-let-me-go-home.html", "w+") 
    file << '<!DOCTYPE html> <head></head><body>'  
    file << '<h1>I Don’t Care, So Let Me Go Home!</h1> <p>translated by <a href="wwaraitai.co">Nani Mo Wakaranai Kedo</a></p>'   
    
    $toc.each do |name, url|
        if url == nil
            puts "\n"
            puts name
            file << "<hr><h2>#{name}</h2>"
            next
        end

        puts "Dowloading #{name}"
        file << "\n<h3>#{name}</h3>"
        file << get_chapter_text(url)
        file << "\n"
    end

    file << "</body></html>"
    file.close
end

download_all