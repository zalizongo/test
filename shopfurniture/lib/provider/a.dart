
import 'package:flutter/material.dart';
import 'package:shopfurniture/models/model.dart';
class Lesdifferentetaiile with ChangeNotifier{
  final List<MesCHois>_choix = [
    MesCHois(
      id: 1,
      taille: 'XR',
      ),
      MesCHois(
      id: 1,
      taille: 'S',
      ),
      MesCHois(
      id: 1,
      taille: 'M',
      ),
      MesCHois(
      id: 1,
      taille: 'L',
      ),
      MesCHois(
      id: 1,
      taille: 'XL',
      ),
  ];
   List<MesCHois> get choix => [..._choix ];

}