import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ofertas/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  var mockInternetConnectionChecker = MockInternetConnectionChecker();
  var mockNetworkInfo = NetworkInfoImpl(mockInternetConnectionChecker);

  group('isConnected', () {
    final tHasConnection = Future.value(true);
    setUp(() {
      when(mockNetworkInfo.isConnected())
          .thenAnswer((realInvocation) => tHasConnection);
    });
    testWidgets(
        'Should forward the call to DataConnectionChecker.hasConnection()',
        (tester) async {
      //act
      //Al no esperar estamos obteniendo un Futuro con valor true, y estamos verificando que lo que se devuelve es precisamente eso
      //y no un valor hardcodeado. Si hardcodeamos un futuro, seria otro que esta en otro espacio de memoria, por lo que fallaria
      //en caso de estar mal. No tengo que esperar ningun llamado(saco asyncs) por que lo que chequeo es  el futuro en si mismo.
      var result = mockNetworkInfo.isConnected();
      //Assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
