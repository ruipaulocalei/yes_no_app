import 'package:http/http.dart' as http;

import '../data/http/http_client.dart';

class HttpClientImpl implements IHttpService {
  final httpClient = http.Client();
  
  @override
  Future get({required String url}) async{
    return await httpClient.get(Uri.parse(url));
  }

}
