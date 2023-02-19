import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/showUsers.dart';

class ShowUsersScreen extends StatelessWidget {
  const ShowUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowUsers(
      myList: [],
      title: "عرض المستخدمين",
    );
  }
}
