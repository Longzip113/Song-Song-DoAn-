package com.longnguyen.algorithm;

import com.longnguyen.model.SachModel;

import java.util.ArrayList;
import java.util.List;

public class searchThreaded{
	private List<SachModel> myArray;
	public List<SachModel> searchArray;
	private int numberThread;
	private SachModel key;

	public searchThreaded(List<SachModel> myArray, int numberThread, SachModel key) {
		this.myArray = myArray;
		this.searchArray = new ArrayList<>();
		this.key = key;
		this.numberThread = numberThread;
	}

	public class linearSearch_Thread extends Thread{
		public int startIndex, endIndex;
		@Override
		public void run() {
			for(int i = startIndex; i<=endIndex; i++) {
				if(myArray.get(i).getTenNguoiMuon().equals(key.getTenNguoiMuon())) {
					searchArray.add(myArray.get(i));
				}
			}
		}
	}
	private List<linearSearch_Thread> list_Search = new ArrayList<>();

	public void init_Thread() {
		int soPhanTu = (myArray.size() - 1) / numberThread;
		for (int i = 0; i < numberThread; i++) {
			linearSearch_Thread item = new linearSearch_Thread();
			item.startIndex = i * soPhanTu;
			if (i == numberThread - 1) {
				item.endIndex = (myArray.size() - 1);
			} else {
				item.endIndex = (item.startIndex + soPhanTu) - 1;
			}
			list_Search.add(item);
		}
	}

	public void Start_Thread() {
		for (linearSearch_Thread item : list_Search) {
			item.start();
		}
	}

}
