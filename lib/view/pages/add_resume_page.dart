import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/controller/resume_provider.dart';
import 'package:resume_builder_app/model/resume.dart';
import 'package:resume_builder_app/model/resume_section.dart';
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

  /// Swap items in a list
  List<T> swapListItems<T>(int indexA, int indexB, List<T> originalArray) {
    final temp = originalArray[indexA];
    originalArray[indexA] = originalArray[indexB];
    originalArray[indexB] = temp;
    return originalArray;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// State that store the sections of the resume
    final sectionsList = useState<List<TextEditingControllers>>([
      TextEditingControllers(
        contentController: TextEditingController(),
        titleController: TextEditingController(),
      )
    ]);

    /// Dispose all controllers when the user leave the page
    useEffect(
      () => () {
        for (final controllers in sectionsList.value) {
          controllers.contentController.dispose();
          controllers.titleController.dispose();
        }
      },
    );

    /// Save the resume
    void saveResume(String title) {
      final sections = [
        for (final sectionsData in sectionsList.value)
          ResumeSection(
            title: sectionsData.titleController.text,
            content: sectionsData.contentController.text,
          ),
      ];

      ref.read(resumeProvider.notifier).addResume(
            ResumeModel(sections: sections, name: title),
          );

      Navigator.popUntil(context, (route) => route.isFirst);
    }

    /// Show the alert to input the title for the resume
    void showAlertDialog() {
      final titleController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Save Resume'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Please enter a title to save the resume'),
              TextField(
                decoration: const InputDecoration(hintText: 'Title'),
                controller: titleController,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final title = titleController.text;
                saveResume(title);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                titleController.dispose();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      );
    }

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
      sectionsList.value[index].contentController.dispose();
      sectionsList.value[index].titleController.dispose();

      sectionsList.value = [
        ...sectionsList.value,
      ]..removeAt(index);
    }

    /// Move the section above
    void moveSectionUp(int index) {
      if (index == 0) {
        /// Section is already on top
        return;
      }

      /// Swap the items in the list
      sectionsList.value = swapListItems<TextEditingControllers>(
          index, index - 1, [...sectionsList.value]);
    }

    /// Move the section down
    void moveSectionDown(int index) {
      if (index == sectionsList.value.length - 1) {
        /// Section is already at the bottom of the list
        return;
      }

      /// Swap the items in the list
      sectionsList.value = swapListItems<TextEditingControllers>(
          index, index + 1, [...sectionsList.value]);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(
            onPressed: () => showAlertDialog(),
            icon: const Icon(
              Icons.done,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 48,
        ),
        child: ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final controllers = sectionsList.value[index];

            return CardWidget(
              contentController: controllers.contentController,
              titleController: controllers.titleController,
              onDeletePressed: () => removeSection(index),
              onUpPressed: () => moveSectionUp(index),
              onDownPressed: () => moveSectionDown(index),
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
