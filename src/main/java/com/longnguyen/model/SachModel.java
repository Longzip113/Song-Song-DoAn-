package com.longnguyen.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SachModel {

    public String getMaPhieuMuon() {
        return maPhieuMuon;
    }

    public void setMaPhieuMuon(String maPhieuMuon) {
        this.maPhieuMuon = maPhieuMuon;
    }

    private String maPhieuMuon;

	public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    private String tenSach;

    public String getTenNguoiMuon() {
        return tenNguoiMuon;
    }

    public void setTenNguoiMuon(String tenNguoiMuon) {
        this.tenNguoiMuon = tenNguoiMuon;
    }

    private String tenNguoiMuon;

    public List<SachModel> getListResult() {
        return listResult;
    }

    public void setListResult(List<SachModel> listResult) {
        this.listResult = listResult;
    }

    private List<SachModel> listResult = new ArrayList<SachModel>();

    public String getThuatToan() {
        return thuatToan;
    }

    public void setThuatToan(String thuatToan) {
        this.thuatToan = thuatToan;
    }

    private String thuatToan;

    public Date getNgayMuon() {
        return ngayMuon;
    }

    private Date ngayMuon;

    public String getNgayMuonStr() {
        return ngayMuonStr;
    }

    public void setNgayMuonStr(String ngayMuonStr) {
        this.ngayMuonStr = ngayMuonStr;
    }

    private String ngayMuonStr;

    public void setNgayMuon( Date ngayMuon) {
        this.ngayMuon = ngayMuon;
    }


    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    private String moTa;

}
