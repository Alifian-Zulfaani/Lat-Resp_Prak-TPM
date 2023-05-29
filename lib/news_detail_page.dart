import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  String title;
  String pubDate;
  String thumbnail;
  String description;
  String link;

  NewsDetailPage({
    Key? key,
    required this.title,
    required this.pubDate,
    required this.thumbnail,
    required this.description,
    required this.link
  }) : super(key: key);

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xfff0f1f5),
        appBar: AppBar(
            title: Text("CNN News"),
            centerTitle: true),
        body: Center(
            child: Container(
              padding: const EdgeInsets.all(18),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateFormat('EEEE, dd MMMM yyyy')
                        .format(DateTime.parse(pubDate)),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * 100,
                      height: size.height * 0.35,
                      child: Image.network(
                        thumbnail.toString(),
                        width: 60,
                        height: 130,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.10),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      )
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            description.toString(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              wordSpacing: 3,
                            ),
                            maxLines: 11,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(onPressed: () async {
                      await goToWebPage(link.toString());
                    },
                      child: Text("Baca Selengkapnya..."),
                    ),
                  ),
                ],
              ),
            )));
  }
}
