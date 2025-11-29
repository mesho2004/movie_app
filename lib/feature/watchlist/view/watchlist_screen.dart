import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Watch list')),
      body: const Center(
        child: Text('Watchlist', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}
