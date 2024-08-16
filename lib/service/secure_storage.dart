class SecureStorage {
  Future<bool> hasWallet() async {
    return false;
  }

  Future<void> setWallet(String seedPhrase) async {}

  Future<void> deleteWallet() async {}
}
