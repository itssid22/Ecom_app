import 'dart:ui';

import 'package:f_2_app/utils/routes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/Google_Fonts/Google_Fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  get validator => null;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });

      await Future.delayed(
        Duration(seconds: 1),
      );
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String name="";
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_img.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "enter username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username can't be empty";
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "enter password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password cannot be empty";
                          } else if (value.length < 6) {
                            return "password length should be atleast 6";
                          }
                        }),

                    const SizedBox(
                      height: 30.0,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changedButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        // {
                        //   // Navigator.pushNamed(context, MyRoutes.HomeRoute);
                        //
                        //
                        // },

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "login",
                                  style: TextStyle(color: Colors.white),
                                ),
                          // decoration: BoxDecoration(
                          //   // color: Colors.purple,
                          //   shape: changedButton?BoxShape.circle:BoxShape.rectangle,
                          //
                          // ),
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: (){
                    //    // print("The button has been pressed");
                    //   Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    //
                    //  }, child: Text("login"),
                    //
                    //
                    //
                    //  style:TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.blue, minimumSize: Size(125, 50),
                    //  side: BorderSide(color: Colors.cyan),),
                    //
                    //  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
