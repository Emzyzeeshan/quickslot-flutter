import 'package:flutter/material.dart';
import '../services/booking_service.dart';

class BookingProvider extends ChangeNotifier {

  final BookingService service =
  BookingService();

  bool loading = false;

  Future<bool> bookSlot({
    required String userId,
    required String slotId,
  }) async {

    try {

      loading = true;

      notifyListeners();

      await service.bookSlot(
        userId: userId,
        slotId: slotId,
      );

      loading = false;

      notifyListeners();

      return true;

    } catch (e) {

      loading = false;

      notifyListeners();

      return false;
    }
  }
}