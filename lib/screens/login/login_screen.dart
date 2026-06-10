import 'package:flutter/material.dart';


class LoginScreen
    extends StatelessWidget {

  LoginScreen({super.key});

  final users = [
    {
      'id': 'USER_ID_1',
      'name': 'John'
    },
    {
      'id': 'USER_ID_2',
      'name': 'Sarah'
    },
    {
      'id': 'USER_ID_3',
      'name': 'David'
    }
  ];

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(
        title:
        const Text(
          'QuickSlot',
        ),
      ),
      body:
      ListView.builder(
        itemCount:
        users.length,
        itemBuilder:
            (_, index) {

          return ListTile(
            title:
            Text(
              users[index]
              ['name']!,
            ),
            onTap: () {

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) =>
              //         //VenueListScreen(),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}