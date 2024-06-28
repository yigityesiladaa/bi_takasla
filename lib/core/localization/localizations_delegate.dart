import 'package:bitakasla/core/localization/languages/language_en.dart';
import 'package:bitakasla/core/localization/languages/language_tr.dart';
import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
      };
}
