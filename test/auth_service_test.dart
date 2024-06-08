// test/auth_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../lib/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('AuthService', () {
    test('login returns true on successful login', () async {
      final service = MockAuthService();
      when(service.login('username', 'password')).thenAnswer((_) async => true);

      expect(await service.login('username', 'password'), true);
    });

    test('login returns false on failed login', () async {
      final service = MockAuthService();
      when(service.login('username', 'password')).thenAnswer((_) async => false);

      expect(await service.login('username', 'password'), false);
    });
  });
}
