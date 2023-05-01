// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Workerusermodel {
  String? uname;
  String? email;
  String? password;
  String? cnfpassword;
  String? uid;
  String? phoneNO;
  String? job;
  String? gender;
  String? experience;
  String? dateofbirth;
  String? address;
  Workerusermodel({
    this.uname,
    this.email,
    this.password,
    this.cnfpassword,
    this.uid,
    this.phoneNO,
    this.job,
    this.gender,
    this.experience,
    this.dateofbirth,
    this.address,
  });

  Workerusermodel copyWith({
    String? uname,
    String? email,
    String? password,
    String? cnfpassword,
    String? uid,
    String? phoneNO,
    String? job,
    String? gender,
    String? experience,
    String? dateofbirth,
    String? address,
  }) {
    return Workerusermodel(
      uname: uname ?? this.uname,
      email: email ?? this.email,
      password: password ?? this.password,
      cnfpassword: cnfpassword ?? this.cnfpassword,
      uid: uid ?? this.uid,
      phoneNO: phoneNO ?? this.phoneNO,
      job: job ?? this.job,
      gender: gender ?? this.gender,
      experience: experience ?? this.experience,
      dateofbirth: dateofbirth ?? this.dateofbirth,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uname': uname,
      'email': email,
      'password': password,
      'cnfpassword': cnfpassword,
      'uid': uid,
      'phoneNO': phoneNO,
      'job': job,
      'gender': gender,
      'experience': experience,
      'dateofbirth': dateofbirth,
      'address': address,
    };
  }

  factory Workerusermodel.fromMap(Map<String, dynamic> map) {
    return Workerusermodel(
      uname: map['uname'] != null ? map['uname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      cnfpassword:
          map['cnfpassword'] != null ? map['cnfpassword'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      phoneNO: map['phoneNO'] != null ? map['phoneNO'] as String : null,
      job: map['job'] != null ? map['job'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      experience:
          map['experience'] != null ? map['experience'] as String : null,
      dateofbirth:
          map['dateofbirth'] != null ? map['dateofbirth'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Workerusermodel.fromJson(String source) =>
      Workerusermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Workerusermodel(uname: $uname, email: $email, password: $password, cnfpassword: $cnfpassword, uid: $uid, phoneNO: $phoneNO, job: $job, gender: $gender, experience: $experience, dateofbirth: $dateofbirth, address: $address)';
  }

  @override
  bool operator ==(covariant Workerusermodel other) {
    if (identical(this, other)) return true;

    return other.uname == uname &&
        other.email == email &&
        other.password == password &&
        other.cnfpassword == cnfpassword &&
        other.uid == uid &&
        other.phoneNO == phoneNO &&
        other.job == job &&
        other.gender == gender &&
        other.experience == experience &&
        other.dateofbirth == dateofbirth &&
        other.address == address;
  }

  @override
  int get hashCode {
    return uname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        cnfpassword.hashCode ^
        uid.hashCode ^
        phoneNO.hashCode ^
        job.hashCode ^
        gender.hashCode ^
        experience.hashCode ^
        dateofbirth.hashCode ^
        address.hashCode;
  }
}
