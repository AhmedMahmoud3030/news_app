import 'package:flutter/material.dart';
import 'package:news_app/pages/web_view_screen.dart';

class NewsItem extends StatelessWidget {
  final list;

  const NewsItem({
    super.key,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WebViewScreen(
                url: list['url'],
              ),
            ),
          ),
          child: Card(
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      child: list['urlToImage'] == null
                          ? Image.network(
                              fit: BoxFit.cover,
                              'https://pscchc.com/img/news.jpg')
                          : Image.network(
                              fit: BoxFit.cover, '${list['urlToImage']}'),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '${list['publishedAt']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list['title']}',
                      style: Theme.of(context).textTheme.bodyText2),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
