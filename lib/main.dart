import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warranty_noty/Pages/addProductPage.dart';
import 'package:warranty_noty/bloc/app_bloc.dart';

import 'Pages/homePage.dart';
import 'Pages/searchPage.dart';
import 'bloc/app_repository.dart';
import 'bloc/product_data_provider.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
   final appBloc = BlocProvider(create: (context) => AppBloc(AppRepository(ProductsDataProvider())));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [appBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: kPrimaryPurple,
              primary: kPrimaryPurple,
              secondary: kSecondaryLightPurple,
              background: kBackgroundWhite),
          textTheme: TextTheme(bodyMedium: GoogleFonts.kanit()),
          iconTheme: const IconThemeData(
            color: kPrimaryDarkPurple,
            size: 24.0
          ),
          useMaterial3: true,
        ),
        home: const HomePage()
      ),
    );
  }
}
