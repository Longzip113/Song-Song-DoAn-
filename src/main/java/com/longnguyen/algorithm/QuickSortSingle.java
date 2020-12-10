package com.longnguyen.algorithm;

import java.util.ArrayList;
import java.util.List;

import com.longnguyen.model.SachModel;

public class QuickSortSingle {

	public List<SachModel> a;
	public long time;

	public QuickSortSingle() {
		a = new ArrayList<>();
	}

	public void sort(List<SachModel> inArr, String styleSort) {
		if (inArr == null || inArr.size() == 0) {
			return;
		}
		int length = inArr.size();
		if (styleSort.equals("nameBook")) {
			quickSortNameBook(0, length - 1, inArr);
		} else if (styleSort.equals("day")){
			quickSortDay(0, length - 1, inArr);
		} else if (styleSort.equals("code")){
			quickSortCode(0, length - 1, inArr);
		} else if (styleSort.equals("number")){
			quickSortNumber(0, length - 1, inArr);
		} else {
			quickSort(0, length - 1, inArr);
		}
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

//   namebook sort
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
//    end sort name book

//   day sort
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
//    end sort day book

//   code sort
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
//    end sort code book

//   Number sort
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
//    end sort number book

	public void swap(int i, int j, List<SachModel> inArr) {
		SachModel temp = inArr.get(i);
		inArr.set(i, inArr.get(j));
		inArr.set(j, temp);
	}

}
