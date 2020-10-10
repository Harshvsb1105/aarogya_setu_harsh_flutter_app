import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  List<String> selectLanguage = [
    'English',
    'Hindi'
  ];

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Column(
      children: [
        FlatButton(
            onPressed: (){
          setState(() {
            EasyLocalization.of(context).locale = Locale('en','US');
          });
        },
            child: Text(
              'English'
            ),
        ),
        Divider(),
        FlatButton(
          onPressed: (){
            setState(() {
              EasyLocalization.of(context).locale = Locale('hi','IN');
            });
          },
          child: Text(
              'हिंदी'
          ),
        ),
        Divider(),
      ]
    );
  }
}


// SizedBox(
// height: 200,
// child: ListView.builder(
// controller: scrollController,
// itemCount: selectLanguage.length,
// itemBuilder:(context, index) => ListTile(
// title: Center(
// child: Text(
// selectLanguage[index]
// ),
// ),
// onTap: (){
// setState(() {
// EasyLocalization.of(context).locale = Locale('hi','IN');
// });
// },
// ),
// ),
// ),