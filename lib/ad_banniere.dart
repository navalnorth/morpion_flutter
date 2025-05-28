import 'dart:io';

class AdHelper {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3096583905494889/1300998980';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3096583905494889/1300998980';
    }
    return null;
  }
}
