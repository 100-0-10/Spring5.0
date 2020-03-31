package com.freeflux.encode;

import java.io.UnsupportedEncodingException;

public class ChangeEncoding {
  // java => mySQL에 저장
  public static String toLatin(String str){
       try{
            byte[] b=str.getBytes();
            return new String(b, "ISO-8859-1");   
       }catch(UnsupportedEncodingException uee){
            System.out.println("Encoding ERR : toLatin() " +uee.getMessage());
            return null;
       }
  }
  
 // mySQL => Java로 읽기
  public static String toUnicode(String str){
       try{
            byte[] b=str.getBytes("ISO-8859-1");
            return new String(b);   
       }catch(UnsupportedEncodingException uee){
        System.out.println("Encoding ERR : toUnicode()" +uee.getMessage());
            return null;
      }
  }
}
