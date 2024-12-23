import 'package:flutter/material.dart';

@immutable
class ApplicationStrings {
  const ApplicationStrings._();
 
  // splash
  static const String splashTitleText = 'Fall in Love with\nCoffee in Blissful\nDelight!';
  static const String splashTitleText2 =
      'Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.';
  static const String splashbuttonText = 'Get Started';

  // HomePage
  static const String prfilImage = 'assets/image/profile/profile.jpg';
  static const String hata =
      'Bilinmeyen bir hata oluştu.Lütfen destek ekibimizle iletişime geçiniz.';
  static const String location = 'Location';
  static const String searchcoffe = 'Search for coffee or shop';
  static const String buyonegetonefree = 'Buy One Get One Free';

  // CoffeeDetail
  static const String description = 'Description';
  static const String cdsize = 'Size';

  // Basket
  static const String deliveryaddress = 'Delivery Address';
  static const String lutfenadresbelirle = 'Lütfen bir Address Belirleyiniz';
  static const String addnote = 'Add Note';
  static const String alisverisitamamla = 'Alışveriş Tamamla';
  static const String changeAddress = 'Change Address';
  static const String indirim = '1 Discount is Applies';
  static const String paymentsum = 'Payment Summary';
  static const String totalPrice = 'Price';
  static const String toplamadet = 'Toplam Adet';
  static const String completeOrder = 'Complete Order';
  static const String orderCompleted = 'Alışverişiniz tamamlandı.';
  static const String emptyBasket = 'Hemen Alışverişe Başla';
  static const String totalAmount = 'Toplam Tutar';
  static const String details = 'Details';
  static const String emptyBasketInitial = '';
  static const String warningSign = '!! ';

  // Indirim
  static const String enterVoucherCode = 'Enter your voucher code';
  static const String onlyOneDiscount = 'Sadece bir indirim kodu kullanabilirsiniz.';
  static const String enterYourDiscountCode = 'Kodunuzu girin';
  static const String discountApplied = 'İndirim Kodu Kullanıldı';
  static const String applyDiscount = 'Uygula';
  static const String close = 'Kapat';
  static const String enterCodeFirst = 'Lütfen bir kod girin.';
  static const String discountAppliedSuccessfully = 'Kod başarıyla uygulandı.';
}
