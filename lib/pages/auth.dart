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

  void _submitForm() {
    print(_email);
    print(_password);
  }

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
