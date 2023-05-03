import 'package:flutter/material.dart';

import 'package:labour_app/screens/worker/worker_myjobclass.dart';

class JobsPageScreen extends StatefulWidget {
  const JobsPageScreen({super.key});

  @override
  State<JobsPageScreen> createState() => _JobsPageScreenState();
}

class _JobsPageScreenState extends State<JobsPageScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Container(
                  height: height,
                  width: width,
                  // color: Colors.amber,
                  child: Stack(children: [
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/background.jpeg")),
                      ),
                    ),
                    Container(
                      height: height * 0.23,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.04,
                                left: width * 0.06,
                                right: width * 0.06),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Google",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: Container(
                                        height: height * 0.07,
                                        width: width * 0.12,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            border: Border.all(
                                                color: Colors.orange,
                                                width: 2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              // color: Colors.white,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "images/person.png")),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.05),
                            child: Text(
                              "APPLIED JOBS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height * 0.55,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            itemCount: Myjobs.jobsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * 0.27,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: height * 0.11),
                                        child: Container(
                                            height: height * 0.12,
                                            width: width * 0.21,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image(
                                                // color: Colors.white,
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "images/person.png"))),
                                      ),
                                      Container(
                                        height: height * 0.32,
                                        width: width * 0.7,
                                        //color: Colors.blue,
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: height * 0.02,
                                                  left: width * 0.02),
                                              child: Text(
                                                Myjobs.jobsList[index].name!,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: height * 0.01),
                                              child: Container(
                                                child: Text(
                                                  "______________",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Mansion",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            199, 255, 153, 0),
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: height * 0.05,
                                                    width: width * 0.22,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 161, 146, 12),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "Description:",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      199, 255, 153, 0),
                                                  fontSize: width * 0.04,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Myjobs
                                                  .jobsList[index].description!,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ])))),
    );
  }
}
