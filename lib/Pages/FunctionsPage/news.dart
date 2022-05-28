import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/newsProvider.dart';
import 'package:namaste_nepal/Widgets/news_card.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: newsProvider.news.length == 0
              ? Center(
                  child: Text(
                    "Data Not Found!!",
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  ),
                )
              : ListView.builder(
                  itemCount: newsProvider.news.length,
                  itemBuilder: (context, index) {
                    return newsCard(
                        context: context, e: newsProvider.news[index]);
                  },
                ),
        )
        // Column(
        //   children: newsProvider.news.asMap().entries.map((MapEntry e) {
        //     return newsCard(context: context, e: e.value);
        //   }).toList(),
        // ),
        );
  }
}
