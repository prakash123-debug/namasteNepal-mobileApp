import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Provider/programCategoryProvider.dart';
import 'package:namaste_nepal/Provider/programProvider.dart';
import 'package:namaste_nepal/Utils/Drawer/drawer.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Widgets/announcementGridView.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';
import 'package:namaste_nepal/Widgets/drawerFunctionList.dart';
import 'package:namaste_nepal/Widgets/functionGrid.dart';
import 'package:namaste_nepal/Widgets/homePageCarousel.dart';
import 'package:namaste_nepal/Widgets/mainPageCategory.dart';
import 'package:namaste_nepal/Widgets/menuNotification.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: TwoPanels(
        controller: controller,
      ),
    );
  }
}

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  const TwoPanels({Key? key, required this.controller}) : super(key: key);

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
  static const _headerHeight = 32.0;
  late TabController tabController = TabController(length: 3, vsync: this);

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final _height = constraints.biggest.height;
    final _backPanelHeight = _height - _headerHeight;
    const _frontPanelHeight = -_headerHeight;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        _backPanelHeight,
        0.0,
        _frontPanelHeight,
      ),
      end: const RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Scaffold(
        // backgroundColor: parseColor("#ffffd9"),
        // showDrawer(context),
        // drawer: Drawer(),
        body: SafeArea(
          child: Container(
            height: deviceHeight,
            width: deviceWidth,
            // color: Colors.red,
            child: ListView(
              children: [
                // IconButton(
                //     onPressed: () {
                //       z.toggle!();
                //     },
                //     icon: Icon(Icons.abc)),
                // menuNotification(context),
                MenuNotification(
                  zoomDrawerController: z,
                ),

                carouselImplement(context),
                Divider(
                  thickness: 2,
                ),
                functionGrid(context)
              ],
            ),
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isStarting = true;

//   void serverCall() {
//     Provider.of<AnnouncementCategoryProvider>(context)
//         .getAllAnnouncementCategory();
//     Provider.of<ArticleCategoryProvider>(context).getAllArticleCategory();
//     Provider.of<ProgramCategoryProvider>(context).getAllprogramCategory();
//     Provider.of<ProgramProvider>(context).getAllProgram();
//     Provider.of<ArticleProvider>(context).getAllArticle();
//     Provider.of<AnnouncementProvider>(context).getAllAnnouncement();
//     Provider.of<BranchProvider>(context).getAllBranches();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();

//     if (isStarting) {
//       serverCall();
//     }
//     isStarting = false;
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     // loading(context);
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       key: _scaffoldKey,
//       // backgroundColor: parseColor("#ffffd9"),
//       // showDrawer(context),
//       // drawer: Drawer(),
//       body: SafeArea(
//         child: Container(
//           height: deviceHeight,
//           width: deviceWidth,
//           // color: Colors.red,
//           child: ListView(
//             children: [
//               // menuNotification(context),
//               MenuNotification(),

//               carouselImplement(context),
//               Divider(
//                 thickness: 2,
//               ),
//               functionGrid(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
