import 'package:flutter/material.dart';
import 'package:twitterclone/widgets/my_bottom_sheet_button.dart';

class MyBottomSheet extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final void Function()? onTap;
  final String onTaptext;

  const MyBottomSheet({
    super.key,
    required this.hintText,
    required this.textController,
    required this.onTap,
    required this.onTaptext,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TEXTFIELD TO ENTER TEXT
              TextField(
                controller: textController,
                maxLength: 140,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              // BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SAVE BUTTON
                  MyBottomSheetButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      onTap!(); // Execute function to update bio
                      textController.clear();
                    },
                    buttonText: onTaptext,
                  ),

                  // CANCEL BUTTON
                  MyBottomSheetButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      textController.clear();
                    },
                    buttonText: 'Cancel',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
