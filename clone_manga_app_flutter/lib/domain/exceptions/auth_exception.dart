abstract class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
}

// Sai username / password
class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException()
      : super('Sai username hoặc mật khẩu');
}

// Không tồn tại user
class UserNotFoundException extends AuthException {
  const UserNotFoundException()
      : super('Tài khoản không tồn tại');
}

// Lỗi mạng
class NetworkException extends AuthException {
  const NetworkException()
      : super('Lỗi kết nối mạng');
}

// Lỗi chung
class UnknownAuthException extends AuthException {
  const UnknownAuthException()
      : super('Đăng nhập thất bại');
}

// User bấm back / cancel Google popup
class GoogleSignInCancelledException extends AuthException {
  const GoogleSignInCancelledException()
      : super('Đăng nhập Google đã bị hủy');
}

// Lỗi khi exchange credential với Firebase
class GoogleAuthFailedException extends AuthException {
  const GoogleAuthFailedException()
      : super('Đăng nhập Google thất bại');
}

// User bị disable trên Firebase
class UserDisabledException extends AuthException {
  const UserDisabledException()
      : super('Tài khoản đã bị vô hiệu hóa');
}

// Username đã tồn tại
class UsernameAlreadyExistsException extends AuthException {
  const UsernameAlreadyExistsException()
      : super('Username đã tồn tại');
}

// Password không đạt yêu cầu
class WeakPasswordException extends AuthException {
  const WeakPasswordException()
      : super('Mật khẩu quá yếu');
}

// Email ảo đã tồn tại (rare nhưng có)
class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException()
      : super('Tài khoản đã tồn tại');
}

// Lỗi khi lưu user vào Firestore
class CreateUserFailedException extends AuthException {
  const CreateUserFailedException()
      : super('Không thể tạo tài khoản');
}

class UnknownRegisterException extends AuthException {
  const UnknownRegisterException()
      : super('Đăng ký thất bại');
}