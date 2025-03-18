import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_task/views/home_view.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _loadingProgress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    //loading
    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        _loadingProgress += 0.01;
        if (_loadingProgress >= 1.0) {
          _timer.cancel();
          // Navigate to home screen
          Future.delayed(const Duration(milliseconds: 10), () {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 20),
                pageBuilder:
                    (context, animation, secondaryAnimation) => FadeTransition(
                      opacity: animation,
                      child: const HomeView(),
                    ),
              ),
            );
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with shimmer effect
            Shimmer.fromColors(
              baseColor: Colors.black54,
              highlightColor: Colors.black.withOpacity(0.9),
              period: const Duration(milliseconds: 1500),
              child: Image.asset(
                'assets/bike_img.png',
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.motorcycle,
                    size: 150,
                    color: Colors.black,
                  );
                },
              ),
            ),
            const SizedBox(height: 48),
            // Progress indicator
            SizedBox(
              width: 240,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _loadingProgress,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFFF4D4D),
                      ),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Loading system...',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(_loadingProgress * 100).toInt()}%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
