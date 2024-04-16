import "package:flutter/material.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/widgets/widgets.dart";

const double kMorseInputFieldUnitSpacing = 4.0;

class MorseInputField extends StatefulWidget {
  const MorseInputField({
    super.key,
    this.controller,
    this.hint,
    this.units,
    this.maxLines,
    this.scrollDirection = Axis.vertical,
  });

  final MorseEditingController? controller;
  final bool? hint;
  final List<MorseUnit>? units;
  final int? maxLines;
  final Axis scrollDirection;

  @override
  State<MorseInputField> createState() => _MorseInputFieldState();
}

class _MorseInputFieldState extends State<MorseInputField> {
  late MorseEditingValue? value = widget.controller?.value;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onInputChange);
  }

  void _onInputChange() {
    controller.animateTo(
      controller.position.maxScrollExtent * 2,
      curve: Curves.linear,
      duration: const Duration(microseconds: 1),
    );
    setState(() {
      value = widget.controller?.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        controller: controller,
        child: Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          spacing: kMorseInputFieldUnitSpacing,
          runSpacing: kMorseInputFieldUnitSpacing,
          children: (value?.units ?? widget.units)
                  ?.map(
                    (unit) => unit == MorseUnit.dot
                        ? MorseDotUnit(
                            hint: widget.hint,
                          )
                        : MorseDashUnit(
                            hint: widget.hint,
                          ),
                  )
                  .toList() ??
              [],
        ),
      ),
    );

    if (widget.maxLines != null || widget.scrollDirection != Axis.horizontal) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: kUnitHeight + kMorseInputFieldUnitSpacing,
          maxHeight: widget.maxLines != null
              ? (kUnitHeight + kMorseInputFieldUnitSpacing) * widget.maxLines!
              : double.infinity,
        ),
        child: Scrollbar(
          child: child,
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: kUnitHeight + kMorseInputFieldUnitSpacing,
      ),
      child: child,
    );
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onInputChange);

    super.dispose();
  }
}
