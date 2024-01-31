import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/color_manager.dart';

showSuccessWarningToast({required String msg,bool success=true})=> Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor:success?ColorManager.primaryColor:ColorManager.warning,
    textColor: Colors.white,
    fontSize: 16.0);