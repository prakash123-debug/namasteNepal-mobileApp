import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/functionProvider.dart';
import 'package:namaste_nepal/Widgets/functionCard.dart';
import 'package:provider/provider.dart';

Widget functionGrid(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  List<FunctionDetail> listOfFunctions =
      Provider.of<FunctionProvider>(context).allfunctions;

  return Container(
    width: deviceWidth,
    padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.06, vertical: deviceHeight * 0.02),
    // color: Colors.blue,
    height: listOfFunctions.length <= 3
        ? deviceHeight * 0.2
        : (listOfFunctions.length / 3).ceil() * deviceHeight * 0.2,
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: deviceHeight * 0.001,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: listOfFunctions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => functionCard(
              context,
              listOfFunctions[index],
            )),
  );
}
