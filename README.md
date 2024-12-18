# Kahve Sipariş Uygulaması ☕

üç screenli bir uygulama

Homepage
Basket 
CoffeeDetail 
- Figma Tasarımı: [Coffee Shop Mobile App Design](https://www.figma.com/design/HEHEkOvpW6XZg7PNLRbHVm/Coffee-Shop-Mobile-App-Design-(Community)?node-id=417-156&node-type=canvas)
## Özellikler
- **Seçilen Coffenin Sepete Eklenmesi**:Coffee List firebasten çekilip bloc üzerinden homepage yayınlanıyor sonrasında sepet tekrar kaydedilmiyor
- **Sepet Yönetimi**:Firebaseten gelen Coffe model üzerine farklı modeller kullanarak Basket sistemini yönetmeye çalışıyoruz.
- **Address Seçimi**:Address yönetimini product\state\address altında topladım.Addressleri shared_preferences ile cacheliyorum.Ayrıca adressleri emit etmek iki farklı bloc tanımladım birinde tüm adressler kaydedilip bloc üzeirinden showModalBottomSheet içerisinde gösteriliyor.ikincisi burdan seçilen adresi tek bir addressi emit ediyor.İki farklı veriyi tek bir bloktan farklı zamanlarda yayınlamak istedigimizde biri diğerini yokediyodu  çözüm olarak aynı state te de yayınlanabilirdi ancak daha basit olamsı açısından SingleAddressBloc diye ayırdım.

## Uygulama Görselleri

### Ana Ekranlar
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
