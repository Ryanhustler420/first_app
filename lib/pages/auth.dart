import 'package:first_app/scoped-models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email = "", _password = "";
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return const DecorationImage(
      image: AssetImage("assets/background.jpg"),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black12, BlendMode.dstATop),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'E-Mail',
        hintText: 'E-Mail',
        filled: true,
      ),
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Password',
        labelText: 'Password',
        filled: true,
      ),
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: const Text("Remember"),
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      value: _acceptTerms,
    );
  }

  void _submitForm(Function login) {
    login('example@gmail.com', '12345');
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 786.0 ? 500.0 : deviceWidth * .95;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: targetWidth,
              child: Column(
                children: [
                  _buildEmailTextField(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: _buildAcceptSwitch(),
                      ),
                      ScopedModelDescendant(builder: (BuildContext context,
                          Widget? widget, UserModel model) {
                        return Expanded(
                          child: ElevatedButton(
                            onPressed: () => _submitForm(model.login),
                            child: const Text("Login"),
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
