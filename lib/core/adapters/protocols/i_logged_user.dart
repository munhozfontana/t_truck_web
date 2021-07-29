// class LoggedUser implements ILoggedUser {
//   final IJwt iJwt;
//   final ILocalStoreExternal iLocalStoreExternal;

//   LoggedUser({
//     required this.iJwt,
//     required this.iLocalStoreExternal,
//   });

//   @override
//   Future<String> get login async {
//     var token = await iLocalStoreExternal.take('token');
//     return iJwt.jwtDecode(token as String)['login'];
//   }

//   @override
//   Future<bool> loginExpired() async {
//     try {
//       var token = await iLocalStoreExternal.take('token');

//       if (token == null) {
//         return true;
//       }

//       var expired = iJwt.isExpired(token as String);
//       if (expired) {
//         await iLocalStoreExternal.remove('token');
//       }
//       return expired;
//     } catch (e) {
//       throw DriverException(error: e.toString());
//     }
//   }

//   @override
//   void logout() {
//     try {
//       iLocalStoreExternal.remove('token');
//     } catch (e) {
//       throw DriverException(error: 'Error ao remover o token');
//     }
//   }

//   @override
//   Future<String> get token async {
//     try {
//       return (await iLocalStoreExternal.take('token') as String);
//     } catch (e) {
//       throw DriverException(error: 'Error ao recuperar o token');
//     }
//   }
// }

mixin ILoggedUser {
  Future<String> get login;
  Future<String> get token;
  Future<bool> loginExpired();
  void logout();
}
