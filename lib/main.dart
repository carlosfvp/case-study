import 'package:casestudy/views/companies/companies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/app_controller.dart';

void main() => runApp(GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case study',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline4: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(context) {
    final AppController controller = Get.put(AppController());

    return CompaniesListView();
  }
}
