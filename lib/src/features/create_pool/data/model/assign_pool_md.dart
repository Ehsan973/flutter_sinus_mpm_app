
class AssignPoolMd {
  String? userId;
  String? transactionId;
  int? amount;
  String? status;

  AssignPoolMd({this.userId, this.transactionId, this.amount, this.status});

  AssignPoolMd.fromJson(Map<String, dynamic> json) {
    if(json["user_id"] is String) {
      userId = json["user_id"];
    }
    if(json["transaction_id"] is String) {
      transactionId = json["transaction_id"];
    }
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["transaction_id"] = transactionId;
    _data["amount"] = amount;
    _data["status"] = status;
    return _data;
  }
}