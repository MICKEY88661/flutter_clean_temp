/// remote restful client
abstract class IRemoteClient {
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}
