abstract interface class HttpProvider {
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? params,
    String? path,
  });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? path,
  });

  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? path,
  });

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? params,
    String? path,
  });
}
