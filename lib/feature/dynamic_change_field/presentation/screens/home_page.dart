import 'package:customfields/feature/dynamic_change_field/data/model/dynamic_change_model.dart';
import 'package:customfields/feature/dynamic_change_field/presentation/riverpod/statemanagement_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiResponse = ref.watch(apiCall);
    final selectedValue = ref.watch(selectedValueProvider);
    final List<DynamicChangeModel> showWidgetList = [];
    final List<DynamicChangeModel> conditionWidget = [];

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Form'), centerTitle: true),
      body: apiResponse.when(
        data: (widgets) {
          for (var showWidget in widgets) {
            if (showWidget.visible == null) {
              showWidgetList.add(showWidget);
            } else {
              if (showWidget.visible == selectedValue) {
                conditionWidget.add(showWidget);
              }
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ...showWidgetList.map((apiwidget) => buildWidget(
                      widgetType: apiwidget.widget,
                      fieldName: apiwidget.fieldName,
                      validValues: apiwidget.validValues,
                      selectedValue: selectedValue,
                      onChanged: (value) {
                        ref.read(selectedValueProvider.notifier).state = value;
                      },
                    )),
                ...conditionWidget.map((apiwidget) => buildWidget(
                      widgetType: apiwidget.widget,
                      fieldName: apiwidget.fieldName,
                      validValues: apiwidget.validValues,
                      selectedValue: selectedValue,
                      onChanged: (value) {},
                      controller: TextEditingController(),
                    ))
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

Widget buildWidget({
  required String widgetType,
  required String fieldName,
  List<String>? validValues,
  String? selectedValue,
  ValueChanged<String?>? onChanged,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.done,
}) {
  switch (widgetType) {
    case 'dropdown':
      if (validValues == null || validValues.isEmpty) {
        return const Text('Valid values are required for a dropdown widget.');
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: fieldName,
          ),
          value: selectedValue,
          items: validValues.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      );

    case 'textfield':
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            labelText: fieldName,
          ),
        ),
      );

    default:
      return const SizedBox.shrink();
  }
}
