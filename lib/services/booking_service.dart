import 'package:dio/dio.dart';

import '../core/network.dart';

class BookingService {

  final Dio dio = Dio();

  Future<void> bookSlot({
    required String userId,
    required String slotId,
  }) async {

    await dio.post(
      '${ApiClient.baseUrl}/bookings',
      data: {
        'slotId': slotId,
      },
      options: Options(
        headers: {
          'x-user-id': userId,
        },
      ),
    );
  }
}