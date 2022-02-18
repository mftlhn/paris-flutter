class UserModel {
  int id;
  String namalengkap,
      email,
      nip,
      token,
      lokasi,
      posisi,
      departemen,
      agama,
      brand,
      bank,
      statusPernikahan,
      pendidikanTerakhir,
      perusahaan,
      tempatLahir,
      tglLahir,
      jenisKelamin,
      jumlahAnak,
      alamat,
      alamatDomisili,
      noktp,
      nokk,
      nonpwp,
      nohp,
      noRekening,
      namaIbuKandung,
      namaKelTdkSerumah,
      hubunganKeluarga,
      noHpKeluarga,
      profilePict;

  UserModel(
      {this.email,
      this.id,
      this.namalengkap,
      this.nip,
      this.token,
      this.lokasi,
      this.posisi,
      this.departemen,
      this.agama,
      this.brand,
      this.bank,
      this.statusPernikahan,
      this.pendidikanTerakhir,
      this.perusahaan,
      this.tempatLahir,
      this.tglLahir,
      this.jenisKelamin,
      this.jumlahAnak,
      this.alamat,
      this.alamatDomisili,
      this.noktp,
      this.nokk,
      this.nonpwp,
      this.nohp,
      this.noRekening,
      this.namaIbuKandung,
      this.namaKelTdkSerumah,
      this.hubunganKeluarga,
      this.noHpKeluarga,
      this.profilePict});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namalengkap = json['namalengkap'];
    email = json['email'];
    nip = json['nip'];
    token = json['token'];
    lokasi = json['lokasi'];
    posisi = json['posisi'];
    departemen = json['departemen'];
    agama = json['agama'];
    brand = json['brand'];
    bank = json['bank'];
    statusPernikahan = json['status_pernikahan'];
    pendidikanTerakhir = json['pendidikan_terakhir'];
    perusahaan = json['perusahaan'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    jumlahAnak = json['jumlah_anak'];
    alamat = json['alamat'];
    alamatDomisili = json['alamat_domisili'];
    noktp = json['noktp'];
    nokk = json['no_kk'];
    nonpwp = json['no_npwp'];
    nohp = json['no_hp'];
    noRekening = json['no_rekening'];
    namaIbuKandung = json['nama_ibu_kandung'];
    namaKelTdkSerumah = json['nama_kel_tdk_serumah'];
    hubunganKeluarga = json['hubungan_keluarga'];
    noHpKeluarga = json['no_hp_keluarga'];
    profilePict = json['profile_pict'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namalengkap': namalengkap,
      'email': email,
      'nip': nip,
      'token': token,
      'lokasi': lokasi,
      'posisi': posisi,
      'departemen': departemen,
      'agama': agama,
      'brand': brand,
      'bank': bank,
      'statusPernikahan': statusPernikahan,
      'pendidikanTerakhir': pendidikanTerakhir,
      'perusahaan': perusahaan,
      'tempatLahir': tempatLahir,
      'tglLahir': tglLahir,
      'jenisKelamin': jenisKelamin,
      'jumlahAnak': jumlahAnak,
      'alamat': alamat,
      'alamatDomisili': alamatDomisili,
      'noktp': noktp,
      'nokk': nokk,
      'nonpwp': nonpwp,
      'nohp': nohp,
      'noRekening': noRekening,
      'namaIbuKandung': namaIbuKandung,
      'namaKelTdkSerumah': namaKelTdkSerumah,
      'hubunganKeluarga': hubunganKeluarga,
      'noHpKeluarga': noHpKeluarga,
      'profilePict': profilePict
    };
  }
}
