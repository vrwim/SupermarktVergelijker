import 'package:flutter/material.dart';

class GenericDropdownButton extends DropdownButton<String> {
  GenericDropdownButton(
      {super.key,
      required String hint,
      required String? selectedItem,
      required List<String>? items,
      required super.onChanged})
      : super(
          hint: Text(selectedItem ?? hint),
          items: [
                DropdownMenuItem<String>(
                  value: null,
                  child: Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ] +
              (items?.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList() ??
                  []),
        );
}
