import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sheen_ai_application/utils/env.dart';
import 'package:sheen_ai_application/views/pages/home/index.dart';

Future<void> main() async {
  //await Env.init();
  // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 139, 171, 227)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
