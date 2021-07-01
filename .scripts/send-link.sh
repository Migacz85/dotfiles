#!/usr/bin/env bash
#install
#yay wkhtmltopdf
#pdftk - merge pdfs in to one
#sudo pacman -S pdfkt
#yay common-lang
#sudo pacman -S bcprov
 # ~/Downloads/
 # mkdir kindle
 # cd kindle
 # mkdir pdf
 # mkdir mobi
 # mkdir txt

# dir=/srv/http/link.html
# dir=/srv/http/link.txt

dir=~/Downloads/link.html
dir2=~/Downloads/kindle/"$QUTE_TITLE.txt"
dir3=~/Downloads/site.html

function sanitize_file_name {
    echo -n $1 | perl -pe 's/[\?\[\]\/\\=<>:;,''"&\$#*()|~`!{}%+]//g;' -pe 's/[\r\n\t -]+/-/g;'
}

QUTE_TITLE=$(sanitize_file_name "$QUTE_TITLE")

# I can not pass this dirs in variables as a parameters - don't know why?
pdf= ~/Downloads/kindle/pdf/"$QUTE_TITLE.pdf"
mobi= ~/Downloads/kindle/mobi/"$QUTE_TITLE.mobi"

mkdir ~/Downloads/kindle/pdf
mkdir ~/Downloads/kindle/mobi

cd ~/Downloads/
notify-send "Converting site on .pdf"

# WKHTMLTOPDF - usable arguments to set
# --minimum-font-size 30 --header-font-size 33
# --lowquality
# --disable-smart-shrinking
# --dpi XXX
# --zoom X.X
# wkhtmltopdf --margin-left .375in --margin-right .375in --margin-bottom .375in --margin-top .375in --page-width 6in --page-height 9in --load-error-handling ignore --javascript-delay 3333 --enable-forms --footer-center "[page]/[topage]" "${PDF_Combine[@]}" "/MyPath/MyFileName.pdf"
#--minimum-font-size 30 --header-font-size 33 -s A4
wkhtmltopdf --minimum-font-size 30 --header-font-size 34 -s A4 "$QUTE_URL" ~/Downloads/kindle/pdf/"$QUTE_TITLE.pdf"
notify-send "Converting pdf on .mobi"
ebook-convert  ~/Downloads/kindle/pdf/"$QUTE_TITLE.pdf" ~/Downloads/kindle/mobi/"$QUTE_TITLE.mobi"

# echo "Message Body Here" | mailx -s "Subject" -a  ~/Downloads/kindle/mobi/"$QUTE_TITLE.mobi" migacz85_5e5754@kindle.com
echo "Message Body Here" | mailx -s "Subject" -a  ~/Downloads/kindle/pdf/"$QUTE_TITLE.pdf" migacz85_5e5754@kindle.com
notify-send "Sent on kindle"

echo '
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="refresh" content="0; url=
' > $dir 

echo $QUTE_URL >> $dir
echo '"  />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title></title>
link
</head>
<body>
body
</body>
</html>
' >> $dir

cat $QUTE_TEXT > ~/Downloads/kindle/txt/"$QUTE_TITLE.txt"
# echo $QUTE_SELECTED_TEXT > /srv/http/slink.txt
