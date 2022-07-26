import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_rest_api/routes/route.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _usernameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _RegisterState extends State<Register> {
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
                "Create an account",
                style: TextStyle(
                  fontFamily: 'SimplyRounded',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _emailField(),
            SizedBox(
              height: 28,
            ),
            _usernameField(),
            SizedBox(
              height: 28,
            ),
            _phonenumField(),
            SizedBox(
              height: 28,
            ),
            _passwordField(),
            SizedBox(
              height: 42,
            ),
            _signupButton(),
            _loginLink(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextFormField(
        controller: _emailController,
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

  Widget _usernameField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: "Username",
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

  Widget _phonenumField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextFormField(
        controller: _phoneController,
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(
            fontFamily: "FolksNormal",
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            )
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10.0, right: 10),
      child: TextField(
        controller: _passwordController,
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

  Widget _signupButton() {
    return Container(
      height: 44.0,
      padding: EdgeInsets.only(left: 112.0, right: 113.0),
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if(_emailController == "" && _passwordController == "" && _phoneController == "" && _usernameController == ""){
            text = "Account failed to add";
          }
          else{
            text = "Account successfully added";
          }
          Navigator.popAndPushNamed(context, "/login");
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, 
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontFamily: 'FolksNormal',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xffEED4AF))
        ),
      ),
    );
  }

  Widget _loginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Log In",
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