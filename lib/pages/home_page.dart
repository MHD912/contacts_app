import 'package:contacts_app/pages/contact_details_page.dart';
import 'package:contacts_app/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Material(
          elevation: 2,
          child: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            leading: const Icon(Icons.menu),
            centerTitle: true,
            title: const Text('Contacts'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white38,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ContactItem(
              firstName: 'John',
              lastName: 'Doe',
              email: 'johndoe@example.com',
              phone: '123-456-7890',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ContactDetailsPage(
              name: "Mohammad Hamed",
              phone: "+963958748129",
              avatar: "avatar",
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
