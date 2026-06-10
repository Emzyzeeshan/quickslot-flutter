import 'package:flutter/material.dart';

import '../models/booking_model.dart';
import '../services/my_booking_service.dart';

class MyBookingProvider
    extends ChangeNotifier {

  final MyBookingService service =
  MyBookingService();

  bool loading = false;

  List<BookingModel> bookings = [];

  Future<void> loadBookings(
      String userId) async {

    loading = true;

    notifyListeners();

    final response =
    await service.getBookings(
      userId,
    );

    bookings = response
        .map<BookingModel>(
          (e) => BookingModel.fromJson(e),
    )
        .toList();

    loading = false;

    notifyListeners();
  }

  Future<void> cancelBooking(
      String bookingId,
      String userId) async {

    await service.cancelBooking(
      bookingId,
    );

    await loadBookings(
      userId,
    );
  }
}