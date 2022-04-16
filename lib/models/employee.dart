import 'package:casestudy/controllers/app_controller.dart';

import 'company.dart';

class Employee {
  int id;
  String first_name;
  String last_name;
  String email;
  String avatar;
  Company company;

  Employee(this.first_name, this.last_name, this.email, this.company);

  factory Employee.fromJson(dynamic json, Company company) {
    var c = Employee(json["first_name"] as String, json["last_name"] as String, json["email"] as String, company);

    c.id = json["id"] as int;
    c.avatar = json["avatar"] as String;

    return c;
  }
}
