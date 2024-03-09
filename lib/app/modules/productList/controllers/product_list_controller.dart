/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-07 16:52:11
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-10 04:40:13
 * @FilePath: \flutter3_getx_shop\lib\app\modules\productList\controllers\product_list_controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:get/get.dart';
import '../../../models/plist_model.dart';
import '../../../units/httpsClient.dart';

class ProductListController extends GetxController {
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;
  HttpsClient httpsClient = HttpsClient();
  RxInt page = 1.obs;
  int pageSize = 8;

  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    getPlistData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getPlistData() async {
    var response = await httpsClient.get(
        "api/plist?cid=${Get.arguments["cid"]}&page=${page.value}&pageSize=$pageSize");
    if (response != null) {
      var plistTemp = PlistModel.fromJson(response.data);
      plist.value = plistTemp.result!;
      update();
    }
  }
}
