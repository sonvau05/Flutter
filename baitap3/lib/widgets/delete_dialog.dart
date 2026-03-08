import 'package:flutter/material.dart';
import '../models/item_model.dart';

class DeleteDialog extends StatelessWidget {
  final Item item;
  final Function(Item) onConfirm;
  final VoidCallback onCancel;

  const DeleteDialog({
    Key? key,
    required this.item,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.warning_rounded, color: Colors.red.shade700, size: 28),
                const SizedBox(width: 8),
                const Text(
                  'DELETE CONFIRMATION',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 24, color: Colors.red),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  Icon(Icons.delete_forever, color: Colors.red.shade700, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Are you sure you want to delete this item?',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text('ID: ${item.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Name: ${item.name}'),
                        Text('Email: ${item.email}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('No, Cancel'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => onConfirm(item),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Yes, Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}