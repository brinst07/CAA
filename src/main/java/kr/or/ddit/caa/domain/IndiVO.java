package kr.or.ddit.caa.domain;

import lombok.Data;

@Data
public class IndiVO {
    private String indi_year;
    private String indi_bugi;
    private String indi_sigungu;
    private String indi_sigungu_name;
    private String indi_change;
    private String indi_change_name;
    private int indi_sale_avg;
    private int indi_clos_avg;
    private int indi_seo_sale_avg;
    private int indi_seo_clos_avg;
}
