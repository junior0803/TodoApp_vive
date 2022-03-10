part of 'authenticator_cubit.dart';

enum AppStatus {
  authenticated,
  unauthenticated
}

enum ProfileStatus{
  completed,
  uncompleted
}

class AuthenticatorState {
  final AppStatus authstatus;
  final ProfileStatus profileStatus;
  String? email;
  String? phoneNumber;
  String? password;
  User? user;

  AuthenticatorState({
    this.authstatus = AppStatus.unauthenticated,
    this.profileStatus = ProfileStatus.uncompleted,
    this.email,
    this.phoneNumber,
    this.password,
    this.user,
  });
}

class IsAuthenticated extends AuthenticatorState {
  IsAuthenticated(user) : super(authstatus: AppStatus.authenticated, user: user);
}

class IsNotAuthenticated extends AuthenticatorState {
  IsNotAuthenticated() : super(user: null, authstatus: AppStatus.unauthenticated);
}

class IsAccountComplete extends AuthenticatorState {
  IsAccountComplete(user) : super(user: user, profileStatus: ProfileStatus.completed, authstatus: AppStatus.authenticated);
}

class IsEmail extends AuthenticatorState {
  IsEmail(email) : super(email: email);
}

class IsPassword extends AuthenticatorState {
  IsPassword(password) : super(password: password);
}

class EmailVerified extends AuthenticatorState {
  EmailVerified() : super();
}

class NotEmailVerified extends AuthenticatorState {
  NotEmailVerified() : super();
}


// abstract class AuthenticatorState {
//   final auth = FirebaseAuth.instance;

//   bool isLoggedIn() {
//     return auth.currentUser != null;
//   }
// }
