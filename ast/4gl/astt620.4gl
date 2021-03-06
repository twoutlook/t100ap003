#該程式未解開Section, 採用最新樣板產出!
{<section id="astt620.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0012(2015-03-15 20:52:20), PR版次:0012(2016-11-22 12:26:22)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000077
#+ Filename...: astt620
#+ Description: 經銷商費用單維護作業
#+ Creator....: 03247(2014-11-20 15:53:58)
#+ Modifier...: 06189 -SD/PR- 02749
 
{</section>}
 
{<section id="astt620.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#35   2016/04/15   BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160408-00010#2    2016/04/22   by 08172    scc调整
#160816-00068#16   2016/08/19   By 08209    調整transaction
#160818-00017#40   2016/08/24   By 08734    删除修改未重新判断状态码
#160913-00026#1    2016/09/13   by 08172    单头销售范围不能修改，直接从合同带出
#161024-00025#3    2016/10/26   By dongsz   site栏位默认赋值
#161024-00025#5    2016/10/27   by 08172    组织调整
#161111-00028#3    2016/11/16   by 02481    标准程式定义采用宣告模式,弃用.*写法
#160824-00007#200  2016/11/22   by lori     修正舊值備份寫法
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
PRIVATE type type_g_stci_m        RECORD
       stciunit LIKE stci_t.stciunit, 
   stciunit_desc LIKE type_t.chr80, 
   stcidocdt LIKE stci_t.stcidocdt, 
   stcidocno LIKE stci_t.stcidocno, 
   stci000 LIKE stci_t.stci000, 
   stci002 LIKE stci_t.stci002, 
   stci002_desc LIKE type_t.chr80, 
   stci003 LIKE stci_t.stci003, 
   stci003_desc LIKE type_t.chr80, 
   stci004 LIKE stci_t.stci004, 
   stci005 LIKE stci_t.stci005, 
   stci005_desc LIKE type_t.chr80, 
   stci006 LIKE stci_t.stci006, 
   stci006_desc LIKE type_t.chr80, 
   stcistus LIKE stci_t.stcistus, 
   stci007 LIKE stci_t.stci007, 
   stci007_desc LIKE type_t.chr80, 
   stci009 LIKE stci_t.stci009, 
   stci009_desc LIKE type_t.chr80, 
   stci010 LIKE stci_t.stci010, 
   stci011 LIKE stci_t.stci011, 
   stci012 LIKE stci_t.stci012, 
   stci012_desc LIKE type_t.chr80, 
   stci014 LIKE stci_t.stci014, 
   stci014_desc LIKE type_t.chr80, 
   stci013 LIKE stci_t.stci013, 
   stci013_desc LIKE type_t.chr80, 
   stci015 LIKE stci_t.stci015, 
   stci015_desc LIKE type_t.chr80, 
   stci016 LIKE stci_t.stci016, 
   stci016_desc LIKE type_t.chr80, 
   stci017 LIKE stci_t.stci017, 
   stci017_desc LIKE type_t.chr80, 
   stci001 LIKE stci_t.stci001, 
   stci008 LIKE stci_t.stci008, 
   stcisite LIKE stci_t.stcisite, 
   stci018 LIKE stci_t.stci018, 
   stci018_desc LIKE type_t.chr80, 
   stci019 LIKE stci_t.stci019, 
   stci019_desc LIKE type_t.chr80, 
   stci020 LIKE stci_t.stci020, 
   stci021 LIKE stci_t.stci021, 
   stci022 LIKE stci_t.stci022, 
   stci023 LIKE stci_t.stci023, 
   stci024 LIKE stci_t.stci024, 
   stci025 LIKE stci_t.stci025, 
   stciownid LIKE stci_t.stciownid, 
   stciownid_desc LIKE type_t.chr80, 
   stciowndp LIKE stci_t.stciowndp, 
   stciowndp_desc LIKE type_t.chr80, 
   stcicrtid LIKE stci_t.stcicrtid, 
   stcicrtid_desc LIKE type_t.chr80, 
   stcicrtdp LIKE stci_t.stcicrtdp, 
   stcicrtdp_desc LIKE type_t.chr80, 
   stcicrtdt LIKE stci_t.stcicrtdt, 
   stcimodid LIKE stci_t.stcimodid, 
   stcimodid_desc LIKE type_t.chr80, 
   stcimoddt LIKE stci_t.stcimoddt, 
   stcicnfid LIKE stci_t.stcicnfid, 
   stcicnfid_desc LIKE type_t.chr80, 
   stcicnfdt LIKE stci_t.stcicnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stcj_d        RECORD
       stcjseq LIKE stcj_t.stcjseq, 
   stcj001 LIKE stcj_t.stcj001, 
   stcj002 LIKE stcj_t.stcj002, 
   stcj003 LIKE stcj_t.stcj003, 
   stcj004 LIKE stcj_t.stcj004, 
   stcj004_desc LIKE type_t.chr500, 
   stae003 LIKE type_t.chr10, 
   stae003_desc LIKE type_t.chr500, 
   stae004 LIKE type_t.chr10, 
   stcj005 LIKE stcj_t.stcj005, 
   stcj005_desc LIKE type_t.chr500, 
   stcj006 LIKE stcj_t.stcj006, 
   stcj006_desc LIKE type_t.chr500, 
   stcj007 LIKE stcj_t.stcj007, 
   stcj008 LIKE stcj_t.stcj008, 
   stcj009 LIKE stcj_t.stcj009, 
   stcj010 LIKE stcj_t.stcj010, 
   stcj011 LIKE stcj_t.stcj011, 
   stcj012 LIKE stcj_t.stcj012, 
   stcj013 LIKE stcj_t.stcj013, 
   stcj015 LIKE stcj_t.stcj015, 
   stcj014 LIKE stcj_t.stcj014, 
   stcjsite LIKE stcj_t.stcjsite, 
   stcjsite_desc LIKE type_t.chr500, 
   stcj028 LIKE stcj_t.stcj028, 
   stcj027 LIKE stcj_t.stcj027, 
   stcj016 LIKE stcj_t.stcj016, 
   stcj017 LIKE stcj_t.stcj017, 
   stcj018 LIKE stcj_t.stcj018, 
   stcj019 LIKE stcj_t.stcj019, 
   stcj020 LIKE stcj_t.stcj020, 
   stcj021 LIKE stcj_t.stcj021, 
   stcj022 LIKE stcj_t.stcj022, 
   stcj023 LIKE stcj_t.stcj023, 
   stcj024 LIKE stcj_t.stcj024, 
   stcj025 LIKE stcj_t.stcj025, 
   stcj026 LIKE stcj_t.stcj026, 
   stcjunit LIKE stcj_t.stcjunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stcidocno LIKE stci_t.stcidocno,
      b_stciunit LIKE stci_t.stciunit,
   b_stciunit_desc LIKE type_t.chr80,
      b_stcidocdt LIKE stci_t.stcidocdt,
      b_stci002 LIKE stci_t.stci002,
   b_stci002_desc LIKE type_t.chr80,
      b_stci003 LIKE stci_t.stci003,
   b_stci003_desc LIKE type_t.chr80,
      b_stci007 LIKE stci_t.stci007,
   b_stci007_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag      LIKE type_t.num5   #161024-00025#5 by 08172
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stci_m          type_g_stci_m
DEFINE g_stci_m_t        type_g_stci_m
DEFINE g_stci_m_o        type_g_stci_m
DEFINE g_stci_m_mask_o   type_g_stci_m #轉換遮罩前資料
DEFINE g_stci_m_mask_n   type_g_stci_m #轉換遮罩後資料
 
   DEFINE g_stcidocno_t LIKE stci_t.stcidocno
 
 
DEFINE g_stcj_d          DYNAMIC ARRAY OF type_g_stcj_d
DEFINE g_stcj_d_t        type_g_stcj_d
DEFINE g_stcj_d_o        type_g_stcj_d
DEFINE g_stcj_d_mask_o   DYNAMIC ARRAY OF type_g_stcj_d #轉換遮罩前資料
DEFINE g_stcj_d_mask_n   DYNAMIC ARRAY OF type_g_stcj_d #轉換遮罩後資料
 
 
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

#end add-point
 
{</section>}
 
{<section id="astt620.main" >}
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
   LET g_forupd_sql = " SELECT stciunit,'',stcidocdt,stcidocno,stci000,stci002,'',stci003,'',stci004, 
       stci005,'',stci006,'',stcistus,stci007,'',stci009,'',stci010,stci011,stci012,'',stci014,'',stci013, 
       '',stci015,'',stci016,'',stci017,'',stci001,stci008,stcisite,stci018,'',stci019,'',stci020,stci021, 
       stci022,stci023,stci024,stci025,stciownid,'',stciowndp,'',stcicrtid,'',stcicrtdp,'',stcicrtdt, 
       stcimodid,'',stcimoddt,stcicnfid,'',stcicnfdt", 
                      " FROM stci_t",
                      " WHERE stcient= ? AND stcidocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt620_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stciunit,t0.stcidocdt,t0.stcidocno,t0.stci000,t0.stci002,t0.stci003, 
       t0.stci004,t0.stci005,t0.stci006,t0.stcistus,t0.stci007,t0.stci009,t0.stci010,t0.stci011,t0.stci012, 
       t0.stci014,t0.stci013,t0.stci015,t0.stci016,t0.stci017,t0.stci001,t0.stci008,t0.stcisite,t0.stci018, 
       t0.stci019,t0.stci020,t0.stci021,t0.stci022,t0.stci023,t0.stci024,t0.stci025,t0.stciownid,t0.stciowndp, 
       t0.stcicrtid,t0.stcicrtdp,t0.stcicrtdt,t0.stcimodid,t0.stcimoddt,t0.stcicnfid,t0.stcicnfdt,t1.ooefl003 , 
       t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.prcfl003 ,t9.dbbcl003 , 
       t10.ooefl003 ,t11.oojdl003 ,t12.dbbal003 ,t13.ooefl003 ,t14.ooail003 ,t15.ooag011 ,t16.ooefl003 , 
       t17.ooag011 ,t18.ooefl003 ,t19.ooag011 ,t20.ooag011",
               " FROM stci_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stciunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stci002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stci003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stci005 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stci006 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stci007  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stci009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcfl_t t8 ON t8.prcflent="||g_enterprise||" AND t8.prcfl001=t0.stci012 AND t8.prcfl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t9 ON t9.dbbclent="||g_enterprise||" AND t9.dbbcl001=t0.stci014 AND t9.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stci013 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t11 ON t11.oojdlent="||g_enterprise||" AND t11.oojdl001=t0.stci015 AND t11.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t12 ON t12.dbbalent="||g_enterprise||" AND t12.dbbal001=t0.stci016 AND t12.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stci017 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t14 ON t14.ooailent="||g_enterprise||" AND t14.ooail001=t0.stci018 AND t14.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stciownid  ",
               " LEFT JOIN ooefl_t t16 ON t16.ooeflent="||g_enterprise||" AND t16.ooefl001=t0.stciowndp AND t16.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.stcicrtid  ",
               " LEFT JOIN ooefl_t t18 ON t18.ooeflent="||g_enterprise||" AND t18.ooefl001=t0.stcicrtdp AND t18.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t19 ON t19.ooagent="||g_enterprise||" AND t19.ooag001=t0.stcimodid  ",
               " LEFT JOIN ooag_t t20 ON t20.ooagent="||g_enterprise||" AND t20.ooag001=t0.stcicnfid  ",
 
               " WHERE t0.stcient = " ||g_enterprise|| " AND t0.stcidocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt620_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt620 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt620_init()   
 
      #進入選單 Menu (="N")
      CALL astt620_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt620
      
   END IF 
   
   CLOSE astt620_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt620.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt620_init()
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
      CALL cl_set_combo_scc_part('stcistus','13','N,Y,A,D,R,W,X')
 
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stci004','6013','11,12,13')  #160408-00010#2
   CALL cl_set_combo_scc('stci010','6702')
   CALL cl_set_combo_scc('stci021','6727')
   CALL cl_set_combo_scc('stci022','6728')
   CALL cl_set_combo_scc('stcj001','6702')
   CALL cl_set_combo_scc('stae004','6004')
   CALL cl_set_combo_scc_part('stcj007','6006','1,2') 
   CALL cl_set_combo_scc('stcj015','6724')
   CALL cl_set_combo_scc('stcj014','6724')
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt620_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt620.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt620_ui_dialog()
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
            CALL astt620_insert()
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
         INITIALIZE g_stci_m.* TO NULL
         CALL g_stcj_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt620_init()
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
               
               CALL astt620_fetch('') # reload data
               LET l_ac = 1
               CALL astt620_ui_detailshow() #Setting the current row 
         
               CALL astt620_idx_chk()
               #NEXT FIELD stcjseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stcj_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt620_idx_chk()
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
               CALL astt620_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt620_browser_fill("")
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
               CALL astt620_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt620_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt620_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt620_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt620_set_act_visible()   
            CALL astt620_set_act_no_visible()
            IF NOT (g_stci_m.stcidocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stcient = " ||g_enterprise|| " AND",
                                  " stcidocno = '", g_stci_m.stcidocno, "' "
 
               #填到對應位置
               CALL astt620_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stci_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcj_t" 
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
               CALL astt620_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stci_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcj_t" 
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
                  CALL astt620_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt620_fetch("F")
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
               CALL astt620_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt620_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt620_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt620_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt620_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt620_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt620_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt620_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt620_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt620_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt620_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stcj_d)
                  LET g_export_id[1]   = "s_detail1"
 
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
               NEXT FIELD stcjseq
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
               CALL astt620_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt620_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt620_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt620_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt620_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt620_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt620_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt620_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt620_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt620_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stci_m.stcidocdt)
 
 
 
         
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
 
{<section id="astt620.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt620_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING    #161024-00025#5 by 08172
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   #161024-00025#5 -s by 08172
   CALL s_aooi500_sql_where(g_prog,'stciunit') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   #161024-00025#5 -e by 08172
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
      LET l_sub_sql = " SELECT DISTINCT stcidocno ",
                      " FROM stci_t ",
                      " ",
                      " LEFT JOIN stcj_t ON stcjent = stcient AND stcidocno = stcjdocno ", "  ",
                      #add-point:browser_fill段sql(stcj_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stcient = " ||g_enterprise|| " AND stcjent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stci_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stcidocno ",
                      " FROM stci_t ", 
                      "  ",
                      "  ",
                      " WHERE stcient = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stci_t")
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
      INITIALIZE g_stci_m.* TO NULL
      CALL g_stcj_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stcidocno,t0.stciunit,t0.stcidocdt,t0.stci002,t0.stci003,t0.stci007 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcistus,t0.stcidocno,t0.stciunit,t0.stcidocdt,t0.stci002,t0.stci003, 
          t0.stci007,t1.ooefl003 ,t2.pmaal004 ,t3.pmaal004 ,t4.ooag011 ",
                  " FROM stci_t t0",
                  "  ",
                  "  LEFT JOIN stcj_t ON stcjent = stcient AND stcidocno = stcjdocno ", "  ", 
                  #add-point:browser_fill段sql(stcj_t1) name="browser_fill.join.stcj_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stciunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stci002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stci003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stci007  ",
 
                  " WHERE t0.stcient = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stci_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcistus,t0.stcidocno,t0.stciunit,t0.stcidocdt,t0.stci002,t0.stci003, 
          t0.stci007,t1.ooefl003 ,t2.pmaal004 ,t3.pmaal004 ,t4.ooag011 ",
                  " FROM stci_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stciunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stci002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stci003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stci007  ",
 
                  " WHERE t0.stcient = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stci_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stcidocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stci_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stcidocno,g_browser[g_cnt].b_stciunit, 
          g_browser[g_cnt].b_stcidocdt,g_browser[g_cnt].b_stci002,g_browser[g_cnt].b_stci003,g_browser[g_cnt].b_stci007, 
          g_browser[g_cnt].b_stciunit_desc,g_browser[g_cnt].b_stci002_desc,g_browser[g_cnt].b_stci003_desc, 
          g_browser[g_cnt].b_stci007_desc
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
         CALL astt620_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stcidocno) THEN
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
 
