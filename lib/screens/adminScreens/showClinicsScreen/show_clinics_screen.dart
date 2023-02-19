import 'package:flutter/material.dart';
import 'package:medical_services/screens/adminScreens/widgets/showUsers.dart';

class ShowClinicsScreen extends StatelessWidget {
  const ShowClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowUsers(myList: [], title: 'عرض العيادات',);
  }
}
