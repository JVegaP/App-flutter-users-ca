import 'package:url_launcher/url_launcher.dart';

final utils = Utils();
class Utils {

  /// Open email
  openEmail() async {
    final url = 'mailto:magali.sierra@foonkiemonkey.co.uk?subject=${Uri.encodeFull("I want a quote")}&body=${Uri.encodeFull("I need you to build an application.")}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}