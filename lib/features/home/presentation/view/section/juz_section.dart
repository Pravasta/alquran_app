import 'package:alquran_api/features/home/presentation/widget/juz_widget.dart';
import 'package:flutter/material.dart';

class JuzSection extends StatelessWidget {
  const JuzSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const JuzWidget();
        },
      ),
    );
  }
}
