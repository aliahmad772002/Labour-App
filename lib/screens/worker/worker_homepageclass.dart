class JobsModel {
  String? name;
  String? subject;
  String? description;
  String? price;

  JobsModel({this.description, this.name, this.subject, this.price});

  static List<JobsModel> jobsList = [
    JobsModel(
        description:
            "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "Google",
        price: "30.0",
        subject: "Paster Required"),
    JobsModel(
        description:
            "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "Pakistan",
        price: "20.0",
        subject: "Cleaner Required"),
    JobsModel(
        description:
            "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "India",
        price: "50.0",
        subject: "dirty Required"),
    JobsModel(
        description:
            "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "Google",
        price: "30.0",
        subject: "Paster Required"),
  ];
}
