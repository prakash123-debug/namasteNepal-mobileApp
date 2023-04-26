// import 'package:allpasal_store/app/resources/resources.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class CustomCachedNetworkImage extends StatelessWidget {
//   final String? imageUrl;
//   final String? localImagePath;
//   final BoxFit? fit;
//   final double? aspectRatio;

//   const CustomCachedNetworkImage(this.imageUrl,
//       {this.localImagePath, Key? key, this.fit, this.aspectRatio})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: getImageUrl(imageUrl),
//       imageBuilder: (context, imageProvider) => AspectRatio(
//         aspectRatio: aspectRatio ?? 3,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: imageProvider,
//               fit: fit ?? BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//       placeholder: (context, url) => AspectRatio(
//         aspectRatio: 1,
//         child: Image.asset(
//           UIAseets.shimmerEffectGif,
//           fit: BoxFit.cover,
//         ),
//       ),
//       errorWidget: (context, url, error) => AspectRatio(
//         aspectRatio: 80 / 11,
//         child: Image.asset(
//           localImagePath ?? UIAseets.allPasalImagePlaceHolder,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   String getImageUrl(String? url) {
//     if (url != null && url != "") {
//       return url;
//     } else {
//       return '';
//       // return "https://staging.testpasal.com/default/images/alplogo.png";
//     }
//   }
// }
