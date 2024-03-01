import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/controller/resume_provider.dart';
import 'package:resume_builder_app/view/pages/add_resume_page.dart';
import 'package:resume_builder_app/view/pages/view_resume_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// View the resume
    void viewResume(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewResumePage(
              index: index,
            ),
          ));
    }

    /// Add a new resume
    void addNewResume() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddResumePage(),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume App'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final resume = ref.watch(resumeProvider)[index];

          return ListTile(
            onTap: () => viewResume(index),
            title: Text(resume.name),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: ref.watch(resumeProvider).length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewResume,
        child: const Icon(Icons.add),
      ),
    );
  }
}
