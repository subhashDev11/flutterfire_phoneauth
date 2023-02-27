import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_project/presentation/home/home.dart';

import 'presentation/app/view/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
