library custom_date_picker_package;

import 'package:custom_date_picker_package/widget/custom_scrolleable_calendar_widget.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Color iconsColor;
  final String locale;
  final String calendarTitle;
  final void Function(DateTime date) onNewDate;
  const CustomDatePicker({
    super.key,
    required this.icon,
    required this.title,
    required this.iconsColor,
    required this.onNewDate,
    required this.locale,
    required this.calendarTitle,
    this.value,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 200),
      elevation: 0,
      dividerColor: Colors.transparent,
      expandedHeaderPadding: EdgeInsets.zero,
      children: [
        ExpansionPanel(
          backgroundColor: Colors.transparent,
          isExpanded: _isExpanded,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              dense: false,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              trailing: Icon(Icons.edit, size: 25, color: widget.iconsColor),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.iconsColor,
                    size: 25,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.value != null)
                          Text(
                            widget.value!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: CustomScrolleableCalendarWidget(
              firstDate: DateTime.now(),
              endDate: DateTime.now(),
              onChangesInDate: widget.onNewDate,
              locale: widget.locale,
              title: widget.calendarTitle,
            ),
          ),
        ),
      ],
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
    );
  }
}
