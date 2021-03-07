<?php
$inicio =  htmlspecialchars($_POST['inicio']);
$fim = htmlspecialchars($_POST['fim']);
$url =  htmlspecialchars($_POST['url']);
echo $inicio;
echo $fim;
echo $url;
$output = shell_exec("bash /home/scripts/download-and-cut.sh '".$inicio."'  '".$fim."'    '".$url."' ");
echo "<pre>$output</pre>";
