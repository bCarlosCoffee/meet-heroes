import 'dart:convert';

import 'appearance_model.dart';
import 'biography_model.dart';
import 'connections_model.dart';
import 'image_model.dart';
import 'powerstats_model.dart';
import 'work_model.dart';

class CharacterModel {
  final String id;
  final String name;
  final PowerstatsModel powerstats;
  final BiographyModel biography;
  final AppearanceModel appearance;
  final WorkModel work;
  final ConnectionsModel connections;
  final ImageModel image;
  CharacterModel({
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'powerstats': powerstats?.toMap(),
      'biography': biography?.toMap(),
      'appearance': appearance?.toMap(),
      'work': work?.toMap(),
      'connections': connections?.toMap(),
      'image': image?.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CharacterModel(
      id: map['id'],
      name: map['name'],
      powerstats: PowerstatsModel.fromMap(map['powerstats']),
      biography: BiographyModel.fromMap(map['biography']),
      appearance: AppearanceModel.fromMap(map['appearance']),
      work: WorkModel.fromMap(map['work']),
      connections: ConnectionsModel.fromMap(map['connections']),
      image: ImageModel.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
