import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_services/components/defaultButton.dart';
import 'package:medical_services/components/searchWidget.dart';
import 'package:medical_services/settings/colors.dart';

import '../../components/sortWidget.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("اختيار طبيب"),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SearchWidget(controller: searchController),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [],
                                ));
                      },
                      child: const SortWidget(
                          text: 'التصفية', icon: Icons.filter_alt_outlined),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const SortWidget(text: 'الترتيب', icon: Icons.swap_vert),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 333.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                            // color: AppColors.backgroundCardColor,
                            color: AppColors.backgroundCardColor,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                          children: [
                            Container(
                              width: 85.w,
                              height: 180.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.r),
                                    bottomRight: Radius.circular(20.r),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "دكتورة سميرة سمور علي",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("اخصائية تغذية",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      height: 11.h,
                                      child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(width: 3);
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Icon(
                                            Icons.star,
                                            color: AppColors.yellowColor,
                                            size: 11,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text('بغداد - المنصور',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.attach_money_rounded,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text('الفحص 20 الف',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // const Spacer(),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60.w,
                                      height: 35.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.greenColor,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Text("متاح",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                    const Spacer(),
                                    defaultButton(
                                        text: 'احجز الان',
                                        onPressed: () {},
                                        width: 70,
                                        height: 40,
                                        fontSize: 14)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
