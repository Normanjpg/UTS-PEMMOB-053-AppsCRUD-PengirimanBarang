import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts_crudapps_053/screens/pelanggan.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  int currentPageIndex = 1;
  final _formKey = GlobalKey<FormState>();
  String nilaiCheckBox = '';
  String _valpengiriman = '';
  TextEditingController _nopesananController = TextEditingController();
  TextEditingController _pengirimController = TextEditingController();
  TextEditingController _alkirimController = TextEditingController();
  TextEditingController _penerimaController = TextEditingController();
  TextEditingController _alpenerimaController = TextEditingController();
  TextEditingController _notelpController = TextEditingController();
  TextEditingController _beratPController = TextEditingController();
  TextEditingController _totalBiayaController = TextEditingController();

  getdatapelanggan() {
    return Pelanggan(
      nopesanan: _nopesananController.text,
      pengirim: _pengirimController.text,
      alkirim: _alkirimController.text,
      penerima: _penerimaController.text,
      alpenerima: _alpenerimaController.text,
      notelp: _notelpController.text,
      beratP: _beratPController.text,
      jenisPengirim: _valpengiriman,
      asuransi: nilaiCheckBox,
      totalBiaya: _totalBiayaController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Pengiriman Barang',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          leading: new IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _nopesananController,
                            decoration: new InputDecoration(
                              hintText: "contoh:007",
                              labelText: "No Pesanan",
                              icon: Icon(Icons.pin),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _pengirimController,
                            decoration: new InputDecoration(
                              hintText: "contoh: Joko Widodo",
                              labelText: "Nama Pengirim",
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _alkirimController,
                            decoration: new InputDecoration(
                              hintText:
                                  "contoh: Jl. Simo Pomahan V/20, Surabaya",
                              labelText: "Alamat Pengirim",
                              icon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _penerimaController,
                            decoration: new InputDecoration(
                              hintText: "contoh: Joko Widodo",
                              labelText: "Nama Pengirim",
                              icon: Icon(Icons.people),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _alpenerimaController,
                            decoration: new InputDecoration(
                              hintText:
                                  "contoh: Jl. Simo Pomahan V/20, Surabaya",
                              labelText: "Alamat Pengirim",
                              icon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _notelpController,
                            decoration: new InputDecoration(
                              hintText: "contoh:081546252xxx",
                              labelText: "No Telp",
                              icon: Icon(Icons.contact_phone),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _beratPController,
                            decoration: new InputDecoration(
                              hintText: "contoh: 10(dalam Kg)",
                              labelText: "Berat Paket",
                              icon: Icon(Icons.pin),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        DropdownButtonFormField(
                          hint: Text('Jenis Pengiriman'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              child: Text('Ekonomi'),
                              value: 'Ekonomi',
                            ),
                            DropdownMenuItem(
                              child: Text('Jumbo Ekonomi'),
                              value: 'Jumbo Ekonomi',
                            ),
                            DropdownMenuItem(
                              child: Text('Speed Express'),
                              value: 'Speed Express',
                            ),
                          ],
                          onChanged: ((value) {
                            setState(() {
                              _valpengiriman = value!;
                            });
                          }),
                        ),
                        DropdownButtonFormField(
                          hint: Text('Asuransi'),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              child: Text('Ada'),
                              value: 'Ada',
                            ),
                            DropdownMenuItem(
                              child: Text('Tidak Ada'),
                              value: 'Tidak Ada',
                            ),
                          ],
                          onChanged: ((value) {
                            setState(() {
                              nilaiCheckBox = value!;
                            });
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _totalBiayaController,
                            decoration: new InputDecoration(
                              hintText: "contoh: 15200 (dalam Rp)",
                              labelText: "Total Biaya",
                              icon: Icon(Icons.money),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                            ElevatedButton.icon(
                                onPressed: (() {
                                  if (_nopesananController.text.isEmpty ||
                                      _pengirimController.text.isEmpty ||
                                      _alkirimController.text.isEmpty ||
                                      _penerimaController.text.isEmpty ||
                                      _alpenerimaController.text.isEmpty ||
                                      _beratPController.text.isEmpty ||
                                      _valpengiriman.isEmpty ||
                                      nilaiCheckBox.isEmpty ||
                                      _totalBiayaController.text.isEmpty) {
                                    showAlertDialogKosong(
                                        BuildContext context) {
                                      Widget okosongButton = TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      );
                                      AlertDialog alertKosong = AlertDialog(
                                        title: Text("PERHATIAN"),
                                        content: Text("Ada Data Yang Kosong"),
                                        actions: [
                                          okosongButton,
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertKosong;
                                          });
                                    }

                                    print("ALert kosong");
                                    showAlertDialogKosong(context);
                                  } else {
                                    showAlertDialogSave(BuildContext context) {
                                      Widget simpanButton = TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(
                                              context, getdatapelanggan());
                                        },
                                        child: Text("OK"),
                                      );
                                      AlertDialog alertSimpan = AlertDialog(
                                        title: Text("PERHATIAN"),
                                        content: Text("Data Akan Disimpan"),
                                        actions: [
                                          simpanButton,
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertSimpan;
                                          });
                                    }

                                    showAlertDialogSave(context);
                                    print('POP up alert simpan');
                                  }
                                }),
                                icon: Icon(Icons.save),
                                label: Text('SIMPAN')),
                          ],
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
