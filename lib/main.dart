import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_education/firebase_options.dart';
import 'package:smart_education/initial_binding.dart';
import 'package:smart_education/view/class/class_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  InitialBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Smart Education',
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        // getPages: AppRoutes.pages(),
        home: const ClassPage(),
      );
    });
  }
}