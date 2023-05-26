import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/app_cubit.dart';
import 'package:project/second_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('App'),
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 200, 185, 50),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.notification_add),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.home, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.login,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              title: const Text(
                'Calculator',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.calculate_outlined,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final cubit = context.read<AppCubit>();
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  state.abc,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: () => cubit.changeText(),
                // icon: const Icon(Icons.add),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('AlertDialog'),
                            content: const Text('Content'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 200, 185, 50), // Background color
                  ),
                  child: const Text(
                    'Elevated button',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello world!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 200, 185, 50),
                  ),
                ),
                child: const Text(
                  'Outlined button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
