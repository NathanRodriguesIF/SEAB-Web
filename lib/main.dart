import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:seab/screens/guia.dart';
import 'package:seab/screens/home.dart';
import 'package:seab/screens/login.dart';
import 'package:seab/screens/mais.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seab/services/auth_service.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (context) => Verificador(), // Inicializa o estado
        child: MyApp(),
      ),);

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _selectedIndex = 0;

  List<Widget> _pages = [
    Home(),
    Login(),
    Login(),
  ];
  List<Widget> _pages2 = [
    Home(),
    Guia(),
    More(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final valor = Provider.of<Verificador>(context);
    bool currentValue = valor.value;
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: currentValue ? _pages2[_selectedIndex] : _pages[_selectedIndex],
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              backgroundColor: Colors.red,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              iconSize: 35,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: 'Primeiros Socorros'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz_outlined), label: 'Mais'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,),
          ),
        ));
  }
}