import 'package:flutter/material.dart';

import '../../../network/local/shared_helper.dart';
import '../../../settings/routes_manger.dart';

navigateAndSave({required context}) async {
  await SharedHelper.saveData(key: 'OnBoarding', value: "OnBoarding");
  //! change the route to LoginScreen
  Navigator.pushNamed(context, Routes.homeScreenRoute);
}
