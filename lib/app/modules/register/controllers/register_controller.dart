import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/data/providers/user_provider.dart';
import 'package:tonton/app/services/auth_service.dart';

import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  final user = Rx<User>(User());
  final formKey = GlobalKey<FormState>();

  final _userProvider = Get.find<UserProvider>();
  final _authService = Get.find<AuthService>();

  final passwordVisibleState = false.obs;

  bool get isHidePassword => passwordVisibleState.isFalse;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onUsernameChanged(String value) {
    user.value.username = value;
  }

  void onEmailChanged(String value) {
    user.value.email = value;
  }

  void onPasswordChanged(String value) {
    user.value.password = value;
  }

  String? usernameValidator(String? value) {
    if (value == null) return 'Username is required';
    if (value.isEmpty) return 'Username is required';
    if (GetUtils.isLengthLessThan(value, 1)) return 'Username is required';

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null) return 'Email is required';
    if (value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Email not valid';

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null) return 'Password is required';
    if (value.isEmpty) return 'Password is required';
    if (GetUtils.isLengthLessThan(value, 6)) {
      return 'Password must more than 6 character';
    }

    return null;
  }

  Future<void> onSubmit() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null) return;
    if (!isValid) return;

    try {
      // print(user.value.toJson());
      final token = await _userProvider.addUser(user.value);
      if (token == null) throw 'Server error';
      _authService.saveToken(token);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Unable to register', e.toString());
    }
  }

  void toggleShowPassword() {
    passwordVisibleState.value = !passwordVisibleState.value;
  }
}
