class Model {

  String phoneNo, smssent, verificationId;

  Model({this.phoneNo,this.verificationId,this.smssent});
}
 abstract class ModelRepository{
  Future<Model> fetchCode();
 }

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}