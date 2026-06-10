import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../venues/venue_list_screen.dart';


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
              context.read<UserProvider>().selectUser(
                id: users[index]['id']!,
                name: users[index]['name']!,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      VenueListScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}