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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockIndex'] = this.blockIndex;
    data['signature'] = this.signature;
    data['updatedAddresses'] = this.updatedAddresses;
    data['updateTime'] = this.updateTime;
    data['id'] = this.id;
    data['publicKey'] = this.publicKey;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    data['nonce'] = this.nonce;
    data['signer'] = this.signer;
    data['timestamp'] = this.timestamp;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['typeId'] = this.typeId;
    data['inspection'] = this.inspection;
    return data;
  }
}
