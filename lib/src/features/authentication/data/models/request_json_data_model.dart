class RequestJsonDataModel {
  String username;
  String password;
  String? passwordConfirm;
  RequestJsonDataModel(this.username, this.password, {this.passwordConfirm});
}
