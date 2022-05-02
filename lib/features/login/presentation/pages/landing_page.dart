import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/user_repository_impl.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final provider = Provider.of<UserRepositoryImpl>(context, listen:false);
            provider.googleLogOut();
          },
          child: const Text('LogOut'),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
        const Text('Landing page'),
      ],
    ));
  }
}
