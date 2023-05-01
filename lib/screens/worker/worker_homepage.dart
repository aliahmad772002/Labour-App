import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Workerhomepage extends StatefulWidget {
  const Workerhomepage({super.key});

  @override
  State<Workerhomepage> createState() => _WorkerhomepageState();
}

class _WorkerhomepageState extends State<Workerhomepage> {
  TextEditingController searchController = TextEditingController();

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: height,
          width: width,
          //color: Colors.amber,
          child: Stack(
            children: [
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
                height: height * 0.3,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: height * 0.1,
                        width: width,
                        child: Image(
                            color: Colors.white,
                            image: AssetImage("images/kjob.png")),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: height * 0.02,
                        width: width * 0.5,
                        child: Center(
                          child: Text(
                            "Perfect job for you",
                            style: TextStyle(
                                color: Colors.white, fontSize: width * 0.03),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.9,
                        //color: Colors.amber,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: height * 0.07,
                                  width: width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    // border:
                                    //     Border.all(color: Colors.black, width: 2)
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * 0.07,
                                        width: width * 0.61,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black, width: 2)),
                                        child: Center(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 20, left: 20),
                                              // padding: EdgeInsets.only(
                                              //     right: width * 0.33),
                                              child: TextFormField(
                                                controller: searchController,
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  labelText: 'Search Here...',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              )
                                              // child: Text(
                                              //   " Search Here...",
                                              //   style: TextStyle(
                                              //       color: Colors.black54,
                                              //       fontSize: width * 0.04),
                                              // ),
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.search,
                                        color: Colors.black54,
                                        size: 28,
                                      ),
                                    ],
                                  )),
                              Container(
                                height: height * 0.05,
                                width: width * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),

              StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('jobs').snapshots(),
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? Center(child: CircularProgressIndicator())
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: height * 0.55,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.33,
                                        width: width,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: height * 0.06),
                                              child: Container(
                                                height: height * 0.12,
                                                width: width * 0.21,
                                                decoration: BoxDecoration(
                                                    // color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image(
                                                    // color: Colors.white,
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "images/person.png")),
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
                                                        left: width * 0.02),
                                                    child: Text(
                                                      snapshot.data!.docs[index]
                                                          .get('name'),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: height * 0.01),
                                                    child: Container(
                                                      child: Text(
                                                        "______________________________________",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
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
                                                          "Subject:",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      199,
                                                                      255,
                                                                      153,
                                                                      0),
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: width *
                                                                      0.1),
                                                          child: Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    'jobtitle'),
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
                                                  Text(
                                                    "Description:",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            199, 255, 153, 0),
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        .get('description'),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.04,
                                                    ),
                                                  ),
                                                  Text(
                                                    "______________________________________",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          199, 255, 153, 0),
                                                      fontSize: width * 0.04,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: width * 0.1,
                                                        top: height * 0.02),
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Hourly price",
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
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    'hourlyprice'),
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
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.03),
                                                            child: Container(
                                                              height:
                                                                  height * 0.05,
                                                              width:
                                                                  width * 0.21,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .orange,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Detail",
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
                          );
                  }),
              // Padding(
              //   padding: EdgeInsets.only(top: height * 0.34),
              //   child: Container(
              //     height: height,
              //     width: width,
              //     //color: Colors.pink,
              //     child: SingleChildScrollView(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Container(
              //               height: height * 0.33,
              //               width: width,
              //               decoration: BoxDecoration(
              //                   color: Colors.black.withOpacity(0.6),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Padding(
              //                     padding:
              //                         EdgeInsets.only(bottom: height * 0.06),
              //                     child: Container(
              //                         height: height * 0.12,
              //                         width: width * 0.21,
              //                         decoration: BoxDecoration(
              //                             color: Colors.black,
              //                             borderRadius:
              //                                 BorderRadius.circular(10)),
              //                         child: Image(
              //                             color: Colors.white,
              //                             fit: BoxFit.fill,
              //                             image:
              //                                 AssetImage("images/person.png"))),
              //                   ),
              //                   Container(
              //                     height: height * 0.32,
              //                     width: width * 0.7,
              //                     //color: Colors.blue,
              //                     child: Column(
              //                       // mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               top: height * 0.02,
              //                               left: width * 0.02),
              //                           child: Text(
              //                             "Google",
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               bottom: height * 0.01),
              //                           child: Container(
              //                             child: Text(
              //                               "______________________________________",
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         Container(
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Text(
              //                                 "Subject:",
              //                                 style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         199, 255, 153, 0),
              //                                     fontSize: width * 0.04,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     right: width * 0.1),
              //                                 child: Text(
              //                                   "Paster Required",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Text(
              //                           "Description:",
              //                           style: TextStyle(
              //                               color: Color.fromARGB(
              //                                   199, 255, 153, 0),
              //                               fontSize: width * 0.04,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         Text(
              //                           "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Text(
              //                           "______________________________________",
              //                           style: TextStyle(
              //                             color:
              //                                 Color.fromARGB(199, 255, 153, 0),
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               right: width * 0.1,
              //                               top: height * 0.02),
              //                           child: Container(
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   "Hourly price",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Text(
              //                                   "30.0",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Padding(
              //                                   padding: EdgeInsets.only(
              //                                       left: width * 0.03),
              //                                   child: Container(
              //                                     height: height * 0.05,
              //                                     width: width * 0.21,
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.orange,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10),
              //                                     ),
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Detail",
              //                                         style: TextStyle(
              //                                             color: Colors.black,
              //                                             fontSize:
              //                                                 width * 0.04,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               height: height * 0.33,
              //               width: width,
              //               decoration: BoxDecoration(
              //                   color: Colors.black.withOpacity(0.6),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Padding(
              //                     padding:
              //                         EdgeInsets.only(bottom: height * 0.06),
              //                     child: Container(
              //                         height: height * 0.12,
              //                         width: width * 0.21,
              //                         decoration: BoxDecoration(
              //                             color: Colors.black,
              //                             borderRadius:
              //                                 BorderRadius.circular(10)),
              //                         child: Image(
              //                             color: Colors.white,
              //                             fit: BoxFit.fill,
              //                             image:
              //                                 AssetImage("images/person.png"))),
              //                   ),
              //                   Container(
              //                     height: height * 0.32,
              //                     width: width * 0.7,
              //                     //color: Colors.blue,
              //                     child: Column(
              //                       // mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               top: height * 0.02,
              //                               left: width * 0.02),
              //                           child: Text(
              //                             "Google",
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               bottom: height * 0.01),
              //                           child: Container(
              //                             child: Text(
              //                               "______________________________________",
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         Container(
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Text(
              //                                 "Subject:",
              //                                 style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         199, 255, 153, 0),
              //                                     fontSize: width * 0.04,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     right: width * 0.1),
              //                                 child: Text(
              //                                   "Paster Required",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Text(
              //                           "Description:",
              //                           style: TextStyle(
              //                               color: Color.fromARGB(
              //                                   199, 255, 153, 0),
              //                               fontSize: width * 0.04,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         Text(
              //                           "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Text(
              //                           "______________________________________",
              //                           style: TextStyle(
              //                             color:
              //                                 Color.fromARGB(199, 255, 153, 0),
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               right: width * 0.1,
              //                               top: height * 0.02),
              //                           child: Container(
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   "Hourly price",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Text(
              //                                   "30.0",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Padding(
              //                                   padding: EdgeInsets.only(
              //                                       left: width * 0.03),
              //                                   child: Container(
              //                                     height: height * 0.05,
              //                                     width: width * 0.21,
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.orange,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10),
              //                                     ),
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Detail",
              //                                         style: TextStyle(
              //                                             color: Colors.black,
              //                                             fontSize:
              //                                                 width * 0.04,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               height: height * 0.33,
              //               width: width,
              //               decoration: BoxDecoration(
              //                   color: Colors.black.withOpacity(0.6),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Padding(
              //                     padding:
              //                         EdgeInsets.only(bottom: height * 0.06),
              //                     child: Container(
              //                         height: height * 0.12,
              //                         width: width * 0.21,
              //                         decoration: BoxDecoration(
              //                             color: Colors.black,
              //                             borderRadius:
              //                                 BorderRadius.circular(10)),
              //                         child: Image(
              //                             color: Colors.white,
              //                             fit: BoxFit.fill,
              //                             image:
              //                                 AssetImage("images/person.png"))),
              //                   ),
              //                   Container(
              //                     height: height * 0.32,
              //                     width: width * 0.7,
              //                     //color: Colors.blue,
              //                     child: Column(
              //                       // mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               top: height * 0.02,
              //                               left: width * 0.02),
              //                           child: Text(
              //                             "Google",
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               bottom: height * 0.01),
              //                           child: Container(
              //                             child: Text(
              //                               "______________________________________",
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         Container(
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Text(
              //                                 "Subject:",
              //                                 style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         199, 255, 153, 0),
              //                                     fontSize: width * 0.04,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     right: width * 0.1),
              //                                 child: Text(
              //                                   "Paster Required",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Text(
              //                           "Description:",
              //                           style: TextStyle(
              //                               color: Color.fromARGB(
              //                                   199, 255, 153, 0),
              //                               fontSize: width * 0.04,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         Text(
              //                           "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Text(
              //                           "______________________________________",
              //                           style: TextStyle(
              //                             color:
              //                                 Color.fromARGB(199, 255, 153, 0),
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               right: width * 0.1,
              //                               top: height * 0.02),
              //                           child: Container(
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   "Hourly price",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Text(
              //                                   "30.0",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Padding(
              //                                   padding: EdgeInsets.only(
              //                                       left: width * 0.03),
              //                                   child: Container(
              //                                     height: height * 0.05,
              //                                     width: width * 0.21,
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.orange,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10),
              //                                     ),
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Detail",
              //                                         style: TextStyle(
              //                                             color: Colors.black,
              //                                             fontSize:
              //                                                 width * 0.04,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               height: height * 0.33,
              //               width: width,
              //               decoration: BoxDecoration(
              //                   color: Colors.black.withOpacity(0.6),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   Padding(
              //                     padding:
              //                         EdgeInsets.only(bottom: height * 0.06),
              //                     child: Container(
              //                         height: height * 0.12,
              //                         width: width * 0.21,
              //                         decoration: BoxDecoration(
              //                             color: Colors.black,
              //                             borderRadius:
              //                                 BorderRadius.circular(10)),
              //                         child: Image(
              //                             color: Colors.white,
              //                             fit: BoxFit.fill,
              //                             image:
              //                                 AssetImage("images/person.png"))),
              //                   ),
              //                   Container(
              //                     height: height * 0.32,
              //                     width: width * 0.7,
              //                     //color: Colors.blue,
              //                     child: Column(
              //                       // mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               top: height * 0.02,
              //                               left: width * 0.02),
              //                           child: Text(
              //                             "Google",
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               bottom: height * 0.01),
              //                           child: Container(
              //                             child: Text(
              //                               "______________________________________",
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: width * 0.04,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         Container(
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Text(
              //                                 "Subject:",
              //                                 style: TextStyle(
              //                                     color: Color.fromARGB(
              //                                         199, 255, 153, 0),
              //                                     fontSize: width * 0.04,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     right: width * 0.1),
              //                                 child: Text(
              //                                   "Paster Required",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Text(
              //                           "Description:",
              //                           style: TextStyle(
              //                               color: Color.fromARGB(
              //                                   199, 255, 153, 0),
              //                               fontSize: width * 0.04,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         Text(
              //                           "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Text(
              //                           "______________________________________",
              //                           style: TextStyle(
              //                             color:
              //                                 Color.fromARGB(199, 255, 153, 0),
              //                             fontSize: width * 0.04,
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               right: width * 0.1,
              //                               top: height * 0.02),
              //                           child: Container(
              //                             child: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   "Hourly price",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Text(
              //                                   "30.0",
              //                                   style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: width * 0.04,
              //                                       fontWeight:
              //                                           FontWeight.bold),
              //                                 ),
              //                                 Padding(
              //                                   padding: EdgeInsets.only(
              //                                       left: width * 0.03),
              //                                   child: Container(
              //                                     height: height * 0.05,
              //                                     width: width * 0.21,
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.orange,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10),
              //                                     ),
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Detail",
              //                                         style: TextStyle(
              //                                             color: Colors.black,
              //                                             fontSize:
              //                                                 width * 0.04,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: height * 0.07,
              //     width: width,
              //     color: Colors.white,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           height: height * 0.05,
              //           width: width * 0.2,
              //           decoration: BoxDecoration(
              //               color: Colors.orange,
              //               borderRadius: BorderRadius.circular(22)),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Icon(
              //                 Icons.home,
              //                 color: Colors.black,
              //                 size: 19,
              //               ),
              //               Text(
              //                 "Home",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: width * 0.03),
              //               )
              //             ],
              //           ),
              //         ),
              //         Container(
              //           height: height * 0.05,
              //           width: width * 0.15,
              //           decoration: BoxDecoration(
              //               // color: Colors.orange,
              //               borderRadius: BorderRadius.circular(22)),
              //           child: Icon(
              //             Icons.shopping_bag,
              //             color: Colors.black,
              //             size: 20,
              //           ),
              //         ),
              //         Container(
              //           height: height * 0.05,
              //           width: width * 0.15,
              //           decoration: BoxDecoration(
              //               // color: Colors.orange,
              //               borderRadius: BorderRadius.circular(22)),
              //           child: Icon(
              //             Icons.settings,
              //             color: Colors.black,
              //             size: 21,
              //           ),
              //         ),
              //         Container(
              //           height: height * 0.05,
              //           width: width * 0.15,
              //           decoration: BoxDecoration(
              //               // color: Colors.orange,
              //               borderRadius: BorderRadius.circular(22)),
              //           child: Icon(
              //             Icons.person_outline,
              //             color: Colors.black,
              //             size: 24,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
