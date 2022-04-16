
import 'package:casestudy/controllers/app_controller.dart';
import 'package:casestudy/models/company.dart';
import 'package:casestudy/models/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeListView extends StatelessWidget {
  AppController controller = Get.find();
  BuildContext _context;

  Widget buildEmployeeElement(Employee e) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage("${e.avatar}"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(e.last_name + ", " + e.first_name,
                  style: Theme.of(_context).textTheme.headline6),
              subtitle: Text(e.email,
                  style: Theme.of(_context).textTheme.headline6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(List<Employee> employees) {
    return ListView(
      padding: const EdgeInsets.all(20),
      //scrollDirection: Axis.vertical,
      //shrinkWrap: true,
      children: employees.map((e)=>buildEmployeeElement(e)).toList(),
    );
  }

  @override
  Widget build(context) {
    _context = context;
    var listView = buildListView(controller.employees);
    //listView = Obx(() => buildListView(controller.companies));

    return Center(child: listView);
  }
}