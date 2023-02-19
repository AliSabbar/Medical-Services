import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/showUsers.dart';

class ShowDoctorsScreen extends StatelessWidget {
  const ShowDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowUsers(myList: [],title: "عرض الاطباء",);
  }
}
