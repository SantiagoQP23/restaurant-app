import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { success, error }

abstract class ToastService {
  void show(String message, ToastType type);

  void showSuccess(String message);

  void showError(String message);

  void showCustom(String message, Color backgroundColor, Color textColor);

  void showDefault(String message);
}
