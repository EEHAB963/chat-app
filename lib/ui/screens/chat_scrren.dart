import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_s/model/maseeges_model.dart';
import 'package:provider_s/provider/chat_provider.dart';
import 'package:provider_s/ui/widget/item_user.dart';
import 'package:provider_s/ui/widget/massege_widget.dart';

class ChatScrren extends StatefulWidget {
  const ChatScrren({Key? key}) : super(key: key);

  @override
  State<ChatScrren> createState() => _ChatScrrenState();
}

class _ChatScrrenState extends State<ChatScrren> {
  @override
  void initState() {
    Provider.of<ChatProvider>(context, listen: false).getMassege();
    Provider.of<ChatProvider>(context, listen: false).getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      provider.delete();
                    },
                    icon: Icon(Icons.menu)),
              ],
              leading: null,
              title: ItemUser(),
            ),
            backgroundColor: Colors.blueAccent[100],
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: provider.firebase
                        .collection('massege')
                        .orderBy('time')
                        .snapshots(),
                    builder: (context, snapshots) {
                      if (snapshots.hasData) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: double.infinity,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: provider.masseges.length,
                                itemBuilder: (context, index) {
                                  return MassegeWidget(
                                    massegeModel: provider.masseges[index],
                                    user: provider.myUser!.email,
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      } else if (snapshots.hasError) {
                        return const Expanded(
                          child: Center(
                            child: Text('no massege'),
                          ),
                        );
                      } else {
                        return const Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: provider.controllerMassege,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.setMassege(
                              MassegeModel(
                                  massege: provider.controllerMassege.text,
                                  name: provider.myUser!.email,
                                  time: FieldValue.serverTimestamp()),
                            );
                            provider.controllerMassege.clear();
                            log(' masseg don');
                          },
                          icon: Icon(Icons.send),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
