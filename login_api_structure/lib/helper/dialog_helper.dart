/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_api_structure/widget/constants.dart';

import 'db_helper.dart';


class DialogHelper {
  /// Show Loading
  static void showLoading() {
    Get.context?.loaderOverlay.show();
  }

  static void hideLoading() {
    Get.context?.loaderOverlay.hide();
  }

  /// Show Success Toast
  static showSuccessToast({required String? message}) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      Constants.appName,
      message,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      backgroundColor: Colors.green,
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      // titleText: const Text(
      //   AppString.appNameText,
      //   textAlign: TextAlign.start,
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w600,
      //     fontSize: 18.0,
      //   ),
      // ),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 600),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.poppins,
          fontSize: 16,
        ),
      ),
    );
  }

  /// Show Error Toast
  static showErrorToast({required String? message}) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      Constants.appName,

      // AppString.appNameText,
      */
/*backgroundGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          transform: GradientRotation(44),
          colors: <Color>[
            ,
            themeColor,
          ]),*//*

      message,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      */
/*icon: Image.asset(Assets.assetsLogo),*//*

      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      backgroundColor: Colors.red,
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      // titleText: const Text(
      //   AppString.appNameText,
      //   textAlign: TextAlign.start,
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w600,
      //     fontSize: 18.0,
      //   ),
      // ),
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.endToStart,
      animationDuration: const Duration(milliseconds: 600),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          // fontFamily: FontFamily.poppins,
          fontSize: 16,
        ),
      ),
    );
  }

  /// Hide the soft keyboard.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void startFirstScreen({String? message}) {
    DbHelper.eraseData();
    showErrorToast(message: message);
  }

  static void showOptionSheet(BuildContext context, List<Widget> items) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      builder: (context) {
        return SafeArea(
            child: ListView(
                shrinkWrap: true, padding: EdgeInsets.zero, children: items));
      },
    );
  }

  static void showActionDialog(
      String title, String content, GestureTapCallback onAction) {
    showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 30),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: AppText(
                  text: title,
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content,
                  textSize: 12,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                  lineHeight: 1.5,
                ),
                const SizedBox(height: 10),
                AppButton(
                  text: "Continue",
                  onTap: onAction,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                ),
                InkWell(
                    onTap: () => Get.back(),
                    child: const AppText(
                      text: "Close",
                      color: AppColor.themColor,
                      underlineColor: AppColor.themColor,
                      textSize: 16,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            ),
          );
        });
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
*/
