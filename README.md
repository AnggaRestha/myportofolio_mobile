1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

Jawaban :
Widget adalah sebuah komponen dalam flutter yang menjadi pondasi pondasi sebuah apps, nah kalo widget tree tersebut adalah struktur hierarki atau susunan bertingkat yang dipake buat membangun tampilan aplikasi flutter. contoh komponen yang ku maksud tuh seperti Text, Icon, Container, Row, Column, dan Scaffold.

Hubungan antara induk dan anak itu terjadi ketika sebuah widget memiliki atau menampung widget lain di dalamnya. Widget induk berfungsi mengatur tata letak, ukuran, posisi, dan tampilan widget anaknya. Sementara itu, widget anak bertugas menampilkan konten atau elemen tertentu sesuai dengan pengaturan dari widget induknya.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

Jawaban :
Nah di proyekku, aku memakai Widget :

- MaterialApp   : Menjadi widget utama yang mengatur konfigurasi aplikasi, tema, dan halaman awal.
- Scaffold  : Menyediakan struktur dasar halaman aplikasi, seperti AppBar dan Body.
- AppBar    : Menampilkan bilah bagian atas aplikasi dengan judul MyPortfolio.
- Text  : Menampilkan teks seperti judul, identitas, dan nama tombol.
- Column    : Menyusun widget secara vertikal dari atas ke bawah.
- Row   : Menyusun widget secara horizontal dari kiri ke kanan.
- Expanded  : Membagi ruang yang tersedia secara proporsional kepada widget anak.
- SingleChildScrollView : Memungkinkan halaman digulir ketika kontennya melebihi ukuran layar.
- Padding   : Memberikan jarak antara widget dengan elemen di sekitarnya.
- Card  : Membuat tampilan kartu informasi dengan efek bayangan.
- Container : Mengatur ukuran, padding, dan tata letak elemen.
- SizedBox  : Memberikan jarak atau ukuran tertentu antarwidget.
- GridView.count    : Menampilkan kumpulan tombol dalam bentuk susunan grid dengan jumlah kolom tertentu.
- Center    : Menempatkan widget anak di bagian tengah.
- Icon  : Menampilkan ikon yang mewakili fungsi setiap tombol.
- Material  : Memberikan latar belakang dan bentuk Material Design pada tombol.
- InkWell : Memberikan efek interaksi ketika tombol ditekan.
- SnackBar  : Menampilkan pesan sementara sebagai respons terhadap tindakan pengguna.

nah selain itu, aku juga buat beberapa widget sendiri bang contohnya :
- MyApp : Widget utama yang mengatur tema dan halaman awal aplikasi.
- MyHomePage    : Widget halaman utama yang menampilkan identitas pemilik portfolio dan menu navigasi.
- InfoCard  : Widget yang digunakan untuk menampilkan informasi NPM, nama, dan kelas dalam bentuk kartu.
- ItemCard  : Widget yang digunakan untuk menampilkan tombol menu seperti Lihat Proyek, Tambah Proyek, dan Logout.


3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

Jawaban :
MaterialApp itu fungsinya ibarat core dari sebuah widget. dikarenakan MaterialApp ini dia mengatur konfigurasi dasar aplikasi yang menggunakan konsep Material Design. nah Widget ini dia juga digunakan untuk menentukan tema dari sebuah apps, warna, judul aplikasi dan home page.

nah seperti yang saya bilang diatas MaterialApp ini seperti core, karna umumnya digunakan sebagai root widget karena menjadi induk dari seluruh widget yang ngebangun tampilan aplikasi. dengan kita menaruhnya di root, seluruh pengaturan akan bisa diturunkan oleh widget lainnya yang dibawah widget treenya


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

Jawaban :
StatelessWidget dan StatefulWidget merupakan dua jenis widget dalam Flutter yang memiliki perbedaan utama pada pengelolaan perubahan data atau state.

nah untuk StatelessWidget adalah adalah widget yang gapunya state atau diibaratkan seperti widget batu aku nyebutnya, karna cocok untuk menampilkan tampilan yang bersifat tetap dan gaperlu perubahan data secara langsung. contohnya kayak MyHomePage, InfoCard, ItemCard itu aku pake widget batu karna informasi kayak NPM, Nama, Kelas itu tidak memerlukan perubahan state internal.

