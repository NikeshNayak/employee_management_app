import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// Display CalendarDatePicker with action buttons
class CalendarDatePicker2WithActionButtons extends StatefulWidget {
  CalendarDatePicker2WithActionButtons({
    required this.value,
    required this.config,
    this.onValueChanged,
    this.onDisplayedMonthChanged,
    this.onCancelTapped,
    this.onOkTapped,
    Key? key,
  }) : super(key: key) {
    if (config.calendarViewMode == CalendarDatePicker2Mode.scroll) {
      assert(
        config.scrollViewConstraints?.maxHeight != null,
        'scrollViewConstraint with maxHeight must be provided when used withCalendarDatePicker2WithActionButtons under scroll mode',
      );
    }
  }

  /// The selected [DateTime]s that the picker should display.
  final List<DateTime?> value;

  /// Called when the user taps 'OK' button
  final ValueChanged<List<DateTime?>>? onValueChanged;

  /// Called when the user navigates to a new month/year in the picker under non-scroll mode
  final ValueChanged<DateTime>? onDisplayedMonthChanged;

  /// The calendar configurations including action buttons
  final CalendarDatePicker2WithActionButtonsConfig config;

  /// The callback when cancel button is tapped
  final Function? onCancelTapped;

  /// The callback when ok button is tapped
  final Function? onOkTapped;

  @override
  State<CalendarDatePicker2WithActionButtons> createState() => _CalendarDatePicker2WithActionButtonsState();
}

class _CalendarDatePicker2WithActionButtonsState extends State<CalendarDatePicker2WithActionButtons> {
  List<DateTime?> _values = [];
  List<DateTime?> _editCache = [];

