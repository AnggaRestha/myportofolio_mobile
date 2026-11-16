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

Dalam pengerjaan tugas ini, saya menggunakan ChatGPT (OpenAI) sebagai alat bantu pembelajaran untuk mendukung pemahaman dan proses pengembangan aplikasi Flutter.

Penggunaan AI mencakup beberapa hal berikut:

1. Membantu memahami konsep Flutter, seperti Widget Tree, BuildContext, StatelessWidget, StatefulWidget, Hot Reload, dan Hot Restart.
2. Memberikan panduan dan saran dalam implementasi widget, seperti InfoCard dan ItemCard.
3. Membantu mengidentifikasi serta menyelesaikan kendala atau kesalahan selama proses pengembangan aplikasi.

Seluruh saran, penjelasan, dan kode yang dihasilkan oleh AI telah ditinjau, disesuaikan, dan diuji selama proses pengerjaan. Saya tetap bertanggung jawab atas hasil akhir, pemahaman materi, serta tugas yang dikumpulkan.