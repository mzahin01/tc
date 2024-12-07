import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DPDButton extends StatelessWidget {
  const DPDButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.searchController,
    required this.hintText,
    required this.searchHint,
  });
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final TextEditingController searchController;
  final String hintText;
  final String searchHint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          hintText,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 200,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: searchController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: searchController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: searchHint,
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return (item.value as String)
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            searchController.clear();
          }
        },
      ),
    );
  }
}
