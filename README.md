# Game Show 20/10

Slide game show nội bộ mừng Ngày Phụ nữ Việt Nam, dành cho 12 người chia 3 đội.
Chạy thẳng trên trình duyệt: không build, không dependency, một file HTML duy nhất.

## Chạy

**Đã deploy:** mở link Vercel và bấm `F` để toàn màn hình.

**Chạy tại máy:**

```bash
bash chay-slide.sh
```

Script bật một web server tạm ở cổng 8010 rồi mở trình duyệt.

> **Đừng mở `index.html` bằng cách nhấp đúp.** Với giao thức `file://`, YouTube
> từ chối nhúng và báo `Error 153` vì không nhận được referrer. Phải chạy qua
> HTTP (Vercel hoặc script trên). Trang sẽ tự cảnh báo nếu bạn mở sai cách.

## Điều khiển

| Phím | Tác dụng |
|---|---|
| `→` `Space` | Slide kế |
| `←` | Slide trước |
| `F` | Toàn màn hình |
| `H` | Ẩn/hiện thanh điều khiển |
| `Home` `End` | Slide đầu / cuối |

Điểm số lưu trong `localStorage` của trình duyệt, đóng tab mở lại vẫn còn.
Nút **Xoá điểm** đưa về trạng thái ban đầu — nhớ bấm sau khi chạy thử.

## Thể lệ

12 người, 3 đội, mỗi đội 4 người. Giải Nhất 600.000đ, Nhì 500.000đ, Ba 400.000đ,
chia đều cho 4 thành viên.

### Game 1 — Nói nhanh trên nhịp beat

Mỗi đội cử 3 người, bốc thăm một video, mỗi người chơi một Level.
Một lỗi = đọc sai, im lặng, hoặc trễ hẳn một nhịp. Ít lỗi hơn thì hạng cao hơn
(bằng lỗi thì xét Level 3 trước, rồi Level 2). Nhất 3đ, Nhì 2đ, Ba 1đ.

Vòng chung kết: mỗi đội cử 1 người, ba người cùng đọc một video khó nhất,
ai vấp trước thì ngồi xuống. Đội thắng +2đ.

Video lấy từ kênh [Lion Quiz](https://www.youtube.com/@LionQuiz8). Ba video vòng 1
cùng series, cùng dài 1:41, cùng ba level — chọn như vậy để ba đội thi trên cùng
một thang độ khó.

### Game 2 — Giải ô chữ

Bảy hàng ngang, mỗi hàng là một phụ nữ Việt Nam. Cột khoá đọc dọc ra **TÔN VINH**.
Mỗi hàng đúng +1đ. Đoán đúng từ khoá: +3đ nếu còn ≥4 hàng đóng, +2đ nếu còn 2–3
hàng, +1đ nếu còn 1 hàng hoặc đã mở hết. Đoán sai không mất điểm, chỉ bị khoá
quyền đoán cho đến khi mở thêm 2 hàng.

Hoà sau cả hai game: đội có tổng lỗi Game 1 ít hơn xếp trên.

## Nguồn đáp án ô chữ

Mỗi hàng dựa trên một dữ kiện đã tra, hiển thị kèm nguồn ngay trên slide gợi ý.

| # | Đáp án | Dữ kiện |
|---|---|---|
| 1 | TRIỆU THỊ TRINH | Tên thật của Bà Triệu, quê Thanh Hoá, khởi nghĩa năm 248 |
| 2 | NGÔ THỊ TUYỂN | Nữ dân quân Nam Ngạn, vác hai hòm đạn ~98kg, 4/4/1965, cầu Hàm Rồng |
| 3 | LÊ THỊ XUYẾN | Hội trưởng đầu tiên Hội LHPN Việt Nam, bầu ngày 20/10/1946 |
| 4 | VÕ THỊ SÁU | Nữ anh hùng quê Đất Đỏ, Bà Rịa – Vũng Tàu |
| 5 | NGUYỄN THỊ ĐỊNH | Nữ tướng đầu tiên của QĐND Việt Nam, thiếu tướng tháng 4/1974 |
| 6 | HAI BÀ TRƯNG | Khởi nghĩa năm 40 (sau Công nguyên) chống quân Đông Hán |
| 7 | LÝ CHIÊU HOÀNG | Nữ hoàng đế duy nhất trong lịch sử Việt Nam, nhường ngôi năm 1225 |

Chữ trong ô bỏ dấu thanh, giữ `ă â ê ô ơ ư đ` — theo lối ô chữ tiếng Việt thông thường.

Nhiều trang tổng hợp câu đố 20/10 trên mạng có sai sót đã kiểm chứng được: ghi
Chủ tịch đầu tiên Hội LHPN là Hồ Thị Kỷ hoặc Nguyễn Thị Bình (đúng ra là Lê Thị
Xuyến), và ghi khởi nghĩa Hai Bà Trưng năm 40 **trước** Công nguyên (đúng ra là
sau). Các dữ kiện trong bảng trên đã đối chiếu lại với báo chí chính thống.

## Cấu trúc

```
index.html        toàn bộ slide, CSS và logic tính điểm
assets/cover.png  ảnh thiệp, dùng cho slide bìa và nền blur
chay-slide.sh     chạy tại máy qua localhost
vercel.json       cấu hình deploy
```

## Sửa nội dung

Mở `index.html`, phần `<script>` ở cuối:

- `VIDEOS`, `FINAL`, `SPARE` — ID video YouTube của Game 1
- `PUZZLE` — bảy hàng ô chữ: `cells` là chữ trong ô, `k` là vị trí ô khoá (đếm từ 1)
- `DEFAULT_STATE.names` — tên ba đội mặc định (sửa trực tiếp trên slide 4 cũng được)
- `buildSlides()` — nội dung từng slide

Đổi `PUZZLE` thì nhớ kiểm lại cột khoá: ký tự thứ `k` của mỗi hàng ghép dọc
phải ra đúng từ khoá.
