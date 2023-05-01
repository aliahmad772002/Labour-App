// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contracter_jobpostmodel {
  String? jobtitle;
  String? description;
  String? category;
  String? hourlyprice;
  String? date;
  String? id;
  String? name;
  Contracter_jobpostmodel({
    this.jobtitle,
    this.description,
    this.category,
    this.hourlyprice,
    this.date,
    this.id,
    this.name,
  });

  Contracter_jobpostmodel copyWith({
    String? jobtitle,
    String? description,
    String? category,
    String? hourlyprice,
    String? date,
    String? id,
    String? name,
  }) {
    return Contracter_jobpostmodel(
      jobtitle: jobtitle ?? this.jobtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      hourlyprice: hourlyprice ?? this.hourlyprice,
      date: date ?? this.date,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobtitle': jobtitle,
      'description': description,
      'category': category,
      'hourlyprice': hourlyprice,
      'date': date,
      'id': id,
      'name': name,
    };
  }

  factory Contracter_jobpostmodel.fromMap(Map<String, dynamic> map) {
    return Contracter_jobpostmodel(
      jobtitle: map['jobtitle'] != null ? map['jobtitle'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      hourlyprice:
          map['hourlyprice'] != null ? map['hourlyprice'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contracter_jobpostmodel.fromJson(String source) =>
      Contracter_jobpostmodel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contracter_jobpostmodel(jobtitle: $jobtitle, description: $description, category: $category, hourlyprice: $hourlyprice, date: $date, id: $id, name: $name)';
  }

  @override
  bool operator ==(covariant Contracter_jobpostmodel other) {
    if (identical(this, other)) return true;

    return other.jobtitle == jobtitle &&
        other.description == description &&
        other.category == category &&
        other.hourlyprice == hourlyprice &&
        other.date == date &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return jobtitle.hashCode ^
        description.hashCode ^
        category.hashCode ^
        hourlyprice.hashCode ^
        date.hashCode ^
        id.hashCode ^
        name.hashCode;
  }
}
