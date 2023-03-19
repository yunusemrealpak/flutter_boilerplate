/// ------------------------------------------------------------------
///
///  English:
///
/// A class that represents the network configuration used by a network manager.
///
/// [baseUrl]: The base URL used for all network requests.
///
/// [apiKey]: An optional API key that may be required to authenticate requests.
///
/// [minimumValidateStatus]: The minimum HTTP status code that should be considered a successful response.
///
/// [connectTimeout]: The maximum amount of time to wait for a connection to be established before giving up.
///
/// [receiveTimeout]: The maximum amount of time to wait for a response to be received before giving up.
///
/// [sendTimeout]: The maximum amount of time to wait for a request to be sent before giving up.
///
/// ------------------------------------------------------------------
///
///  Türkçe:
///
/// Bir ağ yöneticisi tarafından kullanılan ağ yapılandırmasını temsil eden bir sınıf.
///
/// [baseUrl]: Tüm ağ istekleri için kullanılan temel URL.
///
/// [apiKey]: İsteğin kimlik doğrulanmasını gerektirebilecek isteğe bağlı bir API anahtarı.
///
/// [minimumValidateStatus]: Başarılı bir yanıt olarak kabul edilecek minimum HTTP durum kodu.
///
/// [connectTimeout]: Bir bağlantının kurulmasını beklemek için ayarlanan maksimum süre.
///
/// [receiveTimeout]: Bir yanıtın alınmasını beklemek için ayarlanan maksimum süre.
///
/// [sendTimeout]: Bir isteğin gönderilmesini beklemek için ayarlanan maksimum süre.

class NetworkConfiguration {
  String baseUrl;
  String? apiKey;
  int minimumValidateStatus;
  Duration? connectTimeout;
  Duration? receiveTimeout;
  Duration? sendTimeout;

  NetworkConfiguration(
    this.baseUrl, {
    this.apiKey,
    this.connectTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 5),
    this.sendTimeout = const Duration(seconds: 10),
    this.minimumValidateStatus = 400,
  });
}
