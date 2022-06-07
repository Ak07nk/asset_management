import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

class AssestFormInsert extends StatefulWidget {
  const AssestFormInsert({Key? key}) : super(key: key);

  @override
  State<AssestFormInsert> createState() => _AssestFormInsertState();
}

class _AssestFormInsertState extends State<AssestFormInsert> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Form(
        // key: form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: appColorG.withOpacity(0.6),
                leading: Icon(
                  Icons.star,
                  size: 25,
                  color: appColorB,
                ),
                elevation: 0,
                title: Text(
                  'hello',
                  style: tts4B,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: appColorB,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {},
                decoration: InputDecoration(
                  hintText: 'Asset Name',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset desc',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset cat',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset Qty',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset condition',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset remark',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Created By',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                decoration: InputDecoration(
                  hintText: 'Asset ward',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                color: appColorG,
              ),
            )
          ],
        ),
      ),
    );
  }
}
