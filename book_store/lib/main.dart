import 'package:book_store/book_store.dart';
import 'package:book_store/feature/auth/presentation/screens/login_screen.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar')], path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: const BookStore(),
      ));
}

//dart run easy_localization:generate -S assets/translations -O lib/gen/translations -o local_keys.g.dart -f keys

