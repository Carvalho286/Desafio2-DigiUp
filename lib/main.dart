import 'package:desafio2/pages/entertainment.dart';
import 'package:desafio2/pages/sport.dart';
import 'package:desafio2/pages/tech.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NewsPage(),
));

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Desafio 2 - digiUP'
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          bottom: const TabBar(
            tabs:[
              Tab(
                text: 'Desporto',
                icon: Icon(Icons.sports_soccer),
              ),
              Tab(
                text: 'Tecnologia',
                icon: Icon(Icons.computer),
              ),
              Tab(
                text: 'Entretenimento',
                icon: Icon(Icons.attractions),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SportContent(),
            TechContent(),
            EntertainmentContent(),
          ],
        ),
      ),
    );
  }
}