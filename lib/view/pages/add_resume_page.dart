import 'package:flutter/material.dart';
import 'package:resume_builder_app/view/widgets/text_field_widget.dart';

class AddResumePage extends StatelessWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CardWidget(height: 60),
            )
          ],
        ),
      ),
    );
  }
}
