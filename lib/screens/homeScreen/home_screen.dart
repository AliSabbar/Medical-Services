import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/defaultTextField.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controllerTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'مرحبا,',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'سمير سمير',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: Ink.image(
                        image: AssetImage('assets/images/profileman.jpg'),
                        fit: BoxFit.cover,
                        width: 50.0,
                        height: 50.0,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                defaultTextField(
                  hintText: 'ابحث عن عيادة , دكتور',
                  controller: controllerTextField,
                  validator: (s) {},
                  height: 50,
                  //edit
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 10,
                    height: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
