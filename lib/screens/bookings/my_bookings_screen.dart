import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_booking_provider.dart';
import '../../providers/user_provider.dart';

class MyBookingsScreen
    extends StatefulWidget {

  const MyBookingsScreen({
    super.key,
  });

  @override
  State<MyBookingsScreen>
  createState() =>
      _MyBookingsScreenState();
}

class _MyBookingsScreenState
    extends State<MyBookingsScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      final userId =
      context
          .read<UserProvider>()
          .userId!;

      context
          .read<MyBookingProvider>()
          .loadBookings(
        userId,
      );
    });
  }

  @override
  Widget build(
      BuildContext context) {

    final provider =
    context.watch<
        MyBookingProvider>();

    final userId =
    context
        .read<UserProvider>()
        .userId!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookings',
        ),
      ),
      body: provider.loading

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

          : provider.bookings.isEmpty

          ? const Center(
        child: Text(
          'No Bookings',
        ),
      )

          : ListView.builder(
        itemCount:
        provider
            .bookings
            .length,
        itemBuilder:
            (_, index) {

          final booking =
          provider
              .bookings[
          index];

          return Card(
            margin:
            const EdgeInsets
                .all(10),
            child: Padding(
              padding:
              const EdgeInsets
                  .all(12),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [

                  Text(
                    booking
                        .venueName,
                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight
                          .bold,
                      fontSize:
                      18,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    '${booking.startTime} - ${booking.endTime}',
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed:
                        () async {

                      await provider
                          .cancelBooking(
                        booking.id,
                        userId,
                      );

                      ScaffoldMessenger.of(
                          context)
                          .showSnackBar(
                        const SnackBar(
                          content:
                          Text(
                            'Booking Cancelled',
                          ),
                        ),
                      );
                    },
                    child:
                    const Text(
                      'Cancel',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}