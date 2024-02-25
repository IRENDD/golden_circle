import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateTimeSelectionController {
  // The current selected values
  DateTime selectedDate;
  TimeOfDay selectedStartTime;
  TimeOfDay selectedEndTime;

  // Callbacks for when the date and times change
  Function(DateTime) onDateChanged;
  Function(TimeOfDay) onStartTimeChanged;
  Function(TimeOfDay) onEndTimeChanged;

  DateTimeSelectionController({
    required this.selectedDate,
    required this.selectedStartTime,
    required this.selectedEndTime,
    required this.onDateChanged,
    required this.onStartTimeChanged,
    required this.onEndTimeChanged,
  });

  void showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            initialDateTime: selectedDate,
            onDateTimeChanged: (DateTime newDate) {
              selectedDate = newDate;
              onDateChanged(newDate);
            },
            mode: CupertinoDatePickerMode.date,
          ),
        );
      },
    );
  }

  void showStartTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedStartTime.hour,
              selectedStartTime.minute,
            ),
            onDateTimeChanged: (DateTime newDateTime) {
              selectedStartTime = TimeOfDay.fromDateTime(newDateTime);
              onStartTimeChanged(selectedStartTime);
            },
          ),
        );
      },
    );
  }

  void showEndTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedEndTime.hour,
              selectedEndTime.minute,
            ),
            onDateTimeChanged: (DateTime newDateTime) {
              selectedEndTime = TimeOfDay.fromDateTime(newDateTime);
              onEndTimeChanged(selectedEndTime);
            },
          ),
        );
      },
    );
  }

  String calculateDuration() {
    final startTimeInMinutes = selectedStartTime.hour * 60 + selectedStartTime.minute;
    final endTimeInMinutes = selectedEndTime.hour * 60 + selectedEndTime.minute;
    final durationInMinutes = endTimeInMinutes - startTimeInMinutes;

    if (durationInMinutes < 0) {
      // Handle case where end time is on the next day
      return "Invalid Time Range";
    } else {
      final hours = durationInMinutes ~/ 60;
      final minutes = durationInMinutes % 60;
      return 'Duration: ${hours}h ${minutes}m';
    }
  }
}
