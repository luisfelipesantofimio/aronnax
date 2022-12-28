//Global versioning information
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String globalVersion = "0.0.1";
String compilationDate = "12/06/2022";

//Device media queries
Size deviceSize = WidgetsBinding.instance.window.physicalSize;
final deviceHeight = StateProvider<double>(
  (ref) => deviceSize.height,
);
final deviceWidth = StateProvider<double>(
  (ref) => deviceSize.width,
);
