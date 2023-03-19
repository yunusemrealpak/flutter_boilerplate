// import 'package:dio/dio.dart';

// class TokenInterceptor extends Interceptor {
//   late final ICoreDio dio;
//   late final ICoreDio tokenDio;
//   late final ITokenRepository tokenRepository;
//   late final int maxRetryCount;
//   DioTokenInterceptor({
//     required this.dio,
//     required this.tokenDio,
//     this.maxRetryCount = 3,
//   }) {
//     tokenRepository = TokenRepository(tokenDio: tokenDio);
//   }

//   int retryCount = 0;

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final AccessToken? token = tokenRepository.storageManager.getItem();

//     options.headers.remove("Authorization");

//     switch (T.toString()) {
//       case "DeviceToken":
//         options.headers
//             .addAll({"Authorization": "Bearer ${token?.deviceToken}"});
//         break;
//       case "UserToken":
//         options.headers.addAll({"Authorization": "Bearer ${token?.userToken}"});
//         break;
//       default:
//     }

//     return handler.next(options);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       if (tokenRepository.storageManager.containsItem()) {
//         if (await _onRefreshToken()) {
//           return handler.resolve(await _retry(err.requestOptions));
//         }
//       }
//     }
//     return handler.next(err);
//   }

//   Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//     final HttpTypes type = requestOptions.method.convertHttpType!;
//     final responseModel = await dio.send(
//       requestOptions.path,
//       type: type,
//       queryParameters: requestOptions.queryParameters,
//       data: requestOptions.data,
//     );
//     return responseModel.response!;
//   }

//   Future<bool> _onRefreshToken() async {
//     final AccessToken? token = tokenRepository.storageManager.getItem();

//     if (token == null) return false;

//     switch (T.toString()) {
//       case "DeviceToken":
//         var result = await tokenRepository.getToken();
//         if (result.isRight()) {
//           await tokenRepository.addAccessResponseToStorage<DeviceToken>(
//               accessResponse: result.right);
//           print("Device Token : ${result.right.accessToken}");
//           return true;
//         } else {
//           retryCount++;
//         }

//         if (retryCount <= maxRetryCount) {
//           return await _onRefreshToken();
//         }
//         return false;
//       case "UserToken":
//         var result = await tokenRepository.refreshToken(token.refreshToken!);
//         if (result.isRight()) {
//           await tokenRepository.addAccessResponseToStorage<UserToken>(
//               accessResponse: result.right);
//           print("User Token : ${result.right.accessToken}");
//           return true;
//         } else {
//           retryCount++;
//         }

//         if (retryCount <= maxRetryCount) {
//           return await _onRefreshToken();
//         }
//         return false;
//       default:
//         return false;
//     }
//   }
// }