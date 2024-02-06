import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/product.dart';

class ProductCell extends StatefulWidget {
  final Product product;

  const ProductCell({required this.product, super.key});

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
          Text(
            "€${widget.product.pricePerUnit}/st",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}