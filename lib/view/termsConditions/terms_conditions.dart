import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/appbarforall.dart';
import '../../api/apphelper.dart';
import '../../localization/Language/languages.dart';
import '../../utils/appColors.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.termsandcondition,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                Languages.of(context)!.termsandcondition,
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
                'Welcome to coachbyapp!\nThese terms and conditions outline the rules and regulations for the use of Coach By App\'s Website, located at http://coachbyapp-web.devshs.com. \n\n By accessing this website we assume you accept these terms and conditions. Do not continue to use coachbyapp if you do not agree to take all of the terms and conditions stated on this page.The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\'s needs in respect of provision of the Company\'s stated services, in accordance with and subject to, prevailing law of se. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Cookies',
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
                'We employ the use of cookies. By accessing coachbyapp, you agreed to use cookies in agreement with the Coach By App\'s Privacy Policy.\n  Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'License',
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
                'Unless otherwise stated, Coach By App and/or its licensors own the intellectual property rights for all material on coachbyapp. All intellectual property rights are reserved. You may access this from coachbyapp for your own personal use subjected to restrictions set in these terms and conditions. \n \n You must not:\n * Republish material from coachbyapp \n * Sell, rent or sub-license material from coachbyapp \n* Reproduce, duplicate or copy material from coachbyapp \n* Redistribute content from coachbyapp\n\n This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator. \n\n Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Coach By App does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Coach By App,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Coach By App shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\n\n Coach By App reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions. \n You warrant and represent that:\n\n* You are entitled to post the Comments on our website and have all necessary licenses and consents to do so; \n * The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party; \n * The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity. \n   You hereby grant Coach By App a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Disclaimer',
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
                'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will: \n * limit or exclude our or your liability for death or personal injury; \n * limit or exclude our or your liability for fraud or fraudulent misrepresentation;\n * limit any of our or your liabilities in any way that is not permitted under applicable law; or \n * exclude any of our or your liabilities that may not be excluded under applicable law. \n\nThe limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty. \n\n As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.',
                style: TextStyle(
                  color: AppHelper.themelight ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
