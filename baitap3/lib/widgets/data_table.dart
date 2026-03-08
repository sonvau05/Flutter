import 'package:flutter/material.dart';
import '../models/item_model.dart';

class DataTableView extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onEdit;
  final Function(Item) onDelete;

  const DataTableView({
    Key? key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade200, width: 1),
            verticalInside: BorderSide(color: Colors.grey.shade200, width: 1),
            top: BorderSide(color: Colors.grey.shade300, width: 1),
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
            left: BorderSide(color: Colors.grey.shade300, width: 1),
            right: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          columnWidths: const {
            0: FixedColumnWidth(60),
            1: FlexColumnWidth(2),
            2: FixedColumnWidth(70),
            3: FlexColumnWidth(3),
            4: FixedColumnWidth(120),
          },
          children: [
            // Header
            TableRow(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              children: [
                _buildHeaderCell('ID'),
                _buildHeaderCell('Name'),
                _buildHeaderCell('Age'),
                _buildHeaderCell('Email'),
                _buildHeaderCell('Actions'),
              ],
            ),
            // Data rows
            ...items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return TableRow(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.white : Colors.grey.shade50,
                ),
                children: [
                  _buildDataCell(item.id, isId: true),
                  _buildDataCell(item.name),
                  _buildDataCell(item.age.toString()),
                  _buildDataCell(item.email, isEmail: true),
                  _buildActionCell(item),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {bool isId = false, bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isId ? FontWeight.w600 : FontWeight.normal,
          color: isEmail ? Colors.blue.shade700 : Colors.black87,
          decoration: isEmail ? TextDecoration.underline : TextDecoration.none,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _buildActionCell(Item item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(Icons.edit, size: 20, color: Colors.amber.shade800),
              onPressed: () => onEdit(item),
              tooltip: 'Edit',
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(Icons.delete, size: 20, color: Colors.red.shade700),
              onPressed: () => onDelete(item),
              tooltip: 'Delete',
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}