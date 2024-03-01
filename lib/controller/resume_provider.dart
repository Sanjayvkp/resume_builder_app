import 'package:resume_builder_app/model/resume.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_provider.g.dart';

@riverpod
class Resume extends _$Resume {
  @override
  List<ResumeModel> build() {
    return [];
  }

  /// Add new resume
  void addResume(ResumeModel resume) {
    state = [...state, resume];
  }

  /// Edit resume
  void editResume(ResumeModel resume, int index) {
    final updatedResumeList = [...state];
    updatedResumeList[index] = resume;

    state = updatedResumeList;
  }

  /// remove the resume
  void removeResume(int index) {
    state = [...state]..removeAt(index);
  }
}
