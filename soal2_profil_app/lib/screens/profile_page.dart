
import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'about_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _openEditProfile() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildProfileContent(),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Profil Mahasiswa' : 'Tentang Saya',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: pages[_selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openEditProfile,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }

  Widget _buildProfileContent() {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 12),

          // Header Identitas
          Card(
            elevation: 2,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: colorScheme.primaryContainer,
                      backgroundImage: const AssetImage(
                        'assets/images/profile.jpg',
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      profile.nama,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      profile.nim,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                          avatar: const Icon(Icons.school, size: 18),
                          label: Text(profile.prodi),
                        ),
                        Chip(
                          avatar: const Icon(Icons.groups, size: 18),
                          label: Text('Kelas ${profile.kelas}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Bio
          _buildSectionTitle(
            context,
            'Tentang Saya',
            Icons.person_outline,
          ),

          const SizedBox(height: 8),

          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                profile.bio,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Informasi Kontak
          _buildSectionTitle(
            context,
            'Informasi Kontak',
            Icons.contact_mail_outlined,
          ),

          const SizedBox(height: 8),

          Card(
            elevation: 1,
            child: Column(
              children: [
                _buildContactTile(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  value: profile.email,
                ),

                const Divider(height: 1, indent: 56),

                _buildContactTile(
                  icon: Icons.phone_outlined,
                  title: 'Nomor HP',
                  value: profile.hp,
                ),

                const Divider(height: 1, indent: 56),

                _buildContactTile(
                  icon: Icons.code,
                  title: 'GitHub',
                  value: profile.github,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(value),
    );
  }
}
