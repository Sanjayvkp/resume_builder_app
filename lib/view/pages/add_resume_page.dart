import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/view/widgets/card_widget.dart';

/// Model class to handle the text editing controller
final class TextEditingControllers {
  final TextEditingController titleController;
  final TextEditingController contentController;

  TextEditingControllers({
    required this.contentController,
    required this.titleController,
  });
}

class AddResumePage extends HookConsumerWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// State that store the sections of the resume
    final sectionsList = useState<List<TextEditingControllers>>([]);

    /// View the resume
    void viewResume() {}

    /// Add a new section to the resume
    void addNewSection() {
      sectionsList.value = [
        ...sectionsList.value,
        TextEditingControllers(
          contentController: TextEditingController(),
          titleController: TextEditingController(),
        )
      ];
    }

    /// Remove a section from the resume with the given index
    void removeSection(int index) {
      sectionsList.value = [
        ...sectionsList.value,
      ]..removeAt(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(
            onPressed: () => viewResume(),
            icon: const Icon(
              Icons.remove_red_eye,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final controllers = sectionsList.value[index];

            return CardWidget(
              contentController: controllers.contentController,
              titleController: controllers.titleController,
              onDeletePressed: () => removeSection(index),
            );
          },
          itemCount: sectionsList.value.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewSection(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
