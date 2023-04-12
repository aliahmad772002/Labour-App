import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:labour_app/custom_clippers/Clipper1.dart';
import 'package:labour_app/screens/worker/myRadioOption.dart';
import 'package:labour_app/screens/worker/worker_login.dart';
import 'package:labour_app/utiles/colors.dart';
import 'package:labour_app/utiles/model/worker_usermodel.dart';

class Worker_information extends StatefulWidget {
  String username;
  String email;
  String password;
  String confirmpwd;
  Worker_information(
      {super.key,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmpwd});

  @override
  State<Worker_information> createState() => _Worker_informationState();
}

class _Worker_informationState extends State<Worker_information> {
  TextEditingController jobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();

  var selectdate;

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  void signUp2() async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: widget.email, password: widget.password);
      if (credential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Worker_login(),
            ));
        postdatatoFirebase();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          errorMessage = "Invalid Email!";
          break;
        case "wrong-password":
          errorMessage = "Wrong Password";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(
        msg: errorMessage!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void postdatatoFirebase() async {
    User user = auth.currentUser!;
    String id = user.uid;
    Workerusermodel model = Workerusermodel(
      uname: widget.username,
      email: widget.email,
      password: widget.password,
      cnfpassword: widget.confirmpwd,
      phoneNO: phoneController.text,
      uid: id,
      job: jobController.text,
      gender: _groupValue,
      experience: experiencecontroller.text,
      dateofbirth: selectdate,
    );
    await FirebaseFirestore.instance
        .collection('worker user')
        .doc(id)
        .set(model.toMap());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          height: height,
          width: width,
          child: Image(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.04,
              width: width * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colormanager.headingcolor.withOpacity(0.7),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colormanager.textcolors,
                size: width * 0.05,
              ),
            ),
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
              child: Image(
                image: AssetImage("images/build.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height * 0.13,
                  child: Image(
                    image: AssetImage("images/kjob.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
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
                        'Basic Information',
                        style: TextStyle(color: Colormanager.textcolors),
                      ),
                      Container(
                        height: height * 0.06,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: IntlPhoneField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                            // onCountryChanged: (country) {
                            //   print('Country changed to: ' + country.name);
                            // },
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Job Title',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.06,
                              width: width * 0.5,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: jobController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  // labelText: 'Company',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.06,
                              width: width * 0.5,
                              // color: Colors.amber,
                              child: Row(
                                children: [
                                  MyRadioOption<String>(
                                    value: 'Male',
                                    groupValue: _groupValue,
                                    onChanged: _valueChangedHandler(),
                                    // label: '1',
                                    text: 'Male',
                                  ),
                                  MyRadioOption<String>(
                                    value: 'Female',
                                    groupValue: _groupValue,
                                    onChanged: _valueChangedHandler(),
                                    // label: '2',
                                    text: 'Female',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.1,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Experience',
                                    style: TextStyle(
                                        color: Colormanager.textcolors,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 15),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: experiencecontroller,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter some text';
                                          }

                                          return null;
                                        },
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                          labelText: 'year',
                                          labelStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),

                                          // Here is key idea
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Date of Birth',
                                    style: TextStyle(
                                        color: Colormanager.textcolors,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          theme: const DatePickerTheme(
                                            containerHeight: 210.0,
                                          ),
                                          showTitleActions: true,
                                          minTime: DateTime(1900, 1, 1),
                                          maxTime: DateTime(2100, 1, 1),
                                          onConfirm: (date) {
                                        selectdate =
                                            '${date.year} - ${date.month} - ${date.day}';

                                        setState(() {
                                          datecontroller.text = selectdate;
                                        });
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: Container(
                                      height: height * 0.05,
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "select date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          signUp2();
                        },
                        child: Container(
                          height: height * 0.055,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                              color: Colormanager.ambercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
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
