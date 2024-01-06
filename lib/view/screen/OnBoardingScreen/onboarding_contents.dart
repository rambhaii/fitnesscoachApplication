import 'package:alpersonalcoachingapp/localization/Language/language_en.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: LanguageEn().welcomemessagefirst, //  Languages.of(context)!.next,
    image: AppImages.welcomescreenillimagefirst,
    desc:
        "Publish up your selfies to make yoursef \nmore beautiful with this app.",
  ),
  OnboardingContents(
    title: LanguageEn().welcomemessagese,
    image: AppImages.welcomescreenillimagesec,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: LanguageEn().welcomemessagethree,
    image: AppImages.welcomescreenillimagethree,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
