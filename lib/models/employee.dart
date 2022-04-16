
import 'package:casestudy/controllers/app_controller.dart';

import 'company.dart';

class Employee {
  int id;
  String first_name;
  String last_name;
  String email;
  String avatar;
  Company company;

  Employee();
  Employee.fromProps(String first_name, String last_name, String email, String avatar, Company company_id) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.avatar = avatar;
    this.company = company;
  }

  factory Employee.fromJson(dynamic json, Company company) {
    var c = Employee();

    c.id = json["id"] as int;
    c.first_name = json["first_name"] as String;
    c.last_name = json["last_name"] as String;
    c.email = json["email"] as String;
    c.avatar = json["avatar"] as String;
    c.company = company;

    return c;
  }
}
