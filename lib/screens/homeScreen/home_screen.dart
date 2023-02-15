import 'package:flutter/material.dart';

import '../../settings/routes_manger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.adminPanelScreenRoute);
                },
                child: const Text("Admin")),
                ListTile(
                  title: Text("هلووو"),
                )
          ],
        ),
      ),
    );
  }
}
