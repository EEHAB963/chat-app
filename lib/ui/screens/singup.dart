import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_s/provider/singup_provider.dart';
import 'package:provider_s/ui/screens/home_scrren.dart';
import 'package:provider_s/ui/widget/button_widget.dart';
import 'package:provider_s/ui/widget/text_form_widget.dart';

class SingupScrren extends StatelessWidget {
  const SingupScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninProvaider>(
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
                  'Singup',
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
                          controller: provider.email,
                          text: 'Email',
                          icon: const Icon(Icons.email),
                          keyboard: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormWidget(
                          controller: provider.password,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                          keyboard: TextInputType.visiblePassword,
                          text: 'Passowrd',
                          icon: const Icon(Icons.lock),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormWidget(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                          keyboard: TextInputType.visiblePassword,
                          text: 'Confirm password',
                          icon: const Icon(Icons.lock),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                          onTap: () {
                            if (provider.email == null &&
                                provider.password == null) {
                            } else {
                              provider.creat();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScrren(),
                                  ));
                            }
                          },
                          text: 'Singup',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text('back to'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Login'),
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
