import 'package:flutter/cupertino.dart';

class OrganizationDetail {
  String name;
  String address;
  String phone;
  String email;
  String website;
  String fbLink;
  String instagramLink;
  String imageUrl;
  String desc;

  OrganizationDetail(
      {required this.name,
      required this.imageUrl,
      required this.address,
      required this.email,
      required this.phone,
      required this.instagramLink,
      required this.fbLink,
      required this.website,
      required this.desc});
}

class OrganizationProvider extends ChangeNotifier {
  OrganizationDetail _organizationDetail = OrganizationDetail(
      name: "Namaste Nepal",
      imageUrl:
          "https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      address: "Tilottama-2, Rupandehi, Nepal",
      email: "namastenepal@gmail.com",
      phone: "9866553432",
      instagramLink: "http://www.instagram.com",
      fbLink: "http://www.facebook.com",
      website: "http://www.youtube.com",
      desc: """<li>
        <ul>Hello</ul>
        <ul>One</ul>
        <ul>Two</ul>
      </li>
      """);

  OrganizationDetail get organizationDetail {
    return _organizationDetail;
  }
}