kalau StatefulWidget adalah kebalikannya, dia adalah widget yang mempunyai state atau keadaan yang dapat berubah selama aplikasi berjalan. biasanya perubahannya dia diatur dengan setState() agar flutter memperbarui tampilan sesuai perubahan data.

kalo ditanya kapan cocok dipakai :
    untuk StatelessWidget cocok dipakai untuk menampilkan data pasti seperti yang aku bilang tadi kayak tanggal ulang tahun, nama, npm, dan hal yang sudah pasti.

    nah untuk StatefullWidget ini cocok dipakai jika tampilan perlu berubah berdasarkan interaksi pengguna atau perubahan data selama aplikasi berjalan.



5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

Jawaban :
BuildContext adalah objek yang isinya informasi mengenai posisi suatu widget di dalam widget tree flutter.
BuildContext berfungsi untuk membantu widget mengakses informasi dan konfigurasi dari widget induknya, seperti tema aplikasi, ukuran layar, navigasi, dan pesan notifikasi.

BuildContext sangat penting karena memungkinkan sebuah widget berinteraksi dengan lingkungan di sekitarnya tanpa harus mengirimkan seluruh informasi secara manual.

Di dalam metode build, BuildContext digunakan sebagai parameter:

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text('MyPortfolio'),
    ),
  );
}

nah di proyekku, BuildContext digunakan dalam beberapa bagian, yaitu :
    - Theme.of(context) untuk mengambil pengaturan tema dan warna aplikasi.
    - MediaQuery.of(context) untuk mendapatkan informasi ukuran layar, misalnya menentukan lebar kartu informasi.
    - ScaffoldMessenger.of(context) untuk menampilkan SnackBar ketika pengguna menekan tombol menu.


6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Jawaban :
Hot reload itu fitur flutter yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa harus menjalankan ulang seluruh aplikasi. fitur ini memperbarui tampilan aplikasi dengan mempertahankan kondisi atau state yang sedang berjalan.

Nah sedangkan Hot Restart ini kebalikannya Hot Reload, dia menjalankan ulang projek dari awal dengan memuat kode terbarunya. dan Hot Restart dia akan menghapus kondisi atau state sementara yang sebelumnya tersimpan 

nah kapan harus memakai hot reload dan kapan harus makai hot restart atau full restart :
- Hot Reload digunakan ketika melakukan perubahan pada tampilan, seperti mengubah warna, ukuran teks, ikon, tata letak, atau isi widget.

- Hot Restart digunakan ketika perubahan kode membutuhkan proses inisialisasi ulang, misalnya mengubah nilai awal variabel global atau mengubah kode pada fungsi main() dan proses inisialisasi aplikasi.

- Full Restart diperlukan ketika melakukan perubahan pada kode native Android atau iOS, seperti kode Kotlin, Java, Swift, atau konfigurasi plugin yang membutuhkan proses build ulang aplikasi.


## AI Disclosure (Pengungkapan Penggunaan AI)

Dalam pengerjaan tugas 7 ini, saya menggunakan ChatGPT (OpenAI) sebagai alat bantu pembelajaran untuk mendukung pemahaman dan proses pengembangan aplikasi Flutter.

Penggunaan AI mencakup beberapa hal berikut:

1. Membantu memahami konsep Flutter, seperti Widget Tree, BuildContext, StatelessWidget, StatefulWidget, Hot Reload, dan Hot Restart.
2. Memberikan panduan dan saran dalam implementasi widget, seperti InfoCard dan ItemCard.
3. Membantu mengidentifikasi serta menyelesaikan kendala atau kesalahan selama proses pengembangan aplikasi.

Seluruh saran, penjelasan, dan kode yang dihasilkan oleh AI telah ditinjau, disesuaikan, dan diuji selama proses pengerjaan. Saya tetap bertanggung jawab atas hasil akhir, pemahaman materi, serta tugas yang dikumpulkan.


TUGAS 8

1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.

Jawab: 
bedanya Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() itu berada pada proses pembukaan filenya.

Kalo Navigator.push() dia ngebuka halaman baru dengan menambahkannya ke navigation stack, sehingga pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol Back.

Kalo Navigator.pushReplacement() sudah jelas dia mengreplace halaman sebelumnya ketika membuka halaman baru sehingga pengguna tidak dapat kembali karna sudah digantikan dengan halaman baru

