/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-19 15:47:48
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-19 16:06:50
 * @FilePath: \flutter3_getx_shop\lib\app\units\searchServices.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'storage.dart';

class SearchServices {
  //保存历史搜索记录
  static setHistoryData(keywords) async {
    /*
          1、获取本地存储里面的数据  (searchList)
          2、判断本地存储是否有数据
              2.1、如果有数据 
                    1、读取本地存储的数据
                    2、判断本地存储中有没有当前数据，
                        如果有不做操作、
                        如果没有当前数据,本地存储的数据和当前数据拼接后重新写入           
              2.2、如果没有数据
                    直接把当前数据放在数组中写入到本地存储     
      
      */

    List? searchListData = await Storage.getData("searchList");
    if (searchListData != null) {
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        await Storage.setData("searchList", searchListData);
      }
    } else {
      List tempList = [];
      tempList.add(keywords);
      await Storage.setData("searchList", tempList);
    }
  }

  //获取历史搜索记录
  static Future<List> getHistoryData() async {
    List? searchListData = await Storage.getData("searchList");
    if (searchListData != null) {
      return searchListData;
    } else {
      return [];
    }
  }

  //删除搜索记录
  static deleteHistoryData(keywords) async {
    List? searchListData = await Storage.getData("searchList");
    if (searchListData != null) {
      searchListData.remove(keywords);
      await Storage.setData("searchList", searchListData);
    }
  }

  //清空搜索记录
  static clearHistoryData() async {
     await Storage.clear('searchList');
  }
}
