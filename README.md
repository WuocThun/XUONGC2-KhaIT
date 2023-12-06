# XUONGC2-KhaIT
-- CÁC LỆNH GIT --
1) PHẢI TỰ TẠO BRANCH RIÊNG
+) git checkout -b <TÊN BRANCH MỚI(TÊN CỦA MÌNH)>
vd: git checkout -b quocthuan
2) kiểm tra mình đang ở branch nào
+) git branch 
-) nếu ở branch master/main thì phải chuyển sang branch của mình bằng cách:
git branch <BRANCH CỦA MÌNH>
vd: git branch quocthuan
3) ĐẨY BÀI LÊN BRANCH
+) git add . (chọn tất cả các file) 
+) git commit -m "<chú thích>" (CHÚ THÍCH ĐẦY ĐỦ NHƯ SAU: TÊN- Ngày đẩy)
+) git push origin <BRANCH>
vd: 
git add .
git commit -m "quocthuan-5/12"
git push origin quocthuan
4) TRƯỚC KHI BẮT TAY VÔ CODE THÌ NÊN PULL VỀ
+) GIT PULL ORIGIN <BRANCH CẦN PULL>
vd: git pull origin master (master là nhánh tổng hợp các code các bạn code và đc merge lại) 
