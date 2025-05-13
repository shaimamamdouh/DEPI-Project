import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<AuthState> {
  SignupCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      emit(AuthFailure("Please fill in all fields"));
      return;
    }

    if (password != confirmPassword) {
      emit(AuthFailure("Passwords do not match"));
      return;
    }

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'createdAt': Timestamp.now(),
      });

      emit(AuthSuccess());
    } catch (e) {
      print("Error details: $e");
      emit(AuthFailure(e.toString()));
    }
  }
}