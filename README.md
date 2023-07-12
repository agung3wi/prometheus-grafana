# Prometheus Grafana

Prometheus adalah salah satu perangkat lunak (software) open-source yang digunakan untuk memantau dan mengumpulkan data dari berbagai sistem dan layanan. Prometheus dikembangkan oleh SoundCloud dan kemudian menjadi proyek yang dikelola oleh Cloud Native Computing Foundation (CNCF).

Prometheus dirancang khusus untuk memonitoring infrastruktur komputasi yang kompleks, termasuk server, jaringan, aplikasi, dan layanan. Perangkat lunak ini menggunakan model pengumpulan data berdasarkan skraping, di mana agen Prometheus dikonfigurasi untuk mengambil metrik dari endpoint yang ditentukan. Metrik ini bisa berupa informasi tentang kesehatan sistem, penggunaan sumber daya, performa aplikasi, dan lain sebagainya.

Prometheus juga mendukung bahasa pengolahan data yang kuat yang disebut PromQL (Prometheus Query Language) untuk melakukan analisis dan pemantauan real-time. Selain itu, Prometheus memiliki sistem peringatan (alerting) yang dapat dikonfigurasi untuk memberikan notifikasi ketika terjadi kejadian atau kondisi yang tidak diinginkan.

## Prometheus Exporter

Prometheus Exporter adalah komponen atau perangkat lunak tambahan yang digunakan untuk mengumpulkan dan mengekspor metrik dari sistem atau layanan yang tidak secara langsung mendukung format metrik Prometheus. Exporter ini bertindak sebagai jembatan antara sistem atau layanan yang ingin dimonitor dan Prometheus.

Cara kerja Prometheus Exporter adalah sebagai berikut:

Pengumpulan Metrik: Exporter menjalankan tugas pengumpulan metrik dari sistem atau layanan yang ingin dimonitor. Misalnya, exporter dapat mengambil metrik dari sistem operasi, basis data, aplikasi, layanan jaringan, atau layanan cloud.

Konversi ke Format Prometheus: Exporter akan mengonversi metrik yang dikumpulkan menjadi format yang sesuai dengan format metrik Prometheus. Format yang umum digunakan adalah plain text dengan struktur key-value pairs yang diatur dalam format yang disebut exposition format.

Penyediaan Endpoint: Exporter akan menyediakan endpoint HTTP atau endpoint lain yang dapat diakses oleh Prometheus. Endpoint ini berfungsi sebagai titik akhir (target) untuk Prometheus mengambil metrik yang diekspor oleh exporter.

Konfigurasi Prometheus: Kita perlu mengonfigurasi Prometheus untuk menambahkan target exporter yang akan diambil metriknya. Dalam konfigurasi Prometheus, Kita akan menentukan URL atau endpoint exporter sehingga Prometheus tahu di mana mendapatkan metrik tersebut.

Pengumpulan dan Pengolahan Metrik oleh Prometheus: Prometheus akan secara periodik mengambil metrik dari endpoint exporter yang telah dikonfigurasi. Metrik ini akan disimpan dalam database Prometheus dan tersedia untuk analisis, visualisasi, dan pembuatan aturan peringatan.

## Grafana

Grafana merupakan Visualisasi dari data yang dikumpulkan oleh prometheus.
