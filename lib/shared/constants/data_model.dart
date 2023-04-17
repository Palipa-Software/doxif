import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String sensorId;
  final String plantType;
  final String plantVariet;
  final String regionName;
  final String plantingDate;
  final String maxNem;
  final String minNem;
  final String maxSic;
  final String minSic;

  Data({
    required this.sensorId,
    required this.plantType,
    required this.plantVariet,
    required this.plantingDate,
    required this.regionName,
    required this.maxNem,
    required this.maxSic,
    required this.minNem,
    required this.minSic,
  });

  factory Data.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Data(
        sensorId: data["sensorId"],
        plantType: data['plantType'] ?? '',
        plantVariet: data['plantVariet'] ?? '',
        plantingDate: data['plantingDate'] ?? '',
        regionName: data['regionName'] ?? '',
        maxNem: data['maxNem'] ?? '',
        maxSic: data['maxSic'] ?? '',
        minNem: data['minNem'] ?? '',
        minSic: data['minSic'] ?? '');
  }
}
