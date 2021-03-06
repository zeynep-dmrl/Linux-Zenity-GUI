README.md

# Linux Zenity GUI

Bir Linux makinasındaki sistem loglarını tutan /var/log/
klasörü içinde kullacının seçtiği bir log dosyasını 
görünteleyen ve bu log içinde arama yapılmasını sağlayan
bir programdır. Zenity kütüphanesi 
kullanarak bir arayüz tasarlamıştır.
Zenity kütüphanesi kurmak için

```
sudo apt-get install zenity
```

komutunu terminal üzerinden çalıştırılmalıdır.
Eğer kütüphane için daha fazla bilgi öğrenmek 
isterseniz 
[tıklanıyınız](https://help.gnome.org/users/zenity/3.32/)

### Log dosyası nedir?
Log dosyaları, işletim sistemi üzerinde veya sunucu 
üzerinde gerçekleşen olayaların anlık olarak 
tutulduğu kayıtlardır.Linux işletim sisteminde log 
dosyaları */var/log* dizini merkezi
log toplama alanı altında tutulur. Genellikle 4 
kategoride sınıflandırılır:
1. Uygulama Logları (Application Logs)
2. Olay Logları (Event Logs)
3. Servis Logları (Sevice Logs)
4. Sistem Logları (System Logs)

Linux Log dosyalarını izleyerek, sunucu performansı, 
güvenlik, hata mesajları ve bunlarla ilgili konular 
hakkında detaylı bilgi edinebilirsiniz.Log dosyaları, 
oluşabilecek sorunları önceden tahmin edebilmenizi sağlar.

Bazı log dosyaları:
- /var/log/syslog: 
Bilgi amaçlı ve kritik olmayan sistem mesajlarını saklamak için kullanılır.
Burada uygulama ile ilgili servis hatalarını ve sistem 
başlatılırken kaydedilen mesajları takip edebilirsiniz.

- /var/log/auth.log: 
Kimlik doğrulama işlemleri ile ilgili tüm olaylar buraya kaydedilir.Güvenlik açıkları 
ile ilgili tespit yapmaya çalışıyorsanız buraya bakmanız gerekir.

- /var/log/boot.log: 
Sistem başlatılırken kaydedilen ilgili bilgi ve mesajları önyükleme deposudur.
Yanlış kapatma, planlanmamış yeniden başlatmalar veya önyükleme hatalarıyla 
ilgili sorunları araştırmak için bu log dosyasını analiz edebilirsiniz.

- /var/log/dmesg: 
Donanım ve sürücüler ile ilgili bilgiler buraya kaydedilir. 
Çekirdek, önyükleme işlemi sırasında sunucuyla ilişkili fiziksel 
donanım aygıtlarını algıladığından, aygıt durumunu, donanım hatalarını ve 
diğer genel mesajları yakalar. Bir donanım düzgün çalışmıyorsa veya algılanmıyorsa, 
sorunu bu log dosyasında arayabilirsiniz.

- /var/log/kern.log: 
Linux çekirdeği tarafından kaydedilen bilgileri bu log dosyası depolar.
Çekirdek ile ilgili hataları ve uyarıları gidermek için kullanılır.

- /var/log/faillog: 
Bu dosya başarısız giriş denemeleri hakkında bilgi içerir.

- /var/log/lastlog: 
lastlog dosyası binary bir dosyadır ve her bir kullanıcının en son ne zaman hangi IP 
adresinden oturum açtığını da gösterir

## Uygulamanın Çalışması ve Özellikleri
Projeyi kendi bilgisayarınıza indirmelisiniz. Daha sonra uygulamayı
``` bash run.sh ```  
komutu ile terminalden çalıştırabilirsiniz.

**Ana menüden istediğiniz bir log dosyası seçebilirsiniz.**

![dosyaSecmeMenu](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/dosyaSecmeMenu.png)

**Ardından seçtiğiniz dosyanın içeriği gelicektir.** 

![secilendosya](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/secilendosyaimg.png)

**Eğer seçtiğiniz dosya erişim gerekli bir dosya ise erişim için parola widget gelicektir. Buraya kullanıcı parolanızı girmelisiniz dosya içeriği ancak 
bu şekilde görebilirsiniz..**

![parola](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/parola.jpeg)

**Tamam butonuna tıklayarak arama menüsüne giderek dosyada aramak istediğinizi girebilirsiniz.**

![AramaMenu](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/AramaMenu.png) ![AramaForm](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/AramaForm.png)

**Aradığınız eğer dosyada bulunuyorsa sonuç gösterilecektir. Fakat eğer dosyada bulunmayan bir içerik arattığınızda uyarı alabilirsiniz.**

![AramaSonucu](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/AramaSonucu.png)

Ve bazı uygulamadaki dialogs...

![dosyaSecilmedi](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/dosyaSecilmedi.png) ![aramabulunamadı](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/aramabulunamadı.png)
![aramasonuclanamadı](https://github.com/zeynep-dmrl/Linux-Zenity-GUI/blob/main/imgs/aramasonuclanamadı.png)


Projenin tam olarak nasıl çalıştığını öğrenmek için tıklayınız

