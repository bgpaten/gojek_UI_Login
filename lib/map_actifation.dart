import 'package:flutter/material.dart';

class MapActivation extends StatelessWidget {
  const MapActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 168),
              Image.asset(
                'assets/images/map.png',
                height: 200,
              ),
              SizedBox(height: 15),
              Text(
                'Terakhir, aktifkan lokasimu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                color: Colors.green,
              ),
              SizedBox(height: 128),
              Text(
                'Sip, meluncur ke beranda Gojek',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
