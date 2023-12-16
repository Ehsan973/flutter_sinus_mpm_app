
class AuthModel {
  String? token;
  Record? record;

  AuthModel({this.token, this.record});

  AuthModel.fromJson(Map<String, dynamic> json) {
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["record"] is Map) {
      record = json["record"] == null ? null : Record.fromJson(json["record"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    if(record != null) {
      _data["record"] = record?.toJson();
    }
    return _data;
  }
}

class Record {
  String? id;
  String? collectionId;
  String? collectionName;
  String? username;
  bool? verified;
  bool? emailVisibility;
  String? email;
  String? created;
  String? updated;
  String? name;
  String? avatar;
  String? website;

  Record({this.id, this.collectionId, this.collectionName, this.username, this.verified, this.emailVisibility, this.email, this.created, this.updated, this.name, this.avatar, this.website});

  Record.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["collectionId"] is String) {
      collectionId = json["collectionId"];
    }
    if(json["collectionName"] is String) {
      collectionName = json["collectionName"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["verified"] is bool) {
      verified = json["verified"];
    }
    if(json["emailVisibility"] is bool) {
      emailVisibility = json["emailVisibility"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["created"] is String) {
      created = json["created"];
    }
    if(json["updated"] is String) {
      updated = json["updated"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if(json["website"] is String) {
      website = json["website"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["collectionId"] = collectionId;
    _data["collectionName"] = collectionName;
    _data["username"] = username;
    _data["verified"] = verified;
    _data["emailVisibility"] = emailVisibility;
    _data["email"] = email;
    _data["created"] = created;
    _data["updated"] = updated;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["website"] = website;
    return _data;
  }
}