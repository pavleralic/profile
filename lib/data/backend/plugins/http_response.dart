class HttpResponse {
  final Map<String, dynamic> headers;
  final int statusCode;
  final String statusMessage;
  final Map<String, dynamic> body;

  HttpResponse(this.headers, this.statusCode, this.statusMessage, this.body);
}
