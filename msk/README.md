# MSK

The tools i use to scrap manga/novels and utility scripts

## tumbget

Download all images on a tumblr page. (Made to get from idiana204) 

Development video: https://www.youtube.com/watch?v=1wZ3ACRbVMk

*args*: url path

## neloget

Given the manga id and a range, download all chapter whithin the range from MangaNelo.

*args*: manga-id first-chapter-number last-chapter-number [-v]

## nelogetchap

Download the chapter from MangaNelo given the url.

*args*: url path

## shared

Given a url and a regex pattern it downloads all the images to a given folder.

*args*: url pattern path

## titles/maou-nikki-get-all

Download all chapters of maou-sama kansatsu nikki from sabishiidesu. (Hardcoded)

## deprecated/hu3get

Download the following chapters from Hue3Animes:
- nuzi xueyuan de nansheng 250-306
- yaoguai faan 18-25
- chaoji shenyi xitong 11-32
- island school 43-50
- long hun te gong 1-9
- human evolution 1-9
- human evolution 10-22
- overlord mask 10-22

The site has closed down so download the chapters are impossible now.

*args*: url path

# Utilities

## zipfy

Zip the current folder

## mobify

Create a .mobi of all zip/rar/cbz in the current directory. Needs KCC and Kindlegen.

## txt2htm

Wraps a plain text into a html file and create a mobi file from it if Kindlegen is on dirctory.

*args*: input_file output_file

