#!/bin/sh

function veriArama(){
aranan=$(zenity --entry --title="Arama" --width=400 --height=200 --text="Aranan Kelime:")
if [ ${#aranan} == 0 ]
then
	zenity --warning\
	--width=400 --height=200\
	--text="Arama sonuclanamadı"
else
	aramaKontrol=$(cat $FILE | grep -w $aranan)
	if [ ${#aramaKontrol} == 0 ]
	then
		zenity --warning\
		--width=400 --height=200\
		--text="$aranan bulunamadı"
	else
		cat $FILE | grep -i $aranan > yedek_aramasonuc.txt
		zenity --text-info\
		--title="Arama Sonucu"\
		--width=500 --height=500\
		--filename="yedek_aramasonuc.txt"
		
	fi
fi
}

function erisimliVeriArama(){
aranan=$(zenity --entry --title="Arama" --width=400 --height=200 --text="Aranan Kelime:")
if [ ${#aranan} == 0 ]
then
	zenity --warning\
	--width=400 --height=200\
	--text="Arama sonuclanamadı"
else
	erisimliAramaKontrol=$(sudo cat $FILE | grep -w $aranan)
	PASSWORD=$(zenity --password \
		          --width=500 \
		          --title="Arama İcin Şifrenizi Giriniz")
	case $? in
	0)
		if [ ${#PASSWORD} == 0 ]
		then
			dosyaErisim
		else
			echo "Aramaya erişim verildi"
			
			if [ ${#erisimliAramaKontrol} == 0 ]
			then
			zenity --warning\
				--width=400 --height=200\
				--text="$aranan bulunamadı"
			else
				sudo cat $FILE | grep -i $aranan > yedek_aramasonuc.txt
				PASSWORD=$(zenity --password \
		          			  --width=500 \
		          			  --title="Tekrar Şifrenizi Giriniz")
		         	if [ ${#PASSWORD} == 0 ]
				then
					dosyaErisim
				else
					echo "Aramaya erişim verildi"
					zenity --text-info\
						--title="Arama Sonucu"\
						--width=500 --height=500\
						--filename="yedek_aramasonuc.txt"
				fi
			fi
			
		fi;;
	1)
		exit 0;
	esac
fi
}

function dosyaErisim(){
sudo cat $FILE > yedek_erisimdosya.txt 

PASSWORD=$(zenity --password \
                  --width=500 \
                  --title="İzin İcin Şifrenizi Giriniz")
case $? in
0)
	if [ ${#PASSWORD} == 0 ]
	then
		dosyaErisim
	else
		echo "Erişim verildi"
		
		zenity --text-info\
			--title="Secilen Dosya"\
			--width=500 --height=500\
			--filename="yedek_erisimdosya.txt"
		case $? in
		0)
			zenity --question\
			--width=400 --height=200\
			--text="Dosyada arama yapmak istermisiniz?"
			case $? in 
			0) 
				echo "Arama yapılıyor"
				erisimliVeriArama;;
			1) 
				echo "Arama yapılmadı";;
			esac ;;
	
		1)
			dosyaSec;;
		esac
	fi;;
1)
	dosyaSec;;
-1)
	exit 0;;
esac
}

function dosyaSec(){
FILE=`zenity --file-selection --width=500 --height=500 --filename=/var/log/ --title="Bir Dosya Seçiniz."`

case $? in
0)
	echo "$FILE seçildi."
	control=$(cat $FILE)
	if [ ${#control} -eq 0 ]
	then
	echo "Erişim gerekli"
	dosyaErisim
	else
		zenity --text-info\
			--title="Secilen Dosya"\
			--width=500 --height=500\
			--filename=$FILE
		case $? in
		0)
			zenity --question\
			--width=400 --height=200\
			--text="Dosyada arama yapmak istermisiniz?"
			case $? in 
			0) 
				echo "Arama yapılıyor"
				veriArama;;
			1) 
				echo "Arama yapılmadı";;
			esac ;;
	
		1)
			dosyaSec;;
		esac
	fi;;
1)
	echo "Hiçbir dosya seçilmedi."
	zenity --info\
	--width=400 --height=200\
	--text="Hiçbir dosya seçilmedi.";;

esac
}
dosyaSec
