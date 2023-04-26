import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Pages/addArticlePage.dart';
import 'package:namaste_nepal/Pages/articleProfile.dart';
import 'package:namaste_nepal/Pages/login.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';
import 'package:namaste_nepal/Widgets/articleListWidget.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  SelectColor selectColor = new SelectColor();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<Article> listOfArtiicle =
        Provider.of<ArticleProvider>(context).article;
    bool isAuthorized = Provider.of<UserProvider>(context).authorized;
    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
        actions: [
          IconButton(
              tooltip: "Add Article",
              onPressed: () {
                if (isAuthorized) {
                  Navigator.push(context, CustomPageRoute(child: AddArticle()));
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Login()));
                }
              },
              icon: Icon(FontAwesomeIcons.plus))
        ],
      ),
      body: Container(
        // color: Colors.amber,
        child: listOfArtiicle.length == 0
            ? Center(
                child: Text(
                  "Data Not Found!!",
                  style:
                      TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                ),
              )
            : ListView.builder(
                itemCount: listOfArtiicle.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.01,
                          horizontal: deviceWidth * 0.02),
                      child: Material(
                        elevation: 2.5,
                        type: MaterialType.card,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        color: selectColor.cardColor,

                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: ArticleProfile(
                                  article: listOfArtiicle[index],
                                )));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.001,
                                  vertical: deviceHeight * 0.01),
                              height: deviceHeight * 0.15,
                              child: index % 2 == 0
                                  ? Row(
                                      children: [
                                        Container(
                                          width: deviceWidth * 0.2,
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: CachedNetworkImage(
                                              imageUrl: listOfArtiicle[index]
                                                  .articleImage,
                                              fit: BoxFit.fitHeight,
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.error,
                                                // color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: articleListWidget(
                                                context, listOfArtiicle[index]))
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                            child: articleListWidget(context,
                                                listOfArtiicle[index])),
                                        Container(
                                          width: deviceWidth * 0.2,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              listOfArtiicle[index]
                                                  .articleImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                      ),
                    )),
      ),
    );
  }
}
