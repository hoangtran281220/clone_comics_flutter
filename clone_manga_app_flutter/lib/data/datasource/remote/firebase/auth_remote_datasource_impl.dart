import 'package:clone_manga_app_flutter/data/datasource/remote/firebase/auth_remote_datasource.dart';
import 'package:clone_manga_app_flutter/data/dtos/user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/exceptions/auth_exception.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance
    ..initialize(
      serverClientId:
          '332618593014-t0q3lnk6topakcnkrd5hdf0vv1ksruon.apps.googleusercontent.com',
    );

  CollectionReference<Map<String, dynamic>> get _userCol =>
      _firestore.collection('User');

  String _fakeEmailFromUsername(String username) {
    return '$username@fakeapp.com';
  }

  @override
  Future<UserDto?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<UserDto> loginWithGoogle() async {
    try {
      // 1️⃣ Google authenticate (non-null or throw)
      final account = await _googleSignIn.authenticate();

      // 2️⃣ Lấy token
      final GoogleSignInAuthentication auth = account.authentication;
      if (auth.idToken == null) {
        throw const GoogleAuthFailedException();
      }

      // 3️⃣ Firebase credential
      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
      );

      // 4️⃣ Firebase sign-in
      final userCred = await _auth.signInWithCredential(credential);
      final user = userCred.user;
      if (user == null) {
        throw const GoogleAuthFailedException();
      }

      final uid = user.uid;

      // 5️⃣ Firestore user
      final doc = await _userCol.doc(uid).get();
      final now = Timestamp.now();

      if (!doc.exists) {
        await _userCol.doc(uid).set({
          'Username': user.displayName ?? user.email,
          'Email': user.email,
          'RoleId': 2,
          'CreatedAt': now,
          'UpdateAt': now,
          'avatarUrl': user.photoURL,
          'linkedProvider': 'google',
          'isEmailLinked': true,
        });
      }

      return await _getUserByUid(uid);
    } on GoogleSignInException catch (e) {
      // user cancel OR google flow error
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const GoogleSignInCancelledException();
      }
      throw const GoogleAuthFailedException();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          throw const UserDisabledException();
        case 'network-request-failed':
          throw const NetworkException();
        default:
          throw const GoogleAuthFailedException();
      }
    } on FirebaseException {
      throw const GoogleAuthFailedException();
    }
  }

  @override
  Future<UserDto> loginWithUsername({
    required String username,
    required String password,
  }) async {
    try {
      final userDoc = await _firestore
          .collection('User')
          .where('Username', isEqualTo: username)
          .limit(1)
          .get();

      if (userDoc.docs.isEmpty) {
        throw const UserNotFoundException();
      }

      final fakeEmail = _fakeEmailFromUsername(username);

      final data = userDoc.docs.first.data();
      final linkedProvider = data['linkedProvider'] as String?;

      late final String loginEmail;

      if (linkedProvider == 'password') {
        loginEmail = _fakeEmailFromUsername(username);
      } else if (linkedProvider == 'email') {
        loginEmail = data['Email'];
        if (loginEmail.isEmpty) {
          throw const InvalidCredentialsException();
        }
      } else {
        throw const InvalidCredentialsException(); // google, etc
      }

      final credential = await _auth.signInWithEmailAndPassword(
        email: fakeEmail,
        password: password,
      );

      final uid = credential.user?.uid;
      if (uid == null) {
        throw const UnknownAuthException();
      }

      return await _getUserByUid(uid);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw const UserNotFoundException();

        case 'wrong-password':
          throw const InvalidCredentialsException();

        case 'invalid-email':
          // trường hợp fake email generate sai
          throw const InvalidCredentialsException();

        case 'network-request-failed':
          throw const NetworkException();

        default:
          throw const UnknownAuthException();
      }
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    await _auth.signOut();
    // đảm bảo logout Google nếu user login Google
    await _googleSignIn.signOut();
  }

  @override
  Future<UserDto> register({
    required String username,
    required String password,
  }) async {
    UserCredential? credential;

    try {
      final fakeEmail = _fakeEmailFromUsername(username);

      // 1️⃣ Create Firebase Auth user
      credential = await _auth.createUserWithEmailAndPassword(
        email: fakeEmail,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw const UnknownRegisterException();
      }

      final uid = user.uid;
      final now = Timestamp.now();

      // 2️⃣ Create Firestore user
      await _userCol.doc(uid).set({
        'Username': username,
        'RoleId': 2,
        'CreatedAt': now,
        'UpdateAt': now,
        'avatarUrl': null,
        'linkedProvider': 'password',
        'isEmailLinked': false,
      });

      // 3️⃣ Return DTO
      return await _getUserByUid(uid);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw const UsernameAlreadyExistsException();

        case 'weak-password':
          throw const WeakPasswordException();

        case 'network-request-failed':
          throw const NetworkException();

        default:
          throw const UnknownRegisterException();
      }
    } on FirebaseException {
      // Firestore error
      if (credential?.user != null) {
        // rollback Firebase Auth user
        await credential!.user!.delete();
      }
      throw const CreateUserFailedException();
    }
  }

  Future<UserDto> _getUserByUid(String uid) async {
    final doc = await _userCol.doc(uid).get();

    if (!doc.exists || doc.data() == null) {
      throw const UnknownAuthException();
    }

    final data = doc.data()!;

    return UserDto(
      id: doc.id,
      email: data['Email'] as String?,
      userName: data['Username'] as String,
      roleId: data['RoleId'] as int,
      createdAt: (data['CreatedAt'] as Timestamp).toDate(),
      updatedAt: (data['UpdateAt'] as Timestamp).toDate(),
      avatarUrl: data['avatarUrl'] as String?,
    );
  }
}
