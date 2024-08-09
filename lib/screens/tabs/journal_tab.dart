import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/text_widget.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Title here',
                fontSize: 16,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Description here',
                fontSize: 12,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
            ],
          ),
          trailing: TextWidget(
            text: 'Date and Time',
            fontSize: 12,
            fontFamily: 'Regular',
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
