#!/usr/bin/env bash

dir=/srv/http/link.html
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

cat $QUTE_TEXT > /srv/http/link.txt
echo $QUTE_SELECTED_TEXT > /srv/http/slink.txt
