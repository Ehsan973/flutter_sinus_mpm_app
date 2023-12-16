class PoolModel {
  String? creator;
  String? status;
  String? name;
  String? description;
  String? id;
  int? amount;
  PoolModel(
      {this.id,
      this.creator,
      this.status,
      this.name,
      this.description,
      this.amount});

  PoolModel.fromJson(Map<String, dynamic> json) {
    if (json["creator"] is String) {
      creator = json["creator"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json['id'] is String) {
      id = json['id'];
    }
    if(json['amount'] is int) {
     amount = json['amount']; 

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["creator"] = creator;
    _data["status"] = status;
    _data["name"] = name;
    _data["description"] = description;
    return _data;
  }
}
