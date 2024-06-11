import 'package:flutter/material.dart';
import 'package:kalih_coffee/ui/kasir/antrian.dart';
import 'package:kalih_coffee/ui/kasir/detail_pesanan.dart';
import 'package:kalih_coffee/ui/kasir/login_kasir.dart';
import 'package:kalih_coffee/ui/kasir/selesai.dart';
import 'package:kalih_coffee/ui/pelanggan/daftar_menu.dart';
import 'package:kalih_coffee/ui/pelanggan/keranjang.dart';
import 'package:kalih_coffee/ui/pelanggan/login_pelanggan.dart';
import 'package:kalih_coffee/ui/pelanggan/struk.dart';
import 'package:kalih_coffee/ui/pelanggan/transaksiselesai.dart';

MaterialPageRoute _pageRoute({
  required Widget body,
  required RouteSettings settings,
}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;

  switch (settings.name) {
    case rLoginKasir:
      _route = _pageRoute(body: LoginKasirApp(), settings: settings);
      break;
    case rLoginPelanggan:
      _route = _pageRoute(body: LoginPelangganApp(), settings: settings);
      break;
    case rAntrian:
      _route = _pageRoute(body: Antrian(), settings: settings);
      break;
    case rDetail:
      _route = _pageRoute(body: DetailPesanan(), settings: settings);
      break;
    case rSelesai:
      _route = _pageRoute(body: Selesai(), settings: settings);
      break;
    case rDaftarMenu:
      _route = _pageRoute(body: DaftarMenu(), settings: settings);
      break;
    case rKeranjang:
      _route = _pageRoute(body: Keranjang(), settings: settings);
      break;
    case rStruk:
      _route = _pageRoute(body: KonfirmasiPembayaran(), settings: settings);
      break;
    case rTransaksiSelesai:
      _route = _pageRoute(body: TransaksiSelesai(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();

const String rLoginKasir = '/loginkasir';
const String rAntrian = '/antrian';
const String rDetail = '/detail';
const String rSelesai = '/selesai';

const String rLoginPelanggan = '/loginpelanggan';
const String rDaftarMenu = '/daftarmenu';
const String rDetailMenu = '/detailmenu';
const String rKeranjang = '/keranjang';
const String rStruk = '/struk';
const String rTransaksiSelesai = '/transaksi';
