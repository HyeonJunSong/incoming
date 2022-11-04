import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _card(),
            _card(),
            _card(),
            _card(),
            _card(),
          ],
        ),
      ),
    );
  }
}

_card() => Container(
  width: 200,
  height: 200,
  color: Colors.blue,
  child: Text("card"),
);