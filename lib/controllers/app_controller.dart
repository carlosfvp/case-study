import 'dart:convert';

import 'package:casestudy/models/company.dart';
import 'package:casestudy/models/employee.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var companies = <Company>[].obs;
  var employees = <Employee>[].obs;

  Future<void> readCompanyData() async {
    final String response =
        await rootBundle.loadString('assets/company_data.json');
    final data = await json.decode(response);
    for (var jsonRow in data) {
      companies.add(Company.fromJson(jsonRow));
    }
  }

  Future<void> readEmployeeData() async {
    final String response =
        await rootBundle.loadString('assets/employee_data.json');
    final data = await json.decode(response);
    for (var jsonRow in data) {
      employees.add(
          Employee.fromJson(jsonRow, getCompany(jsonRow["company_id"] as int)));
    }
  }

  @override
  void onInit() {
    readCompanyData().then((value) => readEmployeeData());
  }

  Company getCompany(int id) {
    return companies.firstWhere((x) => x.id == id);
  }

  Company getCompanyByName(String name) {
    return companies.firstWhere((x) => x.company_name.toLowerCase() == name.toLowerCase());
  }

  getEmployeesFromCompany(int id) {
    return employees.where((x) => x.company.id == id);
  }

  addEmployee(Employee e) {
    employees.add(e);
  }
}
