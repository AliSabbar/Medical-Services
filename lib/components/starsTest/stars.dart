import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Stars extends StatelessWidget {
  Stars({Key? key, required this.countStar}) : super(key: key);
  int? countStar;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        countStar == 1
            ? SvgPicture.asset(
                'assets/icons/star.svg',
                width: 60,
                height: 13,
              )
            : countStar == 2
                ? Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        width: 60,
                        height: 13,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        width: 60,
                        height: 13,
                      )
                    ],
                  )
                : countStar == 3
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 60,
                            height: 13,
                          ),
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 60,
                            height: 13,
                          ),
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 60,
                            height: 13,
                          )
                        ],
                      )
                    : countStar == 4
                        ? Row(
                            children: [
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg')
                            ],
                          )
                        : countStar == 5
                            ? Row(
                                children: [
                                  SvgPicture.asset('assets/icons/star.svg'),
                                  SvgPicture.asset('assets/icons/star.svg'),
                                  SvgPicture.asset('assets/icons/star.svg'),
                                  SvgPicture.asset('assets/icons/star.svg'),
                                  SvgPicture.asset('assets/icons/star.svg')
                                ],
                              )
                            : SvgPicture.asset('assets/icons/star.svg'),
      ],
    );
  }
}
