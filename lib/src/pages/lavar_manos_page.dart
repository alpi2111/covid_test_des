import 'package:flutter/material.dart';

class LavarManosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lavar Manos'),
      ),
      body: Center(
        child: Hero(
          tag: 'lavar_manos',
          child: Image.asset('assets/img/icons_menu/lavar_manos.png'),
        ),
      ),
    );
  }
}
