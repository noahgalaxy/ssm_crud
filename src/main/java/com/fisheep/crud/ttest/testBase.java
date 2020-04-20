package com.fisheep.crud.ttest;

import org.junit.Test;

public class testBase {
    private String[] genders = {"M","F"};
    @Test
    public void test() {
        for(int i=0;i<10;i++){
//            int dId = (int) (Math.random()*2+1);
//            System.out.println(dId);
            String gender = genders[(int)(Math.random()*2)];
            System.out.println(gender);
//            System.out.println((int)(Math.random()*2));

        }
    }
}
