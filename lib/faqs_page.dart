import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_text_example/question_page.dart';
import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  final String category;

  const FaqsPage({
    Key key,
    this.category = 'outros',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var futureQuery = FirebaseFirestore.instance
        .collection('faq')
        .get();

    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: FutureBuilder(
        future: futureQuery,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text("Document not found"));
          }

          return ListView(
            children:
                snapshot.data.docs.map<Widget>((DocumentSnapshot document) {
              var data = document.data();
              return data['categoria'] == category
                  ? ListTile(
                      title: Text('${data['titulo']}'),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DynamicQuestionPage(
                          title: data['titulo'],
                          text: data['texto'],
                        ),
                      )),
                    )
                  : SizedBox.shrink();
            }).toList(),
          );
        },
      ),
    );
  }
}
