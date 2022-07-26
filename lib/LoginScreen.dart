import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_rest_api/routes/route.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue.shade100,
      body: Padding(
      padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Data Covid 19", 
                style: TextStyle(
                  fontFamily: 'SimplyRounded',
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontFamily: 'SimplyRounded',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _usernameField(),
            SizedBox(
              height: 28,
            ),
            _passwordField(),
            SizedBox(
              height: 42,
            ),
            _loginButton(),
            _registerLink(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextFormField(
        decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
        fontFamily: "FolksNormal",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          )
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            fontFamily: "FolksNormal",
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0)
          )
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: 44.0,
      padding: EdgeInsets.only(left: 112.0, right: 113.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, "/home");
        }, 
        child: Text(
          "Log In",
          style: TextStyle(
            fontFamily: 'FolksNormal',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xfff000000)
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
        ),
      ),
    );
  }

  Widget _registerLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/daftar");
          },
          child: Text("Create an account", 
              style: TextStyle(
        color: Color(0xfffD2A77A),
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline
              ),
            )
        )
      ],
    );
  }
}