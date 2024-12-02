import 'package:coffe_shop_mobile_app/product/dinleme/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

@immutable
class AppInitialize {


    Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
      WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // final storage = await HydratedStorage.build(
    //   storageDirectory: await getApplicationDocumentsDirectory(),
    // );
    // HydratedBloc.storage = storage;
  }

}

