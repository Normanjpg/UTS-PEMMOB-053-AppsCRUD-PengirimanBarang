import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts_crudapps_053/screens/pelanggan.dart';

class EditData extends StatefulWidget {
  const EditData({super.key, this.pelanggan});

  final Pelanggan? pelanggan;

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
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

  @override
  initState() {
    super.initState();
    _nopesananController.text = widget.pelanggan!.nopesanan;
    _pengirimController.text = widget.pelanggan!.pengirim;
    _alkirimController.text = widget.pelanggan!.alkirim;
    _penerimaController.text = widget.pelanggan!.penerima;
    _alpenerimaController.text = widget.pelanggan!.alpenerima;
    _notelpController.text = widget.pelanggan!.notelp;
    _beratPController.text = widget.pelanggan!.beratP;
    _valpengiriman = widget.pelanggan!.jenisPengirim;
    nilaiCheckBox = widget.pelanggan!.asuransi;
    _totalBiayaController.text = widget.pelanggan!.totalBiaya;
  }

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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Asuransi Belum dipilih';
                            }
                            return null;
                          },
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(false);
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
                                    showAlertDialogSaveEdit(
                                        BuildContext context) {
                                      Widget noButton = TextButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(false);
                                        },
                                        child: Text("TIDAK"),
                                      );
                                      Widget simpaneditButton = TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context, getdatapelanggan());
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(true);
                                        },
                                        child: Text("EDIT DATA"),
                                      );
                                      AlertDialog alertEdit = AlertDialog(
                                        title: Text("PERHATIAN"),
                                        content:
                                            Text("Data Pengiriman Akan Diedit"),
                                        actions: [
                                          noButton,
                                          simpaneditButton,
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertEdit;
                                          });
                                    }

                                    showAlertDialogSaveEdit(context);
                                    print("Simpan Edit");
                                  }
                                }),
                                icon: Icon(Icons.save),
                                label: Text('EDIT')),
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
