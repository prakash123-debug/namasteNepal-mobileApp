import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Widgets/announcementGridView.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';
import 'package:namaste_nepal/Widgets/functionGrid.dart';
import 'package:namaste_nepal/Widgets/homePageCarousel.dart';
import 'package:namaste_nepal/Widgets/mainPageCategory.dart';
import 'package:namaste_nepal/Widgets/menuNotification.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStarting = true;

  void serverCall() {
    Provider.of<AnnouncementCategoryProvider>(context)
        .getAllAnnouncementCategory();
    Provider.of<ArticleCategoryProvider>(context).getAllArticleCategory();
    Provider.of<ArticleProvider>(context).getAllArticle();
    Provider.of<AnnouncementProvider>(context).getAllAnnouncement();
    Provider.of<BranchProvider>(context).getAllBranches();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (isStarting) {
      serverCall();
    }
    isStarting = false;
  }

  @override
  Widget build(BuildContext context) {
    // loading(context);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          // color: Colors.red,
          child: ListView(
            children: [
              menuNotification(context),
              carouselImplement(context),
              Divider(
                thickness: 2,
              ),
              functionGrid(context)
            ],
          ),
        ),
      ),
    );
  }
}
