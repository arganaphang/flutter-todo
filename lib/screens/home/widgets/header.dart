import 'package:flutter/material.dart';
import 'package:todo/utils/time.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Tasks",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                parseTimeToRelative(DateTime.now(), "EEEE, d MMMM"),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: const Color.fromARGB(255, 0, 136, 255),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "New Task",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 136, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
