class LiveScoreModel {
  int? matchId;
  List<Innings>? innings;

  LiveScoreModel({this.matchId, this.innings});

  LiveScoreModel.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    if (json['innings'] != null) {
      innings = <Innings>[];
      json['innings'].forEach((v) {
        innings!.add(Innings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_id'] = matchId;
    if (innings != null) {
      data['innings'] = innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Innings {
  int? bye;
  int? wide;
  int? extra;
  int? overs;
  int? score;
  int? number;
  int? legBye;
  int? noBall;
  int? penalty;
  int? wickets;
  List<Partnerships>? partnerships;
  List<BattingLines>? battingLines;
  List<BowlingLines>? bowlingLines;
  int? battingTeamId;
  int? bowlingTeamId;
  String? battingTeamName;
  String? bowlingTeamName;
  String? battingTeamHashImage;
  String? bowlingTeamHashImage;

  Innings(
      {this.bye,
      this.wide,
      this.extra,
      this.overs,
      this.score,
      this.number,
      this.legBye,
      this.noBall,
      this.penalty,
      this.wickets,
      this.partnerships,
      this.battingLines,
      this.bowlingLines,
      this.battingTeamId,
      this.bowlingTeamId,
      this.battingTeamName,
      this.bowlingTeamName,
      this.battingTeamHashImage,
      this.bowlingTeamHashImage});

  Innings.fromJson(Map<String, dynamic> json) {
    bye = json['bye'];
    wide = json['wide'];
    extra = json['extra'];
    overs = json['overs'];
    score = json['score'];
    number = json['number'];
    legBye = json['leg_bye'];
    noBall = json['no_ball'];
    penalty = json['penalty'];
    wickets = json['wickets'];
    if (json['partnerships'] != null) {
      partnerships = <Partnerships>[];
      json['partnerships'].forEach((v) {
        partnerships!.add(Partnerships.fromJson(v));
      });
    }
    if (json['batting_lines'] != null) {
      battingLines = <BattingLines>[];
      json['batting_lines'].forEach((v) {
        battingLines!.add(BattingLines.fromJson(v));
      });
    }
    if (json['bowling_lines'] != null) {
      bowlingLines = <BowlingLines>[];
      json['bowling_lines'].forEach((v) {
        bowlingLines!.add(BowlingLines.fromJson(v));
      });
    }
    battingTeamId = json['batting_team_id'];
    bowlingTeamId = json['bowling_team_id'];
    battingTeamName = json['batting_team_name'];
    bowlingTeamName = json['bowling_team_name'];
    battingTeamHashImage = json['batting_team_hash_image'];
    bowlingTeamHashImage = json['bowling_team_hash_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bye'] = bye;
    data['wide'] = wide;
    data['extra'] = extra;
    data['overs'] = overs;
    data['score'] = score;
    data['number'] = number;
    data['leg_bye'] = legBye;
    data['no_ball'] = noBall;
    data['penalty'] = penalty;
    data['wickets'] = wickets;
    if (partnerships != null) {
      data['partnerships'] = partnerships!.map((v) => v.toJson()).toList();
    }
    if (battingLines != null) {
      data['batting_lines'] = battingLines!.map((v) => v.toJson()).toList();
    }
    if (bowlingLines != null) {
      data['bowling_lines'] = bowlingLines!.map((v) => v.toJson()).toList();
    }
    data['batting_team_id'] = battingTeamId;
    data['bowling_team_id'] = bowlingTeamId;
    data['batting_team_name'] = battingTeamName;
    data['bowling_team_name'] = bowlingTeamName;
    data['batting_team_hash_image'] = battingTeamHashImage;
    data['bowling_team_hash_image'] = bowlingTeamHashImage;
    return data;
  }
}

class Partnerships {
  int? balls;
  int? score;
  int? player1Id;
  int? player2Id;
  String? player1Name;
  String? player2Name;
  String? player1HashImage;
  String? player2HashImage;

  Partnerships(
      {this.balls,
      this.score,
      this.player1Id,
      this.player2Id,
      this.player1Name,
      this.player2Name,
      this.player1HashImage,
      this.player2HashImage});

  Partnerships.fromJson(Map<String, dynamic> json) {
    balls = json['balls'];
    score = json['score'];
    player1Id = json['player1_id'];
    player2Id = json['player2_id'];
    player1Name = json['player1_name'];
    player2Name = json['player2_name'];
    player1HashImage = json['player1_hash_image'];
    player2HashImage = json['player2_hash_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balls'] = balls;
    data['score'] = score;
    data['player1_id'] = player1Id;
    data['player2_id'] = player2Id;
    data['player1_name'] = player1Name;
    data['player2_name'] = player2Name;
    data['player1_hash_image'] = player1HashImage;
    data['player2_hash_image'] = player2HashImage;
    return data;
  }
}

class BattingLines {
  int? s4;
  int? s6;
  int? balls;
  int? score;
  int? playerId;
  String? playerName;
  int? wicketTypeId;
  String? wicketTypeName;
  String? playerHashImage;
  double? fowOver;
  int? fowScore;
  int? wicketCatchId;
  int? wicketBowlerId;
  String? wicketCatchName;
  String? wicketBowlerName;
  String? wicketCatchHashImage;
  String? wicketBowlerHashImage;

  BattingLines(
      {this.s4,
      this.s6,
      this.balls,
      this.score,
      this.playerId,
      this.playerName,
      this.wicketTypeId,
      this.wicketTypeName,
      this.playerHashImage,
      this.fowOver,
      this.fowScore,
      this.wicketCatchId,
      this.wicketBowlerId,
      this.wicketCatchName,
      this.wicketBowlerName,
      this.wicketCatchHashImage,
      this.wicketBowlerHashImage});

  BattingLines.fromJson(Map<String, dynamic> json) {
    s4 = json['s4'];
    s6 = json['s6'];
    balls = json['balls'];
    score = json['score'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    wicketTypeId = json['wicket_type_id'];
    wicketTypeName = json['wicket_type_name'];
    playerHashImage = json['player_hash_image'];
    fowOver = json['fow_over'];
    fowScore = json['fow_score'];
    wicketCatchId = json['wicket_catch_id'];
    wicketBowlerId = json['wicket_bowler_id'];
    wicketCatchName = json['wicket_catch_name'];
    wicketBowlerName = json['wicket_bowler_name'];
    wicketCatchHashImage = json['wicket_catch_hash_image'];
    wicketBowlerHashImage = json['wicket_bowler_hash_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s4'] = s4;
    data['s6'] = s6;
    data['balls'] = balls;
    data['score'] = score;
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    data['wicket_type_id'] = wicketTypeId;
    data['wicket_type_name'] = wicketTypeName;
    data['player_hash_image'] = playerHashImage;
    data['fow_over'] = fowOver;
    data['fow_score'] = fowScore;
    data['wicket_catch_id'] = wicketCatchId;
    data['wicket_bowler_id'] = wicketBowlerId;
    data['wicket_catch_name'] = wicketCatchName;
    data['wicket_bowler_name'] = wicketBowlerName;
    data['wicket_catch_hash_image'] = wicketCatchHashImage;
    data['wicket_bowler_hash_image'] = wicketBowlerHashImage;
    return data;
  }
}

class BowlingLines {
  int? run;
  int? over;
  int? wide;
  int? maiden;
  int? noball;
  int? wicket;
  int? playerId;
  String? playerName;
  String? playerHashImage;

  BowlingLines(
      {this.run,
      this.over,
      this.wide,
      this.maiden,
      this.noball,
      this.wicket,
      this.playerId,
      this.playerName,
      this.playerHashImage});

  BowlingLines.fromJson(Map<String, dynamic> json) {
    run = json['run'];
    over = json['over'];
    wide = json['wide'];
    maiden = json['maiden'];
    noball = json['noball'];
    wicket = json['wicket'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    playerHashImage = json['player_hash_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['run'] = run;
    data['over'] = over;
    data['wide'] = wide;
    data['maiden'] = maiden;
    data['noball'] = noball;
    data['wicket'] = wicket;
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    data['player_hash_image'] = playerHashImage;
    return data;
  }
}
