import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = "https://miapp.itying.com/";
  static Dio dio = Dio();
  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
  }

 Future get(apiUrl) async {   
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }
  //加载网络图片
  static replaeUri(picUrl){
      String tempUrl=domain+picUrl;
      return tempUrl.replaceAll("\\", "/");
  }
}

