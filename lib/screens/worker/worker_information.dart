import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:labour_app/custom_clippers/Clipper1.dart';
import 'package:labour_app/screens/worker/worker_signup.dart';
import 'package:labour_app/utiles/colors.dart';

class Worker_information extends StatefulWidget {
  const Worker_information({super.key});

  @override
  State<Worker_information> createState() => _Worker_informationState();
}

class _Worker_informationState extends State<Worker_information> {
  TextEditingController jobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.white),
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
                          // child: TextFormField(
                          //   // controller: usernameController,
                          //   keyboardType: TextInputType.name,
                          //   decoration: const InputDecoration(
                          //     focusedBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.white),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.white),
                          //     ),
                          //     labelText: 'User Name',
                          //     labelStyle: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 13,
                          //     ),
                          //   ),
                          // ),
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
                              child: TextFormField(
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
                      InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           contracter_information(),
                        //     ),
                        //   );
                        // },
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
