import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_date_container_widget.dart';

class CustomScrolleableCalendarWidget extends StatelessWidget {
  final DateTime firstDate;
  final DateTime endDate;
  final String locale;
  final String title;
  final void Function(DateTime date) onChangesInDate;

  const CustomScrolleableCalendarWidget({
    super.key,
    required this.firstDate,
    required this.endDate,
    required this.onChangesInDate,
    required this.title,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    int selectedMonth = firstDate.month;
    int selectedDay = firstDate.day;

    final now = DateTime(DateTime.now().year, selectedMonth);
    final daysInMonth =
        DateTime(now.year, now.month + 1).toUtc().difference(now).inDays;

    final daysToShow = List.generate(daysInMonth, (d) => d + 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomDateContainer(
          data: List.generate(12, (index) => index + 1),
          initialElementIndex: 0,
          onPressElement: (itemPressed, index) {
            selectedMonth = itemPressed;
            onChangesInDate(
              DateTime(firstDate.year, itemPressed, selectedDay),
            );
          },
          builder: (currentElement, isSelected, index) {
            final month = DateFormat('MMMM', 'es').format(
              DateTime(
                DateTime.now().year,
                currentElement,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  month[0].toUpperCase() + month.substring(1),
                  style: isSelected
                      ? const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )
                      : const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 5,
                  width: 20,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : null,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                )
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        CustomDateContainer(
          data: daysToShow,
          initialElementIndex: 0,
          onPressElement: (itemPressed, index) {
            selectedDay = itemPressed;
            onChangesInDate(
              DateTime(firstDate.year, selectedMonth, itemPressed),
            );
          },
          builder: (currentElement, isSelected, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 65,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : null,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          daysToShow[index].toString().length == 1
                              ? '0${daysToShow[index]}'
                              : daysToShow[index].toString(),
                          style: TextStyle(
                            fontSize: isSelected ? 16 : 14,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat("EEEE", 'es')
                              .format(
                                DateTime(
                                  DateTime.now().year,
                                  selectedMonth,
                                  currentElement,
                                ),
                              )
                              .substring(0, 3)
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 5,
                  width: 10,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : null,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
