import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),

        // Header
        Center(
          child: Column(
            children: [
              Icon(
                Icons.info_outline,
                size: 70,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                'Tentang Saya',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Informasi Keahlian, Hobi, & Riwayat Pendidikan',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Keahlian & Hobi (minimal 3)
        _buildSectionTitle(context, 'Keahlian & Hobi', Icons.star_outline),
        const SizedBox(height: 8),
        const Card(
          elevation: 1,
          child: Column(
            children: [
              InfoTile(
                icon: Icons.phone_android,
                label: 'Mobile Development',
                value: 'Flutter & Dart Dasar',
              ),
              Divider(height: 1, indent: 56),
              InfoTile(
                icon: Icons.language,
                label: 'Web Development',
                value: 'HTML, CSS, JavaScript dasar',
              ),
              Divider(height: 1, indent: 56),
              InfoTile(
                icon: Icons.sports_esports,
                label: 'Hobi',
                value: 'Gaming dan eksplorasi teknologi baru',
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Riwayat Pendidikan
        _buildSectionTitle(context, 'Riwayat Pendidikan', Icons.school_outlined),
        const SizedBox(height: 8),
        const Card(
          elevation: 1,
          child: Column(
            children: [
              InfoTile(
                icon: Icons.school,
                label: 'Perguruan Tinggi',
                value: 'ITB Bina Sarana Global (Teknik Informatika)',
              ),
              Divider(height: 1, indent: 56),
              InfoTile(
                icon: Icons.account_balance,
                label: 'Sekolah Menengah Kejuruan',
                value: 'SMK Negeri 1 (Teknik Komputer & Jaringan)',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
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
