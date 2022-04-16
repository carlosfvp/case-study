import 'package:get/get.dart';

class CompanyFilterController extends GetxController {
  var companyContactNameFilter = "".obs;
  var companyNameFilter = "".obs;

  setCompanyContactNameFilter(String contactName) {
    companyContactNameFilter.value = contactName;
  }

  setCompanyNameFilter(String companyName) {
    companyNameFilter.value = companyName;
  }
}