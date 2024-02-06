import 'dart:developer';

import '../../../../core.dart';

class RegisterController extends GetxController {
  final cFormEmail = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  initLogin() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account != null) {
        await GoogleSignIn().signOut();
      } else {
        // user NOT logged
      }
    });
    _googleSignIn.signInSilently().whenComplete(
          () => EasyLoading.dismiss(),
        );
  }

  Future signInGoogle() async {
    log('singInGoogle');
    await EasyLoading.show(
      status: 'loading...',
      // maskType: EasyLoadingMaskType.black,
    );
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // final accessToken = gAuth.accessToken;
    // final idToken = gAuth.idToken;

    if (gUser != null) {
      final email = gUser.email;
      final name = gUser.displayName;
      final image = gUser.photoUrl;

      log(
        email.toString(),
        name: "singInGoogle email",
      );
      log(
        name.toString(),
        name: "singInGoogle name",
      );
      log(
        image.toString(),
        name: "singInGoogle image",
      );
    } else {
      EasyLoading.dismiss();
    }

    // log(
    //   accessToken.toString(),
    //   name: "singInGoogle accessToken",
    // );
    // log(
    //   idToken.toString(),
    //   name: "singInGoogle idToken",
    // );
  }

  @override
  void onInit() {
    initLogin();
    super.onInit();
  }
}
