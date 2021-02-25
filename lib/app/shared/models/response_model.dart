import 'dart:convert';

import 'persona_model.dart';

class ResponseModel {
  final String response;
  final String resultsFor;
  final List<PersonaModel> results;
  ResponseModel({
    this.response,
    this.resultsFor,
    this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'response': response,
      'resultsFor': resultsFor,
      'results': results?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResponseModel(
      response: map['response'],
      resultsFor: map['resultsFor'],
      results: List<PersonaModel>.from(
          map['results']?.map((x) => PersonaModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));
}