import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:grocery_app/utils/rest_api_urls.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class ApiClient {
  Future<dynamic> get(String url,
      {Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        bool authorization = false});
  Future<dynamic> post(String url,
      {Map<String, dynamic>? headers, required body, bool authorization = false});
Future<dynamic> put(String url,
    {Map<String, dynamic>? headers, @required body, bool authorization = false});
}

class ApiClientImpl implements ApiClient {
  final Dio _dio;

  ApiClientImpl(this._dio) {
    _initApiClient();
  }

  void _initApiClient() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    _dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;

    // if (Environment.value!.environmentType != EnvType.PRODUCTION) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: false,
        error: true,
      ),
    );
    // }
    // dio.interceptors.add(MeyInterceptors(localStorage));

    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (request, handler) async{
    //       String token = "";
    //       if (token != null && token != '') {
    //         request.headers['Authorization'] = 'Bearer $token';
    //       }
    //       return handler.next(request);
    //     },
    //     onError: (e, handler) async {
    //       // if (e.response?.statusCode == 401) {
    //       //   try {
    //       //     await dio
    //       //         .post(
    //       //         "https://refresh.api",
    //       //         data: jsonEncode(
    //       //             {"refresh_token": refreshtoken}))
    //       //         .then((value) async {
    //       //       if (value?.statusCode == 201) {
    //       //         //get new tokens ...
    //       //         // print("access token" + token);
    //       //         // print("refresh token" + refreshtoken);
    //       //         //set bearer
    //       //         e.requestOptions.headers["Authorization"] =
    //       //             "Bearer " + token;
    //       //         //create request with new access token
    //       //         final opts = new Options(
    //       //             method: e.requestOptions.method,
    //       //             headers: e.requestOptions.headers);
    //       //         final cloneReq = await dio.request(e.requestOptions.path,
    //       //             options: opts,
    //       //             data: e.requestOptions.data,
    //       //             queryParameters: e.requestOptions.queryParameters);
    //       //
    //       //         return handler.resolve(cloneReq);
    //       //       }
    //       //       return e;
    //       //     });
    //       //     return dio;
    //       //   } catch (e, st) {
    //       //
    //       //   }
    //       // }
    //     },
    //   ),
    // );

  //   _dio.interceptors.add(InterceptorsWrapper(
  //     onResponse: (response, handler) {
  //       response.data = json.decode(response.data['data']);
  //       handler.next(response);
  //     },
  //     onError: (DioError e, handler) {
  //       if (e.response != null) {
  //         // switch (e.response!.requestOptions.path) {
  //         //   case URL_NOT_FIND:
  //         //     return handler.next(e);
  //         //   case URL_NOT_FIND_1:
  //         //     handler.resolve(
  //         //       Response(
  //         //         requestOptions: e.requestOptions,
  //         //         data: 'fake data',
  //         //       ),
  //         //     );
  //         //     break;
  //         //   case URL_NOT_FIND_2:
  //         //     handler.resolve(
  //         //       Response(
  //         //         requestOptions: e.requestOptions,
  //         //         data: 'fake data',
  //         //       ),
  //         //     );
  //         //     break;
  //         //   case URL_NOT_FIND_3:
  //         //     handler.next(
  //         //       e..error = 'custom error info [${e.response?.statusCode}]',
  //         //     );
  //         //     break;
  //         // }
  //       } else {
  //         handler.next(e);
  //       }
  //     },
  //   ));
  // }

  // @override
  // Future<dynamic> get(
  //     String url, {
  //       Map<String, dynamic>? headers,
  //       Map<String, dynamic>? queryParameters,
  //       bool authorization = false,
  //     }) async {
  //   try {
  //     if (authorization) {
  //       // _dio.interceptors.add(
  //       //   InterceptorsWrapper(
  //       //     onRequest: (RequestOptions options) async {
  //       //       if (!options.headers.containsKey("Authorization") &&
  //       //           AuthStore.to.token != null) {
  //       //         options.headers["Authorization"] =
  //       //         "Bearer ${AuthStore.to.token}";
  //       //       }
  //       //       return options;
  //       //     },
  //       //     onResponse: (Response response) async {
  //       //       return response;
  //       //     },
  //       //     onError: (DioError e) async {
  //       //       // if (e.response.data['message'] == 'Invalid JWT Token') {
  //       //       //   Modular.to.pushReplacementNamed(Routers.userLogin);
  //       //       // }
  //       //
  //       //       return e;
  //       //     },
  //       //   ),
  //       // );
  //     }
  //
  //     final response = await _dio.get(
  //       url,
  //       queryParameters: queryParameters,
  //       options: Options(headers: headers),
  //     );
  //
  //     // final String res = json.encode(response.data);
  //     // print('[API Dio Helper - GET] Server Response: $res');
  //
  //     return response.data;
  //   } on DioError catch (e) {
  //     // print('[API Dio Helper - GET] Connection Exception => ' + e.message);
  //
  //     // if (e?.response?.data != null) throw Exception(e.response.data);
  //
  //     throw Exception(e.message);
  //   }
  // }
  //



}
  _getRequestInterceptor(bool authorization){
    // return InterceptorsWrapper(
    //         onRequest: (RequestOptions options) async {
    //           // if (!options.headers.containsKey("Authorization") &&
    //           //     AuthStore.to.token != null) {
    //           //   options.headers["Authorization"] =
    //           //   "Bearer ${AuthStore.to.token}";
    //           // }
    //           return options;
    //         },
    //         onResponse: (Response response) async {
    //           return response;
    //         },
    //         onError: (DioError e) async {
    //           // if (e.response.data['message'] == 'Invalid JWT Token') {
    //           //   Modular.to.pushReplacementNamed(Routers.userLogin);
    //           // }
    //
    //           return e;
    //         },
    //       );
    return InterceptorsWrapper(onRequest: (options, handler) async {
      if(!authorization){

      }
      else{

      }
      return handler.next(options);
    });
  }

  _getResponseInterceptor(){
    return InterceptorsWrapper(
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (DioError e, handler) {
        if (e.response != null) {
          // switch (e.response!.requestOptions.path) {
          //   case URL_NOT_FIND:
          //     return handler.next(e);
          //   case URL_NOT_FIND_1:
          //     handler.resolve(
          //       Response(
          //         requestOptions: e.requestOptions,
          //         data: 'fake data',
          //       ),
          //     );
          //     break;
          //   case URL_NOT_FIND_2:
          //     handler.resolve(
          //       Response(
          //         requestOptions: e.requestOptions,
          //         data: 'fake data',
          //       ),
          //     );
          //     break;
          //   case URL_NOT_FIND_3:
          //     handler.next(
          //       e..error = 'custom error info [${e.response?.statusCode}]',
          //     );
          //     break;
          // }
          return handler.next(e);
        } else {
          handler.next(e);
        }
      },
    );
  }

  @override
  Future get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters, bool authorization = false}) async {
      try {
        _dio.interceptors.add(_getRequestInterceptor(authorization));
        _dio.interceptors.add(_getResponseInterceptor());

        final response = await _dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );

        // final String res = json.encode(response.data);
        // print('[API Dio Helper - GET] Server Response: $res');

        return response;
      } on DioError catch (e) {
        // print('[API Dio Helper - GET] Connection Exception => ' + e.message);
        //
        // if (e?.response?.data != null) throw Exception(e.response.data);

        return e.response;
      }
  }

  @override
  Future post(String url, {Map<String, dynamic>? headers, required body, bool authorization = false}) async {
    try {
      _dio.interceptors.add(_getRequestInterceptor(authorization));
      _dio.interceptors.add(_getResponseInterceptor());

      final response = await _dio.post(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      // if (e.response.statusCode == 401) {
      //   Modular.to.pushReplacementNamed(Routers.userLogin);
      // }

      // if (e?.response?.data != null) throw Exception(e.response.data);

      return e.response;
    }
  }

  @override
  Future put(
      String url, {
        Map<String, dynamic>? headers,
        @required body,
        bool authorization = false,
      }) async {
    try {
      _dio.interceptors.add(_getRequestInterceptor(authorization));
      _dio.interceptors.add(_getResponseInterceptor());

      final response =
      await _dio.put(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      // if (e?.response?.data != null) throw ServerException(e.response.data);

      return e.response;
    }
  }


}
