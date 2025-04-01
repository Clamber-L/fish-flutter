import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 添加App Logo
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: viewInsets.bottom > 0 ? 0 : 100.h,
                      child: Center(
                        child: CircleAvatar(
                          radius: 45.r,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/img/app_logo.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Text(
                      '欢迎回来',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '使用手机号验证码登录',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 30.h),
                    // 手机号输入框
                    TextField(
                      controller: logic.phoneController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 16.sp), // 设置输入文字大小
                      decoration: InputDecoration(
                        labelText: '手机号码',
                        border: UnderlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 14.sp), // 设置标签文字大小
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // 验证码输入框
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: logic.codeController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16.sp), // 设置输入文字大小
                            decoration: InputDecoration(
                              labelText: '验证码',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16.h,
                              ), // 调整垂直间距
                              border: UnderlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                              ), // 设置标签文字大小
                            ),
                          ),
                        ),
                        SizedBox(width: 6.h),
                        GetBuilder<LoginLogic>(
                          builder: (logic) {
                            return GestureDetector(
                              onTap:
                                  state.isCountingDown
                                      ? null
                                      : logic.getVerificationCode,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        state.isCountingDown
                                            ? Colors.grey
                                            : Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  state.isCountingDown
                                      ? '${state.countdown}s后重新获取'
                                      : '获取验证码',
                                  style: TextStyle(
                                    color:
                                        state.isCountingDown
                                            ? Colors.grey
                                            : Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    // 在登录按钮上方添加协议确认
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Checkbox(
                            value: state.isAgreeProtocol.value,
                            onChanged: (value) => logic.toggleAgreeProtocol(),
                            activeColor: Colors.blueAccent,
                          ),
                        ),
                        Flexible(
                          // 使用Flexible防止溢出
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // 重要：避免占用全部宽度
                            children: [
                              Flexible(
                                child: Text(
                                  '我已阅读并同意',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => logic.showUserAgreement(),
                                child: Text(
                                  '《用户协议》',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Text(
                                '和',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => logic.showPrivacyPolicy(),
                                child: Text(
                                  '《隐私政策》',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // 登录按钮
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: logic.loginWithPhone,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text('登录', style: TextStyle(fontSize: 16.sp)),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 其他登录方式
                    Center(
                      child: Text(
                        '其他登录方式',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // 微信登录
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/img/wechat.png',
                              width: 48.h,
                              height: 48.h,
                            ),
                            onPressed: logic.loginWithWeChat,
                          ),
                          // SizedBox(height: 8.h),
                          // Text('微信登录', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
