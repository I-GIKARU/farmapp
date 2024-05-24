import 'package:flutter/material.dart';

import 'package:farm/pages/mycolors.dart';

class MessageTile extends StatelessWidget {
  final bool sendByMe;
  final String message;

  const MessageTile({
    super.key,
    required this.sendByMe,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: sendByMe ? MyColors.primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: sendByMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}