{<section id="astt620.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt620_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stci_m.stcidocno = g_browser[g_current_idx].b_stcidocno   
 
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
   CALL astt620_stci_t_mask()
   CALL astt620_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt620.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt620_ui_detailshow()
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
 
{<section id="astt620.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt620_ui_browser_refresh()
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
      IF g_browser[l_i].b_stcidocno = g_stci_m.stcidocno 
 
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
 
{<section id="astt620.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt620_construct()
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
   INITIALIZE g_stci_m.* TO NULL
   CALL g_stcj_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stciunit,stcidocdt,stcidocno,stci000,stci002,stci003,stci004,stci005, 
          stci006,stcistus,stci007,stci009,stci010,stci011,stci012,stci014,stci013,stci015,stci016,stci017, 
          stci001,stci008,stcisite,stci018,stci019,stci020,stci021,stci022,stci023,stci024,stci025,stciownid, 
          stciowndp,stcicrtid,stcicrtdp,stcicrtdt,stcimodid,stcimoddt,stcicnfid,stcicnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stcicrtdt>>----
         AFTER FIELD stcicrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stcimoddt>>----
         AFTER FIELD stcimoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcicnfdt>>----
         AFTER FIELD stcicnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcipstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stciunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stciunit
            #add-point:ON ACTION controlp INFIELD stciunit name="construct.c.stciunit"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stciunit',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stciunit  #顯示到畫面上
            NEXT FIELD stciunit                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stciunit
            #add-point:BEFORE FIELD stciunit name="construct.b.stciunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stciunit
            
            #add-point:AFTER FIELD stciunit name="construct.a.stciunit"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcidocdt
            #add-point:BEFORE FIELD stcidocdt name="construct.b.stcidocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcidocdt
            
            #add-point:AFTER FIELD stcidocdt name="construct.a.stcidocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcidocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcidocdt
            #add-point:ON ACTION controlp INFIELD stcidocdt name="construct.c.stcidocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcidocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcidocno
            #add-point:ON ACTION controlp INFIELD stcidocno name="construct.c.stcidocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stcidocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcidocno  #顯示到畫面上
            NEXT FIELD stcidocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcidocno
            #add-point:BEFORE FIELD stcidocno name="construct.b.stcidocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcidocno
            
            #add-point:AFTER FIELD stcidocno name="construct.a.stcidocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci000
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci000
            #add-point:ON ACTION controlp INFIELD stci000 name="construct.c.stci000"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci000  #顯示到畫面上
            NEXT FIELD stci000                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci000
            #add-point:BEFORE FIELD stci000 name="construct.b.stci000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci000
            
            #add-point:AFTER FIELD stci000 name="construct.a.stci000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci002
            #add-point:ON ACTION controlp INFIELD stci002 name="construct.c.stci002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci002  #顯示到畫面上
            NEXT FIELD stci002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci002
            #add-point:BEFORE FIELD stci002 name="construct.b.stci002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci002
            
            #add-point:AFTER FIELD stci002 name="construct.a.stci002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci003
            #add-point:ON ACTION controlp INFIELD stci003 name="construct.c.stci003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci003  #顯示到畫面上
            NEXT FIELD stci003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci003
            #add-point:BEFORE FIELD stci003 name="construct.b.stci003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci003
            
            #add-point:AFTER FIELD stci003 name="construct.a.stci003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci004
            #add-point:BEFORE FIELD stci004 name="construct.b.stci004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci004
            
            #add-point:AFTER FIELD stci004 name="construct.a.stci004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci004
            #add-point:ON ACTION controlp INFIELD stci004 name="construct.c.stci004"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stci005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci005
            #add-point:ON ACTION controlp INFIELD stci005 name="construct.c.stci005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci005  #顯示到畫面上
            NEXT FIELD stci005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci005
            #add-point:BEFORE FIELD stci005 name="construct.b.stci005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci005
            
            #add-point:AFTER FIELD stci005 name="construct.a.stci005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci006
            #add-point:ON ACTION controlp INFIELD stci006 name="construct.c.stci006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci006  #顯示到畫面上
            NEXT FIELD stci006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci006
            #add-point:BEFORE FIELD stci006 name="construct.b.stci006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci006
            
            #add-point:AFTER FIELD stci006 name="construct.a.stci006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcistus
            #add-point:BEFORE FIELD stcistus name="construct.b.stcistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcistus
            
            #add-point:AFTER FIELD stcistus name="construct.a.stcistus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcistus
            #add-point:ON ACTION controlp INFIELD stcistus name="construct.c.stcistus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stci007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci007
            #add-point:ON ACTION controlp INFIELD stci007 name="construct.c.stci007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci007  #顯示到畫面上
            NEXT FIELD stci007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci007
            #add-point:BEFORE FIELD stci007 name="construct.b.stci007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci007
            
            #add-point:AFTER FIELD stci007 name="construct.a.stci007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci009
            #add-point:ON ACTION controlp INFIELD stci009 name="construct.c.stci009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stci009') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stci009',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stci009  #顯示到畫面上
            NEXT FIELD stci009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci009
            #add-point:BEFORE FIELD stci009 name="construct.b.stci009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci009
            
            #add-point:AFTER FIELD stci009 name="construct.a.stci009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci010
            #add-point:BEFORE FIELD stci010 name="construct.b.stci010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci010
            
            #add-point:AFTER FIELD stci010 name="construct.a.stci010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci010
            #add-point:ON ACTION controlp INFIELD stci010 name="construct.c.stci010"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stci011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci011
            #add-point:ON ACTION controlp INFIELD stci011 name="construct.c.stci011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stci011()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci011  #顯示到畫面上
            NEXT FIELD stci011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci011
            #add-point:BEFORE FIELD stci011 name="construct.b.stci011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci011
            
            #add-point:AFTER FIELD stci011 name="construct.a.stci011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci012
            #add-point:ON ACTION controlp INFIELD stci012 name="construct.c.stci012"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "2"
            CALL q_prcf001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci012  #顯示到畫面上
            NEXT FIELD stci012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci012
            #add-point:BEFORE FIELD stci012 name="construct.b.stci012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci012
            
            #add-point:AFTER FIELD stci012 name="construct.a.stci012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci014
            #add-point:ON ACTION controlp INFIELD stci014 name="construct.c.stci014"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbbc001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci014  #顯示到畫面上
            NEXT FIELD stci014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci014
            #add-point:BEFORE FIELD stci014 name="construct.b.stci014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci014
            
            #add-point:AFTER FIELD stci014 name="construct.a.stci014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci013
            #add-point:ON ACTION controlp INFIELD stci013 name="construct.c.stci013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stci013') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stci013',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = " ooef208 = 'Y'"  #161024-00025#5 by 08172
               CALL q_ooef001()  
            END IF
            DISPLAY g_qryparam.return1 TO stci013  #顯示到畫面上
            NEXT FIELD stci013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci013
            #add-point:BEFORE FIELD stci013 name="construct.b.stci013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci013
            
            #add-point:AFTER FIELD stci013 name="construct.a.stci013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci015
            #add-point:ON ACTION controlp INFIELD stci015 name="construct.c.stci015"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '1'
            CALL q_oojd001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci015  #顯示到畫面上
            NEXT FIELD stci015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci015
            #add-point:BEFORE FIELD stci015 name="construct.b.stci015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci015
            
            #add-point:AFTER FIELD stci015 name="construct.a.stci015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci016
            #add-point:ON ACTION controlp INFIELD stci016 name="construct.c.stci016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci016  #顯示到畫面上
            NEXT FIELD stci016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci016
            #add-point:BEFORE FIELD stci016 name="construct.b.stci016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci016
            
            #add-point:AFTER FIELD stci016 name="construct.a.stci016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci017
            #add-point:ON ACTION controlp INFIELD stci017 name="construct.c.stci017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_19()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stci017') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stci017',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_19()
            END IF
            DISPLAY g_qryparam.return1 TO stci017  #顯示到畫面上
            NEXT FIELD stci017                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci017
            #add-point:BEFORE FIELD stci017 name="construct.b.stci017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci017
            
            #add-point:AFTER FIELD stci017 name="construct.a.stci017"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci001
            #add-point:BEFORE FIELD stci001 name="construct.b.stci001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci001
            
            #add-point:AFTER FIELD stci001 name="construct.a.stci001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci001
            #add-point:ON ACTION controlp INFIELD stci001 name="construct.c.stci001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci008
            #add-point:BEFORE FIELD stci008 name="construct.b.stci008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci008
            
            #add-point:AFTER FIELD stci008 name="construct.a.stci008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci008
            #add-point:ON ACTION controlp INFIELD stci008 name="construct.c.stci008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcisite
            #add-point:BEFORE FIELD stcisite name="construct.b.stcisite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcisite
            
            #add-point:AFTER FIELD stcisite name="construct.a.stcisite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcisite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcisite
            #add-point:ON ACTION controlp INFIELD stcisite name="construct.c.stcisite"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stci018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci018
            #add-point:ON ACTION controlp INFIELD stci018 name="construct.c.stci018"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 =g_site #           
            CALL q_ooaj002_3()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci018  #顯示到畫面上
            NEXT FIELD stci018                    #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci018
            #add-point:BEFORE FIELD stci018 name="construct.b.stci018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci018
            
            #add-point:AFTER FIELD stci018 name="construct.a.stci018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci019
            #add-point:ON ACTION controlp INFIELD stci019 name="construct.c.stci019"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site #            
            CALL q_oodb002_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stci019  #顯示到畫面上
            NEXT FIELD stci019                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci019
            #add-point:BEFORE FIELD stci019 name="construct.b.stci019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci019
            
            #add-point:AFTER FIELD stci019 name="construct.a.stci019"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci020
            #add-point:BEFORE FIELD stci020 name="construct.b.stci020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci020
            
            #add-point:AFTER FIELD stci020 name="construct.a.stci020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci020
            #add-point:ON ACTION controlp INFIELD stci020 name="construct.c.stci020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci021
            #add-point:BEFORE FIELD stci021 name="construct.b.stci021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci021
            
            #add-point:AFTER FIELD stci021 name="construct.a.stci021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci021
            #add-point:ON ACTION controlp INFIELD stci021 name="construct.c.stci021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci022
            #add-point:BEFORE FIELD stci022 name="construct.b.stci022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci022
            
            #add-point:AFTER FIELD stci022 name="construct.a.stci022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci022
            #add-point:ON ACTION controlp INFIELD stci022 name="construct.c.stci022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci023
            #add-point:BEFORE FIELD stci023 name="construct.b.stci023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci023
            
            #add-point:AFTER FIELD stci023 name="construct.a.stci023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci023
            #add-point:ON ACTION controlp INFIELD stci023 name="construct.c.stci023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci024
            #add-point:BEFORE FIELD stci024 name="construct.b.stci024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci024
            
            #add-point:AFTER FIELD stci024 name="construct.a.stci024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci024
            #add-point:ON ACTION controlp INFIELD stci024 name="construct.c.stci024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci025
            #add-point:BEFORE FIELD stci025 name="construct.b.stci025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci025
            
            #add-point:AFTER FIELD stci025 name="construct.a.stci025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stci025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci025
            #add-point:ON ACTION controlp INFIELD stci025 name="construct.c.stci025"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stciownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stciownid
            #add-point:ON ACTION controlp INFIELD stciownid name="construct.c.stciownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stciownid  #顯示到畫面上
            NEXT FIELD stciownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stciownid
            #add-point:BEFORE FIELD stciownid name="construct.b.stciownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stciownid
            
            #add-point:AFTER FIELD stciownid name="construct.a.stciownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stciowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stciowndp
            #add-point:ON ACTION controlp INFIELD stciowndp name="construct.c.stciowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stciowndp  #顯示到畫面上
            NEXT FIELD stciowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stciowndp
            #add-point:BEFORE FIELD stciowndp name="construct.b.stciowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stciowndp
            
            #add-point:AFTER FIELD stciowndp name="construct.a.stciowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcicrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcicrtid
            #add-point:ON ACTION controlp INFIELD stcicrtid name="construct.c.stcicrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcicrtid  #顯示到畫面上
            NEXT FIELD stcicrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcicrtid
            #add-point:BEFORE FIELD stcicrtid name="construct.b.stcicrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcicrtid
            
            #add-point:AFTER FIELD stcicrtid name="construct.a.stcicrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcicrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcicrtdp
            #add-point:ON ACTION controlp INFIELD stcicrtdp name="construct.c.stcicrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcicrtdp  #顯示到畫面上
            NEXT FIELD stcicrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcicrtdp
            #add-point:BEFORE FIELD stcicrtdp name="construct.b.stcicrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcicrtdp
            
            #add-point:AFTER FIELD stcicrtdp name="construct.a.stcicrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcicrtdt
            #add-point:BEFORE FIELD stcicrtdt name="construct.b.stcicrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcimodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcimodid
            #add-point:ON ACTION controlp INFIELD stcimodid name="construct.c.stcimodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcimodid  #顯示到畫面上
            NEXT FIELD stcimodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcimodid
            #add-point:BEFORE FIELD stcimodid name="construct.b.stcimodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcimodid
            
            #add-point:AFTER FIELD stcimodid name="construct.a.stcimodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcimoddt
            #add-point:BEFORE FIELD stcimoddt name="construct.b.stcimoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcicnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcicnfid
            #add-point:ON ACTION controlp INFIELD stcicnfid name="construct.c.stcicnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcicnfid  #顯示到畫面上
            NEXT FIELD stcicnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcicnfid
            #add-point:BEFORE FIELD stcicnfid name="construct.b.stcicnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcicnfid
            
            #add-point:AFTER FIELD stcicnfid name="construct.a.stcicnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcicnfdt
            #add-point:BEFORE FIELD stcicnfdt name="construct.b.stcicnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stcjseq,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006,stcj007,stcj008, 
          stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite,stcj028,stcj027,stcj016,stcj017, 
          stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026,stcjunit
           FROM s_detail1[1].stcjseq,s_detail1[1].stcj001,s_detail1[1].stcj002,s_detail1[1].stcj003, 
               s_detail1[1].stcj004,s_detail1[1].stcj005,s_detail1[1].stcj006,s_detail1[1].stcj007,s_detail1[1].stcj008, 
               s_detail1[1].stcj009,s_detail1[1].stcj010,s_detail1[1].stcj011,s_detail1[1].stcj012,s_detail1[1].stcj013, 
               s_detail1[1].stcj015,s_detail1[1].stcj014,s_detail1[1].stcjsite,s_detail1[1].stcj028, 
               s_detail1[1].stcj027,s_detail1[1].stcj016,s_detail1[1].stcj017,s_detail1[1].stcj018,s_detail1[1].stcj019, 
               s_detail1[1].stcj020,s_detail1[1].stcj021,s_detail1[1].stcj022,s_detail1[1].stcj023,s_detail1[1].stcj024, 
               s_detail1[1].stcj025,s_detail1[1].stcj026,s_detail1[1].stcjunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjseq
            #add-point:BEFORE FIELD stcjseq name="construct.b.page1.stcjseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjseq
            
            #add-point:AFTER FIELD stcjseq name="construct.a.page1.stcjseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjseq
            #add-point:ON ACTION controlp INFIELD stcjseq name="construct.c.page1.stcjseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj001
            #add-point:BEFORE FIELD stcj001 name="construct.b.page1.stcj001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj001
            
            #add-point:AFTER FIELD stcj001 name="construct.a.page1.stcj001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj001
            #add-point:ON ACTION controlp INFIELD stcj001 name="construct.c.page1.stcj001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj002
            #add-point:BEFORE FIELD stcj002 name="construct.b.page1.stcj002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj002
            
            #add-point:AFTER FIELD stcj002 name="construct.a.page1.stcj002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj002
            #add-point:ON ACTION controlp INFIELD stcj002 name="construct.c.page1.stcj002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj003
            #add-point:BEFORE FIELD stcj003 name="construct.b.page1.stcj003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj003
            
            #add-point:AFTER FIELD stcj003 name="construct.a.page1.stcj003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj003
            #add-point:ON ACTION controlp INFIELD stcj003 name="construct.c.page1.stcj003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stcj004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj004
            #add-point:ON ACTION controlp INFIELD stcj004 name="construct.c.page1.stcj004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcj004  #顯示到畫面上
            NEXT FIELD stcj004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj004
            #add-point:BEFORE FIELD stcj004 name="construct.b.page1.stcj004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj004
            
            #add-point:AFTER FIELD stcj004 name="construct.a.page1.stcj004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj005
            #add-point:ON ACTION controlp INFIELD stcj005 name="construct.c.page1.stcj005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooaj002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcj005  #顯示到畫面上
            NEXT FIELD stcj005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj005
            #add-point:BEFORE FIELD stcj005 name="construct.b.page1.stcj005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj005
            
            #add-point:AFTER FIELD stcj005 name="construct.a.page1.stcj005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj006
            #add-point:ON ACTION controlp INFIELD stcj006 name="construct.c.page1.stcj006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcj006  #顯示到畫面上
            NEXT FIELD stcj006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj006
            #add-point:BEFORE FIELD stcj006 name="construct.b.page1.stcj006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj006
            
            #add-point:AFTER FIELD stcj006 name="construct.a.page1.stcj006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj007
            #add-point:BEFORE FIELD stcj007 name="construct.b.page1.stcj007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj007
            
            #add-point:AFTER FIELD stcj007 name="construct.a.page1.stcj007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj007
            #add-point:ON ACTION controlp INFIELD stcj007 name="construct.c.page1.stcj007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj008
            #add-point:BEFORE FIELD stcj008 name="construct.b.page1.stcj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj008
            
            #add-point:AFTER FIELD stcj008 name="construct.a.page1.stcj008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj008
            #add-point:ON ACTION controlp INFIELD stcj008 name="construct.c.page1.stcj008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj009
            #add-point:BEFORE FIELD stcj009 name="construct.b.page1.stcj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj009
            
            #add-point:AFTER FIELD stcj009 name="construct.a.page1.stcj009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj009
            #add-point:ON ACTION controlp INFIELD stcj009 name="construct.c.page1.stcj009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj010
            #add-point:BEFORE FIELD stcj010 name="construct.b.page1.stcj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj010
            
            #add-point:AFTER FIELD stcj010 name="construct.a.page1.stcj010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj010
            #add-point:ON ACTION controlp INFIELD stcj010 name="construct.c.page1.stcj010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj011
            #add-point:BEFORE FIELD stcj011 name="construct.b.page1.stcj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj011
            
            #add-point:AFTER FIELD stcj011 name="construct.a.page1.stcj011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj011
            #add-point:ON ACTION controlp INFIELD stcj011 name="construct.c.page1.stcj011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj012
            #add-point:BEFORE FIELD stcj012 name="construct.b.page1.stcj012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj012
            
            #add-point:AFTER FIELD stcj012 name="construct.a.page1.stcj012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj012
            #add-point:ON ACTION controlp INFIELD stcj012 name="construct.c.page1.stcj012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj013
            #add-point:BEFORE FIELD stcj013 name="construct.b.page1.stcj013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj013
            
            #add-point:AFTER FIELD stcj013 name="construct.a.page1.stcj013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj013
            #add-point:ON ACTION controlp INFIELD stcj013 name="construct.c.page1.stcj013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj015
            #add-point:BEFORE FIELD stcj015 name="construct.b.page1.stcj015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj015
            
            #add-point:AFTER FIELD stcj015 name="construct.a.page1.stcj015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj015
            #add-point:ON ACTION controlp INFIELD stcj015 name="construct.c.page1.stcj015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj014
            #add-point:BEFORE FIELD stcj014 name="construct.b.page1.stcj014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj014
            
            #add-point:AFTER FIELD stcj014 name="construct.a.page1.stcj014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj014
            #add-point:ON ACTION controlp INFIELD stcj014 name="construct.c.page1.stcj014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stcjsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjsite
            #add-point:ON ACTION controlp INFIELD stcjsite name="construct.c.page1.stcjsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcjsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stcjsite  #顯示到畫面上
            NEXT FIELD stcjsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjsite
            #add-point:BEFORE FIELD stcjsite name="construct.b.page1.stcjsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjsite
            
            #add-point:AFTER FIELD stcjsite name="construct.a.page1.stcjsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj028
            #add-point:BEFORE FIELD stcj028 name="construct.b.page1.stcj028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj028
            
            #add-point:AFTER FIELD stcj028 name="construct.a.page1.stcj028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj028
            #add-point:ON ACTION controlp INFIELD stcj028 name="construct.c.page1.stcj028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj027
            #add-point:BEFORE FIELD stcj027 name="construct.b.page1.stcj027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj027
            
            #add-point:AFTER FIELD stcj027 name="construct.a.page1.stcj027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj027
            #add-point:ON ACTION controlp INFIELD stcj027 name="construct.c.page1.stcj027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj016
            #add-point:BEFORE FIELD stcj016 name="construct.b.page1.stcj016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj016
            
            #add-point:AFTER FIELD stcj016 name="construct.a.page1.stcj016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj016
            #add-point:ON ACTION controlp INFIELD stcj016 name="construct.c.page1.stcj016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj017
            #add-point:BEFORE FIELD stcj017 name="construct.b.page1.stcj017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj017
            
            #add-point:AFTER FIELD stcj017 name="construct.a.page1.stcj017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj017
            #add-point:ON ACTION controlp INFIELD stcj017 name="construct.c.page1.stcj017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj018
            #add-point:BEFORE FIELD stcj018 name="construct.b.page1.stcj018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj018
            
            #add-point:AFTER FIELD stcj018 name="construct.a.page1.stcj018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj018
            #add-point:ON ACTION controlp INFIELD stcj018 name="construct.c.page1.stcj018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj019
            #add-point:BEFORE FIELD stcj019 name="construct.b.page1.stcj019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj019
            
            #add-point:AFTER FIELD stcj019 name="construct.a.page1.stcj019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj019
            #add-point:ON ACTION controlp INFIELD stcj019 name="construct.c.page1.stcj019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj020
            #add-point:BEFORE FIELD stcj020 name="construct.b.page1.stcj020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj020
            
            #add-point:AFTER FIELD stcj020 name="construct.a.page1.stcj020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj020
            #add-point:ON ACTION controlp INFIELD stcj020 name="construct.c.page1.stcj020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj021
            #add-point:BEFORE FIELD stcj021 name="construct.b.page1.stcj021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj021
            
            #add-point:AFTER FIELD stcj021 name="construct.a.page1.stcj021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj021
            #add-point:ON ACTION controlp INFIELD stcj021 name="construct.c.page1.stcj021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj022
            #add-point:BEFORE FIELD stcj022 name="construct.b.page1.stcj022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj022
            
            #add-point:AFTER FIELD stcj022 name="construct.a.page1.stcj022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj022
            #add-point:ON ACTION controlp INFIELD stcj022 name="construct.c.page1.stcj022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj023
            #add-point:BEFORE FIELD stcj023 name="construct.b.page1.stcj023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj023
            
            #add-point:AFTER FIELD stcj023 name="construct.a.page1.stcj023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj023
            #add-point:ON ACTION controlp INFIELD stcj023 name="construct.c.page1.stcj023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj024
            #add-point:BEFORE FIELD stcj024 name="construct.b.page1.stcj024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj024
            
            #add-point:AFTER FIELD stcj024 name="construct.a.page1.stcj024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj024
            #add-point:ON ACTION controlp INFIELD stcj024 name="construct.c.page1.stcj024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj025
            #add-point:BEFORE FIELD stcj025 name="construct.b.page1.stcj025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj025
            
            #add-point:AFTER FIELD stcj025 name="construct.a.page1.stcj025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj025
            #add-point:ON ACTION controlp INFIELD stcj025 name="construct.c.page1.stcj025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj026
            #add-point:BEFORE FIELD stcj026 name="construct.b.page1.stcj026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj026
            
            #add-point:AFTER FIELD stcj026 name="construct.a.page1.stcj026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcj026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj026
            #add-point:ON ACTION controlp INFIELD stcj026 name="construct.c.page1.stcj026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjunit
            #add-point:BEFORE FIELD stcjunit name="construct.b.page1.stcjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjunit
            
            #add-point:AFTER FIELD stcjunit name="construct.a.page1.stcjunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjunit
            #add-point:ON ACTION controlp INFIELD stcjunit name="construct.c.page1.stcjunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stci_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcj_t" 
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
 
{<section id="astt620.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt620_filter()
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
      CONSTRUCT g_wc_filter ON stcidocno,stciunit,stcidocdt,stci002,stci003,stci007
                          FROM s_browse[1].b_stcidocno,s_browse[1].b_stciunit,s_browse[1].b_stcidocdt, 
                              s_browse[1].b_stci002,s_browse[1].b_stci003,s_browse[1].b_stci007
 
         BEFORE CONSTRUCT
               DISPLAY astt620_filter_parser('stcidocno') TO s_browse[1].b_stcidocno
            DISPLAY astt620_filter_parser('stciunit') TO s_browse[1].b_stciunit
            DISPLAY astt620_filter_parser('stcidocdt') TO s_browse[1].b_stcidocdt
            DISPLAY astt620_filter_parser('stci002') TO s_browse[1].b_stci002
            DISPLAY astt620_filter_parser('stci003') TO s_browse[1].b_stci003
            DISPLAY astt620_filter_parser('stci007') TO s_browse[1].b_stci007
      
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
 
      CALL astt620_filter_show('stcidocno')
   CALL astt620_filter_show('stciunit')
   CALL astt620_filter_show('stcidocdt')
   CALL astt620_filter_show('stci002')
   CALL astt620_filter_show('stci003')
   CALL astt620_filter_show('stci007')
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt620_filter_parser(ps_field)
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
 
{<section id="astt620.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt620_filter_show(ps_field)
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
   LET ls_condition = astt620_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt620_query()
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
   CALL g_stcj_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt620_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt620_browser_fill("")
      CALL astt620_fetch("")
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
      CALL astt620_filter_show('stcidocno')
   CALL astt620_filter_show('stciunit')
   CALL astt620_filter_show('stcidocdt')
   CALL astt620_filter_show('stci002')
   CALL astt620_filter_show('stci003')
   CALL astt620_filter_show('stci007')
   CALL astt620_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt620_fetch("F") 
      #顯示單身筆數
      CALL astt620_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt620_fetch(p_flag)
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
   
   LET g_stci_m.stcidocno = g_browser[g_current_idx].b_stcidocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
   #遮罩相關處理
   LET g_stci_m_mask_o.* =  g_stci_m.*
   CALL astt620_stci_t_mask()
   LET g_stci_m_mask_n.* =  g_stci_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt620_set_act_visible()   
   CALL astt620_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)
   IF g_stci_m.stcistus NOT MATCHES "[NDR]" OR g_stci_m.stci010 != '1'  THEN # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF 
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stci_m_t.* = g_stci_m.*
   LET g_stci_m_o.* = g_stci_m.*
   
   LET g_data_owner = g_stci_m.stciownid      
   LET g_data_dept  = g_stci_m.stciowndp
   
   #重新顯示   
   CALL astt620_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt620_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   DEFINE r_insert       LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stcj_d.clear()   
 
 
   INITIALIZE g_stci_m.* TO NULL             #DEFAULT 設定
   
   LET g_stcidocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stci_m.stciownid = g_user
      LET g_stci_m.stciowndp = g_dept
      LET g_stci_m.stcicrtid = g_user
      LET g_stci_m.stcicrtdp = g_dept 
      LET g_stci_m.stcicrtdt = cl_get_current()
      LET g_stci_m.stcimodid = g_user
      LET g_stci_m.stcimoddt = cl_get_current()
      LET g_stci_m.stcistus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stci_m.stci023 = "0"
      LET g_stci_m.stci024 = "0"
      LET g_stci_m.stci025 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_site_flag = FALSE    #161024-00025#5 by 08172
      LET g_stci_m_t.* = g_stci_m.*
      LET g_stci_m.stciunit=g_site
      LET g_stci_m.stcidocdt=g_today
      LET g_stci_m.stci004='11'
      LET g_stci_m.stci010='1'
      LET g_stci_m.stci021='1'
      LET g_stci_m.stci022='1'
      LET g_stci_m.stci007=g_user
      LET g_stci_m.stci008=g_dept
      LET g_stci_m.stci023=0
      LET g_stci_m.stci024=0
      LET g_stci_m.stci025=0

      LET r_insert=TRUE
      CALL s_aooi500_default(g_prog,'stciunit',g_stci_m.stcisite) RETURNING r_insert,g_stci_m.stciunit
      IF NOT r_insert THEN
         RETURN 
      END IF
      LET g_stci_m.stcisite = g_stci_m.stciunit       #161024-00025#3 add
     ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stci_m.stciunit,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stci_m.stcidocno = r_doctype
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stciunit
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stci_m.stciunit_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stciunit_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stciownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stci_m.stciownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stciownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stciowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stci_m.stciowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stciowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stcicrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stci_m.stcicrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stcicrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stcicrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stci_m.stcicrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stcicrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stcimodid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stci_m.stcimodid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stcimodid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stci_m.stcicnfid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stci_m.stcicnfid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stci_m.stcicnfid_desc      
      
      
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stci_m_t.* = g_stci_m.*
      LET g_stci_m_o.* = g_stci_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stci_m.stcistus 
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
 
 
 
    
      CALL astt620_input("a")
      
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
         INITIALIZE g_stci_m.* TO NULL
         INITIALIZE g_stcj_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt620_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stcj_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt620_set_act_visible()   
   CALL astt620_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcidocno_t = g_stci_m.stcidocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcient = " ||g_enterprise|| " AND",
                      " stcidocno = '", g_stci_m.stcidocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt620_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt620_cl
   
   CALL astt620_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
   
   #遮罩相關處理
   LET g_stci_m_mask_o.* =  g_stci_m.*
   CALL astt620_stci_t_mask()
   LET g_stci_m_mask_n.* =  g_stci_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000, 
       g_stci_m.stci002,g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc,g_stci_m.stci004, 
       g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci006,g_stci_m.stci006_desc,g_stci_m.stcistus, 
       g_stci_m.stci007,g_stci_m.stci007_desc,g_stci_m.stci009,g_stci_m.stci009_desc,g_stci_m.stci010, 
       g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci012_desc,g_stci_m.stci014,g_stci_m.stci014_desc, 
       g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci015,g_stci_m.stci015_desc,g_stci_m.stci016, 
       g_stci_m.stci016_desc,g_stci_m.stci017,g_stci_m.stci017_desc,g_stci_m.stci001,g_stci_m.stci008, 
       g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc,g_stci_m.stci019,g_stci_m.stci019_desc, 
       g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025, 
       g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid, 
       g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt 
 
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stci_m.stciownid      
   LET g_data_dept  = g_stci_m.stciowndp
   
   #功能已完成,通報訊息中心
   CALL astt620_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt620_modify()
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
   LET g_stci_m_t.* = g_stci_m.*
   LET g_stci_m_o.* = g_stci_m.*
   
   IF g_stci_m.stcidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stcidocno_t = g_stci_m.stcidocno
 
   CALL s_transaction_begin()
   
   OPEN astt620_cl USING g_enterprise,g_stci_m.stcidocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt620_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt620_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt620_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stci_m_mask_o.* =  g_stci_m.*
   CALL astt620_stci_t_mask()
   LET g_stci_m_mask_n.* =  g_stci_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt620_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stcidocno_t = g_stci_m.stcidocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stci_m.stcimodid = g_user 
LET g_stci_m.stcimoddt = cl_get_current()
LET g_stci_m.stcimodid_desc = cl_get_username(g_stci_m.stcimodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stci_m.stcistus MATCHES "[DR]" THEN
         LET g_stci_m.stcistus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt620_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stci_t SET (stcimodid,stcimoddt) = (g_stci_m.stcimodid,g_stci_m.stcimoddt)
          WHERE stcient = g_enterprise AND stcidocno = g_stcidocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stci_m.* = g_stci_m_t.*
            CALL astt620_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stci_m.stcidocno != g_stci_m_t.stcidocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stcj_t SET stcjdocno = g_stci_m.stcidocno
 
          WHERE stcjent = g_enterprise AND stcjdocno = g_stci_m_t.stcidocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcj_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
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
   CALL astt620_set_act_visible()   
   CALL astt620_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stcient = " ||g_enterprise|| " AND",
                      " stcidocno = '", g_stci_m.stcidocno, "' "
 
   #填到對應位置
   CALL astt620_browser_fill("")
 
   CLOSE astt620_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt620_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt620.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt620_input(p_cmd)
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
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_prcksite            LIKE prck_t.prcksite
   DEFINE  l_oodb006             LIKE oodb_t.oodb006
   DEFINE  l_chr                 LIKE type_t.chr10
   DEFINE  l_errno               LIKE type_t.chr100
   DEFINE  l_stce017             LIKE stce_t.stce017
   DEFINE  l_stce018             LIKE stce_t.stce018
   DEFINE  l_stae005             LIKE stae_t.stae005
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
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
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000, 
       g_stci_m.stci002,g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc,g_stci_m.stci004, 
       g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci006,g_stci_m.stci006_desc,g_stci_m.stcistus, 
       g_stci_m.stci007,g_stci_m.stci007_desc,g_stci_m.stci009,g_stci_m.stci009_desc,g_stci_m.stci010, 
       g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci012_desc,g_stci_m.stci014,g_stci_m.stci014_desc, 
       g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci015,g_stci_m.stci015_desc,g_stci_m.stci016, 
       g_stci_m.stci016_desc,g_stci_m.stci017,g_stci_m.stci017_desc,g_stci_m.stci001,g_stci_m.stci008, 
       g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc,g_stci_m.stci019,g_stci_m.stci019_desc, 
       g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025, 
       g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid, 
       g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt 
 
   
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
   LET g_forupd_sql = "SELECT stcjseq,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006,stcj007,stcj008, 
       stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite,stcj028,stcj027,stcj016,stcj017, 
       stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026,stcjunit FROM stcj_t  
       WHERE stcjent=? AND stcjdocno=? AND stcjseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt620_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt620_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt620_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002, 
       g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005,g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007, 
       g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013, 
       g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017,g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite, 
       g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023, 
       g_stci_m.stci024,g_stci_m.stci025
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci002, 
       g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc,g_stci_m.stci004,g_stci_m.stci006, 
       g_stci_m.stci006_desc,g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci007,g_stci_m.stci007_desc, 
       g_stci_m.stcistus,g_stci_m.stci009,g_stci_m.stci009_desc,g_stci_m.stci010,g_stci_m.stci011,g_stci_m.stci012, 
       g_stci_m.stci012_desc,g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci014,g_stci_m.stci014_desc, 
       g_stci_m.stci015,g_stci_m.stci015_desc,g_stci_m.stci016,g_stci_m.stci016_desc,g_stci_m.stci017, 
       g_stci_m.stci017_desc,g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc, 
       g_stci_m.stci019,g_stci_m.stci019_desc,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023, 
       g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp, 
       g_stci_m.stciowndp_desc,g_stci_m.stcicrtid,g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc, 
       g_stci_m.stcicrtdt,g_stci_m.stcimodid,g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid, 
       g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt620.input.head" >}
      #單頭段
      INPUT BY NAME g_stci_m.stciunit,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002, 
          g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005,g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007, 
          g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013, 
          g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017,g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite, 
          g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023, 
          g_stci_m.stci024,g_stci_m.stci025 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt620_cl USING g_enterprise,g_stci_m.stcidocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt620_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt620_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt620_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL astt620_set_entry(p_cmd)
            CALL astt620_set_no_entry(p_cmd)
            #end add-point
            CALL astt620_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stciunit
            
            #add-point:AFTER FIELD stciunit name="input.a.stciunit"
            IF  NOT cl_null(g_stci_m.stciunit) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stciunit != g_stci_m_t.stciunit )) THEN 
                  CALL s_aooi500_chk(g_prog,'stciunit',g_stci_m.stciunit,g_site)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stci_m.stciunit
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stci_m.stciunit = g_stci_m_t.stciunit
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF      
            LET g_site_flag = TRUE  #161024-00025#5 by 08172
            CALL astt620_set_entry(p_cmd)
            CALL astt620_set_no_entry(p_cmd)


            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stciunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stciunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stciunit_desc

            LET g_stci_m.stcisite = g_stci_m.stciunit       #161024-00025#3 add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stciunit
            #add-point:BEFORE FIELD stciunit name="input.b.stciunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stciunit
            #add-point:ON CHANGE stciunit name="input.g.stciunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcidocdt
            #add-point:BEFORE FIELD stcidocdt name="input.b.stcidocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcidocdt
            
            #add-point:AFTER FIELD stcidocdt name="input.a.stcidocdt"
            IF NOT cl_null(g_stci_m.stcidocdt) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stcidocdt != g_stci_m_t.stcidocdt )) THEN 
                  
                  #合約生效日期範圍判斷
                  IF NOT cl_null(g_stci_m.stci000) THEN
                     SELECT stce017,stce018 INTO l_stce017,l_stce018 
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce001=g_stci_m.stci000
                        AND stcestus='Y' 
                     IF l_stce017>g_stci_m.stcidocdt OR l_stce018<g_stci_m.stcidocdt THEN
                        LET g_stci_m.stcidocdt = g_stci_m_t.stcidocdt
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00047"
                        LET g_errparam.extend = g_stci_m.stci000
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF  
                  END IF                  
                  
               END IF
               IF NOT cl_null(g_stci_m.stci009) THEN
                  CALL s_asti206_check(g_stci_m.stci009,g_stci_m.stcidocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN                        
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stci_m.stcidocdt = g_stci_m_t.stcidocdt
                     NEXT FIELD CURRENT
                  END IF                  
               END IF               
            END IF 

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcidocdt
            #add-point:ON CHANGE stcidocdt name="input.g.stcidocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcidocno
            #add-point:BEFORE FIELD stcidocno name="input.b.stcidocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcidocno
            
            #add-point:AFTER FIELD stcidocno name="input.a.stcidocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stci_m.stcidocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stcidocno != g_stcidocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stci_t WHERE "||"stcient = '" ||g_enterprise|| "' AND "||"stcidocno = '"||g_stci_m.stcidocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT s_aooi200_chk_slip(g_site,'',g_stci_m.stcidocno,g_prog) THEN
                     LET g_stci_m.stcidocno =  g_stcidocno_t                    
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcidocno
            #add-point:ON CHANGE stcidocno name="input.g.stcidocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci000
            #add-point:BEFORE FIELD stci000 name="input.b.stci000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci000
            
            #add-point:AFTER FIELD stci000 name="input.a.stci000"
            IF  NOT cl_null(g_stci_m.stci000) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci000 != g_stci_m_t.stci000 )) THEN    #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci000 != g_stci_m_o.stci000 OR cl_null(g_stci_m_o.stci000) THEN          #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL		      
                      #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stci_m.stci000            
                  IF NOT cl_chk_exist("v_stce001") THEN
                     LET g_stci_m.stci000 = g_stci_m_o.stci000    #160824-00007#200 161122 by lori mod:g_stci_m_t.stci000->g_stci_m_o.stci000            
                     NEXT FIELD CURRENT
                  END IF  
                  
                  #合約生效日期範圍判斷
                  IF NOT cl_null(g_stci_m.stcidocdt) THEN
                     SELECT stce017,stce018 INTO l_stce017,l_stce018 
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce001=g_stci_m.stci000
                        AND stcestus='Y' 
                     IF l_stce017>g_stci_m.stcidocdt OR l_stce018<g_stci_m.stcidocdt THEN
                        LET g_stci_m.stci000 = g_stci_m_o.stci000   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci000->g_stci_m_o.stci000
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00047"
                        LET g_errparam.extend = g_stci_m.stci000
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                          
                        NEXT FIELD CURRENT
                     END IF  
                  END IF
                  
                  #asti206結算會計期檢查
                  SELECT stce024 INTO g_stci_m.stci009
                    FROM stce_t
                   WHERE stceent=g_enterprise
                     AND stce001=g_stci_m.stci000
                     AND stcestus='Y'                   
                  IF NOT cl_null(g_stci_m.stci009) AND NOT cl_null(g_stci_m.stcidocdt) THEN
                     CALL s_asti206_check(g_stci_m.stci009,g_stci_m.stcidocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN                        
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stci_m.stci000 = g_stci_m_o.stci000   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci000->g_stci_m_o.stci000  
                        NEXT FIELD CURRENT
                     END IF               
                  END IF  
                     
                  CALL astt620_stci000_ref()
               END IF
            END IF 
            
            LET g_stci_m_o.stci000 = g_stci_m.stci000   #160824-00007#200 161122 by lori add
            LET g_stci_m_o.stci009 = g_stci_m.stci009   #160824-00007#200 161122 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci000
            #add-point:ON CHANGE stci000 name="input.g.stci000"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci002
            
            #add-point:AFTER FIELD stci002 name="input.a.stci002"
            IF  NOT cl_null(g_stci_m.stci002) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci002 != g_stci_m_t.stci002 )) THEN   #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci002 != g_stci_m_o.stci002 OR cl_null(g_stci_m_o.stci002) THEN         #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL	
                  LET g_chkparam.arg1 = g_stci_m.stci002            
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "apm-00638:sub-01302|adbm200|",cl_get_progname("adbm200",g_lang,"2"),"|:EXEPROGadbm200"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_pmaa001_17") THEN
                     LET g_stci_m.stci002 = g_stci_m_o.stci002     #160824-00007#200 161122 by lori mod:g_stci_m_t.stci002->g_stci_m_o.stci002             
                     NEXT FIELD CURRENT
                  END IF

                  #經銷商與網點
                  IF NOT cl_null(g_stci_m.stci003) THEN
                     LET l_count=0
                     SELECT COUNT(*) INTO l_count FROM pmaa_t
                      WHERE pmaaent = g_enterprise AND pmaa001 = g_stci_m.stci003 AND pmaa006 = g_stci_m.stci002
                     IF cl_null(l_count) OR l_count=0 THEN
                        LET g_stci_m.stci002 = g_stci_m_o.stci002   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci002->g_stci_m_o.stci002
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00043"
                        LET g_errparam.extend = g_stci_m.stci002
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF                        
                  END IF  
                  
                  #分銷合約檢查--根據合約編號、經銷商、網點、經營方式
                  IF NOT astt620_stce001_check() THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00048"
                      LET g_errparam.extend = g_stci_m.stci002
                      LET g_errparam.popup = TRUE
                      CALL cl_err()
                      
                      LET g_stci_m.stci002 = g_stci_m_o.stci002     #160824-00007#200 161122 by lori mod:g_stci_m_t.stci002->g_stci_m_o.stci002
                      DISPLAY BY NAME g_stci_m.stci002              #160824-00007#200 161122 by lori add

                      NEXT FIELD CURRENT
                  END IF   
                  
                  #經銷商+網點—+單據日期---帶出合約
                  IF NOT cl_null(g_stci_m.stci002) AND NOT cl_null(g_stci_m.stcidocdt) AND cl_null(g_stci_m.stci000)  THEN
                     SELECT stce001 INTO g_stci_m.stci000
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce009=g_stci_m.stci002
                        AND stce010=g_stci_m.stci003
                        AND stcestus='Y'
                        AND stce017<=g_stci_m.stcidocdt
                        AND stce018>=g_stci_m.stcidocdt
                        
                      #asti206結算會計期檢查
                      SELECT stce024 INTO g_stci_m.stci009
                        FROM stce_t
                       WHERE stceent=g_enterprise
                         AND stce001=g_stci_m.stci000
                         AND stcestus='Y'                   
                      IF NOT cl_null(g_stci_m.stci009) AND NOT cl_null(g_stci_m.stcidocdt) THEN
                         CALL s_asti206_check(g_stci_m.stci009,g_stci_m.stcidocdt,g_prog) RETURNING l_success,l_errno
                         IF NOT l_success THEN                        
                            INITIALIZE g_errparam TO NULL
                            LET g_errparam.code = l_errno
                            LET g_errparam.extend = ''
                            LET g_errparam.popup = TRUE
                            CALL cl_err()

                            LET g_stci_m.stci002 = g_stci_m_o.stci002    #160824-00007#200 161122 by lori mod:g_stci_m_t.stci002->g_stci_m_o.stci002
                            NEXT FIELD CURRENT
                         END IF               
                      END IF     
                  
                     CALL astt620_stci000_ref()
                  END IF   
                  
               END IF
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci002_desc

            #160824-00007#200 161122 by lori add---(S)
            LET g_stci_m_o.stci002 = g_stci_m.stci002   
            LET g_stci_m_o.stci000 = g_stci_m.stci000
            LET g_stci_m_o.stci009 = g_stci_m.stci009   
            #160824-00007#200 161122 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci002
            #add-point:BEFORE FIELD stci002 name="input.b.stci002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci002
            #add-point:ON CHANGE stci002 name="input.g.stci002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci003
            
            #add-point:AFTER FIELD stci003 name="input.a.stci003"
            IF  NOT cl_null(g_stci_m.stci003) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci003 != g_stci_m_t.stci003 )) THEN   #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci003 != g_stci_m_o.stci003 OR cl_null(g_stci_m_o.stci003) THEN         #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL	
                  LET g_chkparam.arg1 = g_stci_m.stci003            
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_pmaa001_14") THEN
                     LET g_stci_m.stci003 = g_stci_m_o.stci003      #160824-00007#200 161122 by lori mod:g_stci_m_t.stci003->g_stci_m_o.stci003               
                     NEXT FIELD CURRENT
                  END IF
                   
                  #經銷商與網點
                  IF NOT cl_null(g_stci_m.stci002) THEN
                     LET l_count=0
                     SELECT COUNT(*) INTO l_count FROM pmaa_t
                      WHERE pmaaent = g_enterprise AND pmaa001 = g_stci_m.stci003 AND pmaa006 = g_stci_m.stci002
                     IF cl_null(l_count) OR l_count=0 THEN
                        LET g_stci_m.stci003 = g_stci_m_o.stci003   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci003->g_stci_m_o.stci003
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00043"
                        LET g_errparam.extend = g_stci_m.stci003
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF                        
                  END IF
                                                  
               END IF
            END IF   


            #經銷商+網點—+單據日期---帶出合約
            IF p_cmd = 'a' OR ( p_cmd = 'u' AND 
                                  ((NOT cl_null(g_stci_m.stci003) AND NOT cl_null(g_stci_m_t.stci003) AND g_stci_m.stci003 != g_stci_m_t.stci003)
                                    OR (NOT cl_null(g_stci_m.stci003) AND cl_null(g_stci_m_t.stci003))
                                    OR ( cl_null(g_stci_m.stci003) AND NOT cl_null(g_stci_m_t.stci003)) 
                                  )) THEN 
               IF NOT cl_null(g_stci_m.stci002) AND NOT cl_null(g_stci_m.stcidocdt) AND cl_null(g_stci_m.stci000)  THEN
                  IF NOT cl_null(g_stci_m.stci003) THEN
                     SELECT stce001 INTO g_stci_m.stci000
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce009=g_stci_m.stci002
                        AND stce010=g_stci_m.stci003
                        AND stcestus='Y'
                        AND stce017<=g_stci_m.stcidocdt
                        AND stce018>=g_stci_m.stcidocdt
                  ELSE
                     SELECT stce001 INTO g_stci_m.stci000
                       FROM stce_t
                      WHERE stceent=g_enterprise
                        AND stce009=g_stci_m.stci002
                        AND stce010 IS NULL
                        AND stcestus='Y'
                        AND stce017<=g_stci_m.stcidocdt
                        AND stce018>=g_stci_m.stcidocdt                  
                  END IF
                  
                  #asti206結算會計期檢查
                  SELECT stce024 INTO g_stci_m.stci009
                    FROM stce_t
                   WHERE stceent=g_enterprise
                     AND stce001=g_stci_m.stci000
                     AND stcestus='Y'                   
                  IF NOT cl_null(g_stci_m.stci009) AND NOT cl_null(g_stci_m.stcidocdt) THEN
                     CALL s_asti206_check(g_stci_m.stci009,g_stci_m.stcidocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN                        
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stci_m.stci003 = g_stci_m_o.stci003   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci003->g_stci_m_o.stci003
                        NEXT FIELD CURRENT
                     END IF               
                  END IF
                  
                  CALL astt620_stci000_ref()
               END IF   
            END IF
            
            #分銷合約檢查--根據合約編號、經銷商、網點、經營方式
            IF NOT astt620_stce001_check() THEN
                LET g_stci_m.stci003 = g_stci_m_o.stci003   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci003->g_stci_m_o.stci003
                LET g_stci_m.stci000 = g_stci_m_o.stci000   #160824-00007#200 161122 by lori add
                LET g_stci_m.stci009 = g_stci_m_o.stci009   #160824-00007#200 161122 by lori add
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = "ast-00048"
                LET g_errparam.extend = g_stci_m.stci003
                LET g_errparam.popup = TRUE
                CALL cl_err()

                NEXT FIELD CURRENT
            END IF 
                  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci003_desc

            #160824-00007#200 161122 by lori add---(S)
            LET g_stci_m_o.stci003 = g_stci_m.stci003   
            LET g_stci_m_o.stci000 = g_stci_m.stci000
            LET g_stci_m_o.stci009 = g_stci_m.stci009   
            #160824-00007#200 161122 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci003
            #add-point:BEFORE FIELD stci003 name="input.b.stci003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci003
            #add-point:ON CHANGE stci003 name="input.g.stci003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci004
            #add-point:BEFORE FIELD stci004 name="input.b.stci004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci004
            
            #add-point:AFTER FIELD stci004 name="input.a.stci004"
            IF  NOT cl_null(g_stci_m.stci004) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci004 != g_stci_m_t.stci004 )) THEN 
                  
                  #分銷合約檢查--根據合約編號、經銷商、網點、經營方式
                  IF NOT astt620_stce001_check() THEN
                      LET g_stci_m.stci004 = g_stci_m_t.stci004 
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00048"
                      LET g_errparam.extend = g_stci_m.stci003
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      NEXT FIELD CURRENT
                  END IF 
                  
               END IF
            END IF  
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci004
            #add-point:ON CHANGE stci004 name="input.g.stci004"
            #分銷合約檢查--根據合約編號、經銷商、網點、經營方式
            IF NOT astt620_stce001_check() THEN
                LET g_stci_m.stci004 = g_stci_m_t.stci004 
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = "ast-00048"
                LET g_errparam.extend = g_stci_m.stci003
                LET g_errparam.popup = TRUE
                CALL cl_err()

                NEXT FIELD CURRENT
            END IF 
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci005
            
            #add-point:AFTER FIELD stci005 name="input.a.stci005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci005
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci005
            #add-point:BEFORE FIELD stci005 name="input.b.stci005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci005
            #add-point:ON CHANGE stci005 name="input.g.stci005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci006
            
            #add-point:AFTER FIELD stci006 name="input.a.stci006"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci006
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci006_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci006
            #add-point:BEFORE FIELD stci006 name="input.b.stci006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci006
            #add-point:ON CHANGE stci006 name="input.g.stci006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcistus
            #add-point:BEFORE FIELD stcistus name="input.b.stcistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcistus
            
            #add-point:AFTER FIELD stcistus name="input.a.stcistus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcistus
            #add-point:ON CHANGE stcistus name="input.g.stcistus"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci007
            
            #add-point:AFTER FIELD stci007 name="input.a.stci007"
            IF NOT cl_null(g_stci_m.stci007) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci007 != g_stci_m_t.stci007 )) THEN    #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci007 != g_stci_m_o.stci007 OR cl_null(g_stci_m_o.stci007) THEN          #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL	
                  LET g_chkparam.arg1 = g_stci_m.stci007              
                  #160318-00025#35  2016/05/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#35  2016/05/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooag001") THEN
                     LET g_stci_m.stci007 = g_stci_m_o.stci007     #160824-00007#200 161122 by lori mod:g_stci_m_t.stci007->g_stci_m_o.stci007               
                     NEXT FIELD CURRENT
                  END IF  
                  SELECT ooag003 INTO g_stci_m.stci008
                    FROM ooag_t
                   WHERE ooagent=g_enterprise
                     AND ooag001=g_stci_m.stci007
               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci007
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stci_m.stci007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci007_desc

            LET g_stci_m_o.stci007 = g_stci_m.stci007   #160824-00007#200 161122 by lori add
            LET g_stci_m_o.stci008 = g_stci_m.stci008   #160824-00007#200 161122 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci007
            #add-point:BEFORE FIELD stci007 name="input.b.stci007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci007
            #add-point:ON CHANGE stci007 name="input.g.stci007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci009
            
            #add-point:AFTER FIELD stci009 name="input.a.stci009"
            IF  NOT cl_null(g_stci_m.stci009) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci009 != g_stci_m_t.stci009 )) THEN   #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci009 <> g_stci_m_o.stci009 OR cl_null(g_stci_m_o.stci009) THEN         #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stci_m.stci009
                  IF NOT cl_chk_exist("v_ooef001_31") THEN
                     LET g_stci_m.stci009 = g_stci_m_o.stci009   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci009->g_stci_m_o.stci009
                     NEXT FIELD CURRENT
                  END IF

               END IF
               IF NOT cl_null(g_stci_m.stcidocdt) THEN
                  CALL s_asti206_check(g_stci_m.stci009,g_stci_m.stcidocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN                        
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stci_m.stci009 = g_stci_m_o.stci009   #160824-00007#200 161122 by lori mod:g_stci_m_t.stci009->g_stci_m_o.stci009
                     NEXT FIELD CURRENT
                  END IF                  
               END IF               
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci009_desc

            LET g_stci_m_o.stci009 = g_stci_m.stci009   #160824-00007#200 161122 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci009
            #add-point:BEFORE FIELD stci009 name="input.b.stci009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci009
            #add-point:ON CHANGE stci009 name="input.g.stci009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci010
            #add-point:BEFORE FIELD stci010 name="input.b.stci010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci010
            
            #add-point:AFTER FIELD stci010 name="input.a.stci010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci010
            #add-point:ON CHANGE stci010 name="input.g.stci010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci011
            #add-point:BEFORE FIELD stci011 name="input.b.stci011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci011
            
            #add-point:AFTER FIELD stci011 name="input.a.stci011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci011
            #add-point:ON CHANGE stci011 name="input.g.stci011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci012
            
            #add-point:AFTER FIELD stci012 name="input.a.stci012"
            IF  NOT cl_null(g_stci_m.stci012) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci012 != g_stci_m_t.stci012 )) THEN 
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stci_m.stci012
                  LET g_chkparam.arg2 = "2"
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "apr-00060:sub-01307|aprm201|",cl_get_progname("aprm201",g_lang,"2"),"|:EXEPROGaprm201"
                  LET g_chkparam.err_str[2] = "apr-00059:sub-01302|aprm201|",cl_get_progname("aprm201",g_lang,"2"),"|:EXEPROGaprm201"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_prcf001_1") THEN
                     LET g_stci_m.stci012 = g_stci_m_t.stci012
                     NEXT FIELD CURRENT
                  END IF

               END IF
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci012
            CALL ap_ref_array2(g_ref_fields,"SELECT prcfl003 FROM prcfl_t WHERE prcflent='"||g_enterprise||"' AND prcfl001=? AND prcfl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci012_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci012
            #add-point:BEFORE FIELD stci012 name="input.b.stci012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci012
            #add-point:ON CHANGE stci012 name="input.g.stci012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci014
            
            #add-point:AFTER FIELD stci014 name="input.a.stci014"
            IF NOT cl_null(g_stci_m.stci014) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci014 != g_stci_m_t.stci014 )) THEN   #160824-00007#200 161122 by lori mark
               IF g_stci_m.stci014 != g_stci_m_o.stci014 OR cl_null(g_stci_m_o.stci014) THEN         #160824-00007#200 by lori add
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stci_m.stci014
                  LET g_chkparam.arg2 = g_stci_m.stci013

                  #呼叫檢查存在並帶值的library
                  IF NOT cl_null(g_stci_m.stci013) THEN
                     IF NOT cl_chk_exist("v_dbbc001_1") THEN
                        LET g_stci_m.stci014 = g_stci_m_o.stci014   #160824-00007#200 by lori mod:g_stci_m_t.stci014->g_stci_m_o.stci014
                        NEXT FIELD CURRENT
                     END IF
                  ELSE
                     IF NOT cl_chk_exist("v_dbbc001") THEN
                        LET g_stci_m.stci014 = g_stci_m_o.stci014   #160824-00007#200 by lori mod:g_stci_m_t.stci014->g_stci_m_o.stci014
                        NEXT FIELD CURRENT
                     END IF                  
                  END IF                  
                  SELECT dbbc002,dbbc003,dbbc004,dbbc005 
                    INTO g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017
                    FROM dbbc_t
                   WHERE dbbcent=g_enterprise
                     AND dbbc001=g_stci_m.stci014
                     AND dbbcstus='Y'
                     
                   DISPLAY BY NAME g_stci_m.stci013                     
                   DISPLAY BY NAME g_stci_m.stci015
                   DISPLAY BY NAME g_stci_m.stci016
                   DISPLAY BY NAME g_stci_m.stci017                   

               END IF
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci013_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci014
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci014_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci014_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci015
            CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci015_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci015_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci017_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci016
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci016_desc 
            
            #160824-00007#200 by lori add---(S)
            LET g_stci_m_o.stci014 = g_stci_m.stci014
            LET g_stci_m_o.stci013 = g_stci_m.stci013
            LET g_stci_m_o.stci015 = g_stci_m.stci015
            LET g_stci_m_o.stci016 = g_stci_m.stci016
            LET g_stci_m_o.stci017 = g_stci_m.stci017
            #160824-00007#200 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci014
            #add-point:BEFORE FIELD stci014 name="input.b.stci014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci014
            #add-point:ON CHANGE stci014 name="input.g.stci014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci013
            
            #add-point:AFTER FIELD stci013 name="input.a.stci013"
            IF NOT cl_null(g_stci_m.stci013) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci013 != g_stci_m_t.stci013 )) THEN   #160824-00007#200 by lori mark
               IF g_stci_m.stci013 != g_stci_m_o.stci013 OR cl_null(g_stci_m_o.stci013) THEN         #160824-00007#200 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stci_m.stci013 
                  LET g_chkparam.arg2 = '8'
                  LET g_chkparam.arg3 = g_site
                  IF NOT cl_chk_exist("v_ooed004") THEN
                     LET g_stci_m.stci013 = g_stci_m_o.stci013   #160824-00007#200 by lori mod:g_stci_m_t.stci013->g_stci_m_o.stci013
                     NEXT FIELD CURRENT
                  END IF
                  

                  #呼叫檢查存在並帶值的library
                  IF NOT cl_null(g_stci_m.stci014) THEN
                     #設定g_chkparam.*的參數
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_stci_m.stci014
                     LET g_chkparam.arg2 = g_stci_m.stci013                  
                     IF NOT cl_chk_exist("v_dbbc001_1") THEN
                        LET g_stci_m.stci013 = g_stci_m_o.stci013   #160824-00007#200 by lori mod:g_stci_m_t.stci013->g_stci_m_o.stci013
                        NEXT FIELD CURRENT
                     END IF                
                                   
                     SELECT dbbc003,dbbc004,dbbc005 
                       INTO g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017
                       FROM dbbc_t
                      WHERE dbbcent=g_enterprise
                        AND dbbc001=g_stci_m.stci014
                        AND dbbcstus='Y'
                        
                      DISPLAY BY NAME g_stci_m.stci015
                      DISPLAY BY NAME g_stci_m.stci016
                      DISPLAY BY NAME g_stci_m.stci017   
                   END IF                   
               
               END IF
            END IF
          

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci013_desc

            #160824-00007#200 by lori add---(S)
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci015
            CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci015_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci015_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci017_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci016
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci016_desc 
            
            LET g_stci_m_o.stci013 = g_stci_m.stci013
            LET g_stci_m_o.stci015 = g_stci_m.stci015
            LET g_stci_m_o.stci016 = g_stci_m.stci016
            LET g_stci_m_o.stci017 = g_stci_m.stci017
            #160824-00007#200 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci013
            #add-point:BEFORE FIELD stci013 name="input.b.stci013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci013
            #add-point:ON CHANGE stci013 name="input.g.stci013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci015
            
            #add-point:AFTER FIELD stci015 name="input.a.stci015"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci015
            CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci015_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci015_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci015
            #add-point:BEFORE FIELD stci015 name="input.b.stci015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci015
            #add-point:ON CHANGE stci015 name="input.g.stci015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci016
            
            #add-point:AFTER FIELD stci016 name="input.a.stci016"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci016
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci016_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci016
            #add-point:BEFORE FIELD stci016 name="input.b.stci016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci016
            #add-point:ON CHANGE stci016 name="input.g.stci016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci017
            
            #add-point:AFTER FIELD stci017 name="input.a.stci017"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci017_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci017
            #add-point:BEFORE FIELD stci017 name="input.b.stci017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci017
            #add-point:ON CHANGE stci017 name="input.g.stci017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci001
            #add-point:BEFORE FIELD stci001 name="input.b.stci001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci001
            
            #add-point:AFTER FIELD stci001 name="input.a.stci001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci001
            #add-point:ON CHANGE stci001 name="input.g.stci001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci008
            #add-point:BEFORE FIELD stci008 name="input.b.stci008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci008
            
            #add-point:AFTER FIELD stci008 name="input.a.stci008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci008
            #add-point:ON CHANGE stci008 name="input.g.stci008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcisite
            #add-point:BEFORE FIELD stcisite name="input.b.stcisite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcisite
            
            #add-point:AFTER FIELD stcisite name="input.a.stcisite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcisite
            #add-point:ON CHANGE stcisite name="input.g.stcisite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci018
            
            #add-point:AFTER FIELD stci018 name="input.a.stci018"
            IF  NOT cl_null(g_stci_m.stci018) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci018 != g_stci_m_t.stci018 )) THEN 
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stci_m.stci018                
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooaj002") THEN
                     LET g_stci_m.stci018 = g_stci_m_t.stci018
                     NEXT FIELD CURRENT
                  END IF

               END IF
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci018
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci018_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci018_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci018
            #add-point:BEFORE FIELD stci018 name="input.b.stci018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci018
            #add-point:ON CHANGE stci018 name="input.g.stci018"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci019
            
            #add-point:AFTER FIELD stci019 name="input.a.stci019"
            IF  NOT cl_null(g_stci_m.stci019) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stci_m.stci019 != g_stci_m_t.stci019 )) THEN 

                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_stci_m.stci019                  
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_oodb002") THEN
                     LET g_stci_m.stci019 = g_stci_m_t.stci019
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 

            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stci_m.stci019
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci019_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci019_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci019
            #add-point:BEFORE FIELD stci019 name="input.b.stci019"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci019
            #add-point:ON CHANGE stci019 name="input.g.stci019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci020
            #add-point:BEFORE FIELD stci020 name="input.b.stci020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci020
            
            #add-point:AFTER FIELD stci020 name="input.a.stci020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci020
            #add-point:ON CHANGE stci020 name="input.g.stci020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci021
            #add-point:BEFORE FIELD stci021 name="input.b.stci021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci021
            
            #add-point:AFTER FIELD stci021 name="input.a.stci021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci021
            #add-point:ON CHANGE stci021 name="input.g.stci021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci022
            #add-point:BEFORE FIELD stci022 name="input.b.stci022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci022
            
            #add-point:AFTER FIELD stci022 name="input.a.stci022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci022
            #add-point:ON CHANGE stci022 name="input.g.stci022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci023
            #add-point:BEFORE FIELD stci023 name="input.b.stci023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci023
            
            #add-point:AFTER FIELD stci023 name="input.a.stci023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci023
            #add-point:ON CHANGE stci023 name="input.g.stci023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci024
            #add-point:BEFORE FIELD stci024 name="input.b.stci024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci024
            
            #add-point:AFTER FIELD stci024 name="input.a.stci024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci024
            #add-point:ON CHANGE stci024 name="input.g.stci024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stci025
            #add-point:BEFORE FIELD stci025 name="input.b.stci025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stci025
            
            #add-point:AFTER FIELD stci025 name="input.a.stci025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stci025
            #add-point:ON CHANGE stci025 name="input.g.stci025"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stciunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stciunit
            #add-point:ON ACTION controlp INFIELD stciunit name="input.c.stciunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stciunit            #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stciunit',g_stci_m.stciunit,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()

            LET  g_stci_m.stciunit = g_qryparam.return1              

            DISPLAY g_stci_m.stciunit TO stciunit              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stciunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stciunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stciunit_desc
            
            NEXT FIELD stciunit                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stcidocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcidocdt
            #add-point:ON ACTION controlp INFIELD stcidocdt name="input.c.stcidocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcidocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcidocno
            #add-point:ON ACTION controlp INFIELD stcidocno name="input.c.stcidocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stcidocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise            
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #     
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stci_m.stcidocno = g_qryparam.return1              

            DISPLAY g_stci_m.stcidocno TO stcidocno              #

            NEXT FIELD stcidocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci000
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci000
            #add-point:ON ACTION controlp INFIELD stci000 name="input.c.stci000"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci000             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stce001_1()                                #呼叫開窗

            LET g_stci_m.stci000 = g_qryparam.return1              

            DISPLAY g_stci_m.stci000 TO stci000              #

            NEXT FIELD stci000                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci002
            #add-point:ON ACTION controlp INFIELD stci002 name="input.c.stci002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stci_m.stci002 = g_qryparam.return1              

            DISPLAY g_stci_m.stci002 TO stci002              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci002_desc
            NEXT FIELD stci002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci003
            #add-point:ON ACTION controlp INFIELD stci003 name="input.c.stci003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stci_m.stci003 = g_qryparam.return1              

            DISPLAY g_stci_m.stci003 TO stci003              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci003_desc
            NEXT FIELD stci003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci004
            #add-point:ON ACTION controlp INFIELD stci004 name="input.c.stci004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci005
            #add-point:ON ACTION controlp INFIELD stci005 name="input.c.stci005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci006
            #add-point:ON ACTION controlp INFIELD stci006 name="input.c.stci006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcistus
            #add-point:ON ACTION controlp INFIELD stcistus name="input.c.stcistus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci007
            #add-point:ON ACTION controlp INFIELD stci007 name="input.c.stci007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stci_m.stci007 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci007
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stci_m.stci007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci007_desc
            DISPLAY g_stci_m.stci007 TO stci007              #

            NEXT FIELD stci007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci009
            #add-point:ON ACTION controlp INFIELD stci009 name="input.c.stci009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

