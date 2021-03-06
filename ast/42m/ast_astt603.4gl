#該程式未解開Section, 採用最新樣板產出!
{<section id="astt603.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0014(2015-01-16 17:16:18), PR版次:0014(2016-11-21 13:56:35)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000164
#+ Filename...: astt603
#+ Description: 經銷商陳列協議維護作業
#+ Creator....: 02003(2014-06-22 00:00:00)
#+ Modifier...: 06189 -SD/PR- 02749
 
{</section>}
 
{<section id="astt603.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#151125-00001#4     2015/11/26   By 06948    增加作廢時詢問「是否作廢」
#160318-00025#46    2016/04/28   By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160818-00017#40    2016/08/23   By 08734    删除修改未重新判断状态码
#160905-00007#3     2016/09/05   By zhujing  调整系统中无ENT的SQL条件增加ent
#160824-00007#196   2016/11/20   by lori     修正舊值備份寫法
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
PRIVATE type type_g_stcq_m        RECORD
       stcqsite LIKE stcq_t.stcqsite, 
   stcqsite_desc LIKE type_t.chr80, 
   stcqdocdt LIKE stcq_t.stcqdocdt, 
   stcqdocno LIKE stcq_t.stcqdocno, 
   stcqunit LIKE stcq_t.stcqunit, 
   stcq001 LIKE stcq_t.stcq001, 
   stcq003 LIKE stcq_t.stcq003, 
   stcq003_desc LIKE type_t.chr80, 
   stcq004 LIKE stcq_t.stcq004, 
   stcq004_desc LIKE type_t.chr80, 
   stcq002 LIKE stcq_t.stcq002, 
   stcq005 LIKE stcq_t.stcq005, 
   stcq006 LIKE stcq_t.stcq006, 
   stcq006_desc LIKE type_t.chr80, 
   stcq007 LIKE stcq_t.stcq007, 
   stcq007_desc LIKE type_t.chr80, 
   stcqstus LIKE stcq_t.stcqstus, 
   stcq008 LIKE stcq_t.stcq008, 
   stcq008_desc LIKE type_t.chr80, 
   stcq009 LIKE stcq_t.stcq009, 
   stcq009_desc LIKE type_t.chr80, 
   stcq016 LIKE stcq_t.stcq016, 
   stcq016_desc LIKE type_t.chr80, 
   stcq017 LIKE stcq_t.stcq017, 
   stcq017_desc LIKE type_t.chr80, 
   next_b LIKE type_t.chr500, 
   stcq010 LIKE stcq_t.stcq010, 
   stcq010_desc LIKE type_t.chr80, 
   stcq011 LIKE stcq_t.stcq011, 
   stcq011_desc LIKE type_t.chr80, 
   stcq012 LIKE stcq_t.stcq012, 
   stcq012_desc LIKE type_t.chr80, 
   stcq018 LIKE stcq_t.stcq018, 
   num LIKE type_t.chr500, 
   stcq013 LIKE stcq_t.stcq013, 
   stcq013_desc LIKE type_t.chr80, 
   stcq014 LIKE stcq_t.stcq014, 
   stcq014_desc LIKE type_t.chr80, 
   stcq015 LIKE stcq_t.stcq015, 
   stcq015_desc LIKE type_t.chr80, 
   stcq019 LIKE stcq_t.stcq019, 
   stcqownid LIKE stcq_t.stcqownid, 
   stcqownid_desc LIKE type_t.chr80, 
   stcqowndp LIKE stcq_t.stcqowndp, 
   stcqowndp_desc LIKE type_t.chr80, 
   stcqcrtid LIKE stcq_t.stcqcrtid, 
   stcqcrtid_desc LIKE type_t.chr80, 
   stcqcrtdp LIKE stcq_t.stcqcrtdp, 
   stcqcrtdp_desc LIKE type_t.chr80, 
   stcqcrtdt LIKE stcq_t.stcqcrtdt, 
   stcqmodid LIKE stcq_t.stcqmodid, 
   stcqmodid_desc LIKE type_t.chr80, 
   stcqmoddt LIKE stcq_t.stcqmoddt, 
   stcqcnfid LIKE stcq_t.stcqcnfid, 
   stcqcnfid_desc LIKE type_t.chr80, 
   stcqcnfdt LIKE stcq_t.stcqcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stcr_d        RECORD
       stcrseq LIKE stcr_t.stcrseq, 
   stcr001 LIKE stcr_t.stcr001, 
   stcr001_desc LIKE type_t.chr500, 
   stcr002 LIKE stcr_t.stcr002, 
   stcr003 LIKE stcr_t.stcr003, 
   stcr004 LIKE stcr_t.stcr004, 
   stcr005 LIKE stcr_t.stcr005, 
   stcr006 LIKE stcr_t.stcr006, 
   stcr007 LIKE stcr_t.stcr007, 
   stcr008 LIKE stcr_t.stcr008, 
   stcr009 LIKE stcr_t.stcr009, 
   stcr010 LIKE stcr_t.stcr010, 
   stcr023 LIKE stcr_t.stcr023, 
   stcr024 LIKE stcr_t.stcr024, 
   stcr011 LIKE stcr_t.stcr011, 
   stcr012 LIKE stcr_t.stcr012, 
   stcr013 LIKE stcr_t.stcr013, 
   stcr014 LIKE stcr_t.stcr014, 
   stcr015 LIKE stcr_t.stcr015, 
   stcr016 LIKE stcr_t.stcr016, 
   stcr017 LIKE stcr_t.stcr017, 
   stcr018 LIKE stcr_t.stcr018, 
   stcr019 LIKE stcr_t.stcr019, 
   stcr020 LIKE stcr_t.stcr020, 
   stcr021 LIKE stcr_t.stcr021, 
   stcr022 LIKE stcr_t.stcr022, 
   stcrsite LIKE stcr_t.stcrsite, 
   stcrunit LIKE stcr_t.stcrunit
       END RECORD
PRIVATE TYPE type_g_stcr2_d RECORD
       stcsseq LIKE stcs_t.stcsseq, 
   stcs001 LIKE stcs_t.stcs001, 
   stcs002 LIKE stcs_t.stcs002, 
   stcs003 LIKE stcs_t.stcs003, 
   stcs004 LIKE stcs_t.stcs004, 
   stcs005 LIKE stcs_t.stcs005, 
   stcs005_desc LIKE type_t.chr500, 
   stcs005_desc_desc LIKE type_t.chr500, 
   stcs006 LIKE stcs_t.stcs006, 
   stcs007 LIKE stcs_t.stcs007, 
   stcssite LIKE stcs_t.stcssite, 
   stcsunit LIKE stcs_t.stcsunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stcqdocno LIKE stcq_t.stcqdocno,
      b_stcqdocdt LIKE stcq_t.stcqdocdt,
      b_stcqsite LIKE stcq_t.stcqsite,
   b_stcqsite_desc LIKE type_t.chr80,
      b_stcq001 LIKE stcq_t.stcq001,
      b_stcq003 LIKE stcq_t.stcq003,
   b_stcq003_desc LIKE type_t.chr80,
      b_stcq004 LIKE stcq_t.stcq004,
   b_stcq004_desc LIKE type_t.chr80,
      b_stcq005 LIKE stcq_t.stcq005,
      b_stcq006 LIKE stcq_t.stcq006,
   b_stcq006_desc LIKE type_t.chr80,
      b_stcq007 LIKE stcq_t.stcq007,
   b_stcq007_desc LIKE type_t.chr80,
      b_stcq008 LIKE stcq_t.stcq008,
   b_stcq008_desc LIKE type_t.chr80,
      b_stcq009 LIKE stcq_t.stcq009,
   b_stcq009_desc LIKE type_t.chr80,
      b_stcq010 LIKE stcq_t.stcq010,
   b_stcq010_desc LIKE type_t.chr80,
      b_stcq011 LIKE stcq_t.stcq011,
   b_stcq011_desc LIKE type_t.chr80,
      b_stcq012 LIKE stcq_t.stcq012,
   b_stcq012_desc LIKE type_t.chr80,
      b_stcq013 LIKE stcq_t.stcq013,
   b_stcq013_desc LIKE type_t.chr80,
      b_stcq014 LIKE stcq_t.stcq014,
   b_stcq014_desc LIKE type_t.chr80,
      b_stcq015 LIKE stcq_t.stcq015,
   b_stcq015_desc LIKE type_t.chr80,
      b_stcq016 LIKE stcq_t.stcq016,
   b_stcq016_desc LIKE type_t.chr80,
      b_stcq017 LIKE stcq_t.stcq017,
   b_stcq017_desc LIKE type_t.chr80,
      b_stcq018 LIKE stcq_t.stcq018,
      b_stcq019 LIKE stcq_t.stcq019,
      b_stcqunit LIKE stcq_t.stcqunit
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag   LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stcq_m          type_g_stcq_m
DEFINE g_stcq_m_t        type_g_stcq_m
DEFINE g_stcq_m_o        type_g_stcq_m
DEFINE g_stcq_m_mask_o   type_g_stcq_m #轉換遮罩前資料
DEFINE g_stcq_m_mask_n   type_g_stcq_m #轉換遮罩後資料
 
   DEFINE g_stcqdocno_t LIKE stcq_t.stcqdocno
 
 
DEFINE g_stcr_d          DYNAMIC ARRAY OF type_g_stcr_d
DEFINE g_stcr_d_t        type_g_stcr_d
DEFINE g_stcr_d_o        type_g_stcr_d
DEFINE g_stcr_d_mask_o   DYNAMIC ARRAY OF type_g_stcr_d #轉換遮罩前資料
DEFINE g_stcr_d_mask_n   DYNAMIC ARRAY OF type_g_stcr_d #轉換遮罩後資料
DEFINE g_stcr2_d          DYNAMIC ARRAY OF type_g_stcr2_d
DEFINE g_stcr2_d_t        type_g_stcr2_d
DEFINE g_stcr2_d_o        type_g_stcr2_d
DEFINE g_stcr2_d_mask_o   DYNAMIC ARRAY OF type_g_stcr2_d #轉換遮罩前資料
DEFINE g_stcr2_d_mask_n   DYNAMIC ARRAY OF type_g_stcr2_d #轉換遮罩後資料
 
 
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

#end add-point
 
{</section>}
 
{<section id="astt603.main" >}
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
   LET g_forupd_sql = " SELECT stcqsite,'',stcqdocdt,stcqdocno,stcqunit,stcq001,stcq003,'',stcq004,'', 
       stcq002,stcq005,stcq006,'',stcq007,'',stcqstus,stcq008,'',stcq009,'',stcq016,'',stcq017,'','', 
       stcq010,'',stcq011,'',stcq012,'',stcq018,'',stcq013,'',stcq014,'',stcq015,'',stcq019,stcqownid, 
       '',stcqowndp,'',stcqcrtid,'',stcqcrtdp,'',stcqcrtdt,stcqmodid,'',stcqmoddt,stcqcnfid,'',stcqcnfdt", 
        
                      " FROM stcq_t",
                      " WHERE stcqent= ? AND stcqdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt603_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stcqsite,t0.stcqdocdt,t0.stcqdocno,t0.stcqunit,t0.stcq001,t0.stcq003, 
       t0.stcq004,t0.stcq002,t0.stcq005,t0.stcq006,t0.stcq007,t0.stcqstus,t0.stcq008,t0.stcq009,t0.stcq016, 
       t0.stcq017,t0.stcq010,t0.stcq011,t0.stcq012,t0.stcq018,t0.stcq013,t0.stcq014,t0.stcq015,t0.stcq019, 
       t0.stcqownid,t0.stcqowndp,t0.stcqcrtid,t0.stcqcrtdp,t0.stcqcrtdt,t0.stcqmodid,t0.stcqmoddt,t0.stcqcnfid, 
       t0.stcqcnfdt,t1.ooefl003 ,t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 , 
       t8.ooail003 ,t9.ooefl003 ,t10.ooefl003 ,t11.dbbcl003 ,t12.oojdl003 ,t13.ooefl003 ,t14.ooefl003 , 
       t15.ooag011 ,t16.ooefl003 ,t17.ooag011 ,t18.ooefl003 ,t19.ooag011 ,t20.ooag011",
               " FROM stcq_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcqsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcq003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcq006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcq007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcq008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcq009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stcq016 AND t8.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcq010 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stcq011 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t11 ON t11.dbbclent="||g_enterprise||" AND t11.dbbcl001=t0.stcq012 AND t11.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t12 ON t12.oojdlent="||g_enterprise||" AND t12.oojdl001=t0.stcq013 AND t12.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stcq014 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t14 ON t14.ooeflent="||g_enterprise||" AND t14.ooefl001=t0.stcq015 AND t14.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stcqownid  ",
               " LEFT JOIN ooefl_t t16 ON t16.ooeflent="||g_enterprise||" AND t16.ooefl001=t0.stcqowndp AND t16.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.stcqcrtid  ",
               " LEFT JOIN ooefl_t t18 ON t18.ooeflent="||g_enterprise||" AND t18.ooefl001=t0.stcqcrtdp AND t18.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t19 ON t19.ooagent="||g_enterprise||" AND t19.ooag001=t0.stcqmodid  ",
               " LEFT JOIN ooag_t t20 ON t20.ooagent="||g_enterprise||" AND t20.ooag001=t0.stcqcnfid  ",
 
               " WHERE t0.stcqent = " ||g_enterprise|| " AND t0.stcqdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt603_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt603 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt603_init()   
 
      #進入選單 Menu (="N")
      CALL astt603_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt603
      
   END IF 
   
   CLOSE astt603_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt603.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt603_init()
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
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stcqstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stcq005','6013') 
   CALL cl_set_combo_scc('stcr004','6006') 
   CALL cl_set_combo_scc('stcr005','6008') 
   CALL cl_set_combo_scc('stcr006','6009') 
   CALL cl_set_combo_scc('stcs001','6073') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('b_stcq005','6013','11,12,13')
   CALL cl_set_combo_scc_part('stcq005','6013','11,12,13')
   CALL cl_set_combo_scc_part('stcr004','6006','1,2') 
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt603_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt603.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt603_ui_dialog()
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
            CALL astt603_insert()
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
         INITIALIZE g_stcq_m.* TO NULL
         CALL g_stcr_d.clear()
         CALL g_stcr2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt603_init()
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
               
               CALL astt603_fetch('') # reload data
               LET l_ac = 1
               CALL astt603_ui_detailshow() #Setting the current row 
         
               CALL astt603_idx_chk()
               #NEXT FIELD stcrseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stcr_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt603_idx_chk()
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
               CALL astt603_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stcr2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt603_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astt603_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt603_browser_fill("")
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
               CALL astt603_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt603_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt603_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt603_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt603_set_act_visible()   
            CALL astt603_set_act_no_visible()
            IF NOT (g_stcq_m.stcqdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stcqent = " ||g_enterprise|| " AND",
                                  " stcqdocno = '", g_stcq_m.stcqdocno, "' "
 
               #填到對應位置
               CALL astt603_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stcq_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcr_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcs_t" 
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
               CALL astt603_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stcq_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcr_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcs_t" 
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
                  CALL astt603_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt603_fetch("F")
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
               CALL astt603_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt603_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt603_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt603_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt603_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt603_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt603_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt603_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt603_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt603_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt603_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stcr_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stcr2_d)
                  LET g_export_id[2]   = "s_detail2"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  
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
               NEXT FIELD stcrseq
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
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt603_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt603_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt603_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt603_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt603_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt603_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt603_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt603_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt603_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt603_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt603_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stcq_m.stcqdocdt)
 
 
 
         
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
 
{<section id="astt603.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt603_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_ooef019         LIKE ooef_t.ooef019
   DEFINE l_where           STRING
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   
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
   CALL s_aooi500_sql_where(g_prog,'stcqsite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   LET l_wc  = g_wc.trim() 
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stcqdocno ",
                      " FROM stcq_t ",
                      " ",
                      " LEFT JOIN stcr_t ON stcrent = stcqent AND stcqdocno = stcrdocno ", "  ",
                      #add-point:browser_fill段sql(stcr_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stcs_t ON stcsent = stcqent AND stcqdocno = stcsdocno", "  ",
                      #add-point:browser_fill段sql(stcs_t1) name="browser_fill.cnt.join.stcs_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stcqent = " ||g_enterprise|| " AND stcrent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stcq_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stcqdocno ",
                      " FROM stcq_t ", 
                      "  ",
                      "  ",
                      " WHERE stcqent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stcq_t")
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
      INITIALIZE g_stcq_m.* TO NULL
      CALL g_stcr_d.clear()        
      CALL g_stcr2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stcqdocno,t0.stcqdocdt,t0.stcqsite,t0.stcq001,t0.stcq003,t0.stcq004,t0.stcq005,t0.stcq006,t0.stcq007,t0.stcq008,t0.stcq009,t0.stcq010,t0.stcq011,t0.stcq012,t0.stcq013,t0.stcq014,t0.stcq015,t0.stcq016,t0.stcq017,t0.stcq018,t0.stcq019,t0.stcqunit Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcqstus,t0.stcqdocno,t0.stcqdocdt,t0.stcqsite,t0.stcq001,t0.stcq003, 
          t0.stcq004,t0.stcq005,t0.stcq006,t0.stcq007,t0.stcq008,t0.stcq009,t0.stcq010,t0.stcq011,t0.stcq012, 
          t0.stcq013,t0.stcq014,t0.stcq015,t0.stcq016,t0.stcq017,t0.stcq018,t0.stcq019,t0.stcqunit,t1.ooefl003 , 
          t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooefl003 , 
          t9.ooefl003 ,t10.dbbcl003 ,t11.oojdl003 ,t12.dbbal003 ,t13.ooefl003 ,t14.ooail003 ",
                  " FROM stcq_t t0",
                  "  ",
                  "  LEFT JOIN stcr_t ON stcrent = stcqent AND stcqdocno = stcrdocno ", "  ", 
                  #add-point:browser_fill段sql(stcr_t1) name="browser_fill.join.stcr_t1"
                  
                  #end add-point
                  "  LEFT JOIN stcs_t ON stcsent = stcqent AND stcqdocno = stcsdocno", "  ", 
                  #add-point:browser_fill段sql(stcs_t1) name="browser_fill.join.stcs_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcqsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcq003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcq006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcq007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcq008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcq009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stcq010 AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcq011 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t10 ON t10.dbbclent="||g_enterprise||" AND t10.dbbcl001=t0.stcq012 AND t10.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t11 ON t11.oojdlent="||g_enterprise||" AND t11.oojdl001=t0.stcq013 AND t11.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t12 ON t12.dbbalent="||g_enterprise||" AND t12.dbbal001=t0.stcq014 AND t12.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stcq015 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t14 ON t14.ooailent="||g_enterprise||" AND t14.ooail001=t0.stcq016 AND t14.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcqent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stcq_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcqstus,t0.stcqdocno,t0.stcqdocdt,t0.stcqsite,t0.stcq001,t0.stcq003, 
          t0.stcq004,t0.stcq005,t0.stcq006,t0.stcq007,t0.stcq008,t0.stcq009,t0.stcq010,t0.stcq011,t0.stcq012, 
          t0.stcq013,t0.stcq014,t0.stcq015,t0.stcq016,t0.stcq017,t0.stcq018,t0.stcq019,t0.stcqunit,t1.ooefl003 , 
          t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooefl003 , 
          t9.ooefl003 ,t10.dbbcl003 ,t11.oojdl003 ,t12.dbbal003 ,t13.ooefl003 ,t14.ooail003 ",
                  " FROM stcq_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcqsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcq003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcq006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcq007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcq008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcq009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stcq010 AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcq011 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t10 ON t10.dbbclent="||g_enterprise||" AND t10.dbbcl001=t0.stcq012 AND t10.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t11 ON t11.oojdlent="||g_enterprise||" AND t11.oojdl001=t0.stcq013 AND t11.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t12 ON t12.dbbalent="||g_enterprise||" AND t12.dbbal001=t0.stcq014 AND t12.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stcq015 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t14 ON t14.ooailent="||g_enterprise||" AND t14.ooail001=t0.stcq016 AND t14.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcqent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stcq_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stcqdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stcq_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stcqdocno,g_browser[g_cnt].b_stcqdocdt, 
          g_browser[g_cnt].b_stcqsite,g_browser[g_cnt].b_stcq001,g_browser[g_cnt].b_stcq003,g_browser[g_cnt].b_stcq004, 
          g_browser[g_cnt].b_stcq005,g_browser[g_cnt].b_stcq006,g_browser[g_cnt].b_stcq007,g_browser[g_cnt].b_stcq008, 
          g_browser[g_cnt].b_stcq009,g_browser[g_cnt].b_stcq010,g_browser[g_cnt].b_stcq011,g_browser[g_cnt].b_stcq012, 
          g_browser[g_cnt].b_stcq013,g_browser[g_cnt].b_stcq014,g_browser[g_cnt].b_stcq015,g_browser[g_cnt].b_stcq016, 
          g_browser[g_cnt].b_stcq017,g_browser[g_cnt].b_stcq018,g_browser[g_cnt].b_stcq019,g_browser[g_cnt].b_stcqunit, 
          g_browser[g_cnt].b_stcqsite_desc,g_browser[g_cnt].b_stcq003_desc,g_browser[g_cnt].b_stcq004_desc, 
          g_browser[g_cnt].b_stcq006_desc,g_browser[g_cnt].b_stcq007_desc,g_browser[g_cnt].b_stcq008_desc, 
          g_browser[g_cnt].b_stcq009_desc,g_browser[g_cnt].b_stcq010_desc,g_browser[g_cnt].b_stcq011_desc, 
          g_browser[g_cnt].b_stcq012_desc,g_browser[g_cnt].b_stcq013_desc,g_browser[g_cnt].b_stcq014_desc, 
          g_browser[g_cnt].b_stcq015_desc,g_browser[g_cnt].b_stcq016_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_browser[g_cnt].b_stcqsite
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_stcq017
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_stcq017_desc = '', g_rtn_fields[1] , ''
         #end add-point
      
         #遮罩相關處理
         CALL astt603_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stcqdocno) THEN
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
 
{<section id="astt603.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt603_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stcq_m.stcqdocno = g_browser[g_current_idx].b_stcqdocno   
 
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
   CALL astt603_stcq_t_mask()
   CALL astt603_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt603.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt603_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt603_ui_browser_refresh()
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
      IF g_browser[l_i].b_stcqdocno = g_stcq_m.stcqdocno 
 
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
 
{<section id="astt603.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt603_construct()
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
   INITIALIZE g_stcq_m.* TO NULL
   CALL g_stcr_d.clear()        
   CALL g_stcr2_d.clear() 
 
   
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
      CONSTRUCT BY NAME g_wc ON stcqsite,stcqdocdt,stcqdocno,stcqunit,stcq001,stcq003,stcq004,stcq002, 
          stcq005,stcq006,stcq007,stcqstus,stcq008,stcq009,stcq016,stcq017,stcq010,stcq011,stcq012,stcq018, 
          stcq013,stcq014,stcq015,stcq019,stcqownid,stcqowndp,stcqcrtid,stcqcrtdp,stcqcrtdt,stcqmodid, 
          stcqmoddt,stcqcnfid,stcqcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stcqcrtdt>>----
         AFTER FIELD stcqcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stcqmoddt>>----
         AFTER FIELD stcqmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcqcnfdt>>----
         AFTER FIELD stcqcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcqpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stcqsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqsite
            #add-point:ON ACTION controlp INFIELD stcqsite name="construct.c.stcqsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef201 = 'Y' "
#            CALL q_ooef001()                        #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcqsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stcqsite  #顯示到畫面上
            NEXT FIELD stcqsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqsite
            #add-point:BEFORE FIELD stcqsite name="construct.b.stcqsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqsite
            
            #add-point:AFTER FIELD stcqsite name="construct.a.stcqsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqdocdt
            #add-point:BEFORE FIELD stcqdocdt name="construct.b.stcqdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqdocdt
            
            #add-point:AFTER FIELD stcqdocdt name="construct.a.stcqdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqdocdt
            #add-point:ON ACTION controlp INFIELD stcqdocdt name="construct.c.stcqdocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqdocno
            #add-point:BEFORE FIELD stcqdocno name="construct.b.stcqdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqdocno
            
            #add-point:AFTER FIELD stcqdocno name="construct.a.stcqdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqdocno
            #add-point:ON ACTION controlp INFIELD stcqdocno name="construct.c.stcqdocno"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stcqdocno()
            DISPLAY g_qryparam.return1 TO stcqdocno
            ###  ### end ###

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqunit
            #add-point:BEFORE FIELD stcqunit name="construct.b.stcqunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqunit
            
            #add-point:AFTER FIELD stcqunit name="construct.a.stcqunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqunit
            #add-point:ON ACTION controlp INFIELD stcqunit name="construct.c.stcqunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq001
            #add-point:BEFORE FIELD stcq001 name="construct.b.stcq001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq001
            
            #add-point:AFTER FIELD stcq001 name="construct.a.stcq001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq001
            #add-point:ON ACTION controlp INFIELD stcq001 name="construct.c.stcq001"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stce001_2()
            DISPLAY g_qryparam.return1 TO stcq001
            ###  ### end ###

            #END add-point
 
 
         #Ctrlp:construct.c.stcq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq003
            #add-point:ON ACTION controlp INFIELD stcq003 name="construct.c.stcq003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq003  #顯示到畫面上
            NEXT FIELD stcq003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq003
            #add-point:BEFORE FIELD stcq003 name="construct.b.stcq003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq003
            
            #add-point:AFTER FIELD stcq003 name="construct.a.stcq003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq004
            #add-point:ON ACTION controlp INFIELD stcq004 name="construct.c.stcq004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq004  #顯示到畫面上
            NEXT FIELD stcq004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq004
            #add-point:BEFORE FIELD stcq004 name="construct.b.stcq004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq004
            
            #add-point:AFTER FIELD stcq004 name="construct.a.stcq004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq002
            #add-point:BEFORE FIELD stcq002 name="construct.b.stcq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq002
            
            #add-point:AFTER FIELD stcq002 name="construct.a.stcq002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq002
            #add-point:ON ACTION controlp INFIELD stcq002 name="construct.c.stcq002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq005
            #add-point:BEFORE FIELD stcq005 name="construct.b.stcq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq005
            
            #add-point:AFTER FIELD stcq005 name="construct.a.stcq005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq005
            #add-point:ON ACTION controlp INFIELD stcq005 name="construct.c.stcq005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcq006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq006
            #add-point:ON ACTION controlp INFIELD stcq006 name="construct.c.stcq006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq006  #顯示到畫面上
            NEXT FIELD stcq006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq006
            #add-point:BEFORE FIELD stcq006 name="construct.b.stcq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq006
            
            #add-point:AFTER FIELD stcq006 name="construct.a.stcq006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq007
            #add-point:ON ACTION controlp INFIELD stcq007 name="construct.c.stcq007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq007  #顯示到畫面上
            NEXT FIELD stcq007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq007
            #add-point:BEFORE FIELD stcq007 name="construct.b.stcq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq007
            
            #add-point:AFTER FIELD stcq007 name="construct.a.stcq007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqstus
            #add-point:BEFORE FIELD stcqstus name="construct.b.stcqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqstus
            
            #add-point:AFTER FIELD stcqstus name="construct.a.stcqstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqstus
            #add-point:ON ACTION controlp INFIELD stcqstus name="construct.c.stcqstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcq008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq008
            #add-point:ON ACTION controlp INFIELD stcq008 name="construct.c.stcq008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq008  #顯示到畫面上
            NEXT FIELD stcq008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq008
            #add-point:BEFORE FIELD stcq008 name="construct.b.stcq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq008
            
            #add-point:AFTER FIELD stcq008 name="construct.a.stcq008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq009
            #add-point:ON ACTION controlp INFIELD stcq009 name="construct.c.stcq009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq009  #顯示到畫面上
            NEXT FIELD stcq009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq009
            #add-point:BEFORE FIELD stcq009 name="construct.b.stcq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq009
            
            #add-point:AFTER FIELD stcq009 name="construct.a.stcq009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq016
            #add-point:ON ACTION controlp INFIELD stcq016 name="construct.c.stcq016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq016  #顯示到畫面上
            NEXT FIELD stcq016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq016
            #add-point:BEFORE FIELD stcq016 name="construct.b.stcq016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq016
            
            #add-point:AFTER FIELD stcq016 name="construct.a.stcq016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq017
            #add-point:ON ACTION controlp INFIELD stcq017 name="construct.c.stcq017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmab084()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq017  #顯示到畫面上
            NEXT FIELD stcq017                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq017
            #add-point:BEFORE FIELD stcq017 name="construct.b.stcq017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq017
            
            #add-point:AFTER FIELD stcq017 name="construct.a.stcq017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq010
            #add-point:ON ACTION controlp INFIELD stcq010 name="construct.c.stcq010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef212 = 'Y' "
#            CALL q_ooef001()                        #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stcq010') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcq010',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef212 = 'Y' "
               CALL q_ooef001()   
            END IF

            DISPLAY g_qryparam.return1 TO stcq010  #顯示到畫面上
            NEXT FIELD stcq010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq010
            #add-point:BEFORE FIELD stcq010 name="construct.b.stcq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq010
            
            #add-point:AFTER FIELD stcq010 name="construct.a.stcq010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq011
            #add-point:ON ACTION controlp INFIELD stcq011 name="construct.c.stcq011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef201 = 'Y' "
#            CALL q_ooef001()                        #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stcq011') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcq011',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef201 = 'Y' "
               CALL q_ooef001()   
            END IF
            DISPLAY g_qryparam.return1 TO stcq011  #顯示到畫面上
            NEXT FIELD stcq011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq011
            #add-point:BEFORE FIELD stcq011 name="construct.b.stcq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq011
            
            #add-point:AFTER FIELD stcq011 name="construct.a.stcq011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq012
            #add-point:ON ACTION controlp INFIELD stcq012 name="construct.c.stcq012"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbbc001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq012  #顯示到畫面上
            NEXT FIELD stcq012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq012
            #add-point:BEFORE FIELD stcq012 name="construct.b.stcq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq012
            
            #add-point:AFTER FIELD stcq012 name="construct.a.stcq012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq018
            #add-point:BEFORE FIELD stcq018 name="construct.b.stcq018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq018
            
            #add-point:AFTER FIELD stcq018 name="construct.a.stcq018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq018
            #add-point:ON ACTION controlp INFIELD stcq018 name="construct.c.stcq018"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcq013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq013
            #add-point:ON ACTION controlp INFIELD stcq013 name="construct.c.stcq013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '1'
            CALL q_oojd001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq013  #顯示到畫面上
            NEXT FIELD stcq013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq013
            #add-point:BEFORE FIELD stcq013 name="construct.b.stcq013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq013
            
            #add-point:AFTER FIELD stcq013 name="construct.a.stcq013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq014
            #add-point:ON ACTION controlp INFIELD stcq014 name="construct.c.stcq014"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcq014  #顯示到畫面上
            NEXT FIELD stcq014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq014
            #add-point:BEFORE FIELD stcq014 name="construct.b.stcq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq014
            
            #add-point:AFTER FIELD stcq014 name="construct.a.stcq014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq015
            #add-point:ON ACTION controlp INFIELD stcq015 name="construct.c.stcq015"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef305 = 'Y' "
#            CALL q_ooef001()                          #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stcq015') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcq015',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef305 = 'Y' "
               CALL q_ooef001()   
            END IF
            DISPLAY g_qryparam.return1 TO stcq015  #顯示到畫面上
            NEXT FIELD stcq015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq015
            #add-point:BEFORE FIELD stcq015 name="construct.b.stcq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq015
            
            #add-point:AFTER FIELD stcq015 name="construct.a.stcq015"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq019
            #add-point:BEFORE FIELD stcq019 name="construct.b.stcq019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq019
            
            #add-point:AFTER FIELD stcq019 name="construct.a.stcq019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcq019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq019
            #add-point:ON ACTION controlp INFIELD stcq019 name="construct.c.stcq019"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcqownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqownid
            #add-point:ON ACTION controlp INFIELD stcqownid name="construct.c.stcqownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqownid  #顯示到畫面上
            NEXT FIELD stcqownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqownid
            #add-point:BEFORE FIELD stcqownid name="construct.b.stcqownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqownid
            
            #add-point:AFTER FIELD stcqownid name="construct.a.stcqownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqowndp
            #add-point:ON ACTION controlp INFIELD stcqowndp name="construct.c.stcqowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqowndp  #顯示到畫面上
            NEXT FIELD stcqowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqowndp
            #add-point:BEFORE FIELD stcqowndp name="construct.b.stcqowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqowndp
            
            #add-point:AFTER FIELD stcqowndp name="construct.a.stcqowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqcrtid
            #add-point:ON ACTION controlp INFIELD stcqcrtid name="construct.c.stcqcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqcrtid  #顯示到畫面上
            NEXT FIELD stcqcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqcrtid
            #add-point:BEFORE FIELD stcqcrtid name="construct.b.stcqcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqcrtid
            
            #add-point:AFTER FIELD stcqcrtid name="construct.a.stcqcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcqcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqcrtdp
            #add-point:ON ACTION controlp INFIELD stcqcrtdp name="construct.c.stcqcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqcrtdp  #顯示到畫面上
            NEXT FIELD stcqcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqcrtdp
            #add-point:BEFORE FIELD stcqcrtdp name="construct.b.stcqcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqcrtdp
            
            #add-point:AFTER FIELD stcqcrtdp name="construct.a.stcqcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqcrtdt
            #add-point:BEFORE FIELD stcqcrtdt name="construct.b.stcqcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcqmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqmodid
            #add-point:ON ACTION controlp INFIELD stcqmodid name="construct.c.stcqmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqmodid  #顯示到畫面上
            NEXT FIELD stcqmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqmodid
            #add-point:BEFORE FIELD stcqmodid name="construct.b.stcqmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqmodid
            
            #add-point:AFTER FIELD stcqmodid name="construct.a.stcqmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqmoddt
            #add-point:BEFORE FIELD stcqmoddt name="construct.b.stcqmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcqcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqcnfid
            #add-point:ON ACTION controlp INFIELD stcqcnfid name="construct.c.stcqcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcqcnfid  #顯示到畫面上
            NEXT FIELD stcqcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqcnfid
            #add-point:BEFORE FIELD stcqcnfid name="construct.b.stcqcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqcnfid
            
            #add-point:AFTER FIELD stcqcnfid name="construct.a.stcqcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqcnfdt
            #add-point:BEFORE FIELD stcqcnfdt name="construct.b.stcqcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stcrseq,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006,stcr007,stcr008, 
          stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015,stcr016,stcr017,stcr018, 
          stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit
           FROM s_detail1[1].stcrseq,s_detail1[1].stcr001,s_detail1[1].stcr002,s_detail1[1].stcr003, 
               s_detail1[1].stcr004,s_detail1[1].stcr005,s_detail1[1].stcr006,s_detail1[1].stcr007,s_detail1[1].stcr008, 
               s_detail1[1].stcr009,s_detail1[1].stcr010,s_detail1[1].stcr023,s_detail1[1].stcr024,s_detail1[1].stcr011, 
               s_detail1[1].stcr012,s_detail1[1].stcr013,s_detail1[1].stcr014,s_detail1[1].stcr015,s_detail1[1].stcr016, 
               s_detail1[1].stcr017,s_detail1[1].stcr018,s_detail1[1].stcr019,s_detail1[1].stcr020,s_detail1[1].stcr021, 
               s_detail1[1].stcr022,s_detail1[1].stcrsite,s_detail1[1].stcrunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrseq
            #add-point:BEFORE FIELD stcrseq name="construct.b.page1.stcrseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrseq
            
            #add-point:AFTER FIELD stcrseq name="construct.a.page1.stcrseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcrseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrseq
            #add-point:ON ACTION controlp INFIELD stcrseq name="construct.c.page1.stcrseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stcr001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr001
            #add-point:ON ACTION controlp INFIELD stcr001 name="construct.c.page1.stcr001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stae002 = '2' "
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcr001  #顯示到畫面上
            NEXT FIELD stcr001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr001
            #add-point:BEFORE FIELD stcr001 name="construct.b.page1.stcr001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr001
            
            #add-point:AFTER FIELD stcr001 name="construct.a.page1.stcr001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr002
            #add-point:BEFORE FIELD stcr002 name="construct.b.page1.stcr002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr002
            
            #add-point:AFTER FIELD stcr002 name="construct.a.page1.stcr002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr002
            #add-point:ON ACTION controlp INFIELD stcr002 name="construct.c.page1.stcr002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr003
            #add-point:BEFORE FIELD stcr003 name="construct.b.page1.stcr003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr003
            
            #add-point:AFTER FIELD stcr003 name="construct.a.page1.stcr003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr003
            #add-point:ON ACTION controlp INFIELD stcr003 name="construct.c.page1.stcr003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr004
            #add-point:BEFORE FIELD stcr004 name="construct.b.page1.stcr004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr004
            
            #add-point:AFTER FIELD stcr004 name="construct.a.page1.stcr004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr004
            #add-point:ON ACTION controlp INFIELD stcr004 name="construct.c.page1.stcr004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr005
            #add-point:BEFORE FIELD stcr005 name="construct.b.page1.stcr005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr005
            
            #add-point:AFTER FIELD stcr005 name="construct.a.page1.stcr005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr005
            #add-point:ON ACTION controlp INFIELD stcr005 name="construct.c.page1.stcr005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr006
            #add-point:BEFORE FIELD stcr006 name="construct.b.page1.stcr006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr006
            
            #add-point:AFTER FIELD stcr006 name="construct.a.page1.stcr006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr006
            #add-point:ON ACTION controlp INFIELD stcr006 name="construct.c.page1.stcr006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr007
            #add-point:BEFORE FIELD stcr007 name="construct.b.page1.stcr007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr007
            
            #add-point:AFTER FIELD stcr007 name="construct.a.page1.stcr007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr007
            #add-point:ON ACTION controlp INFIELD stcr007 name="construct.c.page1.stcr007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr008
            #add-point:BEFORE FIELD stcr008 name="construct.b.page1.stcr008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr008
            
            #add-point:AFTER FIELD stcr008 name="construct.a.page1.stcr008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr008
            #add-point:ON ACTION controlp INFIELD stcr008 name="construct.c.page1.stcr008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr009
            #add-point:BEFORE FIELD stcr009 name="construct.b.page1.stcr009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr009
            
            #add-point:AFTER FIELD stcr009 name="construct.a.page1.stcr009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr009
            #add-point:ON ACTION controlp INFIELD stcr009 name="construct.c.page1.stcr009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr010
            #add-point:BEFORE FIELD stcr010 name="construct.b.page1.stcr010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr010
            
            #add-point:AFTER FIELD stcr010 name="construct.a.page1.stcr010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr010
            #add-point:ON ACTION controlp INFIELD stcr010 name="construct.c.page1.stcr010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr023
            #add-point:BEFORE FIELD stcr023 name="construct.b.page1.stcr023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr023
            
            #add-point:AFTER FIELD stcr023 name="construct.a.page1.stcr023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr023
            #add-point:ON ACTION controlp INFIELD stcr023 name="construct.c.page1.stcr023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr024
            #add-point:BEFORE FIELD stcr024 name="construct.b.page1.stcr024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr024
            
            #add-point:AFTER FIELD stcr024 name="construct.a.page1.stcr024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr024
            #add-point:ON ACTION controlp INFIELD stcr024 name="construct.c.page1.stcr024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr011
            #add-point:BEFORE FIELD stcr011 name="construct.b.page1.stcr011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr011
            
            #add-point:AFTER FIELD stcr011 name="construct.a.page1.stcr011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr011
            #add-point:ON ACTION controlp INFIELD stcr011 name="construct.c.page1.stcr011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr012
            #add-point:BEFORE FIELD stcr012 name="construct.b.page1.stcr012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr012
            
            #add-point:AFTER FIELD stcr012 name="construct.a.page1.stcr012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr012
            #add-point:ON ACTION controlp INFIELD stcr012 name="construct.c.page1.stcr012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr013
            #add-point:BEFORE FIELD stcr013 name="construct.b.page1.stcr013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr013
            
            #add-point:AFTER FIELD stcr013 name="construct.a.page1.stcr013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr013
            #add-point:ON ACTION controlp INFIELD stcr013 name="construct.c.page1.stcr013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr014
            #add-point:BEFORE FIELD stcr014 name="construct.b.page1.stcr014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr014
            
            #add-point:AFTER FIELD stcr014 name="construct.a.page1.stcr014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr014
            #add-point:ON ACTION controlp INFIELD stcr014 name="construct.c.page1.stcr014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr015
            #add-point:BEFORE FIELD stcr015 name="construct.b.page1.stcr015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr015
            
            #add-point:AFTER FIELD stcr015 name="construct.a.page1.stcr015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr015
            #add-point:ON ACTION controlp INFIELD stcr015 name="construct.c.page1.stcr015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr016
            #add-point:BEFORE FIELD stcr016 name="construct.b.page1.stcr016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr016
            
            #add-point:AFTER FIELD stcr016 name="construct.a.page1.stcr016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr016
            #add-point:ON ACTION controlp INFIELD stcr016 name="construct.c.page1.stcr016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr017
            #add-point:BEFORE FIELD stcr017 name="construct.b.page1.stcr017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr017
            
            #add-point:AFTER FIELD stcr017 name="construct.a.page1.stcr017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr017
            #add-point:ON ACTION controlp INFIELD stcr017 name="construct.c.page1.stcr017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr018
            #add-point:BEFORE FIELD stcr018 name="construct.b.page1.stcr018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr018
            
            #add-point:AFTER FIELD stcr018 name="construct.a.page1.stcr018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr018
            #add-point:ON ACTION controlp INFIELD stcr018 name="construct.c.page1.stcr018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr019
            #add-point:BEFORE FIELD stcr019 name="construct.b.page1.stcr019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr019
            
            #add-point:AFTER FIELD stcr019 name="construct.a.page1.stcr019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr019
            #add-point:ON ACTION controlp INFIELD stcr019 name="construct.c.page1.stcr019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr020
            #add-point:BEFORE FIELD stcr020 name="construct.b.page1.stcr020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr020
            
            #add-point:AFTER FIELD stcr020 name="construct.a.page1.stcr020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr020
            #add-point:ON ACTION controlp INFIELD stcr020 name="construct.c.page1.stcr020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr021
            #add-point:BEFORE FIELD stcr021 name="construct.b.page1.stcr021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr021
            
            #add-point:AFTER FIELD stcr021 name="construct.a.page1.stcr021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr021
            #add-point:ON ACTION controlp INFIELD stcr021 name="construct.c.page1.stcr021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr022
            #add-point:BEFORE FIELD stcr022 name="construct.b.page1.stcr022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr022
            
            #add-point:AFTER FIELD stcr022 name="construct.a.page1.stcr022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcr022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr022
            #add-point:ON ACTION controlp INFIELD stcr022 name="construct.c.page1.stcr022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrsite
            #add-point:BEFORE FIELD stcrsite name="construct.b.page1.stcrsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrsite
            
            #add-point:AFTER FIELD stcrsite name="construct.a.page1.stcrsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcrsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrsite
            #add-point:ON ACTION controlp INFIELD stcrsite name="construct.c.page1.stcrsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrunit
            #add-point:BEFORE FIELD stcrunit name="construct.b.page1.stcrunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrunit
            
            #add-point:AFTER FIELD stcrunit name="construct.a.page1.stcrunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcrunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrunit
            #add-point:ON ACTION controlp INFIELD stcrunit name="construct.c.page1.stcrunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stcsseq,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006,stcs007,stcssite, 
          stcsunit
           FROM s_detail2[1].stcsseq,s_detail2[1].stcs001,s_detail2[1].stcs002,s_detail2[1].stcs003, 
               s_detail2[1].stcs004,s_detail2[1].stcs005,s_detail2[1].stcs006,s_detail2[1].stcs007,s_detail2[1].stcssite, 
               s_detail2[1].stcsunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcsseq
            #add-point:BEFORE FIELD stcsseq name="construct.b.page2.stcsseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcsseq
            
            #add-point:AFTER FIELD stcsseq name="construct.a.page2.stcsseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcsseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcsseq
            #add-point:ON ACTION controlp INFIELD stcsseq name="construct.c.page2.stcsseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs001
            #add-point:BEFORE FIELD stcs001 name="construct.b.page2.stcs001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs001
            
            #add-point:AFTER FIELD stcs001 name="construct.a.page2.stcs001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs001
            #add-point:ON ACTION controlp INFIELD stcs001 name="construct.c.page2.stcs001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs002
            #add-point:BEFORE FIELD stcs002 name="construct.b.page2.stcs002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs002
            
            #add-point:AFTER FIELD stcs002 name="construct.a.page2.stcs002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs002
            #add-point:ON ACTION controlp INFIELD stcs002 name="construct.c.page2.stcs002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs003
            #add-point:BEFORE FIELD stcs003 name="construct.b.page2.stcs003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs003
            
            #add-point:AFTER FIELD stcs003 name="construct.a.page2.stcs003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs003
            #add-point:ON ACTION controlp INFIELD stcs003 name="construct.c.page2.stcs003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs004
            #add-point:BEFORE FIELD stcs004 name="construct.b.page2.stcs004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs004
            
            #add-point:AFTER FIELD stcs004 name="construct.a.page2.stcs004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs004
            #add-point:ON ACTION controlp INFIELD stcs004 name="construct.c.page2.stcs004"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stcs005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs005
            #add-point:ON ACTION controlp INFIELD stcs005 name="construct.c.page2.stcs005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcs005  #顯示到畫面上
            NEXT FIELD stcs005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs005
            #add-point:BEFORE FIELD stcs005 name="construct.b.page2.stcs005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs005
            
            #add-point:AFTER FIELD stcs005 name="construct.a.page2.stcs005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs006
            #add-point:BEFORE FIELD stcs006 name="construct.b.page2.stcs006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs006
            
            #add-point:AFTER FIELD stcs006 name="construct.a.page2.stcs006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs006
            #add-point:ON ACTION controlp INFIELD stcs006 name="construct.c.page2.stcs006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs007
            #add-point:BEFORE FIELD stcs007 name="construct.b.page2.stcs007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs007
            
            #add-point:AFTER FIELD stcs007 name="construct.a.page2.stcs007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcs007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs007
            #add-point:ON ACTION controlp INFIELD stcs007 name="construct.c.page2.stcs007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcssite
            #add-point:BEFORE FIELD stcssite name="construct.b.page2.stcssite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcssite
            
            #add-point:AFTER FIELD stcssite name="construct.a.page2.stcssite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcssite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcssite
            #add-point:ON ACTION controlp INFIELD stcssite name="construct.c.page2.stcssite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcsunit
            #add-point:BEFORE FIELD stcsunit name="construct.b.page2.stcsunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcsunit
            
            #add-point:AFTER FIELD stcsunit name="construct.a.page2.stcsunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcsunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcsunit
            #add-point:ON ACTION controlp INFIELD stcsunit name="construct.c.page2.stcsunit"
            
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
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stcq_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcr_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcs_t" 
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
 
{<section id="astt603.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt603_filter()
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
      CONSTRUCT g_wc_filter ON stcqdocno,stcqdocdt,stcqsite,stcq001,stcq003,stcq004,stcq005,stcq006, 
          stcq007,stcq008,stcq009,stcq010,stcq011,stcq012,stcq013,stcq014,stcq015,stcq016,stcq017,stcq018, 
          stcq019,stcqunit
                          FROM s_browse[1].b_stcqdocno,s_browse[1].b_stcqdocdt,s_browse[1].b_stcqsite, 
                              s_browse[1].b_stcq001,s_browse[1].b_stcq003,s_browse[1].b_stcq004,s_browse[1].b_stcq005, 
                              s_browse[1].b_stcq006,s_browse[1].b_stcq007,s_browse[1].b_stcq008,s_browse[1].b_stcq009, 
                              s_browse[1].b_stcq010,s_browse[1].b_stcq011,s_browse[1].b_stcq012,s_browse[1].b_stcq013, 
                              s_browse[1].b_stcq014,s_browse[1].b_stcq015,s_browse[1].b_stcq016,s_browse[1].b_stcq017, 
                              s_browse[1].b_stcq018,s_browse[1].b_stcq019,s_browse[1].b_stcqunit
 
         BEFORE CONSTRUCT
               DISPLAY astt603_filter_parser('stcqdocno') TO s_browse[1].b_stcqdocno
            DISPLAY astt603_filter_parser('stcqdocdt') TO s_browse[1].b_stcqdocdt
            DISPLAY astt603_filter_parser('stcqsite') TO s_browse[1].b_stcqsite
            DISPLAY astt603_filter_parser('stcq001') TO s_browse[1].b_stcq001
            DISPLAY astt603_filter_parser('stcq003') TO s_browse[1].b_stcq003
            DISPLAY astt603_filter_parser('stcq004') TO s_browse[1].b_stcq004
            DISPLAY astt603_filter_parser('stcq005') TO s_browse[1].b_stcq005
            DISPLAY astt603_filter_parser('stcq006') TO s_browse[1].b_stcq006
            DISPLAY astt603_filter_parser('stcq007') TO s_browse[1].b_stcq007
            DISPLAY astt603_filter_parser('stcq008') TO s_browse[1].b_stcq008
            DISPLAY astt603_filter_parser('stcq009') TO s_browse[1].b_stcq009
            DISPLAY astt603_filter_parser('stcq010') TO s_browse[1].b_stcq010
            DISPLAY astt603_filter_parser('stcq011') TO s_browse[1].b_stcq011
            DISPLAY astt603_filter_parser('stcq012') TO s_browse[1].b_stcq012
            DISPLAY astt603_filter_parser('stcq013') TO s_browse[1].b_stcq013
            DISPLAY astt603_filter_parser('stcq014') TO s_browse[1].b_stcq014
            DISPLAY astt603_filter_parser('stcq015') TO s_browse[1].b_stcq015
            DISPLAY astt603_filter_parser('stcq016') TO s_browse[1].b_stcq016
            DISPLAY astt603_filter_parser('stcq017') TO s_browse[1].b_stcq017
            DISPLAY astt603_filter_parser('stcq018') TO s_browse[1].b_stcq018
            DISPLAY astt603_filter_parser('stcq019') TO s_browse[1].b_stcq019
            DISPLAY astt603_filter_parser('stcqunit') TO s_browse[1].b_stcqunit
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         DISPLAY '' TO s_browse[1].b_stcqsite_desc 
         DISPLAY '' TO s_browse[1].b_stcq003_desc
         DISPLAY '' TO s_browse[1].b_stcq004_desc
         DISPLAY '' TO s_browse[1].b_stcq006_desc
         DISPLAY '' TO s_browse[1].b_stcq007_desc
         DISPLAY '' TO s_browse[1].b_stcq008_desc
         DISPLAY '' TO s_browse[1].b_stcq009_desc
         DISPLAY '' TO s_browse[1].b_stcq010_desc
         DISPLAY '' TO s_browse[1].b_stcq011_desc
         DISPLAY '' TO s_browse[1].b_stcq012_desc
         DISPLAY '' TO s_browse[1].b_stcq013_desc
         DISPLAY '' TO s_browse[1].b_stcq014_desc
         DISPLAY '' TO s_browse[1].b_stcq015_desc
         DISPLAY '' TO s_browse[1].b_stcq016_desc
         DISPLAY '' TO s_browse[1].b_stcq017_desc
         
         
         ON ACTION controlp INFIELD b_stcqsite
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef201 = 'Y' "
            CALL q_ooef001()                            #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcqsite  #顯示到畫面上
            NEXT FIELD b_stcqsite      


         ON ACTION controlp INFIELD b_stcqdocno
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stcqdocno()
            DISPLAY g_qryparam.return1 TO b_stcqdocno

         ON ACTION controlp INFIELD b_stcq001
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stce001_2()
            DISPLAY g_qryparam.return1 TO b_stcq001

         ON ACTION controlp INFIELD b_stcq003
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq003  #顯示到畫面上
            NEXT FIELD b_stcq003      

         ON ACTION controlp INFIELD b_stcq004
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq004  #顯示到畫面上
            NEXT FIELD b_stcq004  

         ON ACTION controlp INFIELD b_stcq006
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq006  #顯示到畫面上
            NEXT FIELD b_stcq006                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq007
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq007  #顯示到畫面上
            NEXT FIELD b_stcq007    

         ON ACTION controlp INFIELD b_stcq008
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq008  #顯示到畫面上
            NEXT FIELD b_stcq008                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq009
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq009  #顯示到畫面上
            NEXT FIELD b_stcq009                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq016
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq016  #顯示到畫面上
            NEXT FIELD b_stcq016                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq017
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmab084()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq017  #顯示到畫面上
            NEXT FIELD b_stcq017                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef212 = 'Y' "
            CALL q_ooef001()                        #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq010  #顯示到畫面上
            NEXT FIELD b_stcq010                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq011
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef201 = 'Y' "
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq011  #顯示到畫面上
            NEXT FIELD b_stcq011                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq012
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbbc001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq012  #顯示到畫面上
            NEXT FIELD b_stcq012                     #返回原欄位	

         ON ACTION controlp INFIELD b_stcq013
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '1'
            CALL q_oojd001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq013  #顯示到畫面上
            NEXT FIELD b_stcq013                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq014
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq014  #顯示到畫面上
            NEXT FIELD b_stcq014                     #返回原欄位

         ON ACTION controlp INFIELD b_stcq015
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef305 = 'Y' "
            CALL q_ooef001()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcq015  #顯示到畫面上
            NEXT FIELD b_stcq015                     #返回原欄位
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
 
      CALL astt603_filter_show('stcqdocno')
   CALL astt603_filter_show('stcqdocdt')
   CALL astt603_filter_show('stcqsite')
   CALL astt603_filter_show('stcq001')
   CALL astt603_filter_show('stcq003')
   CALL astt603_filter_show('stcq004')
   CALL astt603_filter_show('stcq005')
   CALL astt603_filter_show('stcq006')
   CALL astt603_filter_show('stcq007')
   CALL astt603_filter_show('stcq008')
   CALL astt603_filter_show('stcq009')
   CALL astt603_filter_show('stcq010')
   CALL astt603_filter_show('stcq011')
   CALL astt603_filter_show('stcq012')
   CALL astt603_filter_show('stcq013')
   CALL astt603_filter_show('stcq014')
   CALL astt603_filter_show('stcq015')
   CALL astt603_filter_show('stcq016')
   CALL astt603_filter_show('stcq017')
   CALL astt603_filter_show('stcq018')
   CALL astt603_filter_show('stcq019')
   CALL astt603_filter_show('stcqunit')
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt603_filter_parser(ps_field)
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
 
{<section id="astt603.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt603_filter_show(ps_field)
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
   LET ls_condition = astt603_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt603_query()
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
   CALL g_stcr_d.clear()
   CALL g_stcr2_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt603_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt603_browser_fill("")
      CALL astt603_fetch("")
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
      CALL astt603_filter_show('stcqdocno')
   CALL astt603_filter_show('stcqdocdt')
   CALL astt603_filter_show('stcqsite')
   CALL astt603_filter_show('stcq001')
   CALL astt603_filter_show('stcq003')
   CALL astt603_filter_show('stcq004')
   CALL astt603_filter_show('stcq005')
   CALL astt603_filter_show('stcq006')
   CALL astt603_filter_show('stcq007')
   CALL astt603_filter_show('stcq008')
   CALL astt603_filter_show('stcq009')
   CALL astt603_filter_show('stcq010')
   CALL astt603_filter_show('stcq011')
   CALL astt603_filter_show('stcq012')
   CALL astt603_filter_show('stcq013')
   CALL astt603_filter_show('stcq014')
   CALL astt603_filter_show('stcq015')
   CALL astt603_filter_show('stcq016')
   CALL astt603_filter_show('stcq017')
   CALL astt603_filter_show('stcq018')
   CALL astt603_filter_show('stcq019')
   CALL astt603_filter_show('stcqunit')
   CALL astt603_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt603_fetch("F") 
      #顯示單身筆數
      CALL astt603_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt603_fetch(p_flag)
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
   
   LET g_stcq_m.stcqdocno = g_browser[g_current_idx].b_stcqdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
   #遮罩相關處理
   LET g_stcq_m_mask_o.* =  g_stcq_m.*
   CALL astt603_stcq_t_mask()
   LET g_stcq_m_mask_n.* =  g_stcq_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt603_set_act_visible()   
   CALL astt603_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stcq_m.stcqstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF NOT cl_bpm_chk() THEN    #此單據不需提交至BPM，則隱藏按鈕 
       CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stcq_m_t.* = g_stcq_m.*
   LET g_stcq_m_o.* = g_stcq_m.*
   
   LET g_data_owner = g_stcq_m.stcqownid      
   LET g_data_dept  = g_stcq_m.stcqowndp
   
   #重新顯示   
   CALL astt603_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt603_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert      LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stcr_d.clear()   
   CALL g_stcr2_d.clear()  
 
 
   INITIALIZE g_stcq_m.* TO NULL             #DEFAULT 設定
   
   LET g_stcqdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcq_m.stcqownid = g_user
      LET g_stcq_m.stcqowndp = g_dept
      LET g_stcq_m.stcqcrtid = g_user
      LET g_stcq_m.stcqcrtdp = g_dept 
      LET g_stcq_m.stcqcrtdt = cl_get_current()
      LET g_stcq_m.stcqmodid = g_user
      LET g_stcq_m.stcqmoddt = cl_get_current()
      LET g_stcq_m.stcqstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
#      LET g_stcq_m.stcqsite = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stcqsite',g_stcq_m.stcqsite)
         RETURNING l_insert,g_stcq_m.stcqsite
      IF NOT l_insert THEN
         RETURN
      END IF
      LET g_stcq_m.stcqunit = g_site
      LET g_stcq_m.stcqdocdt = g_today
      #dongsz--add--str---
      #預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stcq_m.stcqsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stcq_m.stcqdocno = r_doctype
      #dongsz--add--end---
      LET g_stcq_m.stcq008 = g_user
      SELECT ooag003 INTO g_stcq_m.stcq009
        FROM ooag_t 
       WHERE ooagent = g_enterprise
         AND ooag001 = g_user
      INITIALIZE g_stcq_m_t.* TO NULL
      LET g_stcq_m_t.* = g_stcq_m.*
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stcq_m_t.* = g_stcq_m.*
      LET g_stcq_m_o.* = g_stcq_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcq_m.stcqstus 
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
 
 
 
    
      CALL astt603_input("a")
      
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
         INITIALIZE g_stcq_m.* TO NULL
         INITIALIZE g_stcr_d TO NULL
         INITIALIZE g_stcr2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt603_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stcr_d.clear()
      #CALL g_stcr2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt603_set_act_visible()   
   CALL astt603_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcqent = " ||g_enterprise|| " AND",
                      " stcqdocno = '", g_stcq_m.stcqdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt603_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt603_cl
   
   CALL astt603_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
   
   #遮罩相關處理
   LET g_stcq_m_mask_o.* =  g_stcq_m.*
   CALL astt603_stcq_t_mask()
   LET g_stcq_m_mask_n.* =  g_stcq_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit, 
       g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq003_desc,g_stcq_m.stcq004,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq006_desc,g_stcq_m.stcq007,g_stcq_m.stcq007_desc, 
       g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq008_desc,g_stcq_m.stcq009,g_stcq_m.stcq009_desc, 
       g_stcq_m.stcq016,g_stcq_m.stcq016_desc,g_stcq_m.stcq017,g_stcq_m.stcq017_desc,g_stcq_m.next_b, 
       g_stcq_m.stcq010,g_stcq_m.stcq010_desc,g_stcq_m.stcq011,g_stcq_m.stcq011_desc,g_stcq_m.stcq012, 
       g_stcq_m.stcq012_desc,g_stcq_m.stcq018,g_stcq_m.num,g_stcq_m.stcq013,g_stcq_m.stcq013_desc,g_stcq_m.stcq014, 
       g_stcq_m.stcq014_desc,g_stcq_m.stcq015,g_stcq_m.stcq015_desc,g_stcq_m.stcq019,g_stcq_m.stcqownid, 
       g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmodid_desc, 
       g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfid_desc,g_stcq_m.stcqcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stcq_m.stcqownid      
   LET g_data_dept  = g_stcq_m.stcqowndp
   
   #功能已完成,通報訊息中心
   CALL astt603_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt603_modify()
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
   LET g_stcq_m_t.* = g_stcq_m.*
   LET g_stcq_m_o.* = g_stcq_m.*
   
   IF g_stcq_m.stcqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
   CALL s_transaction_begin()
   
   OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt603_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt603_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcq_m_mask_o.* =  g_stcq_m.*
   CALL astt603_stcq_t_mask()
   LET g_stcq_m_mask_n.* =  g_stcq_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astt603_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stcq_m.stcqmodid = g_user 
LET g_stcq_m.stcqmoddt = cl_get_current()
LET g_stcq_m.stcqmodid_desc = cl_get_username(g_stcq_m.stcqmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stcq_m.stcqstus MATCHES "[DR]" THEN
         LET g_stcq_m.stcqstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt603_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stcq_t SET (stcqmodid,stcqmoddt) = (g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt)
          WHERE stcqent = g_enterprise AND stcqdocno = g_stcqdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stcq_m.* = g_stcq_m_t.*
            CALL astt603_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stcq_m.stcqdocno != g_stcq_m_t.stcqdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stcr_t SET stcrdocno = g_stcq_m.stcqdocno
 
          WHERE stcrent = g_enterprise AND stcrdocno = g_stcq_m_t.stcqdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcr_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
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
         
         UPDATE stcs_t
            SET stcsdocno = g_stcq_m.stcqdocno
 
          WHERE stcsent = g_enterprise AND
                stcsdocno = g_stcqdocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcs_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
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
   CALL astt603_set_act_visible()   
   CALL astt603_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stcqent = " ||g_enterprise|| " AND",
                      " stcqdocno = '", g_stcq_m.stcqdocno, "' "
 
   #填到對應位置
   CALL astt603_browser_fill("")
 
   CLOSE astt603_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt603_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt603.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt603_input(p_cmd)
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
   DEFINE l_ooef004              LIKE ooef_t.ooef004
   DEFINE l_success              LIKE type_t.num5
   DEFINE l_ooef019              LIKE ooef_t.ooef019
   DEFINE l_stae006              LIKE stae_t.stae006
   DEFINE l_stcw004 LIKE stcw_t.stcw004
   DEFINE  l_errno               LIKE type_t.chr10
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
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit, 
       g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq003_desc,g_stcq_m.stcq004,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq006_desc,g_stcq_m.stcq007,g_stcq_m.stcq007_desc, 
       g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq008_desc,g_stcq_m.stcq009,g_stcq_m.stcq009_desc, 
       g_stcq_m.stcq016,g_stcq_m.stcq016_desc,g_stcq_m.stcq017,g_stcq_m.stcq017_desc,g_stcq_m.next_b, 
       g_stcq_m.stcq010,g_stcq_m.stcq010_desc,g_stcq_m.stcq011,g_stcq_m.stcq011_desc,g_stcq_m.stcq012, 
       g_stcq_m.stcq012_desc,g_stcq_m.stcq018,g_stcq_m.num,g_stcq_m.stcq013,g_stcq_m.stcq013_desc,g_stcq_m.stcq014, 
       g_stcq_m.stcq014_desc,g_stcq_m.stcq015,g_stcq_m.stcq015_desc,g_stcq_m.stcq019,g_stcq_m.stcqownid, 
       g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmodid_desc, 
       g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfid_desc,g_stcq_m.stcqcnfdt
   
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
   LET g_forupd_sql = "SELECT stcrseq,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006,stcr007,stcr008, 
       stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015,stcr016,stcr017,stcr018, 
       stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit FROM stcr_t WHERE stcrent=? AND stcrdocno=?  
       AND stcrseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt603_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stcsseq,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006,stcs007,stcssite, 
       stcsunit FROM stcs_t WHERE stcsent=? AND stcsdocno=? AND stcsseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt603_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt603_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt603_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001, 
       g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq019
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqownid,g_stcq_m.stcqowndp,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,
                   g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt,g_stcq_m.stcqstus,g_stcq_m.stcqcnfid,
                   g_stcq_m.stcqcnfdt
   
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stcq_m.stcqsite

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcq008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcq_m.stcq008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcq008_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcq009
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcq009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcq009_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcq017
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcq017_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqsite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqsite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqsite_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqownid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqownid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqownid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqowndp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqowndp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqowndp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqcrtid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqcrtid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqcrtid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqcrtdp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqcrtdp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqcrtdp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqmodid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqmodid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqmodid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcqcnfid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcq_m.stcqcnfid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcqcnfid_desc
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt603.input.head" >}
      #單頭段
      INPUT BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001, 
          g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
          g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
          g_stcq_m.stcq019 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt603_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt603_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt603_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
 
            #end add-point
            CALL astt603_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqsite
            
            #add-point:AFTER FIELD stcqsite name="input.a.stcqsite"
            IF NOT cl_null(g_stcq_m.stcqsite) THEN
               CALL s_aooi500_chk(g_prog,'stcqsite',g_stcq_m.stcqsite,g_stcq_m.stcqsite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stcq_m.stcqsite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcqsite = g_stcq_m_t.stcqsite
                  CALL s_desc_get_department_desc(g_stcq_m.stcqsite) RETURNING g_stcq_m.stcqsite_desc
                  DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc
                  NEXT FIELD CURRENT
               END IF

               LET g_site_flag = TRUE
               CALL astt603_set_entry(p_cmd)
               CALL astt603_set_no_entry(p_cmd)
            END IF          

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcqsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcqsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcqsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqsite
            #add-point:BEFORE FIELD stcqsite name="input.b.stcqsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcqsite
            #add-point:ON CHANGE stcqsite name="input.g.stcqsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqdocdt
            #add-point:BEFORE FIELD stcqdocdt name="input.b.stcqdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqdocdt
            
            #add-point:AFTER FIELD stcqdocdt name="input.a.stcqdocdt"
            IF NOT cl_null(g_stcq_m.stcqdocdt) THEN 
               CALL astt603_stcqdocdt_chk()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcqdocdt = g_stcq_m_t.stcqdocdt
                  NEXT FIELD stcqdocdt
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcqdocdt
            #add-point:ON CHANGE stcqdocdt name="input.g.stcqdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqdocno
            #add-point:BEFORE FIELD stcqdocno name="input.b.stcqdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqdocno
            
            #add-point:AFTER FIELD stcqdocno name="input.a.stcqdocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stcq_m.stcqdocno) THEN 
                LET l_ooef004 = ""
                SELECT ooef004 INTO l_ooef004
                  FROM ooef_t
                 WHERE ooef001 = g_stcq_m.stcqsite
                   AND ooefent = g_enterprise
               CALL s_aooi200_chk_slip(g_stcq_m.stcqsite,l_ooef004,g_stcq_m.stcqdocno,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_stcq_m.stcqdocno = g_stcqdocno_t
                  NEXT FIELD CURRENT
               END IF
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stcq_m.stcqdocno != g_stcqdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcq_t WHERE "||"stcqent = '" ||g_enterprise|| "' AND "||"stcqdocno = '"||g_stcq_m.stcqdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcqdocno
            #add-point:ON CHANGE stcqdocno name="input.g.stcqdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqunit
            #add-point:BEFORE FIELD stcqunit name="input.b.stcqunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqunit
            
            #add-point:AFTER FIELD stcqunit name="input.a.stcqunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcqunit
            #add-point:ON CHANGE stcqunit name="input.g.stcqunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq001
            #add-point:BEFORE FIELD stcq001 name="input.b.stcq001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq001
            
            #add-point:AFTER FIELD stcq001 name="input.a.stcq001"
            IF NOT cl_null(g_stcq_m.stcq001) THEN 
               CALL astt603_stcq001_chk()
               IF NOT cl_null(g_errno) THEN 
                  LET g_stcq_m.stcq001 = g_stcq_m_t.stcq001
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stcq001
               END IF
               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcq_m.stcq001
                  AND stcw005 = 'N'
                  AND stcwent = g_enterprise #160905-00007#3 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b           
            ELSE
               DISPLAY '' TO next_b          
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq001
            #add-point:ON CHANGE stcq001 name="input.g.stcq001"
 
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq003
            
            #add-point:AFTER FIELD stcq003 name="input.a.stcq003"
            IF NOT cl_null(g_stcq_m.stcq003) THEN
               CALL astt603_stcq003_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq003 = g_stcq_m_t.stcq003
                  NEXT FIELD stcq003
               END IF     
            ELSE
               CALL astt603_stcq003_null_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  SELECT stce009 INTO g_stcq_m.stcq003
                    FROM stce_t
                   WHERE stce001 = g_stcq_m.stcq001
                     AND stceent = g_enterprise #160905-00007#3 add
                  DISPLAY BY NAME g_stcq_m.stcq003
                  NEXT FIELD stcq003
               END IF     
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq003
            #add-point:BEFORE FIELD stcq003 name="input.b.stcq003"
 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq003
            #add-point:ON CHANGE stcq003 name="input.g.stcq003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq004
            
            #add-point:AFTER FIELD stcq004 name="input.a.stcq004"
            IF NOT cl_null(g_stcq_m.stcq004) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcq_m.stcq004
               #160318-00025#46  2016/04/28  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
               #160318-00025#46  2016/04/28  by pengxin  add(E)
               IF NOT cl_chk_exist("v_pmaa001_14") THEN
                  LET g_stcq_m.stcq004 = g_stcq_m_t.stcq004
                  NEXT FIELD stcq004
               END IF
               CALL astt603_stcq004_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq004 = g_stcq_m_t.stcq004
                  NEXT FIELD stcq004
               END IF
            ELSE
               CALL astt603_stcq004_null_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  SELECT stce010 INTO g_stcq_m.stcq004
                    FROM stce_t
                   WHERE stce001 = g_stcq_m.stcq001
                     AND stceent = g_enterprise #160905-00007#3 add
                   
                  DISPLAY BY NAME g_stcq_m.stcq004
                  NEXT FIELD stcq004
               END IF               
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq004
            #add-point:BEFORE FIELD stcq004 name="input.b.stcq004"
 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq004
            #add-point:ON CHANGE stcq004 name="input.g.stcq004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq002
            #add-point:BEFORE FIELD stcq002 name="input.b.stcq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq002
            
            #add-point:AFTER FIELD stcq002 name="input.a.stcq002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq002
            #add-point:ON CHANGE stcq002 name="input.g.stcq002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcqstus
            #add-point:BEFORE FIELD stcqstus name="input.b.stcqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcqstus
            
            #add-point:AFTER FIELD stcqstus name="input.a.stcqstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcqstus
            #add-point:ON CHANGE stcqstus name="input.g.stcqstus"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq008
            
            #add-point:AFTER FIELD stcq008 name="input.a.stcq008"
            IF NOT cl_null(g_stcq_m.stcq008) THEN 
               CALL astt603_stcq008_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq008 = g_stcq_m_t.stcq008
                  NEXT FIELD stcq008
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq008
            #add-point:BEFORE FIELD stcq008 name="input.b.stcq008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq008
            #add-point:ON CHANGE stcq008 name="input.g.stcq008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq009
            
            #add-point:AFTER FIELD stcq009 name="input.a.stcq009"
            IF NOT cl_null(g_stcq_m.stcq009) THEN 
               CALL astt603_stcq009_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq009 = g_stcq_m_t.stcq009
                  NEXT FIELD stcq009
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq009_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq009
            #add-point:BEFORE FIELD stcq009 name="input.b.stcq009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq009
            #add-point:ON CHANGE stcq009 name="input.g.stcq009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq016
            
            #add-point:AFTER FIELD stcq016 name="input.a.stcq016"
            IF NOT cl_null(g_stcq_m.stcq016) THEN 
               CALL astt603_stcq016_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq016 = g_stcq_m_t.stcq016
                  NEXT FIELD stcq016
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq016_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq016
            #add-point:BEFORE FIELD stcq016 name="input.b.stcq016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq016
            #add-point:ON CHANGE stcq016 name="input.g.stcq016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq017
            
            #add-point:AFTER FIELD stcq017 name="input.a.stcq017"
            IF NOT cl_null(g_stcq_m.stcq017) THEN 
               CALL astt603_stcq017_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq017 = g_stcq_m_t.stcq017
                  NEXT FIELD stcq017
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq017
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq017_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq017
            #add-point:BEFORE FIELD stcq017 name="input.b.stcq017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq017
            #add-point:ON CHANGE stcq017 name="input.g.stcq017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq010
            
            #add-point:AFTER FIELD stcq010 name="input.a.stcq010"
            IF NOT cl_null(g_stcq_m.stcq010) THEN 
               IF s_aooi500_setpoint(g_prog,'stcq010') THEN
                  CALL s_aooi500_chk(g_prog,'stcq010',g_stcq_m.stcq010,g_stcq_m.stcqsite) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stcq_m.stcq010
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  
                     LET g_stcq_m.stcq010 = g_stcq_m_t.stcq010
                     CALL s_desc_get_department_desc(g_stcq_m.stcq010) RETURNING g_stcq_m.stcq010_desc
                     DISPLAY BY NAME g_stcq_m.stcq010,g_stcq_m.stcq010_desc
                     NEXT FIELD CURRENT
                  END IF
                  
                  LET g_site_flag = TRUE
                  CALL astt603_set_entry(p_cmd)
                  CALL astt603_set_no_entry(p_cmd)
               ELSE
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = '1'
                  LET g_chkparam.arg1 = g_stcq_m.stcq010
                  #160318-00025#46  2016/04/28  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00089:sub-01302|aooi100|",cl_get_progname("aooi100",g_lang,"2"),"|:EXEPROGaooi100"
                  #160318-00025#46  2016/04/28  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooef001_212") THEN
                     LET g_stcq_m.stcq010 = g_stcq_m_t.stcq010
                     NEXT FIELD stcq010
                  END IF 
               END IF
   
#               INITIALIZE g_chkparam.* TO NULL
#               LET g_errshow = '1'
#               LET g_chkparam.arg1 = g_stcq_m.stcq010
#               IF NOT cl_chk_exist("v_ooef001_212") THEN
#                  LET g_stcq_m.stcq010 = g_stcq_m_t.stcq010
#                  NEXT FIELD stcq010
#               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq010
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq010_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq010
            #add-point:BEFORE FIELD stcq010 name="input.b.stcq010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq010
            #add-point:ON CHANGE stcq010 name="input.g.stcq010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq011
            
            #add-point:AFTER FIELD stcq011 name="input.a.stcq011"
            IF NOT cl_null(g_stcq_m.stcq011) THEN 
#               INITIALIZE g_chkparam.* TO NULL
#               LET g_errshow = '1'
#               LET g_chkparam.arg1 = g_stcq_m.stcq011
#               IF NOT cl_chk_exist("v_ooef001_20") THEN
#                  LET g_stcq_m.stcq011 = g_stcq_m_t.stcq011
#                  NEXT FIELD stcq011
#               END IF
               IF s_aooi500_setpoint(g_prog,'stcq011') THEN
                  CALL s_aooi500_chk(g_prog,'stcq011',g_stcq_m.stcq011,g_stcq_m.stcqsite) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stcq_m.stcq011
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  
                     LET g_stcq_m.stcq011 = g_stcq_m_t.stcq011
                     CALL s_desc_get_department_desc(g_stcq_m.stcq011) RETURNING g_stcq_m.stcq011_desc
                     DISPLAY BY NAME g_stcq_m.stcq011,g_stcq_m.stcq011_desc
                     NEXT FIELD CURRENT
                  END IF
                  
                  LET g_site_flag = TRUE
                  CALL astt603_set_entry(p_cmd)
                  CALL astt603_set_no_entry(p_cmd)
               ELSE
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = '1'
                  LET g_chkparam.arg1 = g_stcq_m.stcq011
                  IF NOT cl_chk_exist("v_ooef001_20") THEN
                     LET g_stcq_m.stcq011 = g_stcq_m_t.stcq011
                     NEXT FIELD stcq011
                  END IF
               END IF
               CALL astt603_stcq011_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq011 = g_stcq_m_t.stcq011
                  NEXT FIELD stcq011
               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq011
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq011_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq011
            #add-point:BEFORE FIELD stcq011 name="input.b.stcq011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq011
            #add-point:ON CHANGE stcq011 name="input.g.stcq011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq012
            
            #add-point:AFTER FIELD stcq012 name="input.a.stcq012"
            IF NOT cl_null(g_stcq_m.stcq012) THEN 
               CALL astt603_stcq012_chk()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               
                  LET g_stcq_m.stcq012 = g_stcq_m_t.stcq012
                  NEXT FIELD stcq012
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq012
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq012_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq012
            #add-point:BEFORE FIELD stcq012 name="input.b.stcq012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq012
            #add-point:ON CHANGE stcq012 name="input.g.stcq012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq018
            #add-point:BEFORE FIELD stcq018 name="input.b.stcq018"
            LET g_stcq_m_t.stcq018 = g_stcq_m.stcq018
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq018
            
            #add-point:AFTER FIELD stcq018 name="input.a.stcq018"
            IF NOT cl_null(g_stcq_m.stcq018) THEN 
               CALL astt603_stcq018_stcq019_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq018 = g_stcq_m_t.stcq018
                  NEXT FIELD stcq018
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq018
            #add-point:ON CHANGE stcq018 name="input.g.stcq018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcq019
            #add-point:BEFORE FIELD stcq019 name="input.b.stcq019"
            LET g_stcq_m_t.stcq019 = g_stcq_m.stcq019
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcq019
            
            #add-point:AFTER FIELD stcq019 name="input.a.stcq019"
            IF NOT cl_null(g_stcq_m.stcq019) THEN 
               CALL astt603_stcq018_stcq019_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcq_m.stcq019 = g_stcq_m_t.stcq019
                  NEXT FIELD stcq019
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcq019
            #add-point:ON CHANGE stcq019 name="input.g.stcq019"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stcqsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqsite
            #add-point:ON ACTION controlp INFIELD stcqsite name="input.c.stcqsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcq_m.stcqsite             #給予default值
            LET g_qryparam.default2 = g_stcq_m.stcqsite_desc #說明(簡稱)
#            LET g_qryparam.where = " ooef201 = 'Y' "
#            CALL q_ooef001()                        #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcqsite',g_stcq_m.stcqsite,'i')    #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()
            LET g_stcq_m.stcqsite = g_qryparam.return1  
            DISPLAY g_qryparam.return1 TO stcqsite  #顯示到畫面上
            CALL s_desc_get_department_desc(g_stcq_m.stcqsite)
               RETURNING g_stcq_m.stcqsite_desc
            NEXT FIELD stcqsite  
            #END add-point
 
 
         #Ctrlp:input.c.stcqdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqdocdt
            #add-point:ON ACTION controlp INFIELD stcqdocdt name="input.c.stcqdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcqdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqdocno
            #add-point:ON ACTION controlp INFIELD stcqdocno name="input.c.stcqdocno"
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		   	LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcq_m.stcqdocno             #給予default值
            LET l_ooef004 = ""
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooef001 = g_stcq_m.stcqsite
               AND ooefent = g_enterprise
            #給予arg
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            CALL q_ooba002_1()                            #呼叫開窗
            LET g_stcq_m.stcqdocno = g_qryparam.return1   #將開窗取得的值回傳到變數
            DISPLAY g_stcq_m.stcqdocno TO stcqdocno       #顯示到畫面上
            NEXT FIELD stcqdocno                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stcqunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqunit
            #add-point:ON ACTION controlp INFIELD stcqunit name="input.c.stcqunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcq001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq001
            #add-point:ON ACTION controlp INFIELD stcq001 name="input.c.stcq001"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = ""
            IF NOT cl_null(g_stcq_m.stcqdocdt) THEN 
               LET g_qryparam.where = " stce017 <= '",g_stcq_m.stcqdocdt,"' AND stce018 >= '",g_stcq_m.stcqdocdt,"'"
            END IF 
            CALL q_stce001_2()
            LET g_stcq_m.stcq001 = g_qryparam.return1
            IF NOT cl_null(g_stcq_m.stcq001) THEN 
               LET g_stcq_m.stcq003 = g_qryparam.return2
               LET g_stcq_m.stcq004 = g_qryparam.return3
               LET g_stcq_m.stcq005 = g_qryparam.return4
               LET g_stcq_m.stcq006 = g_qryparam.return5
               LET g_stcq_m.stcq007 = g_qryparam.return6
               LET g_stcq_m.stcq002 = g_qryparam.return7
            END IF 
            DISPLAY BY NAME g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq005,
                            g_stcq_m.stcq006,g_stcq_m.stcq007
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq003_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq004_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq006
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq006_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq007_desc
            ###  ### end ###

            #END add-point
 
 
         #Ctrlp:input.c.stcq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq003
            #add-point:ON ACTION controlp INFIELD stcq003 name="input.c.stcq003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stcq_m.stcq003 = g_qryparam.return1              

            DISPLAY g_stcq_m.stcq003 TO stcq003              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq003_desc
            NEXT FIELD stcq003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq004
            #add-point:ON ACTION controlp INFIELD stcq004 name="input.c.stcq004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stcq_m.stcq004 = g_qryparam.return1              

            DISPLAY g_stcq_m.stcq004 TO stcq004              #

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq004_desc
            NEXT FIELD stcq004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq002
            #add-point:ON ACTION controlp INFIELD stcq002 name="input.c.stcq002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcqstus
            #add-point:ON ACTION controlp INFIELD stcqstus name="input.c.stcqstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcq008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq008
            #add-point:ON ACTION controlp INFIELD stcq008 name="input.c.stcq008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcq_m.stcq008             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "" #
            CALL q_ooag001()                                #呼叫開窗
            LET g_stcq_m.stcq008 = g_qryparam.return1              
            DISPLAY g_stcq_m.stcq008 TO stcq008              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq008_desc
            NEXT FIELD stcq008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq009
            #add-point:ON ACTION controlp INFIELD stcq009 name="input.c.stcq009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq009             #給予default值
            LET g_qryparam.default2 = "" #g_stcq_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = g_today #
            CALL q_ooeg001()                                #呼叫開窗
            LET g_stcq_m.stcq009 = g_qryparam.return1              
            LET g_stcq_m.stcq009_desc = g_qryparam.return2
            DISPLAY g_stcq_m.stcq009 TO stcq009           
            DISPLAY g_stcq_m.stcq009_desc TO stcq009_desc 
            NEXT FIELD stcq009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq016
            #add-point:ON ACTION controlp INFIELD stcq016 name="input.c.stcq016"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcq_m.stcq016             #給予default值
            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                                #呼叫開窗
            LET g_stcq_m.stcq016 = g_qryparam.return1
            DISPLAY g_stcq_m.stcq016 TO stcq016              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq016_desc            
            NEXT FIELD stcq016                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq017
            #add-point:ON ACTION controlp INFIELD stcq017 name="input.c.stcq017"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcq_m.stcq017             #給予default值
            #給予arg
            LET g_qryparam.arg1 = g_stcq_m.stcqsite
            CALL q_oodb002_1()
            LET g_stcq_m.stcq017 = g_qryparam.return1    
            DISPLAY g_stcq_m.stcq017 TO stcq017
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq017
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq017_desc
            NEXT FIELD stcq017                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq010
            #add-point:ON ACTION controlp INFIELD stcq010 name="input.c.stcq010"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq010             #給予default值
            LET g_qryparam.default2 = "" #g_stcq_m.ooefl003 #說明(簡稱)
            #給予arg
            IF s_aooi500_setpoint(g_prog,'stcq010') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcq010',g_stcq_m.stcqsite,'i')   #150308-00001#5  By benson add 'i'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef212 = 'Y' "
               CALL q_ooef001()                               #呼叫開窗
            END IF

#            LET g_qryparam.where = " ooef212 = 'Y' "
#            CALL q_ooef001()                               #呼叫開窗
            LET g_stcq_m.stcq010 = g_qryparam.return1
            DISPLAY g_stcq_m.stcq010 TO stcq010              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq010
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq010_desc

            NEXT FIELD stcq010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq011
            #add-point:ON ACTION controlp INFIELD stcq011 name="input.c.stcq011"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq011             #給予default值
            LET g_qryparam.default2 = "" #g_stcq_m.ooefl003 #說明(簡稱)
            #給予arg
#            LET g_qryparam.where = " ooef201 = 'Y' "
#            CALL q_ooef001()  
            IF s_aooi500_setpoint(g_prog,'stcq011') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcq011',g_stcq_m.stcqsite,'i')   #150308-00001#5  By benson add 'i'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef201 = 'Y' "
               CALL q_ooef001()                               #呼叫開窗
            END IF#呼叫開窗
            LET g_stcq_m.stcq011 = g_qryparam.return1
            DISPLAY g_stcq_m.stcq011 TO stcq011              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq011
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq011_desc

            NEXT FIELD stcq011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq012
            #add-point:ON ACTION controlp INFIELD stcq012 name="input.c.stcq012"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcq_m.stcq012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            IF NOT cl_null(g_stcq_m.stcq011) THEN 
               LET g_qryparam.where = " dbbc002 = '",g_stcq_m.stcq011,"'"
            END IF
            CALL q_dbbc001()                                #呼叫開窗
            LET g_stcq_m.stcq012 = g_qryparam.return1              
            DISPLAY g_stcq_m.stcq012 TO stcq012              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcq_m.stcq012
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcq_m.stcq012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcq_m.stcq012_desc
            NEXT FIELD stcq012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcq018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq018
            #add-point:ON ACTION controlp INFIELD stcq018 name="input.c.stcq018"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcq019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcq019
            #add-point:ON ACTION controlp INFIELD stcq019 name="input.c.stcq019"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stcq_m.stcqdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stcq_m.stcqsite,g_stcq_m.stcqdocno,g_stcq_m.stcqdocdt,g_prog) RETURNING l_success,g_stcq_m.stcqdocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stcq_m.stcqdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stcqdocno
               END IF
               #end add-point
               
               INSERT INTO stcq_t (stcqent,stcqsite,stcqdocdt,stcqdocno,stcqunit,stcq001,stcq003,stcq004, 
                   stcq002,stcq005,stcq006,stcq007,stcqstus,stcq008,stcq009,stcq016,stcq017,stcq010, 
                   stcq011,stcq012,stcq018,stcq013,stcq014,stcq015,stcq019,stcqownid,stcqowndp,stcqcrtid, 
                   stcqcrtdp,stcqcrtdt,stcqmodid,stcqmoddt,stcqcnfid,stcqcnfdt)
               VALUES (g_enterprise,g_stcq_m.stcqsite,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit, 
                   g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002,g_stcq_m.stcq005, 
                   g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
                   g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012, 
                   g_stcq_m.stcq018,g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019, 
                   g_stcq_m.stcqownid,g_stcq_m.stcqowndp,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt, 
                   g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stcq_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt603_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt603_b_fill()
                  CALL astt603_b_fill2('0')
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
               CALL astt603_stcq_t_mask_restore('restore_mask_o')
               
               UPDATE stcq_t SET (stcqsite,stcqdocdt,stcqdocno,stcqunit,stcq001,stcq003,stcq004,stcq002, 
                   stcq005,stcq006,stcq007,stcqstus,stcq008,stcq009,stcq016,stcq017,stcq010,stcq011, 
                   stcq012,stcq018,stcq013,stcq014,stcq015,stcq019,stcqownid,stcqowndp,stcqcrtid,stcqcrtdp, 
                   stcqcrtdt,stcqmodid,stcqmoddt,stcqcnfid,stcqcnfdt) = (g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
                   g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004, 
                   g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus, 
                   g_stcq_m.stcq008,g_stcq_m.stcq009,g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010, 
                   g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018,g_stcq_m.stcq013,g_stcq_m.stcq014, 
                   g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp,g_stcq_m.stcqcrtid, 
                   g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid, 
                   g_stcq_m.stcqcnfdt)
                WHERE stcqent = g_enterprise AND stcqdocno = g_stcqdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stcq_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt603_stcq_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stcq_m_t)
               LET g_log2 = util.JSON.stringify(g_stcq_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt603.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stcr_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcr_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt603_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stcr_d.getLength()
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
            OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt603_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt603_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcr_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcr_d[l_ac].stcrseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stcr_d_t.* = g_stcr_d[l_ac].*  #BACKUP
               LET g_stcr_d_o.* = g_stcr_d[l_ac].*  #BACKUP
               CALL astt603_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt603_set_no_entry_b(l_cmd)
               IF NOT astt603_lock_b("stcr_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt603_bcl INTO g_stcr_d[l_ac].stcrseq,g_stcr_d[l_ac].stcr001,g_stcr_d[l_ac].stcr002, 
                      g_stcr_d[l_ac].stcr003,g_stcr_d[l_ac].stcr004,g_stcr_d[l_ac].stcr005,g_stcr_d[l_ac].stcr006, 
                      g_stcr_d[l_ac].stcr007,g_stcr_d[l_ac].stcr008,g_stcr_d[l_ac].stcr009,g_stcr_d[l_ac].stcr010, 
                      g_stcr_d[l_ac].stcr023,g_stcr_d[l_ac].stcr024,g_stcr_d[l_ac].stcr011,g_stcr_d[l_ac].stcr012, 
                      g_stcr_d[l_ac].stcr013,g_stcr_d[l_ac].stcr014,g_stcr_d[l_ac].stcr015,g_stcr_d[l_ac].stcr016, 
                      g_stcr_d[l_ac].stcr017,g_stcr_d[l_ac].stcr018,g_stcr_d[l_ac].stcr019,g_stcr_d[l_ac].stcr020, 
                      g_stcr_d[l_ac].stcr021,g_stcr_d[l_ac].stcr022,g_stcr_d[l_ac].stcrsite,g_stcr_d[l_ac].stcrunit 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stcr_d_t.stcrseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcr_d_mask_o[l_ac].* =  g_stcr_d[l_ac].*
                  CALL astt603_stcr_t_mask()
                  LET g_stcr_d_mask_n[l_ac].* =  g_stcr_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt603_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcr_d[l_ac].stcr001
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcr_d[l_ac].stcr001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcr_d[l_ac].stcr001_desc
            CALL cl_set_comp_entry('stcr004',TRUE)
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
            INITIALIZE g_stcr_d[l_ac].* TO NULL 
            INITIALIZE g_stcr_d_t.* TO NULL 
            INITIALIZE g_stcr_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stcr_d[l_ac].stcr009 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stcr_d_t.* = g_stcr_d[l_ac].*     #新輸入資料
            LET g_stcr_d_o.* = g_stcr_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt603_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
 
            #end add-point
            CALL astt603_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcr_d[li_reproduce_target].* = g_stcr_d[li_reproduce].*
 
               LET g_stcr_d[li_reproduce_target].stcrseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            SELECT MAX(stcrseq)+1 INTO g_stcr_d[l_ac].stcrseq
              FROM stcr_t
             WHERE stcrent = g_enterprise
               AND stcrdocno = g_stcq_m.stcqdocno
            IF cl_null(g_stcr_d[l_ac].stcrseq) THEN 
               LET g_stcr_d[l_ac].stcrseq = 1
            END IF 
            LET g_stcr_d[l_ac].stcr002 = g_stcq_m.stcq016
            LET g_stcr_d[l_ac].stcr003 = g_stcq_m.stcq017
            LET g_stcr_d[l_ac].stcr011 = g_stcq_m.stcq002
            LET g_stcr_d[l_ac].stcr012 = g_stcq_m.stcq003
            LET g_stcr_d[l_ac].stcr013 = g_stcq_m.stcq004
            LET g_stcr_d[l_ac].stcr014 = g_stcq_m.stcq005
            LET g_stcr_d[l_ac].stcr015 = g_stcq_m.stcq007
            LET g_stcr_d[l_ac].stcr016 = g_stcq_m.stcq006
            LET g_stcr_d[l_ac].stcr017 = g_stcq_m.stcq011
            LET g_stcr_d[l_ac].stcr018 = g_stcq_m.stcq012
            LET g_stcr_d[l_ac].stcr019 = g_stcq_m.stcq013
            LET g_stcr_d[l_ac].stcr020 = g_stcq_m.stcq014
            LET g_stcr_d[l_ac].stcr021 = g_stcq_m.stcq015
            LET g_stcr_d[l_ac].stcrunit = g_stcq_m.stcqunit
            LET g_stcr_d[l_ac].stcrsite = g_stcq_m.stcqsite
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
            SELECT COUNT(1) INTO l_count FROM stcr_t 
             WHERE stcrent = g_enterprise AND stcrdocno = g_stcq_m.stcqdocno
 
               AND stcrseq = g_stcr_d[l_ac].stcrseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcq_m.stcqdocno
               LET gs_keys[2] = g_stcr_d[g_detail_idx].stcrseq
               CALL astt603_insert_b('stcr_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stcr_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt603_b_fill()
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
               LET gs_keys[01] = g_stcq_m.stcqdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stcr_d_t.stcrseq
 
            
               #刪除同層單身
               IF NOT astt603_delete_b('stcr_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt603_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt603_key_delete_b(gs_keys,'stcr_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt603_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt603_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stcr_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcr_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrseq
            #add-point:BEFORE FIELD stcrseq name="input.b.page1.stcrseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrseq
            
            #add-point:AFTER FIELD stcrseq name="input.a.page1.stcrseq"
            #此段落由子樣板a05產生
            IF  g_stcq_m.stcqdocno IS NOT NULL AND g_stcr_d[g_detail_idx].stcrseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcq_m.stcqdocno != g_stcqdocno_t OR g_stcr_d[g_detail_idx].stcrseq != g_stcr_d_t.stcrseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcr_t WHERE "||"stcrent = '" ||g_enterprise|| "' AND "||"stcrdocno = '"||g_stcq_m.stcqdocno ||"' AND "|| "stcrseq = '"||g_stcr_d[g_detail_idx].stcrseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcrseq
            #add-point:ON CHANGE stcrseq name="input.g.page1.stcrseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr001
            
            #add-point:AFTER FIELD stcr001 name="input.a.page1.stcr001"
            IF NOT cl_null(g_stcr_d[l_ac].stcr001) THEN 
               CALL astt603_stcr001_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcr_d[l_ac].stcr001 = g_stcr_d_t.stcr001
                  NEXT FIELD stcr001
               END IF 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcr_d[l_ac].stcr001 != g_stcr_d_t.stcr001) THEN 
                  CALL astt603_stcr001_stcr007_stcr008(l_cmd)
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                     LET g_stcr_d[l_ac].stcr001 = g_stcr_d_t.stcr001
                     NEXT FIELD stcr001
                  END IF 
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcr_d[l_ac].stcr001
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcr_d[l_ac].stcr001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcr_d[l_ac].stcr001_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr001
            #add-point:BEFORE FIELD stcr001 name="input.b.page1.stcr001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr001
            #add-point:ON CHANGE stcr001 name="input.g.page1.stcr001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr002
            #add-point:BEFORE FIELD stcr002 name="input.b.page1.stcr002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr002
            
            #add-point:AFTER FIELD stcr002 name="input.a.page1.stcr002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr002
            #add-point:ON CHANGE stcr002 name="input.g.page1.stcr002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr003
            #add-point:BEFORE FIELD stcr003 name="input.b.page1.stcr003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr003
            
            #add-point:AFTER FIELD stcr003 name="input.a.page1.stcr003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr003
            #add-point:ON CHANGE stcr003 name="input.g.page1.stcr003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr004
            #add-point:BEFORE FIELD stcr004 name="input.b.page1.stcr004"
            IF NOT cl_null(g_stcr_d[l_ac].stcr001) THEN 
               SELECT stae006
                 INTO l_stae006
                 FROM stae_t
                WHERE stae001 = g_stcr_d[l_ac].stcr001 
                  AND staeent = g_enterprise
               IF l_stae006 = '3' THEN  
                  CALL cl_set_comp_entry('stcr004',TRUE)
               ELSE
                  LET g_stcr_d[l_ac].stcr004 = l_stae006
                  CALL cl_set_comp_entry('stcr004',FALSE)
               END IF 
            ELSE
               CALL cl_set_comp_entry('stcr004',TRUE)
            END IF 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr004
            
            #add-point:AFTER FIELD stcr004 name="input.a.page1.stcr004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr004
            #add-point:ON CHANGE stcr004 name="input.g.page1.stcr004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr005
            #add-point:BEFORE FIELD stcr005 name="input.b.page1.stcr005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr005
            
            #add-point:AFTER FIELD stcr005 name="input.a.page1.stcr005"
            IF NOT cl_null(g_stcr_d[l_ac].stcr005) THEN
               IF g_stcr_d[l_ac].stcr005 <> g_stcr_d_o.stcr005 OR cl_null(g_stcr_d_o.stcr005) THEN   #160824-00007#196 161120 by lori add
                  CALL astt603_stcr010_set()   #含舊值備份
               END IF  #160824-00007#196 161120 by lori add   
            END IF 
            
            LET g_stcr_d_o.stcr005 = g_stcr_d[l_ac].stcr005   #160824-00007#196 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr005
            #add-point:ON CHANGE stcr005 name="input.g.page1.stcr005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr006
            #add-point:BEFORE FIELD stcr006 name="input.b.page1.stcr006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr006
            
            #add-point:AFTER FIELD stcr006 name="input.a.page1.stcr006"
            IF NOT cl_null(g_stcr_d[l_ac].stcr006) THEN
               IF g_stcr_d[l_ac].stcr006 <> g_stcr_d_o.stcr006 OR cl_null(g_stcr_d_o.stcr006) THEN   #160824-00007#196 161120 by lori add
                  CALL astt603_stcr010_set()   #含舊值備份
               END IF   #160824-00007#196 161120 by lori add   
            END IF 
            
            LET g_stcr_d_o.stcr006 = g_stcr_d[l_ac].stcr006   #160824-00007#196 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr006
            #add-point:ON CHANGE stcr006 name="input.g.page1.stcr006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr007
            #add-point:BEFORE FIELD stcr007 name="input.b.page1.stcr007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr007
            
            #add-point:AFTER FIELD stcr007 name="input.a.page1.stcr007"
            IF NOT cl_null(g_stcr_d[l_ac].stcr007) THEN 
               IF g_stcr_d[l_ac].stcr007 != g_stcr_d_o.stcr007 OR cl_null(g_stcr_d_o.stcr007) THEN   #160824-00007#196 161120 by lori add
                  IF NOT cl_null(g_stcr_d[l_ac].stcr008) AND g_stcr_d[l_ac].stcr007 > g_stcr_d[l_ac].stcr008 THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00063'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_stcr_d[l_ac].stcr007 = g_stcr_d_o.stcr007   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr007->g_stcr_d_o.stcr007
                     NEXT FIELD stcr007
                  END IF 
                  CALL astt603_stcr007_stcr008_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_stcr_d[l_ac].stcr007 = g_stcr_d_o.stcr007   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr007->g_stcr_d_o.stcr007
                     NEXT FIELD stcr007
                  END IF 
                 #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcr_d[l_ac].stcr007 != g_stcr_d_t.stcr007) THEN   #160824-00007#196 161120 by lori mark
                     CALL astt603_stcr001_stcr007_stcr008(l_cmd)
                     IF NOT cl_null(g_errno) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                     
                        LET g_stcr_d[l_ac].stcr007 = g_stcr_d_o.stcr007   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr007->g_stcr_d_o.stcr007
                        NEXT FIELD stcr007
                     END IF 
                 #END IF   #160824-00007#196 161120 by lori mark
                  CALL astt603_stcr010_set()   #含舊值備份
               END IF   #160824-00007#196 161120 by lori add     
            END IF 
            
            LET g_stcr_d_o.stcr007 = g_stcr_d[l_ac].stcr007   #160824-00007#196 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr007
            #add-point:ON CHANGE stcr007 name="input.g.page1.stcr007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr008
            #add-point:BEFORE FIELD stcr008 name="input.b.page1.stcr008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr008
            
            #add-point:AFTER FIELD stcr008 name="input.a.page1.stcr008"
            IF NOT cl_null(g_stcr_d[l_ac].stcr008) THEN 
               IF g_stcr_d[l_ac].stcr008 <> g_stcr_d_o.stcr008 OR cl_null(g_stcr_d_o.stcr008) THEN   #160824-00007#196 161120 by lori add
                  IF NOT cl_null(g_stcr_d[l_ac].stcr007) AND g_stcr_d[l_ac].stcr007 > g_stcr_d[l_ac].stcr008 THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00063'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                 
                     LET g_stcr_d[l_ac].stcr008 = g_stcr_d_o.stcr008   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr008->g_stcr_d_o.stcr008
                     NEXT FIELD stcr008
                  END IF 
                  CALL astt603_stcr007_stcr008_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                 
                     LET g_stcr_d[l_ac].stcr008 = g_stcr_d_o.stcr008   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr008->g_stcr_d_o.stcr008
                     NEXT FIELD stcr008
                  END IF 
                 #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcr_d[l_ac].stcr008 != g_stcr_d_t.stcr008) THEN    #160824-00007#196 161120 by lori mark
                     CALL astt603_stcr001_stcr007_stcr008(l_cmd)
                     IF NOT cl_null(g_errno) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                 
                        LET g_stcr_d[l_ac].stcr008 = g_stcr_d_o.stcr008   #160824-00007#196 161120 by lori mod:g_stcr_d_t.stcr008->g_stcr_d_o.stcr008
                        NEXT FIELD stcr008
                     END IF 
                 #END IF   #160824-00007#196 161120 by lori mark
                  CALL astt603_stcr010_set()   #含舊值備份
               END IF   #160824-00007#196 161120 by lori add
            END IF 
            
            LET g_stcr_d_o.stcr008 = g_stcr_d[l_ac].stcr008   #160824-00007#196 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr008
            #add-point:ON CHANGE stcr008 name="input.g.page1.stcr008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr009
            #add-point:BEFORE FIELD stcr009 name="input.b.page1.stcr009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr009
            
            #add-point:AFTER FIELD stcr009 name="input.a.page1.stcr009"
            IF NOT cl_null(g_stcr_d[l_ac].stcr009) THEN 
               IF g_stcr_d[l_ac].stcr009 < 0 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00067'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcr_d[l_ac].stcr009 = g_stcr_d_t.stcr009
                  NEXT FIELD stcr009
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr009
            #add-point:ON CHANGE stcr009 name="input.g.page1.stcr009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr011
            #add-point:BEFORE FIELD stcr011 name="input.b.page1.stcr011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr011
            
            #add-point:AFTER FIELD stcr011 name="input.a.page1.stcr011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr011
            #add-point:ON CHANGE stcr011 name="input.g.page1.stcr011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr012
            #add-point:BEFORE FIELD stcr012 name="input.b.page1.stcr012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr012
            
            #add-point:AFTER FIELD stcr012 name="input.a.page1.stcr012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr012
            #add-point:ON CHANGE stcr012 name="input.g.page1.stcr012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr013
            #add-point:BEFORE FIELD stcr013 name="input.b.page1.stcr013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr013
            
            #add-point:AFTER FIELD stcr013 name="input.a.page1.stcr013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr013
            #add-point:ON CHANGE stcr013 name="input.g.page1.stcr013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr014
            #add-point:BEFORE FIELD stcr014 name="input.b.page1.stcr014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr014
            
            #add-point:AFTER FIELD stcr014 name="input.a.page1.stcr014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr014
            #add-point:ON CHANGE stcr014 name="input.g.page1.stcr014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr015
            #add-point:BEFORE FIELD stcr015 name="input.b.page1.stcr015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr015
            
            #add-point:AFTER FIELD stcr015 name="input.a.page1.stcr015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr015
            #add-point:ON CHANGE stcr015 name="input.g.page1.stcr015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr016
            #add-point:BEFORE FIELD stcr016 name="input.b.page1.stcr016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr016
            
            #add-point:AFTER FIELD stcr016 name="input.a.page1.stcr016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr016
            #add-point:ON CHANGE stcr016 name="input.g.page1.stcr016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr017
            #add-point:BEFORE FIELD stcr017 name="input.b.page1.stcr017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr017
            
            #add-point:AFTER FIELD stcr017 name="input.a.page1.stcr017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr017
            #add-point:ON CHANGE stcr017 name="input.g.page1.stcr017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr018
            #add-point:BEFORE FIELD stcr018 name="input.b.page1.stcr018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr018
            
            #add-point:AFTER FIELD stcr018 name="input.a.page1.stcr018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr018
            #add-point:ON CHANGE stcr018 name="input.g.page1.stcr018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr019
            #add-point:BEFORE FIELD stcr019 name="input.b.page1.stcr019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr019
            
            #add-point:AFTER FIELD stcr019 name="input.a.page1.stcr019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr019
            #add-point:ON CHANGE stcr019 name="input.g.page1.stcr019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr020
            #add-point:BEFORE FIELD stcr020 name="input.b.page1.stcr020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr020
            
            #add-point:AFTER FIELD stcr020 name="input.a.page1.stcr020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr020
            #add-point:ON CHANGE stcr020 name="input.g.page1.stcr020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr021
            #add-point:BEFORE FIELD stcr021 name="input.b.page1.stcr021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr021
            
            #add-point:AFTER FIELD stcr021 name="input.a.page1.stcr021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr021
            #add-point:ON CHANGE stcr021 name="input.g.page1.stcr021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcr022
            #add-point:BEFORE FIELD stcr022 name="input.b.page1.stcr022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcr022
            
            #add-point:AFTER FIELD stcr022 name="input.a.page1.stcr022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcr022
            #add-point:ON CHANGE stcr022 name="input.g.page1.stcr022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrsite
            #add-point:BEFORE FIELD stcrsite name="input.b.page1.stcrsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrsite
            
            #add-point:AFTER FIELD stcrsite name="input.a.page1.stcrsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcrsite
            #add-point:ON CHANGE stcrsite name="input.g.page1.stcrsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcrunit
            #add-point:BEFORE FIELD stcrunit name="input.b.page1.stcrunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcrunit
            
            #add-point:AFTER FIELD stcrunit name="input.a.page1.stcrunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcrunit
            #add-point:ON CHANGE stcrunit name="input.g.page1.stcrunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stcrseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrseq
            #add-point:ON ACTION controlp INFIELD stcrseq name="input.c.page1.stcrseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr001
            #add-point:ON ACTION controlp INFIELD stcr001 name="input.c.page1.stcr001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcr_d[l_ac].stcr001             #給予default值
            LET g_qryparam.default2 = "" #g_stcr_d[l_ac].stael004 #助記碼
            LET g_qryparam.default3 = "" #g_stcr_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = " stae002 = '2' "
            
            CALL q_stae001()                                #呼叫開窗

            LET g_stcr_d[l_ac].stcr001 = g_qryparam.return1              
            LET g_stcr_d[l_ac].stcr001_desc = g_qryparam.return2 
            DISPLAY g_stcr_d[l_ac].stcr001 TO stcr001          
            DISPLAY g_stcr_d[l_ac].stcr001_desc TO stcr001_desc #說明
            NEXT FIELD stcr001                           #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr002
            #add-point:ON ACTION controlp INFIELD stcr002 name="input.c.page1.stcr002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr003
            #add-point:ON ACTION controlp INFIELD stcr003 name="input.c.page1.stcr003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr004
            #add-point:ON ACTION controlp INFIELD stcr004 name="input.c.page1.stcr004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr005
            #add-point:ON ACTION controlp INFIELD stcr005 name="input.c.page1.stcr005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr006
            #add-point:ON ACTION controlp INFIELD stcr006 name="input.c.page1.stcr006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr007
            #add-point:ON ACTION controlp INFIELD stcr007 name="input.c.page1.stcr007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr008
            #add-point:ON ACTION controlp INFIELD stcr008 name="input.c.page1.stcr008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr009
            #add-point:ON ACTION controlp INFIELD stcr009 name="input.c.page1.stcr009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr011
            #add-point:ON ACTION controlp INFIELD stcr011 name="input.c.page1.stcr011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr012
            #add-point:ON ACTION controlp INFIELD stcr012 name="input.c.page1.stcr012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr013
            #add-point:ON ACTION controlp INFIELD stcr013 name="input.c.page1.stcr013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr014
            #add-point:ON ACTION controlp INFIELD stcr014 name="input.c.page1.stcr014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr015
            #add-point:ON ACTION controlp INFIELD stcr015 name="input.c.page1.stcr015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr016
            #add-point:ON ACTION controlp INFIELD stcr016 name="input.c.page1.stcr016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr017
            #add-point:ON ACTION controlp INFIELD stcr017 name="input.c.page1.stcr017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr018
            #add-point:ON ACTION controlp INFIELD stcr018 name="input.c.page1.stcr018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr019
            #add-point:ON ACTION controlp INFIELD stcr019 name="input.c.page1.stcr019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr020
            #add-point:ON ACTION controlp INFIELD stcr020 name="input.c.page1.stcr020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr021
            #add-point:ON ACTION controlp INFIELD stcr021 name="input.c.page1.stcr021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcr022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcr022
            #add-point:ON ACTION controlp INFIELD stcr022 name="input.c.page1.stcr022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcrsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrsite
            #add-point:ON ACTION controlp INFIELD stcrsite name="input.c.page1.stcrsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcrunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcrunit
            #add-point:ON ACTION controlp INFIELD stcrunit name="input.c.page1.stcrunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stcr_d[l_ac].* = g_stcr_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt603_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stcr_d[l_ac].stcrseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stcr_d[l_ac].* = g_stcr_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt603_stcr_t_mask_restore('restore_mask_o')
      
               UPDATE stcr_t SET (stcrdocno,stcrseq,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006, 
                   stcr007,stcr008,stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015, 
                   stcr016,stcr017,stcr018,stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit) = (g_stcq_m.stcqdocno, 
                   g_stcr_d[l_ac].stcrseq,g_stcr_d[l_ac].stcr001,g_stcr_d[l_ac].stcr002,g_stcr_d[l_ac].stcr003, 
                   g_stcr_d[l_ac].stcr004,g_stcr_d[l_ac].stcr005,g_stcr_d[l_ac].stcr006,g_stcr_d[l_ac].stcr007, 
                   g_stcr_d[l_ac].stcr008,g_stcr_d[l_ac].stcr009,g_stcr_d[l_ac].stcr010,g_stcr_d[l_ac].stcr023, 
                   g_stcr_d[l_ac].stcr024,g_stcr_d[l_ac].stcr011,g_stcr_d[l_ac].stcr012,g_stcr_d[l_ac].stcr013, 
                   g_stcr_d[l_ac].stcr014,g_stcr_d[l_ac].stcr015,g_stcr_d[l_ac].stcr016,g_stcr_d[l_ac].stcr017, 
                   g_stcr_d[l_ac].stcr018,g_stcr_d[l_ac].stcr019,g_stcr_d[l_ac].stcr020,g_stcr_d[l_ac].stcr021, 
                   g_stcr_d[l_ac].stcr022,g_stcr_d[l_ac].stcrsite,g_stcr_d[l_ac].stcrunit)
                WHERE stcrent = g_enterprise AND stcrdocno = g_stcq_m.stcqdocno 
 
                  AND stcrseq = g_stcr_d_t.stcrseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcr_d[l_ac].* = g_stcr_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcr_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcr_d[l_ac].* = g_stcr_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcq_m.stcqdocno
               LET gs_keys_bak[1] = g_stcqdocno_t
               LET gs_keys[2] = g_stcr_d[g_detail_idx].stcrseq
               LET gs_keys_bak[2] = g_stcr_d_t.stcrseq
               CALL astt603_update_b('stcr_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt603_stcr_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stcr_d[g_detail_idx].stcrseq = g_stcr_d_t.stcrseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stcq_m.stcqdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stcr_d_t.stcrseq
 
                  CALL astt603_key_update_b(gs_keys,'stcr_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcq_m),util.JSON.stringify(g_stcr_d_t)
               LET g_log2 = util.JSON.stringify(g_stcq_m),util.JSON.stringify(g_stcr_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt603_unlock_b("stcr_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stcr_d[li_reproduce_target].* = g_stcr_d[li_reproduce].*
 
               LET g_stcr_d[li_reproduce_target].stcrseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcr_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcr_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stcr2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcr2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt603_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stcr2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
 
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stcr2_d[l_ac].* TO NULL 
            INITIALIZE g_stcr2_d_t.* TO NULL 
            INITIALIZE g_stcr2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_stcr2_d[l_ac].stcs004 = "0"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_stcr2_d_t.* = g_stcr2_d[l_ac].*     #新輸入資料
            LET g_stcr2_d_o.* = g_stcr2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt603_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astt603_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcr2_d[li_reproduce_target].* = g_stcr2_d[li_reproduce].*
 
               LET g_stcr2_d[li_reproduce_target].stcsseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            SELECT MAX(stcsseq)+1 INTO g_stcr2_d[l_ac].stcsseq
              FROM stcs_t
             WHERE stcsent = g_enterprise
               AND stcsdocno = g_stcq_m.stcqdocno
            IF cl_null(g_stcr2_d[l_ac].stcsseq) THEN 
               LET g_stcr2_d[l_ac].stcsseq = 1
            END IF
            LET g_stcr2_d[l_ac].stcsunit = g_stcq_m.stcqunit
            LET g_stcr2_d[l_ac].stcssite = g_stcq_m.stcqsite
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body2.before_row2"
            
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
            OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt603_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt603_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcr2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcr2_d[l_ac].stcsseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stcr2_d_t.* = g_stcr2_d[l_ac].*  #BACKUP
               LET g_stcr2_d_o.* = g_stcr2_d[l_ac].*  #BACKUP
               CALL astt603_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astt603_set_no_entry_b(l_cmd)
               IF NOT astt603_lock_b("stcs_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt603_bcl2 INTO g_stcr2_d[l_ac].stcsseq,g_stcr2_d[l_ac].stcs001,g_stcr2_d[l_ac].stcs002, 
                      g_stcr2_d[l_ac].stcs003,g_stcr2_d[l_ac].stcs004,g_stcr2_d[l_ac].stcs005,g_stcr2_d[l_ac].stcs006, 
                      g_stcr2_d[l_ac].stcs007,g_stcr2_d[l_ac].stcssite,g_stcr2_d[l_ac].stcsunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcr2_d_mask_o[l_ac].* =  g_stcr2_d[l_ac].*
                  CALL astt603_stcs_t_mask()
                  LET g_stcr2_d_mask_n[l_ac].* =  g_stcr2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt603_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcr2_d[l_ac].stcs005
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcr2_d[l_ac].stcs005_desc = '', g_rtn_fields[1] , ''
            LET g_stcr2_d[l_ac].stcs005_desc_desc = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stcr2_d[l_ac].stcs005_desc,g_stcr2_d[l_ac].stcs005_desc_desc
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body2.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body2.b_delete_ask"
               
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
               
               #add-point:單身2刪除前 name="input.body2.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stcq_m.stcqdocno
               LET gs_keys[gs_keys.getLength()+1] = g_stcr2_d_t.stcsseq
            
               #刪除同層單身
               IF NOT astt603_delete_b('stcs_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt603_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt603_key_delete_b(gs_keys,'stcs_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt603_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astt603_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_stcr_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcr2_d.getLength() + 1) THEN
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
               
            #add-point:單身2新增前 name="input.body2.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stcs_t 
             WHERE stcsent = g_enterprise AND stcsdocno = g_stcq_m.stcqdocno
               AND stcsseq = g_stcr2_d[l_ac].stcsseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcq_m.stcqdocno
               LET gs_keys[2] = g_stcr2_d[g_detail_idx].stcsseq
               CALL astt603_insert_b('stcs_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stcr_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt603_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body2.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stcr2_d[l_ac].* = g_stcr2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt603_bcl2
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
               LET g_stcr2_d[l_ac].* = g_stcr2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astt603_stcs_t_mask_restore('restore_mask_o')
                              
               UPDATE stcs_t SET (stcsdocno,stcsseq,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006, 
                   stcs007,stcssite,stcsunit) = (g_stcq_m.stcqdocno,g_stcr2_d[l_ac].stcsseq,g_stcr2_d[l_ac].stcs001, 
                   g_stcr2_d[l_ac].stcs002,g_stcr2_d[l_ac].stcs003,g_stcr2_d[l_ac].stcs004,g_stcr2_d[l_ac].stcs005, 
                   g_stcr2_d[l_ac].stcs006,g_stcr2_d[l_ac].stcs007,g_stcr2_d[l_ac].stcssite,g_stcr2_d[l_ac].stcsunit)  
                   #自訂欄位頁簽
                WHERE stcsent = g_enterprise AND stcsdocno = g_stcq_m.stcqdocno
                  AND stcsseq = g_stcr2_d_t.stcsseq #項次 
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcr2_d[l_ac].* = g_stcr2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcs_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcr2_d[l_ac].* = g_stcr2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcq_m.stcqdocno
               LET gs_keys_bak[1] = g_stcqdocno_t
               LET gs_keys[2] = g_stcr2_d[g_detail_idx].stcsseq
               LET gs_keys_bak[2] = g_stcr2_d_t.stcsseq
               CALL astt603_update_b('stcs_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astt603_stcs_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stcr2_d[g_detail_idx].stcsseq = g_stcr2_d_t.stcsseq 
                  ) THEN
                  LET gs_keys[01] = g_stcq_m.stcqdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_stcr2_d_t.stcsseq
                  CALL astt603_key_update_b(gs_keys,'stcs_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcq_m),util.JSON.stringify(g_stcr2_d_t)
               LET g_log2 = util.JSON.stringify(g_stcq_m),util.JSON.stringify(g_stcr2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcsseq
            #add-point:BEFORE FIELD stcsseq name="input.b.page2.stcsseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcsseq
            
            #add-point:AFTER FIELD stcsseq name="input.a.page2.stcsseq"
            #此段落由子樣板a05產生
            IF  g_stcq_m.stcqdocno IS NOT NULL AND g_stcr2_d[g_detail_idx].stcsseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcq_m.stcqdocno != g_stcqdocno_t OR g_stcr2_d[g_detail_idx].stcsseq != g_stcr2_d_t.stcsseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcs_t WHERE "||"stcsent = '" ||g_enterprise|| "' AND "||"stcsdocno = '"||g_stcq_m.stcqdocno ||"' AND "|| "stcsseq = '"||g_stcr2_d[g_detail_idx].stcsseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcsseq
            #add-point:ON CHANGE stcsseq name="input.g.page2.stcsseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs001
            #add-point:BEFORE FIELD stcs001 name="input.b.page2.stcs001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs001
            
            #add-point:AFTER FIELD stcs001 name="input.a.page2.stcs001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs001
            #add-point:ON CHANGE stcs001 name="input.g.page2.stcs001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs002
            #add-point:BEFORE FIELD stcs002 name="input.b.page2.stcs002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs002
            
            #add-point:AFTER FIELD stcs002 name="input.a.page2.stcs002"
            IF NOT cl_null(g_stcr2_d[l_ac].stcs002) THEN 
               IF g_stcr2_d[l_ac].stcs002 < 0 THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00083'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 LET g_stcr2_d[l_ac].stcs002 = g_stcr2_d_t.stcs002
                 NEXT FIELD stcs002
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs002
            #add-point:ON CHANGE stcs002 name="input.g.page2.stcs002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs003
            #add-point:BEFORE FIELD stcs003 name="input.b.page2.stcs003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs003
            
            #add-point:AFTER FIELD stcs003 name="input.a.page2.stcs003"
            IF NOT cl_null(g_stcr2_d[l_ac].stcs003) THEN 
               IF g_stcr2_d[l_ac].stcs003 < 0 THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00083'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 LET g_stcr2_d[l_ac].stcs003 = g_stcr2_d_t.stcs003
                 NEXT FIELD stcs003
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs003
            #add-point:ON CHANGE stcs003 name="input.g.page2.stcs003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs004
            #add-point:BEFORE FIELD stcs004 name="input.b.page2.stcs004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs004
            
            #add-point:AFTER FIELD stcs004 name="input.a.page2.stcs004"
            IF NOT cl_null(g_stcr2_d[l_ac].stcs004) THEN 
               IF g_stcr2_d[l_ac].stcs004 < 0 THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00083'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 LET g_stcr2_d[l_ac].stcs004 = g_stcr2_d_t.stcs004
                 NEXT FIELD stcs004
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs004
            #add-point:ON CHANGE stcs004 name="input.g.page2.stcs004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs005
            
            #add-point:AFTER FIELD stcs005 name="input.a.page2.stcs005"
            IF NOT cl_null(g_stcr2_d[l_ac].stcs005) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcr2_d[l_ac].stcs005 != g_stcr2_d_t.stcs005) THEN   #160824-00007#196 161120 by lori add
                  CALL astt603_stcs005_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_stcr2_d[l_ac].stcs005 = g_stcr2_d_t.stcs005
                     NEXT FIELD stcs005
                  END IF 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcr2_d[l_ac].stcs005 != g_stcr2_d_t.stcs005) THEN   #160824-00007#196 161120 by lori mark
                  LET l_n = 0
                  SELECT COUNT(*) INTO l_n 
                    FROM stcs_t
                   WHERE stcsent = g_enterprise
                     AND stcsdocno = g_stcq_m.stcqdocno
                     AND stcs005 = g_stcr2_d[l_ac].stcs005
                  IF l_n > 0 THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00069'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stcr2_d[l_ac].stcs005 = g_stcr2_d_t.stcs005
                     NEXT FIELD stcs005
                  END IF 
               END IF                
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcr2_d[l_ac].stcs005
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcr2_d[l_ac].stcs005_desc = '', g_rtn_fields[1] , ''
            LET g_stcr2_d[l_ac].stcs005_desc_desc = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stcr2_d[l_ac].stcs005_desc,g_stcr2_d[l_ac].stcs005_desc_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs005
            #add-point:BEFORE FIELD stcs005 name="input.b.page2.stcs005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs005
            #add-point:ON CHANGE stcs005 name="input.g.page2.stcs005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs006
            #add-point:BEFORE FIELD stcs006 name="input.b.page2.stcs006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs006
            
            #add-point:AFTER FIELD stcs006 name="input.a.page2.stcs006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs006
            #add-point:ON CHANGE stcs006 name="input.g.page2.stcs006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcs007
            #add-point:BEFORE FIELD stcs007 name="input.b.page2.stcs007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcs007
            
            #add-point:AFTER FIELD stcs007 name="input.a.page2.stcs007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcs007
            #add-point:ON CHANGE stcs007 name="input.g.page2.stcs007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcssite
            #add-point:BEFORE FIELD stcssite name="input.b.page2.stcssite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcssite
            
            #add-point:AFTER FIELD stcssite name="input.a.page2.stcssite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcssite
            #add-point:ON CHANGE stcssite name="input.g.page2.stcssite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcsunit
            #add-point:BEFORE FIELD stcsunit name="input.b.page2.stcsunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcsunit
            
            #add-point:AFTER FIELD stcsunit name="input.a.page2.stcsunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcsunit
            #add-point:ON CHANGE stcsunit name="input.g.page2.stcsunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.stcsseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcsseq
            #add-point:ON ACTION controlp INFIELD stcsseq name="input.c.page2.stcsseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs001
            #add-point:ON ACTION controlp INFIELD stcs001 name="input.c.page2.stcs001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs002
            #add-point:ON ACTION controlp INFIELD stcs002 name="input.c.page2.stcs002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs003
            #add-point:ON ACTION controlp INFIELD stcs003 name="input.c.page2.stcs003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs004
            #add-point:ON ACTION controlp INFIELD stcs004 name="input.c.page2.stcs004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs005
            #add-point:ON ACTION controlp INFIELD stcs005 name="input.c.page2.stcs005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcr2_d[l_ac].stcs005
            #給予arg
            LET g_qryparam.arg1 = "" #
            CALL q_imaa001()
            LET g_stcr2_d[l_ac].stcs005 = g_qryparam.return1              
            LET g_stcr2_d[l_ac].stcs005_desc = g_qryparam.return2 
            LET g_stcr2_d[l_ac].stcs005_desc_desc = g_qryparam.return3 
            DISPLAY g_stcr2_d[l_ac].stcs005 TO stcs005              #
            DISPLAY g_stcr2_d[l_ac].stcs005_desc TO stcs005_desc #品名
            DISPLAY g_stcr2_d[l_ac].stcs005_desc_desc TO stcs005_desc_desc #規格
            NEXT FIELD stcs005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs006
            #add-point:ON ACTION controlp INFIELD stcs006 name="input.c.page2.stcs006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcs007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcs007
            #add-point:ON ACTION controlp INFIELD stcs007 name="input.c.page2.stcs007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcssite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcssite
            #add-point:ON ACTION controlp INFIELD stcssite name="input.c.page2.stcssite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcsunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcsunit
            #add-point:ON ACTION controlp INFIELD stcsunit name="input.c.page2.stcsunit"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stcr2_d[l_ac].* = g_stcr2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt603_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt603_unlock_b("stcs_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            LET l_n = 0
            SELECT COUNT(*) INTO l_n
              FROM stcs_t
             WHERE stcsent = g_enterprise
               AND stcsdocno = g_stcq_m.stcqdocno
            DISPLAY l_n TO num
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stcr2_d[li_reproduce_target].* = g_stcr2_d[li_reproduce].*
 
               LET g_stcr2_d[li_reproduce_target].stcsseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcr2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcr2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astt603.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
         CALL DIALOG.setCurrentRow("s_detail2",g_detail_idx)
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stcqsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcrseq
               WHEN "s_detail2"
                  NEXT FIELD stcsseq
 
               #add-point:input段modify_detail 

               #end add-point  
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stcqdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcrseq
               WHEN "s_detail2"
                  NEXT FIELD stcsseq
 
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
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
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
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt603_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019 LIKE ooef_t.ooef019
   DEFINE l_n       LIKE type_t.num5
   DEFINE l_stcw004 LIKE stcw_t.stcw004
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt603_b_fill() #單身填充
      CALL astt603_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt603_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stcq_m.stcqsite

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcq_m.stcq017
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcq_m.stcq017_desc
     
   #end add-point
   
   #遮罩相關處理
   LET g_stcq_m_mask_o.* =  g_stcq_m.*
   CALL astt603_stcq_t_mask()
   LET g_stcq_m_mask_n.* =  g_stcq_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit, 
       g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq003_desc,g_stcq_m.stcq004,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq006_desc,g_stcq_m.stcq007,g_stcq_m.stcq007_desc, 
       g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq008_desc,g_stcq_m.stcq009,g_stcq_m.stcq009_desc, 
       g_stcq_m.stcq016,g_stcq_m.stcq016_desc,g_stcq_m.stcq017,g_stcq_m.stcq017_desc,g_stcq_m.next_b, 
       g_stcq_m.stcq010,g_stcq_m.stcq010_desc,g_stcq_m.stcq011,g_stcq_m.stcq011_desc,g_stcq_m.stcq012, 
       g_stcq_m.stcq012_desc,g_stcq_m.stcq018,g_stcq_m.num,g_stcq_m.stcq013,g_stcq_m.stcq013_desc,g_stcq_m.stcq014, 
       g_stcq_m.stcq014_desc,g_stcq_m.stcq015,g_stcq_m.stcq015_desc,g_stcq_m.stcq019,g_stcq_m.stcqownid, 
       g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmodid_desc, 
       g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfid_desc,g_stcq_m.stcqcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcq_m.stcqstus 
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
   FOR l_ac = 1 TO g_stcr_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
 
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stcr2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
 
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM stcs_t
    WHERE stcsent = g_enterprise
      AND stcsdocno = g_stcq_m.stcqdocno
      AND stcsent = g_enterprise #160905-00007#3 add
   DISPLAY l_n TO num
   LET l_stcw004 = ''
   SELECT stcw004 INTO l_stcw004
     FROM stcw_t
    WHERE stcw001 = g_stcq_m.stcq001
      AND stcw005 = 'N'
      AND stcwent = g_enterprise #160905-00007#3 add
    ORDER BY stcwseq       
   DISPLAY l_stcw004 TO next_b     
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt603_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt603_detail_show()
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
 
{<section id="astt603.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt603_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stcq_t.stcqdocno 
   DEFINE l_oldno     LIKE stcq_t.stcqdocno 
 
   DEFINE l_master    RECORD LIKE stcq_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stcr_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stcs_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   DEFINE l_insert      LIKE type_t.num5
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
   
   IF g_stcq_m.stcqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
    
   LET g_stcq_m.stcqdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcq_m.stcqownid = g_user
      LET g_stcq_m.stcqowndp = g_dept
      LET g_stcq_m.stcqcrtid = g_user
      LET g_stcq_m.stcqcrtdp = g_dept 
      LET g_stcq_m.stcqcrtdt = cl_get_current()
      LET g_stcq_m.stcqmodid = g_user
      LET g_stcq_m.stcqmoddt = cl_get_current()
      LET g_stcq_m.stcqstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_stcq_m.stcqdocdt = g_today
   LET g_stcq_m.stcqcnfid = ""
   LET g_stcq_m.stcqcnfdt = ""
#   LET g_stcq_m.stcqsite = g_site
   CALL s_aooi500_default(g_prog,'stcqsite',g_site) RETURNING l_insert,g_stcq_m.stcqsite
      IF NOT l_insert THEN
         RETURN
      END IF
   LET g_stcq_m.stcqunit = g_site
   #dongsz--add--str---
   #預設單據的單別
   LET r_success = ''
   LET r_doctype = ''
   CALL s_arti200_get_def_doc_type(g_stcq_m.stcqsite,g_prog,'1')
        RETURNING r_success,r_doctype
   LET g_stcq_m.stcqdocno = r_doctype
   #dongsz--add--end---
   LET g_stcq_m.stcq008 = g_user
   SELECT ooag003 INTO g_stcq_m.stcq009
     FROM ooag_t 
    WHERE ooagent = g_enterprise
      AND ooag001 = g_user   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcq_m.stcqstus 
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
   
   
   CALL astt603_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stcq_m.* TO NULL
      INITIALIZE g_stcr_d TO NULL
      INITIALIZE g_stcr2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt603_show()
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
   CALL astt603_set_act_visible()   
   CALL astt603_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcqent = " ||g_enterprise|| " AND",
                      " stcqdocno = '", g_stcq_m.stcqdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt603_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt603_idx_chk()
   
   LET g_data_owner = g_stcq_m.stcqownid      
   LET g_data_dept  = g_stcq_m.stcqowndp
   
   #功能已完成,通報訊息中心
   CALL astt603_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt603_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stcr_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stcs_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt603_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcr_t
    WHERE stcrent = g_enterprise AND stcrdocno = g_stcqdocno_t
 
    INTO TEMP astt603_detail
 
   #將key修正為調整後   
   UPDATE astt603_detail 
      #更新key欄位
      SET stcrdocno = g_stcq_m.stcqdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stcr_t SELECT * FROM astt603_detail
   
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
   DROP TABLE astt603_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcs_t 
    WHERE stcsent = g_enterprise AND stcsdocno = g_stcqdocno_t
 
    INTO TEMP astt603_detail
 
   #將key修正為調整後   
   UPDATE astt603_detail SET stcsdocno = g_stcq_m.stcqdocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stcs_t SELECT * FROM astt603_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt603_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt603_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stcq_m.stcqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt603_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt603_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcq_m_mask_o.* =  g_stcq_m.*
   CALL astt603_stcq_t_mask()
   LET g_stcq_m_mask_n.* =  g_stcq_m.*
   
   CALL astt603_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt603_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stcqdocno_t = g_stcq_m.stcqdocno
 
 
      DELETE FROM stcq_t
       WHERE stcqent = g_enterprise AND stcqdocno = g_stcq_m.stcqdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stcq_m.stcqdocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stcr_t
       WHERE stcrent = g_enterprise AND stcrdocno = g_stcq_m.stcqdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
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
      DELETE FROM stcs_t
       WHERE stcsent = g_enterprise AND
             stcsdocno = g_stcq_m.stcqdocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stcq_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt603_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stcr_d.clear() 
      CALL g_stcr2_d.clear()       
 
     
      CALL astt603_ui_browser_refresh()  
      #CALL astt603_ui_headershow()  
      #CALL astt603_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt603_browser_fill("")
         CALL astt603_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt603_cl
 
   #功能已完成,通報訊息中心
   CALL astt603_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt603.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt603_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stcr_d.clear()
   CALL g_stcr2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt603_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcrseq,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006,stcr007, 
             stcr008,stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015,stcr016, 
             stcr017,stcr018,stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit ,t1.stael003 FROM stcr_t", 
                
                     " INNER JOIN stcq_t ON stcqent = " ||g_enterprise|| " AND stcqdocno = stcrdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stcr001 AND t1.stael002='"||g_dlang||"' ",
 
                     " WHERE stcrent=? AND stcrdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcr_t.stcrseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt603_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt603_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stcq_m.stcqdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stcq_m.stcqdocno INTO g_stcr_d[l_ac].stcrseq,g_stcr_d[l_ac].stcr001, 
          g_stcr_d[l_ac].stcr002,g_stcr_d[l_ac].stcr003,g_stcr_d[l_ac].stcr004,g_stcr_d[l_ac].stcr005, 
          g_stcr_d[l_ac].stcr006,g_stcr_d[l_ac].stcr007,g_stcr_d[l_ac].stcr008,g_stcr_d[l_ac].stcr009, 
          g_stcr_d[l_ac].stcr010,g_stcr_d[l_ac].stcr023,g_stcr_d[l_ac].stcr024,g_stcr_d[l_ac].stcr011, 
          g_stcr_d[l_ac].stcr012,g_stcr_d[l_ac].stcr013,g_stcr_d[l_ac].stcr014,g_stcr_d[l_ac].stcr015, 
          g_stcr_d[l_ac].stcr016,g_stcr_d[l_ac].stcr017,g_stcr_d[l_ac].stcr018,g_stcr_d[l_ac].stcr019, 
          g_stcr_d[l_ac].stcr020,g_stcr_d[l_ac].stcr021,g_stcr_d[l_ac].stcr022,g_stcr_d[l_ac].stcrsite, 
          g_stcr_d[l_ac].stcrunit,g_stcr_d[l_ac].stcr001_desc   #(ver:78)
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
    
   #判斷是否填充
   IF astt603_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcsseq,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006,stcs007, 
             stcssite,stcsunit ,t2.imaal003 ,t3.imaal004 FROM stcs_t",   
                     " INNER JOIN  stcq_t ON stcqent = " ||g_enterprise|| " AND stcqdocno = stcsdocno ",
 
                     "",
                     
                                    " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=stcs005 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=stcs005 AND t3.imaal002='"||g_dlang||"' ",
 
                     " WHERE stcsent=? AND stcsdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcs_t.stcsseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt603_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astt603_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stcq_m.stcqdocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stcq_m.stcqdocno INTO g_stcr2_d[l_ac].stcsseq,g_stcr2_d[l_ac].stcs001, 
          g_stcr2_d[l_ac].stcs002,g_stcr2_d[l_ac].stcs003,g_stcr2_d[l_ac].stcs004,g_stcr2_d[l_ac].stcs005, 
          g_stcr2_d[l_ac].stcs006,g_stcr2_d[l_ac].stcs007,g_stcr2_d[l_ac].stcssite,g_stcr2_d[l_ac].stcsunit, 
          g_stcr2_d[l_ac].stcs005_desc,g_stcr2_d[l_ac].stcs005_desc_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         
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
   
   CALL g_stcr_d.deleteElement(g_stcr_d.getLength())
   CALL g_stcr2_d.deleteElement(g_stcr2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt603_pb
   FREE astt603_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stcr_d.getLength()
      LET g_stcr_d_mask_o[l_ac].* =  g_stcr_d[l_ac].*
      CALL astt603_stcr_t_mask()
      LET g_stcr_d_mask_n[l_ac].* =  g_stcr_d[l_ac].*
   END FOR
   
   LET g_stcr2_d_mask_o.* =  g_stcr2_d.*
   FOR l_ac = 1 TO g_stcr2_d.getLength()
      LET g_stcr2_d_mask_o[l_ac].* =  g_stcr2_d[l_ac].*
      CALL astt603_stcs_t_mask()
      LET g_stcr2_d_mask_n[l_ac].* =  g_stcr2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt603_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stcr_t
       WHERE stcrent = g_enterprise AND
         stcrdocno = ps_keys_bak[1] AND stcrseq = ps_keys_bak[2]
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
         CALL g_stcr_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stcs_t
       WHERE stcsent = g_enterprise AND
             stcsdocno = ps_keys_bak[1] AND stcsseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcr2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt603_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stcr_t
                  (stcrent,
                   stcrdocno,
                   stcrseq
                   ,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006,stcr007,stcr008,stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015,stcr016,stcr017,stcr018,stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcr_d[g_detail_idx].stcr001,g_stcr_d[g_detail_idx].stcr002,g_stcr_d[g_detail_idx].stcr003, 
                       g_stcr_d[g_detail_idx].stcr004,g_stcr_d[g_detail_idx].stcr005,g_stcr_d[g_detail_idx].stcr006, 
                       g_stcr_d[g_detail_idx].stcr007,g_stcr_d[g_detail_idx].stcr008,g_stcr_d[g_detail_idx].stcr009, 
                       g_stcr_d[g_detail_idx].stcr010,g_stcr_d[g_detail_idx].stcr023,g_stcr_d[g_detail_idx].stcr024, 
                       g_stcr_d[g_detail_idx].stcr011,g_stcr_d[g_detail_idx].stcr012,g_stcr_d[g_detail_idx].stcr013, 
                       g_stcr_d[g_detail_idx].stcr014,g_stcr_d[g_detail_idx].stcr015,g_stcr_d[g_detail_idx].stcr016, 
                       g_stcr_d[g_detail_idx].stcr017,g_stcr_d[g_detail_idx].stcr018,g_stcr_d[g_detail_idx].stcr019, 
                       g_stcr_d[g_detail_idx].stcr020,g_stcr_d[g_detail_idx].stcr021,g_stcr_d[g_detail_idx].stcr022, 
                       g_stcr_d[g_detail_idx].stcrsite,g_stcr_d[g_detail_idx].stcrunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stcr_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stcs_t
                  (stcsent,
                   stcsdocno,
                   stcsseq
                   ,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006,stcs007,stcssite,stcsunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcr2_d[g_detail_idx].stcs001,g_stcr2_d[g_detail_idx].stcs002,g_stcr2_d[g_detail_idx].stcs003, 
                       g_stcr2_d[g_detail_idx].stcs004,g_stcr2_d[g_detail_idx].stcs005,g_stcr2_d[g_detail_idx].stcs006, 
                       g_stcr2_d[g_detail_idx].stcs007,g_stcr2_d[g_detail_idx].stcssite,g_stcr2_d[g_detail_idx].stcsunit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcr2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt603_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcr_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt603_stcr_t_mask_restore('restore_mask_o')
               
      UPDATE stcr_t 
         SET (stcrdocno,
              stcrseq
              ,stcr001,stcr002,stcr003,stcr004,stcr005,stcr006,stcr007,stcr008,stcr009,stcr010,stcr023,stcr024,stcr011,stcr012,stcr013,stcr014,stcr015,stcr016,stcr017,stcr018,stcr019,stcr020,stcr021,stcr022,stcrsite,stcrunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcr_d[g_detail_idx].stcr001,g_stcr_d[g_detail_idx].stcr002,g_stcr_d[g_detail_idx].stcr003, 
                  g_stcr_d[g_detail_idx].stcr004,g_stcr_d[g_detail_idx].stcr005,g_stcr_d[g_detail_idx].stcr006, 
                  g_stcr_d[g_detail_idx].stcr007,g_stcr_d[g_detail_idx].stcr008,g_stcr_d[g_detail_idx].stcr009, 
                  g_stcr_d[g_detail_idx].stcr010,g_stcr_d[g_detail_idx].stcr023,g_stcr_d[g_detail_idx].stcr024, 
                  g_stcr_d[g_detail_idx].stcr011,g_stcr_d[g_detail_idx].stcr012,g_stcr_d[g_detail_idx].stcr013, 
                  g_stcr_d[g_detail_idx].stcr014,g_stcr_d[g_detail_idx].stcr015,g_stcr_d[g_detail_idx].stcr016, 
                  g_stcr_d[g_detail_idx].stcr017,g_stcr_d[g_detail_idx].stcr018,g_stcr_d[g_detail_idx].stcr019, 
                  g_stcr_d[g_detail_idx].stcr020,g_stcr_d[g_detail_idx].stcr021,g_stcr_d[g_detail_idx].stcr022, 
                  g_stcr_d[g_detail_idx].stcrsite,g_stcr_d[g_detail_idx].stcrunit) 
         WHERE stcrent = g_enterprise AND stcrdocno = ps_keys_bak[1] AND stcrseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcr_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcr_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt603_stcr_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcs_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astt603_stcs_t_mask_restore('restore_mask_o')
               
      UPDATE stcs_t 
         SET (stcsdocno,
              stcsseq
              ,stcs001,stcs002,stcs003,stcs004,stcs005,stcs006,stcs007,stcssite,stcsunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcr2_d[g_detail_idx].stcs001,g_stcr2_d[g_detail_idx].stcs002,g_stcr2_d[g_detail_idx].stcs003, 
                  g_stcr2_d[g_detail_idx].stcs004,g_stcr2_d[g_detail_idx].stcs005,g_stcr2_d[g_detail_idx].stcs006, 
                  g_stcr2_d[g_detail_idx].stcs007,g_stcr2_d[g_detail_idx].stcssite,g_stcr2_d[g_detail_idx].stcsunit)  
 
         WHERE stcsent = g_enterprise AND stcsdocno = ps_keys_bak[1] AND stcsseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcs_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcs_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt603_stcs_t_mask_restore('restore_mask_n')
 
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
 
{<section id="astt603.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt603_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt603.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt603_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt603.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt603_lock_b(ps_table,ps_page)
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
   #CALL astt603_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stcr_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt603_bcl USING g_enterprise,
                                       g_stcq_m.stcqdocno,g_stcr_d[g_detail_idx].stcrseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt603_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stcs_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt603_bcl2 USING g_enterprise,
                                             g_stcq_m.stcqdocno,g_stcr2_d[g_detail_idx].stcsseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt603_bcl2:",SQLERRMESSAGE 
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
 
{<section id="astt603.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt603_unlock_b(ps_table,ps_page)
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
      CLOSE astt603_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt603_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt603_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stcqdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stcqdocno",TRUE)
      CALL cl_set_comp_entry("stcqdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stcqsite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt603_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stcqdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stcqdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stcqdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stcqsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stcqsite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt603_set_entry_b(p_cmd)
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
 
{<section id="astt603.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt603_set_no_entry_b(p_cmd)
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
 
{<section id="astt603.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt603_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt603_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stcq_m.stcqstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt603_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt603.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt603_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt603.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt603_default_search()
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
      LET ls_wc = ls_wc, " stcqdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stcq_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcr_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcs_t" 
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
 
{<section id="astt603.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt603_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stcq_m.stcqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt603_cl USING g_enterprise,g_stcq_m.stcqdocno
   IF STATUS THEN
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt603_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
       g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
       g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
       g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
       g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
       g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
       g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
       g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
       g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt603_action_chk() THEN
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno,g_stcq_m.stcqunit, 
       g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq003_desc,g_stcq_m.stcq004,g_stcq_m.stcq004_desc, 
       g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq006_desc,g_stcq_m.stcq007,g_stcq_m.stcq007_desc, 
       g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq008_desc,g_stcq_m.stcq009,g_stcq_m.stcq009_desc, 
       g_stcq_m.stcq016,g_stcq_m.stcq016_desc,g_stcq_m.stcq017,g_stcq_m.stcq017_desc,g_stcq_m.next_b, 
       g_stcq_m.stcq010,g_stcq_m.stcq010_desc,g_stcq_m.stcq011,g_stcq_m.stcq011_desc,g_stcq_m.stcq012, 
       g_stcq_m.stcq012_desc,g_stcq_m.stcq018,g_stcq_m.num,g_stcq_m.stcq013,g_stcq_m.stcq013_desc,g_stcq_m.stcq014, 
       g_stcq_m.stcq014_desc,g_stcq_m.stcq015,g_stcq_m.stcq015_desc,g_stcq_m.stcq019,g_stcq_m.stcqownid, 
       g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtid_desc, 
       g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmodid_desc, 
       g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfid_desc,g_stcq_m.stcqcnfdt
 
   CASE g_stcq_m.stcqstus
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
         CASE g_stcq_m.stcqstus
            
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
      CALL cl_set_act_visible("open,invalid,valid,approved,withdraw,rejection,signing",TRUE)
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stcq_m.stcqstus
         WHEN "N"
            CALL cl_set_act_visible("open,approved,withdraw,rejection,signing",FALSE)
#            IF cl_bpm_chk() THEN
#                CALL cl_set_act_visible("signing",TRUE)
#            END IF
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
            CALL cl_set_act_visible("void,invalid,approved,withdraw,rejection,signing",FALSE)
      
         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("void,invalid,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
            
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)
            
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt603_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt603_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt603_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt603_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            
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
      g_stcq_m.stcqstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #151125-00001#4 --- add start ---
   IF lc_state = 'X' THEN
      IF NOT cl_ask_confirm('aim-00109') THEN
         CALL s_transaction_end('N','0') 
         RETURN
      END IF
   END IF
   #151125-00001#4 --- add end   ---
   #end add-point
   
   LET g_stcq_m.stcqmodid = g_user
   LET g_stcq_m.stcqmoddt = cl_get_current()
   LET g_stcq_m.stcqstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stcq_t 
      SET (stcqstus,stcqmodid,stcqmoddt) 
        = (g_stcq_m.stcqstus,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt)     
    WHERE stcqent = g_enterprise AND stcqdocno = g_stcq_m.stcqdocno
 
    
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
      EXECUTE astt603_master_referesh USING g_stcq_m.stcqdocno INTO g_stcq_m.stcqsite,g_stcq_m.stcqdocdt, 
          g_stcq_m.stcqdocno,g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq002, 
          g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq007,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq009, 
          g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq011,g_stcq_m.stcq012,g_stcq_m.stcq018, 
          g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqowndp, 
          g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmoddt, 
          g_stcq_m.stcqcnfid,g_stcq_m.stcqcnfdt,g_stcq_m.stcqsite_desc,g_stcq_m.stcq003_desc,g_stcq_m.stcq004_desc, 
          g_stcq_m.stcq006_desc,g_stcq_m.stcq007_desc,g_stcq_m.stcq008_desc,g_stcq_m.stcq009_desc,g_stcq_m.stcq016_desc, 
          g_stcq_m.stcq010_desc,g_stcq_m.stcq011_desc,g_stcq_m.stcq012_desc,g_stcq_m.stcq013_desc,g_stcq_m.stcq014_desc, 
          g_stcq_m.stcq015_desc,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid_desc, 
          g_stcq_m.stcqcrtdp_desc,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stcq_m.stcqsite,g_stcq_m.stcqsite_desc,g_stcq_m.stcqdocdt,g_stcq_m.stcqdocno, 
          g_stcq_m.stcqunit,g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq003_desc,g_stcq_m.stcq004, 
          g_stcq_m.stcq004_desc,g_stcq_m.stcq002,g_stcq_m.stcq005,g_stcq_m.stcq006,g_stcq_m.stcq006_desc, 
          g_stcq_m.stcq007,g_stcq_m.stcq007_desc,g_stcq_m.stcqstus,g_stcq_m.stcq008,g_stcq_m.stcq008_desc, 
          g_stcq_m.stcq009,g_stcq_m.stcq009_desc,g_stcq_m.stcq016,g_stcq_m.stcq016_desc,g_stcq_m.stcq017, 
          g_stcq_m.stcq017_desc,g_stcq_m.next_b,g_stcq_m.stcq010,g_stcq_m.stcq010_desc,g_stcq_m.stcq011, 
          g_stcq_m.stcq011_desc,g_stcq_m.stcq012,g_stcq_m.stcq012_desc,g_stcq_m.stcq018,g_stcq_m.num, 
          g_stcq_m.stcq013,g_stcq_m.stcq013_desc,g_stcq_m.stcq014,g_stcq_m.stcq014_desc,g_stcq_m.stcq015, 
          g_stcq_m.stcq015_desc,g_stcq_m.stcq019,g_stcq_m.stcqownid,g_stcq_m.stcqownid_desc,g_stcq_m.stcqowndp, 
          g_stcq_m.stcqowndp_desc,g_stcq_m.stcqcrtid,g_stcq_m.stcqcrtid_desc,g_stcq_m.stcqcrtdp,g_stcq_m.stcqcrtdp_desc, 
          g_stcq_m.stcqcrtdt,g_stcq_m.stcqmodid,g_stcq_m.stcqmodid_desc,g_stcq_m.stcqmoddt,g_stcq_m.stcqcnfid, 
          g_stcq_m.stcqcnfid_desc,g_stcq_m.stcqcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stcq_m.stcqstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt603_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt603_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt603.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt603_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stcr_d.getLength() THEN
         LET g_detail_idx = g_stcr_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcr_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcr_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stcr2_d.getLength() THEN
         LET g_detail_idx = g_stcr2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcr2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcr2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt603_b_fill2(pi_idx)
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
   
   CALL astt603_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt603_fill_chk(ps_idx)
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
 
{<section id="astt603.status_show" >}
PRIVATE FUNCTION astt603_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt603.mask_functions" >}
&include "erp/ast/astt603_mask.4gl"
 
{</section>}
 
{<section id="astt603.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt603_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success  LIKE type_t.chr2
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
 
 
   CALL astt603_show()
   CALL astt603_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   #MOD BY zhujing 2015-6-16
   CALL s_astt603_conf_chk(g_stcq_m.stcqdocno,g_stcq_m.stcqstus) RETURNING l_success,g_errno
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = g_stcq_m.stcqdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE astt603_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stcq_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stcr_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_stcr2_d))
 
 
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
   #CALL astt603_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt603_ui_headershow()
   CALL astt603_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt603_draw_out()
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
   CALL astt603_ui_headershow()  
   CALL astt603_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt603.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt603_set_pk_array()
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
   LET g_pk_array[1].values = g_stcq_m.stcqdocno
   LET g_pk_array[1].column = 'stcqdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt603.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt603.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt603_msgcentre_notify(lc_state)
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
   CALL astt603_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stcq_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt603.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt603_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stcqstus  INTO g_stcq_m.stcqstus
     FROM stcq_t
    WHERE stcqent = g_enterprise
      AND stcqdocno = g_stcq_m.stcqdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stcq_m.stcqstus
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
        LET g_errparam.extend = g_stcq_m.stcqdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt603_set_act_visible()
        CALL astt603_set_act_no_visible()
        CALL astt603_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt603.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 合约编号检查
# Memo...........:
# Usage..........: CALL astt603_stcq001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq001_chk()
   DEFINE l_stcestus   LIKE stce_t.stcestus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   
   LET g_errno = ''
   SELECT stcestus,stce009,stce010,stce005,stce006,stce007,stce008,stce017,stce018,stce021,stce022,stce024
     INTO l_stcestus,l_stce009,l_stce010,l_stce005,l_stce006,l_stce007,l_stce008,l_stce017,l_stce018,l_stce021,l_stce022,l_stce024
     FROM stce_t
    WHERE stceent = g_enterprise
      AND stce001 = g_stcq_m.stcq001
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00051'
      WHEN l_stcestus <> 'Y'   LET g_errno = 'ast-00052'
      WHEN l_stce017 > g_stcq_m.stcqdocdt OR l_stce018 < g_stcq_m.stcqdocdt
                               LET g_errno = 'ast-00055'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      IF g_stcq_m_t.stcq001 IS NULL OR (NOT cl_null(g_stcq_m_t.stcq001) AND g_stcq_m_t.stcq001 != g_stcq_m.stcq001) THEN 
         LET g_stcq_m.stcq003 = l_stce009
         LET g_stcq_m.stcq004 = l_stce010
         LET g_stcq_m.stcq005 = l_stce005
         LET g_stcq_m.stcq006 = l_stce006
         LET g_stcq_m.stcq007 = l_stce007
         LET g_stcq_m.stcq002 = l_stce008
         LET g_stcq_m.stcq018 = l_stce017
         LET g_stcq_m.stcq019 = l_stce018
         LET g_stcq_m.stcq016 = l_stce021
         LET g_stcq_m.stcq017 = l_stce022
         LET g_stcq_m.stcq010 = l_stce024      
         DISPLAY BY NAME g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq005,g_stcq_m.stcq006,
                         g_stcq_m.stcq007,g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,
                         g_stcq_m.stcq018,g_stcq_m.stcq019
                         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq003
         CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq003_desc
         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq004
         CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq004_desc
         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq006
         CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq006_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq006_desc
         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq007
         CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq007_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq007_desc
         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq016
         CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq016_desc
         
         SELECT ooef019 INTO l_ooef019
           FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = g_stcq_m.stcqsite         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq017
         CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq017_desc
         
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stcq_m.stcq010
         CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcq_m.stcq010_desc
      END IF    
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 经销商检查
# Memo...........:
# Usage..........: astt603_stcq003_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq003_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018   
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
   SELECT pmaastus INTO l_pmaastus
     FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa230 = '1' 
      AND pmaa092 = '2' 
      AND pmaa002 <> '1'
      AND pmaa001 = g_stcq_m.stcq003
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00053'
      WHEN l_pmaastus <> 'Y'   LET g_errno = 'ast-00054'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN
      IF NOT cl_null(g_stcq_m.stcq001) THEN
         LET l_n = 0
         #检查经销商是否存在合同中      
         SELECT COUNT(*) INTO l_n
           FROM stce_t         
          WHERE stceent = g_enterprise
            AND stce001 = g_stcq_m.stcq001
            AND stce009 = g_stcq_m.stcq003
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00056'
         END IF 
      ELSE
         IF NOT cl_null(g_stcq_m.stcqdocdt) THEN 
            #带出符合条件的合约编号及其他栏位
            SELECT stce001,stce010,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
              INTO l_stce001,l_stce010,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
              FROM stce_t
             WHERE stceent = g_enterprise
               AND stce009 = g_stcq_m.stcq003
               AND stce010 = g_stcq_m.stcq004
               AND stce017 <= g_stcq_m.stcqdocdt
               AND stce018 >= g_stcq_m.stcqdocdt
               AND stcestus = 'Y'
            IF NOT cl_null(l_stce001) THEN    
               LET g_stcq_m.stcq001 = l_stce001
               LET g_stcq_m.stcq004 = l_stce010
               LET g_stcq_m.stcq005 = l_stce005
               LET g_stcq_m.stcq006 = l_stce006
               LET g_stcq_m.stcq007 = l_stce007
               LET g_stcq_m.stcq002 = l_stce008
               LET g_stcq_m.stcq016 = l_stce021
               LET g_stcq_m.stcq017 = l_stce022
               LET g_stcq_m.stcq010 = l_stce024  
               LET g_stcq_m.stcq018 = l_stce017
               LET g_stcq_m.stcq019 = l_stce018               
               DISPLAY BY NAME g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq005,g_stcq_m.stcq006,
                               g_stcq_m.stcq007,g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq018,
                               g_stcq_m.stcq019

               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcm_m.stcm001
                  AND stcw005 = 'N'
                  AND stcwent = g_enterprise #160905-00007#3 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b   
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq003
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq003_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq004
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq004_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq006
               CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq006_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq006_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq007
               CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq007_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq007_desc               
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq016
               CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq016_desc
               
               SELECT ooef019 INTO l_ooef019
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_stcq_m.stcqsite         
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq017
               CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq017_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq010_desc               
            END IF
         END IF 
      END IF          
   END IF 
END FUNCTION
# Descriptions...: 网点检查
# Memo...........:
# Usage..........: astt603_stcq004_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
PRIVATE FUNCTION astt603_stcq004_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018   
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
   #网点编号存在
   IF NOT cl_null(g_stcq_m.stcq003) THEN
      LET l_n = 0      
      SELECT COUNT(*) INTO l_n 
        FROM pmaa_t 
       WHERE pmaaent = g_enterprise 
         AND pmaa006 = g_stcq_m.stcq003 
         AND pmaa001 = g_stcq_m.stcq004
      IF l_n =0 THEN
        LET g_errno = 'ast-00043'
        RETURN 
      END IF
   END IF 
   IF cl_null(g_errno) THEN
      IF NOT cl_null(g_stcq_m.stcq001) THEN
         LET l_n = 0
         #检查网点是否存在合同中      
         SELECT COUNT(*) INTO l_n
           FROM stce_t         
          WHERE stceent = g_enterprise
            AND stce001 = g_stcq_m.stcq001
            AND stce010 = g_stcq_m.stcq004
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00057'
         END IF 
      ELSE
         IF NOT cl_null(g_stcq_m.stcqdocdt) AND NOT cl_null(g_stcq_m.stcq003) THEN 
            #带出符合条件的合约编号及其他栏位
            SELECT stce001,stce009,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
              INTO l_stce001,l_stce009,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
              FROM stce_t
             WHERE stceent = g_enterprise
               AND stce010 = g_stcq_m.stcq004
               AND stce009 = g_stcq_m.stcq003
               AND stce017 <= g_stcq_m.stcqdocdt
               AND stce018 >= g_stcq_m.stcqdocdt
               AND stcestus = 'Y'
            IF NOT cl_null(l_stce001) THEN    
               LET g_stcq_m.stcq001 = l_stce001
               LET g_stcq_m.stcq003 = l_stce009
               LET g_stcq_m.stcq005 = l_stce005
               LET g_stcq_m.stcq006 = l_stce006
               LET g_stcq_m.stcq007 = l_stce007
               LET g_stcq_m.stcq002 = l_stce008
               LET g_stcq_m.stcq016 = l_stce021
               LET g_stcq_m.stcq017 = l_stce022
               LET g_stcq_m.stcq010 = l_stce024          
               LET g_stcq_m.stcq018 = l_stce017
               LET g_stcq_m.stcq019 = l_stce018                
               DISPLAY BY NAME g_stcq_m.stcq001,g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq005,g_stcq_m.stcq006,
                               g_stcq_m.stcq007,g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,g_stcq_m.stcq018,
                               g_stcq_m.stcq019
                               
               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcm_m.stcm001
                  AND stcw005 = 'N'
                  AND stcwent = g_enterprise #160905-00007#3 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b   
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq003
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq003_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq004
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq004_desc

               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq006
               CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq006_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq006_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq007
               CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq007_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq007_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq016
               CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq016_desc
               
               SELECT ooef019 INTO l_ooef019
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_stcq_m.stcqsite         
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq017
               CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq017_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcq_m.stcq010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcq_m.stcq010_desc                            
            END IF
         END IF 
      END IF          
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt603_stcqdocdt_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcqdocdt_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq001) THEN 
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM stce_t
       WHERE stceent = g_enterprise
         AND stce001 = g_stcq_m.stcq001
         AND stce017 <= g_stcq_m.stcqdocdt
         AND stce018 >= g_stcq_m.stcqdocdt
         AND stcestus = 'Y'
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00055'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 谈判人员检查
# Memo...........:
# Usage..........: astt603_stcq008_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq008_chk()
DEFINE l_ooag003   LIKE ooag_t.ooag003
DEFINE l_ooagstus  LIKE ooag_t.ooagstus

   LET g_errno = ''
   SELECT ooag003,ooagstus INTO l_ooag003,l_ooagstus
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_stcq_m.stcq008
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'aim-00069'
      WHEN l_ooagstus <> 'Y'   LET g_errno = 'ais-00018'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      LET g_stcq_m.stcq009 = l_ooag003
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcq_m.stcq009
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcq_m.stcq009_desc = '', g_rtn_fields[1] , ''
   ELSE
      LET g_stcq_m.stcq009 = ''  
      LET g_stcq_m.stcq009_desc = ''
   END IF
   DISPLAY BY NAME g_stcq_m.stcq009,g_stcq_m.stcq009_desc
END FUNCTION

################################################################################
# Descriptions...: 部门检查
# Memo...........:
# Usage..........: 
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq009_chk()
DEFINE l_ooegstus  LIKE ooag_t.ooagstus
DEFINE l_n         LIKE type_t.num5

   LET g_errno = ''
   SELECT ooegstus INTO l_ooegstus
     FROM ooeg_t
    WHERE ooegent = g_enterprise
      AND ooeg001 = g_stcq_m.stcq009
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00352'
      WHEN l_ooegstus <> 'Y'   LET g_errno = 'art-00353'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      IF NOT cl_null(g_stcq_m.stcq008) THEN
         LET l_n = 0      
         SELECT COUNT(*) INTO l_n
           FROM ooag_t
          WHERE ooagent = g_enterprise
            AND ooag001 = g_stcq_m.stcq008 
            AND ooag003 = g_stcq_m.stcq009
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00058'
         END IF 
      END IF 
   END IF
END FUNCTION

################################################################################
# Descriptions...: 币别检查
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq016_chk()
DEFINE l_ooajstus   LIKE ooaj_t.ooajstus

   LET g_errno = ''
   SELECT ooajstus INTO l_ooajstus
     FROM ooaj_t,ooef_t
    WHERE ooajent = ooefent
      AND ooaj001 = ooef014
      AND ooefent = g_enterprise
      AND ooef001 = g_stcq_m.stcqsite
      AND ooaj002 = g_stcq_m.stcq016
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00237'
      WHEN l_ooajstus <> 'Y'   LET g_errno = 'art-00238'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 检查税种
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq017_chk()
DEFINE l_oodbstus   LIKE oodb_t.oodbstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodbstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise
      AND ooef019 = oodb001
      AND ooefent = oodbent
      AND oodb002 = g_stcq_m.stcq017
      AND ooef001 = g_stcq_m.stcqsite
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'amm-00419'
      WHEN l_oodbstus <> 'Y'   LET g_errno = 'amm-00420'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE

END FUNCTION

################################################################################
# Descriptions...: 销售范围检查
# Memo...........:
# Usage..........: CALL astt603_stcq012_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq012_chk()
   DEFINE l_dbbcstus   LIKE dbbc_t.dbbcstus
   DEFINE l_dbbc003    LIKE dbbc_t.dbbc003
   DEFINE l_dbbc004    LIKE dbbc_t.dbbc004
   DEFINE l_dbbc005    LIKE dbbc_t.dbbc005
   DEFINE l_dbbc002    LIKE dbbc_t.dbbc002
   
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq011) THEN 
      SELECT dbbcstus,dbbc003,dbbc004,dbbc005
        INTO l_dbbcstus,l_dbbc003,l_dbbc004,l_dbbc005
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcq_m.stcq012
         AND dbbc002 = g_stcq_m.stcq011
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00061'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00062'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE              
   ELSE
      SELECT dbbcstus,dbbc002,dbbc003,dbbc004,dbbc005
        INTO l_dbbcstus,l_dbbc002,l_dbbc003,l_dbbc004,l_dbbc005
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcq_m.stcq012
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00059'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00060'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE
   END IF 
   IF cl_null(g_errno) THEN 
      LET g_stcq_m.stcq013 = l_dbbc003
      LET g_stcq_m.stcq014 = l_dbbc004
      LET g_stcq_m.stcq015 = l_dbbc005
      IF cl_null(g_stcq_m.stcq011) THEN 
         LET g_stcq_m.stcq011 = l_dbbc002
      END IF 
      DISPLAY BY NAME g_stcq_m.stcq011,g_stcq_m.stcq013,g_stcq_m.stcq014,g_stcq_m.stcq015
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcq_m.stcq011
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcq_m.stcq011_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcq_m.stcq011_desc
            
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcq_m.stcq013
      CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcq_m.stcq013_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcq_m.stcq013_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcq_m.stcq014
      CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcq_m.stcq014_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcq_m.stcq014_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcq_m.stcq015
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcq_m.stcq015_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcq_m.stcq015_desc
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 销售组织检查
# Memo...........:
# Usage..........: astt603_stcq011_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq011_chk()
   DEFINE l_dbbcstus   LIKE dbbc_t.dbbcstus
   
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq012) THEN 
      SELECT dbbcstus
        INTO l_dbbcstus
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcq_m.stcq012
         AND dbbc002 = g_stcq_m.stcq011
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00061'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00062'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE         
   END IF 

END FUNCTION

################################################################################
# Descriptions...: 开始结束日期检查
# Memo...........:
# Usage..........: astt603_stcq018_stcq019_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq018_stcq019_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq018) AND NOT cl_null(g_stcq_m.stcq019) THEN 
      IF g_stcq_m.stcq018 > g_stcq_m.stcq019 THEN 
         LET g_errno = 'ast-00063'
         RETURN 
      END IF 
      IF NOT cl_null(g_stcq_m.stcq001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcq_m.stcq001
            AND stce017 <= g_stcq_m.stcq018
            AND stce018 >= g_stcq_m.stcq019
            AND stceent = g_enterprise #160905-00007#3 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF 
      LET l_n = 0
      #检查单身日期是否在单头日期范围外
      SELECT COUNT(*) INTO l_n
        FROM stcr_t
       WHERE stcrent = g_enterprise
         AND stcrdocno = g_stcq_m.stcqdocno
         AND (stcr007 < g_stcq_m.stcq018  
          OR stcr008 > g_stcq_m.stcq019)
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00079'
      END IF 
   END IF   
   IF NOT cl_null(g_stcq_m.stcq018) AND cl_null(g_stcq_m.stcq019) THEN  
      IF NOT cl_null(g_stcq_m.stcq001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcq_m.stcq001
            AND stce017 <= g_stcq_m.stcq018
            AND stce018 >= g_stcq_m.stcq018
            AND stceent = g_enterprise #160905-00007#3 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF    
      LET l_n = 0
      #检查单身日期是否都在单头日期范围内
      SELECT COUNT(*) INTO l_n
        FROM stcr_t
       WHERE stcrent = g_enterprise
         AND stcrdocno = g_stcq_m.stcqdocno
         AND (stcr007 < g_stcq_m.stcq018
          OR stcr008 < g_stcq_m.stcq018)
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00079'
      END IF 
   END IF
   IF NOT cl_null(g_stcq_m.stcq019) AND cl_null(g_stcq_m.stcq018) THEN  
      IF NOT cl_null(g_stcq_m.stcq001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcq_m.stcq001
            AND stce017 <= g_stcq_m.stcq019
            AND stce018 >= g_stcq_m.stcq019
            AND stceent = g_enterprise #160905-00007#3 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF     
      LET l_n = 0
      #检查单身日期是否都在单头日期范围内
      SELECT COUNT(*) INTO l_n
        FROM stcr_t
       WHERE stcrent = g_enterprise
         AND stcrdocno = g_stcq_m.stcqdocno
         AND (stcr007 > g_stcq_m.stcq019
          OR stcr008 > g_stcq_m.stcq019)
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00079'
      END IF 
   END IF   
END FUNCTION

################################################################################
# Descriptions...: 费用编号检查
# Memo...........:
# Usage..........: astt603_stcr001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcr001_chk()
   DEFINE l_staestus LIKE stae_t.staestus
   DEFINE l_stae002  LIKE stae_t.stae002
   DEFINE l_stae006  LIKE stae_t.stae006
   
   LET g_errno = ''
   SELECT staestus,stae002,stae006
     INTO l_staestus,l_stae002,l_stae006
     FROM stae_t
    WHERE stae001 = g_stcr_d[l_ac].stcr001 
      AND staeent = g_enterprise
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00001'
      WHEN l_staestus <> 'Y'   LET g_errno = 'ast-00002'
      WHEN l_stae002 <> '2'     LET g_errno = 'ast-00100'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE     
   
END FUNCTION

################################################################################
# Descriptions...: 产品检查
# Memo...........:
# Usage..........: astt603_stcs005_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcs005_chk()
   DEFINE l_imaastus   LIKE imaa_t.imaastus
   DEFINE l_n          LIKE type_t.num5
   DEFINE l_sql        STRING 
   
   LET g_errno = ''
   SELECT imaastus INTO l_imaastus
     FROM imaa_t
    WHERE imaa001 = g_stcr2_d[l_ac].stcs005
      AND imaaent = g_enterprise
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00016'
      WHEN l_imaastus <> 'Y'   LET g_errno = 'art-00126'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE  
   IF cl_null(g_errno) THEN 
      LET l_n = 0
      #判断产品是否在合约销售范围内
      LET l_sql = " SELECT COUNT(*) ",
                  "   FROM imaa_t ",
                  "  WHERE imaaent = '",g_enterprise,"'",
                  "    AND imaa001 = '",g_stcr2_d[l_ac].stcs005,"'",
                  "    AND imaa009 IN (SELECT DISTINCT rtax001 ",
                  "                      FROM rtax_t ",
                  "                     WHERE rtax005 = 0 ",
                  "                       AND rtaxent = ",g_enterprise, #160905-00007#3 add
#                  "                     START WITH rtax003 IN(SELECT stch002 FROM stch_t WHERE stch001 = '",g_stcq_m.stcq001,"') ",#160905-00007#3 marked
                  "                     START WITH rtax003 IN(SELECT stch002 FROM stch_t WHERE stchent = ",g_enterprise," AND stch001 = '",g_stcq_m.stcq001,"') ",#160905-00007#3 mod
                  "                    CONNECT BY nocycle PRIOR rtax001 = rtax003",
                  "                    UNION",
                  "                    SELECT rtax001",
                  "                      FROM rtax_t,stch_t",
                  "                     WHERE rtax001 = stch002",
                  "                       AND rtax005 = 0 ",
                  "                       AND rtaxent = ",g_enterprise, #160905-00007#3 add
                  "                       AND stch001 = '",g_stcq_m.stcq001,"')"
      PREPARE sel_cn FROM l_sql
      EXECUTE sel_cn INTO l_n
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00088'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 起始/截止日期检查
# Memo...........:
# Usage..........: astt603_stcr007_stcr008_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/22 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcr007_stcr008_chk()

   LET g_errno = ''
   IF NOT cl_null(g_stcr_d[l_ac].stcr007) AND NOT cl_null(g_stcr_d[l_ac].stcr008) THEN 
      IF g_stcr_d[l_ac].stcr007 < g_stcq_m.stcq018 
      OR g_stcr_d[l_ac].stcr007 > g_stcq_m.stcq019 
      OR g_stcr_d[l_ac].stcr008 > g_stcq_m.stcq019  THEN
         LET g_errno = 'ast-00079'
      END IF 
   END IF 
   IF NOT cl_null(g_stcr_d[l_ac].stcr007) AND cl_null(g_stcr_d[l_ac].stcr008) THEN 
      IF g_stcr_d[l_ac].stcr007 < g_stcq_m.stcq018 
      OR g_stcr_d[l_ac].stcr007 > g_stcq_m.stcq019  THEN
         LET g_errno = 'ast-00080'
      END IF
   END IF 
   IF cl_null(g_stcr_d[l_ac].stcr007) AND NOT cl_null(g_stcr_d[l_ac].stcr008) THEN 
      IF g_stcr_d[l_ac].stcr008 < g_stcq_m.stcq018 
      OR g_stcr_d[l_ac].stcr008 > g_stcq_m.stcq019  THEN
         LET g_errno = 'ast-00081'
      END IF
   END IF    
END FUNCTION

################################################################################
# Descriptions...: 下次计算日设置
# Memo...........:
# Usage..........: astt603_stcr010_set()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/22 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcr010_set()
   DEFINE l_date   LIKE type_t.dat
   
   IF cl_null(g_stcr_d[l_ac].stcr007) 
   OR cl_null(g_stcr_d[l_ac].stcr005) 
   OR cl_null(g_stcr_d[l_ac].stcr006) 
   OR cl_null(g_stcr_d[l_ac].stcr008) THEN
      RETURN 
   END IF 
   CALL s_astm601_cal_nextd(g_stcr_d[l_ac].stcr005,g_stcr_d[l_ac].stcr006,g_stcr_d[l_ac].stcr007,g_stcr_d[l_ac].stcr008,'','')
        RETURNING g_stcr_d[l_ac].stcr010,g_stcr_d[l_ac].stcr023,g_stcr_d[l_ac].stcr024
   
   #LET l_date = ''
   #CASE g_stcr_d[l_ac].stcr005
   #     #当费用周期=1.年
   #     WHEN '1' 
   #              #下次费用起止日                 
   #              LET g_stcr_d[l_ac].stcr023 = g_stcr_d[l_ac].stcr007
   #              SELECT add_months(g_stcr_d[l_ac].stcr023,12) INTO l_date FROM dual      
   #              #对应的月底
   #              SELECT last_day(l_date) INTO l_date FROM dual
   #              #下次费用截止日
   #              LET g_stcr_d[l_ac].stcr024 = l_date     
   #              #周期方式=1.期初       则   下次计算日=起始日期
   #              IF g_stcr_d[l_ac].stcr006 = '1' THEN 
   #                 LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr007
   #              END IF 
   #              #周期方式=2.期末       则   下次计算日=第二年的(起始日期) 对应的月底
   #              IF g_stcr_d[l_ac].stcr006 = '2' THEN 
   #                 #计算日大于失效日期就给失效日期
   #                 IF l_date > g_stcr_d[l_ac].stcr008 THEN 
   #                    LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr008
   #                 ELSE
   #                    LET g_stcr_d[l_ac].stcr010 = l_date
   #                 END IF 
   #              END IF 
   #              
   #     #=2.季 
   #     WHEN '2'         
   #              #下次费用起止日                 
   #              LET g_stcr_d[l_ac].stcr023 = g_stcr_d[l_ac].stcr007
   #              SELECT add_months(g_stcr_d[l_ac].stcr023,3) INTO l_date FROM dual
   #              #对应的月底
   #              SELECT last_day(l_date) INTO l_date FROM dual                    
   #              LET g_stcr_d[l_ac].stcr024 = l_date
   #              #周期方式=1.期初       则   下次计算日=起始日期   
   #              IF g_stcr_d[l_ac].stcr006 = '1' THEN 
   #                 LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr007
   #              END IF 
   #              #周期方式=2.期末       则   下次计算日=起始日期+3个月 对应的 月底
   #              IF g_stcr_d[l_ac].stcr006 = '2' THEN 
   #                 #计算日大于失效日期就给失效日期
   #                 IF l_date > g_stcr_d[l_ac].stcr008 THEN 
   #                    LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr008
   #                 ELSE
   #                    LET g_stcr_d[l_ac].stcr010 = l_date
   #                 END IF 
   #              END IF                  
   #     #=3.月     
   #     WHEN '3'
   #              #下次费用起止日                 
   #              LET g_stcr_d[l_ac].stcr023 = g_stcr_d[l_ac].stcr007
   #              SELECT last_day(g_stcr_d[l_ac].stcr023) INTO l_date FROM dual                 
   #              LET g_stcr_d[l_ac].stcr024 = l_date
   #              #周期方式=1.期初       则   下次计算日=起始日期
   #              IF g_stcr_d[l_ac].stcr006 = '1' THEN 
   #                 LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr007
   #              END IF 
   #              #周期方式=2.期末       则   下次计算日=起始日期对应的 月底
   #              IF g_stcr_d[l_ac].stcr006 = '2' THEN 
   #                 #计算日大于失效日期就给失效日期
   #                 IF l_date > g_stcr_d[l_ac].stcr008 THEN 
   #                    LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr008
   #                 ELSE
   #                    LET g_stcr_d[l_ac].stcr010 = l_date
   #                 END IF 
   #              END IF                 
   #     #=4.单次    
   #     WHEN '4' 
   #              #周期方式=1.期初       则   下次计算日=起始日期
   #              IF g_stcr_d[l_ac].stcr006 = '1' THEN 
   #                 LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr007
   #              END IF 
   #              #周期方式=2.期末       则   下次计算日=起始日期
   #              IF g_stcr_d[l_ac].stcr006 = '2' THEN 
   #                 LET g_stcr_d[l_ac].stcr010 = g_stcr_d[l_ac].stcr007
   #              END IF
   #              #下次费用起止日                 
   #              LET g_stcr_d[l_ac].stcr023 = g_stcr_d[l_ac].stcr007
   #              LET g_stcr_d[l_ac].stcr024 = g_stcr_d[l_ac].stcr008          
   #END CASE 
   
   #160824-00007#196 161120 by lori add---(S)
   LET g_stcr_d_o.stcr010 = g_stcr_d[l_ac].stcr010
   LET g_stcr_d_o.stcr023 = g_stcr_d[l_ac].stcr023
   LET g_stcr_d_o.stcr024 = g_stcr_d[l_ac].stcr024
   #160824-00007#196 161120 by lori add---(E)
END FUNCTION

################################################################################
# Descriptions...: 经销商为空检查
# Memo...........:
# Usage..........: CALL astt603_stcq003_null_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq003_null_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq001) THEN
      LET l_n = 0
      #检查经销商是否存在合同中      
      SELECT COUNT(*) INTO l_n
        FROM stce_t         
       WHERE stceent = g_enterprise
         AND stce001 = g_stcq_m.stcq001
         AND stce009 IS NULL
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00089'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 网点编号为空检查
# Memo...........:
# Usage..........: CALL astt603_stcq004_null_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcq004_null_chk()
   DEFINE l_n   LIKE type_t.num5
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
      
   LET g_errno = ''
   IF NOT cl_null(g_stcq_m.stcq001) THEN
      LET l_n = 0
      #检查经销商是否存在合同中      
      SELECT COUNT(*) INTO l_n
        FROM stce_t         
       WHERE stceent = g_enterprise
         AND stce001 = g_stcq_m.stcq001
         AND stce009 = g_stcq_m.stcq003
         AND stce010 IS NULL
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00090'
      END IF
   ELSE
      IF NOT cl_null(g_stcq_m.stcq003) THEN 
          #带出符合条件的合约编号及其他栏位
          SELECT stce001,stce009,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
            INTO l_stce001,l_stce009,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
            FROM stce_t
           WHERE stceent = g_enterprise
             AND stce010 IS NULL
             AND stce009 = g_stcq_m.stcq003
             AND stce017 <= g_stcq_m.stcqdocdt
             AND stce018 >= g_stcq_m.stcqdocdt
             AND stcestus = 'Y'
          IF NOT cl_null(l_stce001) THEN    
             LET g_stcq_m.stcq001 = l_stce001
             LET g_stcq_m.stcq003 = l_stce009
             LET g_stcq_m.stcq005 = l_stce005
             LET g_stcq_m.stcq006 = l_stce006
             LET g_stcq_m.stcq007 = l_stce007
             LET g_stcq_m.stcq002 = l_stce008
             LET g_stcq_m.stcq018 = l_stce017
             LET g_stcq_m.stcq019 = l_stce018
             LET g_stcq_m.stcq016 = l_stce021
             LET g_stcq_m.stcq017 = l_stce022
             LET g_stcq_m.stcq010 = l_stce024
             DISPLAY BY NAME g_stcq_m.stcq003,g_stcq_m.stcq004,g_stcq_m.stcq005,g_stcq_m.stcq006,
                             g_stcq_m.stcq007,g_stcq_m.stcq016,g_stcq_m.stcq017,g_stcq_m.stcq010,
                             g_stcq_m.stcq018,g_stcq_m.stcq019
                             
             LET l_stcw004 = ''
             SELECT stcw004 INTO l_stcw004
               FROM stcw_t
              WHERE stcw001 = g_stcq_m.stcq001
                AND stcw005 = 'N'
                AND stcwent = g_enterprise   #160905-00007#3 add
              ORDER BY stcwseq       
             DISPLAY l_stcw004 TO next_b   
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq003
             CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq003_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq003_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq004
             CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq004_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq004_desc

             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq006
             CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq006_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq006_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq007
             CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq007_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq007_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq016
             CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq016_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq016_desc
             
             SELECT ooef019 INTO l_ooef019
               FROM ooef_t
              WHERE ooefent = g_enterprise
                AND ooef001 = g_stcq_m.stcqsite                
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq017
             CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq017_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq017_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcq_m.stcq010
             CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcq_m.stcq010_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcq_m.stcq010_desc
          END IF
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 同一费用编号在日期区间内唯一检查
# Memo...........:
# Usage..........: astt603_stcr001_stcr007_stcr008(p_cmd)
# Input parameter: p_cmd   状态类型
# Return code....: 无
# Date & Author..: 2014/06/22 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt603_stcr001_stcr007_stcr008(p_cmd)
   DEFINE l_n   LIKE type_t.num5
   DEFINE p_cmd LIKE type_t.chr1

   LET g_errno = ''
   IF cl_null(g_stcr_d[l_ac].stcr001) OR cl_null(g_stcr_d[l_ac].stcr007) OR cl_null(g_stcr_d[l_ac].stcr008) THEN 
      RETURN 
   END IF
   LET l_n = 0
   IF p_cmd = 'u' THEN 
      SELECT COUNT(*) INTO l_n
        FROM stcr_t
       WHERE stcrent = g_enterprise
         AND stcrdocno = g_stcq_m.stcqdocno
         AND stcr001 = g_stcr_d[l_ac].stcr001
         AND stcrseq <> g_stcr_d_t.stcrseq
         AND (stcr007 BETWEEN g_stcr_d[l_ac].stcr007 AND g_stcr_d[l_ac].stcr008
          OR stcr008 BETWEEN g_stcr_d[l_ac].stcr007 AND g_stcr_d[l_ac].stcr008
          OR g_stcr_d[l_ac].stcr008 BETWEEN stcr007 AND stcr008)
    ELSE
      SELECT COUNT(*) INTO l_n
        FROM stcr_t
       WHERE stcrent = g_enterprise
         AND stcrdocno = g_stcq_m.stcqdocno
         AND stcr001 = g_stcr_d[l_ac].stcr001
         AND (stcr007 BETWEEN g_stcr_d[l_ac].stcr007 AND g_stcr_d[l_ac].stcr008
          OR stcr008 BETWEEN g_stcr_d[l_ac].stcr007 AND g_stcr_d[l_ac].stcr008
          OR g_stcr_d[l_ac].stcr008 BETWEEN stcr007 AND stcr008)
    END IF 
    IF l_n > 0 THEN 
       LET g_errno = 'ast-00082'
    END IF
END FUNCTION

 
{</section>}
 
