import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ofertas/features/login/data/repositories/user_repository_impl.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            onPressed: () {
              var provider = Provider.of<UserRepositoryImpl>(context, listen: false);
              provider.googleLogIn();

            },
            label: const Text('Sign in with google')),
      ),
    );
  }
}
