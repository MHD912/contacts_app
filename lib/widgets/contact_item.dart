import 'package:contacts_app/pages/contact_details_page.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const ContactItem({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactDetailsPage(
              name: "$firstName $lastName",
              email: email,
              avatar: avatar,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              child: ClipOval(
                child: Image(
                  image: NetworkImage(avatar),
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
