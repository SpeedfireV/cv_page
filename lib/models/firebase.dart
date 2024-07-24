import 'package:freezed_annotation/freezed_annotation.dart';

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
    DateTime? endDate,
    String? github,
    List<String>? socials,
  }) = _FirebaseProject;

  factory FirebaseProject.fromJson(Map<String, Object?> json) => _$FirebaseProjectFromJson(json);
}