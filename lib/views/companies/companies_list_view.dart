import 'package:casestudy/controllers/app_controller.dart';
import 'package:casestudy/models/company.dart';
import 'package:casestudy/views/employees/empoyees_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompaniesListView extends StatelessWidget {
  AppController controller = Get.find();
  BuildContext _context;

  Widget buildCompanyElement(Company c) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Get.to(EmployeesListView(companyIdFilter: c.id));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                title: Text(c.contact_last_name + ", " + c.contact_first_name,
                    style: Theme.of(_context).textTheme.headline6),
                subtitle: Text(c.email,
                    style: Theme.of(_context).textTheme.headline6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text(c.company_name,
                        style: Theme.of(_context).textTheme.headline4),
                    const SizedBox(height: 20),
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(List<Company> companies, String filterContactName,
      String filterCompanyName) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: companies
          .where((element) =>
              element.contact_last_name
                  .toLowerCase()
                  .contains(filterContactName.toLowerCase()) ||
              element.contact_first_name
                  .toLowerCase()
                  .contains(filterContactName.toLowerCase()))
          .where((element) => element.company_name
              .toLowerCase()
              .contains(filterCompanyName.toLowerCase()))
          .map((c) => buildCompanyElement(c))
          .toList(),
    );
  }

  @override
  Widget build(context) {
    _context = context;

    var listView = Obx(() => buildListView(
        controller.companies,
        controller.companyContactNameFilter.value,
        controller.companyNameFilter.value));

    return Scaffold(
        appBar: AppBar(
          title: Text("Case study"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search by first or last name',
                ),
                onChanged: (inputText) =>
                    controller.setCompanyContactNameFilter(inputText)),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search by company name',
                ),
                onChanged: (inputText) =>
                    controller.setCompanyNameFilter(inputText)),
            Expanded(child: Center(child: listView))
          ]),
        ));
  }
}
