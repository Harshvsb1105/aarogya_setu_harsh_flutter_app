import 'package:aarogya_setu_harsh_flutter_app/Screens/AppPermissionsPage.dart';
import 'package:aarogya_setu_harsh_flutter_app/Screens/SelectLanguage.dart';
import 'package:aarogya_setu_harsh_flutter_app/Widgets/AvatarCircle.dart';
import 'package:aarogya_setu_harsh_flutter_app/Widgets/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _currentPageNotifier = ValueNotifier<int>(0);
    return Scaffold(
      backgroundColor: Color(0xfff9e9e9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff9e9e9),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.g_translate),
                color: Color(0xFF232b2b),
                iconSize: 25.0,
                onPressed: (){
                  return Navigator.push(context, MaterialPageRoute(builder: (_) => SelectLanguage()));
                },
              ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoCard(text: "infoText1".tr().toString()
            // 'Each one of us have the power to help\n'
            //     ' prevent the spread of Coronavirus\n'
            //     ' Pandemic in India',
            ),
            AvatarCircle(),
            InfoCard(text: "infoText2".tr().toString()
            // 'Would you like to be kept informed if you\n'
            //     'have crossed paths with someone wo has\n'
            //     'tested COVID-19 positive',
            ),
            Column(
              children: [
                CirclePageIndicator(
                  dotColor: Colors.white,
                  borderColor: Color(0xff383840),
                  borderWidth: 2,
                  selectedBorderColor: Color(0xff383840),
                  selectedDotColor: Color(0xff383840),
                  itemCount: 4,
                  currentPageNotifier: _currentPageNotifier,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                  ),
                  color: Color(0xff383840),
                  onPressed: (){
                    return Navigator.push(context, MaterialPageRoute(builder: (_) => AppPermissionPage()));
                  },
                  child: Text('Next'.tr().toString(),style: TextStyle(
                    color: Colors.white,
                  ),),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
