import 'package:aarogya_setu_harsh_flutter_app/Widgets/InfoCard2.dart';
import 'package:aarogya_setu_harsh_flutter_app/Widgets/ModalBottomSheet.dart';
import 'package:aarogya_setu_harsh_flutter_app/Widgets/PermissionInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'SelectLanguage.dart';

class AppPermissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Permissions', style: TextStyle(color: Color(0xff303030)),),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share, color: Color(0xff303030)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.g_translate, color: Color(0xff303030)),
              onPressed: (){
                return Navigator.push(context, MaterialPageRoute(builder: (_) => SelectLanguage()));
              },),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              InfoCard2(
                image: Image.asset('images/ashok_chakra.jpg', width: 100,height: 100,),
                title: 'permission1'.tr().toString(),
                text: 'permission2'.tr().toString()
                // 'We understand the nature and sensitivity of\n'
                //     'this topic and have taken strong measures to\n'
                //     'ensure that your data is not compromised.',
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PermissionInfoCard(
                  title: 'permission3'.tr().toString(),
                  description: 'permission4'.tr().toString()
                  // "It is recommended that you set your location sharing to\n"
                  //     "'Always'. You can change this anytime later.",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PermissionInfoCard(
                  title: 'permission5'.tr(),
                  description: 'permission6'.tr().toString()
                  // "Monitors your devices's proximity to another mobile device.\n"
                  //     "It is recommended that you keep it on all times.",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PermissionInfoCard(
                  title: 'permission7'.tr().toString(),
                  description: 'permission8'.tr().toString()
                  // "Your Data will be shared ont with the Government of India.\n"
                  //     "The App does not allow your name and number to be\n"
                  //     "disclosed to the public at large at any time.",
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade700),
                    children: [
                      TextSpan(text: 'permission9'.tr().toString()
                  //     "If you would like to contribute to the safer India please\n"
                  // "indicate your acceptance of the "
                      ),
                      TextSpan(text: "permission10".tr().toString(), style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                      TextSpan(text: "permission11".tr().toString()),
                      TextSpan(text: "permission12".tr().toString(), style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                      TextSpan(text: "permission13".tr().toString()),
                    ],
                  ),
                  ),
              ),
              SizedBox(height: 110,),
              Divider(),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  color: Color(0xff383840),
                  onPressed: (){
                    showCustomBottomSheet(context: context, child: ModalBottomSheet());
                   // showModalBottomSheet(
                   //   backgroundColor: Colors.transparent,
                   //     context: context,
                   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   //     builder: (_) => Container(
                   //       height: 400,
                   //       color: Colors.white,
                   //     ),
                   // );
                  },
                  child: Text('permission14'.tr().toString(),style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showCustomBottomSheet({
  @required BuildContext context,
  @required Widget child,
  EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Padding(
      padding: padding,
      child: Container(
        height: 480,
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}