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

    try {
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
        _showErrorMessage(context, response);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("An error occurred. Please check your internet connection."),
          backgroundColor: Colors.red,
        ),
      );
      print("Network error: $e");
    }
  }

  void _showErrorMessage(BuildContext context, http.Response response) {
    String errorMessage = "Failed to update profile.";
    try {
      final Map<String, dynamic> errorBody = jsonDecode(response.body);
      if (errorBody.containsKey('message')) {
        errorMessage = errorBody['message'];
      } else if (errorBody.containsKey('error')) {
        errorMessage = errorBody['error'];
      }
    } catch (e) {
      errorMessage += " Please try again.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "$errorMessage (Error: ${response.statusCode} - ${response.reasonPhrase})"),
        backgroundColor: Colors.red,
      ),
    );
    print("Error ${response.statusCode}: ${response.body}");
  }
}
