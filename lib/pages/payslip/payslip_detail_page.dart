import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paris_coba/models/payslip_model.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/payslip/payslip_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';

class PayslipDetailPage extends StatefulWidget {
  final PayslipModel payslip;
  PayslipDetailPage(this.payslip);

  @override
  _PayslipDetailPageState createState() => _PayslipDetailPageState();
}

class _PayslipDetailPageState extends State<PayslipDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  String bulan = '';

  String convertMonth(month) {
    switch (month) {
      case 1:
        bulan = 'Januari';
        break;
      case 2:
        bulan = 'Februari';
        break;
      case 3:
        bulan = 'Maret';
        break;
      case 4:
        bulan = 'April';
        break;
      case 5:
        bulan = 'Mei';
        break;
      case 6:
        bulan = 'Juni';
        break;
      case 7:
        bulan = 'Juli';
        break;
      case 8:
        bulan = 'Agustus';
        break;
      case 9:
        bulan = 'September';
        break;
      case 10:
        bulan = 'Oktober';
        break;
      case 11:
        bulan = 'November';
        break;
      case 12:
        bulan = 'Desember';
        break;
    }
    return bulan;
  }

  Widget topBody() {
    return Container(
      height: 250,
      padding: EdgeInsets.only(left: 10, bottom: 80),
      width: MediaQuery.of(context).size.width,
      color: secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => PayslipPage()));
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 25,
                  color: textWhiteColor,
                )),
          ),
          // SizedBox(
          //   width: 117,
          // ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "E-Slip",
              style:
                  textWhiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBody() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Container(
      height: 800,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 120),
      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView(
        children: [
          Text(
            "E-Slip " +
                convertMonth(widget.payslip.bulanPenggajian) +
                ' ' +
                widget.payslip.tahunPenggajian.toString(),
            style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
          detailPribadiPayslip(),
          pendapatan()
        ],
      ),
    );
  }

  Widget pendapatan() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PENDAPATAN
          Text(
            "Pendapatan",
            style: primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gaji Pokok",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.gajiPokok),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Kelas",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangKelas),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Harian Dalam Kota",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangHarianDalamKota),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Harian Luar Kota",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangHarianLuarKota),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Kesehatan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangKesehatan),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tunjangan Bensin & Parkir",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat()
                      .format(widget.payslip.tunjanganBensinDanParkir),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tunjangan Safety & Health Assistance",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(
                      widget.payslip.tunjanganSafetyAndHealthAssistance),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tunjangan Transport",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.tunjanganTransport),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pulsa",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.pulsa),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Promosi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusPromosi),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Sell In",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusSellIn),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Sell Out",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusSellOut),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Konsinyasi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusKonsinyasi),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lembur",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.lembur),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hari Libur Masuk",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.hariLiburMasuk),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Produk Fokus",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusProdukFokus),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Kinerja",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusKinerja),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Lainnya",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusLainnya),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gaji Pokok Cuti Melahirkan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusLainnya),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kost",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.kost),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tambahan Gaji Lain",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.tambahanGajiLain),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rapel Gaji Bulan Lalu",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.rapelGajiBulanLalu),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transfer Kekurangan Gaji Bulan Lalu",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat()
                      .format(widget.payslip.transferKekuranganGajiBulanLalu),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pengembalian Potongan Selisih GUTL",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat()
                      .format(widget.payslip.pengembalianPotonganSelisihGutl),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pengembalian Potongan Selisih Konsi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat()
                      .format(widget.payslip.pengembalianPotonganSelisihKonsi),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Kebijakan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangKebijakan),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Benefit PBP 1.0",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.benefitPbp),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Akhir Tahun",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusAkhirTahun),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Kompensasi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangKompensasi),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bonus Program",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.bonusProgram),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tunjangan Hari Raya",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.tunjanganHariRaya),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pendapatan",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  NumberFormat().format(widget.payslip.totalPendapatan),
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          ),

          // POTONGAN
          Text(
            "Potongan",
            style: alertTextStyle.copyWith(fontSize: 12, fontWeight: bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Selisih Konsinyasi",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potSelisihKonsinyasi),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Selisih GUTL",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potSelisihGutl),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Sakit Tanpa SKD",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potSakitTanpaSkd),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Cuti Diluar Tanggungan",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potCutiDiluarTanggungan),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Piutang Pinjaman",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potPiutangPinjaman),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Piutang Faktur",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potPiutangFaktur),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Kelebihan Gaji Bulan Lalu",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat()
                      .format(widget.payslip.potKelebihanGajiBulanLalu),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Report",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potReport),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Lain Lain",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potLainLain),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. Terlambat",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potTerlambat),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. BPJS Kesehatan",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potBpjsKesehatan),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pot. BPJS Ketenagakerjaan",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.potBpjsKetenagakerjaan),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Potongan",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  NumberFormat().format(widget.payslip.totalPotongan),
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          ),

          // TAMBAHAN DILUAR GAJI
          Text(
            "Tambahan Diluar Gaji",
            style: primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Periksa Kehamilan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.periksaKehamilan),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Melahirkan Atau Keguguran",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.melahirkanAtauKeguguran),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kesehatan Atau Rawat Inap",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.kesehatanAtauRawatInap),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Santunan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.santunan),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Perumahan Atau Kost",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.perumahanAtauKost),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pernikahan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.pernikahan),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uang Apresiasi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
                Text(
                  NumberFormat().format(widget.payslip.uangApresiasi),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Tambahan Pendapatan",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  NumberFormat().format(widget.payslip.totalTambahanPendapatan),
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          ),

          Container(
            child: Divider(
              thickness: 1.5,
            ),
          ),

          // TOTAL GAJI YANG DITERIMA
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Gaji Diterima",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  NumberFormat().format(widget.payslip.takeHomePay),
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailPribadiPayslip() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Container(
        // width: 400,
        height: 77,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, top: 7, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nama",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
                Text(
                  user.namalengkap,
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "NIP",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
                Text(
                  user.nip,
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Posisi",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
                Text(
                  user.posisi,
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lokasi",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
                Text(
                  "DC " + user.lokasi,
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ],
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [topBody(), bottomBody()],
      ),
    );
  }
}
