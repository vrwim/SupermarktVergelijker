import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCell extends StatefulWidget {
  final Product product;
  final Product leastExpensive;

  const ProductCell(
      {super.key, required this.product, required this.leastExpensive});

  @override
  State<ProductCell> createState() => _ProductCellState();
}

class _ProductCellState extends State<ProductCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.product.brand} (${widget.product.store})",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "€${widget.product.fullPrice} per ${widget.product.size}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            if (widget.product != widget.leastExpensive)
              Text(
                "${(((widget.product.pricePerUnit - widget.leastExpensive.pricePerUnit) / widget.leastExpensive.pricePerUnit) * 100).toStringAsFixed(0)}% duurder",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            Text(
              "€${widget.product.pricePerUnit.toStringAsFixed(2)}/st",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
