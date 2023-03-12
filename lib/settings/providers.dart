import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/auth_provider.dart';
import '../providers/doctors_provider.dart';
import '../providers/alldoctorsSP.dart';
import '../providers/home_provider.dart';
import '../providers/sr_edit_profileDoctor_provider.dart';
import '../providers/upload_image_provider.dart';

class Providers {
  static List<SingleChildWidget> providersList = [
    ChangeNotifierProvider(create: (_) => UploadImageProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => DoctorsProvider()),
    ChangeNotifierProvider(create: (_) => SrEditDoctorProfileProvider()),
    ChangeNotifierProvider(create: (_) => GetallDoctorsSPProvider()),
  ];
}

//! byyyyyyyyy noor