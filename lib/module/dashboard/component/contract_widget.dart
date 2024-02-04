import 'package:flutter/material.dart';
import 'dart:math';

class UpdatedCustomContainer extends StatelessWidget {
  String title;
  String category;
  String dueDate;
  String closureDate;
  String owner;
  String location;
  String assignedTo;
  String contractStatus;

  UpdatedCustomContainer(
      {super.key,
      required this.title,
      required this.category,
      required this.dueDate,
      required this.closureDate,
      required this.owner,
      required this.location,
      required this.assignedTo,
      required this.contractStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height > 960 ? 300 : 250,
      width: MediaQuery.of(context).size.width > 600 ? 350 : 300,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF42526E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      RowContent(
                        title: 'Document Category',
                        subtitle: category,
                      ),
                      const Spacer(),
                      RowContent(
                        title: 'Expected Closure Date',
                        subtitle: closureDate,
                      ),
                      const Spacer(),
                      const RowContent(
                        title: 'Document Link',
                        subtitle: '',
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      RowContent(
                        title: 'Location',
                        subtitle: location,
                      ),
                      const Spacer(),
                      RowContent(
                        title: 'Owner',
                        subtitle: owner,
                      ),
                      const Spacer(),
                      RowContent(
                        title: 'Due',
                        subtitle: dueDate,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.white,
                ),
                // ),
                const SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Assigned To',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      assignedTo,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Button action
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    contractStatus,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const RowContent({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF42526E),
              fontSize: 12,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: const Color(0xFF42526E),
              fontSize: 12,
              fontWeight:
                  subtitle.isNotEmpty ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
