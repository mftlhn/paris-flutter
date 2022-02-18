class PayslipModel {
  int id, bulanPenggajian, tahunPenggajian;
  String nip, type;
  double gajiPokok,
      uangKelas,
      uangHarianDalamKota,
      uangHarianLuarKota,
      uangKesehatan,
      tunjanganBensinDanParkir,
      tunjanganSafetyAndHealthAssistance,
      tunjanganTransport,
      pulsa,
      bonusPromosi,
      bonusSellIn,
      bonusSellOut,
      bonusKonsinyasi,
      lembur,
      hariLiburMasuk,
      bonusProdukFokus,
      bonusKinerja,
      bonusLainnya,
      gajiPokokCutiMelahirkan,
      kost,
      tambahanGajiLain,
      rapelGajiBulanLalu,
      transferKekuranganGajiBulanLalu,
      pengembalianPotonganSelisihGutl,
      pengembalianPotonganSelisihKonsi,
      uangKebijakan,
      benefitPbp,
      bonusAkhirTahun,
      uangKompensasi,
      bonusProgram,
      tunjanganHariRaya,
      potSelisihKonsinyasi,
      potSelisihGutl,
      potSakitTanpaSkd,
      potCutiDiluarTanggungan,
      potPiutangPinjaman,
      potPiutangFaktur,
      potKelebihanGajiBulanLalu,
      potReport,
      potLainLain,
      potTerlambat,
      potBpjsKesehatan,
      potBpjsKetenagakerjaan,
      periksaKehamilan,
      melahirkanAtauKeguguran,
      kesehatanAtauRawatInap,
      santunan,
      perumahanAtauKost,
      pernikahan,
      uangApresiasi,
      totalPendapatan,
      totalPotongan,
      totalTambahanPendapatan,
      takeHomePay;

  PayslipModel(
      {this.id,
      this.nip,
      this.bulanPenggajian,
      this.tahunPenggajian,
      this.type,
      this.gajiPokok,
      this.uangKelas,
      this.uangHarianDalamKota,
      this.uangHarianLuarKota,
      this.uangKesehatan,
      this.tunjanganBensinDanParkir,
      this.tunjanganSafetyAndHealthAssistance,
      this.tunjanganTransport,
      this.pulsa,
      this.bonusPromosi,
      this.bonusSellIn,
      this.bonusSellOut,
      this.bonusKonsinyasi,
      this.lembur,
      this.hariLiburMasuk,
      this.bonusProdukFokus,
      this.bonusKinerja,
      this.bonusLainnya,
      this.gajiPokokCutiMelahirkan,
      this.kost,
      this.tambahanGajiLain,
      this.rapelGajiBulanLalu,
      this.transferKekuranganGajiBulanLalu,
      this.pengembalianPotonganSelisihGutl,
      this.pengembalianPotonganSelisihKonsi,
      this.uangKebijakan,
      this.benefitPbp,
      this.bonusAkhirTahun,
      this.uangKompensasi,
      this.bonusProgram,
      this.tunjanganHariRaya,
      this.potSelisihGutl,
      this.potSelisihKonsinyasi,
      this.potSakitTanpaSkd,
      this.potCutiDiluarTanggungan,
      this.potPiutangPinjaman,
      this.potPiutangFaktur,
      this.potKelebihanGajiBulanLalu,
      this.potReport,
      this.potLainLain,
      this.potTerlambat,
      this.potBpjsKesehatan,
      this.potBpjsKetenagakerjaan,
      this.periksaKehamilan,
      this.melahirkanAtauKeguguran,
      this.kesehatanAtauRawatInap,
      this.santunan,
      this.perumahanAtauKost,
      this.pernikahan,
      this.uangApresiasi,
      this.totalPendapatan,
      this.takeHomePay,
      this.totalPotongan,
      this.totalTambahanPendapatan});

  PayslipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bulanPenggajian = int.parse(json['bulan_penggajian']);
    tahunPenggajian = int.parse(json['tahun_penggajian']);
    nip = json['nip'];
    type = json['type'];
    gajiPokok = double.parse(json['gaji_pokok'].toString());
    uangKelas = double.parse(json['uang_kelas'].toString());
    uangHarianDalamKota =
        double.parse(json['uang_harian_dalam_kota'].toString());
    uangHarianLuarKota = double.parse(json['uang_harian_luar_kota'].toString());
    uangKesehatan = double.parse(json['uang_kesehatan'].toString());
    tunjanganBensinDanParkir =
        double.parse(json['tunjangan_bensin_dan_parkir'].toString());
    tunjanganSafetyAndHealthAssistance =
        double.parse(json['tunjangan_safety_and_health_assistance'].toString());
    tunjanganTransport = double.parse(json['tunjangan_transport'].toString());
    pulsa = double.parse(json['pulsa'].toString());
    bonusPromosi = double.parse(json['bonus_promosi'].toString());
    bonusSellIn = double.parse(json['bonus_sell_in'].toString());
    bonusSellOut = double.parse(json['bonus_sell_out'].toString());
    bonusKonsinyasi = double.parse(json['bonus_konsinyasi'].toString());
    lembur = double.parse(json['lembur'].toString());
    hariLiburMasuk = double.parse(json['hari_libur_masuk'].toString());
    bonusProdukFokus = double.parse(json['bonus_produk_fokus'].toString());
    bonusKinerja = double.parse(json['bonus_kinerja'].toString());
    bonusLainnya = double.parse(json['bonus_lainnya'].toString());
    gajiPokokCutiMelahirkan =
        double.parse(json['gaji_pokok_cuti_melahirkan'].toString());
    kost = double.parse(json['kost'].toString());
    tambahanGajiLain = double.parse(json['tambahan_gaji_lain'].toString());
    rapelGajiBulanLalu = double.parse(json['rapel_gaji_bulan_lalu'].toString());
    transferKekuranganGajiBulanLalu =
        double.parse(json['transfer_kekurangan_gaji_bulan_lalu'].toString());
    pengembalianPotonganSelisihGutl =
        double.parse(json['pengembalian_potongan_selisih_gutl'].toString());
    pengembalianPotonganSelisihKonsi =
        double.parse(json['pengembalian_potongan_selisih_konsi'].toString());
    uangKebijakan = double.parse(json['uang_kebijakan'].toString());
    benefitPbp = double.parse(json['benefit_pbp'].toString());
    bonusAkhirTahun = double.parse(json['bonus_akhir_tahun'].toString());
    uangKompensasi = double.parse(json['uang_kompensasi'].toString());
    bonusProgram = double.parse(json['bonus_program'].toString());
    tunjanganHariRaya = double.parse(json['tunjangan_hari_raya'].toString());
    potSelisihKonsinyasi =
        double.parse(json['pot_selisih_konsinyasi'].toString());
    potSelisihGutl = double.parse(json['pot_selisih_gutl'].toString());
    potSakitTanpaSkd = double.parse(json['pot_sakit_tanpa_skd'].toString());
    potCutiDiluarTanggungan =
        double.parse(json['pot_cuti_diluar_tanggungan'].toString());
    potPiutangPinjaman = double.parse(json['pot_piutang_pinjaman'].toString());
    potPiutangFaktur = double.parse(json['pot_piutang_faktur'].toString());
    potKelebihanGajiBulanLalu =
        double.parse(json['pot_kelebihan_gaji_bulan_lalu'].toString());
    potReport = double.parse(json['pot_report'].toString());
    potLainLain = double.parse(json['pot_lain_lain'].toString());
    potTerlambat = double.parse(json['pot_terlambat'].toString());
    potBpjsKesehatan = double.parse(json['pot_bpjs_kesehatan'].toString());
    potBpjsKetenagakerjaan =
        double.parse(json['pot_bpjs_ketenagakerjaan'].toString());
    periksaKehamilan = double.parse(json['periksa_kehamilan'].toString());
    melahirkanAtauKeguguran =
        double.parse(json['melahirkan_atau_keguguran'].toString());
    kesehatanAtauRawatInap =
        double.parse(json['kesehatan_atau_rawat_inap'].toString());
    santunan = double.parse(json['santunan'].toString());
    perumahanAtauKost = double.parse(json['perumahan_atau_kost'].toString());
    pernikahan = double.parse(json['pernikahan'].toString());
    uangApresiasi = double.parse(json['uang_apresiasi'].toString());
    takeHomePay = double.parse(json['take_home_pay'].toString());
    totalPendapatan = double.parse(json['total_pendapatan'].toString());
    totalPotongan = double.parse(json['total_potongan'].toString());
    totalTambahanPendapatan =
        double.parse(json['total_tambahan_pendapatan'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bulanPenggajian': bulanPenggajian,
      'tahunPenggajian': tahunPenggajian,
      'type': type,
      'gajiPokok': gajiPokok,
      'uangKelas': uangKelas,
      'uangHarianDalamKota': uangHarianDalamKota,
      'uangHarianLuarKota': uangHarianLuarKota,
      'uangKesehatan': uangKesehatan,
      'tunjanganBensinDanParkir': tunjanganBensinDanParkir,
      'tunjanganSafetyAndHealthAssistance': tunjanganSafetyAndHealthAssistance,
      'tunjanganTransport': tunjanganTransport,
      'pulsa': pulsa,
      'bonusPromosi': bonusPromosi,
      'bonusSellIn': bonusSellIn,
      'bonusSellOut': bonusSellOut,
      'bonusKonsinyasi': bonusKonsinyasi,
      'lembur': lembur,
      'hariLiburMasuk': hariLiburMasuk,
      'bonusProdukFokus': bonusProdukFokus,
      'bonusKinerja': bonusKinerja,
      'bonusLainnya': bonusLainnya,
      'gajiPokokCutiMelahirkan': gajiPokokCutiMelahirkan,
      'kost': kost,
      'tambahanGajiLain': tambahanGajiLain,
      'rapelGajiBulanLalu': rapelGajiBulanLalu,
      'transferKekuranganGajiBulanLalu': transferKekuranganGajiBulanLalu,
      'pengembalianPotonganSelisihGutl': pengembalianPotonganSelisihGutl,
      'pengembalianPotonganSelisihKonsi': pengembalianPotonganSelisihKonsi,
      'uangKebijakan': uangKebijakan,
      'benefitPbp': benefitPbp,
      'bonusAkhirTahun': bonusAkhirTahun,
      'uangKompensasi': uangKompensasi,
      'bonusProgram': bonusProgram,
      'tunjanganHariRaya': tunjanganHariRaya,
      'potSelisihKonsinyasi': potSelisihKonsinyasi,
      'potSelisihGutl': potSelisihGutl,
      'potSakitTanpaSkd': potSakitTanpaSkd,
      'potCutiDiluarTanggungan': potCutiDiluarTanggungan,
      'potPiutangPinjaman': potPiutangPinjaman,
      'potPiutangFaktur': potPiutangFaktur,
      'potKelebihanGajiBulanLalu': potKelebihanGajiBulanLalu,
      'potReport': potReport,
      'potLainLain': potLainLain,
      'potTerlambat': potTerlambat,
      'potBpjsKesehatan': potBpjsKesehatan,
      'potBpjsKetenagakerjaan': potBpjsKetenagakerjaan,
      'periksaKehamilan': periksaKehamilan,
      'melahirkanAtauKeguguran': melahirkanAtauKeguguran,
      'kesehatanAtauRawatInap': kesehatanAtauRawatInap,
      'santunan': santunan,
      'perumahanAtauKost': perumahanAtauKost,
      'pernikahan': pernikahan,
      'uangApresiasi': uangApresiasi,
      'takeHomePay': takeHomePay,
      'totalPendapatan': totalPendapatan,
      'totalPotongan': totalPotongan,
      'totalTambahanPendapatan': totalTambahanPendapatan
    };
  }
}
