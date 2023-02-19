import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/screens/splashScreen/widgets/RPSCustomPainter.dart';

import '../../../settings/colors.dart';
import 'navigateAndSaveFunc.dart';

class OnBoardingPortrait extends StatelessWidget {
  const OnBoardingPortrait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Column(
      children: [
         SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: widthMQ >= 768 ? 50 : 32.sp,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'اهلا بك في \n',
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
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: widthMQ >= 768 ? 24 : 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(widthMQ, heightMQ * 0.5),
                painter: RPSCustomPainter(),
              ),
              SvgPicture.asset(
                "assets/images/doctorOnBoarding.svg",
                height: widthMQ >= 768 ? widthMQ : null,
              ),
              Positioned(
                bottom: -1,
                top: 250,
                left: 20,
                child: CircleAvatar(
                    radius: 40.r,
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
