import 'package:sapaid/constants/app_libraries.dart';

class CommonDropDownField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? hinttext;
  final Color? fillcolor;
  final Color? bordercolor;
  final List values;
  // ignore: prefer_typing_uninitialized_variables
  final checkedvalue;
  final String listMapName;
  final String listMapId;
  final screenController;
  final flex;
  final readOnly;
  final doCallback;

  const CommonDropDownField({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.values,
    this.bordercolor,
    this.fillcolor,
    this.hinttext,
    this.checkedvalue,
    this.listMapName = 'name',
    this.listMapId = 'id',
    @required this.screenController,
    this.flex = 1,
    this.readOnly = false,
    this.doCallback,
  }) : super(key: key);

  @override
  Widget build(context) {
    TextEditingController terminalName = TextEditingController();
    if (readOnly) {
      for (var list in values) {
        if (checkedvalue.text == list[listMapId]) {
          terminalName.text = list[listMapName];
        }
      }
    }
    return readOnly == false
        ? Container(
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: InputDecorator(
              baseStyle: const TextStyle(fontSize: 10),
              decoration: InputDecoration(
                hintText: placeholder,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                focusColor: Colors.black,
                hoverColor: Colors.black,

                filled: true,
                fillColor: fillcolor ?? Colors.transparent,
                hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: bordercolor ?? Colors.transparent, width: 1.0),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(width: 1.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                      color: bordercolor ?? Colors.transparent, width: 3.0),
                ),
                labelStyle:
                    const TextStyle(color: Color(0xff2B2B2B), fontSize: 12.0),
                // fillColor: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 25.0,
                    color: AppColors.textColor,
                  ),
                  style:
                      const TextStyle(fontSize: 16, color: AppColors.textColor),
                  value: values.isNotEmpty &&
                          checkedvalue.text.isNotEmpty &&
                          values
                              .map((e) => e[listMapId].toString())
                              .contains(checkedvalue.text)
                      ? checkedvalue.text
                      : values.isNotEmpty
                          ? values[0][listMapId].toString()
                          : null,
                  isDense: true,
                  isExpanded: true,
                  items: values.isEmpty
                      ? [
                          const DropdownMenuItem(
                              value: null, child: Text("No Data"))
                        ]
                      : values.map((list) {
                          return DropdownMenuItem(
                            value: list[listMapId].toString(),
                            child: list[listMapName] != ''
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [Text('${list[listMapName]}')],
                                  )
                                : const Text('notfound'),
                          );
                        }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      Get.log('Drowdown value Selected: $value');
                    }
                    controller.text = value.toString();
                    if (screenController != null) {
                      screenController.update();
                    }
                    doCallback != null ? doCallback() : Get.log('no callback');
                  },
                ),
              ),
            ),
          )
        : CommonTextField(
            controller: terminalName,
            readOnly: false,
            hintText: placeholder,
          );
  }
}
