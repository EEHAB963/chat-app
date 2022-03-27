import 'package:flutter/material.dart';
import 'package:provider_s/ui/screens/chat_scrren.dart';
import 'package:provider_s/ui/widget/item_user.dart';

class HomeScrren extends StatelessWidget {
  const HomeScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemUser(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScrren(),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
