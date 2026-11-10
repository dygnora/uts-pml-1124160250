import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Deny',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.dark)
      ),

      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ini adalah profile saya'))
            );
          }, icon: Icon(Icons.add_alert_outlined))
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Text('DD', style: TextStyle(fontSize: 40),),
                    ),
                    SizedBox(height: 16,),

                    Text('Deny Dermawan', style: Theme.of(context).textTheme.headlineMedium,),
                    SizedBox(height: 8,),

                    Text('1124160250', style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 4,),

                    Text('Teknik Informatika', style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
              ),

              const SizedBox(height: 12,),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kontak', style: Theme.of(context).textTheme.headlineSmall,),

                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.email, label: 'Email', value: 'deny@example.com'),

                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.phone, label: 'No HP', value: '0812xxxxxx'),

                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.class_, label: 'Kelas', value: 'TI 24 SE-1'),

                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.work, label: 'Github', value: '@Dygnora')
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12,),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Keahlian & Hobi', style: Theme.of(context).textTheme.headlineSmall,),

                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.web_asset, label: 'WEB', value: 'PHP, JS, Golang'),
                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.adb_outlined, label: 'Mobile', value: 'Flutter & Dart'),
                      SizedBox(height: 8,),

                      const InfoTile(icon: Icons.gamepad, label: 'Hobi', value: 'Gaming & Ngoding')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terimakasih sudah melihat profile saya'))
        );
      }, child: Icon(Icons.add_outlined),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoTile({super.key,
  required this.icon,
  required this.label,
  required this.value
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}