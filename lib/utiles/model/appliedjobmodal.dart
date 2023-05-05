// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Appliedjobmodal {
  String? workername;
  String? workertitle;
  String? workergender;
  String? workerexperience;
  String? applieddate;
  String? appliedtime;
  String? contractorname;
  String? jobtitle;
  String? description;
  String? price;
  String? workerid;
  String? contacterid;
  String? status;
  Appliedjobmodal({
    this.workername,
    this.workertitle,
    this.workergender,
    this.workerexperience,
    this.applieddate,
    this.appliedtime,
    this.contractorname,
    this.jobtitle,
    this.description,
    this.price,
    this.workerid,
    this.contacterid,
    this.status,
  });

  Appliedjobmodal copyWith({
    String? workername,
    String? workertitle,
    String? workergender,
    String? workerexperience,
    String? applieddate,
    String? appliedtime,
    String? contractorname,
    String? jobtitle,
    String? description,
    String? price,
    String? workerid,
    String? contacterid,
    String? status,
  }) {
    return Appliedjobmodal(
      workername: workername ?? this.workername,
      workertitle: workertitle ?? this.workertitle,
      workergender: workergender ?? this.workergender,
      workerexperience: workerexperience ?? this.workerexperience,
      applieddate: applieddate ?? this.applieddate,
      appliedtime: appliedtime ?? this.appliedtime,
      contractorname: contractorname ?? this.contractorname,
      jobtitle: jobtitle ?? this.jobtitle,
      description: description ?? this.description,
      price: price ?? this.price,
      workerid: workerid ?? this.workerid,
      contacterid: contacterid ?? this.contacterid,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workername': workername,
      'workertitle': workertitle,
      'workergender': workergender,
      'workerexperience': workerexperience,
      'applieddate': applieddate,
      'appliedtime': appliedtime,
      'contractorname': contractorname,
      'jobtitle': jobtitle,
      'description': description,
      'price': price,
      'workerid': workerid,
      'contacterid': contacterid,
      'status': status,
    };
  }

  factory Appliedjobmodal.fromMap(Map<String, dynamic> map) {
    return Appliedjobmodal(
      workername:
          map['workername'] != null ? map['workername'] as String : null,
      workertitle:
          map['workertitle'] != null ? map['workertitle'] as String : null,
      workergender:
          map['workergender'] != null ? map['workergender'] as String : null,
      workerexperience: map['workerexperience'] != null
          ? map['workerexperience'] as String
          : null,
      applieddate:
          map['applieddate'] != null ? map['applieddate'] as String : null,
      appliedtime:
          map['appliedtime'] != null ? map['appliedtime'] as String : null,
      contractorname: map['contractorname'] != null
          ? map['contractorname'] as String
          : null,
      jobtitle: map['jobtitle'] != null ? map['jobtitle'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      workerid: map['workerid'] != null ? map['workerid'] as String : null,
      contacterid:
          map['contacterid'] != null ? map['contacterid'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appliedjobmodal.fromJson(String source) =>
      Appliedjobmodal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appliedjobmodal(workername: $workername, workertitle: $workertitle, workergender: $workergender, workerexperience: $workerexperience, applieddate: $applieddate, appliedtime: $appliedtime, contractorname: $contractorname, jobtitle: $jobtitle, description: $description, price: $price, workerid: $workerid, contacterid: $contacterid, status: $status)';
  }

  @override
  bool operator ==(covariant Appliedjobmodal other) {
    if (identical(this, other)) return true;

    return other.workername == workername &&
        other.workertitle == workertitle &&
        other.workergender == workergender &&
        other.workerexperience == workerexperience &&
        other.applieddate == applieddate &&
        other.appliedtime == appliedtime &&
        other.contractorname == contractorname &&
        other.jobtitle == jobtitle &&
        other.description == description &&
        other.price == price &&
        other.workerid == workerid &&
        other.contacterid == contacterid &&
        other.status == status;
  }

  @override
  int get hashCode {
    return workername.hashCode ^
        workertitle.hashCode ^
        workergender.hashCode ^
        workerexperience.hashCode ^
        applieddate.hashCode ^
        appliedtime.hashCode ^
        contractorname.hashCode ^
        jobtitle.hashCode ^
        description.hashCode ^
        price.hashCode ^
        workerid.hashCode ^
        contacterid.hashCode ^
        status.hashCode;
  }
}
