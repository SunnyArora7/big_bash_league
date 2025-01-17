import 'dart:async';

import 'package:big_bash_league/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final StreamController<Map<String, dynamic>> streamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Map<String, dynamic> matchData = {};
  // List<charts.Series> chartData = [];
  @override
  void onReady() {
    _startMockWebSocket();
    super.onReady();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  void _startMockWebSocket() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Map<String, dynamic> mockData = HomeService().generateMockData();
      streamController.add(mockData);
    });
  }
}
