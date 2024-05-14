import 'package:flutter_rpg/models/stats.dart';

class Character with Stats{
  
  //Constructor
  Character({
    required this.name, 
    required this.slogan, 
    required this.id, 
  });

  //fields
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  //Getters
  get isFav => _isFav;

  void toggleIsFav(){
    _isFav = !_isFav;
  }
  


}