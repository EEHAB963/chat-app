import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  ItemUser({Key? key, this.onTap}) : super(key: key);
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroMy(),
                ),
              );
            },
            child: const Hero(
              tag: 'eehab',
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'eehab al msre',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'onlin',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeroMy extends StatelessWidget {
  const HeroMy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: 'eehab',
      child: Center(
        child: Image.network(
          'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=',
          // height: double.infinity,
          // width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