  @override
  void initState() {
    _values = widget.value;
    _editCache = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarDatePicker2WithActionButtons oldWidget) {
    var isValueSame = oldWidget.value.length == widget.value.length;

    if (isValueSame) {
      for (var i = 0; i < oldWidget.value.length; i++) {
        var isSame = (oldWidget.value[i] == null && widget.value[i] == null) ||
            DateUtils.isSameDay(oldWidget.value[i], widget.value[i]);
        if (!isSame) {
          isValueSame = false;
          break;
        }
      }
    }

    if (!isValueSame) {
      _values = widget.value;
      _editCache = widget.value;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final nextDay = DateTime.now().add(const Duration(days: 1));
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return SizedBox(
      height: 492,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          if (widget.config.isStartRange ?? false)
            Column(
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _editCache = [DateTime.now()];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: _editCache.isNotEmpty &&
                                    (_editCache[0]?.day == DateTime.now().day &&
                                        _editCache[0]?.month == DateTime.now().month &&
                                        _editCache[0]?.year == DateTime.now().year)
                                ? widget.config.selectedDayHighlightColor
                                : widget.config.lightBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: _editCache.isNotEmpty &&
                                      (_editCache[0]?.day == DateTime.now().day &&
                                          _editCache[0]?.month == DateTime.now().month &&
                                          _editCache[0]?.year == DateTime.now().year)
                                  ? Colors.white
                                  : widget.config.selectedDayHighlightColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final date = DateTime.now().add(const Duration(days: 1));
                            setState(() {
                              _editCache = [date];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: _editCache.isNotEmpty &&
                                    (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 1))).day &&
                                        _editCache[0]?.month == (DateTime.now().add(const Duration(days: 1))).month &&
                                        _editCache[0]?.year == (DateTime.now().add(const Duration(days: 1))).year)
                                ? widget.config.selectedDayHighlightColor
                                : widget.config.lightBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Next ${_weekDayName((DateTime.now().add(const Duration(days: 1))).weekday)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: _editCache.isNotEmpty &&
                                      (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 1))).day &&
                                          _editCache[0]?.month == (DateTime.now().add(const Duration(days: 1))).month &&
                                          _editCache[0]?.year == (DateTime.now().add(const Duration(days: 1))).year)
                                  ? Colors.white
                                  : widget.config.selectedDayHighlightColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 36,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final date = DateTime.now().add(const Duration(days: 2));
                            setState(() {
                              _editCache = [date];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: _editCache.isNotEmpty &&
                                    (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 2))).day &&
                                        _editCache[0]?.month == (DateTime.now().add(const Duration(days: 2))).month &&
                                        _editCache[0]?.year == (DateTime.now().add(const Duration(days: 2))).year)
                                ? widget.config.selectedDayHighlightColor
                                : widget.config.lightBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Next ${_weekDayName((DateTime.now().add(const Duration(days: 2))).weekday)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: _editCache.isNotEmpty &&
                                      (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 2))).day &&
                                          _editCache[0]?.month == (DateTime.now().add(const Duration(days: 2))).month &&
                                          _editCache[0]?.year == (DateTime.now().add(const Duration(days: 2))).year)
                                  ? Colors.white
                                  : widget.config.selectedDayHighlightColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final date = DateTime.now().add(const Duration(days: 7));
                              _editCache = [date];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: _editCache.isNotEmpty &&
                                    (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 7))).day &&
                                        _editCache[0]?.month == (DateTime.now().add(const Duration(days: 7))).month &&
                                        _editCache[0]?.year == (DateTime.now().add(const Duration(days: 7))).year)
                                ? widget.config.selectedDayHighlightColor
                                : widget.config.lightBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'After 1 week',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: _editCache.isNotEmpty &&
                                      (_editCache[0]?.day == (DateTime.now().add(const Duration(days: 7))).day &&
                                          _editCache[0]?.month == (DateTime.now().add(const Duration(days: 7))).month &&
                                          _editCache[0]?.year == (DateTime.now().add(const Duration(days: 7))).year)
                                  ? Colors.white
                                  : widget.config.selectedDayHighlightColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Container(
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _editCache = [];
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            _editCache.isEmpty ? widget.config.selectedDayHighlightColor : widget.config.lightBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'No Date',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: _editCache.isEmpty ? Colors.white : widget.config.selectedDayHighlightColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (DateTime.now().isBefore(widget.config.firstDate)) {
                          setState(() {
                            _editCache = [];
                          });
                          return;
                        }
                        setState(() {
                          _editCache = [DateTime.now()];
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: _editCache.isNotEmpty &&
                                (_editCache[0]?.day == DateTime.now().day &&
                                    _editCache[0]?.month == DateTime.now().month &&
                                    _editCache[0]?.year == DateTime.now().year)
                            ? widget.config.selectedDayHighlightColor
                            : widget.config.lightBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: _editCache.isNotEmpty &&
                                  (_editCache[0]?.day == DateTime.now().day &&
                                      _editCache[0]?.month == DateTime.now().month &&
                                      _editCache[0]?.year == DateTime.now().year)
                              ? Colors.white
                              : widget.config.selectedDayHighlightColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 15),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              child: CalendarDatePicker2(
                value: [..._editCache],
                config: widget.config,
                onValueChanged: (values) {
                  setState(() {
                    _editCache = values;
                  });
                },
                onDisplayedMonthChanged: widget.onDisplayedMonthChanged,
              ),
            ),
          ),
          SizedBox(height: widget.config.gapBetweenCalendarAndButtons ?? 10),
          const Divider(
            color: Color(0xFFF2F2F2),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 15),
                  if (widget.config.selectedDateCustomWidget != null) widget.config.selectedDateCustomWidget!,
                  SizedBox(width: 10),
                  (_editCache.isNotEmpty)
                      ? Text(
                          DateFormat('d MMM yyyy').format(_editCache[0]!),
                          style: widget.config.customSelectedDateTextStyle,
                        )
                      : Text(
                          'No Date',
                          style: widget.config.customSelectedDateTextStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  _buildCancelButton(Theme.of(context).colorScheme, localizations),
                  if ((widget.config.gapBetweenCalendarAndButtons ?? 0) > 0)
                    SizedBox(width: widget.config.gapBetweenCalendarAndButtons),
                  _buildOkButton(Theme.of(context).colorScheme, localizations),
                  SizedBox(width: widget.config.gapBetweenCalendarAndButtons),
                ],
              )
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildCancelButton(ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: () => setState(() {
        _editCache = _values;
        widget.onCancelTapped?.call();
        if ((widget.config.openedFromDialog ?? false) && (widget.config.closeDialogOnCancelTapped ?? true)) {
          Navigator.pop(context);
        }
      }),
      child: Container(
        padding: widget.config.buttonPadding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: widget.config.cancelButton ??
            Text(
              localizations.cancelButtonLabel.toUpperCase(),
              style: widget.config.cancelButtonTextStyle ??
                  TextStyle(
                    color: widget.config.selectedDayHighlightColor ?? colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
            ),
      ),
    );
  }

  Widget _buildOkButton(ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: () => setState(() {
        _values = _editCache;
        widget.onValueChanged?.call(_values);
        widget.onOkTapped?.call();
        if ((widget.config.openedFromDialog ?? false) && (widget.config.closeDialogOnOkTapped ?? true)) {
          Navigator.pop(context, _values);
        }
      }),
      child: Container(
        padding: widget.config.buttonPadding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: widget.config.okButton ??
            Text(
              localizations.okButtonLabel.toUpperCase(),
              style: widget.config.okButtonTextStyle ??
                  TextStyle(
                    color: widget.config.selectedDayHighlightColor ?? colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
            ),
      ),
    );
  }

  String _weekDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
    }
    return '';
  }
}
