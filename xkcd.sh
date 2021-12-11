#!/bin/bash
comicNumber=$(( $RANDOM % 2553 + 1 ))
curl "https://xkcd.com/$comicNumber/" > randComic.txt || exit
randComic=$(egrep -o -m 1 'https://imgs.xkcd.com/comics/.*\.png' randComic.txt)
echo ${randComic/\"*}
wget -O comic.png "${randComic/\"*}" && echo "Image downloaded"
magick display comic.png
rm randComic.txt && echo "File deleted"
rm comic.png && echo "Image deleted"
