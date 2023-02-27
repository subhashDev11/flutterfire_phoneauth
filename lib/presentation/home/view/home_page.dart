import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_project/presentation/app/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthBloc, PhoneAuthState>(listener: (_, state) {
      if (state is PhoneAuthInitial) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const PhoneAuthPage(),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is PhoneAuthVerified) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Phone number - ${state.currentUser.phoneNumber ?? ''}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    FirebaseAuth.instance.signOut().then((value) {
                      context.read<PhoneAuthBloc>().add(LogoutEvent());
                    });
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
