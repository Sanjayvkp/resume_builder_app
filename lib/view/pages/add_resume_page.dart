import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/view/widgets/card_widget.dart';

class AddResumePage extends HookConsumerWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conditionTypeController = useState<List<TextEditingControllers>>([]);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CardWidget(
                height: 60,
                controllers: conditionTypeController,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
