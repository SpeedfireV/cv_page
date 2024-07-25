import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import for Timestamp

part 'firebase.freezed.dart';
part 'firebase.g.dart';

@freezed
class FirebaseProject with _$FirebaseProject {
  const factory FirebaseProject({
    required String title,
    required String description,
    required List<String> technologies,
    required String status,
    required List<String> platforms,
    @JsonKey(fromJson: _fromTimestampNonNullable, toJson: _toTimestamp) required DateTime initDate,
    @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) DateTime? endDate,
    String? github,
    List<String>? socials,
  }) = _FirebaseProject;

  factory FirebaseProject.fromJson(Map<String, Object?> json) => _$FirebaseProjectFromJson(json);
}

// Custom functions to convert Timestamp to DateTime and vice versa
DateTime _fromTimestampNonNullable(Timestamp timestamp) {
  return timestamp.toDate();
}

DateTime? _fromTimestamp(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? _toTimestamp(DateTime? date) {
  return date != null ? Timestamp.fromDate(date) : null;
}
