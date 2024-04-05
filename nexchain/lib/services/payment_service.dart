import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nexchain/models/payment.dart';

class PaymentService {
  final String baseUrl = 'http://localhost:8084/api/payments';

  Future<Payment> getPaymentById(int paymentId) async {
    final response = await http.get(Uri.parse('$baseUrl/$paymentId'));
    if (response.statusCode == 200) {
      return Payment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load payment');
    }
  }
}