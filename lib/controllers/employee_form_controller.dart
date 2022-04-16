import 'package:get/get.dart';

import '../models/employee.dart';
import 'app_controller.dart';

class EmployeeFormController extends GetxController {
  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var company = "".obs;

  firstNameChanged(String s) {
    firstName.value = s;
  }

  lastNameChanged(String s) {
    lastName.value = s;
  }

  emailChanged(String s) {
    email.value = s;
  }

  companyChanged(String s) {
    company.value = s;
  }

  addEmployee() {
    AppController appController = Get.find<AppController>();
    appController.addEmployee(Employee(
        this.firstName.value,
        this.lastName.value,
        this.email.value,
        appController.getCompanyByName(this.company.value)));
  }
}
