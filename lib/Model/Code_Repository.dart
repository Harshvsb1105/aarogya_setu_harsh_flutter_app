// import 'package:aarogya_setu_harsh_flutter_app/Model/Model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class CodeRepository implements ModelRepository{
//
//
//   @override
//   Future<Model> fetchCode() async {
//
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
//       this.verificationId = verId;
//     };
//     final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
//       this.verificationId = verId;
//       smsCodeDialogue(context).then((value){
//         print("Code Sent");
//       });
//     };
//     final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
//     final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e){
//       print('${e.message}');
//     };
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       timeout: const Duration(seconds: 15),
//       verificationCompleted : verifiedSuccess,
//       verificationFailed: verifyFailed,
//       codeSent: smsCodeSent,
//       codeAutoRetrievalTimeout: autoRetrieve,
//
//     );
//   }
//
// }