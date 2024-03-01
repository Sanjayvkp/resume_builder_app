import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const CardWidget(
      {super.key,
      required this.titleController,
      required this.contentController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Color(0x709E9E9E)),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.black.withOpacity(.30))),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Enter title here...'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Content',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.black.withOpacity(.30))),
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: 'Enter content here...'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_upward)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_downward_outlined)),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
