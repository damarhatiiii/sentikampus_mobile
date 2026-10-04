import 'package:flutter/material.dart';

void main() {
  runApp(const SentiKampusApp());
}

class SentiKampusApp extends StatelessWidget {
  const SentiKampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SentiKampus',
      home: SentiKampusPage(),
    );
  }
}

class SentiKampusPage extends StatefulWidget {
  const SentiKampusPage({super.key});

  @override
  State<SentiKampusPage> createState() => _SentiKampusPageState();
}

class _SentiKampusPageState extends State<SentiKampusPage> {
  final TextEditingController controller = TextEditingController();
  String message = 'Belum ada input.';

  void showFlowExample() {
    final text = controller.text.trim();
    setState(() {
      message = text.length < 3
          ? 'Masukkan minimal 3 karakter.'
          : 'Input diterima; model belum terhubung.';
    });
  } // <-- Kurung kurawal penutup yang tadinya kurang

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SentiKampus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Komentar mahasiswa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Tulis komentar di sini...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: showFlowExample,
              child: const Text('Analisis'),
            ),
            const SizedBox(height: 20),
            Text(
              'Status: $message',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}