class PlistModel {
  List<PlistItemModel>? result;

  PlistModel({this.result});

  PlistModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <PlistItemModel>[];
      json['result'].forEach((v) {
        result?.add(PlistItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlistItemModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  String? pic;
  String? subTitle;
  String? sPic;

  PlistItemModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.pic,
      this.subTitle,
      this.sPic});

  PlistItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['pic'] = pic;
    data['sub_title'] = subTitle;
    data['s_pic'] = sPic;
    return data;
  }
}
