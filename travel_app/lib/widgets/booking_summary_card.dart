import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';

class BookingSummaryCard extends StatelessWidget {
  final Destination destination;
  final int numberOfGuests;
  final DateTime selectedDate;
  final String selectedTime;

  const BookingSummaryCard({
    super.key,
    required this.destination,
    required this.numberOfGuests,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total price in RWF
    double subtotal = destination.price * numberOfGuests;
    double tax = subtotal * 0.18; // 18% VAT
    double total = subtotal + tax;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green.shade50, Colors.white],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.receipt_long,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Booking Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Destination info
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      destination.location,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Booking details
          _buildSummaryRow(
            Icons.people,
            'Guests',
            '$numberOfGuests ${numberOfGuests == 1 ? 'person' : 'people'}',
          ),
          const SizedBox(height: 12),
          _buildSummaryRow(
            Icons.calendar_today,
            'Date',
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          ),
          const SizedBox(height: 12),
          _buildSummaryRow(Icons.access_time, 'Time', selectedTime),

          const Divider(height: 24),

          // Price breakdown in RWF (UPDATED)
          _buildPriceRow(
            'Price per person',
            '${destination.price.toStringAsFixed(0)} RWF',
          ),
          const SizedBox(height: 8),
          _buildPriceRow(
            'Subtotal ($numberOfGuests guests)',
            '${subtotal.toStringAsFixed(0)} RWF',
          ),
          const SizedBox(height: 8),
          _buildPriceRow('Tax (18% VAT)', '${tax.toStringAsFixed(0)} RWF'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _buildPriceRow(
            'Total',
            '${total.toStringAsFixed(0)} RWF',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  // Helper method for summary rows
  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.green.shade700),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }

  // Helper method for price rows (UPDATED for RWF)
  Widget _buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.black : Colors.grey.shade600,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        const Spacer(),
        Text(
          amount,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            fontSize: isTotal ? 18 : 14,
            color: isTotal ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
