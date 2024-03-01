import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CardWidget(
                  height: 60,
                  contentController: TextEditingController(),
                  titleController: TextEditingController(),
                ),
              ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
