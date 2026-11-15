
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SizedBox(height: 40),
        Icon(
          Icons.info_outline,
          size: 80,
          color: Colors.indigo,
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Tentang Saya',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Text(
            'Halaman informasi mahasiswa',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
