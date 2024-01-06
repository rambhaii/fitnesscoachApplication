import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/packageScreen/pckagescreenuicard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackageScreenActivity extends StatelessWidget {
  PackageScreenActivity({super.key});

  final data = ServiceWithHeader(APIURL.customerpackages).data();

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.package,
          ),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return NoDataFoundErrorScreens(
                    title:
                        '${Languages.of(context)!.package} are not available');
              } else if (snapshot.hasData) {
                print("kjdghgdkf    ${snapshot.data['data']}");
                List<dynamic> packageData = snapshot.data['data'];
                return ListView.builder(
                  itemCount: packageData.length,
                  itemBuilder: (context, index) {
                    final pdata = packageData[index];
                    return Padding(
                      padding: EdgeInsets.all(25.0),
                      child: PackagescreencardWidgetUI(
                        title: pdata['title'],
                        description: pdata['discription'],
                        features: pdata['services'],
                        price: pdata['perMonthPrice'].toString(),
                        showBadge: pdata['title'] == 'Premium' ? true : false,
                        iconColor: pdata['title'] == 'Basic'
                            ? Colors.grey
                            : pdata['title'] == 'Standard'
                                ? Colors.orange
                                : pdata['title'] == 'Premium'
                                    ? Colors.deepPurple
                                    : AppColors.primarycolor,
                        getPlan: () {},
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: LoaderScreennew(),
                );
              }
            }),
      );
    });
  }
}
