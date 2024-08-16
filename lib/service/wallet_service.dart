abstract class WalletService {
  Future<List<String>> createWallet();
}

class EtherWalletService implements WalletService {
  @override
  Future<List<String>> createWallet() async {
    return <String>[];
  }
}
