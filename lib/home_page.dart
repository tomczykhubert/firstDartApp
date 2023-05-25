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
        backgroundColor: Colors.yellow,
        actions: const [
          Icon(Icons.notification_add),
        ],
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('App'),
      //   foregroundColor: Colors.black,
      //   backgroundColor: Colors.yellow,
      //   actions: [
      //     BlocBuilder<AppCubit2, AppState2>(
      //       builder: (context, state) {
      //         final cubit = context.read<AppCubit2>();
      //         return IconButton(
      //           onPressed: () => cubit.changeNotificationIcon(),
      //           icon: Icon(state.icon),
      //         );
      //       },
      //     )
      //   ],
      // ),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  state.abc,
                  style: const TextStyle(color: Colors.white),
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
                    backgroundColor: Colors.yellow, // Background color
                  ),
                  child: const Text(
                    'Elevated Button',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello world!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Text(
                  'Text Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.yellow)),
                child: const Text(
                  'Outlined Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () => cubit.changeText(),
                // icon: const Icon(Icons.add),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: const Text('Gesture'),
              // ),
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage('https://picsum.photos/50/50'),
              //     ),
              //   ),
              // ),
              // const Card(
              //   margin: EdgeInsets.all(16),
              //   elevation: 10,
              //   child: Text('Card'),
              // ),
            ],
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
