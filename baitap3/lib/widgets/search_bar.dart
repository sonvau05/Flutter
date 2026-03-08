import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String currentSortBy;
  final Function(String) onSortChanged;
  final String currentOrder;
  final Function(String) onOrderChanged;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.currentSortBy,
    required this.onSortChanged,
    required this.currentOrder,
    required this.onOrderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search row
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey.shade600, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: 'Search by name, email or ID...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      suffixIcon: controller.text.isNotEmpty
                          ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey.shade600),
                        onPressed: () {
                          controller.clear();
                          onChanged('');
                        },
                      )
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Sort and filter row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.sort, color: Colors.blue.shade700, size: 20),
                    const SizedBox(width: 8),
                    const Text('Sort by:', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: DropdownButton<String>(
                        value: currentSortBy,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(color: Colors.blue.shade700),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            onSortChanged(newValue);
                          }
                        },
                        items: <String>['ID', 'Name', 'Age', 'Email']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.swap_vert, color: Colors.blue.shade700, size: 20),
                    const SizedBox(width: 8),
                    const Text('Order:', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: DropdownButton<String>(
                        value: currentOrder,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(color: Colors.blue.shade700),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            onOrderChanged(newValue);
                          }
                        },
                        items: <String>['ASC', 'DESC']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}