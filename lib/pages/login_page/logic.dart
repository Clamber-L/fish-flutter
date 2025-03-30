import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    codeController.dispose();
    super.onClose();
  }

  void toggleAgreeProtocol() {
    state.isAgreeProtocol.value = !state.isAgreeProtocol.value;
  }

  void showUserAgreement() {
    // 打开用户协议页面
    // Get.toNamed(RouteNames.userAgreement);
  }

  void showPrivacyPolicy() {
    // 打开隐私政策页面
    // Get.toNamed(RouteNames.privacyPolicy);
  }

  void getVerificationCode() {
    state.isCountingDown = true;
    // 模拟倒计时
    Future.delayed(Duration(seconds: 1), () {
      if (state.countdown > 1) {
        state.countdown--;
        getVerificationCode();
      } else {
        state.isCountingDown = false;
        state.countdown = 60;
      }
    });
    update();
  }

  // 修改登录方法添加协议校验
  void loginWithPhone() {
    String phone = phoneController.text;
    String code = codeController.text;
    if (!state.isAgreeProtocol.value) {
      Get.snackbar('提示', '请先同意用户协议和隐私政策');
      return;
    }
    // 实现手机号登录逻辑
    Get.offNamed(RouteNames.mainTabView);
  }

  void loginWithWeChat() {
    // 实现微信登录逻辑
  }
}
