// api key not shared on github

import 'dart:convert';
import 'dart:core';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:zad/keys/keys.dart';
import 'package:zad/models/services/FCM_DB.dart';
import 'package:zad/models/services/firebase_services.dart';


class FcmServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Future<String?> getUserFCMToken() async {

    String? token = await messaging.getToken();
    print("FCM Token: $token");
    return token;
  }


  Future<String> getAccessToken() async {
    try {
      messaging.requestPermission();
      // Your client ID and client secret obtained from Google Cloud Console
      final serviceAccountJson = APIKeys().key;

      List<String> scopes = [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/firebase.database",
        "https://www.googleapis.com/auth/firebase.messaging"
      ];

      http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      // Obtain the access token
      auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client
      );

      // Close the HTTP client
      client.close();

      // Return the access token
      return credentials.accessToken.data;
    } catch (e) {
      print('Error obtaining access token: $e');
      rethrow; // Re-throw to allow further error handling
    }
  }

  Future<void> sendFCMMessage(String title, String body, String userID) async {
    try {
      final String serverKey = await getAccessToken(); // Your FCM access token
      final String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/${APIKeys().AppID}/messages:send';
      final String? currentFCMToken = await getUserFCMToken();
      final String? TargetFCMToken = await FCMDB().LoadFCMToken(userID);
      if (currentFCMToken == null) {
        print('Failed to retrieve FCM token');
        return;
      }
      print("fcmkey : $currentFCMToken");

      final Map<String, dynamic> message = {
        'message': {
          'token':TargetFCMToken ,
          'notification': {
            'body': body,
            'title': title,
          },
          'data': {
            'current_user_fcm_token': currentFCMToken,
          },
        }
      };

      final http.Response response = await http.post(
        Uri.parse(fcmEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverKey',
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print('FCM message sent successfully ${response.body}');
      } else {
        print('Failed to send FCM message: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error sending FCM message: $e');
    }
  }
}
