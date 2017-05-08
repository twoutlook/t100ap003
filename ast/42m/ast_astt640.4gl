#該程式未解開Section, 採用最新樣板產出!
{<section id="astt640.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0010(2015-01-26 14:42:32), PR版次:0010(2017-02-14 17:25:39)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000067
#+ Filename...: astt640
#+ Description:  經銷商結算單維護作業
#+ Creator....: 03247(2014-11-20 14:28:47)
#+ Modifier...: 06189 -SD/PR- 06137
 
{</section>}
 
{<section id="astt640.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00005#45  2016/03/26  By pengxin   修正azzi920重复定义之错误讯息
#160408-00010#2   2016/04/22  by 08172     scc调整
#160318-00025#44  2016/04/26  By 07959     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160816-00068#16  2016/08/19  By 08209     調整transaction
#160818-00017#40 2016-08-24 By 08734 删除修改未重新判断状态码
#161024-00025#5   2016/10/26  by 08172     组织调整
#160824-00007#201 2016/11/17   By 06137   修正舊值備份寫法
#170214-00051#1   2017/02/14   By 06137   修正astt640單頭輸入合約編號後無帶出相關欄位bug
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
PRIVATE type type_g_stbt_m        RECORD
       stbtsite LIKE stbt_t.stbtsite, 
   stbtsite_desc LIKE type_t.chr80, 
   stbtdocdt LIKE stbt_t.stbtdocdt, 
   stbtdocno LIKE stbt_t.stbtdocno, 
   stbt001 LIKE stbt_t.stbt001, 
   stbt002 LIKE stbt_t.stbt002, 
   stbt002_desc LIKE type_t.chr80, 
   stbt003 LIKE stbt_t.stbt003, 
   stbt007 LIKE stbt_t.stbt007, 
   stcw004 LIKE type_t.dat, 
   stbt008 LIKE stbt_t.stbt008, 
   stbt009 LIKE stbt_t.stbt009, 
   stbtstus LIKE stbt_t.stbtstus, 
   stbtownid LIKE stbt_t.stbtownid, 
   stbtownid_desc LIKE type_t.chr80, 
   stbtowndp LIKE stbt_t.stbtowndp, 
   stbtowndp_desc LIKE type_t.chr80, 
   stbtcrtid LIKE stbt_t.stbtcrtid, 
   stbtcrtid_desc LIKE type_t.chr80, 
   stbtcrtdp LIKE stbt_t.stbtcrtdp, 
   stbtcrtdp_desc LIKE type_t.chr80, 
   stbtcrtdt LIKE stbt_t.stbtcrtdt, 
   stbtmodid LIKE stbt_t.stbtmodid, 
   stbtmodid_desc LIKE type_t.chr80, 
   stbtmoddt LIKE stbt_t.stbtmoddt, 
   stbtcnfid LIKE stbt_t.stbtcnfid, 
   stbtcnfid_desc LIKE type_t.chr80, 
   stbtcnfdt LIKE stbt_t.stbtcnfdt, 
   stbt010 LIKE stbt_t.stbt010, 
   stbt011 LIKE stbt_t.stbt011, 
   stbt012 LIKE stbt_t.stbt012, 
   stbt013 LIKE stbt_t.stbt013, 
   stbt014 LIKE stbt_t.stbt014, 
   stbt015 LIKE stbt_t.stbt015, 
   stbt016 LIKE stbt_t.stbt016, 
   stbt017 LIKE stbt_t.stbt017, 
   stbt018 LIKE stbt_t.stbt018, 
   stbt019 LIKE stbt_t.stbt019, 
   stbt020 LIKE stbt_t.stbt020, 
   stbt021 LIKE stbt_t.stbt021, 
   stbt022 LIKE stbt_t.stbt022, 
   stbt023 LIKE stbt_t.stbt023, 
   stbt004 LIKE stbt_t.stbt004, 
   stbt004_desc LIKE type_t.chr80, 
   stbt005 LIKE stbt_t.stbt005, 
   stbt005_desc LIKE type_t.chr80, 
   stbt006 LIKE stbt_t.stbt006, 
   stbt024 LIKE stbt_t.stbt024, 
   stbt024_desc LIKE type_t.chr80, 
   stbt025 LIKE stbt_t.stbt025, 
   stbt025_desc LIKE type_t.chr80, 
   stbt026 LIKE stbt_t.stbt026, 
   stbt026_desc LIKE type_t.chr80, 
   stbt027 LIKE stbt_t.stbt027, 
   stbt028 LIKE stbt_t.stbt028, 
   stbt029 LIKE stbt_t.stbt029
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stbu_d        RECORD
       stbuseq LIKE stbu_t.stbuseq, 
   stbu001 LIKE stbu_t.stbu001, 
   stbu002 LIKE stbu_t.stbu002, 
   stbu003 LIKE stbu_t.stbu003, 
   stbu004 LIKE stbu_t.stbu004, 
   stbu005 LIKE stbu_t.stbu005, 
   stbu005_desc LIKE type_t.chr500, 
   stae003 LIKE type_t.chr10, 
   stae003_desc LIKE type_t.chr500, 
   stbu006 LIKE stbu_t.stbu006, 
   stbu007 LIKE stbu_t.stbu007, 
   stbu008 LIKE stbu_t.stbu008, 
   stbu008_desc LIKE type_t.chr500, 
   stbu009 LIKE stbu_t.stbu009, 
   stbu009_desc LIKE type_t.chr500, 
   stbu010 LIKE stbu_t.stbu010, 
   stbu011 LIKE stbu_t.stbu011, 
   stbu012 LIKE stbu_t.stbu012, 
   stbu013 LIKE stbu_t.stbu013, 
   stbu014 LIKE stbu_t.stbu014, 
   stbu015 LIKE stbu_t.stbu015, 
   stbu016 LIKE stbu_t.stbu016, 
   stbu017 LIKE stbu_t.stbu017, 
   stbu017_desc LIKE type_t.chr500, 
   stbu018 LIKE stbu_t.stbu018, 
   stbu018_desc LIKE type_t.chr500, 
   stbusite LIKE stbu_t.stbusite, 
   stbusite_desc LIKE type_t.chr500, 
   stbu020 LIKE stbu_t.stbu020, 
   stbu019 LIKE stbu_t.stbu019, 
   stbu021 LIKE stbu_t.stbu021, 
   stbu022 LIKE stbu_t.stbu022, 
   stbu023 LIKE stbu_t.stbu023, 
   stbu024 LIKE stbu_t.stbu024, 
   stbu025 LIKE stbu_t.stbu025, 
   stbu026 LIKE stbu_t.stbu026, 
   stbu027 LIKE stbu_t.stbu027, 
   stbucomp LIKE stbu_t.stbucomp
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stbtsite LIKE stbt_t.stbtsite,
   b_stbtsite_desc LIKE type_t.chr80,
      b_stbtdocno LIKE stbt_t.stbtdocno,
      b_stbtdocdt LIKE stbt_t.stbtdocdt,
      b_stbt001 LIKE stbt_t.stbt001,
      b_stbt002 LIKE stbt_t.stbt002,
   b_stbt002_desc LIKE type_t.chr80,
      b_stbt003 LIKE stbt_t.stbt003,
      b_stbt007 LIKE stbt_t.stbt007,
      b_stbt008 LIKE stbt_t.stbt008,
      b_stbt009 LIKE stbt_t.stbt009
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_stbu_d_2    DYNAMIC ARRAY OF  RECORD   
   stbuseq_1 LIKE stbu_t.stbuseq, 
   stbu001_1 LIKE stbu_t.stbu001, 
   stbu002_1 LIKE stbu_t.stbu002, 
   stbu003_1 LIKE stbu_t.stbu003, 
   stbu004_1 LIKE stbu_t.stbu004, 
   stbu005_1 LIKE stbu_t.stbu005, 
   stbu005_1_desc LIKE type_t.chr500, 
   stae003_1 LIKE type_t.chr10, 
   stae003_1_desc LIKE type_t.chr500, 
   stbu006_1 LIKE stbu_t.stbu006, 
   stbu007_1 LIKE stbu_t.stbu007, 
   stbu008_1 LIKE stbu_t.stbu008, 
   stbu008_1_desc LIKE type_t.chr500, 
   stbu009_1 LIKE stbu_t.stbu009, 
   stbu009_1_desc LIKE type_t.chr500, 
   stbu010_1 LIKE stbu_t.stbu010, 
   stbu011_1 LIKE stbu_t.stbu011, 
   stbu012_1 LIKE stbu_t.stbu012, 
   stbu013_1 LIKE stbu_t.stbu013, 
   stbu014_1 LIKE stbu_t.stbu014, 
   stbu015_1 LIKE stbu_t.stbu015, 
   stbu016_1 LIKE stbu_t.stbu016, 
   stbu017_1 LIKE stbu_t.stbu017, 
   stbu017_1_desc LIKE type_t.chr500, 
   stbu018_1 LIKE stbu_t.stbu018, 
   stbu018_1_desc LIKE type_t.chr500, 
   stbusite_1 LIKE stbu_t.stbusite, 
   stbusite_1_desc LIKE type_t.chr500, 
   stbu020_1 LIKE stbu_t.stbu020, 
   stbu019_1 LIKE stbu_t.stbu019, 
   stbu021_1 LIKE stbu_t.stbu021, 
   stbu022_1 LIKE stbu_t.stbu022, 
   stbu023_1 LIKE stbu_t.stbu023,
   stbu024_1 LIKE stbu_t.stbu024, 
   stbu025_1 LIKE stbu_t.stbu025, 
   stbu026_1 LIKE stbu_t.stbu026, 
   stbu027_1 LIKE stbu_t.stbu027, 
   stbucomp_1 LIKE stbu_t.stbucomp   
       END RECORD
       
DEFINE g_stbu_d_2_t   RECORD   
   stbuseq_1 LIKE stbu_t.stbuseq, 
   stbu001_1 LIKE stbu_t.stbu001, 
   stbu002_1 LIKE stbu_t.stbu002, 
   stbu003_1 LIKE stbu_t.stbu003, 
   stbu004_1 LIKE stbu_t.stbu004, 
   stbu005_1 LIKE stbu_t.stbu005, 
   stbu005_1_desc LIKE type_t.chr500, 
   stae003_1 LIKE type_t.chr10, 
   stae003_1_desc LIKE type_t.chr500, 
   stbu006_1 LIKE stbu_t.stbu006, 
   stbu007_1 LIKE stbu_t.stbu007, 
   stbu008_1 LIKE stbu_t.stbu008, 
   stbu008_1_desc LIKE type_t.chr500, 
   stbu009_1 LIKE stbu_t.stbu009, 
   stbu009_1_desc LIKE type_t.chr500, 
   stbu010_1 LIKE stbu_t.stbu010, 
   stbu011_1 LIKE stbu_t.stbu011, 
   stbu012_1 LIKE stbu_t.stbu012, 
   stbu013_1 LIKE stbu_t.stbu013, 
   stbu014_1 LIKE stbu_t.stbu014, 
   stbu015_1 LIKE stbu_t.stbu015, 
   stbu016_1 LIKE stbu_t.stbu016, 
   stbu017_1 LIKE stbu_t.stbu017, 
   stbu017_1_desc LIKE type_t.chr500, 
   stbu018_1 LIKE stbu_t.stbu018, 
   stbu018_1_desc LIKE type_t.chr500, 
   stbusite_1 LIKE stbu_t.stbusite, 
   stbusite_1_desc LIKE type_t.chr500, 
   stbu020_1 LIKE stbu_t.stbu020, 
   stbu019_1 LIKE stbu_t.stbu019, 
   stbu021_1 LIKE stbu_t.stbu021, 
   stbu022_1 LIKE stbu_t.stbu022, 
   stbu023_1 LIKE stbu_t.stbu023,
   stbu024_1 LIKE stbu_t.stbu024, 
   stbu025_1 LIKE stbu_t.stbu025, 
   stbu026_1 LIKE stbu_t.stbu026, 
   stbu027_1 LIKE stbu_t.stbu027, 
   stbucomp_1 LIKE stbu_t.stbucomp   
       END RECORD     
            
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stbt_m          type_g_stbt_m
DEFINE g_stbt_m_t        type_g_stbt_m
DEFINE g_stbt_m_o        type_g_stbt_m
DEFINE g_stbt_m_mask_o   type_g_stbt_m #轉換遮罩前資料
DEFINE g_stbt_m_mask_n   type_g_stbt_m #轉換遮罩後資料
 
   DEFINE g_stbtdocno_t LIKE stbt_t.stbtdocno
 
 
DEFINE g_stbu_d          DYNAMIC ARRAY OF type_g_stbu_d
DEFINE g_stbu_d_t        type_g_stbu_d
DEFINE g_stbu_d_o        type_g_stbu_d
DEFINE g_stbu_d_mask_o   DYNAMIC ARRAY OF type_g_stbu_d #轉換遮罩前資料
DEFINE g_stbu_d_mask_n   DYNAMIC ARRAY OF type_g_stbu_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
 
 
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
 
{<section id="astt640.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT stbtsite,'',stbtdocdt,stbtdocno,stbt001,stbt002,'',stbt003,stbt007,'', 
       stbt008,stbt009,stbtstus,stbtownid,'',stbtowndp,'',stbtcrtid,'',stbtcrtdp,'',stbtcrtdt,stbtmodid, 
       '',stbtmoddt,stbtcnfid,'',stbtcnfdt,stbt010,stbt011,stbt012,stbt013,stbt014,stbt015,stbt016,stbt017, 
       stbt018,stbt019,stbt020,stbt021,stbt022,stbt023,stbt004,'',stbt005,'',stbt006,stbt024,'',stbt025, 
       '',stbt026,'',stbt027,stbt028,stbt029", 
                      " FROM stbt_t",
                      " WHERE stbtent= ? AND stbtdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt640_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stbtsite,t0.stbtdocdt,t0.stbtdocno,t0.stbt001,t0.stbt002,t0.stbt003, 
       t0.stbt007,t0.stbt008,t0.stbt009,t0.stbtstus,t0.stbtownid,t0.stbtowndp,t0.stbtcrtid,t0.stbtcrtdp, 
       t0.stbtcrtdt,t0.stbtmodid,t0.stbtmoddt,t0.stbtcnfid,t0.stbtcnfdt,t0.stbt010,t0.stbt011,t0.stbt012, 
       t0.stbt013,t0.stbt014,t0.stbt015,t0.stbt016,t0.stbt017,t0.stbt018,t0.stbt019,t0.stbt020,t0.stbt021, 
       t0.stbt022,t0.stbt023,t0.stbt004,t0.stbt005,t0.stbt006,t0.stbt024,t0.stbt025,t0.stbt026,t0.stbt027, 
       t0.stbt028,t0.stbt029,t1.ooefl003 ,t2.pmaal004 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooefl003 , 
       t7.ooag011 ,t8.ooag011 ,t9.staal003 ,t10.oocql004 ,t11.ooag011 ,t12.ooefl003 ,t13.ooefl003",
               " FROM stbt_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbtsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbt002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stbtownid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stbtowndp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stbtcrtid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stbtcrtdp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.stbtmodid  ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stbtcnfid  ",
               " LEFT JOIN staal_t t9 ON t9.staalent="||g_enterprise||" AND t9.staal001=t0.stbt004 AND t9.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t10 ON t10.oocqlent="||g_enterprise||" AND t10.oocql001='2060' AND t10.oocql002=t0.stbt005 AND t10.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stbt024  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stbt025 AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stbt026 AND t13.ooefl002='"||g_dlang||"' ",
 
               " WHERE t0.stbtent = " ||g_enterprise|| " AND t0.stbtdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt640_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt640 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt640_init()   
 
      #進入選單 Menu (="N")
      CALL astt640_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt640
      
   END IF 
   
   CLOSE astt640_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt640.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt640_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stbtstus','13','N,Y,A,D,R,W,X')
 
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stbt003','6013','11,12,13')          #160408-00010#2
   CALL cl_set_combo_scc_part('b_stbt003','6013','11,12,13')         #160408-00010#2
   CALL cl_set_combo_scc('stbt023','6705')
   CALL cl_set_combo_scc('stbu001','6703')
   CALL cl_set_combo_scc('stbu010','6006')
   CALL cl_set_combo_scc('stbu001_1','6703')
   CALL cl_set_combo_scc('stbu010_1','6006')
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt640_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt640.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt640_ui_dialog()
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
            CALL astt640_insert()
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
         INITIALIZE g_stbt_m.* TO NULL
         CALL g_stbu_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt640_init()
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
               
               CALL astt640_fetch('') # reload data
               LET l_ac = 1
               CALL astt640_ui_detailshow() #Setting the current row 
         
               CALL astt640_idx_chk()
               #NEXT FIELD stbuseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stbu_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt640_idx_chk()
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
               CALL astt640_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_stbu_d_2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
               IF g_detail_idx > g_stbu_d_2.getLength() THEN
                  LET g_detail_idx = g_stbu_d_2.getLength()
               END IF
               IF g_detail_idx = 0 AND g_stbu_d_2.getLength() <> 0 THEN
                  LET g_detail_idx = 1
               END IF
               DISPLAY g_detail_idx TO FORMONLY.idx
               DISPLAY g_stbu_d_2.getLength() TO FORMONLY.cnt
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               

               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 1

         
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt640_browser_fill("")
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
               CALL astt640_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt640_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt640_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt640_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt640_set_act_visible()   
            CALL astt640_set_act_no_visible()
            IF NOT (g_stbt_m.stbtdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stbtent = " ||g_enterprise|| " AND",
                                  " stbtdocno = '", g_stbt_m.stbtdocno, "' "
 
               #填到對應位置
               CALL astt640_browser_fill("")
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
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stbt_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbu_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL astt640_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stbt_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbu_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt640_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt640_fetch("F")
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
               CALL astt640_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt640_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt640_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt640_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt640_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt640_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt640_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt640_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt640_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt640_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt640_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stbu_d)
                  LET g_export_id[1]   = "s_detail1"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  LET g_export_node[2] = base.typeInfo.create(g_stbu_d_2)
                  LET g_export_id[2]   = "s_detail2"
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
               NEXT FIELD stbuseq
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
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt640_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt640_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt640_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt640_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt640_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt640_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt640_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt640_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt640_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt640_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stbt_m.stbtdocdt)
 
 
 
         
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
 
{<section id="astt640.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt640_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stbtsite') RETURNING l_where
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
   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stbtdocno ",
                      " FROM stbt_t ",
                      " ",
                      " LEFT JOIN stbu_t ON stbuent = stbtent AND stbtdocno = stbudocno ", "  ",
                      #add-point:browser_fill段sql(stbu_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stbtent = " ||g_enterprise|| " AND stbuent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stbt_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stbtdocno ",
                      " FROM stbt_t ", 
                      "  ",
                      "  ",
                      " WHERE stbtent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stbt_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
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
      INITIALIZE g_stbt_m.* TO NULL
      CALL g_stbu_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stbtsite,t0.stbtdocno,t0.stbtdocdt,t0.stbt001,t0.stbt002,t0.stbt003,t0.stbt007,t0.stbt008,t0.stbt009 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbtstus,t0.stbtsite,t0.stbtdocno,t0.stbtdocdt,t0.stbt001,t0.stbt002, 
          t0.stbt003,t0.stbt007,t0.stbt008,t0.stbt009,t1.ooefl003 ,t2.pmaal004 ",
                  " FROM stbt_t t0",
                  "  ",
                  "  LEFT JOIN stbu_t ON stbuent = stbtent AND stbtdocno = stbudocno ", "  ", 
                  #add-point:browser_fill段sql(stbu_t1) name="browser_fill.join.stbu_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbtsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbt002 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbtent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stbt_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbtstus,t0.stbtsite,t0.stbtdocno,t0.stbtdocdt,t0.stbt001,t0.stbt002, 
          t0.stbt003,t0.stbt007,t0.stbt008,t0.stbt009,t1.ooefl003 ,t2.pmaal004 ",
                  " FROM stbt_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbtsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbt002 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbtent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stbt_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stbtdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stbt_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stbtsite,g_browser[g_cnt].b_stbtdocno, 
          g_browser[g_cnt].b_stbtdocdt,g_browser[g_cnt].b_stbt001,g_browser[g_cnt].b_stbt002,g_browser[g_cnt].b_stbt003, 
          g_browser[g_cnt].b_stbt007,g_browser[g_cnt].b_stbt008,g_browser[g_cnt].b_stbt009,g_browser[g_cnt].b_stbtsite_desc, 
          g_browser[g_cnt].b_stbt002_desc
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
         CALL astt640_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stbtdocno) THEN
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
 
{<section id="astt640.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt640_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stbt_m.stbtdocno = g_browser[g_current_idx].b_stbtdocno   
 
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
   CALL astt640_stbt_t_mask()
   CALL astt640_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt640.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt640_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt640_ui_browser_refresh()
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
      IF g_browser[l_i].b_stbtdocno = g_stbt_m.stbtdocno 
 
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
 
{<section id="astt640.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt640_construct()
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
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stbt_m.* TO NULL
   CALL g_stbu_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stbtsite,stbtdocdt,stbtdocno,stbt001,stbt002,stbt003,stbt007,stbt008, 
          stbt009,stbtstus,stbtownid,stbtowndp,stbtcrtid,stbtcrtdp,stbtcrtdt,stbtmodid,stbtmoddt,stbtcnfid, 
          stbtcnfdt,stbt010,stbt011,stbt012,stbt013,stbt014,stbt015,stbt016,stbt017,stbt018,stbt019, 
          stbt020,stbt021,stbt022,stbt023,stbt004,stbt005,stbt006,stbt024,stbt025,stbt026,stbt027,stbt028, 
          stbt029
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbtcrtdt>>----
         AFTER FIELD stbtcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stbtmoddt>>----
         AFTER FIELD stbtmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbtcnfdt>>----
         AFTER FIELD stbtcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbtpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stbtsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtsite
            #add-point:ON ACTION controlp INFIELD stbtsite name="construct.c.stbtsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbtsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbtsite  #顯示到畫面上
            NEXT FIELD stbtsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtsite
            #add-point:BEFORE FIELD stbtsite name="construct.b.stbtsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtsite
            
            #add-point:AFTER FIELD stbtsite name="construct.a.stbtsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtdocdt
            #add-point:BEFORE FIELD stbtdocdt name="construct.b.stbtdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtdocdt
            
            #add-point:AFTER FIELD stbtdocdt name="construct.a.stbtdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtdocdt
            #add-point:ON ACTION controlp INFIELD stbtdocdt name="construct.c.stbtdocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtdocno
            #add-point:BEFORE FIELD stbtdocno name="construct.b.stbtdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtdocno
            
            #add-point:AFTER FIELD stbtdocno name="construct.a.stbtdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtdocno
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtdocno
            #add-point:ON ACTION controlp INFIELD stbtdocno name="construct.c.stbtdocno"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbt001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt001
            #add-point:ON ACTION controlp INFIELD stbt001 name="construct.c.stbt001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt001  #顯示到畫面上
            NEXT FIELD stbt001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt001
            #add-point:BEFORE FIELD stbt001 name="construct.b.stbt001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt001
            
            #add-point:AFTER FIELD stbt001 name="construct.a.stbt001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt002
            #add-point:ON ACTION controlp INFIELD stbt002 name="construct.c.stbt002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt002  #顯示到畫面上
            NEXT FIELD stbt002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt002
            #add-point:BEFORE FIELD stbt002 name="construct.b.stbt002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt002
            
            #add-point:AFTER FIELD stbt002 name="construct.a.stbt002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt003
            #add-point:BEFORE FIELD stbt003 name="construct.b.stbt003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt003
            
            #add-point:AFTER FIELD stbt003 name="construct.a.stbt003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt003
            #add-point:ON ACTION controlp INFIELD stbt003 name="construct.c.stbt003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt007
            #add-point:BEFORE FIELD stbt007 name="construct.b.stbt007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt007
            
            #add-point:AFTER FIELD stbt007 name="construct.a.stbt007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt007
            #add-point:ON ACTION controlp INFIELD stbt007 name="construct.c.stbt007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt008
            #add-point:BEFORE FIELD stbt008 name="construct.b.stbt008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt008
            
            #add-point:AFTER FIELD stbt008 name="construct.a.stbt008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt008
            #add-point:ON ACTION controlp INFIELD stbt008 name="construct.c.stbt008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt009
            #add-point:BEFORE FIELD stbt009 name="construct.b.stbt009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt009
            
            #add-point:AFTER FIELD stbt009 name="construct.a.stbt009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt009
            #add-point:ON ACTION controlp INFIELD stbt009 name="construct.c.stbt009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtstus
            #add-point:BEFORE FIELD stbtstus name="construct.b.stbtstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtstus
            
            #add-point:AFTER FIELD stbtstus name="construct.a.stbtstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtstus
            #add-point:ON ACTION controlp INFIELD stbtstus name="construct.c.stbtstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbtownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtownid
            #add-point:ON ACTION controlp INFIELD stbtownid name="construct.c.stbtownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtownid  #顯示到畫面上
            NEXT FIELD stbtownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtownid
            #add-point:BEFORE FIELD stbtownid name="construct.b.stbtownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtownid
            
            #add-point:AFTER FIELD stbtownid name="construct.a.stbtownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtowndp
            #add-point:ON ACTION controlp INFIELD stbtowndp name="construct.c.stbtowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtowndp  #顯示到畫面上
            NEXT FIELD stbtowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtowndp
            #add-point:BEFORE FIELD stbtowndp name="construct.b.stbtowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtowndp
            
            #add-point:AFTER FIELD stbtowndp name="construct.a.stbtowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtcrtid
            #add-point:ON ACTION controlp INFIELD stbtcrtid name="construct.c.stbtcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtcrtid  #顯示到畫面上
            NEXT FIELD stbtcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtcrtid
            #add-point:BEFORE FIELD stbtcrtid name="construct.b.stbtcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtcrtid
            
            #add-point:AFTER FIELD stbtcrtid name="construct.a.stbtcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbtcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtcrtdp
            #add-point:ON ACTION controlp INFIELD stbtcrtdp name="construct.c.stbtcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtcrtdp  #顯示到畫面上
            NEXT FIELD stbtcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtcrtdp
            #add-point:BEFORE FIELD stbtcrtdp name="construct.b.stbtcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtcrtdp
            
            #add-point:AFTER FIELD stbtcrtdp name="construct.a.stbtcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtcrtdt
            #add-point:BEFORE FIELD stbtcrtdt name="construct.b.stbtcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbtmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtmodid
            #add-point:ON ACTION controlp INFIELD stbtmodid name="construct.c.stbtmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtmodid  #顯示到畫面上
            NEXT FIELD stbtmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtmodid
            #add-point:BEFORE FIELD stbtmodid name="construct.b.stbtmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtmodid
            
            #add-point:AFTER FIELD stbtmodid name="construct.a.stbtmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtmoddt
            #add-point:BEFORE FIELD stbtmoddt name="construct.b.stbtmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbtcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtcnfid
            #add-point:ON ACTION controlp INFIELD stbtcnfid name="construct.c.stbtcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbtcnfid  #顯示到畫面上
            NEXT FIELD stbtcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtcnfid
            #add-point:BEFORE FIELD stbtcnfid name="construct.b.stbtcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtcnfid
            
            #add-point:AFTER FIELD stbtcnfid name="construct.a.stbtcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtcnfdt
            #add-point:BEFORE FIELD stbtcnfdt name="construct.b.stbtcnfdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt010
            #add-point:BEFORE FIELD stbt010 name="construct.b.stbt010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt010
            
            #add-point:AFTER FIELD stbt010 name="construct.a.stbt010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt010
            #add-point:ON ACTION controlp INFIELD stbt010 name="construct.c.stbt010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt011
            #add-point:BEFORE FIELD stbt011 name="construct.b.stbt011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt011
            
            #add-point:AFTER FIELD stbt011 name="construct.a.stbt011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt011
            #add-point:ON ACTION controlp INFIELD stbt011 name="construct.c.stbt011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt012
            #add-point:BEFORE FIELD stbt012 name="construct.b.stbt012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt012
            
            #add-point:AFTER FIELD stbt012 name="construct.a.stbt012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt012
            #add-point:ON ACTION controlp INFIELD stbt012 name="construct.c.stbt012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt013
            #add-point:BEFORE FIELD stbt013 name="construct.b.stbt013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt013
            
            #add-point:AFTER FIELD stbt013 name="construct.a.stbt013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt013
            #add-point:ON ACTION controlp INFIELD stbt013 name="construct.c.stbt013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt014
            #add-point:BEFORE FIELD stbt014 name="construct.b.stbt014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt014
            
            #add-point:AFTER FIELD stbt014 name="construct.a.stbt014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt014
            #add-point:ON ACTION controlp INFIELD stbt014 name="construct.c.stbt014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt015
            #add-point:BEFORE FIELD stbt015 name="construct.b.stbt015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt015
            
            #add-point:AFTER FIELD stbt015 name="construct.a.stbt015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt015
            #add-point:ON ACTION controlp INFIELD stbt015 name="construct.c.stbt015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt016
            #add-point:BEFORE FIELD stbt016 name="construct.b.stbt016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt016
            
            #add-point:AFTER FIELD stbt016 name="construct.a.stbt016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt016
            #add-point:ON ACTION controlp INFIELD stbt016 name="construct.c.stbt016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt017
            #add-point:BEFORE FIELD stbt017 name="construct.b.stbt017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt017
            
            #add-point:AFTER FIELD stbt017 name="construct.a.stbt017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt017
            #add-point:ON ACTION controlp INFIELD stbt017 name="construct.c.stbt017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt018
            #add-point:BEFORE FIELD stbt018 name="construct.b.stbt018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt018
            
            #add-point:AFTER FIELD stbt018 name="construct.a.stbt018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt018
            #add-point:ON ACTION controlp INFIELD stbt018 name="construct.c.stbt018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt019
            #add-point:BEFORE FIELD stbt019 name="construct.b.stbt019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt019
            
            #add-point:AFTER FIELD stbt019 name="construct.a.stbt019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt019
            #add-point:ON ACTION controlp INFIELD stbt019 name="construct.c.stbt019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt020
            #add-point:BEFORE FIELD stbt020 name="construct.b.stbt020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt020
            
            #add-point:AFTER FIELD stbt020 name="construct.a.stbt020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt020
            #add-point:ON ACTION controlp INFIELD stbt020 name="construct.c.stbt020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt021
            #add-point:BEFORE FIELD stbt021 name="construct.b.stbt021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt021
            
            #add-point:AFTER FIELD stbt021 name="construct.a.stbt021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt021
            #add-point:ON ACTION controlp INFIELD stbt021 name="construct.c.stbt021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt022
            #add-point:BEFORE FIELD stbt022 name="construct.b.stbt022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt022
            
            #add-point:AFTER FIELD stbt022 name="construct.a.stbt022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt022
            #add-point:ON ACTION controlp INFIELD stbt022 name="construct.c.stbt022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt023
            #add-point:BEFORE FIELD stbt023 name="construct.b.stbt023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt023
            
            #add-point:AFTER FIELD stbt023 name="construct.a.stbt023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt023
            #add-point:ON ACTION controlp INFIELD stbt023 name="construct.c.stbt023"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbt004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt004
            #add-point:ON ACTION controlp INFIELD stbt004 name="construct.c.stbt004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt004  #顯示到畫面上
            NEXT FIELD stbt004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt004
            #add-point:BEFORE FIELD stbt004 name="construct.b.stbt004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt004
            
            #add-point:AFTER FIELD stbt004 name="construct.a.stbt004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt005
            #add-point:ON ACTION controlp INFIELD stbt005 name="construct.c.stbt005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt005  #顯示到畫面上
            NEXT FIELD stbt005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt005
            #add-point:BEFORE FIELD stbt005 name="construct.b.stbt005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt005
            
            #add-point:AFTER FIELD stbt005 name="construct.a.stbt005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt006
            #add-point:BEFORE FIELD stbt006 name="construct.b.stbt006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt006
            
            #add-point:AFTER FIELD stbt006 name="construct.a.stbt006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt006
            #add-point:ON ACTION controlp INFIELD stbt006 name="construct.c.stbt006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbt024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt024
            #add-point:ON ACTION controlp INFIELD stbt024 name="construct.c.stbt024"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt024  #顯示到畫面上
            NEXT FIELD stbt024                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt024
            #add-point:BEFORE FIELD stbt024 name="construct.b.stbt024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt024
            
            #add-point:AFTER FIELD stbt024 name="construct.a.stbt024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt025
            #add-point:ON ACTION controlp INFIELD stbt025 name="construct.c.stbt025"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today
            CALL q_ooeg001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbt025  #顯示到畫面上
            NEXT FIELD stbt025                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt025
            #add-point:BEFORE FIELD stbt025 name="construct.b.stbt025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt025
            
            #add-point:AFTER FIELD stbt025 name="construct.a.stbt025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt026
            #add-point:ON ACTION controlp INFIELD stbt026 name="construct.c.stbt026"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stbt026') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbt026',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stbt026  #顯示到畫面上
            NEXT FIELD stbt026                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt026
            #add-point:BEFORE FIELD stbt026 name="construct.b.stbt026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt026
            
            #add-point:AFTER FIELD stbt026 name="construct.a.stbt026"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt027
            #add-point:BEFORE FIELD stbt027 name="construct.b.stbt027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt027
            
            #add-point:AFTER FIELD stbt027 name="construct.a.stbt027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt027
            #add-point:ON ACTION controlp INFIELD stbt027 name="construct.c.stbt027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt028
            #add-point:BEFORE FIELD stbt028 name="construct.b.stbt028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt028
            
            #add-point:AFTER FIELD stbt028 name="construct.a.stbt028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt028
            #add-point:ON ACTION controlp INFIELD stbt028 name="construct.c.stbt028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt029
            #add-point:BEFORE FIELD stbt029 name="construct.b.stbt029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt029
            
            #add-point:AFTER FIELD stbt029 name="construct.a.stbt029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbt029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt029
            #add-point:ON ACTION controlp INFIELD stbt029 name="construct.c.stbt029"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006,stbu007,stbu008, 
          stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,stbu018,stbusite,stbu020, 
          stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026,stbu027,stbucomp
           FROM s_detail1[1].stbuseq,s_detail1[1].stbu001,s_detail1[1].stbu002,s_detail1[1].stbu003, 
               s_detail1[1].stbu004,s_detail1[1].stbu005,s_detail1[1].stbu006,s_detail1[1].stbu007,s_detail1[1].stbu008, 
               s_detail1[1].stbu009,s_detail1[1].stbu010,s_detail1[1].stbu011,s_detail1[1].stbu012,s_detail1[1].stbu013, 
               s_detail1[1].stbu014,s_detail1[1].stbu015,s_detail1[1].stbu016,s_detail1[1].stbu017,s_detail1[1].stbu018, 
               s_detail1[1].stbusite,s_detail1[1].stbu020,s_detail1[1].stbu019,s_detail1[1].stbu021, 
               s_detail1[1].stbu022,s_detail1[1].stbu023,s_detail1[1].stbu024,s_detail1[1].stbu025,s_detail1[1].stbu026, 
               s_detail1[1].stbu027,s_detail1[1].stbucomp
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbuseq
            #add-point:BEFORE FIELD stbuseq name="construct.b.page1.stbuseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbuseq
            
            #add-point:AFTER FIELD stbuseq name="construct.a.page1.stbuseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbuseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbuseq
            #add-point:ON ACTION controlp INFIELD stbuseq name="construct.c.page1.stbuseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu001
            #add-point:BEFORE FIELD stbu001 name="construct.b.page1.stbu001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu001
            
            #add-point:AFTER FIELD stbu001 name="construct.a.page1.stbu001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu001
            #add-point:ON ACTION controlp INFIELD stbu001 name="construct.c.page1.stbu001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu002
            #add-point:BEFORE FIELD stbu002 name="construct.b.page1.stbu002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu002
            
            #add-point:AFTER FIELD stbu002 name="construct.a.page1.stbu002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu002
            #add-point:ON ACTION controlp INFIELD stbu002 name="construct.c.page1.stbu002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu003
            #add-point:BEFORE FIELD stbu003 name="construct.b.page1.stbu003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu003
            
            #add-point:AFTER FIELD stbu003 name="construct.a.page1.stbu003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu003
            #add-point:ON ACTION controlp INFIELD stbu003 name="construct.c.page1.stbu003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu004
            #add-point:BEFORE FIELD stbu004 name="construct.b.page1.stbu004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu004
            
            #add-point:AFTER FIELD stbu004 name="construct.a.page1.stbu004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu004
            #add-point:ON ACTION controlp INFIELD stbu004 name="construct.c.page1.stbu004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu005
            #add-point:BEFORE FIELD stbu005 name="construct.b.page1.stbu005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu005
            
            #add-point:AFTER FIELD stbu005 name="construct.a.page1.stbu005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu005
            #add-point:ON ACTION controlp INFIELD stbu005 name="construct.c.page1.stbu005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu006
            #add-point:BEFORE FIELD stbu006 name="construct.b.page1.stbu006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu006
            
            #add-point:AFTER FIELD stbu006 name="construct.a.page1.stbu006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu006
            #add-point:ON ACTION controlp INFIELD stbu006 name="construct.c.page1.stbu006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu007
            #add-point:BEFORE FIELD stbu007 name="construct.b.page1.stbu007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu007
            
            #add-point:AFTER FIELD stbu007 name="construct.a.page1.stbu007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu007
            #add-point:ON ACTION controlp INFIELD stbu007 name="construct.c.page1.stbu007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbu008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu008
            #add-point:ON ACTION controlp INFIELD stbu008 name="construct.c.page1.stbu008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbu008  #顯示到畫面上
            NEXT FIELD stbu008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu008
            #add-point:BEFORE FIELD stbu008 name="construct.b.page1.stbu008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu008
            
            #add-point:AFTER FIELD stbu008 name="construct.a.page1.stbu008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu009
            #add-point:ON ACTION controlp INFIELD stbu009 name="construct.c.page1.stbu009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbu009  #顯示到畫面上
            NEXT FIELD stbu009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu009
            #add-point:BEFORE FIELD stbu009 name="construct.b.page1.stbu009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu009
            
            #add-point:AFTER FIELD stbu009 name="construct.a.page1.stbu009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu010
            #add-point:BEFORE FIELD stbu010 name="construct.b.page1.stbu010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu010
            
            #add-point:AFTER FIELD stbu010 name="construct.a.page1.stbu010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu010
            #add-point:ON ACTION controlp INFIELD stbu010 name="construct.c.page1.stbu010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu011
            #add-point:BEFORE FIELD stbu011 name="construct.b.page1.stbu011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu011
            
            #add-point:AFTER FIELD stbu011 name="construct.a.page1.stbu011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu011
            #add-point:ON ACTION controlp INFIELD stbu011 name="construct.c.page1.stbu011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu012
            #add-point:BEFORE FIELD stbu012 name="construct.b.page1.stbu012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu012
            
            #add-point:AFTER FIELD stbu012 name="construct.a.page1.stbu012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu012
            #add-point:ON ACTION controlp INFIELD stbu012 name="construct.c.page1.stbu012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu013
            #add-point:BEFORE FIELD stbu013 name="construct.b.page1.stbu013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu013
            
            #add-point:AFTER FIELD stbu013 name="construct.a.page1.stbu013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu013
            #add-point:ON ACTION controlp INFIELD stbu013 name="construct.c.page1.stbu013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu014
            #add-point:BEFORE FIELD stbu014 name="construct.b.page1.stbu014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu014
            
            #add-point:AFTER FIELD stbu014 name="construct.a.page1.stbu014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu014
            #add-point:ON ACTION controlp INFIELD stbu014 name="construct.c.page1.stbu014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu015
            #add-point:BEFORE FIELD stbu015 name="construct.b.page1.stbu015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu015
            
            #add-point:AFTER FIELD stbu015 name="construct.a.page1.stbu015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu015
            #add-point:ON ACTION controlp INFIELD stbu015 name="construct.c.page1.stbu015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu016
            #add-point:BEFORE FIELD stbu016 name="construct.b.page1.stbu016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu016
            
            #add-point:AFTER FIELD stbu016 name="construct.a.page1.stbu016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu016
            #add-point:ON ACTION controlp INFIELD stbu016 name="construct.c.page1.stbu016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbu017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu017
            #add-point:ON ACTION controlp INFIELD stbu017 name="construct.c.page1.stbu017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbu017  #顯示到畫面上
            NEXT FIELD stbu017                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu017
            #add-point:BEFORE FIELD stbu017 name="construct.b.page1.stbu017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu017
            
            #add-point:AFTER FIELD stbu017 name="construct.a.page1.stbu017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu018
            #add-point:ON ACTION controlp INFIELD stbu018 name="construct.c.page1.stbu018"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbu018  #顯示到畫面上
            NEXT FIELD stbu018                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu018
            #add-point:BEFORE FIELD stbu018 name="construct.b.page1.stbu018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu018
            
            #add-point:AFTER FIELD stbu018 name="construct.a.page1.stbu018"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbusite
            #add-point:BEFORE FIELD stbusite name="construct.b.page1.stbusite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbusite
            
            #add-point:AFTER FIELD stbusite name="construct.a.page1.stbusite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbusite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbusite
            #add-point:ON ACTION controlp INFIELD stbusite name="construct.c.page1.stbusite"
            #161024-00025#5 -s by 08172
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE                         #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbusite',g_site,'c') 
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbusite  #顯示到畫面上
            NEXT FIELD stbusite
            #161024-00025#5 -e by 08172
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu020
            #add-point:BEFORE FIELD stbu020 name="construct.b.page1.stbu020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu020
            
            #add-point:AFTER FIELD stbu020 name="construct.a.page1.stbu020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu020
            #add-point:ON ACTION controlp INFIELD stbu020 name="construct.c.page1.stbu020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu019
            #add-point:BEFORE FIELD stbu019 name="construct.b.page1.stbu019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu019
            
            #add-point:AFTER FIELD stbu019 name="construct.a.page1.stbu019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu019
            #add-point:ON ACTION controlp INFIELD stbu019 name="construct.c.page1.stbu019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu021
            #add-point:BEFORE FIELD stbu021 name="construct.b.page1.stbu021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu021
            
            #add-point:AFTER FIELD stbu021 name="construct.a.page1.stbu021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu021
            #add-point:ON ACTION controlp INFIELD stbu021 name="construct.c.page1.stbu021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu022
            #add-point:BEFORE FIELD stbu022 name="construct.b.page1.stbu022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu022
            
            #add-point:AFTER FIELD stbu022 name="construct.a.page1.stbu022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu022
            #add-point:ON ACTION controlp INFIELD stbu022 name="construct.c.page1.stbu022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu023
            #add-point:BEFORE FIELD stbu023 name="construct.b.page1.stbu023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu023
            
            #add-point:AFTER FIELD stbu023 name="construct.a.page1.stbu023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu023
            #add-point:ON ACTION controlp INFIELD stbu023 name="construct.c.page1.stbu023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu024
            #add-point:BEFORE FIELD stbu024 name="construct.b.page1.stbu024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu024
            
            #add-point:AFTER FIELD stbu024 name="construct.a.page1.stbu024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu024
            #add-point:ON ACTION controlp INFIELD stbu024 name="construct.c.page1.stbu024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu025
            #add-point:BEFORE FIELD stbu025 name="construct.b.page1.stbu025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu025
            
            #add-point:AFTER FIELD stbu025 name="construct.a.page1.stbu025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu025
            #add-point:ON ACTION controlp INFIELD stbu025 name="construct.c.page1.stbu025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu026
            #add-point:BEFORE FIELD stbu026 name="construct.b.page1.stbu026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu026
            
            #add-point:AFTER FIELD stbu026 name="construct.a.page1.stbu026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu026
            #add-point:ON ACTION controlp INFIELD stbu026 name="construct.c.page1.stbu026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu027
            #add-point:BEFORE FIELD stbu027 name="construct.b.page1.stbu027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu027
            
            #add-point:AFTER FIELD stbu027 name="construct.a.page1.stbu027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbu027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu027
            #add-point:ON ACTION controlp INFIELD stbu027 name="construct.c.page1.stbu027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbucomp
            #add-point:BEFORE FIELD stbucomp name="construct.b.page1.stbucomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbucomp
            
            #add-point:AFTER FIELD stbucomp name="construct.a.page1.stbucomp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbucomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbucomp
            #add-point:ON ACTION controlp INFIELD stbucomp name="construct.c.page1.stbucomp"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
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
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stbt_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbu_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
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
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt640_filter()
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
      CONSTRUCT g_wc_filter ON stbtsite,stbtdocno,stbtdocdt,stbt001,stbt002,stbt003,stbt007,stbt008, 
          stbt009
                          FROM s_browse[1].b_stbtsite,s_browse[1].b_stbtdocno,s_browse[1].b_stbtdocdt, 
                              s_browse[1].b_stbt001,s_browse[1].b_stbt002,s_browse[1].b_stbt003,s_browse[1].b_stbt007, 
                              s_browse[1].b_stbt008,s_browse[1].b_stbt009
 
         BEFORE CONSTRUCT
               DISPLAY astt640_filter_parser('stbtsite') TO s_browse[1].b_stbtsite
            DISPLAY astt640_filter_parser('stbtdocno') TO s_browse[1].b_stbtdocno
            DISPLAY astt640_filter_parser('stbtdocdt') TO s_browse[1].b_stbtdocdt
            DISPLAY astt640_filter_parser('stbt001') TO s_browse[1].b_stbt001
            DISPLAY astt640_filter_parser('stbt002') TO s_browse[1].b_stbt002
            DISPLAY astt640_filter_parser('stbt003') TO s_browse[1].b_stbt003
            DISPLAY astt640_filter_parser('stbt007') TO s_browse[1].b_stbt007
            DISPLAY astt640_filter_parser('stbt008') TO s_browse[1].b_stbt008
            DISPLAY astt640_filter_parser('stbt009') TO s_browse[1].b_stbt009
      
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
 
      CALL astt640_filter_show('stbtsite')
   CALL astt640_filter_show('stbtdocno')
   CALL astt640_filter_show('stbtdocdt')
   CALL astt640_filter_show('stbt001')
   CALL astt640_filter_show('stbt002')
   CALL astt640_filter_show('stbt003')
   CALL astt640_filter_show('stbt007')
   CALL astt640_filter_show('stbt008')
   CALL astt640_filter_show('stbt009')
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt640_filter_parser(ps_field)
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
 
{<section id="astt640.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt640_filter_show(ps_field)
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
   LET ls_condition = astt640_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt640_query()
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
   CALL g_stbu_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt640_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt640_browser_fill("")
      CALL astt640_fetch("")
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
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL astt640_filter_show('stbtsite')
   CALL astt640_filter_show('stbtdocno')
   CALL astt640_filter_show('stbtdocdt')
   CALL astt640_filter_show('stbt001')
   CALL astt640_filter_show('stbt002')
   CALL astt640_filter_show('stbt003')
   CALL astt640_filter_show('stbt007')
   CALL astt640_filter_show('stbt008')
   CALL astt640_filter_show('stbt009')
   CALL astt640_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt640_fetch("F") 
      #顯示單身筆數
      CALL astt640_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt640_fetch(p_flag)
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
   
   LET g_stbt_m.stbtdocno = g_browser[g_current_idx].b_stbtdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
   #遮罩相關處理
   LET g_stbt_m_mask_o.* =  g_stbt_m.*
   CALL astt640_stbt_t_mask()
   LET g_stbt_m_mask_n.* =  g_stbt_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt640_set_act_visible()   
   CALL astt640_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)
   IF g_stbt_m.stbtstus NOT MATCHES "[NDR]" THEN
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF

   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stbt_m_t.* = g_stbt_m.*
   LET g_stbt_m_o.* = g_stbt_m.*
   
   LET g_data_owner = g_stbt_m.stbtownid      
   LET g_data_dept  = g_stbt_m.stbtowndp
   
   #重新顯示   
   CALL astt640_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt640_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_ooef212      LIKE ooef_t.ooef212
   DEFINE r_insert       LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stbu_d.clear()   
 
 
   INITIALIZE g_stbt_m.* TO NULL             #DEFAULT 設定
   
   LET g_stbtdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbt_m.stbtownid = g_user
      LET g_stbt_m.stbtowndp = g_dept
      LET g_stbt_m.stbtcrtid = g_user
      LET g_stbt_m.stbtcrtdp = g_dept 
      LET g_stbt_m.stbtcrtdt = cl_get_current()
      LET g_stbt_m.stbtmodid = g_user
      LET g_stbt_m.stbtmoddt = cl_get_current()
      LET g_stbt_m.stbtstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stbt_m.stbt010 = "0"
      LET g_stbt_m.stbt011 = "0"
      LET g_stbt_m.stbt012 = "0"
      LET g_stbt_m.stbt013 = "0"
      LET g_stbt_m.stbt014 = "0"
      LET g_stbt_m.stbt015 = "0"
      LET g_stbt_m.stbt016 = "0"
      LET g_stbt_m.stbt017 = "0"
      LET g_stbt_m.stbt018 = "0"
      LET g_stbt_m.stbt019 = "Y"
      LET g_stbt_m.stbt020 = "0"
      LET g_stbt_m.stbt021 = "0"
      LET g_stbt_m.stbt022 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      CALL g_stbu_d_2.clear()
      LET g_stbt_m_t.* = g_stbt_m.*

      LET r_insert=TRUE
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stbtsite',g_stbt_m.stbtsite) RETURNING r_insert,g_stbt_m.stbtsite
      IF NOT r_insert THEN
         RETURN 
      END IF
 
     ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stbt_m.stbtsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stbt_m.stbtdocno = r_doctype

#      #g_site為結算中心時，g_stbt_m.stbtsite=g_site      
#      LET l_ooef212=''
#      SELECT ooef212 INTO l_ooef212
#        FROM ooef_t
#       WHERE ooefent=g_enterprise
#         AND ooef001=g_site
#         AND ooefstus='Y'         
#      IF NOT cl_null(l_ooef212) AND l_ooef212='Y' THEN
#         LET g_stbt_m.stbtsite=g_site
#      END IF
      
      LET g_stbt_m.stbtdocdt=g_today
      LET g_stbt_m.stbt023='0'
      LET g_stbt_m.stbt024=g_user
      LET g_stbt_m.stbt025=g_dept
      LET g_stbt_m.stbt026=g_dept
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbtsite
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbt_m.stbtsite_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbtsite_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbtownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbt_m.stbtownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbtownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbtowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbt_m.stbtowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbtowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbtcrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbt_m.stbtcrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbtcrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbtcrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbt_m.stbtcrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbtcrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbt024
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbt_m.stbt024_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbt024_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbt025
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbt_m.stbt025_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbt025_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbt_m.stbt026
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbt_m.stbt026_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbt_m.stbt026_desc
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stbt_m_t.* = g_stbt_m.*
      LET g_stbt_m_o.* = g_stbt_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbt_m.stbtstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astt640_input("a")
      
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
         INITIALIZE g_stbt_m.* TO NULL
         INITIALIZE g_stbu_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt640_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stbu_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt640_set_act_visible()   
   CALL astt640_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbtent = " ||g_enterprise|| " AND",
                      " stbtdocno = '", g_stbt_m.stbtdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt640_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt640_cl
   
   CALL astt640_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
   
   #遮罩相關處理
   LET g_stbt_m_mask_o.* =  g_stbt_m.*
   CALL astt640_stbt_t_mask()
   LET g_stbt_m_mask_n.* =  g_stbt_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
       g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp, 
       g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdp_desc, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
       g_stbt_m.stbtcnfid_desc,g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
       g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
       g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004, 
       g_stbt_m.stbt004_desc,g_stbt_m.stbt005,g_stbt_m.stbt005_desc,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt024_desc,g_stbt_m.stbt025,g_stbt_m.stbt025_desc,g_stbt_m.stbt026,g_stbt_m.stbt026_desc, 
       g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stbt_m.stbtownid      
   LET g_data_dept  = g_stbt_m.stbtowndp
   
   #功能已完成,通報訊息中心
   CALL astt640_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt640_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stbt_m_t.* = g_stbt_m.*
   LET g_stbt_m_o.* = g_stbt_m.*
   
   IF g_stbt_m.stbtdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
   CALL s_transaction_begin()
   
   OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt640_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
   #檢查是否允許此動作
   IF NOT astt640_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbt_m_mask_o.* =  g_stbt_m.*
   CALL astt640_stbt_t_mask()
   LET g_stbt_m_mask_n.* =  g_stbt_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt640_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stbt_m.stbtmodid = g_user 
LET g_stbt_m.stbtmoddt = cl_get_current()
LET g_stbt_m.stbtmodid_desc = cl_get_username(g_stbt_m.stbtmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stbt_m.stbtstus MATCHES "[DR]" THEN
         LET g_stbt_m.stbtstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt640_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stbt_t SET (stbtmodid,stbtmoddt) = (g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt)
          WHERE stbtent = g_enterprise AND stbtdocno = g_stbtdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stbt_m.* = g_stbt_m_t.*
            CALL astt640_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stbt_m.stbtdocno != g_stbt_m_t.stbtdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stbu_t SET stbudocno = g_stbt_m.stbtdocno
 
          WHERE stbuent = g_enterprise AND stbudocno = g_stbt_m_t.stbtdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbu_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt640_set_act_visible()   
   CALL astt640_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stbtent = " ||g_enterprise|| " AND",
                      " stbtdocno = '", g_stbt_m.stbtdocno, "' "
 
   #填到對應位置
   CALL astt640_browser_fill("")
 
   CLOSE astt640_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt640_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt640.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt640_input(p_cmd)
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
   DEFINE  l_stcwseq             LIKE stcw_t.stcwseq
   DEFINE  l_stcw004             LIKE stcw_t.stcw004
   DEFINE  l_ooef016             LIKE ooef_t.ooef016
   DEFINE  l_ooagstus            LIKE ooag_t.ooagstus
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
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
       g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp, 
       g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdp_desc, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
       g_stbt_m.stbtcnfid_desc,g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
       g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
       g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004, 
       g_stbt_m.stbt004_desc,g_stbt_m.stbt005,g_stbt_m.stbt005_desc,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt024_desc,g_stbt_m.stbt025,g_stbt_m.stbt025_desc,g_stbt_m.stbt026,g_stbt_m.stbt026_desc, 
       g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
   
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
   LET g_forupd_sql = "SELECT stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006,stbu007,stbu008, 
       stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,stbu018,stbusite,stbu020, 
       stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026,stbu027,stbucomp FROM stbu_t WHERE stbuent=?  
       AND stbudocno=? AND stbuseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt640_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt640_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt640_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002, 
       g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008,g_stbt_m.stbt009,g_stbt_m.stbtstus, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
       g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008,g_stbt_m.stbt009, 
       g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp,g_stbt_m.stbtowndp_desc, 
       g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtcrtdt, 
       g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfid_desc, 
       g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014, 
       g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020, 
       g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt004_desc,g_stbt_m.stbt005, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt006,g_stbt_m.stbt024,g_stbt_m.stbt024_desc,g_stbt_m.stbt025, 
       g_stbt_m.stbt025_desc,g_stbt_m.stbt026,g_stbt_m.stbt026_desc,g_stbt_m.stbt027,g_stbt_m.stbt028, 
       g_stbt_m.stbt029
       
   LET l_allow_insert=FALSE
   LET l_allow_delete=FALSE
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt640.input.head" >}
      #單頭段
      INPUT BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002, 
          g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008,g_stbt_m.stbt009,g_stbt_m.stbtstus, 
          g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
          g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
          g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
          g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt640_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt640_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt640_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL astt640_set_entry(p_cmd)
            CALL astt640_set_no_entry(p_cmd)
            
            IF p_cmd = 'a' THEN
               IF NOT cl_null(g_stbt_m.stbtsite) AND NOT cl_null(g_stbt_m.stbtdocdt) THEN
                  CALL s_asti206_check(g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN                        
                     LET g_stbt_m.stbtdocdt=''
                  END IF  
                END IF
            END IF                
            #end add-point
            CALL astt640_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtsite
            
            #add-point:AFTER FIELD stbtsite name="input.a.stbtsite"
            IF  NOT cl_null(g_stbt_m.stbtsite) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbtsite != g_stbt_m_t.stbtsite )) THEN 
                  CALL s_aooi500_chk(g_prog,'stbtsite',g_stbt_m.stbtsite,g_stbt_m.stbtsite)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stbt_m.stbtsite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stbt_m.stbtsite = g_stbt_m_t.stbtsite
                     NEXT FIELD CURRENT
                  END IF                 
                 
                  LET g_site_flag = TRUE
                  CALL astt640_set_entry(p_cmd)
                  CALL astt640_set_no_entry(p_cmd)
#                  INITIALIZE g_chkparam.* TO NULL
#                    #設定g_chkparam.*的參數
#                  LET g_chkparam.arg1 = g_stbt_m.stbtsite
#                  IF NOT cl_chk_exist("v_ooef001_31") THEN
#                     LET g_stbt_m.stbtsite = g_stbt_m_t.stbtsite
#                     NEXT FIELD CURRENT
#                  END IF
               
                  #結算會計期檢查
                  IF NOT cl_null(g_stbt_m.stbtsite) AND NOT cl_null(g_stbt_m.stbtdocdt) THEN
                     CALL s_asti206_check(g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN                        
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stbt_m.stbtsite = g_stbt_m_t.stbtsite
                        NEXT FIELD CURRENT
                     END IF 
                  END IF  
                  
               END IF
            END IF

           
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbtsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbtsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbtsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtsite
            #add-point:BEFORE FIELD stbtsite name="input.b.stbtsite"
           
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbtsite
            #add-point:ON CHANGE stbtsite name="input.g.stbtsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtdocdt
            #add-point:BEFORE FIELD stbtdocdt name="input.b.stbtdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtdocdt
            
            #add-point:AFTER FIELD stbtdocdt name="input.a.stbtdocdt"
            IF  NOT cl_null(g_stbt_m.stbtdocdt) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbtdocdt != g_stbt_m_t.stbtdocdt )) THEN 
                  #結算會計期檢查
                  IF NOT cl_null(g_stbt_m.stbtsite) AND NOT cl_null(g_stbt_m.stbtdocdt) THEN
                     CALL s_asti206_check(g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN                        
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stbt_m.stbtdocdt = g_stbt_m_t.stbtdocdt
                        NEXT FIELD CURRENT
                     END IF  
                  END IF                   

               END IF
            END IF

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbtdocdt
            #add-point:ON CHANGE stbtdocdt name="input.g.stbtdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtdocno
            #add-point:BEFORE FIELD stbtdocno name="input.b.stbtdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtdocno
            
            #add-point:AFTER FIELD stbtdocno name="input.a.stbtdocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stbt_m.stbtdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbtdocno != g_stbt_m_t.stbtdocno )) THEN 
                  IF NOT s_aooi200_chk_slip(g_stbt_m.stbtsite,'',g_stbt_m.stbtdocno,g_prog) THEN
                     LET g_stbt_m.stbtdocno =  g_stbt_m_t.stbtdocno                    
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
            END IF

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbtdocno
            #add-point:ON CHANGE stbtdocno name="input.g.stbtdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt001
            #add-point:BEFORE FIELD stbt001 name="input.b.stbt001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt001
            
            #add-point:AFTER FIELD stbt001 name="input.a.stbt001"
            IF  NOT cl_null(g_stbt_m.stbt001) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbt001 != g_stbt_m_t.stbt001 )) THEN    #160824-00007#201 Mark By Ken 161117
               #IF (g_stbt_m.stbt001 != g_stbt_m_o.stbt001 ) THEN    #160824-00007#201 Add By Ken 161117   #170214-00051#1 Mark By ken 170214
               IF (g_stbt_m.stbt001 != g_stbt_m_o.stbt001 ) OR g_stbt_m_o.stbt001 IS NULL THEN    #170214-00051#1 Add By Ken 170214
                  INITIALIZE g_chkparam.* TO NULL		      
                      #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stbt_m.stbt001            
                  IF NOT cl_chk_exist("v_stce001_2") THEN
                     #LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001  #160824-00007#201 Mark By Ken 161117            
                     LET g_stbt_m.stbt001 = g_stbt_m_o.stbt001   #160824-00007#201 Add By Ken 161117
                     NEXT FIELD CURRENT 
                  END IF  

                 ##合約生效日期範圍判斷
                 #LET l_count=0
                 #SELECT COUNT(*) INTO l_count 
                 #  FROM stce_t
                 # WHERE stceent=g_enterprise
                 #   AND stce001=g_stbt_m.stbt001
                 #   AND stcestus='Y' 
                 #   AND stce017<=g_today
                 #   AND stce018>=g_today
                 #IF cl_null(l_count) OR l_count=0 THEN
                 #   LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001
                 #   INITIALIZE g_errparam TO NULL
                 #   LET g_errparam.code = "ast-00047"
                 #   LET g_errparam.extend = g_stbt_m.stbt001
                 #   LET g_errparam.popup = TRUE
                 #   CALL cl_err()
                 #
                 #   NEXT FIELD CURRENT
                 #END IF  
                  
                  #是否存此合約在未確認的結算單
                  LET l_count=0 
                  SELECT COUNT(*) INTO l_count
                    FROM stbt_t
                   WHERE stbtent=g_enterprise
                     AND stbt001=g_stbt_m.stbt001
                     AND stbtstus='N'
                  IF NOT cl_null(l_count) AND l_count>0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00092"
                     LET g_errparam.extend = g_stbt_m.stbt001
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001  #160824-00007#201 Mark By Ken 161117            
                     LET g_stbt_m.stbt001 = g_stbt_m_o.stbt001   #160824-00007#201 Add By Ken 161117                     
                     NEXT FIELD CURRENT
                  END IF  
                  
                 # #合約結算賬期的結算日判斷,g_today>=結算日
                 # LET l_stcwseq=''
                 # SELECT MIN(stcwseq) INTO l_stcwseq
                 #   FROM stcw_t
                 #  WHERE stcwent=g_enterprise
                 #    AND stcw001=g_stbt_m.stbt001
                 #    AND stcw005='N'
                 #    
                 # LET l_stcw004=''   
                 # SELECT stcw004 INTO l_stcw004
                 #   FROM stcw_t
                 #  WHERE stcwent=g_enterprise
                 #    AND stcw001=g_stbt_m.stbt001
                 #    AND stcw005='N'
                 #    AND stcwseq=l_stcwseq   
                 # 
                 # IF g_today<l_stcw004 AND NOT cl_null(l_stcw004) THEN
                 #    INITIALIZE g_errparam TO NULL
                 #    LET g_errparam.code = "ast-00115"
                 #    LET g_errparam.extend = g_stbt_m.stbt001
                 #    LET g_errparam.popup = TRUE
                 #    CALL cl_err()
                 # 
                 #    LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001
                 #    NEXT FIELD CURRENT
                 # END IF                       

                  CALL astt640_stbt001_ref()
               END IF
            END IF 
            LET g_stbt_m_o.* = g_stbt_m.*     #160824-00007#201 Add By Ken 161117                     
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt001
            #add-point:ON CHANGE stbt001 name="input.g.stbt001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt002
            
            #add-point:AFTER FIELD stbt002 name="input.a.stbt002"
            IF  NOT cl_null(g_stbt_m.stbt002) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbt002 != g_stbt_m_t.stbt002 )) THEN   #160824-00007#201 Mark By Ken 161117
               #IF (g_stbt_m.stbt002 != g_stbt_m_o.stbt002 ) THEN    #160824-00007#201 Add By Ken 161117   #170214-00051#1 Mark By Ken 170214
               IF (g_stbt_m.stbt002 != g_stbt_m_o.stbt002 ) OR g_stbt_m_o.stbt002 IS NULL THEN    #170214-00051#1 Add By Ken 170214
                  INITIALIZE g_chkparam.* TO NULL		      
                      #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stbt_m.stbt002            
                  #160318-00025#46  2016/04/28  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "apm-00638:sub-01302|adbm200|",cl_get_progname("adbm200",g_lang,"2"),"|:EXEPROGadbm200"
                  #160318-00025#46  2016/04/28  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_pmaa001_17") THEN
                     #LET g_stbt_m.stbt002 = g_stbt_m_t.stbt002  #160824-00007#201 Mark By Ken 161117
                     LET g_stbt_m.stbt002 = g_stbt_m_o.stbt002   #160824-00007#201 Add By Ken 161117
                     NEXT FIELD CURRENT
                  END IF  

                  #經銷商帶出合同
                  IF cl_null(g_stbt_m.stbt001) THEN
                     SELECT MIN(stce001) INTO g_stbt_m.stbt001
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce009=g_stbt_m.stbt002                        
                        AND stce008='1'
                        AND stcestus<>'N'
                        #AND stcestus='Y' 
                        #AND stce017<=g_today
                        #AND stce018>=g_today  
                        
                      #是否存此合約在未確認的結算單
                      LET l_count=0 
                      SELECT COUNT(*) INTO l_count
                        FROM stbt_t
                       WHERE stbtent=g_enterprise
                         AND stbt001=g_stbt_m.stbt001
                         AND stbtstus='N'
                      IF NOT cl_null(l_count) AND l_count>0 THEN
                         INITIALIZE g_errparam TO NULL
                         LET g_errparam.code = "ast-00092"
                         LET g_errparam.extend = g_stbt_m.stbt001
                         LET g_errparam.popup = TRUE
                         CALL cl_err()

                         #LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001  #160824-00007#201 Mark By Ken 161117                         
                         #LET g_stbt_m.stbt002 = g_stbt_m_t.stbt002  #160824-00007#201 Mark By Ken 161117
                         LET g_stbt_m.stbt001 = g_stbt_m_o.stbt001   #160824-00007#201 Add By Ken 161117                         
                         LET g_stbt_m.stbt002 = g_stbt_m_o.stbt002   #160824-00007#201 Add By Ken 161117                         
                         NEXT FIELD CURRENT
                      END IF 
                      
                     # #合約結算賬期的結算日判斷,g_today>=結算日
                     # LET l_stcwseq=''
                     # SELECT MIN(stcwseq) INTO l_stcwseq
                     #   FROM stcw_t
                     #  WHERE stcwent=g_enterprise
                     #    AND stcw001=g_stbt_m.stbt001
                     #    AND stcw005='N'
                     #    
                     # LET l_stcw004=''   
                     # SELECT stcw004 INTO l_stcw004
                     #   FROM stcw_t
                     #  WHERE stcwent=g_enterprise
                     #    AND stcw001=g_stbt_m.stbt001
                     #    AND stcw005='N'
                     #    AND stcwseq=l_stcwseq   
                     # 
                     # IF g_today<l_stcw004 AND NOT cl_null(l_stcw004) THEN
                     #    INITIALIZE g_errparam TO NULL
                     #    LET g_errparam.code = "ast-00115"
                     #    LET g_errparam.extend = g_stbt_m.stbt001
                     #    LET g_errparam.popup = TRUE
                     #    CALL cl_err()
                     #
                     #    LET g_stbt_m.stbt001 = g_stbt_m_t.stbt001
                     #    LET g_stbt_m.stbt002 = g_stbt_m_t.stbt002
                     #    NEXT FIELD CURRENT
                     # END IF   
                  
                     CALL astt640_stbt001_ref()             
                  END IF                        

                  #分銷合約檢查--根據合約編號、經銷商經營方式
                  IF NOT astt640_stce001_check() THEN
                      #LET g_stbt_m.stbt002 = g_stbt_m_t.stbt002  #160824-00007#201 Mark By Ken 161117
                      LET g_stbt_m.stbt002 = g_stbt_m_o.stbt002   #160824-00007#201 Add By Ken 161117
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00048"
                      LET g_errparam.extend = g_stbt_m.stbt002
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      NEXT FIELD CURRENT
                  END IF 

               END IF
            END IF  

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt002_desc
            LET g_stbt_m_o.* = g_stbt_m.*  #160824-00007#201 Add By Ken 161117

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt002
            #add-point:BEFORE FIELD stbt002 name="input.b.stbt002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt002
            #add-point:ON CHANGE stbt002 name="input.g.stbt002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt003
            #add-point:BEFORE FIELD stbt003 name="input.b.stbt003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt003
            
            #add-point:AFTER FIELD stbt003 name="input.a.stbt003"
            IF  NOT cl_null(g_stbt_m.stbt003) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbt_m.stbt003 != g_stbt_m_t.stbt003 )) THEN     #160824-00007#201 Mark By Ken 161117 
               #IF (g_stbt_m.stbt003 != g_stbt_m_o.stbt003 ) THEN    #160824-00007#201 Add By Ken 161117    #170214-00051#1 Mark BY Ken 170214
               IF (g_stbt_m.stbt003 != g_stbt_m_o.stbt003 ) OR g_stbt_m_o.stbt003 IS NULL THEN    #170214-00051#1 Add By ken 170214
                  #分銷合約檢查--根據合約編號、經銷商經營方式
                  IF NOT astt640_stce001_check() THEN
                      #LET g_stbt_m.stbt003 = g_stbt_m_t.stbt003  #160824-00007#201 Mark By Ken 161117
                      LET g_stbt_m.stbt003 = g_stbt_m_o.stbt003   #160824-00007#201 Add By Ken 161117
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00048"
                      LET g_errparam.extend = g_stbt_m.stbt003
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      NEXT FIELD CURRENT
                  END IF 

               END IF
            END IF 
            LET g_stbt_m_o.* = g_stbt_m.*   #160824-00007#201 Add By Ken 161117
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt003
            #add-point:ON CHANGE stbt003 name="input.g.stbt003"
            #分銷合約檢查--根據合約編號、經銷商經營方式
            IF NOT astt640_stce001_check() THEN
                LET g_stbt_m.stbt003 = g_stbt_m_t.stbt003 
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = "ast-00048"
                LET g_errparam.extend = g_stbt_m.stbt003
                LET g_errparam.popup = TRUE
                CALL cl_err()

                NEXT FIELD CURRENT
            END IF 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt007
            #add-point:BEFORE FIELD stbt007 name="input.b.stbt007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt007
            
            #add-point:AFTER FIELD stbt007 name="input.a.stbt007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt007
            #add-point:ON CHANGE stbt007 name="input.g.stbt007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcw004
            #add-point:BEFORE FIELD stcw004 name="input.b.stcw004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcw004
            
            #add-point:AFTER FIELD stcw004 name="input.a.stcw004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcw004
            #add-point:ON CHANGE stcw004 name="input.g.stcw004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt008
            #add-point:BEFORE FIELD stbt008 name="input.b.stbt008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt008
            
            #add-point:AFTER FIELD stbt008 name="input.a.stbt008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt008
            #add-point:ON CHANGE stbt008 name="input.g.stbt008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt009
            #add-point:BEFORE FIELD stbt009 name="input.b.stbt009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt009
            
            #add-point:AFTER FIELD stbt009 name="input.a.stbt009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt009
            #add-point:ON CHANGE stbt009 name="input.g.stbt009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbtstus
            #add-point:BEFORE FIELD stbtstus name="input.b.stbtstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbtstus
            
            #add-point:AFTER FIELD stbtstus name="input.a.stbtstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbtstus
            #add-point:ON CHANGE stbtstus name="input.g.stbtstus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt010
            #add-point:BEFORE FIELD stbt010 name="input.b.stbt010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt010
            
            #add-point:AFTER FIELD stbt010 name="input.a.stbt010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt010
            #add-point:ON CHANGE stbt010 name="input.g.stbt010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt011
            #add-point:BEFORE FIELD stbt011 name="input.b.stbt011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt011
            
            #add-point:AFTER FIELD stbt011 name="input.a.stbt011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt011
            #add-point:ON CHANGE stbt011 name="input.g.stbt011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt012
            #add-point:BEFORE FIELD stbt012 name="input.b.stbt012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt012
            
            #add-point:AFTER FIELD stbt012 name="input.a.stbt012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt012
            #add-point:ON CHANGE stbt012 name="input.g.stbt012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt013
            #add-point:BEFORE FIELD stbt013 name="input.b.stbt013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt013
            
            #add-point:AFTER FIELD stbt013 name="input.a.stbt013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt013
            #add-point:ON CHANGE stbt013 name="input.g.stbt013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt014
            #add-point:BEFORE FIELD stbt014 name="input.b.stbt014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt014
            
            #add-point:AFTER FIELD stbt014 name="input.a.stbt014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt014
            #add-point:ON CHANGE stbt014 name="input.g.stbt014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt015
            #add-point:BEFORE FIELD stbt015 name="input.b.stbt015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt015
            
            #add-point:AFTER FIELD stbt015 name="input.a.stbt015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt015
            #add-point:ON CHANGE stbt015 name="input.g.stbt015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt016
            #add-point:BEFORE FIELD stbt016 name="input.b.stbt016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt016
            
            #add-point:AFTER FIELD stbt016 name="input.a.stbt016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt016
            #add-point:ON CHANGE stbt016 name="input.g.stbt016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt017
            #add-point:BEFORE FIELD stbt017 name="input.b.stbt017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt017
            
            #add-point:AFTER FIELD stbt017 name="input.a.stbt017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt017
            #add-point:ON CHANGE stbt017 name="input.g.stbt017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt018
            #add-point:BEFORE FIELD stbt018 name="input.b.stbt018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt018
            
            #add-point:AFTER FIELD stbt018 name="input.a.stbt018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt018
            #add-point:ON CHANGE stbt018 name="input.g.stbt018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt019
            #add-point:BEFORE FIELD stbt019 name="input.b.stbt019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt019
            
            #add-point:AFTER FIELD stbt019 name="input.a.stbt019"

            #應結算金額
            SELECT ooef016 INTO l_ooef016
              FROM ooef_t
             WHERE ooefent=g_enterprise
               AND ooef001=g_stbt_m.stbtsite             
            IF g_stbt_m.stbt019=='Y' THEN           
               LET g_stbt_m.stbt020=g_stbt_m.stbt016-g_stbt_m.stbt017-g_stbt_m.stbt018
            ELSE
               LET g_stbt_m.stbt020=g_stbt_m.stbt016-g_stbt_m.stbt017
            END IF
            IF cl_null(g_stbt_m.stbt020) THEN 
               LET g_stbt_m.stbt020=0
            END IF    
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt020,'2') RETURNING g_stbt_m.stbt020            
            
            #實際結算金額
            IF g_stbt_m.stbt019='Y'  THEN 
               SELECT SUM(stbu016*stbu011*stbu027) INTO g_stbt_m.stbt021
                 FROM stbu_t
                WHERE stbuent=g_enterprise
                  AND stbudocno=g_stbt_m.stbtdocno   
                           
            ELSE
               SELECT SUM(stbu016*stbu011*stbu027) INTO g_stbt_m.stbt021
                 FROM stbu_t
                WHERE stbuent=g_enterprise
                  AND stbudocno=g_stbt_m.stbtdocno
                  AND NOT (stbu001='3' AND stbu010='2')
            END IF
            IF cl_null(g_stbt_m.stbt021) THEN 
               LET g_stbt_m.stbt021=0
            END IF  
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt021,'2') RETURNING g_stbt_m.stbt021
            
            #本期結存金額
            LET g_stbt_m.stbt022=g_stbt_m.stbt020-g_stbt_m.stbt021
            IF cl_null(g_stbt_m.stbt022) THEN 
               LET g_stbt_m.stbt022=0
            END IF          
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt022,'2') RETURNING g_stbt_m.stbt022
            DISPLAY BY NAME g_stbt_m.stbt020   
            DISPLAY BY NAME g_stbt_m.stbt021
            DISPLAY BY NAME g_stbt_m.stbt022            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt019
            #add-point:ON CHANGE stbt019 name="input.g.stbt019"
            #應結算金額
            SELECT ooef016 INTO l_ooef016
              FROM ooef_t
             WHERE ooefent=g_enterprise
               AND ooef001=g_stbt_m.stbtsite             
            IF g_stbt_m.stbt019=='Y' THEN           
               LET g_stbt_m.stbt020=g_stbt_m.stbt016-g_stbt_m.stbt017-g_stbt_m.stbt018
            ELSE
               LET g_stbt_m.stbt020=g_stbt_m.stbt016-g_stbt_m.stbt017
            END IF
            IF cl_null(g_stbt_m.stbt020) THEN 
               LET g_stbt_m.stbt020=0
            END IF    
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt020,'2') RETURNING g_stbt_m.stbt020            
            
            #實際結算金額
            IF g_stbt_m.stbt019='Y'  THEN 
               SELECT SUM(stbu016*stbu011*stbu027) INTO g_stbt_m.stbt021
                 FROM stbu_t
                WHERE stbuent=g_enterprise
                  AND stbudocno=g_stbt_m.stbtdocno   
                           
            ELSE
               SELECT SUM(stbu016*stbu011*stbu027) INTO g_stbt_m.stbt021
                 FROM stbu_t
                WHERE stbuent=g_enterprise
                  AND stbudocno=g_stbt_m.stbtdocno
                  AND NOT (stbu001='3' AND stbu010='2')
            END IF
            IF cl_null(g_stbt_m.stbt021) THEN 
               LET g_stbt_m.stbt021=0
            END IF  
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt021,'2') RETURNING g_stbt_m.stbt021
            
            #本期結存金額
            LET g_stbt_m.stbt022=g_stbt_m.stbt020-g_stbt_m.stbt021
            IF cl_null(g_stbt_m.stbt022) THEN 
               LET g_stbt_m.stbt022=0
            END IF          
            CALL s_curr_round(g_stbt_m.stbtsite,l_ooef016,g_stbt_m.stbt022,'2') RETURNING g_stbt_m.stbt022
            DISPLAY BY NAME g_stbt_m.stbt020   
            DISPLAY BY NAME g_stbt_m.stbt021
            DISPLAY BY NAME g_stbt_m.stbt022             
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt020
            #add-point:BEFORE FIELD stbt020 name="input.b.stbt020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt020
            
            #add-point:AFTER FIELD stbt020 name="input.a.stbt020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt020
            #add-point:ON CHANGE stbt020 name="input.g.stbt020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt021
            #add-point:BEFORE FIELD stbt021 name="input.b.stbt021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt021
            
            #add-point:AFTER FIELD stbt021 name="input.a.stbt021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt021
            #add-point:ON CHANGE stbt021 name="input.g.stbt021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt022
            #add-point:BEFORE FIELD stbt022 name="input.b.stbt022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt022
            
            #add-point:AFTER FIELD stbt022 name="input.a.stbt022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt022
            #add-point:ON CHANGE stbt022 name="input.g.stbt022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt023
            #add-point:BEFORE FIELD stbt023 name="input.b.stbt023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt023
            
            #add-point:AFTER FIELD stbt023 name="input.a.stbt023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt023
            #add-point:ON CHANGE stbt023 name="input.g.stbt023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt004
            
            #add-point:AFTER FIELD stbt004 name="input.a.stbt004"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt004
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt004
            #add-point:BEFORE FIELD stbt004 name="input.b.stbt004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt004
            #add-point:ON CHANGE stbt004 name="input.g.stbt004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt005
            
            #add-point:AFTER FIELD stbt005 name="input.a.stbt005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt005
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt005
            #add-point:BEFORE FIELD stbt005 name="input.b.stbt005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt005
            #add-point:ON CHANGE stbt005 name="input.g.stbt005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt006
            #add-point:BEFORE FIELD stbt006 name="input.b.stbt006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt006
            
            #add-point:AFTER FIELD stbt006 name="input.a.stbt006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt006
            #add-point:ON CHANGE stbt006 name="input.g.stbt006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt024
            
            #add-point:AFTER FIELD stbt024 name="input.a.stbt024"
            IF NOT cl_null(g_stbt_m.stbt024) THEN
               SELECT ooagstus INTO l_ooagstus FROM ooag_t
                WHERE ooagent = g_enterprise AND ooag001 = g_stbt_m.stbt024
               
               IF status = 100 OR cl_null(l_ooagstus) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aoo-00074'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  
                  LET g_stbt_m.stbt024=g_stbt_m_t.stbt024
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stbt_m.stbt024
                  CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
                  LET g_stbt_m.stbt024_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_stbt_m.stbt024_desc                  
                  NEXT FIELD CURRENT
               ELSE
                  IF l_ooagstus = 'N' THEN
                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = 'aoo-00071'      #160318-00005#45  mark
                     LET g_errparam.code = 'sub-01302'      #160318-00005#45  add
                     LET g_errparam.extend = ''
                     #160318-00005#45 --s add
                     LET g_errparam.replace[1] = 'aooi130'
                     LET g_errparam.replace[2] = cl_get_progname('aooi130',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi130'
                     #160318-00005#45 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
               
                     LET g_stbt_m.stbt024=g_stbt_m_t.stbt024
                     INITIALIZE g_ref_fields TO NULL
                     LET g_ref_fields[1] = g_stbt_m.stbt024
                     CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
                     LET g_stbt_m.stbt024_desc = '', g_rtn_fields[1] , ''
                     DISPLAY BY NAME g_stbt_m.stbt024_desc                        
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt024
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt024_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt024_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt024
            #add-point:BEFORE FIELD stbt024 name="input.b.stbt024"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt024
            #add-point:ON CHANGE stbt024 name="input.g.stbt024"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt025
            
            #add-point:AFTER FIELD stbt025 name="input.a.stbt025"
            IF NOT cl_null(g_stbt_m.stbt025) THEN

               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbt_m.stbt025
               LET g_chkparam.arg2 = g_today
               #160318-00025#46  2016/04/28  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
               #160318-00025#46  2016/04/28  by pengxin  add(E)
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooeg001") THEN
                  LET g_stbt_m.stbt025 = g_stbt_m_t.stbt025
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stbt_m.stbt025
                  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_stbt_m.stbt025_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_stbt_m.stbt025_desc                  
                  NEXT FIELD CURRENT
               END IF

            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt025
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt025_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt025_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt025
            #add-point:BEFORE FIELD stbt025 name="input.b.stbt025"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt025
            #add-point:ON CHANGE stbt025 name="input.g.stbt025"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt026
            
            #add-point:AFTER FIELD stbt026 name="input.a.stbt026"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt026
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt026_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt026_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt026
            #add-point:BEFORE FIELD stbt026 name="input.b.stbt026"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt026
            #add-point:ON CHANGE stbt026 name="input.g.stbt026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt027
            #add-point:BEFORE FIELD stbt027 name="input.b.stbt027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt027
            
            #add-point:AFTER FIELD stbt027 name="input.a.stbt027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt027
            #add-point:ON CHANGE stbt027 name="input.g.stbt027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt028
            #add-point:BEFORE FIELD stbt028 name="input.b.stbt028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt028
            
            #add-point:AFTER FIELD stbt028 name="input.a.stbt028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt028
            #add-point:ON CHANGE stbt028 name="input.g.stbt028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbt029
            #add-point:BEFORE FIELD stbt029 name="input.b.stbt029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbt029
            
            #add-point:AFTER FIELD stbt029 name="input.a.stbt029"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbt029
            #add-point:ON CHANGE stbt029 name="input.g.stbt029"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stbtsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtsite
            #add-point:ON ACTION controlp INFIELD stbtsite name="input.c.stbtsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbtsite             #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbtsite',g_stbt_m.stbtsite,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()
           
#            CALL q_ooef001_23()                                #呼叫開窗

            LET g_stbt_m.stbtsite = g_qryparam.return1              

            DISPLAY g_stbt_m.stbtsite TO stbtsite              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbtsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbtsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbtsite_desc
            
            NEXT FIELD stbtsite                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stbtdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtdocdt
            #add-point:ON ACTION controlp INFIELD stbtdocdt name="input.c.stbtdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbtdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtdocno
            #add-point:ON ACTION controlp INFIELD stbtdocno name="input.c.stbtdocno"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbtdocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_stbt_m.stbtsite AND ooefent  = g_enterprise
                        
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stbt_m.stbtdocno = g_qryparam.return1              

            DISPLAY g_stbt_m.stbtdocno TO stbtdocno              #

            NEXT FIELD stbtdocno                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stbt001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt001
            #add-point:ON ACTION controlp INFIELD stbt001 name="input.c.stbt001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbt001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stce001_5()                                #呼叫開窗

            LET g_stbt_m.stbt001 = g_qryparam.return1              

            DISPLAY g_stbt_m.stbt001 TO stbt001              #

            NEXT FIELD stbt001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbt002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt002
            #add-point:ON ACTION controlp INFIELD stbt002 name="input.c.stbt002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbt002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stbt_m.stbt002 = g_qryparam.return1              

            DISPLAY g_stbt_m.stbt002 TO stbt002              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt002_desc
            NEXT FIELD stbt002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbt003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt003
            #add-point:ON ACTION controlp INFIELD stbt003 name="input.c.stbt003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt007
            #add-point:ON ACTION controlp INFIELD stbt007 name="input.c.stbt007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcw004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcw004
            #add-point:ON ACTION controlp INFIELD stcw004 name="input.c.stcw004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt008
            #add-point:ON ACTION controlp INFIELD stbt008 name="input.c.stbt008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt009
            #add-point:ON ACTION controlp INFIELD stbt009 name="input.c.stbt009"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbtstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbtstus
            #add-point:ON ACTION controlp INFIELD stbtstus name="input.c.stbtstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt010
            #add-point:ON ACTION controlp INFIELD stbt010 name="input.c.stbt010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt011
            #add-point:ON ACTION controlp INFIELD stbt011 name="input.c.stbt011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt012
            #add-point:ON ACTION controlp INFIELD stbt012 name="input.c.stbt012"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt013
            #add-point:ON ACTION controlp INFIELD stbt013 name="input.c.stbt013"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt014
            #add-point:ON ACTION controlp INFIELD stbt014 name="input.c.stbt014"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt015
            #add-point:ON ACTION controlp INFIELD stbt015 name="input.c.stbt015"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt016
            #add-point:ON ACTION controlp INFIELD stbt016 name="input.c.stbt016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt017
            #add-point:ON ACTION controlp INFIELD stbt017 name="input.c.stbt017"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt018
            #add-point:ON ACTION controlp INFIELD stbt018 name="input.c.stbt018"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt019
            #add-point:ON ACTION controlp INFIELD stbt019 name="input.c.stbt019"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt020
            #add-point:ON ACTION controlp INFIELD stbt020 name="input.c.stbt020"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt021
            #add-point:ON ACTION controlp INFIELD stbt021 name="input.c.stbt021"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt022
            #add-point:ON ACTION controlp INFIELD stbt022 name="input.c.stbt022"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt023
            #add-point:ON ACTION controlp INFIELD stbt023 name="input.c.stbt023"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt004
            #add-point:ON ACTION controlp INFIELD stbt004 name="input.c.stbt004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt005
            #add-point:ON ACTION controlp INFIELD stbt005 name="input.c.stbt005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt006
            #add-point:ON ACTION controlp INFIELD stbt006 name="input.c.stbt006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt024
            #add-point:ON ACTION controlp INFIELD stbt024 name="input.c.stbt024"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbt024             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stbt_m.stbt024 = g_qryparam.return1              

            DISPLAY g_stbt_m.stbt024 TO stbt024              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt024
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt024_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt024_desc
            NEXT FIELD stbt024                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbt025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt025
            #add-point:ON ACTION controlp INFIELD stbt025 name="input.c.stbt025"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbt_m.stbt025             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today #

            
            CALL q_ooeg001_4()                                #呼叫開窗

            LET g_stbt_m.stbt025 = g_qryparam.return1              

            DISPLAY g_stbt_m.stbt025 TO stbt025              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbt_m.stbt025
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbt_m.stbt025_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbt_m.stbt025_desc
            NEXT FIELD stbt025                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbt026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt026
            #add-point:ON ACTION controlp INFIELD stbt026 name="input.c.stbt026"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt027
            #add-point:ON ACTION controlp INFIELD stbt027 name="input.c.stbt027"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt028
            #add-point:ON ACTION controlp INFIELD stbt028 name="input.c.stbt028"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbt029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbt029
            #add-point:ON ACTION controlp INFIELD stbt029 name="input.c.stbt029"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stbt_m.stbtdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stbt_m.stbtsite,g_stbt_m.stbtdocno,g_stbt_m.stbtdocdt,g_prog) RETURNING l_success,g_stbt_m.stbtdocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stbt_m.stbtdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG                  
               END IF 
               #end add-point
               
               INSERT INTO stbt_t (stbtent,stbtsite,stbtdocdt,stbtdocno,stbt001,stbt002,stbt003,stbt007, 
                   stbt008,stbt009,stbtstus,stbtownid,stbtowndp,stbtcrtid,stbtcrtdp,stbtcrtdt,stbtmodid, 
                   stbtmoddt,stbtcnfid,stbtcnfdt,stbt010,stbt011,stbt012,stbt013,stbt014,stbt015,stbt016, 
                   stbt017,stbt018,stbt019,stbt020,stbt021,stbt022,stbt023,stbt004,stbt005,stbt006,stbt024, 
                   stbt025,stbt026,stbt027,stbt028,stbt029)
               VALUES (g_enterprise,g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
                   g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008,g_stbt_m.stbt009, 
                   g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
                   g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
                   g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014, 
                   g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019, 
                   g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004, 
                   g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024,g_stbt_m.stbt025,g_stbt_m.stbt026, 
                   g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stbt_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               #新增單頭后，自動帶出單身
               IF l_cmd_t <>'r' AND p_cmd = 'a' THEN
                  CALL s_astp640_insert_stbu(g_stbt_m.stbtdocno) RETURNING l_success                                    
                  #CALL astt640_stbu_insert() RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG                  
                  END IF   
                  CALL s_astp640_stbu_count(g_stbt_m.stbtdocno) RETURNING l_success   
                  DISPLAY BY NAME g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
                      g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                      g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023                 
               END IF
 
               IF p_cmd = 'u' THEN
                  LET l_count=0
                  SELECT count(*) INTO l_count
                    FROM stbu_t
                   WHERE stbuent=g_enterprise
                     AND stbudocno=g_stbt_m.stbtdocno
                  IF cl_null(l_count) OR l_count=0 THEN
                     CALL s_astp640_insert_stbu(g_stbt_m.stbtdocno) RETURNING l_success                      
                     IF NOT l_success THEN
                        CALL s_transaction_end('N','0')
                        CONTINUE DIALOG                  
                     END IF  
                  END IF
                  CALL s_astp640_stbu_count(g_stbt_m.stbtdocno) RETURNING l_success   
                  DISPLAY BY NAME g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
                      g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                      g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023                  
               END IF               
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               #161024-00025#5 -s by 08172
               UPDATE stbt_t
                  SET stbtunit = g_stbt_m.stbtsite
                WHERE stbtent = g_enterprise
                  AND stbtdocno = g_stbt_m.stbtdocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "upd stbt_t" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               #161024-00025#5 -e by 08172
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt640_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt640_b_fill()
                  CALL astt640_b_fill2('0')
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
               CALL astt640_stbt_t_mask_restore('restore_mask_o')
               
               UPDATE stbt_t SET (stbtsite,stbtdocdt,stbtdocno,stbt001,stbt002,stbt003,stbt007,stbt008, 
                   stbt009,stbtstus,stbtownid,stbtowndp,stbtcrtid,stbtcrtdp,stbtcrtdt,stbtmodid,stbtmoddt, 
                   stbtcnfid,stbtcnfdt,stbt010,stbt011,stbt012,stbt013,stbt014,stbt015,stbt016,stbt017, 
                   stbt018,stbt019,stbt020,stbt021,stbt022,stbt023,stbt004,stbt005,stbt006,stbt024,stbt025, 
                   stbt026,stbt027,stbt028,stbt029) = (g_stbt_m.stbtsite,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno, 
                   g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
                   g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid, 
                   g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
                   g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013, 
                   g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                   g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023, 
                   g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024,g_stbt_m.stbt025, 
                   g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029)
                WHERE stbtent = g_enterprise AND stbtdocno = g_stbtdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stbt_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               CALL s_astp640_stbu_count(g_stbt_m.stbtdocno) RETURNING l_success
               DISPLAY BY NAME g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
                   g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                   g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023                
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt640_stbt_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stbt_m_t)
               LET g_log2 = util.JSON.stringify(g_stbt_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt640.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbu_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            SELECT stbt010,stbt011,stbt012,stbt013,stbt014,stbt015,
                   stbt016,stbt017,stbt018,stbt019,stbt020,stbt021,
                   stbt022
               INTO g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,
                    g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,
                    g_stbt_m.stbt022
              FROM stbt_t
             WHERE stbtent=g_enterprise
               AND stbtdocno=g_stbt_m.stbtdocno
            DISPLAY BY NAME g_stbt_m.stbt010
            DISPLAY BY NAME g_stbt_m.stbt011
            DISPLAY BY NAME g_stbt_m.stbt012
            DISPLAY BY NAME g_stbt_m.stbt013
            DISPLAY BY NAME g_stbt_m.stbt014
            DISPLAY BY NAME g_stbt_m.stbt015
            DISPLAY BY NAME g_stbt_m.stbt016
            DISPLAY BY NAME g_stbt_m.stbt017
            DISPLAY BY NAME g_stbt_m.stbt018
            DISPLAY BY NAME g_stbt_m.stbt019
            DISPLAY BY NAME g_stbt_m.stbt020   
            DISPLAY BY NAME g_stbt_m.stbt021
            DISPLAY BY NAME g_stbt_m.stbt022                  
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbu_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt640_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stbu_d.getLength()
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
            OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt640_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt640_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbu_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbu_d[l_ac].stbuseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbu_d_t.* = g_stbu_d[l_ac].*  #BACKUP
               LET g_stbu_d_o.* = g_stbu_d[l_ac].*  #BACKUP
               CALL astt640_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt640_set_no_entry_b(l_cmd)
               IF NOT astt640_lock_b("stbu_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt640_bcl INTO g_stbu_d[l_ac].stbuseq,g_stbu_d[l_ac].stbu001,g_stbu_d[l_ac].stbu002, 
                      g_stbu_d[l_ac].stbu003,g_stbu_d[l_ac].stbu004,g_stbu_d[l_ac].stbu005,g_stbu_d[l_ac].stbu006, 
                      g_stbu_d[l_ac].stbu007,g_stbu_d[l_ac].stbu008,g_stbu_d[l_ac].stbu009,g_stbu_d[l_ac].stbu010, 
                      g_stbu_d[l_ac].stbu011,g_stbu_d[l_ac].stbu012,g_stbu_d[l_ac].stbu013,g_stbu_d[l_ac].stbu014, 
                      g_stbu_d[l_ac].stbu015,g_stbu_d[l_ac].stbu016,g_stbu_d[l_ac].stbu017,g_stbu_d[l_ac].stbu018, 
                      g_stbu_d[l_ac].stbusite,g_stbu_d[l_ac].stbu020,g_stbu_d[l_ac].stbu019,g_stbu_d[l_ac].stbu021, 
                      g_stbu_d[l_ac].stbu022,g_stbu_d[l_ac].stbu023,g_stbu_d[l_ac].stbu024,g_stbu_d[l_ac].stbu025, 
                      g_stbu_d[l_ac].stbu026,g_stbu_d[l_ac].stbu027,g_stbu_d[l_ac].stbucomp
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbu_d_t.stbuseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbu_d_mask_o[l_ac].* =  g_stbu_d[l_ac].*
                  CALL astt640_stbu_t_mask()
                  LET g_stbu_d_mask_n[l_ac].* =  g_stbu_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt640_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            
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
            INITIALIZE g_stbu_d[l_ac].* TO NULL 
            INITIALIZE g_stbu_d_t.* TO NULL 
            INITIALIZE g_stbu_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stbu_d[l_ac].stbu012 = "0"
      LET g_stbu_d[l_ac].stbu013 = "0"
      LET g_stbu_d[l_ac].stbu014 = "0"
      LET g_stbu_d[l_ac].stbu015 = "0"
      LET g_stbu_d[l_ac].stbu016 = "0"
      LET g_stbu_d[l_ac].stbu024 = "0"
      LET g_stbu_d[l_ac].stbu025 = "0"
      LET g_stbu_d[l_ac].stbu026 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stbu_d_t.* = g_stbu_d[l_ac].*     #新輸入資料
            LET g_stbu_d_o.* = g_stbu_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt640_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt640_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbu_d[li_reproduce_target].* = g_stbu_d[li_reproduce].*
 
               LET g_stbu_d[li_reproduce_target].stbuseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stbu_t 
             WHERE stbuent = g_enterprise AND stbudocno = g_stbt_m.stbtdocno
 
               AND stbuseq = g_stbu_d[l_ac].stbuseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbt_m.stbtdocno
               LET gs_keys[2] = g_stbu_d[g_detail_idx].stbuseq
               CALL astt640_insert_b('stbu_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stbu_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt640_b_fill()
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
               LET gs_keys[01] = g_stbt_m.stbtdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbu_d_t.stbuseq
 
            
               #刪除同層單身
               IF NOT astt640_delete_b('stbu_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt640_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt640_key_delete_b(gs_keys,'stbu_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt640_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt640_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stbu_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbu_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbuseq
            #add-point:BEFORE FIELD stbuseq name="input.b.page1.stbuseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbuseq
            
            #add-point:AFTER FIELD stbuseq name="input.a.page1.stbuseq"
            #此段落由子樣板a05產生
            IF  g_stbt_m.stbtdocno IS NOT NULL AND g_stbu_d[g_detail_idx].stbuseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbt_m.stbtdocno != g_stbtdocno_t OR g_stbu_d[g_detail_idx].stbuseq != g_stbu_d_t.stbuseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbu_t WHERE "||"stbuent = '" ||g_enterprise|| "' AND "||"stbudocno = '"||g_stbt_m.stbtdocno ||"' AND "|| "stbuseq = '"||g_stbu_d[g_detail_idx].stbuseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbuseq
            #add-point:ON CHANGE stbuseq name="input.g.page1.stbuseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu001
            #add-point:BEFORE FIELD stbu001 name="input.b.page1.stbu001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu001
            
            #add-point:AFTER FIELD stbu001 name="input.a.page1.stbu001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu001
            #add-point:ON CHANGE stbu001 name="input.g.page1.stbu001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu002
            #add-point:BEFORE FIELD stbu002 name="input.b.page1.stbu002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu002
            
            #add-point:AFTER FIELD stbu002 name="input.a.page1.stbu002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu002
            #add-point:ON CHANGE stbu002 name="input.g.page1.stbu002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu003
            #add-point:BEFORE FIELD stbu003 name="input.b.page1.stbu003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu003
            
            #add-point:AFTER FIELD stbu003 name="input.a.page1.stbu003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu003
            #add-point:ON CHANGE stbu003 name="input.g.page1.stbu003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu004
            #add-point:BEFORE FIELD stbu004 name="input.b.page1.stbu004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu004
            
            #add-point:AFTER FIELD stbu004 name="input.a.page1.stbu004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu004
            #add-point:ON CHANGE stbu004 name="input.g.page1.stbu004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu005
            
            #add-point:AFTER FIELD stbu005 name="input.a.page1.stbu005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu005
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu005
            #add-point:BEFORE FIELD stbu005 name="input.b.page1.stbu005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu005
            #add-point:ON CHANGE stbu005 name="input.g.page1.stbu005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stae003
            
            #add-point:AFTER FIELD stae003 name="input.a.page1.stae003"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stae003
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2058' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stae003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stae003
            #add-point:BEFORE FIELD stae003 name="input.b.page1.stae003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stae003
            #add-point:ON CHANGE stae003 name="input.g.page1.stae003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu006
            #add-point:BEFORE FIELD stbu006 name="input.b.page1.stbu006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu006
            
            #add-point:AFTER FIELD stbu006 name="input.a.page1.stbu006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu006
            #add-point:ON CHANGE stbu006 name="input.g.page1.stbu006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu007
            #add-point:BEFORE FIELD stbu007 name="input.b.page1.stbu007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu007
            
            #add-point:AFTER FIELD stbu007 name="input.a.page1.stbu007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu007
            #add-point:ON CHANGE stbu007 name="input.g.page1.stbu007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu008
            
            #add-point:AFTER FIELD stbu008 name="input.a.page1.stbu008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu008
            #add-point:BEFORE FIELD stbu008 name="input.b.page1.stbu008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu008
            #add-point:ON CHANGE stbu008 name="input.g.page1.stbu008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu009
            
            #add-point:AFTER FIELD stbu009 name="input.a.page1.stbu009"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu009_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu009
            #add-point:BEFORE FIELD stbu009 name="input.b.page1.stbu009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu009
            #add-point:ON CHANGE stbu009 name="input.g.page1.stbu009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu010
            #add-point:BEFORE FIELD stbu010 name="input.b.page1.stbu010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu010
            
            #add-point:AFTER FIELD stbu010 name="input.a.page1.stbu010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu010
            #add-point:ON CHANGE stbu010 name="input.g.page1.stbu010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu011
            #add-point:BEFORE FIELD stbu011 name="input.b.page1.stbu011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu011
            
            #add-point:AFTER FIELD stbu011 name="input.a.page1.stbu011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu011
            #add-point:ON CHANGE stbu011 name="input.g.page1.stbu011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu012
            #add-point:BEFORE FIELD stbu012 name="input.b.page1.stbu012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu012
            
            #add-point:AFTER FIELD stbu012 name="input.a.page1.stbu012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu012
            #add-point:ON CHANGE stbu012 name="input.g.page1.stbu012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu013
            #add-point:BEFORE FIELD stbu013 name="input.b.page1.stbu013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu013
            
            #add-point:AFTER FIELD stbu013 name="input.a.page1.stbu013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu013
            #add-point:ON CHANGE stbu013 name="input.g.page1.stbu013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu014
            #add-point:BEFORE FIELD stbu014 name="input.b.page1.stbu014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu014
            
            #add-point:AFTER FIELD stbu014 name="input.a.page1.stbu014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu014
            #add-point:ON CHANGE stbu014 name="input.g.page1.stbu014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu015
            #add-point:BEFORE FIELD stbu015 name="input.b.page1.stbu015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu015
            
            #add-point:AFTER FIELD stbu015 name="input.a.page1.stbu015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu015
            #add-point:ON CHANGE stbu015 name="input.g.page1.stbu015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu016
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbu_d[l_ac].stbu016,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbu016
            END IF 
 
 
 
            #add-point:AFTER FIELD stbu016 name="input.a.page1.stbu016"
            IF NOT cl_null(g_stbu_d[l_ac].stbu016) THEN              
               IF g_stbu_d[l_ac].stbu016>g_stbu_d[l_ac].stbu014 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00042"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stbu_d[l_ac].stbu016=g_stbu_d_t.stbu016
                  NEXT FIELD stbu016
               END IF             
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu016
            #add-point:BEFORE FIELD stbu016 name="input.b.page1.stbu016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu016
            #add-point:ON CHANGE stbu016 name="input.g.page1.stbu016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu017
            
            #add-point:AFTER FIELD stbu017 name="input.a.page1.stbu017"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu017
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu017_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu017
            #add-point:BEFORE FIELD stbu017 name="input.b.page1.stbu017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu017
            #add-point:ON CHANGE stbu017 name="input.g.page1.stbu017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu018
            
            #add-point:AFTER FIELD stbu018 name="input.a.page1.stbu018"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu018
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu018_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu018_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu018
            #add-point:BEFORE FIELD stbu018 name="input.b.page1.stbu018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu018
            #add-point:ON CHANGE stbu018 name="input.g.page1.stbu018"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbusite
            
            #add-point:AFTER FIELD stbusite name="input.a.page1.stbusite"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbusite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbusite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbusite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbusite
            #add-point:BEFORE FIELD stbusite name="input.b.page1.stbusite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbusite
            #add-point:ON CHANGE stbusite name="input.g.page1.stbusite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu020
            #add-point:BEFORE FIELD stbu020 name="input.b.page1.stbu020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu020
            
            #add-point:AFTER FIELD stbu020 name="input.a.page1.stbu020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu020
            #add-point:ON CHANGE stbu020 name="input.g.page1.stbu020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu019
            #add-point:BEFORE FIELD stbu019 name="input.b.page1.stbu019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu019
            
            #add-point:AFTER FIELD stbu019 name="input.a.page1.stbu019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu019
            #add-point:ON CHANGE stbu019 name="input.g.page1.stbu019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu021
            #add-point:BEFORE FIELD stbu021 name="input.b.page1.stbu021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu021
            
            #add-point:AFTER FIELD stbu021 name="input.a.page1.stbu021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu021
            #add-point:ON CHANGE stbu021 name="input.g.page1.stbu021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu022
            #add-point:BEFORE FIELD stbu022 name="input.b.page1.stbu022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu022
            
            #add-point:AFTER FIELD stbu022 name="input.a.page1.stbu022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu022
            #add-point:ON CHANGE stbu022 name="input.g.page1.stbu022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu023
            #add-point:BEFORE FIELD stbu023 name="input.b.page1.stbu023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu023
            
            #add-point:AFTER FIELD stbu023 name="input.a.page1.stbu023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu023
            #add-point:ON CHANGE stbu023 name="input.g.page1.stbu023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu024
            #add-point:BEFORE FIELD stbu024 name="input.b.page1.stbu024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu024
            
            #add-point:AFTER FIELD stbu024 name="input.a.page1.stbu024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu024
            #add-point:ON CHANGE stbu024 name="input.g.page1.stbu024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu025
            #add-point:BEFORE FIELD stbu025 name="input.b.page1.stbu025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu025
            
            #add-point:AFTER FIELD stbu025 name="input.a.page1.stbu025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu025
            #add-point:ON CHANGE stbu025 name="input.g.page1.stbu025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu026
            #add-point:BEFORE FIELD stbu026 name="input.b.page1.stbu026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu026
            
            #add-point:AFTER FIELD stbu026 name="input.a.page1.stbu026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu026
            #add-point:ON CHANGE stbu026 name="input.g.page1.stbu026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbu027
            #add-point:BEFORE FIELD stbu027 name="input.b.page1.stbu027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbu027
            
            #add-point:AFTER FIELD stbu027 name="input.a.page1.stbu027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbu027
            #add-point:ON CHANGE stbu027 name="input.g.page1.stbu027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbucomp
            #add-point:BEFORE FIELD stbucomp name="input.b.page1.stbucomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbucomp
            
            #add-point:AFTER FIELD stbucomp name="input.a.page1.stbucomp"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbucomp
            #add-point:ON CHANGE stbucomp name="input.g.page1.stbucomp"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbuseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbuseq
            #add-point:ON ACTION controlp INFIELD stbuseq name="input.c.page1.stbuseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu001
            #add-point:ON ACTION controlp INFIELD stbu001 name="input.c.page1.stbu001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu002
            #add-point:ON ACTION controlp INFIELD stbu002 name="input.c.page1.stbu002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu003
            #add-point:ON ACTION controlp INFIELD stbu003 name="input.c.page1.stbu003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu004
            #add-point:ON ACTION controlp INFIELD stbu004 name="input.c.page1.stbu004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu005
            #add-point:ON ACTION controlp INFIELD stbu005 name="input.c.page1.stbu005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stae003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stae003
            #add-point:ON ACTION controlp INFIELD stae003 name="input.c.page1.stae003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu006
            #add-point:ON ACTION controlp INFIELD stbu006 name="input.c.page1.stbu006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu007
            #add-point:ON ACTION controlp INFIELD stbu007 name="input.c.page1.stbu007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu008
            #add-point:ON ACTION controlp INFIELD stbu008 name="input.c.page1.stbu008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu009
            #add-point:ON ACTION controlp INFIELD stbu009 name="input.c.page1.stbu009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu010
            #add-point:ON ACTION controlp INFIELD stbu010 name="input.c.page1.stbu010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu011
            #add-point:ON ACTION controlp INFIELD stbu011 name="input.c.page1.stbu011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu012
            #add-point:ON ACTION controlp INFIELD stbu012 name="input.c.page1.stbu012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu013
            #add-point:ON ACTION controlp INFIELD stbu013 name="input.c.page1.stbu013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu014
            #add-point:ON ACTION controlp INFIELD stbu014 name="input.c.page1.stbu014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu015
            #add-point:ON ACTION controlp INFIELD stbu015 name="input.c.page1.stbu015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu016
            #add-point:ON ACTION controlp INFIELD stbu016 name="input.c.page1.stbu016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu017
            #add-point:ON ACTION controlp INFIELD stbu017 name="input.c.page1.stbu017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu018
            #add-point:ON ACTION controlp INFIELD stbu018 name="input.c.page1.stbu018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbusite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbusite
            #add-point:ON ACTION controlp INFIELD stbusite name="input.c.page1.stbusite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu020
            #add-point:ON ACTION controlp INFIELD stbu020 name="input.c.page1.stbu020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu019
            #add-point:ON ACTION controlp INFIELD stbu019 name="input.c.page1.stbu019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu021
            #add-point:ON ACTION controlp INFIELD stbu021 name="input.c.page1.stbu021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu022
            #add-point:ON ACTION controlp INFIELD stbu022 name="input.c.page1.stbu022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu023
            #add-point:ON ACTION controlp INFIELD stbu023 name="input.c.page1.stbu023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu024
            #add-point:ON ACTION controlp INFIELD stbu024 name="input.c.page1.stbu024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu025
            #add-point:ON ACTION controlp INFIELD stbu025 name="input.c.page1.stbu025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu026
            #add-point:ON ACTION controlp INFIELD stbu026 name="input.c.page1.stbu026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbu027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbu027
            #add-point:ON ACTION controlp INFIELD stbu027 name="input.c.page1.stbu027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbucomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbucomp
            #add-point:ON ACTION controlp INFIELD stbucomp name="input.c.page1.stbucomp"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbu_d[l_ac].* = g_stbu_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt640_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbu_d[l_ac].stbuseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbu_d[l_ac].* = g_stbu_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt640_stbu_t_mask_restore('restore_mask_o')
      
               UPDATE stbu_t SET (stbudocno,stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006, 
                   stbu007,stbu008,stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017, 
                   stbu018,stbusite,stbu020,stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026, 
                   stbu027,stbucomp) = (g_stbt_m.stbtdocno,g_stbu_d[l_ac].stbuseq,g_stbu_d[l_ac].stbu001, 
                   g_stbu_d[l_ac].stbu002,g_stbu_d[l_ac].stbu003,g_stbu_d[l_ac].stbu004,g_stbu_d[l_ac].stbu005, 
                   g_stbu_d[l_ac].stbu006,g_stbu_d[l_ac].stbu007,g_stbu_d[l_ac].stbu008,g_stbu_d[l_ac].stbu009, 
                   g_stbu_d[l_ac].stbu010,g_stbu_d[l_ac].stbu011,g_stbu_d[l_ac].stbu012,g_stbu_d[l_ac].stbu013, 
                   g_stbu_d[l_ac].stbu014,g_stbu_d[l_ac].stbu015,g_stbu_d[l_ac].stbu016,g_stbu_d[l_ac].stbu017, 
                   g_stbu_d[l_ac].stbu018,g_stbu_d[l_ac].stbusite,g_stbu_d[l_ac].stbu020,g_stbu_d[l_ac].stbu019, 
                   g_stbu_d[l_ac].stbu021,g_stbu_d[l_ac].stbu022,g_stbu_d[l_ac].stbu023,g_stbu_d[l_ac].stbu024, 
                   g_stbu_d[l_ac].stbu025,g_stbu_d[l_ac].stbu026,g_stbu_d[l_ac].stbu027,g_stbu_d[l_ac].stbucomp) 
 
                WHERE stbuent = g_enterprise AND stbudocno = g_stbt_m.stbtdocno 
 
                  AND stbuseq = g_stbu_d_t.stbuseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbu_d[l_ac].* = g_stbu_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbu_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbu_d[l_ac].* = g_stbu_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbt_m.stbtdocno
               LET gs_keys_bak[1] = g_stbtdocno_t
               LET gs_keys[2] = g_stbu_d[g_detail_idx].stbuseq
               LET gs_keys_bak[2] = g_stbu_d_t.stbuseq
               CALL astt640_update_b('stbu_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt640_stbu_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stbu_d[g_detail_idx].stbuseq = g_stbu_d_t.stbuseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stbt_m.stbtdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stbu_d_t.stbuseq
 
                  CALL astt640_key_update_b(gs_keys,'stbu_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stbt_m),util.JSON.stringify(g_stbu_d_t)
               LET g_log2 = util.JSON.stringify(g_stbt_m),util.JSON.stringify(g_stbu_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt640_unlock_b("stbu_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            CALL s_astp640_stbu_count(g_stbt_m.stbtdocno) RETURNING l_success
            DISPLAY BY NAME g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
                g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023             
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbu_d[li_reproduce_target].* = g_stbu_d[li_reproduce].*
 
               LET g_stbu_d[li_reproduce_target].stbuseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbu_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbu_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt640.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      INPUT ARRAY g_stbu_d_2 FROM s_detail2.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
                
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbu_d_2.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt640_stbu2_fill2()
            LET g_rec_b = g_stbu_d_2.getLength()
            
         BEFORE ROW
           
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
 
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt640_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astt640_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stbu_d_2.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbu_d_2[l_ac].stbuseq_1 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbu_d_2_t.* = g_stbu_d_2[l_ac].*  #BACKUP
               CALL astt640_set_entry_b(l_cmd)

               CALL astt640_set_no_entry_b(l_cmd)
               OPEN astt640_bcl USING g_enterprise,g_stbt_m.stbtdocno,g_stbu_d_2[g_detail_idx].stbuseq_1
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "astt640_bcl"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET l_lock_sw='Y'     
               ELSE
                      
                  FETCH astt640_bcl INTO g_stbu_d_2[l_ac].stbuseq_1,g_stbu_d_2[l_ac].stbu001_1,g_stbu_d_2[l_ac].stbu002_1, 
                      g_stbu_d_2[l_ac].stbu003_1,g_stbu_d_2[l_ac].stbu004_1,g_stbu_d_2[l_ac].stbu005_1,g_stbu_d_2[l_ac].stbu006_1,
                      g_stbu_d_2[l_ac].stbu007_1,g_stbu_d_2[l_ac].stbu008_1,g_stbu_d_2[l_ac].stbu009_1,g_stbu_d_2[l_ac].stbu010_1,
                      g_stbu_d_2[l_ac].stbu011_1,g_stbu_d_2[l_ac].stbu012_1,g_stbu_d_2[l_ac].stbu013_1,g_stbu_d_2[l_ac].stbu014_1,
                      g_stbu_d_2[l_ac].stbu015_1,g_stbu_d_2[l_ac].stbu016_1,g_stbu_d_2[l_ac].stbu017_1,g_stbu_d_2[l_ac].stbu018_1,
                      g_stbu_d_2[l_ac].stbusite_1,g_stbu_d_2[l_ac].stbu020_1,g_stbu_d_2[l_ac].stbu019_1,g_stbu_d_2[l_ac].stbu021_1,
                      g_stbu_d_2[l_ac].stbu022_1,g_stbu_d_2[l_ac].stbu023_1,g_stbu_d_2[l_ac].stbu024_1,g_stbu_d_2[l_ac].stbu025_1,
                      g_stbu_d_2[l_ac].stbu026_1,g_stbu_d_2[l_ac].stbu027_1,g_stbu_d_2[l_ac].stbucomp_1

                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stbu_d_2_t.stbuseq_1
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt640_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF

         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stbu_d_2[l_ac].* = g_stbu_d_2_t.*
               CLOSE astt640_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stbu_d_2[l_ac].stbuseq_1
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stbu_d_2[l_ac].* = g_stbu_d_2_t.*
            ELSE            
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stbu_t SET (stbudocno,stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006, 
                   stbu007,stbu008,stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017, 
                   stbu018,stbusite,stbu020,stbu019,stbu021,stbu022,stbu023) = (g_stbt_m.stbtdocno, 
                   g_stbu_d_2[l_ac].stbuseq_1,g_stbu_d_2[l_ac].stbu001_1,g_stbu_d_2[l_ac].stbu002_1,g_stbu_d_2[l_ac].stbu003_1, 
                   g_stbu_d_2[l_ac].stbu004_1,g_stbu_d_2[l_ac].stbu005_1,g_stbu_d_2[l_ac].stbu006_1,g_stbu_d_2[l_ac].stbu007_1, 
                   g_stbu_d_2[l_ac].stbu008_1,g_stbu_d_2[l_ac].stbu009_1,g_stbu_d_2[l_ac].stbu010_1,g_stbu_d_2[l_ac].stbu011_1, 
                   g_stbu_d_2[l_ac].stbu012_1,g_stbu_d_2[l_ac].stbu013_1,g_stbu_d_2[l_ac].stbu014_1,g_stbu_d_2[l_ac].stbu015_1, 
                   g_stbu_d_2[l_ac].stbu016_1,g_stbu_d_2[l_ac].stbu017_1,g_stbu_d_2[l_ac].stbu018_1,g_stbu_d_2[l_ac].stbusite_1, 
                   g_stbu_d_2[l_ac].stbu020_1,g_stbu_d_2[l_ac].stbu019_1,g_stbu_d_2[l_ac].stbu021_1,g_stbu_d_2[l_ac].stbu022_1, 
                   g_stbu_d_2[l_ac].stbu023_1)
                WHERE stbuent = g_enterprise AND stbudocno = g_stbt_m.stbtdocno 
 
                  AND stbuseq = g_stbu_d_2_t.stbuseq_1 #項次   
 
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stbu_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_stbu_d_2[l_ac].* = g_stbu_d_2_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "stbu_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stbu_d_2[l_ac].* = g_stbu_d_2_t.*                     
                     CALL s_transaction_end('N','0')
                  OTHERWISE
                    
               END CASE
                
            END IF                        


         AFTER ROW
            CALL astt640_unlock_b("stbu_t","'1'")
            CALL s_transaction_end('Y','0')
  
         AFTER FIELD stbu016_1
            IF NOT cl_ap_chk_Range(g_stbu_d_2[l_ac].stbu016_1,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbu016_1
            END IF 
            IF NOT cl_null(g_stbu_d_2[l_ac].stbu016_1) THEN 
               IF g_stbu_d_2[l_ac].stbu016_1>g_stbu_d_2[l_ac].stbu014_1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00042"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stbu016_1
               END IF
            END IF 
              
         AFTER INPUT
            CALL s_astp640_stbu_count(g_stbt_m.stbtdocno) RETURNING l_success
            DISPLAY BY NAME g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
                g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
                g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023             
            
 
      END INPUT

      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stbtsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbuseq
 
               #add-point:input段modify_detail 

               #end add-point  
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stbtdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbuseq
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt640_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt640_b_fill() #單身填充
      CALL astt640_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt640_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
            SELECT stcw004 INTO g_stbt_m.stcw004
              FROM stcw_t
             WHERE stcwent=g_enterprise
               AND stcw001=g_stbt_m.stbt001
               AND stcwseq=g_stbt_m.stbt007            
            DISPLAY BY NAME g_stbt_m.stcw004
                                           
            
   #end add-point
   
   #遮罩相關處理
   LET g_stbt_m_mask_o.* =  g_stbt_m.*
   CALL astt640_stbt_t_mask()
   LET g_stbt_m_mask_n.* =  g_stbt_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
       g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp, 
       g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdp_desc, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
       g_stbt_m.stbtcnfid_desc,g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
       g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
       g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004, 
       g_stbt_m.stbt004_desc,g_stbt_m.stbt005,g_stbt_m.stbt005_desc,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt024_desc,g_stbt_m.stbt025,g_stbt_m.stbt025_desc,g_stbt_m.stbt026,g_stbt_m.stbt026_desc, 
       g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbt_m.stbtstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stbu_d.getLength()
      #add-point:show段單身reference name="show.body.reference"

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu005
            CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stae003
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stae003
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2058' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stae003_desc


            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d[l_ac].stbu009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d[l_ac].stbu009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d[l_ac].stbu009_desc


      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   FOR l_ac = 1 TO g_stbu_d_2.getLength()

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu005_1
            CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stae003_1 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stae003_1

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu005_1
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbu005_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbu005_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stae003_1
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2058' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stae003_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stae003_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu008_1
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbu008_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbu008_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu009_1
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbu009_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbu009_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu017_1
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbu017_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbu017_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbu018_1
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbu018_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbu018_1_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbu_d_2[l_ac].stbusite_1
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbu_d_2[l_ac].stbusite_1_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbu_d_2[l_ac].stbusite_1_desc

   END FOR
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt640_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt640_detail_show()
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
 
{<section id="astt640.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt640_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stbt_t.stbtdocno 
   DEFINE l_oldno     LIKE stbt_t.stbtdocno 
 
   DEFINE l_master    RECORD LIKE stbt_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stbu_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_stbt_m.stbtdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
    
   LET g_stbt_m.stbtdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbt_m.stbtownid = g_user
      LET g_stbt_m.stbtowndp = g_dept
      LET g_stbt_m.stbtcrtid = g_user
      LET g_stbt_m.stbtcrtdp = g_dept 
      LET g_stbt_m.stbtcrtdt = cl_get_current()
      LET g_stbt_m.stbtmodid = g_user
      LET g_stbt_m.stbtmoddt = cl_get_current()
      LET g_stbt_m.stbtstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbt_m.stbtstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt640_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stbt_m.* TO NULL
      INITIALIZE g_stbu_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt640_show()
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
   CALL astt640_set_act_visible()   
   CALL astt640_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbtent = " ||g_enterprise|| " AND",
                      " stbtdocno = '", g_stbt_m.stbtdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt640_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt640_idx_chk()
   
   LET g_data_owner = g_stbt_m.stbtownid      
   LET g_data_dept  = g_stbt_m.stbtowndp
   
   #功能已完成,通報訊息中心
   CALL astt640_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt640_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stbu_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt640_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbu_t
    WHERE stbuent = g_enterprise AND stbudocno = g_stbtdocno_t
 
    INTO TEMP astt640_detail
 
   #將key修正為調整後   
   UPDATE astt640_detail 
      #更新key欄位
      SET stbudocno = g_stbt_m.stbtdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stbu_t SELECT * FROM astt640_detail
   
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
   DROP TABLE astt640_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt640_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE  l_success      LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stbt_m.stbtdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt640_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
   
   #檢查是否允許此動作
   IF NOT astt640_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbt_m_mask_o.* =  g_stbt_m.*
   CALL astt640_stbt_t_mask()
   LET g_stbt_m_mask_n.* =  g_stbt_m.*
   
   CALL astt640_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      CALL astt640_delete_updstbc() RETURNING l_success
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
         RETURN      
      END IF
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt640_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stbtdocno_t = g_stbt_m.stbtdocno
 
 
      DELETE FROM stbt_t
       WHERE stbtent = g_enterprise AND stbtdocno = g_stbt_m.stbtdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stbt_m.stbtdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stbu_t
       WHERE stbuent = g_enterprise AND stbudocno = g_stbt_m.stbtdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stbt_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt640_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stbu_d.clear() 
 
     
      CALL astt640_ui_browser_refresh()  
      #CALL astt640_ui_headershow()  
      #CALL astt640_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt640_browser_fill("")
         CALL astt640_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt640_cl
 
   #功能已完成,通報訊息中心
   CALL astt640_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt640.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt640_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stbu_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL astt640_stbu2_fill2()
   #end add-point
   
   #判斷是否填充
   IF astt640_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006,stbu007, 
             stbu008,stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,stbu018, 
             stbusite,stbu020,stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026,stbu027,stbucomp , 
             t1.stael003 ,t2.ooail003 ,t3.staal003 ,t4.oocql004 ,t5.ooefl003 FROM stbu_t",   
                     " INNER JOIN stbt_t ON stbtent = " ||g_enterprise|| " AND stbtdocno = stbudocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stbu005 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t2 ON t2.ooailent="||g_enterprise||" AND t2.ooail001=stbu008 AND t2.ooail002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t3 ON t3.staalent="||g_enterprise||" AND t3.staal001=stbu017 AND t3.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2060' AND t4.oocql002=stbu018 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=stbusite AND t5.ooefl002='"||g_dlang||"' ",
 
                     " WHERE stbuent=? AND stbudocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
      LET g_sql = g_sql CLIPPED, " AND (stbu001<>'3' OR stbu010<>'2')" 
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbu_t.stbuseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt640_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt640_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stbt_m.stbtdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stbt_m.stbtdocno INTO g_stbu_d[l_ac].stbuseq,g_stbu_d[l_ac].stbu001, 
          g_stbu_d[l_ac].stbu002,g_stbu_d[l_ac].stbu003,g_stbu_d[l_ac].stbu004,g_stbu_d[l_ac].stbu005, 
          g_stbu_d[l_ac].stbu006,g_stbu_d[l_ac].stbu007,g_stbu_d[l_ac].stbu008,g_stbu_d[l_ac].stbu009, 
          g_stbu_d[l_ac].stbu010,g_stbu_d[l_ac].stbu011,g_stbu_d[l_ac].stbu012,g_stbu_d[l_ac].stbu013, 
          g_stbu_d[l_ac].stbu014,g_stbu_d[l_ac].stbu015,g_stbu_d[l_ac].stbu016,g_stbu_d[l_ac].stbu017, 
          g_stbu_d[l_ac].stbu018,g_stbu_d[l_ac].stbusite,g_stbu_d[l_ac].stbu020,g_stbu_d[l_ac].stbu019, 
          g_stbu_d[l_ac].stbu021,g_stbu_d[l_ac].stbu022,g_stbu_d[l_ac].stbu023,g_stbu_d[l_ac].stbu024, 
          g_stbu_d[l_ac].stbu025,g_stbu_d[l_ac].stbu026,g_stbu_d[l_ac].stbu027,g_stbu_d[l_ac].stbucomp, 
          g_stbu_d[l_ac].stbu005_desc,g_stbu_d[l_ac].stbu008_desc,g_stbu_d[l_ac].stbu017_desc,g_stbu_d[l_ac].stbu018_desc, 
          g_stbu_d[l_ac].stbusite_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         
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
    
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_stbu_d.deleteElement(g_stbu_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt640_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbu_d.getLength()
      LET g_stbu_d_mask_o[l_ac].* =  g_stbu_d[l_ac].*
      CALL astt640_stbu_t_mask()
      LET g_stbu_d_mask_n[l_ac].* =  g_stbu_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt640_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stbu_t
       WHERE stbuent = g_enterprise AND
         stbudocno = ps_keys_bak[1] AND stbuseq = ps_keys_bak[2]
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
         CALL g_stbu_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt640_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stbu_t
                  (stbuent,
                   stbudocno,
                   stbuseq
                   ,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006,stbu007,stbu008,stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,stbu018,stbusite,stbu020,stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026,stbu027,stbucomp) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbu_d[g_detail_idx].stbu001,g_stbu_d[g_detail_idx].stbu002,g_stbu_d[g_detail_idx].stbu003, 
                       g_stbu_d[g_detail_idx].stbu004,g_stbu_d[g_detail_idx].stbu005,g_stbu_d[g_detail_idx].stbu006, 
                       g_stbu_d[g_detail_idx].stbu007,g_stbu_d[g_detail_idx].stbu008,g_stbu_d[g_detail_idx].stbu009, 
                       g_stbu_d[g_detail_idx].stbu010,g_stbu_d[g_detail_idx].stbu011,g_stbu_d[g_detail_idx].stbu012, 
                       g_stbu_d[g_detail_idx].stbu013,g_stbu_d[g_detail_idx].stbu014,g_stbu_d[g_detail_idx].stbu015, 
                       g_stbu_d[g_detail_idx].stbu016,g_stbu_d[g_detail_idx].stbu017,g_stbu_d[g_detail_idx].stbu018, 
                       g_stbu_d[g_detail_idx].stbusite,g_stbu_d[g_detail_idx].stbu020,g_stbu_d[g_detail_idx].stbu019, 
                       g_stbu_d[g_detail_idx].stbu021,g_stbu_d[g_detail_idx].stbu022,g_stbu_d[g_detail_idx].stbu023, 
                       g_stbu_d[g_detail_idx].stbu024,g_stbu_d[g_detail_idx].stbu025,g_stbu_d[g_detail_idx].stbu026, 
                       g_stbu_d[g_detail_idx].stbu027,g_stbu_d[g_detail_idx].stbucomp)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbu_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt640_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbu_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt640_stbu_t_mask_restore('restore_mask_o')
               
      UPDATE stbu_t 
         SET (stbudocno,
              stbuseq
              ,stbu001,stbu002,stbu003,stbu004,stbu005,stbu006,stbu007,stbu008,stbu009,stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,stbu018,stbusite,stbu020,stbu019,stbu021,stbu022,stbu023,stbu024,stbu025,stbu026,stbu027,stbucomp) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbu_d[g_detail_idx].stbu001,g_stbu_d[g_detail_idx].stbu002,g_stbu_d[g_detail_idx].stbu003, 
                  g_stbu_d[g_detail_idx].stbu004,g_stbu_d[g_detail_idx].stbu005,g_stbu_d[g_detail_idx].stbu006, 
                  g_stbu_d[g_detail_idx].stbu007,g_stbu_d[g_detail_idx].stbu008,g_stbu_d[g_detail_idx].stbu009, 
                  g_stbu_d[g_detail_idx].stbu010,g_stbu_d[g_detail_idx].stbu011,g_stbu_d[g_detail_idx].stbu012, 
                  g_stbu_d[g_detail_idx].stbu013,g_stbu_d[g_detail_idx].stbu014,g_stbu_d[g_detail_idx].stbu015, 
                  g_stbu_d[g_detail_idx].stbu016,g_stbu_d[g_detail_idx].stbu017,g_stbu_d[g_detail_idx].stbu018, 
                  g_stbu_d[g_detail_idx].stbusite,g_stbu_d[g_detail_idx].stbu020,g_stbu_d[g_detail_idx].stbu019, 
                  g_stbu_d[g_detail_idx].stbu021,g_stbu_d[g_detail_idx].stbu022,g_stbu_d[g_detail_idx].stbu023, 
                  g_stbu_d[g_detail_idx].stbu024,g_stbu_d[g_detail_idx].stbu025,g_stbu_d[g_detail_idx].stbu026, 
                  g_stbu_d[g_detail_idx].stbu027,g_stbu_d[g_detail_idx].stbucomp) 
         WHERE stbuent = g_enterprise AND stbudocno = ps_keys_bak[1] AND stbuseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbu_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbu_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt640_stbu_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt640_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt640.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt640_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt640.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt640_lock_b(ps_table,ps_page)
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
   #CALL astt640_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stbu_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt640_bcl USING g_enterprise,
                                       g_stbt_m.stbtdocno,g_stbu_d[g_detail_idx].stbuseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt640_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt640.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt640_unlock_b(ps_table,ps_page)
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
      CLOSE astt640_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt640_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stbtdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stbtdocno",TRUE)
      CALL cl_set_comp_entry("stbtdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stbt001,stbt002",TRUE)
      CALL cl_set_comp_entry("stbtsite",TRUE)
      CALL cl_set_comp_required('stbtsite',TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt640_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stbtdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      CALL cl_set_comp_entry("stbt001,stbt002",FALSE)
#      CALL cl_set_comp_required('stbtsite',FALSE)
#      CALL cl_set_comp_entry("stbtsite",FALSE)
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stbtdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stbtdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stbtsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stbtsite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt640_set_entry_b(p_cmd)
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
   
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt640_set_no_entry_b(p_cmd)
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
   
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt640_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt640_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stbt_m.stbtstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt640_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt640.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt640_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt640.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt640_default_search()
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
      LET ls_wc = ls_wc, " stbtdocno = '", g_argv[01], "' AND "
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
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stbt_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbu_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
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
 
{<section id="astt640.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt640_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stbt_m.stbtstus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stbt_m.stbtdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt640_cl USING g_enterprise,g_stbt_m.stbtdocno
   IF STATUS THEN
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt640_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
       g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtdp, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfdt, 
       g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015, 
       g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021, 
       g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029,g_stbt_m.stbtsite_desc, 
       g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid_desc, 
       g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbt004_desc, 
       g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc
   
 
   #檢查是否允許此動作
   IF NOT astt640_action_chk() THEN
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno,g_stbt_m.stbt001, 
       g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stcw004,g_stbt_m.stbt008, 
       g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp, 
       g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdp_desc, 
       g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
       g_stbt_m.stbtcnfid_desc,g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012, 
       g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018, 
       g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004, 
       g_stbt_m.stbt004_desc,g_stbt_m.stbt005,g_stbt_m.stbt005_desc,g_stbt_m.stbt006,g_stbt_m.stbt024, 
       g_stbt_m.stbt024_desc,g_stbt_m.stbt025,g_stbt_m.stbt025_desc,g_stbt_m.stbt026,g_stbt_m.stbt026_desc, 
       g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
 
   CASE g_stbt_m.stbtstus
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
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stbt_m.stbtstus
            
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
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      CALL cl_set_act_visible("verify",FALSE)
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stbt_m.stbtstus
         WHEN "N"
            #HIDE OPTION "open"
            CALL cl_set_act_visible("unconfirmed",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
            
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
            
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
            
         WHEN "X"
            #HIDE OPTION "invalid"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)

         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)
            
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
            
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)

      END CASE
      LET l_success = TRUE
      LET g_stbt_m.stbtcnfdt=cl_get_current()
      LET g_stbt_m.stbtmoddt=cl_get_current()
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt640_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt640_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt640_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt640_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
         CALL s_astt640_conf_chk(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno

         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt640_conf_upd(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno 
               UPDATE stbt_t SET stbtmodid =g_user,stbtmoddt=g_stbt_m.stbtmoddt,stbtcnfid='',stbtcnfdt=''
                    WHERE stbtent = g_enterprise AND stbtdocno = g_stbt_m.stbtdocno                        
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stbt_m.stbtdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')                 
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = g_stbt_m.stbtdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN            
         END IF  
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
         CALL s_astt640_conf_chk(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-014') THEN
               CALL s_transaction_begin()
               CALL s_astt640_conf_upd(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno 
               UPDATE stbt_t SET stbtcnfid =g_user,stbtcnfdt=g_stbt_m.stbtcnfdt
                    WHERE stbtent = g_enterprise AND stbtdocno = g_stbt_m.stbtdocno                 
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stbt_m.stbtdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')                 
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = g_stbt_m.stbtdocno
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
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
         CALL s_astt640_conf_chk(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno

         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt640_conf_upd(g_stbt_m.stbtdocno,lc_state) RETURNING l_success,l_errno 
               UPDATE stbt_t SET stbtmodid =g_user,stbtmoddt=g_stbt_m.stbtmoddt
                    WHERE stbtent = g_enterprise AND stbtdocno = g_stbt_m.stbtdocno                 
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stbt_m.stbtdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')                 
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = l_errno
            LET g_errparam.extend = g_stbt_m.stbtdocno
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
      AND lc_state <> "X"
      ) OR 
      g_stbt_m.stbtstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stbt_m.stbtmodid = g_user
   LET g_stbt_m.stbtmoddt = cl_get_current()
   LET g_stbt_m.stbtstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stbt_t 
      SET (stbtstus,stbtmodid,stbtmoddt) 
        = (g_stbt_m.stbtstus,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt)     
    WHERE stbtent = g_enterprise AND stbtdocno = g_stbt_m.stbtdocno
 
    
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt640_master_referesh USING g_stbt_m.stbtdocno INTO g_stbt_m.stbtsite,g_stbt_m.stbtdocdt, 
          g_stbt_m.stbtdocno,g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt007,g_stbt_m.stbt008, 
          g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtowndp,g_stbt_m.stbtcrtid, 
          g_stbt_m.stbtcrtdp,g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmoddt,g_stbt_m.stbtcnfid, 
          g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011,g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014, 
          g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017,g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020, 
          g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023,g_stbt_m.stbt004,g_stbt_m.stbt005,g_stbt_m.stbt006, 
          g_stbt_m.stbt024,g_stbt_m.stbt025,g_stbt_m.stbt026,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029, 
          g_stbt_m.stbtsite_desc,g_stbt_m.stbt002_desc,g_stbt_m.stbtownid_desc,g_stbt_m.stbtowndp_desc, 
          g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtcnfid_desc, 
          g_stbt_m.stbt004_desc,g_stbt_m.stbt005_desc,g_stbt_m.stbt024_desc,g_stbt_m.stbt025_desc,g_stbt_m.stbt026_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stbt_m.stbtsite,g_stbt_m.stbtsite_desc,g_stbt_m.stbtdocdt,g_stbt_m.stbtdocno, 
          g_stbt_m.stbt001,g_stbt_m.stbt002,g_stbt_m.stbt002_desc,g_stbt_m.stbt003,g_stbt_m.stbt007, 
          g_stbt_m.stcw004,g_stbt_m.stbt008,g_stbt_m.stbt009,g_stbt_m.stbtstus,g_stbt_m.stbtownid,g_stbt_m.stbtownid_desc, 
          g_stbt_m.stbtowndp,g_stbt_m.stbtowndp_desc,g_stbt_m.stbtcrtid,g_stbt_m.stbtcrtid_desc,g_stbt_m.stbtcrtdp, 
          g_stbt_m.stbtcrtdp_desc,g_stbt_m.stbtcrtdt,g_stbt_m.stbtmodid,g_stbt_m.stbtmodid_desc,g_stbt_m.stbtmoddt, 
          g_stbt_m.stbtcnfid,g_stbt_m.stbtcnfid_desc,g_stbt_m.stbtcnfdt,g_stbt_m.stbt010,g_stbt_m.stbt011, 
          g_stbt_m.stbt012,g_stbt_m.stbt013,g_stbt_m.stbt014,g_stbt_m.stbt015,g_stbt_m.stbt016,g_stbt_m.stbt017, 
          g_stbt_m.stbt018,g_stbt_m.stbt019,g_stbt_m.stbt020,g_stbt_m.stbt021,g_stbt_m.stbt022,g_stbt_m.stbt023, 
          g_stbt_m.stbt004,g_stbt_m.stbt004_desc,g_stbt_m.stbt005,g_stbt_m.stbt005_desc,g_stbt_m.stbt006, 
          g_stbt_m.stbt024,g_stbt_m.stbt024_desc,g_stbt_m.stbt025,g_stbt_m.stbt025_desc,g_stbt_m.stbt026, 
          g_stbt_m.stbt026_desc,g_stbt_m.stbt027,g_stbt_m.stbt028,g_stbt_m.stbt029
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt640_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt640_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt640.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt640_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stbu_d.getLength() THEN
         LET g_detail_idx = g_stbu_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbu_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbu_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt640_b_fill2(pi_idx)
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
   
   CALL astt640_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt640_fill_chk(ps_idx)
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
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astt640.status_show" >}
PRIVATE FUNCTION astt640_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt640.mask_functions" >}
&include "erp/ast/astt640_mask.4gl"
 
{</section>}
 
{<section id="astt640.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt640_send()
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
 
 
   CALL astt640_show()
   CALL astt640_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt640_conf_chk(g_stbt_m.stbtdocno,g_stbt_m.stbtstus) RETURNING l_success,l_errno
   IF NOT l_success THEN
      CLOSE astt640_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF

   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stbt_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stbu_d))
 
 
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
   #CALL astt640_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt640_ui_headershow()
   CALL astt640_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt640_draw_out()
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
   CALL astt640_ui_headershow()  
   CALL astt640_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt640.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt640_set_pk_array()
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
   LET g_pk_array[1].values = g_stbt_m.stbtdocno
   LET g_pk_array[1].column = 'stbtdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt640.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt640.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt640_msgcentre_notify(lc_state)
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
   CALL astt640_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stbt_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt640.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt640_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stbtstus  INTO g_stbt_m.stbtstus
     FROM stbt_t
    WHERE stbtent = g_enterprise
      AND stbtdocno = g_stbt_m.stbtdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stbt_m.stbtstus
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
        LET g_errparam.extend = g_stbt_m.stbtdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt640_set_act_visible()
        CALL astt640_set_act_no_visible()
        CALL astt640_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt640.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 結算單價外費用明細
# Memo...........:
# Usage..........: CALL astt640_stbu2_fill2()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 20140624 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astt640_stbu2_fill2()
DEFINE p_wc2      STRING
DEFINE l_i        LIKE type_t.num5    
 
   CALL g_stbu_d_2.clear()    #g_stbu_d 單頭及單身 
 
   
   LET g_sql = "SELECT  UNIQUE stbuseq,stbu001,stbu002,stbu003,stbu004,stbu005,'','','',stbu006,stbu007, ",
               "               stbu008,'',stbu009,'',stbu010,stbu011,stbu012,stbu013,stbu014,stbu015,stbu016,stbu017,'',stbu018,", 
               "               '',stbusite,'',stbu020,stbu019,stbu021,stbu022,stbu023",
               "  FROM stbu_t",   
               " INNER JOIN stbt_t ON stbtdocno = stbudocno ",
               " WHERE stbuent=? AND stbudocno=?",
               "   AND stbu001='3' AND stbu010='2'"


   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
   END IF
   
   LET g_sql = g_sql, " ORDER BY stbu_t.stbuseq"
   

   
   PREPARE astt640_pb_2 FROM g_sql
   DECLARE b_fill_cs_2 CURSOR FOR astt640_pb_2
   

   LET l_i = 1
   
   OPEN b_fill_cs_2 USING g_enterprise,g_stbt_m.stbtdocno
 
                                            
   FOREACH b_fill_cs_2 INTO g_stbu_d_2[l_i].stbuseq_1,g_stbu_d_2[l_i].stbu001_1,g_stbu_d_2[l_i].stbu002_1,g_stbu_d_2[l_i].stbu003_1, 
       g_stbu_d_2[l_i].stbu004_1,g_stbu_d_2[l_i].stbu005_1,g_stbu_d_2[l_i].stbu005_1_desc,g_stbu_d_2[l_i].stae003_1, 
       g_stbu_d_2[l_i].stae003_1_desc,g_stbu_d_2[l_i].stbu006_1,g_stbu_d_2[l_i].stbu007_1,g_stbu_d_2[l_i].stbu008_1, 
       g_stbu_d_2[l_i].stbu008_1_desc,g_stbu_d_2[l_i].stbu009_1,g_stbu_d_2[l_i].stbu009_1_desc,g_stbu_d_2[l_i].stbu010_1, 
       g_stbu_d_2[l_i].stbu011_1,g_stbu_d_2[l_i].stbu012_1,g_stbu_d_2[l_i].stbu013_1,g_stbu_d_2[l_i].stbu014_1, 
       g_stbu_d_2[l_i].stbu015_1,g_stbu_d_2[l_i].stbu016_1,g_stbu_d_2[l_i].stbu017_1,g_stbu_d_2[l_i].stbu017_1_desc, 
       g_stbu_d_2[l_i].stbu018_1,g_stbu_d_2[l_i].stbu018_1_desc,g_stbu_d_2[l_i].stbusite_1,g_stbu_d_2[l_i].stbusite_1_desc, 
       g_stbu_d_2[l_i].stbu020_1,g_stbu_d_2[l_i].stbu019_1,g_stbu_d_2[l_i].stbu021_1,g_stbu_d_2[l_i].stbu022_1, 
       g_stbu_d_2[l_i].stbu023_1,g_stbu_d_2[l_i].stbu024_1,g_stbu_d_2[l_i].stbu025_1,g_stbu_d_2[l_i].stbu026_1,
       g_stbu_d_2[l_i].stbu027_1,g_stbu_d_2[l_i].stbucomp_1
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
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = TRUE
            CALL cl_err()

         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH

       
   CALL g_stbu_d_2.deleteElement(g_stbu_d_2.getLength())
    
 
   FREE astt640_pb_2


END FUNCTION

################################################################################
# Descriptions...: 分銷合約帶出資料
# Memo...........:
# Usage..........: CALL astt640_stbt001_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140624 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astt640_stbt001_ref()
DEFINE l_stcw004        LIKE stcw_t.stcw004  


   SELECT stce009,stce005,stce006,stce007 INTO 
          g_stbt_m.stbt002,g_stbt_m.stbt003,g_stbt_m.stbt004,g_stbt_m.stbt005 
     FROM stce_t
    WHERE stceent=g_enterprise
      AND stce001=g_stbt_m.stbt001
      AND stcestus<>'N'
      #AND stcestus='Y' 

   DISPLAY BY NAME g_stbt_m.stbt001
   DISPLAY BY NAME g_stbt_m.stbt002
   DISPLAY BY NAME g_stbt_m.stbt003
   DISPLAY BY NAME g_stbt_m.stbt004
   DISPLAY BY NAME g_stbt_m.stbt005

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbt_m.stbt002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbt_m.stbt002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbt_m.stbt002_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbt_m.stbt005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbt_m.stbt005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbt_m.stbt005_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbt_m.stbt004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbt_m.stbt004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbt_m.stbt004_desc

   SELECT MIN(stcwseq) INTO g_stbt_m.stbt007
     FROM stcw_t
    WHERE stcwent=g_enterprise
      AND stcw001=g_stbt_m.stbt001
      AND stcw005='N'
      
   SELECT stcw002,stcw003,stcw004 INTO g_stbt_m.stbt008,g_stbt_m.stbt009,g_stbt_m.stcw004
     FROM stcw_t
    WHERE stcwent=g_enterprise
      AND stcw001=g_stbt_m.stbt001
      AND stcw005='N'
      AND stcwseq=g_stbt_m.stbt007

   DISPLAY BY NAME g_stbt_m.stbt007
   DISPLAY BY NAME g_stbt_m.stbt008
   DISPLAY BY NAME g_stbt_m.stbt009
   DISPLAY BY NAME g_stbt_m.stcw004
  
   SELECT stau004 INTO g_stbt_m.stbt006
     FROM stau_t
    WHERE stauent=g_enterprise
      AND stausite=g_stbt_m.stbtsite
      AND stau001=g_prog
      
    DISPLAY BY NAME g_stbt_m.stbt007

END FUNCTION

################################################################################
# Descriptions...: 分銷合約檢查--根據合約編號、經銷商、經營方式
# Memo...........:
# Usage..........: CALL astt640_stce001_check()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20140613 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astt640_stce001_check()
DEFINE r_success        LIKE type_t.num5
DEFINE l_count          LIKE type_t.num5

  LET r_success=TRUE

  #合約\經銷商\經營方式----合約\經銷商\經營方式
  IF NOT cl_null(g_stbt_m.stbt001) AND NOT cl_null(g_stbt_m.stbt002) AND NOT cl_null(g_stbt_m.stbt003) THEN
     LET l_count=0
     SELECT COUNT(*) INTO l_count
       FROM stce_t
      WHERE stceent=g_enterprise
        AND stce001=g_stbt_m.stbt001
        AND stce009=g_stbt_m.stbt002
        AND stce005=g_stbt_m.stbt003
        AND stcestus<>'N'
        #AND stcestus='Y'  
     IF cl_null(l_count) OR l_count=0 THEN
        LET r_success=FALSE
        RETURN r_success
     END IF                    
  END IF



  RETURN r_success




END FUNCTION

################################################################################
# Descriptions...: 刪除更新結算底稿
# Memo...........:
# Usage..........: CALL astt640_delete_updstbc()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20130416 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astt640_delete_updstbc()
DEFINE r_success     LIKE type_t.num5
DEFINE l_stbu002     LIKE stbu_t.stbu002
DEFINE l_stbu003     LIKE stbu_t.stbu003
DEFINE l_stbc018     LIKE stbc_t.stbc018
DEFINE l_stbc019     LIKE stbc_t.stbc019
DEFINE l_stbcstus    LIKE stbc_t.stbcstus


   LET r_success=TRUE
  

   LET g_sql = "SELECT stbu_t.stbu002,stbu_t.stbu003 FROM stbt_t,stbu_t",
               " WHERE stbtent=stbuent",
               "   AND stbtdocno=stbudocno",
               "   AND stbtent='",g_enterprise,"'",
               "   AND stbtdocno='",g_stbt_m.stbtdocno,"'"
      
   PREPARE astt640_update_stbc_pb FROM g_sql
   DECLARE astt640_update_stbu_cur CURSOR FOR astt640_update_stbc_pb
       
   LET l_stbu002=''
   LET l_stbu003=''
   
   FOREACH astt640_update_stbu_cur INTO l_stbu002,l_stbu003

      LET l_stbc018=''
      LET l_stbc019=''
      LET l_stbcstus=''
      SELECT stbc018,stbc019,l_stbcstus INTO l_stbc018,l_stbc019,l_stbcstus
        FROM stbc_t
       WHERE stbcent=g_enterprise
         AND stbc001=g_stbt_m.stbtsite
         AND stbc004=l_stbu002
         AND stbc005=l_stbu003
       
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
          AND stbc001=g_stbt_m.stbtsite
          AND stbc004=l_stbu002
          AND stbc005=l_stbu003  
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
   
   FREE astt640_update_stbc_pb

   RETURN r_success

END FUNCTION

 
{</section>}
 
