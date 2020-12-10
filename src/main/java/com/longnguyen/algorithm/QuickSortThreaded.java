package com.longnguyen.algorithm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.functors.IfClosure;

import com.longnguyen.model.SachModel;

import javax.jnlp.DownloadService;

public class QuickSortThreaded {
	public List<SachModel> a;
	public Double time;

	public QuickSortThreaded() {
		a = new ArrayList<>();
	}

	public void sort(List<SachModel> inArr) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		quickSort(0, length - 1, inArr);
	}

	public void quickSort(int lower, int higher, List<SachModel> inArr) {
		int i = lower;
		int j = higher;
		SachModel pivot = inArr.get(lower + (higher - lower) / 2);
		while (i <= j) {
			while (inArr.get(i).getTenNguoiMuon().compareTo(pivot.getTenNguoiMuon()) < 0) {
				i++;
			}
			while (inArr.get(j).getTenNguoiMuon().compareTo(pivot.getTenNguoiMuon()) > 0) {
				j--;
			}
			if (i <= j) {
				swap(i, j, inArr);
				i++;
				j--;
			}
		}

		if (lower < j)
			quickSort(lower, j, inArr);
		if (i < higher)
			quickSort(i, higher, inArr);
	}

//    sort nameBook
	public void sortNameBook(List<SachModel> inArr) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		quickSortNameBook(0, length - 1, inArr);
	}

	public void quickSortNameBook(int lower, int higher, List<SachModel> inArr) {
		int i = lower;
		int j = higher;
		SachModel pivot = inArr.get(lower + (higher - lower) / 2);
		while (i <= j) {
			while (inArr.get(i).getTenSach().compareTo(pivot.getTenSach()) < 0) {
				i++;
			}
			while (inArr.get(j).getTenSach().compareTo(pivot.getTenSach()) > 0) {
				j--;
			}
			if (i <= j) {
				swap(i, j, inArr);
				i++;
				j--;
			}
		}

		if (lower < j)
			quickSortNameBook(lower, j, inArr);
		if (i < higher)
			quickSortNameBook(i, higher, inArr);
	}
// end sort namebook


//    sort days
	public void sortDay(List<SachModel> inArr) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		quickSortDay(0, length - 1, inArr);
	}

	public void quickSortDay(int lower, int higher, List<SachModel> inArr) {
		int i = lower;
		int j = higher;
		SachModel pivot = inArr.get(lower + (higher - lower) / 2);
		while (i <= j) {
			while (inArr.get(i).getNgayMuon().compareTo(pivot.getNgayMuon()) < 0) {
				i++;
			}
			while (inArr.get(j).getNgayMuon().compareTo(pivot.getNgayMuon()) > 0) {
				j--;
			}
			if (i <= j) {
				swap(i, j, inArr);
				i++;
				j--;
			}
		}

		if (lower < j)
			quickSortDay(lower, j, inArr);
		if (i < higher)
			quickSortDay(i, higher, inArr);
	}
// end sort days

//    sort code
	public void sortCode(List<SachModel> inArr) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		quickSortCode(0, length - 1, inArr);
	}

	public void quickSortCode(int lower, int higher, List<SachModel> inArr) {
		int i = lower;
		int j = higher;
		SachModel pivot = inArr.get(lower + (higher - lower) / 2);
		while (i <= j) {
			while (inArr.get(i).getMaPhieuMuon().compareTo(pivot.getMaPhieuMuon()) < 0) {
				i++;
			}
			while (inArr.get(j).getMaPhieuMuon().compareTo(pivot.getMaPhieuMuon()) > 0) {
				j--;
			}
			if (i <= j) {
				swap(i, j, inArr);
				i++;
				j--;
			}
		}

		if (lower < j)
			quickSortCode(lower, j, inArr);
		if (i < higher)
			quickSortCode(i, higher, inArr);
	}
// end sort code


//    sort number
	public void sortNumber(List<SachModel> inArr) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		quickSortNumber(0, length - 1, inArr);
	}

	public void quickSortNumber(int lower, int higher, List<SachModel> inArr) {
		int i = lower;
		int j = higher;
		SachModel pivot = inArr.get(lower + (higher - lower) / 2);
		while (i <= j) {
			while (inArr.get(i).getSoNgayMuon() < pivot.getSoNgayMuon()) {
				i++;
			}
			while (inArr.get(j).getSoNgayMuon() > pivot.getSoNgayMuon()) {
				j--;
			}
			if (i <= j) {
				swap(i, j, inArr);
				i++;
				j--;
			}
		}

		if (lower < j)
			quickSortNumber(lower, j, inArr);
		if (i < higher)
			quickSortNumber(i, higher, inArr);
	}
// end sort number

	public void swap(int i, int j, List<SachModel> inArr) {
		SachModel temp = inArr.get(i);
		inArr.set(i, inArr.get(j));
		inArr.set(j, temp);
	}

	public class Thread_List extends Thread {
		public int bienDau = 0;
		public int bienCuoi = 0;
		private String styleSort = "";

		public Thread_List(String styleSort) {
			this.styleSort = styleSort;
		}

		@Override
		public void run() {
			if (styleSort.equals("nameBook")) {
				quickSortNameBook(bienDau, bienCuoi, a);
			} else if (styleSort.equals("day")){
				quickSortDay(bienDau, bienCuoi, a);
			} else if (styleSort.equals("code")){
				quickSortCode(bienDau, bienCuoi, a);
			} else if (styleSort.equals("number")){
				quickSortNumber(bienDau, bienCuoi, a);
			} else {
				quickSort(bienDau, bienCuoi, a);
			}
		}
	}

	private List<Thread_List> Threads = new ArrayList<>();

	public void init_Thread(int numberThread, String styleSort) {
		int soPhanTu = (a.size() - 1) / numberThread;
		for (int i = 0; i < numberThread; i++) {
			Thread_List item = new Thread_List(styleSort);
			item.bienDau = i * soPhanTu;

			if (i == numberThread - 1) {
				item.bienCuoi = (a.size() - 1);
			} else {
				item.bienCuoi = (item.bienDau + soPhanTu) - 1;
			}
			Threads.add(item);
		}
	}

	public void Start_Thread() {
		for (Thread_List item : Threads) {
			item.start();
		}
	}

	public void Join_Thread() {
		for (Thread_List item : Threads) {
			try {
				item.join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	public double QuickSortThread(int numberThread, String styleSort) throws InterruptedException {

		init_Thread(numberThread, styleSort);
		Start_Thread();
		Join_Thread();

		double time1 = 0, time2 = 0;
		if (styleSort.equals("nameBook")) {
			time1 = System.nanoTime()/1000000;
			sortNameBook(a);
			time2 = System.nanoTime()/1000000;
		} else if(styleSort.equals("day")){
			time1 = System.nanoTime()/1000000;
			sortDay(a);
			time2 = System.nanoTime()/1000000;
		} else if(styleSort.equals("code")){
			time1 = System.nanoTime()/1000000;
			sortCode(a);
			time2 = System.nanoTime()/1000000;
		} else if(styleSort.equals("number")){
			time1 = System.nanoTime()/1000000;
			sortNumber(a);
			time2 = System.nanoTime()/1000000;
		} else {
			time1 = System.nanoTime()/1000000;
			sort(a);
			time2 = System.nanoTime()/1000000;
		}

		return time2 - time1;
	}
}
