/*
 * @ Author: kiko
 * @ Create Time: 2024-03-04 11:57:43
 * @ Modified by: kiko
 * @ Modified time: 2024-04-02 22:46:32
 * @ Description:
 */



import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../units/screenAdapter.dart';
import '../../../widget/passButton.dart';
import '../controllers/user_controller.dart';
import '../../../units/myFonts.dart';


class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("会员码"),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.qr_code_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.message_outlined)),
            ],
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(28)),
        children: [
          //用户头像 登录注册
          Obx(()=>
          controller.isLogin.value?
          SizedBox(
            child: Row(
              children: [
                SizedBox(width: ScreenAdapter.width(40)),
                SizedBox(
                  height: ScreenAdapter.height(150),
                  width: ScreenAdapter.height(150),
                  child: CircleAvatar(
                    radius: ScreenAdapter.width(75),
                    backgroundImage: const AssetImage("assets/images/user.png"),
                  ),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${controller.userInfo.value.username}",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(46))),
                    SizedBox(height: ScreenAdapter.height(20)),
                      Text("普通会员",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(46)))
                  ],
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: ScreenAdapter.fontSize(34),
                  color: Colors.black54,
                )
              ],
            ),
          ):SizedBox(
            child: Row(
              children: [
                SizedBox(width: ScreenAdapter.width(40)),
                SizedBox(
                  height: ScreenAdapter.height(150),
                  width: ScreenAdapter.height(150),
                  child: CircleAvatar(
                    radius: ScreenAdapter.width(75),
                    backgroundImage: const AssetImage("assets/images/user.png"),
                  ),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                InkWell(
                  onTap: (){
                    Get.toNamed("/code-login-step-one");
                  },
                  child: Text("登录/注册",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(46))),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: ScreenAdapter.fontSize(34),
                  color: Colors.black54,
                )
              ],
            ),
          ))
          ,
          // 用户资金信息
          Obx(()=>controller.isLogin.value==true?Container(
            height: ScreenAdapter.height(160),
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            child: Row(
              children: [
               
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.userInfo.value.gold}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(52),
                              ),
                        ),
                        Text("米金",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45)),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.userInfo.value.coupon}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(52)
                              ),
                        ),
                        Text("优惠券",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${controller.userInfo.value.redPacket}",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(52)
                               )),
                        Text("红包",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${controller.userInfo.value.quota}",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(52)
                                )),
                        Text("最高额度",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.bookmarks_outlined),
                        Text("钱包",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    ))
              ],
            ),
          ):Container(
            height: ScreenAdapter.height(160),
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            child: Row(
              children: [
               
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(34),
                              ),
                        ),
                        Text("米金",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45)),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(34)
                              ),
                        ),
                        Text("优惠券",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("-",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34)
                               )),
                        Text("红包",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("-",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34)
                                )),
                        Text("最高额度",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.bookmarks_outlined),
                        Text("钱包",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                color: Colors.black45))
                      ],
                    ))
              ],
            ),
          )),
          //广告
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: ScreenAdapter.height(60)),
            child: Container(
              width: ScreenAdapter.width(1008),
              height: ScreenAdapter.height(400),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/user_ad1.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
            ),
          ),
          //订单
          Container(
            margin: EdgeInsets.only(
              top: ScreenAdapter.height(50),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
            child: Column(
              children: [
                Container(
                  height: ScreenAdapter.height(100),
                  margin: EdgeInsets.only(
                      top: ScreenAdapter.height(20),
                      bottom: ScreenAdapter.height(20)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text("收藏",style: TextStyle(color: Colors.black54),),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                              left: BorderSide(
                                  width: ScreenAdapter.width(2),
                                  color: Colors.black12),
                              right: BorderSide(
                                  width: ScreenAdapter.width(2),
                                  color: Colors.black12),
                            )),
                            child: const Text("足迹",style: TextStyle(color: Colors.black54)),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text("关注",style: TextStyle(color: Colors.black54)),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenAdapter.width(20),
                      right: ScreenAdapter.width(20)),
                  child: Divider(
                    height: ScreenAdapter.height(2),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: ScreenAdapter.height(40),
                      bottom: ScreenAdapter.height(40)),
                  height: ScreenAdapter.height(240),
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bookmarks_outlined, color: Colors.black87),
                              Text("待付款",style: TextStyle(
                                  color: Colors.black87
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.car_crash,  color: Colors.black87),
                              Text("待收货",style: TextStyle(
                                  color: Colors.black87
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.question_answer_outlined,color: Colors.black87,),
                              Text("待评价",style: TextStyle(
                                color: Colors.black87
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.design_services_outlined,color: Colors.black87),
                              Text("退换/售后",style: TextStyle(
                                color: Colors.black87
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.copy_all_rounded,color: Colors.black87),
                              Text("全部订单",style: TextStyle(
                                color: Colors.black87
                              ))
                            ],
                          )),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
          //服务
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(28)),
                      child: Text("服务",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.fontSize(44),
                              fontWeight: FontWeight.bold)),
                    ),
                    const Text(
                      "更多 > ",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                GridView.count(
                  shrinkWrap: true, //收缩
                  physics: const NeverScrollableScrollPhysics() ,    //禁止滑动                
                  crossAxisCount: 4,
                  childAspectRatio: 1.253,
                  children: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          MyFonts.anzhuangyewu,
                          color: Colors.blue,
                        ),
                        Text("一键安装")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(MyFonts.anzhuangyewu, color: Colors.orange),
                        Text("一键退换")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(MyFonts.weixiu, color: Colors.purple),
                        Text("一键维修")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(MyFonts.schedule, color: Colors.orange),
                        Text("服务进度")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          MyFonts.xiaomi,
                          color: Colors.orange,
                        ),
                        Text("小米之家")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(MyFonts.kefu,color: Colors.orange,), Text("客服中心")],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(MyFonts.duihuan, color: Colors.green),
                        Text("以旧换新")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(MyFonts.chongdian, color: Colors.green),
                        Text("手机电池")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          //广告
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            child: Container(
              width: ScreenAdapter.width(1008),
              height: ScreenAdapter.height(300),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/user_ad2.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
            ),
          ),
           PassButton(
              text: "退出登录",onPressed: (){
                controller.loginOut();
              },)
        ],
      ),
    );
  }
}
