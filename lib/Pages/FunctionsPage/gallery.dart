import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/galleryProvider.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // List<String> images = [
  //   "https://images.pexels.com/photos/10334838/pexels-photo-10334838.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  //   "https://images.pexels.com/photos/11517500/pexels-photo-11517500.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  //   "https://images.pexels.com/photos/11995419/pexels-photo-11995419.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  //   "https://images.pexels.com/photos/11506984/pexels-photo-11506984.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  //   "https://images.pexels.com/photos/11566128/pexels-photo-11566128.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  // ];
  bool viewImage = false;
  int viewImageIndex = 0;
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    GalleryProvider galleryProvider = Provider.of<GalleryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: galleryProvider.gallery.length == 0
          ? Center(
              child: Text(
                "Data Not Found!!",
                style:
                    TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
              ),
            )
          : Stack(
              children: [
                Center(
                    child: SizedBox.fromSize(
                  size: Size.fromHeight(550.0),
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: galleryProvider.gallery.length,
                    onPageChanged: (i) {
                      setState(() {
                        currentIndex = i + 1;
                      });
                      print(currentIndex);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      // setState(
                      //   () => currentIndex = index,
                      // );
                      print(currentIndex);
                      return new Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 8.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            print(index);
                            setState(() {
                              viewImage = true;
                              viewImageIndex = index;
                            });
                          },
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  galleryProvider.gallery[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                // DecoratedBox(
                                //   decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //       begin: FractionalOffset.bottomCenter,
                                //       end: FractionalOffset.topCenter,
                                //       colors: [
                                //         Color(0x00000000).withOpacity(0.9),
                                //         Color(0xff000000).withOpacity(0.01),
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                if (viewImage)
                  Container(
                    height: deviceHeight * 0.9,
                    width: deviceWidth,
                    color: Colors.black.withOpacity(0.9),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: deviceHeight * 0.9,
                          width: deviceWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                galleryProvider
                                    .gallery[viewImageIndex].imageUrl,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  viewImage = false;
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              )),
                        )
                      ],
                    ),
                  ),
                Positioned(
                    bottom: deviceHeight * 0.08,
                    left: deviceWidth * 0.05,
                    child: Text(
                        "Image:\t $currentIndex / ${galleryProvider.gallery.length}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: deviceWidth * 0.045)))
              ],
            ),
    );
  }
}
