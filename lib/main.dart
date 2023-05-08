import 'package:flutter/material.dart';
import 'package:network/app_network.dart';
import 'package:waddi/features/coin_list/view/coin_list_page.dart';
import 'package:waddi/service_locator.dart';
import 'package:waddi/utils/color_mannager.dart';
import 'package:waddi/utils/constats.dart';

void main() {
  AppNetwork appNetwork = AppNetwork(baseUrl: appBaseUrl);
  MyGetIt.setUpLocators(baseUrl: appBaseUrl, appNetwork: appNetwork);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('MaterialApp.Key'),
      debugShowCheckedModeBanner: false,
      title: 'Waddi',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: kSecondaryColor,
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
      ),
      home: const CoinListPage(),
    );
  }
}
