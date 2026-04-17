import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorDisplayWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 30,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
