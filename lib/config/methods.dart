import 'package:url_launcher/url_launcher.dart';

class Methods{



   static launchURL() async {
  const url = 'https://www.visionplus.com.pk/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}