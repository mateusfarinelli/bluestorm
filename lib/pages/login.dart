import 'package:bluestorm/pages/alert.dart';
import 'package:bluestorm/pages/drugs.dart';
import 'package:flutter/material.dart';
import 'package:bluestorm/repositories/userLogin.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final ctrUsername = TextEditingController();
  final ctrPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 150),
        child: ListView(
          children: <Widget>[
            textLoginField(
              "Username",
              "Username",
              controller: ctrUsername,
            ),
            textLoginField(
              "Password",
              "Password",
              password: true,
              controller: ctrPassword,
            ),
            raisedButton(
              "Login",
              Colors.lightBlue[900],
              context
            ),
          ],
        ),
      ),
    );
  }
  textLoginField(
    String label,
    String hint,{
      bool password = false,
      TextEditingController controller,
      FormFieldValidator<String> validator,
    }) {
      return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: password,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint
        ),
      );
    }
  raisedButton(
    String text,
    Color color,
    BuildContext context
  ){
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        clickButton(context);
      }
    );
  }

  clickButton(BuildContext context) async {
    bool validForm = _formKey.currentState.validate();

    if(!validForm){
      return;
    }

    String username = ctrUsername.text;
    String password = ctrPassword.text;

    var user = await UserLogin.login(username, password);
   

    if(user != null) {
      navegateHomePage(context);
    }
    else {
      alert(context, "Invalid Login");
    }
  }

  navegateHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      )
    );
  }
}