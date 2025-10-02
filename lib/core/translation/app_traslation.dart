import 'package:get/get.dart';
import 'package:blue_flare/core/translation/langauage/ar_language.dart';
import 'package:blue_flare/core/translation/langauage/en_language.dart';
import 'package:blue_flare/core/translation/langauage/tr_langauge.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": ENLanguage.map,
        "ar_SA": ARLanguage.map,
        "tr_Tr": TRLanguage.map,
      };
}

tr(String key) => key.tr;
