import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_services/components/appointmentMessage.dart';
import 'package:medical_services/settings/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تأكيد الحجز'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 319.w,
                height: 319.h,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: QrImage(
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              const AppointmentMessage(
                text:
                    "تم الحجز عند دكتور سمير يرجى تأكيد الحجز عند الوصول الى العيادة عن طريق مسح الشكل الظاهر اعلاه",
              ),
              const Spacer(),
              Container(
                width: 300.w,
                height: 50.h,
                padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(0x20FFCC00),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/warning.svg'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        "في حال فقدانك لل QR CODE يمكنك ان تجده في صفحة حجوزاتي",
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.greyColor,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
