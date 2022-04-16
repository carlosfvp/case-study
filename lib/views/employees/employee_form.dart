import 'package:casestudy/controllers/app_controller.dart';
import 'package:casestudy/controllers/employee_form_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/company.dart';
import '../../models/employee.dart';

class EmployeeForm extends StatelessWidget {
  final int companyId;

  const EmployeeForm({Key key, this.companyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    final EmployeeFormController formController = Get.put(EmployeeFormController());

    Company c = appController.getCompany(this.companyId);

    return Scaffold(
      appBar: AppBar(title: Text("Case study")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Text("Add employee "),
            TextField(decoration: InputDecoration(labelText: 'First name'), onChanged: formController.firstNameChanged),
            TextField(decoration: InputDecoration(labelText: 'Last name'), onChanged: formController.lastNameChanged),
            TextField(decoration: InputDecoration(labelText: 'Email'), onChanged: formController.emailChanged),
            DropdownSearch<String>(
              showSelectedItems: true,
              items: appController.companies.map((element) => element.company_name)
                  .toList(),
              dropdownSearchDecoration: InputDecoration(
                label: Text("Company name")
              ),
              onChanged: formController.companyChanged,
            ),
            ElevatedButton(onPressed: () => formController.addEmployee()),
          ]),
        )
      )
    );
  }
}
