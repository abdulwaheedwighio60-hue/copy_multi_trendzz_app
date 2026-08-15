import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/provider/auth_provider.dart';
import 'package:multi_trendzz/core/routes/app_router.dart';
import 'package:multi_trendzz/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cocjraoezdsixsofupug.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNvY2pyYW9lemRzaXhzb2Z1cHVnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ2NDQzMzUsImV4cCI6MjEwMDIyMDMzNX0.FL74-8_USptCCqfUS9PYtQVbRCzpJt3RRZMmocZxmi0',
  );

  final supabase = Supabase.instance.client;
  print(supabase);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (_) => AuthProvider(),
            ),

            // Future Providers
            // ChangeNotifierProvider<HomeProvider>(
            //   create: (_) => HomeProvider(),
            // ),
            // ChangeNotifierProvider<CartProvider>(
            //   create: (_) => CartProvider(),
            // ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Multi Trendzz',
            theme: AppTheme.lightTheme,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
