import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final ResolveDependence getDependency = _GetX();

abstract class ResolveDependence {
  T get<T extends Object>(BuildContext context);
}

class _GetX implements ResolveDependence {
  @override
  T get<T extends Object>(BuildContext context) {
    return Get.find<T>();
  }
}
