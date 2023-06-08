import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_video/screens/onboarding/login_screen.dart';
import 'package:freelancing_video/screens/onboarding/onboarding_screen.dart';
import 'package:freelancing_video/screens/onboarding/otp_screen.dart';
import 'package:freelancing_video/screens/page/detailed_screen.dart';
import 'package:freelancing_video/screens/page/profile_page.dart';
import 'package:freelancing_video/screens/page/search_page.dart';
import 'package:freelancing_video/screens/page/showcasing_screen.dart';
import 'package:freelancing_video/model/video_model.dart';
import 'package:freelancing_video/screens/page/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: {
        '/': (context) => OnboardingScreen(),
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/details': (context) => DetailsPage(
              plant: Vids(
                name: 'Valorant Video',
                imagePath:
                    'https://c8.alamy.com/comp/PJ318B/assortment-of-fresh-colorful-organic-vegetables-on-wooden-pine-table-raw-food-background-top-view-vertical-selective-focus-PJ318B.jpg',
                category: 'Gaming',
                description:
                    'From perfectly timed cuts to seamless transitions, every frame is meticulously crafted to enhance the gameplay experience. With dynamic effects, captivating visuals, and synchronized audio, this video is a masterclass in editing, showcasing the best moments, strategies, and exhilarating action that will leave you on the edge of your seat. Get ready to immerse yourself in the world of gaming like never before.',
              ),
            ),
        '/login': (context) => LogInPage(),
        '/otp': (context) => OTPPage(),
        '/profilepage': (context) => ProfilePage(),
        '/showcase': (context) => ShowCasingScreen(),
        '/search': (context) => SearchScreen(),
      },
      // home: ProfilePage(),
    );
  }
}
