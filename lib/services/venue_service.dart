import 'package:dio/dio.dart';

import '../core/network.dart';

class VenueService {

  final Dio dio = Dio();

  Future<List<dynamic>> getVenues() async {

    final response =
    await dio.get(
      '${ApiClient.baseUrl}/venues',
    );

    return response.data;
  }
}