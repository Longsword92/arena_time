class Transaction {
  int? blockIndex;
  String? signature;
  List<String>? updatedAddresses;
  String? updateTime;
  String? id;
  String? publicKey;
  List<TransactionAction>? actions;
  int? nonce;
  String? signer;
  String? timestamp;

  Transaction({
    this.blockIndex,
    this.signature,
    this.updatedAddresses,
    this.updateTime,
    this.id,
    this.publicKey,
    this.actions,
    this.nonce,
    this.signer,
    this.timestamp,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    blockIndex = json['blockIndex'];
    signature = json['signature'];
    updatedAddresses = json['updatedAddresses'].cast<String>();
    updateTime = json['updateTime'];
    id = json['id'];
    publicKey = json['publicKey'];
    if (json['actions'] != null) {
      actions = <TransactionAction>[];
      json['actions'].forEach((v) {
        actions!.add(TransactionAction.fromJson(v));
      });
    }
    nonce = json['nonce'];
    signer = json['signer'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blockIndex'] = blockIndex;
    data['signature'] = signature;
    data['updatedAddresses'] = updatedAddresses;
    data['updateTime'] = updateTime;
    data['id'] = id;
    data['publicKey'] = publicKey;
    if (actions != null) {
      data['actions'] = actions!.map((v) => v.toJson()).toList();
    }
    data['nonce'] = nonce;
    data['signer'] = signer;
    data['timestamp'] = timestamp;
    return data;
  }
}

class TransactionAction {
  String? raw;
  String? typeId;
  String? inspection;

  TransactionAction({this.raw, this.typeId, this.inspection});

  TransactionAction.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    typeId = json['typeId'];
    inspection = json['inspection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['raw'] = raw;
    data['typeId'] = typeId;
    data['inspection'] = inspection;
    return data;
  }
}
