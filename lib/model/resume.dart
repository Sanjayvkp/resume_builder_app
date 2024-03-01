import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_builder_app/model/resume_section.dart';

part 'resume.freezed.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required List<ResumeSection> sections,
    required String name,
  }) = _ResumeModel;
}
