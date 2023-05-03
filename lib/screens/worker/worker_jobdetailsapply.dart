import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:labour_app/utiles/model/appliedjobmodal.dart';
import 'package:labour_app/utiles/model/contracter_jobpostmodel.dart';
import 'package:labour_app/utiles/model/static_data.dart';
import 'package:labour_app/utiles/model/worker_usermodel.dart';

import 'package:labour_app/utiles/model/workerstatic_data.dart';

class Jobdetail extends StatefulWidget {
  Jobdetail({super.key, required this.model});
  Contracter_jobpostmodel? model;
  @override
  State<Jobdetail> createState() => _JobdetailState();
}

class _JobdetailState extends State<Jobdetail> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Expanded(
            child: Container(
              height: height,
              width: width,
              color: Colors.amber,
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
                    height: height,
                    width: width,
                    color: Colors.black.withOpacity(0.6),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.03,
                                          right: width * 0.05),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.model!.name.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              widget.model!.jobtitle.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
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
                                          right: width * 0.05,
                                          top: height * 0.02),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Salary(Hourly)   :",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  widget.model!.hourlyprice
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Posted Time   :",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  widget.model!.time.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    // fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Container(
                                    height: height * 0.12,
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
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.05),
                          child: Container(
                            height: height * 0.09,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.13),
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.34,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 230, 200, 112),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Job Description",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.13),
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.34,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Location",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.58,
                          width: width,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    jobdetails();
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    color: Colors.amber,
                                    child: Center(child: Text("Apply Job")),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void jobdetails() async {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('workerUser')
        .doc(workerStaticData.uid)
        .get()
        .then((value) async {
      Workerusermodel model = Workerusermodel.fromMap({});
      Appliedjobmodal model1 = Appliedjobmodal(
        workername: model.uname,
        workergender: model.gender,
        workerexperience: model.experience,
        workertitle: model.job,
        applieddate: formatter,
      );
      await firebaseFirestore
          .collection('appliedjobs')
          .doc(StaticData.jobcontuid)
          .collection(StaticData.jobconttitle)
          .doc(workerStaticData.uid)
          .set(model1.toMap());
    });

    Fluttertoast.showToast(msg: "Success");
  }

  //     .get()
  //     .then((value) {
  //   setState(() {

  // Appliedjobmodal modal =
  //     Appliedjobmodal(workername: Workerusermodel.fromMap());
}
