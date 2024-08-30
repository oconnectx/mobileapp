/// wallet service
abstract class WalletService {
  /// create new wallet
  /// generates new wallet
  /// returns:
  ///   - wallet mnemonic list
  Future<List<String>> createWallet();
}

/// Ether wallet service for ethereum wallets
/// implements wallet service
class EtherWalletService implements WalletService {
  /// create new wallet
  /// generates new ethereum wallet
  /// - returns:  wallet mnemonic list
  @override
  Future<List<String>> createWallet() async {
    return <String>[];
  }
}
