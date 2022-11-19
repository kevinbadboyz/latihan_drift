import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:latihan_drift/local/database/app_db.dart';
import 'package:drift/drift.dart' as drift;

class JobTitleCreateUpdate extends StatefulWidget {
  const JobTitleCreateUpdate({Key? key}) : super(key: key);

  @override
  State<JobTitleCreateUpdate> createState() => _JobTitleCreateUpdateState();
}

class _JobTitleCreateUpdateState extends State<JobTitleCreateUpdate> {
  TextEditingController tecCode = TextEditingController();
  TextEditingController tecName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> items = ['Active', 'Non-Active'];
  String? selectedValue;
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobTitle Create'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Kode', hintText: 'Masukkan kode jabatan'),
                controller: tecCode,
                validator: (value) => value == null || value.isEmpty
                    ? 'Masukkan kode jabatan'
                    : null,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nama Jabatan',
                    hintText: 'Masukkan nama jabatan'),
                controller: tecName,
                validator: (value) => value == null || value.isEmpty
                    ? 'Masukkan nama jabatan'
                    : null,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownSearch<String>(
                // dropdownBuilder: (context, selectedItem) => Text(selectedItem ?? 'Belum memilih'),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                  labelText: 'Status',
                )),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Pilih status' : null,
                items: items,
                onChanged: (value) {
                  selectedValue = value as String;
                  return value == 'Active'
                      ? print('Active')
                      : print('Non-Active');
                },
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('Kode Jabatan : ${tecCode.text.toString()}');
                          print('Nama Jabatan : ${tecName.text.toString()}');
                          print('Status Jabatan : ${selectedValue}');
                          final entity = JobTitleCompanion(
                              code: drift.Value(tecCode.text),
                              name: drift.Value(tecName.text),
                              status: drift.Value(selectedValue.toString()));
                          // _db.insertJobTitle(entity).then((value) =>
                          //     ScaffoldMessenger.of(context).showMaterialBanner(
                          //         MaterialBanner(
                          //             backgroundColor: Colors.pink,
                          //             content: Text(
                          //                 '${tecName.text.toString()} berhasil disimpan..'),
                          //             actions: [
                          //           TextButton(
                          //               onPressed: () {
                          //                 ScaffoldMessenger.of(context)
                          //                     .hideCurrentMaterialBanner();
                          //               },
                          //               child: Text('Tutup'))
                          //         ])));
                          _db.insertJobTitle(entity).then((value) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Data berhasil disimpan'))));
                          tecCode.text = '';
                          tecName.text = '';
                          
                        }
                      },
                      child: const Text('Simpan')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Batal')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
