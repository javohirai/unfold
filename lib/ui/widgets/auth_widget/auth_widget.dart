import 'package:flutter/material.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  AuthWidgetState createState() => AuthWidgetState();
}

class AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 239, 241, 100),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 457,
            child: const Image(
              image: AssetImage('assets/unsplash_auth_logo.png'),
            ),
          ),
          const _AuthLoginButtonWidget()
        ],
      ),
    );
  }
}

class _AuthLoginButtonWidget extends StatelessWidget {
  const _AuthLoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 328,
          height: 41,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, MainNavigationRouteNames.oauthScreen);
            },
            child: const Text(
              'ВОЙТИ через unsplash',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
