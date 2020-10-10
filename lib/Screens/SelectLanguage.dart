import 'package:aarogya_setu_harsh_flutter_app/Widgets/LanguageList.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'languageText1'.tr().toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LanguageList(),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                color: Color(0xff383840),
                onPressed: (){
                  return Navigator.pop(context);
                },
                child: Text('Next'.tr().toString(),style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
