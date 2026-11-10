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
              )
            ],
          ),
        ),
      ),
    );
  }
}