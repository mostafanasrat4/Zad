import 'package:flutter/material.dart';

class FundraisingEventWidget extends StatelessWidget {
  final String title;
  final String description;
  final double goalAmount;
  final double raisedAmount;
  final Duration timeRemaining;
  final String beneficiaryName;
  final List<String> tags;
  final VoidCallback onDonatePressed;
  final VoidCallback onSharePressed;
  final VoidCallback onViewDetailsPressed;

  const FundraisingEventWidget({
    required this.title,
    required this.description,
    required this.goalAmount,
    required this.raisedAmount,
    required this.timeRemaining,
    required this.beneficiaryName,
    required this.tags,
    required this.onDonatePressed,
    required this.onSharePressed,
    required this.onViewDetailsPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (raisedAmount / goalAmount).clamp(0.0, 1.0);

    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Title
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            const SizedBox(height: 8),

            // Description
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 8),

            // Goal and Progress
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(value: progress),
                ),
                const SizedBox(width: 8),
                Text('${(progress * 100).toStringAsFixed(0)}%'),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Raised: \$${raisedAmount.toStringAsFixed(2)} / Goal: \$${goalAmount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 8),

            // Time Remaining and Beneficiary Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Left: ${timeRemaining.inDays} days',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Beneficiary: $beneficiaryName',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Tags/Labels
            Wrap(
              spacing: 6.0,
              children: tags
                  .map((tag) => Chip(
                label: Text(tag),
                backgroundColor: Colors.grey[200],
              ))
                  .toList(),
            ),

            const SizedBox(height: 8),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onDonatePressed,
                  child: const Text('Donate'),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onSharePressed,
                      icon: const Icon(Icons.share),
                    ),
                    TextButton(
                      onPressed: onViewDetailsPressed,
                      child: const Text('View Details'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
