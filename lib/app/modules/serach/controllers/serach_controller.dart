import 'package:get/get.dart';
import '../../../units/searchServices.dart';

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
}
