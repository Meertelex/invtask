import 'package:flutter/material.dart';
import 'package:interviewtask/View/Screens/splash_screen.dart';
import 'package:interviewtask/ViewModel/ProviderService/appointment_provider.dart';
import 'package:interviewtask/ViewModel/ProviderService/stored_data_provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create:  (context)=>StoredDataProvider()),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen()),
      ),
    );
  }
}
