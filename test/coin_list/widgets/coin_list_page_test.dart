// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_listview/custom_listview_favorites_widget.dart';
import 'package:waddi/features/coin_list/coin_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waddi/service_locator.dart';
import 'package:waddi/utils/color_mannager.dart';
import 'package:http/http.dart' as http;
import '../../mocks/appnetwork.dart';

class MockHttpClient extends Mock implements http.Client {
  Future<http.Response> gets(dynamic uri, {dynamic headers}) {
    super.noSuchMethod(Invocation.method(#get, [uri], {#headers: headers}));
    return Future.value(http.Response('', 200));
  }
}

void main() {
  // setUp(() {
  //   GoogleFonts.config.allowRuntimeFetching = false;
  // });

  // setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    HttpOverrides.global = null;
  });

  group('CoinListPage', () {
    group('route', () {
      test('is routable', () {
        expect(CoinListPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CoinListView', (WidgetTester tester) async {
      await tester.runAsync(() async {
        WidgetsFlutterBinding.ensureInitialized();
        EquatableConfig.stringify = kDebugMode;
        MockAppNetwork appNetwork = MockAppNetwork();
        MyGetIt.setUpLocators(baseUrl: '', appNetwork: appNetwork);

        // provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
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
        ));
        expect(find.byKey(ValueKey('CoinListPage.Key')), findsOneWidget);
        // await tester.pumpAndSettle();

        // expect(find.byType(CoinListView), findsOneWidget);
        expect(find.byKey(ValueKey('CoinListView.Key')), findsOneWidget);
        await tester.pumpAndSettle();

        expect(find.byType(CustomListViewFavorites), findsOneWidget);
        // });
      });
    });
  });
}
