import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/views/main_pages/Home.dart';

void main() {

  runApp( DevicePreview(enabled: true,builder: (context) =>  const NewsApp()));
}

class  NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
