import 'package:flutter/material.dart';
import 'package:incoming/view/11shelterPage/shelter_page.dart';
import 'package:incoming/view/12howToPage/how_to_page.dart';
import 'package:incoming/view/13newsPage/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NewsPage(),
    );
  }
}