#該程式未解開Section, 採用最新樣板產出!
{<section id="astt604.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0012(2014-11-28 13:26:22), PR版次:0012(2016-11-16 15:56:29)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000089
#+ Filename...: astt604
#+ Description: 市場推廣活動申請
#+ Creator....: 03247(2014-11-28 13:25:13)
#+ Modifier...: 03247 -SD/PR- 02481
 
{</section>}
 
{<section id="astt604.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00005#45  2016/03/26  By pengxin    修正azzi920重复定义之错误讯息
#160318-00025#35  2016/04/15  By pengxin    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160816-00068#17  2016/08/19  By 08209      調整transaction
#160818-00017#40  2016-08-30  By 08734      删除修改未重新判断状态码
#160905-00007#3   2016/09/05 By zhujing     调整系统中无ENT的SQL条件增加ent
#161111-00028#3   2016/11/16   by 02481   标准程式定义采用宣告模式,弃用.*写法
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
PRIVATE type type_g_stcx_m        RECORD
       stcxsite LIKE stcx_t.stcxsite, 
   stcxsite_desc LIKE type_t.chr80, 
   stcxdocdt LIKE stcx_t.stcxdocdt, 
   stcxdocno LIKE stcx_t.stcxdocno, 
   stcx001 LIKE stcx_t.stcx001, 
   stcx001_desc LIKE type_t.chr80, 
   stcx002 LIKE stcx_t.stcx002, 
   stcx002_desc LIKE type_t.chr80, 
   stcx003 LIKE stcx_t.stcx003, 
   stcx003_desc LIKE type_t.chr80, 
   stcx004 LIKE stcx_t.stcx004, 
   stcx004_desc LIKE type_t.chr80, 
   stcx005 LIKE stcx_t.stcx005, 
   stcx005_desc LIKE type_t.chr80, 
   stcxunit LIKE stcx_t.stcxunit, 
   stcxstus LIKE stcx_t.stcxstus, 
   stcx006 LIKE stcx_t.stcx006, 
   stcx007 LIKE stcx_t.stcx007, 
   amount LIKE type_t.num20_6, 
   stcx008 LIKE stcx_t.stcx008, 
   stcx009 LIKE stcx_t.stcx009, 
   stcx009_desc LIKE type_t.chr80, 
   stcx010 LIKE stcx_t.stcx010, 
   stcx010_desc LIKE type_t.chr80, 
   stcx011 LIKE stcx_t.stcx011, 
   stcx011_desc LIKE type_t.chr80, 
   ooff013 LIKE type_t.chr500, 
   stcxownid LIKE stcx_t.stcxownid, 
   stcxownid_desc LIKE type_t.chr80, 
   stcxowndp LIKE stcx_t.stcxowndp, 
   stcxowndp_desc LIKE type_t.chr80, 
   stcxcrtid LIKE stcx_t.stcxcrtid, 
   stcxcrtid_desc LIKE type_t.chr80, 
   stcxcrtdp LIKE stcx_t.stcxcrtdp, 
   stcxcrtdp_desc LIKE type_t.chr80, 
   stcxcrtdt LIKE stcx_t.stcxcrtdt, 
   stcxmodid LIKE stcx_t.stcxmodid, 
   stcxmodid_desc LIKE type_t.chr80, 
   stcxmoddt LIKE stcx_t.stcxmoddt, 
   stcxcnfid LIKE stcx_t.stcxcnfid, 
   stcxcnfid_desc LIKE type_t.chr80, 
   stcxcnfdt LIKE stcx_t.stcxcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stcy_d        RECORD
       stcyseq LIKE stcy_t.stcyseq, 
   stcy001 LIKE stcy_t.stcy001, 
   stcy002 LIKE stcy_t.stcy002, 
   stcy003 LIKE stcy_t.stcy003, 
   stcy003_desc LIKE type_t.chr500, 
   stcy004 LIKE stcy_t.stcy004, 
   stcy004_desc LIKE type_t.chr500, 
   stcy005 LIKE stcy_t.stcy005, 
   stcy006 LIKE stcy_t.stcy006, 
   stcy007 LIKE stcy_t.stcy007, 
   stcy008 LIKE stcy_t.stcy008, 
   stcy009 LIKE stcy_t.stcy009, 
   stcy010 LIKE stcy_t.stcy010, 
   stcy011 LIKE stcy_t.stcy011, 
   stcy012 LIKE stcy_t.stcy012, 
   stcy013 LIKE stcy_t.stcy013, 
   stcy014 LIKE stcy_t.stcy014, 
   stcy015 LIKE stcy_t.stcy015, 
   stcy016 LIKE stcy_t.stcy016, 
   stcy017 LIKE stcy_t.stcy017, 
   stcy018 LIKE stcy_t.stcy018, 
   stcy019 LIKE stcy_t.stcy019, 
   stcy020 LIKE stcy_t.stcy020, 
   stcy021 LIKE stcy_t.stcy021, 
   stcy022 LIKE stcy_t.stcy022, 
   stcy023 LIKE stcy_t.stcy023, 
   stcysite LIKE stcy_t.stcysite, 
   stcyunit LIKE stcy_t.stcyunit
       END RECORD
PRIVATE TYPE type_g_stcy2_d RECORD
       stczseq LIKE stcz_t.stczseq, 
   stcz001 LIKE stcz_t.stcz001, 
   stcz002 LIKE stcz_t.stcz002, 
   stcz003 LIKE stcz_t.stcz003, 
   stcz003_desc LIKE type_t.chr500, 
   stcz005 LIKE stcz_t.stcz005, 
   stcz004 LIKE stcz_t.stcz004, 
   stcz004_desc LIKE type_t.chr500, 
   stcz006 LIKE stcz_t.stcz006, 
   stcz007 LIKE stcz_t.stcz007, 
   stcz007_desc LIKE type_t.chr500, 
   stcz008 LIKE stcz_t.stcz008, 
   stcz009 LIKE stcz_t.stcz009, 
   stczsite LIKE stcz_t.stczsite, 
   stczunit LIKE stcz_t.stczunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stcxsite LIKE stcx_t.stcxsite,
   b_stcxsite_desc LIKE type_t.chr80,
      b_stcxdocdt LIKE stcx_t.stcxdocdt,
      b_stcxdocno LIKE stcx_t.stcxdocno,
      b_stcx001 LIKE stcx_t.stcx001,
   b_stcx001_desc LIKE type_t.chr80,
      b_stcx002 LIKE stcx_t.stcx002,
   b_stcx002_desc LIKE type_t.chr80,
      b_stcx003 LIKE stcx_t.stcx003,
   b_stcx003_desc LIKE type_t.chr80,
      b_stcx004 LIKE stcx_t.stcx004,
   b_stcx004_desc LIKE type_t.chr80,
      b_stcx005 LIKE stcx_t.stcx005,
   b_stcx005_desc LIKE type_t.chr80,
      b_stcx006 LIKE stcx_t.stcx006,
      b_stcx007 LIKE stcx_t.stcx007,
      b_stcx008 LIKE stcx_t.stcx008,
      b_stcx009 LIKE stcx_t.stcx009,
   b_stcx009_desc LIKE type_t.chr80,
      b_stcx010 LIKE stcx_t.stcx010,
   b_stcx010_desc LIKE type_t.chr80,
      b_stcx011 LIKE stcx_t.stcx011,
   b_stcx011_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_ooef004      LIKE ooef_t.ooef004
DEFINE g_ooef005      LIKE ooef_t.ooef005
DEFINE g_assign_no    LIKE type_t.chr1
DEFINE g_flag2        LIKE type_t.num5
DEFINE g_site_flag   LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stcx_m          type_g_stcx_m
DEFINE g_stcx_m_t        type_g_stcx_m
DEFINE g_stcx_m_o        type_g_stcx_m
DEFINE g_stcx_m_mask_o   type_g_stcx_m #轉換遮罩前資料
DEFINE g_stcx_m_mask_n   type_g_stcx_m #轉換遮罩後資料
 
   DEFINE g_stcxdocno_t LIKE stcx_t.stcxdocno
 
 
DEFINE g_stcy_d          DYNAMIC ARRAY OF type_g_stcy_d
DEFINE g_stcy_d_t        type_g_stcy_d
DEFINE g_stcy_d_o        type_g_stcy_d
DEFINE g_stcy_d_mask_o   DYNAMIC ARRAY OF type_g_stcy_d #轉換遮罩前資料
DEFINE g_stcy_d_mask_n   DYNAMIC ARRAY OF type_g_stcy_d #轉換遮罩後資料
DEFINE g_stcy2_d          DYNAMIC ARRAY OF type_g_stcy2_d
DEFINE g_stcy2_d_t        type_g_stcy2_d
DEFINE g_stcy2_d_o        type_g_stcy2_d
DEFINE g_stcy2_d_mask_o   DYNAMIC ARRAY OF type_g_stcy2_d #轉換遮罩前資料
DEFINE g_stcy2_d_mask_n   DYNAMIC ARRAY OF type_g_stcy2_d #轉換遮罩後資料
 
 
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
 
{<section id="astt604.main" >}
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
   LET g_forupd_sql = " SELECT stcxsite,'',stcxdocdt,stcxdocno,stcx001,'',stcx002,'',stcx003,'',stcx004, 
       '',stcx005,'',stcxunit,stcxstus,stcx006,stcx007,'',stcx008,stcx009,'',stcx010,'',stcx011,'','', 
       stcxownid,'',stcxowndp,'',stcxcrtid,'',stcxcrtdp,'',stcxcrtdt,stcxmodid,'',stcxmoddt,stcxcnfid, 
       '',stcxcnfdt", 
                      " FROM stcx_t",
                      " WHERE stcxent= ? AND stcxdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt604_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stcxsite,t0.stcxdocdt,t0.stcxdocno,t0.stcx001,t0.stcx002,t0.stcx003, 
       t0.stcx004,t0.stcx005,t0.stcxunit,t0.stcxstus,t0.stcx006,t0.stcx007,t0.stcx008,t0.stcx009,t0.stcx010, 
       t0.stcx011,t0.stcxownid,t0.stcxowndp,t0.stcxcrtid,t0.stcxcrtdp,t0.stcxcrtdt,t0.stcxmodid,t0.stcxmoddt, 
       t0.stcxcnfid,t0.stcxcnfdt,t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 , 
       t7.pmaal004 ,t8.ooail003 ,t9.ooag011 ,t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 ,t13.ooag011 ,t14.ooag011", 
 
               " FROM stcx_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcxsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stcx001 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stcx002 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stcx003 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stcx004  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stcx005 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t7 ON t7.pmaalent="||g_enterprise||" AND t7.pmaal001=t0.stcx009 AND t7.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stcx010 AND t8.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stcxownid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stcxowndp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stcxcrtid  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stcxcrtdp AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stcxmodid  ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.stcxcnfid  ",
 
               " WHERE t0.stcxent = " ||g_enterprise|| " AND t0.stcxdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt604_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt604 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt604_init()   
 
      #進入選單 Menu (="N")
      CALL astt604_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt604
      
   END IF 
   
   CLOSE astt604_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt604.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt604_init()
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
      CALL cl_set_combo_scc_part('stcxstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stcy005','6006') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stcy005','6006','1,2') 
   LET g_ooef004 = ''
   LET g_ooef005 = ''
   SELECT ooef004,ooef005 INTO g_ooef004,g_ooef005 FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site
   IF cl_null(g_ooef004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00007'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF 
   IF cl_null(g_ooef005) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00008'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt604_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt604.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt604_ui_dialog()
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
            CALL astt604_insert()
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
         INITIALIZE g_stcx_m.* TO NULL
         CALL g_stcy_d.clear()
         CALL g_stcy2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt604_init()
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
               
               CALL astt604_fetch('') # reload data
               LET l_ac = 1
               CALL astt604_ui_detailshow() #Setting the current row 
         
               CALL astt604_idx_chk()
               #NEXT FIELD stcyseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stcy_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt604_idx_chk()
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
               CALL astt604_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stcy2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt604_idx_chk()
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
               CALL astt604_idx_chk()
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
            CALL astt604_browser_fill("")
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
               CALL astt604_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt604_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt604_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt604_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt604_set_act_visible()   
            CALL astt604_set_act_no_visible()
            IF NOT (g_stcx_m.stcxdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stcxent = " ||g_enterprise|| " AND",
                                  " stcxdocno = '", g_stcx_m.stcxdocno, "' "
 
               #填到對應位置
               CALL astt604_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stcx_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcy_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcz_t" 
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
               CALL astt604_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stcx_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcy_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcz_t" 
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
                  CALL astt604_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt604_fetch("F")
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
               CALL astt604_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt604_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt604_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt604_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt604_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt604_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt604_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt604_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt604_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt604_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt604_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stcy_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stcy2_d)
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
               NEXT FIELD stcyseq
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
               CALL astt604_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt604_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt604_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt604_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt604_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt604_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt604_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt604_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt604_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt604_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt604_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stcx_m.stcxdocdt)
 
 
 
         
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
 
{<section id="astt604.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt604_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stcxsite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   #ken---add---end
   LET l_wc  = g_wc.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stcxdocno ",
                      " FROM stcx_t ",
                      " ",
                      " LEFT JOIN stcy_t ON stcyent = stcxent AND stcxdocno = stcydocno ", "  ",
                      #add-point:browser_fill段sql(stcy_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stcz_t ON stczent = stcxent AND stcxdocno = stczdocno", "  ",
                      #add-point:browser_fill段sql(stcz_t1) name="browser_fill.cnt.join.stcz_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stcxent = " ||g_enterprise|| " AND stcyent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stcx_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stcxdocno ",
                      " FROM stcx_t ", 
                      "  ",
                      "  ",
                      " WHERE stcxent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stcx_t")
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
      INITIALIZE g_stcx_m.* TO NULL
      CALL g_stcy_d.clear()        
      CALL g_stcy2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stcxsite,t0.stcxdocdt,t0.stcxdocno,t0.stcx001,t0.stcx002,t0.stcx003,t0.stcx004,t0.stcx005,t0.stcx006,t0.stcx007,t0.stcx008,t0.stcx009,t0.stcx010,t0.stcx011 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcxstus,t0.stcxsite,t0.stcxdocdt,t0.stcxdocno,t0.stcx001,t0.stcx002, 
          t0.stcx003,t0.stcx004,t0.stcx005,t0.stcx006,t0.stcx007,t0.stcx008,t0.stcx009,t0.stcx010,t0.stcx011, 
          t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 ,t7.pmaal004 , 
          t8.ooail003 ",
                  " FROM stcx_t t0",
                  "  ",
                  "  LEFT JOIN stcy_t ON stcyent = stcxent AND stcxdocno = stcydocno ", "  ", 
                  #add-point:browser_fill段sql(stcy_t1) name="browser_fill.join.stcy_t1"
                  
                  #end add-point
                  "  LEFT JOIN stcz_t ON stczent = stcxent AND stcxdocno = stczdocno", "  ", 
                  #add-point:browser_fill段sql(stcz_t1) name="browser_fill.join.stcz_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcxsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stcx001 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stcx002 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stcx003 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stcx004  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stcx005 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t7 ON t7.pmaalent="||g_enterprise||" AND t7.pmaal001=t0.stcx009 AND t7.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stcx010 AND t8.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcxent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stcx_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcxstus,t0.stcxsite,t0.stcxdocdt,t0.stcxdocno,t0.stcx001,t0.stcx002, 
          t0.stcx003,t0.stcx004,t0.stcx005,t0.stcx006,t0.stcx007,t0.stcx008,t0.stcx009,t0.stcx010,t0.stcx011, 
          t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 ,t7.pmaal004 , 
          t8.ooail003 ",
                  " FROM stcx_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcxsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stcx001 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stcx002 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stcx003 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stcx004  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stcx005 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t7 ON t7.pmaalent="||g_enterprise||" AND t7.pmaal001=t0.stcx009 AND t7.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stcx010 AND t8.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcxent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stcx_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
  
   #end add-point
   LET g_sql = g_sql, " ORDER BY stcxdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stcx_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stcxsite,g_browser[g_cnt].b_stcxdocdt, 
          g_browser[g_cnt].b_stcxdocno,g_browser[g_cnt].b_stcx001,g_browser[g_cnt].b_stcx002,g_browser[g_cnt].b_stcx003, 
          g_browser[g_cnt].b_stcx004,g_browser[g_cnt].b_stcx005,g_browser[g_cnt].b_stcx006,g_browser[g_cnt].b_stcx007, 
          g_browser[g_cnt].b_stcx008,g_browser[g_cnt].b_stcx009,g_browser[g_cnt].b_stcx010,g_browser[g_cnt].b_stcx011, 
          g_browser[g_cnt].b_stcxsite_desc,g_browser[g_cnt].b_stcx001_desc,g_browser[g_cnt].b_stcx002_desc, 
          g_browser[g_cnt].b_stcx003_desc,g_browser[g_cnt].b_stcx004_desc,g_browser[g_cnt].b_stcx005_desc, 
          g_browser[g_cnt].b_stcx009_desc,g_browser[g_cnt].b_stcx010_desc
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
         CALL astt604_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stcxdocno) THEN
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
 
{<section id="astt604.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt604_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stcx_m.stcxdocno = g_browser[g_current_idx].b_stcxdocno   
 
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
   CALL astt604_stcx_t_mask()
   CALL astt604_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt604.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt604_ui_detailshow()
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
 
{<section id="astt604.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt604_ui_browser_refresh()
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
      IF g_browser[l_i].b_stcxdocno = g_stcx_m.stcxdocno 
 
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
 
{<section id="astt604.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt604_construct()
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
   INITIALIZE g_stcx_m.* TO NULL
   CALL g_stcy_d.clear()        
   CALL g_stcy2_d.clear() 
 
   
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
      CONSTRUCT BY NAME g_wc ON stcxsite,stcxdocdt,stcxdocno,stcx001,stcx002,stcx003,stcx004,stcx005, 
          stcxunit,stcxstus,stcx006,stcx007,stcx008,stcx009,stcx010,stcx011,ooff013,stcxownid,stcxowndp, 
          stcxcrtid,stcxcrtdp,stcxcrtdt,stcxmodid,stcxmoddt,stcxcnfid,stcxcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stcxcrtdt>>----
         AFTER FIELD stcxcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stcxmoddt>>----
         AFTER FIELD stcxmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcxcnfdt>>----
         AFTER FIELD stcxcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcxpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stcxsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxsite
            #add-point:ON ACTION controlp INFIELD stcxsite name="construct.c.stcxsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcxsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stcxsite  #顯示到畫面上
            NEXT FIELD stcxsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxsite
            #add-point:BEFORE FIELD stcxsite name="construct.b.stcxsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxsite
            
            #add-point:AFTER FIELD stcxsite name="construct.a.stcxsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxdocdt
            #add-point:BEFORE FIELD stcxdocdt name="construct.b.stcxdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxdocdt
            
            #add-point:AFTER FIELD stcxdocdt name="construct.a.stcxdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxdocdt
            #add-point:ON ACTION controlp INFIELD stcxdocdt name="construct.c.stcxdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcxdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxdocno
            #add-point:ON ACTION controlp INFIELD stcxdocno name="construct.c.stcxdocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stcxdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxdocno  #顯示到畫面上
            NEXT FIELD stcxdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxdocno
            #add-point:BEFORE FIELD stcxdocno name="construct.b.stcxdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxdocno
            
            #add-point:AFTER FIELD stcxdocno name="construct.a.stcxdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx001
            #add-point:ON ACTION controlp INFIELD stcx001 name="construct.c.stcx001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2'
            CALL q_prcd001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx001  #顯示到畫面上
            NEXT FIELD stcx001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx001
            #add-point:BEFORE FIELD stcx001 name="construct.b.stcx001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx001
            
            #add-point:AFTER FIELD stcx001 name="construct.a.stcx001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx002
            #add-point:ON ACTION controlp INFIELD stcx002 name="construct.c.stcx002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx002  #顯示到畫面上
            NEXT FIELD stcx002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx002
            #add-point:BEFORE FIELD stcx002 name="construct.b.stcx002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx002
            
            #add-point:AFTER FIELD stcx002 name="construct.a.stcx002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx003
            #add-point:ON ACTION controlp INFIELD stcx003 name="construct.c.stcx003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx003  #顯示到畫面上
            NEXT FIELD stcx003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx003
            #add-point:BEFORE FIELD stcx003 name="construct.b.stcx003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx003
            
            #add-point:AFTER FIELD stcx003 name="construct.a.stcx003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx004
            #add-point:ON ACTION controlp INFIELD stcx004 name="construct.c.stcx004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx004  #顯示到畫面上
            NEXT FIELD stcx004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx004
            #add-point:BEFORE FIELD stcx004 name="construct.b.stcx004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx004
            
            #add-point:AFTER FIELD stcx004 name="construct.a.stcx004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx005
            #add-point:ON ACTION controlp INFIELD stcx005 name="construct.c.stcx005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx005  #顯示到畫面上
            NEXT FIELD stcx005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx005
            #add-point:BEFORE FIELD stcx005 name="construct.b.stcx005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx005
            
            #add-point:AFTER FIELD stcx005 name="construct.a.stcx005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxunit
            #add-point:BEFORE FIELD stcxunit name="construct.b.stcxunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxunit
            
            #add-point:AFTER FIELD stcxunit name="construct.a.stcxunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxunit
            #add-point:ON ACTION controlp INFIELD stcxunit name="construct.c.stcxunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxstus
            #add-point:BEFORE FIELD stcxstus name="construct.b.stcxstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxstus
            
            #add-point:AFTER FIELD stcxstus name="construct.a.stcxstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxstus
            #add-point:ON ACTION controlp INFIELD stcxstus name="construct.c.stcxstus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx006
            #add-point:BEFORE FIELD stcx006 name="construct.b.stcx006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx006
            
            #add-point:AFTER FIELD stcx006 name="construct.a.stcx006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx006
            #add-point:ON ACTION controlp INFIELD stcx006 name="construct.c.stcx006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx007
            #add-point:BEFORE FIELD stcx007 name="construct.b.stcx007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx007
            
            #add-point:AFTER FIELD stcx007 name="construct.a.stcx007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx007
            #add-point:ON ACTION controlp INFIELD stcx007 name="construct.c.stcx007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcx008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx008
            #add-point:ON ACTION controlp INFIELD stcx008 name="construct.c.stcx008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx008  #顯示到畫面上
            NEXT FIELD stcx008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx008
            #add-point:BEFORE FIELD stcx008 name="construct.b.stcx008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx008
            
            #add-point:AFTER FIELD stcx008 name="construct.a.stcx008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx009
            #add-point:ON ACTION controlp INFIELD stcx009 name="construct.c.stcx009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx009  #顯示到畫面上
            NEXT FIELD stcx009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx009
            #add-point:BEFORE FIELD stcx009 name="construct.b.stcx009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx009
            
            #add-point:AFTER FIELD stcx009 name="construct.a.stcx009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx010
            #add-point:ON ACTION controlp INFIELD stcx010 name="construct.c.stcx010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx010  #顯示到畫面上
            NEXT FIELD stcx010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx010
            #add-point:BEFORE FIELD stcx010 name="construct.b.stcx010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx010
            
            #add-point:AFTER FIELD stcx010 name="construct.a.stcx010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcx011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx011
            #add-point:ON ACTION controlp INFIELD stcx011 name="construct.c.stcx011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcx011  #顯示到畫面上
            NEXT FIELD stcx011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx011
            #add-point:BEFORE FIELD stcx011 name="construct.b.stcx011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx011
            
            #add-point:AFTER FIELD stcx011 name="construct.a.stcx011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="construct.b.ooff013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013
            
            #add-point:AFTER FIELD ooff013 name="construct.a.ooff013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.ooff013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="construct.c.ooff013"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcxownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxownid
            #add-point:ON ACTION controlp INFIELD stcxownid name="construct.c.stcxownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxownid  #顯示到畫面上
            NEXT FIELD stcxownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxownid
            #add-point:BEFORE FIELD stcxownid name="construct.b.stcxownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxownid
            
            #add-point:AFTER FIELD stcxownid name="construct.a.stcxownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxowndp
            #add-point:ON ACTION controlp INFIELD stcxowndp name="construct.c.stcxowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxowndp  #顯示到畫面上
            NEXT FIELD stcxowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxowndp
            #add-point:BEFORE FIELD stcxowndp name="construct.b.stcxowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxowndp
            
            #add-point:AFTER FIELD stcxowndp name="construct.a.stcxowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxcrtid
            #add-point:ON ACTION controlp INFIELD stcxcrtid name="construct.c.stcxcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxcrtid  #顯示到畫面上
            NEXT FIELD stcxcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxcrtid
            #add-point:BEFORE FIELD stcxcrtid name="construct.b.stcxcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxcrtid
            
            #add-point:AFTER FIELD stcxcrtid name="construct.a.stcxcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcxcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxcrtdp
            #add-point:ON ACTION controlp INFIELD stcxcrtdp name="construct.c.stcxcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxcrtdp  #顯示到畫面上
            NEXT FIELD stcxcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxcrtdp
            #add-point:BEFORE FIELD stcxcrtdp name="construct.b.stcxcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxcrtdp
            
            #add-point:AFTER FIELD stcxcrtdp name="construct.a.stcxcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxcrtdt
            #add-point:BEFORE FIELD stcxcrtdt name="construct.b.stcxcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcxmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxmodid
            #add-point:ON ACTION controlp INFIELD stcxmodid name="construct.c.stcxmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxmodid  #顯示到畫面上
            NEXT FIELD stcxmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxmodid
            #add-point:BEFORE FIELD stcxmodid name="construct.b.stcxmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxmodid
            
            #add-point:AFTER FIELD stcxmodid name="construct.a.stcxmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxmoddt
            #add-point:BEFORE FIELD stcxmoddt name="construct.b.stcxmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcxcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxcnfid
            #add-point:ON ACTION controlp INFIELD stcxcnfid name="construct.c.stcxcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcxcnfid  #顯示到畫面上
            NEXT FIELD stcxcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxcnfid
            #add-point:BEFORE FIELD stcxcnfid name="construct.b.stcxcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxcnfid
            
            #add-point:AFTER FIELD stcxcnfid name="construct.a.stcxcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxcnfdt
            #add-point:BEFORE FIELD stcxcnfdt name="construct.b.stcxcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stcyseq,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006,stcy007,stcy008, 
          stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018,stcy019,stcy020, 
          stcy021,stcy022,stcy023,stcysite,stcyunit
           FROM s_detail1[1].stcyseq,s_detail1[1].stcy001,s_detail1[1].stcy002,s_detail1[1].stcy003, 
               s_detail1[1].stcy004,s_detail1[1].stcy005,s_detail1[1].stcy006,s_detail1[1].stcy007,s_detail1[1].stcy008, 
               s_detail1[1].stcy009,s_detail1[1].stcy010,s_detail1[1].stcy011,s_detail1[1].stcy012,s_detail1[1].stcy013, 
               s_detail1[1].stcy014,s_detail1[1].stcy015,s_detail1[1].stcy016,s_detail1[1].stcy017,s_detail1[1].stcy018, 
               s_detail1[1].stcy019,s_detail1[1].stcy020,s_detail1[1].stcy021,s_detail1[1].stcy022,s_detail1[1].stcy023, 
               s_detail1[1].stcysite,s_detail1[1].stcyunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcyseq
            #add-point:BEFORE FIELD stcyseq name="construct.b.page1.stcyseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcyseq
            
            #add-point:AFTER FIELD stcyseq name="construct.a.page1.stcyseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcyseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcyseq
            #add-point:ON ACTION controlp INFIELD stcyseq name="construct.c.page1.stcyseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy001
            #add-point:BEFORE FIELD stcy001 name="construct.b.page1.stcy001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy001
            
            #add-point:AFTER FIELD stcy001 name="construct.a.page1.stcy001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy001
            #add-point:ON ACTION controlp INFIELD stcy001 name="construct.c.page1.stcy001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy002
            #add-point:BEFORE FIELD stcy002 name="construct.b.page1.stcy002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy002
            
            #add-point:AFTER FIELD stcy002 name="construct.a.page1.stcy002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy002
            #add-point:ON ACTION controlp INFIELD stcy002 name="construct.c.page1.stcy002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stcy003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy003
            #add-point:ON ACTION controlp INFIELD stcy003 name="construct.c.page1.stcy003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcy003  #顯示到畫面上
            NEXT FIELD stcy003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy003
            #add-point:BEFORE FIELD stcy003 name="construct.b.page1.stcy003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy003
            
            #add-point:AFTER FIELD stcy003 name="construct.a.page1.stcy003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy004
            #add-point:ON ACTION controlp INFIELD stcy004 name="construct.c.page1.stcy004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcy004  #顯示到畫面上
            NEXT FIELD stcy004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy004
            #add-point:BEFORE FIELD stcy004 name="construct.b.page1.stcy004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy004
            
            #add-point:AFTER FIELD stcy004 name="construct.a.page1.stcy004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy005
            #add-point:BEFORE FIELD stcy005 name="construct.b.page1.stcy005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy005
            
            #add-point:AFTER FIELD stcy005 name="construct.a.page1.stcy005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy005
            #add-point:ON ACTION controlp INFIELD stcy005 name="construct.c.page1.stcy005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy006
            #add-point:BEFORE FIELD stcy006 name="construct.b.page1.stcy006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy006
            
            #add-point:AFTER FIELD stcy006 name="construct.a.page1.stcy006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy006
            #add-point:ON ACTION controlp INFIELD stcy006 name="construct.c.page1.stcy006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy007
            #add-point:BEFORE FIELD stcy007 name="construct.b.page1.stcy007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy007
            
            #add-point:AFTER FIELD stcy007 name="construct.a.page1.stcy007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy007
            #add-point:ON ACTION controlp INFIELD stcy007 name="construct.c.page1.stcy007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy008
            #add-point:BEFORE FIELD stcy008 name="construct.b.page1.stcy008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy008
            
            #add-point:AFTER FIELD stcy008 name="construct.a.page1.stcy008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy008
            #add-point:ON ACTION controlp INFIELD stcy008 name="construct.c.page1.stcy008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy009
            #add-point:BEFORE FIELD stcy009 name="construct.b.page1.stcy009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy009
            
            #add-point:AFTER FIELD stcy009 name="construct.a.page1.stcy009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy009
            #add-point:ON ACTION controlp INFIELD stcy009 name="construct.c.page1.stcy009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy010
            #add-point:BEFORE FIELD stcy010 name="construct.b.page1.stcy010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy010
            
            #add-point:AFTER FIELD stcy010 name="construct.a.page1.stcy010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy010
            #add-point:ON ACTION controlp INFIELD stcy010 name="construct.c.page1.stcy010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy011
            #add-point:BEFORE FIELD stcy011 name="construct.b.page1.stcy011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy011
            
            #add-point:AFTER FIELD stcy011 name="construct.a.page1.stcy011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy011
            #add-point:ON ACTION controlp INFIELD stcy011 name="construct.c.page1.stcy011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy012
            #add-point:BEFORE FIELD stcy012 name="construct.b.page1.stcy012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy012
            
            #add-point:AFTER FIELD stcy012 name="construct.a.page1.stcy012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy012
            #add-point:ON ACTION controlp INFIELD stcy012 name="construct.c.page1.stcy012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy013
            #add-point:BEFORE FIELD stcy013 name="construct.b.page1.stcy013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy013
            
            #add-point:AFTER FIELD stcy013 name="construct.a.page1.stcy013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy013
            #add-point:ON ACTION controlp INFIELD stcy013 name="construct.c.page1.stcy013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy014
            #add-point:BEFORE FIELD stcy014 name="construct.b.page1.stcy014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy014
            
            #add-point:AFTER FIELD stcy014 name="construct.a.page1.stcy014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy014
            #add-point:ON ACTION controlp INFIELD stcy014 name="construct.c.page1.stcy014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy015
            #add-point:BEFORE FIELD stcy015 name="construct.b.page1.stcy015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy015
            
            #add-point:AFTER FIELD stcy015 name="construct.a.page1.stcy015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy015
            #add-point:ON ACTION controlp INFIELD stcy015 name="construct.c.page1.stcy015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy016
            #add-point:BEFORE FIELD stcy016 name="construct.b.page1.stcy016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy016
            
            #add-point:AFTER FIELD stcy016 name="construct.a.page1.stcy016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy016
            #add-point:ON ACTION controlp INFIELD stcy016 name="construct.c.page1.stcy016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy017
            #add-point:BEFORE FIELD stcy017 name="construct.b.page1.stcy017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy017
            
            #add-point:AFTER FIELD stcy017 name="construct.a.page1.stcy017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy017
            #add-point:ON ACTION controlp INFIELD stcy017 name="construct.c.page1.stcy017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy018
            #add-point:BEFORE FIELD stcy018 name="construct.b.page1.stcy018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy018
            
            #add-point:AFTER FIELD stcy018 name="construct.a.page1.stcy018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy018
            #add-point:ON ACTION controlp INFIELD stcy018 name="construct.c.page1.stcy018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy019
            #add-point:BEFORE FIELD stcy019 name="construct.b.page1.stcy019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy019
            
            #add-point:AFTER FIELD stcy019 name="construct.a.page1.stcy019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy019
            #add-point:ON ACTION controlp INFIELD stcy019 name="construct.c.page1.stcy019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy020
            #add-point:BEFORE FIELD stcy020 name="construct.b.page1.stcy020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy020
            
            #add-point:AFTER FIELD stcy020 name="construct.a.page1.stcy020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy020
            #add-point:ON ACTION controlp INFIELD stcy020 name="construct.c.page1.stcy020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy021
            #add-point:BEFORE FIELD stcy021 name="construct.b.page1.stcy021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy021
            
            #add-point:AFTER FIELD stcy021 name="construct.a.page1.stcy021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy021
            #add-point:ON ACTION controlp INFIELD stcy021 name="construct.c.page1.stcy021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy022
            #add-point:BEFORE FIELD stcy022 name="construct.b.page1.stcy022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy022
            
            #add-point:AFTER FIELD stcy022 name="construct.a.page1.stcy022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy022
            #add-point:ON ACTION controlp INFIELD stcy022 name="construct.c.page1.stcy022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy023
            #add-point:BEFORE FIELD stcy023 name="construct.b.page1.stcy023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy023
            
            #add-point:AFTER FIELD stcy023 name="construct.a.page1.stcy023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcy023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy023
            #add-point:ON ACTION controlp INFIELD stcy023 name="construct.c.page1.stcy023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcysite
            #add-point:BEFORE FIELD stcysite name="construct.b.page1.stcysite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcysite
            
            #add-point:AFTER FIELD stcysite name="construct.a.page1.stcysite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcysite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcysite
            #add-point:ON ACTION controlp INFIELD stcysite name="construct.c.page1.stcysite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcyunit
            #add-point:BEFORE FIELD stcyunit name="construct.b.page1.stcyunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcyunit
            
            #add-point:AFTER FIELD stcyunit name="construct.a.page1.stcyunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcyunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcyunit
            #add-point:ON ACTION controlp INFIELD stcyunit name="construct.c.page1.stcyunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stczseq,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006,stcz007,stcz008, 
          stcz009,stczsite,stczunit
           FROM s_detail2[1].stczseq,s_detail2[1].stcz001,s_detail2[1].stcz002,s_detail2[1].stcz003, 
               s_detail2[1].stcz005,s_detail2[1].stcz004,s_detail2[1].stcz006,s_detail2[1].stcz007,s_detail2[1].stcz008, 
               s_detail2[1].stcz009,s_detail2[1].stczsite,s_detail2[1].stczunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczseq
            #add-point:BEFORE FIELD stczseq name="construct.b.page2.stczseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczseq
            
            #add-point:AFTER FIELD stczseq name="construct.a.page2.stczseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stczseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczseq
            #add-point:ON ACTION controlp INFIELD stczseq name="construct.c.page2.stczseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz001
            #add-point:BEFORE FIELD stcz001 name="construct.b.page2.stcz001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz001
            
            #add-point:AFTER FIELD stcz001 name="construct.a.page2.stcz001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz001
            #add-point:ON ACTION controlp INFIELD stcz001 name="construct.c.page2.stcz001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz002
            #add-point:BEFORE FIELD stcz002 name="construct.b.page2.stcz002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz002
            
            #add-point:AFTER FIELD stcz002 name="construct.a.page2.stcz002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz002
            #add-point:ON ACTION controlp INFIELD stcz002 name="construct.c.page2.stcz002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stcz003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz003
            #add-point:ON ACTION controlp INFIELD stcz003 name="construct.c.page2.stcz003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcz003  #顯示到畫面上
            NEXT FIELD stcz003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz003
            #add-point:BEFORE FIELD stcz003 name="construct.b.page2.stcz003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz003
            
            #add-point:AFTER FIELD stcz003 name="construct.a.page2.stcz003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz005
            #add-point:ON ACTION controlp INFIELD stcz005 name="construct.c.page2.stcz005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imay003_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcz005  #顯示到畫面上
            NEXT FIELD stcz005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz005
            #add-point:BEFORE FIELD stcz005 name="construct.b.page2.stcz005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz005
            
            #add-point:AFTER FIELD stcz005 name="construct.a.page2.stcz005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz004
            #add-point:ON ACTION controlp INFIELD stcz004 name="construct.c.page2.stcz004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcz004  #顯示到畫面上
            NEXT FIELD stcz004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz004
            #add-point:BEFORE FIELD stcz004 name="construct.b.page2.stcz004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz004
            
            #add-point:AFTER FIELD stcz004 name="construct.a.page2.stcz004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz006
            #add-point:BEFORE FIELD stcz006 name="construct.b.page2.stcz006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz006
            
            #add-point:AFTER FIELD stcz006 name="construct.a.page2.stcz006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz006
            #add-point:ON ACTION controlp INFIELD stcz006 name="construct.c.page2.stcz006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stcz007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz007
            #add-point:ON ACTION controlp INFIELD stcz007 name="construct.c.page2.stcz007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcz007  #顯示到畫面上
            NEXT FIELD stcz007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz007
            #add-point:BEFORE FIELD stcz007 name="construct.b.page2.stcz007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz007
            
            #add-point:AFTER FIELD stcz007 name="construct.a.page2.stcz007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz008
            #add-point:BEFORE FIELD stcz008 name="construct.b.page2.stcz008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz008
            
            #add-point:AFTER FIELD stcz008 name="construct.a.page2.stcz008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz008
            #add-point:ON ACTION controlp INFIELD stcz008 name="construct.c.page2.stcz008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz009
            #add-point:BEFORE FIELD stcz009 name="construct.b.page2.stcz009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz009
            
            #add-point:AFTER FIELD stcz009 name="construct.a.page2.stcz009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcz009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz009
            #add-point:ON ACTION controlp INFIELD stcz009 name="construct.c.page2.stcz009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczsite
            #add-point:BEFORE FIELD stczsite name="construct.b.page2.stczsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczsite
            
            #add-point:AFTER FIELD stczsite name="construct.a.page2.stczsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stczsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczsite
            #add-point:ON ACTION controlp INFIELD stczsite name="construct.c.page2.stczsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczunit
            #add-point:BEFORE FIELD stczunit name="construct.b.page2.stczunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczunit
            
            #add-point:AFTER FIELD stczunit name="construct.a.page2.stczunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stczunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczunit
            #add-point:ON ACTION controlp INFIELD stczunit name="construct.c.page2.stczunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stcx_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcy_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcz_t" 
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
 
{<section id="astt604.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt604_filter()
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
      CONSTRUCT g_wc_filter ON stcxsite,stcxdocdt,stcxdocno,stcx001,stcx002,stcx003,stcx004,stcx005, 
          stcx006,stcx007,stcx008,stcx009,stcx010,stcx011
                          FROM s_browse[1].b_stcxsite,s_browse[1].b_stcxdocdt,s_browse[1].b_stcxdocno, 
                              s_browse[1].b_stcx001,s_browse[1].b_stcx002,s_browse[1].b_stcx003,s_browse[1].b_stcx004, 
                              s_browse[1].b_stcx005,s_browse[1].b_stcx006,s_browse[1].b_stcx007,s_browse[1].b_stcx008, 
                              s_browse[1].b_stcx009,s_browse[1].b_stcx010,s_browse[1].b_stcx011
 
         BEFORE CONSTRUCT
               DISPLAY astt604_filter_parser('stcxsite') TO s_browse[1].b_stcxsite
            DISPLAY astt604_filter_parser('stcxdocdt') TO s_browse[1].b_stcxdocdt
            DISPLAY astt604_filter_parser('stcxdocno') TO s_browse[1].b_stcxdocno
            DISPLAY astt604_filter_parser('stcx001') TO s_browse[1].b_stcx001
            DISPLAY astt604_filter_parser('stcx002') TO s_browse[1].b_stcx002
            DISPLAY astt604_filter_parser('stcx003') TO s_browse[1].b_stcx003
            DISPLAY astt604_filter_parser('stcx004') TO s_browse[1].b_stcx004
            DISPLAY astt604_filter_parser('stcx005') TO s_browse[1].b_stcx005
            DISPLAY astt604_filter_parser('stcx006') TO s_browse[1].b_stcx006
            DISPLAY astt604_filter_parser('stcx007') TO s_browse[1].b_stcx007
            DISPLAY astt604_filter_parser('stcx008') TO s_browse[1].b_stcx008
            DISPLAY astt604_filter_parser('stcx009') TO s_browse[1].b_stcx009
            DISPLAY astt604_filter_parser('stcx010') TO s_browse[1].b_stcx010
            DISPLAY astt604_filter_parser('stcx011') TO s_browse[1].b_stcx011
      
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
 
      CALL astt604_filter_show('stcxsite')
   CALL astt604_filter_show('stcxdocdt')
   CALL astt604_filter_show('stcxdocno')
   CALL astt604_filter_show('stcx001')
   CALL astt604_filter_show('stcx002')
   CALL astt604_filter_show('stcx003')
   CALL astt604_filter_show('stcx004')
   CALL astt604_filter_show('stcx005')
   CALL astt604_filter_show('stcx006')
   CALL astt604_filter_show('stcx007')
   CALL astt604_filter_show('stcx008')
   CALL astt604_filter_show('stcx009')
   CALL astt604_filter_show('stcx010')
   CALL astt604_filter_show('stcx011')
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt604_filter_parser(ps_field)
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
 
{<section id="astt604.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt604_filter_show(ps_field)
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
   LET ls_condition = astt604_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt604_query()
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
   CALL g_stcy_d.clear()
   CALL g_stcy2_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt604_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt604_browser_fill("")
      CALL astt604_fetch("")
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
      CALL astt604_filter_show('stcxsite')
   CALL astt604_filter_show('stcxdocdt')
   CALL astt604_filter_show('stcxdocno')
   CALL astt604_filter_show('stcx001')
   CALL astt604_filter_show('stcx002')
   CALL astt604_filter_show('stcx003')
   CALL astt604_filter_show('stcx004')
   CALL astt604_filter_show('stcx005')
   CALL astt604_filter_show('stcx006')
   CALL astt604_filter_show('stcx007')
   CALL astt604_filter_show('stcx008')
   CALL astt604_filter_show('stcx009')
   CALL astt604_filter_show('stcx010')
   CALL astt604_filter_show('stcx011')
   CALL astt604_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt604_fetch("F") 
      #顯示單身筆數
      CALL astt604_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt604_fetch(p_flag)
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
   
   LET g_stcx_m.stcxdocno = g_browser[g_current_idx].b_stcxdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
   #遮罩相關處理
   LET g_stcx_m_mask_o.* =  g_stcx_m.*
   CALL astt604_stcx_t_mask()
   LET g_stcx_m_mask_n.* =  g_stcx_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt604_set_act_visible()   
   CALL astt604_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   #mark by geza 20160810 #160809-00024#1(S)
#   IF g_stcx_m.stcxstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
#      CALL cl_set_act_visible("modify,delete",TRUE)
#   ELSE
#      CALL cl_set_act_visible("modify,delete",FALSE)
#   END IF
   #mark by geza 20160810 #160809-00024#1(E)   
  # CALL cl_set_act_visible("reproduce",FALSE)
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stcx_m_t.* = g_stcx_m.*
   LET g_stcx_m_o.* = g_stcx_m.*
   
   LET g_data_owner = g_stcx_m.stcxownid      
   LET g_data_dept  = g_stcx_m.stcxowndp
   
   #重新顯示   
   CALL astt604_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt604_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_insert      LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stcy_d.clear()   
   CALL g_stcy2_d.clear()  
 
 
   INITIALIZE g_stcx_m.* TO NULL             #DEFAULT 設定
   
   LET g_stcxdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcx_m.stcxownid = g_user
      LET g_stcx_m.stcxowndp = g_dept
      LET g_stcx_m.stcxcrtid = g_user
      LET g_stcx_m.stcxcrtdp = g_dept 
      LET g_stcx_m.stcxcrtdt = cl_get_current()
      LET g_stcx_m.stcxmodid = g_user
      LET g_stcx_m.stcxmoddt = cl_get_current()
      LET g_stcx_m.stcxstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      #LET g_stcx_m.stcxsite = g_site
      #CALL astt604_stcxsite_ref()
      #LET g_stcx_m.stcxunit = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stcxsite',g_stcx_m.stcxsite) RETURNING r_insert,g_stcx_m.stcxsite
      IF NOT r_insert THEN
         RETURN 
      END IF
      CALL s_aooi500_default(g_prog,'stcxunit',g_stcx_m.stcxunit) RETURNING r_insert,g_stcx_m.stcxunit
      IF NOT r_insert THEN
         RETURN 
      END IF
      CALL astt604_stcxsite_ref()
      LET g_stcx_m.stcxdocdt = g_today
      #dongsz--add--str---
      #預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stcx_m.stcxsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stcx_m.stcxdocno = r_doctype
      #dongsz--add--end---
      LET g_stcx_m.stcx004 = g_user
      CALL astt604_stcx004_ref()
      LET g_stcx_m.stcx005 = g_dept
      CALL astt604_stcx005_ref()
      LET g_stcx_m_t.* = g_stcx_m.*
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stcx_m_t.* = g_stcx_m.*
      LET g_stcx_m_o.* = g_stcx_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcx_m.stcxstus 
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
 
 
 
    
      CALL astt604_input("a")
      
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
         INITIALIZE g_stcx_m.* TO NULL
         INITIALIZE g_stcy_d TO NULL
         INITIALIZE g_stcy2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt604_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stcy_d.clear()
      #CALL g_stcy2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt604_set_act_visible()   
   CALL astt604_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcxent = " ||g_enterprise|| " AND",
                      " stcxdocno = '", g_stcx_m.stcxdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt604_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt604_cl
   
   CALL astt604_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
   
   #遮罩相關處理
   LET g_stcx_m_mask_o.* =  g_stcx_m.*
   CALL astt604_stcx_t_mask()
   LET g_stcx_m_mask_n.* =  g_stcx_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxsite_desc,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001, 
       g_stcx_m.stcx001_desc,g_stcx_m.stcx002,g_stcx_m.stcx002_desc,g_stcx_m.stcx003,g_stcx_m.stcx003_desc, 
       g_stcx_m.stcx004,g_stcx_m.stcx004_desc,g_stcx_m.stcx005,g_stcx_m.stcx005_desc,g_stcx_m.stcxunit, 
       g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.amount,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx009_desc,g_stcx_m.stcx010,g_stcx_m.stcx010_desc,g_stcx_m.stcx011,g_stcx_m.stcx011_desc, 
       g_stcx_m.ooff013,g_stcx_m.stcxownid,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxcrtdt, 
       g_stcx_m.stcxmodid,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfid_desc, 
       g_stcx_m.stcxcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stcx_m.stcxownid      
   LET g_data_dept  = g_stcx_m.stcxowndp
   
   #功能已完成,通報訊息中心
   CALL astt604_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt604_modify()
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
   LET g_stcx_m_t.* = g_stcx_m.*
   LET g_stcx_m_o.* = g_stcx_m.*
   
   IF g_stcx_m.stcxdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
   CALL s_transaction_begin()
   
   OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt604_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt604_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
   #檢查是否允許此動作
   IF NOT astt604_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcx_m_mask_o.* =  g_stcx_m.*
   CALL astt604_stcx_t_mask()
   LET g_stcx_m_mask_n.* =  g_stcx_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astt604_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stcx_m.stcxmodid = g_user 
LET g_stcx_m.stcxmoddt = cl_get_current()
LET g_stcx_m.stcxmodid_desc = cl_get_username(g_stcx_m.stcxmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stcx_m.stcxstus MATCHES "[DR]" THEN
         LET g_stcx_m.stcxstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt604_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stcx_t SET (stcxmodid,stcxmoddt) = (g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt)
          WHERE stcxent = g_enterprise AND stcxdocno = g_stcxdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stcx_m.* = g_stcx_m_t.*
            CALL astt604_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stcx_m.stcxdocno != g_stcx_m_t.stcxdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stcy_t SET stcydocno = g_stcx_m.stcxdocno
 
          WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m_t.stcxdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcy_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
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
         
         UPDATE stcz_t
            SET stczdocno = g_stcx_m.stcxdocno
 
          WHERE stczent = g_enterprise AND
                stczdocno = g_stcxdocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcz_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
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
   CALL astt604_set_act_visible()   
   CALL astt604_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stcxent = " ||g_enterprise|| " AND",
                      " stcxdocno = '", g_stcx_m.stcxdocno, "' "
 
   #填到對應位置
   CALL astt604_browser_fill("")
 
   CLOSE astt604_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt604_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt604.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt604_input(p_cmd)
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
   DEFINE  t_stcx008             LIKE stcx_t.stcx008
   DEFINE  t_stcx009             LIKE stcx_t.stcx009
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  t_stcy004             LIKE stcy_t.stcy004
   DEFINE  t_stcz004             LIKE stcz_t.stcz004
   DEFINE  t_stcz005             LIKE stcz_t.stcz005
   DEFINE  r_success             LIKE type_t.num5
   DEFINE  l_period              LIKE type_t.num5
   DEFINE  l_period2             LIKE type_t.num5
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
   DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxsite_desc,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001, 
       g_stcx_m.stcx001_desc,g_stcx_m.stcx002,g_stcx_m.stcx002_desc,g_stcx_m.stcx003,g_stcx_m.stcx003_desc, 
       g_stcx_m.stcx004,g_stcx_m.stcx004_desc,g_stcx_m.stcx005,g_stcx_m.stcx005_desc,g_stcx_m.stcxunit, 
       g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.amount,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx009_desc,g_stcx_m.stcx010,g_stcx_m.stcx010_desc,g_stcx_m.stcx011,g_stcx_m.stcx011_desc, 
       g_stcx_m.ooff013,g_stcx_m.stcxownid,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxcrtdt, 
       g_stcx_m.stcxmodid,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfid_desc, 
       g_stcx_m.stcxcnfdt
   
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
   LET g_forupd_sql = "SELECT stcyseq,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006,stcy007,stcy008, 
       stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018,stcy019,stcy020, 
       stcy021,stcy022,stcy023,stcysite,stcyunit FROM stcy_t WHERE stcyent=? AND stcydocno=? AND stcyseq=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt604_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stczseq,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006,stcz007,stcz008, 
       stcz009,stczsite,stczunit FROM stcz_t WHERE stczent=? AND stczdocno=? AND stczseq=? FOR UPDATE" 
 
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt604_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   LET g_flag2 = FALSE
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt604_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt604_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002, 
       g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005,g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006, 
       g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.ooff013 
 
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   LET t_stcx008 = g_stcx_m.stcx008
   LET t_stcx009 = g_stcx_m.stcx009
   LET g_stcx_m_o.stcx008 = g_stcx_m.stcx008
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt604.input.head" >}
      #單頭段
      INPUT BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002, 
          g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005,g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006, 
          g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.ooff013  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt604_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt604_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt604_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt604_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxsite
            
            #add-point:AFTER FIELD stcxsite name="input.a.stcxsite"
            IF NOT cl_null(g_stcx_m.stcxsite) THEN
               CALL s_aooi500_chk(g_prog,'stcxsite',g_stcx_m.stcxsite,g_stcx_m.stcxsite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stcx_m.stcxsite = g_stcx_m_t.stcxsite
                  CALL s_desc_get_department_desc(g_stcx_m.stcxsite) RETURNING g_stcx_m.stcxsite_desc
                  DISPLAY BY NAME g_stcx_m.stcxsite_desc
                  NEXT FIELD CURRENT
               END IF
#               LET g_site_flag = TRUE
#               CALL astt604_set_entry(p_cmd)
#               CALL astt604_set_no_entry(p_cmd)
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()

               LET g_stcx_m.stcxsite = g_stcx_m_t.stcxsite
               CALL s_desc_get_department_desc(g_stcx_m.stcxsite) RETURNING g_stcx_m.stcxsite_desc
               DISPLAY BY NAME g_stcx_m.stcxsite_desc
               NEXT FIELD CURRENT
            END IF
            CALL s_desc_get_department_desc(g_stcx_m.stcxsite) RETURNING g_stcx_m.stcxsite_desc
            DISPLAY BY NAME g_stcx_m.stcxsite_desc
            LET g_flag2 = TRUE
            LET g_site_flag = TRUE
            CALL astt604_set_entry(p_cmd)
            CALL astt604_set_no_entry(p_cmd)

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxsite
            #add-point:BEFORE FIELD stcxsite name="input.b.stcxsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcxsite
            #add-point:ON CHANGE stcxsite name="input.g.stcxsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxdocdt
            #add-point:BEFORE FIELD stcxdocdt name="input.b.stcxdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxdocdt
            
            #add-point:AFTER FIELD stcxdocdt name="input.a.stcxdocdt"
            IF NOT cl_null(g_stcx_m.stcxdocdt) THEN
               #合同不为空时，需要检查关帐日期
               IF NOT astt604_stcxdocdt_chk() THEN
                  LET g_stcx_m.stcxdocdt = g_stcx_m_t.stcxdocdt
                  NEXT FIELD stcxdocdt
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcxdocdt
            #add-point:ON CHANGE stcxdocdt name="input.g.stcxdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxdocno
            #add-point:BEFORE FIELD stcxdocno name="input.b.stcxdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxdocno
            
            #add-point:AFTER FIELD stcxdocno name="input.a.stcxdocno"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF NOT cl_null(g_stcx_m.stcxdocno) AND p_cmd = 'a' THEN
               IF NOT s_aooi200_chk_slip(g_site,'',g_stcx_m.stcxdocno,g_prog) THEN
                  LET g_stcx_m.stcxdocno = g_stcx_m_t.stcxdocno
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF  NOT cl_null(g_stcx_m.stcxdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stcx_m.stcxdocno != g_stcxdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcx_t WHERE "||"stcxent = '" ||g_enterprise|| "' AND "||"stcxdocno = '"||g_stcx_m.stcxdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcxdocno
            #add-point:ON CHANGE stcxdocno name="input.g.stcxdocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx001
            
            #add-point:AFTER FIELD stcx001 name="input.a.stcx001"
            LET g_stcx_m.stcx001_desc = ''
            DISPLAY BY NAME g_stcx_m.stcx001_desc
            IF NOT cl_null(g_stcx_m.stcx001) THEN              
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcx_m.stcx001
               #160318-00025#35  2016/04/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "apr-00345:sub-01302|aprt540|",cl_get_progname("aprt540",g_lang,"2"),"|:EXEPROGaprt540"
               LET g_chkparam.err_str[2] = "apr-00344:sub-01313|aprt540|",cl_get_progname("aprt540",g_lang,"2"),"|:EXEPROGaprt540"
               #160318-00025#35  2016/04/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_prcd001_3") THEN
                  LET g_stcx_m.stcx001 = g_stcx_m_t.stcx001
                  CALL astt604_stcx001_ref()
                  NEXT FIELD stcx001
               END IF
               CALL astt604_stcx001_other()
            END IF
            CALL astt604_stcx001_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx001
            #add-point:BEFORE FIELD stcx001 name="input.b.stcx001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx001
            #add-point:ON CHANGE stcx001 name="input.g.stcx001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx002
            
            #add-point:AFTER FIELD stcx002 name="input.a.stcx002"
           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx002
            #add-point:BEFORE FIELD stcx002 name="input.b.stcx002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx002
            #add-point:ON CHANGE stcx002 name="input.g.stcx002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx003
            
            #add-point:AFTER FIELD stcx003 name="input.a.stcx003"
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx003
            #add-point:BEFORE FIELD stcx003 name="input.b.stcx003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx003
            #add-point:ON CHANGE stcx003 name="input.g.stcx003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx004
            
            #add-point:AFTER FIELD stcx004 name="input.a.stcx004"
            LET g_stcx_m.stcx004_desc = ''
            DISPLAY BY NAME g_stcx_m.stcx004_desc
            IF NOT cl_null(g_stcx_m.stcx004) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcx_m.stcx004
               #160318-00025#35  2016/05/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               #160318-00025#35  2016/05/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooag001") THEN
                  LET g_stcx_m.stcx004 = g_stcx_m_t.stcx004
                  CALL astt604_stcx004_ref()
                  NEXT FIELD stcx004
               END IF
            
            END IF
            CALL astt604_stcx004_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx004
            #add-point:BEFORE FIELD stcx004 name="input.b.stcx004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx004
            #add-point:ON CHANGE stcx004 name="input.g.stcx004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx005
            
            #add-point:AFTER FIELD stcx005 name="input.a.stcx005"
            LET g_stcx_m.stcx005_desc = ''
            DISPLAY BY NAME g_stcx_m.stcx005_desc
            IF NOT cl_null(g_stcx_m.stcx005) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcx_m.stcx005
               LET g_chkparam.arg2 = g_stcx_m.stcxdocdt
               #160318-00025#35  2016/04/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
               #160318-00025#35  2016/04/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooeg001") THEN
                  LET g_stcx_m.stcx004 = g_stcx_m_t.stcx004
                  CALL astt604_stcx005_ref()
                  NEXT FIELD stcx005
               END IF     
            END IF
            CALL astt604_stcx005_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx005
            #add-point:BEFORE FIELD stcx005 name="input.b.stcx005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx005
            #add-point:ON CHANGE stcx005 name="input.g.stcx005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxunit
            #add-point:BEFORE FIELD stcxunit name="input.b.stcxunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxunit
            
            #add-point:AFTER FIELD stcxunit name="input.a.stcxunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcxunit
            #add-point:ON CHANGE stcxunit name="input.g.stcxunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcxstus
            #add-point:BEFORE FIELD stcxstus name="input.b.stcxstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcxstus
            
            #add-point:AFTER FIELD stcxstus name="input.a.stcxstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcxstus
            #add-point:ON CHANGE stcxstus name="input.g.stcxstus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx006
            #add-point:BEFORE FIELD stcx006 name="input.b.stcx006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx006
            
            #add-point:AFTER FIELD stcx006 name="input.a.stcx006"
            IF NOT cl_null(g_stcx_m.stcx006) THEN
               IF NOT astt604_date_range_chk() THEN
                  LET g_stcx_m.stcx006 =g_stcx_m_t.stcx006
                  NEXT FIELD stcx006
               END IF         
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx006
            #add-point:ON CHANGE stcx006 name="input.g.stcx006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx007
            #add-point:BEFORE FIELD stcx007 name="input.b.stcx007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx007
            
            #add-point:AFTER FIELD stcx007 name="input.a.stcx007"
            IF NOT cl_null(g_stcx_m.stcx007) THEN
               IF NOT astt604_date_range_chk() THEN
                  LET g_stcx_m.stcx007 =g_stcx_m_t.stcx007
                  NEXT FIELD stcx007
               END IF   
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx007
            #add-point:ON CHANGE stcx007 name="input.g.stcx007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx008
            #add-point:BEFORE FIELD stcx008 name="input.b.stcx008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx008
            
            #add-point:AFTER FIELD stcx008 name="input.a.stcx008"
            IF NOT cl_null(g_stcx_m.stcx008) THEN
               IF cl_null(t_stcx008) OR (NOT cl_null(t_stcx008) AND t_stcx008<> g_stcx_m.stcx008) THEN
                   IF NOT astt604_stcx008_chk() THEN
                      LET g_stcx_m.stcx008 = g_stcx_m_t.stcx008
                      NEXT FIELD stcx008
                   END IF                   
                   #带出经销商，币别，税别
                   CALL astt604_stcx008_other()  
               END IF                 
            END IF
            LET t_stcx008 = g_stcx_m.stcx008
            LET t_stcx009 = g_stcx_m.stcx009 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx008
            #add-point:ON CHANGE stcx008 name="input.g.stcx008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx009
            
            #add-point:AFTER FIELD stcx009 name="input.a.stcx009"
            LET g_stcx_m.stcx009_desc = ''
            DISPLAY BY NAME g_stcx_m.stcx009_desc 
            IF NOT cl_null(g_stcx_m.stcx009) THEN
               IF cl_null(t_stcx009) OR (NOT cl_null(t_stcx009) AND t_stcx009<> g_stcx_m.stcx009) THEN
                  IF NOT astt604_stcx009_chk() THEN
                     LET g_stcx_m.stcx009 = g_stcx_m_t.stcx009
                     CALL astt604_stcx009_ref()
                     NEXT FIELD stcx009
                  END IF    
               END IF                  
            END IF
            LET t_stcx008 = g_stcx_m.stcx008
            LET t_stcx009 = g_stcx_m.stcx009
            CALL astt604_stcx009_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx009
            #add-point:BEFORE FIELD stcx009 name="input.b.stcx009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx009
            #add-point:ON CHANGE stcx009 name="input.g.stcx009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx010
            
            #add-point:AFTER FIELD stcx010 name="input.a.stcx010"
            IF NOT cl_null(g_stcx_m.stcx010) THEN
               LET g_errshow = '1'
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_site
               LET g_chkparam.arg2 = g_stcx_m.stcx010
               #160318-00025#35  2016/04/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
               #160318-00025#35  2016/04/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooaj002") THEN
                  LET g_stcx_m.stcx010 = g_stcx_m_t.stcx010
                  CALL astt604_stcx010_ref()
                  NEXT FIELD stcx010
               END IF   
            END IF
            CALL astt604_stcx010_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx010
            #add-point:BEFORE FIELD stcx010 name="input.b.stcx010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx010
            #add-point:ON CHANGE stcx010 name="input.g.stcx010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcx011
            
            #add-point:AFTER FIELD stcx011 name="input.a.stcx011"
            LET g_stcx_m.stcx011_desc = ''
            DISPLAY BY NAME g_stcx_m.stcx011_desc 
            IF NOT cl_null(g_stcx_m.stcx011) THEN
               IF NOT astt604_stcx011_chk() THEN
                  LET g_stcx_m.stcx011 = g_stcx_m_t.stcx011
                  CALL astt604_stcx011_ref()
               END IF               
            END IF
            CALL astt604_stcx011_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcx011
            #add-point:BEFORE FIELD stcx011 name="input.b.stcx011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcx011
            #add-point:ON CHANGE stcx011 name="input.g.stcx011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="input.b.ooff013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013
            
            #add-point:AFTER FIELD ooff013 name="input.a.ooff013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooff013
            #add-point:ON CHANGE ooff013 name="input.g.ooff013"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stcxsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxsite
            #add-point:ON ACTION controlp INFIELD stcxsite name="input.c.stcxsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcxsite             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = g_site
            #LET g_qryparam.arg2 = '8'

            #CALL q_ooed004_3()                                #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcxsite',g_stcx_m.stcxsite,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()
            LET g_stcx_m.stcxsite = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stcx_m.stcxsite TO stcxsite              #顯示到畫面上
            CALL s_desc_get_department_desc(g_stcx_m.stcxsite) RETURNING g_stcx_m.stcxsite_desc
            DISPLAY BY NAME g_stcx_m.stcxsite_desc
            NEXT FIELD stcxsite                        #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stcxdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxdocdt
            #add-point:ON ACTION controlp INFIELD stcxdocdt name="input.c.stcxdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcxdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxdocno
            #add-point:ON ACTION controlp INFIELD stcxdocno name="input.c.stcxdocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcxdocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_ooef004 #
            #LET g_qryparam.arg2 = "astt604" #   #160705-00042#5 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#5 160711 by sakura add
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stcx_m.stcxdocno = g_qryparam.return1              

            DISPLAY g_stcx_m.stcxdocno TO stcxdocno              #

            NEXT FIELD stcxdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx001
            #add-point:ON ACTION controlp INFIELD stcx001 name="input.c.stcx001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2" #

            
            CALL q_prcd001_1()                                #呼叫開窗

            LET g_stcx_m.stcx001 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx001 TO stcx001              #
            CALL astt604_stcx001_ref()
            NEXT FIELD stcx001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx002
            #add-point:ON ACTION controlp INFIELD stcx002 name="input.c.stcx002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcx003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx003
            #add-point:ON ACTION controlp INFIELD stcx003 name="input.c.stcx003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcx004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx004
            #add-point:ON ACTION controlp INFIELD stcx004 name="input.c.stcx004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stcx_m.stcx004 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx004 TO stcx004              #
            CALL astt604_stcx004_ref() 
            NEXT FIELD stcx004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx005
            #add-point:ON ACTION controlp INFIELD stcx005 name="input.c.stcx005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx005             #給予default值
            LET g_qryparam.default2 = "" #g_stcx_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = g_stcx_m.stcxdocdt #

            
            CALL q_ooeg001()                                #呼叫開窗

            LET g_stcx_m.stcx005 = g_qryparam.return1              
            #LET g_stcx_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stcx_m.stcx005 TO stcx005              #
            #DISPLAY g_stcx_m.ooeg001 TO ooeg001 #部門編號
            CALL astt604_stcx005_ref()
            NEXT FIELD stcx005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcxunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxunit
            #add-point:ON ACTION controlp INFIELD stcxunit name="input.c.stcxunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcxstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcxstus
            #add-point:ON ACTION controlp INFIELD stcxstus name="input.c.stcxstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcx006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx006
            #add-point:ON ACTION controlp INFIELD stcx006 name="input.c.stcx006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcx007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx007
            #add-point:ON ACTION controlp INFIELD stcx007 name="input.c.stcx007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcx008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx008
            #add-point:ON ACTION controlp INFIELD stcx008 name="input.c.stcx008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = "(('",g_stcx_m.stcx006,"' BETWEEN  stce017 AND stce018) OR ('",g_stcx_m.stcx007,"' BETWEEN  stce017 AND stce018))"
            CALL q_stce001_4()                                #呼叫開窗

            LET g_stcx_m.stcx008 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx008 TO stcx008              #
           
            NEXT FIELD stcx008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx009
            #add-point:ON ACTION controlp INFIELD stcx009 name="input.c.stcx009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            
            IF NOT cl_null(g_stcx_m.stcx008) THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM stce_t WHERE stce001 = '",g_stcx_m.stcx008,"' AND pmaa001 = stce009)"
            ELSE
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM stce_t WHERE pmaa001 = stce009)" 
            END IF
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stcx_m.stcx009 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx009 TO stcx009              #
            CALL astt604_stcx009_ref()
            NEXT FIELD stcx009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx010
            #add-point:ON ACTION controlp INFIELD stcx010 name="input.c.stcx010"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            
            CALL q_ooaj002_1()                                #呼叫開窗

            LET g_stcx_m.stcx010 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx010 TO stcx010              #
            CALL astt604_stcx010_ref() 
            NEXT FIELD stcx010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcx011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcx011
            #add-point:ON ACTION controlp INFIELD stcx011 name="input.c.stcx011"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcx_m.stcx011             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            
            CALL q_oodb002_1()                                #呼叫開窗

            LET g_stcx_m.stcx011 = g_qryparam.return1              

            DISPLAY g_stcx_m.stcx011 TO stcx011              #
            CALL astt604_stcx011_ref()
            NEXT FIELD stcx011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.ooff013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="input.c.ooff013"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stcx_m.stcxdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            IF NOT astt604_date_range_chk() THEN           
               NEXT FIELD CURRENT
            END IF 
           
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
                
               CALL s_aooi200_gen_docno(g_site,g_stcx_m.stcxdocno,g_stcx_m.stcxdocdt,g_prog) RETURNING l_success,g_stcx_m.stcxdocno
               IF NOT l_success THEN
                  NEXT FIELD stcxdocno
               END IF
               #end add-point
               
               INSERT INTO stcx_t (stcxent,stcxsite,stcxdocdt,stcxdocno,stcx001,stcx002,stcx003,stcx004, 
                   stcx005,stcxunit,stcxstus,stcx006,stcx007,stcx008,stcx009,stcx010,stcx011,stcxownid, 
                   stcxowndp,stcxcrtid,stcxcrtdp,stcxcrtdt,stcxmodid,stcxmoddt,stcxcnfid,stcxcnfdt)
               VALUES (g_enterprise,g_stcx_m.stcxsite,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001, 
                   g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005,g_stcx_m.stcxunit, 
                   g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
                   g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid, 
                   g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid, 
                   g_stcx_m.stcxcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stcx_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               IF NOT cl_null(g_stcx_m.ooff013) THEN
                  LET l_success = ''
                  CALL s_aooi360_gen('2',g_stcx_m.stcxdocno,'','','','','','','','','','4',g_stcx_m.ooff013) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               ELSE
                  CALL s_aooi360_del('2',g_stcx_m.stcxdocno,'','','','','','','','','','4') RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt604_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt604_b_fill()
                  CALL astt604_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               #修改了合同，要更新单身栏位
               IF  g_stcx_m_o.stcx008 <> g_stcx_m.stcx008 THEN
                  IF NOT astt604_upd_stcy_stcz() THEN
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG
                  END IF
               END IF
               #依照单头更新单身一些栏位
               IF NOT astt604_upd_b() THEN
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               #end add-point
               
               #將遮罩欄位還原
               CALL astt604_stcx_t_mask_restore('restore_mask_o')
               
               UPDATE stcx_t SET (stcxsite,stcxdocdt,stcxdocno,stcx001,stcx002,stcx003,stcx004,stcx005, 
                   stcxunit,stcxstus,stcx006,stcx007,stcx008,stcx009,stcx010,stcx011,stcxownid,stcxowndp, 
                   stcxcrtid,stcxcrtdp,stcxcrtdt,stcxmodid,stcxmoddt,stcxcnfid,stcxcnfdt) = (g_stcx_m.stcxsite, 
                   g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003, 
                   g_stcx_m.stcx004,g_stcx_m.stcx005,g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006, 
                   g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011, 
                   g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdt, 
                   g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt)
                WHERE stcxent = g_enterprise AND stcxdocno = g_stcxdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stcx_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               IF NOT cl_null(g_stcx_m.ooff013) THEN
                   LET l_success = ''
                   CALL s_aooi360_gen('2',g_stcx_m.stcxdocno,'','','','','','','','','','4',g_stcx_m.ooff013) RETURNING l_success
                   IF NOT l_success THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = "ooff_t"
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      CONTINUE DIALOG
                   END IF
                ELSE
                   CALL s_aooi360_del('2',g_stcx_m.stcxdocno,'','','','','','','','','','4') RETURNING l_success
                   IF NOT l_success THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = "ooff_t"
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      CONTINUE DIALOG
                   END IF
               END IF
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt604_stcx_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stcx_m_t)
               LET g_log2 = util.JSON.stringify(g_stcx_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt604.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stcy_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcy_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt604_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stcy_d.getLength()
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
            OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt604_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt604_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcy_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcy_d[l_ac].stcyseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stcy_d_t.* = g_stcy_d[l_ac].*  #BACKUP
               LET g_stcy_d_o.* = g_stcy_d[l_ac].*  #BACKUP
               CALL astt604_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt604_set_no_entry_b(l_cmd)
               IF NOT astt604_lock_b("stcy_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt604_bcl INTO g_stcy_d[l_ac].stcyseq,g_stcy_d[l_ac].stcy001,g_stcy_d[l_ac].stcy002, 
                      g_stcy_d[l_ac].stcy003,g_stcy_d[l_ac].stcy004,g_stcy_d[l_ac].stcy005,g_stcy_d[l_ac].stcy006, 
                      g_stcy_d[l_ac].stcy007,g_stcy_d[l_ac].stcy008,g_stcy_d[l_ac].stcy009,g_stcy_d[l_ac].stcy010, 
                      g_stcy_d[l_ac].stcy011,g_stcy_d[l_ac].stcy012,g_stcy_d[l_ac].stcy013,g_stcy_d[l_ac].stcy014, 
                      g_stcy_d[l_ac].stcy015,g_stcy_d[l_ac].stcy016,g_stcy_d[l_ac].stcy017,g_stcy_d[l_ac].stcy018, 
                      g_stcy_d[l_ac].stcy019,g_stcy_d[l_ac].stcy020,g_stcy_d[l_ac].stcy021,g_stcy_d[l_ac].stcy022, 
                      g_stcy_d[l_ac].stcy023,g_stcy_d[l_ac].stcysite,g_stcy_d[l_ac].stcyunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stcy_d_t.stcyseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcy_d_mask_o[l_ac].* =  g_stcy_d[l_ac].*
                  CALL astt604_stcy_t_mask()
                  LET g_stcy_d_mask_n[l_ac].* =  g_stcy_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt604_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            LET t_stcy004 = g_stcy_d[l_ac].stcy004 
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
            INITIALIZE g_stcy_d[l_ac].* TO NULL 
            INITIALIZE g_stcy_d_t.* TO NULL 
            INITIALIZE g_stcy_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stcy_d[l_ac].stcy008 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT MAX(stcyseq)+1 INTO  g_stcy_d[l_ac].stcyseq FROM stcy_t
             WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
            IF cl_null( g_stcy_d[l_ac].stcyseq  ) THEN             
               LET g_stcy_d[l_ac].stcyseq  = 1
            END IF
            LET g_stcy_d[l_ac].stcyunit = g_stcx_m.stcxunit
            LET g_stcy_d[l_ac].stcysite = g_stcx_m.stcxsite
           #LET g_stcy_d[l_ac].stcy001 = '1'
            LET g_stcy_d[l_ac].stcy002 = g_stcx_m.stcx009
            LET g_stcy_d[l_ac].stcy006 = g_stcx_m.stcx010
            LET g_stcy_d[l_ac].stcy007 = g_stcx_m.stcx011
            LET g_stcy_d[l_ac].stcy009 = g_stcx_m.stcx006
            LET g_stcy_d[l_ac].stcy010 = g_stcx_m.stcx007
            LET g_stcy_d[l_ac].stcy012 = g_stcx_m.stcx008
            SELECT stce005,stce006,stce007,stce024,stce025,stce012
              INTO g_stcy_d[l_ac].stcy013,g_stcy_d[l_ac].stcy014,g_stcy_d[l_ac].stcy015,g_stcy_d[l_ac].stcy016,
                   g_stcy_d[l_ac].stcy019,g_stcy_d[l_ac].stcy020
              FROM stce_t WHERE stceent = g_enterprise AND stce001 =g_stcx_m.stcx008 
            CALL s_asti206_get_period(g_stcy_d[l_ac].stcy009,g_stcy_d[l_ac].stcy010,g_stcy_d[l_ac].stcy016,"astt605")
                 RETURNING r_success,g_stcy_d[l_ac].stcy011,l_period,l_period2
            SELECT COUNT(*) INTO l_n FROM prcf_t
             WHERE prcfent = g_enterprise AND prcf002 = g_stcx_m.stcx001 AND prcfstus = 'Y'
            IF l_n = 1 THEN
               SELECT prcf001 INTO g_stcy_d[l_ac].stcy017 FROM prcf_t
                WHERE prcfent = g_enterprise AND prcf002 = g_stcx_m.stcx001 AND prcfstus = 'Y'                            
            END IF            
          
            #根据销售组织，销售渠道抓取 产品组，销售范围，办事处
            SELECT COUNT(*) INTO l_n FROM dbbc_t
             WHERE dbbcent = g_enterprise AND dbbc002 = g_stcy_d[l_ac].stcy019 AND dbbc003 = g_stcy_d[l_ac].stcy020 AND dbbcstus = 'Y'
            
            IF l_n = 1 THEN
               SELECT dbbc001,dbbc004,dbbc005 
                 INTO  g_stcy_d[l_ac].stcy018,g_stcy_d[l_ac].stcy021,g_stcy_d[l_ac].stcy022 FROM dbbc_t
                 WHERE dbbcent = g_enterprise AND dbbc002 = g_stcy_d[l_ac].stcy019 AND dbbc003 = g_stcy_d[l_ac].stcy020 AND dbbcstus = 'Y'
            END IF            
            
            #end add-point
            LET g_stcy_d_t.* = g_stcy_d[l_ac].*     #新輸入資料
            LET g_stcy_d_o.* = g_stcy_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt604_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt604_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcy_d[li_reproduce_target].* = g_stcy_d[li_reproduce].*
 
               LET g_stcy_d[li_reproduce_target].stcyseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stcy_t 
             WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
 
               AND stcyseq = g_stcy_d[l_ac].stcyseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcx_m.stcxdocno
               LET gs_keys[2] = g_stcy_d[g_detail_idx].stcyseq
               CALL astt604_insert_b('stcy_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stcy_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt604_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               SELECT SUM(stcy008) INTO g_stcx_m.amount FROM stcy_t
                WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
               DISPLAY BY NAME g_stcx_m.amount     
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
               LET gs_keys[01] = g_stcx_m.stcxdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stcy_d_t.stcyseq
 
            
               #刪除同層單身
               IF NOT astt604_delete_b('stcy_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt604_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt604_key_delete_b(gs_keys,'stcy_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt604_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt604_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stcy_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcy_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcyseq
            #add-point:BEFORE FIELD stcyseq name="input.b.page1.stcyseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcyseq
            
            #add-point:AFTER FIELD stcyseq name="input.a.page1.stcyseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_stcx_m.stcxdocno IS NOT NULL AND g_stcy_d[g_detail_idx].stcyseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcx_m.stcxdocno != g_stcxdocno_t OR g_stcy_d[g_detail_idx].stcyseq != g_stcy_d_t.stcyseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcy_t WHERE "||"stcyent = '" ||g_enterprise|| "' AND "||"stcydocno = '"||g_stcx_m.stcxdocno ||"' AND "|| "stcyseq = '"||g_stcy_d[g_detail_idx].stcyseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcyseq
            #add-point:ON CHANGE stcyseq name="input.g.page1.stcyseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy001
            #add-point:BEFORE FIELD stcy001 name="input.b.page1.stcy001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy001
            
            #add-point:AFTER FIELD stcy001 name="input.a.page1.stcy001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy001
            #add-point:ON CHANGE stcy001 name="input.g.page1.stcy001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy002
            #add-point:BEFORE FIELD stcy002 name="input.b.page1.stcy002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy002
            
            #add-point:AFTER FIELD stcy002 name="input.a.page1.stcy002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy002
            #add-point:ON CHANGE stcy002 name="input.g.page1.stcy002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy003
            
            #add-point:AFTER FIELD stcy003 name="input.a.page1.stcy003"
            LET g_stcy_d[l_ac].stcy003_desc = ''
            DISPLAY BY NAME g_stcy_d[l_ac].stcy003_desc 
            IF NOT cl_null(g_stcy_d[l_ac].stcy003) THEN
               IF NOT astt604_stcy003_chk() THEN
                  LET g_stcy_d[l_ac].stcy003 = g_stcy_d_t.stcy003
                  CALL astt604_stcy003_ref()
                  NEXT FIELD stcy003
               END IF  
               LET g_stcy_d[l_ac].stcy001 = '2'
            ELSE
               LET g_stcy_d[l_ac].stcy001 = '1'            
            END IF
            CALL astt604_stcy003_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy003
            #add-point:BEFORE FIELD stcy003 name="input.b.page1.stcy003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy003
            #add-point:ON CHANGE stcy003 name="input.g.page1.stcy003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy004
            
            #add-point:AFTER FIELD stcy004 name="input.a.page1.stcy004"
            LET g_stcy_d[l_ac].stcy004_desc = ''
            DISPLAY BY NAME g_stcy_d[l_ac].stcy004_desc 
            IF NOT cl_null(g_stcy_d[l_ac].stcy004) THEN
               IF NOT astt604_stcy004_chk() THEN
                  LET g_stcy_d[l_ac].stcy004 = g_stcy_d_t.stcy004
                  CALL astt604_stcy004_ref()
                  SELECT stae006 INTO  g_stcy_d[l_ac].stcy005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcy_d[l_ac].stcy004
                  DISPLAY BY NAME g_stcy_d[l_ac].stcy005
                  NEXT FIELD stcy004
               END IF 
               
               IF (NOT cl_null(t_stcy004) AND t_stcy004 <> g_stcy_d[l_ac].stcy004) OR cl_null(t_stcy004) THEN
                  SELECT stae006 INTO  g_stcy_d[l_ac].stcy005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcy_d[l_ac].stcy004
                  IF g_stcy_d[l_ac].stcy005 = '3' THEN
                     LET g_stcy_d[l_ac].stcy005 = ''
                  END IF   
                  DISPLAY BY NAME g_stcy_d[l_ac].stcy005    
               END IF     
               LET t_stcy004 = g_stcy_d[l_ac].stcy004                
            END IF
            CALL astt604_stcy004_ref()
            CALL astt604_set_entry_b(l_cmd)
            CALL astt604_set_no_entry_b(l_cmd)


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy004
            #add-point:BEFORE FIELD stcy004 name="input.b.page1.stcy004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy004
            #add-point:ON CHANGE stcy004 name="input.g.page1.stcy004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy005
            #add-point:BEFORE FIELD stcy005 name="input.b.page1.stcy005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy005
            
            #add-point:AFTER FIELD stcy005 name="input.a.page1.stcy005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy005
            #add-point:ON CHANGE stcy005 name="input.g.page1.stcy005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy006
            #add-point:BEFORE FIELD stcy006 name="input.b.page1.stcy006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy006
            
            #add-point:AFTER FIELD stcy006 name="input.a.page1.stcy006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy006
            #add-point:ON CHANGE stcy006 name="input.g.page1.stcy006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy007
            #add-point:BEFORE FIELD stcy007 name="input.b.page1.stcy007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy007
            
            #add-point:AFTER FIELD stcy007 name="input.a.page1.stcy007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy007
            #add-point:ON CHANGE stcy007 name="input.g.page1.stcy007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy008
            #add-point:BEFORE FIELD stcy008 name="input.b.page1.stcy008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy008
            
            #add-point:AFTER FIELD stcy008 name="input.a.page1.stcy008"
            IF NOT cl_null(g_stcy_d[l_ac].stcy008) THEN
               IF g_stcy_d[l_ac].stcy008 <= 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "aim-00003"
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()  
                  NEXT FIELD stcy008
               END IF          
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy008
            #add-point:ON CHANGE stcy008 name="input.g.page1.stcy008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy009
            #add-point:BEFORE FIELD stcy009 name="input.b.page1.stcy009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy009
            
            #add-point:AFTER FIELD stcy009 name="input.a.page1.stcy009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy009
            #add-point:ON CHANGE stcy009 name="input.g.page1.stcy009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy010
            #add-point:BEFORE FIELD stcy010 name="input.b.page1.stcy010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy010
            
            #add-point:AFTER FIELD stcy010 name="input.a.page1.stcy010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy010
            #add-point:ON CHANGE stcy010 name="input.g.page1.stcy010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy011
            #add-point:BEFORE FIELD stcy011 name="input.b.page1.stcy011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy011
            
            #add-point:AFTER FIELD stcy011 name="input.a.page1.stcy011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy011
            #add-point:ON CHANGE stcy011 name="input.g.page1.stcy011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy012
            #add-point:BEFORE FIELD stcy012 name="input.b.page1.stcy012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy012
            
            #add-point:AFTER FIELD stcy012 name="input.a.page1.stcy012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy012
            #add-point:ON CHANGE stcy012 name="input.g.page1.stcy012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy013
            #add-point:BEFORE FIELD stcy013 name="input.b.page1.stcy013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy013
            
            #add-point:AFTER FIELD stcy013 name="input.a.page1.stcy013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy013
            #add-point:ON CHANGE stcy013 name="input.g.page1.stcy013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy014
            #add-point:BEFORE FIELD stcy014 name="input.b.page1.stcy014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy014
            
            #add-point:AFTER FIELD stcy014 name="input.a.page1.stcy014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy014
            #add-point:ON CHANGE stcy014 name="input.g.page1.stcy014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy015
            #add-point:BEFORE FIELD stcy015 name="input.b.page1.stcy015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy015
            
            #add-point:AFTER FIELD stcy015 name="input.a.page1.stcy015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy015
            #add-point:ON CHANGE stcy015 name="input.g.page1.stcy015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy016
            #add-point:BEFORE FIELD stcy016 name="input.b.page1.stcy016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy016
            
            #add-point:AFTER FIELD stcy016 name="input.a.page1.stcy016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy016
            #add-point:ON CHANGE stcy016 name="input.g.page1.stcy016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy017
            #add-point:BEFORE FIELD stcy017 name="input.b.page1.stcy017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy017
            
            #add-point:AFTER FIELD stcy017 name="input.a.page1.stcy017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy017
            #add-point:ON CHANGE stcy017 name="input.g.page1.stcy017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy018
            #add-point:BEFORE FIELD stcy018 name="input.b.page1.stcy018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy018
            
            #add-point:AFTER FIELD stcy018 name="input.a.page1.stcy018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy018
            #add-point:ON CHANGE stcy018 name="input.g.page1.stcy018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy019
            #add-point:BEFORE FIELD stcy019 name="input.b.page1.stcy019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy019
            
            #add-point:AFTER FIELD stcy019 name="input.a.page1.stcy019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy019
            #add-point:ON CHANGE stcy019 name="input.g.page1.stcy019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy020
            #add-point:BEFORE FIELD stcy020 name="input.b.page1.stcy020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy020
            
            #add-point:AFTER FIELD stcy020 name="input.a.page1.stcy020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy020
            #add-point:ON CHANGE stcy020 name="input.g.page1.stcy020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy021
            #add-point:BEFORE FIELD stcy021 name="input.b.page1.stcy021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy021
            
            #add-point:AFTER FIELD stcy021 name="input.a.page1.stcy021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy021
            #add-point:ON CHANGE stcy021 name="input.g.page1.stcy021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy022
            #add-point:BEFORE FIELD stcy022 name="input.b.page1.stcy022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy022
            
            #add-point:AFTER FIELD stcy022 name="input.a.page1.stcy022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy022
            #add-point:ON CHANGE stcy022 name="input.g.page1.stcy022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcy023
            #add-point:BEFORE FIELD stcy023 name="input.b.page1.stcy023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcy023
            
            #add-point:AFTER FIELD stcy023 name="input.a.page1.stcy023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcy023
            #add-point:ON CHANGE stcy023 name="input.g.page1.stcy023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcysite
            #add-point:BEFORE FIELD stcysite name="input.b.page1.stcysite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcysite
            
            #add-point:AFTER FIELD stcysite name="input.a.page1.stcysite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcysite
            #add-point:ON CHANGE stcysite name="input.g.page1.stcysite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcyunit
            #add-point:BEFORE FIELD stcyunit name="input.b.page1.stcyunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcyunit
            
            #add-point:AFTER FIELD stcyunit name="input.a.page1.stcyunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcyunit
            #add-point:ON CHANGE stcyunit name="input.g.page1.stcyunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stcyseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcyseq
            #add-point:ON ACTION controlp INFIELD stcyseq name="input.c.page1.stcyseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy001
            #add-point:ON ACTION controlp INFIELD stcy001 name="input.c.page1.stcy001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy002
            #add-point:ON ACTION controlp INFIELD stcy002 name="input.c.page1.stcy002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy003
            #add-point:ON ACTION controlp INFIELD stcy003 name="input.c.page1.stcy003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy_d[l_ac].stcy003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            LET g_qryparam.where = "pmaa006 = '",g_stcx_m.stcx009,"'"
            
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stcy_d[l_ac].stcy003 = g_qryparam.return1              

            DISPLAY g_stcy_d[l_ac].stcy003 TO stcy003              #
            CALL astt604_stcy003_ref()
            NEXT FIELD stcy003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy004
            #add-point:ON ACTION controlp INFIELD stcy004 name="input.c.page1.stcy004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy_d[l_ac].stcy004             #給予default值
            LET g_qryparam.default2 = "" #g_stcy_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stcy_d[l_ac].stae001 #費用編號
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stae001_3()                                #呼叫開窗

            LET g_stcy_d[l_ac].stcy004 = g_qryparam.return1              
            #LET g_stcy_d[l_ac].stael003 = g_qryparam.return2 
            #LET g_stcy_d[l_ac].stae001 = g_qryparam.return3 
            DISPLAY g_stcy_d[l_ac].stcy004 TO stcy004              #
            #DISPLAY g_stcy_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stcy_d[l_ac].stae001 TO stae001 #費用編號
            CALL astt604_stcy004_ref()
            NEXT FIELD stcy004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy005
            #add-point:ON ACTION controlp INFIELD stcy005 name="input.c.page1.stcy005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy006
            #add-point:ON ACTION controlp INFIELD stcy006 name="input.c.page1.stcy006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy007
            #add-point:ON ACTION controlp INFIELD stcy007 name="input.c.page1.stcy007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy008
            #add-point:ON ACTION controlp INFIELD stcy008 name="input.c.page1.stcy008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy009
            #add-point:ON ACTION controlp INFIELD stcy009 name="input.c.page1.stcy009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy010
            #add-point:ON ACTION controlp INFIELD stcy010 name="input.c.page1.stcy010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy011
            #add-point:ON ACTION controlp INFIELD stcy011 name="input.c.page1.stcy011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy012
            #add-point:ON ACTION controlp INFIELD stcy012 name="input.c.page1.stcy012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy013
            #add-point:ON ACTION controlp INFIELD stcy013 name="input.c.page1.stcy013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy014
            #add-point:ON ACTION controlp INFIELD stcy014 name="input.c.page1.stcy014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy015
            #add-point:ON ACTION controlp INFIELD stcy015 name="input.c.page1.stcy015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy016
            #add-point:ON ACTION controlp INFIELD stcy016 name="input.c.page1.stcy016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy017
            #add-point:ON ACTION controlp INFIELD stcy017 name="input.c.page1.stcy017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy018
            #add-point:ON ACTION controlp INFIELD stcy018 name="input.c.page1.stcy018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy019
            #add-point:ON ACTION controlp INFIELD stcy019 name="input.c.page1.stcy019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy020
            #add-point:ON ACTION controlp INFIELD stcy020 name="input.c.page1.stcy020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy021
            #add-point:ON ACTION controlp INFIELD stcy021 name="input.c.page1.stcy021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy022
            #add-point:ON ACTION controlp INFIELD stcy022 name="input.c.page1.stcy022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcy023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcy023
            #add-point:ON ACTION controlp INFIELD stcy023 name="input.c.page1.stcy023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcysite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcysite
            #add-point:ON ACTION controlp INFIELD stcysite name="input.c.page1.stcysite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcyunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcyunit
            #add-point:ON ACTION controlp INFIELD stcyunit name="input.c.page1.stcyunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stcy_d[l_ac].* = g_stcy_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt604_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stcy_d[l_ac].stcyseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stcy_d[l_ac].* = g_stcy_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt604_stcy_t_mask_restore('restore_mask_o')
      
               UPDATE stcy_t SET (stcydocno,stcyseq,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006, 
                   stcy007,stcy008,stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017, 
                   stcy018,stcy019,stcy020,stcy021,stcy022,stcy023,stcysite,stcyunit) = (g_stcx_m.stcxdocno, 
                   g_stcy_d[l_ac].stcyseq,g_stcy_d[l_ac].stcy001,g_stcy_d[l_ac].stcy002,g_stcy_d[l_ac].stcy003, 
                   g_stcy_d[l_ac].stcy004,g_stcy_d[l_ac].stcy005,g_stcy_d[l_ac].stcy006,g_stcy_d[l_ac].stcy007, 
                   g_stcy_d[l_ac].stcy008,g_stcy_d[l_ac].stcy009,g_stcy_d[l_ac].stcy010,g_stcy_d[l_ac].stcy011, 
                   g_stcy_d[l_ac].stcy012,g_stcy_d[l_ac].stcy013,g_stcy_d[l_ac].stcy014,g_stcy_d[l_ac].stcy015, 
                   g_stcy_d[l_ac].stcy016,g_stcy_d[l_ac].stcy017,g_stcy_d[l_ac].stcy018,g_stcy_d[l_ac].stcy019, 
                   g_stcy_d[l_ac].stcy020,g_stcy_d[l_ac].stcy021,g_stcy_d[l_ac].stcy022,g_stcy_d[l_ac].stcy023, 
                   g_stcy_d[l_ac].stcysite,g_stcy_d[l_ac].stcyunit)
                WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno 
 
                  AND stcyseq = g_stcy_d_t.stcyseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcy_d[l_ac].* = g_stcy_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcy_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcy_d[l_ac].* = g_stcy_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcx_m.stcxdocno
               LET gs_keys_bak[1] = g_stcxdocno_t
               LET gs_keys[2] = g_stcy_d[g_detail_idx].stcyseq
               LET gs_keys_bak[2] = g_stcy_d_t.stcyseq
               CALL astt604_update_b('stcy_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt604_stcy_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stcy_d[g_detail_idx].stcyseq = g_stcy_d_t.stcyseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stcx_m.stcxdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stcy_d_t.stcyseq
 
                  CALL astt604_key_update_b(gs_keys,'stcy_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcx_m),util.JSON.stringify(g_stcy_d_t)
               LET g_log2 = util.JSON.stringify(g_stcx_m),util.JSON.stringify(g_stcy_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               SELECT SUM(stcy008) INTO g_stcx_m.amount FROM stcy_t
                WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
               DISPLAY BY NAME g_stcx_m.amount   
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt604_unlock_b("stcy_t","'1'")
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
               LET g_stcy_d[li_reproduce_target].* = g_stcy_d[li_reproduce].*
 
               LET g_stcy_d[li_reproduce_target].stcyseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcy_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcy_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stcy2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcy2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt604_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stcy2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stcy2_d[l_ac].* TO NULL 
            INITIALIZE g_stcy2_d_t.* TO NULL 
            INITIALIZE g_stcy2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_stcy2_d[l_ac].stcz008 = "0"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            SELECT MAX(stczseq)+1 INTO g_stcy2_d[l_ac].stczseq FROM stcz_t
             WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
            IF cl_null(g_stcy2_d[l_ac].stczseq) THEN
               LET g_stcy2_d[l_ac].stczseq = 1
            END IF
            LET g_stcy2_d[l_ac].stczunit = g_stcx_m.stcxunit
            LET g_stcy2_d[l_ac].stczsite = g_stcx_m.stcxsite
            LET g_stcy2_d[l_ac].stcz001 = '1'
            LET g_stcy2_d[l_ac].stcz002 = g_stcx_m.stcx009

            #end add-point
            LET g_stcy2_d_t.* = g_stcy2_d[l_ac].*     #新輸入資料
            LET g_stcy2_d_o.* = g_stcy2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt604_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astt604_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcy2_d[li_reproduce_target].* = g_stcy2_d[li_reproduce].*
 
               LET g_stcy2_d[li_reproduce_target].stczseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            
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
            OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt604_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt604_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcy2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcy2_d[l_ac].stczseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stcy2_d_t.* = g_stcy2_d[l_ac].*  #BACKUP
               LET g_stcy2_d_o.* = g_stcy2_d[l_ac].*  #BACKUP
               CALL astt604_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astt604_set_no_entry_b(l_cmd)
               IF NOT astt604_lock_b("stcz_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt604_bcl2 INTO g_stcy2_d[l_ac].stczseq,g_stcy2_d[l_ac].stcz001,g_stcy2_d[l_ac].stcz002, 
                      g_stcy2_d[l_ac].stcz003,g_stcy2_d[l_ac].stcz005,g_stcy2_d[l_ac].stcz004,g_stcy2_d[l_ac].stcz006, 
                      g_stcy2_d[l_ac].stcz007,g_stcy2_d[l_ac].stcz008,g_stcy2_d[l_ac].stcz009,g_stcy2_d[l_ac].stczsite, 
                      g_stcy2_d[l_ac].stczunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcy2_d_mask_o[l_ac].* =  g_stcy2_d[l_ac].*
                  CALL astt604_stcz_t_mask()
                  LET g_stcy2_d_mask_n[l_ac].* =  g_stcy2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt604_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            LET t_stcz004 = g_stcy2_d[l_ac].stcz004
            LET t_stcz005 = g_stcy2_d[l_ac].stcz005
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
               LET gs_keys[01] = g_stcx_m.stcxdocno
               LET gs_keys[gs_keys.getLength()+1] = g_stcy2_d_t.stczseq
            
               #刪除同層單身
               IF NOT astt604_delete_b('stcz_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt604_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt604_key_delete_b(gs_keys,'stcz_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt604_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astt604_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_stcy_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcy2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM stcz_t 
             WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
               AND stczseq = g_stcy2_d[l_ac].stczseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcx_m.stcxdocno
               LET gs_keys[2] = g_stcy2_d[g_detail_idx].stczseq
               CALL astt604_insert_b('stcz_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stcy_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt604_b_fill()
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
               LET g_stcy2_d[l_ac].* = g_stcy2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt604_bcl2
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
               LET g_stcy2_d[l_ac].* = g_stcy2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astt604_stcz_t_mask_restore('restore_mask_o')
                              
               UPDATE stcz_t SET (stczdocno,stczseq,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006, 
                   stcz007,stcz008,stcz009,stczsite,stczunit) = (g_stcx_m.stcxdocno,g_stcy2_d[l_ac].stczseq, 
                   g_stcy2_d[l_ac].stcz001,g_stcy2_d[l_ac].stcz002,g_stcy2_d[l_ac].stcz003,g_stcy2_d[l_ac].stcz005, 
                   g_stcy2_d[l_ac].stcz004,g_stcy2_d[l_ac].stcz006,g_stcy2_d[l_ac].stcz007,g_stcy2_d[l_ac].stcz008, 
                   g_stcy2_d[l_ac].stcz009,g_stcy2_d[l_ac].stczsite,g_stcy2_d[l_ac].stczunit) #自訂欄位頁簽 
 
                WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
                  AND stczseq = g_stcy2_d_t.stczseq #項次 
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcy2_d[l_ac].* = g_stcy2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcz_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcy2_d[l_ac].* = g_stcy2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcx_m.stcxdocno
               LET gs_keys_bak[1] = g_stcxdocno_t
               LET gs_keys[2] = g_stcy2_d[g_detail_idx].stczseq
               LET gs_keys_bak[2] = g_stcy2_d_t.stczseq
               CALL astt604_update_b('stcz_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astt604_stcz_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stcy2_d[g_detail_idx].stczseq = g_stcy2_d_t.stczseq 
                  ) THEN
                  LET gs_keys[01] = g_stcx_m.stcxdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_stcy2_d_t.stczseq
                  CALL astt604_key_update_b(gs_keys,'stcz_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcx_m),util.JSON.stringify(g_stcy2_d_t)
               LET g_log2 = util.JSON.stringify(g_stcx_m),util.JSON.stringify(g_stcy2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczseq
            #add-point:BEFORE FIELD stczseq name="input.b.page2.stczseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczseq
            
            #add-point:AFTER FIELD stczseq name="input.a.page2.stczseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_stcx_m.stcxdocno IS NOT NULL AND g_stcy2_d[g_detail_idx].stczseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcx_m.stcxdocno != g_stcxdocno_t OR g_stcy2_d[g_detail_idx].stczseq != g_stcy2_d_t.stczseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcz_t WHERE "||"stczent = '" ||g_enterprise|| "' AND "||"stczdocno = '"||g_stcx_m.stcxdocno ||"' AND "|| "stczseq = '"||g_stcy2_d[g_detail_idx].stczseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stczseq
            #add-point:ON CHANGE stczseq name="input.g.page2.stczseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz001
            #add-point:BEFORE FIELD stcz001 name="input.b.page2.stcz001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz001
            
            #add-point:AFTER FIELD stcz001 name="input.a.page2.stcz001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz001
            #add-point:ON CHANGE stcz001 name="input.g.page2.stcz001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz002
            #add-point:BEFORE FIELD stcz002 name="input.b.page2.stcz002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz002
            
            #add-point:AFTER FIELD stcz002 name="input.a.page2.stcz002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz002
            #add-point:ON CHANGE stcz002 name="input.g.page2.stcz002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz003
            
            #add-point:AFTER FIELD stcz003 name="input.a.page2.stcz003"
            LET g_stcy2_d[l_ac].stcz003_desc = ''
            DISPLAY BY NAME g_stcy2_d[l_ac].stcz003_desc
            IF NOT cl_null(g_stcy2_d[l_ac].stcz003) THEN
               IF NOT astt604_stcz003_chk() THEN
                  LET g_stcy2_d[l_ac].stcz003= g_stcy2_d_t.stcz003
                  CALL astt604_stcz003_ref()
                  NEXT FIELD stcz003
               END IF 
            
            END IF
            CALL astt604_stcz003_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz003
            #add-point:BEFORE FIELD stcz003 name="input.b.page2.stcz003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz003
            #add-point:ON CHANGE stcz003 name="input.g.page2.stcz003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz005
            #add-point:BEFORE FIELD stcz005 name="input.b.page2.stcz005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz005
            
            #add-point:AFTER FIELD stcz005 name="input.a.page2.stcz005"
            IF NOT cl_null(g_stcy2_d[l_ac].stcz005) THEN
               IF cl_null(t_stcz005) OR (NOT cl_null(t_stcz005) AND t_stcz005<> g_stcy2_d[l_ac].stcz005) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = '1'
                  LET g_chkparam.arg1 = g_stcy2_d[l_ac].stcz005
                  IF NOT cl_chk_exist("v_imay003_1") THEN
                     LET g_stcy2_d[l_ac].stcz005 = g_stcy2_d_t.stcz005
                     NEXT FIELD stcz005 
                  ELSE
                     CALL astt604_stcz005_other()             
                  END IF 
               END IF
               LET t_stcz005 = g_stcy2_d[l_ac].stcz005
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz005
            #add-point:ON CHANGE stcz005 name="input.g.page2.stcz005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz004
            
            #add-point:AFTER FIELD stcz004 name="input.a.page2.stcz004"
            LET g_stcy2_d[l_ac].stcz004_desc= ''
            DISPLAY BY NAME g_stcy2_d[l_ac].stcz004_desc
            IF NOT cl_null(g_stcy2_d[l_ac].stcz004) THEN 
               IF cl_null(t_stcz004) OR (NOT cl_null(t_stcz004) AND t_stcz004<> g_stcy2_d[l_ac].stcz004) THEN
                  IF NOT astt604_stcz004_chk() THEN
                     LET g_stcy2_d[l_ac].stcz004 = g_stcy2_d_t.stcz004
                     CALL astt604_stcz004_ref()
                     NEXT FIELD stcz004
                  END IF
               END IF
               LET t_stcz004 = g_stcy2_d[l_ac].stcz004
            END IF
            CALL astt604_stcz004_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz004
            #add-point:BEFORE FIELD stcz004 name="input.b.page2.stcz004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz004
            #add-point:ON CHANGE stcz004 name="input.g.page2.stcz004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz006
            #add-point:BEFORE FIELD stcz006 name="input.b.page2.stcz006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz006
            
            #add-point:AFTER FIELD stcz006 name="input.a.page2.stcz006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz006
            #add-point:ON CHANGE stcz006 name="input.g.page2.stcz006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz007
            
            #add-point:AFTER FIELD stcz007 name="input.a.page2.stcz007"
            LET g_stcy2_d[l_ac].stcz007_desc= ''
            DISPLAY BY NAME g_stcy2_d[l_ac].stcz007_desc
            IF NOT cl_null(g_stcy2_d[l_ac].stcz007) THEN 
#此段落由子樣板a19產生
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stcy2_d[l_ac].stcz007
               #160318-00025#35  2016/04/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aim-00005:sub-01302|aooi250|",cl_get_progname("aooi250",g_lang,"2"),"|:EXEPROGaooi250"
               #160318-00025#35  2016/04/15  by pengxin  add(E)
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooca001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
                  LET g_stcy2_d[l_ac].stcz007 = g_stcy2_d_t.stcz007
                  CALL astt604_stcz007_ref()
                  NEXT FIELD stcz007
               END IF
           
            END IF 
            CALL astt604_stcz007_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz007
            #add-point:BEFORE FIELD stcz007 name="input.b.page2.stcz007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz007
            #add-point:ON CHANGE stcz007 name="input.g.page2.stcz007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz008
            #add-point:BEFORE FIELD stcz008 name="input.b.page2.stcz008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz008
            
            #add-point:AFTER FIELD stcz008 name="input.a.page2.stcz008"
            IF NOT cl_null(g_stcy2_d[l_ac].stcz008) THEN
               IF g_stcy2_d[l_ac].stcz008 <= 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aim-00003'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err() 
                  NEXT FIELD stcz008
               END IF         
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz008
            #add-point:ON CHANGE stcz008 name="input.g.page2.stcz008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcz009
            #add-point:BEFORE FIELD stcz009 name="input.b.page2.stcz009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcz009
            
            #add-point:AFTER FIELD stcz009 name="input.a.page2.stcz009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcz009
            #add-point:ON CHANGE stcz009 name="input.g.page2.stcz009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczsite
            #add-point:BEFORE FIELD stczsite name="input.b.page2.stczsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczsite
            
            #add-point:AFTER FIELD stczsite name="input.a.page2.stczsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stczsite
            #add-point:ON CHANGE stczsite name="input.g.page2.stczsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stczunit
            #add-point:BEFORE FIELD stczunit name="input.b.page2.stczunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stczunit
            
            #add-point:AFTER FIELD stczunit name="input.a.page2.stczunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stczunit
            #add-point:ON CHANGE stczunit name="input.g.page2.stczunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.stczseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczseq
            #add-point:ON ACTION controlp INFIELD stczseq name="input.c.page2.stczseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz001
            #add-point:ON ACTION controlp INFIELD stcz001 name="input.c.page2.stcz001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz002
            #add-point:ON ACTION controlp INFIELD stcz002 name="input.c.page2.stcz002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz003
            #add-point:ON ACTION controlp INFIELD stcz003 name="input.c.page2.stcz003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy2_d[l_ac].stcz003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = "pmaa006 = '",g_stcx_m.stcx009,"'"
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stcy2_d[l_ac].stcz003 = g_qryparam.return1              

            DISPLAY g_stcy2_d[l_ac].stcz003 TO stcz003              #
            CALL astt604_stcz003_ref()
            NEXT FIELD stcz003                          #返回原欄位
     

            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz005
            #add-point:ON ACTION controlp INFIELD stcz005 name="input.c.page2.stcz005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy2_d[l_ac].stcz005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_imay003_2()                                #呼叫開窗

            LET g_stcy2_d[l_ac].stcz005 = g_qryparam.return1              

            DISPLAY g_stcy2_d[l_ac].stcz005 TO stcz005              #
            CALL astt604_stcz005_other()
            NEXT FIELD stcz005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz004
            #add-point:ON ACTION controlp INFIELD stcz004 name="input.c.page2.stcz004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy2_d[l_ac].stcz004             #給予default值
            LET g_qryparam.default2 = "" #g_stcy2_d[l_ac].imaal003 #品名
            LET g_qryparam.default3 = "" #g_stcy2_d[l_ac].imaal004 #規格
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_imaa001()                                #呼叫開窗

            LET g_stcy2_d[l_ac].stcz004 = g_qryparam.return1              
            #LET g_stcy2_d[l_ac].imaal003 = g_qryparam.return2 
            #LET g_stcy2_d[l_ac].imaal004 = g_qryparam.return3 
            DISPLAY g_stcy2_d[l_ac].stcz004 TO stcz004              #
            #DISPLAY g_stcy2_d[l_ac].imaal003 TO imaal003 #品名
            #DISPLAY g_stcy2_d[l_ac].imaal004 TO imaal004 #規格
            CALL astt604_stcz004_ref()
            NEXT FIELD stcz004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz006
            #add-point:ON ACTION controlp INFIELD stcz006 name="input.c.page2.stcz006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz007
            #add-point:ON ACTION controlp INFIELD stcz007 name="input.c.page2.stcz007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcy2_d[l_ac].stcz007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooca001_1()                                #呼叫開窗

            LET g_stcy2_d[l_ac].stcz007 = g_qryparam.return1              

            DISPLAY g_stcy2_d[l_ac].stcz007 TO stcz007              #
            CALL astt604_stcz007_ref()
            NEXT FIELD stcz007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz008
            #add-point:ON ACTION controlp INFIELD stcz008 name="input.c.page2.stcz008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcz009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcz009
            #add-point:ON ACTION controlp INFIELD stcz009 name="input.c.page2.stcz009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stczsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczsite
            #add-point:ON ACTION controlp INFIELD stczsite name="input.c.page2.stczsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stczunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stczunit
            #add-point:ON ACTION controlp INFIELD stczunit name="input.c.page2.stczunit"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stcy2_d[l_ac].* = g_stcy2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt604_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt604_unlock_b("stcz_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stcy2_d[li_reproduce_target].* = g_stcy2_d[li_reproduce].*
 
               LET g_stcy2_d[li_reproduce_target].stczseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcy2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcy2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astt604.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
         CALL DIALOG.setCurrentRow("s_detail2",g_detail_idx)
         IF p_cmd = 'a' THEN
            NEXT FIELD stcxsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcyseq
               WHEN "s_detail2"
                  NEXT FIELD stczseq
 
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
            NEXT FIELD stcxdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcyseq
               WHEN "s_detail2"
                  NEXT FIELD stczseq
 
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
 
{<section id="astt604.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt604_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt604_b_fill() #單身填充
      CALL astt604_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt604_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL astt604_stcx011_ref()
   SELECT SUM(stcy008) INTO g_stcx_m.amount FROM stcy_t
    WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
   DISPLAY BY NAME g_stcx_m.amount
   
   IF NOT cl_null(g_stcx_m.stcxdocno) THEN
         CALL s_aooi360_sel('2',g_stcx_m.stcxdocno,'','','','','','','','','','4') RETURNING l_success,g_stcx_m.ooff013
   END IF
   DISPLAY BY NAME g_stcx_m.ooff013
   #end add-point
   
   #遮罩相關處理
   LET g_stcx_m_mask_o.* =  g_stcx_m.*
   CALL astt604_stcx_t_mask()
   LET g_stcx_m_mask_n.* =  g_stcx_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxsite_desc,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001, 
       g_stcx_m.stcx001_desc,g_stcx_m.stcx002,g_stcx_m.stcx002_desc,g_stcx_m.stcx003,g_stcx_m.stcx003_desc, 
       g_stcx_m.stcx004,g_stcx_m.stcx004_desc,g_stcx_m.stcx005,g_stcx_m.stcx005_desc,g_stcx_m.stcxunit, 
       g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.amount,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx009_desc,g_stcx_m.stcx010,g_stcx_m.stcx010_desc,g_stcx_m.stcx011,g_stcx_m.stcx011_desc, 
       g_stcx_m.ooff013,g_stcx_m.stcxownid,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxcrtdt, 
       g_stcx_m.stcxmodid,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfid_desc, 
       g_stcx_m.stcxcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcx_m.stcxstus 
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
   FOR l_ac = 1 TO g_stcy_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stcy2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt604_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt604_detail_show()
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
 
{<section id="astt604.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt604_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stcx_t.stcxdocno 
   DEFINE l_oldno     LIKE stcx_t.stcxdocno 
 
   DEFINE l_master    RECORD LIKE stcx_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stcy_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stcz_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
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
   
   IF g_stcx_m.stcxdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
    
   LET g_stcx_m.stcxdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcx_m.stcxownid = g_user
      LET g_stcx_m.stcxowndp = g_dept
      LET g_stcx_m.stcxcrtid = g_user
      LET g_stcx_m.stcxcrtdp = g_dept 
      LET g_stcx_m.stcxcrtdt = cl_get_current()
      LET g_stcx_m.stcxmodid = g_user
      LET g_stcx_m.stcxmoddt = cl_get_current()
      LET g_stcx_m.stcxstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_stcx_m.stcxdocdt = g_today
   #dongsz--add--str---
   #預設單據的單別
   LET r_success = ''
   LET r_doctype = ''
   LET g_site_flag = FALSE  
   CALL s_arti200_get_def_doc_type(g_stcx_m.stcxsite,g_prog,'1')
        RETURNING r_success,r_doctype
   LET g_stcx_m.stcxdocno = r_doctype
   #dongsz--add--end---
   LET g_stcx_m.stcx004 = g_user
   CALL astt604_stcx004_ref()
   LET g_stcx_m.stcx005 = g_dept
   CALL astt604_stcx005_ref()
   LET g_stcx_m_t.* = g_stcx_m.*
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcx_m.stcxstus 
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
   
   
   CALL astt604_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stcx_m.* TO NULL
      INITIALIZE g_stcy_d TO NULL
      INITIALIZE g_stcy2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt604_show()
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
   CALL astt604_set_act_visible()   
   CALL astt604_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcxent = " ||g_enterprise|| " AND",
                      " stcxdocno = '", g_stcx_m.stcxdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt604_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt604_idx_chk()
   
   LET g_data_owner = g_stcx_m.stcxownid      
   LET g_data_dept  = g_stcx_m.stcxowndp
   
   #功能已完成,通報訊息中心
   CALL astt604_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt604_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stcy_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stcz_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt604_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcy_t
    WHERE stcyent = g_enterprise AND stcydocno = g_stcxdocno_t
 
    INTO TEMP astt604_detail
 
   #將key修正為調整後   
   UPDATE astt604_detail 
      #更新key欄位
      SET stcydocno = g_stcx_m.stcxdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stcy_t SELECT * FROM astt604_detail
   
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
   DROP TABLE astt604_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcz_t 
    WHERE stczent = g_enterprise AND stczdocno = g_stcxdocno_t
 
    INTO TEMP astt604_detail
 
   #將key修正為調整後   
   UPDATE astt604_detail SET stczdocno = g_stcx_m.stcxdocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stcz_t SELECT * FROM astt604_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt604_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt604_delete()
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
   
   IF g_stcx_m.stcxdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt604_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt604_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT astt604_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcx_m_mask_o.* =  g_stcx_m.*
   CALL astt604_stcx_t_mask()
   LET g_stcx_m_mask_n.* =  g_stcx_m.*
   
   CALL astt604_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt604_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stcxdocno_t = g_stcx_m.stcxdocno
 
 
      DELETE FROM stcx_t
       WHERE stcxent = g_enterprise AND stcxdocno = g_stcx_m.stcxdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stcx_m.stcxdocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stcy_t
       WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
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
      DELETE FROM stcz_t
       WHERE stczent = g_enterprise AND
             stczdocno = g_stcx_m.stcxdocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stcx_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt604_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stcy_d.clear() 
      CALL g_stcy2_d.clear()       
 
     
      CALL astt604_ui_browser_refresh()  
      #CALL astt604_ui_headershow()  
      #CALL astt604_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt604_browser_fill("")
         CALL astt604_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt604_cl
 
   #功能已完成,通報訊息中心
   CALL astt604_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt604.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt604_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stcy_d.clear()
   CALL g_stcy2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt604_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcyseq,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006,stcy007, 
             stcy008,stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018, 
             stcy019,stcy020,stcy021,stcy022,stcy023,stcysite,stcyunit ,t1.pmaal004 ,t2.stael003 FROM stcy_t", 
                
                     " INNER JOIN stcx_t ON stcxent = " ||g_enterprise|| " AND stcxdocno = stcydocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN pmaal_t t1 ON t1.pmaalent="||g_enterprise||" AND t1.pmaal001=stcy003 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=stcy004 AND t2.stael002='"||g_dlang||"' ",
 
                     " WHERE stcyent=? AND stcydocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcy_t.stcyseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt604_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt604_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stcx_m.stcxdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stcx_m.stcxdocno INTO g_stcy_d[l_ac].stcyseq,g_stcy_d[l_ac].stcy001, 
          g_stcy_d[l_ac].stcy002,g_stcy_d[l_ac].stcy003,g_stcy_d[l_ac].stcy004,g_stcy_d[l_ac].stcy005, 
          g_stcy_d[l_ac].stcy006,g_stcy_d[l_ac].stcy007,g_stcy_d[l_ac].stcy008,g_stcy_d[l_ac].stcy009, 
          g_stcy_d[l_ac].stcy010,g_stcy_d[l_ac].stcy011,g_stcy_d[l_ac].stcy012,g_stcy_d[l_ac].stcy013, 
          g_stcy_d[l_ac].stcy014,g_stcy_d[l_ac].stcy015,g_stcy_d[l_ac].stcy016,g_stcy_d[l_ac].stcy017, 
          g_stcy_d[l_ac].stcy018,g_stcy_d[l_ac].stcy019,g_stcy_d[l_ac].stcy020,g_stcy_d[l_ac].stcy021, 
          g_stcy_d[l_ac].stcy022,g_stcy_d[l_ac].stcy023,g_stcy_d[l_ac].stcysite,g_stcy_d[l_ac].stcyunit, 
          g_stcy_d[l_ac].stcy003_desc,g_stcy_d[l_ac].stcy004_desc   #(ver:78)
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
   IF astt604_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stczseq,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006,stcz007, 
             stcz008,stcz009,stczsite,stczunit ,t3.pmaal004 ,t4.imaal003 ,t5.oocal003 FROM stcz_t",  
               
                     " INNER JOIN  stcx_t ON stcxent = " ||g_enterprise|| " AND stcxdocno = stczdocno ",
 
                     "",
                     
                                    " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=stcz003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t4 ON t4.imaalent="||g_enterprise||" AND t4.imaal001=stcz004 AND t4.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t5 ON t5.oocalent="||g_enterprise||" AND t5.oocal001=stcz007 AND t5.oocal002='"||g_dlang||"' ",
 
                     " WHERE stczent=? AND stczdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcz_t.stczseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt604_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astt604_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stcx_m.stcxdocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stcx_m.stcxdocno INTO g_stcy2_d[l_ac].stczseq,g_stcy2_d[l_ac].stcz001, 
          g_stcy2_d[l_ac].stcz002,g_stcy2_d[l_ac].stcz003,g_stcy2_d[l_ac].stcz005,g_stcy2_d[l_ac].stcz004, 
          g_stcy2_d[l_ac].stcz006,g_stcy2_d[l_ac].stcz007,g_stcy2_d[l_ac].stcz008,g_stcy2_d[l_ac].stcz009, 
          g_stcy2_d[l_ac].stczsite,g_stcy2_d[l_ac].stczunit,g_stcy2_d[l_ac].stcz003_desc,g_stcy2_d[l_ac].stcz004_desc, 
          g_stcy2_d[l_ac].stcz007_desc   #(ver:78)
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
   
   CALL g_stcy_d.deleteElement(g_stcy_d.getLength())
   CALL g_stcy2_d.deleteElement(g_stcy2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt604_pb
   FREE astt604_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stcy_d.getLength()
      LET g_stcy_d_mask_o[l_ac].* =  g_stcy_d[l_ac].*
      CALL astt604_stcy_t_mask()
      LET g_stcy_d_mask_n[l_ac].* =  g_stcy_d[l_ac].*
   END FOR
   
   LET g_stcy2_d_mask_o.* =  g_stcy2_d.*
   FOR l_ac = 1 TO g_stcy2_d.getLength()
      LET g_stcy2_d_mask_o[l_ac].* =  g_stcy2_d[l_ac].*
      CALL astt604_stcz_t_mask()
      LET g_stcy2_d_mask_n[l_ac].* =  g_stcy2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt604_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stcy_t
       WHERE stcyent = g_enterprise AND
         stcydocno = ps_keys_bak[1] AND stcyseq = ps_keys_bak[2]
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
         CALL g_stcy_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stcz_t
       WHERE stczent = g_enterprise AND
             stczdocno = ps_keys_bak[1] AND stczseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcy2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt604_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stcy_t
                  (stcyent,
                   stcydocno,
                   stcyseq
                   ,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006,stcy007,stcy008,stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018,stcy019,stcy020,stcy021,stcy022,stcy023,stcysite,stcyunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcy_d[g_detail_idx].stcy001,g_stcy_d[g_detail_idx].stcy002,g_stcy_d[g_detail_idx].stcy003, 
                       g_stcy_d[g_detail_idx].stcy004,g_stcy_d[g_detail_idx].stcy005,g_stcy_d[g_detail_idx].stcy006, 
                       g_stcy_d[g_detail_idx].stcy007,g_stcy_d[g_detail_idx].stcy008,g_stcy_d[g_detail_idx].stcy009, 
                       g_stcy_d[g_detail_idx].stcy010,g_stcy_d[g_detail_idx].stcy011,g_stcy_d[g_detail_idx].stcy012, 
                       g_stcy_d[g_detail_idx].stcy013,g_stcy_d[g_detail_idx].stcy014,g_stcy_d[g_detail_idx].stcy015, 
                       g_stcy_d[g_detail_idx].stcy016,g_stcy_d[g_detail_idx].stcy017,g_stcy_d[g_detail_idx].stcy018, 
                       g_stcy_d[g_detail_idx].stcy019,g_stcy_d[g_detail_idx].stcy020,g_stcy_d[g_detail_idx].stcy021, 
                       g_stcy_d[g_detail_idx].stcy022,g_stcy_d[g_detail_idx].stcy023,g_stcy_d[g_detail_idx].stcysite, 
                       g_stcy_d[g_detail_idx].stcyunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stcy_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stcz_t
                  (stczent,
                   stczdocno,
                   stczseq
                   ,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006,stcz007,stcz008,stcz009,stczsite,stczunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcy2_d[g_detail_idx].stcz001,g_stcy2_d[g_detail_idx].stcz002,g_stcy2_d[g_detail_idx].stcz003, 
                       g_stcy2_d[g_detail_idx].stcz005,g_stcy2_d[g_detail_idx].stcz004,g_stcy2_d[g_detail_idx].stcz006, 
                       g_stcy2_d[g_detail_idx].stcz007,g_stcy2_d[g_detail_idx].stcz008,g_stcy2_d[g_detail_idx].stcz009, 
                       g_stcy2_d[g_detail_idx].stczsite,g_stcy2_d[g_detail_idx].stczunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcy2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt604_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcy_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt604_stcy_t_mask_restore('restore_mask_o')
               
      UPDATE stcy_t 
         SET (stcydocno,
              stcyseq
              ,stcy001,stcy002,stcy003,stcy004,stcy005,stcy006,stcy007,stcy008,stcy009,stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018,stcy019,stcy020,stcy021,stcy022,stcy023,stcysite,stcyunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcy_d[g_detail_idx].stcy001,g_stcy_d[g_detail_idx].stcy002,g_stcy_d[g_detail_idx].stcy003, 
                  g_stcy_d[g_detail_idx].stcy004,g_stcy_d[g_detail_idx].stcy005,g_stcy_d[g_detail_idx].stcy006, 
                  g_stcy_d[g_detail_idx].stcy007,g_stcy_d[g_detail_idx].stcy008,g_stcy_d[g_detail_idx].stcy009, 
                  g_stcy_d[g_detail_idx].stcy010,g_stcy_d[g_detail_idx].stcy011,g_stcy_d[g_detail_idx].stcy012, 
                  g_stcy_d[g_detail_idx].stcy013,g_stcy_d[g_detail_idx].stcy014,g_stcy_d[g_detail_idx].stcy015, 
                  g_stcy_d[g_detail_idx].stcy016,g_stcy_d[g_detail_idx].stcy017,g_stcy_d[g_detail_idx].stcy018, 
                  g_stcy_d[g_detail_idx].stcy019,g_stcy_d[g_detail_idx].stcy020,g_stcy_d[g_detail_idx].stcy021, 
                  g_stcy_d[g_detail_idx].stcy022,g_stcy_d[g_detail_idx].stcy023,g_stcy_d[g_detail_idx].stcysite, 
                  g_stcy_d[g_detail_idx].stcyunit) 
         WHERE stcyent = g_enterprise AND stcydocno = ps_keys_bak[1] AND stcyseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcy_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcy_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt604_stcy_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcz_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astt604_stcz_t_mask_restore('restore_mask_o')
               
      UPDATE stcz_t 
         SET (stczdocno,
              stczseq
              ,stcz001,stcz002,stcz003,stcz005,stcz004,stcz006,stcz007,stcz008,stcz009,stczsite,stczunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcy2_d[g_detail_idx].stcz001,g_stcy2_d[g_detail_idx].stcz002,g_stcy2_d[g_detail_idx].stcz003, 
                  g_stcy2_d[g_detail_idx].stcz005,g_stcy2_d[g_detail_idx].stcz004,g_stcy2_d[g_detail_idx].stcz006, 
                  g_stcy2_d[g_detail_idx].stcz007,g_stcy2_d[g_detail_idx].stcz008,g_stcy2_d[g_detail_idx].stcz009, 
                  g_stcy2_d[g_detail_idx].stczsite,g_stcy2_d[g_detail_idx].stczunit) 
         WHERE stczent = g_enterprise AND stczdocno = ps_keys_bak[1] AND stczseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcz_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcz_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt604_stcz_t_mask_restore('restore_mask_n')
 
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
 
{<section id="astt604.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt604_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt604.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt604_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt604.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt604_lock_b(ps_table,ps_page)
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
   #CALL astt604_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stcy_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt604_bcl USING g_enterprise,
                                       g_stcx_m.stcxdocno,g_stcy_d[g_detail_idx].stcyseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt604_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stcz_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt604_bcl2 USING g_enterprise,
                                             g_stcx_m.stcxdocno,g_stcy2_d[g_detail_idx].stczseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt604_bcl2:",SQLERRMESSAGE 
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
 
{<section id="astt604.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt604_unlock_b(ps_table,ps_page)
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
      CLOSE astt604_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt604_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt604_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stcxdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stcxdocno",TRUE)
      CALL cl_set_comp_entry("stcxdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("xmdasite",TRUE)
      CALL cl_set_comp_entry("stcxsite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt604_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stcxdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stcxdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stcxdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF g_stcy_d.getLength() > 0 OR g_stcy2_d.getLength() > 0 THEN
      CALL cl_set_comp_entry("stcx008,stcx009",FALSE)
   ELSE
      CALL cl_set_comp_entry("stcx008,stcx009",TRUE)
   END IF
   IF p_cmd = 'a' AND g_flag2 THEN
      CALL cl_set_comp_entry("stcxsite",FALSE)
   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stcxsite') OR g_site_flag   THEN
      CALL cl_set_comp_entry("stcxsite",FALSE)
   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stcxunit') THEN
      CALL cl_set_comp_entry("stcxunit",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt604_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   DEFINE l_stcy005 LIKE stcy_t.stcy005
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   IF NOT cl_null(g_stcy_d[l_ac].stcy004) THEN
       #抓取价款类型
      SELECT stae006 INTO  l_stcy005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcy_d[l_ac].stcy004
      IF l_stcy005 = '3' THEN
         CALL cl_set_comp_entry('stcy005',TRUE)
      ELSE
         CALL cl_set_comp_entry('stcy005',FALSE)
      END IF    
   END IF
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt604_set_no_entry_b(p_cmd)
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
 
{<section id="astt604.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt604_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt604_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stcx_m.stcxstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt604_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt604.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt604_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt604.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt604_default_search()
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
      LET ls_wc = ls_wc, " stcxdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stcx_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcy_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcz_t" 
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
 
{<section id="astt604.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt604_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stcx_m.stcxdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt604_cl USING g_enterprise,g_stcx_m.stcxdocno
   IF STATUS THEN
      CLOSE astt604_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt604_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
       g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
       g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtdp, 
       g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt, 
       g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc,g_stcx_m.stcx004_desc, 
       g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxcnfid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT astt604_action_chk() THEN
      CLOSE astt604_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxsite_desc,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno,g_stcx_m.stcx001, 
       g_stcx_m.stcx001_desc,g_stcx_m.stcx002,g_stcx_m.stcx002_desc,g_stcx_m.stcx003,g_stcx_m.stcx003_desc, 
       g_stcx_m.stcx004,g_stcx_m.stcx004_desc,g_stcx_m.stcx005,g_stcx_m.stcx005_desc,g_stcx_m.stcxunit, 
       g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.amount,g_stcx_m.stcx008,g_stcx_m.stcx009, 
       g_stcx_m.stcx009_desc,g_stcx_m.stcx010,g_stcx_m.stcx010_desc,g_stcx_m.stcx011,g_stcx_m.stcx011_desc, 
       g_stcx_m.ooff013,g_stcx_m.stcxownid,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp,g_stcx_m.stcxowndp_desc, 
       g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxcrtdt, 
       g_stcx_m.stcxmodid,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfid_desc, 
       g_stcx_m.stcxcnfdt
 
   CASE g_stcx_m.stcxstus
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
         CASE g_stcx_m.stcxstus
            
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
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stcx_m.stcxstus
         WHEN "N"
            CALL cl_set_act_visible("unconfirmed,hold",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "Y"
            HIDE OPTION "invalid"
         WHEN "X"
            HIDE OPTION "confirmed"
            HIDE OPTION "unconfirmed"
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN
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
            IF NOT astt604_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt604_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt604_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt604_cl
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
      g_stcx_m.stcxstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt604_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   LET l_success = TRUE
   CASE lc_state 
      WHEN 'Y'       
         CALL s_astt604_conf_chk(g_stcx_m.stcxdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astt604_conf_upd(g_stcx_m.stcxdocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stcx_m.stcxdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                   CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN            
            END IF
         ELSE
            IF NOT cl_null(g_errno) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = g_errno
               LET g_errparam.extend = g_stcx_m.stcxdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN            
         END IF         
      WHEN 'X'
         CALL s_astt604_void_chk(g_stcx_m.stcxdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt604_void_upd(g_stcx_m.stcxdocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stcx_m.stcxdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stcx_m.stcxdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
         
       WHEN 'N' 
         CALL s_astt604_unconf_chk(g_stcx_m.stcxdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt604_unconf_upd(g_stcx_m.stcxdocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stcx_m.stcxdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stcx_m.stcxdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
   END CASE	  
   #end add-point
   
   LET g_stcx_m.stcxmodid = g_user
   LET g_stcx_m.stcxmoddt = cl_get_current()
   LET g_stcx_m.stcxstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stcx_t 
      SET (stcxstus,stcxmodid,stcxmoddt) 
        = (g_stcx_m.stcxstus,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt)     
    WHERE stcxent = g_enterprise AND stcxdocno = g_stcx_m.stcxdocno
 
    
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
      EXECUTE astt604_master_referesh USING g_stcx_m.stcxdocno INTO g_stcx_m.stcxsite,g_stcx_m.stcxdocdt, 
          g_stcx_m.stcxdocno,g_stcx_m.stcx001,g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx004,g_stcx_m.stcx005, 
          g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.stcx008,g_stcx_m.stcx009, 
          g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcxownid,g_stcx_m.stcxowndp,g_stcx_m.stcxcrtid, 
          g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid, 
          g_stcx_m.stcxcnfdt,g_stcx_m.stcxsite_desc,g_stcx_m.stcx001_desc,g_stcx_m.stcx002_desc,g_stcx_m.stcx003_desc, 
          g_stcx_m.stcx004_desc,g_stcx_m.stcx005_desc,g_stcx_m.stcx009_desc,g_stcx_m.stcx010_desc,g_stcx_m.stcxownid_desc, 
          g_stcx_m.stcxowndp_desc,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp_desc,g_stcx_m.stcxmodid_desc, 
          g_stcx_m.stcxcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stcx_m.stcxsite,g_stcx_m.stcxsite_desc,g_stcx_m.stcxdocdt,g_stcx_m.stcxdocno, 
          g_stcx_m.stcx001,g_stcx_m.stcx001_desc,g_stcx_m.stcx002,g_stcx_m.stcx002_desc,g_stcx_m.stcx003, 
          g_stcx_m.stcx003_desc,g_stcx_m.stcx004,g_stcx_m.stcx004_desc,g_stcx_m.stcx005,g_stcx_m.stcx005_desc, 
          g_stcx_m.stcxunit,g_stcx_m.stcxstus,g_stcx_m.stcx006,g_stcx_m.stcx007,g_stcx_m.amount,g_stcx_m.stcx008, 
          g_stcx_m.stcx009,g_stcx_m.stcx009_desc,g_stcx_m.stcx010,g_stcx_m.stcx010_desc,g_stcx_m.stcx011, 
          g_stcx_m.stcx011_desc,g_stcx_m.ooff013,g_stcx_m.stcxownid,g_stcx_m.stcxownid_desc,g_stcx_m.stcxowndp, 
          g_stcx_m.stcxowndp_desc,g_stcx_m.stcxcrtid,g_stcx_m.stcxcrtid_desc,g_stcx_m.stcxcrtdp,g_stcx_m.stcxcrtdp_desc, 
          g_stcx_m.stcxcrtdt,g_stcx_m.stcxmodid,g_stcx_m.stcxmodid_desc,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid, 
          g_stcx_m.stcxcnfid_desc,g_stcx_m.stcxcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   SELECT   stcxmodid,stcxmoddt,stcxcnfid,stcxcnfdt INTO  g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt FROM stcx_t
    WHERE stcxent = g_enterprise AND stcxdocno = g_stcx_m.stcxdocno
   DISPLAY BY NAME g_stcx_m.stcxmodid,g_stcx_m.stcxmoddt,g_stcx_m.stcxcnfid,g_stcx_m.stcxcnfdt
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt604_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt604_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt604.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt604_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stcy_d.getLength() THEN
         LET g_detail_idx = g_stcy_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcy_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcy_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stcy2_d.getLength() THEN
         LET g_detail_idx = g_stcy2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcy2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcy2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt604_b_fill2(pi_idx)
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
   
   CALL astt604_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt604_fill_chk(ps_idx)
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
 
{<section id="astt604.status_show" >}
PRIVATE FUNCTION astt604_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt604.mask_functions" >}
&include "erp/ast/astt604_mask.4gl"
 
{</section>}
 
{<section id="astt604.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt604_send()
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
 
 
   CALL astt604_show()
   CALL astt604_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt604_conf_chk(g_stcx_m.stcxdocno) RETURNING l_success,g_errno
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = g_errno 
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stcx_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stcy_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_stcy2_d))
 
 
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
   #CALL astt604_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt604_ui_headershow()
   CALL astt604_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt604_draw_out()
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
   CALL astt604_ui_headershow()  
   CALL astt604_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt604.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt604_set_pk_array()
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
   LET g_pk_array[1].values = g_stcx_m.stcxdocno
   LET g_pk_array[1].column = 'stcxdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt604.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt604.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt604_msgcentre_notify(lc_state)
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
   CALL astt604_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stcx_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt604.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt604_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stcxstus  INTO g_stcx_m.stcxstus
     FROM stcx_t
    WHERE stcxent = g_enterprise
      AND stcxdocno = g_stcx_m.stcxdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stcx_m.stcxstus
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
        LET g_errparam.extend = g_stcx_m.stcxdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt604_set_act_visible()
        CALL astt604_set_act_no_visible()
        CALL astt604_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt604.other_function" readonly="Y" >}

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
PUBLIC FUNCTION astt604_stcxsite_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcxsite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcxsite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcxsite_desc
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
PUBLIC FUNCTION astt604_stcx004_ref()
   INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stcx_m.stcx004
    CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
    LET g_stcx_m.stcx004_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stcx_m.stcx004_desc
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
PUBLIC FUNCTION astt604_stcx005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx005
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx005_desc
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
PUBLIC FUNCTION astt604_stcx001_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx001
   CALL ap_ref_array2(g_ref_fields,"SELECT prcdl003 FROM prcdl_t WHERE prcdlent='"||g_enterprise||"' AND prcdl001=? AND prcdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx001_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx001_desc
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
PUBLIC FUNCTION astt604_stcx009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx009
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx009_desc
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
PUBLIC FUNCTION astt604_stcx010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx010
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx010_desc
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
PUBLIC FUNCTION astt604_stcx011_ref()
DEFINE l_ooef019    LIKE ooef_t.ooef019
 
    SELECT ooef019 INTO l_ooef019 FROM ooef_t 
     WHERE ooefent = g_enterprise AND ooef001 = g_site 
    
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stcx_m.stcx011
    CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stcx_m.stcx011_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stcx_m.stcx011_desc
   
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
PUBLIC FUNCTION astt604_stcy003_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stcy_d[l_ac].stcy003
    CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stcy_d[l_ac].stcy003_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stcy_d[l_ac].stcy003_desc
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
PUBLIC FUNCTION astt604_stcy004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcy_d[l_ac].stcy004
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcy_d[l_ac].stcy004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcy_d[l_ac].stcy004_desc
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
PUBLIC FUNCTION astt604_stcz003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcy2_d[l_ac].stcz003
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcy2_d[l_ac].stcz003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcy2_d[l_ac].stcz003_desc
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
PUBLIC FUNCTION astt604_stcz004_ref()
DEFINE  l_imay001   LIKE imay_t.imay001

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcy2_d[l_ac].stcz004
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcy2_d[l_ac].stcz004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcy2_d[l_ac].stcz004_desc
  
   IF cl_null (g_stcy2_d[l_ac].stcz005) THEN  
     SELECT imay003,imay004 INTO g_stcy2_d[l_ac].stcz005,g_stcy2_d[l_ac].stcz007 FROM imay_t
      WHERE imayent = g_enterprise AND imay001 = g_stcy2_d[l_ac].stcz004 AND imay006 = 'Y'
     IF STATUS = 100 THEN
        LET g_stcy2_d[l_ac].stcz005 = ''
     END IF
   ELSE
      SELECT imay001 INTO l_imay001 FROM imay_t
       WHERE imayent = g_enterprise AND imay003 = g_stcy2_d[l_ac].stcz005
      IF l_imay001 <> g_stcy2_d[l_ac].stcz004 THEN
         SELECT imay003,imay004 INTO g_stcy2_d[l_ac].stcz005,g_stcy2_d[l_ac].stcz007 FROM imay_t
          WHERE imayent = g_enterprise AND imay001 = g_stcy2_d[l_ac].stcz004 AND imay006 = 'Y' 
         IF STATUS = 100 THEN
            LET g_stcy2_d[l_ac].stcz005 = ''
         END IF 
      END IF
   END IF  
   DISPLAY BY NAME g_stcy2_d[l_ac].stcz005
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
PUBLIC FUNCTION astt604_date_range_chk()
DEFINE  l_stce017  LIKE stce_t.stce017
DEFINE  l_stce018  LIKE stce_t.stce018

   IF NOT cl_null(g_stcx_m.stcx006) AND NOT cl_null(g_stcx_m.stcx007) THEN
      IF g_stcx_m.stcx006 > g_stcx_m.stcx007 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aoo-00122'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF 
   END IF
   
   #合同不为空时候。生效范围应在合同的生效范围之内
   IF NOT cl_null(g_stcx_m.stcx008) THEN 
      SELECT stce017,stce018 INTO l_stce017,l_stce018 FROM stce_t 
       WHERE stceent = g_enterprise AND stce001 = g_stcx_m.stcx008
 
      IF (NOT (l_stce017 <=g_stcx_m.stcx006 AND g_stcx_m.stcx006 <= l_stce018)) OR (NOT(l_stce017 <=g_stcx_m.stcx007 AND g_stcx_m.stcx007 <= l_stce018))  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00096'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
        
         RETURN FALSE
      END IF           
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
PUBLIC FUNCTION astt604_stcx008_other()

   SELECT stce009,stce021,stce022 INTO g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011
     FROM stce_t WHERE stceent = g_enterprise AND stce001 = g_stcx_m.stcx008

   DISPLAY BY NAME g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011
   CALL astt604_stcx009_ref()
   CALL astt604_stcx010_ref()
   CALL astt604_stcx011_ref()
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
PUBLIC FUNCTION astt604_stcx001_other()
   
   SELECT prcd002,prcd003,prcd004,prcd005 
     INTO g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx006,g_stcx_m.stcx007 FROM prcd_t
    WHERE prcdent = g_enterprise AND prcd001 =g_stcx_m.stcx001 
   DISPLAY BY NAME g_stcx_m.stcx002,g_stcx_m.stcx003,g_stcx_m.stcx006,g_stcx_m.stcx007
   CALL astt604_stcx002_ref()
   CALL astt604_stcx003_ref()
   
   
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
PUBLIC FUNCTION astt604_stcx002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx002
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2100' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx002_desc
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
PUBLIC FUNCTION astt604_stcx003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcx_m.stcx003
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2101' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcx_m.stcx003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcx_m.stcx003_desc
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
PUBLIC FUNCTION astt604_stcx009_chk()
DEFINE  l_n   LIKE type_t.num5

   #检查经销商基本资料是否存在且有效
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = g_stcx_m.stcx009
   #160318-00025#35  2016/04/15  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "apm-00638:sub-01302|adbm200|",cl_get_progname("adbm200",g_lang,"2"),"|:EXEPROGadbm200"
   #160318-00025#35  2016/04/15  by pengxin  add(E)
   IF NOT cl_chk_exist("v_pmaa001_17") THEN
      RETURN FALSE
   END IF
   
   #检查经销商是否签订分销合同
   SELECT COUNT(*) INTO l_n FROM stce_t
    WHERE stceent = g_enterprise AND stce009 = g_stcx_m.stcx009 
      
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00166'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   ELSE
      SELECT COUNT(*) INTO l_n FROM stce_t
       WHERE stceent = g_enterprise AND stce009 = g_stcx_m.stcx009 AND stcestus = 'Y'
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00167'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      
      ELSE
         #经销商签订的合约有多笔不带出合约
         IF l_n = 1 THEN
            SELECT stce001 INTO  g_stcx_m.stcx008 FROM stce_t
             WHERE stceent = g_enterprise AND stce009 = g_stcx_m.stcx009 AND stcestus = 'Y' 
            DISPLAY BY NAME  g_stcx_m.stcx008 
            CALL astt604_stcx008_other()
         END IF      
      END IF    
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
PUBLIC FUNCTION astt604_stcx011_chk()
DEFINE  l_oodcstus   LIKE oodc_t.oodcstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodcstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise AND oodb001 = ooef019 AND oodb002 = g_stcx_m.stcx011 AND oodb004 = '1'
      AND ooefent = g_enterprise AND ooef001 = g_site
   CASE
      WHEN SQLCA.sqlcode = 100 LET g_errno = 'aoo-00222' #稅目不存在                           
#      WHEN l_oodcstus <> 'Y'   LET g_errno = 'aoo-00223' #稅目已無效     #160318-00005#45  mark
      WHEN l_oodcstus <> 'Y'   LET g_errno = 'sub-01302' #稅目已無效      #160318-00005#45  add
   END CASE
   IF cl_null(g_errno) THEN
      RETURN TRUE
   ELSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = ''
      #160318-00005#45 --s add
      CASE g_errno
         WHEN 'sub-01302'
            LET g_errparam.replace[1] = 'aooi610'
            LET g_errparam.replace[2] = cl_get_progname('aooi610',g_lang,"2")
            LET g_errparam.exeprog = 'aooi610'
      END CASE
      #160318-00005#45 --e add
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
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
PUBLIC FUNCTION astt604_stcy003_chk()
DEFINE    l_pmaa006   LIKE pmaa_t.pmaa006

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stcy_d[l_ac].stcy003 
   #160318-00025#35  2016/04/15  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
   #160318-00025#35  2016/04/15  by pengxin  add(E)
   IF NOT cl_chk_exist("v_pmaa001_21") THEN
      RETURN FALSE
   END IF
   
   SELECT pmaa006 INTO l_pmaa006 FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 =  g_stcy_d[l_ac].stcy003 
   IF l_pmaa006 <> g_stcx_m.stcx009 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "ast-00169"
      LET g_errparam.extend = ''
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
PUBLIC FUNCTION astt604_stcy004_chk()
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stcy_d[l_ac].stcy004
   IF NOT cl_chk_exist("v_stae001_1") THEN
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
PUBLIC FUNCTION astt604_stcz003_chk()
DEFINE    l_pmaa006   LIKE pmaa_t.pmaa006

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stcy2_d[l_ac].stcz003 
   #160318-00025#35  2016/04/15  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
   #160318-00025#35  2016/04/15  by pengxin  add(E)
   IF NOT cl_chk_exist("v_pmaa001_21") THEN
      RETURN FALSE
   END IF
   
   SELECT pmaa006 INTO l_pmaa006 FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 = g_stcy2_d[l_ac].stcz003 
   IF l_pmaa006 <> g_stcx_m.stcx009 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "ast-00169"
      LET g_errparam.extend = ''
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
PUBLIC FUNCTION astt604_stcz005_other()
   SELECT  imay001,imay004 INTO  g_stcy2_d[l_ac].stcz004,g_stcy2_d[l_ac].stcz007 FROM imay_t
    WHERE  imayent = g_enterprise AND imay003 =  g_stcy2_d[l_ac].stcz005
   CALL astt604_stcz004_ref()
     
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
PUBLIC FUNCTION astt604_stcxdocdt_chk()
DEFINE l_stce024    LIKE stce_t.stce024
DEFINE r_success    LIKE type_t.num5
DEFINE r_errno      LIKE type_t.chr1000

   #合同不为空时检查关账日期
   IF NOT cl_null(g_stcx_m.stcx008) THEN
      #结算中心
      SELECT stce024 INTO l_stce024 FROM stce_t 
       WHERE stceent = g_enterprise AND stce001 =g_stcx_m.stcx008 
      CALL s_asti206_check(l_stce024,g_stcx_m.stcxdocdt,"astt604") RETURNING r_success,r_errno
      IF NOT r_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = r_errno
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err() 
         RETURN FALSE
      END IF
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
PUBLIC FUNCTION astt604_stcx008_chk()
DEFINE l_n       LIKE type_t.num5
DEFINE l_stce009 LIKE stce_t.stce009

   #检查合约
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stcx_m.stcx008
   IF NOT cl_chk_exist("v_stce001_3") THEN
      RETURN FALSE     
   END IF
   IF NOT astt604_date_range_chk() THEN
      RETURN FALSE
   END IF 
   #检查关账日期
   IF NOT cl_null(g_stcx_m.stcxdocdt) THEN
      IF NOT astt604_stcxdocdt_chk() THEN
         RETURN FALSE  
      END IF
   END IF  
   
   SELECT stce009 INTO l_stce009 FROM stce_t 
    WHERE stceent = g_enterprise AND stce001 = g_stcx_m.stcx008     
   #单身不为空时，检查网点是否符合合约的经销商
   IF g_stcy_d.getLength() > 0 THEN
      SELECT COUNT(*) INTO l_n FROM stcy_t
       WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
         AND NOT EXISTS (SELECT 1 FROM  pmaa_t
                          WHERE pmaaent = g_enterprise AND pmaa001 = stcy003 AND pmaa006 = l_stce009)
      
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00179'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err() 
         RETURN FALSE
      END IF
   END IF
   
   IF g_stcy2_d.getLength() > 0 THEN
      SELECT COUNT(*) INTO l_n FROM stcz_t
       WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
         AND NOT EXISTS (SELECT 1 FROM  pmaa_t
                          WHERE pmaaent = g_enterprise AND pmaa001 = stcz003 AND pmaa006 = l_stce009)
      
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00179'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err() 
         RETURN FALSE
      END IF
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
PUBLIC FUNCTION astt604_upd_stcy_stcz()
#DEFINE  l_stce   RECORD LIKE stce_t.*   #161111-00028#3--MARK
#161111-00028#3---ADD-----BEGIN---------
DEFINE l_stce RECORD  #分銷合約主檔
       stceent LIKE stce_t.stceent, #企業編號
       stcesite LIKE stce_t.stcesite, #NO USE
       stceunit LIKE stce_t.stceunit, #應用組織
       stce001 LIKE stce_t.stce001, #合約編號
       stce002 LIKE stce_t.stce002, #版本
       stce003 LIKE stce_t.stce003, #檔案編號
       stce004 LIKE stce_t.stce004, #模板編號
       stce005 LIKE stce_t.stce005, #經營方式
       stce006 LIKE stce_t.stce006, #結算方式
       stce007 LIKE stce_t.stce007, #結算類型
       stce008 LIKE stce_t.stce008, #對象類型
       stce009 LIKE stce_t.stce009, #經銷商編號
       stce010 LIKE stce_t.stce010, #網點編號
       stce011 LIKE stce_t.stce011, #客戶分類
       stce012 LIKE stce_t.stce012, #渠道
       stce013 LIKE stce_t.stce013, #簽訂日期
       stce014 LIKE stce_t.stce014, #簽訂法人
       stce015 LIKE stce_t.stce015, #簽訂人員
       stce016 LIKE stce_t.stce016, #簽訂部門
       stce017 LIKE stce_t.stce017, #生效日期
       stce018 LIKE stce_t.stce018, #失效日期
       stce019 LIKE stce_t.stce019, #清退日期
       stce020 LIKE stce_t.stce020, #作廢日期
       stce021 LIKE stce_t.stce021, #幣別
       stce022 LIKE stce_t.stce022, #稅目
       stce023 LIKE stce_t.stce023, #收付款方式
       stce024 LIKE stce_t.stce024, #結算中心
       stce025 LIKE stce_t.stce025, #銷售組織
       stce026 LIKE stce_t.stce026, #結算地
       stce027 LIKE stce_t.stce027, #結算合約編號
       stcestus LIKE stce_t.stcestus, #狀態碼
       stceownid LIKE stce_t.stceownid, #資料所有者
       stceowndp LIKE stce_t.stceowndp, #資料所屬部門
       stcecrtid LIKE stce_t.stcecrtid, #資料建立者
       stcecrtdp LIKE stce_t.stcecrtdp, #資料建立部門
       stcecrtdt LIKE stce_t.stcecrtdt, #資料創建日
       stcemodid LIKE stce_t.stcemodid, #資料修改者
       stcemoddt LIKE stce_t.stcemoddt, #最近修改日
       stcecnfid LIKE stce_t.stcecnfid, #資料確認者
       stcecnfdt LIKE stce_t.stcecnfdt, #資料確認日
       stce028 LIKE stce_t.stce028      #銷售範圍
       END RECORD
#161111-00028#3---ADD-----END-----------
DEFINE  r_success LIKE type_t.num5
DEFINE  l_stcy018 LIKE stcy_t.stcy018
DEFINE  l_stcy021 LIKE stcy_t.stcy021
DEFINE  l_stcy022 LIKE stcy_t.stcy022


  #SELECT * INTO l_stce.* #161111-00028#3--mark
  #161111-00028#3--add---begin--------
   SELECT stceent,stcesite,stceunit,stce001,stce002,stce003,stce004,stce005,stce006,stce007,stce008,
          stce009,stce010,stce011,stce012,stce013,stce014,stce015,stce016,stce017,stce018,stce019,
          stce020,stce021,stce022,stce023,stce024,stce025,stce026,stce027,stcestus,stceownid,
          stceowndp,stcecrtid,stcecrtdp,stcecrtdt,stcemodid,stcemoddt,stcecnfid,stcecnfdt,stce028 INTO l_stce.* 
  #161111-00028#3--add---end----------
    FROM stce_t  
    WHERE stceent = g_enterprise AND stce001 = g_stcx_m.stcx008
    
   CALL  s_astt620_get_salesdata(g_stcx_m.stcx008,l_stce.stce025,l_stce.stce012,'')
                 RETURNING r_success,l_stcy018,l_stce.stce025,l_stce.stce012,l_stcy021,l_stcy022
    
   IF NOT r_success  THEN
      RETURN r_success
   END IF   
   UPDATE stcy_t
     SET (stcy002,stcy013,stcy014,stcy015,stcy016,stcy019,stcy020,stcy018,stcy021,stcy022) =
         (l_stce.stce009,l_stce.stce005,l_stce.stce006,l_stce.stce007,l_stce.stce024,l_stce.stce025,l_stce.stce012,l_stcy018,l_stcy021,l_stcy022)
    WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
    
    UPDATE stcz_t
       SET stcz002 = l_stce.stce009
    WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
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
PUBLIC FUNCTION astt604_stcz007_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcy2_d[l_ac].stcz007
   CALL ap_ref_array2(g_ref_fields,"SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcy2_d[l_ac].stcz007_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcy2_d[l_ac].stcz007_desc
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
PUBLIC FUNCTION astt604_stcz004_chk()
   
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stcy2_d[l_ac].stcz004
   IF NOT cl_chk_exist("v_imaa001") THEN
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
PUBLIC FUNCTION astt604_upd_b()
DEFINE  r_success LIKE type_t.num5
DEFINE  l_n       LIKE type_t.num5
DEFINE  l_stcy011 LIKE stcy_t.stcy011
DEFINE  l_stcy017 LIKE stcy_t.stcy017
DEFINE  l_stce024 LIKE stce_t.stce024
DEFINE  l_period              LIKE type_t.num5
DEFINE  l_period2             LIKE type_t.num5

   SELECT COUNT(*) INTO l_n FROM prcf_t
    WHERE prcfent = g_enterprise AND prcf002 = g_stcx_m.stcx001 AND prcfstus = 'Y'
   IF l_n = 1 THEN
      SELECT prcf001 INTO l_stcy017 FROM prcf_t
       WHERE prcfent = g_enterprise AND prcf002 = g_stcx_m.stcx001 AND prcfstus = 'Y'
   ELSE
      LET l_stcy017 = ''
   END IF  

   SELECT stce024 INTO l_stce024 FROM stce_t WHERE stce001 = g_stcx_m.stcx008
      AND stceent = g_enterprise #160905-00007#3 add
   
    CALL s_asti206_get_period(g_stcx_m.stcx006,g_stcx_m.stcx007,l_stce024,"astt605")
                 RETURNING r_success,l_stcy011,l_period,l_period2
   IF NOT r_success THEN
      RETURN r_success
   END IF   
    UPDATE stcy_t
     SET (stcy002,stcy006,stcy007,stcy009,stcy010,stcy011,stcy017) =
         (g_stcx_m.stcx009,g_stcx_m.stcx010,g_stcx_m.stcx011,g_stcx_m.stcx006,g_stcx_m.stcx007,l_stcy011,l_stcy017)
    WHERE stcyent = g_enterprise AND stcydocno = g_stcx_m.stcxdocno
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF


    UPDATE stcz_t
       SET stcz002 = g_stcx_m.stcx009
    WHERE stczent = g_enterprise AND stczdocno = g_stcx_m.stcxdocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
     
   RETURN TRUE
END FUNCTION

 
{</section>}
 
