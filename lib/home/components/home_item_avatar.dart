import 'package:flutter/material.dart';

class HomeItemAvatar extends StatelessWidget {
  const HomeItemAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 16),
            child: const CircleAvatar(
              radius: 18,
              backgroundImage:
                  NetworkImage('https://i.sstatic.net/WXuD7.jpg?s=256'),
            )),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "name",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "location whatever",
              style: TextStyle(color: Colors.white, fontSize: 10),
            )
          ],
        )
      ],
    );
  }
}
