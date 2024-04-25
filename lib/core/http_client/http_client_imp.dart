import 'package:http/http.dart' as http;
import 'package:the_movies_api/core/http_client/http_client.dart';

class HttpClientImp implements HttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) {
    throw UnimplementedError();
  }
}
