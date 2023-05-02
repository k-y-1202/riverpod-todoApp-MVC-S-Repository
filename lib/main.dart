import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo_app_mvc_s_repository/firebase_options.dart';
import 'package:riverpod_todo_app_mvc_s_repository/src/config/routing/app_router.dart';

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
      debugShowCheckedModeBanner: false, // debug用のバナーを非表示
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}


// riverpod_generatorの使い方<作成編>
// 1. riverpod_annotationをimport
// 2. part 'ファイル名.g.dart';を書く
/* 4. providerを作成
<書き方1>
@riverpod
class クラス名 extends _$クラス名{
  @override
  stateで保持する型(hogeState, boolなど)  build() {
    // ここに初期化処理を書く  
  }

  Future<void> getUser() async {
    state = state.copyWith(isLoading: true);

    final user = await ref.read(userServiceProvider.notifier).getUser();
    state = state.copyWith(userName: user.userName),
    );

    state = state.copyWith(isLoading: false);
  }

  ※[注意] state, refはriverpod_generatorが自動で生成してくれる。5を実行するまではエラーが出るので注意。

}
  

<書き方2>
@riverpod
FirebaseFirestore firestore(FirestoreRef ref) {
  return FirebaseFirestore.instance;
}
*/ 
// 5. flutter pub run build_runner build --delete-conflicting-outputsを実行


// riverpod_generatorの使い方<使用編>
// 1. ref.watch(Provider名)でProviderを呼び出す。stateにアクセスできる。
// Provider名は作成したクラスの先頭を小文字＆Providerをつけた名前になる。
// 例：class HogeController extends _$HogeController => hogeControllerProvider
// 2. ref.read(Provider名.notifier)でProviderを呼び出す。stateにアクセスできない。関数を呼び出すときに使う。