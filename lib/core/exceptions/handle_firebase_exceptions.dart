String handleFirebaseExceptions(String exception) {
  switch (exception) {
    case 'email-already-in-use':
      return 'Email already in use';
    case 'invalid-email':
      return 'Invalid email';
    case 'operation-not-allowed':
      return 'Operation not allowed';
    case 'weak-password':
      return 'Weak password';
    case 'user-not-found':
      return 'User not found';
    case 'wrong-password':
      return 'Wrong password';
    case 'invalid-photo-url':
      return 'Invalid Photo ';
    default:
      return 'An error occurred';
  }
}
