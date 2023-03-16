import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/auth_provider.dart';
import '../providers/clinics_provider.dart';
import '../providers/doctor_provider.dart';
import '../providers/home_provider.dart';
import '../providers/sr_edit_profileDoctor_provider.dart';
import '../providers/upload_image_provider.dart';
import '../providers/userProfile_provider.dart';

class Providers {
  static List<SingleChildWidget> providersList = [
    ChangeNotifierProvider(create: (_) => UploadImageProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => SrEditDoctorProfileProvider()),
    ChangeNotifierProvider(create: (_) => DoctorProvider()),
    ChangeNotifierProvider(create: (_) => UserProfileProvider()),
    ChangeNotifierProvider(create: (_) => ClinicsProvider()),
        

  ];
}
