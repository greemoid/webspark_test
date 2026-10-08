abstract interface class ApiUrlLocalDataSource {
  Future<String?> getUrl();
  Future<void> saveUrl(String url);
}
