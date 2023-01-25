import 'package:flutter/material.dart';

class CustomDateContainer extends StatefulWidget {
  final List<int> data;
  final void Function(int itemPressed, int index) onPressElement;
  final Widget Function(int currentElement, bool isSelected, int index) builder;
  final int initialElementIndex;
  const CustomDateContainer({
    super.key,
    required this.data,
    required this.initialElementIndex,
    required this.onPressElement,
    required this.builder,
  });

  @override
  State<CustomDateContainer> createState() => _CustomDateContainerState();
}

class _CustomDateContainerState extends State<CustomDateContainer> {
  late int _currentSelected;

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.initialElementIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(
            widget.data.length,
            (index) {
              final bool isSelected = _currentSelected == index;

              if (isSelected) {}
              return GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    setState(() {
                      _currentSelected = index;
                      widget.onPressElement(widget.data[index], index);
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.data.length ? 20 : 0,
                  ),
                  child: widget.builder(widget.data[index], isSelected, index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
