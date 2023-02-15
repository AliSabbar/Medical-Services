import 'package:flutter/material.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'اهلا بك في',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: ' \n تطبيق ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'عافيتك',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 32,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
