import 'package:flutter/material.dart';

class FavoriView extends StatefulWidget {
  const FavoriView({super.key});

  @override
  State<FavoriView> createState() => _FavoriViewState();
}

class _FavoriViewState extends State<FavoriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriView'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FavoriView'),
            Text('FavoriView'),
            Text('FavoriView'),
            Text('FavoriView'),
            Text('FavoriView'),
          ],
        ),
      ),
    );
  }
}
