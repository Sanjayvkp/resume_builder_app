import 'package:flutter/material.dart';

/// Model class to handle the text editing controller
final class TextEditingControllers {
  final TextEditingController titleController;
  final TextEditingController contentController;

  TextEditingControllers({
    required this.contentController,
    required this.titleController,
  });
}

class CardWidget extends StatelessWidget {
  // final ValueNotifier<List<TextEditingControllers>> controllers;
  final TextEditingController titleController;
  final TextEditingController contentController;

  const CardWidget(
      {super.key,
      required this.titleController,
      required this.contentController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for (var i = 0; i < controllers.value.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey),
            ]),
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
                  ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_upward)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_downward_outlined)),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        // SizedBox(
        //   width: MediaQuery.sizeOf(context).width,
        //   height: 50,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       addNewTypeEntry();
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.white,
        //       elevation: 5,
        //       side: const BorderSide(color: Colors.black, width: .3),
        //       shape: BeveledRectangleBorder(
        //           borderRadius: BorderRadius.circular(5)),
        //     ),
        //     child: const Text(
        //       'Add New Field',
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
