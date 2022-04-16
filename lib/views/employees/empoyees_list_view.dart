import 'package:casestudy/controllers/app_controller.dart';
import 'package:casestudy/models/company.dart';
import 'package:casestudy/models/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/employee_filter_controller.dart';
import 'employee_form.dart';

class EmployeesListView extends StatelessWidget {
  final int companyIdFilter;

  const EmployeesListView({Key key, this.companyIdFilter}) : super(key: key);

  Widget buildEmployeeElement(BuildContext context, Employee e) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("${e.avatar}"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(e.last_name + ", " + e.first_name,
                  style: Theme.of(context).textTheme.headline6),
              subtitle:
                  Text(e.email, style: Theme.of(context).textTheme.headline6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(
      BuildContext context, List<Employee> employees, String nameFilter) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: employees
          .where((element) => element.company.id == this.companyIdFilter)
          .where((element) =>
              element.first_name
                  .toLowerCase()
                  .contains(nameFilter.toLowerCase()) ||
              element.last_name
                  .toLowerCase()
                  .contains(nameFilter.toLowerCase()))
          .map((e) => buildEmployeeElement(context, e))
          .toList(),
    );
  }

  @override
  Widget build(context) {
    final AppController appController = Get.find();
    final EmployeeFilterController employeeFilterController = Get.put(EmployeeFilterController());

    var listView = Obx(() => buildListView(
        context, appController.employees, employeeFilterController.employeeNameFilter.value));

    var company = appController.getCompany(this.companyIdFilter);

    return Scaffold(
      appBar: AppBar(title: Text("Case study")),
      body: Center(
        child: Column(children: <Widget>[
          Text(company.company_name + " details",
              style: Theme.of(context).textTheme.headline5),
          Text(
              "Contact name: " +
                  company.contact_last_name +
                  ", " +
                  company.contact_first_name,
              style: Theme.of(context).textTheme.headline5),
          Text("Email: " + company.email,
              style: Theme.of(context).textTheme.headline5),
          TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search by first or last name',
              ),
              onChanged:
                  employeeFilterController.setEmployeeNameFilter),
          Expanded(child: Center(child: listView))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Get.to(EmployeeForm(companyId: this.companyIdFilter)),
      )
    );
  }
}