terakhir ada Navigator.pop() dia berbeda dengan kedua tadi, dia hanya menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya

Sementara itu, opsi Home pada drawer menggunakan Navigator.popUntil((route) => route.isFirst) untuk menutup halaman-halaman di atas halaman utama dan membawa pengguna kembali ke halaman pertama aplikasi tanpa membuat halaman Home baru.

2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Jawaban:
Scaffold itu ibarat kata seperti sholat yang menjadi pondasi utama dalam islam, dia yang mengatur AppBar, Drawer, dan Body. AppBar dipake untuk menampilkan judul, sedangkan Drawer dia menyediakan menu navigasi agar pengguna dapat berpindah halaman dengan gampang.

Penggunaan ketiga widget tersebut membuat tampilan aplikasi MyPortfolio Mobile lebih konsisten karena setiap halaman memiliki struktur dan navigasi yang serupa.

Contohnya, aku menggunakan warna indigo sebagai tema utama pada AppBar di halaman Add Project Form dan Add Experience Form. Kedua halaman menggunakan latar Colors.indigo dan teks berwarna putih sehingga tampilan aplikasi terlihat seragam dan sesuai dengan identitas visual portofolio

3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

Jawab: 
Tata letak formulir pada aplikasiku dibuat dengan Column biar setiap input tersusun secara vertikal, rapi, dan mudah diisi oleh user. Selain itu, Padding dan SizedBox digunakan untuk memberikan jarak antarinput sehingga tampilan tidak terlalu rapat dan lebih nyaman digunakan.

nah buat Widget SingleChildScrollView digunakan biar halaman formulir dapat digeser kebawah ketika ruang layar terbatas, misalnya pas aplikasi dibuka pada perangkat dengan layar kecil atau ketika keyboard muncul. Dengan demikian, seluruh kolom input dan tombol Simpan tetap dapat dijangkau pengguna tanpa menyebabkan masalah overflow pada tampilan.

4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

Jawab:
GlobalKey<FormState> dipake untuk akses dan mengatur kondisi form, kalo validator digunakan untuk memeriksa apakah setiap input sudah sesuai dengan required yang ditentukan. nah ketika tombol Simpan ditekan, metod validate() akan menjalankan seluruh validator pada form. jika terdapat input yang ga valid, pesan kesalahan akan ditampilkan dan proses penyimpanan tidak dilanjutkan.

Contohnya, pada formulir Add Experience, input Nama Perusahaan yang hanya berisi spasi akan ditolak karena setelah diperiksa menggunakan trim().isEmpty, nilainya dianggap kosong.

Pemilihan jenis input atau papan ketik saja belum cukup karena hanya membantu pengguna memasukkan data, tetapi tidak menjamin data tersebut benar. Oleh karena itu, validasi tetap diperlukan untuk memastikan data sesuai dengan aturan, seperti input wajib diisi, panjang karakter, dan urutan tanggal yang benar.


## AI Disclosure (Pengungkapan Penggunaan AI)

Dalam pengerjaan tugas 8 ini, saya menggunakan ChatGPT (OpenAI) sebagai alat bantu pembelajaran untuk mendukung pemahaman dan proses pengembangan aplikasi Flutter.

Ai sendiri aku pake untuk membantu diriku memahami beberapa intruksi tugas 8 ini seperti menyusun struktur kode buat Add Experience. disitu aku menggunakan Ai untuk bertanya beberapa best praktis dalam ngebuat form serta mengkompare dengan tutorial yang ada. dan aku menggunakan Ai juga untuk bikin validasi form dengan  GlobalKey<FormState> dan validator, dan implemen navigasi dengan Navigator.push() dan Drawer. dan ada beberapa common mistake yang terjadi pada tahap pembuatan tugasnya. 

Intinya untuk seluruh code dan saran yang dikasih sama Ai selalu aku crosscheck terlebih dahulu sebelum digunakan. dan semua pengujian juga aku lakukan secara manual tanpa menggunakan Ai sedikitpun.

Ai dipake hanya untuk alat bantu belajar, untuk proses implementasi dan pengujian serta tanggung jawab terhadap hasilnya nanti tetap berada di diriku sendiri.

