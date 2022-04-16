import 'package:casestudy/views/companies/companies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/app_controller.dart';

void main () => runApp(GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case study',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal, color: Colors.blueAccent),
          //bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
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

    var list = CompaniesListView();
    //var list = EmployeesListView();

    return Scaffold(
        appBar: AppBar(title:Text("Case study")),
        body: Center(child: Column(children: <Widget>[
          Expanded(child: list)
        ])),
        //floatingActionButton:
        //FloatingActionButton(child: Icon(Icons.add)/*, onPressed: c.increment*/)
    );
  }
}