
import 'package:aarogya_setu_harsh_flutter_app/Screens/WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {


  String phoneNo, smssent, verificationId;

  get verifiedSuccess => null;

  Future<void> verifyPhone() async{
    /// Typedef for handling automatic phone number timeout resolution.
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };
    /// Typedef for handling when Firebase sends a SMS code to the provided phone
    /// number.
    final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
      this.verificationId = verId;
      smsCodeDialogue(context).then((value){
        print("Code Sent");
      });
    };
    final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e){
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 15),
      verificationCompleted : verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,

    );
  }

  Future<bool> smsCodeDialogue(BuildContext context){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Enter OTP'),
            content: TextField(
              onChanged: (value){
                this.smssent = value;
              },
              keyboardType: TextInputType.number,
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  final user = FirebaseAuth.instance.currentUser;
                    if(user != null){
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> WelcomeScreen()),
                      );
                    }
                    else{
                      Navigator.of(context).pop();
                      signIn(smssent);
                    }
                },
                child: Center(
                  child: Text('Verify',
                    style:TextStyle(color: Colors.black) ,),
                ),
              ),
            ],
          );
        }
    );
  }

  Future<void> signIn(String smsCode) async{
    // ignore: deprecated_member_use
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,);

    await FirebaseAuth.instance.signInWithCredential(
        credential).then((user) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => WelcomeScreen(),),
      );
    }).catchError((e){
      print(e);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close,color: Color(0xff303030),size: 30,),
          onPressed: (){
            return Navigator.pop(context);
          },
        ),
        title: Center(child: Text('Enter Mobile Number', style: TextStyle(color: Color(0xff303030),fontSize: 17),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                autofocus: true,
                 decoration: InputDecoration(
                   prefixText: '+91',
                   labelText: 'Mobile Number',
                   border: new OutlineInputBorder(
                       borderSide: new BorderSide(color: Color(0xff3d81e4))
                   ),
                 ),
                keyboardType: TextInputType.number,
                onChanged: (value){
                  this.phoneNo = '+91$value';
                },
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Why is it needed?',style: TextStyle(color: Color(0xff3d81e4), fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 25,),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                color: Color(0xff303030),
                onPressed: verifyPhone,
                child: Text('Submit',style: TextStyle(
                  color: Colors.white
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
