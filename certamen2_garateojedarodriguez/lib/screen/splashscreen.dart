import 'package:flutter/material.dart';
import 'package:certamen2_garateojedarodriguez/screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        opacity = 0.0;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: opacity,
          child: Image.network(
            'https://media.discordapp.net/attachments/1135945444271337593/1440150767515205632/logo_lareina.png?ex=692d972b&is=692c45ab&hm=88bdb5578b14364f05d1df314ed056727d69bcfac504e018c1aa3cd1deec3899&=&format=webp&quality=lossless&width=471&height=140',
            width: 250,
            height: 250,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                'Farmacia la Reina',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}