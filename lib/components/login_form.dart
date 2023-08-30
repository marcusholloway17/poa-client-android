import 'package:flutter/material.dart';

import '../utils/config.dart';
import 'Button.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Config.primaryColor,
        decoration: const InputDecoration(
          hintText: 'Nom utilisateur',
          labelText: 'Username',
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.person),
          prefixIconColor: Config.primaryColor,
        ),
        ),
           Config.spaceSmall,
              TextFormField(
                controller: _passController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.primaryColor,
                obscureText: obsecurePass,
                decoration:  InputDecoration(
                  hintText: 'Mot de passe',
                  labelText: 'Password',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  prefixIconColor: Config.primaryColor,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecurePass = !obsecurePass;
                          });
                        },
                        icon: obsecurePass
                            ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black38,
                        )
                            : const Icon(
                          Icons.visibility_outlined,
                          color: Config.primaryColor,
                        )
                    )
                ),
                ),
            Config.spaceSmall,
            Button(
               width: double.infinity,
               title: 'Se connecter',
               onPressed: () async {
                 Navigator.of(context).pushNamed('/main');
               },
              disable: false,
            )

          ],


      )

    );
  }

}
