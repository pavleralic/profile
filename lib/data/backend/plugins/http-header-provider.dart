abstract class HttpHeaderProvider {
  String getHeaderName();

  Future<String> getHeaderValue();
}
