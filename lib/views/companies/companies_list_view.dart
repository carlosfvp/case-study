
import 'package:casestudy/controllers/app_controller.dart';
import 'package:casestudy/models/company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompaniesListView extends StatelessWidget {
  AppController controller = Get.find();
  BuildContext _context;

  Widget buildCompanyElement(Company c) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle, size: 50,),
              title: Text(c.contact_last_name + ", " + c.contact_first_name,
                  style: Theme.of(_context).textTheme.headline6),
              subtitle: Text(c.email,
                  style: Theme.of(_context).textTheme.headline6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 20, height: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(c.company_name, style: Theme.of(_context).textTheme.headline4),
                    const SizedBox(height: 20),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(List<Company> companies) {
    return ListView(
      padding: const EdgeInsets.all(20),
      //scrollDirection: Axis.vertical,
      //shrinkWrap: true,
      children: companies.map((c)=>buildCompanyElement(c)).toList(),
    );
  }

  @override
  Widget build(context) {
    _context = context;
    var listView = buildListView(controller.companies);
    //listView = Obx(() => buildListView(controller.companies));

    return Center(child: listView);
  }
}