import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localdatbase/Bottomnavigation/Bottom.dart';
import 'package:localdatbase/CustomDrawer/Drawer.dart';
import 'package:localdatbase/MoviedataModel.dart';
import 'package:localdatbase/Pages/HomeScreen.dart';
import 'package:localdatbase/navigation/route_screen.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  bool doubleclickToExit = false;

  @override
  Widget build(BuildContext context) {
    DateTime _lastExitTime = DateTime.now();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();

          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text('Movie'),
            ),
            // drawer: CustomNavigationbar(index: 1),

            body: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ProductDataModel>;
                  return ListView.builder(
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (items[index].extract != null &&
                                items[index].extract!.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("extract"),
                                    content: Container(
                                      height: 250,
                                      width: 250,
                                      child:
                                          Text(items[index].extract.toString()),
                                    ),
                                  );
                                },
                              );
                            } else {
                              // Show toast message if 'extract' is empty
                              Fluttertoast.showToast(
                                msg: "Extract is empty!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              content: CachedNetworkImage(
                                            imageUrl: items[index]
                                                .thumbnail
                                                .toString(),
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Image(
                                                    image: NetworkImage(
                                                        'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg')),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: imageProvider,
                                                ),
                                                color: Colors
                                                    .grey, // Placeholder color
                                              ),
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          items[index].thumbnail.toString(),
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.image, size: 100),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: imageProvider,
                                          ),
                                          color:
                                              Colors.grey, // Placeholder color
                                        ),
                                      ),
                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          'title :-${items[index].title.toString()}',
                                          overflow: TextOverflow.clip,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                            'year :- ${items[index].year.toString()}')),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'cast: ${items[index].cast == null || items[index].cast!.isEmpty ? "N/A" : items[index].cast?.join(", ")}',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/movies.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
