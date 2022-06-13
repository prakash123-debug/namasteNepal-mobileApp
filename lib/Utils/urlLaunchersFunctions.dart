import 'package:url_launcher/url_launcher.dart';

class UrlLunchersFunctions {
  void openWeb(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> sendMail(String mailId) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mailId,
    );

    await launchUrl(emailLaunchUri);
  }

  Future<void> launchInBrowser(String url) async {
    Uri link = Uri.parse(url);
    if (!await launchUrl(
      link,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
