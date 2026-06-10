import 'package:flutter/material.dart';

import '../models/venue_model.dart';
import '../services/venue_service.dart';

class VenueProvider
    extends ChangeNotifier {

  final VenueService service =
  VenueService();

  bool loading = false;

  List<VenueModel> venues = [];

  Future<void> loadVenues() async {

    loading = true;

    notifyListeners();

    final response =
    await service.getVenues();

    venues = response
        .map<VenueModel>(
          (e) => VenueModel.fromJson(e),
    )
        .toList();

    loading = false;

    notifyListeners();
  }
}