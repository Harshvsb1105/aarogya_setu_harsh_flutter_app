// class Model {
//
//   String _phoneNo, _smssent, _verificationId;
//
//   Model(this._phoneNo,this._verificationId,this._smssent);
//
//   String get phoneNo => _phoneNo;
//   String get verificationId => _verificationId;
//   String get smssent => _smssent;
//
// }
//
//
//
//  abstract class ModelRepository{
//   Future<Model> fetchCode();
//  }
//
// class FetchDataException implements Exception {
//   final _message;
//
//   FetchDataException([this._message]);
//
//   String toString() {
//     if (_message == null) return "Exception";
//     return "Exception: $_message";
//   }
// }