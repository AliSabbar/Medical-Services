import 'package:url_launcher/url_launcher.dart';

class UrlLunch {
  // ! PHONE CALL
  static makeCall({required String phoneNumber}) async {
    var launch = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launch);
  }
}
