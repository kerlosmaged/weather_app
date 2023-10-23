import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "There Is No Weather 😔 Start",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "Search Now 🔍",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
