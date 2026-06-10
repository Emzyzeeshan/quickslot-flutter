import 'package:dio/dio.dart';

import '../core/network.dart';

class MyBookingService {

  final Dio dio = Dio();

  Future<List<dynamic>> getBookings(
      String userId) async {

    final response = await dio.get(
      '${ApiClient.baseUrl}/users/$userId/bookings',
    );

    return response.data;
  }

  Future<void> cancelBooking(
      String bookingId) async {

    await dio.delete(
      '${ApiClient.baseUrl}/bookings/$bookingId',
    );
  }
}