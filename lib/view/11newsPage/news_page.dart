import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


Future<Post> fetchPost() async {
  final response =
  await http.get(Uri.parse('https://n.news.naver.com/mnews/article/001/0013554354?rc=N&ntype=RANKING'));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}


class _NewsPageState extends State<NewsPage> {

  Future<Post> ?post;

  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child : Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : <Widget>[
            /*FutureBuilder<Post>(
              //통신데이터 가져오기
              future: post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildColumn(snapshot);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}에러!!");
                }
                return CircularProgressIndicator();
              },
            ),
            */
            _card('기사 1'),
            InkWell(
             child : Text('기사 원문 보기',
             style: TextStyle(fontSize: 30),),
              onTap: () => launchUrl(Uri.parse('https://n.news.naver.com/mnews/article/001/0013554354?rc=N&ntype=RANKING')),
            ),
            SizedBox(
                height: 10,
                width: 20),
            _card('기사 2'),
            InkWell(
              child : Text('기사 원문 보기',
                style: TextStyle(fontSize: 30),),
              onTap: () => launchUrl(Uri.parse('https://n.news.naver.com/mnews/article/001/0013554354?rc=N&ntype=RANKING')),
            ),
            SizedBox(
                height: 10,
                width: 20),
            _card('기사 3'),
            InkWell(
              child : Text('기사 원문 보기',
                style: TextStyle(fontSize: 30),),
              onTap: () => launchUrl(Uri.parse('https://n.news.naver.com/mnews/article/001/0013554354?rc=N&ntype=RANKING')),
            ),
        ],
        ),
      ),
      ),
    );
  }


  Widget buildColumn(snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children : [
         Text('기사 제목:' + snapshot.data!.title.toString(),
           style: TextStyle(fontSize: 20)),
      ],
    );
  }

}

_card(String str) => Container(
  width: 400,
  height: 100,
  color: Colors.blue,
  child: Text(str,
  style: TextStyle(color: Colors.white, fontSize: 40),
  textAlign: TextAlign.center,
  ),
);