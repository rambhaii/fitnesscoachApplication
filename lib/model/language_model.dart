import 'package:alpersonalcoachingapp/utils/appimage.dart';

class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;
  final String flagImage;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
    this.flagImage,
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      // LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("Hi! I'am CoachbyApp ", "English", 'en',
          AppImages.englishflag), // english
      LanguageModel("Hej, jag är CoachbyApp", "svenska", 'sv',
          AppImages.sewdenflag), //swedish
    ];
  }
}
