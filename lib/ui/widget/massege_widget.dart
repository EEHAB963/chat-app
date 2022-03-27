import 'package:flutter/material.dart';
import 'package:provider_s/model/maseeges_model.dart';

class MassegeWidget extends StatelessWidget {
  MassegeWidget({Key? key, this.user, required this.massegeModel})
      : super(key: key);
  MassegeModel? massegeModel;
  String? user;
  // bool? isMy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: massegeModel!.name == user
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            massegeModel!.name!,
            style: TextStyle(
                color: massegeModel!.name == user ? Colors.blue : Colors.green,
                fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: massegeModel!.name == user ? Colors.white : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: massegeModel!.name != user
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              topRight: massegeModel!.name == user
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomLeft: const Radius.circular(25),
              bottomRight: const Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              massegeModel!.massege!,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('10:33 pm'),
        ),
      ],
    );
  }
}