#            LET g_qryparam.default1 = g_stci_m.stci009             #給予default值
#            LET g_qryparam.default2 = "" #g_stci_m.ooefl003 #說明(簡稱)
#            #給予arg
#
#            
#            CALL q_ooef001_23() 
            IF s_aooi500_setpoint(g_prog,'stci009') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stci009',g_site,'i')   #150308-00001#5  By benson add 'i'
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.default1 = g_stci_m.stci009             #給予default值
               LET g_qryparam.default2 = "" #g_stci_m.ooefl003 #說明(簡稱)
               CALL q_ooef001_23()   
            END IF#呼叫開窗

            LET g_stci_m.stci009 = g_qryparam.return1              
            #LET g_stci_m.ooefl003 = g_qryparam.return2 
            DISPLAY g_stci_m.stci009 TO stci009              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci009_desc            
            #DISPLAY g_stci_m.ooefl003 TO ooefl003 #說明(簡稱)
            NEXT FIELD stci009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci010
            #add-point:ON ACTION controlp INFIELD stci010 name="input.c.stci010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci011
            #add-point:ON ACTION controlp INFIELD stci011 name="input.c.stci011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci012
            #add-point:ON ACTION controlp INFIELD stci012 name="input.c.stci012"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2" #

            
            CALL q_prcf001()                                #呼叫開窗

            LET g_stci_m.stci012 = g_qryparam.return1              

            DISPLAY g_stci_m.stci012 TO stci012              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci012
            CALL ap_ref_array2(g_ref_fields,"SELECT prcfl003 FROM prcfl_t WHERE prcflent='"||g_enterprise||"' AND prcfl001=? AND prcfl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci012_desc
            NEXT FIELD stci012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci014
            #add-point:ON ACTION controlp INFIELD stci014 name="input.c.stci014"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci014             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_dbbc001()                                #呼叫開窗

            LET g_stci_m.stci014 = g_qryparam.return1              

            DISPLAY g_stci_m.stci014 TO stci014              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci014
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci014_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci014_desc
            NEXT FIELD stci014                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stci013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci013
            #add-point:ON ACTION controlp INFIELD stci013 name="input.c.stci013"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci013             #給予default值

            #給予arg
#            LET g_qryparam.arg1 = g_site
#            LET g_qryparam.arg2 = "8" #
#
#            
#            CALL q_ooed004()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stci013') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stci013',g_site,'i')   #150308-00001#5  By benson add 'i'
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.arg1 = g_site
               LET g_qryparam.arg2 = "8" #
               CALL q_ooed004()  
            END IF#呼叫開窗
            LET g_stci_m.stci013 = g_qryparam.return1              

            DISPLAY g_stci_m.stci013 TO stci013              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci013_desc            

            NEXT FIELD stci013                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stci015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci015
            #add-point:ON ACTION controlp INFIELD stci015 name="input.c.stci015"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci016
            #add-point:ON ACTION controlp INFIELD stci016 name="input.c.stci016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci017
            #add-point:ON ACTION controlp INFIELD stci017 name="input.c.stci017"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci001
            #add-point:ON ACTION controlp INFIELD stci001 name="input.c.stci001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci008
            #add-point:ON ACTION controlp INFIELD stci008 name="input.c.stci008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcisite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcisite
            #add-point:ON ACTION controlp INFIELD stcisite name="input.c.stcisite"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci018
            #add-point:ON ACTION controlp INFIELD stci018 name="input.c.stci018"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci018             #給予default值

            #給予arg
            LET g_qryparam.arg1 =g_site #

            
            CALL q_ooaj002_3() 

            LET g_stci_m.stci018 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stci_m.stci018
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci018_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci018_desc
            NEXT FIELD stci018                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stci019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci019
            #add-point:ON ACTION controlp INFIELD stci019 name="input.c.stci019"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stci_m.stci019             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            
            CALL q_oodb002_8()                                #呼叫開窗

            LET g_stci_m.stci019 = g_qryparam.return1              
            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stci_m.stci019
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci019_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci019_desc
            NEXT FIELD stci019                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stci020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci020
            #add-point:ON ACTION controlp INFIELD stci020 name="input.c.stci020"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci021
            #add-point:ON ACTION controlp INFIELD stci021 name="input.c.stci021"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci022
            #add-point:ON ACTION controlp INFIELD stci022 name="input.c.stci022"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci023
            #add-point:ON ACTION controlp INFIELD stci023 name="input.c.stci023"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci024
            #add-point:ON ACTION controlp INFIELD stci024 name="input.c.stci024"
            
            #END add-point
 
 
         #Ctrlp:input.c.stci025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stci025
            #add-point:ON ACTION controlp INFIELD stci025 name="input.c.stci025"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stci_m.stcidocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_stci_m.stcidocno,g_stci_m.stcidocdt,g_prog) RETURNING l_success,g_stci_m.stcidocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stci_m.stcidocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG                  
               END IF 
               IF NOT cl_null(g_stci_m.stci003) THEN
                  LET g_stci_m.stci001='2' #網點
               ELSE
                  LET g_stci_m.stci001='1' #經銷商
               END IF
               #end add-point
               
               INSERT INTO stci_t (stcient,stciunit,stcidocdt,stcidocno,stci000,stci002,stci003,stci004, 
                   stci005,stci006,stcistus,stci007,stci009,stci010,stci011,stci012,stci014,stci013, 
                   stci015,stci016,stci017,stci001,stci008,stcisite,stci018,stci019,stci020,stci021, 
                   stci022,stci023,stci024,stci025,stciownid,stciowndp,stcicrtid,stcicrtdp,stcicrtdt, 
                   stcimodid,stcimoddt,stcicnfid,stcicnfdt)
               VALUES (g_enterprise,g_stci_m.stciunit,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000, 
                   g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005,g_stci_m.stci006, 
                   g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
                   g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016, 
                   g_stci_m.stci017,g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018, 
                   g_stci_m.stci019,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023, 
                   g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid,g_stci_m.stciowndp,g_stci_m.stcicrtid, 
                   g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid,g_stci_m.stcimoddt,g_stci_m.stcicnfid, 
                   g_stci_m.stcicnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stci_m:",SQLERRMESSAGE 
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
                  CALL astt620_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt620_b_fill()
                  CALL astt620_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               IF NOT cl_null(g_stci_m.stci003) THEN
                  LET g_stci_m.stci001='2' #網點
               ELSE
                  LET g_stci_m.stci001='1' #經銷商
               END IF                
               #end add-point
               
               #將遮罩欄位還原
               CALL astt620_stci_t_mask_restore('restore_mask_o')
               
               UPDATE stci_t SET (stciunit,stcidocdt,stcidocno,stci000,stci002,stci003,stci004,stci005, 
                   stci006,stcistus,stci007,stci009,stci010,stci011,stci012,stci014,stci013,stci015, 
                   stci016,stci017,stci001,stci008,stcisite,stci018,stci019,stci020,stci021,stci022, 
                   stci023,stci024,stci025,stciownid,stciowndp,stcicrtid,stcicrtdp,stcicrtdt,stcimodid, 
                   stcimoddt,stcicnfid,stcicnfdt) = (g_stci_m.stciunit,g_stci_m.stcidocdt,g_stci_m.stcidocno, 
                   g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
                   g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010, 
                   g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015, 
                   g_stci_m.stci016,g_stci_m.stci017,g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite, 
                   g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022, 
                   g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid,g_stci_m.stciowndp, 
                   g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid,g_stci_m.stcimoddt, 
                   g_stci_m.stcicnfid,g_stci_m.stcicnfdt)
                WHERE stcient = g_enterprise AND stcidocno = g_stcidocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stci_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               UPDATE stcj_t SET (stcj005,stcj006,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026) = 
                                 (g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci006,g_stci_m.stci005,g_stci_m.stci013,g_stci_m.stci014,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017)
                WHERE stcjent = g_enterprise AND stcjdocno = g_stcidocno_t
 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stcj_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
  
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               
               #幣別和稅別被修改
               IF g_stci_m.stci018 <> g_stci_m_t.stci018 THEN
                  CALL astt620_stci018_ref() RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = 'upd stcj'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG                  
                  END IF                  
               END IF 
               IF g_stci_m.stci019 <> g_stci_m_t.stci019 THEN
#                  CALL astt620_stci019_ref() RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = 'upd stcj'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG                  
                  END IF  
               END IF  
               #更新單頭的金額統計
               IF g_stci_m.stci018 <> g_stci_m_t.stci018 OR g_stci_m.stci019 <> g_stci_m_t.stci019 THEN
                  CALL astt620_stci023_ref() RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = 'upd stci'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG                  
                  END IF  
               END IF                 
                              
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt620_stci_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stci_m_t)
               LET g_log2 = util.JSON.stringify(g_stci_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stcidocno_t = g_stci_m.stcidocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt620.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stcj_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcj_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt620_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stcj_d.getLength()
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
            OPEN astt620_cl USING g_enterprise,g_stci_m.stcidocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt620_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt620_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcj_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcj_d[l_ac].stcjseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stcj_d_t.* = g_stcj_d[l_ac].*  #BACKUP
               LET g_stcj_d_o.* = g_stcj_d[l_ac].*  #BACKUP
               CALL astt620_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt620_set_no_entry_b(l_cmd)
               IF NOT astt620_lock_b("stcj_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt620_bcl INTO g_stcj_d[l_ac].stcjseq,g_stcj_d[l_ac].stcj001,g_stcj_d[l_ac].stcj002, 
                      g_stcj_d[l_ac].stcj003,g_stcj_d[l_ac].stcj004,g_stcj_d[l_ac].stcj005,g_stcj_d[l_ac].stcj006, 
                      g_stcj_d[l_ac].stcj007,g_stcj_d[l_ac].stcj008,g_stcj_d[l_ac].stcj009,g_stcj_d[l_ac].stcj010, 
                      g_stcj_d[l_ac].stcj011,g_stcj_d[l_ac].stcj012,g_stcj_d[l_ac].stcj013,g_stcj_d[l_ac].stcj015, 
                      g_stcj_d[l_ac].stcj014,g_stcj_d[l_ac].stcjsite,g_stcj_d[l_ac].stcj028,g_stcj_d[l_ac].stcj027, 
                      g_stcj_d[l_ac].stcj016,g_stcj_d[l_ac].stcj017,g_stcj_d[l_ac].stcj018,g_stcj_d[l_ac].stcj019, 
                      g_stcj_d[l_ac].stcj020,g_stcj_d[l_ac].stcj021,g_stcj_d[l_ac].stcj022,g_stcj_d[l_ac].stcj023, 
                      g_stcj_d[l_ac].stcj024,g_stcj_d[l_ac].stcj025,g_stcj_d[l_ac].stcj026,g_stcj_d[l_ac].stcjunit 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stcj_d_t.stcjseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcj_d_mask_o[l_ac].* =  g_stcj_d[l_ac].*
                  CALL astt620_stcj_t_mask()
                  LET g_stcj_d_mask_n[l_ac].* =  g_stcj_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt620_show()
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
            INITIALIZE g_stcj_d[l_ac].* TO NULL 
            INITIALIZE g_stcj_d_t.* TO NULL 
            INITIALIZE g_stcj_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stcj_d[l_ac].stcj013 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stcj_d_t.* = g_stcj_d[l_ac].*     #新輸入資料
            LET g_stcj_d_o.* = g_stcj_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt620_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt620_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcj_d[li_reproduce_target].* = g_stcj_d[li_reproduce].*
 
               LET g_stcj_d[li_reproduce_target].stcjseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            SELECT MAX(stcjseq) INTO g_stcj_d[l_ac].stcjseq
              FROM stcj_t
             WHERE stcjent= g_enterprise
               AND stcjdocno=  g_stci_m.stcidocno
            IF cl_null(g_stcj_d[l_ac].stcjseq) THEN
               LET g_stcj_d[l_ac].stcjseq=1
            ELSE
               LET  g_stcj_d[l_ac].stcjseq=g_stcj_d[l_ac].stcjseq+1
            END IF 
            DISPLAY g_stcj_d[l_ac].stcjseq TO stcjseq
            
            LET g_stcj_d[l_ac].stcj008=g_today          
            LET g_stcj_d[l_ac].stcj001='1'
            
            LET g_stcj_d[l_ac].stcj005=g_stci_m.stci018
            LET g_stcj_d[l_ac].stcj006=g_stci_m.stci019
            
               #带出税别名称
             SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stcj_d[l_ac].stcj006
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj006_desc
            
            LET g_stcj_d[l_ac].stcj014='1'
            LET g_stcj_d[l_ac].stcj015='2'
            LET g_stcj_d[l_ac].stcjsite=g_site
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcjsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcjsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcjsite_desc

            DISPLAY g_stcj_d[l_ac].stcj001 TO stcj001
            DISPLAY g_stcj_d[l_ac].stcj008 TO stcj008
            DISPLAY g_stcj_d[l_ac].stcj005 TO stcj005
            DISPLAY g_stcj_d[l_ac].stcj006 TO stcj006
            DISPLAY g_stcj_d[l_ac].stcj014 TO stcj014
            DISPLAY g_stcj_d[l_ac].stcj015 TO stcj015
            DISPLAY g_stcj_d[l_ac].stcjsite TO stcjsite
            
            LET g_stcj_d[l_ac].stcj017=g_stci_m.stci002
            LET g_stcj_d[l_ac].stcj018=g_stci_m.stci003
            LET g_stcj_d[l_ac].stcj019=g_stci_m.stci004
            LET g_stcj_d[l_ac].stcj020=g_stci_m.stci006
            LET g_stcj_d[l_ac].stcj021=g_stci_m.stci005
            LET g_stcj_d[l_ac].stcj022=g_stci_m.stci013
            LET g_stcj_d[l_ac].stcj023=g_stci_m.stci014
            LET g_stcj_d[l_ac].stcj024=g_stci_m.stci015
            LET g_stcj_d[l_ac].stcj025=g_stci_m.stci016
            LET g_stcj_d[l_ac].stcj026=g_stci_m.stci017
           
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
            SELECT COUNT(1) INTO l_count FROM stcj_t 
             WHERE stcjent = g_enterprise AND stcjdocno = g_stci_m.stcidocno
 
               AND stcjseq = g_stcj_d[l_ac].stcjseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stci_m.stcidocno
               LET gs_keys[2] = g_stcj_d[g_detail_idx].stcjseq
               CALL astt620_insert_b('stcj_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
 
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stcj_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt620_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               CALL astt620_stci023_ref() RETURNING l_success,l_errno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = 'upd stci'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CANCEL INSERT                  
               END IF
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
               LET gs_keys[01] = g_stci_m.stcidocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stcj_d_t.stcjseq
 
            
               #刪除同層單身
               IF NOT astt620_delete_b('stcj_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt620_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt620_key_delete_b(gs_keys,'stcj_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt620_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt620_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  CALL astt620_stci023_ref() RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = 'upd stci'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CANCEL DELETE                   
                  END IF
               #end add-point
               LET l_count = g_stcj_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcj_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stcj_d[l_ac].stcjseq,"1","1","","","azz-00079",1) THEN
               NEXT FIELD stcjseq
            END IF 
 
 
 
            #add-point:AFTER FIELD stcjseq name="input.a.page1.stcjseq"
            #此段落由子樣板a05產生
            IF  g_stci_m.stcidocno IS NOT NULL AND g_stcj_d[g_detail_idx].stcjseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stci_m.stcidocno != g_stcidocno_t OR g_stcj_d[g_detail_idx].stcjseq != g_stcj_d_t.stcjseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcj_t WHERE "||"stcjent = '" ||g_enterprise|| "' AND "||"stcjdocno = '"||g_stci_m.stcidocno ||"' AND "|| "stcjseq = '"||g_stcj_d[g_detail_idx].stcjseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjseq
            #add-point:BEFORE FIELD stcjseq name="input.b.page1.stcjseq"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcjseq
            #add-point:ON CHANGE stcjseq name="input.g.page1.stcjseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj001
            #add-point:BEFORE FIELD stcj001 name="input.b.page1.stcj001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj001
            
            #add-point:AFTER FIELD stcj001 name="input.a.page1.stcj001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj001
            #add-point:ON CHANGE stcj001 name="input.g.page1.stcj001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj002
            #add-point:BEFORE FIELD stcj002 name="input.b.page1.stcj002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj002
            
            #add-point:AFTER FIELD stcj002 name="input.a.page1.stcj002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj002
            #add-point:ON CHANGE stcj002 name="input.g.page1.stcj002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj003
            #add-point:BEFORE FIELD stcj003 name="input.b.page1.stcj003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj003
            
            #add-point:AFTER FIELD stcj003 name="input.a.page1.stcj003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj003
            #add-point:ON CHANGE stcj003 name="input.g.page1.stcj003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj004
            
            #add-point:AFTER FIELD stcj004 name="input.a.page1.stcj004"
            IF g_stcj_d[l_ac].stcj004 IS NOT NULL THEN 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcj004 != g_stcj_d_t.stcj004) THEN   #160824-00007#200 by lori mark
               IF g_stcj_d[l_ac].stcj004 != g_stcj_d_o.stcj004 OR cl_null(g_stcj_d_o.stcj004) THEN      #160824-00007#200 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stcj_d[l_ac].stcj004
                  IF NOT cl_chk_exist("v_stae001_1") THEN
                     LET g_stcj_d[l_ac].stcj004 = g_stcj_d_o.stcj004   #160824-00007#200 by lori mod:g_stcj_d_t.stcj004->g_stcj_d_o.stcj004
                     NEXT FIELD CURRENT
                  END IF
                  CALL astt620_stcj004_ref()   
               END IF
            END IF
            #權責發生制費用不可以跨月錄入 
            IF NOT cl_null(g_stcj_d[l_ac].stcj004) AND NOT cl_null(g_stcj_d[l_ac].stcj008) AND NOT cl_null(g_stcj_d[l_ac].stcj009) THEN
               LET l_stae005=''
               SELECT stae005 INTO l_stae005
                 FROM stae_t
                WHERE staeent=g_enterprise
                  AND stae001=g_stcj_d[l_ac].stcj004
                  AND staestus='Y'
               IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                  IF YEAR(g_stcj_d[l_ac].stcj009)-YEAR(g_stcj_d[l_ac].stcj008)>0 OR MONTH(g_stcj_d[l_ac].stcj009)-MONTH(g_stcj_d[l_ac].stcj008)>0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00084"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                       
                     LET g_stcj_d[l_ac].stcj004 =  g_stcj_d_o.stcj004   #160824-00007#200 by lori mod:g_stcj_d_t.stcj004->g_stcj_d_o.stcj004
                     
                     #160824-00007#200 by lori add---(S)
                     LET g_stcj_d[l_ac].stae003 = g_stcj_d_o.stae003
                     LET g_stcj_d[l_ac].stae004 = g_stcj_d_o.stae004
                     LET g_stcj_d[l_ac].stcj007 = g_stcj_d_o.stcj007
                     LET g_stcj_d[l_ac].stcj006 = g_stcj_d_o.stcj006
                     #160824-00007#200 by lori add---(E)
                     NEXT FIELD CURRENT
                  END IF   
               END IF
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcj004
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj004_desc

            LET g_stcj_d_o.stcj004 = g_stcj_d[l_ac].stcj004   #160824-00007#200 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj004
            #add-point:BEFORE FIELD stcj004 name="input.b.page1.stcj004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj004
            #add-point:ON CHANGE stcj004 name="input.g.page1.stcj004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj005
            
            #add-point:AFTER FIELD stcj005 name="input.a.page1.stcj005"
            IF g_stcj_d[l_ac].stcj005 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcj005 != g_stcj_d_t.stcj005) THEN 
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stcj_d[l_ac].stcj005                
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooaj002") THEN
                     LET g_stcj_d[l_ac].stcj005 = g_stcj_d_t.stcj005
                     NEXT FIELD CURRENT
                  END IF   
               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcj005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj005
            #add-point:BEFORE FIELD stcj005 name="input.b.page1.stcj005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj005
            #add-point:ON CHANGE stcj005 name="input.g.page1.stcj005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj006
            
            #add-point:AFTER FIELD stcj006 name="input.a.page1.stcj006"
            IF g_stcj_d[l_ac].stcj006 IS NOT NULL THEN 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcj006 != g_stcj_d_t.stcj006) THEN    #160824-00007#200 161122 by lori mark
               IF g_stcj_d[l_ac].stcj006 != g_stcj_d_o.stcj006 OR cl_null(g_stcj_d_o.stcj006) THEN       #160824-00007#200 161122 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stcj_d[l_ac].stcj006                
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_oodb002") THEN
                     LET g_stcj_d[l_ac].stcj006 = g_stcj_d_o.stcj006   #160824-00007#200 161122 by lori mod:_stcj_d_t.stcj006->_stcj_d_o.stcj006
                     NEXT FIELD CURRENT
                  END IF                    

               END IF
            END IF

            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stcj_d[l_ac].stcj006
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj006_desc

            LET g_stcj_d_o.stcj006 = g_stcj_d[l_ac].stcj006   #160824-00007#200 161122 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj006
            #add-point:BEFORE FIELD stcj006 name="input.b.page1.stcj006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj006
            #add-point:ON CHANGE stcj006 name="input.g.page1.stcj006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj007
            #add-point:BEFORE FIELD stcj007 name="input.b.page1.stcj007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj007
            
            #add-point:AFTER FIELD stcj007 name="input.a.page1.stcj007"
  
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj007
            #add-point:ON CHANGE stcj007 name="input.g.page1.stcj007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj008
            #add-point:BEFORE FIELD stcj008 name="input.b.page1.stcj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj008
            
            #add-point:AFTER FIELD stcj008 name="input.a.page1.stcj008"
            IF g_stcj_d[l_ac].stcj008 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcj008 != g_stcj_d_t.stcj008) THEN 
                  IF NOT cl_null(g_stcj_d[l_ac].stcj009) THEN
                     IF g_stcj_d[l_ac].stcj009<g_stcj_d[l_ac].stcj008 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ain-00128"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                       
                        LET g_stcj_d[l_ac].stcj008 =  g_stcj_d_t.stcj008
                        NEXT FIELD CURRENT
                     END IF
                     
                     #結算會計期計算\財務會計年度\財務會計期別
                     CALL astt620_stcj010_calculate()
                     
                  END IF                  
                  
               END IF
            END IF
            #權責發生制費用不可以跨月錄入 
            IF NOT cl_null(g_stcj_d[l_ac].stcj004) AND NOT cl_null(g_stcj_d[l_ac].stcj008) AND NOT cl_null(g_stcj_d[l_ac].stcj009) THEN
               LET l_stae005=''
               SELECT stae005 INTO l_stae005
                 FROM stae_t
                WHERE staeent=g_enterprise
                  AND stae001=g_stcj_d[l_ac].stcj004
                  AND staestus='Y'
               IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                  IF YEAR(g_stcj_d[l_ac].stcj009)-YEAR(g_stcj_d[l_ac].stcj008)>0 OR MONTH(g_stcj_d[l_ac].stcj009)-MONTH(g_stcj_d[l_ac].stcj008)>0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00084"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                       
                     LET g_stcj_d[l_ac].stcj008 =  g_stcj_d_t.stcj008
                     NEXT FIELD CURRENT
                  END IF   
               END IF
            END IF              
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj008
            #add-point:ON CHANGE stcj008 name="input.g.page1.stcj008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj009
            #add-point:BEFORE FIELD stcj009 name="input.b.page1.stcj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj009
            
            #add-point:AFTER FIELD stcj009 name="input.a.page1.stcj009"
            IF g_stcj_d[l_ac].stcj009 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcj009 != g_stcj_d_t.stcj009) THEN 
                  IF NOT cl_null(g_stcj_d[l_ac].stcj008) THEN
                     IF g_stcj_d[l_ac].stcj009<g_stcj_d[l_ac].stcj008 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ain-00128"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                       
                        LET g_stcj_d[l_ac].stcj009 =  g_stcj_d_t.stcj009
                        NEXT FIELD CURRENT
                     END IF
                     
                     #結算會計期計算\財務會計年度\財務會計期別
                     CALL astt620_stcj010_calculate()   
                     
                  END IF
                  #權責發生制費用不可以跨月錄入                  
                  IF NOT cl_null(g_stcj_d[l_ac].stcj004) AND NOT cl_null(g_stcj_d[l_ac].stcj008) AND NOT cl_null(g_stcj_d[l_ac].stcj009) THEN
                     LET l_stae005=''
                     SELECT stae005 INTO l_stae005
                       FROM stae_t
                      WHERE staeent=g_enterprise
                        AND stae001=g_stcj_d[l_ac].stcj004
                        AND staestus='Y'
                     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                        IF YEAR(g_stcj_d[l_ac].stcj009)-YEAR(g_stcj_d[l_ac].stcj008)>0 OR MONTH(g_stcj_d[l_ac].stcj009)-MONTH(g_stcj_d[l_ac].stcj008)>0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00084"
                           LET g_errparam.extend = ""
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                       
                           LET g_stcj_d[l_ac].stcj009 =  g_stcj_d_t.stcj009
                           NEXT FIELD CURRENT
                        END IF   
                     END IF
                  END IF                     
                  
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj009
            #add-point:ON CHANGE stcj009 name="input.g.page1.stcj009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj010
            #add-point:BEFORE FIELD stcj010 name="input.b.page1.stcj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj010
            
            #add-point:AFTER FIELD stcj010 name="input.a.page1.stcj010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj010
            #add-point:ON CHANGE stcj010 name="input.g.page1.stcj010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj011
            #add-point:BEFORE FIELD stcj011 name="input.b.page1.stcj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj011
            
            #add-point:AFTER FIELD stcj011 name="input.a.page1.stcj011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj011
            #add-point:ON CHANGE stcj011 name="input.g.page1.stcj011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj012
            #add-point:BEFORE FIELD stcj012 name="input.b.page1.stcj012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj012
            
            #add-point:AFTER FIELD stcj012 name="input.a.page1.stcj012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj012
            #add-point:ON CHANGE stcj012 name="input.g.page1.stcj012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj013
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stcj_d[l_ac].stcj013,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stcj013
            END IF 
 
 
 
            #add-point:AFTER FIELD stcj013 name="input.a.page1.stcj013"
            IF NOT cl_null(g_stcj_d[l_ac].stcj013) THEN
               CALL s_curr_round(g_stci_m.stci009,g_stci_m.stci018,g_stcj_d[l_ac].stcj013,'2') RETURNING g_stcj_d[l_ac].stcj013
               DISPLAY g_stcj_d[l_ac].stcj013 TO stcj013               
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj013
            #add-point:BEFORE FIELD stcj013 name="input.b.page1.stcj013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj013
            #add-point:ON CHANGE stcj013 name="input.g.page1.stcj013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj015
            #add-point:BEFORE FIELD stcj015 name="input.b.page1.stcj015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj015
            
            #add-point:AFTER FIELD stcj015 name="input.a.page1.stcj015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj015
            #add-point:ON CHANGE stcj015 name="input.g.page1.stcj015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj014
            #add-point:BEFORE FIELD stcj014 name="input.b.page1.stcj014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj014
            
            #add-point:AFTER FIELD stcj014 name="input.a.page1.stcj014"
    
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj014
            #add-point:ON CHANGE stcj014 name="input.g.page1.stcj014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjsite
            
            #add-point:AFTER FIELD stcjsite name="input.a.page1.stcjsite"
            IF NOT cl_null(g_stcj_d[l_ac].stcjsite) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcj_d[l_ac].stcjsite != g_stcj_d_t.stcjsite) THEN 
                  #161024-00025#5 -s by 08172
                  CALL s_aooi500_chk(g_prog,'stcjsite',g_stcj_d[l_ac].stcjsite,g_stci_m.stcisite)
                     RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stcj_d[l_ac].stcjsite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stcj_d[l_ac].stcjsite = g_stcj_d_t.stcjsite
                     NEXT FIELD CURRENT
                  END IF
                  #161024-00025#5 -e by 08172
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stcj_d[l_ac].stcjsite                 
                  #160318-00025#35  2016/04/15  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00095:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
                  #160318-00025#35  2016/04/15  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooef001") THEN
                     LET g_stcj_d[l_ac].stcjsite = g_stcj_d_t.stcjsite
                     NEXT FIELD CURRENT
                  END IF 

               END IF                        
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcjsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcjsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcjsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjsite
            #add-point:BEFORE FIELD stcjsite name="input.b.page1.stcjsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcjsite
            #add-point:ON CHANGE stcjsite name="input.g.page1.stcjsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj028
            #add-point:BEFORE FIELD stcj028 name="input.b.page1.stcj028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj028
            
            #add-point:AFTER FIELD stcj028 name="input.a.page1.stcj028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj028
            #add-point:ON CHANGE stcj028 name="input.g.page1.stcj028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj027
            #add-point:BEFORE FIELD stcj027 name="input.b.page1.stcj027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj027
            
            #add-point:AFTER FIELD stcj027 name="input.a.page1.stcj027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj027
            #add-point:ON CHANGE stcj027 name="input.g.page1.stcj027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj016
            #add-point:BEFORE FIELD stcj016 name="input.b.page1.stcj016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj016
            
            #add-point:AFTER FIELD stcj016 name="input.a.page1.stcj016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj016
            #add-point:ON CHANGE stcj016 name="input.g.page1.stcj016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj017
            #add-point:BEFORE FIELD stcj017 name="input.b.page1.stcj017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj017
            
            #add-point:AFTER FIELD stcj017 name="input.a.page1.stcj017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj017
            #add-point:ON CHANGE stcj017 name="input.g.page1.stcj017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj018
            #add-point:BEFORE FIELD stcj018 name="input.b.page1.stcj018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj018
            
            #add-point:AFTER FIELD stcj018 name="input.a.page1.stcj018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj018
            #add-point:ON CHANGE stcj018 name="input.g.page1.stcj018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj019
            #add-point:BEFORE FIELD stcj019 name="input.b.page1.stcj019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj019
            
            #add-point:AFTER FIELD stcj019 name="input.a.page1.stcj019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj019
            #add-point:ON CHANGE stcj019 name="input.g.page1.stcj019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj020
            #add-point:BEFORE FIELD stcj020 name="input.b.page1.stcj020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj020
            
            #add-point:AFTER FIELD stcj020 name="input.a.page1.stcj020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj020
            #add-point:ON CHANGE stcj020 name="input.g.page1.stcj020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj021
            #add-point:BEFORE FIELD stcj021 name="input.b.page1.stcj021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj021
            
            #add-point:AFTER FIELD stcj021 name="input.a.page1.stcj021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj021
            #add-point:ON CHANGE stcj021 name="input.g.page1.stcj021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj022
            #add-point:BEFORE FIELD stcj022 name="input.b.page1.stcj022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj022
            
            #add-point:AFTER FIELD stcj022 name="input.a.page1.stcj022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj022
            #add-point:ON CHANGE stcj022 name="input.g.page1.stcj022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj023
            #add-point:BEFORE FIELD stcj023 name="input.b.page1.stcj023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj023
            
            #add-point:AFTER FIELD stcj023 name="input.a.page1.stcj023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj023
            #add-point:ON CHANGE stcj023 name="input.g.page1.stcj023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj024
            #add-point:BEFORE FIELD stcj024 name="input.b.page1.stcj024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj024
            
            #add-point:AFTER FIELD stcj024 name="input.a.page1.stcj024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj024
            #add-point:ON CHANGE stcj024 name="input.g.page1.stcj024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj025
            #add-point:BEFORE FIELD stcj025 name="input.b.page1.stcj025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj025
            
            #add-point:AFTER FIELD stcj025 name="input.a.page1.stcj025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj025
            #add-point:ON CHANGE stcj025 name="input.g.page1.stcj025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcj026
            #add-point:BEFORE FIELD stcj026 name="input.b.page1.stcj026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcj026
            
            #add-point:AFTER FIELD stcj026 name="input.a.page1.stcj026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcj026
            #add-point:ON CHANGE stcj026 name="input.g.page1.stcj026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcjunit
            #add-point:BEFORE FIELD stcjunit name="input.b.page1.stcjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcjunit
            
            #add-point:AFTER FIELD stcjunit name="input.a.page1.stcjunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcjunit
            #add-point:ON CHANGE stcjunit name="input.g.page1.stcjunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stcjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjseq
            #add-point:ON ACTION controlp INFIELD stcjseq name="input.c.page1.stcjseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj001
            #add-point:ON ACTION controlp INFIELD stcj001 name="input.c.page1.stcj001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj002
            #add-point:ON ACTION controlp INFIELD stcj002 name="input.c.page1.stcj002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj003
            #add-point:ON ACTION controlp INFIELD stcj003 name="input.c.page1.stcj003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj004
            #add-point:ON ACTION controlp INFIELD stcj004 name="input.c.page1.stcj004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcj_d[l_ac].stcj004             #給予default值
            LET g_qryparam.default2 = "" #g_stcj_d[l_ac].stael004 #助記碼
            LET g_qryparam.default3 = "" #g_stcj_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stae001_3()                                #呼叫開窗

            LET g_stcj_d[l_ac].stcj004 = g_qryparam.return1              
            #LET g_stcj_d[l_ac].stael004 = g_qryparam.return2 
            #LET g_stcj_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stcj_d[l_ac].stcj004 TO stcj004              #
            #DISPLAY g_stcj_d[l_ac].stael004 TO stael004 #助記碼
            #DISPLAY g_stcj_d[l_ac].stael003 TO stael003 #說明
            CALL astt620_stcj004_ref()
            NEXT FIELD stcj004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj005
            #add-point:ON ACTION controlp INFIELD stcj005 name="input.c.page1.stcj005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcj_d[l_ac].stcj005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            
            CALL q_ooaj002_3()                                #呼叫開窗

            LET g_stcj_d[l_ac].stcj005 = g_qryparam.return1              

            DISPLAY g_stcj_d[l_ac].stcj005 TO stcj005              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcj005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj005_desc
            NEXT FIELD stcj005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj006
            #add-point:ON ACTION controlp INFIELD stcj006 name="input.c.page1.stcj006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcj_d[l_ac].stcj006             #給予default值
            LET g_qryparam.default2 = "" #g_stcj_d[l_ac].oodb002 #稅別代碼
            #給予arg
            LET g_qryparam.arg1 = g_site #

            
            CALL q_oodb002_8()                                #呼叫開窗

            LET g_stcj_d[l_ac].stcj006 = g_qryparam.return1              
            #LET g_stcj_d[l_ac].oodb002 = g_qryparam.return2 
            DISPLAY g_stcj_d[l_ac].stcj006 TO stcj006              #
            #DISPLAY g_stcj_d[l_ac].oodb002 TO oodb002 #稅別代碼

            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stcj_d[l_ac].stcj006
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj006_desc        
            NEXT FIELD stcj006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj007
            #add-point:ON ACTION controlp INFIELD stcj007 name="input.c.page1.stcj007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj008
            #add-point:ON ACTION controlp INFIELD stcj008 name="input.c.page1.stcj008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj009
            #add-point:ON ACTION controlp INFIELD stcj009 name="input.c.page1.stcj009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj010
            #add-point:ON ACTION controlp INFIELD stcj010 name="input.c.page1.stcj010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj011
            #add-point:ON ACTION controlp INFIELD stcj011 name="input.c.page1.stcj011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj012
            #add-point:ON ACTION controlp INFIELD stcj012 name="input.c.page1.stcj012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj013
            #add-point:ON ACTION controlp INFIELD stcj013 name="input.c.page1.stcj013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj015
            #add-point:ON ACTION controlp INFIELD stcj015 name="input.c.page1.stcj015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj014
            #add-point:ON ACTION controlp INFIELD stcj014 name="input.c.page1.stcj014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcjsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjsite
            #add-point:ON ACTION controlp INFIELD stcjsite name="input.c.page1.stcjsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcj_d[l_ac].stcjsite              #給予default值
            LET g_qryparam.default2 = "" #
            #給予arg
