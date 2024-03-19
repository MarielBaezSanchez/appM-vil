



import 'package:firebase_auth/firebase_auth.dart';
import 'package:historial_exit/toast.dart';


class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        showToast(message: 'Este correo ya se encuentra registrado.');
      } else {
        showToast(message: 'Parece que un error ocurrió: ${e.code}');
      }
    }
    return null;

  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'usuario inexistente' || e.code == 'contraseña incorrecta') {
        showToast(message: 'Correo o contraseña no validos');
      } else {
        showToast(message: 'Parece que ocurrió un error: ${e.code}');
      }
    }
    return null;
  }
}


