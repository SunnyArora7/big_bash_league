class HomeService {
  Map<String, dynamic> generateMockData() {
    return {
      'team1': 'Team A',
      'team2': 'Team B',
      'score': '101/2',
      'overs': 15.3,
      'wickets': 2,
      'team1Odds': 1.8,
      'team2Odds': 2.2,
      'latestEvent': 'Wicket: Player X out',
      'oddsTrends': [
        {'time': '2025-01-17T14:00:00Z', 'odds': 1.8, 'team': 'Team A'},
        {'time': '2025-01-17T14:01:00Z', 'odds': 1.9, 'team': 'Team A'},
        {'time': '2025-01-17T14:02:00Z', 'odds': 2.0, 'team': 'Team B'}
      ],
    };
  }
}
