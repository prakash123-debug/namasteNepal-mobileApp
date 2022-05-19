import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/programProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Widgets/announcementListWidget.dart';
import 'package:namaste_nepal/Widgets/programListWidget.dart';
import 'package:provider/provider.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({Key? key}) : super(key: key);

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<Program> listOfProgram = Provider.of<ProgramProvider>(context).program;
    return Scaffold(
      appBar: AppBar(
        title: Text("Programs"),
      ),
      body: Container(
        // color: Colors.amber,
        child: listOfProgram.length == 0
            ? Center(
                child: Text(
                  "Data Not Found!!",
                  style:
                      TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                ),
              )
            : ListView.builder(
                itemCount: listOfProgram.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.02,
                          horizontal: deviceWidth * 0.04),
                      child: Material(
                        elevation: 2.5,
                        type: MaterialType.card,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        color: parseColor("#ebebbe"),

                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.02,
                                vertical: deviceHeight * 0.01),
                            height: deviceHeight * 0.13,
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
                                            listOfProgram[index].programImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: programListWidget(
                                              context, listOfProgram[index]))
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                          child: programListWidget(
                                              context, listOfProgram[index])),
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
                                            listOfProgram[index].programImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                    )),
      ),
    );
  }
}
