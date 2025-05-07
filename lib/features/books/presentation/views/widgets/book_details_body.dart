import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/books/presentation/views/widgets/custom_elevated_button.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: Image.asset(
                'assets/images/kite_runner.jpg',
                width: MediaQuery.of(context).size.width * 0.5,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: Text(
                'The Kite Runner',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorsData.textColor,
                ),
              ),
            ),
            const SizedBox(height: 3),

            Center(
              child: Text(
                'Khaled Hosseini',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Kite Runner is a novel by Khaled Hosseini, published in 2003. It tells the story',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 120),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  text: 'Read',
                  icon: const Icon(Icons.book),
                  onPressed: () {
                    context.push('/BookByCatigoryView');
                  },
                ),

                CustomElevatedButton(
                  text: 'Listen',
                  icon: const Icon(Icons.headset),
                  onPressed: () {
                    context.push('/ListeningBookView');
                  },
                ),

                CustomElevatedButton(
                  text: 'Favorite',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    context.push('/ListeningBookView');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
