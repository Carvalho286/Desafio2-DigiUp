import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/article.dart';
import 'articlePage.dart';

class EntertainmentContent extends StatefulWidget {
  const EntertainmentContent({super.key});

  @override
  State<EntertainmentContent> createState() => _EntertainmentContentState();
}

class _EntertainmentContentState extends State<EntertainmentContent> {

  List<Articles> articles = [];

  Future getNews() async {
    var response = await http.get(Uri.https('newsapi.org', '/v2/top-headlines', {'category': 'entertainment', 'language': 'en', 'apiKey': '3dea219f83774cd38bfbdb51d05acb9f'}));
    var jsonData = jsonDecode(response.body);

    for (var eachNew in jsonData['articles']) {

      final article = Articles(
        author: eachNew['author'] ?? '',
        title: eachNew['title'] ?? '',
        content: eachNew['content'] ?? '',
        url: eachNew['url'] ?? '',
        urlToImage: eachNew['urlToImage'] ?? '',
      );

      articles.add(article);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) { //Loading Complete
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        articles[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          articles[index].author,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      leading: Icon(
                        Icons.article,
                        color: Colors.deepPurple,
                        size: 40.0,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlePage(
                              title: articles[index].title,
                              author: articles[index].author,
                              content: articles[index].content,
                              url: articles[index].url,
                              urlToImage: articles[index].urlToImage,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else { //Still Loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}