import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactDetailsPage extends StatelessWidget {
  final String name;
  final String phone;
  final String avatar;

  const ContactDetailsPage({
    Key? key,
    required this.name,
    required this.phone,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[300],
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 5),
            child: const Text(
              "Edit Contact",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              // color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(avatar),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _actionCard(
                        cardText: "Message",
                        cardIcon: Icons.message,
                      ),
                      _actionCard(
                        cardText: "Call",
                        cardIcon: Icons.call,
                      ),
                      _actionCard(
                        cardText: "Video",
                        cardIcon: Icons.video_call,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _detailListTile(
                  child: ListTile(
                    title: const Text(
                      'Mobile | Indonesia',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    subtitle: Text(
                      phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                _detailListTile(
                  child: ListTile(
                    title: const Text('Whatsapp'),
                    trailing: SvgPicture.asset(
                      'assets/icons/icons8-whatsapp.svg',
                    ),
                  ),
                ),
                _detailListTile(
                  child: ListTile(
                    title: const Text('Telegram'),
                    trailing: SvgPicture.asset(
                      'assets/icons/icons8-telegram.svg',
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Add to Favourites'),
                ),
                const ListTile(
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  leading: Icon(Icons.block),
                  title: Text('Block this Number'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard({
    required String cardText,
    required IconData cardIcon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 60,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              cardIcon,
              color: Colors.black,
            ),
            Text(
              cardText,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailListTile({
    required ListTile child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
