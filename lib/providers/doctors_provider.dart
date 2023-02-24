import 'package:flutter/material.dart';

class DoctorsProvider extends ChangeNotifier {
  int? sort;
  int? filleter;
  changeSortValue({
    required value,
  }) {
    sort = value;
    notifyListeners();
  }

  changeFilleterValue({required value}) {
    filleter = value;
    notifyListeners();
  }
}
