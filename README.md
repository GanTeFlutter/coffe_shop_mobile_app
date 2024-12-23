# Kahve Sipariş Uygulaması ☕

Aktif olarak geliştirdiğim proje 

Homepage
Basket 
CoffeeDetail 
- Figma Tasarımı: [Coffee Shop Mobile App Design](https://www.figma.com/design/HEHEkOvpW6XZg7PNLRbHVm/Coffee-Shop-Mobile-App-Design-(Community)?node-id=417-156&node-type=canvas)

## Özellikler

Sayfalarr future altında toplanmıltır o sayfaya özgü herşeyide o klasör altında toplamaya çalıştım widgetler ve state yapılarını.Şimdiye kadar home,basket,coffee_detail,yeni adres ekleme ve splashOnBoard kısımlarını yapabildim bunların dark temalarını henüz ayarlamadım sadece homeView kısmının  
dark theme mi düzenlendi.Yakın zamanda geri kalanı da güncelleyeceğim.Genel olarak Bloc yapısını kullandım basit yerlerde ise provider.


## Uygulama Görselleri
### Splash Screen
<img src="https://github.com/user-attachments/assets/e6a739f5-a080-44cc-b834-cb7f4c92d77d" width="150" />
<img src="https://github.com/user-attachments/assets/20a379b4-fa40-4a6c-8655-23227f663fae" width="150" />
<img src="https://github.com/user-attachments/assets/21aa7b9f-373f-491d-8197-465dee6ebbd6" width="150" />
<img src="https://github.com/user-attachments/assets/b0fd421c-eb50-47c8-87d6-0c74a9658bd9" width="150" />


### Home Screens
<img src="https://github.com/user-attachments/assets/a6d7376f-d07b-4ae4-a553-ebda5bf32099" width="150" />
<img src="https://github.com/user-attachments/assets/ac347484-2ea4-4bea-8816-dc36d3d8fef5" width="150" />
<img src="https://github.com/user-attachments/assets/3e0a5517-3384-486f-9da7-b3503c5355a9" width="150" />


### Adres Ekleme,Coffee detail,Splash
<img src="https://github.com/user-attachments/assets/049cef21-faba-4731-85d0-9a30e9947a59" width="150" />
<img src="https://github.com/user-attachments/assets/3ed6fcfb-3c73-4e53-aa93-d83a765254e2" width="150" />
<img src="https://github.com/user-attachments/assets/1fee664d-8e0d-451a-ba79-49c0f5252cac" width="150" />



### Sepet ve Ürünler
<img src="https://github.com/user-attachments/assets/238f3487-a9ba-4e89-8dad-9fbee9aff9bd" width="150" />
<img src="https://github.com/user-attachments/assets/151b3e88-df97-4f5a-9485-3f28a85d2763" width="150" />
<img src="https://github.com/user-attachments/assets/b24e659a-5229-4935-85d1-5db40d1ac52d" width="150" />



## HomePage:

HomePage in HomeViewModel da kategoriList adında bir liste belirleyip bununla bir listviewbuilder oluşturdum.Liste içindeki Stringleri kullanarak kullanıcı bunlara tıklayınca bloc mekanizması tetiklenerek yeni liste yayınlanıyor.
BlocProvider.of<HomeBloc>(context).add(HomeKategoryEvent(message: kategori.event)); 
Kategori.event listem içinde tanımlı ListviewBuilder da indexe göre listeleme yağtığı için Eventi doğru bir şekilde gönderebiliyoruz.
