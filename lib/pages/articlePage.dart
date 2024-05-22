import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String author;
  final String content;
  final String url;
  final String urlToImage;

  const ArticlePage({
    Key? key,
    required this.title,
    required this.author,
    required this.content,
    required this.url,
    required this.urlToImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (urlToImage.isNotEmpty)
              Center(
                child: Image.network(urlToImage),
              ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'By $author',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              content.isNotEmpty ? content : 'Conteúdo não disponível',
              style: TextStyle(
                fontSize: 16.0,
                color: content.isNotEmpty ? Colors.black : Colors.red,
              ),
            ),
            SizedBox(height: 16.0),
            Link(
              target: LinkTarget.self,
              uri: Uri.parse(url),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text('Lê a notícia completa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
