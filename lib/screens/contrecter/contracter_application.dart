import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:labour_app/utiles/model/appliedjobmodal.dart';
import 'package:labour_app/utiles/model/static_data.dart';
import 'package:labour_app/utiles/model/workerstatic_data.dart';
=======
import 'package:labour_app/screens/contrecter/jobapplicaationclass.dart';
>>>>>>> 98af01ba1616695c45d7bd7ba4636195502520cd

class Applicationlist extends StatefulWidget {
  const Applicationlist({super.key});

  @override
  State<Applicationlist> createState() => _ApplicationlistState();
}

class _ApplicationlistState extends State<Applicationlist> {
  var height, width;
  @override
  var jobapplyworkerid;

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/background.jpeg"),
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      height: height * 0.34,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.06, top: height * 0.05),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.24, top: height * 0.05),
                                  child: Text(
                                    "Job Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height * 0.03,
                                            right: width * 0.3),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "plaster",
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: width * 0.06,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Paster Required",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.04,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                "Salary(Hourly) 30.0",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.04,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: height * 0.03),
                                  child: Container(
                                      height: height * 0.11,
                                      width: width * 0.21,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("images/person.png"))),
                                )
                              ],
                            ),
                          ),
<<<<<<< HEAD
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("appliedjobs")
                            .doc(StaticData.uid)
                            .collection("appliedworkers")
                            .snapshots(),
                        builder: (context, snapshot) {
                          return snapshot.data == null
                              ? Center(child: CircularProgressIndicator())
                              : Container(
                                  height: height,
                                  width: width,
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: height * 0.27,
                                          width: width * 0.94,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            height: height * 0.33,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.02),
                                                        child: Container(
                                                            height:
                                                                height * 0.12,
                                                            width: width * 0.21,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Image(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "images/person.png"))),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Apply Date",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.orange,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  width * 0.03),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "2023-01-05",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  width * 0.03),
                                                        ),
                                                      ),
                                                      Text(
                                                        "02-20",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                width * 0.03),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: height * 0.32,
                                                  width: width * 0.7,
                                                  //color: Colors.blue,
                                                  child: Column(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.02,
                                                                left: width *
                                                                    0.25),
                                                        child: Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  "workername"),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  width * 0.05),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: height *
                                                                    0.01,
                                                                right: width *
                                                                    0.06),
                                                        child: Container(
                                                          child: Text(
                                                            "____________",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  width * 0.04,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.02),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: width *
                                                                        0.01),
                                                                child: Text(
                                                                  "Job Title",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Text(
                                                                "Gender",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Experience",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.02),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        "jobtitle"),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: width *
                                                                        0.09),
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          "workergender"),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    right: width *
                                                                        0.04),
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          "workerexperience"),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.03),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: width *
                                                                            0.1),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.05,
                                                                  width: width *
                                                                      0.23,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Reject",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: width *
                                                                              0.04,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    right:
                                                                        width *
                                                                            0.1),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'appliedjobs')
                                                                        .doc(StaticData
                                                                            .uid)
                                                                        .collection(
                                                                            'appliedworkers')
                                                                        .doc(StaticData
                                                                            .appliedworkerid)
                                                                        .update({
                                                                      'status':
                                                                          'accepted'
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.05,
                                                                    width:
                                                                        width *
                                                                            0.23,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          233,
                                                                          213,
                                                                          32),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Accept",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: width *
                                                                                0.04,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                        }),
                  )
                ]),
              ),
            ],
=======
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.7, top: height * 0.005),
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Posted Time :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "22:40",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: width * 0.03,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.45, top: height * 0.03),
                            child: Text(
                              "Total Application      4",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height * 0.65,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            itemCount: Application.jobsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * 0.3,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: height * 0.02),
                                              child: Container(
                                                  height: height * 0.12,
                                                  width: width * 0.21,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "images/person.png"))),
                                            ),
                                            Text(
                                              "Apply Date",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: width * 0.03,
                                              ),
                                            ),
                                            Text(
                                              "2021-04-23",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                            Text(
                                              "02:20",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                  left: width * 0.25),
                                              child: Text(
                                                Application
                                                    .jobsList[index].name!,
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
                                                    "Job Title",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Gender",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Experience",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: height * 0.02),
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Supervioser",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: width * 0.1),
                                                      child: Text(
                                                        "Male",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: width * 0.05),
                                                      child: Text(
                                                        "6 Years",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: width * 0.03),
                                                      child: Container(
                                                        height: height * 0.05,
                                                        width: width * 0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Reject",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: width * 0.14),
                                                      child: Container(
                                                        height: height * 0.05,
                                                        width: width * 0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              219,
                                                              59),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
>>>>>>> 98af01ba1616695c45d7bd7ba4636195502520cd
          ),
        ),
      ),
    );
  }
}
