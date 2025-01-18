import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:big_bash_league/home/controller/live_cricket_controller.dart';

class LiveCricketScreen extends StatefulWidget {
  const LiveCricketScreen({super.key});

  @override
  State<LiveCricketScreen> createState() => _LiveCricketScreenState();
}

class _LiveCricketScreenState extends State<LiveCricketScreen> {
  final LiveCricketController liveCricketController =
      Get.put(LiveCricketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Cricket'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Obx(() {
        final liveScore = liveCricketController.liveScoreModel.value;

        if (liveScore == null || liveScore.innings == null) {
          return Center(child: CircularProgressIndicator());
        }

        final battingInnings = liveScore.innings![1];
        final bowlingInnings = liveScore.innings![0];

        // Get the score, overs, and wickets for both teams
        String battingScore = battingInnings.score?.toString() ?? '0/0';
        String battingWickets = battingInnings.wickets?.toString() ?? '0';
        String bowlingScore = bowlingInnings.score?.toString() ?? '0/0';
        String bowlingWickets = bowlingInnings.wickets?.toString() ?? '0';
        String battingOvers = battingInnings.overs?.toString() ?? '0.0';
        String bowlingOvers = bowlingInnings.overs?.toString() ?? '0.0';

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Live Score Section
                Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.blue.shade50,
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Batting Team Info
                        _teamInfo(
                          teamName: battingInnings.battingTeamName ?? 'Unknown',
                          score: battingScore,
                          wickets: battingWickets,
                          overs: battingOvers,
                          isBatting: true,
                        ),

                        // Bowling Team Info
                        _teamInfo(
                          teamName: bowlingInnings.bowlingTeamName ?? 'Unknown',
                          score: bowlingScore,
                          wickets: bowlingWickets,
                          overs: bowlingOvers,
                          isBatting: false,
                        ),
                      ],
                    ),
                  ),
                ),

                // Add other sections like trading values, updates, etc.
              ],
            ),
          ),
        );
      }),
    );
  }

  // Helper function to display team information
  Widget _teamInfo({
    required String teamName,
    required String score,
    required String wickets,
    required String overs,
    required bool isBatting,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          _buildStatRow(Icons.sports_cricket, 'Score', score),
          SizedBox(height: 8.0),
          _buildStatRow(Icons.sports_score, 'Wickets', wickets),
          SizedBox(height: 8.0),
          _buildStatRow(Icons.timer, 'Overs', overs),
        ],
      ),
    );
  }

  // Helper function to build a row with label and value
  Widget _buildStatRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20.0,
        ),
        SizedBox(width: 8.0),
        Text(
          '$label: $value',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
