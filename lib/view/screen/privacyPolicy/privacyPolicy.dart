import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../api/apphelper.dart';
import '../../../localization/Language/languages.dart';
import '../../../utils/appColors.dart';
import '../../../utils/appbarforall.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.privacypolicy,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Text(
                '${Languages.of(context)!.privacypolicy} for CoachByApp',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'At coachbyapp, accessible from http://coachbyapp-web.devshs.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by coachbyapp and how we use it. \n\n If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. \n\n This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in coachbyapp. This policy is not applicable to any information collected offline or via channels other than this website.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Consent',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Information we collect',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. \n\n If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.\n\nWhen you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'How we use your information',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'We use the information we collect in various ways, including to:\n * Provide, operate, and maintain our website\n * Improve, personalize, and expand our website\n * Understand and analyze how you use our website\n *Develop new products, services, features, and functionality\n * Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes \n* Send you emails \n* Find and prevent fraud',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Cookies and Web Beacons',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Like any other website, coachbyapp uses "cookies". These cookies are used to store information including visitors\' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users\' experience by customizing our web page content based on visitors\' browser type and/or other information.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Third Party Privacy Policies',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'coachbyapp\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\n\nYou can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Changes to This Privacy Policy',
                style: TextStyle(
                    color: AppHelper.themelight
                        ? AppColors.primarycolor
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
