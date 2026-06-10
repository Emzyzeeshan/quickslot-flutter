import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../venues/venue_list_screen.dart';


class LoginScreen
    extends StatelessWidget {

  LoginScreen({super.key});

  final users = [
    { 'id': '87fc3f16-6d31-4cfe-bf88-43c766bb83b5', 'name': 'John' },
    { 'id': '60cde0a5-62fa-47b5-90db-c78d4bf11595', 'name': 'Sarah' },
    { 'id': '11f3b886-0a2f-4e3e-abc1-38e27d5f0e22', 'name': 'David' }
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