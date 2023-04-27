import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/firebase_options.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/app_router.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/features/todo/view/screens/team_todo_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

// final authStateProvider = StateProvider((ref) => AuthAction.signUp);

@riverpod
AuthAction authState(AuthStateRef ref) => AuthAction.signIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // ProviderScopeの内側でRiverpodのProviderが使用できる
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // debug用のバナーを非表示
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false, // debug用のバナーを非表示
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const TestScreen(),
    // );
  }
}

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(authStateProvider);
    print(provider);
    return Scaffold(
      body: AuthFlowBuilder<EmailAuthController>(
        action: provider, // ここに入れる値でログインかサインアップかを切り替える
        // action: provider,
        builder: (context, state, ctrl, child) {
          print(state);
          if (state is AwaitingEmailAndPassword) {
            return MyCustomEmailForm();
          } else if (state is SigningIn) {
            return CircularProgressIndicator();
          } else if (state is SigningUp) {
            return CircularProgressIndicator();
          } else if (state is AuthFailed) {
            // TODO: エラー処理を書く
            return ErrorText(exception: state.exception);
          } else if (state is UserCreated) {
            return TeamTodoListScreen();
          } else {
            return Text('Unknown state $state');
          }
        },
        // child: provider == SigningUp
        //     ? MyCustomEmailForm()
        //     : provider == SigningIn
        //         ? MyCustomEmailForm()
        //         : provider == UserCreated
        //             ? TeamTodoListScreen()
        //             : Text('Unknown state $provider'),
      ),
    );
  }
}

class MyCustomEmailForm extends ConsumerWidget {
  const MyCustomEmailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = AuthController.ofType<EmailAuthController>(context);
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: passController,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ctrl.setEmailAndPassword(emailController.text, passController.text);
            // context.read(emailAuthControllerProvider).signIn();
          },
          child: const Text('Sign in'),
        ),
      ],
    );
  }
}

// class CustomEmailSignInState extends StatefulWidget {
//   const CustomEmailSignInState({super.key});

//   @override
//   State<CustomEmailSignInState> createState() => _CustomEmailSignInState();
// }

// class _CustomEmailSignInState extends State<CustomEmailSignInState>
//     implements EmailAuthListener {
//   final auth = FirebaseAuth.instance;
//   late final EmailAuthProvider provider = EmailAuthProvider()
//     ..authListener = this;

//   Widget child = MyCustomEmailForm(onSubmit: (email, password) {
//     provider.authenticate(email, password, AuthAction.signIn);
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: child);
//   }

//   @override
//   void onBeforeCredentialLinked(AuthCredential credential) {
//     setState(() {
//       child = CircularProgressIndicator();
//     });
//   }

//   @override
//   void onBeforeProvidersForEmailFetch() {
//     setState(() {
//       child = CircularProgressIndicator();
//     });
//   }

//   @override
//   void onBeforeSignIn() {
//     setState(() {
//       child = CircularProgressIndicator();
//     });
//   }

//   @override
//   void onCanceled() {
//     setState(() {
//       child = MyCustomEmailForm(onSubmit: (email, password) {
//         auth.signInWithEmailAndPassword(email: email, password: password);
//       });
//     });
//   }

//   @override
//   void onCredentialLinked(AuthCredential credential) {
//     Navigator.of(context).pushReplacementNamed('/profile');
//   }

//   @override
//   void onDifferentProvidersFound(
//       String email, List<String> providers, AuthCredential? credential) {
//     showDifferentMethodSignInDialog(
//       context: context,
//       availableProviders: providers,
//       providers: FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
//     );
//   }

//   @override
//   void onError(Object error) {
//     try {
//       // tries default recovery strategy
//       defaultOnAuthError(provider, error);
//     } catch (err) {
//       setState(() {
//         defaultOnAuthError(provider, error);
//       });
//     }
//   }

//   @override
//   void onSignedIn(UserCredential credential) {
//     Navigator.of(context).pushReplacementNamed('/profile');
//   }
// }
