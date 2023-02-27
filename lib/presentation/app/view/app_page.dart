import '../app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PhoneAuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PhoneAuthBloc(
              phoneAuthRepository:
                  RepositoryProvider.of<PhoneAuthRepository>(context),
            )..init(),
          )
        ],
        child: MaterialApp(
          title: 'Test project',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const PhoneAuthPage(),
        ),
      ),
    );
  }
}
