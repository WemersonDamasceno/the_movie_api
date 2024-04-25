abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}

class HttpResponse {
  final int statusCode;
  final dynamic data;

  HttpResponse({
    required this.statusCode,
    required this.data,
  });
}
