class Block {
  String? hash;
  int? index;
  int? transactionCount;
  String? timestamp;
  String? miner;
  String? stateRootHash;

  Block(
      {this.hash,
      this.index,
      this.transactionCount,
      this.timestamp,
      this.miner,
      this.stateRootHash});

  Block.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    index = json['index'];
    transactionCount = json['transactionCount'];
    timestamp = json['timestamp'];
    miner = json['miner'];
    stateRootHash = json['stateRootHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    data['index'] = index;
    data['transactionCount'] = transactionCount;
    data['timestamp'] = timestamp;
    data['miner'] = miner;
    data['stateRootHash'] = stateRootHash;
    return data;
  }
}
