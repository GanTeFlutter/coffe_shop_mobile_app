import 'package:coffe_shop_mobile_app/product/dinleme/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

@immutable
class AppInitialize {


    Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
      WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    HydratedBloc.storage = storage;
  }

}


// import 'package:coffe_shop_mobile_app/product/dinleme/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// @immutable
// class ApplicationStart {
//   const ApplicationStart._();

//   static Future<void> init() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     // Firebase başlatma
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );

//     // HydratedBloc için depolama
//     final storage = await HydratedStorage.build(
//       storageDirectory: await getApplicationDocumentsDirectory(),
//     );
//     HydratedBloc.storage = storage;

//     // SharedPreferencesWithCache başlatma ve sınıf seviyesinde saklama
//     prefsWithCache = await SharedPreferencesWithCache.create(
//       cacheOptions: const SharedPreferencesWithCacheOptions(
//         allowList: <String>{'repeat', 'action'},
//       ),
//     );
//   }

//   // SharedPreferencesWithCache örneğini sınıf seviyesinde saklıyoruz
//   static late SharedPreferencesWithCache prefsWithCache;
// }
