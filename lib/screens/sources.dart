// import 'package:api_management/services/article_service.dart';
// import 'package:flutter/material.dart';

// class SourceScreen extends StatelessWidget {
//   ApiServices apiServices = ApiServices();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("NewsApp"),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             child: FutureBuilder<News>(
//                 future: apiServices.getNews(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<Article> list = snapshot.data.articles;

//                     return ListView.builder(
//                       itemCount: list.length,
//                       itemBuilder: (context, index) {
//                         Article data = list[index];

//                         return ListTile(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => DetailsScreen(
//                                           article: data,
//                                         )));
//                           },
//                           leading: data.urlToImage == null
//                               ? Text("No Image")
//                               : Hero(
//                                   tag: data.urlToImage,
//                                   child: Image.network(
//                                     data.urlToImage,
//                                     fit: BoxFit.cover,
//                                     height: 80,
//                                     width: 80,
//                                   ),
//                                 ),
//                           title: data.title == null
//                               ? Text("SSSSSSS")
//                               : Text(
//                                   data.title,
//                                 ),
//                           subtitle: data.description == null
//                               ? Text("XXXXXXX")
//                               : Text(
//                                   data.description,
//                                 ),
//                         );
//                       },
//                     );
//                   } else {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
