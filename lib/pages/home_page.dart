import 'package:contacts_app/widgets/contact_item.dart';
import 'package:contacts_app/models/contact_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<ContactData> _contactData;

  @override
  void initState() {
    super.initState();
    _contactData = fetchContacts();
  }

  Future<ContactData> fetchContacts() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    if (response.statusCode == 200) {
      return ContactData.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load contacts');
    }
  }

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
        child: FutureBuilder<ContactData>(
          future: _contactData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  Datum contact = snapshot.data!.data[index];
                  return ContactItem(
                    firstName: contact.firstName,
                    lastName: contact.lastName,
                    email: contact.email,
                    avatar: contact.avatar,
                  );
                },
              );
            } else {
              return const Center(child: Text('No contacts found.'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade200,
        shape: const CircleBorder(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
