import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/venue_provider.dart';
import '../bookings/my_bookings_screen.dart';
import 'venue_detail_screen.dart';

class VenueListScreen extends StatefulWidget {
  const VenueListScreen({super.key});

  @override
  State<VenueListScreen> createState() =>
      _VenueListScreenState();
}

class _VenueListScreenState
    extends State<VenueListScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<VenueProvider>()
          .loadVenues();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
    context.watch<VenueProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Venues',
        ),
        actions: [

          IconButton(
            icon: const Icon(
              Icons.book_online,
            ),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const MyBookingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: provider.loading
          ? const Center(
        child:
        CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount:
        provider.venues.length,
        itemBuilder:
            (context, index) {

          final venue =
          provider.venues[index];

          return Card(
            child: ListTile(
              title:
              Text(venue.name),
              subtitle: Text(
                venue.location,
              ),
              trailing:
              Text(
                venue.sportType,
              ),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        VenueDetailScreen(
                          venueId:
                          venue.id,
                          venueName:
                          venue.name,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}