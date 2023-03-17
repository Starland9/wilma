import 'package:wilma/classes/client.dart';
import 'package:wilma/main.dart';

bool isAdmin() => (isAuth() &&
    (gClient!.email.contains("landry") || gClient!.email.contains("wilma")));

bool isAuth() {
  if (clients.isEmpty) {
    return false;
  }
  if (gClient != null) {
    return true;
  }
  return false;
}
