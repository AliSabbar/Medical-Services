import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/settings/colors.dart';

Widget patientCard() {
  return Container(
    width: 333.w,
    // height: 112.h,
    decoration: BoxDecoration(
      color: AppColors.containerColor,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      children: [
        Expanded(
          child: Container(
            width: 94.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    'https://tse4.mm.bing.net/th/id/OIP.pUWl3703PYVxOqnMe03sPwAAAA?w=205&h=207&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "سمير احمد حسين",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "07746140233",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 159.w,
                height: 38.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          )),
                      child: Text(
                        "2-17",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Text("الساعة 5:30 صباحا",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
