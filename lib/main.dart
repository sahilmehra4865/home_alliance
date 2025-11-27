import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_alliance/utils/app_theme.dart';
import 'package:home_alliance/view/dashboard_flow/Home/home_var_page.dart';
import 'package:home_alliance/view/dashboard_flow/Home/new_home.dart';
import 'package:home_alliance/view/dashboard_flow/dashboard_page.dart';
import 'package:home_alliance/view/dashboard_flow/metrics/metrics_page.dart';
import 'package:home_alliance/view/job_screens/job_info.dart';
import 'package:home_alliance/view/sales_pipeline/sales_pipeIine.dart';
import 'package:home_alliance/view/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/binding/application_binding.dart';
import 'helper/routes.dart';
import 'helper/shared_prefs.dart';
import 'helper/translations/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPrefs.prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(394, 874), //Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) => GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: child,
          ),
          theme: AppTheme.light,
          themeMode: ThemeMode.light,
          home:const SplashPage(),
          navigatorKey: Routes.navigatorKey,
          getPages: Routes.pages,
          initialBinding: ApplicationBinding(),
          translations: Messages(),
          locale: const Locale('en', 'US'),
        );
      },
    );
  }
}