#            LET g_qryparam.arg1 = "" #
#
#            
#            CALL q_ooef001()                                #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcjsite',g_site,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24() 

            LET g_stcj_d[l_ac].stcjsite  = g_qryparam.return1     
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcjsite 
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcjsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcjsite_desc            
            DISPLAY g_stcj_d[l_ac].stcjsite TO stcjsite              #
            NEXT FIELD stcjsite                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj028
            #add-point:ON ACTION controlp INFIELD stcj028 name="input.c.page1.stcj028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj027
            #add-point:ON ACTION controlp INFIELD stcj027 name="input.c.page1.stcj027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj016
            #add-point:ON ACTION controlp INFIELD stcj016 name="input.c.page1.stcj016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj017
            #add-point:ON ACTION controlp INFIELD stcj017 name="input.c.page1.stcj017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj018
            #add-point:ON ACTION controlp INFIELD stcj018 name="input.c.page1.stcj018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj019
            #add-point:ON ACTION controlp INFIELD stcj019 name="input.c.page1.stcj019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj020
            #add-point:ON ACTION controlp INFIELD stcj020 name="input.c.page1.stcj020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj021
            #add-point:ON ACTION controlp INFIELD stcj021 name="input.c.page1.stcj021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj022
            #add-point:ON ACTION controlp INFIELD stcj022 name="input.c.page1.stcj022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj023
            #add-point:ON ACTION controlp INFIELD stcj023 name="input.c.page1.stcj023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj024
            #add-point:ON ACTION controlp INFIELD stcj024 name="input.c.page1.stcj024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj025
            #add-point:ON ACTION controlp INFIELD stcj025 name="input.c.page1.stcj025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcj026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcj026
            #add-point:ON ACTION controlp INFIELD stcj026 name="input.c.page1.stcj026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcjunit
            #add-point:ON ACTION controlp INFIELD stcjunit name="input.c.page1.stcjunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stcj_d[l_ac].* = g_stcj_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt620_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stcj_d[l_ac].stcjseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stcj_d[l_ac].* = g_stcj_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt620_stcj_t_mask_restore('restore_mask_o')
      
               UPDATE stcj_t SET (stcjdocno,stcjseq,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006, 
                   stcj007,stcj008,stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite, 
                   stcj028,stcj027,stcj016,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024, 
                   stcj025,stcj026,stcjunit) = (g_stci_m.stcidocno,g_stcj_d[l_ac].stcjseq,g_stcj_d[l_ac].stcj001, 
                   g_stcj_d[l_ac].stcj002,g_stcj_d[l_ac].stcj003,g_stcj_d[l_ac].stcj004,g_stcj_d[l_ac].stcj005, 
                   g_stcj_d[l_ac].stcj006,g_stcj_d[l_ac].stcj007,g_stcj_d[l_ac].stcj008,g_stcj_d[l_ac].stcj009, 
                   g_stcj_d[l_ac].stcj010,g_stcj_d[l_ac].stcj011,g_stcj_d[l_ac].stcj012,g_stcj_d[l_ac].stcj013, 
                   g_stcj_d[l_ac].stcj015,g_stcj_d[l_ac].stcj014,g_stcj_d[l_ac].stcjsite,g_stcj_d[l_ac].stcj028, 
                   g_stcj_d[l_ac].stcj027,g_stcj_d[l_ac].stcj016,g_stcj_d[l_ac].stcj017,g_stcj_d[l_ac].stcj018, 
                   g_stcj_d[l_ac].stcj019,g_stcj_d[l_ac].stcj020,g_stcj_d[l_ac].stcj021,g_stcj_d[l_ac].stcj022, 
                   g_stcj_d[l_ac].stcj023,g_stcj_d[l_ac].stcj024,g_stcj_d[l_ac].stcj025,g_stcj_d[l_ac].stcj026, 
                   g_stcj_d[l_ac].stcjunit)
                WHERE stcjent = g_enterprise AND stcjdocno = g_stci_m.stcidocno 
 
                  AND stcjseq = g_stcj_d_t.stcjseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcj_d[l_ac].* = g_stcj_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcj_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcj_d[l_ac].* = g_stcj_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stci_m.stcidocno
               LET gs_keys_bak[1] = g_stcidocno_t
               LET gs_keys[2] = g_stcj_d[g_detail_idx].stcjseq
               LET gs_keys_bak[2] = g_stcj_d_t.stcjseq
               CALL astt620_update_b('stcj_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt620_stcj_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stcj_d[g_detail_idx].stcjseq = g_stcj_d_t.stcjseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stci_m.stcidocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stcj_d_t.stcjseq
 
                  CALL astt620_key_update_b(gs_keys,'stcj_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stci_m),util.JSON.stringify(g_stcj_d_t)
               LET g_log2 = util.JSON.stringify(g_stci_m),util.JSON.stringify(g_stcj_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               CALL astt620_stci023_ref() RETURNING l_success,l_errno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = 'upd stci'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  
               END IF
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt620_unlock_b("stcj_t","'1'")
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
               LET g_stcj_d[li_reproduce_target].* = g_stcj_d[li_reproduce].*
 
               LET g_stcj_d[li_reproduce_target].stcjseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcj_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcj_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt620.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stciunit
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcjseq
 
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
            NEXT FIELD stcidocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcjseq
 
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
 
{<section id="astt620.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt620_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019 LIKE ooef_t.ooef019
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt620_b_fill() #單身填充
      CALL astt620_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt620_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"



            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stci_m.stci019
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stci_m.stci019_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stci_m.stci019_desc

            
   #end add-point
   
   #遮罩相關處理
   LET g_stci_m_mask_o.* =  g_stci_m.*
   CALL astt620_stci_t_mask()
   LET g_stci_m_mask_n.* =  g_stci_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000, 
       g_stci_m.stci002,g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc,g_stci_m.stci004, 
       g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci006,g_stci_m.stci006_desc,g_stci_m.stcistus, 
       g_stci_m.stci007,g_stci_m.stci007_desc,g_stci_m.stci009,g_stci_m.stci009_desc,g_stci_m.stci010, 
       g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci012_desc,g_stci_m.stci014,g_stci_m.stci014_desc, 
       g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci015,g_stci_m.stci015_desc,g_stci_m.stci016, 
       g_stci_m.stci016_desc,g_stci_m.stci017,g_stci_m.stci017_desc,g_stci_m.stci001,g_stci_m.stci008, 
       g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc,g_stci_m.stci019,g_stci_m.stci019_desc, 
       g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025, 
       g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid, 
       g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt 
 
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stci_m.stcistus 
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
   FOR l_ac = 1 TO g_stcj_d.getLength()
      #add-point:show段單身reference name="show.body.reference"


            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stcj004
            CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
            LET g_stcj_d[l_ac].stae004 = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stae003
            DISPLAY BY NAME g_stcj_d[l_ac].stae004

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcj_d[l_ac].stae003
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2058' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stae003_desc


            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_site  

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stcj_d[l_ac].stcj006
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcj_d[l_ac].stcj006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcj_d[l_ac].stcj006_desc


      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt620_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt620_detail_show()
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
 
{<section id="astt620.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt620_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stci_t.stcidocno 
   DEFINE l_oldno     LIKE stci_t.stcidocno 
 
   DEFINE l_master    RECORD LIKE stci_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stcj_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_stci_m.stcidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stcidocno_t = g_stci_m.stcidocno
 
    
   LET g_stci_m.stcidocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stci_m.stciownid = g_user
      LET g_stci_m.stciowndp = g_dept
      LET g_stci_m.stcicrtid = g_user
      LET g_stci_m.stcicrtdp = g_dept 
      LET g_stci_m.stcicrtdt = cl_get_current()
      LET g_stci_m.stcimodid = g_user
      LET g_stci_m.stcimoddt = cl_get_current()
      LET g_stci_m.stcistus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stci_m.stcistus 
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
   
   
   CALL astt620_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stci_m.* TO NULL
      INITIALIZE g_stcj_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt620_show()
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
   CALL astt620_set_act_visible()   
   CALL astt620_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcidocno_t = g_stci_m.stcidocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcient = " ||g_enterprise|| " AND",
                      " stcidocno = '", g_stci_m.stcidocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt620_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt620_idx_chk()
   
   LET g_data_owner = g_stci_m.stciownid      
   LET g_data_dept  = g_stci_m.stciowndp
   
   #功能已完成,通報訊息中心
   CALL astt620_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt620_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stcj_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt620_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcj_t
    WHERE stcjent = g_enterprise AND stcjdocno = g_stcidocno_t
 
    INTO TEMP astt620_detail
 
   #將key修正為調整後   
   UPDATE astt620_detail 
      #更新key欄位
      SET stcjdocno = g_stci_m.stcidocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stcj_t SELECT * FROM astt620_detail
   
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
   DROP TABLE astt620_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stcidocno_t = g_stci_m.stcidocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt620_delete()
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
   
   IF g_stci_m.stcidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt620_cl USING g_enterprise,g_stci_m.stcidocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt620_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt620_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt620_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stci_m_mask_o.* =  g_stci_m.*
   CALL astt620_stci_t_mask()
   LET g_stci_m_mask_n.* =  g_stci_m.*
   
   CALL astt620_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt620_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stcidocno_t = g_stci_m.stcidocno
 
 
      DELETE FROM stci_t
       WHERE stcient = g_enterprise AND stcidocno = g_stci_m.stcidocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stci_m.stcidocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stcj_t
       WHERE stcjent = g_enterprise AND stcjdocno = g_stci_m.stcidocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stci_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt620_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stcj_d.clear() 
 
     
      CALL astt620_ui_browser_refresh()  
      #CALL astt620_ui_headershow()  
      #CALL astt620_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt620_browser_fill("")
         CALL astt620_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt620_cl
 
   #功能已完成,通報訊息中心
   CALL astt620_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt620.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt620_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stcj_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt620_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcjseq,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006,stcj007, 
             stcj008,stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite,stcj028,stcj027, 
             stcj016,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026, 
             stcjunit ,t1.stael003 ,t2.ooail003 ,t3.ooefl003 FROM stcj_t",   
                     " INNER JOIN stci_t ON stcient = " ||g_enterprise|| " AND stcidocno = stcjdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stcj004 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t2 ON t2.ooailent="||g_enterprise||" AND t2.ooail001=stcj005 AND t2.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=stcjsite AND t3.ooefl002='"||g_dlang||"' ",
 
                     " WHERE stcjent=? AND stcjdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcj_t.stcjseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt620_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt620_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stci_m.stcidocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stci_m.stcidocno INTO g_stcj_d[l_ac].stcjseq,g_stcj_d[l_ac].stcj001, 
          g_stcj_d[l_ac].stcj002,g_stcj_d[l_ac].stcj003,g_stcj_d[l_ac].stcj004,g_stcj_d[l_ac].stcj005, 
          g_stcj_d[l_ac].stcj006,g_stcj_d[l_ac].stcj007,g_stcj_d[l_ac].stcj008,g_stcj_d[l_ac].stcj009, 
          g_stcj_d[l_ac].stcj010,g_stcj_d[l_ac].stcj011,g_stcj_d[l_ac].stcj012,g_stcj_d[l_ac].stcj013, 
          g_stcj_d[l_ac].stcj015,g_stcj_d[l_ac].stcj014,g_stcj_d[l_ac].stcjsite,g_stcj_d[l_ac].stcj028, 
          g_stcj_d[l_ac].stcj027,g_stcj_d[l_ac].stcj016,g_stcj_d[l_ac].stcj017,g_stcj_d[l_ac].stcj018, 
          g_stcj_d[l_ac].stcj019,g_stcj_d[l_ac].stcj020,g_stcj_d[l_ac].stcj021,g_stcj_d[l_ac].stcj022, 
          g_stcj_d[l_ac].stcj023,g_stcj_d[l_ac].stcj024,g_stcj_d[l_ac].stcj025,g_stcj_d[l_ac].stcj026, 
          g_stcj_d[l_ac].stcjunit,g_stcj_d[l_ac].stcj004_desc,g_stcj_d[l_ac].stcj005_desc,g_stcj_d[l_ac].stcjsite_desc  
            #(ver:78)
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
   
   CALL g_stcj_d.deleteElement(g_stcj_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt620_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stcj_d.getLength()
      LET g_stcj_d_mask_o[l_ac].* =  g_stcj_d[l_ac].*
      CALL astt620_stcj_t_mask()
      LET g_stcj_d_mask_n[l_ac].* =  g_stcj_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt620_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stcj_t
       WHERE stcjent = g_enterprise AND
         stcjdocno = ps_keys_bak[1] AND stcjseq = ps_keys_bak[2]
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
         CALL g_stcj_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt620_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stcj_t
                  (stcjent,
                   stcjdocno,
                   stcjseq
                   ,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006,stcj007,stcj008,stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite,stcj028,stcj027,stcj016,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026,stcjunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcj_d[g_detail_idx].stcj001,g_stcj_d[g_detail_idx].stcj002,g_stcj_d[g_detail_idx].stcj003, 
                       g_stcj_d[g_detail_idx].stcj004,g_stcj_d[g_detail_idx].stcj005,g_stcj_d[g_detail_idx].stcj006, 
                       g_stcj_d[g_detail_idx].stcj007,g_stcj_d[g_detail_idx].stcj008,g_stcj_d[g_detail_idx].stcj009, 
                       g_stcj_d[g_detail_idx].stcj010,g_stcj_d[g_detail_idx].stcj011,g_stcj_d[g_detail_idx].stcj012, 
                       g_stcj_d[g_detail_idx].stcj013,g_stcj_d[g_detail_idx].stcj015,g_stcj_d[g_detail_idx].stcj014, 
                       g_stcj_d[g_detail_idx].stcjsite,g_stcj_d[g_detail_idx].stcj028,g_stcj_d[g_detail_idx].stcj027, 
                       g_stcj_d[g_detail_idx].stcj016,g_stcj_d[g_detail_idx].stcj017,g_stcj_d[g_detail_idx].stcj018, 
                       g_stcj_d[g_detail_idx].stcj019,g_stcj_d[g_detail_idx].stcj020,g_stcj_d[g_detail_idx].stcj021, 
                       g_stcj_d[g_detail_idx].stcj022,g_stcj_d[g_detail_idx].stcj023,g_stcj_d[g_detail_idx].stcj024, 
                       g_stcj_d[g_detail_idx].stcj025,g_stcj_d[g_detail_idx].stcj026,g_stcj_d[g_detail_idx].stcjunit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stcj_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt620_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcj_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt620_stcj_t_mask_restore('restore_mask_o')
               
      UPDATE stcj_t 
         SET (stcjdocno,
              stcjseq
              ,stcj001,stcj002,stcj003,stcj004,stcj005,stcj006,stcj007,stcj008,stcj009,stcj010,stcj011,stcj012,stcj013,stcj015,stcj014,stcjsite,stcj028,stcj027,stcj016,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,stcj025,stcj026,stcjunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcj_d[g_detail_idx].stcj001,g_stcj_d[g_detail_idx].stcj002,g_stcj_d[g_detail_idx].stcj003, 
                  g_stcj_d[g_detail_idx].stcj004,g_stcj_d[g_detail_idx].stcj005,g_stcj_d[g_detail_idx].stcj006, 
                  g_stcj_d[g_detail_idx].stcj007,g_stcj_d[g_detail_idx].stcj008,g_stcj_d[g_detail_idx].stcj009, 
                  g_stcj_d[g_detail_idx].stcj010,g_stcj_d[g_detail_idx].stcj011,g_stcj_d[g_detail_idx].stcj012, 
                  g_stcj_d[g_detail_idx].stcj013,g_stcj_d[g_detail_idx].stcj015,g_stcj_d[g_detail_idx].stcj014, 
                  g_stcj_d[g_detail_idx].stcjsite,g_stcj_d[g_detail_idx].stcj028,g_stcj_d[g_detail_idx].stcj027, 
                  g_stcj_d[g_detail_idx].stcj016,g_stcj_d[g_detail_idx].stcj017,g_stcj_d[g_detail_idx].stcj018, 
                  g_stcj_d[g_detail_idx].stcj019,g_stcj_d[g_detail_idx].stcj020,g_stcj_d[g_detail_idx].stcj021, 
                  g_stcj_d[g_detail_idx].stcj022,g_stcj_d[g_detail_idx].stcj023,g_stcj_d[g_detail_idx].stcj024, 
                  g_stcj_d[g_detail_idx].stcj025,g_stcj_d[g_detail_idx].stcj026,g_stcj_d[g_detail_idx].stcjunit)  
 
         WHERE stcjent = g_enterprise AND stcjdocno = ps_keys_bak[1] AND stcjseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcj_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcj_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt620_stcj_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt620.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt620_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt620.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt620_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt620.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt620_lock_b(ps_table,ps_page)
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
   #CALL astt620_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stcj_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt620_bcl USING g_enterprise,
                                       g_stci_m.stcidocno,g_stcj_d[g_detail_idx].stcjseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt620_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt620.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt620_unlock_b(ps_table,ps_page)
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
      CLOSE astt620_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt620_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stcidocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stcidocno",TRUE)
      CALL cl_set_comp_entry("stcidocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stciunit",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt620_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_count LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stcidocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stcidocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stcidocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #161024-00025#5 -s by 08172
#   IF NOT s_aooi500_comp_entry(g_prog,'stciunit') THEN
#      CALL cl_set_comp_entry("stciunit",FALSE)
#   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stciunit') OR g_site_flag THEN
      CALL cl_set_comp_entry("stciunit",FALSE)
   END IF
   #161024-00025#5 -e by 08172
   CALL cl_set_comp_entry("stci014",FALSE)     #160913-00026#1  by 08172
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt620_set_entry_b(p_cmd)
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
   IF p_cmd='a' THEN  
      CALL cl_set_comp_entry('stj007',FALSE)
   END IF
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt620_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   DEFINE l_stae006 LIKE stae_t.stae006
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF p_cmd='u' THEN  
      LET l_stae006=''
      SELECT stae006 INTO l_stae006
        FROM stae_t 
       WHERE staeent=g_enterprise
         AND stae001=g_stcj_d[l_ac].stcj004
     IF NOT cl_null(l_stae006) AND l_stae006='3' THEN
        CALL cl_set_comp_entry("stcj007",TRUE)
        CALL cl_set_comp_required('stcj007',TRUE)
     END IF
     IF NOT cl_null(l_stae006) AND l_stae006<>'3' THEN
        CALL cl_set_comp_required('stcj007',FALSE)
        CALL cl_set_comp_entry("stcj007",FALSE)
     END IF          
      
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt620_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   IF g_stci_m.stci010 = '1'  THEN
      CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)
   END IF 
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt620_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stci_m.stcistus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF

   IF g_stci_m.stci010 != '1'  THEN
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF 
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt620_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt620.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt620_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt620.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt620_default_search()
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
      LET ls_wc = ls_wc, " stcidocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stci_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcj_t" 
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
 
{<section id="astt620.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt620_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stci_m.stcistus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stci_m.stcidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt620_cl USING g_enterprise,g_stci_m.stcidocno
   IF STATUS THEN
      CLOSE astt620_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt620_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
       g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
       g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
       g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
       g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
       g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
       g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
       g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
       g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
       g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid_desc, 
       g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt620_action_chk() THEN
      CLOSE astt620_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno,g_stci_m.stci000, 
       g_stci_m.stci002,g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc,g_stci_m.stci004, 
       g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci006,g_stci_m.stci006_desc,g_stci_m.stcistus, 
       g_stci_m.stci007,g_stci_m.stci007_desc,g_stci_m.stci009,g_stci_m.stci009_desc,g_stci_m.stci010, 
       g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci012_desc,g_stci_m.stci014,g_stci_m.stci014_desc, 
       g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci015,g_stci_m.stci015_desc,g_stci_m.stci016, 
       g_stci_m.stci016_desc,g_stci_m.stci017,g_stci_m.stci017_desc,g_stci_m.stci001,g_stci_m.stci008, 
       g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc,g_stci_m.stci019,g_stci_m.stci019_desc, 
       g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025, 
       g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp,g_stci_m.stciowndp_desc,g_stci_m.stcicrtid, 
       g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
       g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt 
 
 
   CASE g_stci_m.stcistus
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
         CASE g_stci_m.stcistus
            
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
     LET l_success = TRUE
     LET g_stci_m.stcicnfdt=cl_get_current()  
     LET g_stci_m.stcimoddt=cl_get_current()
     CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
     CALL cl_set_act_visible("signing,withdraw",FALSE)
         CASE g_stci_m.stcistus
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
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt620_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt620_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt620_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt620_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
         CALL s_astt620_conf_chk(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt620_conf_upd(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
               UPDATE stci_t SET stcicnfid ='',stcicnfdt='',stcimodid=g_user,stcimoddt=g_stci_m.stcimoddt
                    WHERE stcient = g_enterprise AND stcidocno = g_stci_m.stcidocno               
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stci_m.stcidocno
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
            LET g_errparam.extend = g_stci_m.stcidocno
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
         CALL s_astt620_conf_chk(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-014') THEN
               CALL s_transaction_begin()
               CALL s_astt620_conf_upd(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
               UPDATE stci_t SET stcicnfid=g_user,stcicnfdt=g_stci_m.stcicnfdt
                    WHERE stcient = g_enterprise AND stcidocno = g_stci_m.stcidocno               
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stci_m.stcidocno
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
            LET g_errparam.extend = g_stci_m.stcidocno
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
         CALL s_astt620_conf_chk(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt620_conf_upd(g_stci_m.stcidocno,lc_state) RETURNING l_success,l_errno
               UPDATE stci_t SET stcimodid=g_user,stcimoddt=g_stci_m.stcimoddt
                    WHERE stcient = g_enterprise AND stcidocno = g_stci_m.stcidocno               
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stci_m.stcidocno
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
            LET g_errparam.extend = g_stci_m.stcidocno
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
      g_stci_m.stcistus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt620_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stci_m.stcimodid = g_user
   LET g_stci_m.stcimoddt = cl_get_current()
   LET g_stci_m.stcistus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stci_t 
      SET (stcistus,stcimodid,stcimoddt) 
        = (g_stci_m.stcistus,g_stci_m.stcimodid,g_stci_m.stcimoddt)     
    WHERE stcient = g_enterprise AND stcidocno = g_stci_m.stcidocno
 
    
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
      EXECUTE astt620_master_referesh USING g_stci_m.stcidocno INTO g_stci_m.stciunit,g_stci_m.stcidocdt, 
          g_stci_m.stcidocno,g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005, 
          g_stci_m.stci006,g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci009,g_stci_m.stci010,g_stci_m.stci011, 
          g_stci_m.stci012,g_stci_m.stci014,g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017, 
          g_stci_m.stci001,g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci019,g_stci_m.stci020, 
          g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023,g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid, 
          g_stci_m.stciowndp,g_stci_m.stcicrtid,g_stci_m.stcicrtdp,g_stci_m.stcicrtdt,g_stci_m.stcimodid, 
          g_stci_m.stcimoddt,g_stci_m.stcicnfid,g_stci_m.stcicnfdt,g_stci_m.stciunit_desc,g_stci_m.stci002_desc, 
          g_stci_m.stci003_desc,g_stci_m.stci005_desc,g_stci_m.stci006_desc,g_stci_m.stci007_desc,g_stci_m.stci009_desc, 
          g_stci_m.stci012_desc,g_stci_m.stci014_desc,g_stci_m.stci013_desc,g_stci_m.stci015_desc,g_stci_m.stci016_desc, 
          g_stci_m.stci017_desc,g_stci_m.stci018_desc,g_stci_m.stciownid_desc,g_stci_m.stciowndp_desc, 
          g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp_desc,g_stci_m.stcimodid_desc,g_stci_m.stcicnfid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stci_m.stciunit,g_stci_m.stciunit_desc,g_stci_m.stcidocdt,g_stci_m.stcidocno, 
          g_stci_m.stci000,g_stci_m.stci002,g_stci_m.stci002_desc,g_stci_m.stci003,g_stci_m.stci003_desc, 
          g_stci_m.stci004,g_stci_m.stci005,g_stci_m.stci005_desc,g_stci_m.stci006,g_stci_m.stci006_desc, 
          g_stci_m.stcistus,g_stci_m.stci007,g_stci_m.stci007_desc,g_stci_m.stci009,g_stci_m.stci009_desc, 
          g_stci_m.stci010,g_stci_m.stci011,g_stci_m.stci012,g_stci_m.stci012_desc,g_stci_m.stci014, 
          g_stci_m.stci014_desc,g_stci_m.stci013,g_stci_m.stci013_desc,g_stci_m.stci015,g_stci_m.stci015_desc, 
          g_stci_m.stci016,g_stci_m.stci016_desc,g_stci_m.stci017,g_stci_m.stci017_desc,g_stci_m.stci001, 
          g_stci_m.stci008,g_stci_m.stcisite,g_stci_m.stci018,g_stci_m.stci018_desc,g_stci_m.stci019, 
          g_stci_m.stci019_desc,g_stci_m.stci020,g_stci_m.stci021,g_stci_m.stci022,g_stci_m.stci023, 
          g_stci_m.stci024,g_stci_m.stci025,g_stci_m.stciownid,g_stci_m.stciownid_desc,g_stci_m.stciowndp, 
          g_stci_m.stciowndp_desc,g_stci_m.stcicrtid,g_stci_m.stcicrtid_desc,g_stci_m.stcicrtdp,g_stci_m.stcicrtdp_desc, 
          g_stci_m.stcicrtdt,g_stci_m.stcimodid,g_stci_m.stcimodid_desc,g_stci_m.stcimoddt,g_stci_m.stcicnfid, 
          g_stci_m.stcicnfid_desc,g_stci_m.stcicnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt620_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt620_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt620.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt620_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stcj_d.getLength() THEN
         LET g_detail_idx = g_stcj_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcj_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcj_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt620_b_fill2(pi_idx)
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
   
   CALL astt620_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt620_fill_chk(ps_idx)
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
 
{<section id="astt620.status_show" >}
PRIVATE FUNCTION astt620_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt620.mask_functions" >}
&include "erp/ast/astt620_mask.4gl"
 
{</section>}
 
{<section id="astt620.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt620_send()
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
 
 
   CALL astt620_show()
   CALL astt620_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt620_conf_chk(g_stci_m.stcidocno,g_stci_m.stcistus) RETURNING l_success,l_errno
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = g_errno
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stci_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stcj_d))
 
 
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
   #CALL astt620_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt620_ui_headershow()
   CALL astt620_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt620_draw_out()
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
   CALL astt620_ui_headershow()  
   CALL astt620_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt620.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt620_set_pk_array()
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
   LET g_pk_array[1].values = g_stci_m.stcidocno
   LET g_pk_array[1].column = 'stcidocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt620.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt620.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt620_msgcentre_notify(lc_state)
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
   CALL astt620_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stci_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt620.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt620_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stcistus  INTO g_stci_m.stcistus
     FROM stci_t
    WHERE stcient = g_enterprise
      AND stcidocno = g_stci_m.stcidocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stci_m.stcistus
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
        LET g_errparam.extend = g_stci_m.stcidocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt620_set_act_visible()
        CALL astt620_set_act_no_visible()
        CALL astt620_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt620.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 費用編號帶出費用說明、費用總類、費用性質、稅別、價款類別
# Memo...........:
# Usage..........: CALL astt620_stcj004_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140526 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stcj004_ref()
DEFINE l_ooef019 LIKE ooef_t.ooef019

   LET g_stcj_d[l_ac].stae003=''
   LET g_stcj_d[l_ac].stae004=''
#   LET g_stcj_d[l_ac].stcj005=''
#   LET g_stcj_d[l_ac].stcj006=''
   LET g_stcj_d[l_ac].stcj007=''

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcj_d[l_ac].stcj004
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcj_d[l_ac].stcj004_desc = '', g_rtn_fields[1] , ''
   DISPLAY g_stcj_d[l_ac].stcj004_desc TO stcj004_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] =g_stcj_d[l_ac].stcj004
   CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004,stae006,stae010 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
   LET g_stcj_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
   LET g_stcj_d[l_ac].stae004 = '', g_rtn_fields[2] , ''
   LET g_stcj_d[l_ac].stcj007 = '', g_rtn_fields[3] , ''
  #LET g_stcj_d[l_ac].stcj006 = '', g_rtn_fields[4] , ''

   DISPLAY g_stcj_d[l_ac].stae003 TO stae003
   DISPLAY g_stcj_d[l_ac].stae004 TO stae004
   DISPLAY g_stcj_d[l_ac].stcj007 TO stcj007
   DISPLAY g_stcj_d[l_ac].stcj006 TO stcj006

   ##幣別
   #SELECT pmab033 INTO g_stcj_d[l_ac].stcj005
   #  FROM pmab_t
   # WHERE pmabent=g_enterprise
   #   AND pmabsite='ALL'
   #   AND pmab001=g_stci_m.stci002 
   ##稅別   
   #IF cl_null(g_stcj_d[l_ac].stcj006) THEN   
   #   SELECT pmab034 INTO g_stcj_d[l_ac].stcj006
   #     FROM pmab_t
   #    WHERE pmabent=g_enterprise
   #      AND pmabsite='ALL'
   #      AND pmab001=g_stci_m.stci002
   #END IF               
   #DISPLAY g_stcj_d[l_ac].stcj005 TO stcj005
   #DISPLAY g_stcj_d[l_ac].stcj006 TO stcj006

    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stcj_d[l_ac].stae003
    CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2058' AND oocql002 =? AND oocql003 ='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stcj_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stcj_d[l_ac].stae003_desc
   
   IF g_stcj_d[l_ac].stcj007='3' THEN
      CALL cl_set_comp_entry("stcj007",TRUE)
      CALL cl_set_comp_required('stcj007',TRUE)
      LET g_stcj_d[l_ac].stcj007=''
   ELSE
      CALL cl_set_comp_required('stcj007',FALSE)
      CALL cl_set_comp_entry("stcj007",FALSE)      
   END IF
    
   #160824-00007#200 161122 by lori add---(S)    
   LET g_stcj_d_o.stae003 = g_stcj_d[l_ac].stae003
   LET g_stcj_d_o.stae004 = g_stcj_d[l_ac].stae004
   LET g_stcj_d_o.stcj007 = g_stcj_d[l_ac].stcj007
   LET g_stcj_d_o.stcj006 = g_stcj_d[l_ac].stcj006
   #160824-00007#200 161122 by lori add---(E)    
END FUNCTION

################################################################################
# Descriptions...: 分銷合約帶出資料
# Memo...........:
# Usage..........: CALL astt620_stci000_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140613 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stci000_ref()
DEFINE  l_success             LIKE type_t.num5
DEFINE  l_errno               LIKE type_t.chr100
DEFINE  l_ooef019             LIKE ooef_t.ooef019

   #帶出經銷商、網點、經營方式、結算方式、結算類型、結算中心、幣別、稅別    
   SELECT stce009,stce010,stce005,stce006,stce007,stce024,stce021,stce022,stce028    #160913-00026#1 add stce028  by 08172
     INTO g_stci_m.stci002,g_stci_m.stci003,g_stci_m.stci004,g_stci_m.stci005,g_stci_m.stci006,
          g_stci_m.stci009,g_stci_m.stci018,g_stci_m.stci019,
          g_stci_m.stci014  #160913-00026#1 by 08172          
     FROM stce_t
    WHERE stceent=g_enterprise
      AND stce001=g_stci_m.stci000
      AND stcestus='Y' 
   #   AND stce017<=g_stci_m.stcidocdt
   #   AND stce018>=g_stci_m.stcidocdt     
 

   DISPLAY BY NAME g_stci_m.stci002   
   DISPLAY BY NAME g_stci_m.stci003 
   DISPLAY BY NAME g_stci_m.stci004 
   DISPLAY BY NAME g_stci_m.stci005 
   DISPLAY BY NAME g_stci_m.stci006
   DISPLAY BY NAME g_stci_m.stci009
   DISPLAY BY NAME g_stci_m.stci018
   DISPLAY BY NAME g_stci_m.stci019
   DISPLAY BY NAME g_stci_m.stci014     #160913-00026#1 by 08172
        
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci002_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci003
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci003_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci006
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci006_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci005
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci005_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci009
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci009_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci018
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci018_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci018_desc
   
   #160913-00026#1 -s by 08172
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci014
   CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci014_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci014_desc
   
   SELECT dbbc002,dbbc003,dbbc004,dbbc005 INTO g_stci_m.stci013,g_stci_m.stci015,g_stci_m.stci016,g_stci_m.stci017
     FROM dbbc_t
    WHERE dbbcent=g_enterprise
      AND dbbc001=g_stci_m.stci014
      AND dbbcstus='Y'
      
   DISPLAY BY NAME g_stci_m.stci013                     
   DISPLAY BY NAME g_stci_m.stci015
   DISPLAY BY NAME g_stci_m.stci016
   DISPLAY BY NAME g_stci_m.stci017 
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci013
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci013_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci013_desc
    
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci014
   CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci014_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci014_desc
    
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci015
   CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci015_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci015_desc
    
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci017
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci017_desc
    
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stci_m.stci016
   CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci016_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci016_desc 
   #160913-00026#1 -e by 08172
   
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t 
     WHERE ooefent = g_enterprise  AND ooef001 = g_site  
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooef019
   LET g_ref_fields[2] = g_stci_m.stci019
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stci_m.stci019_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stci_m.stci019_desc

   #160824-00007#200 161122 by lori add---(S)
   LET g_stci_m_o.stci002 = g_stci_m.stci002
   LET g_stci_m_o.stci003 = g_stci_m.stci003
   LET g_stci_m_o.stci004 = g_stci_m.stci004
   LET g_stci_m_o.stci005 = g_stci_m.stci005
   LET g_stci_m_o.stci006 = g_stci_m.stci006
   LET g_stci_m_o.stci009 = g_stci_m.stci009
   LET g_stci_m_o.stci018 = g_stci_m.stci018
   LET g_stci_m_o.stci019 = g_stci_m.stci019
   LET g_stci_m_o.stci014 = g_stci_m.stci014
   #160824-00007#200 161122 by lori add---(E)
END FUNCTION

################################################################################
# Descriptions...: 分銷合約檢查--根據合約編號、經銷商、網點、經營方式
# Memo...........:
# Usage..........: CALL astt620_stce001_check()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 20140613 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stce001_check()
DEFINE r_success        LIKE type_t.num5
DEFINE l_count          LIKE type_t.num5

  LET r_success=TRUE

  #合約\經銷商\網點\經營方式----1:合約\經銷商\經營方式
  IF NOT cl_null(g_stci_m.stci000) AND NOT cl_null(g_stci_m.stci002)  AND cl_null(g_stci_m.stci003) AND NOT cl_null(g_stci_m.stci004) THEN
     LET l_count=0
     SELECT COUNT(*) INTO l_count
       FROM stce_t
      WHERE stceent=g_enterprise
        AND stce001=g_stci_m.stci000
        AND stce009=g_stci_m.stci002
        AND stce005=g_stci_m.stci004
        AND stce010 IS NULL
        AND stcestus='Y' 
        AND stce017<=g_today
        AND stce018>=g_today
     IF cl_null(l_count) OR l_count=0 THEN
        LET r_success=FALSE
        RETURN r_success
     END IF                    
  END IF
  #合約\經銷商\網點\經營方式----2:合約\經銷商\網點\經營方式
  IF NOT cl_null(g_stci_m.stci000) AND NOT cl_null(g_stci_m.stci002)  AND NOT cl_null(g_stci_m.stci003) AND NOT cl_null(g_stci_m.stci004) THEN
     LET l_count=0
     SELECT COUNT(*) INTO l_count
       FROM stce_t
      WHERE stceent=g_enterprise
        AND stce001=g_stci_m.stci000
        AND stce009=g_stci_m.stci002
        AND stce010=g_stci_m.stci003
        AND stce005=g_stci_m.stci004
        AND stcestus='Y' 
        AND stce017<=g_today
        AND stce018>=g_today
     IF cl_null(l_count) OR l_count=0 THEN
        LET r_success=FALSE
        RETURN r_success
     END IF                 
  END IF


  RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 計算結算會計期、財務會計年度、財務會計期別
# Memo...........:
# Usage..........: CALL astt620_stcj010_calculate()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140625 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stcj010_calculate()
DEFINE l_flag      LIKE type_t.chr1
DEFINE l_success   LIKE type_t.num5



    IF cl_null(g_stcj_d[l_ac].stcj008) THEN
       RETURN
    END IF
    
    IF cl_null(g_stcj_d[l_ac].stcj009) THEN
       RETURN
    END IF  
    
#根據AST模組整體設定，結算會計期計算方式為1時，是使用開始日期，結算會計期計算方式為2時，是使用截止日期
#                     根據日期計算結算會計期（取年月），
#                     若此值小於asti206設置的結算會計期，結算會計期=asti206設置的結算會計期 
      
   #業務結算期
   CALL s_asti206_get_period(g_stcj_d[l_ac].stcj008,g_stcj_d[l_ac].stcj009,g_stci_m.stci009,'astt620') 
       RETURNING l_success,g_stcj_d[l_ac].stcj010,g_stcj_d[l_ac].stcj011,g_stcj_d[l_ac].stcj012
          
    DISPLAY g_stcj_d[l_ac].stcj010 TO stcj010
    DISPLAY g_stcj_d[l_ac].stcj011 TO stcj011
    DISPLAY g_stcj_d[l_ac].stcj012 TO stcj012 
    
END FUNCTION

################################################################################
# Descriptions...: 單頭幣別更改后，更新單身數據
# Memo...........:
# Usage..........: CALL astt620_stci018_ref()
# Input parameter: 
# Return code....: 1.r_success      处理状态TRUE/FALSE
#                  2.r_errno        錯誤訊息
# Date & Author..: 20140701 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stci018_ref()
DEFINE r_success      LIKE type_t.num5
DEFINE r_errno        LIKE type_t.chr100
DEFINE l_stcj013      LIKE stcj_t.stcj013
DEFINE l_stcjseq      LIKE stcj_t.stcjseq


   LET r_success=TRUE
   LET r_errno = NULL


   DECLARE astt620_stcj_curs2 CURSOR FOR
                   SELECT stcj_t.stcj013,stcj_t.stcjseq
                     FROM stcj_t
                    WHERE stcjent=g_enterprise
                      AND stcjdocno=g_stci_m.stcidocno


   FOREACH astt620_stcj_curs2 INTO l_stcj013,l_stcjseq

       IF cl_null(l_stcj013) THEN LET l_stcj013=0 END IF
       CALL s_curr_round(g_stci_m.stci009,g_stci_m.stci018,l_stcj013,'2') RETURNING l_stcj013

       UPDATE stcj_t SET stcj013=l_stcj013
        WHERE stcjent=g_enterprise
          AND stcjdocno=g_stci_m.stcidocno
          AND stcjseq=l_stcjseq 
       IF SQLCA.SQLcode THEN
         LET r_errno =SQLCA.sqlcode
         LET r_success=FALSE
         EXIT FOREACH
       END IF

   END FOREACH

   RETURN r_success,r_errno

END FUNCTION

################################################################################
# Descriptions...: 單身金額變化，更新單頭的金額匯總
# Memo...........:
# Usage..........: CALL astt620_stci023_ref()
# Input parameter: 
# Return code....: 1.r_success      处理状态TRUE/FALSE
#                  2.r_errno        錯誤訊息
# Date & Author..: 20140701 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt620_stci023_ref()
DEFINE r_success      LIKE type_t.num5
DEFINE r_errno        LIKE type_t.chr100


   LET r_success=TRUE
   LET r_errno = NULL



   SELECT SUM(stcj013) INTO g_stci_m.stci023
     FROM stcj_t
    WHERE stcjent=g_enterprise
      AND stcjdocno=g_stci_m.stcidocno
   
   SELECT SUM(stcj013) INTO g_stci_m.stci024
     FROM stcj_t
    WHERE stcjent=g_enterprise
      AND stcjdocno=g_stci_m.stcidocno
      AND stcj015='1'          
   
   SELECT SUM(stcj013) INTO g_stci_m.stci025
     FROM stcj_t
    WHERE stcjent=g_enterprise
      AND stcjdocno=g_stci_m.stcidocno
      AND stcj015='2'
      
   IF cl_null(g_stci_m.stci023) THEN
      LET g_stci_m.stci023=0
   END IF              
   IF cl_null(g_stci_m.stci024) THEN
      LET g_stci_m.stci024=0
   END IF                                       
   IF cl_null(g_stci_m.stci025) THEN
      LET g_stci_m.stci025=0
   END IF     
   
   CALL s_curr_round(g_stci_m.stci009,g_stci_m.stci018,g_stci_m.stci023,'2') RETURNING g_stci_m.stci023
   CALL s_curr_round(g_stci_m.stci009,g_stci_m.stci018,g_stci_m.stci024,'2') RETURNING g_stci_m.stci024
   CALL s_curr_round(g_stci_m.stci009,g_stci_m.stci018,g_stci_m.stci025,'2') RETURNING g_stci_m.stci025   
   
   IF cl_null(g_stci_m.stci023) THEN
      LET g_stci_m.stci023=0
   END IF              
   IF cl_null(g_stci_m.stci024) THEN
      LET g_stci_m.stci024=0
   END IF                                       
   IF cl_null(g_stci_m.stci025) THEN
      LET g_stci_m.stci025=0
   END IF    
      
   UPDATE stci_t SET stci023=g_stci_m.stci023,
                     stci024=g_stci_m.stci024,
                     stci025=g_stci_m.stci025
    WHERE stcient=g_enterprise
      AND stcidocno=g_stci_m.stcidocno
   IF SQLCA.SQLcode THEN
     LET r_errno =SQLCA.sqlcode
     LET r_success=FALSE
     RETURN r_success,r_errno
   END IF    
   
   DISPLAY BY NAME  g_stci_m.stci023 
   DISPLAY BY NAME  g_stci_m.stci024            
   DISPLAY BY NAME  g_stci_m.stci025 

   RETURN r_success,r_errno

END FUNCTION

################################################################################
# Descriptions...: 單頭稅別更改后，更新單身數據
# Memo...........:
# Usage..........: CALL astt620_stci019_ref()
# Input parameter:
# Return code....: 1.r_success      处理状态TRUE/FALSE
#                  2.r_errno        錯誤訊息
# Date & Author..: 20140701 By huangrh
# Modify.........:

################################################################################
PUBLIC FUNCTION astt620_stci019_ref()
#DEFINE l_stcj RECORD  LIKE stcj_t.*  #161111-00028#3--mark
#161111-00028#3---add----begin--------
DEFINE l_stcj RECORD  #分銷費用單明細資料表
       stcjent LIKE stcj_t.stcjent, #企業編號
       stcjunit LIKE stcj_t.stcjunit, #應用組織
       stcjsite LIKE stcj_t.stcjsite, #營運據點
       stcjdocno LIKE stcj_t.stcjdocno, #單據編號
       stcjseq LIKE stcj_t.stcjseq, #項次
       stcj001 LIKE stcj_t.stcj001, #來源類別
       stcj002 LIKE stcj_t.stcj002, #來源單號
       stcj003 LIKE stcj_t.stcj003, #來源項次
       stcj004 LIKE stcj_t.stcj004, #費用編號
       stcj005 LIKE stcj_t.stcj005, #幣別
       stcj006 LIKE stcj_t.stcj006, #稅別
       stcj007 LIKE stcj_t.stcj007, #價款類別
       stcj008 LIKE stcj_t.stcj008, #起始日期
       stcj009 LIKE stcj_t.stcj009, #截止日期
       stcj010 LIKE stcj_t.stcj010, #業務結算期
       stcj011 LIKE stcj_t.stcj011, #財務會計年度
       stcj012 LIKE stcj_t.stcj012, #財務會計期別
       stcj013 LIKE stcj_t.stcj013, #費用金額
       stcj014 LIKE stcj_t.stcj014, #結算對象
       stcj015 LIKE stcj_t.stcj015, #承擔對象
       stcj016 LIKE stcj_t.stcj016, #交易對象類別
       stcj017 LIKE stcj_t.stcj017, #經銷商
       stcj018 LIKE stcj_t.stcj018, #網點
       stcj019 LIKE stcj_t.stcj019, #經營方式
       stcj020 LIKE stcj_t.stcj020, #結算類別
       stcj021 LIKE stcj_t.stcj021, #結算方式
       stcj022 LIKE stcj_t.stcj022, #銷售組織
       stcj023 LIKE stcj_t.stcj023, #銷售範圍
       stcj024 LIKE stcj_t.stcj024, #銷售通路
       stcj025 LIKE stcj_t.stcj025, #產品組
       stcj026 LIKE stcj_t.stcj026, #辦事處
       stcj027 LIKE stcj_t.stcj027, #所屬品類
       stcj028 LIKE stcj_t.stcj028, #所屬部門
       stcj029 LIKE stcj_t.stcj029, #現返折扣類型
       stcj030 LIKE stcj_t.stcj030, #現返類型
       stcj031 LIKE stcj_t.stcj031, #現返摘要編號
       stcj032 LIKE stcj_t.stcj032, #現返已返金額
       stcj033 LIKE stcj_t.stcj033, #合約編號
       stcj034 LIKE stcj_t.stcj034, #合約折扣條件項次
       stcj035 LIKE stcj_t.stcj035  #現返理由碼
       END RECORD
#161111-00028#3---add----end----------
DEFINE l_oodb006      LIKE oodb_t.oodb006
DEFINE r_success      LIKE type_t.num5
DEFINE r_errno        LIKE type_t.chr100
DEFINE l_ooef019      LIKE ooef_t.ooef019

   LET r_success=TRUE
   LET r_errno = NULL

   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent=g_enterprise
      AND ooef001=g_stci_m.stciunit
   DECLARE astt620_stcj_curs CURSOR FOR
                #   SELECT stcj_t.*  #161111-00028#3--mark
                #161111-00028#3--add---begin-------
                    SELECT stcjent,stcjunit,stcjsite,stcjdocno,stcjseq,stcj001,stcj002,stcj003,stcj004,
                           stcj005,stcj006,stcj007,stcj008,stcj009,stcj010,stcj011,stcj012,stcj013,stcj014,
                           stcj015,stcj016,stcj017,stcj018,stcj019,stcj020,stcj021,stcj022,stcj023,stcj024,
                           stcj025,stcj026,stcj027,stcj028,stcj029,stcj030,stcj031,stcj032,stcj033,stcj034,stcj035
                #161111-00028#3--add---end---------
                     FROM stcj_t
                    WHERE stcjent=g_enterprise
                      AND stcjdocno=g_stci_m.stcidocno


   FOREACH astt620_stcj_curs INTO l_stcj.*

       SELECT oodb006 INTO l_oodb006
         FROM oodb_t
        WHERE oodbent=g_enterprise
          AND oodb001=l_ooef019
          AND oodb002=l_stcj.stcj006
       IF cl_null(l_oodb006) THEN LET l_oodb006=0 END IF
       IF l_stcj.stcj007='1' THEN
          LET l_stcj.stcj014=l_stcj.stcj013*(1+l_oodb006/100)
       END IF
       IF l_stcj.stcj007='2' THEN
          LET l_stcj.stcj013=l_stcj.stcj014/(1+l_oodb006/100)
       END IF
       IF cl_null(l_stcj.stcj013) THEN LET l_stcj.stcj013=0 END IF
       IF cl_null(l_stcj.stcj014) THEN LET l_stcj.stcj014=0 END IF

       UPDATE stcj_t SET stcj013=l_stcj.stcj013,
                         stcj014=l_stcj.stcj014
        WHERE stcjent=g_enterprise
          AND stcjdocno=l_stcj.stcjdocno
          AND stcjseq=l_stcj.stcjseq
       IF SQLCA.SQLcode THEN
         LET r_errno =SQLCA.sqlcode
         LET r_success=FALSE
         EXIT FOREACH
       END IF

   END FOREACH

   RETURN r_success,r_errno

END FUNCTION

 
{</section>}
 
