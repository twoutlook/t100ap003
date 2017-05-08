#該程式未解開Section, 採用最新樣板產出!
{<section id="astt340.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0025(2016-06-24 16:26:47), PR版次:0025(2017-02-20 14:59:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000156
#+ Filename...: astt340
#+ Description: 供應商結算單維護作業
#+ Creator....: 03247(2014-11-21 10:18:06)
#+ Modifier...: 08172 -SD/PR- 09042
 
{</section>}
 
{<section id="astt340.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#34   2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#+ Modifier...:   No.160511-00009#1    2016/05/16 BY pengxin  维护时状态时动作与状态匹配，应更明确。
#160523-00009#1   2016/5/25  by 08172  经营方式scc显示修改
#160604-00009#92 2016/0623 by 08172   新增参数判断是否抛转财务单据
#+ Modifier...:   No.160728-00033#1    2016/08/10 by 08172  BPM审核修改
#  Modify.....:   NO.160816-00068#16   2016/08/19 By 08209    調整transaction
#160818-00017#39  2016-08-24 By 08734  删除修改未重新判断状态码
#160824-00007#182 2016/11/13   By 06137   修正舊值備份寫法
#161111-00028#5   2016/11/22   by 02481  标准程式定义采用宣告模式,弃用.*写法
#170122-00004#2   2017/01/22   by geza    调整系统中无ENT的SQL条件增加ent
#170207-00018#9   2016/02/13   By 09042   ROWNUM整批调整
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_stbd_m        RECORD
       stbdsite LIKE stbd_t.stbdsite, 
   stbdsite_desc LIKE type_t.chr80, 
   stbddocdt LIKE stbd_t.stbddocdt, 
   stbddocno LIKE stbd_t.stbddocno, 
   stbd048 LIKE stbd_t.stbd048, 
   stbd048_desc LIKE type_t.chr80, 
   stbd000 LIKE stbd_t.stbd000, 
   stbd037 LIKE stbd_t.stbd037, 
   stbd037_desc LIKE type_t.chr80, 
   stbd002 LIKE stbd_t.stbd002, 
   stbd002_desc LIKE type_t.chr80, 
   stbd001 LIKE stbd_t.stbd001, 
   stbd041 LIKE stbd_t.stbd041, 
   stbd003 LIKE stbd_t.stbd003, 
   stbdunit LIKE stbd_t.stbdunit, 
   stbdunit_desc LIKE type_t.chr80, 
   stbd039 LIKE stbd_t.stbd039, 
   stbd043 LIKE stbd_t.stbd043, 
   stbd044 LIKE stbd_t.stbd044, 
   stbd004 LIKE stbd_t.stbd004, 
   stax004 LIKE stax_t.stax004, 
   stbd005 LIKE stbd_t.stbd005, 
   stbd006 LIKE stbd_t.stbd006, 
   stbd038 LIKE stbd_t.stbd038, 
   stbdstus LIKE stbd_t.stbdstus, 
   stbdownid LIKE stbd_t.stbdownid, 
   stbdownid_desc LIKE type_t.chr80, 
   stbdowndp LIKE stbd_t.stbdowndp, 
   stbdowndp_desc LIKE type_t.chr80, 
   stbdcrtid LIKE stbd_t.stbdcrtid, 
   stbdcrtid_desc LIKE type_t.chr80, 
   stbdcrtdp LIKE stbd_t.stbdcrtdp, 
   stbdcrtdp_desc LIKE type_t.chr80, 
   stbdcrtdt LIKE stbd_t.stbdcrtdt, 
   stbdmodid LIKE stbd_t.stbdmodid, 
   stbdmodid_desc LIKE type_t.chr80, 
   stbdmoddt LIKE stbd_t.stbdmoddt, 
   stbdcnfid LIKE stbd_t.stbdcnfid, 
   stbdcnfid_desc LIKE type_t.chr80, 
   stbdcnfdt LIKE stbd_t.stbdcnfdt, 
   stbd007 LIKE stbd_t.stbd007, 
   stbd008 LIKE stbd_t.stbd008, 
   stbd009 LIKE stbd_t.stbd009, 
   stbd010 LIKE stbd_t.stbd010, 
   stbd011 LIKE stbd_t.stbd011, 
   stbd045 LIKE stbd_t.stbd045, 
   stbd012 LIKE stbd_t.stbd012, 
   stbd013 LIKE stbd_t.stbd013, 
   stbd014 LIKE stbd_t.stbd014, 
   stbd015 LIKE stbd_t.stbd015, 
   stbd040 LIKE stbd_t.stbd040, 
   stbd016 LIKE stbd_t.stbd016, 
   stbd017 LIKE stbd_t.stbd017, 
   stbd018 LIKE stbd_t.stbd018, 
   stbd019 LIKE stbd_t.stbd019, 
   stbd020 LIKE stbd_t.stbd020, 
   stbd042 LIKE stbd_t.stbd042, 
   stbd021 LIKE stbd_t.stbd021, 
   stbd021_desc LIKE type_t.chr80, 
   stbd022 LIKE stbd_t.stbd022, 
   stbd022_desc LIKE type_t.chr80, 
   stbd023 LIKE stbd_t.stbd023, 
   stbd023_desc LIKE type_t.chr80, 
   stbd024 LIKE stbd_t.stbd024, 
   stbd025 LIKE stbd_t.stbd025, 
   stbd026 LIKE stbd_t.stbd026, 
   stbd046 LIKE stbd_t.stbd046, 
   stbd046_desc LIKE type_t.chr80, 
   stbd033 LIKE stbd_t.stbd033, 
   stbd027 LIKE stbd_t.stbd027, 
   stbd028 LIKE stbd_t.stbd028, 
   stbd029 LIKE stbd_t.stbd029, 
   stbd030 LIKE stbd_t.stbd030, 
   stbd030_desc LIKE type_t.chr80, 
   stbd031 LIKE stbd_t.stbd031, 
   stbd032 LIKE stbd_t.stbd032
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stbe_d        RECORD
       stbeseq LIKE stbe_t.stbeseq, 
   stbe001 LIKE stbe_t.stbe001, 
   stbe002 LIKE stbe_t.stbe002, 
   stbe003 LIKE stbe_t.stbe003, 
   stbe004 LIKE stbe_t.stbe004, 
   stbe028 LIKE stbe_t.stbe028, 
   stbe028_desc LIKE type_t.chr500, 
   stbe005 LIKE stbe_t.stbe005, 
   stbe005_desc LIKE type_t.chr500, 
   stbe024 LIKE stbe_t.stbe024, 
   stbe025 LIKE stbe_t.stbe025, 
   stae003 LIKE type_t.chr10, 
   stbe006 LIKE stbe_t.stbe006, 
   stbe007 LIKE stbe_t.stbe007, 
   stbe008 LIKE stbe_t.stbe008, 
   stbe008_desc LIKE type_t.chr500, 
   stbe009 LIKE stbe_t.stbe009, 
   stbe009_desc LIKE type_t.chr500, 
   stbe010 LIKE stbe_t.stbe010, 
   stbe011 LIKE stbe_t.stbe011, 
   stbe012 LIKE stbe_t.stbe012, 
   stbe013 LIKE stbe_t.stbe013, 
   stbe014 LIKE stbe_t.stbe014, 
   stbe015 LIKE stbe_t.stbe015, 
   stbe016 LIKE stbe_t.stbe016, 
   stbe026 LIKE stbe_t.stbe026, 
   stbe027 LIKE stbe_t.stbe027, 
   stbe017 LIKE stbe_t.stbe017, 
   stbe018 LIKE stbe_t.stbe018, 
   stbe033 LIKE stbe_t.stbe033, 
   stbe031 LIKE stbe_t.stbe031, 
   stbesite LIKE stbe_t.stbesite, 
   stbe020 LIKE stbe_t.stbe020, 
   stbe019 LIKE stbe_t.stbe019, 
   stbe032 LIKE stbe_t.stbe032, 
   stbecomp LIKE stbe_t.stbecomp
       END RECORD
PRIVATE TYPE type_g_stbe3_d RECORD
       stbfseq LIKE type_t.num10, 
   stbf001 LIKE type_t.chr20, 
   stbf002 LIKE type_t.chr20, 
   stbf003 LIKE type_t.dat, 
   stbf004 LIKE type_t.chr10, 
   stbf004_desc LIKE type_t.chr500, 
   stbf005 LIKE type_t.num26_10, 
   stbf006 LIKE type_t.num20_6, 
   stbf007 LIKE type_t.num20_6, 
   stbf008 LIKE type_t.num20_6
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stbdsite LIKE stbd_t.stbdsite,
   b_stbdsite_desc LIKE type_t.chr80,
      b_stbddocno LIKE stbd_t.stbddocno,
      b_stbddocdt LIKE stbd_t.stbddocdt,
      b_stbd001 LIKE stbd_t.stbd001,
   b_stbd001_desc LIKE type_t.chr80,
      b_stbd002 LIKE stbd_t.stbd002,
   b_stbd002_desc LIKE type_t.chr80,
      b_stbd003 LIKE stbd_t.stbd003,
      b_stbd004 LIKE stbd_t.stbd004,
      b_stbd005 LIKE stbd_t.stbd005,
      b_stbd006 LIKE stbd_t.stbd006
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_stbe_d_2  DYNAMIC ARRAY OF  RECORD
   stbeseq_1 LIKE stbe_t.stbeseq, 
   stbe001_1 LIKE stbe_t.stbe001, 
   stbe002_1 LIKE stbe_t.stbe002, 
   stbe003_1 LIKE stbe_t.stbe003, 
   stbe004_1 LIKE stbe_t.stbe004, 
   stbe028_1 LIKE stbe_t.stbe028,
   stbe028_1_desc LIKE type_t.chr500,
   stbe005_1 LIKE stbe_t.stbe005, 
   stbe005_1_desc LIKE type_t.chr500,
   stbe024_1 LIKE stbe_t.stbe024, 
   stbe025_1 LIKE stbe_t.stbe025,    
   stae003_1 LIKE type_t.chr10, 
   stbe006_1 LIKE stbe_t.stbe006, 
   stbe007_1 LIKE stbe_t.stbe007, 
   stbe008_1 LIKE stbe_t.stbe008, 
   stbe008_1_desc LIKE type_t.chr500, 
   stbe009_1 LIKE stbe_t.stbe009, 
   stbe009_1_desc LIKE type_t.chr500, 
   stbe010_1 LIKE stbe_t.stbe010, 
   stbe011_1 LIKE stbe_t.stbe011, 
   stbe012_1 LIKE stbe_t.stbe012, 
   stbe013_1 LIKE stbe_t.stbe013, 
   stbe014_1 LIKE stbe_t.stbe014, 
   stbe015_1 LIKE stbe_t.stbe015, 
   stbe016_1 LIKE stbe_t.stbe016,
   stbe026_1 LIKE stbe_t.stbe026, 
   stbe027_1 LIKE stbe_t.stbe027,   
   stbe017_1 LIKE stbe_t.stbe017, 
   stbe018_1 LIKE stbe_t.stbe018,
   stbe031_1 LIKE stbe_t.stbe031,   
   stbesite_1 LIKE stbe_t.stbesite, 
   stbe020_1 LIKE stbe_t.stbe020, 
   stbe019_1 LIKE stbe_t.stbe019,
   stbe032_1 LIKE stbe_t.stbe032,   
   stbecomp_1 LIKE stbe_t.stbecomp
   
       END RECORD

DEFINE g_stbe_d_2_t RECORD
   stbeseq_1 LIKE stbe_t.stbeseq, 
   stbe001_1 LIKE stbe_t.stbe001, 
   stbe002_1 LIKE stbe_t.stbe002, 
   stbe003_1 LIKE stbe_t.stbe003, 
   stbe004_1 LIKE stbe_t.stbe004, 
   stbe028_1 LIKE stbe_t.stbe028,
   stbe028_1_desc LIKE type_t.chr500,
   stbe005_1 LIKE stbe_t.stbe005, 
   stbe005_1_desc LIKE type_t.chr500,
   stbe024_1 LIKE stbe_t.stbe024, 
   stbe025_1 LIKE stbe_t.stbe025,       
   stae003_1 LIKE type_t.chr10, 
   stbe006_1 LIKE stbe_t.stbe006, 
   stbe007_1 LIKE stbe_t.stbe007, 
   stbe008_1 LIKE stbe_t.stbe008, 
   stbe008_1_desc LIKE type_t.chr500, 
   stbe009_1 LIKE stbe_t.stbe009, 
   stbe009_1_desc LIKE type_t.chr500, 
   stbe010_1 LIKE stbe_t.stbe010, 
   stbe011_1 LIKE stbe_t.stbe011, 
   stbe012_1 LIKE stbe_t.stbe012, 
   stbe013_1 LIKE stbe_t.stbe013, 
   stbe014_1 LIKE stbe_t.stbe014, 
   stbe015_1 LIKE stbe_t.stbe015, 
   stbe016_1 LIKE stbe_t.stbe016,
   stbe026_1 LIKE stbe_t.stbe026, 
   stbe027_1 LIKE stbe_t.stbe027,    
   stbe017_1 LIKE stbe_t.stbe017, 
   stbe018_1 LIKE stbe_t.stbe018,
   stbe031_1 LIKE stbe_t.stbe031,   
   stbesite_1 LIKE stbe_t.stbesite, 
   stbe020_1 LIKE stbe_t.stbe020, 
   stbe019_1 LIKE stbe_t.stbe019, 
   stbe032_1 LIKE stbe_t.stbe032,
   stbecomp_1 LIKE stbe_t.stbecomp
       END RECORD
#add  by geza 20150603  (S) 
TYPE type_g_stev_d RECORD
   stevdocno LIKE stev_t.stevdocno,
   stevseq LIKE stev_t.stevseq, 
   stev001 LIKE stev_t.stev001, 
   stev002 LIKE stev_t.stev002, 
   stev003 LIKE stev_t.stev003,    #add by geza 20151119
   stev004 LIKE stev_t.stev004, 
   stev024 LIKE stev_t.stev024, 
   stev024_desc LIKE type_t.chr500, 
   stev005 LIKE stev_t.stev005, 
   stev005_desc LIKE type_t.chr500, 
   stev026 LIKE stev_t.stev026,    #add by geza 20151119
   stev027 LIKE stev_t.stev027,    #add by geza 20151119
   stae003_1 LIKE type_t.chr10, 
   stev006 LIKE stev_t.stev006, 
   stev007 LIKE stev_t.stev007, 
   stev008 LIKE stev_t.stev008, 
   stev008_desc LIKE type_t.chr500, 
   stev009 LIKE stev_t.stev009, 
   stev009_desc LIKE type_t.chr500, 
   stev010 LIKE stev_t.stev010, 
   stev011 LIKE stev_t.stev011, 
   stev012 LIKE stev_t.stev012, 
   stev013 LIKE stev_t.stev013, 
   stev014 LIKE stev_t.stev014, 
   stev015 LIKE stev_t.stev015, 
   stev016 LIKE stev_t.stev016, 
   stev028 LIKE stev_t.stev028,   #add by geza 20151119
   stev029 LIKE stev_t.stev029,   #add by geza 20151119
   stev017 LIKE stev_t.stev017, 
   stev018 LIKE stev_t.stev018, 
   stevsite LIKE stev_t.stevsite, 
   stev020 LIKE stev_t.stev020, 
   stev019 LIKE stev_t.stev019,
   stev030 LIKE stev_t.stev030    #add by geza 20151119
       END RECORD  
DEFINE g_stev_d          DYNAMIC ARRAY OF type_g_stev_d
DEFINE g_stev_d_t        type_g_stev_d           
#add  by geza 20150603  (E)        
DEFINE g_action      LIKE type_t.chr1      #是否点击按钮  #150505-00016#1--add by dongsz
DEFINE g_type                LIKE type_t.chr1   #'1'時代表是 astt340 '2'時代表是 astt540
DEFINE g_wc2_table3          STRING        #單身CONSTRUCT結果
 TYPE type_g_stbe5_d RECORD
       stbe001_2 LIKE stbe_t.stbe001, 
   stbe002_2 LIKE stbe_t.stbe002, 
   stbe004_2 LIKE stbe_t.stbe004, 
   stbe012_2 LIKE stbe_t.stbe012, 
   stbe013_2 LIKE stbe_t.stbe013, 
   stbe014_2 LIKE stbe_t.stbe014, 
   stbe015_2 LIKE stbe_t.stbe015, 
   stbe016_2 LIKE stbe_t.stbe016
       END RECORD
DEFINE g_stbe5_d          DYNAMIC ARRAY OF type_g_stbe5_d
DEFINE g_stbe5_d_t        type_g_stbe5_d  
#add by geza 20150801(S)
 TYPE type_g_stbe6_d RECORD
   stbpdocno LIKE stbp_t.stbpdocno, 
   stbpseq LIKE stbp_t.stbpseq, 
   stbp001 LIKE stbp_t.stbp001, 
   stbp002 LIKE stbp_t.stbp002, 
   stbp003 LIKE stbp_t.stbp003, 
   stbp004 LIKE stbp_t.stbp004, 
   stbp005 LIKE stbp_t.stbp005, 
   stbp006 LIKE stbp_t.stbp006, 
   stbp007 LIKE stbp_t.stbp007, 
   stbp008 LIKE stbp_t.stbp008, 
   stbp009 LIKE stbp_t.stbp009
       END RECORD

DEFINE g_stbe6_d          DYNAMIC ARRAY OF type_g_stbe6_d
DEFINE g_stbe6_d_t        type_g_stbe6_d
DEFINE g_stbe6_d_o        type_g_stbe6_d      
#add by geza 20150801(E)
DEFINE g_wc3          STRING        #add by geza 20151119
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stbd_m          type_g_stbd_m
DEFINE g_stbd_m_t        type_g_stbd_m
DEFINE g_stbd_m_o        type_g_stbd_m
DEFINE g_stbd_m_mask_o   type_g_stbd_m #轉換遮罩前資料
DEFINE g_stbd_m_mask_n   type_g_stbd_m #轉換遮罩後資料
 
   DEFINE g_stbddocno_t LIKE stbd_t.stbddocno
 
 
DEFINE g_stbe_d          DYNAMIC ARRAY OF type_g_stbe_d
DEFINE g_stbe_d_t        type_g_stbe_d
DEFINE g_stbe_d_o        type_g_stbe_d
DEFINE g_stbe_d_mask_o   DYNAMIC ARRAY OF type_g_stbe_d #轉換遮罩前資料
DEFINE g_stbe_d_mask_n   DYNAMIC ARRAY OF type_g_stbe_d #轉換遮罩後資料
DEFINE g_stbe3_d          DYNAMIC ARRAY OF type_g_stbe3_d
DEFINE g_stbe3_d_t        type_g_stbe3_d
DEFINE g_stbe3_d_o        type_g_stbe3_d
DEFINE g_stbe3_d_mask_o   DYNAMIC ARRAY OF type_g_stbe3_d #轉換遮罩前資料
DEFINE g_stbe3_d_mask_n   DYNAMIC ARRAY OF type_g_stbe3_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"
DEFINE g_site_flag      LIKE type_t.num5
#end add-point
 
{</section>}
 
{<section id="astt340.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5 
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   IF NOT cl_null(g_argv[1]) THEN
      LET g_type = g_argv[1]
   END IF
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT stbdsite,'',stbddocdt,stbddocno,stbd048,'',stbd000,stbd037,'',stbd002, 
       '',stbd001,stbd041,stbd003,stbdunit,'',stbd039,stbd043,stbd044,stbd004,'',stbd005,stbd006,stbd038, 
       stbdstus,stbdownid,'',stbdowndp,'',stbdcrtid,'',stbdcrtdp,'',stbdcrtdt,stbdmodid,'',stbdmoddt, 
       stbdcnfid,'',stbdcnfdt,stbd007,stbd008,stbd009,stbd010,stbd011,stbd045,stbd012,stbd013,stbd014, 
       stbd015,stbd040,stbd016,stbd017,stbd018,stbd019,stbd020,stbd042,stbd021,'',stbd022,'',stbd023, 
       '',stbd024,stbd025,stbd026,stbd046,'',stbd033,stbd027,stbd028,stbd029,stbd030,'',stbd031,stbd032", 
        
                      " FROM stbd_t",
                      " WHERE stbdent= ? AND stbddocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt340_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stbdsite,t0.stbddocdt,t0.stbddocno,t0.stbd048,t0.stbd000,t0.stbd037, 
       t0.stbd002,t0.stbd001,t0.stbd041,t0.stbd003,t0.stbdunit,t0.stbd039,t0.stbd043,t0.stbd044,t0.stbd004, 
       t0.stbd005,t0.stbd006,t0.stbd038,t0.stbdstus,t0.stbdownid,t0.stbdowndp,t0.stbdcrtid,t0.stbdcrtdp, 
       t0.stbdcrtdt,t0.stbdmodid,t0.stbdmoddt,t0.stbdcnfid,t0.stbdcnfdt,t0.stbd007,t0.stbd008,t0.stbd009, 
       t0.stbd010,t0.stbd011,t0.stbd045,t0.stbd012,t0.stbd013,t0.stbd014,t0.stbd015,t0.stbd040,t0.stbd016, 
       t0.stbd017,t0.stbd018,t0.stbd019,t0.stbd020,t0.stbd042,t0.stbd021,t0.stbd022,t0.stbd023,t0.stbd024, 
       t0.stbd025,t0.stbd026,t0.stbd046,t0.stbd033,t0.stbd027,t0.stbd028,t0.stbd029,t0.stbd030,t0.stbd031, 
       t0.stbd032,t1.ooefl003 ,t2.ooefl003 ,t3.mhael023 ,t4.pmaal004 ,t5.ooefl003 ,t6.ooag011 ,t7.ooefl003 , 
       t8.ooag011 ,t9.ooefl003 ,t10.ooag011 ,t11.ooag011 ,t12.ooag011 ,t13.ooefl003 ,t14.pmaal003 ,t15.ooag011", 
 
               " FROM stbd_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbd048 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN mhael_t t3 ON t3.mhaelent="||g_enterprise||" AND t3.mhael001=t0.stbd037 AND t3.mhael022='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.stbd002 AND t4.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.stbdunit AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stbdownid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stbdowndp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stbdcrtid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stbdcrtdp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stbdmodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stbdcnfid  ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stbd021  ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stbd022 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t14 ON t14.pmaalent="||g_enterprise||" AND t14.pmaal001=t0.stbd046 AND t14.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stbd030  ",
 
               " WHERE t0.stbdent = " ||g_enterprise|| " AND t0.stbddocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
     
   #end add-point
   PREPARE astt340_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt340 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt340_init()   
 
      #進入選單 Menu (="N")
      CALL astt340_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      CALL s_aooi500_drop_temp() RETURNING l_success 
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt340
      
   END IF 
   
   CLOSE astt340_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt340.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt340_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stbdstus','13','N,Y,A,D,R,W,J,X')
 
      CALL cl_set_combo_scc('stbd041','6785') 
   CALL cl_set_combo_scc('stbd003','6013') 
   CALL cl_set_combo_scc('stbd020','6705') 
   CALL cl_set_combo_scc('stbe001','6703') 
   CALL cl_set_combo_scc('stbe010','6006') 
   CALL cl_set_combo_scc('stbe033','6800') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stbd003','6013',"1,2,3")            #160523-00009#1   by 08172 
   CALL cl_set_combo_scc_part('b_stbd003','6013',"1,2,3")
   CALL cl_set_combo_scc('stbd020','6705')
  #CALL cl_set_combo_scc_part('stbe001','6703','1,2,4,5,8,9,10')     #mark by geza 20150714
   CALL cl_set_combo_scc_part('stbe001','6703','1,2,4,5,8,9,10,11')  #add by geza 20150714 加类型11 供应商往来调整
   CALL cl_set_combo_scc('stbe010','6006')
   CALL cl_set_combo_scc_part('stbe001_1','6703','3')
   CALL cl_set_combo_scc('stbe010_1','6006')
   CALL cl_set_combo_scc_part('stbe001_2','6703','1,2,4,5,8,9,10,11') #add by geza 20150714 加类型11 供应商往来调整
   CALL s_aooi500_create_temp() RETURNING l_success
   LET g_errshow = '1'      #150505-00016#1--add by dongsz
   LET g_action = 'N'       #150505-00016#1--add by dongsz
   CALL cl_set_combo_scc('stev001','6703') #add by geza 20150603
   CALL cl_set_combo_scc('stev010','6006') #add by geza 20150603  
   #add by geza 20150602(S)
   IF g_type='1' THEN
    #  CALL cl_set_comp_visible("stbd016",FALSE)
      CALL cl_set_comp_visible("stbd037",FALSE)
      CALL cl_set_comp_visible("stbd037_desc",FALSE)
      CALL cl_set_comp_visible("stbe028",FALSE)
      CALL cl_set_comp_visible("stbe028_desc",FALSE)
      CALL cl_set_comp_visible("stbe028_1",FALSE)
      CALL cl_set_comp_visible("stbe028_1_desc",FALSE)
      CALL cl_set_comp_visible("stev024",FALSE)
      CALL cl_set_comp_visible("stev024_desc",FALSE)
   ELSE
    #  CALL cl_set_comp_visible("stbd016",TRUE)
      CALL cl_set_comp_visible("stbd037",TRUE)
      CALL cl_set_comp_visible("stbd037_desc",TRUE)
      CALL cl_set_comp_visible("stev024",TRUE)
      CALL cl_set_comp_visible("stev024_desc",TRUE)      
   END IF 
   #add by geza 20150602(E)
   CALL cl_set_toolbaritem_visible("invoice_inf",FALSE)   #add by geza  150616-00035#5 
   CALL cl_set_combo_scc('stbp004','6854') #add by geza 20150802
   CALL cl_set_combo_scc('stbd041','6785') #add by geza 20150810
   #是否启用交款汇总单为N,隐藏结算调整按钮
   #add by geza 20151118(S)
   IF cl_get_para(g_enterprise,g_site,"S-CIR-2012") = 'N' THEN
      CALL cl_set_toolbaritem_visible("money_change", FALSE)
      CALL cl_set_comp_visible("stevdocno",FALSE) 
   END IF 
   #add by geza 20151118(E) 
   #end add-point
   
   #初始化搜尋條件
   CALL astt340_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt340.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt340_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_success LIKE type_t.num5 
   DEFINE p_wc      STRING
   DEFINE p_caldate LIKE stbd_t.stbd005
   DEFINE l_cnt     LIKE type_t.num10
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   #因應查詢方案進行處理
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL astt340_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_stbd_m.* TO NULL
         CALL g_stbe_d.clear()
         CALL g_stbe3_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt340_init()
      END IF
   
      CALL lib_cl_dlg.cl_dlg_before_display()
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE
         
               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF 
               
               CALL astt340_fetch('') # reload data
               LET l_ac = 1
               CALL astt340_ui_detailshow() #Setting the current row 
         
               CALL astt340_idx_chk()
               #NEXT FIELD stbeseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stbe_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt340_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL astt340_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stbe3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt340_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body3.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astt340_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body3.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_stbe_d_2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
               IF g_detail_idx > g_stbe_d_2.getLength() THEN
                  LET g_detail_idx = g_stbe_d_2.getLength()
               END IF
               IF g_detail_idx = 0 AND g_stbe_d_2.getLength() <> 0 THEN
                  LET g_detail_idx = 1
               END IF
               DISPLAY g_detail_idx TO FORMONLY.idx
               DISPLAY g_stbe_d_2.getLength() TO FORMONLY.cnt
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               

              
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
#               CALL astt340_idx_chk()
 
               
         END DISPLAY
         
         DISPLAY ARRAY g_stev_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
               IF g_detail_idx > g_stev_d.getLength() THEN
                  LET g_detail_idx = g_stev_d.getLength()
               END IF
               IF g_detail_idx = 0 AND g_stev_d.getLength() <> 0 THEN
                  LET g_detail_idx = 1
               END IF
               DISPLAY g_detail_idx TO FORMONLY.idx
               DISPLAY g_stev_d.getLength() TO FORMONLY.cnt
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               

              
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 4

 
               
         END DISPLAY
         
         DISPLAY ARRAY g_stbe5_d TO s_detail5.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail5")
               IF g_detail_idx > g_stbe5_d.getLength() THEN
                  LET g_detail_idx = g_stbe5_d.getLength()
               END IF
               IF g_detail_idx = 0 AND g_stbe5_d.getLength() <> 0 THEN
                  LET g_detail_idx = 1
               END IF
               DISPLAY g_detail_idx TO FORMONLY.idx
               DISPLAY g_stbe5_d.getLength() TO FORMONLY.cnt
               LET l_ac = DIALOG.getCurrentRow("s_detail5")
               LET g_detail_idx = l_ac
               

              
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail5")
               LET g_current_page = 5

 
               
         END DISPLAY
         #add by geza 20150802(S)
         DISPLAY ARRAY g_stbe6_d TO s_detail6.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail6")
               IF g_detail_idx > g_stbe6_d.getLength() THEN
                  LET g_detail_idx = g_stbe6_d.getLength()
               END IF
               IF g_detail_idx = 0 AND g_stbe6_d.getLength() <> 0 THEN
                  LET g_detail_idx = 1
               END IF
               DISPLAY g_detail_idx TO FORMONLY.idx
               DISPLAY g_stbe6_d.getLength() TO FORMONLY.cnt
               LET l_ac = DIALOG.getCurrentRow("s_detail6")
               LET g_detail_idx = l_ac
               

              
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail6")
               LET g_current_page = 6

 
               
         END DISPLAY
         #add by geza 20150802(E)
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt340_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL astt340_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt340_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt340_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt340_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt340_set_act_visible()   
            CALL astt340_set_act_no_visible()
            IF NOT (g_stbd_m.stbddocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stbdent = " ||g_enterprise|| " AND",
                                  " stbddocno = '", g_stbd_m.stbddocno, "' "
 
               #填到對應位置
               CALL astt340_browser_fill("")
            END IF
         #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stbd_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbe_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbf_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL astt340_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stbd_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbe_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbf_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt340_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt340_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()
          
         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL astt340_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt340_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt340_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt340_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt340_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt340_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt340_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt340_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt340_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt340_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt340_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #browser
               CALL g_export_node.clear()
               IF g_main_hidden = 1 THEN
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               #非browser
               ELSE
                  LET g_export_node[1] = base.typeInfo.create(g_stbe_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stbe3_d)
                  LET g_export_id[2]   = "s_detail3"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  LET g_export_node[3] = base.typeInfo.create(g_stbe_d_2)
                  LET g_export_id[3]   = "s_detail2"  
                  LET g_export_node[4] = base.typeInfo.create(g_stev_d)
                  LET g_export_id[4]   = "s_detail4"                   
                  #END add-point
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         #主頁摺疊
         ON ACTION mainhidden       
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
               CALL cl_notice()
            END IF
            
         #瀏覽頁折疊
         ON ACTION worksheethidden   
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD stbeseq
            END IF
       
         #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
         ON ACTION controls     
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert_stbe
            LET g_action_choice="insert_stbe"
            IF cl_auth_chk_act("insert_stbe") THEN
               
               #add-point:ON ACTION insert_stbe name="menu.insert_stbe"
                IF NOT cl_null(g_stbd_m.stbddocno) THEN
                  IF g_stbd_m.stbdstus  = 'N' THEN
                     CALL astt340_01(g_stbd_m.stbddocno)
                     CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success #By shi Add 20150710
                     CALL astt340_stbd_show() #By shi Add 20150710
                     CALL astt340_b_fill()    #By shi Add 20150709
                  ELSE   
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "art-00608" 
                     LET g_errparam.popup  = FALSE 
                     CALL cl_err()
                     CONTINUE DIALOG 
                  END IF
               ELSE
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "std-00003" 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  CONTINUE DIALOG             
               END IF
               CALL astt340_b_fill()
               CALL astt340_stbe2_fill2()
               CALL astt340_stbe3_fill()
               CALL astt340_stbe4_fill()   #add by geza 20150802
               IF g_stbd_m.stbdstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
                  CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
                  CALL cl_set_act_visible("insert", TRUE)
               ELSE
                  CALL cl_set_act_visible("insert,modify,delete,modify_detail", TRUE)                
               END IF              
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt340_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt340_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION invoice_inf
            LET g_action_choice="invoice_inf"
            IF cl_auth_chk_act("invoice_inf") THEN
               
               #add-point:ON ACTION invoice_inf name="menu.invoice_inf"
               #150505-00016#1--add by dongsz--str---
               IF g_stbd_m.stbdstus <> 'N' THEN
                  CONTINUE DIALOG
               END IF
               LET g_aw = "s_detail3"
               LET g_action = 'Y'
               CALL astt340_modify()
               LET g_action = 'N'
               #150505-00016#1--add by dongsz--end---
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt340_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt340_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET g_rep_wc = " stbdent ="|| g_enterprise ||" AND stbddocno ='"|| g_stbd_m.stbddocno||"'"   
               #END add-point
               &include "erp/ast/astt340_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET g_rep_wc = " stbdent ="|| g_enterprise ||" AND stbddocno ='"|| g_stbd_m.stbddocno||"'"   
               #END add-point
               &include "erp/ast/astt340_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt340_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION money_change
            LET g_action_choice="money_change"
            IF cl_auth_chk_act("money_change") THEN
               
               #add-point:ON ACTION money_change name="menu.money_change"
               IF NOT cl_null(g_stbd_m.stbddocno) THEN
                  IF g_stbd_m.stbdstus = 'N' THEN                  
                     CALL astt540_01(g_stbd_m.stbddocno)
                     CALL astt340_stev_fill()
                     CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
                     CALL astt340_stbd_show()
                  ELSE
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "art-00608" 
                     LET g_errparam.popup  = FALSE 
                     CALL cl_err()
                     CONTINUE DIALOG             
                  END IF 
               ELSE
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "std-00003" 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  CONTINUE DIALOG             
               END IF   
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION expense_produce
            LET g_action_choice="expense_produce"
            IF cl_auth_chk_act("expense_produce") THEN
               
               #add-point:ON ACTION expense_produce name="menu.expense_produce"
               IF NOT cl_null(g_stbd_m.stbddocno) THEN
                  IF g_stbd_m.stbdstus = 'N' THEN
                     IF g_stbd_m.stbd003 ='1' AND g_stbd_m.stbd039 ='1' THEN
                        LET l_cnt = 0
                        #SELECT COUNT(*) INTO l_cnt FROM stao_t WHERE stao001 = g_stbd_m.stbd001 AND stao007='5' #mark by geza 20170122 #170122-00004#2 
                        SELECT COUNT(*) INTO l_cnt FROM stao_t WHERE staoent = g_enterprise AND stao001 = g_stbd_m.stbd001 AND stao007='5' #add by geza 20170122 #170122-00004#2
                        IF l_cnt > 0 THEN
                           LET p_caldate = g_stbd_m.stax004
                           #LET p_wc = " stan001 ='",g_stbd_m.stbd001,"' AND EXISTS (SELECT 1 FROM stao_t WHERE stan001=stao001 AND stao007='5')" #mark by geza 20170122 #170122-00004#2 
                           LET p_wc = " stan001 ='",g_stbd_m.stbd001,"' AND stanent = ",g_enterprise," AND EXISTS (SELECT 1 FROM stao_t WHERE stan001=stao001 AND stao007='5' AND stanent = staoent )" #add by geza 20170122 #170122-00004#2
                           CALL s_transaction_begin()
                           CALL cl_err_collect_init()
                           CALL s_expense_astp321(p_caldate,p_wc) RETURNING l_success
                           CALL cl_err_collect_show()
                           IF NOT l_success THEN
                              CALL cl_err_collect_show()
                              INITIALIZE g_errparam TO NULL 
                              LET g_errparam.extend = "" 
                              LET g_errparam.code   = "ast-00372" 
                              LET g_errparam.popup  = FALSE 
                              CALL cl_err()
                              CALL s_transaction_end("N","0")
                              CONTINUE DIALOG 
                           END IF
                           CALL s_transaction_end("Y","0")                                    
                        ELSE
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = "" 
                           LET g_errparam.code   = "ast-00371" 
                           LET g_errparam.popup  = FALSE 
                           CALL cl_err()
                           CONTINUE DIALOG 
                        END IF
                     ELSE
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "" 
                        LET g_errparam.code   = "ast-00370" 
                        LET g_errparam.popup  = FALSE 
                        CALL cl_err()
                        CONTINUE DIALOG             
                     END IF 
                  ELSE
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "art-00608" 
                     LET g_errparam.popup  = FALSE 
                     CALL cl_err()
                     CONTINUE DIALOG             
                  END IF   
               ELSE
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "std-00003" 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  CONTINUE DIALOG             
               END IF                       
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_stbd033
            LET g_action_choice="update_stbd033"
            IF cl_auth_chk_act("update_stbd033") THEN
               
               #add-point:ON ACTION update_stbd033 name="menu.update_stbd033"
               CALL astt340_update_stbd033()      #add by geza 20151019
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt340_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt340_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt340_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stbd_m.stbddocdt)
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="astt340.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt340_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   CALL s_aooi500_sql_where(g_prog,'stbdsite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   LET l_wc  = g_wc.trim()
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   IF g_type='1' THEN
      #LET l_wc=l_wc," AND stbd000='1' "  #160901-00061#1 mark by geza 20160901
      LET l_wc=l_wc," AND stbd000='1' AND stbd003 <> '5' "  #160901-00061#1 add by geza 20160901
   ELSE
      LET l_wc=l_wc," AND stbd000='2' " 
   END IF
   #add by geza 20151231(S)
   IF cl_null(g_wc2_table3) THEN
      LET g_wc2_table3 = " 1=1"
   END IF
   IF cl_null(g_wc3) THEN
      LET g_wc3 = " 1=1"
   END IF
   #add by geza 20151231(E)
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stbddocno ",
                      " FROM stbd_t ",
                      " ",
                      " LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ",
                      #add-point:browser_fill段sql(stbe_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ",
                      #add-point:browser_fill段sql(stbf_t1) name="browser_fill.cnt.join.stbf_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stbdent = " ||g_enterprise|| " AND stbeent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stbd_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stbddocno ",
                      " FROM stbd_t ", 
                      "  ",
                      "  ",
                      " WHERE stbdent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stbd_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   IF g_wc2 = " 1=1" AND g_wc2_table3 <> " 1=1" AND g_wc3 = " 1=1"  THEN
      LET l_sub_sql = " SELECT UNIQUE stbddocno ",
                         " FROM stbd_t ",
                         " ",
                         " LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ",
                         #add-point:browser_fill段sql(stbe_t1)
      
                         #end add-point
                         " LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ",
                         #add-point:browser_fill段sql(stbf_t1)
      
                         #end add-point
      
      
      
                         " ", 
                         " ", 
                         " WHERE stbdent = '" ||g_enterprise|| "' AND stbeent = '" ||g_enterprise|| "' AND ",g_wc2_table3,  cl_sql_add_filter("stbd_t")
   END IF      
   #add by geza 20151119(S)
   IF g_wc2 = " 1=1" AND g_wc2_table3 = " 1=1" AND g_wc3 <> " 1=1"  THEN
      #是否启用交款汇总单为N,隐藏结算调整按钮
      #add by geza 20151119(S)
      IF cl_get_para(g_enterprise,g_site,"S-CIR-2012") = 'Y' THEN
         LET l_sub_sql = " SELECT UNIQUE stbddocno ",
                           " FROM stbd_t ",
                           " ",
                           " LEFT JOIN stet_t  ON stetent = stbdent AND stetdocno = stbddocno ", 
                           " LEFT JOIN stev_t  ON stetent = stevent AND stet002 = stevdocno ",                                      
                           " WHERE stbdent = '" ||g_enterprise|| "' AND stetent = '" ||g_enterprise|| "' AND ",g_wc3,  cl_sql_add_filter("stbd_t")
      ELSE 
         LET l_sub_sql = " SELECT UNIQUE stbddocno ",
                           " FROM stbd_t ",
                           " ",
                           " LEFT JOIN stev_t ON stevent = stbdent AND stbddocno = stevdocno ", "  ",
                           " WHERE stbdent = '" ||g_enterprise|| "' AND stevent = '" ||g_enterprise|| "' AND ",g_wc3,  cl_sql_add_filter("stbd_t")
      END IF      
   END IF 
   IF g_wc2 = " 1=1" AND g_wc2_table3 <> " 1=1" AND g_wc3 <> " 1=1"  THEN
      IF cl_get_para(g_enterprise,g_site,"S-CIR-2012") = 'Y' THEN
         LET l_sub_sql = " SELECT UNIQUE stbddocno ",
                           " FROM stbd_t ",
                           " ",
                           " LEFT JOIN stet_t  ON stetent = stbdent AND stetdocno = stbddocno ", 
                           " LEFT JOIN stev_t  ON stetent = stevent AND stet002 = stevdocno ",   
                           " LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ",
                           " WHERE stbdent = '" ||g_enterprise|| "' AND stevent = '" ||g_enterprise|| "' AND ",g_wc3," AND ",g_wc2_table3, cl_sql_add_filter("stbd_t")
      ELSE
         LET l_sub_sql = " SELECT UNIQUE stbddocno ",
                           " FROM stbd_t ",
                           " ",
                           " LEFT JOIN stev_t ON stevent = stbdent AND stbddocno = stevdocno ", "  ",
                           " LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ",
                           " WHERE stbdent = '" ||g_enterprise|| "' AND stevent = '" ||g_enterprise|| "' AND ",g_wc3," AND ",g_wc2_table3, cl_sql_add_filter("stbd_t")
      END IF
   END IF 
   #add by geza 20151119(E)   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
   
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_stbd_m.* TO NULL
      CALL g_stbe_d.clear()        
      CALL g_stbe3_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002,t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbdstus,t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002, 
          t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stbd_t t0",
                  "  ",
                  "  LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ", 
                  #add-point:browser_fill段sql(stbe_t1) name="browser_fill.join.stbe_t1"
                  
                  #end add-point
                  "  LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ", 
                  #add-point:browser_fill段sql(stbf_t1) name="browser_fill.join.stbf_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbd001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stbd002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbdent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stbd_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbdstus,t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002, 
          t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stbd_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbd001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stbd002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbdent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stbd_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = " SELECT DISTINCT t0.stbdstus,t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002, 
     t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
             " FROM stbd_t t0",
             "  ",
             "  LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ", 
             #add-point:browser_fill段sql(stbe_t1)
  
             #end add-point
             "  LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ", 
             #add-point:browser_fill段sql(stbf_t1)
  
             #end add-point
  
  
  
             "  ",
                            " LEFT JOIN ooefl_t t1 ON t1.ooeflent='"||g_enterprise||"' AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_lang||"' ",
             " LEFT JOIN ooefl_t t2 ON t2.ooeflent='"||g_enterprise||"' AND t2.ooefl001=t0.stbd001 AND t2.ooefl002='"||g_lang||"' ",
             " LEFT JOIN pmaal_t t3 ON t3.pmaalent='"||g_enterprise||"' AND t3.pmaal001=t0.stbd002 AND t3.pmaal002='"||g_lang||"' ",
  
             " WHERE t0.stbdent = '" ||g_enterprise|| "' AND ",l_wc," AND ",l_wc2," AND ",g_wc2_table3, cl_sql_add_filter("stbd_t")
   #end add-point
   LET g_sql = g_sql, " ORDER BY stbddocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   #add by geza 20151119(S)
   #结算单查询的时候的order by调整为按照单据日期逆序单号逆序
   IF cl_get_para(g_enterprise,g_site,"S-CIR-2012") = 'Y' THEN
      LET g_sql = " SELECT DISTINCT t0.stbdstus,t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002, 
        t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                " FROM stbd_t t0",
                "  ",
                "  LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ", 
                #add-point:browser_fill段sql(stbe_t1)
                " LEFT JOIN stet_t  ON stetent = stbdent AND stetdocno = stbddocno ", 
                " LEFT JOIN stev_t  ON stetent = stevent AND stet002 = stevdocno ",   
                #end add-point
                "  LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ", 

                " LEFT JOIN stfj_t ON stfjent = stbdent AND stfjseq = stbd004 AND stfj001 = stbd001 ",#ADDED BY LANJJ 2015-11-03
                               " LEFT JOIN ooefl_t t1 ON t1.ooeflent='"||g_enterprise||"' AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_lang||"' ",
                " LEFT JOIN ooefl_t t2 ON t2.ooeflent='"||g_enterprise||"' AND t2.ooefl001=t0.stbd001 AND t2.ooefl002='"||g_lang||"' ",
                " LEFT JOIN pmaal_t t3 ON t3.pmaalent='"||g_enterprise||"' AND t3.pmaal001=t0.stbd002 AND t3.pmaal002='"||g_lang||"' ",
      
                " WHERE t0.stbdent = '" ||g_enterprise|| "' AND ",l_wc," AND ",l_wc2," AND ",g_wc2_table3," AND ",g_wc3, cl_sql_add_filter("stbd_t")
   ELSE
      LET g_sql = " SELECT DISTINCT t0.stbdstus,t0.stbdsite,t0.stbddocno,t0.stbddocdt,t0.stbd001,t0.stbd002, 
        t0.stbd003,t0.stbd004,t0.stbd005,t0.stbd006,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                " FROM stbd_t t0",
                "  ",
                "  LEFT JOIN stbe_t ON stbeent = stbdent AND stbddocno = stbedocno ", "  ", 
                #add-point:browser_fill段sql(stbe_t1)
                "  LEFT JOIN stev_t ON stevent = stbdent AND stbddocno = stevdocno ", "  ",
                #end add-point
                "  LEFT JOIN stbf_t ON stbfent = stbdent AND stbddocno = stbfdocno", "  ",      
                " LEFT JOIN stfj_t ON stfjent = stbdent AND stfjseq = stbd004 AND stfj001 = stbd001 ",#ADDED BY LANJJ 2015-11-03
                               " LEFT JOIN ooefl_t t1 ON t1.ooeflent='"||g_enterprise||"' AND t1.ooefl001=t0.stbdsite AND t1.ooefl002='"||g_lang||"' ",
                " LEFT JOIN ooefl_t t2 ON t2.ooeflent='"||g_enterprise||"' AND t2.ooefl001=t0.stbd001 AND t2.ooefl002='"||g_lang||"' ",
                " LEFT JOIN pmaal_t t3 ON t3.pmaalent='"||g_enterprise||"' AND t3.pmaal001=t0.stbd002 AND t3.pmaal002='"||g_lang||"' ",
      
                " WHERE t0.stbdent = '" ||g_enterprise|| "' AND ",l_wc," AND ",l_wc2," AND ",g_wc2_table3," AND ",g_wc3, cl_sql_add_filter("stbd_t")
   END IF

   LET g_sql = g_sql, " ORDER BY stbddocdt DESC,stbddocno DESC"
   #add by geza 20151119(E)
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stbd_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stbdsite,g_browser[g_cnt].b_stbddocno, 
          g_browser[g_cnt].b_stbddocdt,g_browser[g_cnt].b_stbd001,g_browser[g_cnt].b_stbd002,g_browser[g_cnt].b_stbd003, 
          g_browser[g_cnt].b_stbd004,g_browser[g_cnt].b_stbd005,g_browser[g_cnt].b_stbd006,g_browser[g_cnt].b_stbdsite_desc, 
          g_browser[g_cnt].b_stbd001_desc,g_browser[g_cnt].b_stbd002_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
      
         #遮罩相關處理
         CALL astt340_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "J"
            LET g_browser[g_cnt].b_statepic = "stus/16/reconciliate.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
            EXIT FOREACH
         END IF
         
      END FOREACH
      FREE browse_pre
   END IF
   
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_stbddocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt340_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stbd_m.stbddocno = g_browser[g_current_idx].b_stbddocno   
 
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
   CALL astt340_stbd_t_mask()
   CALL astt340_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt340.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt340_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt340_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_stbddocno = g_stbd_m.stbddocno 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt340_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   CALL g_stbe_d_2.clear() #add by geza 20160606
   CALL g_stev_d.clear()   #add by geza 20160606
   CALL g_stbe5_d.clear()  #add by geza 20160606
   CALL g_stbe6_d.clear()  #add by geza 20160606
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stbd_m.* TO NULL
   CALL g_stbe_d.clear()        
   CALL g_stbe3_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stbdsite,stbddocdt,stbddocno,stbd048,stbd000,stbd037,stbd002,stbd001, 
          stbd041,stbd003,stbdunit,stbd039,stbd043,stbd044,stbd004,stbd005,stbd006,stbd038,stbdstus, 
          stbdownid,stbdowndp,stbdcrtid,stbdcrtdp,stbdcrtdt,stbdmodid,stbdmoddt,stbdcnfid,stbdcnfdt, 
          stbd007,stbd008,stbd009,stbd010,stbd011,stbd045,stbd012,stbd013,stbd014,stbd015,stbd040,stbd016, 
          stbd017,stbd018,stbd019,stbd020,stbd042,stbd021,stbd022,stbd023,stbd024,stbd025,stbd026,stbd046, 
          stbd033,stbd027,stbd028,stbd029,stbd030,stbd031,stbd032
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbdcrtdt>>----
         AFTER FIELD stbdcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stbdmoddt>>----
         AFTER FIELD stbdmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbdcnfdt>>----
         AFTER FIELD stbdcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbdpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stbdsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdsite
            #add-point:ON ACTION controlp INFIELD stbdsite name="construct.c.stbdsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbdsite',g_site,'c')
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stbdsite  #顯示到畫面上
            NEXT FIELD stbdsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdsite
            #add-point:BEFORE FIELD stbdsite name="construct.b.stbdsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdsite
            
            #add-point:AFTER FIELD stbdsite name="construct.a.stbdsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbddocdt
            #add-point:BEFORE FIELD stbddocdt name="construct.b.stbddocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbddocdt
            
            #add-point:AFTER FIELD stbddocdt name="construct.a.stbddocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbddocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbddocdt
            #add-point:ON ACTION controlp INFIELD stbddocdt name="construct.c.stbddocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbddocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbddocno
            #add-point:ON ACTION controlp INFIELD stbddocno name="construct.c.stbddocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            IF g_type = '1' THEN
               LET g_qryparam.where = " stbd000 = '1' "
            ELSE
               LET g_qryparam.where = " stbd000 = '2' "
            END IF
            CALL q_stbddocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbddocno  #顯示到畫面上
            NEXT FIELD stbddocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbddocno
            #add-point:BEFORE FIELD stbddocno name="construct.b.stbddocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbddocno
            
            #add-point:AFTER FIELD stbddocno name="construct.a.stbddocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd048
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd048
            #add-point:ON ACTION controlp INFIELD stbd048 name="construct.c.stbd048"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef003 = 'Y' "
            CALL q_ooef001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd048  #顯示到畫面上
            NEXT FIELD stbd048                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd048
            #add-point:BEFORE FIELD stbd048 name="construct.b.stbd048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd048
            
            #add-point:AFTER FIELD stbd048 name="construct.a.stbd048"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd000
            #add-point:BEFORE FIELD stbd000 name="construct.b.stbd000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd000
            
            #add-point:AFTER FIELD stbd000 name="construct.a.stbd000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd000
            #add-point:ON ACTION controlp INFIELD stbd000 name="construct.c.stbd000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbd037
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd037
            #add-point:ON ACTION controlp INFIELD stbd037 name="construct.c.stbd037"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd037  #顯示到畫面上
            NEXT FIELD stbd037                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd037
            #add-point:BEFORE FIELD stbd037 name="construct.b.stbd037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd037
            
            #add-point:AFTER FIELD stbd037 name="construct.a.stbd037"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd002
            #add-point:ON ACTION controlp INFIELD stbd002 name="construct.c.stbd002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd002  #顯示到畫面上
            NEXT FIELD stbd002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd002
            #add-point:BEFORE FIELD stbd002 name="construct.b.stbd002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd002
            
            #add-point:AFTER FIELD stbd002 name="construct.a.stbd002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd001
            #add-point:ON ACTION controlp INFIELD stbd001 name="construct.c.stbd001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #add by geza 20150602(S)
            IF g_type='1' THEN
               CALL q_stan001_3()
            ELSE
               CALL q_stfa001()  
            END IF 
            #add by geza 20150602(E) 
            DISPLAY g_qryparam.return1 TO stbd001  #顯示到畫面上
            NEXT FIELD stbd001      
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd001
            #add-point:BEFORE FIELD stbd001 name="construct.b.stbd001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd001
            
            #add-point:AFTER FIELD stbd001 name="construct.a.stbd001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd041
            #add-point:BEFORE FIELD stbd041 name="construct.b.stbd041"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd041
            
            #add-point:AFTER FIELD stbd041 name="construct.a.stbd041"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd041
            #add-point:ON ACTION controlp INFIELD stbd041 name="construct.c.stbd041"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd003
            #add-point:BEFORE FIELD stbd003 name="construct.b.stbd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd003
            
            #add-point:AFTER FIELD stbd003 name="construct.a.stbd003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd003
            #add-point:ON ACTION controlp INFIELD stbd003 name="construct.c.stbd003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdunit
            #add-point:BEFORE FIELD stbdunit name="construct.b.stbdunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdunit
            
            #add-point:AFTER FIELD stbdunit name="construct.a.stbdunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbdunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdunit
            #add-point:ON ACTION controlp INFIELD stbdunit name="construct.c.stbdunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbdunit',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdunit  #顯示到畫面上
            NEXT FIELD stbdunit    
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd039
            #add-point:BEFORE FIELD stbd039 name="construct.b.stbd039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd039
            
            #add-point:AFTER FIELD stbd039 name="construct.a.stbd039"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd039
            #add-point:ON ACTION controlp INFIELD stbd039 name="construct.c.stbd039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd043
            #add-point:BEFORE FIELD stbd043 name="construct.b.stbd043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd043
            
            #add-point:AFTER FIELD stbd043 name="construct.a.stbd043"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd043
            #add-point:ON ACTION controlp INFIELD stbd043 name="construct.c.stbd043"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd044
            #add-point:BEFORE FIELD stbd044 name="construct.b.stbd044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd044
            
            #add-point:AFTER FIELD stbd044 name="construct.a.stbd044"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd044
            #add-point:ON ACTION controlp INFIELD stbd044 name="construct.c.stbd044"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbd004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd004
            #add-point:ON ACTION controlp INFIELD stbd004 name="construct.c.stbd004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stfj004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd004  #顯示到畫面上
            NEXT FIELD stbd004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd004
            #add-point:BEFORE FIELD stbd004 name="construct.b.stbd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd004
            
            #add-point:AFTER FIELD stbd004 name="construct.a.stbd004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd005
            #add-point:BEFORE FIELD stbd005 name="construct.b.stbd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd005
            
            #add-point:AFTER FIELD stbd005 name="construct.a.stbd005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd005
            #add-point:ON ACTION controlp INFIELD stbd005 name="construct.c.stbd005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd006
            #add-point:BEFORE FIELD stbd006 name="construct.b.stbd006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd006
            
            #add-point:AFTER FIELD stbd006 name="construct.a.stbd006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd006
            #add-point:ON ACTION controlp INFIELD stbd006 name="construct.c.stbd006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd038
            #add-point:BEFORE FIELD stbd038 name="construct.b.stbd038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd038
            
            #add-point:AFTER FIELD stbd038 name="construct.a.stbd038"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd038
            #add-point:ON ACTION controlp INFIELD stbd038 name="construct.c.stbd038"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdstus
            #add-point:BEFORE FIELD stbdstus name="construct.b.stbdstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdstus
            
            #add-point:AFTER FIELD stbdstus name="construct.a.stbdstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbdstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdstus
            #add-point:ON ACTION controlp INFIELD stbdstus name="construct.c.stbdstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbdownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdownid
            #add-point:ON ACTION controlp INFIELD stbdownid name="construct.c.stbdownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdownid  #顯示到畫面上
            NEXT FIELD stbdownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdownid
            #add-point:BEFORE FIELD stbdownid name="construct.b.stbdownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdownid
            
            #add-point:AFTER FIELD stbdownid name="construct.a.stbdownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbdowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdowndp
            #add-point:ON ACTION controlp INFIELD stbdowndp name="construct.c.stbdowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdowndp  #顯示到畫面上
            NEXT FIELD stbdowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdowndp
            #add-point:BEFORE FIELD stbdowndp name="construct.b.stbdowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdowndp
            
            #add-point:AFTER FIELD stbdowndp name="construct.a.stbdowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbdcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdcrtid
            #add-point:ON ACTION controlp INFIELD stbdcrtid name="construct.c.stbdcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdcrtid  #顯示到畫面上
            NEXT FIELD stbdcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdcrtid
            #add-point:BEFORE FIELD stbdcrtid name="construct.b.stbdcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdcrtid
            
            #add-point:AFTER FIELD stbdcrtid name="construct.a.stbdcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbdcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdcrtdp
            #add-point:ON ACTION controlp INFIELD stbdcrtdp name="construct.c.stbdcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdcrtdp  #顯示到畫面上
            NEXT FIELD stbdcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdcrtdp
            #add-point:BEFORE FIELD stbdcrtdp name="construct.b.stbdcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdcrtdp
            
            #add-point:AFTER FIELD stbdcrtdp name="construct.a.stbdcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdcrtdt
            #add-point:BEFORE FIELD stbdcrtdt name="construct.b.stbdcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbdmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdmodid
            #add-point:ON ACTION controlp INFIELD stbdmodid name="construct.c.stbdmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdmodid  #顯示到畫面上
            NEXT FIELD stbdmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdmodid
            #add-point:BEFORE FIELD stbdmodid name="construct.b.stbdmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdmodid
            
            #add-point:AFTER FIELD stbdmodid name="construct.a.stbdmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdmoddt
            #add-point:BEFORE FIELD stbdmoddt name="construct.b.stbdmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbdcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdcnfid
            #add-point:ON ACTION controlp INFIELD stbdcnfid name="construct.c.stbdcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbdcnfid  #顯示到畫面上
            NEXT FIELD stbdcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdcnfid
            #add-point:BEFORE FIELD stbdcnfid name="construct.b.stbdcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdcnfid
            
            #add-point:AFTER FIELD stbdcnfid name="construct.a.stbdcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdcnfdt
            #add-point:BEFORE FIELD stbdcnfdt name="construct.b.stbdcnfdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd007
            #add-point:BEFORE FIELD stbd007 name="construct.b.stbd007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd007
            
            #add-point:AFTER FIELD stbd007 name="construct.a.stbd007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd007
            #add-point:ON ACTION controlp INFIELD stbd007 name="construct.c.stbd007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd008
            #add-point:BEFORE FIELD stbd008 name="construct.b.stbd008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd008
            
            #add-point:AFTER FIELD stbd008 name="construct.a.stbd008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd008
            #add-point:ON ACTION controlp INFIELD stbd008 name="construct.c.stbd008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd009
            #add-point:BEFORE FIELD stbd009 name="construct.b.stbd009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd009
            
            #add-point:AFTER FIELD stbd009 name="construct.a.stbd009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd009
            #add-point:ON ACTION controlp INFIELD stbd009 name="construct.c.stbd009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd010
            #add-point:BEFORE FIELD stbd010 name="construct.b.stbd010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd010
            
            #add-point:AFTER FIELD stbd010 name="construct.a.stbd010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd010
            #add-point:ON ACTION controlp INFIELD stbd010 name="construct.c.stbd010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd011
            #add-point:BEFORE FIELD stbd011 name="construct.b.stbd011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd011
            
            #add-point:AFTER FIELD stbd011 name="construct.a.stbd011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd011
            #add-point:ON ACTION controlp INFIELD stbd011 name="construct.c.stbd011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd045
            #add-point:BEFORE FIELD stbd045 name="construct.b.stbd045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd045
            
            #add-point:AFTER FIELD stbd045 name="construct.a.stbd045"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd045
            #add-point:ON ACTION controlp INFIELD stbd045 name="construct.c.stbd045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd012
            #add-point:BEFORE FIELD stbd012 name="construct.b.stbd012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd012
            
            #add-point:AFTER FIELD stbd012 name="construct.a.stbd012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd012
            #add-point:ON ACTION controlp INFIELD stbd012 name="construct.c.stbd012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd013
            #add-point:BEFORE FIELD stbd013 name="construct.b.stbd013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd013
            
            #add-point:AFTER FIELD stbd013 name="construct.a.stbd013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd013
            #add-point:ON ACTION controlp INFIELD stbd013 name="construct.c.stbd013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd014
            #add-point:BEFORE FIELD stbd014 name="construct.b.stbd014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd014
            
            #add-point:AFTER FIELD stbd014 name="construct.a.stbd014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd014
            #add-point:ON ACTION controlp INFIELD stbd014 name="construct.c.stbd014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd015
            #add-point:BEFORE FIELD stbd015 name="construct.b.stbd015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd015
            
            #add-point:AFTER FIELD stbd015 name="construct.a.stbd015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd015
            #add-point:ON ACTION controlp INFIELD stbd015 name="construct.c.stbd015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd040
            #add-point:BEFORE FIELD stbd040 name="construct.b.stbd040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd040
            
            #add-point:AFTER FIELD stbd040 name="construct.a.stbd040"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd040
            #add-point:ON ACTION controlp INFIELD stbd040 name="construct.c.stbd040"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd016
            #add-point:BEFORE FIELD stbd016 name="construct.b.stbd016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd016
            
            #add-point:AFTER FIELD stbd016 name="construct.a.stbd016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd016
            #add-point:ON ACTION controlp INFIELD stbd016 name="construct.c.stbd016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd017
            #add-point:BEFORE FIELD stbd017 name="construct.b.stbd017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd017
            
            #add-point:AFTER FIELD stbd017 name="construct.a.stbd017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd017
            #add-point:ON ACTION controlp INFIELD stbd017 name="construct.c.stbd017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd018
            #add-point:BEFORE FIELD stbd018 name="construct.b.stbd018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd018
            
            #add-point:AFTER FIELD stbd018 name="construct.a.stbd018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd018
            #add-point:ON ACTION controlp INFIELD stbd018 name="construct.c.stbd018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd019
            #add-point:BEFORE FIELD stbd019 name="construct.b.stbd019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd019
            
            #add-point:AFTER FIELD stbd019 name="construct.a.stbd019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd019
            #add-point:ON ACTION controlp INFIELD stbd019 name="construct.c.stbd019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd020
            #add-point:BEFORE FIELD stbd020 name="construct.b.stbd020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd020
            
            #add-point:AFTER FIELD stbd020 name="construct.a.stbd020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd020
            #add-point:ON ACTION controlp INFIELD stbd020 name="construct.c.stbd020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd042
            #add-point:BEFORE FIELD stbd042 name="construct.b.stbd042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd042
            
            #add-point:AFTER FIELD stbd042 name="construct.a.stbd042"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd042
            #add-point:ON ACTION controlp INFIELD stbd042 name="construct.c.stbd042"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbd021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd021
            #add-point:ON ACTION controlp INFIELD stbd021 name="construct.c.stbd021"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd021  #顯示到畫面上
            NEXT FIELD stbd021                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd021
            #add-point:BEFORE FIELD stbd021 name="construct.b.stbd021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd021
            
            #add-point:AFTER FIELD stbd021 name="construct.a.stbd021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd022
            #add-point:ON ACTION controlp INFIELD stbd022 name="construct.c.stbd022"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today
            CALL q_ooeg001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd022  #顯示到畫面上
            NEXT FIELD stbd022                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd022
            #add-point:BEFORE FIELD stbd022 name="construct.b.stbd022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd022
            
            #add-point:AFTER FIELD stbd022 name="construct.a.stbd022"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd023
            #add-point:BEFORE FIELD stbd023 name="construct.b.stbd023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd023
            
            #add-point:AFTER FIELD stbd023 name="construct.a.stbd023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd023
            #add-point:ON ACTION controlp INFIELD stbd023 name="construct.c.stbd023"
             INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stbd023') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbd023',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23() 
            END IF
            DISPLAY g_qryparam.return1 TO stbd023  #顯示到畫面上
            NEXT FIELD stbd023                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd024
            #add-point:BEFORE FIELD stbd024 name="construct.b.stbd024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd024
            
            #add-point:AFTER FIELD stbd024 name="construct.a.stbd024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd024
            #add-point:ON ACTION controlp INFIELD stbd024 name="construct.c.stbd024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd025
            #add-point:BEFORE FIELD stbd025 name="construct.b.stbd025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd025
            
            #add-point:AFTER FIELD stbd025 name="construct.a.stbd025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd025
            #add-point:ON ACTION controlp INFIELD stbd025 name="construct.c.stbd025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd026
            #add-point:BEFORE FIELD stbd026 name="construct.b.stbd026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd026
            
            #add-point:AFTER FIELD stbd026 name="construct.a.stbd026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd026
            #add-point:ON ACTION controlp INFIELD stbd026 name="construct.c.stbd026"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbd046
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd046
            #add-point:ON ACTION controlp INFIELD stbd046 name="construct.c.stbd046"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " pmac003 = '1' "  #付款
            CALL q_pmac002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd046  #顯示到畫面上
            NEXT FIELD stbd046                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd046
            #add-point:BEFORE FIELD stbd046 name="construct.b.stbd046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd046
            
            #add-point:AFTER FIELD stbd046 name="construct.a.stbd046"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd033
            #add-point:BEFORE FIELD stbd033 name="construct.b.stbd033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd033
            
            #add-point:AFTER FIELD stbd033 name="construct.a.stbd033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd033
            #add-point:ON ACTION controlp INFIELD stbd033 name="construct.c.stbd033"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd027
            #add-point:BEFORE FIELD stbd027 name="construct.b.stbd027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd027
            
            #add-point:AFTER FIELD stbd027 name="construct.a.stbd027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd027
            #add-point:ON ACTION controlp INFIELD stbd027 name="construct.c.stbd027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd028
            #add-point:BEFORE FIELD stbd028 name="construct.b.stbd028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd028
            
            #add-point:AFTER FIELD stbd028 name="construct.a.stbd028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd028
            #add-point:ON ACTION controlp INFIELD stbd028 name="construct.c.stbd028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd029
            #add-point:BEFORE FIELD stbd029 name="construct.b.stbd029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd029
            
            #add-point:AFTER FIELD stbd029 name="construct.a.stbd029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd029
            #add-point:ON ACTION controlp INFIELD stbd029 name="construct.c.stbd029"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd030
            #add-point:BEFORE FIELD stbd030 name="construct.b.stbd030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd030
            
            #add-point:AFTER FIELD stbd030 name="construct.a.stbd030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd030
            #add-point:ON ACTION controlp INFIELD stbd030 name="construct.c.stbd030"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd031
            #add-point:BEFORE FIELD stbd031 name="construct.b.stbd031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd031
            
            #add-point:AFTER FIELD stbd031 name="construct.a.stbd031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd031
            #add-point:ON ACTION controlp INFIELD stbd031 name="construct.c.stbd031"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd032
            #add-point:BEFORE FIELD stbd032 name="construct.b.stbd032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd032
            
            #add-point:AFTER FIELD stbd032 name="construct.a.stbd032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbd032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd032
            #add-point:ON ACTION controlp INFIELD stbd032 name="construct.c.stbd032"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025, 
          stae003,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016, 
          stbe026,stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp
           FROM s_detail1[1].stbeseq,s_detail1[1].stbe001,s_detail1[1].stbe002,s_detail1[1].stbe003, 
               s_detail1[1].stbe004,s_detail1[1].stbe028,s_detail1[1].stbe005,s_detail1[1].stbe024,s_detail1[1].stbe025, 
               s_detail1[1].stae003,s_detail1[1].stbe006,s_detail1[1].stbe007,s_detail1[1].stbe008,s_detail1[1].stbe009, 
               s_detail1[1].stbe010,s_detail1[1].stbe011,s_detail1[1].stbe012,s_detail1[1].stbe013,s_detail1[1].stbe014, 
               s_detail1[1].stbe015,s_detail1[1].stbe016,s_detail1[1].stbe026,s_detail1[1].stbe027,s_detail1[1].stbe017, 
               s_detail1[1].stbe018,s_detail1[1].stbe033,s_detail1[1].stbe031,s_detail1[1].stbesite, 
               s_detail1[1].stbe020,s_detail1[1].stbe019,s_detail1[1].stbe032,s_detail1[1].stbecomp
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbeseq
            #add-point:BEFORE FIELD stbeseq name="construct.b.page1.stbeseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbeseq
            
            #add-point:AFTER FIELD stbeseq name="construct.a.page1.stbeseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbeseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbeseq
            #add-point:ON ACTION controlp INFIELD stbeseq name="construct.c.page1.stbeseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe001
            #add-point:BEFORE FIELD stbe001 name="construct.b.page1.stbe001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe001
            
            #add-point:AFTER FIELD stbe001 name="construct.a.page1.stbe001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe001
            #add-point:ON ACTION controlp INFIELD stbe001 name="construct.c.page1.stbe001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe002
            #add-point:BEFORE FIELD stbe002 name="construct.b.page1.stbe002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe002
            
            #add-point:AFTER FIELD stbe002 name="construct.a.page1.stbe002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe002
            #add-point:ON ACTION controlp INFIELD stbe002 name="construct.c.page1.stbe002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe003
            #add-point:BEFORE FIELD stbe003 name="construct.b.page1.stbe003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe003
            
            #add-point:AFTER FIELD stbe003 name="construct.a.page1.stbe003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe003
            #add-point:ON ACTION controlp INFIELD stbe003 name="construct.c.page1.stbe003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe004
            #add-point:BEFORE FIELD stbe004 name="construct.b.page1.stbe004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe004
            
            #add-point:AFTER FIELD stbe004 name="construct.a.page1.stbe004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe004
            #add-point:ON ACTION controlp INFIELD stbe004 name="construct.c.page1.stbe004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe028
            #add-point:BEFORE FIELD stbe028 name="construct.b.page1.stbe028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe028
            
            #add-point:AFTER FIELD stbe028 name="construct.a.page1.stbe028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe028
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe028
            #add-point:ON ACTION controlp INFIELD stbe028 name="construct.c.page1.stbe028"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbd037  #顯示到畫面上
            NEXT FIELD stbd037   
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe005
            #add-point:BEFORE FIELD stbe005 name="construct.b.page1.stbe005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe005
            
            #add-point:AFTER FIELD stbe005 name="construct.a.page1.stbe005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe005
            #add-point:ON ACTION controlp INFIELD stbe005 name="construct.c.page1.stbe005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe024
            #add-point:BEFORE FIELD stbe024 name="construct.b.page1.stbe024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe024
            
            #add-point:AFTER FIELD stbe024 name="construct.a.page1.stbe024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe024
            #add-point:ON ACTION controlp INFIELD stbe024 name="construct.c.page1.stbe024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe025
            #add-point:BEFORE FIELD stbe025 name="construct.b.page1.stbe025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe025
            
            #add-point:AFTER FIELD stbe025 name="construct.a.page1.stbe025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe025
            #add-point:ON ACTION controlp INFIELD stbe025 name="construct.c.page1.stbe025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stae003
            #add-point:BEFORE FIELD stae003 name="construct.b.page1.stae003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stae003
            
            #add-point:AFTER FIELD stae003 name="construct.a.page1.stae003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stae003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stae003
            #add-point:ON ACTION controlp INFIELD stae003 name="construct.c.page1.stae003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe006
            #add-point:BEFORE FIELD stbe006 name="construct.b.page1.stbe006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe006
            
            #add-point:AFTER FIELD stbe006 name="construct.a.page1.stbe006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe006
            #add-point:ON ACTION controlp INFIELD stbe006 name="construct.c.page1.stbe006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe007
            #add-point:BEFORE FIELD stbe007 name="construct.b.page1.stbe007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe007
            
            #add-point:AFTER FIELD stbe007 name="construct.a.page1.stbe007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe007
            #add-point:ON ACTION controlp INFIELD stbe007 name="construct.c.page1.stbe007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbe008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe008
            #add-point:ON ACTION controlp INFIELD stbe008 name="construct.c.page1.stbe008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbe008  #顯示到畫面上
            NEXT FIELD stbe008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe008
            #add-point:BEFORE FIELD stbe008 name="construct.b.page1.stbe008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe008
            
            #add-point:AFTER FIELD stbe008 name="construct.a.page1.stbe008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe009
            #add-point:ON ACTION controlp INFIELD stbe009 name="construct.c.page1.stbe009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbe009  #顯示到畫面上
            NEXT FIELD stbe009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe009
            #add-point:BEFORE FIELD stbe009 name="construct.b.page1.stbe009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe009
            
            #add-point:AFTER FIELD stbe009 name="construct.a.page1.stbe009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe010
            #add-point:BEFORE FIELD stbe010 name="construct.b.page1.stbe010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe010
            
            #add-point:AFTER FIELD stbe010 name="construct.a.page1.stbe010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe010
            #add-point:ON ACTION controlp INFIELD stbe010 name="construct.c.page1.stbe010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe011
            #add-point:BEFORE FIELD stbe011 name="construct.b.page1.stbe011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe011
            
            #add-point:AFTER FIELD stbe011 name="construct.a.page1.stbe011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe011
            #add-point:ON ACTION controlp INFIELD stbe011 name="construct.c.page1.stbe011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe012
            #add-point:BEFORE FIELD stbe012 name="construct.b.page1.stbe012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe012
            
            #add-point:AFTER FIELD stbe012 name="construct.a.page1.stbe012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe012
            #add-point:ON ACTION controlp INFIELD stbe012 name="construct.c.page1.stbe012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe013
            #add-point:BEFORE FIELD stbe013 name="construct.b.page1.stbe013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe013
            
            #add-point:AFTER FIELD stbe013 name="construct.a.page1.stbe013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe013
            #add-point:ON ACTION controlp INFIELD stbe013 name="construct.c.page1.stbe013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe014
            #add-point:BEFORE FIELD stbe014 name="construct.b.page1.stbe014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe014
            
            #add-point:AFTER FIELD stbe014 name="construct.a.page1.stbe014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe014
            #add-point:ON ACTION controlp INFIELD stbe014 name="construct.c.page1.stbe014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe015
            #add-point:BEFORE FIELD stbe015 name="construct.b.page1.stbe015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe015
            
            #add-point:AFTER FIELD stbe015 name="construct.a.page1.stbe015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe015
            #add-point:ON ACTION controlp INFIELD stbe015 name="construct.c.page1.stbe015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe016
            #add-point:BEFORE FIELD stbe016 name="construct.b.page1.stbe016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe016
            
            #add-point:AFTER FIELD stbe016 name="construct.a.page1.stbe016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe016
            #add-point:ON ACTION controlp INFIELD stbe016 name="construct.c.page1.stbe016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe026
            #add-point:BEFORE FIELD stbe026 name="construct.b.page1.stbe026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe026
            
            #add-point:AFTER FIELD stbe026 name="construct.a.page1.stbe026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe026
            #add-point:ON ACTION controlp INFIELD stbe026 name="construct.c.page1.stbe026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe027
            #add-point:BEFORE FIELD stbe027 name="construct.b.page1.stbe027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe027
            
            #add-point:AFTER FIELD stbe027 name="construct.a.page1.stbe027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe027
            #add-point:ON ACTION controlp INFIELD stbe027 name="construct.c.page1.stbe027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe017
            #add-point:BEFORE FIELD stbe017 name="construct.b.page1.stbe017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe017
            
            #add-point:AFTER FIELD stbe017 name="construct.a.page1.stbe017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe017
            #add-point:ON ACTION controlp INFIELD stbe017 name="construct.c.page1.stbe017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe018
            #add-point:BEFORE FIELD stbe018 name="construct.b.page1.stbe018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe018
            
            #add-point:AFTER FIELD stbe018 name="construct.a.page1.stbe018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe018
            #add-point:ON ACTION controlp INFIELD stbe018 name="construct.c.page1.stbe018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe033
            #add-point:BEFORE FIELD stbe033 name="construct.b.page1.stbe033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe033
            
            #add-point:AFTER FIELD stbe033 name="construct.a.page1.stbe033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe033
            #add-point:ON ACTION controlp INFIELD stbe033 name="construct.c.page1.stbe033"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe031
            #add-point:BEFORE FIELD stbe031 name="construct.b.page1.stbe031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe031
            
            #add-point:AFTER FIELD stbe031 name="construct.a.page1.stbe031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe031
            #add-point:ON ACTION controlp INFIELD stbe031 name="construct.c.page1.stbe031"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbesite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbesite
            #add-point:ON ACTION controlp INFIELD stbesite name="construct.c.page1.stbesite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbesite',g_site,'c')
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbesite  #顯示到畫面上
            NEXT FIELD stbesite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbesite
            #add-point:BEFORE FIELD stbesite name="construct.b.page1.stbesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbesite
            
            #add-point:AFTER FIELD stbesite name="construct.a.page1.stbesite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe020
            #add-point:BEFORE FIELD stbe020 name="construct.b.page1.stbe020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe020
            
            #add-point:AFTER FIELD stbe020 name="construct.a.page1.stbe020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe020
            #add-point:ON ACTION controlp INFIELD stbe020 name="construct.c.page1.stbe020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe019
            #add-point:BEFORE FIELD stbe019 name="construct.b.page1.stbe019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe019
            
            #add-point:AFTER FIELD stbe019 name="construct.a.page1.stbe019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe019
            #add-point:ON ACTION controlp INFIELD stbe019 name="construct.c.page1.stbe019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe032
            #add-point:BEFORE FIELD stbe032 name="construct.b.page1.stbe032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe032
            
            #add-point:AFTER FIELD stbe032 name="construct.a.page1.stbe032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbe032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe032
            #add-point:ON ACTION controlp INFIELD stbe032 name="construct.c.page1.stbe032"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbecomp
            #add-point:BEFORE FIELD stbecomp name="construct.b.page1.stbecomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbecomp
            
            #add-point:AFTER FIELD stbecomp name="construct.a.page1.stbecomp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbecomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbecomp
            #add-point:ON ACTION controlp INFIELD stbecomp name="construct.c.page1.stbecomp"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stbfseq,stbf001,stbf002,stbf003,stbf004,stbf004_desc,stbf005,stbf006, 
          stbf007,stbf008
           FROM s_detail3[1].stbfseq,s_detail3[1].stbf001,s_detail3[1].stbf002,s_detail3[1].stbf003, 
               s_detail3[1].stbf004,s_detail3[1].stbf004_desc,s_detail3[1].stbf005,s_detail3[1].stbf006, 
               s_detail3[1].stbf007,s_detail3[1].stbf008
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbfseq
            #add-point:BEFORE FIELD stbfseq name="construct.b.page3.stbfseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbfseq
            
            #add-point:AFTER FIELD stbfseq name="construct.a.page3.stbfseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbfseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbfseq
            #add-point:ON ACTION controlp INFIELD stbfseq name="construct.c.page3.stbfseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf001
            #add-point:BEFORE FIELD stbf001 name="construct.b.page3.stbf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf001
            
            #add-point:AFTER FIELD stbf001 name="construct.a.page3.stbf001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf001
            #add-point:ON ACTION controlp INFIELD stbf001 name="construct.c.page3.stbf001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf002
            #add-point:BEFORE FIELD stbf002 name="construct.b.page3.stbf002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf002
            
            #add-point:AFTER FIELD stbf002 name="construct.a.page3.stbf002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf002
            #add-point:ON ACTION controlp INFIELD stbf002 name="construct.c.page3.stbf002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf003
            #add-point:BEFORE FIELD stbf003 name="construct.b.page3.stbf003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf003
            
            #add-point:AFTER FIELD stbf003 name="construct.a.page3.stbf003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf003
            #add-point:ON ACTION controlp INFIELD stbf003 name="construct.c.page3.stbf003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.stbf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf004
            #add-point:ON ACTION controlp INFIELD stbf004 name="construct.c.page3.stbf004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbf004  #顯示到畫面上
            NEXT FIELD stbf004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf004
            #add-point:BEFORE FIELD stbf004 name="construct.b.page3.stbf004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf004
            
            #add-point:AFTER FIELD stbf004 name="construct.a.page3.stbf004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf004_desc
            #add-point:BEFORE FIELD stbf004_desc name="construct.b.page3.stbf004_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf004_desc
            
            #add-point:AFTER FIELD stbf004_desc name="construct.a.page3.stbf004_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf004_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf004_desc
            #add-point:ON ACTION controlp INFIELD stbf004_desc name="construct.c.page3.stbf004_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf005
            #add-point:BEFORE FIELD stbf005 name="construct.b.page3.stbf005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf005
            
            #add-point:AFTER FIELD stbf005 name="construct.a.page3.stbf005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf005
            #add-point:ON ACTION controlp INFIELD stbf005 name="construct.c.page3.stbf005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf006
            #add-point:BEFORE FIELD stbf006 name="construct.b.page3.stbf006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf006
            
            #add-point:AFTER FIELD stbf006 name="construct.a.page3.stbf006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf006
            #add-point:ON ACTION controlp INFIELD stbf006 name="construct.c.page3.stbf006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf007
            #add-point:BEFORE FIELD stbf007 name="construct.b.page3.stbf007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf007
            
            #add-point:AFTER FIELD stbf007 name="construct.a.page3.stbf007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf007
            #add-point:ON ACTION controlp INFIELD stbf007 name="construct.c.page3.stbf007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf008
            #add-point:BEFORE FIELD stbf008 name="construct.b.page3.stbf008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf008
            
            #add-point:AFTER FIELD stbf008 name="construct.a.page3.stbf008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbf008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf008
            #add-point:ON ACTION controlp INFIELD stbf008 name="construct.c.page3.stbf008"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      CONSTRUCT g_wc2_table3 ON stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025, 
         stae003,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016, 
         stbe026,stbe027,stbe017,stbe018,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp
         FROM s_detail2[1].stbeseq_1,s_detail2[1].stbe001_1,s_detail2[1].stbe002_1,s_detail2[1].stbe003_1, 
              s_detail2[1].stbe004_1,s_detail2[1].stbe028_1,s_detail2[1].stbe005_1,s_detail2[1].stbe024_1,s_detail2[1].stbe025_1, 
              s_detail2[1].stae003_1,s_detail2[1].stbe006_1,s_detail2[1].stbe007_1,s_detail2[1].stbe008_1,s_detail2[1].stbe009_1, 
              s_detail2[1].stbe010_1,s_detail2[1].stbe011_1,s_detail2[1].stbe012_1,s_detail2[1].stbe013_1,s_detail2[1].stbe014_1, 
              s_detail2[1].stbe015_1,s_detail2[1].stbe016_1,s_detail2[1].stbe026_1,s_detail2[1].stbe027_1,s_detail2[1].stbe017_1, 
              s_detail2[1].stbe018_1,s_detail2[1].stbe031_1,s_detail2[1].stbesite_1,s_detail2[1].stbe020_1,s_detail2[1].stbe019_1, 
              s_detail2[1].stbe032_1,s_detail2[1].stbecomp_1
                    
         BEFORE CONSTRUCT
            #add-point:cs段before_construct

            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbeseq_1
            #add-point:BEFORE FIELD stbeseq

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbeseq_1
            
            #add-point:AFTER FIELD stbeseq

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbeseq
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbeseq_1
            #add-point:ON ACTION controlp INFIELD stbeseq

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe001_1
            #add-point:BEFORE FIELD stbe001

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe001_1
            
            #add-point:AFTER FIELD stbe001

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe001
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe001_1
            #add-point:ON ACTION controlp INFIELD stbe001

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe002_1
            #add-point:BEFORE FIELD stbe002

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe002_1
            
            #add-point:AFTER FIELD stbe002

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe002
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe002_1
            #add-point:ON ACTION controlp INFIELD stbe002

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe003_1
            #add-point:BEFORE FIELD stbe003

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe003_1
            
            #add-point:AFTER FIELD stbe003

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe003
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe003_1
            #add-point:ON ACTION controlp INFIELD stbe003

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe004_1
            #add-point:BEFORE FIELD stbe004

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe004_1
            
            #add-point:AFTER FIELD stbe004

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe004
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe004_1
            #add-point:ON ACTION controlp INFIELD stbe004

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe028_1
            #add-point:BEFORE FIELD stbe028

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe028_1
            
            #add-point:AFTER FIELD stbe028

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe028
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe028_1
            #add-point:ON ACTION controlp INFIELD stbe028
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbe028_1  #顯示到畫面上
            NEXT FIELD stbe028_1   
            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe005_1
            #add-point:BEFORE FIELD stbe005

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe005_1
            
            #add-point:AFTER FIELD stbe005

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe005
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe005_1
            #add-point:ON ACTION controlp INFIELD stbe005

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe024_1
            #add-point:BEFORE FIELD stbe024

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe024_1
            
            #add-point:AFTER FIELD stbe024

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe024
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe024_1
            #add-point:ON ACTION controlp INFIELD stbe024

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe025_1
            #add-point:BEFORE FIELD stbe025

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe025_1
            
            #add-point:AFTER FIELD stbe025

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe025
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe025_1
            #add-point:ON ACTION controlp INFIELD stbe025

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stae003_1
            #add-point:BEFORE FIELD stae003

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stae003_1
            
            #add-point:AFTER FIELD stae003

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stae003
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stae003_1
            #add-point:ON ACTION controlp INFIELD stae003

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe006_1
            #add-point:BEFORE FIELD stbe006

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe006_1
            
            #add-point:AFTER FIELD stbe006

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe006
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe006_1
            #add-point:ON ACTION controlp INFIELD stbe006

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe007_1
            #add-point:BEFORE FIELD stbe007

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe007_1
            
            #add-point:AFTER FIELD stbe007

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe007
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe007_1
            #add-point:ON ACTION controlp INFIELD stbe007

            #END add-point
 
         #Ctrlp:construct.c.page1.stbe008
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe008_1
            #add-point:ON ACTION controlp INFIELD stbe008
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbe008_1  #顯示到畫面上
            NEXT FIELD stbe008_1                     #返回原欄位
    


            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe008_1
            #add-point:BEFORE FIELD stbe008

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe008_1
            
            #add-point:AFTER FIELD stbe008

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe009
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe009_1
            #add-point:ON ACTION controlp INFIELD stbe009
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbe009_1  #顯示到畫面上
            NEXT FIELD stbe009_1                     #返回原欄位
    


            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe009_1
            #add-point:BEFORE FIELD stbe009

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe009_1
            
            #add-point:AFTER FIELD stbe009

            #END add-point
            
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe010_1
            #add-point:BEFORE FIELD stbe010

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe010_1
            
            #add-point:AFTER FIELD stbe010

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe010
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe010_1
            #add-point:ON ACTION controlp INFIELD stbe010

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe011_1
            #add-point:BEFORE FIELD stbe011

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe011_1
            
            #add-point:AFTER FIELD stbe011

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe011
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe011_1
            #add-point:ON ACTION controlp INFIELD stbe011

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe012_1
            #add-point:BEFORE FIELD stbe012

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe012_1
            
            #add-point:AFTER FIELD stbe012

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe012
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe012_1
            #add-point:ON ACTION controlp INFIELD stbe012

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe013_1
            #add-point:BEFORE FIELD stbe013

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe013_1
            
            #add-point:AFTER FIELD stbe013

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe013
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe013_1
            #add-point:ON ACTION controlp INFIELD stbe013

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe014_1
            #add-point:BEFORE FIELD stbe014

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe014_1
            
            #add-point:AFTER FIELD stbe014

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe014
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe014_1
            #add-point:ON ACTION controlp INFIELD stbe014

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe015_1
            #add-point:BEFORE FIELD stbe015

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe015_1
            
            #add-point:AFTER FIELD stbe015

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe015
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe015_1
            #add-point:ON ACTION controlp INFIELD stbe015

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe016_1
            #add-point:BEFORE FIELD stbe016

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe016_1
            
            #add-point:AFTER FIELD stbe016

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe016
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe016_1
            #add-point:ON ACTION controlp INFIELD stbe016

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe026_1
            #add-point:BEFORE FIELD stbe026

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe026_1
            
            #add-point:AFTER FIELD stbe026

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe026
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe026_1
            #add-point:ON ACTION controlp INFIELD stbe026

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe027_1
            #add-point:BEFORE FIELD stbe027

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe027_1
            
            #add-point:AFTER FIELD stbe027

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe027
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe027_1
            #add-point:ON ACTION controlp INFIELD stbe027

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe017_1
            #add-point:BEFORE FIELD stbe017

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe017_1
            
            #add-point:AFTER FIELD stbe017

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe017
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe017_1
            #add-point:ON ACTION controlp INFIELD stbe017

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe018_1
            #add-point:BEFORE FIELD stbe018

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe018_1
            
            #add-point:AFTER FIELD stbe018

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe018
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe018_1
            #add-point:ON ACTION controlp INFIELD stbe018

            #END add-point
         
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe031_1
            #add-point:BEFORE FIELD stbe031_1

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe031_1
            
            #add-point:AFTER FIELD stbe031_1

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe018
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe031_1
            #add-point:ON ACTION controlp INFIELD stbe031_1

            #END add-point
         
         #Ctrlp:construct.c.page1.stbesite
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbesite_1
            #add-point:ON ACTION controlp INFIELD stbesite
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbesite',g_site,'c')
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbesite_1  #顯示到畫面上
            NEXT FIELD stbesite_1                     #返回原欄位
    


            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbesite_1
            #add-point:BEFORE FIELD stbesite

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbesite_1
            
            #add-point:AFTER FIELD stbesite

            #END add-point
            
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe020_1
            #add-point:BEFORE FIELD stbe020

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe020_1
            
            #add-point:AFTER FIELD stbe020

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe020
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe020_1
            #add-point:ON ACTION controlp INFIELD stbe020

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe019_1
            #add-point:BEFORE FIELD stbe019

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe019_1
            
            #add-point:AFTER FIELD stbe019

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbe019
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe019_1
            #add-point:ON ACTION controlp INFIELD stbe019

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbe032_1
            #add-point:BEFORE FIELD stbe032_1

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbe032_1
            
            #add-point:AFTER FIELD stbe032_1

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbecomp
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbe032_1
            #add-point:ON ACTION controlp INFIELD stbe032_1

            #END add-point
         
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbecomp_1
            #add-point:BEFORE FIELD stbecomp

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbecomp_1
            
            #add-point:AFTER FIELD stbecomp

            #END add-point
            
 
         #Ctrlp:construct.c.page1.stbecomp
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbecomp_1
            #add-point:ON ACTION controlp INFIELD stbecomp

            #END add-point
 
   
       
      END CONSTRUCT
      
      #add by geza 20151119(S)
      CONSTRUCT g_wc3 ON stevdocno,stevseq,stev001,stev002,stev003,stev004,stev024,stev005,stev026,stev027,stev006,stev007, 
          stev008,stev009,stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev028,stev029,stev017,stev018,stevsite, 
          stev020,stev019,stev030
           FROM s_detail4[1].stevdocno,s_detail4[1].stevseq,s_detail4[1].stev001,s_detail4[1].stev002,s_detail4[1].stev003,
               s_detail4[1].stev004,s_detail4[1].stev024,s_detail4[1].stev005,s_detail4[1].stev026,s_detail4[1].stev027,
               s_detail4[1].stev006,s_detail4[1].stev007, 
               s_detail4[1].stev008,s_detail4[1].stev009,s_detail4[1].stev010,s_detail4[1].stev011,s_detail4[1].stev012, 
               s_detail4[1].stev013,s_detail4[1].stev014,s_detail4[1].stev015,s_detail4[1].stev016,
               s_detail4[1].stev028,s_detail4[1].stev029,s_detail4[1].stev017, 
               s_detail4[1].stev018,s_detail4[1].stevsite,s_detail4[1].stev020,s_detail4[1].stev019,s_detail4[1].stev030
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct
           
          #Ctrlp:construct.c.page1.stbe028
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stevdocno
            #add-point:ON ACTION controlp INFIELD stev024
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stevdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stevdocno  #顯示到畫面上
            NEXT FIELD stevdocno   
            #END add-point
  
         #Ctrlp:construct.c.page1.stbe028
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stev024
            #add-point:ON ACTION controlp INFIELD stev024
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stev024  #顯示到畫面上
            NEXT FIELD stev024   
            #END add-point

         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stev008
            #add-point:ON ACTION controlp INFIELD stbe008
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stev008  #顯示到畫面上
            NEXT FIELD stev008                     #返回原欄位
    
         #Ctrlp:construct.c.page1.stbe009
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stev009
            #add-point:ON ACTION controlp INFIELD stbe009
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stev009  #顯示到畫面上
            NEXT FIELD stev009                     #返回原欄位

         #Ctrlp:construct.c.page1.stbesite
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stevsite
            #add-point:ON ACTION controlp INFIELD stbesite
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stevsite',g_site,'c')
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stevsite  #顯示到畫面上
            NEXT FIELD stevsite                     #返回原欄位


      END CONSTRUCT
      #add by geza 20151119(E)
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stbd_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbe_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbf_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
   IF g_wc2_table2 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt340_filter()
   #add-point:filter段define name="filter.define_customerization"
   
   #end add-point   
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="filter.pre_function"
   
   #end add-point
   
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON stbdsite,stbddocno,stbddocdt,stbd001,stbd002,stbd003,stbd004,stbd005, 
          stbd006
                          FROM s_browse[1].b_stbdsite,s_browse[1].b_stbddocno,s_browse[1].b_stbddocdt, 
                              s_browse[1].b_stbd001,s_browse[1].b_stbd002,s_browse[1].b_stbd003,s_browse[1].b_stbd004, 
                              s_browse[1].b_stbd005,s_browse[1].b_stbd006
 
         BEFORE CONSTRUCT
               DISPLAY astt340_filter_parser('stbdsite') TO s_browse[1].b_stbdsite
            DISPLAY astt340_filter_parser('stbddocno') TO s_browse[1].b_stbddocno
            DISPLAY astt340_filter_parser('stbddocdt') TO s_browse[1].b_stbddocdt
            DISPLAY astt340_filter_parser('stbd001') TO s_browse[1].b_stbd001
            DISPLAY astt340_filter_parser('stbd002') TO s_browse[1].b_stbd002
            DISPLAY astt340_filter_parser('stbd003') TO s_browse[1].b_stbd003
            DISPLAY astt340_filter_parser('stbd004') TO s_browse[1].b_stbd004
            DISPLAY astt340_filter_parser('stbd005') TO s_browse[1].b_stbd005
            DISPLAY astt340_filter_parser('stbd006') TO s_browse[1].b_stbd006
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         
         #end add-point
      
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   
   END DIALOG
 
   IF NOT INT_FLAG THEN
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
 
      CALL astt340_filter_show('stbdsite')
   CALL astt340_filter_show('stbddocno')
   CALL astt340_filter_show('stbddocdt')
   CALL astt340_filter_show('stbd001')
   CALL astt340_filter_show('stbd002')
   CALL astt340_filter_show('stbd003')
   CALL astt340_filter_show('stbd004')
   CALL astt340_filter_show('stbd005')
   CALL astt340_filter_show('stbd006')
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt340_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point    
   
   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF
 
   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF
 
   RETURN ls_var
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt340_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = astt340_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt340_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF   
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_stbe_d.clear()
   CALL g_stbe3_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt340_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt340_browser_fill("")
      CALL astt340_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL astt340_filter_show('stbdsite')
   CALL astt340_filter_show('stbddocno')
   CALL astt340_filter_show('stbddocdt')
   CALL astt340_filter_show('stbd001')
   CALL astt340_filter_show('stbd002')
   CALL astt340_filter_show('stbd003')
   CALL astt340_filter_show('stbd004')
   CALL astt340_filter_show('stbd005')
   CALL astt340_filter_show('stbd006')
   CALL astt340_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt340_fetch("F") 
      #顯示單身筆數
      CALL astt340_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt340_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_stbd_m.stbddocno = g_browser[g_current_idx].b_stbddocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
   #遮罩相關處理
   LET g_stbd_m_mask_o.* =  g_stbd_m.*
   CALL astt340_stbd_t_mask()
   LET g_stbd_m_mask_n.* =  g_stbd_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt340_set_act_visible()   
   CALL astt340_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
#   IF g_stbd_m.stbd016='N' THEN
#      CALL cl_set_comp_visible("page_5",FALSE)
#   ELSE
#      CALL cl_set_comp_visible("page_5",TRUE)
#   END IF  

   CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)
#   IF g_stbd_m.stbdstus != 'N' THEN
   IF g_stbd_m.stbdstus NOT MATCHES '[NDR]' THEN   #MOD BY zhujing 2015-6-16
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
    #add by geza 20150817(S)
#   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
#   CALL astt340_set_act_visible()   
#   CALL astt340_set_act_no_visible()
   #add by geza 20150817(E)   
   #end add-point
   
   #保存單頭舊值
   LET g_stbd_m_t.* = g_stbd_m.*
   LET g_stbd_m_o.* = g_stbd_m.*
   
   LET g_data_owner = g_stbd_m.stbdownid      
   LET g_data_dept  = g_stbd_m.stbdowndp
   
   #重新顯示   
   CALL astt340_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt340_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_insert       LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   
   
   CALL g_stbe_d_2.clear()
   CALL g_stev_d.clear()    
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stbe_d.clear()   
   CALL g_stbe3_d.clear()  
 
 
   INITIALIZE g_stbd_m.* TO NULL             #DEFAULT 設定
   
   LET g_stbddocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbd_m.stbdownid = g_user
      LET g_stbd_m.stbdowndp = g_dept
      LET g_stbd_m.stbdcrtid = g_user
      LET g_stbd_m.stbdcrtdp = g_dept 
      LET g_stbd_m.stbdcrtdt = cl_get_current()
      LET g_stbd_m.stbdmodid = g_user
      LET g_stbd_m.stbdmoddt = cl_get_current()
      LET g_stbd_m.stbdstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stbd_m.stbd043 = "0"
      LET g_stbd_m.stbd044 = "0"
      LET g_stbd_m.stbd007 = "0"
      LET g_stbd_m.stbd008 = "0"
      LET g_stbd_m.stbd009 = "0"
      LET g_stbd_m.stbd010 = "0"
      LET g_stbd_m.stbd011 = "0"
      LET g_stbd_m.stbd045 = "0"
      LET g_stbd_m.stbd012 = "0"
      LET g_stbd_m.stbd013 = "0"
      LET g_stbd_m.stbd014 = "0"
      LET g_stbd_m.stbd015 = "0"
      LET g_stbd_m.stbd040 = "0"
      LET g_stbd_m.stbd017 = "0"
      LET g_stbd_m.stbd018 = "0"
      LET g_stbd_m.stbd019 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stbd_m_t.* = g_stbd_m.*
#      LET g_stbd_m.stbdsite=g_site

      LET r_insert=TRUE
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stbdsite',g_stbd_m.stbdsite) RETURNING r_insert,g_stbd_m.stbdsite
      IF NOT r_insert THEN
         RETURN 
      END IF
      #add by geza 20151120(S)
      #根据结算门店抓取结算法人
      SELECT ooef017 INTO g_stbd_m.stbd048 
        FROM ooef_t
       WHERE ooefent=g_enterprise
         AND ooef001=g_stbd_m.stbdsite
      CALL astt340_stbd048_ref()   
      #add by geza 20151120(E)
      LET g_stbd_m.stbddocdt=g_today
      LET g_stbd_m.stbd023=g_site
      LET g_stbd_m.stbdstus='N'
      LET g_stbd_m.stbd007=0
      LET g_stbd_m.stbd008=0
      LET g_stbd_m.stbd009=0
      LET g_stbd_m.stbd010=0
      LET g_stbd_m.stbd011=0
      LET g_stbd_m.stbd012=0
      LET g_stbd_m.stbd013=0
      LET g_stbd_m.stbd014=0
      LET g_stbd_m.stbd015=0
      LET g_stbd_m.stbd016='Y'
      LET g_stbd_m.stbd017=0
      LET g_stbd_m.stbd018=0
      LET g_stbd_m.stbd019=0
      LET g_stbd_m.stbd020='0'
      LET g_stbd_m.stbd021=g_user
      LET g_stbd_m.stbd022=g_dept      
      LET g_stbd_m.stbd039='1' #add by geza 20150707  
     ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stbd_m.stbdsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stbd_m.stbddocno = r_doctype
      
      SELECT ooefl003 INTO g_stbd_m.stbdsite_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stbd_m.stbdsite
         AND ooefl002=g_dlang  
         
      SELECT ooefl003 INTO g_stbd_m.stbd023_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stbd_m.stbd023
         AND ooefl002=g_dlang
         
      SELECT oofa011 INTO g_stbd_m.stbd021_desc
        FROM oofa_t
       WHERE oofa002='2'
         AND oofa003=g_stbd_m.stbd021
         AND oofaent = g_enterprise #add by geza 20170122 #170122-00004#2
         
      SELECT ooefl003 INTO g_stbd_m.stbd022_desc
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stbd_m.stbd022
         AND ooefl002=g_dlang        
         
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbd_m.stbdownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbd_m.stbdownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbd_m.stbdownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbd_m.stbdowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbd_m.stbdowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbd_m.stbdowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbd_m.stbdcrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbd_m.stbdcrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbd_m.stbdcrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbd_m.stbdcrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbd_m.stbdcrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbd_m.stbdcrtdp_desc
      
      IF g_type = '1' THEN
         LET g_stbd_m.stbd000= '1'
      ELSE
         LET g_stbd_m.stbd000= '2'
      END IF
      
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stbd_m_t.* = g_stbd_m.*
      LET g_stbd_m_o.* = g_stbd_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbd_m.stbdstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "J"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/reconciliate.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astt340_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_stbd_m.* TO NULL
         INITIALIZE g_stbe_d TO NULL
         INITIALIZE g_stbe3_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt340_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stbe_d.clear()
      #CALL g_stbe3_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt340_set_act_visible()   
   CALL astt340_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbddocno_t = g_stbd_m.stbddocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbdent = " ||g_enterprise|| " AND",
                      " stbddocno = '", g_stbd_m.stbddocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt340_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt340_cl
   
   CALL astt340_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
   
   #遮罩相關處理
   LET g_stbd_m_mask_o.* =  g_stbd_m.*
   CALL astt340_stbd_t_mask()
   LET g_stbd_m_mask_n.* =  g_stbd_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048, 
       g_stbd_m.stbd048_desc,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd037_desc,g_stbd_m.stbd002, 
       g_stbd_m.stbd002_desc,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbdunit_desc, 
       g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005, 
       g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp, 
       g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt, 
       g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
       g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
       g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018, 
       g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd021_desc,g_stbd_m.stbd022, 
       g_stbd_m.stbd022_desc,g_stbd_m.stbd023,g_stbd_m.stbd023_desc,g_stbd_m.stbd024,g_stbd_m.stbd025, 
       g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd046_desc,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc,g_stbd_m.stbd031,g_stbd_m.stbd032
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stbd_m.stbdownid      
   LET g_data_dept  = g_stbd_m.stbdowndp
   
   #功能已完成,通報訊息中心
   CALL astt340_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt340_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stbd_m_t.* = g_stbd_m.*
   LET g_stbd_m_o.* = g_stbd_m.*
   
   IF g_stbd_m.stbddocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stbddocno_t = g_stbd_m.stbddocno
 
   CALL s_transaction_begin()
   
   OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt340_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
   #檢查是否允許此動作
   IF NOT astt340_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbd_m_mask_o.* =  g_stbd_m.*
   CALL astt340_stbd_t_mask()
   LET g_stbd_m_mask_n.* =  g_stbd_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astt340_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stbddocno_t = g_stbd_m.stbddocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stbd_m.stbdmodid = g_user 
LET g_stbd_m.stbdmoddt = cl_get_current()
LET g_stbd_m.stbdmodid_desc = cl_get_username(g_stbd_m.stbdmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stbd_m.stbdstus MATCHES "[DR]" THEN
         LET g_stbd_m.stbdstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt340_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stbd_t SET (stbdmodid,stbdmoddt) = (g_stbd_m.stbdmodid,g_stbd_m.stbdmoddt)
          WHERE stbdent = g_enterprise AND stbddocno = g_stbddocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stbd_m.* = g_stbd_m_t.*
            CALL astt340_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stbd_m.stbddocno != g_stbd_m_t.stbddocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stbe_t SET stbedocno = g_stbd_m.stbddocno
 
          WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m_t.stbddocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbe_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update2"
         
         #end add-point
         
         UPDATE stbf_t
            SET stbfdocno = g_stbd_m.stbddocno
 
          WHERE stbfent = g_enterprise AND
                stbfdocno = g_stbddocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbf_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt340_set_act_visible()   
   CALL astt340_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stbdent = " ||g_enterprise|| " AND",
                      " stbddocno = '", g_stbd_m.stbddocno, "' "
 
   #填到對應位置
   CALL astt340_browser_fill("")
 
   CLOSE astt340_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt340_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt340.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt340_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               STRING
   DEFINE  l_oodb006             LIKE oodb_t.oodb006
   DEFINE  l_stbddocno           LIKE stbd_t.stbddocno
   DEFINE  l_stbd005             LIKE stbd_t.stbd005
   DEFINE  l_ooef016             LIKE ooef_t.ooef016
   DEFINE  l_ooef019             LIKE ooef_t.ooef019     #150505-00016#1--add by dongsz
   DEFINE  l_stbc034             LIKE stbc_t.stbc034
   DEFINE  p_success             LIKE type_t.num5
   DEFINE  r_success             LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048, 
       g_stbd_m.stbd048_desc,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd037_desc,g_stbd_m.stbd002, 
       g_stbd_m.stbd002_desc,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbdunit_desc, 
       g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005, 
       g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp, 
       g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt, 
       g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
       g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
       g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018, 
       g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd021_desc,g_stbd_m.stbd022, 
       g_stbd_m.stbd022_desc,g_stbd_m.stbd023,g_stbd_m.stbd023_desc,g_stbd_m.stbd024,g_stbd_m.stbd025, 
       g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd046_desc,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc,g_stbd_m.stbd031,g_stbd_m.stbd032
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025, 
       stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe026, 
       stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp FROM stbe_t  
       WHERE stbeent=? AND stbedocno=? AND stbeseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt340_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stbfseq,stbf001,stbf002,stbf003,stbf004,stbf005,stbf006,stbf007,stbf008  
       FROM stbf_t WHERE stbfent=? AND stbfdocno=? AND stbfseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt340_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   #add by geza 20151119(S)
   LET g_forupd_sql = "SELECT stevdocno,stevseq,stev001,stev002,stev003,stev004,stev024,stev005,stev026,stev027,
       stev006,stev007,stev008,stev009,stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev028,stev029,
       stev017,stev018,stevsite,stev020,stev019,stev030 FROM stev_t  
       WHERE stevent=? AND stevdocno=? AND stevseq=? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt340_bcl3 CURSOR FROM g_forupd_sql
   #add by geza 20151119(E)
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt340_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt340_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000, 
       g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039, 
       g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005,g_stbd_m.stbd006, 
       g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010, 
       g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014,g_stbd_m.stbd015, 
       g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020, 
       g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024,g_stbd_m.stbd025, 
       g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028,g_stbd_m.stbd029, 
       g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd023, 
       g_stbd_m.stbd023_desc,g_stbd_m.stbd002,g_stbd_m.stbd002_desc,g_stbd_m.stbd003,g_stbd_m.stbd004, 
       g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp, 
       g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt, 
       g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
       g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020, 
       g_stbd_m.stbd021,g_stbd_m.stbd021_desc,g_stbd_m.stbd022,g_stbd_m.stbd022_desc,g_stbd_m.stbd001, 
       g_stbd_m.stbd024,g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd027,g_stbd_m.stbd028,g_stbd_m.stbd033, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc,g_stbd_m.stbd031,g_stbd_m.stbd032  
   IF g_action = 'N' THEN            #150505-00016#1--add by dongsz
      LET l_allow_insert=FALSE
      LET l_allow_delete=FALSE
   END IF                            #150505-00016#1--add by dongsz
   LET l_allow_delete=TRUE           #20150709 By shi 可以开放删除
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt340.input.head" >}
      #單頭段
      INPUT BY NAME g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000, 
          g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039, 
          g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005,g_stbd_m.stbd006, 
          g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010, 
          g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014,g_stbd_m.stbd015, 
          g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020, 
          g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024,g_stbd_m.stbd025, 
          g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028,g_stbd_m.stbd029, 
          g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt340_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt340_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt340_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL astt340_set_entry(p_cmd)
            CALL astt340_set_no_entry(p_cmd)
            IF p_cmd = 'a' THEN
               IF NOT cl_null(g_stbd_m.stbdsite) AND NOT cl_null(g_stbd_m.stbddocdt) THEN
                  CALL s_asti206_check(g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     LET g_stbd_m.stbddocdt=''
                  END IF
                END IF
            END IF
            #end add-point
            CALL astt340_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdsite
            
            #add-point:AFTER FIELD stbdsite name="input.a.stbdsite"
            IF  NOT cl_null(g_stbd_m.stbdsite) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbdsite != g_stbd_m_t.stbdsite )) THEN      #160824-00007#182 Mark By Ken 161112
               IF (g_stbd_m.stbdsite != g_stbd_m_o.stbdsite ) THEN       #160824-00007#182 Add By Ken 161112
                  CALL s_aooi500_chk(g_prog,'stbdsite',g_stbd_m.stbdsite,g_stbd_m.stbdsite)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stbd_m.stbdsite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     #LET g_stbd_m.stbdsite = g_stbd_m_t.stbdsite   #160824-00007#182 Mark By Ken 161112
                     LET g_stbd_m.stbdsite = g_stbd_m_o.stbdsite    #160824-00007#182 Add By Ken 161112
                     NEXT FIELD CURRENT
                  END IF
                   LET g_site_flag = TRUE
                   CALL astt340_set_entry(p_cmd)
                   CALL astt340_set_no_entry(p_cmd)
                   #add by geza 20151120(S)
                   #根据结算门店抓取结算法人
                   SELECT ooef017 INTO g_stbd_m.stbd048 
                     FROM ooef_t
                    WHERE ooefent=g_enterprise
                      AND ooef001=g_stbd_m.stbdsite
                   CALL astt340_stbd048_ref()   
                   #add by geza 20151120(E)
               END IF
               IF NOT cl_null(g_stbd_m.stbddocdt) THEN
                  CALL s_asti206_check(g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     #LET g_stbd_m.stbdsite = g_stbd_m_t.stbdsite   #160824-00007#182 Mark By Ken 161112
                     LET g_stbd_m.stbdsite = g_stbd_m_o.stbdsite    #160824-00007#182 Add By Ken 161112                     
                     NEXT FIELD CURRENT
                  END IF
               END IF
               
            END IF      
            
           
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbdsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbdsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbdsite_desc
            LET g_stbd_m_o.* = g_stbd_m.*   #160824-00007#182 Add By Ken 161112                     

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdsite
            #add-point:BEFORE FIELD stbdsite name="input.b.stbdsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbdsite
            #add-point:ON CHANGE stbdsite name="input.g.stbdsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbddocdt
            #add-point:BEFORE FIELD stbddocdt name="input.b.stbddocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbddocdt
            
            #add-point:AFTER FIELD stbddocdt name="input.a.stbddocdt"
           IF  NOT cl_null(g_stbd_m.stbddocdt) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbddocdt != g_stbd_m_t.stbddocdt )) THEN
                  #結算會計期檢查
                  IF NOT cl_null(g_stbd_m.stbdsite) AND NOT cl_null(g_stbd_m.stbddocdt) THEN
                     CALL s_asti206_check(g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stbd_m.stbddocdt = g_stbd_m_t.stbddocdt
                        NEXT FIELD CURRENT
                     END IF
                  END IF

               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbddocdt
            #add-point:ON CHANGE stbddocdt name="input.g.stbddocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbddocno
            #add-point:BEFORE FIELD stbddocno name="input.b.stbddocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbddocno
            
            #add-point:AFTER FIELD stbddocno name="input.a.stbddocno"
            #此段落由子樣板a05產生
            ##########################
            IF NOT cl_null(g_stbd_m.stbddocno) AND p_cmd = 'a' THEN
               IF NOT s_aooi200_chk_slip(g_site,'',g_stbd_m.stbddocno,g_prog) THEN
                  LET g_stbd_m.stbddocno = g_stbd_m_t.stbddocno
                  NEXT FIELD CURRENT
               END IF
            END IF
            ###########################
            IF  NOT cl_null(g_stbd_m.stbddocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbddocno != g_stbddocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbd_t WHERE "||"stbdent = '" ||g_enterprise|| "' AND "||"stbddocno = '"||g_stbd_m.stbddocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbddocno
            #add-point:ON CHANGE stbddocno name="input.g.stbddocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd048
            
            #add-point:AFTER FIELD stbd048 name="input.a.stbd048"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd048
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd048_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd048_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd048
            #add-point:BEFORE FIELD stbd048 name="input.b.stbd048"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd048
            #add-point:ON CHANGE stbd048 name="input.g.stbd048"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd000
            #add-point:BEFORE FIELD stbd000 name="input.b.stbd000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd000
            
            #add-point:AFTER FIELD stbd000 name="input.a.stbd000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd000
            #add-point:ON CHANGE stbd000 name="input.g.stbd000"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd037
            
            #add-point:AFTER FIELD stbd037 name="input.a.stbd037"
            IF NOT cl_null(g_stbd_m.stbd037) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbd_m.stbd037

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhae001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               
               IF g_type = '2' THEN
                  IF NOT cl_null(g_stbd_m.stbd037) THEN 
                     IF NOT astt340_stbd037_chk(p_cmd) THEN   #add by geza 20150605
                        #LET g_stbd_m.stbd037 = g_stbd_m_t.stbd037  #160824-00007#182 Mark By Ken 161112
                        LET g_stbd_m.stbd037 = g_stbd_m_o.stbd037   #160824-00007#182 Add By Ken 161112
                        CALL astt340_stbd037_ref()
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF

            END IF 
     
            
            LET g_stbd_m_t.stbd037 = g_stbd_m.stbd037
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd037
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd037_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd037_desc
            #150619-00007#17 查询出合同编号、供应商编号、经营方式
            SELECT stfa001,stfa010,stfa003 INTO g_stbd_m.stbd001,g_stbd_m.stbd002,g_stbd_m.stbd003
              FROM stfa_t
             WHERE stfa005=g_stbd_m.stbd037
               AND stfaent=g_enterprise
            #150629-00016#10 根据专柜编号从astm401带出对应的合同状态
            SELECT stfa004 INTO  g_stbd_m.stbd041
              FROM stfa_t
             WHERE stfa005=g_stbd_m.stbd037
               AND stfaent=g_enterprise
            DISPLAY BY NAME g_stbd_m.stbd041
            LET g_stbd_m_o.* = g_stbd_m.*   #160824-00007#182 Add By Ken 161112
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd037
            #add-point:BEFORE FIELD stbd037 name="input.b.stbd037"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd037
            #add-point:ON CHANGE stbd037 name="input.g.stbd037"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd002
            
            #add-point:AFTER FIELD stbd002 name="input.a.stbd002"
            IF  NOT cl_null(g_stbd_m.stbd002) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbd002 != g_stbd_m_t.stbd002 )) THEN     #160824-00007#182 Mark By Ken 161112
               IF (g_stbd_m.stbd002 != g_stbd_m_o.stbd002 ) THEN     #160824-00007#182 Add By Ken 161112
                  IF NOT  astt340_stbd002_chk(p_cmd) THEN
                     #LET g_stbd_m.stbd002 =  g_stbd_m_t.stbd002   #160824-00007#182 Mark By Ken 161112
                     LET g_stbd_m.stbd002 =  g_stbd_m_o.stbd002    #160824-00007#182 Add By Ken 161112
                     CALL astt340_stbd002_ref()
                     NEXT FIELD CURRENT
                  END IF
                  #add by geza 20150604                               
                  IF cl_null(g_stbd_m.stbd001) THEN 
                     IF g_type = '1'  THEN                   
                        CALL  astt340_stbd002_other()
                     ELSE              
                        CALL  astt340_stbd002_other2()
                     END IF
                  END IF
                  
                  #add by geza 20150604   
                 ###################################mark by huangtao    
                 #INITIALIZE g_chkparam.* TO NULL
                 #  #設定g_chkparam.*的參數
                 #LET g_chkparam.arg1 = g_stbd_m.stbd002
                 #IF NOT cl_chk_exist("v_pmaa001_1") THEN
                 #   LET g_stbd_m.stbd002 =  g_stbd_m_t.stbd002
                 #   NEXT FIELD CURRENT
                 #END IF
                 #
                 #LET l_count=0
                 #SELECT COUNT(*) INTO l_count
                 #  FROM stbd_t
                 # WHERE stbdent=g_enterprise
                 #   AND stbd002=g_stbd_m.stbd002
                 #   AND stbdstus='N'
                 #IF NOT cl_null(l_count) AND l_count>0 THEN
                 #   INITIALIZE g_errparam TO NULL
                 #   LET g_errparam.code = "ast-00039"
                 #   LET g_errparam.extend = g_stbd_m.stbd002
                 #   LET g_errparam.popup = TRUE
                 #   CALL cl_err()
                 #
                 #   LET g_stbd_m.stbd002 =  g_stbd_m_t.stbd002
                 #   NEXT FIELD CURRENT
                 #END IF        
                 # IF NOT cl_null(g_stbd_m.stbd005) AND NOT cl_null(g_stbd_m.stbd006) THEN
                 #    IF g_stbd_m.stbd006<g_stbd_m.stbd005 THEN
                 #       INITIALIZE g_errparam TO NULL
                 #       LET g_errparam.code = "ast-00041"
                 #       LET g_errparam.extend = g_stbd_m.stbd006
                 #       LET g_errparam.popup = TRUE
                 #       CALL cl_err()
                 #
                 #       NEXT FIELD stbd006
                 #    END IF
                 # END IF  
                 #############################mark by huangtao  
                END IF
            END IF          
            CALL astt340_stbd002_ref()
            LET g_stbd_m_t.* = g_stbd_m.*
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd002
            #add-point:BEFORE FIELD stbd002 name="input.b.stbd002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd002
            #add-point:ON CHANGE stbd002 name="input.g.stbd002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd001
            #add-point:BEFORE FIELD stbd001 name="input.b.stbd001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd001
            
            #add-point:AFTER FIELD stbd001 name="input.a.stbd001"
            IF  NOT cl_null(g_stbd_m.stbd001) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbd001 != g_stbd_m_t.stbd001 )) THEN    #160824-00007#182 Mark By Ken 161112
               IF (g_stbd_m.stbd001 != g_stbd_m_o.stbd001 ) THEN    #160824-00007#182 Add By Ken 161112
                  INITIALIZE g_chkparam.* TO NULL		      
                      #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stbd_m.stbd001  
                  #mark  by geza 20150608(S)                 
#                  IF NOT cl_chk_exist("v_stan001") THEN
#                    LET g_stbd_m.stbd001 = g_stbd_m_t.stbd001              
#                     NEXT FIELD CURRENT
#                  END IF 
                  #mark  by geza 20150608(E)
                  #add  by geza 20150608(S)
                  IF g_type = '1' THEN
                     IF NOT cl_chk_exist("v_stan001") THEN
                        #LET g_stbd_m.stbd001  = g_stbd_m_t.stbd001   #160824-00007#182 Mark By Ken 161112     
                        LET g_stbd_m.stbd001  = g_stbd_m_o.stbd001    #160824-00007#182 Add By Ken 161112
                        NEXT FIELD CURRENT
                     END IF 
                  ELSE
                     IF NOT cl_chk_exist("v_stfa001") THEN
                        #LET g_stbd_m.stbd001  = g_stbd_m_t.stbd001   #160824-00007#182 Mark By Ken 161112     
                        LET g_stbd_m.stbd001  = g_stbd_m_o.stbd001    #160824-00007#182 Add By Ken 161112              
                        NEXT FIELD CURRENT
                     END IF 
                  END IF
                  #add  by geza 20150608(E)
                   #是否存此合約在未確認的結算單
                  #20150709 By shi Mark
#                  LET l_count=0 
#                  SELECT COUNT(*) INTO l_count
#                    FROM stbd_t
#                   WHERE stbdent=g_enterprise
#                     AND stbd001=g_stbd_m.stbd001
#                     AND stbdstus='N'
#                  IF NOT cl_null(l_count) AND l_count>0 THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = "ast-00092"
#                     LET g_errparam.extend = g_stbd_m.stbd001
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#
#                     LET g_stbd_m.stbd001 = g_stbd_m_t.stbd001
#                     NEXT FIELD CURRENT
#                  END IF 
                   #20150709 By shi Mark  
#                  CALL astt340_stbd001_other() #mark by geza 20150605
                  #add by geza--(S)---
                  IF g_type = '1' THEN
                     CALL astt340_stbd001_other()
                  ELSE
                     CALL astt340_stbd001_other2()
                  END IF
                  #add by geza--(E)---
                  
                  #150501-00002#2--add by dongsz--str---
                  #IF NOT astt340_stbd002_chk(p_cmd) THEN   #mark by geza 20150605
                  IF NOT astt340_stbd001_chk(p_cmd) THEN   #add by geza 20150605
                     LET g_stbd_m.stbd001 = g_stbd_m_t.stbd001
                     LET g_stbd_m.stbd037 = g_stbd_m_t.stbd037
                     CALL astt340_stbd037_ref()
                     LET g_stbd_m.stbd002 = g_stbd_m_t.stbd002
                     CALL astt340_stbd002_ref()
                     LET g_stbd_m.stbd003 = g_stbd_m_t.stbd003
                     LET g_stbd_m.stbd004 = g_stbd_m_t.stbd004
                     LET g_stbd_m.stbd005 = g_stbd_m_t.stbd005
                     LET g_stbd_m.stbd006 = g_stbd_m_t.stbd006
                     LET g_stbd_m.stax004 = g_stbd_m_t.stax004
                     DISPLAY BY NAME g_stbd_m.stax004
                     LET g_stbd_m.stbdunit = g_stbd_m_t.stbdunit   #add by geza 20150810
                     LET g_stbd_m.stbd041 = g_stbd_m_t.stbd041     #add by geza 20150810
                     INITIALIZE g_ref_fields TO NULL
                     LET g_ref_fields[1] = g_stbd_m.stbdunit
                     CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
                     LET g_stbd_m.stbdunit_desc = '', g_rtn_fields[1] , ''
                     DISPLAY BY NAME g_stbd_m.stbdunit_desc
                     #add by geza 20151116(S)
                     LET g_stbd_m.stbd046 = g_stbd_m_t.stbd046
                     CALL s_desc_get_trading_partner_abbr_desc(g_stbd_m.stbd046) RETURNING g_stbd_m.stbd046_desc
                     DISPLAY BY NAME g_stbd_m.stbd046
                     DISPLAY BY NAME g_stbd_m.stbd046_desc
                     #add by geza 20151116(E)
                     #add by geza 20151116(S)
                     LET g_stbd_m.stbd042 = g_stbd_m_t.stbd042
                     LET g_stbd_m.stbd043 = g_stbd_m_t.stbd043
                     LET g_stbd_m.stbd044 = g_stbd_m_t.stbd044
                     DISPLAY BY NAME g_stbd_m.stbd042
                     DISPLAY BY NAME g_stbd_m.stbd043
                     DISPLAY BY NAME g_stbd_m.stbd044
                     #add by geza 20151116(E)
                     NEXT FIELD CURRENT                     
                  END IF
                  #add by geza--(S)---
#                  IF g_type = '1' THEN
#                     CALL astt340_stbd001_other()
#                  ELSE
#                     CALL astt340_stbd001_other2()
#                  END IF
                  #add by geza--(E)---
                  #150501-00002#2--add by dongsz--end---
               END IF
            END IF 
            LET g_stbd_m_t.* = g_stbd_m.*
            LET g_stbd_m_o.* = g_stbd_m.*  #160824-00007#182 Add By Ken 161112
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd001
            #add-point:ON CHANGE stbd001 name="input.g.stbd001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd003
            #add-point:BEFORE FIELD stbd003 name="input.b.stbd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd003
            
            #add-point:AFTER FIELD stbd003 name="input.a.stbd003"
         IF NOT cl_null(g_stbd_m.stbd002) THEN
         #
         #   SELECT stan001,stan017 INTO g_stbd_m.stbd001,g_stbd_m.stbd005
         #     FROM stan_t
         #    WHERE stanent=g_enterprise
         #      AND stan005=g_stbd_m.stbd002
         #      AND stan002=g_stbd_m.stbd003
         #      AND stanstus='Y' 
         #
         #   LET l_stbddocno=''
         #   SELECT MAX(stbddocno) INTO l_stbddocno
         #     FROM stbd_t
         #    WHERE stbdent=g_enterprise
         #      AND stbd002=g_stbd_m.stbd002
         #      AND stbd003=g_stbd_m.stbd003 
         #      AND stbdstus<>'X'
         #
         #   LET l_stbd005=''               
         #   SELECT stbd006+1 INTO l_stbd005
         #     FROM stbd_t
         #    WHERE stbdent=g_enterprise
         #      AND stbd002=g_stbd_m.stbd002
         #      AND stbd003=g_stbd_m.stbd003
         #      AND stbddocno=l_stbddocno
         #      AND stbdstus<>'X'
         #                        
         #  IF NOT cl_null(l_stbd005) THEN
         #     LET g_stbd_m.stbd005= l_stbd005
         #  END IF                
         #   
         #   DISPLAY BY NAME g_stbd_m.stbd005              
         #   DISPLAY BY NAME g_stbd_m.stbd001
         #  END IF
         #   IF NOT cl_null(g_stbd_m.stbd005) AND NOT cl_null(g_stbd_m.stbd006) THEN
         #      IF g_stbd_m.stbd006<g_stbd_m.stbd005 THEN
         #         INITIALIZE g_errparam TO NULL
         #         LET g_errparam.code = "ast-00041"
         #         LET g_errparam.extend = g_stbd_m.stbd006
         #         LET g_errparam.popup = TRUE
         #         CALL cl_err()
         #
         #         NEXT FIELD stbd006
         #      END IF
              IF NOT astt340_stbd002_chk(p_cmd) THEN
                 #LET g_stbd_m.stbd002 =  g_stbd_m_t.stbd002   #160824-00007#182 Mark By Ken 161112
                 LET g_stbd_m.stbd002 =  g_stbd_m_o.stbd002    #160824-00007#182 Add By Ken 161112
                 CALL astt340_stbd002_ref()
                 NEXT FIELD CURRENT
              END IF
              CALL astt340_stbd002_other()
            END IF            
            LET g_stbd_m_o.* = g_stbd_m.*  #160824-00007#182 Add By Ken 161112
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd003
            #add-point:ON CHANGE stbd003 name="input.g.stbd003"
        #  IF NOT cl_null(g_stbd_m.stbd002) THEN
        #  
        #     SELECT stan001,stan017 INTO g_stbd_m.stbd001,g_stbd_m.stbd005
        #       FROM stan_t
        #      WHERE stanent=g_enterprise
        #        AND stan005=g_stbd_m.stbd002
        #        AND stan002=g_stbd_m.stbd003
        #        AND stanstus='Y' 
        #
        #     LET l_stbddocno=''
        #     SELECT MAX(stbddocno) INTO l_stbddocno
        #       FROM stbd_t
        #      WHERE stbdent=g_enterprise
        #        AND stbd002=g_stbd_m.stbd002
        #        AND stbd003=g_stbd_m.stbd003 
        #        AND stbdstus<>'X'
        #
        #     LET l_stbd005=''               
        #     SELECT stbd006+1 INTO l_stbd005
        #       FROM stbd_t
        #      WHERE stbdent=g_enterprise
        #        AND stbd002=g_stbd_m.stbd002
        #        AND stbd003=g_stbd_m.stbd003
        #        AND stbddocno=l_stbddocno
        #        AND stbdstus<>'X'
        #                          
        #    IF NOT cl_null(l_stbd005) THEN
        #       LET g_stbd_m.stbd005= l_stbd005
        #    END IF                    
        #
        #     DISPLAY BY NAME g_stbd_m.stbd005              
        #     DISPLAY BY NAME g_stbd_m.stbd001
        #  END IF
        #   IF NOT cl_null(g_stbd_m.stbd005) AND NOT cl_null(g_stbd_m.stbd006) THEN
        #      IF g_stbd_m.stbd006<g_stbd_m.stbd005 THEN
        #         INITIALIZE g_errparam TO NULL
        #         LET g_errparam.code = "ast-00041"
        #         LET g_errparam.extend = g_stbd_m.stbd006
        #         LET g_errparam.popup = TRUE
        #         CALL cl_err()
        #
        #         NEXT FIELD stbd006
        #      END IF
        #   END IF           
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdunit
            
            #add-point:AFTER FIELD stbdunit name="input.a.stbdunit"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbdunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbdunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbdunit_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdunit
            #add-point:BEFORE FIELD stbdunit name="input.b.stbdunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbdunit
            #add-point:ON CHANGE stbdunit name="input.g.stbdunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd039
            #add-point:BEFORE FIELD stbd039 name="input.b.stbd039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd039
            
            #add-point:AFTER FIELD stbd039 name="input.a.stbd039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd039
            #add-point:ON CHANGE stbd039 name="input.g.stbd039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd043
            #add-point:BEFORE FIELD stbd043 name="input.b.stbd043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd043
            
            #add-point:AFTER FIELD stbd043 name="input.a.stbd043"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd043
            #add-point:ON CHANGE stbd043 name="input.g.stbd043"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd044
            #add-point:BEFORE FIELD stbd044 name="input.b.stbd044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd044
            
            #add-point:AFTER FIELD stbd044 name="input.a.stbd044"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd044
            #add-point:ON CHANGE stbd044 name="input.g.stbd044"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd004
            #add-point:BEFORE FIELD stbd004 name="input.b.stbd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd004
            
            #add-point:AFTER FIELD stbd004 name="input.a.stbd004"
         #150619-00007#17 查询出结算日期，起始日期，结束日期
         SELECT stfj004,stfj002,stfj003 INTO g_stbd_m.stax004,g_stbd_m.stbd005,g_stbd_m.stbd006
           FROM stfj_t,stbd_t
          WHERE stfjseq=g_stbd_m.stbd004
            AND stfjent=g_enterprise
            AND stfj001 = g_stbd_m.stbd001
            DISPLAY BY NAME g_stbd_m.stax004
            DISPLAY BY NAME g_stbd_m.stbd005
            DISPLAY BY NAME g_stbd_m.stbd006
            LET g_stbd_m_o.* = g_stbd_m.*  #160824-00007#182 Add By Ken 161112
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd004
            #add-point:ON CHANGE stbd004 name="input.g.stbd004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stax004
            #add-point:BEFORE FIELD stax004 name="input.b.stax004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stax004
            
            #add-point:AFTER FIELD stax004 name="input.a.stax004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stax004
            #add-point:ON CHANGE stax004 name="input.g.stax004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd005
            #add-point:BEFORE FIELD stbd005 name="input.b.stbd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd005
            
            #add-point:AFTER FIELD stbd005 name="input.a.stbd005"
            IF NOT cl_null(g_stbd_m.stbd005) THEN
               IF NOT cl_null(g_stbd_m.stbd006) THEN   
                  IF g_stbd_m.stbd006<g_stbd_m.stbd005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00041"
                     LET g_errparam.extend = g_stbd_m.stbd005
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     #LET g_stbd_m.stbd005 =  g_stbd_m_t.stbd005   #160824-00007#182 Mark By Ken 161112
                     LET g_stbd_m.stbd005 =  g_stbd_m_o.stbd005    #160824-00007#182 Add By Ken 161112
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            LET g_stbd_m_t.stbd005 =  g_stbd_m.stbd005 
            LET g_stbd_m_o.* =  g_stbd_m.*   #160824-00007#182 Add By Ken 161112
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd005
            #add-point:ON CHANGE stbd005 name="input.g.stbd005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd006
            #add-point:BEFORE FIELD stbd006 name="input.b.stbd006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd006
            
            #add-point:AFTER FIELD stbd006 name="input.a.stbd006"
            IF  NOT cl_null(g_stbd_m.stbd006) THEN 
            #mark by geza 20150713(S)
#               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbd_m.stbd006 != g_stbd_m_t.stbd006 )) THEN 
#                  IF g_stbd_m.stbd006>g_today THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = "ast-00040"
#                     LET g_errparam.extend = g_stbd_m.stbd006
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#
#                     LET g_stbd_m.stbd006 =  g_stbd_m_t.stbd006
#                     NEXT FIELD CURRENT
#                  END IF                    
#                            
#               END IF
               #mark by geza 20150713(E)
               IF NOT cl_null(g_stbd_m.stbd005) THEN
                  IF g_stbd_m.stbd006<g_stbd_m.stbd005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00041"
                     LET g_errparam.extend = g_stbd_m.stbd006
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
               
                     #LET g_stbd_m.stbd006 =  g_stbd_m_t.stbd006  #160824-00007#182 Mark By Ken 161112
                     LET g_stbd_m.stbd006 =  g_stbd_m_o.stbd006   #160824-00007#182 Add By Ken 161112
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF            
            LET g_stbd_m_t.stbd006 =  g_stbd_m.stbd006 
            LET g_stbd_m_o.* =  g_stbd_m.*   #160824-00007#182 Add By Ken 161112

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd006
            #add-point:ON CHANGE stbd006 name="input.g.stbd006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd038
            #add-point:BEFORE FIELD stbd038 name="input.b.stbd038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd038
            
            #add-point:AFTER FIELD stbd038 name="input.a.stbd038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd038
            #add-point:ON CHANGE stbd038 name="input.g.stbd038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbdstus
            #add-point:BEFORE FIELD stbdstus name="input.b.stbdstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbdstus
            
            #add-point:AFTER FIELD stbdstus name="input.a.stbdstus"
            #150629-00016#10  审核结算单
            IF g_stbd_m.stbd041='4' THEN
               IF cl_get_para(g_enterprise,g_site,'S-CIR-2007') ='Y' THEN 
               INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "ast-00385" 
                  LET g_errparam.popup  = FALSE   
                  CALL cl_err()
               ELSE 
               IF cl_get_para(g_enterprise,g_site,'S-CIR-2007') ='N' THEN
               INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "ast-00386" 
                  LET g_errparam.popup  = FALSE   
                  CALL cl_err()
                  NEXT FIELD stbdstus                  
               END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbdstus
            #add-point:ON CHANGE stbdstus name="input.g.stbdstus"
 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd007
            #add-point:BEFORE FIELD stbd007 name="input.b.stbd007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd007
            
            #add-point:AFTER FIELD stbd007 name="input.a.stbd007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd007
            #add-point:ON CHANGE stbd007 name="input.g.stbd007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd008
            #add-point:BEFORE FIELD stbd008 name="input.b.stbd008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd008
            
            #add-point:AFTER FIELD stbd008 name="input.a.stbd008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd008
            #add-point:ON CHANGE stbd008 name="input.g.stbd008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd009
            #add-point:BEFORE FIELD stbd009 name="input.b.stbd009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd009
            
            #add-point:AFTER FIELD stbd009 name="input.a.stbd009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd009
            #add-point:ON CHANGE stbd009 name="input.g.stbd009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd010
            #add-point:BEFORE FIELD stbd010 name="input.b.stbd010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd010
            
            #add-point:AFTER FIELD stbd010 name="input.a.stbd010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd010
            #add-point:ON CHANGE stbd010 name="input.g.stbd010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd011
            #add-point:BEFORE FIELD stbd011 name="input.b.stbd011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd011
            
            #add-point:AFTER FIELD stbd011 name="input.a.stbd011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd011
            #add-point:ON CHANGE stbd011 name="input.g.stbd011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd045
            #add-point:BEFORE FIELD stbd045 name="input.b.stbd045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd045
            
            #add-point:AFTER FIELD stbd045 name="input.a.stbd045"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd045
            #add-point:ON CHANGE stbd045 name="input.g.stbd045"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd012
            #add-point:BEFORE FIELD stbd012 name="input.b.stbd012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd012
            
            #add-point:AFTER FIELD stbd012 name="input.a.stbd012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd012
            #add-point:ON CHANGE stbd012 name="input.g.stbd012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd013
            #add-point:BEFORE FIELD stbd013 name="input.b.stbd013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd013
            
            #add-point:AFTER FIELD stbd013 name="input.a.stbd013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd013
            #add-point:ON CHANGE stbd013 name="input.g.stbd013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd014
            #add-point:BEFORE FIELD stbd014 name="input.b.stbd014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd014
            
            #add-point:AFTER FIELD stbd014 name="input.a.stbd014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd014
            #add-point:ON CHANGE stbd014 name="input.g.stbd014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd015
            #add-point:BEFORE FIELD stbd015 name="input.b.stbd015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd015
            
            #add-point:AFTER FIELD stbd015 name="input.a.stbd015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd015
            #add-point:ON CHANGE stbd015 name="input.g.stbd015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd040
            #add-point:BEFORE FIELD stbd040 name="input.b.stbd040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd040
            
            #add-point:AFTER FIELD stbd040 name="input.a.stbd040"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd040
            #add-point:ON CHANGE stbd040 name="input.g.stbd040"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd016
            #add-point:BEFORE FIELD stbd016 name="input.b.stbd016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd016
            
            #add-point:AFTER FIELD stbd016 name="input.a.stbd016"
#            IF g_stbd_m.stbd016='N' THEN
#               CALL cl_set_comp_visible("page_5",FALSE)
#            ELSE
#               CALL cl_set_comp_visible("page_5",TRUE)
#            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd016
            #add-point:ON CHANGE stbd016 name="input.g.stbd016"

             SELECT ooef016 INTO l_ooef016 FROM ooef_t
              WHERE ooefent=g_enterprise AND ooef001=g_stbd_m.stbdsite             
            IF g_stbd_m.stbd016='Y' THEN           
               LET g_stbd_m.stbd017=g_stbd_m.stbd013-g_stbd_m.stbd014-g_stbd_m.stbd015
            ELSE
               LET g_stbd_m.stbd017=g_stbd_m.stbd013-g_stbd_m.stbd014
            END IF

            IF cl_null(g_stbd_m.stbd017) THEN 
               LET g_stbd_m.stbd017=0
            END IF    
            CALL s_curr_round(g_stbd_m.stbdsite,l_ooef016,g_stbd_m.stbd017,'2') RETURNING g_stbd_m.stbd017            
            
            #實際結算金額
            IF g_stbd_m.stbd016='Y'  THEN 
               SELECT SUM(stbe016*stbe011) INTO g_stbd_m.stbd018 FROM stbe_t
                WHERE stbeent=g_enterprise AND stbedocno=g_stbd_m.stbddocno 
                           
            ELSE
                SELECT SUM(stbe016*stbe011) INTO g_stbd_m.stbd018 FROM stbe_t
                 WHERE stbeent=g_enterprise AND stbedocno=g_stbd_m.stbddocno 
                  #AND NOT (stbe001 = '3' AND  stbe010 = '2')   #150204-00001#27 By shi
                   AND NOT (stbe001 = '3' AND  stbe010 = '1')   #150204-00001#27 By shi
            END IF
            IF cl_null(g_stbd_m.stbd018) THEN 
               LET g_stbd_m.stbd018=0
            END IF  
            CALL s_curr_round(g_stbd_m.stbdsite,l_ooef016,g_stbd_m.stbd018,'2') RETURNING g_stbd_m.stbd018
            
            #本期結存金額
            LET g_stbd_m.stbd019=g_stbd_m.stbd017-g_stbd_m.stbd018
            IF cl_null(g_stbd_m.stbd019) THEN 
               LET g_stbd_m.stbd019=0
            END IF          
            CALL s_curr_round(g_stbd_m.stbdsite,l_ooef016,g_stbd_m.stbd019,'2') RETURNING g_stbd_m.stbd019
            DISPLAY BY NAME g_stbd_m.stbd017   
            DISPLAY BY NAME g_stbd_m.stbd018
            DISPLAY BY NAME g_stbd_m.stbd019        
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd017
            #add-point:BEFORE FIELD stbd017 name="input.b.stbd017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd017
            
            #add-point:AFTER FIELD stbd017 name="input.a.stbd017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd017
            #add-point:ON CHANGE stbd017 name="input.g.stbd017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd018
            #add-point:BEFORE FIELD stbd018 name="input.b.stbd018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd018
            
            #add-point:AFTER FIELD stbd018 name="input.a.stbd018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd018
            #add-point:ON CHANGE stbd018 name="input.g.stbd018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd019
            #add-point:BEFORE FIELD stbd019 name="input.b.stbd019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd019
            
            #add-point:AFTER FIELD stbd019 name="input.a.stbd019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd019
            #add-point:ON CHANGE stbd019 name="input.g.stbd019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd020
            #add-point:BEFORE FIELD stbd020 name="input.b.stbd020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd020
            
            #add-point:AFTER FIELD stbd020 name="input.a.stbd020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd020
            #add-point:ON CHANGE stbd020 name="input.g.stbd020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd042
            #add-point:BEFORE FIELD stbd042 name="input.b.stbd042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd042
            
            #add-point:AFTER FIELD stbd042 name="input.a.stbd042"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd042
            #add-point:ON CHANGE stbd042 name="input.g.stbd042"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd021
            
            #add-point:AFTER FIELD stbd021 name="input.a.stbd021"
            IF NOT cl_null(g_stbd_m.stbd021) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND g_stbd_m.stbd021 != g_stbd_m_t.stbd021) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stbd_m.stbd021
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooag001") THEN
                     LET g_stbd_m.stbd021 =  g_stbd_m_t.stbd021
                     NEXT FIELD CURRENT
                  END IF

               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd021
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd021_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd021
            #add-point:BEFORE FIELD stbd021 name="input.b.stbd021"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd021
            #add-point:ON CHANGE stbd021 name="input.g.stbd021"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd022
            
            #add-point:AFTER FIELD stbd022 name="input.a.stbd022"
            IF NOT cl_null(g_stbd_m.stbd022) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND g_stbd_m.stbd022 != g_stbd_m_t.stbd022) THEN
                 INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stbd_m.stbd022
                  LET g_chkparam.arg2 = g_today
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                        #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                     LET g_stbd_m.stbd022 = g_stbd_m_t.stbd022
                     NEXT FIELD CURRENT
                  END IF

               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd022
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd022_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd022_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd022
            #add-point:BEFORE FIELD stbd022 name="input.b.stbd022"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd022
            #add-point:ON CHANGE stbd022 name="input.g.stbd022"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd023
            
            #add-point:AFTER FIELD stbd023 name="input.a.stbd023"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd023
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd023_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd023_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd023
            #add-point:BEFORE FIELD stbd023 name="input.b.stbd023"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd023
            #add-point:ON CHANGE stbd023 name="input.g.stbd023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd024
            #add-point:BEFORE FIELD stbd024 name="input.b.stbd024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd024
            
            #add-point:AFTER FIELD stbd024 name="input.a.stbd024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd024
            #add-point:ON CHANGE stbd024 name="input.g.stbd024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd025
            #add-point:BEFORE FIELD stbd025 name="input.b.stbd025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd025
            
            #add-point:AFTER FIELD stbd025 name="input.a.stbd025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd025
            #add-point:ON CHANGE stbd025 name="input.g.stbd025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd026
            #add-point:BEFORE FIELD stbd026 name="input.b.stbd026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd026
            
            #add-point:AFTER FIELD stbd026 name="input.a.stbd026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd026
            #add-point:ON CHANGE stbd026 name="input.g.stbd026"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd046
            
            #add-point:AFTER FIELD stbd046 name="input.a.stbd046"
            IF NOT cl_null(g_stbd_m.stbd046) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbd_m.stbd046

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_pmaa001_1") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  #LET g_stbd_m.stbd046 = g_stbd_m_t.stbd046  #160824-00007#182 Mark By Ken 161112
                  LET g_stbd_m.stbd046 = g_stbd_m_o.stbd046   #160824-00007#182 Add By Ken 161112
                  CALL s_desc_get_trading_partner_abbr_desc(g_stbd_m.stbd046) RETURNING g_stbd_m.stbd046_desc
                  DISPLAY BY NAME g_stbd_m.stbd046_desc
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd046
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd046_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd046_desc
            LET g_stbd_m_o.* = g_stbd_m.*   #160824-00007#182 Add By Ken 161112

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd046
            #add-point:BEFORE FIELD stbd046 name="input.b.stbd046"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd046
            #add-point:ON CHANGE stbd046 name="input.g.stbd046"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd033
            #add-point:BEFORE FIELD stbd033 name="input.b.stbd033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd033
            
            #add-point:AFTER FIELD stbd033 name="input.a.stbd033"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd033
            #add-point:ON CHANGE stbd033 name="input.g.stbd033"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd027
            #add-point:BEFORE FIELD stbd027 name="input.b.stbd027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd027
            
            #add-point:AFTER FIELD stbd027 name="input.a.stbd027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd027
            #add-point:ON CHANGE stbd027 name="input.g.stbd027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd028
            #add-point:BEFORE FIELD stbd028 name="input.b.stbd028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd028
            
            #add-point:AFTER FIELD stbd028 name="input.a.stbd028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd028
            #add-point:ON CHANGE stbd028 name="input.g.stbd028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd029
            #add-point:BEFORE FIELD stbd029 name="input.b.stbd029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd029
            
            #add-point:AFTER FIELD stbd029 name="input.a.stbd029"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd029
            #add-point:ON CHANGE stbd029 name="input.g.stbd029"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd030
            
            #add-point:AFTER FIELD stbd030 name="input.a.stbd030"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd030
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd030_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd030_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd030
            #add-point:BEFORE FIELD stbd030 name="input.b.stbd030"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd030
            #add-point:ON CHANGE stbd030 name="input.g.stbd030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd031
            #add-point:BEFORE FIELD stbd031 name="input.b.stbd031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd031
            
            #add-point:AFTER FIELD stbd031 name="input.a.stbd031"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd031
            #add-point:ON CHANGE stbd031 name="input.g.stbd031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbd032
            #add-point:BEFORE FIELD stbd032 name="input.b.stbd032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbd032
            
            #add-point:AFTER FIELD stbd032 name="input.a.stbd032"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbd032
            #add-point:ON CHANGE stbd032 name="input.g.stbd032"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stbdsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdsite
            #add-point:ON ACTION controlp INFIELD stbdsite name="input.c.stbdsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbdsite            #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbdsite',g_stbd_m.stbdsite,'i')
            CALL q_ooef001_24()

            LET g_stbd_m.stbdsite = g_qryparam.return1              

            DISPLAY g_stbd_m.stbdsite TO stbdsite              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbdsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbdsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbdsite_desc
            
            NEXT FIELD stbdsite                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stbddocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbddocdt
            #add-point:ON ACTION controlp INFIELD stbddocdt name="input.c.stbddocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbddocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbddocno
            #add-point:ON ACTION controlp INFIELD stbddocno name="input.c.stbddocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbddocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise            
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stbd_m.stbddocno = g_qryparam.return1              

            DISPLAY g_stbd_m.stbddocno TO stbddocno              #

            NEXT FIELD stbddocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd048
            #add-point:ON ACTION controlp INFIELD stbd048 name="input.c.stbd048"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd000
            #add-point:ON ACTION controlp INFIELD stbd000 name="input.c.stbd000"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd037
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd037
            #add-point:ON ACTION controlp INFIELD stbd037 name="input.c.stbd037"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd037             #給予default值
            LET g_qryparam.default2 = "" #g_stbd_m.mhael023 #简称
            #給予arg
            LET g_qryparam.arg1 = g_stbd_m.stbdsite


            CALL q_mhae001()                                #呼叫開窗

            LET g_stbd_m.stbd037 = g_qryparam.return1              
            #LET g_stbd_m.mhael023 = g_qryparam.return2 
            DISPLAY g_stbd_m.stbd037 TO stbd037              #
            #DISPLAY g_stbd_m.mhael023 TO mhael023 #简称
            NEXT FIELD stbd037                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd002
            #add-point:ON ACTION controlp INFIELD stbd002 name="input.c.stbd002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd002             #給予default值
            LET g_qryparam.default2 = "" #g_stbd_m.pmaal004 #交易對象簡稱
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_10()                                #呼叫開窗

            LET g_stbd_m.stbd002 = g_qryparam.return1              
            #LET g_stbd_m.pmaal004 = g_qryparam.return2 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd002_desc            
            DISPLAY g_stbd_m.stbd002 TO stbd002              #
            #DISPLAY g_stbd_m.pmaal004 TO pmaal004 #交易對象簡稱
            NEXT FIELD stbd002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd001
            #add-point:ON ACTION controlp INFIELD stbd001 name="input.c.stbd001"
             INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd001             #給予default值
            LET g_qryparam.default2 = "" 
            #給予arg
            LET g_qryparam.arg1 = "" #
             #add by geza 20150602(S)
            IF g_type='1' THEN
               IF NOT cl_null(g_stbd_m.stbd002) THEN
                  LET g_qryparam.where = " stan005 = '",g_stbd_m.stbd002,"'"
               END IF
               CALL q_stan001_2()    
            ELSE
               IF NOT cl_null(g_stbd_m.stbd002) THEN
                  LET g_qryparam.where = " stfa010 = '",g_stbd_m.stbd002,"'"
               END IF
               CALL q_stfa001()  
            END IF 
            #add by geza 20150602(E) 

            LET g_stbd_m.stbd001 = g_qryparam.return1 
            DISPLAY g_stbd_m.stbd001 TO stbd001
#            LET g_stbd_m.stbd002 = g_qryparam.return2      #mark  by geza 20150605  
            NEXT FIELD stbd001
            #END add-point
 
 
         #Ctrlp:input.c.stbd003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd003
            #add-point:ON ACTION controlp INFIELD stbd003 name="input.c.stbd003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbdunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdunit
            #add-point:ON ACTION controlp INFIELD stbdunit name="input.c.stbdunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd039
            #add-point:ON ACTION controlp INFIELD stbd039 name="input.c.stbd039"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd043
            #add-point:ON ACTION controlp INFIELD stbd043 name="input.c.stbd043"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd044
            #add-point:ON ACTION controlp INFIELD stbd044 name="input.c.stbd044"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd004
            #add-point:ON ACTION controlp INFIELD stbd004 name="input.c.stbd004"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd004            #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stbd_m.stbd004 #s
            LET g_qryparam.where = " stfj001 = '",g_stbd_m.stbd001,"'"
            

            CALL q_stfj004()                                #呼叫開窗

            LET g_stbd_m.stbd004 = g_qryparam.return1              

            DISPLAY g_stbd_m.stbd004 TO stbd004              #

            NEXT FIELD stbd004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stax004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stax004
            #add-point:ON ACTION controlp INFIELD stax004 name="input.c.stax004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd005
            #add-point:ON ACTION controlp INFIELD stbd005 name="input.c.stbd005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd006
            #add-point:ON ACTION controlp INFIELD stbd006 name="input.c.stbd006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd038
            #add-point:ON ACTION controlp INFIELD stbd038 name="input.c.stbd038"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbdstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbdstus
            #add-point:ON ACTION controlp INFIELD stbdstus name="input.c.stbdstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd007
            #add-point:ON ACTION controlp INFIELD stbd007 name="input.c.stbd007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd008
            #add-point:ON ACTION controlp INFIELD stbd008 name="input.c.stbd008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd009
            #add-point:ON ACTION controlp INFIELD stbd009 name="input.c.stbd009"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd010
            #add-point:ON ACTION controlp INFIELD stbd010 name="input.c.stbd010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd011
            #add-point:ON ACTION controlp INFIELD stbd011 name="input.c.stbd011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd045
            #add-point:ON ACTION controlp INFIELD stbd045 name="input.c.stbd045"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd012
            #add-point:ON ACTION controlp INFIELD stbd012 name="input.c.stbd012"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd013
            #add-point:ON ACTION controlp INFIELD stbd013 name="input.c.stbd013"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd014
            #add-point:ON ACTION controlp INFIELD stbd014 name="input.c.stbd014"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd015
            #add-point:ON ACTION controlp INFIELD stbd015 name="input.c.stbd015"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd040
            #add-point:ON ACTION controlp INFIELD stbd040 name="input.c.stbd040"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd016
            #add-point:ON ACTION controlp INFIELD stbd016 name="input.c.stbd016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd017
            #add-point:ON ACTION controlp INFIELD stbd017 name="input.c.stbd017"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd018
            #add-point:ON ACTION controlp INFIELD stbd018 name="input.c.stbd018"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd019
            #add-point:ON ACTION controlp INFIELD stbd019 name="input.c.stbd019"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd020
            #add-point:ON ACTION controlp INFIELD stbd020 name="input.c.stbd020"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd042
            #add-point:ON ACTION controlp INFIELD stbd042 name="input.c.stbd042"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd021
            #add-point:ON ACTION controlp INFIELD stbd021 name="input.c.stbd021"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd021             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stbd_m.stbd021 = g_qryparam.return1              

            DISPLAY g_stbd_m.stbd021 TO stbd021              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd021
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd021_desc
            NEXT FIELD stbd021                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd022
            #add-point:ON ACTION controlp INFIELD stbd022 name="input.c.stbd022"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd022             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today

            
            CALL q_ooeg001_4()                                #呼叫開窗

            LET g_stbd_m.stbd022 = g_qryparam.return1              

            DISPLAY g_stbd_m.stbd022 TO stbd022              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbd_m.stbd022
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbd_m.stbd022_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbd_m.stbd022_desc
            NEXT FIELD stbd022                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd023
            #add-point:ON ACTION controlp INFIELD stbd023 name="input.c.stbd023"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd024
            #add-point:ON ACTION controlp INFIELD stbd024 name="input.c.stbd024"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd025
            #add-point:ON ACTION controlp INFIELD stbd025 name="input.c.stbd025"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd026
            #add-point:ON ACTION controlp INFIELD stbd026 name="input.c.stbd026"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd046
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd046
            #add-point:ON ACTION controlp INFIELD stbd046 name="input.c.stbd046"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbd_m.stbd046             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stbd_m.stbd002
            LET g_qryparam.where = " pmac003 = '1' "  #付款

            CALL q_pmac002_2()                                #呼叫開窗

            LET g_stbd_m.stbd046 = g_qryparam.return1              

            DISPLAY g_stbd_m.stbd046 TO stbd046              #

            NEXT FIELD stbd046                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbd033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd033
            #add-point:ON ACTION controlp INFIELD stbd033 name="input.c.stbd033"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd027
            #add-point:ON ACTION controlp INFIELD stbd027 name="input.c.stbd027"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd028
            #add-point:ON ACTION controlp INFIELD stbd028 name="input.c.stbd028"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd029
            #add-point:ON ACTION controlp INFIELD stbd029 name="input.c.stbd029"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd030
            #add-point:ON ACTION controlp INFIELD stbd030 name="input.c.stbd030"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd031
            #add-point:ON ACTION controlp INFIELD stbd031 name="input.c.stbd031"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbd032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbd032
            #add-point:ON ACTION controlp INFIELD stbd032 name="input.c.stbd032"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stbd_m.stbddocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_stbd_m.stbddocno,g_stbd_m.stbddocdt,g_prog) RETURNING l_success,g_stbd_m.stbddocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stbd_m.stbddocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG                  
               END IF 
               #end add-point
               
               INSERT INTO stbd_t (stbdent,stbdsite,stbddocdt,stbddocno,stbd048,stbd000,stbd037,stbd002, 
                   stbd001,stbd041,stbd003,stbdunit,stbd039,stbd043,stbd044,stbd004,stbd005,stbd006, 
                   stbd038,stbdstus,stbdownid,stbdowndp,stbdcrtid,stbdcrtdp,stbdcrtdt,stbdmodid,stbdmoddt, 
                   stbdcnfid,stbdcnfdt,stbd007,stbd008,stbd009,stbd010,stbd011,stbd045,stbd012,stbd013, 
                   stbd014,stbd015,stbd040,stbd016,stbd017,stbd018,stbd019,stbd020,stbd042,stbd021,stbd022, 
                   stbd023,stbd024,stbd025,stbd026,stbd046,stbd033,stbd027,stbd028,stbd029,stbd030,stbd031, 
                   stbd032)
               VALUES (g_enterprise,g_stbd_m.stbdsite,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048, 
                   g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001,g_stbd_m.stbd041, 
                   g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
                   g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus, 
                   g_stbd_m.stbdownid,g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt, 
                   g_stbd_m.stbdmodid,g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007, 
                   g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045, 
                   g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040, 
                   g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020, 
                   g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
                   g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027, 
                   g_stbd_m.stbd028,g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stbd_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               #新增單頭后，自動帶出單身           
               IF l_cmd_t <>'r' AND p_cmd = 'a' THEN
               #150619-00007#17 
                  #mark by geza 20151118(S)
#                  CALL astt340_stbe_insert() RETURNING l_success
#                  IF NOT l_success THEN
#                     CALL s_transaction_end('N','0')
#                     CONTINUE DIALOG                  
#                  END IF
                  #mark by geza 20151118(E)
#                  CALL astt340_01(g_stbd_m.stbddocno) # By shi 20150710
#                 CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
##            #150619-00007#17   根据单据日期带出单身资料 
##            CALL astt340_stbc_insert() RETURNING p_success  
                  #add by geza 20151118(S)         
                  CALL astt340_01(g_stbd_m.stbddocno) # By shi 20150710
                  #是否启用交款汇总单为N,纳入结算单否为N写入交款明细单身
                  #add by geza 20151119(S)
                  IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
                    CALL astt340_stev_fill2()                    
                  END IF 
                  #add by geza 20151119(E)
                  CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
                  #add by geza 20151118(E) 
                  CALL astt340_stbd_show()
                  CALL astt340_b_fill()
                  CALL astt340_stbe2_fill2()# By shi 20150710
                  CALL astt340_stbe3_fill() # By shi 20150710  
                  CALL astt340_stbe4_fill()   #add by geza 20150802                  
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt340_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt340_b_fill()
                  CALL astt340_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt340_stbd_t_mask_restore('restore_mask_o')
               
               UPDATE stbd_t SET (stbdsite,stbddocdt,stbddocno,stbd048,stbd000,stbd037,stbd002,stbd001, 
                   stbd041,stbd003,stbdunit,stbd039,stbd043,stbd044,stbd004,stbd005,stbd006,stbd038, 
                   stbdstus,stbdownid,stbdowndp,stbdcrtid,stbdcrtdp,stbdcrtdt,stbdmodid,stbdmoddt,stbdcnfid, 
                   stbdcnfdt,stbd007,stbd008,stbd009,stbd010,stbd011,stbd045,stbd012,stbd013,stbd014, 
                   stbd015,stbd040,stbd016,stbd017,stbd018,stbd019,stbd020,stbd042,stbd021,stbd022,stbd023, 
                   stbd024,stbd025,stbd026,stbd046,stbd033,stbd027,stbd028,stbd029,stbd030,stbd031,stbd032) = (g_stbd_m.stbdsite, 
                   g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037, 
                   g_stbd_m.stbd002,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit, 
                   g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stbd005, 
                   g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdowndp, 
                   g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmoddt, 
                   g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
                   g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
                   g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017, 
                   g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021, 
                   g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024,g_stbd_m.stbd025,g_stbd_m.stbd026, 
                   g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028,g_stbd_m.stbd029, 
                   g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032)
                WHERE stbdent = g_enterprise AND stbddocno = g_stbddocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stbd_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
               CALL astt340_stbd_show()
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt340_stbd_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stbd_m_t)
               LET g_log2 = util.JSON.stringify(g_stbd_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stbddocno_t = g_stbd_m.stbddocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt340.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbe_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            #单身没资料关闭单身
            LET l_cnt = 0
            SELECT COUNT(*) INTO l_cnt 
              FROM stbe_t 
             WHERE stbeent = g_enterprise 
               AND stbedocno = g_stbd_m.stbddocno
            IF l_cnt = 0  THEN
               EXIT DIALOG
            END IF 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbe_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt340_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stbe_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt340_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt340_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbe_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbe_d[l_ac].stbeseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbe_d_t.* = g_stbe_d[l_ac].*  #BACKUP
               LET g_stbe_d_o.* = g_stbe_d[l_ac].*  #BACKUP
               CALL astt340_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt340_set_no_entry_b(l_cmd)
               IF NOT astt340_lock_b("stbe_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt340_bcl INTO g_stbe_d[l_ac].stbeseq,g_stbe_d[l_ac].stbe001,g_stbe_d[l_ac].stbe002, 
                      g_stbe_d[l_ac].stbe003,g_stbe_d[l_ac].stbe004,g_stbe_d[l_ac].stbe028,g_stbe_d[l_ac].stbe005, 
                      g_stbe_d[l_ac].stbe024,g_stbe_d[l_ac].stbe025,g_stbe_d[l_ac].stbe006,g_stbe_d[l_ac].stbe007, 
                      g_stbe_d[l_ac].stbe008,g_stbe_d[l_ac].stbe009,g_stbe_d[l_ac].stbe010,g_stbe_d[l_ac].stbe011, 
                      g_stbe_d[l_ac].stbe012,g_stbe_d[l_ac].stbe013,g_stbe_d[l_ac].stbe014,g_stbe_d[l_ac].stbe015, 
                      g_stbe_d[l_ac].stbe016,g_stbe_d[l_ac].stbe026,g_stbe_d[l_ac].stbe027,g_stbe_d[l_ac].stbe017, 
                      g_stbe_d[l_ac].stbe018,g_stbe_d[l_ac].stbe033,g_stbe_d[l_ac].stbe031,g_stbe_d[l_ac].stbesite, 
                      g_stbe_d[l_ac].stbe020,g_stbe_d[l_ac].stbe019,g_stbe_d[l_ac].stbe032,g_stbe_d[l_ac].stbecomp 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbe_d_t.stbeseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbe_d_mask_o[l_ac].* =  g_stbe_d[l_ac].*
                  CALL astt340_stbe_t_mask()
                  LET g_stbe_d_mask_n[l_ac].* =  g_stbe_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt340_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            IF l_cmd = 'a' THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stbe_d[l_ac].* TO NULL 
            INITIALIZE g_stbe_d_t.* TO NULL 
            INITIALIZE g_stbe_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stbe_d[l_ac].stbe012 = "0"
      LET g_stbe_d[l_ac].stbe013 = "0"
      LET g_stbe_d[l_ac].stbe014 = "0"
      LET g_stbe_d[l_ac].stbe015 = "0"
      LET g_stbe_d[l_ac].stbe016 = "0"
      LET g_stbe_d[l_ac].stbe026 = "0"
      LET g_stbe_d[l_ac].stbe027 = "0"
      LET g_stbe_d[l_ac].stbe031 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
     #       LET g_stbe_d[l_ac].stbe028 = g_stbd_m.stbd037   #专柜赋值  add by geza
            #end add-point
            LET g_stbe_d_t.* = g_stbe_d[l_ac].*     #新輸入資料
            LET g_stbe_d_o.* = g_stbe_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt340_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt340_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbe_d[li_reproduce_target].* = g_stbe_d[li_reproduce].*
 
               LET g_stbe_d[li_reproduce_target].stbeseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbe_t 
             WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m.stbddocno
 
               AND stbeseq = g_stbe_d[l_ac].stbeseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbd_m.stbddocno
               LET gs_keys[2] = g_stbe_d[g_detail_idx].stbeseq
               CALL astt340_insert_b('stbe_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stbe_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt340_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stbd_m.stbddocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbe_d_t.stbeseq
 
            
               #刪除同層單身
               IF NOT astt340_delete_b('stbe_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt340_key_delete_b(gs_keys,'stbe_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               #20150709 By shi Add
                UPDATE stbc_t SET stbcstus = (CASE WHEN stbc020>0 THEN '3' ELSE '1' END )
                 WHERE stbc004 = g_stbe_d[l_ac].stbe002
                   AND stbc005 = g_stbe_d[l_ac].stbe003
                   AND stbcent = g_enterprise #add by geza 20170122 #170122-00004#2
                IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                   INITIALIZE g_errparam TO NULL 
                   LET g_errparam.extend = "" 
                   LET g_errparam.code   = SQLCA.sqlcode
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()
                   CALL s_transaction_end('N','0')
                   CLOSE astt340_bcl
                   CANCEL DELETE
                END IF
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt340_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stbe_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbe_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbeseq
            #add-point:BEFORE FIELD stbeseq name="input.b.page1.stbeseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbeseq
            
            #add-point:AFTER FIELD stbeseq name="input.a.page1.stbeseq"
            #此段落由子樣板a05產生
            IF  g_stbd_m.stbddocno IS NOT NULL AND g_stbe_d[g_detail_idx].stbeseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbd_m.stbddocno != g_stbddocno_t OR g_stbe_d[g_detail_idx].stbeseq != g_stbe_d_t.stbeseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbe_t WHERE "||"stbeent = '" ||g_enterprise|| "' AND "||"stbedocno = '"||g_stbd_m.stbddocno ||"' AND "|| "stbeseq = '"||g_stbe_d[g_detail_idx].stbeseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbeseq
            #add-point:ON CHANGE stbeseq name="input.g.page1.stbeseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe001
            #add-point:BEFORE FIELD stbe001 name="input.b.page1.stbe001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe001
            
            #add-point:AFTER FIELD stbe001 name="input.a.page1.stbe001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe001
            #add-point:ON CHANGE stbe001 name="input.g.page1.stbe001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe002
            #add-point:BEFORE FIELD stbe002 name="input.b.page1.stbe002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe002
            
            #add-point:AFTER FIELD stbe002 name="input.a.page1.stbe002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe002
            #add-point:ON CHANGE stbe002 name="input.g.page1.stbe002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe003
            #add-point:BEFORE FIELD stbe003 name="input.b.page1.stbe003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe003
            
            #add-point:AFTER FIELD stbe003 name="input.a.page1.stbe003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe003
            #add-point:ON CHANGE stbe003 name="input.g.page1.stbe003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe004
            #add-point:BEFORE FIELD stbe004 name="input.b.page1.stbe004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe004
            
            #add-point:AFTER FIELD stbe004 name="input.a.page1.stbe004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe004
            #add-point:ON CHANGE stbe004 name="input.g.page1.stbe004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe028
            
            #add-point:AFTER FIELD stbe028 name="input.a.page1.stbe028"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe028
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stbe028_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stbe028_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe028
            #add-point:BEFORE FIELD stbe028 name="input.b.page1.stbe028"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe028
            #add-point:ON CHANGE stbe028 name="input.g.page1.stbe028"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe005
            
            #add-point:AFTER FIELD stbe005 name="input.a.page1.stbe005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe005
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stbe005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stbe005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe005
            #add-point:BEFORE FIELD stbe005 name="input.b.page1.stbe005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe005
            #add-point:ON CHANGE stbe005 name="input.g.page1.stbe005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe024
            #add-point:BEFORE FIELD stbe024 name="input.b.page1.stbe024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe024
            
            #add-point:AFTER FIELD stbe024 name="input.a.page1.stbe024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe024
            #add-point:ON CHANGE stbe024 name="input.g.page1.stbe024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe025
            #add-point:BEFORE FIELD stbe025 name="input.b.page1.stbe025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe025
            
            #add-point:AFTER FIELD stbe025 name="input.a.page1.stbe025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe025
            #add-point:ON CHANGE stbe025 name="input.g.page1.stbe025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stae003
            #add-point:BEFORE FIELD stae003 name="input.b.page1.stae003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stae003
            
            #add-point:AFTER FIELD stae003 name="input.a.page1.stae003"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stae003
            #add-point:ON CHANGE stae003 name="input.g.page1.stae003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe006
            #add-point:BEFORE FIELD stbe006 name="input.b.page1.stbe006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe006
            
            #add-point:AFTER FIELD stbe006 name="input.a.page1.stbe006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe006
            #add-point:ON CHANGE stbe006 name="input.g.page1.stbe006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe007
            #add-point:BEFORE FIELD stbe007 name="input.b.page1.stbe007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe007
            
            #add-point:AFTER FIELD stbe007 name="input.a.page1.stbe007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe007
            #add-point:ON CHANGE stbe007 name="input.g.page1.stbe007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe008
            
            #add-point:AFTER FIELD stbe008 name="input.a.page1.stbe008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stbe008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stbe008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe008
            #add-point:BEFORE FIELD stbe008 name="input.b.page1.stbe008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe008
            #add-point:ON CHANGE stbe008 name="input.g.page1.stbe008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe009
            
            #add-point:AFTER FIELD stbe009 name="input.a.page1.stbe009"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stbe009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stbe009_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe009
            #add-point:BEFORE FIELD stbe009 name="input.b.page1.stbe009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe009
            #add-point:ON CHANGE stbe009 name="input.g.page1.stbe009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe010
            #add-point:BEFORE FIELD stbe010 name="input.b.page1.stbe010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe010
            
            #add-point:AFTER FIELD stbe010 name="input.a.page1.stbe010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe010
            #add-point:ON CHANGE stbe010 name="input.g.page1.stbe010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe011
            #add-point:BEFORE FIELD stbe011 name="input.b.page1.stbe011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe011
            
            #add-point:AFTER FIELD stbe011 name="input.a.page1.stbe011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe011
            #add-point:ON CHANGE stbe011 name="input.g.page1.stbe011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe012
            #add-point:BEFORE FIELD stbe012 name="input.b.page1.stbe012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe012
            
            #add-point:AFTER FIELD stbe012 name="input.a.page1.stbe012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe012
            #add-point:ON CHANGE stbe012 name="input.g.page1.stbe012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe013
            #add-point:BEFORE FIELD stbe013 name="input.b.page1.stbe013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe013
            
            #add-point:AFTER FIELD stbe013 name="input.a.page1.stbe013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe013
            #add-point:ON CHANGE stbe013 name="input.g.page1.stbe013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe014
            #add-point:BEFORE FIELD stbe014 name="input.b.page1.stbe014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe014
            
            #add-point:AFTER FIELD stbe014 name="input.a.page1.stbe014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe014
            #add-point:ON CHANGE stbe014 name="input.g.page1.stbe014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe015
            #add-point:BEFORE FIELD stbe015 name="input.b.page1.stbe015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe015
            
            #add-point:AFTER FIELD stbe015 name="input.a.page1.stbe015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe015
            #add-point:ON CHANGE stbe015 name="input.g.page1.stbe015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe016
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbe_d[l_ac].stbe016,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbe016
            END IF 
 
 
 
            #add-point:AFTER FIELD stbe016 name="input.a.page1.stbe016"
            IF NOT cl_null(g_stbe_d[l_ac].stbe016) THEN 
               IF g_stbe_d[l_ac].stbe016>g_stbe_d[l_ac].stbe014 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00042"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stbe016
               END IF
               #mark by geza 20150906(S)
#               SELECT stbc034 INTO l_stbc034
#                 FROM stbc_t
#                WHERE stbcent=g_enterprise
#                  AND stbc001=g_stbd_m.stbdsite
#                  AND stbc004=g_stbe_d[l_ac].stbe002
#                  AND stbc005=g_stbe_d[l_ac].stbe003
#               LET g_stbe_d[l_ac].stbe026=g_stbe_d[l_ac].stbe016/g_stbe_d[l_ac].stbe013*l_stbc034
#               
#               DISPLAY BY NAME g_stbe_d[l_ac].stbe026
               #mark by geza 20150906(E)
               #add by geza 20150915(S)
               #对数量进行四舍五入 
               SELECT ROUND(g_stbe_d[l_ac].stbe016/g_stbe_d[l_ac].stbe027,4) INTO g_stbe_d[l_ac].stbe026 FROM dual 
               DISPLAY BY NAME g_stbe_d[l_ac].stbe026
               #add by geza 20150915(E)
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe016
            #add-point:BEFORE FIELD stbe016 name="input.b.page1.stbe016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe016
            #add-point:ON CHANGE stbe016 name="input.g.page1.stbe016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe026
            #add-point:BEFORE FIELD stbe026 name="input.b.page1.stbe026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe026
            
            #add-point:AFTER FIELD stbe026 name="input.a.page1.stbe026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe026
            #add-point:ON CHANGE stbe026 name="input.g.page1.stbe026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe027
            #add-point:BEFORE FIELD stbe027 name="input.b.page1.stbe027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe027
            
            #add-point:AFTER FIELD stbe027 name="input.a.page1.stbe027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe027
            #add-point:ON CHANGE stbe027 name="input.g.page1.stbe027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe017
            #add-point:BEFORE FIELD stbe017 name="input.b.page1.stbe017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe017
            
            #add-point:AFTER FIELD stbe017 name="input.a.page1.stbe017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe017
            #add-point:ON CHANGE stbe017 name="input.g.page1.stbe017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe018
            #add-point:BEFORE FIELD stbe018 name="input.b.page1.stbe018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe018
            
            #add-point:AFTER FIELD stbe018 name="input.a.page1.stbe018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe018
            #add-point:ON CHANGE stbe018 name="input.g.page1.stbe018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe033
            #add-point:BEFORE FIELD stbe033 name="input.b.page1.stbe033"

            IF cl_get_para(g_enterprise,g_site,'S-CIR-2007') ='1'THEN 
            CALL cl_set_comp_visible("stbe033",FALSE)
            ELSE 
            IF cl_get_para(g_enterprise,g_site,'S-CIR-2007') ='2' THEN
            CALL cl_set_comp_visible("stbe033",TRUE)         
            END IF
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe033
            
            #add-point:AFTER FIELD stbe033 name="input.a.page1.stbe033"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe033
            #add-point:ON CHANGE stbe033 name="input.g.page1.stbe033"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe031
            #add-point:BEFORE FIELD stbe031 name="input.b.page1.stbe031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe031
            
            #add-point:AFTER FIELD stbe031 name="input.a.page1.stbe031"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe031
            #add-point:ON CHANGE stbe031 name="input.g.page1.stbe031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbesite
            #add-point:BEFORE FIELD stbesite name="input.b.page1.stbesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbesite
            
            #add-point:AFTER FIELD stbesite name="input.a.page1.stbesite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbesite
            #add-point:ON CHANGE stbesite name="input.g.page1.stbesite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe020
            #add-point:BEFORE FIELD stbe020 name="input.b.page1.stbe020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe020
            
            #add-point:AFTER FIELD stbe020 name="input.a.page1.stbe020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe020
            #add-point:ON CHANGE stbe020 name="input.g.page1.stbe020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe019
            #add-point:BEFORE FIELD stbe019 name="input.b.page1.stbe019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe019
            
            #add-point:AFTER FIELD stbe019 name="input.a.page1.stbe019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe019
            #add-point:ON CHANGE stbe019 name="input.g.page1.stbe019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbe032
            #add-point:BEFORE FIELD stbe032 name="input.b.page1.stbe032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbe032
            
            #add-point:AFTER FIELD stbe032 name="input.a.page1.stbe032"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbe032
            #add-point:ON CHANGE stbe032 name="input.g.page1.stbe032"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbecomp
            #add-point:BEFORE FIELD stbecomp name="input.b.page1.stbecomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbecomp
            
            #add-point:AFTER FIELD stbecomp name="input.a.page1.stbecomp"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbecomp
            #add-point:ON CHANGE stbecomp name="input.g.page1.stbecomp"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbeseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbeseq
            #add-point:ON ACTION controlp INFIELD stbeseq name="input.c.page1.stbeseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe001
            #add-point:ON ACTION controlp INFIELD stbe001 name="input.c.page1.stbe001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe002
            #add-point:ON ACTION controlp INFIELD stbe002 name="input.c.page1.stbe002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe003
            #add-point:ON ACTION controlp INFIELD stbe003 name="input.c.page1.stbe003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe004
            #add-point:ON ACTION controlp INFIELD stbe004 name="input.c.page1.stbe004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe028
            #add-point:ON ACTION controlp INFIELD stbe028 name="input.c.page1.stbe028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe005
            #add-point:ON ACTION controlp INFIELD stbe005 name="input.c.page1.stbe005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe024
            #add-point:ON ACTION controlp INFIELD stbe024 name="input.c.page1.stbe024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe025
            #add-point:ON ACTION controlp INFIELD stbe025 name="input.c.page1.stbe025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stae003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stae003
            #add-point:ON ACTION controlp INFIELD stae003 name="input.c.page1.stae003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe006
            #add-point:ON ACTION controlp INFIELD stbe006 name="input.c.page1.stbe006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe007
            #add-point:ON ACTION controlp INFIELD stbe007 name="input.c.page1.stbe007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe008
            #add-point:ON ACTION controlp INFIELD stbe008 name="input.c.page1.stbe008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe009
            #add-point:ON ACTION controlp INFIELD stbe009 name="input.c.page1.stbe009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe010
            #add-point:ON ACTION controlp INFIELD stbe010 name="input.c.page1.stbe010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe011
            #add-point:ON ACTION controlp INFIELD stbe011 name="input.c.page1.stbe011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe012
            #add-point:ON ACTION controlp INFIELD stbe012 name="input.c.page1.stbe012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe013
            #add-point:ON ACTION controlp INFIELD stbe013 name="input.c.page1.stbe013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe014
            #add-point:ON ACTION controlp INFIELD stbe014 name="input.c.page1.stbe014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe015
            #add-point:ON ACTION controlp INFIELD stbe015 name="input.c.page1.stbe015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe016
            #add-point:ON ACTION controlp INFIELD stbe016 name="input.c.page1.stbe016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe026
            #add-point:ON ACTION controlp INFIELD stbe026 name="input.c.page1.stbe026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe027
            #add-point:ON ACTION controlp INFIELD stbe027 name="input.c.page1.stbe027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe017
            #add-point:ON ACTION controlp INFIELD stbe017 name="input.c.page1.stbe017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe018
            #add-point:ON ACTION controlp INFIELD stbe018 name="input.c.page1.stbe018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe033
            #add-point:ON ACTION controlp INFIELD stbe033 name="input.c.page1.stbe033"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe031
            #add-point:ON ACTION controlp INFIELD stbe031 name="input.c.page1.stbe031"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbesite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbesite
            #add-point:ON ACTION controlp INFIELD stbesite name="input.c.page1.stbesite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe020
            #add-point:ON ACTION controlp INFIELD stbe020 name="input.c.page1.stbe020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe019
            #add-point:ON ACTION controlp INFIELD stbe019 name="input.c.page1.stbe019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbe032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbe032
            #add-point:ON ACTION controlp INFIELD stbe032 name="input.c.page1.stbe032"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbecomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbecomp
            #add-point:ON ACTION controlp INFIELD stbecomp name="input.c.page1.stbecomp"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbe_d[l_ac].* = g_stbe_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt340_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbe_d[l_ac].stbeseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbe_d[l_ac].* = g_stbe_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt340_stbe_t_mask_restore('restore_mask_o')
      
               UPDATE stbe_t SET (stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005, 
                   stbe024,stbe025,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014, 
                   stbe015,stbe016,stbe026,stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020, 
                   stbe019,stbe032,stbecomp) = (g_stbd_m.stbddocno,g_stbe_d[l_ac].stbeseq,g_stbe_d[l_ac].stbe001, 
                   g_stbe_d[l_ac].stbe002,g_stbe_d[l_ac].stbe003,g_stbe_d[l_ac].stbe004,g_stbe_d[l_ac].stbe028, 
                   g_stbe_d[l_ac].stbe005,g_stbe_d[l_ac].stbe024,g_stbe_d[l_ac].stbe025,g_stbe_d[l_ac].stbe006, 
                   g_stbe_d[l_ac].stbe007,g_stbe_d[l_ac].stbe008,g_stbe_d[l_ac].stbe009,g_stbe_d[l_ac].stbe010, 
                   g_stbe_d[l_ac].stbe011,g_stbe_d[l_ac].stbe012,g_stbe_d[l_ac].stbe013,g_stbe_d[l_ac].stbe014, 
                   g_stbe_d[l_ac].stbe015,g_stbe_d[l_ac].stbe016,g_stbe_d[l_ac].stbe026,g_stbe_d[l_ac].stbe027, 
                   g_stbe_d[l_ac].stbe017,g_stbe_d[l_ac].stbe018,g_stbe_d[l_ac].stbe033,g_stbe_d[l_ac].stbe031, 
                   g_stbe_d[l_ac].stbesite,g_stbe_d[l_ac].stbe020,g_stbe_d[l_ac].stbe019,g_stbe_d[l_ac].stbe032, 
                   g_stbe_d[l_ac].stbecomp)
                WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m.stbddocno 
 
                  AND stbeseq = g_stbe_d_t.stbeseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbe_d[l_ac].* = g_stbe_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbe_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbe_d[l_ac].* = g_stbe_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbd_m.stbddocno
               LET gs_keys_bak[1] = g_stbddocno_t
               LET gs_keys[2] = g_stbe_d[g_detail_idx].stbeseq
               LET gs_keys_bak[2] = g_stbe_d_t.stbeseq
               CALL astt340_update_b('stbe_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt340_stbe_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stbe_d[g_detail_idx].stbeseq = g_stbe_d_t.stbeseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stbd_m.stbddocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stbe_d_t.stbeseq
 
                  CALL astt340_key_update_b(gs_keys,'stbe_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stbd_m),util.JSON.stringify(g_stbe_d_t)
               LET g_log2 = util.JSON.stringify(g_stbd_m),util.JSON.stringify(g_stbe_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt340_unlock_b("stbe_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"

            
               CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
               CALL astt340_stbd_show()
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbe_d[li_reproduce_target].* = g_stbe_d[li_reproduce].*
 
               LET g_stbe_d[li_reproduce_target].stbeseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbe_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbe_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stbe3_d FROM s_detail3.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body3.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbe3_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt340_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stbe3_d.getLength()
            #add-point:資料輸入前 name="input.body3.before_input"
            IF g_action = 'N' THEN
               NEXT FIELD stbdsite
            END IF
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stbe3_d[l_ac].* TO NULL 
            INITIALIZE g_stbe3_d_t.* TO NULL 
            INITIALIZE g_stbe3_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_stbe3_d[l_ac].stbf006 = "0"
      LET g_stbe3_d[l_ac].stbf007 = "0"
      LET g_stbe3_d[l_ac].stbf008 = "0"
 
            #add-point:modify段before備份 name="input.body3.insert.before_bak"
            
            #end add-point
            LET g_stbe3_d_t.* = g_stbe3_d[l_ac].*     #新輸入資料
            LET g_stbe3_d_o.* = g_stbe3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt340_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body3.insert.after_set_entry_b"
            
            #end add-point
            CALL astt340_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbe3_d[li_reproduce_target].* = g_stbe3_d[li_reproduce].*
 
               LET g_stbe3_d[li_reproduce_target].stbfseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body3.before_insert"
            SELECT MAX(stbfseq)+1 INTO g_stbe3_d[l_ac].stbfseq
              FROM stbf_t
             WHERE stbfent = g_enterprise 
               AND stbfdocno = g_stbd_m.stbddocno
            IF cl_null(g_stbe3_d[l_ac].stbfseq) THEN
               LET g_stbe3_d[l_ac].stbfseq = 1
            END IF
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body3.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[2] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 2
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt340_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt340_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbe3_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbe3_d[l_ac].stbfseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stbe3_d_t.* = g_stbe3_d[l_ac].*  #BACKUP
               LET g_stbe3_d_o.* = g_stbe3_d[l_ac].*  #BACKUP
               CALL astt340_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body3.after_set_entry_b"
               
               #end add-point  
               CALL astt340_set_no_entry_b(l_cmd)
               IF NOT astt340_lock_b("stbf_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt340_bcl2 INTO g_stbe3_d[l_ac].stbfseq,g_stbe3_d[l_ac].stbf001,g_stbe3_d[l_ac].stbf002, 
                      g_stbe3_d[l_ac].stbf003,g_stbe3_d[l_ac].stbf004,g_stbe3_d[l_ac].stbf005,g_stbe3_d[l_ac].stbf006, 
                      g_stbe3_d[l_ac].stbf007,g_stbe3_d[l_ac].stbf008
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbe3_d_mask_o[l_ac].* =  g_stbe3_d[l_ac].*
                  CALL astt340_stbf_t_mask()
                  LET g_stbe3_d_mask_n[l_ac].* =  g_stbe3_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt340_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body3.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body3.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body3.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身2刪除前 name="input.body3.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stbd_m.stbddocno
               LET gs_keys[gs_keys.getLength()+1] = g_stbe3_d_t.stbfseq
            
               #刪除同層單身
               IF NOT astt340_delete_b('stbf_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt340_key_delete_b(gs_keys,'stbf_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body3.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astt340_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body3.a_delete"
               
               #end add-point
               LET l_count = g_stbe_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body3.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbe3_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
         AFTER INSERT    
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身2新增前 name="input.body3.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbf_t 
             WHERE stbfent = g_enterprise AND stbfdocno = g_stbd_m.stbddocno
               AND stbfseq = g_stbe3_d[l_ac].stbfseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body3.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbd_m.stbddocno
               LET gs_keys[2] = g_stbe3_d[g_detail_idx].stbfseq
               CALL astt340_insert_b('stbf_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body3.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stbe_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt340_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body3.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbe3_d[l_ac].* = g_stbe3_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt340_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbe3_d[l_ac].* = g_stbe3_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body3.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astt340_stbf_t_mask_restore('restore_mask_o')
                              
               UPDATE stbf_t SET (stbfdocno,stbfseq,stbf001,stbf002,stbf003,stbf004,stbf005,stbf006, 
                   stbf007,stbf008) = (g_stbd_m.stbddocno,g_stbe3_d[l_ac].stbfseq,g_stbe3_d[l_ac].stbf001, 
                   g_stbe3_d[l_ac].stbf002,g_stbe3_d[l_ac].stbf003,g_stbe3_d[l_ac].stbf004,g_stbe3_d[l_ac].stbf005, 
                   g_stbe3_d[l_ac].stbf006,g_stbe3_d[l_ac].stbf007,g_stbe3_d[l_ac].stbf008) #自訂欄位頁簽 
 
                WHERE stbfent = g_enterprise AND stbfdocno = g_stbd_m.stbddocno
                  AND stbfseq = g_stbe3_d_t.stbfseq #項次 
                  
               #add-point:單身page2修改中 name="input.body3.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbe3_d[l_ac].* = g_stbe3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbf_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbe3_d[l_ac].* = g_stbe3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbd_m.stbddocno
               LET gs_keys_bak[1] = g_stbddocno_t
               LET gs_keys[2] = g_stbe3_d[g_detail_idx].stbfseq
               LET gs_keys_bak[2] = g_stbe3_d_t.stbfseq
               CALL astt340_update_b('stbf_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astt340_stbf_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stbe3_d[g_detail_idx].stbfseq = g_stbe3_d_t.stbfseq 
                  ) THEN
                  LET gs_keys[01] = g_stbd_m.stbddocno
                  LET gs_keys[gs_keys.getLength()+1] = g_stbe3_d_t.stbfseq
                  CALL astt340_key_update_b(gs_keys,'stbf_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stbd_m),util.JSON.stringify(g_stbe3_d_t)
               LET g_log2 = util.JSON.stringify(g_stbd_m),util.JSON.stringify(g_stbe3_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body3.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbfseq
            #add-point:BEFORE FIELD stbfseq name="input.b.page3.stbfseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbfseq
            
            #add-point:AFTER FIELD stbfseq name="input.a.page3.stbfseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stbd_m.stbddocno IS NOT NULL AND g_stbe3_d[g_detail_idx].stbfseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbd_m.stbddocno != g_stbddocno_t OR g_stbe3_d[g_detail_idx].stbfseq != g_stbe3_d_t.stbfseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbf_t WHERE "||"stbfent = '" ||g_enterprise|| "' AND "||"stbfdocno = '"||g_stbd_m.stbddocno ||"' AND "|| "stbfseq = '"||g_stbe3_d[g_detail_idx].stbfseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbfseq
            #add-point:ON CHANGE stbfseq name="input.g.page3.stbfseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf001
            #add-point:BEFORE FIELD stbf001 name="input.b.page3.stbf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf001
            
            #add-point:AFTER FIELD stbf001 name="input.a.page3.stbf001"
            IF g_stbd_m.stbddocno IS NOT NULL AND g_stbe3_d[g_detail_idx].stbf001 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbd_m.stbddocno != g_stbddocno_t OR g_stbe3_d[g_detail_idx].stbf001 != g_stbe3_d_t.stbf001)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbf_t WHERE "||"stbfent = '" ||g_enterprise|| "' AND "||"stbfdocno = '"||g_stbd_m.stbddocno ||"' AND "|| "stbf001 = '"||g_stbe3_d[g_detail_idx].stbf001 ||"'",'std-00004',0) THEN 
                     LET g_stbe3_d[g_detail_idx].stbf001 = g_stbe3_d_t.stbf001
                     DISPLAY BY NAME g_stbe3_d[g_detail_idx].stbf001
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf001
            #add-point:ON CHANGE stbf001 name="input.g.page3.stbf001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf002
            #add-point:BEFORE FIELD stbf002 name="input.b.page3.stbf002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf002
            
            #add-point:AFTER FIELD stbf002 name="input.a.page3.stbf002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf002
            #add-point:ON CHANGE stbf002 name="input.g.page3.stbf002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf003
            #add-point:BEFORE FIELD stbf003 name="input.b.page3.stbf003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf003
            
            #add-point:AFTER FIELD stbf003 name="input.a.page3.stbf003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf003
            #add-point:ON CHANGE stbf003 name="input.g.page3.stbf003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf004
            
            #add-point:AFTER FIELD stbf004 name="input.a.page3.stbf004"
            IF NOT cl_null(g_stbe3_d[l_ac].stbf004) THEN                        
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbd_m.stbdsite
               LET g_chkparam.arg2 = g_stbe3_d[l_ac].stbf004
               LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"  #160318-00025#34  add

               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_oodb002") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME

               ELSE
                  #檢查失敗時後續處理
                  LET g_stbe3_d[l_ac].stbf004 = g_stbe3_d_t.stbf004
                  LET g_stbe3_d[l_ac].stbf004_desc = ''
                  DISPLAY BY NAME g_stbe3_d[l_ac].stbf004,g_stbe3_d[l_ac].stbf004_desc
                  NEXT FIELD CURRENT
               END IF
               
               #
            END IF
            SELECT ooef019 INTO l_ooef019 FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_stbd_m.stbdsite
            #带出税率
            SELECT oodb006 INTO g_stbe3_d[l_ac].stbf005
              FROM oodb_t
             WHERE oodbent = g_enterprise
               AND oodb001 = l_ooef019
               AND oodb002 = g_stbe3_d[l_ac].stbf004
            IF NOT cl_null(g_stbe3_d[l_ac].stbf005) THEN
               IF NOT cl_null(g_stbe3_d[l_ac].stbf006) THEN
                  LET g_stbe3_d[l_ac].stbf007 = g_stbe3_d[l_ac].stbf005 * g_stbe3_d[l_ac].stbf006 /100
                  LET g_stbe3_d[l_ac].stbf008 = g_stbe3_d[l_ac].stbf006 + g_stbe3_d[l_ac].stbf007
               ELSE
                  IF NOT cl_null(g_stbe3_d[l_ac].stbf008) THEN
                     LET g_stbe3_d[l_ac].stbf006 = g_stbe3_d[l_ac].stbf008/(1+g_stbe3_d[l_ac].stbf005/100)
                     LET g_stbe3_d[l_ac].stbf007 = g_stbe3_d[l_ac].stbf008 - g_stbe3_d[l_ac].stbf006
                  END IF
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stbe3_d[l_ac].stbf004
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe3_d[l_ac].stbf004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe3_d[l_ac].stbf004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf004
            #add-point:BEFORE FIELD stbf004 name="input.b.page3.stbf004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf004
            #add-point:ON CHANGE stbf004 name="input.g.page3.stbf004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf004_desc
            #add-point:BEFORE FIELD stbf004_desc name="input.b.page3.stbf004_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf004_desc
            
            #add-point:AFTER FIELD stbf004_desc name="input.a.page3.stbf004_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf004_desc
            #add-point:ON CHANGE stbf004_desc name="input.g.page3.stbf004_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf005
            #add-point:BEFORE FIELD stbf005 name="input.b.page3.stbf005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf005
            
            #add-point:AFTER FIELD stbf005 name="input.a.page3.stbf005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf005
            #add-point:ON CHANGE stbf005 name="input.g.page3.stbf005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf006
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbe3_d[l_ac].stbf006,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stbf006
            END IF 
 
 
 
            #add-point:AFTER FIELD stbf006 name="input.a.page3.stbf006"
            IF NOT cl_null(g_stbe3_d[l_ac].stbf006) THEN 
               IF NOT cl_null(g_stbe3_d[l_ac].stbf005) THEN
                  LET g_stbe3_d[l_ac].stbf007 = g_stbe3_d[l_ac].stbf006 * g_stbe3_d[l_ac].stbf005 /100
                  LET g_stbe3_d[l_ac].stbf008 = g_stbe3_d[l_ac].stbf006 + g_stbe3_d[l_ac].stbf007
               END IF
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf006
            #add-point:BEFORE FIELD stbf006 name="input.b.page3.stbf006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf006
            #add-point:ON CHANGE stbf006 name="input.g.page3.stbf006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf007
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbe3_d[l_ac].stbf007,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stbf007
            END IF 
 
 
 
            #add-point:AFTER FIELD stbf007 name="input.a.page3.stbf007"
            IF NOT cl_null(g_stbe3_d[l_ac].stbf007) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf007
            #add-point:BEFORE FIELD stbf007 name="input.b.page3.stbf007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf007
            #add-point:ON CHANGE stbf007 name="input.g.page3.stbf007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbf008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbe3_d[l_ac].stbf008,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stbf008
            END IF 
 
 
 
            #add-point:AFTER FIELD stbf008 name="input.a.page3.stbf008"
            IF NOT cl_null(g_stbe3_d[l_ac].stbf008) THEN 
               IF NOT cl_null(g_stbe3_d[l_ac].stbf005) THEN
                  LET g_stbe3_d[l_ac].stbf006 = g_stbe3_d[l_ac].stbf008/(1+g_stbe3_d[l_ac].stbf005/100)
                  LET g_stbe3_d[l_ac].stbf007 = g_stbe3_d[l_ac].stbf008 - g_stbe3_d[l_ac].stbf006
               END IF
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbf008
            #add-point:BEFORE FIELD stbf008 name="input.b.page3.stbf008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbf008
            #add-point:ON CHANGE stbf008 name="input.g.page3.stbf008"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page3.stbfseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbfseq
            #add-point:ON ACTION controlp INFIELD stbfseq name="input.c.page3.stbfseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf001
            #add-point:ON ACTION controlp INFIELD stbf001 name="input.c.page3.stbf001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf002
            #add-point:ON ACTION controlp INFIELD stbf002 name="input.c.page3.stbf002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf003
            #add-point:ON ACTION controlp INFIELD stbf003 name="input.c.page3.stbf003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf004
            #add-point:ON ACTION controlp INFIELD stbf004 name="input.c.page3.stbf004"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbe3_d[l_ac].stbf004             #給予default值
            LET g_qryparam.default2 = g_stbe3_d[l_ac].stbf004_desc #稅別代碼
            #給予arg
            LET g_qryparam.arg1 = g_stbd_m.stbdsite


            CALL q_oodb002_8()                                #呼叫開窗

            LET g_stbe3_d[l_ac].stbf004 = g_qryparam.return1              
            LET g_stbe3_d[l_ac].stbf004_desc = g_qryparam.return2 
            DISPLAY g_stbe3_d[l_ac].stbf004 TO stbf004              #
            DISPLAY g_stbe3_d[l_ac].stbf004_desc TO stbf004_desc #稅別代碼
            NEXT FIELD stbf004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf004_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf004_desc
            #add-point:ON ACTION controlp INFIELD stbf004_desc name="input.c.page3.stbf004_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf005
            #add-point:ON ACTION controlp INFIELD stbf005 name="input.c.page3.stbf005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf006
            #add-point:ON ACTION controlp INFIELD stbf006 name="input.c.page3.stbf006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf007
            #add-point:ON ACTION controlp INFIELD stbf007 name="input.c.page3.stbf007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbf008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbf008
            #add-point:ON ACTION controlp INFIELD stbf008 name="input.c.page3.stbf008"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body3.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stbe3_d[l_ac].* = g_stbe3_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt340_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt340_unlock_b("stbf_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body3.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body3.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbe3_d[li_reproduce_target].* = g_stbe3_d[li_reproduce].*
 
               LET g_stbe3_d[li_reproduce_target].stbfseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbe3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbe3_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astt340.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      INPUT ARRAY g_stbe_d_2 FROM s_detail2.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbe_d_2.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt340_stbe2_fill2()
            LET g_rec_b = g_stbe_d_2.getLength()

         
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
 
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt340_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astt340_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stbe_d_2.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbe_d_2[l_ac].stbeseq_1 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbe_d_2_t.* = g_stbe_d_2[l_ac].*  #BACKUP
               CALL astt340_set_entry_b(l_cmd)

               CALL astt340_set_no_entry_b(l_cmd)
               OPEN astt340_bcl USING g_enterprise,g_stbd_m.stbddocno,g_stbe_d_2[g_detail_idx].stbeseq_1 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "astt340_bcl"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET l_lock_sw='Y'     
               ELSE
               
                  FETCH astt340_bcl INTO g_stbe_d_2[l_ac].stbeseq_1,g_stbe_d_2[l_ac].stbe001_1,g_stbe_d_2[l_ac].stbe002_1, 
                      g_stbe_d_2[l_ac].stbe003_1,g_stbe_d_2[l_ac].stbe004_1,g_stbe_d_2[l_ac].stbe028_1,
                      g_stbe_d_2[l_ac].stbe005_1,g_stbe_d_2[l_ac].stbe024_1,g_stbe_d_2[l_ac].stbe025_1, 
                      g_stbe_d_2[l_ac].stbe006_1,g_stbe_d_2[l_ac].stbe007_1,g_stbe_d_2[l_ac].stbe008_1, 
                      g_stbe_d_2[l_ac].stbe009_1, g_stbe_d_2[l_ac].stbe010_1,g_stbe_d_2[l_ac].stbe011_1,
                      g_stbe_d_2[l_ac].stbe012_1,g_stbe_d_2[l_ac].stbe013_1,g_stbe_d_2[l_ac].stbe014_1,
                      g_stbe_d_2[l_ac].stbe015_1,g_stbe_d_2[l_ac].stbe016_1,g_stbe_d_2[l_ac].stbe026_1,
                      g_stbe_d_2[l_ac].stbe027_1,g_stbe_d_2[l_ac].stbe017_1,g_stbe_d_2[l_ac].stbe018_1,
                      g_stbe_d_2[l_ac].stbe031_1,g_stbe_d_2[l_ac].stbesite_1,g_stbe_d_2[l_ac].stbe020_1,
                      g_stbe_d_2[l_ac].stbe019_1,g_stbe_d_2[l_ac].stbe032_1,g_stbe_d_2[l_ac].stbecomp_1
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stbe_d_t.stbeseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt340_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
         

         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d)

               #end add-point
            ELSE
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = -263 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前

               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stbd_m.stbddocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbe_d_2_t.stbeseq_1
 
            
               #刪除同層單身
               IF NOT astt340_delete_b('stbe_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt340_key_delete_b(gs_keys,'stbe_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
               
               #add-point:單身刪除中
                #20150709 By shi Add
                UPDATE stbc_t SET stbcstus = (CASE WHEN stbc020>0 THEN '3' ELSE '1' END )
                 WHERE stbc004 = g_stbe_d_2[l_ac].stbe002_1
                   AND stbc005 = g_stbe_d_2[l_ac].stbe003_1
                   AND stbcent = g_enterprise #add by geza 20170122 #170122-00004#2
                IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                   INITIALIZE g_errparam TO NULL 
                   LET g_errparam.extend = "" 
                   LET g_errparam.code   = SQLCA.sqlcode
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()
                   CALL s_transaction_end('N','0')
                   CLOSE astt340_bcl
                   CANCEL DELETE
                END IF
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt340_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後

               #end add-point
               LET l_count = g_stbe_d_2.getLength()
               
               #add-point:單身刪除後(<>d)

               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbe_d_2.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stbe_d_2[l_ac].* = g_stbe_d_2_t.*
               CLOSE astt340_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stbe_d[l_ac].stbeseq
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stbe_d_2[l_ac].* = g_stbe_d_2_t.*
            ELSE       
      
               UPDATE stbe_t SET (stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025,stbe006, 
                   stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe026,stbe027,stbe017, 
                   stbe018,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp) = (g_stbd_m.stbddocno,g_stbe_d_2[l_ac].stbeseq_1, 
                   g_stbe_d_2[l_ac].stbe001_1,g_stbe_d_2[l_ac].stbe002_1,g_stbe_d_2[l_ac].stbe003_1,g_stbe_d_2[l_ac].stbe004_1,
                   g_stbe_d_2[l_ac].stbe028_1,g_stbe_d_2[l_ac].stbe005_1,g_stbe_d_2[l_ac].stbe024_1,g_stbe_d_2[l_ac].stbe025_1,
                   g_stbe_d_2[l_ac].stbe006_1,g_stbe_d_2[l_ac].stbe007_1,g_stbe_d_2[l_ac].stbe008_1, 
                   g_stbe_d_2[l_ac].stbe009_1,g_stbe_d_2[l_ac].stbe010_1,g_stbe_d_2[l_ac].stbe011_1,g_stbe_d_2[l_ac].stbe012_1, 
                   g_stbe_d_2[l_ac].stbe013_1,g_stbe_d_2[l_ac].stbe014_1,g_stbe_d_2[l_ac].stbe015_1,g_stbe_d_2[l_ac].stbe016_1,
                   g_stbe_d_2[l_ac].stbe026_1,g_stbe_d_2[l_ac].stbe027_1,g_stbe_d_2[l_ac].stbe017_1,g_stbe_d_2[l_ac].stbe018_1,
                   g_stbe_d_2[l_ac].stbe031_1,g_stbe_d_2[l_ac].stbesite_1,g_stbe_d_2[l_ac].stbe020_1, 
                   g_stbe_d_2[l_ac].stbe019_1,g_stbe_d_2[l_ac].stbe032_1,g_stbe_d_2[l_ac].stbecomp_1)
                WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m.stbddocno 
 
                  AND stbeseq = g_stbe_d_2_t.stbeseq_1 #項次   
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stbe_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_stbe_d_2[l_ac].* = g_stbe_d_2_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "stbe_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stbe_d_2[l_ac].* = g_stbe_d_2_t.*                     
                     CALL s_transaction_end('N','0')
                  OTHERWISE
#                                    INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_stbd_m.stbddocno
#               LET gs_keys_bak[1] = g_stbddocno_t
#               LET gs_keys[2] = g_stbe_d_2[g_detail_idx].stbeseq
#               LET gs_keys_bak[2] = g_stbe_d_2_t.stbeseq_1
#               CALL astt340_update_b('stbe_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
               END CASE
               
 
            END IF
            
         AFTER ROW
            
            #add by geza 20150814(S) 纳入结算单否为N，在交款明细新增，费用明细删除
            IF g_stbe_d_2[l_ac].stbe024_1 = 'N' AND cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
               CALL astt340_stev_insert2(g_stbd_m.stbddocno,g_stbe_d_2[l_ac].stbeseq_1) RETURNING r_success
               DELETE FROM stbe_t
                WHERE stbeent = g_enterprise AND
                  stbedocno = g_stbd_m.stbddocno AND stbeseq = g_stbe_d_2[l_ac].stbeseq_1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  NEXT FIELD stbe024_1
               END IF               
               CALL astt340_stev_fill2()
               CALL astt340_stbe2_fill2()
            END IF
            #add by geza 20150814(E)
            
            CALL astt340_unlock_b("stbe_t","'1'")
            CALL s_transaction_end('Y','0')
         
         ON CHANGE stbe024_1
            #add by geza 20150909(S)
            #纳入结算单否改成N后，票扣否改成N
            IF g_stbe_d_2[l_ac].stbe024_1 = 'N' THEN
               LET g_stbe_d_2[l_ac].stbe025_1 = 'N'
            END IF
            CALL astt340_set_entry_b(l_cmd) 
            CALL astt340_set_no_entry_b(l_cmd)
            #add by geza 20150909(E)         

         AFTER FIELD stbe016_1
            IF NOT cl_ap_chk_Range(g_stbe_d_2[l_ac].stbe016_1,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbe016_1
            END IF 
            IF NOT cl_null(g_stbe_d_2[l_ac].stbe016_1) THEN 
               IF g_stbe_d_2[l_ac].stbe016_1>g_stbe_d_2[l_ac].stbe014_1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00042"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stbe016_1
               END IF
            END IF 
            #add by geza 20150915(S)
            #对数量进行四舍五入 
            SELECT ROUND(g_stbe_d_2[l_ac].stbe016_1/g_stbe_d_2[l_ac].stbe027_1,4) INTO g_stbe_d_2[l_ac].stbe026_1 FROM dual 
            DISPLAY BY NAME g_stbe_d_2[l_ac].stbe026_1
            #add by geza 20150915(E)
              
         AFTER INPUT
               CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
               CALL astt340_stbd_show()
            
 
      END INPUT
      
      #add by geza 20151119(S)交款明细单身
      INPUT ARRAY g_stev_d FROM s_detail4.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
               CALL FGL_SET_ARR_CURR(g_stev_d.getLength()+1) 
               LET g_insert = 'N' 
            END IF 
            #是否启用交款汇总单为N,隐藏结算调整按钮
            #add by geza 20150812(S)
            IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'Y' THEN
               EXIT DIALOG
            ELSE
               #单身没资料关闭单身
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt 
                 FROM stev_t 
                WHERE stevent = g_enterprise 
                  AND stevdocno = g_stbd_m.stbddocno
               IF l_cnt = 0  THEN
                  EXIT DIALOG
               END IF             
            END IF 
            #add by geza 20150812(E)             
            CALL astt340_stev_fill2()
            LET g_rec_b = g_stev_d.getLength()

         
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
 
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt340_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astt340_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stev_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stev_d[l_ac].stevseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stev_d_t.* = g_stev_d[l_ac].*  #BACKUP
               CALL astt340_set_entry_b(l_cmd)

               CALL astt340_set_no_entry_b(l_cmd)
               OPEN astt340_bcl3 USING g_enterprise,g_stbd_m.stbddocno,g_stev_d[g_detail_idx].stevseq 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "astt340_bcl3"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET l_lock_sw='Y'     
               ELSE
                  FETCH astt340_bcl3 INTO g_stev_d[l_ac].stevdocno,g_stev_d[l_ac].stevseq,
                      g_stev_d[l_ac].stev001,g_stev_d[l_ac].stev002,g_stev_d[l_ac].stev003, 
                      g_stev_d[l_ac].stev004,g_stev_d[l_ac].stev024,g_stev_d[l_ac].stev005,
                      g_stev_d[l_ac].stev026,g_stev_d[l_ac].stev027,
                      g_stev_d[l_ac].stev006,g_stev_d[l_ac].stev007,g_stev_d[l_ac].stev008, 
                      g_stev_d[l_ac].stev009,g_stev_d[l_ac].stev010,g_stev_d[l_ac].stev011, 
                      g_stev_d[l_ac].stev012,g_stev_d[l_ac].stev013,g_stev_d[l_ac].stev014,
                      g_stev_d[l_ac].stev015,g_stev_d[l_ac].stev016,
                      g_stev_d[l_ac].stev028,g_stev_d[l_ac].stev029,g_stev_d[l_ac].stev017,
                      g_stev_d[l_ac].stev018,g_stev_d[l_ac].stevsite,g_stev_d[l_ac].stev020,
                      g_stev_d[l_ac].stev019,g_stev_d[l_ac].stev030
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stev_d_t.stevseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt340_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
         

         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d)

               #end add-point
            ELSE
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = -263 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前

               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stbd_m.stbddocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stev_d_t.stevseq
 
            
               #刪除同層單身
               IF NOT astt340_delete_b('stev_t',gs_keys,"'3'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt340_key_delete_b(gs_keys,'stev_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt340_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
               
               #add-point:單身刪除中
                #20150709 By shi Add
                UPDATE stbc_t SET stbcstus = (CASE WHEN stbc020>0 THEN '3' ELSE '1' END )
                 WHERE stbc004 = g_stev_d[l_ac].stev002
                   AND stbc005 = g_stev_d[l_ac].stev003
                   AND stbcent = g_enterprise #add by geza 20170122 #170122-00004#2
                IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                   INITIALIZE g_errparam TO NULL 
                   LET g_errparam.extend = "" 
                   LET g_errparam.code   = SQLCA.sqlcode
                   LET g_errparam.popup  = TRUE 
                   CALL cl_err()
                   CALL s_transaction_end('N','0')
                   CLOSE astt340_bcl
                   CANCEL DELETE
                END IF
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt340_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後

               #end add-point
               LET l_count = g_stev_d.getLength()
               
               #add-point:單身刪除後(<>d)

               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stev_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stev_d[l_ac].* = g_stev_d_t.*
               CLOSE astt340_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stev_d[l_ac].stevseq
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stev_d[l_ac].* = g_stev_d_t.*
            ELSE       
               UPDATE stev_t SET (stevdocno,stevseq,stev001,stev002,stev003,stev004,stev024,stev005,stev026,stev027,stev006,stev007,stev008,stev009, 
                   stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev028,stev029,stev017,stev018,stevsite,stev020,stev019,stev030) = (
                   g_stbd_m.stbddocno,g_stev_d[l_ac].stevseq,g_stev_d[l_ac].stev001,g_stev_d[l_ac].stev002,g_stev_d[l_ac].stev003,
                   g_stev_d[l_ac].stev004,g_stev_d[l_ac].stev024,g_stev_d[l_ac].stev005,g_stev_d[l_ac].stev026,
                   g_stev_d[l_ac].stev027,g_stev_d[l_ac].stev006,
                   g_stev_d[l_ac].stev007,g_stev_d[l_ac].stev008,g_stev_d[l_ac].stev009,g_stev_d[l_ac].stev010,
                   g_stev_d[l_ac].stev011,g_stev_d[l_ac].stev012,g_stev_d[l_ac].stev013,g_stev_d[l_ac].stev014,
                   g_stev_d[l_ac].stev015,g_stev_d[l_ac].stev016,g_stev_d[l_ac].stev028,g_stev_d[l_ac].stev029,
                   g_stev_d[l_ac].stev017,g_stev_d[l_ac].stev018,
                   g_stev_d[l_ac].stevsite,g_stev_d[l_ac].stev020,g_stev_d[l_ac].stev019,g_stev_d[l_ac].stev030)
                WHERE stevent = g_enterprise AND stevdocno = g_stbd_m.stbddocno 
                  AND stevseq = g_stev_d_t.stevseq #項次   
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stbe_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_stev_d[l_ac].* = g_stev_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "stbe_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stev_d[l_ac].* = g_stev_d_t.*               
                     CALL s_transaction_end('N','0')
                  OTHERWISE

                     
               END CASE
               
 
            END IF
            
         AFTER ROW            
            #add by geza 20150814(S) 纳入结算单否为Y，在交款明细删除，费用明细新增
            IF g_stev_d[l_ac].stev026 = 'Y' AND cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
               CALL astt340_stbe_insert2(g_stev_d[l_ac].stevdocno,g_stev_d[l_ac].stevseq) RETURNING r_success
               DELETE FROM stev_t
                WHERE stevent = g_enterprise AND
                  stevdocno = g_stev_d[l_ac].stevdocno AND stevseq = g_stev_d[l_ac].stevseq
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  NEXT FIELD stev026
               END IF
               CALL astt340_stev_fill2()
               CALL astt340_stbe2_fill2()
            END IF
            #add by geza 20150814(E)
            CALL astt340_unlock_b("stev_t","'3'")
            CALL s_transaction_end('Y','0')

         ON CHANGE stev026
            
         
         AFTER FIELD stev016
            IF NOT cl_ap_chk_Range(g_stev_d[l_ac].stev016,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stev016
            END IF 
            IF NOT cl_null(g_stev_d[l_ac].stev016) THEN 
               IF g_stev_d[l_ac].stev016>g_stev_d[l_ac].stev014 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00042"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stev016
               END IF
               #对数量进行四舍五入 add by geza 20150814
               SELECT ROUND(g_stev_d[l_ac].stev016/g_stev_d[l_ac].stev029,4) INTO g_stev_d[l_ac].stev028 FROM dual 
            END IF 
         
              
         AFTER INPUT
               CALL s_astp340_stbe_summary(g_stbd_m.stbddocno) RETURNING l_success
               CALL astt340_stbd_show()
            
 
      END INPUT
      #add by geza 20151119(E)
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
#         IF g_stbd_m.stbd016='N' THEN
#            CALL cl_set_comp_visible("page_5",FALSE)
#         ELSE
#            CALL cl_set_comp_visible("page_5",TRUE)
#         END IF 
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)
         CALL DIALOG.setCurrentRow("s_detail3",g_detail_idx)         
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stbdsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbeseq
 
               #add-point:input段modify_detail 
               #150505-00016#1--add by dongsz--str---
               WHEN "s_detail3"
                  NEXT FIELD stbfseq
               #150505-00016#1--add by dongsz--end---
               #end add-point  
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail3",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stbddocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbeseq
               WHEN "s_detail3"
                  NEXT FIELD stbfseq
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         #add-point:input段accept  name="input.accept"
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   CALL astt340_stbe3_fill() #By shi 20150709
   CALL astt340_stbe4_fill()   #add by geza 20150802
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt340_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt340_b_fill() #單身填充
      CALL astt340_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt340_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   IF g_type = '1' THEN   
      SELECT stax004 INTO g_stbd_m.stax004 FROM stax_t
        WHERE staxent=g_enterprise  AND stax001=g_stbd_m.stbd001  AND staxseq=g_stbd_m.stbd004
          AND stax007 = g_stbd_m.stbd048 #add by geza 20151120  
   ELSE
      SELECT stfj004 INTO g_stbd_m.stax004 FROM stfj_t
        WHERE stfjent=g_enterprise  AND stfj001=g_stbd_m.stbd001  AND stfjseq=g_stbd_m.stbd004
   END IF
   DISPLAY BY NAME g_stbd_m.stax004

   
          
   #end add-point
   
   #遮罩相關處理
   LET g_stbd_m_mask_o.* =  g_stbd_m.*
   CALL astt340_stbd_t_mask()
   LET g_stbd_m_mask_n.* =  g_stbd_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048, 
       g_stbd_m.stbd048_desc,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd037_desc,g_stbd_m.stbd002, 
       g_stbd_m.stbd002_desc,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbdunit_desc, 
       g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005, 
       g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp, 
       g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt, 
       g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
       g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
       g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018, 
       g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd021_desc,g_stbd_m.stbd022, 
       g_stbd_m.stbd022_desc,g_stbd_m.stbd023,g_stbd_m.stbd023_desc,g_stbd_m.stbd024,g_stbd_m.stbd025, 
       g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd046_desc,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc,g_stbd_m.stbd031,g_stbd_m.stbd032
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbd_m.stbdstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "J"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/reconciliate.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stbe_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe005
            CALL ap_ref_array2(g_ref_fields,"SELECT stae003 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stae003

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbe_d[l_ac].stbe009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbe_d[l_ac].stbe009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbe_d[l_ac].stbe009_desc

      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stbe3_d.getLength()
      #add-point:show段單身reference name="show.body3.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt340_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt340_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt340_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stbd_t.stbddocno 
   DEFINE l_oldno     LIKE stbd_t.stbddocno 
 
   DEFINE l_master    RECORD LIKE stbd_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stbe_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stbf_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   LET g_master_insert = FALSE
   
   IF g_stbd_m.stbddocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stbddocno_t = g_stbd_m.stbddocno
 
    
   LET g_stbd_m.stbddocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbd_m.stbdownid = g_user
      LET g_stbd_m.stbdowndp = g_dept
      LET g_stbd_m.stbdcrtid = g_user
      LET g_stbd_m.stbdcrtdp = g_dept 
      LET g_stbd_m.stbdcrtdt = cl_get_current()
      LET g_stbd_m.stbdmodid = g_user
      LET g_stbd_m.stbdmoddt = cl_get_current()
      LET g_stbd_m.stbdstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbd_m.stbdstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "J"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/reconciliate.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt340_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stbd_m.* TO NULL
      INITIALIZE g_stbe_d TO NULL
      INITIALIZE g_stbe3_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt340_show()
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt340_set_act_visible()   
   CALL astt340_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbddocno_t = g_stbd_m.stbddocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbdent = " ||g_enterprise|| " AND",
                      " stbddocno = '", g_stbd_m.stbddocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt340_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt340_idx_chk()
   
   LET g_data_owner = g_stbd_m.stbdownid      
   LET g_data_dept  = g_stbd_m.stbdowndp
   
   #功能已完成,通報訊息中心
   CALL astt340_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt340_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stbe_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stbf_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt340_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbe_t
    WHERE stbeent = g_enterprise AND stbedocno = g_stbddocno_t
 
    INTO TEMP astt340_detail
 
   #將key修正為調整後   
   UPDATE astt340_detail 
      #更新key欄位
      SET stbedocno = g_stbd_m.stbddocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stbe_t SELECT * FROM astt340_detail
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt340_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbf_t 
    WHERE stbfent = g_enterprise AND stbfdocno = g_stbddocno_t
 
    INTO TEMP astt340_detail
 
   #將key修正為調整後   
   UPDATE astt340_detail SET stbfdocno = g_stbd_m.stbddocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stbf_t SELECT * FROM astt340_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt340_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stbddocno_t = g_stbd_m.stbddocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt340_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE  l_success      LIKE type_t.num5
   DEFINE  l_cnt          LIKE type_t.num10 
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stbd_m.stbddocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt340_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
   
   #檢查是否允許此動作
   IF NOT astt340_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbd_m_mask_o.* =  g_stbd_m.*
   CALL astt340_stbd_t_mask()
   LET g_stbd_m_mask_n.* =  g_stbd_m.*
   
   CALL astt340_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   #已产生费用单，不允许删除  add by geza 20150713(S)
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt 
     FROM stba_t
    WHERE stbaent = g_enterprise
      AND stba007 = g_stbd_m.stbddocno
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00373'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN 
   END IF
   #add by geza 20150713(E)
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      CALL astt340_delete_updstbc() RETURNING l_success
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
         RETURN      
      END IF
      #add by geza 20151119(S)
      #是否启用交款汇总单为N,隐藏结算调整按钮
      IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
         CALL astt340_delete_updstbc2() RETURNING l_success
         IF NOT l_success THEN
            CALL s_transaction_end('N','0')
            RETURN      
         END IF             
      END IF 
      #add by geza 20151119(E)
      #add by geza 20151127(S)
      #回写供应商合同结算账期单身
      IF g_stbd_m.stbd039 = '2' THEN   #如果stbd039=1，不更新合同帐期
         
         UPDATE stax_t SET stax005 = 'N',
                           stax006 = ''
          WHERE staxent = g_enterprise AND stax006 = g_stbd_m.stbddocno
           
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stax_t" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            CALL s_transaction_end('N','0')
            RETURN
         END IF
             
      END IF    
      #add by geza 20151127(E)
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt340_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stbddocno_t = g_stbd_m.stbddocno
 
 
      DELETE FROM stbd_t
       WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stbd_m.stbddocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      DELETE FROM stet_t
       WHERE stetent = g_enterprise AND stetdocno = g_stbd_m.stbddocno 
 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stbd_m.stbddocno  
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stbe_t
       WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m.stbddocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
      #add-point:單身刪除前 name="delete.body.b_delete2"
      
      #end add-point
      DELETE FROM stbf_t
       WHERE stbfent = g_enterprise AND
             stbfdocno = g_stbd_m.stbddocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      #是否启用交款汇总单为N,纳入结算单否为N写入交款明细单身
      #add by geza 20151119(S)
      IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
         CALL astt340_stev_fill2()
      ELSE
         CALL astt340_stev_fill()       
      END IF 
      #add by geza 20151119(E)
      CALL astt340_stev_fill() #mark by geza 20151119
      CALL g_stbe_d_2.clear() #add by geza 20150918
      CALL g_stev_d.clear() #add by geza 20150918
      CALL g_stbe5_d.clear() #add by geza 20150918
      CALL g_stbe6_d.clear() #add by geza 20150918
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stbd_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt340_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stbe_d.clear() 
      CALL g_stbe3_d.clear()       
 
     
      CALL astt340_ui_browser_refresh()  
      #CALL astt340_ui_headershow()  
      #CALL astt340_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt340_browser_fill("")
         CALL astt340_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt340_cl
 
   #功能已完成,通報訊息中心
   CALL astt340_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt340.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt340_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_ooef019  LIKE ooef_t.ooef019     #150505-00016#1--add by dongsz
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stbe_d.clear()
   CALL g_stbe3_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL g_stbe_d_2.clear() #add by geza 20160606
   CALL g_stev_d.clear()   #add by geza 20160606
   CALL g_stbe5_d.clear()  #add by geza 20160606
   CALL g_stbe6_d.clear()  #add by geza 20160606
   CALL astt340_stbe2_fill2()  
   #CALL astt340_stev_fill()  #mark by geza 20151119
   #是否启用交款汇总单为N,纳入结算单否为N写入交款明细单身
   #add by geza 20151119(S)
   IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
      CALL astt340_stev_fill2()
   ELSE
      CALL astt340_stev_fill()       
   END IF 
   #add by geza 20151119(E)
   CALL astt340_stbe3_fill()  
   CALL astt340_stbe4_fill()   #add by geza 20150802   
   #end add-point
   
   #判斷是否填充
   IF astt340_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024, 
             stbe025,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015, 
             stbe016,stbe026,stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020,stbe019,stbe032, 
             stbecomp ,t2.stael003 ,t3.ooail003 FROM stbe_t",   
                     " INNER JOIN stbd_t ON stbdent = " ||g_enterprise|| " AND stbddocno = stbedocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=stbe005 AND t2.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t3 ON t3.ooailent="||g_enterprise||" AND t3.ooail001=stbe008 AND t3.ooail002='"||g_dlang||"' ",
 
                     " WHERE stbeent=? AND stbedocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         LET g_sql = g_sql CLIPPED, "  AND  stbe001 != '3' "  #150616-00035#23 add By geza 
         #LET g_sql = g_sql CLIPPED, "  AND NOT (stbe001 = '3' AND stbe010 ='2')"  #150616-00035#23 By geza 
         #LET g_sql = g_sql CLIPPED, "  AND NOT (stbe001 = '3' AND stbe010 ='1')"  #150204-00001#27 By shi 
     
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbe_t.stbeseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt340_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt340_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stbd_m.stbddocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stbd_m.stbddocno INTO g_stbe_d[l_ac].stbeseq,g_stbe_d[l_ac].stbe001, 
          g_stbe_d[l_ac].stbe002,g_stbe_d[l_ac].stbe003,g_stbe_d[l_ac].stbe004,g_stbe_d[l_ac].stbe028, 
          g_stbe_d[l_ac].stbe005,g_stbe_d[l_ac].stbe024,g_stbe_d[l_ac].stbe025,g_stbe_d[l_ac].stbe006, 
          g_stbe_d[l_ac].stbe007,g_stbe_d[l_ac].stbe008,g_stbe_d[l_ac].stbe009,g_stbe_d[l_ac].stbe010, 
          g_stbe_d[l_ac].stbe011,g_stbe_d[l_ac].stbe012,g_stbe_d[l_ac].stbe013,g_stbe_d[l_ac].stbe014, 
          g_stbe_d[l_ac].stbe015,g_stbe_d[l_ac].stbe016,g_stbe_d[l_ac].stbe026,g_stbe_d[l_ac].stbe027, 
          g_stbe_d[l_ac].stbe017,g_stbe_d[l_ac].stbe018,g_stbe_d[l_ac].stbe033,g_stbe_d[l_ac].stbe031, 
          g_stbe_d[l_ac].stbesite,g_stbe_d[l_ac].stbe020,g_stbe_d[l_ac].stbe019,g_stbe_d[l_ac].stbe032, 
          g_stbe_d[l_ac].stbecomp,g_stbe_d[l_ac].stbe005_desc,g_stbe_d[l_ac].stbe008_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stbe_d[l_ac].stbe028
         CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stbe_d[l_ac].stbe028_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stbe_d[l_ac].stbe028_desc
         #end add-point
      
         IF l_ac > g_max_rec THEN
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF
            EXIT FOREACH
         END IF
         
         LET l_ac = l_ac + 1
      END FOREACH
      LET g_error_show = 0
   
   END IF
    
   #判斷是否填充
   IF astt340_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbfseq,stbf001,stbf002,stbf003,stbf004,stbf005,stbf006,stbf007, 
             stbf008  FROM stbf_t",   
                     " INNER JOIN  stbd_t ON stbdent = " ||g_enterprise|| " AND stbddocno = stbfdocno ",
 
                     "",
                     
                     
                     " WHERE stbfent=? AND stbfdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbf_t.stbfseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt340_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astt340_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stbd_m.stbddocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stbd_m.stbddocno INTO g_stbe3_d[l_ac].stbfseq,g_stbe3_d[l_ac].stbf001, 
          g_stbe3_d[l_ac].stbf002,g_stbe3_d[l_ac].stbf003,g_stbe3_d[l_ac].stbf004,g_stbe3_d[l_ac].stbf005, 
          g_stbe3_d[l_ac].stbf006,g_stbe3_d[l_ac].stbf007,g_stbe3_d[l_ac].stbf008   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         #150505-00016#1--add by dongsz--str---
         SELECT ooef019 INTO l_ooef019 FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = g_stbd_m.stbdsite
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = l_ooef019
         LET g_ref_fields[2] = g_stbe3_d[l_ac].stbf004
         CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stbe3_d[l_ac].stbf004_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stbe3_d[l_ac].stbf004_desc
         #150505-00016#1--add by dongsz--end---
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_stbe_d.deleteElement(g_stbe_d.getLength())
   CALL g_stbe3_d.deleteElement(g_stbe3_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt340_pb
   FREE astt340_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbe_d.getLength()
      LET g_stbe_d_mask_o[l_ac].* =  g_stbe_d[l_ac].*
      CALL astt340_stbe_t_mask()
      LET g_stbe_d_mask_n[l_ac].* =  g_stbe_d[l_ac].*
   END FOR
   
   LET g_stbe3_d_mask_o.* =  g_stbe3_d.*
   FOR l_ac = 1 TO g_stbe3_d.getLength()
      LET g_stbe3_d_mask_o[l_ac].* =  g_stbe3_d[l_ac].*
      CALL astt340_stbf_t_mask()
      LET g_stbe3_d_mask_n[l_ac].* =  g_stbe3_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt340_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM stbe_t
       WHERE stbeent = g_enterprise AND
         stbedocno = ps_keys_bak[1] AND stbeseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbe_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stbf_t
       WHERE stbfent = g_enterprise AND
             stbfdocno = ps_keys_bak[1] AND stbfseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stbe3_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   #add by geza 20151119(S)
   #判斷是否是同一群組的table
   LET ls_group = "'3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前

      #end add-point    
      DELETE FROM stev_t
       WHERE stevent = g_enterprise AND
         stevdocno = ps_keys_bak[1] AND stevseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中

      #end add-point    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_stev_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   #add by geza 20151119(E)
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt340_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO stbe_t
                  (stbeent,
                   stbedocno,
                   stbeseq
                   ,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe026,stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbe_d[g_detail_idx].stbe001,g_stbe_d[g_detail_idx].stbe002,g_stbe_d[g_detail_idx].stbe003, 
                       g_stbe_d[g_detail_idx].stbe004,g_stbe_d[g_detail_idx].stbe028,g_stbe_d[g_detail_idx].stbe005, 
                       g_stbe_d[g_detail_idx].stbe024,g_stbe_d[g_detail_idx].stbe025,g_stbe_d[g_detail_idx].stbe006, 
                       g_stbe_d[g_detail_idx].stbe007,g_stbe_d[g_detail_idx].stbe008,g_stbe_d[g_detail_idx].stbe009, 
                       g_stbe_d[g_detail_idx].stbe010,g_stbe_d[g_detail_idx].stbe011,g_stbe_d[g_detail_idx].stbe012, 
                       g_stbe_d[g_detail_idx].stbe013,g_stbe_d[g_detail_idx].stbe014,g_stbe_d[g_detail_idx].stbe015, 
                       g_stbe_d[g_detail_idx].stbe016,g_stbe_d[g_detail_idx].stbe026,g_stbe_d[g_detail_idx].stbe027, 
                       g_stbe_d[g_detail_idx].stbe017,g_stbe_d[g_detail_idx].stbe018,g_stbe_d[g_detail_idx].stbe033, 
                       g_stbe_d[g_detail_idx].stbe031,g_stbe_d[g_detail_idx].stbesite,g_stbe_d[g_detail_idx].stbe020, 
                       g_stbe_d[g_detail_idx].stbe019,g_stbe_d[g_detail_idx].stbe032,g_stbe_d[g_detail_idx].stbecomp) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbe_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stbf_t
                  (stbfent,
                   stbfdocno,
                   stbfseq
                   ,stbf001,stbf002,stbf003,stbf004,stbf005,stbf006,stbf007,stbf008) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbe3_d[g_detail_idx].stbf001,g_stbe3_d[g_detail_idx].stbf002,g_stbe3_d[g_detail_idx].stbf003, 
                       g_stbe3_d[g_detail_idx].stbf004,g_stbe3_d[g_detail_idx].stbf005,g_stbe3_d[g_detail_idx].stbf006, 
                       g_stbe3_d[g_detail_idx].stbf007,g_stbe3_d[g_detail_idx].stbf008)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stbe3_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt340_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE   
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbe_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt340_stbe_t_mask_restore('restore_mask_o')
               
      UPDATE stbe_t 
         SET (stbedocno,
              stbeseq
              ,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,stbe024,stbe025,stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe026,stbe027,stbe017,stbe018,stbe033,stbe031,stbesite,stbe020,stbe019,stbe032,stbecomp) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbe_d[g_detail_idx].stbe001,g_stbe_d[g_detail_idx].stbe002,g_stbe_d[g_detail_idx].stbe003, 
                  g_stbe_d[g_detail_idx].stbe004,g_stbe_d[g_detail_idx].stbe028,g_stbe_d[g_detail_idx].stbe005, 
                  g_stbe_d[g_detail_idx].stbe024,g_stbe_d[g_detail_idx].stbe025,g_stbe_d[g_detail_idx].stbe006, 
                  g_stbe_d[g_detail_idx].stbe007,g_stbe_d[g_detail_idx].stbe008,g_stbe_d[g_detail_idx].stbe009, 
                  g_stbe_d[g_detail_idx].stbe010,g_stbe_d[g_detail_idx].stbe011,g_stbe_d[g_detail_idx].stbe012, 
                  g_stbe_d[g_detail_idx].stbe013,g_stbe_d[g_detail_idx].stbe014,g_stbe_d[g_detail_idx].stbe015, 
                  g_stbe_d[g_detail_idx].stbe016,g_stbe_d[g_detail_idx].stbe026,g_stbe_d[g_detail_idx].stbe027, 
                  g_stbe_d[g_detail_idx].stbe017,g_stbe_d[g_detail_idx].stbe018,g_stbe_d[g_detail_idx].stbe033, 
                  g_stbe_d[g_detail_idx].stbe031,g_stbe_d[g_detail_idx].stbesite,g_stbe_d[g_detail_idx].stbe020, 
                  g_stbe_d[g_detail_idx].stbe019,g_stbe_d[g_detail_idx].stbe032,g_stbe_d[g_detail_idx].stbecomp)  
 
         WHERE stbeent = g_enterprise AND stbedocno = ps_keys_bak[1] AND stbeseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbe_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbe_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt340_stbe_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbf_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astt340_stbf_t_mask_restore('restore_mask_o')
               
      UPDATE stbf_t 
         SET (stbfdocno,
              stbfseq
              ,stbf001,stbf002,stbf003,stbf004,stbf005,stbf006,stbf007,stbf008) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbe3_d[g_detail_idx].stbf001,g_stbe3_d[g_detail_idx].stbf002,g_stbe3_d[g_detail_idx].stbf003, 
                  g_stbe3_d[g_detail_idx].stbf004,g_stbe3_d[g_detail_idx].stbf005,g_stbe3_d[g_detail_idx].stbf006, 
                  g_stbe3_d[g_detail_idx].stbf007,g_stbe3_d[g_detail_idx].stbf008) 
         WHERE stbfent = g_enterprise AND stbfdocno = ps_keys_bak[1] AND stbfseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbf_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbf_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt340_stbf_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt340_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt340_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt340_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL astt340_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stbe_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt340_bcl USING g_enterprise,
                                       g_stbd_m.stbddocno,g_stbe_d[g_detail_idx].stbeseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt340_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stbf_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt340_bcl2 USING g_enterprise,
                                             g_stbd_m.stbddocno,g_stbe3_d[g_detail_idx].stbfseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt340_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt340_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt340_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt340_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   #add by geza 20151119(S)
   LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt340_bcl3
   END IF
   #add by geza 20151119(E)
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt340_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stbddocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stbddocno",TRUE)
      CALL cl_set_comp_entry("stbddocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
     #CALL cl_set_comp_entry("stbd002,stbd003,stbd006",TRUE)
     CALL cl_set_comp_entry("stbd001",TRUE)
      CALL cl_set_comp_entry("stbd002",TRUE)
      CALL cl_set_comp_entry("stbdsite",TRUE)
      CALL cl_set_comp_required('stbdsite',TRUE)      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("stbd005",TRUE)  #add by geza 20150707
   CALL cl_set_comp_entry("stbd006",TRUE)  #add by geza 20150707
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt340_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE  l_cnt       LIKE type_t.num10 #5 
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stbddocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      CALL cl_set_comp_entry("stbd002,stbd003,stbd006",FALSE)
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stbddocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stbddocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stbd001",FALSE)
      CALL cl_set_comp_entry("stbd005",FALSE)  #add by geza 20150707
      CALL cl_set_comp_entry("stbd006",FALSE)  #add by geza 20150707
   END IF
   #单身有资料关闭起始时间，截止时间  #add by geza 20150707
    LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM stbe_t
    WHERE stbeent = g_enterprise AND stbedocno = g_stbd_m.stbddocno
   IF l_cnt > 0 THEN
      CALL cl_set_comp_entry("stbd005",FALSE)  #add by geza 20150707
      CALL cl_set_comp_entry("stbd006",FALSE)  #add by geza 20150707
   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stbdsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stbdsite",FALSE)
   END IF
   CALL cl_set_comp_entry("stbdunit",FALSE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt340_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry('stbe025',TRUE)   
   CALL cl_set_comp_entry('stbe024_1,stbe025_1,stev026',TRUE)   #add by geza 20151119
   CALL cl_set_comp_entry('stev016,stev030',TRUE)               #add by geza 20151119
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt340_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF g_stbe_d[l_ac].stbe024 = 'N' THEN
      CALL cl_set_comp_entry('stbe025',FALSE)      
   END IF
   IF g_stbe_d_2[l_ac].stbe024_1 = 'N' THEN
      CALL cl_set_comp_entry('stbe025_1',FALSE)      
   END IF
   #add by geza 20151119(S) 
   #是否启用交款汇总单为Y,纳入结算单否不可修改
   IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'Y' THEN
       CALL cl_set_comp_entry('stbe024_1,stev026',FALSE)
       CALL cl_set_comp_entry('stev016,stev030',FALSE)               #add by geza 20150915
   END IF 
   #add by geza 20151119(E)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt340_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt340_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stbd_m.stbdstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt340_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt340.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt340_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt340.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt340_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " stbddocno = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      
      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
         INITIALIZE g_wc2_table2 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stbd_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbe_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbf_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
            END IF
 
 
            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF
         
            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF
    
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF
   END IF
   
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt340_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #add by geza 20151202(S)  
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING                   
   DEFINE l_comp       LIKE ooef_t.ooef001
   DEFINE g_glaa003    LIKE glaa_t.glaa003
   DEFINE g_glaa024    LIKE glaa_t.glaa024
   DEFINE l_ooba002    LIKE ooba_t.ooba002
   DEFINE l_ooba002_1  LIKE ooba_t.ooba002
   DEFINE g_ld         LIKE apca_t.apcald
   #add by geza 20151202(E)
   #add by 08172
   DEFINE   l_ooac002      LIKE ooac_t.ooac002
   DEFINE   l_ooac004      LIKE ooac_t.ooac004
   DEFINE   l_flag1        LIKE type_t.num5 
   #add by 08172   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stbd_m.stbdstus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stbd_m.stbddocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
   IF STATUS THEN
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt340_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
       g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
   
 
   #檢查是否允許此動作
   IF NOT astt340_action_chk() THEN
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno,g_stbd_m.stbd048, 
       g_stbd_m.stbd048_desc,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd037_desc,g_stbd_m.stbd002, 
       g_stbd_m.stbd002_desc,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbdunit_desc, 
       g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044,g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005, 
       g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp, 
       g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt, 
       g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
       g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
       g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018, 
       g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd021_desc,g_stbd_m.stbd022, 
       g_stbd_m.stbd022_desc,g_stbd_m.stbd023,g_stbd_m.stbd023_desc,g_stbd_m.stbd024,g_stbd_m.stbd025, 
       g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd046_desc,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc,g_stbd_m.stbd031,g_stbd_m.stbd032
 
   CASE g_stbd_m.stbdstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "J"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/reconciliate.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stbd_m.stbdstus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "J"
               HIDE OPTION "reconciliate"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      #mark by geza 20151125(S)
#      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
#     # CALL cl_set_act_visible("unconfirmed",FALSE)     #mark by geza 20150604
#      CALL cl_set_act_visible("signing,withdraw",FALSE)
#      CASE g_stbd_m.stbdstus
#         WHEN "N"
#            #HIDE OPTION "open"
#            CALL cl_set_act_visible("unconfirmed",FALSE)
#            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
#            IF cl_bpm_chk() THEN
#               CALL cl_set_act_visible("signing",TRUE)
#               CALL cl_set_act_visible("confirmed",FALSE)
#            END IF
#            
#         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
#            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
#            
#         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
#            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
#            
#         WHEN "X"
#            #HIDE OPTION "invalid"
#            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
#
#         WHEN "Y"
#            #HIDE OPTION "confirmed"
#            CALL cl_set_act_visible("invalid,confirmed",FALSE)
#
#         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
#            CALL cl_set_act_visible("withdraw",TRUE)
#            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
#            
#         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
#            CALL cl_set_act_visible("confirmed",TRUE)
#            CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)
#            
#      END CASE
      #mark by geza 20151125(E)
      
      #add by geza 20151125(S)
      CALL cl_set_act_visible("invalid,reconciliate,confirmed,unconfirmed",TRUE)    
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stbd_m.stbdstus
         WHEN "N"
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)    
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
            
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold,reconciliate",FALSE) 
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold,reconciliate",FALSE) 
         WHEN "X"
            CALL cl_set_act_visible("invalid,reconciliate,confirmed,unconfirmed",FALSE) 
         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed,unconfirmed",FALSE) 
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold,reconciliate",FALSE) 
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,hold,reconciliate",FALSE)  
         WHEN "J"    #只能顯示確認和取消对账; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed,unconfirmed",TRUE)
            CALL cl_set_act_visible("reconciliate,invalid,hold",FALSE)                           
      END CASE
      #add by geza 20151125(E)
      LET l_success = TRUE
      LET g_stbd_m.stbdcnfdt=cl_get_current()
      LET g_stbd_m.stbdmoddt=cl_get_current()
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt340_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt340_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt340_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt340_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
#mark by geza 20151125(S)
#        #huangrh add unconfirmed----20150604---        
#        CALL s_astt340_conf_chk(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno
#         
#         IF l_success THEN
#            IF cl_ask_confirm('lib-015') THEN
#               CALL s_astt340_conf_upd(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno 
#               UPDATE stbd_t SET stbdcnfid ='',stbdcnfdt=''
#                    WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno                 
#               IF NOT l_success THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = l_errno
#                  LET g_errparam.extend = g_stbd_m.stbddocno
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  CALL s_transaction_end('N','0')                 
#                  RETURN
#               END IF
#            ELSE
#               RETURN            
#            END IF
#         ELSE
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = l_errno
#            LET g_errparam.extend = g_stbd_m.stbddocno
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#
#            RETURN            
#         END IF
#mark by geza 20151125(E)
#add by geza 20151125(S)
          CALL s_transaction_begin()
          CALL s_astt340_uncash_check(g_stbd_m.stbddocno) RETURNING l_success,l_errno
          IF NOT l_success THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = l_errno
             LET g_errparam.extend = g_stbd_m.stbddocno
             LET g_errparam.popup = TRUE
             CALL cl_err()
             CALL s_transaction_end('N','0')
             RETURN
          ELSE
#             IF NOT cl_ask_confirm('ast-00509') THEN     #160511-00009#9   2016/05/16  mark by 07959
             IF NOT cl_ask_confirm('ast-00753') THEN     #160511-00009#9   2016/05/16  add by 07959
                CALL s_transaction_end('N','0')
                RETURN
             ELSE
                CALL s_astt340_uncash_upd(g_stbd_m.stbddocno) RETURNING l_success,l_errno
                IF NOT l_success THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = l_errno
                   LET g_errparam.extend = g_stbd_m.stbddocno
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   CALL s_transaction_end('N','0')
                   RETURN
                END IF
             END IF
          END IF
#add by geza 20151125(E)
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
         CALL s_astt340_conf_chk(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
#            IF cl_ask_confirm('lib-014') THEN   #160511-00009#9   2016/05/16  mark by 07959
            IF cl_ask_confirm('ast-00755') THEN   #160511-00009#9   2016/05/16  add by 07959
               CALL s_transaction_begin()
               CALL s_astt340_conf_upd(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno 
               UPDATE stbd_t SET stbdcnfid =g_user,stbdcnfdt=g_stbd_m.stbdcnfdt,stbdstus = lc_state
                    WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno                 
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stbd_m.stbddocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')                 
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
                  #160604-00009#92 -s by 08172
                  CALL s_aooi200_get_slip(g_stbd_m.stbddocno) RETURNING l_flag1,l_ooac002
                  CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'E-CIR-0066') RETURNING l_ooac004
                  IF l_ooac004='Y' THEN
                  #160604-00009#92 -e by 08172
                     #add by geza 20151201(S)     
                     #调用axrp200生成axrt210暂估单
                     INITIALIZE la_param.* TO NULL   
                     LET la_param.prog = "axrp200"
                     LET la_param.param[1] = 'Y'
                     LET la_param.param[2] = g_stbd_m.stbdsite
                     SELECT glaald INTO g_ld
                       FROM glaa_t
                      WHERE glaaent = g_enterprise
                        AND glaacomp= g_stbd_m.stbd048
                        AND glaa014 = 'Y'                   
                     LET la_param.param[3] = g_ld
                     LET la_param.param[4] = YEAR(g_stbd_m.stbddocdt)
                     LET la_param.param[5] = MONTH(g_stbd_m.stbddocdt)
                     LET la_param.param[6] = '1'
                     #抓取含发票单别
                     CALL s_ld_sel_glaa(g_ld,'glaa003|glaa024') RETURNING l_success,g_glaa003,g_glaa024
                     # 170207-00018#9  2017/02/13 By 09042 mark(S)
                     #SELECT DISTINCT ooba002 INTO l_ooba002 
                     #  FROM ooba_t 
                     #  LEFT OUTER JOIN ooac_t 
                     #    ON ooacent = oobaent 
                     #   AND ooac001 = ooba001 
                     #   AND ooac002 = ooba002 
                     # WHERE oobaent = g_enterprise
                     #   AND ooba002 IN (SELECT oobl001 
                     #                     FROM oobl_t 
                     #                    WHERE ooblent = g_enterprise
                     #                      AND oobl002 = 'axrt210')
                     #   AND oobastus = 'Y' 
                     #   AND ooba001 =  g_glaa024
                     #   AND ooac003 = 'E-FINC1001' 
                     #   AND ooac004 = 'Y' 
                     #   AND rownum = 1 
                     # ORDER BY ooba002
                     # 170207-00018#9  2017/02/13 By 09042 mark(E)
                     # 170207-00018#9  2017/02/13 By 09042 add(S) 
                     SELECT a.ooba002 INTO l_ooba002
                       FROM ( 
                             SELECT DISTINCT ooba002
                               FROM ooba_t
                               LEFT OUTER JOIN ooac_t  
                                 ON ooacent = oobaent
                                AND ooac001 = ooba001
                                AND ooac002 = ooba002
                              WHERE oobaent = g_enterprise
                                AND ooba002 IN (SELECT oobl001 
                                          FROM oobl_t 
                                         WHERE ooblent = g_enterprise
                                           AND oobl002 = 'axrt210')
                                AND oobastus = 'Y'
                                AND ooba001 =  g_glaa024 
                                AND ooac003 = 'E-FINC1001'
                                AND ooac004 = 'Y'
                              ORDER BY ooba002   
                             ) a
                     WHERE rownum = 1;
                     # 170207-00018#9  2017/02/13 By 09042 add(E)                     
                     #抓取不含发票单别
                     # 170207-00018#9  2017/02/13 By 09042 mark(S)                     
                     #SELECT DISTINCT ooba002 INTO l_ooba002_1 
                     #  FROM ooba_t 
                     #  LEFT OUTER JOIN ooac_t 
                     #    ON ooacent = oobaent 
                     #   AND ooac001 = ooba001 
                     #   AND ooac002 = ooba002 
                     # WHERE oobaent = g_enterprise
                     #   AND ooba002 IN (SELECT oobl001 
                     #                     FROM oobl_t 
                     #                    WHERE ooblent = g_enterprise
                     #                      AND oobl002 = 'axrt210')
                     #   AND oobastus = 'Y' 
                     #   AND ooba001 =  g_glaa024
                     #   AND ooac003 = 'E-FINC1001' 
                     #   AND ooac004 = 'N' 
                     #   AND rownum = 1 
                     # ORDER BY ooba002 
                     # 170207-00018#9  2017/02/13 By 09042 mark(E)
                     # 170207-00018#9  2017/02/13 By 09042 add(S) 
                     SELECT b.ooba002 INTO l_ooba002_1
                              FROM ( 
                                    SELECT DISTINCT ooba002
                                      FROM ooba_t
                                      LEFT OUTER JOIN ooac_t  
                                        ON ooacent = oobaent
                                       AND ooac001 = ooba001
                                       AND ooac002 = ooba002
                                     WHERE oobaent = g_enterprise
                                       AND ooba002 IN (SELECT oobl001 
                                                 FROM oobl_t 
                                                WHERE ooblent = g_enterprise
                                                  AND oobl002 = 'axrt210')
                                       AND oobastus = 'Y'
                                       AND ooba001 =  g_glaa024 
                                       AND ooac003 = 'E-FINC1001'
                                       AND ooac004 = 'N'
                                     ORDER BY ooba002   
                                    ) b
                     WHERE rownum = 1;
                     # 170207-00018#9  2017/02/13 By 09042 add(E)                     
                     LET la_param.param[7] = l_ooba002
                     LET la_param.param[8] = l_ooba002_1
                     LET la_param.param[9] = g_today
                     LET la_param.param[9] = g_stbd_m.stbddocno
                     LET ls_js = util.JSON.stringify( la_param )
                     CALL cl_cmdrun_wait(ls_js)
                     #add by geza 20151201(E)   
                  END IF
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = g_stbd_m.stbddocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN            
         END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION approved
         IF cl_auth_chk_act("approved") THEN
            LET lc_state = "A"
            #add-point:action控制 name="statechange.approved"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION signing
      #   IF cl_auth_chk_act("signing") THEN
      #      LET lc_state = "W"
      #      #add-point:action控制 name="statechange.signing"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION reconciliate
         IF cl_auth_chk_act("reconciliate") THEN
            LET lc_state = "J"
            #add-point:action控制 name="statechange.reconciliate"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
         CALL s_astt340_conf_chk(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno

         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt340_conf_upd(g_stbd_m.stbddocno,lc_state) RETURNING l_success,l_errno 
               UPDATE stbd_t SET stbdmodid =g_user,stbdmoddt=g_stbd_m.stbdmoddt
                    WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno                 
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stbd_m.stbddocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')                 
                  RETURN
               ELSE
#add by yangxf ---start----
                  #更新astq330中的状态
                  CALL astt340_delete_updstbc() RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     RETURN      
                  END IF
#add by yangxf ---end----
                  #是否启用交款汇总单为N,还原结算底稿
                  #add by geza 20151119(S)
                  IF cl_get_para(g_enterprise,g_stbd_m.stbdsite,"S-CIR-2012") = 'N' THEN
                     CALL astt340_delete_updstbc2() RETURNING l_success
                     IF NOT l_success THEN
                        CALL s_transaction_end('N','0')
                        RETURN      
                     END IF             
                  END IF 
                  #add by geza 20151119(E)
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = g_stbd_m.stbddocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN            
         END IF  
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "J"
      AND lc_state <> "X"
      ) OR 
      g_stbd_m.stbdstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #add by geza 20151125(S)
   IF lc_state = 'J' AND g_stbd_m.stbdstus = 'N' THEN
      CALL s_transaction_begin()
      CALL s_astt340_cash_check(g_stbd_m.stbddocno) RETURNING l_success,l_errno
      IF NOT l_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = l_errno
         LET g_errparam.extend = g_stbd_m.stbddocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      ELSE
         IF NOT cl_ask_confirm('ast-00510') THEN 
            CALL s_transaction_end('N','0')
            RETURN
         ELSE
            CALL s_astt340_cash_upd(g_stbd_m.stbddocno) RETURNING l_success,l_errno 
            IF NOT l_success THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = l_errno
               LET g_errparam.extend = g_stbd_m.stbddocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
      END IF
   END IF
   IF lc_state = 'J' AND g_stbd_m.stbdstus = 'Y' THEN
         CALL cl_err_collect_init() 
         CALL s_astt340_conf_chk(g_stbd_m.stbddocno,'N') RETURNING l_success,l_errno         
         IF l_success THEN
#            IF cl_ask_confirm('lib-015') THEN   #160511-00009#9   2016/05/16  mark by 07959
            IF cl_ask_confirm('ast-00752') THEN   #160511-00009#9   2016/05/16  add by 07959
               CALL s_transaction_begin()
               CALL s_astt340_conf_upd(g_stbd_m.stbddocno,'N') RETURNING l_success,l_errno
               CALL cl_err_collect_show()           
               UPDATE stbd_t SET stbdcnfid ='',stbdcnfdt=''
                    WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno                 
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')                 
                  RETURN
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            CALL cl_err_collect_show()  
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN            
         END IF
   END IF
   #add by geza 20151125(E)
   #end add-point
   
   LET g_stbd_m.stbdmodid = g_user
   LET g_stbd_m.stbdmoddt = cl_get_current()
   LET g_stbd_m.stbdstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stbd_t 
      SET (stbdstus,stbdmodid,stbdmoddt) 
        = (g_stbd_m.stbdstus,g_stbd_m.stbdmodid,g_stbd_m.stbdmoddt)     
    WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "J"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/reconciliate.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
          g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd002,g_stbd_m.stbd001, 
          g_stbd_m.stbd041,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
          g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
          g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
          g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008, 
          g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013, 
          g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018, 
          g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023, 
          g_stbd_m.stbd024,g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027, 
          g_stbd_m.stbd028,g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc, 
          g_stbd_m.stbd048_desc,g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc, 
          g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc, 
          g_stbd_m.stbdcnfid_desc,g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc, 
          g_stbd_m.stbd030_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stbd_m.stbdsite,g_stbd_m.stbdsite_desc,g_stbd_m.stbddocdt,g_stbd_m.stbddocno, 
          g_stbd_m.stbd048,g_stbd_m.stbd048_desc,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd037_desc, 
          g_stbd_m.stbd002,g_stbd_m.stbd002_desc,g_stbd_m.stbd001,g_stbd_m.stbd041,g_stbd_m.stbd003, 
          g_stbd_m.stbdunit,g_stbd_m.stbdunit_desc,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
          g_stbd_m.stbd004,g_stbd_m.stax004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus, 
          g_stbd_m.stbdownid,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp,g_stbd_m.stbdowndp_desc,g_stbd_m.stbdcrtid, 
          g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
          g_stbd_m.stbdmodid_desc,g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfid_desc,g_stbd_m.stbdcnfdt, 
          g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045, 
          g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016, 
          g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019,g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021, 
          g_stbd_m.stbd021_desc,g_stbd_m.stbd022,g_stbd_m.stbd022_desc,g_stbd_m.stbd023,g_stbd_m.stbd023_desc, 
          g_stbd_m.stbd024,g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd046_desc, 
          g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028,g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd030_desc, 
          g_stbd_m.stbd031,g_stbd_m.stbd032
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt340_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt340_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt340.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt340_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stbe_d.getLength() THEN
         LET g_detail_idx = g_stbe_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbe_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbe_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_stbe3_d.getLength() THEN
         LET g_detail_idx = g_stbe3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbe3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbe3_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt340_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astt340_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt340_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astt340.status_show" >}
PRIVATE FUNCTION astt340_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt340.mask_functions" >}
&include "erp/ast/astt340_mask.4gl"
 
{</section>}
 
{<section id="astt340.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt340_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
 
 
   CALL astt340_show()
   CALL astt340_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
#   CALL s_astt340_conf_chk(g_stbd_m.stbddocno,g_stbd_m.stbdstus) RETURNING l_success,l_errno   #160728-00033#1  by 08172
   CALL s_astt340_conf_chk(g_stbd_m.stbddocno,'W') RETURNING l_success,l_errno   #160728-00033#1  by 08172
   #MOD BY zhujing 2015-6-16  添加报错消息
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = g_stbd_m.stbddocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF

   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stbd_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stbe_d))
   CALL cl_bpm_set_detail_data("s_detail3", util.JSONArray.fromFGL(g_stbe3_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL astt340_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt340_ui_headershow()
   CALL astt340_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt340_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt340_ui_headershow()  
   CALL astt340_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt340.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt340_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_stbd_m.stbddocno
   LET g_pk_array[1].column = 'stbddocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt340.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt340.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt340_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL astt340_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stbd_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt340.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt340_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#39 add-S
   SELECT stbdstus  INTO g_stbd_m.stbdstus
     FROM stbd_t
    WHERE stbdent = g_enterprise
      AND stbddocno = g_stbd_m.stbddocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stbd_m.stbdstus
        WHEN 'J'
           LET g_errno = 'sub-01355'
        WHEN 'W'
           LET g_errno = 'sub-00180'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_stbd_m.stbddocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt340_set_act_visible()
        CALL astt340_set_act_no_visible()
        CALL astt340_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#39 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt340.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 結算單價外費用明細
# Memo...........:
# Usage..........: CALL astt340_stbe2_fill2()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 20140415 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt340_stbe2_fill2()
DEFINE p_wc2      STRING
DEFINE l_i        LIKE type_t.num5
   
 
   CALL g_stbe_d_2.clear()    #g_stbe_d 單頭及單身 
  
   LET g_sql = "SELECT  UNIQUE stbeseq,stbe001,stbe002,stbe003,stbe004,stbe028,stbe005,'',stbe024,stbe025,'',stbe006,stbe007, 
       stbe008,'',stbe009,'',stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe026,stbe027,stbe017,stbe018,stbe031, 
       stbesite,stbe020,stbe019,stbe032,stbecomp FROM stbe_t",   
               " INNER JOIN stbd_t ON stbddocno = stbedocno ",
               " WHERE stbeent=? AND stbedocno=?",
               "   AND stbe001='3' ",   #150616-00035#23 add By geza
               "   AND stbe024='Y' "   #add By geza 20151119
              # "   AND stbe001='3' AND stbe010='1'"   #150204-00001#27 By shi
              #"   AND stbe001='3' AND stbe010='2'"   #150204-00001#27 By shi

   IF NOT cl_null(g_wc2_table3) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table3 CLIPPED
   END IF
   
   #子單身的WC
        
   LET g_sql = g_sql, " ORDER BY stbe_t.stbeseq"      
   
   #PREPARE astt340_pb2 FROM g_sql                     #150505-00016#1--mark by dongsz
   #DECLARE b_fill_cs2 CURSOR FOR astt340_pb2          #150505-00016#1--mark by dongsz
   PREPARE astt340_pb3 FROM g_sql                      #150505-00016#1--add by dongsz
   DECLARE b_fill_cs3 CURSOR FOR astt340_pb3           #150505-00016#1--add by dongsz
   
   LET l_i = 1
   
   #OPEN b_fill_cs2 USING g_enterprise,g_stbd_m.stbddocno   #150505-00016#1--mark by dongsz
   OPEN b_fill_cs3 USING g_enterprise,g_stbd_m.stbddocno    #150505-00016#1--add by dongsz
 
                                            
   #FOREACH b_fill_cs2 INTO g_stbe_d_2[l_i].stbeseq_1,g_stbe_d_2[l_i].stbe001_1,g_stbe_d_2[l_i].stbe002_1,g_stbe_d_2[l_i].stbe003_1,     #150505-00016#1--mark by dongsz
   FOREACH b_fill_cs3 INTO g_stbe_d_2[l_i].stbeseq_1,g_stbe_d_2[l_i].stbe001_1,g_stbe_d_2[l_i].stbe002_1,g_stbe_d_2[l_i].stbe003_1,      #150505-00016#1--add by dongsz
       g_stbe_d_2[l_i].stbe004_1,g_stbe_d_2[l_i].stbe028_1,g_stbe_d_2[l_i].stbe005_1,g_stbe_d_2[l_i].stbe005_1_desc,
       g_stbe_d_2[l_i].stbe024_1,g_stbe_d_2[l_i].stbe025_1,g_stbe_d_2[l_i].stae003_1, 
       g_stbe_d_2[l_i].stbe006_1,g_stbe_d_2[l_i].stbe007_1,g_stbe_d_2[l_i].stbe008_1,g_stbe_d_2[l_i].stbe008_1_desc, 
       g_stbe_d_2[l_i].stbe009_1,g_stbe_d_2[l_i].stbe009_1_desc,g_stbe_d_2[l_i].stbe010_1,g_stbe_d_2[l_i].stbe011_1, 
       g_stbe_d_2[l_i].stbe012_1,g_stbe_d_2[l_i].stbe013_1,g_stbe_d_2[l_i].stbe014_1,g_stbe_d_2[l_i].stbe015_1, 
       g_stbe_d_2[l_i].stbe016_1,g_stbe_d_2[l_i].stbe026_1,g_stbe_d_2[l_i].stbe027_1,g_stbe_d_2[l_i].stbe017_1,g_stbe_d_2[l_i].stbe018_1,g_stbe_d_2[l_i].stbe031_1,
       g_stbe_d_2[l_i].stbesite_1,g_stbe_d_2[l_i].stbe020_1,g_stbe_d_2[l_i].stbe019_1,g_stbe_d_2[l_i].stbe032_1,g_stbe_d_2[l_i].stbecomp_1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbe_d_2[l_i].stbe028_1
      CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d_2[l_i].stbe028_1_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d_2[l_i].stbe028_1_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbe_d_2[l_i].stbe005_1
      CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d_2[l_i].stbe005_1_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d_2[l_i].stbe005_1_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbe_d_2[l_i].stbe005_1
      CALL ap_ref_array2(g_ref_fields,"SELECT stae003 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
      LET g_stbe_d_2[l_i].stae003_1 = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d_2[l_i].stae003_1

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbe_d_2[l_i].stbe008_1
      CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d_2[l_i].stbe008_1_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d_2[l_i].stbe008_1_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] =g_stbe_d_2[l_i].stbe009_1
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d_2[l_i].stbe009_1_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d_2[l_i].stbe009_1_desc


      LET l_i = l_i + 1
      IF l_i > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
    
   CALL g_stbe_d_2.deleteElement(g_stbe_d_2.getLength())
     
   #FREE astt340_pb2        #150505-00016#1--mark by dongsz
   FREE astt340_pb3         #150505-00016#1--add by dongsz


END FUNCTION

################################################################################
# Descriptions...: 提取單身貨款明細資料
# Memo...........:
# Usage..........: CALL astt340_stbe_insert()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20140415 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt340_stbe_insert()
DEFINE r_success     LIKE type_t.num5
#161111-00028#5--modify---begin--------
#DEFINE l_stbc RECORD LIKE stbc_t.*
#DEFINE l_stbe RECORD LIKE stbe_t.*
DEFINE l_stbc RECORD  #結算底稿
       stbcent LIKE stbc_t.stbcent, #企業編號
       stbcsite LIKE stbc_t.stbcsite, #營運據點
       stbc001 LIKE stbc_t.stbc001, #結算中心
       stbc002 LIKE stbc_t.stbc002, #單據日期
       stbc003 LIKE stbc_t.stbc003, #單據類別
       stbc004 LIKE stbc_t.stbc004, #單據編號
       stbc005 LIKE stbc_t.stbc005, #項次
       stbc006 LIKE stbc_t.stbc006, #業務結算期
       stbc007 LIKE stbc_t.stbc007, #財務會計年度
       stbc008 LIKE stbc_t.stbc008, #對象編號
       stbc009 LIKE stbc_t.stbc009, #經營方式
       stbc010 LIKE stbc_t.stbc010, #結算方式
       stbc011 LIKE stbc_t.stbc011, #結算類型
       stbc012 LIKE stbc_t.stbc012, #費用編號
       stbc013 LIKE stbc_t.stbc013, #幣別
       stbc014 LIKE stbc_t.stbc014, #稅別
       stbc015 LIKE stbc_t.stbc015, #價款類別
       stbc016 LIKE stbc_t.stbc016, #方向
       stbc017 LIKE stbc_t.stbc017, #價外金額
       stbc018 LIKE stbc_t.stbc018, #價內金額
       stbc019 LIKE stbc_t.stbc019, #未結算金額
       stbc020 LIKE stbc_t.stbc020, #已結算金額
       stbc021 LIKE stbc_t.stbc021, #未校驗金額
       stbc022 LIKE stbc_t.stbc022, #已收款金額
       stbc023 LIKE stbc_t.stbc023, #未立帳金額
       stbc024 LIKE stbc_t.stbc024, #已立帳金額
       stbc025 LIKE stbc_t.stbc025, #所屬品類
       stbc026 LIKE stbc_t.stbc026, #所屬部門
       stbc027 LIKE stbc_t.stbc027, #對象類別
       stbc028 LIKE stbc_t.stbc028, #財務會計期別
       stbc029 LIKE stbc_t.stbc029, #網點編號
       stbc030 LIKE stbc_t.stbc030, #結算合約編號
       stbc031 LIKE stbc_t.stbc031, #承擔對象
       stbc032 LIKE stbc_t.stbc032, #結算對象
       stbcstus LIKE stbc_t.stbcstus, #狀態碼
       stbc033 LIKE stbc_t.stbc033, #专柜编号
       stbc034 LIKE stbc_t.stbc034, #數量
       stbc035 LIKE stbc_t.stbc035, #已立帳數量
       stbc036 LIKE stbc_t.stbc036, #單價
       stbc037 LIKE stbc_t.stbc037, #納入結算單否
       stbc038 LIKE stbc_t.stbc038, #票扣否
       stbc039 LIKE stbc_t.stbc039, #結算扣率
       stbc040 LIKE stbc_t.stbc040, #結算日期
       stbc041 LIKE stbc_t.stbc041, #日結成本類型
       stbc042 LIKE stbc_t.stbc042, #銷售金額
       stbc043 LIKE stbc_t.stbc043, #商品編號
       stbc044 LIKE stbc_t.stbc044, #商品品類
       stbc045 LIKE stbc_t.stbc045, #開始日期
       stbc046 LIKE stbc_t.stbc046, #結束日期
       stbc047 LIKE stbc_t.stbc047, #已立帳金額帳套二
       stbc048 LIKE stbc_t.stbc048, #已立帳金額帳套三
       stbc049 LIKE stbc_t.stbc049, #主帳套暫估金額
       stbc050 LIKE stbc_t.stbc050, #帳套二暫估金額
       stbc051 LIKE stbc_t.stbc051, #帳套三暫估金額
       stbc052 LIKE stbc_t.stbc052, #已立帳數量帳套二
       stbc053 LIKE stbc_t.stbc053, #已立帳數量帳套三
       stbc054 LIKE stbc_t.stbc054, #主帳套暫估數量
       stbc055 LIKE stbc_t.stbc055, #帳套二暫估數量
       stbc056 LIKE stbc_t.stbc056, #帳套三暫估數量
       stbc057 LIKE stbc_t.stbc057, #已結算數量
       stbc058 LIKE stbc_t.stbc058, #含發票否
       stbc059 LIKE stbc_t.stbc059, #費用歸屬類型
       stbc060 LIKE stbc_t.stbc060, #費用歸屬組織
       stbc061 LIKE stbc_t.stbc061, #應收結算金額
       stbc062 LIKE stbc_t.stbc062, #帳套二應收結算金額
       stbc063 LIKE stbc_t.stbc063, #帳套三應收結算金額
       stbc064 LIKE stbc_t.stbc064   #收入立帳否
       END RECORD
DEFINE l_stbe RECORD  #結算單明細資料
       stbeent LIKE stbe_t.stbeent, #企業編號
       stbesite LIKE stbe_t.stbesite, #營運據點
       stbecomp LIKE stbe_t.stbecomp, #所屬法人
       stbedocno LIKE stbe_t.stbedocno, #單據編號
       stbeseq LIKE stbe_t.stbeseq, #單據項次
       stbe001 LIKE stbe_t.stbe001, #來源類別
       stbe002 LIKE stbe_t.stbe002, #來源單據
       stbe003 LIKE stbe_t.stbe003, #來源項次
       stbe004 LIKE stbe_t.stbe004, #來源日期
       stbe005 LIKE stbe_t.stbe005, #費用編號
       stbe006 LIKE stbe_t.stbe006, #起始日期
       stbe007 LIKE stbe_t.stbe007, #截止日期
       stbe008 LIKE stbe_t.stbe008, #幣別
       stbe009 LIKE stbe_t.stbe009, #稅別
       stbe010 LIKE stbe_t.stbe010, #價款類別
       stbe011 LIKE stbe_t.stbe011, #方向
       stbe012 LIKE stbe_t.stbe012, #價外金額
       stbe013 LIKE stbe_t.stbe013, #價內金額
       stbe014 LIKE stbe_t.stbe014, #未結算金額
       stbe015 LIKE stbe_t.stbe015, #已結算金額
       stbe016 LIKE stbe_t.stbe016, #本次結算金額
       stbe017 LIKE stbe_t.stbe017, #結算方式
       stbe018 LIKE stbe_t.stbe018, #結算類型
       stbe019 LIKE stbe_t.stbe019, #所屬品類
       stbe020 LIKE stbe_t.stbe020, #所屬部門
       stbe021 LIKE stbe_t.stbe021, #主帳套帳款金額
       stbe022 LIKE stbe_t.stbe022, #次帳套一帳款金額
       stbe023 LIKE stbe_t.stbe023, #次帳套二帳款金額
       stbe024 LIKE stbe_t.stbe024, #納入結算單否
       stbe025 LIKE stbe_t.stbe025, #票扣否
       stbe026 LIKE stbe_t.stbe026, #數量
       stbe027 LIKE stbe_t.stbe027, #單價
       stbe028 LIKE stbe_t.stbe028, #专柜编号
       stbe029 LIKE stbe_t.stbe029, #no use
       stbe030 LIKE stbe_t.stbe030, #no use
       stbe031 LIKE stbe_t.stbe031, #結算扣率
       stbe032 LIKE stbe_t.stbe032, #備註
       stbe033 LIKE stbe_t.stbe033, #日結成本類型
       stbe034 LIKE stbe_t.stbe034, #銷售金額
       stbe035 LIKE stbe_t.stbe035, #費用歸屬類型
       stbe036 LIKE stbe_t.stbe036, #費用歸屬組織
       stbe037 LIKE stbe_t.stbe037, #應收結算金額
       stbe038 LIKE stbe_t.stbe038, #帳套二應收結算金額
       stbe039 LIKE stbe_t.stbe039, #帳套三應收結算金額
       stbe040 LIKE stbe_t.stbe040  #收入立帳否
       END RECORD

#161111-00028#5--modify---end----------
DEFINE l_stan030     LIKE stan_t.stan030
DEFINE l_where       STRING  #By shi 20150709
   LET r_success=TRUE
   #mark by geza 20150630(S)
#   LET g_sql = "SELECT * FROM stbc_t",
#                  " WHERE stbcent='",g_enterprise,"'",
#                  "   AND stbc001='",g_stbd_m.stbdsite,"'",
#                  "   AND stbc008='",g_stbd_m.stbd002,"'",
#                  "   AND stbc009='",g_stbd_m.stbd003,"'",
#                  "   AND (stbcstus='1' OR stbcstus='3')",
#                  "   AND stbc002<='",g_stbd_m.stbd006,"'",
#                  "   AND stbc030 ='",g_stbd_m.stbd001,"'",        #add by geza 20150608
##                  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3')",
#                  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8'  OR stbc003 = '9' OR stbc003 = '10' )",  #add by geza 20150610  
#                  "   ORDER BY stbc003 ASC,stbc015 DESC"
   #mark by geza 20150630(E)
   #add by geza 20150630(S)
   #By shi 20150709
   LET l_where = " stbcsite IN (SELECT ooed004 FROM ooed_t ",
                 "               START WITH ooed005='",g_stbd_m.stbdsite,"' AND ooed001='12' AND ooed006<=to_date('",g_today,"','yy/mm/dd') AND (ooed007>=to_date('",g_today,"','yy/mm/dd') OR ooed007 IS NULL) ",
                 "             CONNECT BY  nocycle PRIOR ooed004=ooed005 AND ooed001='12' AND ooed006<=to_date('",g_today,"','yy/mm/dd') AND (ooed007>=to_date('",g_today,"','yy/mm/dd') OR ooed007 IS NULL) ",
                 "               UNION SELECT ooed004 FROM ooed_t WHERE ooed004='",g_stbd_m.stbdsite,"' AND ooedent = ",g_enterprise," ) "  #add by geza 20170122 #170122-00004#2
   #By shi 20150709
   #查询旧的合同编号
   INITIALIZE l_stan030 TO NULL
   SELECT stan030 INTO l_stan030
     FROM stan_t  
    WHERE stanent = g_enterprise  
      AND stan001 = g_stbd_m.stbd001 
   IF cl_null(l_stan030) THEN
       #161111-00028#5---modify----begin-----------
       #LET g_sql = "SELECT * FROM stbc_t",
       LET g_sql = "SELECT stbcent,stbcsite,stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc008,",
               "stbc009,stbc010,stbc011,stbc012,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,",
               "stbc020,stbc021,stbc022,stbc023,stbc024,stbc025,stbc026,stbc027,stbc028,stbc029,stbc030,",
               "stbc031,stbc032,stbcstus,stbc033,stbc034,stbc035,stbc036,stbc037,stbc038,",
               "stbc039,stbc040,stbc041,stbc042,stbc043,stbc044,stbc045,stbc046,stbc047,",
               "stbc048,stbc049,stbc050,stbc051,stbc052,stbc053,stbc054,stbc055,stbc056,",
               "stbc057,stbc058,stbc059,stbc060,stbc061,stbc062,stbc063,stbc064 FROM stbc_t",
       #161111-00028#5---modify----end-------------
                  " WHERE stbcent='",g_enterprise,"'",
                 # "   AND stbc001='",g_stbd_m.stbdsite,"'",      #By shi 20150709
#                  "   AND stbc001='",g_stbd_m.stbdunit,"'",       #By shi 20150709
                  "   AND ",l_where,                              #By shi 20150709      
                  "   AND stbc008='",g_stbd_m.stbd002,"'",
                  "   AND stbc009='",g_stbd_m.stbd003,"'",
                  "   AND (stbcstus='1' OR stbcstus='3')",
                  "   AND stbc002<=to_date('",g_stbd_m.stbd006,"','yy/mm/dd')",
                  "   AND stbc030 ='",g_stbd_m.stbd001,"'",        #add by geza 20150608
#                  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3')",
                  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8'  OR stbc003 = '9' OR stbc003 = '10' )",  #add by geza 20150610  
                  "   ORDER BY stbc003 ASC,stbc015 DESC"
   ELSE
       #161111-00028#5---modify----begin-----------
       #LET g_sql = "SELECT * FROM stbc_t",
       LET g_sql = "SELECT stbcent,stbcsite,stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc008,",
               "stbc009,stbc010,stbc011,stbc012,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,",
               "stbc020,stbc021,stbc022,stbc023,stbc024,stbc025,stbc026,stbc027,stbc028,stbc029,stbc030,",
               "stbc031,stbc032,stbcstus,stbc033,stbc034,stbc035,stbc036,stbc037,stbc038,",
               "stbc039,stbc040,stbc041,stbc042,stbc043,stbc044,stbc045,stbc046,stbc047,",
               "stbc048,stbc049,stbc050,stbc051,stbc052,stbc053,stbc054,stbc055,stbc056,",
               "stbc057,stbc058,stbc059,stbc060,stbc061,stbc062,stbc063,stbc064 FROM stbc_t",
       #161111-00028#5---modify----end-------------
       
                  " WHERE stbcent='",g_enterprise,"'",
                  #"   AND stbc001='",g_stbd_m.stbdsite,"'",      #By shi 20150709
                  "   AND stbc001='",g_stbd_m.stbdunit,"'",       #By shi 20150709 结算中心
                  "   AND ",l_where,                              #By shi 20150709 结算门店
                  "   AND stbc008='",g_stbd_m.stbd002,"'",
                  "   AND stbc009='",g_stbd_m.stbd003,"'",
                  "   AND (stbcstus='1' OR stbcstus='3')",
                  "   AND stbc002<=to_date('",g_stbd_m.stbd006,"','yy/mm/dd')",
                  "   AND (stbc030 ='",g_stbd_m.stbd001,"' OR stbc030 = '",l_stan030,"')",                       #add by geza 20150608
                  "   AND (stbc003='1' OR stbc003='2' OR stbc003='3' OR stbc003 = '8'  OR stbc003 = '9' OR stbc003 = '10' )",  #add by geza 20150610  
                  "   ORDER BY stbc003 ASC,stbc015 DESC"   
   END IF
   #add by geza 20150630(E)
   PREPARE astt340_insert_stbc_pb FROM g_sql
   DECLARE astt340_insert_stbe_cur CURSOR FOR astt340_insert_stbc_pb
       

   INITIALIZE l_stbc.* TO NULL
   
   FOREACH astt340_insert_stbe_cur INTO l_stbc.*
     # IF l_stbc.stbc003='3' AND (l_stbc.stbc015<>'1' AND l_stbc.stbc015<>'2') THEN #mark by geza 20160609
     IF l_stbc.stbc003='3' AND (l_stbc.stbc037 <>'Y' ) THEN #add by geza 20160609
         INITIALIZE l_stbc.* TO NULL
         CONTINUE FOREACH
      END IF      
      INITIALIZE l_stbe.* TO NULL
      LET l_stbe.stbeent=g_enterprise
      LET l_stbe.stbesite=l_stbc.stbcsite
      #LET l_stbe.stbecomp=''              #150514-00018#1--mark by dongsz
      #150514-00018#1--add by dongsz--str---
      SELECT ooef017 INTO l_stbe.stbecomp
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_stbd_m.stbdsite
      #150514-00018#1--add by dongsz--end---
      LET l_stbe.stbedocno=g_stbd_m.stbddocno
            
      SELECT MAX(stbeseq)+1 INTO l_stbe.stbeseq
        FROM stbe_t
       WHERE stbeent=g_enterprise
         AND stbedocno=g_stbd_m.stbddocno
      IF cl_null(l_stbe.stbeseq) THEN
         LET l_stbe.stbeseq=1
      END IF               

      LET l_stbe.stbe001=l_stbc.stbc003
      LET l_stbe.stbe002=l_stbc.stbc004
      LET l_stbe.stbe003=l_stbc.stbc005
      LET l_stbe.stbe004=l_stbc.stbc002
      LET l_stbe.stbe005=l_stbc.stbc012
      #LET l_stbe.stbe006=g_stbd_m.stbd005   #mark by geza 20150825
      #LET l_stbe.stbe007=g_stbd_m.stbd006   #mark by geza 20150825
      #生成结算单的时候，结算单的单身日期区间自动带底稿的值   #add by geza 20150825(S)
      LET l_stbe.stbe006=l_stbc.stbc045  
      LET l_stbe.stbe007=l_stbc.stbc046     
      #add by geza 20150825(E)      
      LET l_stbe.stbe008=l_stbc.stbc013
      LET l_stbe.stbe009=l_stbc.stbc014
      LET l_stbe.stbe010=l_stbc.stbc015
      LET l_stbe.stbe011=l_stbc.stbc016
      LET l_stbe.stbe012=l_stbc.stbc017
      LET l_stbe.stbe013=l_stbc.stbc018
      LET l_stbe.stbe014=l_stbc.stbc019
      LET l_stbe.stbe015=l_stbc.stbc020
      LET l_stbe.stbe016=l_stbc.stbc019
      LET l_stbe.stbe017=l_stbc.stbc010
      LET l_stbe.stbe018=l_stbc.stbc011
      LET l_stbe.stbe019=l_stbc.stbc025
      LET l_stbe.stbe020=l_stbc.stbc026
      LET l_stbe.stbe021='0'   #add  by geza 20150604
      LET l_stbe.stbe022='0'   #add  by geza 20150604  
      LET l_stbe.stbe023='0'   #add  by geza 20150604
      LET l_stbe.stbe028=l_stbc.stbc033   #add  by geza 20150604
      #本次結算數量=底稿中的數量-已立帳數量，單價=底稿中單價---huangrh add 20150604---
      #LET l_stbe.stbe026=l_stbc.stbc034-l_stbc.stbc035   #mark by geza 20150906
      #LET l_stbe.stbe026=1                                #add by geza 20150906 #mark by geza 20150915
      #本次結算數量=底稿中的數量-已结算數量
      LET l_stbe.stbe026=l_stbc.stbc034-l_stbc.stbc057   #add by geza 20150915
      LET l_stbe.stbe027=l_stbc.stbc036
      #本次結算單納入結算單否，票扣否---geza add 20150609---
      LET l_stbe.stbe024=l_stbc.stbc037
      LET l_stbe.stbe025=l_stbc.stbc038
      LET l_stbe.stbe031=l_stbc.stbc039  #结算扣率---geza add 20150706---
      #161111-00028#5---modify--begin---
     #INSERT INTO stbe_t VALUES (l_stbe.*)  
      INSERT INTO stbe_t (stbeent,stbesite,stbecomp,stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe005,stbe006,
                          stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe017,
                          stbe018,stbe019,stbe020,stbe021,stbe022,stbe023,stbe024,stbe025,stbe026,stbe027,stbe028,
                          stbe029,stbe030,stbe031,stbe032,stbe033,stbe034,stbe035,stbe036,stbe037,stbe038,stbe039,stbe040)
        VALUES (l_stbe.stbeent,l_stbe.stbesite,l_stbe.stbecomp,l_stbe.stbedocno,l_stbe.stbeseq,l_stbe.stbe001,l_stbe.stbe002,l_stbe.stbe003,l_stbe.stbe004,l_stbe.stbe005,l_stbe.stbe006,
                l_stbe.stbe007,l_stbe.stbe008,l_stbe.stbe009,l_stbe.stbe010,l_stbe.stbe011,l_stbe.stbe012,l_stbe.stbe013,l_stbe.stbe014,l_stbe.stbe015,l_stbe.stbe016,l_stbe.stbe017,
                l_stbe.stbe018,l_stbe.stbe019,l_stbe.stbe020,l_stbe.stbe021,l_stbe.stbe022,l_stbe.stbe023,l_stbe.stbe024,l_stbe.stbe025,l_stbe.stbe026,l_stbe.stbe027,l_stbe.stbe028,
                l_stbe.stbe029,l_stbe.stbe030,l_stbe.stbe031,l_stbe.stbe032,l_stbe.stbe033,l_stbe.stbe034,l_stbe.stbe035,l_stbe.stbe036,l_stbe.stbe037,l_stbe.stbe038,l_stbe.stbe039,l_stbe.stbe040)  
      #161111-00028#5---modify--end---       
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "into stbe_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF
       
       UPDATE stbc_t SET stbcstus='2'
        WHERE stbcent=g_enterprise
          AND stbc001=l_stbc.stbc001
          AND stbc004=l_stbc.stbc004
          AND stbc005=l_stbc.stbc005   
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "update stbc_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF       
       


   END FOREACH
   
   FREE astt340_insert_stbc_pb

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 刪除更新結算底稿
# Memo...........:
# Usage..........: CALL astt340_delete_updstbc()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20130416 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt340_delete_updstbc()
DEFINE r_success     LIKE type_t.num5
DEFINE l_stbe002     LIKE stbe_t.stbe002
DEFINE l_stbe003     LIKE stbe_t.stbe003
DEFINE l_stbc018     LIKE stbc_t.stbc018
DEFINE l_stbc019     LIKE stbc_t.stbc019
DEFINE l_stbcstus    LIKE stbc_t.stbcstus


   LET r_success=TRUE
  

   LET g_sql = "SELECT stbe_t.stbe002,stbe_t.stbe003 FROM stbd_t,stbe_t",
               " WHERE stbdent=stbeent",
               "   AND stbddocno=stbedocno",
               "   AND stbdent='",g_enterprise,"'",
               "   AND stbddocno='",g_stbd_m.stbddocno,"'"
      
   PREPARE astt340_update_stbc_pb FROM g_sql
   DECLARE astt340_update_stbe_cur CURSOR FOR astt340_update_stbc_pb
       

   LET l_stbe002=''
   LET l_stbe003=''
   
   FOREACH astt340_update_stbe_cur INTO l_stbe002,l_stbe003

      LET l_stbc018=''
      LET l_stbc019=''
      LET l_stbcstus=''
      SELECT stbc018,stbc019,l_stbcstus INTO l_stbc018,l_stbc019,l_stbcstus
        FROM stbc_t
       WHERE stbcent=g_enterprise
         #AND stbc001=g_stbd_m.stbdsite     #smark by geza 20151119
         AND stbc004=l_stbe002
         AND stbc005=l_stbe003
       
       IF cl_null(l_stbc018) THEN
          LET l_stbc018=0
       END IF          

       IF cl_null(l_stbc019) THEN
          LET l_stbc019=0
       END IF  
       
       IF l_stbc018=l_stbc019 THEN
          LET l_stbcstus='1'
       END IF
       
       IF 0<l_stbc019 AND l_stbc019<l_stbc018 THEN
          LET l_stbcstus='3'
       END IF
       
       UPDATE stbc_t SET stbcstus=l_stbcstus
        WHERE stbcent=g_enterprise
          #AND stbc001=g_stbd_m.stbdsite  #By shi 20150709 Mark
          AND stbc004=l_stbe002
          AND stbc005=l_stbe003  
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "update stbc_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF       
       


   END FOREACH
   
   FREE astt340_update_stbc_pb

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt340_stbd002_other()
#                 
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/02/11 By huangtao
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd002_other()
DEFINE l_count   LIKE type_t.num5
DEFINE l_stbd005 LIKE stbd_t.stbd005
DEFINE l_stan009 LIKE stan_t.stan009
DEFINE l_staa006 LIKE staa_t.staa006
DEFINE l_cnt     LIKE type_t.num10
DEFINE l_success      LIKE type_t.num5           #add by geza 20151118
DEFINE r_stau004      LIKE stau_t.stau004        #add by geza 20151118
DEFINE r_period       LIKE type_t.num5           #add by geza 20151118  
DEFINE r_period2      LIKE type_t.num5           #add by geza 20151118  
   LET l_count=0
 # SELECT count(*) INTO l_count
 #   FROM stan_t
 #  WHERE stanent=g_enterprise
 #    AND stan005=g_stbd_m.stbd002
 #    AND stanstus='Y'
 #    AND stan017<=g_today
 #    AND stan018>g_today
 #    
 # #若多筆合約，任意取一筆   
 # IF NOT cl_null(l_count) AND l_count>0 THEN   
 #    SELECT stan002 INTO g_stbd_m.stbd003
 #      FROM stan_t
 #     WHERE stanent=g_enterprise
 #       AND stan005=g_stbd_m.stbd002
 #       AND stanstus='Y'
 #       AND stan017<=g_today
 #       AND stan018>=g_today 
 #       AND rownum =1         
 # END IF

 
    SELECT stan001,stan002,stan029,stan015,stan037 INTO g_stbd_m.stbd001,g_stbd_m.stbd003,g_stbd_m.stbd041,g_stbd_m.stbdunit,g_stbd_m.stbd042       #20150810 By geza Add stbd041,stbdunit  20151118 add stbd042
      FROM stan_t LEFT OUTER JOIN stax_t ON stanent = staxent AND stan001 = stax001 AND stax005 = 'N' 
     WHERE stanent=g_enterprise
       AND stan005=g_stbd_m.stbd002
       AND stanstus='Y' 
       AND stan017<=g_today
       AND stan018>=g_today AND rownum =1  
       
    DISPLAY BY NAME g_stbd_m.stbd041,g_stbd_m.stbdunit     #20150810 By geza Add stbd041,stbdunit 
   
    SELECT MIN(staxseq) INTO g_stbd_m.stbd004
     FROM stax_t
    WHERE staxent=g_enterprise
      AND stax001=g_stbd_m.stbd001
      AND stax005='N'
      AND stax007 = g_stbd_m.stbd048 #add by geza 20151120
      
   SELECT stax002,stax003,stax004 INTO g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
     FROM stax_t
    WHERE staxent=g_enterprise
      AND stax001=g_stbd_m.stbd001
      AND stax005='N'
      AND staxseq=g_stbd_m.stbd004
      AND stax007 = g_stbd_m.stbd048 #add by geza 20151120
      
   #add by geza 20151118(S)   
   #抓取财务会计年度财务会计期别
   CALL s_asti206_get_period(g_stbd_m.stax004,g_stbd_m.stax004,g_stbd_m.stbdunit,'astt340')
   RETURNING l_success,r_stau004,r_period,r_period2
   
   LET g_stbd_m.stbd043= r_period   #财务会计年度
   LET g_stbd_m.stbd044= r_period2  #财务会计期别
   #add by geza 20151118(E)

   #现结的结算单日期给当前日期  #add by geza   20150712(S)
   SELECT stan009  INTO l_stan009
     FROM stan_t
    WHERE stanent = g_enterprise
      AND stan001 = g_stbd_m.stbd001 
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM staa_t
    WHERE staaent = g_enterprise
      AND staa001 = l_stan009
      AND staa002 = 0
      AND staa003 = 1  
   IF l_cnt > 0 THEN    
      LET g_stbd_m.stbd005 = g_today    #20150709 By shi
      LET g_stbd_m.stbd006 = g_today    #20150709 By shi   
   END IF
   #查出预付款加天     #add by geza    #150616-00035#5 (S)
   SELECT stan009 INTO l_stan009 
     FROM stan_t
    WHERE stanent = g_enterprise
      AND stan001 = g_stbd_m.stbd001
   
   SELECT staa006 INTO l_staa006 
     FROM staa_t
    WHERE staaent = g_enterprise    
      AND staa001 = l_stan009
   
   IF cl_null(l_staa006) THEN
      LET l_staa006= '0'
   END IF
   
   #LET g_stbd_m.stbd038 =  g_stbd_m.stax004 + l_staa006  #20150709 By shi 
   LET g_stbd_m.stbd038 =  g_stbd_m.stbd006 + l_staa006  #20150709 By shi
   
   DISPLAY BY NAME g_stbd_m.stbd042  #add by geza 20151118   
   DISPLAY BY NAME g_stbd_m.stbd038
   #add by geza    #150616-00035#5 (E)   
   DISPLAY BY NAME g_stbd_m.stbd003,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd001,g_stbd_m.stbd004,g_stbd_m.stax004
   
   #add by geza 20151019(S)
   #带出付款供应商
   #付款供应商(stbd046)依供應商編號抓取pmac_t 且 交易類型 = 1.收/付款對象 且 勾主要
   LET g_stbd_m.stbd046 = ''
   LET g_stbd_m.stbd046_desc = ''
   CALL s_adb_get_pmac002(g_stbd_m.stbd002,'1','') RETURNING g_stbd_m.stbd046
   
   
   #帳款供應商
   CALL s_desc_get_trading_partner_abbr_desc(g_stbd_m.stbd046) RETURNING g_stbd_m.stbd046_desc
   DISPLAY BY NAME g_stbd_m.stbd046
   DISPLAY BY NAME g_stbd_m.stbd046_desc
   #add by geza 20151019(E)
   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: astt340_stbd002_ref()
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/02/11 By huangtao
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbd002_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: astt340_stbd002_chk(p_cmd)
#                  RETURNING r_success
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/02/11 By huangtao
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd002_chk(p_cmd)
DEFINE l_count  LIKE type_t.num5
DEFINE p_cmd    LIKE type_t.chr1
DEFINE r_success   LIKE type_t.num5           #150501-00002#2--add by dongsz
DEFINE l_stbd000   LIKE stbd_t.stbd000       #add by geza 20150605
DEFINE l_stbd001   LIKE stbd_t.stbd001       #add by geza 20150605
DEFINE l_stan005   LIKE stan_t.stan005       #add by geza 20150605
    INITIALIZE g_chkparam.* TO NULL
      #設定g_chkparam.*的參數
    LET g_chkparam.arg1 = g_stbd_m.stbd002
    IF NOT cl_chk_exist("v_pmaa001_1") THEN
       RETURN FALSE
    END IF
   INITIALIZE l_stbd000 TO NULL
   IF g_type = '1' THEN
      LET l_stbd000 = '1'
   ELSE
      LET l_stbd000 = '2'
   END IF    
   LET l_count=0
   IF p_cmd = 'a' THEN
#      SELECT COUNT(*) INTO l_count FROM stbd_t   #By shi Mark 20150709
#       WHERE stbdent=g_enterprise AND stbd002=g_stbd_m.stbd002 AND stbdstus='N' AND stbd000 = l_stbd000 
   ELSE
      SELECT COUNT(*) INTO l_count FROM stbd_t
       WHERE stbdent=g_enterprise AND stbd002=g_stbd_m.stbd002 AND stbdstus='N' AND stbddocno <> g_stbd_m.stbddocno AND stbd000 = l_stbd000 
   END IF   
   IF NOT cl_null(l_count) AND l_count>0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "ast-00039"
      LET g_errparam.extend = g_stbd_m.stbd002
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF
   # mark by geza 20150605(S)
#   IF cl_null(g_stbd_m.stbd001) THEN      
#      SELECT stan001 INTO g_stbd_m.stbd001
#        FROM stan_t LEFT OUTER JOIN stax_t ON stanent = staxent AND stan001 = stax001 
#       WHERE stanent=g_enterprise
#         AND stan005=g_stbd_m.stbd002
#         AND stanstus='Y' AND stax005 = 'N'
#         AND stan017<=g_today
#         AND stan018>=g_today AND rownum =1
#       IF cl_null(g_stbd_m.stbd001) THEN     
#          INITIALIZE g_errparam TO NULL
#          LET g_errparam.code = "ast-00219"
#          LET g_errparam.extend =''
#          LET g_errparam.popup = TRUE
#          CALL cl_err()
#          RETURN FALSE 
#       END IF 
#    END IF
    # mark by geza 20150605(E)
    # add by geza 20150605(S)
    INITIALIZE l_stbd001 TO NULL
    IF g_type = '1' THEN
       SELECT stan001 INTO l_stbd001
         FROM stan_t LEFT OUTER JOIN stax_t ON stanent = staxent AND stan001 = stax001 
        WHERE stanent=g_enterprise
          AND stan005=g_stbd_m.stbd002
          AND stanstus='Y' AND stax005 = 'N'
#          AND stan017<=g_today   #By shi 20150709
#          AND stan018>=g_today   #By shi 20150709 
          AND rownum =1
       IF cl_null(l_stbd001) THEN     
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = "ast-00219"
          LET g_errparam.extend =''
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN FALSE 
       END IF 
    ELSE
       SELECT stfa001 INTO l_stbd001
         FROM stfa_t LEFT OUTER JOIN stfj_t ON stfaent = stfjent AND stfa001 = stfj001 
        WHERE stfaent=g_enterprise
          AND stfa010=g_stbd_m.stbd002
          AND stfastus='Y' AND stfj005 = 'N'
          AND stfa019<=g_today
          AND stfa020>=g_today AND rownum =1
       IF cl_null(l_stbd001) THEN     
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = "ast-00219"
          LET g_errparam.extend =''
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN FALSE 
       END IF 
    END IF
    IF g_type = '1' THEN
       IF NOT cl_null(g_stbd_m.stbd001) THEN
          SELECT stan005 INTO l_stan005
            FROM stan_t
           WHERE stanent = g_enterprise    
             AND stan001 = g_stbd_m.stbd001
          IF l_stan005 != g_stbd_m.stbd002 THEN          
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = "ast-00316"
             LET g_errparam.extend =''
             LET g_errparam.popup = TRUE
             CALL cl_err()
             RETURN FALSE 
          END IF  
       END IF
    ELSE
      IF NOT cl_null(g_stbd_m.stbd001) THEN
          SELECT stfa010 INTO l_stan005
            FROM stfa_t
           WHERE stfaent = g_enterprise    
             AND stfa001 = g_stbd_m.stbd001
          IF l_stan005 != g_stbd_m.stbd002 THEN          
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = "ast-00316"
             LET g_errparam.extend =''
             LET g_errparam.popup = TRUE
             CALL cl_err()
             RETURN FALSE 
          END IF  
       END IF
    END IF
#    LET g_stbd_m.stbd001 = l_stbd001
    # add by geza 20150605(E)
     #150501-00002#2--add by dongsz--str---
     #检查供应商生命周期有效性
     #CALL s_life_cycle_chk(g_prog,g_stbd_m.stbdsite,'2',g_stbd_m.stbd002) RETURNING r_success   #150616-00035#78-mark by dongsz
     CALL s_life_cycle_chk(g_prog,g_stbd_m.stbdsite,'2',g_stbd_m.stbd002,'','') RETURNING r_success   #150616-00035#78-add by dongsz
     IF NOT r_success THEN
        RETURN FALSE
     END IF
     #150501-00002#2--add by dongsz--end---
            
   RETURN TRUE
   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_summary()
DEFINE  l_stbd012      LIKE stbd_t.stbd012
DEFINE  l_stbd012_1    LIKE stbd_t.stbd012
DEFINE  l_ooef019      LIKE ooef_t.ooef019

   #上期結存金額   
   SELECT SUM(stbe014) INTO g_stbd_m.stbd007
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND NOT (stbe001='3' AND stbe010='2')
      AND stbe004<g_stbd_m.stbd005
   IF cl_null(g_stbd_m.stbd007) THEN 
      LET g_stbd_m.stbd007=0
   END IF 
   #本期銷貨成本
   IF cl_null(g_stbd_m.stbd008) THEN 
      LET g_stbd_m.stbd008=0
   END IF             
   
   #本期進貨金額            
   SELECT SUM(stbe013) INTO g_stbd_m.stbd009
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND stbe001='1'
      AND stbe004>=g_stbd_m.stbd005
      AND stbe004<=g_stbd_m.stbd006
   IF cl_null(g_stbd_m.stbd009) THEN 
      LET g_stbd_m.stbd009=0
   END IF                  
   #本期退貨金額            
   SELECT SUM(stbe013) INTO g_stbd_m.stbd010
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND stbe001='2'
      #AND (stbe001<>'3' OR stbe010<>'1')
      AND stbe004>=g_stbd_m.stbd005
      AND stbe004<=g_stbd_m.stbd006
   IF cl_null(g_stbd_m.stbd010) THEN 
      LET g_stbd_m.stbd010=0
   END IF   
   #本期折讓金額             
#   SELECT SUM(stbe013) INTO g_stbd_m.stbd011   #mark by geza  20150602
   SELECT SUM(stbe013*stbe011) INTO g_stbd_m.stbd011 #add by geza  20150602
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND NOT (stbe001='3' AND stbe010 = '1')
      AND stbe004>=g_stbd_m.stbd005
      AND stbe004<=g_stbd_m.stbd006               
   IF cl_null(g_stbd_m.stbd011) THEN 
      LET g_stbd_m.stbd011=0
   END IF
            
   #稅額合計
   SELECT SUM(stbe013-stbe012) INTO l_stbd012
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND NOT (stbe001 = '3' OR stbe010 = '1')
      AND stbe004>=g_stbd_m.stbd005
      AND stbe004<=g_stbd_m.stbd006 
      
   IF cl_null(l_stbd012) THEN 
      LET l_stbd012=0
   END IF 
   
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent=g_enterprise
      AND ooef001=g_stbd_m.stbdsite
      
   SELECT SUM((stbe014-stbe014/(1+oodb006/100))) INTO l_stbd012_1
     FROM stbu_t,oodb_t
    WHERE stbuent = g_enterprise
      AND stbuent=oodbent
      AND oodb001 = l_ooef019
      AND oodb002 = stbe009
      AND stbedocno=g_stbd_m.stbddocno
      AND stbe004<g_stbd_m.stbd005
      AND NOT (stbe001='3' AND stbe010='2')
   IF cl_null(l_stbd012_1) THEN 
      LET l_stbd012_1=0
   END IF
   
   LET g_stbd_m.stbd012 =  l_stbd012 + l_stbd012_1 
      
   
   #價稅合計
   LET g_stbd_m.stbd013=g_stbd_m.stbd007+g_stbd_m.stbd009-g_stbd_m.stbd010-g_stbd_m.stbd011
   IF cl_null(g_stbd_m.stbd013) THEN 
      LET g_stbd_m.stbd013=0
   END IF 
   
   #本期預付金額
   IF cl_null(g_stbd_m.stbd014) THEN 
      LET g_stbd_m.stbd014=0
   END IF            
   
   #本期價外扣款           
#   SELECT SUM(stbe014) INTO g_stbd_m.stbd015  #mark by geza  20150602
    SELECT SUM(stbe014*stbe011) INTO g_stbd_m.stbd015  #add by geza  20150602
     FROM stbe_t
    WHERE stbeent=g_enterprise
      AND stbedocno=g_stbd_m.stbddocno
      AND stbe001='3' AND stbe010 = '1'
      AND stbe004>=g_stbd_m.stbd005
      AND stbe004<=g_stbd_m.stbd006                
   IF cl_null(g_stbd_m.stbd015) THEN 
      LET g_stbd_m.stbd015=0
   END IF  
   

   
   #應結算金額
   IF g_stbd_m.stbd016='Y' THEN           
      LET g_stbd_m.stbd017=g_stbd_m.stbd013-g_stbd_m.stbd014
   ELSE
      LET g_stbd_m.stbd017=g_stbd_m.stbd013-g_stbd_m.stbd014-g_stbd_m.stbd015
   END IF
   IF cl_null(g_stbd_m.stbd017) THEN 
      LET g_stbd_m.stbd017=0
   END IF            
   
   #實際結算金額
   IF g_stbd_m.stbd016='N' THEN            
      SELECT SUM(stbe016) INTO g_stbd_m.stbd018
        FROM stbe_t
       WHERE stbeent=g_enterprise
         AND stbedocno=g_stbd_m.stbddocno
   ELSE
      SELECT SUM(stbe016) INTO g_stbd_m.stbd018
        FROM stbe_t
       WHERE stbeent=g_enterprise
         AND stbedocno=g_stbd_m.stbddocno
         AND (stbe001='1' OR stbe001='2' OR stbe001='3') 
         AND (stbe001<>'3' OR stbe010<>'1')
   END IF
   IF cl_null(g_stbd_m.stbd018) THEN 
      LET g_stbd_m.stbd018=0
   END IF   

   #本期結存金額
   LET g_stbd_m.stbd019=g_stbd_m.stbd017-g_stbd_m.stbd018
   IF cl_null(g_stbd_m.stbd019) THEN 
      LET g_stbd_m.stbd019=0
   END IF  

   UPDATE stbd_t SET stbd007=g_stbd_m.stbd007,
                     stbd008=g_stbd_m.stbd008,
                     stbd009=g_stbd_m.stbd009,
                     stbd010=g_stbd_m.stbd010,
                     stbd011=g_stbd_m.stbd011,
                     stbd012=g_stbd_m.stbd012,
                     stbd013=g_stbd_m.stbd013,
                     stbd014=g_stbd_m.stbd014,
                     stbd015=g_stbd_m.stbd015,
                     stbd016=g_stbd_m.stbd016,
                     stbd017=g_stbd_m.stbd017,
                     stbd018=g_stbd_m.stbd018,
                     stbd019=g_stbd_m.stbd019 
    WHERE stbdent=g_enterprise
      AND stbddocno=g_stbd_m.stbddocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "update stbd_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF

   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd_show()
  
   SELECT stbd007,stbd008,stbd009,stbd010,stbd011,stbd012,stbd013,stbd014,stbd015,stbd017,stbd018,stbd019
     INTO g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010,
          g_stbd_m.stbd011,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014,
          g_stbd_m.stbd015,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019 
     FROM stbd_t WHERE stbdent = g_enterprise AND stbddocno = g_stbd_m.stbddocno
   
   DISPLAY BY NAME g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009,g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd012,
                      g_stbd_m.stbd013,g_stbd_m.stbd014,g_stbd_m.stbd015,g_stbd_m.stbd017,g_stbd_m.stbd018,
                      g_stbd_m.stbd019
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd001_other()
DEFINE l_stcw004        LIKE stcw_t.stcw004  
DEFINE l_stan009        LIKE stan_t.stan009
DEFINE l_staa006        LIKE staa_t.staa006
DEFINE l_cnt            LIKE type_t.num10
DEFINE l_success      LIKE type_t.num5           #add by geza 20151118
DEFINE r_stau004      LIKE stau_t.stau004        #add by geza 20151118
DEFINE r_period       LIKE type_t.num5           #add by geza 20151118  
DEFINE r_period2      LIKE type_t.num5           #add by geza 20151118  
   SELECT stan005,stan002,stan015,stan029,stan037 INTO                                     #20150709 By shi Add unit #20150709 By geza Add stan029 #20151118 By geza Add stan037
          g_stbd_m.stbd002,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd041,g_stbd_m.stbd042     #20150709 By shi Add unit #20150709 By geza Add stbd041 #20151118 By geza Add stbd042 
     FROM stan_t
    WHERE stanent=g_enterprise
      AND stan001=g_stbd_m.stbd001

   DISPLAY BY NAME g_stbd_m.stbd002,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd041 #20150709 By shi Add unit #20150709 By geza Add stbd041

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbd002_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbdunit
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbdunit_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbdunit_desc
   
   SELECT MIN(staxseq) INTO g_stbd_m.stbd004
     FROM stax_t
    WHERE staxent=g_enterprise
      AND stax001=g_stbd_m.stbd001
      AND stax005='N'
      AND stax007 = g_stbd_m.stbd048 #add by geza 20151120
      
   SELECT stax002,stax003,stax004 INTO g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
     FROM stax_t
    WHERE staxent=g_enterprise
      AND stax001=g_stbd_m.stbd001
      AND stax005='N'
      AND staxseq=g_stbd_m.stbd004
      AND stax007 = g_stbd_m.stbd048 #add by geza 20151120
   #add by geza 20151118(S)   
   #抓取财务会计年度财务会计期别
   CALL s_asti206_get_period(g_stbd_m.stax004,g_stbd_m.stax004,g_stbd_m.stbdunit,'astt340')
   RETURNING l_success,r_stau004,r_period,r_period2
   
   LET g_stbd_m.stbd043= r_period   #财务会计年度
   LET g_stbd_m.stbd044= r_period2  #财务会计期别
   #add by geza 20151118(E)
   #现结的结算单日期给当前日期  #add by geza   20150712(S)
   SELECT stan009  INTO l_stan009
     FROM stan_t
    WHERE stanent = g_enterprise
      AND stan001 = g_stbd_m.stbd001 
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM staa_t
    WHERE staaent = g_enterprise
      AND staa001 = l_stan009
      AND staa002 = 0
      AND staa003 = 1 
   IF l_cnt > 0 THEN  
      LET g_stbd_m.stbd005 = g_today    #20150709 By shi
      LET g_stbd_m.stbd006 = g_today    #20150709 By shi    
   END IF
   #查出预付款加天     #add by geza    #150616-00035#5 (S)
#   SELECT stan009 INTO l_stan009 
#     FROM stan_t
#    WHERE stanent = g_enterprise
#      AND stan001 = g_stbd_m.stbd001
   
   SELECT staa006 INTO l_staa006 
     FROM staa_t
    WHERE staaent = g_enterprise    
      AND staa001 = l_stan009
   
   IF cl_null(l_staa006) THEN
      LET l_staa006= '0'
   END IF
   
   #LET g_stbd_m.stbd038 =  g_stbd_m.stax004 + l_staa006  #20150709 By shi
   LET g_stbd_m.stbd038 =  g_stbd_m.stbd006 + l_staa006  #20150709 By shi
   DISPLAY BY NAME g_stbd_m.stbd038
   #add by geza    #150616-00035#5 (E)   
   DISPLAY BY NAME g_stbd_m.stbd042  #add by geza 20151118   
   DISPLAY BY NAME g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
   #add by geza 20151019(S)
   #带出付款供应商
   #付款供应商(stbd046)依供應商編號抓取pmac_t 且 交易類型 = 1.收/付款對象 且 勾主要
   LET g_stbd_m.stbd046 = ''
   LET g_stbd_m.stbd046_desc = ''
   CALL s_adb_get_pmac002(g_stbd_m.stbd002,'1','') RETURNING g_stbd_m.stbd046
   
   
   #帳款供應商
   CALL s_desc_get_trading_partner_abbr_desc(g_stbd_m.stbd046) RETURNING g_stbd_m.stbd046_desc
   DISPLAY BY NAME g_stbd_m.stbd046
   DISPLAY BY NAME g_stbd_m.stbd046_desc
   #add by geza 20151019(E)
   
END FUNCTION

################################################################################
# Descriptions...: 結算單費用明細
# Memo...........:
# Usage..........: CALL astt340_stev_fill()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 20150603 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stev_fill()
DEFINE p_wc2      STRING
DEFINE l_i        LIKE type_t.num5
   
 
   CALL g_stev_d.clear()    #g_stes_d 單頭及單身 
  
   LET g_sql = "SELECT  UNIQUE stevdocno,stevseq,stev001,stev002,stev003,stev004,stev024,'',stev005,'',stev026,stev027,'',stev006,stev007, 
       stev008,'',stev009,'',stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev028,stev029,stev017,stev018, 
       stevsite,stev020,stev019,stev030 FROM stev_t,stet_t,steu_t",   
               " WHERE stetent=? AND stevdocno IN ( SELECT stet002 FROM stet_t,stbd_t 
                 WHERE stetent = stbdent  AND stetdocno = stbddocno AND stbddocno = ? 
               )",
#               "   AND stev001='3' AND stev010='1'" ,  #150204-00001#27 By shi
               "   AND stevent = stetent ",
               "   AND stevdocno = stet002 ",
               "   AND steuent = stevent ",
               "   AND steudocno = stevdocno ",
               "   AND steusite = ? ",
               "   AND steu003 = ? "
                #"   AND stes001='3' AND stes010='2'"   #150204-00001#27 By shi            

   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
   END IF
   
   #子單身的WC
        
   LET g_sql = g_sql, " ORDER BY stev_t.stevdocno,stev_t.stevseq"      
   
   #PREPARE astt540_pb2 FROM g_sql                     #150505-00016#1--mark by dongsz
   #DECLARE b_fill_cs2 CURSOR FOR astt540_pb2          #150505-00016#1--mark by dongsz
   PREPARE astt340_pb4 FROM g_sql                      #150505-00016#1--add by dongsz
   DECLARE b_fill_cs4 CURSOR FOR astt340_pb4           #150505-00016#1--add by dongsz
   
   LET l_i = 1
   
   OPEN b_fill_cs4 USING g_enterprise,g_stbd_m.stbddocno,g_stbd_m.stbdsite,g_stbd_m.stbd002
 
                                            
   #FOREACH b_fill_cs2 INTO g_stes_d_2[l_i].stesseq_1,g_stes_d_2[l_i].stes001_1,g_stes_d_2[l_i].stes002_1,g_stes_d_2[l_i].stes003_1,     #150505-00016#1--mark by dongsz
    FOREACH b_fill_cs4 INTO g_stev_d[l_i].stevdocno,g_stev_d[l_i].stevseq,g_stev_d[l_i].stev001,g_stev_d[l_i].stev002,
       g_stev_d[l_i].stev003,g_stev_d[l_i].stev004,
       g_stev_d[l_i].stev024,g_stev_d[l_i].stev024_desc,g_stev_d[l_i].stev005,g_stev_d[l_i].stev005_desc,
       g_stev_d[l_i].stev026,g_stev_d[l_i].stev027,g_stev_d[l_i].stae003_1, 
       g_stev_d[l_i].stev006,g_stev_d[l_i].stev007,g_stev_d[l_i].stev008,g_stev_d[l_i].stev008_desc, 
       g_stev_d[l_i].stev009,g_stev_d[l_i].stev009_desc,g_stev_d[l_i].stev010,g_stev_d[l_i].stev011, 
       g_stev_d[l_i].stev012,g_stev_d[l_i].stev013,g_stev_d[l_i].stev014,g_stev_d[l_i].stev015, 
       g_stev_d[l_i].stev016,g_stev_d[l_i].stev028,g_stev_d[l_i].stev029,g_stev_d[l_i].stev017,
       g_stev_d[l_i].stev018,g_stev_d[l_i].stevsite,g_stev_d[l_i].stev020,g_stev_d[l_i].stev019,g_stev_d[l_i].stev030
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev024
      CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev024_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev024_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev005
      CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev005_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev005_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev005
      CALL ap_ref_array2(g_ref_fields,"SELECT stae003 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stae003_1 = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stae003_1

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev008
      CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev008_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev008_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] =g_stev_d[l_i].stev009
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev009_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev009_desc


      LET l_i = l_i + 1
      IF l_i > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
    
   CALL g_stev_d.deleteElement(g_stev_d.getLength())

   FREE astt340_pb4         
END FUNCTION

################################################################################
# Descriptions...: 合同带值
# Memo...........:
# Usage..........: CALL astt340_stbd001_other2()
#                  RETURNING 回传参数
# Date & Author..: 20150604 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd001_other2()
DEFINE l_stcw004        LIKE stcw_t.stcw004  
DEFINE l_stfa036 LIKE stfa_t.stfa009
DEFINE l_staa006 LIKE staa_t.staa006

    SELECT stfa003,stfa010,stfa005 INTO 
          g_stbd_m.stbd003,g_stbd_m.stbd002,g_stbd_m.stbd037
     FROM stfa_t
    WHERE stfaent=g_enterprise
      AND stfa001=g_stbd_m.stbd001
   

   DISPLAY BY NAME g_stbd_m.stbd003,g_stbd_m.stbd002,g_stbd_m.stbd037

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbd002_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd037
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd037_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbd037_desc
   

   SELECT MIN(stfjseq) INTO g_stbd_m.stbd004
     FROM stfj_t
    WHERE stfjent=g_enterprise
      AND stfj001=g_stbd_m.stbd001
      AND stfj005='N'
      
   SELECT stfj002,stfj003,stfj004 INTO g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
     FROM stfj_t
    WHERE stfjent=g_enterprise
      AND stfj001=g_stbd_m.stbd001
      AND stfj005='N'
      AND stfjseq=g_stbd_m.stbd004
   
   #查出预付款加天     #add by geza    #150616-00035#5 (S)
   SELECT stfa036 INTO l_stfa036
     FROM stfa_t
    WHERE stfaent = g_enterprise
      AND stfa001 = g_stbd_m.stbd001
   
   SELECT staa006 INTO l_staa006 
     FROM staa_t
    WHERE staaent = g_enterprise    
      AND staa001 = l_stfa036
   IF cl_null(l_staa006) THEN
      LET l_staa006= '0'
   END IF
   LET g_stbd_m.stbd038 =  g_stbd_m.stax004 + l_staa006 
   DISPLAY BY NAME g_stbd_m.stbd038
   #add by geza    #150616-00035#5 (E)
   
   DISPLAY BY NAME g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
END FUNCTION

################################################################################
# Descriptions...: 供应商带值
# Memo...........:
# Usage..........: CALL astt340_stbd002_other2()
#                  RETURNING 回传参数
# Date & Author..: 20150603 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd002_other2()
DEFINE l_count   LIKE type_t.num5
DEFINE l_stfa036 LIKE stfa_t.stfa009
DEFINE l_staa006 LIKE staa_t.staa006

   LET l_count=0

    SELECT stfa001,stfa003,stfa005 INTO g_stbd_m.stbd001,g_stbd_m.stbd003,g_stbd_m.stbd037
      FROM stfa_t LEFT OUTER JOIN stfj_t ON stfaent = stfjent AND stfa001 = stfj001 AND stfj005 = 'N' 
     WHERE stfaent=g_enterprise
       AND stfa010=g_stbd_m.stbd002
       AND stfastus='Y' 
       AND stfa019<=g_today
       AND stfa020>=g_today AND rownum =1  
  
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stbd_m.stbd037
    CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stbd_m.stbd037_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stbd_m.stbd037_desc
   
    SELECT MIN(stfjseq) INTO g_stbd_m.stbd004
     FROM stfj_t
    WHERE stfjent=g_enterprise
      AND stfj001=g_stbd_m.stbd001
      AND stfj005='N'
      
   SELECT stfj002,stfj003,stfj004 INTO g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004
     FROM stfj_t
    WHERE stfjent=g_enterprise
      AND stfj001=g_stbd_m.stbd001
      AND stfj005='N'
      AND stfjseq=g_stbd_m.stbd004
   
   #查出预付款加天     #add by geza    #150616-00035#5 (S)
   SELECT stfa036 INTO l_stfa036
     FROM stfa_t
    WHERE stfaent = g_enterprise
      AND stfa001 = g_stbd_m.stbd001
   
   SELECT staa006 INTO l_staa006 
     FROM staa_t
    WHERE staaent = g_enterprise    
      AND staa001 = l_stfa036
   IF cl_null(l_staa006) THEN
      LET l_staa006= '0'
   END IF
   LET g_stbd_m.stbd038 =  g_stbd_m.stax004 + l_staa006 
   DISPLAY BY NAME g_stbd_m.stbd038
   #add by geza    #150616-00035#5 (E)

   DISPLAY BY NAME g_stbd_m.stbd001,g_stbd_m.stbd003,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stax004,g_stbd_m.stbd004
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd037_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd037
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd037_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbd_m.stbd037_desc
END FUNCTION

################################################################################
# Descriptions...: 合同有效性检查
# Memo...........:
# Usage..........: CALL astt340_stbd001_chk(p_cmd)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20150605 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd001_chk(p_cmd)
DEFINE l_count  LIKE type_t.num5
DEFINE l_cnt  LIKE type_t.num5
DEFINE p_cmd    LIKE type_t.chr1
DEFINE r_success   LIKE type_t.num5           #150501-00002#2--add by dongsz
DEFINE l_stbd000   LIKE stbd_t.stbd000       #add by geza 20150605
DEFINE l_stbd001   LIKE stbd_t.stbd001       #add by geza 20150605
DEFINE l_stan005   LIKE stan_t.stan005       #add by geza 20150605
    INITIALIZE g_chkparam.* TO NULL
      #設定g_chkparam.*的參數
    LET g_chkparam.arg1 = g_stbd_m.stbd002
    IF NOT cl_chk_exist("v_pmaa001_1") THEN
       RETURN FALSE
    END IF
   INITIALIZE l_stbd000 TO NULL
   IF g_type = '1' THEN
      LET l_stbd000 = '1'
   ELSE
      LET l_stbd000 = '2'
   END IF    
   LET l_count=0
   IF p_cmd = 'a' THEN
#      SELECT COUNT(*) INTO l_count FROM stbd_t   #By shi Mark 20150709
#       WHERE stbdent=g_enterprise AND stbd002=g_stbd_m.stbd002 AND stbdstus='N' AND stbd000 = l_stbd000 
   ELSE
      SELECT COUNT(*) INTO l_count FROM stbd_t
       WHERE stbdent=g_enterprise AND stbd002=g_stbd_m.stbd002 AND stbdstus='N' AND stbddocno <> g_stbd_m.stbddocno AND stbd000 = l_stbd000 
   END IF   
   IF NOT cl_null(l_count) AND l_count>0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "ast-00039"
      LET g_errparam.extend = g_stbd_m.stbd002
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF
   # mark by geza 20150605(S)
#   IF cl_null(g_stbd_m.stbd001) THEN      
#      SELECT stan001 INTO g_stbd_m.stbd001
#        FROM stan_t LEFT OUTER JOIN stax_t ON stanent = staxent AND stan001 = stax001 
#       WHERE stanent=g_enterprise
#         AND stan005=g_stbd_m.stbd002
#         AND stanstus='Y' AND stax005 = 'N'
#         AND stan017<=g_today
#         AND stan018>=g_today AND rownum =1
#       IF cl_null(g_stbd_m.stbd001) THEN     
#          INITIALIZE g_errparam TO NULL
#          LET g_errparam.code = "ast-00219"
#          LET g_errparam.extend =''
#          LET g_errparam.popup = TRUE
#          CALL cl_err()
#          RETURN FALSE 
#       END IF 
#    END IF
    # mark by geza 20150605(E)
    # add by geza 20150605(S)
    INITIALIZE l_stbd001 TO NULL
    LET l_cnt = 0
    IF g_type = '1' THEN
       SELECT COUNT(*) INTO l_cnt
         FROM stan_t LEFT OUTER JOIN stax_t ON stanent = staxent AND stan001 = stax001 
        WHERE stanent=g_enterprise
          AND stan005=g_stbd_m.stbd002
          AND stan001=g_stbd_m.stbd001
          AND stanstus='Y' AND stax005 = 'N'
#          AND stan017<=g_today  #20150709 By shi
#          AND stan018>=g_today  #20150709 By shi
       IF l_cnt = 0 THEN     
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = "ast-00219"
          LET g_errparam.extend =''
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN FALSE 
       END IF 
    ELSE
       SELECT COUNT(*) INTO l_cnt
         FROM stfa_t LEFT OUTER JOIN stfj_t ON stfaent = stfjent AND stfa001 = stfj001 
        WHERE stfaent=g_enterprise
          AND stfa010=g_stbd_m.stbd002
          AND stfa001=g_stbd_m.stbd001
          AND stfastus='Y' AND stfj005 = 'N'
          AND stfa019<=g_today    
          AND stfa020>=g_today    
       IF l_cnt = 0 THEN       
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = "ast-00219"
          LET g_errparam.extend =''
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN FALSE 
       END IF 
    END IF
#    LET g_stbd_m.stbd001 = l_stbd001
    # add by geza 20150605(E)
     #150501-00002#2--add by dongsz--str---
     #检查供应商生命周期有效性
     #CALL s_life_cycle_chk(g_prog,g_stbd_m.stbdsite,'2',g_stbd_m.stbd002) RETURNING r_success  #150616-00035#78-mark by dongsz
     CALL s_life_cycle_chk(g_prog,g_stbd_m.stbdsite,'2',g_stbd_m.stbd002,'','') RETURNING r_success  #150616-00035#78-add by dongsz
     IF NOT r_success THEN
        RETURN FALSE
     END IF
     #150501-00002#2--add by dongsz--end---
            
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 专柜编号检查
# Memo...........:
# Usage..........: CALL astt340_stbd037_chk(p_cmd)
#                  RETURNING FALSE
# Date & Author..: 20150608 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbd037_chk(p_cmd)
DEFINE p_cmd    LIKE type_t.chr1
DEFINE l_stfa005   LIKE stfa_t.stfa005
    INITIALIZE l_stfa005 TO NULL
    IF NOT cl_null(g_stbd_m.stbd001) THEN
      SELECT stfa005 INTO l_stfa005
        FROM stfa_t
       WHERE stfaent = g_enterprise    
         AND stfa001 = g_stbd_m.stbd001
      IF l_stfa005 != g_stbd_m.stbd037 THEN          
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "ast-00322"
         LET g_errparam.extend =''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE 
      END IF  
    END IF
    RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 貨款匯總顯示
# Memo...........:
# Usage..........: CALL astt340_stbe3_fill()
#                  RETURNING 回传参数
# Date & Author..: 20150708 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbe3_fill()
DEFINE p_wc2      STRING
DEFINE l_i        LIKE type_t.num5
DEFINE g_sql      STRING   
 
   CALL g_stbe5_d.clear()    #g_stbe_d 單頭及單身 
  
   #LET g_sql = "SELECT  UNIQUE stbe001,stbe002,stbe004,SUM(stbe012),SUM(stbe013),SUM(stbe014),SUM(stbe015),SUM(stbe016) FROM stbe_t",  #amrk by geza 20150906  
   LET g_sql = "SELECT  UNIQUE stbe001,stbe002,stbe004,SUM(stbe011*stbe012),SUM(stbe011*stbe013),SUM(stbe011*stbe014),SUM(stbe011*stbe015),SUM(stbe011*stbe016) FROM stbe_t",   #add by geza 20150906
               " INNER JOIN stbd_t ON stbddocno = stbedocno ",
               " WHERE stbeent=? AND stbedocno=?",
               "   AND stbe001!='3' "   #150616-00035#23 add By geza
              # "   AND stbe001='3' AND stbe010='1'"   #150204-00001#27 By shi
              #"   AND stbe001='3' AND stbe010='2'"   #150204-00001#27 By shi

   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
   END IF
   
   #子單身的WC
        
   LET g_sql = g_sql," GROUP BY stbe001, stbe002, stbe004  ORDER BY stbe001,stbe002,stbe004 "      
   
   #PREPARE astt340_pb2 FROM g_sql                     #150505-00016#1--mark by dongsz
   #DECLARE b_fill_cs2 CURSOR FOR astt340_pb2          #150505-00016#1--mark by dongsz
   PREPARE astt340_pb5 FROM g_sql                      #150505-00016#1--add by dongsz
   DECLARE b_fill_cs5 CURSOR FOR astt340_pb5           #150505-00016#1--add by dongsz
   
   LET l_i = 1
   
   #OPEN b_fill_cs2 USING g_enterprise,g_stbd_m.stbddocno   #150505-00016#1--mark by dongsz
   OPEN b_fill_cs5 USING g_enterprise,g_stbd_m.stbddocno    #150505-00016#1--add by dongsz
 
                                            
   #FOREACH b_fill_cs2 INTO g_stbe_d_2[l_i].stbeseq_1,g_stbe_d_2[l_i].stbe001_1,g_stbe_d_2[l_i].stbe002_1,g_stbe_d_2[l_i].stbe003_1,     #150505-00016#1--mark by dongsz
   FOREACH b_fill_cs5 INTO g_stbe5_d[l_i].stbe001_2,g_stbe5_d[l_i].stbe002_2,g_stbe5_d[l_i].stbe004_2,g_stbe5_d[l_i].stbe012_2,
                           g_stbe5_d[l_i].stbe013_2,g_stbe5_d[l_i].stbe014_2,g_stbe5_d[l_i].stbe015_2,g_stbe5_d[l_i].stbe016_2
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      LET l_i = l_i + 1
      IF l_i > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
    
   CALL g_stbe5_d.deleteElement(g_stbe5_d.getLength())
     
   #FREE astt340_pb2        #150505-00016#1--mark by dongsz
   FREE astt340_pb5         #150505-00016#1--add by dongsz

END FUNCTION

################################################################################
# Descriptions...: 结算单单身明细
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/7/22 By mapengfei 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbc_insert()
DEFINE p_success     LIKE type_t.num5
#161111-00028#5--modify---begin--------
#DEFINE p_stbc RECORD LIKE stbc_t.*
#DEFINE p_stbe RECORD LIKE stbe_t.*
DEFINE p_stbc RECORD  #結算底稿
       stbcent LIKE stbc_t.stbcent, #企業編號
       stbcsite LIKE stbc_t.stbcsite, #營運據點
       stbc001 LIKE stbc_t.stbc001, #結算中心
       stbc002 LIKE stbc_t.stbc002, #單據日期
       stbc003 LIKE stbc_t.stbc003, #單據類別
       stbc004 LIKE stbc_t.stbc004, #單據編號
       stbc005 LIKE stbc_t.stbc005, #項次
       stbc006 LIKE stbc_t.stbc006, #業務結算期
       stbc007 LIKE stbc_t.stbc007, #財務會計年度
       stbc008 LIKE stbc_t.stbc008, #對象編號
       stbc009 LIKE stbc_t.stbc009, #經營方式
       stbc010 LIKE stbc_t.stbc010, #結算方式
       stbc011 LIKE stbc_t.stbc011, #結算類型
       stbc012 LIKE stbc_t.stbc012, #費用編號
       stbc013 LIKE stbc_t.stbc013, #幣別
       stbc014 LIKE stbc_t.stbc014, #稅別
       stbc015 LIKE stbc_t.stbc015, #價款類別
       stbc016 LIKE stbc_t.stbc016, #方向
       stbc017 LIKE stbc_t.stbc017, #價外金額
       stbc018 LIKE stbc_t.stbc018, #價內金額
       stbc019 LIKE stbc_t.stbc019, #未結算金額
       stbc020 LIKE stbc_t.stbc020, #已結算金額
       stbc021 LIKE stbc_t.stbc021, #未校驗金額
       stbc022 LIKE stbc_t.stbc022, #已收款金額
       stbc023 LIKE stbc_t.stbc023, #未立帳金額
       stbc024 LIKE stbc_t.stbc024, #已立帳金額
       stbc025 LIKE stbc_t.stbc025, #所屬品類
       stbc026 LIKE stbc_t.stbc026, #所屬部門
       stbc027 LIKE stbc_t.stbc027, #對象類別
       stbc028 LIKE stbc_t.stbc028, #財務會計期別
       stbc029 LIKE stbc_t.stbc029, #網點編號
       stbc030 LIKE stbc_t.stbc030, #結算合約編號
       stbc031 LIKE stbc_t.stbc031, #承擔對象
       stbc032 LIKE stbc_t.stbc032, #結算對象
       stbcstus LIKE stbc_t.stbcstus, #狀態碼
       stbc033 LIKE stbc_t.stbc033, #专柜编号
       stbc034 LIKE stbc_t.stbc034, #數量
       stbc035 LIKE stbc_t.stbc035, #已立帳數量
       stbc036 LIKE stbc_t.stbc036, #單價
       stbc037 LIKE stbc_t.stbc037, #納入結算單否
       stbc038 LIKE stbc_t.stbc038, #票扣否
       stbc039 LIKE stbc_t.stbc039, #結算扣率
       stbc040 LIKE stbc_t.stbc040, #結算日期
       stbc041 LIKE stbc_t.stbc041, #日結成本類型
       stbc042 LIKE stbc_t.stbc042, #銷售金額
       stbc043 LIKE stbc_t.stbc043, #商品編號
       stbc044 LIKE stbc_t.stbc044, #商品品類
       stbc045 LIKE stbc_t.stbc045, #開始日期
       stbc046 LIKE stbc_t.stbc046, #結束日期
       stbc047 LIKE stbc_t.stbc047, #已立帳金額帳套二
       stbc048 LIKE stbc_t.stbc048, #已立帳金額帳套三
       stbc049 LIKE stbc_t.stbc049, #主帳套暫估金額
       stbc050 LIKE stbc_t.stbc050, #帳套二暫估金額
       stbc051 LIKE stbc_t.stbc051, #帳套三暫估金額
       stbc052 LIKE stbc_t.stbc052, #已立帳數量帳套二
       stbc053 LIKE stbc_t.stbc053, #已立帳數量帳套三
       stbc054 LIKE stbc_t.stbc054, #主帳套暫估數量
       stbc055 LIKE stbc_t.stbc055, #帳套二暫估數量
       stbc056 LIKE stbc_t.stbc056, #帳套三暫估數量
       stbc057 LIKE stbc_t.stbc057, #已結算數量
       stbc058 LIKE stbc_t.stbc058, #含發票否
       stbc059 LIKE stbc_t.stbc059, #費用歸屬類型
       stbc060 LIKE stbc_t.stbc060, #費用歸屬組織
       stbc061 LIKE stbc_t.stbc061, #應收結算金額
       stbc062 LIKE stbc_t.stbc062, #帳套二應收結算金額
       stbc063 LIKE stbc_t.stbc063, #帳套三應收結算金額
       stbc064 LIKE stbc_t.stbc064   #收入立帳否
       END RECORD
DEFINE p_stbe RECORD  #結算單明細資料
       stbeent LIKE stbe_t.stbeent, #企業編號
       stbesite LIKE stbe_t.stbesite, #營運據點
       stbecomp LIKE stbe_t.stbecomp, #所屬法人
       stbedocno LIKE stbe_t.stbedocno, #單據編號
       stbeseq LIKE stbe_t.stbeseq, #單據項次
       stbe001 LIKE stbe_t.stbe001, #來源類別
       stbe002 LIKE stbe_t.stbe002, #來源單據
       stbe003 LIKE stbe_t.stbe003, #來源項次
       stbe004 LIKE stbe_t.stbe004, #來源日期
       stbe005 LIKE stbe_t.stbe005, #費用編號
       stbe006 LIKE stbe_t.stbe006, #起始日期
       stbe007 LIKE stbe_t.stbe007, #截止日期
       stbe008 LIKE stbe_t.stbe008, #幣別
       stbe009 LIKE stbe_t.stbe009, #稅別
       stbe010 LIKE stbe_t.stbe010, #價款類別
       stbe011 LIKE stbe_t.stbe011, #方向
       stbe012 LIKE stbe_t.stbe012, #價外金額
       stbe013 LIKE stbe_t.stbe013, #價內金額
       stbe014 LIKE stbe_t.stbe014, #未結算金額
       stbe015 LIKE stbe_t.stbe015, #已結算金額
       stbe016 LIKE stbe_t.stbe016, #本次結算金額
       stbe017 LIKE stbe_t.stbe017, #結算方式
       stbe018 LIKE stbe_t.stbe018, #結算類型
       stbe019 LIKE stbe_t.stbe019, #所屬品類
       stbe020 LIKE stbe_t.stbe020, #所屬部門
       stbe021 LIKE stbe_t.stbe021, #主帳套帳款金額
       stbe022 LIKE stbe_t.stbe022, #次帳套一帳款金額
       stbe023 LIKE stbe_t.stbe023, #次帳套二帳款金額
       stbe024 LIKE stbe_t.stbe024, #納入結算單否
       stbe025 LIKE stbe_t.stbe025, #票扣否
       stbe026 LIKE stbe_t.stbe026, #數量
       stbe027 LIKE stbe_t.stbe027, #單價
       stbe028 LIKE stbe_t.stbe028, #专柜编号
       stbe029 LIKE stbe_t.stbe029, #no use
       stbe030 LIKE stbe_t.stbe030, #no use
       stbe031 LIKE stbe_t.stbe031, #結算扣率
       stbe032 LIKE stbe_t.stbe032, #備註
       stbe033 LIKE stbe_t.stbe033, #日結成本類型
       stbe034 LIKE stbe_t.stbe034, #銷售金額
       stbe035 LIKE stbe_t.stbe035, #費用歸屬類型
       stbe036 LIKE stbe_t.stbe036, #費用歸屬組織
       stbe037 LIKE stbe_t.stbe037, #應收結算金額
       stbe038 LIKE stbe_t.stbe038, #帳套二應收結算金額
       stbe039 LIKE stbe_t.stbe039, #帳套三應收結算金額
       stbe040 LIKE stbe_t.stbe040  #收入立帳否
       END RECORD

#161111-00028#5--modify---end----------
DEFINE p_stan030     LIKE stan_t.stan030

   LET p_success=TRUE
   #查询旧的合同编号
   INITIALIZE p_stan030 TO NULL
   SELECT stan030 INTO p_stan030
     FROM stan_t  
    WHERE stanent = g_enterprise  
      AND stan001 = g_stbd_m.stbd001
   IF cl_null(p_stan030) THEN            
       #161111-00028#5---modify----begin-----------
       #LET g_sql = "SELECT * FROM stbc_t",
       LET g_sql = "SELECT stbcent,stbcsite,stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc008,",
               "stbc009,stbc010,stbc011,stbc012,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,",
               "stbc020,stbc021,stbc022,stbc023,stbc024,stbc025,stbc026,stbc027,stbc028,stbc029,stbc030,",
               "stbc031,stbc032,stbcstus,stbc033,stbc034,stbc035,stbc036,stbc037,stbc038,",
               "stbc039,stbc040,stbc041,stbc042,stbc043,stbc044,stbc045,stbc046,stbc047,",
               "stbc048,stbc049,stbc050,stbc051,stbc052,stbc053,stbc054,stbc055,stbc056,",
               "stbc057,stbc058,stbc059,stbc060,stbc061,stbc062,stbc063,stbc064 FROM stbc_t",
       #161111-00028#5---modify----end-------------
               " WHERE stbcent='",g_enterprise,"'",
               "   AND stbc001='",g_stbd_m.stbdsite,"'",    
               "   AND stbc004='",g_stbe_d[l_ac].stbe002 ,"'", 
               "   AND stbc005='",g_stbe_d[l_ac].stbe003 ,"'"                    
   ELSE
       #161111-00028#5---modify----begin-----------
       #LET g_sql = "SELECT * FROM stbc_t",
       LET g_sql = "SELECT stbcent,stbcsite,stbc001,stbc002,stbc003,stbc004,stbc005,stbc006,stbc007,stbc008,",
               "stbc009,stbc010,stbc011,stbc012,stbc013,stbc014,stbc015,stbc016,stbc017,stbc018,stbc019,",
               "stbc020,stbc021,stbc022,stbc023,stbc024,stbc025,stbc026,stbc027,stbc028,stbc029,stbc030,",
               "stbc031,stbc032,stbcstus,stbc033,stbc034,stbc035,stbc036,stbc037,stbc038,",
               "stbc039,stbc040,stbc041,stbc042,stbc043,stbc044,stbc045,stbc046,stbc047,",
               "stbc048,stbc049,stbc050,stbc051,stbc052,stbc053,stbc054,stbc055,stbc056,",
               "stbc057,stbc058,stbc059,stbc060,stbc061,stbc062,stbc063,stbc064 FROM stbc_t",
       #161111-00028#5---modify----end-------------
               " WHERE stbcent='",g_enterprise,"'",
               "   AND stbc001='",g_stbd_m.stbdsite,"'",    
               "   AND stbc004='",g_stbe_d[l_ac].stbe002 ,"'", 
               "   AND stbc005='",g_stbe_d[l_ac].stbe003 ,"'" 
   END IF 
   
   PREPARE astt340_insert_stbc_ot FROM g_sql
   DECLARE astt340_insert_stbe1_cur CURSOR FOR astt340_insert_stbc_ot
       

   INITIALIZE p_stbc.* TO NULL
   
   FOREACH astt340_insert_stbe1_cur INTO p_stbc.*   
      INITIALIZE p_stbe.* TO NULL
      LET p_stbe.stbeent=g_enterprise
      LET p_stbe.stbesite=p_stbc.stbcsite
 
      SELECT ooef017 INTO p_stbe.stbecomp
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_stbd_m.stbdsite
      
      LET p_stbe.stbedocno=g_stbd_m.stbddocno
               
      SELECT MAX(stbeseq)+1 INTO p_stbe.stbeseq
        FROM stbe_t
       WHERE stbeent=g_enterprise
         AND stbedocno=g_stbd_m.stbddocno
     
      IF cl_null(p_stbe.stbeseq) THEN
         LET p_stbe.stbeseq=1
      END IF               
      
      LET g_stbe_d[l_ac].stbe001 = p_stbc.stbc003
      LET g_stbe_d[l_ac].stbe002 = p_stbc.stbc004
      LET g_stbe_d[l_ac].stbe003 = p_stbc.stbc005
      LET g_stbe_d[l_ac].stbe004 = p_stbc.stbc002
      LET g_stbe_d[l_ac].stbe005 = p_stbc.stbc012
      #LET g_stbe_d[l_ac].stbe006 = g_stbd_m.stbd006     #mark by geza 20150825 
      #LET g_stbe_d[l_ac].stbe007 = g_stbd_m.stbd007     #mark by geza 20150825 
      #生成结算单的时候，结算单的单身日期区间自动带底稿的值   #add by geza 20150825(S)
      LET g_stbe_d[l_ac].stbe006=p_stbc.stbc045  
      LET g_stbe_d[l_ac].stbe007=p_stbc.stbc046     
      #add by geza 20150825(E)      
      LET g_stbe_d[l_ac].stbe008 = p_stbc.stbc013
      LET g_stbe_d[l_ac].stbe009 = p_stbc.stbc014
      LET g_stbe_d[l_ac].stbe010 = p_stbc.stbc015
      LET g_stbe_d[l_ac].stbe011 = p_stbc.stbc016
      LET g_stbe_d[l_ac].stbe012 = p_stbc.stbc017
      LET g_stbe_d[l_ac].stbe013 = p_stbc.stbc018
      LET g_stbe_d[l_ac].stbe014 = p_stbc.stbc019
      LET g_stbe_d[l_ac].stbe015 = p_stbc.stbc020
      LET g_stbe_d[l_ac].stbe016 = p_stbc.stbc019
      LET g_stbe_d[l_ac].stbe017 = p_stbc.stbc010
      LET g_stbe_d[l_ac].stbe018 = p_stbc.stbc011
      LET g_stbe_d[l_ac].stbe019 = p_stbc.stbc025
      LET g_stbe_d[l_ac].stbe020 = p_stbc.stbc026
      LET g_stbe_d[l_ac].stbe028= p_stbc.stbc033
      LET g_stbe_d[l_ac].stbesite = p_stbc.stbcsite
      LET g_stbe_d[l_ac].stbe025 = '0'      
      CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d[l_ac].stbe028_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d[l_ac].stbe028_desc
      LET g_ref_fields[1] = g_stbe_d[l_ac].stbe005
      CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d[l_ac].stbe005_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d[l_ac].stbe005_desc
      LET g_ref_fields[1] = g_stbe_d[l_ac].stbe008
      CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbe_d[l_ac].stbe008_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbe_d[l_ac].stbe008_desc
      LET g_ref_fields[1] = g_stbe_d[l_ac].stbesite
      LET g_ref_fields[1] = g_stbe_d[l_ac].stbe020
      LET g_ref_fields[1] = g_stbe_d[l_ac].stbe019
      IF g_type = '1' THEN
         LET p_stbe.stbe024=p_stbc.stbc033
      ELSE
         LET p_stbe.stbe024=g_stbd_m.stbd002
      END IF      
    
      #161111-00028#5---modify--begin---
      #INSERT INTO stbe_t VALUES (p_stbe.*) 
       INSERT INTO stbe_t (stbeent,stbesite,stbecomp,stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe005,stbe006,
                           stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe017,
                           stbe018,stbe019,stbe020,stbe021,stbe022,stbe023,stbe024,stbe025,stbe026,stbe027,stbe028,
                           stbe029,stbe030,stbe031,stbe032,stbe033,stbe034,stbe035,stbe036,stbe037,stbe038,stbe039,stbe040)
        VALUES (p_stbe.stbeent,p_stbe.stbesite,p_stbe.stbecomp,p_stbe.stbedocno,p_stbe.stbeseq,p_stbe.stbe001,p_stbe.stbe002,p_stbe.stbe003,p_stbe.stbe004,p_stbe.stbe005,p_stbe.stbe006,
                p_stbe.stbe007,p_stbe.stbe008,p_stbe.stbe009,p_stbe.stbe010,p_stbe.stbe011,p_stbe.stbe012,p_stbe.stbe013,p_stbe.stbe014,p_stbe.stbe015,p_stbe.stbe016,p_stbe.stbe017,
                p_stbe.stbe018,p_stbe.stbe019,p_stbe.stbe020,p_stbe.stbe021,p_stbe.stbe022,p_stbe.stbe023,p_stbe.stbe024,p_stbe.stbe025,p_stbe.stbe026,p_stbe.stbe027,p_stbe.stbe028,
                p_stbe.stbe029,p_stbe.stbe030,p_stbe.stbe031,p_stbe.stbe032,p_stbe.stbe033,p_stbe.stbe034,p_stbe.stbe035,p_stbe.stbe036,p_stbe.stbe037,p_stbe.stbe038,p_stbe.stbe039,p_stbe.stbe040) 
       #161111-00028#5---modify--begin---    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "into stbe_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET p_success=FALSE
         RETURN p_success    
      END IF     
      
      UPDATE stbc_t SET stbcstus='2'
       WHERE stbcent=g_enterprise
         AND stbc001=p_stbc.stbc001
         AND stbc004=p_stbc.stbc004
         AND stbc005=p_stbc.stbc005   
        
      IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "update stbc_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET p_success=FALSE
          RETURN p_success    
       END IF             
   END FOREACH
   
   FREE astt340_insert_stbc_ot

   RETURN p_success

END FUNCTION

################################################################################
# Descriptions...: 销售明细填充
# Memo...........:
# Usage..........: CALL astt340_stbe4_fill()
#                  RETURNING 回传参数
# Date & Author..: 20150802 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbe4_fill()
DEFINE p_wc2      STRING
DEFINE li_idx     LIKE type_t.num10
DEFINE l_stbpdocno     LIKE stbp_t.stbpdocno
DEFINE l_stbpseq       LIKE stbp_t.stbpseq

   CALL g_stbe6_d.clear()
   LET g_sql = "SELECT  UNIQUE stbe002,stbe003 FROM stbe_t",   
               
               " WHERE stbeent= ? AND stbedocno=?  AND stbe001 = '3' "   
   LET g_sql = cl_sql_add_mask(g_sql)    
   PREPARE astt340_stbp FROM g_sql
   DECLARE b_fill_cs7 CURSOR FOR astt340_stbp
   OPEN b_fill_cs7 USING g_enterprise,g_stbd_m.stbddocno
                                            
   FOREACH b_fill_cs7 INTO l_stbpdocno,l_stbpseq
   
      LET g_sql = "SELECT  UNIQUE stbpdocno,stbpseq,stbp001,stbp002,stbp003,stbp004,stbp005,stbp006,stbp007, 
          stbp008,stbp009  FROM stbp_t",   
                  
                  " WHERE stbpent= ? AND stbpdocno=?  AND stbpseq = ? "   
      LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
      #add-point:b_fill段sql_before
      
      #end add-point
         
      LET g_sql = g_sql, " ORDER BY stbp_t.stbpdocno,stbp_t.stbpseq"
      
      #add-point:單身填充控制
      
      #end add-point
      
      LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
      PREPARE astt320_pb2 FROM g_sql
      DECLARE b_fill_cs8 CURSOR FOR astt320_pb2
      
      
      LET l_ac = 1
      
      OPEN b_fill_cs8 USING g_enterprise,l_stbpdocno,l_stbpseq
                                               
      FOREACH b_fill_cs8 INTO g_stbe6_d[l_ac].stbpdocno,g_stbe6_d[l_ac].stbpseq,g_stbe6_d[l_ac].stbp001,g_stbe6_d[l_ac].stbp002, 
          g_stbe6_d[l_ac].stbp003,g_stbe6_d[l_ac].stbp004,g_stbe6_d[l_ac].stbp005,g_stbe6_d[l_ac].stbp006, 
          g_stbe6_d[l_ac].stbp007,g_stbe6_d[l_ac].stbp008,g_stbe6_d[l_ac].stbp009
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充
      
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH

   END FOREACH 
 
   CALL g_stbe6_d.deleteElement(g_stbe6_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt320_pb2
   FREE astt340_stbp
 
   
   LET li_idx = l_ac
     
   LET l_ac = li_idx
   
END FUNCTION

################################################################################
# Descriptions...: 修改备注
# Memo...........:
# Usage..........: CALL astt340_update_stbd033()
# Date & Author..: 20151019 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_update_stbd033()
DEFINE l_stbdmoddt      LIKE stbd_t.stbdmoddt

   IF g_stbd_m.stbddocno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF
   
   CALL s_transaction_begin()
   OPEN astt340_cl USING g_enterprise,g_stbd_m.stbddocno
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt340_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt340_master_referesh USING g_stbd_m.stbddocno INTO g_stbd_m.stbdsite,g_stbd_m.stbddocdt, 
       g_stbd_m.stbddocno,g_stbd_m.stbd048,g_stbd_m.stbd000,g_stbd_m.stbd037,g_stbd_m.stbd001,g_stbd_m.stbd041, 
       g_stbd_m.stbd002,g_stbd_m.stbd003,g_stbd_m.stbdunit,g_stbd_m.stbd039,g_stbd_m.stbd043,g_stbd_m.stbd044, 
       g_stbd_m.stbd004,g_stbd_m.stbd005,g_stbd_m.stbd006,g_stbd_m.stbd038,g_stbd_m.stbdstus,g_stbd_m.stbdownid, 
       g_stbd_m.stbdowndp,g_stbd_m.stbdcrtid,g_stbd_m.stbdcrtdp,g_stbd_m.stbdcrtdt,g_stbd_m.stbdmodid, 
       g_stbd_m.stbdmoddt,g_stbd_m.stbdcnfid,g_stbd_m.stbdcnfdt,g_stbd_m.stbd007,g_stbd_m.stbd008,g_stbd_m.stbd009, 
       g_stbd_m.stbd010,g_stbd_m.stbd011,g_stbd_m.stbd045,g_stbd_m.stbd012,g_stbd_m.stbd013,g_stbd_m.stbd014, 
       g_stbd_m.stbd015,g_stbd_m.stbd040,g_stbd_m.stbd016,g_stbd_m.stbd017,g_stbd_m.stbd018,g_stbd_m.stbd019, 
       g_stbd_m.stbd020,g_stbd_m.stbd042,g_stbd_m.stbd021,g_stbd_m.stbd022,g_stbd_m.stbd023,g_stbd_m.stbd024, 
       g_stbd_m.stbd025,g_stbd_m.stbd026,g_stbd_m.stbd046,g_stbd_m.stbd033,g_stbd_m.stbd027,g_stbd_m.stbd028, 
       g_stbd_m.stbd029,g_stbd_m.stbd030,g_stbd_m.stbd031,g_stbd_m.stbd032,g_stbd_m.stbdsite_desc,g_stbd_m.stbd048_desc, 
       g_stbd_m.stbd037_desc,g_stbd_m.stbd002_desc,g_stbd_m.stbdunit_desc,g_stbd_m.stbdownid_desc,g_stbd_m.stbdowndp_desc, 
       g_stbd_m.stbdcrtid_desc,g_stbd_m.stbdcrtdp_desc,g_stbd_m.stbdmodid_desc,g_stbd_m.stbdcnfid_desc, 
       g_stbd_m.stbd021_desc,g_stbd_m.stbd022_desc,g_stbd_m.stbd046_desc,g_stbd_m.stbd030_desc
    
   CALL astt340_show()
    
   INPUT BY NAME g_stbd_m.stbd033 ATTRIBUTE(WITHOUT DEFAULTS)
      
      AFTER FIELD stbd033
      
      AFTER INPUT
         #若取消則直接結束
         IF INT_FLAG THEN
            LET INT_FLAG = FALSE
            CLOSE astt340_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF
   END INPUT

   LET l_stbdmoddt = cl_get_current()
   UPDATE stbd_t
      SET stbd033 = g_stbd_m.stbd033,
          stbdmodid = g_user,
          stbdmoddt = l_stbdmoddt
    WHERE stbdent = g_enterprise
      AND stbddocno = g_stbd_m.stbddocno

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "Upd stbd_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE astt340_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   CLOSE astt340_cl
   CALL s_transaction_end('Y','0')
END FUNCTION

################################################################################
# Descriptions...: 新增费用明细单身
# Memo...........:
# Usage..........: CALL astt340_stbe_insert2(p_stevdocno,p_stevseq)
# Date & Author..: 20151119 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stbe_insert2(p_stevdocno,p_stevseq)
DEFINE p_stevdocno     LIKE stev_t.stevdocno
DEFINE p_stevseq       LIKE stev_t.stevseq
#161111-00028#5---modify--begin---
#DEFINE l_stev          RECORD LIKE stev_t.*
#DEFINE l_stbe          RECORD LIKE stbe_t.*
DEFINE l_stbe RECORD  #結算單明細資料
       stbeent LIKE stbe_t.stbeent, #企業編號
       stbesite LIKE stbe_t.stbesite, #營運據點
       stbecomp LIKE stbe_t.stbecomp, #所屬法人
       stbedocno LIKE stbe_t.stbedocno, #單據編號
       stbeseq LIKE stbe_t.stbeseq, #單據項次
       stbe001 LIKE stbe_t.stbe001, #來源類別
       stbe002 LIKE stbe_t.stbe002, #來源單據
       stbe003 LIKE stbe_t.stbe003, #來源項次
       stbe004 LIKE stbe_t.stbe004, #來源日期
       stbe005 LIKE stbe_t.stbe005, #費用編號
       stbe006 LIKE stbe_t.stbe006, #起始日期
       stbe007 LIKE stbe_t.stbe007, #截止日期
       stbe008 LIKE stbe_t.stbe008, #幣別
       stbe009 LIKE stbe_t.stbe009, #稅別
       stbe010 LIKE stbe_t.stbe010, #價款類別
       stbe011 LIKE stbe_t.stbe011, #方向
       stbe012 LIKE stbe_t.stbe012, #價外金額
       stbe013 LIKE stbe_t.stbe013, #價內金額
       stbe014 LIKE stbe_t.stbe014, #未結算金額
       stbe015 LIKE stbe_t.stbe015, #已結算金額
       stbe016 LIKE stbe_t.stbe016, #本次結算金額
       stbe017 LIKE stbe_t.stbe017, #結算方式
       stbe018 LIKE stbe_t.stbe018, #結算類型
       stbe019 LIKE stbe_t.stbe019, #所屬品類
       stbe020 LIKE stbe_t.stbe020, #所屬部門
       stbe021 LIKE stbe_t.stbe021, #主帳套帳款金額
       stbe022 LIKE stbe_t.stbe022, #次帳套一帳款金額
       stbe023 LIKE stbe_t.stbe023, #次帳套二帳款金額
       stbe024 LIKE stbe_t.stbe024, #納入結算單否
       stbe025 LIKE stbe_t.stbe025, #票扣否
       stbe026 LIKE stbe_t.stbe026, #數量
       stbe027 LIKE stbe_t.stbe027, #單價
       stbe028 LIKE stbe_t.stbe028, #专柜编号
       stbe029 LIKE stbe_t.stbe029, #no use
       stbe030 LIKE stbe_t.stbe030, #no use
       stbe031 LIKE stbe_t.stbe031, #結算扣率
       stbe032 LIKE stbe_t.stbe032, #備註
       stbe033 LIKE stbe_t.stbe033, #日結成本類型
       stbe034 LIKE stbe_t.stbe034, #銷售金額
       stbe035 LIKE stbe_t.stbe035, #費用歸屬類型
       stbe036 LIKE stbe_t.stbe036, #費用歸屬組織
       stbe037 LIKE stbe_t.stbe037, #應收結算金額
       stbe038 LIKE stbe_t.stbe038, #帳套二應收結算金額
       stbe039 LIKE stbe_t.stbe039, #帳套三應收結算金額
       stbe040 LIKE stbe_t.stbe040  #收入立帳否
       END RECORD
DEFINE l_stev RECORD  #交款彙總明細資料
       stevent LIKE stev_t.stevent, #企業編號
       stevsite LIKE stev_t.stevsite, #所屬組織
       stevcomp LIKE stev_t.stevcomp, #所屬法人
       stevdocno LIKE stev_t.stevdocno, #單據編號
       stevseq LIKE stev_t.stevseq, #單據項次
       stev001 LIKE stev_t.stev001, #來源類型
       stev002 LIKE stev_t.stev002, #來源單據
       stev003 LIKE stev_t.stev003, #來源項次
       stev004 LIKE stev_t.stev004, #來源日期
       stev005 LIKE stev_t.stev005, #費用編號
       stev006 LIKE stev_t.stev006, #起始日期
       stev007 LIKE stev_t.stev007, #截止日期
       stev008 LIKE stev_t.stev008, #幣別
       stev009 LIKE stev_t.stev009, #稅別
       stev010 LIKE stev_t.stev010, #價款類型
       stev011 LIKE stev_t.stev011, #方向
       stev012 LIKE stev_t.stev012, #價外金額
       stev013 LIKE stev_t.stev013, #價內金額
       stev014 LIKE stev_t.stev014, #未結算金額
       stev015 LIKE stev_t.stev015, #已結算金額
       stev016 LIKE stev_t.stev016, #本次結算金額
       stev017 LIKE stev_t.stev017, #結算方式
       stev018 LIKE stev_t.stev018, #結算類型
       stev019 LIKE stev_t.stev019, #所屬品類
       stev020 LIKE stev_t.stev020, #所屬部門
       stev021 LIKE stev_t.stev021, #主帳套帳款金額
       stev022 LIKE stev_t.stev022, #次帳套一帳款金額
       stev023 LIKE stev_t.stev023, #次帳套二帳款金額
       stev024 LIKE stev_t.stev024, #專櫃編號
       stev025 LIKE stev_t.stev025, #已交款金額
       stev026 LIKE stev_t.stev026, #納入結算單否
       stev027 LIKE stev_t.stev027, #票扣否
       stev028 LIKE stev_t.stev028, #數量
       stev029 LIKE stev_t.stev029, #單價
       stev030 LIKE stev_t.stev030, #備註
       stev031 LIKE stev_t.stev031, #費用歸屬類型
       stev032 LIKE stev_t.stev032  #費用歸屬組織
       END RECORD

#161111-00028#5---modify--end---
DEFINE r_success       LIKE type_t.num5

  #161111-00028#5---modify--begin---
  #LET g_sql = "SELECT * FROM stev_t",
   LET g_sql = "SELECT stevent,stevsite,stevcomp,stevdocno,stevseq,stev001,stev002,stev003,stev004,stev005,stev006,",
               "stev007,stev008,stev009,stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev017,stev018,",
               "stev019,stev020,stev021,stev022,stev023,stev024,stev025,stev026,stev027,stev028,stev029,stev030,",
               "stev031,stev032 FROM stev_t",
  #161111-00028#5---modify--end---
               " WHERE stevent='",g_enterprise,"'",
               "   AND stevdocno='",p_stevdocno,"'",                                 
               "   AND stevseq ='",p_stevseq,"'"
   PREPARE astt340_insert_stev_pb1 FROM g_sql
   DECLARE astt340_insert_stbe_cur1 CURSOR FOR astt340_insert_stev_pb1
       

   INITIALIZE l_stev.* TO NULL
   
   FOREACH astt340_insert_stbe_cur1 INTO l_stev.*
      LET l_stbe.stbeent=g_enterprise
      LET l_stbe.stbesite=l_stev.stevsite
      SELECT ooef017 INTO l_stbe.stbecomp
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_stbd_m.stbdsite
      LET l_stbe.stbedocno=g_stbd_m.stbddocno
            
      SELECT MAX(stbeseq)+1 INTO l_stbe.stbeseq
        FROM stbe_t
       WHERE stbeent=g_enterprise
         AND stbedocno=g_stbd_m.stbddocno
      IF cl_null(l_stbe.stbeseq) THEN
         LET l_stbe.stbeseq=1
      END IF               

      LET l_stbe.stbe001=l_stev.stev001                            #来源类型
      LET l_stbe.stbe002=l_stev.stev002                            #来源单据  
      LET l_stbe.stbe003=l_stev.stev003                            #来源项次
      LET l_stbe.stbe004=l_stev.stev004                            #来源日期
      LET l_stbe.stbe005=l_stev.stev005                            #费用编号
      LET l_stbe.stbe006=l_stev.stev006                            #起始日期  
      LET l_stbe.stbe007=l_stev.stev007                            #结束日期
      LET l_stbe.stbe008=l_stev.stev008                            #币别  
      LET l_stbe.stbe009=l_stev.stev009                            #税别  
      LET l_stbe.stbe010=l_stev.stev010                            #价款类别  
      LET l_stbe.stbe011=l_stev.stev011                            #方向
      LET l_stbe.stbe012=l_stev.stev012                            #价外金额/含税金额  
      LET l_stbe.stbe013=l_stev.stev013                            #价内金额/未税金额 
      LET l_stbe.stbe014=l_stev.stev014                            #未结算金额
      LET l_stbe.stbe015=l_stev.stev015                            #已结算金额  
      LET l_stbe.stbe016=l_stev.stev016                            #本次结算金额
      LET l_stbe.stbe017=l_stev.stev017                            #结算方式  
      LET l_stbe.stbe018=l_stev.stev018                            #结算类型 
      LET l_stbe.stbe019=l_stev.stev019                            #所属品类  
      LET l_stbe.stbe020=l_stev.stev020                            #所属部门  
      LET l_stbe.stbe021='0'   #add  by geza 20150604
      LET l_stbe.stbe022='0'   #add  by geza 20150604  
      LET l_stbe.stbe023='0'   #add  by geza 20150604
      LET l_stbe.stbe028=l_stev.stev024   #add  by geza 20150604   #专柜编号
      #本次結算數量=底稿中的數量-已立帳數量，單價=底稿中單價---huangrh add 20150604---
      #LET l_stbe.stbe026=l_stbc.stbc034-l_stbc.stbc035             #数量
      #LET l_stbe.stbe027=l_stbc.stbc036                            #单价  
      #本次結算單納入結算單否，票扣否---geza add 20150609---
      LET l_stbe.stbe024='Y'                                       #纳入结算单否           
      LET l_stbe.stbe025='N'                                       #票扣否 
      LET l_stbe.stbe026=l_stev.stev028                            #数量     #add  by geza 20150814     
      LET l_stbe.stbe027=l_stev.stev029                            #单价     #add  by geza 20150814
      LET l_stbe.stbe032=l_stev.stev030                            #备注     #add  by geza 20150814
       #161111-00028#5---modify--begin---
      #INSERT INTO stbe_t VALUES (l_stbe.*) 
       INSERT INTO stbe_t (stbeent,stbesite,stbecomp,stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe005,stbe006,
                           stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,stbe017,
                           stbe018,stbe019,stbe020,stbe021,stbe022,stbe023,stbe024,stbe025,stbe026,stbe027,stbe028,
                           stbe029,stbe030,stbe031,stbe032,stbe033,stbe034,stbe035,stbe036,stbe037,stbe038,stbe039,stbe040)
        VALUES (l_stbe.stbeent,l_stbe.stbesite,l_stbe.stbecomp,l_stbe.stbedocno,l_stbe.stbeseq,l_stbe.stbe001,l_stbe.stbe002,l_stbe.stbe003,l_stbe.stbe004,l_stbe.stbe005,l_stbe.stbe006,
                l_stbe.stbe007,l_stbe.stbe008,l_stbe.stbe009,l_stbe.stbe010,l_stbe.stbe011,l_stbe.stbe012,l_stbe.stbe013,l_stbe.stbe014,l_stbe.stbe015,l_stbe.stbe016,l_stbe.stbe017,
                l_stbe.stbe018,l_stbe.stbe019,l_stbe.stbe020,l_stbe.stbe021,l_stbe.stbe022,l_stbe.stbe023,l_stbe.stbe024,l_stbe.stbe025,l_stbe.stbe026,l_stbe.stbe027,l_stbe.stbe028,
                l_stbe.stbe029,l_stbe.stbe030,l_stbe.stbe031,l_stbe.stbe032,l_stbe.stbe033,l_stbe.stbe034,l_stbe.stbe035,l_stbe.stbe036,l_stbe.stbe037,l_stbe.stbe038,l_stbe.stbe039,l_stbe.stbe040) 
       #161111-00028#5---modify--begin---       
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "into stbe_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF

   END FOREACH
   
   FREE astt340_insert_stev_pb1

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 新增交款明细单身
# Memo...........:
# Usage..........: CALL astt340_stev_insert2(p_stbedocno,p_stbeseq)
# Date & Author..: 20151119 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stev_insert2(p_stbedocno,p_stbeseq)
DEFINE p_stbedocno     LIKE stbe_t.stbedocno
DEFINE p_stbeseq       LIKE stbe_t.stbeseq
#161111-00028#5---modify--begin---
#DEFINE l_stev          RECORD LIKE stev_t.*
#DEFINE l_stbe          RECORD LIKE stbe_t.*
DEFINE l_stbe RECORD  #結算單明細資料
       stbeent LIKE stbe_t.stbeent, #企業編號
       stbesite LIKE stbe_t.stbesite, #營運據點
       stbecomp LIKE stbe_t.stbecomp, #所屬法人
       stbedocno LIKE stbe_t.stbedocno, #單據編號
       stbeseq LIKE stbe_t.stbeseq, #單據項次
       stbe001 LIKE stbe_t.stbe001, #來源類別
       stbe002 LIKE stbe_t.stbe002, #來源單據
       stbe003 LIKE stbe_t.stbe003, #來源項次
       stbe004 LIKE stbe_t.stbe004, #來源日期
       stbe005 LIKE stbe_t.stbe005, #費用編號
       stbe006 LIKE stbe_t.stbe006, #起始日期
       stbe007 LIKE stbe_t.stbe007, #截止日期
       stbe008 LIKE stbe_t.stbe008, #幣別
       stbe009 LIKE stbe_t.stbe009, #稅別
       stbe010 LIKE stbe_t.stbe010, #價款類別
       stbe011 LIKE stbe_t.stbe011, #方向
       stbe012 LIKE stbe_t.stbe012, #價外金額
       stbe013 LIKE stbe_t.stbe013, #價內金額
       stbe014 LIKE stbe_t.stbe014, #未結算金額
       stbe015 LIKE stbe_t.stbe015, #已結算金額
       stbe016 LIKE stbe_t.stbe016, #本次結算金額
       stbe017 LIKE stbe_t.stbe017, #結算方式
       stbe018 LIKE stbe_t.stbe018, #結算類型
       stbe019 LIKE stbe_t.stbe019, #所屬品類
       stbe020 LIKE stbe_t.stbe020, #所屬部門
       stbe021 LIKE stbe_t.stbe021, #主帳套帳款金額
       stbe022 LIKE stbe_t.stbe022, #次帳套一帳款金額
       stbe023 LIKE stbe_t.stbe023, #次帳套二帳款金額
       stbe024 LIKE stbe_t.stbe024, #納入結算單否
       stbe025 LIKE stbe_t.stbe025, #票扣否
       stbe026 LIKE stbe_t.stbe026, #數量
       stbe027 LIKE stbe_t.stbe027, #單價
       stbe028 LIKE stbe_t.stbe028, #专柜编号
       stbe029 LIKE stbe_t.stbe029, #no use
       stbe030 LIKE stbe_t.stbe030, #no use
       stbe031 LIKE stbe_t.stbe031, #結算扣率
       stbe032 LIKE stbe_t.stbe032, #備註
       stbe033 LIKE stbe_t.stbe033, #日結成本類型
       stbe034 LIKE stbe_t.stbe034, #銷售金額
       stbe035 LIKE stbe_t.stbe035, #費用歸屬類型
       stbe036 LIKE stbe_t.stbe036, #費用歸屬組織
       stbe037 LIKE stbe_t.stbe037, #應收結算金額
       stbe038 LIKE stbe_t.stbe038, #帳套二應收結算金額
       stbe039 LIKE stbe_t.stbe039, #帳套三應收結算金額
       stbe040 LIKE stbe_t.stbe040  #收入立帳否
       END RECORD
DEFINE l_stev RECORD  #交款彙總明細資料
       stevent LIKE stev_t.stevent, #企業編號
       stevsite LIKE stev_t.stevsite, #所屬組織
       stevcomp LIKE stev_t.stevcomp, #所屬法人
       stevdocno LIKE stev_t.stevdocno, #單據編號
       stevseq LIKE stev_t.stevseq, #單據項次
       stev001 LIKE stev_t.stev001, #來源類型
       stev002 LIKE stev_t.stev002, #來源單據
       stev003 LIKE stev_t.stev003, #來源項次
       stev004 LIKE stev_t.stev004, #來源日期
       stev005 LIKE stev_t.stev005, #費用編號
       stev006 LIKE stev_t.stev006, #起始日期
       stev007 LIKE stev_t.stev007, #截止日期
       stev008 LIKE stev_t.stev008, #幣別
       stev009 LIKE stev_t.stev009, #稅別
       stev010 LIKE stev_t.stev010, #價款類型
       stev011 LIKE stev_t.stev011, #方向
       stev012 LIKE stev_t.stev012, #價外金額
       stev013 LIKE stev_t.stev013, #價內金額
       stev014 LIKE stev_t.stev014, #未結算金額
       stev015 LIKE stev_t.stev015, #已結算金額
       stev016 LIKE stev_t.stev016, #本次結算金額
       stev017 LIKE stev_t.stev017, #結算方式
       stev018 LIKE stev_t.stev018, #結算類型
       stev019 LIKE stev_t.stev019, #所屬品類
       stev020 LIKE stev_t.stev020, #所屬部門
       stev021 LIKE stev_t.stev021, #主帳套帳款金額
       stev022 LIKE stev_t.stev022, #次帳套一帳款金額
       stev023 LIKE stev_t.stev023, #次帳套二帳款金額
       stev024 LIKE stev_t.stev024, #專櫃編號
       stev025 LIKE stev_t.stev025, #已交款金額
       stev026 LIKE stev_t.stev026, #納入結算單否
       stev027 LIKE stev_t.stev027, #票扣否
       stev028 LIKE stev_t.stev028, #數量
       stev029 LIKE stev_t.stev029, #單價
       stev030 LIKE stev_t.stev030, #備註
       stev031 LIKE stev_t.stev031, #費用歸屬類型
       stev032 LIKE stev_t.stev032  #費用歸屬組織
       END RECORD

#161111-00028#5---modify--end---
DEFINE r_success     LIKE type_t.num5
  #161111-00028#5---modify--begin---
  #LET g_sql = "SELECT * FROM stbe_t",
   LET g_sql = "SELECT stbeent,stbesite,stbecomp,stbedocno,stbeseq,stbe001,stbe002,stbe003,stbe004,stbe005,",
               "stbe006,stbe007,stbe008,stbe009,stbe010,stbe011,stbe012,stbe013,stbe014,stbe015,stbe016,",
               "stbe017,stbe018,stbe019,stbe020,stbe021,stbe022,stbe023,stbe024,stbe025,stbe026,stbe027,",
               "stbe028,stbe029,stbe030,stbe031,stbe032,stbe033,stbe034,stbe035,stbe036,stbe037,stbe038,",
               "stbe039,stbe040 FROM stbe_t",
  #161111-00028#5---modify--end---
               " WHERE stbeent='",g_enterprise,"'",
               "   AND stbedocno='",p_stbedocno,"'",                                 
               "   AND stbeseq ='",p_stbeseq,"'"
   PREPARE astt340_insert_stev_pb2 FROM g_sql
   DECLARE astt340_insert_stbe_cur2 CURSOR FOR astt340_insert_stev_pb2
       

   INITIALIZE l_stbe.* TO NULL
   
   FOREACH astt340_insert_stbe_cur2 INTO l_stbe.*
      LET l_stev.stevent=g_enterprise
      LET l_stev.stevsite=l_stbe.stbesite
      SELECT ooef017 INTO l_stev.stevcomp
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_stbd_m.stbdsite
      LET l_stev.stevdocno=g_stbd_m.stbddocno
            
      SELECT MAX(stevseq)+1 INTO l_stev.stevseq
        FROM stev_t
       WHERE stevent=g_enterprise
         AND stevdocno=g_stbd_m.stbddocno
      IF cl_null(l_stev.stevseq) THEN
         LET l_stev.stevseq=1
      END IF               

      LET l_stev.stev001=l_stbe.stbe001                            #来源类型
      LET l_stev.stev002=l_stbe.stbe002                            #来源单据  
      LET l_stev.stev003=l_stbe.stbe003                            #来源项次
      LET l_stev.stev004=l_stbe.stbe004                            #来源日期
      LET l_stev.stev005=l_stbe.stbe005                            #费用编号
      LET l_stev.stev006=l_stbe.stbe006                            #起始日期  
      LET l_stev.stev007=l_stbe.stbe007                            #结束日期
      LET l_stev.stev008=l_stbe.stbe008                            #币别  
      LET l_stev.stev009=l_stbe.stbe009                            #税别  
      LET l_stev.stev010=l_stbe.stbe010                            #价款类别  
      LET l_stev.stev011=l_stbe.stbe011                            #方向
      LET l_stev.stev012=l_stbe.stbe012                            #价外金额/含税金额  
      LET l_stev.stev013=l_stbe.stbe013                            #价内金额/未税金额 
      LET l_stev.stev014=l_stbe.stbe014                            #未结算金额
      LET l_stev.stev015=l_stbe.stbe015                            #已结算金额  
      LET l_stev.stev016=l_stbe.stbe016                            #本次结算金额
      LET l_stev.stev017=l_stbe.stbe017                            #结算方式  
      LET l_stev.stev018=l_stbe.stbe018                            #结算类型 
      LET l_stev.stev019=l_stbe.stbe019                            #所属品类  
      LET l_stev.stev020=l_stbe.stbe020                            #所属部门  
      LET l_stev.stev021='0'   #add  by geza 20150604
      LET l_stev.stev022='0'   #add  by geza 20150604  
      LET l_stev.stev023='0'   #add  by geza 20150604
      LET l_stev.stev024=l_stbe.stbe028   #add  by geza 20150604   #专柜编号
      #本次結算數量=底稿中的數量-已立帳數量，單價=底稿中單價---huangrh add 20150604---
      #LET l_stbe.stbe026=l_stbc.stbc034-l_stbc.stbc035             #数量
      #LET l_stbe.stbe027=l_stbc.stbc036                            #单价  
      #本次結算單納入結算單否，票扣否---geza add 20150609---
      LET l_stev.stev026='N'                                       #纳入结算单否           
      LET l_stev.stev027='N'                                       #票扣否 
      LET l_stev.stev028=l_stbe.stbe026                            #数量     #add  by geza 20150814    
      LET l_stev.stev029=l_stbe.stbe027                            #单价     #add  by geza 20150814
      LET l_stev.stev030=l_stbe.stbe032                            #备注     #add  by geza 20150814
      
      #161111-00028#5---add----begin---------
      #INSERT INTO stev_t VALUES (l_stev.*) 
      INSERT INTO stev_t (stevent,stevsite,stevcomp,stevdocno,stevseq,stev001,stev002,stev003,stev004,stev005,
                          stev006,stev007,stev008,stev009,stev010,stev011,stev012,stev013,stev014,stev015,
                          stev016,stev017,stev018,stev019,stev020,stev021,stev022,stev023,stev024,stev025,
                          stev026,stev027,stev028,stev029,stev030,stev031,stev032)
       VALUES (l_stev.stevent,l_stev.stevsite,l_stev.stevcomp,l_stev.stevdocno,l_stev.stevseq,l_stev.stev001,l_stev.stev002,l_stev.stev003,l_stev.stev004,l_stev.stev005,
               l_stev.stev006,l_stev.stev007,l_stev.stev008,l_stev.stev009,l_stev.stev010,l_stev.stev011,l_stev.stev012,l_stev.stev013,l_stev.stev014,l_stev.stev015,
               l_stev.stev016,l_stev.stev017,l_stev.stev018,l_stev.stev019,l_stev.stev020,l_stev.stev021,l_stev.stev022,l_stev.stev023,l_stev.stev024,l_stev.stev025,
               l_stev.stev026,l_stev.stev027,l_stev.stev028,l_stev.stev029,l_stev.stev030,l_stev.stev031,l_stev.stev032)
      
      #161111-00028#5---add----end-----------  
      
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "into stev_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF

   END FOREACH
   
   FREE astt340_insert_stev_pb2

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 交款明细刪除更新結算底稿
# Memo...........:
# Usage..........: CALL astt340_delete_updstbc2()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20151119 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_delete_updstbc2()
DEFINE r_success     LIKE type_t.num5
DEFINE l_stev002     LIKE stev_t.stev002
DEFINE l_stev003     LIKE stev_t.stev003
DEFINE l_stbc018     LIKE stbc_t.stbc018
DEFINE l_stbc019     LIKE stbc_t.stbc019
DEFINE l_stbcstus    LIKE stbc_t.stbcstus


   LET r_success=TRUE
  

   LET g_sql = "SELECT stev002,stev003 FROM stev_t",
               " WHERE stevent='",g_enterprise,"'",
               "   AND stevdocno='",g_stbd_m.stbddocno,"'"
      
   PREPARE astt340_update_stbc_pb1 FROM g_sql
   DECLARE astt340_update_stbe_cur1 CURSOR FOR astt340_update_stbc_pb1
       

   LET l_stev002=''
   LET l_stev003=''
   
   FOREACH astt340_update_stbe_cur1 INTO l_stev002,l_stev003

      LET l_stbc018=''
      LET l_stbc019=''
      LET l_stbcstus=''
      SELECT stbc018,stbc019,stbcstus INTO l_stbc018,l_stbc019,l_stbcstus
        FROM stbc_t
       WHERE stbcent=g_enterprise
          
         AND stbc004=l_stev002
         AND stbc005=l_stev003
       
       IF cl_null(l_stbc018) THEN
          LET l_stbc018=0
       END IF          

       IF cl_null(l_stbc019) THEN
          LET l_stbc019=0
       END IF  
       
       IF l_stbc018=l_stbc019 THEN
          LET l_stbcstus='1'
       END IF
       
       IF 0<l_stbc019 AND l_stbc019<l_stbc018 THEN
          LET l_stbcstus='3'
       END IF
       
       #add by geza 20150909(S)
       #如果状态码为空，则给1
       IF l_stbcstus IS NULL  THEN    
          LET l_stbcstus='1'
       END IF
       #add by geza 20150909(E)
       
       UPDATE stbc_t SET stbcstus=l_stbcstus
        WHERE stbcent=g_enterprise
          
          AND stbc004=l_stev002
          AND stbc005=l_stev003  
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "update stbc_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()

          LET r_success=FALSE
          RETURN r_success    
       END IF       
       


   END FOREACH
   
   FREE astt340_update_stbc_pb1

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 結算單交款明细
# Memo...........:
# Usage..........: CALL astt340_stev_fill2()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 20151119 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt340_stev_fill2()
DEFINE p_wc2      STRING
DEFINE l_i        LIKE type_t.num5
   
 
   CALL g_stev_d.clear()    #g_stes_d 單頭及單身 
  
   LET g_sql = "SELECT  UNIQUE stevdocno,stevseq,stev001,stev002,stev003,stev004,stev024,'',stev005,'',stev026,stev027,'',stev006,stev007, 
       stev008,'',stev009,'',stev010,stev011,stev012,stev013,stev014,stev015,stev016,stev028,stev029,stev017,stev018, 
       stevsite,stev020,stev019,stev030 FROM stev_t",   
               " WHERE stevent=? AND stevdocno =?"       
   LET g_sql = g_sql, " ORDER BY stev_t.stevdocno,stev_t.stevseq"      
   
   PREPARE astt340_pb6 FROM g_sql                      
   DECLARE b_fill_cs6 CURSOR FOR astt340_pb6           
   
   LET l_i = 1
   
   OPEN b_fill_cs6 USING g_enterprise,g_stbd_m.stbddocno
                                     
   FOREACH b_fill_cs6 INTO g_stev_d[l_i].stevdocno,g_stev_d[l_i].stevseq,g_stev_d[l_i].stev001,g_stev_d[l_i].stev002,
       g_stev_d[l_i].stev003,g_stev_d[l_i].stev004,
       g_stev_d[l_i].stev024,g_stev_d[l_i].stev024_desc,g_stev_d[l_i].stev005,g_stev_d[l_i].stev005_desc,
       g_stev_d[l_i].stev026,g_stev_d[l_i].stev027,g_stev_d[l_i].stae003_1, 
       g_stev_d[l_i].stev006,g_stev_d[l_i].stev007,g_stev_d[l_i].stev008,g_stev_d[l_i].stev008_desc, 
       g_stev_d[l_i].stev009,g_stev_d[l_i].stev009_desc,g_stev_d[l_i].stev010,g_stev_d[l_i].stev011, 
       g_stev_d[l_i].stev012,g_stev_d[l_i].stev013,g_stev_d[l_i].stev014,g_stev_d[l_i].stev015, 
       g_stev_d[l_i].stev016,g_stev_d[l_i].stev028,g_stev_d[l_i].stev029,g_stev_d[l_i].stev017,
       g_stev_d[l_i].stev018,g_stev_d[l_i].stevsite,g_stev_d[l_i].stev020,g_stev_d[l_i].stev019,
       g_stev_d[l_i].stev030
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev024
      CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev024_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev024_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev005
      CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev005_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev005_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev005
      CALL ap_ref_array2(g_ref_fields,"SELECT stae003 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stae003_1 = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stae003_1

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stev_d[l_i].stev008
      CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev008_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev008_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] =g_stev_d[l_i].stev009
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stev_d[l_i].stev009_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stev_d[l_i].stev009_desc


      LET l_i = l_i + 1
      IF l_i > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
    
   CALL g_stev_d.deleteElement(g_stev_d.getLength())

   FREE astt340_pb6         
END FUNCTION

################################################################################

################################################################################
PRIVATE FUNCTION astt340_stbd048_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbd_m.stbd048 
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001 = ? AND ooefl002='"||g_dlang||"' ","") RETURNING g_rtn_fields
   LET g_stbd_m.stbd048_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_stbd_m.stbd048_desc
END FUNCTION

 
{</section>}
 
