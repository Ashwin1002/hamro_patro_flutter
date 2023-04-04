import 'package:flutter/material.dart';

import '../../../constants/constant_text.dart';
import '../../../widgets/widget_space.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, this.onDrawerPressed}) : super(key: key);

  final void Function()? onDrawerPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 0.2)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onDrawerPressed,
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          const Text(
            appName,
            style: TextStyle(
                fontSize: 17.5,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 12.5,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 18,),
              ),
              horizontalSpace(width: 10),
              const Icon(Icons.mail_outline, color: Colors.white, size: 28,),
              horizontalSpace()
            ],
          )
        ],
      ),
    );
  }
}
