import 'dart:async';
import 'dart:convert';

import 'package:big_bash_league/home/model/live_score_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LiveCricketController extends GetxController {
  Rx<LiveScoreModel> liveScoreModel = LiveScoreModel().obs;

  // Timer for polling the API every 30 seconds
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startPolling(); // Start the polling when the controller is initialized
  }

  // Start polling to call the API repeatedly every 30 seconds
  void startPolling() {
    // Initial call to fetch the data
    getData();

    // Set up a timer to call the API every 30 seconds
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      getData();
    });
  }

  // Stop the polling when it's no longer needed (e.g., when the controller is disposed)
  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer
    super.onClose();
  }

  // Method to fetch data from the API
  Future<void> getData() async {
    var headers = {'Authorization': 'Bearer 0IJMxE0ZuEyIR-ZdjORyoA'};
    var request = http.Request(
      'GET',
      Uri.parse(
          'https://cricket.sportdevs.com/matches-innings?match_id=eq.24181'),
    );

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        print('Response Body: $responseBody');

        var data = json.decode(responseBody);

        // Update the live score data
        liveScoreModel.value = LiveScoreModel.fromJson(data[0]);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
