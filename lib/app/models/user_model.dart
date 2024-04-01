class UserModel {
  String? sId;
  String? username;
  String? tel;
  String? password;
  String? salt;
  int? gold;
  int? coupon;
  int? redPacket;
  int? quota;
  int? collect;
  int? footmark;
  int? follow;

  UserModel({
    this.sId,
    this.username,
    this.tel,
    this.password,
    this.salt,
    this.gold,
    this.coupon,
    this.redPacket,
    this.quota,
    this.collect,
    this.footmark,
    this.follow,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    tel = json['tel'];
    password = json['password'];
    salt = json['salt'];
    gold = json['gold'];
    coupon = json['coupon'];
    redPacket = json['redPacket'];
    quota = json['quota'];
    collect = json['collect'];
    footmark = json['footmark'];
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sId;
    _data['username'] = username;
    _data['tel'] = tel;
    _data['password'] = password;
    _data['salt'] = salt;
    _data['gold'] = gold;
    _data['coupon'] = coupon;
    _data['redPacket'] = redPacket;
    _data['quota'] = quota;
    _data['collect'] = collect;
    _data['footmark'] = footmark;
    _data['follow'] = follow;
    return _data;
  }
}
