class ProfileModel {
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
  int? balance;

  ProfileModel(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.username,
      this.verified,
      this.emailVisibility,
      this.email,
      this.created,
      this.updated,
      this.name,
      this.avatar,
      this.balance});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    username = json['username'];
    verified = json['verified'];
    emailVisibility = json['emailVisibility'];
    email = json['email'];
    created = json['created'];
    updated = json['updated'];
    name = json['name'];
    avatar = json['avatar'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['username'] = username;
    data['verified'] = verified;
    data['emailVisibility'] = emailVisibility;
    data['email'] = email;
    data['created'] = created;
    data['updated'] = updated;
    data['name'] = name;
    data['avatar'] = avatar;
    data['balance'] = balance;
    return data;
  }
}
