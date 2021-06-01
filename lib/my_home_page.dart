import 'package:dynamic_text_example/faqs_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Perfil'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FaqsPage(
                      category: 'perfil',
                    ))),
          ),
          ListTile(
            title: Text('Ativos Manuais'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FaqsPage(
                      category: 'ativos-manuais',
                    ))),
          ),
          ListTile(
            title: Text('Outros'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FaqsPage(
                      category: 'outros',
                    ))),
          ),
        ],
      ),
    );
  }
}
