#!/bin/bash

echo -e "Iniciando Script!\n"

BEGIN_TIME=$1
END_TIME=$2
URL_YOUTUBE=$3
PATH_DOWNLOAD="/home/download"
PATH_HTTPD="/usr/local/apache2/htdocs/"

echo "=========================================================="
echo -e "\nValores de entrada: \n\tTempo de início: $BEGIN_TIME\n\tTempo de fim: $END_TIME\n\tURL do youtube: $URL_YOUTUBE"
echo "=========================================================="

if curl --output /dev/null --silent --head --fail "$URL_YOUTUBE"; then
    echo -e "\nURL retornou código válido."
    echo -e "\n\tComeçando a baixar o vídeo $URL_YOUTUBE\n\n"
    echo "=========================================================="
    youtube-dl -o "/home/download/video_baixado" $URL_YOUTUBE
    echo "=========================================================="
    echo -e "\nVerificando se o arquivo realmente existe:\n"

    DOWNLOADED_VIDEO=$(ls /home/download | head -n 1)

    if [[ -f $PATH_DOWNLOAD/$DOWNLOADED_VIDEO ]]; then

        if [[ -f $PATH_HTTPD/$DOWNLOADED_VIDEO ]]; then
            rm -rf $PATH_HTTPD/$DOWNLOADED_VIDEO
            echo "=========================================================="
            echo -e "\n\t\tDeletado arquivo $DOWNLOADED_VIDEO já existente em: $PATH_HTTPD"
            echo "=========================================================="
        else
            echo -e "\n\t\tNenhum arquivo existente!"
        fi

        if [[ -f $PATH_DOWNLOAD/$DOWNLOADED_VIDEO ]]; then
            echo "=========================================================="
            echo -e "\nArquivo exitente: \n\tTempo de início: $BEGIN_TIME\n\tTempo de fim: $END_TIME\n\tURL do youtube: $URL_YOUTUBE"
            echo "=========================================================="
            ffmpeg -i $PATH_DOWNLOAD/$DOWNLOADED_VIDEO -ss $BEGIN_TIME -to $END_TIME -async 1 -strict -2 $PATH_HTTPD/out.mp4
            echo "=========================================================="
            rm -rf $PATH_DOWNLOAD/$DOWNLOADED_VIDEO

        fi
    fi
else
    echo "URL does not exist: $URL_YOUTUBE"
fi
