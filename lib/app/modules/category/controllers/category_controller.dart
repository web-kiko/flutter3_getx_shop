/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-04 11:57:43
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-06 17:04:07
 * @FilePath: \flutter3_getx_shop\lib\app\modules\category\controllers\category_controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:get/get.dart';
import '../../../models/category_model.dart';
// import 'package:dio/dio.dart';
import '../../../units/httpsClient.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  RxInt selectIndex = 0.obs;
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;
   HttpsClient httpsClient = HttpsClient();
  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index, id) {
    selectIndex.value = index;
    getRightCategoryData(id);
    update();
  }

//一级分类
  getLeftCategoryData() async {
    var response = await httpsClient.get("api/pcate");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      leftCategoryList.value = category.result!;
      getRightCategoryData(leftCategoryList[0].sId!);
      update();
    }
  }

//二级分类
  getRightCategoryData(String pid) async {
    var response = await httpsClient.get("api/pcate?pid=$pid");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      rightCategoryList.value = category.result!;
      update();
    }
  }
}
