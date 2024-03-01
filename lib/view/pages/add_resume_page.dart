import 'package:flutter/material.dart';
import 'package:resume_builder_app/view/widgets/card_widget.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CardWidget(height: 60),
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
