import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double height;
  const CardWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              height: height,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Title',
                    hintText: 'Enter title here...'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter content here...'),
              ),
            ),
            ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_upward)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_downward_outlined)),
                ],
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            )
          ],
        ),
      ),
    );
  }
}
