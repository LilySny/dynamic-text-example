import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class DynamicQuestionPage extends StatelessWidget {
  final String title;
  final String text;

  const DynamicQuestionPage({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.0),
              ),
              SizedBox(height: 30.0),
              Html(
                data: '$text',
                style: {
                  'body': Style(
                    fontSize: FontSize(18.0),
                    alignment: Alignment.centerLeft,
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
