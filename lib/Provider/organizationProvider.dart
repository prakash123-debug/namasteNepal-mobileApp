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
      imageUrl: "assets/images/family.jpg",
      // "https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      address: "Tilottama-2, Rupandehi, Nepal",
      email: "namastenepal2068@gmail.com",
      phone: "+977-9844708763",
      instagramLink:
          "https://www.instagram.com/namastenepalorg99/?fbclid=IwAR2KetIJk5qcLAtz9af76RUuOb9oINMKP0kenvnjRh2fjv7Y9QT00Bu4quc",
      fbLink: "https://www.facebook.com/NamasteNepal6/",
      website: "https://namastenepal.netlify.app",
      desc:
          """<p>(नमस्ते नेपालको विगत केलाउँदा) हामी १६ वर्ष नपुगेका बालबालिकाहरु मिलेर बाल क्लवका रुपमा २०६९ को जेष्ठ १५ गते नमस्ते नेपाल साविकको शंकरनगर गाविसमा गठन गरेका थियौं । हामी साना थियौं,हाम्रा ज्ञान,सीप,क्षमता र कर्महरु समेत साँघुरा थिए । हामीले बाल क्लबका माध्यमबाट आफूले सक्दो सामाजिक उत्थानका कामहरु गर्दै आयौं । हामीले त्यतिबेला अन्डर १६ महोत्सव भव्यताका साथ सम्पन्न गरेका थियौं । त्यस महोत्सवले हामीलाई नयाँ उर्जा र समाजप्रति थप जिम्मेवार रहनका निम्ति प्रेरणा मिलेको थियो । त्यहि बाल क्लवलाई आधार बनाएर केही नयाँ साथीहरुलाई सहभागी गराउँदै हामीले जिल्ला प्रशासन कार्यालय,रुपन्देहीमा नमस्ते नेपाल नामक गैरनाफामूलक सामाजिक संस्थाका रुपमा सम्वत् २०७५ साउन १३ गते दर्ता गरी २६१५ दर्ता नम्बर पाएका छौं । यसले हामीलाई आधिकारिकता दिएको छ । समाजप्रति थप काम गर्न जिम्मेवार गराएको छ । संस्थाको औपचारिक दर्ता प्रक्रियासँगै हामीले राष्ट्रिय राजनीतिलाई समेत आकर्षित गर्ने खालका कार्यक्रमहरुको आयोजना गरी सफलतापूर्वक सम्पन्न गरेका छौं । स्थानीय सरकार,सामाजिक संघसंस्थाहरुसँग मिलेर सामाजिक विकास,नैतिक आचरण सुधार,आत्मिक अन्तरसम्बन्ध विकास र चेतना अभिवृद्धिका कार्यत्रमहरु र सुशासनलाई दिगो बनाउने खालका कार्यक्रमहरुलाई प्राथमिकता दिदैै अघि बढिरहेका छौं । तिलोत्तमा नगरपालिकाभित्र रहेर क्रियाशील नमस्ते नेपालले स्थानीय सरकार र विभिन्न संघसंस्थाहरुबाट पुरस्कार,सम्मान एवम् प्रशंसा प्राप्त गरेकामा कार्यसमिति ,सल्लाहकार एवम् अग्रजहरुलाई नमस्ते नेपाल हार्दिकतापूर्वक कृतज्ञता प्रकट गर्दछ । नमस्ते नेपालले आफ्ना कार्यसमितिका साथीहरुको क्षमता,दक्षता एवम् क्रियाशीलता बढाउनका निम्ति विभिन्न खालका ज्ञानवद्र्धक एवम् सीपमूलक तालिमहरु सञ्चालन गर्दै आइरहेको छ । हामीले कोभिडका कारण यसपालिको स्थापना दिवस भौतिक उपस्थितिका बीच सञ्चालन गर्न सकेनौं । समय र परिस्थिति अनुकूल स्थापना दिवस मनाउन गई रहेका छौं । आजसम्म नमस्ते नेपाललाई माया,स्नेह गरी भौतिक,आर्थिक,नैतिक एवम् रचनात्मक सहयोग प्रदान गर्नुहुने सरकारी,गैरसरकारी एवम् सामाजिक संघसंस्थाहरुप्रति कृतज्ञता प्रकट गर्दै आगामी दिनहरुमा समेत नमस्ते नेपाल सबैसँग यस्तै खालका सहयोग र साथको अपेक्षा गर्दछ । सबैको कल्याण होस् ।</p>
      """);

  OrganizationDetail get organizationDetail {
    return _organizationDetail;
  }
}
