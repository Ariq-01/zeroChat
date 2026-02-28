import 'package:zerochat/firebase_options_dev.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

final sL = GetIt.instance; // sl = srvice lcoataor

Future<void> init() async {
  // firebase insialsia
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  sl.registrySingeleton(() => FirebaseAuth.instance);
  // to do :: tambahkan service /repsotirofy disini
  // sampel : sl.registrySingeleton reopityy => Authrepository impl().
}
