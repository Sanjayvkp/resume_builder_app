import 'package:flutter/material.dart';

class AddResumePage extends StatelessWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
        ],
      ),
    );
  }
}
