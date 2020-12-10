package com.longnguyen.service;

import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;

import com.longnguyen.algorithm.QuickSortSingle;
import com.longnguyen.algorithm.QuickSortThreaded;
import com.longnguyen.algorithm.searchThreaded;
import com.longnguyen.model.SachModel;


public class SachService {
	public double getTimeSingle() {
		return timeSingle;
	}

	public void setTimeSingle(double timeSingle) {
		this.timeSingle = timeSingle;
	}

	public double getTimeThreads() {
		return timeThreads;
	}

	public void setTimeThreads(double timeThreads) {
		this.timeThreads = timeThreads;
	}

	public Long getSizeArray() {
		return sizeArray;
	}

	public void setSizeArray(Long sizeArray) {
		this.sizeArray = sizeArray;
	}

	public Long getNumberThreads() {
		return numberThreads;
	}

	public void setNumberThreads(Long numberThreads) {
		this.numberThreads = numberThreads;
	}

	private double timeSingle, timeThreads;
	private Long sizeArray, numberThreads;
	private String[] hos = { "Nguyễn ", "Lê ", "Ngô ", "Trần ", "Phạm ", "Huỳnh ", "Đỗ ", "Bùi ", "Ngô ", "Dương ",
							"Lý ", "Đặng ", "Hồ ", "Phan ", "Cao ", "Võ ", "Kim ", "Liễu ", "Đoàn ", "Đàm ", 
							"Thái ", "Trịnh ", "Lưu ", "Hoàng ", "Trương ", "Vương ", "Chu ", "Triệu ", "Tạ ", "Tiêu ",
							"Hạ ", "Ông","Quách"};
	private String[] tenLots = { "Thành ", "Trung ", "Quang ", "Phương ", "Bảo ", "Vân ", "An ","Anh ","Gia ","Phụng ","Thị ","Trần ","Thị Ngọc ","Thế " };
	private String[] tens = { "Long", "Duy", "Sơn", "Nam", "Xuân", "Quỳnh", "Tài", "Lân","Khang","Khánh","Ý"};

	private String[] tenSachs = { "Người xa lạ", "Đi tìm thời gian đã mất", "Hoàng tử bé", "Chùm nho uất hận" ,"Trên đường bay","Cafe cùng Tony","Nơi em trở về có tôi đứng đợi","Đắc nhân tâm",
			"Trái đất tròn không gì là không thể","Ai sẽ mang giày cao gót cho em","Tôi thấy hoa vàng trên cỏ xanh","Ngũ quái Sài Gòn","Kính vạn hoa","Hành trình của Elaina", "Color full"};
	
	public List<SachModel> listSingle = new ArrayList<>();
	public List<SachModel> listThreads = new ArrayList<>();

	public void getListSach(int number) throws ParseException {
		for (int i = 0; i < number; i++) {
			int ho = 0 + (int) (Math.random() * hos.length);
			int tenLot = 0 + (int) (Math.random() * tenLots.length);
			int ten = 0 + (int) (Math.random() * tens.length);
			int sach = 0 + (int) (Math.random() * tenSachs.length);
			int soNgayMuon = 1 + (int) (Math.random() * 30);
			int ngay = 1 + (int) (Math.random() * 30);
			int thang = 1 + (int) (Math.random() * 12);
			int nam = 2019 + (int) (Math.random() * 2);
			String ngayMuon = ngay + "/" + thang + "/" + nam;
			SachModel model = new SachModel();

			String hoVaTen = "";
			hoVaTen = hos[ho];
			hoVaTen += tenLots[tenLot];
			hoVaTen += tens[ten];

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date date1 = sdf.parse(ngayMuon);

			model.setTenNguoiMuon(hoVaTen);
			model.setTenSach(tenSachs[sach]);
			model.setMaPhieuMuon("MPM" + i);
			model.setNgayMuon(date1);
			model.setNgayMuonStr(ngayMuon);
			model.setSoNgayMuon(soNgayMuon);

			listSingle.add(model);
			listThreads.add(model);
		}
	}

	public double SortSingle(List<SachModel> myList, String styleSort) {
		QuickSortSingle sort = new QuickSortSingle();
		double start = System.nanoTime()/1000000;
		sort.sort(myList, styleSort);
		double end = (System.nanoTime()/1000000) - start;
		System.out.println("Single array sorted in " + end + " ms");
		return end;
	}
	
	public double SortThreaded(int numberThreads,List<SachModel> myList, String styleSort) {
		QuickSortThreaded sort = new QuickSortThreaded();
		sort.a = myList;
		double time = 0l;
		try {
			time = sort.QuickSortThread(numberThreads, styleSort);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("Threads array sorted in " + time + " ms");
		return time;
	}

	public List<SachModel> search(String item, List<SachModel> myArray, String styleSearch){
		searchThreaded search = new searchThreaded(myArray, 8,item, styleSearch);
		search.init_Thread();
		search.Start_Thread();

		return search.searchArray;
	}
}
