import 'package:flutter/material.dart';

import '../models/slot_model.dart';
import '../services/slot_service.dart';

class SlotProvider
    extends ChangeNotifier {

  final SlotService service =
  SlotService();

  bool loading = false;

  List<SlotModel> slots = [];

  Future<void> loadSlots(
      String venueId,
      String date,
      ) async {

    loading = true;

    notifyListeners();

    final response =
    await service.getSlots(
      venueId,
      date,
    );

    slots = response
        .map<SlotModel>(
          (e) => SlotModel.fromJson(e),
    )
        .toList();

    loading = false;

    notifyListeners();
  }
}