import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookByCatigoryView extends StatelessWidget {
  const BookByCatigoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Catigory'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BookByCatigoryBody(),
    );
  }
}

class BookByCatigoryBody extends StatelessWidget {
  const BookByCatigoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BookBycatigoryItem();
      },
    );
  }
}

class BookBycatigoryItem extends StatelessWidget {
  const BookBycatigoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () => context.push('/BookDetailsView'),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/kite_runner.jpg'),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('the kite runner'),
                    Text('Khaled Hosseini'),
                    Row(
                      children: [
                        Text('3.5'),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
