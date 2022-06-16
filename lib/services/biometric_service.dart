import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  static Future<bool> authenticateUser() async {
    // initialize LocalAuth library
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    // status of authentication
    bool didAuthenticate = false;

    // check if device supports biometrics authentication
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print(availableBiometrics);

    // if device supports biometrics, then authenticate
    if (canAuthenticate) {
      // some biometrics are enrolled.
      try {
        didAuthenticate = await auth.authenticate(
          localizedReason: 'Mohon autentikasi untuk melakukan pemilihan',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (e) {
        print(e);
      }
    }

    return didAuthenticate;
  }
}
