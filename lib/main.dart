import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/controllers/page_index_controller.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/widgets/bottomNavBar.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(PageIndexController(), permanent: true);

  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ));
        }
        return GetMaterialApp(
          title: 'Travellio',
          debugShowCheckedModeBanner: true,
          initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.black,
          ),
        );
      }));
}
