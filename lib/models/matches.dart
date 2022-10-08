
import 'package:flutter/material.dart';
class Matches {
  String home_team;
  String away_team;
  String competition_name;
  String competition_cluster;
  String odds;


  String prediction;

  Matches(
      {required this.home_team, required this.away_team, required this.competition_cluster, required this.prediction ,required this.competition_name,required this.odds});

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(away_team:json ['away_team'],
    home_team: json ['home_team'], competition_cluster: json ['competition_cluster'], prediction: json ['prediction'], competition_name: json ['competition_name'], odds: json ['odds'],);

  Map toJson() {
    return {'home_team': home_team, 'away_team': away_team, 'competition_cluster': competition_cluster,'competition_name':competition_name,' prediction': prediction,
    'odds':odds};

  }

}












