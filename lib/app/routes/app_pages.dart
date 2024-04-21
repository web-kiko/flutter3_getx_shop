import 'package:get/get.dart';

import '../modules/address/addressAdd/bindings/address_add_binding.dart';
import '../modules/address/addressAdd/views/address_add_view.dart';
import '../modules/address/addressEdit/bindings/address_edit_binding.dart';
import '../modules/address/addressEdit/views/address_edit_view.dart';
import '../modules/address/addressList/bindings/address_list_binding.dart';
import '../modules/address/addressList/views/address_list_view.dart';
import '../modules/buy/bindings/buy_binding.dart';
import '../modules/buy/views/buy_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';

import '../modules/login/codeLoginStepOne/bindings/code_login_step_one_binding.dart';
import '../modules/login/codeLoginStepOne/views/code_login_step_one_view.dart';
import '../modules/login/codeLoginStepTwo/bindings/code_login_step_two_binding.dart';
import '../modules/login/codeLoginStepTwo/views/code_login_step_two_view.dart';
import '../modules/login/onStepLogin/bindings/on_step_login_binding.dart';
import '../modules/login/onStepLogin/views/on_step_login_view.dart';
import '../modules/login/passLogin/bindings/pass_login_binding.dart';
import '../modules/login/passLogin/views/pass_login_view.dart';
import '../modules/login/registerStepOne/bindings/register_step_one_binding.dart';
import '../modules/login/registerStepOne/views/register_step_one_view.dart';
import '../modules/login/registerStepThree/bindings/register_step_three_binding.dart';
import '../modules/login/registerStepThree/views/register_step_three_view.dart';
import '../modules/login/registerStepTwo/bindings/register_step_two_binding.dart';
import '../modules/login/registerStepTwo/views/register_step_two_view.dart';
import '../modules/productContent/bindings/product_content_binding.dart';
import '../modules/productContent/views/product_content_view.dart';
import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/serach/bindings/serach_binding.dart';
import '../modules/serach/views/serach_view.dart';
import '../modules/service/jiPush/bindings/ji_push_binding.dart';
import '../modules/service/jiPush/views/ji_push_view.dart';
import '../modules/service/lanya/bindings/lanya_binding.dart';
import '../modules/service/lanya/views/lanya_view.dart';
import '../modules/service/live/bindings/live_binding.dart';
import '../modules/service/live/views/live_view.dart';
import '../modules/service/watch/bindings/watch_binding.dart';
import '../modules/service/watch/views/watch_view.dart';
import '../modules/service/wift/bindings/wift_binding.dart';
import '../modules/service/wift/views/wift_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 10:54:07
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-02-21 12:04:40
 */

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      //淡入淡出的动画
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
      name: _Paths.SERACH,
      page: () => const SerachView(),
      binding: SerachBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CONTENT,
      page: () => const ProductContentView(),
      binding: ProductContentBinding(),
    ),
    GetPage(
      name: _Paths.Cart,
      page: () => CartView(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_ONE,
      page: () => const CodeLoginStepOneView(),
      binding: CodeLoginStepOneBinding(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_TWO,
      page: () => const CodeLoginStepTwoView(),
      binding: CodeLoginStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.ON_STEP_LOGIN,
      page: () => const OnStepLoginView(),
      binding: OnStepLoginBinding(),
    ),
    GetPage(
      name: _Paths.PASS_LOGIN,
      page: () => const PassLoginView(),
      binding: PassLoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_ONE,
      page: () => const RegisterStepOneView(),
      binding: RegisterStepOneBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_TWO,
      page: () => const RegisterStepTwoView(),
      binding: RegisterStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_THREE,
      page: () => const RegisterStepThreeView(),
      binding: RegisterStepThreeBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_ADD,
      page: () => const AddressAddView(),
      binding: AddressAddBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_LIST,
      page: () => const AddressListView(),
      binding: AddressListBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_EDIT,
      page: () => const AddressEditView(),
      binding: AddressEditBinding(),
    ),
    GetPage(
      name: _Paths.BUY,
      page: () => const BuyView(),
      binding: BuyBinding(),
    ),
   
    GetPage(
      name: _Paths.WATCH,
      page: () => const WatchView(),
      binding: WatchBinding(),
    ),
    GetPage(
      name: _Paths.JI_PUSH,
      page: () => const JiPushView(),
      binding: JiPushBinding(),
    ),
    GetPage(
      name: _Paths.LIVE,
      page: () => const LiveView(),
      binding: LiveBinding(),
    ),
   
    GetPage(
      name: _Paths.LANYA,
      page: () => const LanyaView(),
      binding: LanyaBinding(),
    ),
    GetPage(
      name: _Paths.WIFT,
      page: () => const WiftView(),
      binding: WiftBinding(),
    ),
  ];
}
