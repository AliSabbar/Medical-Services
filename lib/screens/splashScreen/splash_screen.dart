import 'package:flutter/material.dart';

import '../../settings/routes_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.adminPanelScreenRoute);
                },
                child: const Text("Admin"))
          ],
        ),
      ),
    );
  }
}
