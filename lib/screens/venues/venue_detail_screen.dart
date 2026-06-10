import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/slot_provider.dart';

class VenueDetailScreen
    extends StatefulWidget {

  final String venueId;
  final String venueName;

  const VenueDetailScreen({
    super.key,
    required this.venueId,
    required this.venueName,
  });

  @override
  State<VenueDetailScreen>
  createState() =>
      _VenueDetailScreenState();
}

class _VenueDetailScreenState
    extends State<VenueDetailScreen> {

  late String selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate =
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now());

    Future.microtask(() {

      context
          .read<SlotProvider>()
          .loadSlots(
        widget.venueId,
        selectedDate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
    context.watch<SlotProvider>();

    return Scaffold(
      appBar: AppBar(
        title:
        Text(widget.venueName),
      ),
      body: provider.loading
          ? const Center(
        child:
        CircularProgressIndicator(),
      )
          : GridView.builder(
        padding:
        const EdgeInsets.all(12),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemCount:
        provider.slots.length,
        itemBuilder:
            (_, index) {

          final slot =
          provider.slots[index];

          return Card(
            color:
            slot.available
                ? Colors.green
                : Colors.red,
            child: Center(
              child: Text(
                '${slot.startTime}\n${slot.endTime}',
                textAlign:
                TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}