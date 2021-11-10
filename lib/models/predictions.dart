
import 'package:flutter/material.dart';
class Predictions {
  String id;

  String CONCACAF;

  String CONMEBOL;

  String UEFA;

  Predictions(
      {required this.id, required this.CONCACAF, required this.CONMEBOL, required this.UEFA});



  factory Predictions.fromJson(Map<String, dynamic> json) => Predictions.fromJson(json);

}


class Competitions{

}












