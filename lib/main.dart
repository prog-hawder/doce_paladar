import 'package:doce_paladar/Models/Pages/ConfigPage/ConfigPage.dart';
import 'package:doce_paladar/Models/Pages/Contagem/ContagemPage.dart';
import 'package:doce_paladar/Models/Pages/Estoque/EstoquePage.dart';
import 'package:doce_paladar/Models/Pages/LoginPage/LoginScreen.dart';
import 'package:doce_paladar/Models/Pages/PedidosAssados/PedidosAssados.dart';
import 'package:doce_paladar/Models/Pages/PedidosLojas/PedidosLojas.dart';
import 'package:doce_paladar/Models/Services/auth_check.dart';
import 'package:doce_paladar/Models/Services/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'Models/Pages/HomePage/homepage.dart';

Future<void> main() async {
  await initializeDateFormatting('pt_Br');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthService(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey();
  checkAuth() {
    final auth = context.watch<AuthService>();
    if (_navigator.currentState != null) {
      if (auth.usuario == null) {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      } else if (auth.usuario != null) {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      } else {
        _navigator.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/config": (context) => ConfigPage(),
          "/login": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/pedidoslojas": (context) => PedidosLojas(),
          "/pedidosassados": (context) => PedidosAssados(),
          "/contagem": (context) => ContagemPage(),
          "/estoque": (context) => EstoquePage()
        },
        debugShowCheckedModeBanner: false,
        title: "Doce Paladar",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: _navigator,
        home: AuthCheck(),
        builder: (context, child) {
          if (child == null) {
            throw FlutterError.fromParts([
              ErrorSummary('No Navigator or Router provided.'),
              ErrorSpacer(),
              ErrorDescription(
                'Did you include a home Widget or provide routes to your MaterialApp?',
              ),
              ErrorSpacer(),
            ]);
          }
          final auth = context.watch<AuthService>();
          return Navigator(
            onPopPage: (_, dynamic __) => true,
            pages: [
              MaterialPage<void>(
                child: ScaffoldMessenger(
                  child: (auth.isLoading)
                      ? const Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : (auth.usuario != null)
                          ? child
                          : const LoginPage(),
                ),
              ),
            ],
          );
        });
  }
}
