import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/settings/colors.dart';

Widget specialtyContainer({
  required bool isAdmin,
  required String title,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: 350.w,
      height: 70.h,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image.toString()),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          if (isAdmin)
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 15.r,
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.cancel,
                    size: 25,
                    color: Colors.red,
                  ),
                ),
              ],
            )
        ],
      ),
    ),
  );
}
