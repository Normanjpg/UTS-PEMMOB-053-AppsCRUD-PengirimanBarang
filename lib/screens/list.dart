import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts_crudapps_053/screens/create.dart';
import 'package:uts_crudapps_053/screens/edit.dart';
import 'package:uts_crudapps_053/screens/pelanggan.dart';
import 'package:uts_crudapps_053/screens/search.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  int currentPageIndex = 0;
  final List<Pelanggan> _listPelanggan = [
    Pelanggan(
      nopesanan: '001',
      pengirim: 'Norman Jayaperlaga',
      alkirim: 'Jl. Dharmawangsa 106',
      penerima: 'Unesa',
      alpenerima: 'Jl. Ketingtang',
      notelp: '081935625122',
      beratP: '5',
      jenisPengirim: 'Speed Express',
      asuransi: 'Ada',
      totalBiaya: '13200',
    )
  ];

  _showPopupMenu(BuildContext context, int index) async {
    final PelangganEdit = _listPelanggan[index];
    print('OPSI DELETE EDIT');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
              onPressed: () {
                SystemNavigator.pop();
                print('Keluar Aplikasi');
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              )),
          title: Text(
            'Data Pengiriman Barang',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            new IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchData(
                              listPelanggan: '',
                              title: '',
                            )));
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: ListView.separated(
            itemBuilder: ((context, index) {
              final item = _listPelanggan[index];
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No.Pesanan: (${item.nopesanan})',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Nama Pengirim: ${item.pengirim}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Alamat Pengirim: ${item.alkirim}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Nama Penerima: ${item.penerima}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Alamat Penerima: ${item.alpenerima}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'No Telp: ${item.notelp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Berat Paket: ${item.beratP} Kg',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Jenis Pengiriman: (${item.jenisPengirim}) || (${item.asuransi} Asuransi)',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Total Biaya = ${item.totalBiaya}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                final PelangganEdit = _listPelanggan[index];
                                final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditData(
                                        pelanggan: PelangganEdit,
                                      ),
                                    ));
                                if (result is Pelanggan) {
                                  setState(() {
                                    _listPelanggan[index] = result;
                                  });
                                }
                                ;
                                print('Edit Popup');
                              },
                              icon: Icon(Icons.edit),
                              label: Text('Edit')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                showAlertDialogHapus(BuildContext context) {
                                  Widget noButton = TextButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(false);
                                    },
                                    child: Text("TIDAK"),
                                  );
                                  Widget hapusButton = TextButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(true);
                                      setState(() {
                                        _listPelanggan.removeAt(index);
                                      });
                                    },
                                    child: Text("HAPUS DATA"),
                                  );
                                  AlertDialog alertHapus = AlertDialog(
                                    title: Text("PERHATIAN"),
                                    content: Text(
                                        "Data Pengiriman (${item.nopesanan}) Akan Dihapus"),
                                    actions: [
                                      noButton,
                                      hapusButton,
                                    ],
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alertHapus;
                                      });
                                }

                                showAlertDialogHapus(context);
                                print('Hapus Popup');
                              },
                              icon: Icon(Icons.delete),
                              label: Text('Hapus')),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: _listPelanggan.length),
        floatingActionButton: GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateData()),
            );
            print('Kita Masuk Menu Create');
            print(result);
            if (result is Pelanggan) {
              setState(() {
                _listPelanggan.add(result);
              });
            }
          },
          child: Icon(
            Icons.add_box,
            color: Colors.blue,
            size: 50,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
