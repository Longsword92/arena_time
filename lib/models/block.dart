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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['index'] = this.index;
    data['transactionCount'] = this.transactionCount;
    data['timestamp'] = this.timestamp;
    data['miner'] = this.miner;
    data['stateRootHash'] = this.stateRootHash;
    return data;
  }
}
