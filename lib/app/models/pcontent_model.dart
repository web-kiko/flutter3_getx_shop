class PcontentModel {
  PcontentItemModel? result;

  PcontentModel({this.result});

  PcontentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? PcontentItemModel?.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class PcontentItemModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  int? status;
  String? pic;
  String? content;
  String? specs;  
  String? cname;
  List<PcontentAttrModel>? attr;
  String? subTitle;
  int? salecount;

  PcontentItemModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.status,
      this.pic,
      this.content,
      this.specs,
      this.cname,
      this.attr,
      this.subTitle,
      this.salecount});

  PcontentItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    specs = json['specs'];    
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = <PcontentAttrModel>[];
      json['attr'].forEach((v) {
        attr?.add(PcontentAttrModel.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['specs'] = specs;
    data['cname'] = cname;
    if (attr != null) {
      data['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    data['sub_title'] = subTitle;
    data['salecount'] = salecount;
    return data;
  }
}

class PcontentAttrModel {
  String? cate;
  List<String>? list;
  List<Map>? attrList;  //新增
  PcontentAttrModel({this.cate, this.list});

  PcontentAttrModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list'].cast<String>();
    attrList=[];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    return data;
  }
}