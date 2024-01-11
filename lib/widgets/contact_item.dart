import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const ContactItem({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$firstName $lastName'),
              Text(email),
              Text(phone),
            ],
          ),
        ],
      ),
    );
  }
}
