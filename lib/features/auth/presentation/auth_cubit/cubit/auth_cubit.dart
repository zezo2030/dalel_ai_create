import 'package:dalel_ai/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;
  String? password;
  String? firstName;
  String? lastName;

  bool termsAccepted = false;

  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpError('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpError('The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }

  void setTermsAccepted(bool value) {
    termsAccepted = value;
    emit(TermsAccepted());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInError('Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
