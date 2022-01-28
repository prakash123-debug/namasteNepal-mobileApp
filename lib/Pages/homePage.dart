import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/loading.dart';
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
    return Scaffold();
  }
}
