import 'dart:convert';

class ContactData {
  List<Datum> data;

  ContactData({
    required this.data,
  });

  factory ContactData.fromRawJson(String str) =>
      ContactData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
        data: List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Datum {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
