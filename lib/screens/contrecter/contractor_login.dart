import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:labour_app/custom_clippers/Clipper1.dart';
import 'package:labour_app/screens/contrecter/contract_forgetpwd.dart';
import 'package:labour_app/screens/contrecter/contracter_dashboard.dart';
import 'package:labour_app/screens/contrecter/contractor_signup.dart';

import 'package:labour_app/utiles/colors.dart';
import 'package:labour_app/utiles/model/static_data.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Contractor_login extends StatefulWidget {
  const Contractor_login({super.key});

  @override
  State<Contractor_login> createState() => _Contractor_loginState();
}

class _Contractor_loginState extends State<Contractor_login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = true;
  bool? _success;
  String? _userEmail;
  void _signInWithEmailAndPassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    User user = (await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user!;

    if (user != null) {
      setState(() {
        StaticData.uid = user.uid;
        print('uiddd ${StaticData.uid}');
        _success = true;
        _userEmail = user.email!;
        print('email $_userEmail');
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Contracter_dashboard(),
          ));

      Fluttertoast.showToast(
          msg: 'Succesfully login',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      postDataToSP();
    } else {
      setState(
        () {
          _success = false;
        },
      );
    }
  }

  postDataToSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('uid', StaticData.uid);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Container(
              height: height,
              width: width,
              child: const Image(
                image: AssetImage("images/background.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: clipper1(),
                child: Container(
                  height: height * 0.3,
                  width: width,
                  color: Colormanager.textcolors,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => contractor_Signup(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // color: Colors.amber,
                height: height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.13,
                      child: const Image(
                        image: AssetImage("images/kjob.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        height: height * 0.5,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colormanager.headingcolor.withOpacity(0.7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Contractor Login',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    }

                                    return null;
                                  },
                                  style: const TextStyle(color: Colors.white),
                                  obscureText:
                                      !_passwordVisible, //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),

                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Contracterforgetpwd(),
                                  ),
                                );
                              },
                              child: Text(
                                "Fogot Password?",
                                style: TextStyle(
                                    color: Colormanager.textcolors,
                                    fontSize: width * 0.035),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _signInWithEmailAndPassword();
                                }
                                _signInWithEmailAndPassword();
                              },
                              child: Container(
                                height: height * 0.055,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                    color: Colormanager.ambercolor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.003,
                                  width: width * 0.25,
                                  color: Colormanager.textcolors,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colormanager.textcolors,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.003,
                                  width: width * 0.25,
                                  color: Colormanager.textcolors,
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[900],
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Icon(
                                          Icons.facebook_sharp,
                                          color: Colormanager.textcolors,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.06,
                                  ),
                                  InkWell(
                                    // onTap: () {
                                    //   signInwithgoogle(context);
                                    // },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          "G",
                                          style: TextStyle(
                                              fontSize: width * 0.06,
                                              color: Colormanager.textcolors,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.06,
                                  ),
                                  Container(
                                    height: height * 0.06,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colormanager.headingcolor,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        Icons.apple,
                                        color: Colormanager.textcolors,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
