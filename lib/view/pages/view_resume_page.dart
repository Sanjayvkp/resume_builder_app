import 'package:flutter/material.dart';
import 'package:resume_builder_app/model/resume_section.dart';

class ViewResumePage extends StatelessWidget {
  /// Sections that are part of the resume
  final List<ResumeSection> sections;

  const ViewResumePage({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Resume'),
      ),
      body: Container(),
    );
  }
}
