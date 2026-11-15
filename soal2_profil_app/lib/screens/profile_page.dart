import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'about_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onToggleTheme;

  const ProfilePage({
    super.key,
    this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  Profile profile = const Profile(
    nama: 'Deny Dermawan',
    nim: '1124160250',
    prodi: 'Teknik Informatika',
    kelas: 'SE-1',
    bio: 'Mahasiswa Teknik Informatika yang tertarik pada pengembangan aplikasi web dan mobile.',
    email: '1124160250@global.ac.id',
    hp: '081234567890',
    github: 'github.com/dygnora',
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _openEditProfile() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          profile: profile,
        ),
      ),
    );

    if (updatedProfile != null) {
      setState(() {
        profile = updatedProfile;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profil berhasil diperbarui!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
        actions: [
          if (widget.onToggleTheme != null)
            IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
              ),
              tooltip: isDark ? 'Mode Terang' : 'Mode Gelap',
              onPressed: widget.onToggleTheme,
            ),
        ],
      ),

      // Drawer Navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1E1E2E)
                    : Theme.of(context).colorScheme.primary,
              ),
              accountName: Text(
                profile.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                profile.nim,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: isDark
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
                child: const CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _openEditProfile();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            const Divider(),
            if (widget.onToggleTheme != null)
              SwitchListTile(
                secondary: Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                ),
                title: const Text('Mode Gelap'),
                value: isDark,
                onChanged: (_) {
                  widget.onToggleTheme!();
                },
              ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _logout();
              },
            ),
          ],
        ),
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

      // Floating Action Button (hanya tampil di tab Profil)
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _openEditProfile,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            )
          : null,
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
                      radius: 64,
                      backgroundColor: colorScheme.primary,
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
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
                          avatar: Icon(
                            Icons.school,
                            size: 18,
                            color: colorScheme.primary,
                          ),
                          label: Text(profile.prodi),
                        ),
                        Chip(
                          avatar: Icon(
                            Icons.groups,
                            size: 18,
                            color: colorScheme.primary,
                          ),
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
                InfoTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: profile.email,
                ),

                const Divider(height: 1, indent: 56),

                InfoTile(
                  icon: Icons.phone_outlined,
                  label: 'Nomor HP',
                  value: profile.hp,
                ),

                const Divider(height: 1, indent: 56),

                InfoTile(
                  icon: Icons.code,
                  label: 'GitHub',
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
}
