import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organizer/ScreenHome.dart';
import 'package:organizer/controllers/authentications.dart';
import 'package:organizer/pages/signupScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void login() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signin(email, password, context).then((value) {
        if (value != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenHome(uid: value.uid),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/logo2.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "This Field Is Required"),
                          EmailValidator(errorText: "Invalid Email Address"),
                        ]),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Password Is Required"),
                            MinLengthValidator(6, errorText: "Minimum 6 Characters Required"),
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                      RaisedButton(
                        // passing an additional context parameter to show dialog boxs
                        onPressed: login,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () => googleSignIn().whenComplete(() async {
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  if (user.uid != null) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenHome(uid: user.uid)));
                }),
                child: Image(
                  image: AssetImage('assets/signin.png'),
                  width: 200.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  // send to login screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "Sign Up Here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
