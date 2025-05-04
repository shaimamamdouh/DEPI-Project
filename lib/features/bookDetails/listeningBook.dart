import 'package:flutter/material.dart';
import 'package:readio/features/bookDetails/bookDetails_custom.dart';

class ListeningPage extends StatelessWidget {
  final Book book;

  const ListeningPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        title: Text("Listen to ${book.title}"),
        backgroundColor: const Color(0xFFFEF6E3),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                book.imagePath,
                width: 180,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF392626),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "by ${book.author}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Progress bar
            Slider(
              value: 20,
              min: 0,
              max: 100,
              activeColor: const Color(0xFF392626),
              inactiveColor: Colors.grey[300],
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1:20", style: TextStyle(color: Colors.grey)),
                Text("4:30", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 30),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40,
                  color: Color(0xFF392626),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF392626),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 40,
                    color: Color(0xFFFEF6E3),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 40,
                  color: Color(0xFF392626),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
