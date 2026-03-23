import 'package:book_store/book_store.dart';
import 'package:book_store/core/helper/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/dependency_injection/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar')], path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: const BookStore(),
      ));


}


//dart run easy_localization:generate -S assets/translations -O lib/gen/translations -o local_keys.g.dart -f keys

//dart run build_runner build --delete-conflicting-outputs
