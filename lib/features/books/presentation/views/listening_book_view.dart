import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class ListeningBookView extends StatelessWidget {
  const ListeningBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Listen to Book"),
        backgroundColor: Colors.white,
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
                'assets/images/kite_runner.jpg',
                width: 180,
                height: 240,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'The Kite Runner',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorsData.textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Khaled Hosseini',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            Slider(
              value: 20,
              min: 0,
              max: 100,
              activeColor: ColorsData.textColor,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40,
                  color: ColorsData.textColor,
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsData.textColor,
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
                  color: ColorsData.textColor,
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
