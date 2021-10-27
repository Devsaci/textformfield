import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum AuthMode { SingUp, Login }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  Map<String?, String?> _authData = {
    'email': '',
    'password': '',
  };

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SingUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("114. TextFormField "),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: "E-Mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty || !val.contains("@")) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val;
                    print(_authData['email']);
                  },
                ),
                TextFormField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: "Password"),
                  controller: _passwordController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty || !val.contains("@")) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val;
                    print(_authData['email']);
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  child:
                      Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button!.color,
                ),
                FlatButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                      "${_authMode == AuthMode.Login ? 'SIGN UP ' : 'LOGIN'}  INSTEAD"),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      //log USER In
    } else {
      //Sing USER Up
    }
  }
}
