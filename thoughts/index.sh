#!/bin/sh
echo '<html><head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="../style.css" type="text/css" media="all"/>
<title>thoughts ^^</title>
</head><body>
<p>These are my thoughts:</p>
<ul class="Bl-bullet">'
for file in $@; do echo "<li><a class=\"Lk\" href=\"`basename $file`\">`basename $file`</a></li>"; done
echo "</ul>
</body></html>"
