import 'package:get/get.dart';

class EmployeeFilterController extends GetxController {
  var employeeNameFilter = "".obs;

  setEmployeeNameFilter(String employeeName) {
    employeeNameFilter.value = employeeName;
  }
}