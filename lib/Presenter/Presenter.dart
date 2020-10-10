//
//
//
// import 'package:aarogya_setu_harsh_flutter_app/Model/Model.dart';
// import 'package:aarogya_setu_harsh_flutter_app/Widgets/ModalBottomSheet.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Presenter {
//
//   Model model = Model();
//   ModalBottomSheet _modalBottomSheet;
//
//   Future<void> verifyPhone() async{
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
//       this.model.verificationId = verId;
//     };
//     final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
//       this.model.verificationId = verId;
//       _modalBottomSheet.smsCodeDialogue(context).then((value){
//         print("Code Sent");
//       });
//     };
//     final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
//     final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e){
//       print('${e.message}');
//     };
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: model.phoneNo,
//       timeout: const Duration(seconds: 15),
//       verificationCompleted : verifiedSuccess,
//       verificationFailed: verifyFailed,
//       codeSent: smsCodeSent,
//       codeAutoRetrievalTimeout: autoRetrieve,
//
//     );
//   }
//
//   // Future<bool> smsCodeDialogue(BuildContext context){
//   //   return showDialog(context: context,
//   //       barrierDismissible: false,
//   //       builder: (BuildContext context){
//   //         return new AlertDialog(
//   //           title: Text('Enter OTP'),
//   //           content: TextField(
//   //             onChanged: (value){
//   //               this.viewModel.smssent = value;
//   //             },
//   //             keyboardType: TextInputType.number,
//   //           ),
//   //           contentPadding: EdgeInsets.all(10.0),
//   //           actions: <Widget>[
//   //             FlatButton(
//   //               onPressed: (){
//   //                 final user = FirebaseAuth.instance.currentUser;
//   //                 if(user != null){
//   //                   Navigator.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(
//   //                         builder: (context)=> WelcomeScreen()),
//   //                   );
//   //                 }
//   //                 else{
//   //                   Navigator.of(context).pop();
//   //                   signIn(viewModel.smssent);
//   //                 }
//   //               },
//   //               child: Center(
//   //                 child: Text('Verify',
//   //                   style:TextStyle(color: Colors.black) ,),
//   //               ),
//   //             ),
//   //           ],
//   //
//   //         );
//   //       }
//   //   );
//   // }
//
//   Future<void> signIn(String smsCode) async{
//     // ignore: deprecated_member_use
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: model.verificationId,
//       smsCode: smsCode,);
//
//     await FirebaseAuth.instance.signInWithCredential(
//         credential).then((user) {
//       Navigator.push(context, MaterialPageRoute(
//         builder: (context) => ModalBottomSheet(),),
//       );
//     }).catchError((e){
//       print(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }