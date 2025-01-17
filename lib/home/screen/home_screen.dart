import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Syncfusion chart import
import 'package:big_bash_league/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black12 : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black12 : Colors.blueAccent,
        title: Text(
          'Live Cricket Trading',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<Map<String, dynamic>>(
          stream: homeController.streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              homeController.matchData = snapshot.data!;

              return ListView(
                children: [
                  _buildLiveScoreDisplay(),
                  SizedBox(height: 20),
                  _buildTradingOdds(),
                  SizedBox(height: 20),
                  _buildMatchEvents(),
                  SizedBox(height: 20),
                ],
              );
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Add refresh functionality or other actions here
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget _buildLiveScoreDisplay() {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Score: ${homeController.matchData['team1']} vs ${homeController.matchData['team2']}',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sports_cricket, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Score: ${homeController.matchData['score']}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.timer, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Overs: ${homeController.matchData['overs']}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sports, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Wickets: ${homeController.matchData['wickets']}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTradingOdds() {
    return Card(
      color: Colors.green[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trading Odds',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sports_baseball, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Team 1 Odds: ${homeController.matchData['team1Odds']}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sports_baseball, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Team 2 Odds: ${homeController.matchData['team2Odds']}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Syncfusion Chart for Odds Trends
            SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                labelRotation: 45,
                title: AxisTitle(text: 'Time'),
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Odds'),
                minimum: 1.5, // Adjust as needed
                maximum: 2.5, // Adjust as needed
                interval: 0.1, // Adjust the interval based on your data
              ),
              series: <CartesianSeries>[
                LineSeries<Map<String, dynamic>, DateTime>(
                  dataSource: homeController.matchData['oddsTrends'],
                  xValueMapper: (Map<String, dynamic> data, _) =>
                      DateTime.parse(data['time']),
                  yValueMapper: (Map<String, dynamic> data, _) => data['odds'],
                  name: 'Odds Trend',
                  color: Colors.green,
                  markerSettings: MarkerSettings(isVisible: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchEvents() {
    return Card(
      color: Colors.orange[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Events',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.event, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Event: ${homeController.matchData['latestEvent']}',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
