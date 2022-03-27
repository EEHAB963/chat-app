import 'package:flutter/material.dart';

import 'login_scrren.dart';

class SplashScrren extends StatelessWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScrren(),
        ),
      );
    });
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.blue[100],
      child: Image.asset('asstes/image/pngwing.com.png'),
    );
  }
}
