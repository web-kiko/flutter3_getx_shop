import 'package:get/get.dart';
import '../../../units/searchServices.dart';
import '../../../units/storage.dart';

class SerachController extends GetxController {
  //TODO: Implement SerachController、
  String keywords = "";
  RxList historyList = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//获取历史记录
  getHistoryData() async {
    var tempList = await SearchServices.getHistoryData();
    //如果不为空，则把数据赋值给它
    if (tempList.isNotEmpty) {
      historyList.addAll(tempList);
      update();
    }
  }

//删除全部历史记录
  clearHistoryData() async{
    await SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }


//长按删除单个历史记录
  removeHistoryData(keywords) async{
    var tempList=await SearchServices.getHistoryData();
    if(tempList.isNotEmpty){
       tempList.remove(keywords);
       await Storage.setData("searchList", tempList);
       //注意当前历史数据
       historyList.remove(keywords);
       update();
    }
  }
}
