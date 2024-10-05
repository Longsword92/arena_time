part of 'index.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({
    super.key,
    required ItemProduct product,
  }) : _product = product;

  final ItemProduct _product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Image(
                width: 50,
                image: AssetImage("assets/images/Item/${_product.itemId}.png"),
              ),
            ),
            if (_product.isEquiment)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_product.elementalTypeDisplay,
                      style: TextStyle(
                          color: (_product.skillModels ?? []).isNotEmpty
                              ? Colors.purple
                              : null)),
                  const SizedBox(width: 10),
                  Text("+${_product.level}",
                      style: TextStyle(
                          color: (_product.skillModels ?? []).isNotEmpty
                              ? Colors.purple
                              : null)),
                ],
              ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_product.isEquiment) Text("x${_product.quantity}"),
                if (!_product.isEquiment) const SizedBox(width: 5),
                Text(
                  "${_product.price?.toInt()}g",
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                if (!_product.isEquiment) const SizedBox(width: 5),
                if (!_product.isEquiment) Text("(${_product.unitPrice})"),
              ],
            ),
            const SizedBox(height: 5),
            if (_product.isEquiment)
              Row(
                children: [
                  SizedBox(
                      width: 50, child: Text(_product.mainStat.typeDisplay)),
                  const SizedBox(width: 10),
                  Text("${_product.mainStat.value}"),
                ],
              ),
            ...(_product.additionalStat)
                .map((e) => Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              e.typeDisplay,
                              style: const TextStyle(color: Colors.yellow),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${e.value}",
                            style: const TextStyle(color: Colors.yellow),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            ...(_product.skillModels ?? [])
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        if (_product.grade! >= 5)
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                                child: Text(
                                  e.skillCategoryDisplay,
                                  style: const TextStyle(color: Colors.purple),
                                ),
                              ),
                              const SizedBox(width: 10),
                              if (e.referencedStatTypeDisplay == 'NONE') Text(
                                "${e.power?.toInt()}",
                                style: const TextStyle(color: Colors.purple),
                              ),
                              if (e.referencedStatTypeDisplay != 'NONE') Text(
                                "${e.statPowerRatio! / 100}%${e.referencedStatTypeDisplay}",
                                style: const TextStyle(color: Colors.purple),
                              ),
                            ],
                          ),
                        if (_product.grade! < 5)
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(
                                  e.elementalTypeDisplay,
                                  style: const TextStyle(color: Colors.purple),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "${(e.power ?? 0) > 0 ? e.power?.toInt() : e.skillCategoryDisplay}",
                                style: const TextStyle(color: Colors.purple),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
