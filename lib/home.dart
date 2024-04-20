import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Home Screen file
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                // Toggle between English and Arabic
                if (context.locale.languageCode == 'en') {
                  EasyLocalization.of(context)
                      ?.setLocale(const Locale('ar', '')); // Switch to Arabic
                } else {
                  EasyLocalization.of(context)
                      ?.setLocale(const Locale('en', '')); // Switch to English
                }
              },
              icon: const Icon(Icons.language),
            ),
            const Text('title').tr(),
          ],
        ),
      ),
    );
  }
}
