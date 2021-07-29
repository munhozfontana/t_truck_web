// import 'package:connectivity_plus/connectivity_plus.dart';

// import '../../error/driver_exception.dart';
// import '../protocols/i_connectivity_external.dart';

// class ConnectivityPlusDirver implements IConnectivity {
//   Connectivity connectivity;

//   ConnectivityPlusDirver({
//     required this.connectivity,
//   });

//   @override
//   Future<bool> isConnected() async {
//     try {
//       var connectivityResult = await (connectivity.checkConnectivity());
//       if (connectivityResult == ConnectivityResult.mobile) {
//         return true;
//       } else if (connectivityResult == ConnectivityResult.wifi) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       throw DriverException(error: e.toString());
//     }
//   }
// }
