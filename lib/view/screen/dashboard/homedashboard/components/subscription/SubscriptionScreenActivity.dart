import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/subscription/subscriptionwidgetui.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SubscriptionScreenActivity extends StatefulWidget {
  const SubscriptionScreenActivity({super.key});

  @override
  State<SubscriptionScreenActivity> createState() =>
      _SubscriptionScreenActivityState();
}

class _SubscriptionScreenActivityState
    extends State<SubscriptionScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: "Erbjudanden",
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return SubscriptionWidgetUI(
                        title: "Ga till erbjudande",
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
