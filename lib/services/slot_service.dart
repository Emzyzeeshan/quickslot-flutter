import 'package:dio/dio.dart';

import '../core/network.dart';

class SlotService {

  final Dio dio = Dio();

  Future<List<dynamic>> getSlots(
      String venueId,
      String date,
      ) async {

    final response =
    await dio.get(
      '${ApiClient.baseUrl}/venues/$venueId/slots?date=$date',
    );

    return response.data;
  }
}