import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/network/local/shared_helper.dart';
import 'package:medical_services/settings/colors.dart';

import '../../settings/routes_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            
            return OnBoardingPortrait(widthMQ: widthMQ, heightMQ: heightMQ);
          }

//*  landscape

          else {
            
            return OnBoardingLandscape(widthMQ: widthMQ, heightMQ: heightMQ);
          }
        }),
      ),
    );
  }
}

navigateAndSave({required context}) async {
  await SharedHelper.saveData(key: 'OnBoarding', value: "OnBoarding");
  //! change the route to LoginScreen 
  Navigator.pushNamed(context, Routes.homeScreenRoute);
}

//*  OnBoardingLandscape

class OnBoardingLandscape extends StatelessWidget {
  const OnBoardingLandscape({
    super.key,
    required this.widthMQ,
    required this.heightMQ,
  });

  final double widthMQ;
  final double heightMQ;

  @override
  Widget build(BuildContext context) {
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
                        : const Text(""),
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
                    )
                ),
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

//*  OnBoardingPortrait

class OnBoardingPortrait extends StatelessWidget {
  const OnBoardingPortrait({
    super.key,
    required this.widthMQ,
    required this.heightMQ,
  });

  final double widthMQ;
  final double heightMQ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
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
                        fontSize: widthMQ >= 768 ? 50 : 32,
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
                  fontSize: widthMQ >= 768 ? 24 : 15,
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
                    )
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0025641, size.height);
    path0.lineTo(0, size.height * 0.3213559);
    path0.quadraticBezierTo(size.width * 0.1535897, size.height * 0.1908475,
        size.width * 0.3600000, size.height * 0.3254237);
    path0.cubicTo(
        size.width * 0.5517949,
        size.height * 0.5684746,
        size.width * 0.5748718,
        size.height * 0.1786441,
        size.width * 0.7723077,
        size.height * 0.4027119);
    path0.quadraticBezierTo(size.width * 0.8030769, size.height * 0.2706780,
        size.width, size.height * 0.3355932);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * 0.0025641, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
