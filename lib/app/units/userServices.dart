import "./storage.dart";

class UserServices {
  static Future<List> getUserInfo() async {
    List? userInfo = await Storage.getData("userinfo");
    if (userInfo != null) {
      return userInfo;
    } else {
      return [];
    }
  }
  static Future<bool> getUserLoginState() async{
    List userInfo = await getUserInfo();
    if (userInfo.isNotEmpty && userInfo[0]["username"] != "") {
      return true;
    } else {
      return false;
    }
  }

  static  loginOut() async{
    Storage.removeData("userinfo");
  }
}
