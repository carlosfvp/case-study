class Company {
  int id;
  String company_name;
  String contact_first_name;
  String contact_last_name;
  String email;

  Company();

  factory Company.fromJson(dynamic json) {
    var c = Company();

    c.id = json["id"] as int;
    c.company_name = json["company_name"] as String;
    c.contact_first_name = json["contact_first_name"] as String;
    c.contact_last_name = json["contact_last_name"] as String;
    c.email = json["email"] as String;

    return c;
  }
}
