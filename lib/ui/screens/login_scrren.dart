import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_s/provider/login_provider.dart';
import 'package:provider_s/ui/screens/singup.dart';
import 'package:provider_s/ui/widget/button_widget.dart';
import 'package:provider_s/ui/widget/text_form_widget.dart';

import 'home_scrren.dart';

class LoginScrren extends StatelessWidget {
  const LoginScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvaider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(170),
                  bottomRight: Radius.circular(170)),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  width: 340,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormWidget(
                          controller: provider.emailConteoler,
                          text: 'Email',
                          icon: const Icon(Icons.email),
                          keyboard: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormWidget(
                          controller: provider.passwordControlor,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                          keyboard: TextInputType.visiblePassword,
                          text: 'Passowrd',
                          icon: const Icon(Icons.lock),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                          text: 'Login',
                          onTap: () {
                            if (provider.emailConteoler == null &&
                                provider.passwordControlor == null) {
                            } else {
                              provider.login();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScrren(),
                                  ));
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text('Create an account'),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SingupScrren(),
                                      ));
                                },
                                child: const Text('Singin'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
