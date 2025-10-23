import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'core/controllers/track_controller.dart';
import 'core/services/local_data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init any local services (mock/local cache)
  final localDataService = LocalDataService();
  await localDataService.loadMockData();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TrackController(localDataService),
        ),
        // add more controllers here when ready
      ],
      child: const CapitaApp(),
    ),
  );
}
