import 'package:flutter/material.dart';

class SetteingsScreen extends StatelessWidget {
  const SetteingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Text('settiengs'),
      ),
    );
  }
}
