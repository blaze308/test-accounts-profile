import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String userId = "6d475484-c5d6-492d-98c7-27b0733806b1";
  String? token = dotenv.get("API_TOKEN");

  Future<void> updateAccount({
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    String url = "https://fixit-testing.tuulbox.app/api/accounts/$userId/";

    final response = await http.patch(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "firstname": firstName,
        "lastname": lastName,
        "address": address,
        "phoneNumber": phoneNumber
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      print("Profile updated successfully: ${response.body}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Failed to update profile. Error: ${response.reasonPhrase}"),
          backgroundColor: Colors.red,
        ),
      );
      print("Error ${response.statusCode}: ${response.body}");
    }
  }
}
