import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_services/components/defaultTextField.dart';
import 'package:medical_services/components/specialtyContainer.dart';
import 'package:medical_services/screens/adminScreens/widgets/titleWidget.dart';

class ShowUsers extends StatefulWidget {
  ShowUsers({super.key, required this.myList,required this.title});

  List myList;
  String title;

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTitleWidget(text: 'ابحث عن مستخدم', context: context),
                    defaultTextField(
                        hintText: ' ادخل اسم المستخدم',
                        controller: searchController,
                        validator: (s) {}),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.myList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return specialtyContainer(
                        isAdmin: true,
                        title: widget.myList[index]['title'],
                        image: widget.myList[index]['image']);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
