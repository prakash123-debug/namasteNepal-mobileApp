import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/articleProfile.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
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
                          vertical: deviceHeight * 0.02,
                          horizontal: deviceWidth * 0.04),
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
