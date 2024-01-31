import 'package:ecommerce/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';

void main() {
  ServicesLocator().init();

  runApp(const HomeScreen());
}
