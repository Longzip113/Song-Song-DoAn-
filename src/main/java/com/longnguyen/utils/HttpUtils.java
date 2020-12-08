package com.longnguyen.utils;

import java.io.BufferedReader;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtils {
	private String value;

    public HttpUtils(String value) {
        this.value = value;
    };

    //Chuyển file json thành  String
    public static HttpUtils of(BufferedReader bufferedReader) {

        StringBuilder sb = new StringBuilder();
        try {
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                sb.append(line);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return new HttpUtils(sb.toString());
    }

    public <T> T toModel(Class<T> tClass) {
        try {
            return new ObjectMapper().readValue(value, tClass);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
