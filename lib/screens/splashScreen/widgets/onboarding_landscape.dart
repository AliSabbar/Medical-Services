import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/splashScreen/widgets/navigateAndSaveFunc.dart';
import 'package:medical_services/screens/splashScreen/widgets/RPSCustomPainter.dart';

import '../../../settings/colors.dart';

class OnBoardingLandscape extends StatelessWidget {
  const OnBoardingLandscape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          bottom: -1,
          child: CustomPaint(
            size: Size(widthMQ, heightMQ * 0.5),
            painter: RPSCustomPainter(),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'اهلا بك في ',
                          ),
                          const TextSpan(
                            text: 'تطبيق ',
                          ),
                          TextSpan(
                              text: 'عافيتك',
                              style: TextStyle(color: AppColors.primaryColor)),
                        ],
                      ),
                    ),
                    widthMQ >= 1024
                        ? const SizedBox(
                            height: 20,
                          )
                        : const SizedBox(height: 0,),
                    Text(
                      'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: widthMQ >= 1024 ? 25 : 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            widthMQ >= 1024
                ? Container(
                    margin: const EdgeInsets.only(top: 200),
                    child: SvgPicture.asset(
                      "assets/images/doctorOnBoarding.svg",
                      width: 500,
                    ),
                  )
                : SvgPicture.asset(
                    "assets/images/doctorOnBoarding.svg",
                  )
          ],
        ),
        widthMQ >= 1024
            ? Positioned(
                bottom: -1,
                top: 500,
                left: 50,
                child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        await navigateAndSave(context: context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.white,
                      ),
                    )),
              )
            : Positioned(
                bottom: -1,
                left: 20,
                top: 250,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
      ],
    );
  }
}
