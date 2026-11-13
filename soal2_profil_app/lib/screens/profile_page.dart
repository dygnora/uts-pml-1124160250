
import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Profile profile = const Profile(
    nama: 'Deny Dermawan',
    nim: '1124160250',
    prodi: 'Teknik Informatika',
    kelas: 'SE-1',
    bio: 'Mahasiswa Teknik Informatika.',
    email: '1124160250@global.ac.id',
    hp: '0812xxxxxxxx',
    github: 'github.com/dygnora',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),

            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(
                'assets/images/profile.jpg',
              ),
            ),

            const SizedBox(height: 20),

            Text(
              profile.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              profile.nim,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              profile.prodi,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 6),

            Text(
              'Kelas ${profile.kelas}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
