import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless Widget'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Username:',
                    suffixIcon: IconButton(
                      onPressed: (() {
                        nameController.clear();
                      }),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (() {
                    nameController.clear();
                  }),
                  child: const Text('Clear')),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomePage())));
                  }),
                  child: const Text('Next Page')),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number Count: $number'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (() {
                  setState(() {
                    number++;
                    debugPrint('Number Count: $number');
                  });
                }),
                child: const Text('Increment by 1')),
          ],
        ),
      ),
    );
  }
}
