import 'package:codeedex_test/core/constants/appconstants.dart';
import 'package:codeedex_test/core/theme/colors.dart';
import 'package:codeedex_test/features/home/controller/home_provider.dart';
import 'package:codeedex_test/features/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        title: AppConstants.appname,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldbg,
          primaryColor: AppColor.primarycolor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.appbarcolor
          )
        ),
        home: SplashScreen(),
      ),
    );
  }
}