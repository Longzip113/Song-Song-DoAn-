package com.longnguyen.service;

import java.util.ArrayList;
import java.util.List;

import com.longnguyen.algorithm.QuickSortSingle;
import com.longnguyen.algorithm.QuickSortThreaded;
import com.longnguyen.algorithm.searchThreaded;
import com.longnguyen.model.SachModel;

public class SachService {
	public Long getTimeSingle() {
		return timeSingle;
	}

	public void setTimeSingle(Long timeSingle) {
		this.timeSingle = timeSingle;
	}

	public Long getTimeThreads() {
		return timeThreads;
	}

	public void setTimeThreads(Long timeThreads) {
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

	private Long timeSingle, timeThreads, sizeArray, numberThreads;
	private String[] hos = { "Nguyễn ", "Lê ", "Ngô ", "Trần ", "Phạm ", "Huỳnh ", "Đỗ ", "Bùi ", "Ngô ", "Dương ",
							"Lý ", "Đặng ", "Hồ ", "Phan ", "Cao ", "Võ ", "Kim ", "Liễu ", "Đoàn ", "Đàm ", 
							"Thái ", "Trịnh ", "Lưu ", "Hoàng ", "Trương ", "Vương ", "Chu ", "Triệu ", "Tạ ", "Tiêu ",
							"Hạ "};
	private String[] tenLots = { "Thành ", "Trung ", "Quang ", "Phương ", "Bảo ", "Vân ", "An " };
	private String[] tens = { "Long", "Duy", "Sơn", "Nam", "Xuân", "Quỳnh" };

	private String[] tenSachs = { "Người xa lạ", "Đi tìm thời gian đã mất", "Hoàng tử bé", "Chùm nho uất hận" };
	
	public List<SachModel> listSingle = new ArrayList<>();
	public List<SachModel> listThreads = new ArrayList<>();

	public void getListSach(int number) {
		for (int i = 0; i < number; i++) {
			int ho = 0 + (int) (Math.random() * 19);
			int tenLot = 0 + (int) (Math.random() * 6);
			int ten = 0 + (int) (Math.random() * 5);
			int sach = 0 + (int) (Math.random() * 3);
			SachModel model = new SachModel();

			String hoVaTen = "";
			hoVaTen = hos[ho];
			hoVaTen += tenLots[tenLot];
			hoVaTen += tens[ten];

			model.setTenNguoiMuon(hoVaTen);
			model.setTenSach(tenSachs[sach]);

			listSingle.add(model);
			listThreads.add(model);
		}
	}

	public Long SortSingle(List<SachModel> myList, String styleSort) {
		QuickSortSingle sort = new QuickSortSingle();
		Long start = System.currentTimeMillis();
		sort.sort(myList, styleSort);
		Long end = System.currentTimeMillis() - start;
		System.out.println("Single array sorted in " + end + " ms");
		return end;
	}
	
	public Long SortThreaded(int numberThreads,List<SachModel> myList, String styleSort) {
		QuickSortThreaded sort = new QuickSortThreaded();
		sort.a = myList;
		long time = 0l;
		try {
			time = sort.QuickSortThread(numberThreads, styleSort);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("Threads array sorted in " + time + " ms");
		return time;
	}

	public List<SachModel> search(SachModel item, List<SachModel> myArray){
		searchThreaded search = new searchThreaded(myArray, 8,item);
		search.init_Thread();
		search.Start_Thread();

		return search.searchArray;
	}
}
