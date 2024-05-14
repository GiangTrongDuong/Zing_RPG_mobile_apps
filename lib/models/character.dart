import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats{
  
  //Constructor
  Character({
    required this.name, 
    required this.slogan, 
    required this.id, 
    required this.vocation,
  });

  //fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  //Getters
  get isFav => _isFav;

  //Methods
  void toggleIsFav(){
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill){
    skills.clear();
    skills.add(skill);
  }
}

//dummy character data

List<Character> characters = [
  Character(name: 'Halo', slogan: 'I like (love) my bike', id: '1', vocation: Vocation.helldiver),
  Character(name: 'Duch', slogan: 'The hunt is a showdown', id: '2', vocation: Vocation.cowboy),
  Character(name: 'Adam', slogan: 'Truong My Lan cannot hide ze treasure', id: '3', vocation: Vocation.police),
  Character(name: 'HuyBu', slogan: 'Corporate is like number, numbers', id: '4', vocation: Vocation.corporate),
];