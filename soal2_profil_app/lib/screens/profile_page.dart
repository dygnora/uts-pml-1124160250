import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Profile profile = const Profile(
    nama: 'Deny Dermawan',
    nim: '1124160250',
    prodi: 'Teknik Informatika',
    kelas: 'SE-1',
    bio: 'Mahasiswa Teknik Informatika yang tertarik pada pengembangan aplikasi web dan mobile.',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            // Foto Profil
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(
                'assets/images/profile.jpg',
              ),
            ),

            const SizedBox(height: 20),

            // Identitas Mahasiswa
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

            const SizedBox(height: 8),

            Text(
              profile.prodi,
              style: const TextStyle(fontSize: 16),
            ),

            Text(
              'Kelas ${profile.kelas}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // Bio Mahasiswa
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 8),
                        Text(
                          'Tentang Saya',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      profile.bio,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Informasi Kontak
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Kontak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email'),
                    subtitle: Text(profile.email),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Nomor HP'),
                    subtitle: Text(profile.hp),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('GitHub'),
                    subtitle: Text(profile.github),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
