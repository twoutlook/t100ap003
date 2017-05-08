#該程式未解開Section, 採用最新樣板產出!
{<section id="astt605.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0012(2015-01-22 16:16:56), PR版次:0012(2016-11-24 16:23:23)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000202
#+ Filename...: astt605
#+ Description: 市場推廣活動核銷維護作業
#+ Creator....: 03247(2014-12-04 10:54:04)
#+ Modifier...: 06189 -SD/PR- 08172
 
{</section>}
 
{<section id="astt605.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#35    2016/04/15 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160816-00068#17    2016/08/19 By 08209    調整transaction
#160818-00017#40    2016-08-30 By 08734    删除修改未重新判断状态码
#160824-00007#198   2016/11/20 by lori     修正舊值備份寫法
#161121-00013#1     2016/11/24 by 06189    单据自动编号调整到单头新增之前编号
#161124-00020#1     2016/11/24 by 08172    单身资料在单据自动编号后新增
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
PRIVATE type type_g_stdi_m        RECORD
       stdisite LIKE stdi_t.stdisite, 
   stdisite_desc LIKE type_t.chr80, 
   stdidocdt LIKE stdi_t.stdidocdt, 
   stdidocno LIKE stdi_t.stdidocno, 
   stdi001 LIKE stdi_t.stdi001, 
   stdi002 LIKE stdi_t.stdi002, 
   stdi002_desc LIKE type_t.chr80, 
   stdi003 LIKE stdi_t.stdi003, 
   stdi003_desc LIKE type_t.chr80, 
   stdi004 LIKE stdi_t.stdi004, 
   stdi004_desc LIKE type_t.chr80, 
   stdi005 LIKE stdi_t.stdi005, 
   stdi005_desc LIKE type_t.chr80, 
   stdi006 LIKE stdi_t.stdi006, 
   stdi006_desc LIKE type_t.chr80, 
   stdiunit LIKE stdi_t.stdiunit, 
   stdistus LIKE stdi_t.stdistus, 
   stdi007 LIKE stdi_t.stdi007, 
   stdi008 LIKE stdi_t.stdi008, 
   sq_amount LIKE type_t.chr500, 
   stdi009 LIKE stdi_t.stdi009, 
   stdi010 LIKE stdi_t.stdi010, 
   stdi010_desc LIKE type_t.chr80, 
   hx_amount LIKE type_t.chr500, 
   stdi011 LIKE stdi_t.stdi011, 
   stdi011_desc LIKE type_t.chr80, 
   stdi012 LIKE stdi_t.stdi012, 
   stdi012_desc LIKE type_t.chr80, 
   ooff013 LIKE type_t.chr500, 
   stdiownid LIKE stdi_t.stdiownid, 
   stdiownid_desc LIKE type_t.chr80, 
   stdiowndp LIKE stdi_t.stdiowndp, 
   stdiowndp_desc LIKE type_t.chr80, 
   stdicrtid LIKE stdi_t.stdicrtid, 
   stdicrtid_desc LIKE type_t.chr80, 
   stdicrtdp LIKE stdi_t.stdicrtdp, 
   stdicrtdp_desc LIKE type_t.chr80, 
   stdicrtdt LIKE stdi_t.stdicrtdt, 
   stdimodid LIKE stdi_t.stdimodid, 
   stdimodid_desc LIKE type_t.chr80, 
   stdimoddt LIKE stdi_t.stdimoddt, 
   stdicnfid LIKE stdi_t.stdicnfid, 
   stdicnfid_desc LIKE type_t.chr80, 
   stdicnfdt LIKE stdi_t.stdicnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stdj_d        RECORD
       stdjseq LIKE stdj_t.stdjseq, 
   stdj001 LIKE stdj_t.stdj001, 
   stdj002 LIKE stdj_t.stdj002, 
   stdj003 LIKE stdj_t.stdj003, 
   stdj004 LIKE stdj_t.stdj004, 
   stdj005 LIKE stdj_t.stdj005, 
   stdj005_desc LIKE type_t.chr500, 
   stdj006 LIKE stdj_t.stdj006, 
   stdj006_desc LIKE type_t.chr500, 
   stdj007 LIKE stdj_t.stdj007, 
   stdj008 LIKE stdj_t.stdj008, 
   stdj009 LIKE stdj_t.stdj009, 
   stdj010 LIKE stdj_t.stdj010, 
   stdj011 LIKE stdj_t.stdj011, 
   stdj012 LIKE stdj_t.stdj012, 
   stdj013 LIKE stdj_t.stdj013, 
   stdj014 LIKE stdj_t.stdj014, 
   stdj015 LIKE stdj_t.stdj015, 
   stdj016 LIKE stdj_t.stdj016, 
   stdj017 LIKE stdj_t.stdj017, 
   stdj018 LIKE stdj_t.stdj018, 
   stdj019 LIKE stdj_t.stdj019, 
   stdj020 LIKE stdj_t.stdj020, 
   stdj021 LIKE stdj_t.stdj021, 
   stdj022 LIKE stdj_t.stdj022, 
   stdj023 LIKE stdj_t.stdj023, 
   stdj024 LIKE stdj_t.stdj024, 
   stdj025 LIKE stdj_t.stdj025, 
   stdj026 LIKE stdj_t.stdj026, 
   stdjsite LIKE stdj_t.stdjsite, 
   stdjunit LIKE stdj_t.stdjunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stdisite LIKE stdi_t.stdisite,
   b_stdisite_desc LIKE type_t.chr80,
      b_stdidocdt LIKE stdi_t.stdidocdt,
      b_stdidocno LIKE stdi_t.stdidocno,
      b_stdi001 LIKE stdi_t.stdi001,
      b_stdi002 LIKE stdi_t.stdi002,
   b_stdi002_desc LIKE type_t.chr80,
      b_stdi003 LIKE stdi_t.stdi003,
   b_stdi003_desc LIKE type_t.chr80,
      b_stdi004 LIKE stdi_t.stdi004,
   b_stdi004_desc LIKE type_t.chr80,
      b_stdi005 LIKE stdi_t.stdi005,
   b_stdi005_desc LIKE type_t.chr80,
      b_stdi006 LIKE stdi_t.stdi006,
   b_stdi006_desc LIKE type_t.chr80,
      b_stdi007 LIKE stdi_t.stdi007,
      b_stdi008 LIKE stdi_t.stdi008,
      b_stdi009 LIKE stdi_t.stdi009,
      b_stdi010 LIKE stdi_t.stdi010,
      b_stdi011 LIKE stdi_t.stdi011,
      b_stdi012 LIKE stdi_t.stdi012
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_ooef004      LIKE ooef_t.ooef004
DEFINE g_ooef005      LIKE ooef_t.ooef005
DEFINE g_assign_no    LIKE type_t.chr1
DEFINE g_flag         LIKE type_t.num5
DEFINE g_site_flag   LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stdi_m          type_g_stdi_m
DEFINE g_stdi_m_t        type_g_stdi_m
DEFINE g_stdi_m_o        type_g_stdi_m
DEFINE g_stdi_m_mask_o   type_g_stdi_m #轉換遮罩前資料
DEFINE g_stdi_m_mask_n   type_g_stdi_m #轉換遮罩後資料
 
   DEFINE g_stdidocno_t LIKE stdi_t.stdidocno
 
 
DEFINE g_stdj_d          DYNAMIC ARRAY OF type_g_stdj_d
DEFINE g_stdj_d_t        type_g_stdj_d
DEFINE g_stdj_d_o        type_g_stdj_d
DEFINE g_stdj_d_mask_o   DYNAMIC ARRAY OF type_g_stdj_d #轉換遮罩前資料
DEFINE g_stdj_d_mask_n   DYNAMIC ARRAY OF type_g_stdj_d #轉換遮罩後資料
 
 
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
 
{<section id="astt605.main" >}
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
   LET g_forupd_sql = " SELECT stdisite,'',stdidocdt,stdidocno,stdi001,stdi002,'',stdi003,'',stdi004, 
       '',stdi005,'',stdi006,'',stdiunit,stdistus,stdi007,stdi008,'',stdi009,stdi010,'','',stdi011,'', 
       stdi012,'','',stdiownid,'',stdiowndp,'',stdicrtid,'',stdicrtdp,'',stdicrtdt,stdimodid,'',stdimoddt, 
       stdicnfid,'',stdicnfdt", 
                      " FROM stdi_t",
                      " WHERE stdient= ? AND stdidocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt605_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stdisite,t0.stdidocdt,t0.stdidocno,t0.stdi001,t0.stdi002,t0.stdi003, 
       t0.stdi004,t0.stdi005,t0.stdi006,t0.stdiunit,t0.stdistus,t0.stdi007,t0.stdi008,t0.stdi009,t0.stdi010, 
       t0.stdi011,t0.stdi012,t0.stdiownid,t0.stdiowndp,t0.stdicrtid,t0.stdicrtdp,t0.stdicrtdt,t0.stdimodid, 
       t0.stdimoddt,t0.stdicnfid,t0.stdicnfdt,t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 , 
       t6.ooefl003 ,t7.pmaal004 ,t8.ooail003 ,t9.ooag011 ,t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 ,t13.ooag011 , 
       t14.ooag011",
               " FROM stdi_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stdi002 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stdi003 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stdi004 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stdi005  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stdi006 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t7 ON t7.pmaalent="||g_enterprise||" AND t7.pmaal001=t0.stdi010 AND t7.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stdi011 AND t8.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stdiownid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stdiowndp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stdicrtid  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stdicrtdp AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stdimodid  ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.stdicnfid  ",
 
               " WHERE t0.stdient = " ||g_enterprise|| " AND t0.stdidocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt605_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt605 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt605_init()   
 
      #進入選單 Menu (="N")
      CALL astt605_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt605
      
   END IF 
   
   CLOSE astt605_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt605.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt605_init()
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
      CALL cl_set_combo_scc_part('stdistus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stdj007','6006') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stdj007','6006','1,2')
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
   CALL astt605_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt605.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt605_ui_dialog()
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
            CALL astt605_insert()
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
         INITIALIZE g_stdi_m.* TO NULL
         CALL g_stdj_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt605_init()
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
               
               CALL astt605_fetch('') # reload data
               LET l_ac = 1
               CALL astt605_ui_detailshow() #Setting the current row 
         
               CALL astt605_idx_chk()
               #NEXT FIELD stdjseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stdj_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt605_idx_chk()
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
               CALL astt605_idx_chk()
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
            CALL astt605_browser_fill("")
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
               CALL astt605_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt605_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt605_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt605_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt605_set_act_visible()   
            CALL astt605_set_act_no_visible()
            IF NOT (g_stdi_m.stdidocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stdient = " ||g_enterprise|| " AND",
                                  " stdidocno = '", g_stdi_m.stdidocno, "' "
 
               #填到對應位置
               CALL astt605_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stdi_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdj_t" 
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
               CALL astt605_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stdi_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdj_t" 
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
                  CALL astt605_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt605_fetch("F")
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
               CALL astt605_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt605_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt605_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt605_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt605_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt605_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt605_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt605_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt605_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt605_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt605_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stdj_d)
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
               NEXT FIELD stdjseq
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
               CALL astt605_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt605_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt605_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt605_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt605_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt605_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt605_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt605_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt605_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt605_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt605_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stdi_m.stdidocdt)
 
 
 
         
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
 
{<section id="astt605.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt605_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stdisite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   #ken---add---end
   LET l_wc  = g_wc.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stdidocno ",
                      " FROM stdi_t ",
                      " ",
                      " LEFT JOIN stdj_t ON stdjent = stdient AND stdidocno = stdjdocno ", "  ",
                      #add-point:browser_fill段sql(stdj_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stdient = " ||g_enterprise|| " AND stdjent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stdi_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stdidocno ",
                      " FROM stdi_t ", 
                      "  ",
                      "  ",
                      " WHERE stdient = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stdi_t")
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
      INITIALIZE g_stdi_m.* TO NULL
      CALL g_stdj_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stdisite,t0.stdidocdt,t0.stdidocno,t0.stdi001,t0.stdi002,t0.stdi003,t0.stdi004,t0.stdi005,t0.stdi006,t0.stdi007,t0.stdi008,t0.stdi009,t0.stdi010,t0.stdi011,t0.stdi012 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdistus,t0.stdisite,t0.stdidocdt,t0.stdidocno,t0.stdi001,t0.stdi002, 
          t0.stdi003,t0.stdi004,t0.stdi005,t0.stdi006,t0.stdi007,t0.stdi008,t0.stdi009,t0.stdi010,t0.stdi011, 
          t0.stdi012,t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 ",
                  " FROM stdi_t t0",
                  "  ",
                  "  LEFT JOIN stdj_t ON stdjent = stdient AND stdidocno = stdjdocno ", "  ", 
                  #add-point:browser_fill段sql(stdj_t1) name="browser_fill.join.stdj_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stdi002 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stdi003 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stdi004 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stdi005  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stdi006 AND t6.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdient = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stdi_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdistus,t0.stdisite,t0.stdidocdt,t0.stdidocno,t0.stdi001,t0.stdi002, 
          t0.stdi003,t0.stdi004,t0.stdi005,t0.stdi006,t0.stdi007,t0.stdi008,t0.stdi009,t0.stdi010,t0.stdi011, 
          t0.stdi012,t1.ooefl003 ,t2.prcdl003 ,t3.oocql004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 ",
                  " FROM stdi_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN prcdl_t t2 ON t2.prcdlent="||g_enterprise||" AND t2.prcdl001=t0.stdi002 AND t2.prcdl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2100' AND t3.oocql002=t0.stdi003 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2101' AND t4.oocql002=t0.stdi004 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stdi005  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stdi006 AND t6.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdient = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stdi_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stdidocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stdi_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stdisite,g_browser[g_cnt].b_stdidocdt, 
          g_browser[g_cnt].b_stdidocno,g_browser[g_cnt].b_stdi001,g_browser[g_cnt].b_stdi002,g_browser[g_cnt].b_stdi003, 
          g_browser[g_cnt].b_stdi004,g_browser[g_cnt].b_stdi005,g_browser[g_cnt].b_stdi006,g_browser[g_cnt].b_stdi007, 
          g_browser[g_cnt].b_stdi008,g_browser[g_cnt].b_stdi009,g_browser[g_cnt].b_stdi010,g_browser[g_cnt].b_stdi011, 
          g_browser[g_cnt].b_stdi012,g_browser[g_cnt].b_stdisite_desc,g_browser[g_cnt].b_stdi002_desc, 
          g_browser[g_cnt].b_stdi003_desc,g_browser[g_cnt].b_stdi004_desc,g_browser[g_cnt].b_stdi005_desc, 
          g_browser[g_cnt].b_stdi006_desc
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
         CALL astt605_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stdidocno) THEN
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
 
{<section id="astt605.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt605_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stdi_m.stdidocno = g_browser[g_current_idx].b_stdidocno   
 
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
   CALL astt605_stdi_t_mask()
   CALL astt605_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt605.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt605_ui_detailshow()
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
 
{<section id="astt605.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt605_ui_browser_refresh()
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
      IF g_browser[l_i].b_stdidocno = g_stdi_m.stdidocno 
 
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
 
{<section id="astt605.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt605_construct()
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
   INITIALIZE g_stdi_m.* TO NULL
   CALL g_stdj_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stdisite,stdidocdt,stdidocno,stdi001,stdi002,stdi003,stdi004,stdi005, 
          stdi006,stdiunit,stdistus,stdi007,stdi008,stdi009,stdi010,stdi011,stdi012,stdi012_desc,ooff013, 
          stdiownid,stdiowndp,stdicrtid,stdicrtdp,stdicrtdt,stdimodid,stdimoddt,stdicnfid,stdicnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stdicrtdt>>----
         AFTER FIELD stdicrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stdimoddt>>----
         AFTER FIELD stdimoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdicnfdt>>----
         AFTER FIELD stdicnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdipstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stdisite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdisite
            #add-point:ON ACTION controlp INFIELD stdisite name="construct.c.stdisite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdisite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stdisite  #顯示到畫面上
            NEXT FIELD stdisite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdisite
            #add-point:BEFORE FIELD stdisite name="construct.b.stdisite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdisite
            
            #add-point:AFTER FIELD stdisite name="construct.a.stdisite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdidocdt
            #add-point:BEFORE FIELD stdidocdt name="construct.b.stdidocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdidocdt
            
            #add-point:AFTER FIELD stdidocdt name="construct.a.stdidocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdidocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdidocdt
            #add-point:ON ACTION controlp INFIELD stdidocdt name="construct.c.stdidocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdidocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdidocno
            #add-point:ON ACTION controlp INFIELD stdidocno name="construct.c.stdidocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stdidocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdidocno  #顯示到畫面上
            NEXT FIELD stdidocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdidocno
            #add-point:BEFORE FIELD stdidocno name="construct.b.stdidocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdidocno
            
            #add-point:AFTER FIELD stdidocno name="construct.a.stdidocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi001
            #add-point:ON ACTION controlp INFIELD stdi001 name="construct.c.stdi001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stcxdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi001  #顯示到畫面上
            NEXT FIELD stdi001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi001
            #add-point:BEFORE FIELD stdi001 name="construct.b.stdi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi001
            
            #add-point:AFTER FIELD stdi001 name="construct.a.stdi001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi002
            #add-point:ON ACTION controlp INFIELD stdi002 name="construct.c.stdi002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_prcd001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi002  #顯示到畫面上
            NEXT FIELD stdi002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi002
            #add-point:BEFORE FIELD stdi002 name="construct.b.stdi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi002
            
            #add-point:AFTER FIELD stdi002 name="construct.a.stdi002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi003
            #add-point:ON ACTION controlp INFIELD stdi003 name="construct.c.stdi003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi003  #顯示到畫面上
            NEXT FIELD stdi003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi003
            #add-point:BEFORE FIELD stdi003 name="construct.b.stdi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi003
            
            #add-point:AFTER FIELD stdi003 name="construct.a.stdi003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi004
            #add-point:ON ACTION controlp INFIELD stdi004 name="construct.c.stdi004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi004  #顯示到畫面上
            NEXT FIELD stdi004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi004
            #add-point:BEFORE FIELD stdi004 name="construct.b.stdi004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi004
            
            #add-point:AFTER FIELD stdi004 name="construct.a.stdi004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi005
            #add-point:ON ACTION controlp INFIELD stdi005 name="construct.c.stdi005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi005  #顯示到畫面上
            NEXT FIELD stdi005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi005
            #add-point:BEFORE FIELD stdi005 name="construct.b.stdi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi005
            
            #add-point:AFTER FIELD stdi005 name="construct.a.stdi005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi006
            #add-point:ON ACTION controlp INFIELD stdi006 name="construct.c.stdi006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi006  #顯示到畫面上
            NEXT FIELD stdi006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi006
            #add-point:BEFORE FIELD stdi006 name="construct.b.stdi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi006
            
            #add-point:AFTER FIELD stdi006 name="construct.a.stdi006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdiunit
            #add-point:BEFORE FIELD stdiunit name="construct.b.stdiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdiunit
            
            #add-point:AFTER FIELD stdiunit name="construct.a.stdiunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdiunit
            #add-point:ON ACTION controlp INFIELD stdiunit name="construct.c.stdiunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdistus
            #add-point:BEFORE FIELD stdistus name="construct.b.stdistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdistus
            
            #add-point:AFTER FIELD stdistus name="construct.a.stdistus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdistus
            #add-point:ON ACTION controlp INFIELD stdistus name="construct.c.stdistus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi007
            #add-point:BEFORE FIELD stdi007 name="construct.b.stdi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi007
            
            #add-point:AFTER FIELD stdi007 name="construct.a.stdi007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi007
            #add-point:ON ACTION controlp INFIELD stdi007 name="construct.c.stdi007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi008
            #add-point:BEFORE FIELD stdi008 name="construct.b.stdi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi008
            
            #add-point:AFTER FIELD stdi008 name="construct.a.stdi008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi008
            #add-point:ON ACTION controlp INFIELD stdi008 name="construct.c.stdi008"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdi009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi009
            #add-point:ON ACTION controlp INFIELD stdi009 name="construct.c.stdi009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi009  #顯示到畫面上
            NEXT FIELD stdi009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi009
            #add-point:BEFORE FIELD stdi009 name="construct.b.stdi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi009
            
            #add-point:AFTER FIELD stdi009 name="construct.a.stdi009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi010
            #add-point:ON ACTION controlp INFIELD stdi010 name="construct.c.stdi010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdi010  #顯示到畫面上
            NEXT FIELD stdi010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi010
            #add-point:BEFORE FIELD stdi010 name="construct.b.stdi010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi010
            
            #add-point:AFTER FIELD stdi010 name="construct.a.stdi010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi011
            #add-point:BEFORE FIELD stdi011 name="construct.b.stdi011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi011
            
            #add-point:AFTER FIELD stdi011 name="construct.a.stdi011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi011
            #add-point:ON ACTION controlp INFIELD stdi011 name="construct.c.stdi011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi012
            #add-point:BEFORE FIELD stdi012 name="construct.b.stdi012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi012
            
            #add-point:AFTER FIELD stdi012 name="construct.a.stdi012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi012
            #add-point:ON ACTION controlp INFIELD stdi012 name="construct.c.stdi012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi012_desc
            #add-point:BEFORE FIELD stdi012_desc name="construct.b.stdi012_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi012_desc
            
            #add-point:AFTER FIELD stdi012_desc name="construct.a.stdi012_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdi012_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi012_desc
            #add-point:ON ACTION controlp INFIELD stdi012_desc name="construct.c.stdi012_desc"
            
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
 
 
         #Ctrlp:construct.c.stdiownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdiownid
            #add-point:ON ACTION controlp INFIELD stdiownid name="construct.c.stdiownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdiownid  #顯示到畫面上
            NEXT FIELD stdiownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdiownid
            #add-point:BEFORE FIELD stdiownid name="construct.b.stdiownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdiownid
            
            #add-point:AFTER FIELD stdiownid name="construct.a.stdiownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdiowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdiowndp
            #add-point:ON ACTION controlp INFIELD stdiowndp name="construct.c.stdiowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdiowndp  #顯示到畫面上
            NEXT FIELD stdiowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdiowndp
            #add-point:BEFORE FIELD stdiowndp name="construct.b.stdiowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdiowndp
            
            #add-point:AFTER FIELD stdiowndp name="construct.a.stdiowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdicrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdicrtid
            #add-point:ON ACTION controlp INFIELD stdicrtid name="construct.c.stdicrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdicrtid  #顯示到畫面上
            NEXT FIELD stdicrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdicrtid
            #add-point:BEFORE FIELD stdicrtid name="construct.b.stdicrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdicrtid
            
            #add-point:AFTER FIELD stdicrtid name="construct.a.stdicrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdicrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdicrtdp
            #add-point:ON ACTION controlp INFIELD stdicrtdp name="construct.c.stdicrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdicrtdp  #顯示到畫面上
            NEXT FIELD stdicrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdicrtdp
            #add-point:BEFORE FIELD stdicrtdp name="construct.b.stdicrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdicrtdp
            
            #add-point:AFTER FIELD stdicrtdp name="construct.a.stdicrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdicrtdt
            #add-point:BEFORE FIELD stdicrtdt name="construct.b.stdicrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdimodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdimodid
            #add-point:ON ACTION controlp INFIELD stdimodid name="construct.c.stdimodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdimodid  #顯示到畫面上
            NEXT FIELD stdimodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdimodid
            #add-point:BEFORE FIELD stdimodid name="construct.b.stdimodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdimodid
            
            #add-point:AFTER FIELD stdimodid name="construct.a.stdimodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdimoddt
            #add-point:BEFORE FIELD stdimoddt name="construct.b.stdimoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdicnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdicnfid
            #add-point:ON ACTION controlp INFIELD stdicnfid name="construct.c.stdicnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdicnfid  #顯示到畫面上
            NEXT FIELD stdicnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdicnfid
            #add-point:BEFORE FIELD stdicnfid name="construct.b.stdicnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdicnfid
            
            #add-point:AFTER FIELD stdicnfid name="construct.a.stdicnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdicnfdt
            #add-point:BEFORE FIELD stdicnfdt name="construct.b.stdicnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stdjseq,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007,stdj008, 
          stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020, 
          stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit
           FROM s_detail1[1].stdjseq,s_detail1[1].stdj001,s_detail1[1].stdj002,s_detail1[1].stdj003, 
               s_detail1[1].stdj004,s_detail1[1].stdj005,s_detail1[1].stdj006,s_detail1[1].stdj007,s_detail1[1].stdj008, 
               s_detail1[1].stdj009,s_detail1[1].stdj010,s_detail1[1].stdj011,s_detail1[1].stdj012,s_detail1[1].stdj013, 
               s_detail1[1].stdj014,s_detail1[1].stdj015,s_detail1[1].stdj016,s_detail1[1].stdj017,s_detail1[1].stdj018, 
               s_detail1[1].stdj019,s_detail1[1].stdj020,s_detail1[1].stdj021,s_detail1[1].stdj022,s_detail1[1].stdj023, 
               s_detail1[1].stdj024,s_detail1[1].stdj025,s_detail1[1].stdj026,s_detail1[1].stdjsite, 
               s_detail1[1].stdjunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjseq
            #add-point:BEFORE FIELD stdjseq name="construct.b.page1.stdjseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjseq
            
            #add-point:AFTER FIELD stdjseq name="construct.a.page1.stdjseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjseq
            #add-point:ON ACTION controlp INFIELD stdjseq name="construct.c.page1.stdjseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj001
            #add-point:BEFORE FIELD stdj001 name="construct.b.page1.stdj001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj001
            
            #add-point:AFTER FIELD stdj001 name="construct.a.page1.stdj001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj001
            #add-point:ON ACTION controlp INFIELD stdj001 name="construct.c.page1.stdj001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj002
            #add-point:BEFORE FIELD stdj002 name="construct.b.page1.stdj002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj002
            
            #add-point:AFTER FIELD stdj002 name="construct.a.page1.stdj002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj002
            #add-point:ON ACTION controlp INFIELD stdj002 name="construct.c.page1.stdj002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj003
            #add-point:BEFORE FIELD stdj003 name="construct.b.page1.stdj003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj003
            
            #add-point:AFTER FIELD stdj003 name="construct.a.page1.stdj003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj003
            #add-point:ON ACTION controlp INFIELD stdj003 name="construct.c.page1.stdj003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj004
            #add-point:BEFORE FIELD stdj004 name="construct.b.page1.stdj004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj004
            
            #add-point:AFTER FIELD stdj004 name="construct.a.page1.stdj004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj004
            #add-point:ON ACTION controlp INFIELD stdj004 name="construct.c.page1.stdj004"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdj005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj005
            #add-point:ON ACTION controlp INFIELD stdj005 name="construct.c.page1.stdj005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdj005  #顯示到畫面上
            NEXT FIELD stdj005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj005
            #add-point:BEFORE FIELD stdj005 name="construct.b.page1.stdj005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj005
            
            #add-point:AFTER FIELD stdj005 name="construct.a.page1.stdj005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj006
            #add-point:ON ACTION controlp INFIELD stdj006 name="construct.c.page1.stdj006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdj006  #顯示到畫面上
            NEXT FIELD stdj006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj006
            #add-point:BEFORE FIELD stdj006 name="construct.b.page1.stdj006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj006
            
            #add-point:AFTER FIELD stdj006 name="construct.a.page1.stdj006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj007
            #add-point:BEFORE FIELD stdj007 name="construct.b.page1.stdj007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj007
            
            #add-point:AFTER FIELD stdj007 name="construct.a.page1.stdj007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj007
            #add-point:ON ACTION controlp INFIELD stdj007 name="construct.c.page1.stdj007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj008
            #add-point:BEFORE FIELD stdj008 name="construct.b.page1.stdj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj008
            
            #add-point:AFTER FIELD stdj008 name="construct.a.page1.stdj008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj008
            #add-point:ON ACTION controlp INFIELD stdj008 name="construct.c.page1.stdj008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj009
            #add-point:BEFORE FIELD stdj009 name="construct.b.page1.stdj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj009
            
            #add-point:AFTER FIELD stdj009 name="construct.a.page1.stdj009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj009
            #add-point:ON ACTION controlp INFIELD stdj009 name="construct.c.page1.stdj009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj010
            #add-point:BEFORE FIELD stdj010 name="construct.b.page1.stdj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj010
            
            #add-point:AFTER FIELD stdj010 name="construct.a.page1.stdj010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj010
            #add-point:ON ACTION controlp INFIELD stdj010 name="construct.c.page1.stdj010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj011
            #add-point:BEFORE FIELD stdj011 name="construct.b.page1.stdj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj011
            
            #add-point:AFTER FIELD stdj011 name="construct.a.page1.stdj011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj011
            #add-point:ON ACTION controlp INFIELD stdj011 name="construct.c.page1.stdj011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj012
            #add-point:BEFORE FIELD stdj012 name="construct.b.page1.stdj012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj012
            
            #add-point:AFTER FIELD stdj012 name="construct.a.page1.stdj012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj012
            #add-point:ON ACTION controlp INFIELD stdj012 name="construct.c.page1.stdj012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj013
            #add-point:BEFORE FIELD stdj013 name="construct.b.page1.stdj013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj013
            
            #add-point:AFTER FIELD stdj013 name="construct.a.page1.stdj013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj013
            #add-point:ON ACTION controlp INFIELD stdj013 name="construct.c.page1.stdj013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj014
            #add-point:BEFORE FIELD stdj014 name="construct.b.page1.stdj014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj014
            
            #add-point:AFTER FIELD stdj014 name="construct.a.page1.stdj014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj014
            #add-point:ON ACTION controlp INFIELD stdj014 name="construct.c.page1.stdj014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj015
            #add-point:BEFORE FIELD stdj015 name="construct.b.page1.stdj015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj015
            
            #add-point:AFTER FIELD stdj015 name="construct.a.page1.stdj015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj015
            #add-point:ON ACTION controlp INFIELD stdj015 name="construct.c.page1.stdj015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj016
            #add-point:BEFORE FIELD stdj016 name="construct.b.page1.stdj016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj016
            
            #add-point:AFTER FIELD stdj016 name="construct.a.page1.stdj016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj016
            #add-point:ON ACTION controlp INFIELD stdj016 name="construct.c.page1.stdj016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj017
            #add-point:BEFORE FIELD stdj017 name="construct.b.page1.stdj017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj017
            
            #add-point:AFTER FIELD stdj017 name="construct.a.page1.stdj017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj017
            #add-point:ON ACTION controlp INFIELD stdj017 name="construct.c.page1.stdj017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj018
            #add-point:BEFORE FIELD stdj018 name="construct.b.page1.stdj018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj018
            
            #add-point:AFTER FIELD stdj018 name="construct.a.page1.stdj018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj018
            #add-point:ON ACTION controlp INFIELD stdj018 name="construct.c.page1.stdj018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj019
            #add-point:BEFORE FIELD stdj019 name="construct.b.page1.stdj019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj019
            
            #add-point:AFTER FIELD stdj019 name="construct.a.page1.stdj019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj019
            #add-point:ON ACTION controlp INFIELD stdj019 name="construct.c.page1.stdj019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj020
            #add-point:BEFORE FIELD stdj020 name="construct.b.page1.stdj020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj020
            
            #add-point:AFTER FIELD stdj020 name="construct.a.page1.stdj020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj020
            #add-point:ON ACTION controlp INFIELD stdj020 name="construct.c.page1.stdj020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj021
            #add-point:BEFORE FIELD stdj021 name="construct.b.page1.stdj021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj021
            
            #add-point:AFTER FIELD stdj021 name="construct.a.page1.stdj021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj021
            #add-point:ON ACTION controlp INFIELD stdj021 name="construct.c.page1.stdj021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj022
            #add-point:BEFORE FIELD stdj022 name="construct.b.page1.stdj022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj022
            
            #add-point:AFTER FIELD stdj022 name="construct.a.page1.stdj022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj022
            #add-point:ON ACTION controlp INFIELD stdj022 name="construct.c.page1.stdj022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj023
            #add-point:BEFORE FIELD stdj023 name="construct.b.page1.stdj023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj023
            
            #add-point:AFTER FIELD stdj023 name="construct.a.page1.stdj023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj023
            #add-point:ON ACTION controlp INFIELD stdj023 name="construct.c.page1.stdj023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj024
            #add-point:BEFORE FIELD stdj024 name="construct.b.page1.stdj024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj024
            
            #add-point:AFTER FIELD stdj024 name="construct.a.page1.stdj024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj024
            #add-point:ON ACTION controlp INFIELD stdj024 name="construct.c.page1.stdj024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj025
            #add-point:BEFORE FIELD stdj025 name="construct.b.page1.stdj025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj025
            
            #add-point:AFTER FIELD stdj025 name="construct.a.page1.stdj025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj025
            #add-point:ON ACTION controlp INFIELD stdj025 name="construct.c.page1.stdj025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj026
            #add-point:BEFORE FIELD stdj026 name="construct.b.page1.stdj026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj026
            
            #add-point:AFTER FIELD stdj026 name="construct.a.page1.stdj026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdj026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj026
            #add-point:ON ACTION controlp INFIELD stdj026 name="construct.c.page1.stdj026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjsite
            #add-point:BEFORE FIELD stdjsite name="construct.b.page1.stdjsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjsite
            
            #add-point:AFTER FIELD stdjsite name="construct.a.page1.stdjsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdjsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjsite
            #add-point:ON ACTION controlp INFIELD stdjsite name="construct.c.page1.stdjsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjunit
            #add-point:BEFORE FIELD stdjunit name="construct.b.page1.stdjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjunit
            
            #add-point:AFTER FIELD stdjunit name="construct.a.page1.stdjunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjunit
            #add-point:ON ACTION controlp INFIELD stdjunit name="construct.c.page1.stdjunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stdi_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stdj_t" 
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
 
{<section id="astt605.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt605_filter()
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
      CONSTRUCT g_wc_filter ON stdisite,stdidocdt,stdidocno,stdi001,stdi002,stdi003,stdi004,stdi005, 
          stdi006,stdi007,stdi008,stdi009,stdi010,stdi011,stdi012
                          FROM s_browse[1].b_stdisite,s_browse[1].b_stdidocdt,s_browse[1].b_stdidocno, 
                              s_browse[1].b_stdi001,s_browse[1].b_stdi002,s_browse[1].b_stdi003,s_browse[1].b_stdi004, 
                              s_browse[1].b_stdi005,s_browse[1].b_stdi006,s_browse[1].b_stdi007,s_browse[1].b_stdi008, 
                              s_browse[1].b_stdi009,s_browse[1].b_stdi010,s_browse[1].b_stdi011,s_browse[1].b_stdi012 
 
 
         BEFORE CONSTRUCT
               DISPLAY astt605_filter_parser('stdisite') TO s_browse[1].b_stdisite
            DISPLAY astt605_filter_parser('stdidocdt') TO s_browse[1].b_stdidocdt
            DISPLAY astt605_filter_parser('stdidocno') TO s_browse[1].b_stdidocno
            DISPLAY astt605_filter_parser('stdi001') TO s_browse[1].b_stdi001
            DISPLAY astt605_filter_parser('stdi002') TO s_browse[1].b_stdi002
            DISPLAY astt605_filter_parser('stdi003') TO s_browse[1].b_stdi003
            DISPLAY astt605_filter_parser('stdi004') TO s_browse[1].b_stdi004
            DISPLAY astt605_filter_parser('stdi005') TO s_browse[1].b_stdi005
            DISPLAY astt605_filter_parser('stdi006') TO s_browse[1].b_stdi006
            DISPLAY astt605_filter_parser('stdi007') TO s_browse[1].b_stdi007
            DISPLAY astt605_filter_parser('stdi008') TO s_browse[1].b_stdi008
            DISPLAY astt605_filter_parser('stdi009') TO s_browse[1].b_stdi009
            DISPLAY astt605_filter_parser('stdi010') TO s_browse[1].b_stdi010
            DISPLAY astt605_filter_parser('stdi011') TO s_browse[1].b_stdi011
            DISPLAY astt605_filter_parser('stdi012') TO s_browse[1].b_stdi012
      
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
 
      CALL astt605_filter_show('stdisite')
   CALL astt605_filter_show('stdidocdt')
   CALL astt605_filter_show('stdidocno')
   CALL astt605_filter_show('stdi001')
   CALL astt605_filter_show('stdi002')
   CALL astt605_filter_show('stdi003')
   CALL astt605_filter_show('stdi004')
   CALL astt605_filter_show('stdi005')
   CALL astt605_filter_show('stdi006')
   CALL astt605_filter_show('stdi007')
   CALL astt605_filter_show('stdi008')
   CALL astt605_filter_show('stdi009')
   CALL astt605_filter_show('stdi010')
   CALL astt605_filter_show('stdi011')
   CALL astt605_filter_show('stdi012')
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt605_filter_parser(ps_field)
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
 
{<section id="astt605.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt605_filter_show(ps_field)
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
   LET ls_condition = astt605_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt605_query()
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
   CALL g_stdj_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt605_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt605_browser_fill("")
      CALL astt605_fetch("")
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
      CALL astt605_filter_show('stdisite')
   CALL astt605_filter_show('stdidocdt')
   CALL astt605_filter_show('stdidocno')
   CALL astt605_filter_show('stdi001')
   CALL astt605_filter_show('stdi002')
   CALL astt605_filter_show('stdi003')
   CALL astt605_filter_show('stdi004')
   CALL astt605_filter_show('stdi005')
   CALL astt605_filter_show('stdi006')
   CALL astt605_filter_show('stdi007')
   CALL astt605_filter_show('stdi008')
   CALL astt605_filter_show('stdi009')
   CALL astt605_filter_show('stdi010')
   CALL astt605_filter_show('stdi011')
   CALL astt605_filter_show('stdi012')
   CALL astt605_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt605_fetch("F") 
      #顯示單身筆數
      CALL astt605_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt605_fetch(p_flag)
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
   
   LET g_stdi_m.stdidocno = g_browser[g_current_idx].b_stdidocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
   #遮罩相關處理
   LET g_stdi_m_mask_o.* =  g_stdi_m.*
   CALL astt605_stdi_t_mask()
   LET g_stdi_m_mask_n.* =  g_stdi_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt605_set_act_visible()   
   CALL astt605_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
#   IF g_stdi_m.stdistus NOT MATCHES "[NDR]"  THEN
#      CALL cl_set_act_visible("modify,delete",TRUE)
#   ELSE
#      CALL cl_set_act_visible("modify,delete",FALSE)
#   END IF  
   CALL cl_set_act_visible("reproduce",FALSE)
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stdi_m_t.* = g_stdi_m.*
   LET g_stdi_m_o.* = g_stdi_m.*
   
   LET g_data_owner = g_stdi_m.stdiownid      
   LET g_data_dept  = g_stdi_m.stdiowndp
   
   #重新顯示   
   CALL astt605_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt605_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
    DEFINE l_success     LIKE type_t.num5 
    DEFINE r_insert      LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stdj_d.clear()   
 
 
   INITIALIZE g_stdi_m.* TO NULL             #DEFAULT 設定
   
   LET g_stdidocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdi_m.stdiownid = g_user
      LET g_stdi_m.stdiowndp = g_dept
      LET g_stdi_m.stdicrtid = g_user
      LET g_stdi_m.stdicrtdp = g_dept 
      LET g_stdi_m.stdicrtdt = cl_get_current()
      LET g_stdi_m.stdimodid = g_user
      LET g_stdi_m.stdimoddt = cl_get_current()
      LET g_stdi_m.stdistus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
#      LET g_stdi_m.stdisite = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stdisite',g_stdi_m.stdisite) RETURNING r_insert,g_stdi_m.stdisite
      IF NOT r_insert THEN
         RETURN 
      END IF
      CALL astt605_stdisite_ref()
      LET g_stdi_m.stdiunit = g_site
      LET g_stdi_m.stdidocdt = g_today
      LET g_stdi_m.stdi005 = g_user
      CALL astt605_stdi005_ref()
      LET g_stdi_m.stdi006 = g_dept      
      CALL astt605_stdi006_ref()
      CALL s_arti200_get_def_doc_type(g_site,g_prog,'1') RETURNING l_success,g_stdi_m.stdidocno
      LET g_stdi_m_t.* = g_stdi_m.*
      #CALL astt605_stdisite_ref()
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stdi_m_t.* = g_stdi_m.*
      LET g_stdi_m_o.* = g_stdi_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdi_m.stdistus 
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
 
 
 
    
      CALL astt605_input("a")
      
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
         INITIALIZE g_stdi_m.* TO NULL
         INITIALIZE g_stdj_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt605_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stdj_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt605_set_act_visible()   
   CALL astt605_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdidocno_t = g_stdi_m.stdidocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdient = " ||g_enterprise|| " AND",
                      " stdidocno = '", g_stdi_m.stdidocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt605_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt605_cl
   
   CALL astt605_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
   
   #遮罩相關處理
   LET g_stdi_m_mask_o.* =  g_stdi_m.*
   CALL astt605_stdi_t_mask()
   LET g_stdi_m_mask_n.* =  g_stdi_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdisite_desc,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001, 
       g_stdi_m.stdi002,g_stdi_m.stdi002_desc,g_stdi_m.stdi003,g_stdi_m.stdi003_desc,g_stdi_m.stdi004, 
       g_stdi_m.stdi004_desc,g_stdi_m.stdi005,g_stdi_m.stdi005_desc,g_stdi_m.stdi006,g_stdi_m.stdi006_desc, 
       g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.sq_amount,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi010_desc,g_stdi_m.hx_amount,g_stdi_m.stdi011,g_stdi_m.stdi011_desc, 
       g_stdi_m.stdi012,g_stdi_m.stdi012_desc,g_stdi_m.ooff013,g_stdi_m.stdiownid,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp,g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp, 
       g_stdi_m.stdicrtdp_desc,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimodid_desc,g_stdi_m.stdimoddt, 
       g_stdi_m.stdicnfid,g_stdi_m.stdicnfid_desc,g_stdi_m.stdicnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stdi_m.stdiownid      
   LET g_data_dept  = g_stdi_m.stdiowndp
   
   #功能已完成,通報訊息中心
   CALL astt605_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt605_modify()
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
   LET g_stdi_m_t.* = g_stdi_m.*
   LET g_stdi_m_o.* = g_stdi_m.*
   
   IF g_stdi_m.stdidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stdidocno_t = g_stdi_m.stdidocno
 
   CALL s_transaction_begin()
   
   OPEN astt605_cl USING g_enterprise,g_stdi_m.stdidocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt605_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt605_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt605_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdi_m_mask_o.* =  g_stdi_m.*
   CALL astt605_stdi_t_mask()
   LET g_stdi_m_mask_n.* =  g_stdi_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt605_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stdidocno_t = g_stdi_m.stdidocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stdi_m.stdimodid = g_user 
LET g_stdi_m.stdimoddt = cl_get_current()
LET g_stdi_m.stdimodid_desc = cl_get_username(g_stdi_m.stdimodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stdi_m.stdistus MATCHES "[DR]" THEN
         LET g_stdi_m.stdistus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt605_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stdi_t SET (stdimodid,stdimoddt) = (g_stdi_m.stdimodid,g_stdi_m.stdimoddt)
          WHERE stdient = g_enterprise AND stdidocno = g_stdidocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stdi_m.* = g_stdi_m_t.*
            CALL astt605_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stdi_m.stdidocno != g_stdi_m_t.stdidocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stdj_t SET stdjdocno = g_stdi_m.stdidocno
 
          WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m_t.stdidocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stdj_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
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
   CALL astt605_set_act_visible()   
   CALL astt605_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stdient = " ||g_enterprise|| " AND",
                      " stdidocno = '", g_stdi_m.stdidocno, "' "
 
   #填到對應位置
   CALL astt605_browser_fill("")
 
   CLOSE astt605_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt605_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt605.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt605_input(p_cmd)
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
   DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdisite_desc,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001, 
       g_stdi_m.stdi002,g_stdi_m.stdi002_desc,g_stdi_m.stdi003,g_stdi_m.stdi003_desc,g_stdi_m.stdi004, 
       g_stdi_m.stdi004_desc,g_stdi_m.stdi005,g_stdi_m.stdi005_desc,g_stdi_m.stdi006,g_stdi_m.stdi006_desc, 
       g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.sq_amount,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi010_desc,g_stdi_m.hx_amount,g_stdi_m.stdi011,g_stdi_m.stdi011_desc, 
       g_stdi_m.stdi012,g_stdi_m.stdi012_desc,g_stdi_m.ooff013,g_stdi_m.stdiownid,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp,g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp, 
       g_stdi_m.stdicrtdp_desc,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimodid_desc,g_stdi_m.stdimoddt, 
       g_stdi_m.stdicnfid,g_stdi_m.stdicnfid_desc,g_stdi_m.stdicnfdt
   
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
   LET g_forupd_sql = "SELECT stdjseq,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007,stdj008, 
       stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020, 
       stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit FROM stdj_t WHERE stdjent=?  
       AND stdjdocno=? AND stdjseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt605_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt605_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt605_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002, 
       g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005,g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus, 
       g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012, 
       g_stdi_m.ooff013
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   LET g_flag = FALSE
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt605.input.head" >}
      #單頭段
      INPUT BY NAME g_stdi_m.stdisite,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002, 
          g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005,g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus, 
          g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012, 
          g_stdi_m.ooff013 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt605_cl USING g_enterprise,g_stdi_m.stdidocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt605_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt605_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt605_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL astt605_set_entry(p_cmd)
            CALL astt605_set_no_entry(p_cmd)
            #end add-point
            CALL astt605_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdisite
            
            #add-point:AFTER FIELD stdisite name="input.a.stdisite"
            IF NOT cl_null(g_stdi_m.stdisite) THEN
               CALL s_aooi500_chk(g_prog,'stdisite',g_stdi_m.stdisite,g_stdi_m.stdisite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stdi_m.stdisite = g_stdi_m_t.stdisite
                  CALL s_desc_get_department_desc(g_stdi_m.stdisite) RETURNING g_stdi_m.stdisite_desc
                  DISPLAY BY NAME g_stdi_m.stdisite_desc
                  NEXT FIELD CURRENT
               END IF
            END IF
            CALL s_desc_get_department_desc(g_stdi_m.stdisite) RETURNING g_stdi_m.stdisite_desc
            DISPLAY BY NAME g_stdi_m.stdisite_desc
            LET g_site_flag = TRUE
            CALL astt605_set_entry(p_cmd)
            CALL astt605_set_no_entry(p_cmd)

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdisite
            #add-point:BEFORE FIELD stdisite name="input.b.stdisite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdisite
            #add-point:ON CHANGE stdisite name="input.g.stdisite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdidocdt
            #add-point:BEFORE FIELD stdidocdt name="input.b.stdidocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdidocdt
            
            #add-point:AFTER FIELD stdidocdt name="input.a.stdidocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdidocdt
            #add-point:ON CHANGE stdidocdt name="input.g.stdidocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdidocno
            #add-point:BEFORE FIELD stdidocno name="input.b.stdidocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdidocno
            
            #add-point:AFTER FIELD stdidocno name="input.a.stdidocno"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF NOT cl_null(g_stdi_m.stdidocno) AND p_cmd = 'a' THEN
               IF NOT s_aooi200_chk_slip(g_site,'',g_stdi_m.stdidocno,g_prog) THEN
                  LET g_stdi_m.stdidocno = g_stdi_m_t.stdidocno
                  NEXT FIELD CURRENT
               END IF
               #mark by geza 20161124 #161121-00013#1(S)
#               CALL s_aooi200_gen_docno(g_site,g_stdi_m.stdidocno,g_stdi_m.stdidocdt,g_prog) RETURNING l_success,g_stdi_m.stdidocno
#               IF NOT l_success THEN
#                  NEXT FIELD stdidocno
#               END IF
               #mark by geza 20161124 #161121-00013#1(E)
               LET g_flag = TRUE
            END IF
            IF  NOT cl_null(g_stdi_m.stdidocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stdi_m.stdidocno != g_stdidocno_t )) THEN 
                  IF NOT ap_chk_notDup("", "SELECT COUNT(*) FROM stdi_t WHERE "||"stdient = '" ||g_enterprise|| "' AND "||"stdidocno = '"||g_stdi_m.stdidocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF cl_null(g_stdi_m.stdidocno) THEN
               NEXT FIELD stdidocno
            END IF
            CALL astt605_set_entry(p_cmd)
            CALL astt605_set_no_entry(p_cmd)


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdidocno
            #add-point:ON CHANGE stdidocno name="input.g.stdidocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi001
            #add-point:BEFORE FIELD stdi001 name="input.b.stdi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi001
            
            #add-point:AFTER FIELD stdi001 name="input.a.stdi001"
            IF NOT cl_null(g_stdi_m.stdi001) THEN
               IF g_stdi_m.stdi001 <> g_stdi_m_o.stdi001 OR cl_null(g_stdi_m_o.stdi001) THEN   #160824-00007#198 161120 by lori add
                  IF NOT astt605_stdi001_chk() THEN
                     LET g_stdi_m.stdi001 = g_stdi_m_o.stdi001   #160824-00007#198 161120 by lori mod:g_stdi_m_t.stdi001->g_stdi_m_o.stdi001
                     DISPLAY BY NAME g_stdi_m.stdi001            #160824-00007#198 161120 by lori add
                     CALL astt605_stdi001_other()
                     NEXT FIELD stdi001
                  END IF
              #IF p_cmd = 'a' OR (p_cmd = 'u' AND  g_stdi_m.stdi001 <> g_stdi_m_t.stdi001 ) THEN   #160824-00007#198 161120 by lori mark
                  #161124-00020#1 -s by 08172
#                  IF NOT astt605_stdi001_genb() THEN
#                     LET g_stdi_m.stdi001 = g_stdi_m_o.stdi001   #160824-00007#198 161120 by lori mod:g_stdi_m_t.stdi001->g_stdi_m_o.stdi001
#                     DISPLAY BY NAME g_stdi_m.stdi001            #160824-00007#198 161120 by lori add
#                     CALL astt605_stdi001_other()
#                     NEXT FIELD stdi001
#                  ELSE
#                     CALL astt605_b_fill()
#                     CALL astt605_reflesh()        
#                  END IF
                  #161124-00020#1 -e by 08172
               END IF
            END IF
            CALL astt605_stdi001_other()
            
            LET g_stdi_m_o.stdi001 = g_stdi_m.stdi001   #160824-00007#198 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi001
            #add-point:ON CHANGE stdi001 name="input.g.stdi001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi002
            
            #add-point:AFTER FIELD stdi002 name="input.a.stdi002"
           

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi002
            #add-point:BEFORE FIELD stdi002 name="input.b.stdi002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi002
            #add-point:ON CHANGE stdi002 name="input.g.stdi002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi003
            
            #add-point:AFTER FIELD stdi003 name="input.a.stdi003"
           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi003
            #add-point:BEFORE FIELD stdi003 name="input.b.stdi003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi003
            #add-point:ON CHANGE stdi003 name="input.g.stdi003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi004
            
            #add-point:AFTER FIELD stdi004 name="input.a.stdi004"
           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi004
            #add-point:BEFORE FIELD stdi004 name="input.b.stdi004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi004
            #add-point:ON CHANGE stdi004 name="input.g.stdi004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi005
            
            #add-point:AFTER FIELD stdi005 name="input.a.stdi005"
            LET g_stdi_m.stdi005_desc = ''
            DISPLAY BY NAME  g_stdi_m.stdi005_desc 
            IF NOT cl_null(g_stdi_m.stdi005) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stdi_m.stdi005
               #160318-00025#35  2016/05/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               #160318-00025#35  2016/05/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooag001") THEN
                  LET g_stdi_m.stdi005 = g_stdi_m_t.stdi005
                  CALL astt605_stdi005_ref()
                  NEXT FIELD stdi005
               END IF
            END IF
            CALL astt605_stdi005_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi005
            #add-point:BEFORE FIELD stdi005 name="input.b.stdi005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi005
            #add-point:ON CHANGE stdi005 name="input.g.stdi005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi006
            
            #add-point:AFTER FIELD stdi006 name="input.a.stdi006"
            LET g_stdi_m.stdi006_desc = ''
            DISPLAY BY NAME g_stdi_m.stdi006_desc
            IF NOT cl_null(g_stdi_m.stdi006) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stdi_m.stdi006
               LET g_chkparam.arg2 = g_stdi_m.stdidocdt
               #160318-00025#35  2016/04/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
               #160318-00025#35  2016/04/15  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooeg001") THEN
                  LET g_stdi_m.stdi006 = g_stdi_m_t.stdi006
                  CALL astt605_stdi006_ref()
                  NEXT FIELD stcx005
               END IF     
            END IF
            CALL astt605_stdi006_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi006
            #add-point:BEFORE FIELD stdi006 name="input.b.stdi006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi006
            #add-point:ON CHANGE stdi006 name="input.g.stdi006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdiunit
            #add-point:BEFORE FIELD stdiunit name="input.b.stdiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdiunit
            
            #add-point:AFTER FIELD stdiunit name="input.a.stdiunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdiunit
            #add-point:ON CHANGE stdiunit name="input.g.stdiunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdistus
            #add-point:BEFORE FIELD stdistus name="input.b.stdistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdistus
            
            #add-point:AFTER FIELD stdistus name="input.a.stdistus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdistus
            #add-point:ON CHANGE stdistus name="input.g.stdistus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi007
            #add-point:BEFORE FIELD stdi007 name="input.b.stdi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi007
            
            #add-point:AFTER FIELD stdi007 name="input.a.stdi007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi007
            #add-point:ON CHANGE stdi007 name="input.g.stdi007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi008
            #add-point:BEFORE FIELD stdi008 name="input.b.stdi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi008
            
            #add-point:AFTER FIELD stdi008 name="input.a.stdi008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi008
            #add-point:ON CHANGE stdi008 name="input.g.stdi008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi009
            #add-point:BEFORE FIELD stdi009 name="input.b.stdi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi009
            
            #add-point:AFTER FIELD stdi009 name="input.a.stdi009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi009
            #add-point:ON CHANGE stdi009 name="input.g.stdi009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi010
            
            #add-point:AFTER FIELD stdi010 name="input.a.stdi010"
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi010
            #add-point:BEFORE FIELD stdi010 name="input.b.stdi010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi010
            #add-point:ON CHANGE stdi010 name="input.g.stdi010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi011
            
            #add-point:AFTER FIELD stdi011 name="input.a.stdi011"
           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi011
            #add-point:BEFORE FIELD stdi011 name="input.b.stdi011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi011
            #add-point:ON CHANGE stdi011 name="input.g.stdi011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdi012
            
            #add-point:AFTER FIELD stdi012 name="input.a.stdi012"
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdi012
            #add-point:BEFORE FIELD stdi012 name="input.b.stdi012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdi012
            #add-point:ON CHANGE stdi012 name="input.g.stdi012"
            
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
                  #Ctrlp:input.c.stdisite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdisite
            #add-point:ON ACTION controlp INFIELD stdisite name="input.c.stdisite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdisite              #給予default值

            #給予arg
            #LET g_qryparam.arg1 = g_site
            #LET g_qryparam.arg2 = '8'

            #CALL q_ooed004_3()                                #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdisite',g_stdi_m.stdisite,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()
            LET g_stdi_m.stdisite = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stdi_m.stdisite TO stdisite              #顯示到畫面上
            CALL s_desc_get_department_desc(g_stdi_m.stdisite) RETURNING g_stdi_m.stdisite_desc
            DISPLAY BY NAME g_stdi_m.stdisite_desc
            NEXT FIELD stdisite   
            #END add-point
 
 
         #Ctrlp:input.c.stdidocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdidocdt
            #add-point:ON ACTION controlp INFIELD stdidocdt name="input.c.stdidocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdidocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdidocno
            #add-point:ON ACTION controlp INFIELD stdidocno name="input.c.stdidocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdidocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_ooef004#
            #LET g_qryparam.arg2 = "astt605" #   #160705-00042#5 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#5 160711 by sakura add
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stdi_m.stdidocno = g_qryparam.return1              

            DISPLAY g_stdi_m.stdidocno TO stdidocno              #

            NEXT FIELD stdidocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi001
            #add-point:ON ACTION controlp INFIELD stdi001 name="input.c.stdi001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = "stcxdocno NOT IN(SELECT DISTINCT stdi001 FROM stdi_t WHERE stdient = '",g_enterprise,"')"
            
            CALL q_stcxdocno()                                #呼叫開窗

            LET g_stdi_m.stdi001 = g_qryparam.return1              

            DISPLAY g_stdi_m.stdi001 TO stdi001              #

            NEXT FIELD stdi001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi002
            #add-point:ON ACTION controlp INFIELD stdi002 name="input.c.stdi002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_prcd001_1()                                #呼叫開窗

            LET g_stdi_m.stdi002 = g_qryparam.return1              

            DISPLAY g_stdi_m.stdi002 TO stdi002              #

            NEXT FIELD stdi002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi003
            #add-point:ON ACTION controlp INFIELD stdi003 name="input.c.stdi003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi004
            #add-point:ON ACTION controlp INFIELD stdi004 name="input.c.stdi004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi005
            #add-point:ON ACTION controlp INFIELD stdi005 name="input.c.stdi005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stdi_m.stdi005 = g_qryparam.return1              

            DISPLAY g_stdi_m.stdi005 TO stdi005              #
            CALL astt605_stdi005_ref()
            NEXT FIELD stdi005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi006
            #add-point:ON ACTION controlp INFIELD stdi006 name="input.c.stdi006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi006             #給予default值
            LET g_qryparam.default2 = "" #g_stdi_m.ooeg001 #部門編號
            #給予arg
          
            LET g_qryparam.arg1 = g_stdi_m.stdidocdt 
            
            CALL q_ooeg001()                                #呼叫開窗

            LET g_stdi_m.stdi006 = g_qryparam.return1              
            #LET g_stdi_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stdi_m.stdi006 TO stdi006              #
            CALL astt605_stdi006_ref()
            #DISPLAY g_stdi_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD stdi006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdiunit
            #add-point:ON ACTION controlp INFIELD stdiunit name="input.c.stdiunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdistus
            #add-point:ON ACTION controlp INFIELD stdistus name="input.c.stdistus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi007
            #add-point:ON ACTION controlp INFIELD stdi007 name="input.c.stdi007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi008
            #add-point:ON ACTION controlp INFIELD stdi008 name="input.c.stdi008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi009
            #add-point:ON ACTION controlp INFIELD stdi009 name="input.c.stdi009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stce001()                                #呼叫開窗

            LET g_stdi_m.stdi009 = g_qryparam.return1              

            DISPLAY g_stdi_m.stdi009 TO stdi009              #

            NEXT FIELD stdi009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi010
            #add-point:ON ACTION controlp INFIELD stdi010 name="input.c.stdi010"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdi_m.stdi010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stdi_m.stdi010 = g_qryparam.return1              

            DISPLAY g_stdi_m.stdi010 TO stdi010              #

            NEXT FIELD stdi010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi011
            #add-point:ON ACTION controlp INFIELD stdi011 name="input.c.stdi011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdi012
            #add-point:ON ACTION controlp INFIELD stdi012 name="input.c.stdi012"
            
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
            DISPLAY BY NAME g_stdi_m.stdidocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
          
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               #add by geza 20161124 #161121-00013#1(S)
               CALL s_aooi200_gen_docno(g_site,g_stdi_m.stdidocno,g_stdi_m.stdidocdt,g_prog) RETURNING l_success,g_stdi_m.stdidocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stdi_m.stdidocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG 
               END IF
               #add by geza 20161124 #161121-00013#1(E)
               #end add-point
               
               INSERT INTO stdi_t (stdient,stdisite,stdidocdt,stdidocno,stdi001,stdi002,stdi003,stdi004, 
                   stdi005,stdi006,stdiunit,stdistus,stdi007,stdi008,stdi009,stdi010,stdi011,stdi012, 
                   stdiownid,stdiowndp,stdicrtid,stdicrtdp,stdicrtdt,stdimodid,stdimoddt,stdicnfid,stdicnfdt) 
 
               VALUES (g_enterprise,g_stdi_m.stdisite,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001, 
                   g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005,g_stdi_m.stdi006, 
                   g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
                   g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp, 
                   g_stdi_m.stdicrtid,g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt, 
                   g_stdi_m.stdicnfid,g_stdi_m.stdicnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stdi_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
                IF NOT cl_null(g_stdi_m.ooff013) THEN
                  LET l_success = ''
                  CALL s_aooi360_gen('2',g_stdi_m.stdidocno,'','','','','','','','','','4',g_stdi_m.ooff013) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               ELSE
                  CALL s_aooi360_del('2',g_stdi_m.stdidocno,'','','','','','','','','','4') RETURNING l_success
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
               #161124-00020#1 -s by 08172
               IF NOT astt605_stdi001_genb() THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stdj_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                
                  CONTINUE DIALOG
               ELSE
                  CALL astt605_b_fill()
                  CALL astt605_reflesh()        
               END IF
               #161124-00020#1 -e by 08172
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt605_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt605_b_fill()
                  CALL astt605_b_fill2('0')
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
               CALL astt605_stdi_t_mask_restore('restore_mask_o')
               
               UPDATE stdi_t SET (stdisite,stdidocdt,stdidocno,stdi001,stdi002,stdi003,stdi004,stdi005, 
                   stdi006,stdiunit,stdistus,stdi007,stdi008,stdi009,stdi010,stdi011,stdi012,stdiownid, 
                   stdiowndp,stdicrtid,stdicrtdp,stdicrtdt,stdimodid,stdimoddt,stdicnfid,stdicnfdt) = (g_stdi_m.stdisite, 
                   g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003, 
                   g_stdi_m.stdi004,g_stdi_m.stdi005,g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus, 
                   g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi011, 
                   g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid,g_stdi_m.stdicrtdp, 
                   g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid,g_stdi_m.stdicnfdt) 
 
                WHERE stdient = g_enterprise AND stdidocno = g_stdidocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stdi_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
                 IF NOT cl_null(g_stdi_m.ooff013) THEN
                  LET l_success = ''
                  CALL s_aooi360_gen('2',g_stdi_m.stdidocno,'','','','','','','','','','4',g_stdi_m.ooff013) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               ELSE
                  CALL s_aooi360_del('2',g_stdi_m.stdidocno,'','','','','','','','','','4') RETURNING l_success
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
               CALL astt605_stdi_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stdi_m_t)
               LET g_log2 = util.JSON.stringify(g_stdi_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               #161124-00020#1 -s by 08172
               IF NOT astt605_stdi001_genb() THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stdj_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                
                  CONTINUE DIALOG
               ELSE
                  CALL astt605_b_fill()
                  CALL astt605_reflesh()        
               END IF
               #161124-00020#1 -e by 08172
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stdidocno_t = g_stdi_m.stdidocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt605.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stdj_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = FALSE, 
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stdj_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt605_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stdj_d.getLength()
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
            OPEN astt605_cl USING g_enterprise,g_stdi_m.stdidocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt605_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt605_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stdj_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stdj_d[l_ac].stdjseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stdj_d_t.* = g_stdj_d[l_ac].*  #BACKUP
               LET g_stdj_d_o.* = g_stdj_d[l_ac].*  #BACKUP
               CALL astt605_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt605_set_no_entry_b(l_cmd)
               IF NOT astt605_lock_b("stdj_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt605_bcl INTO g_stdj_d[l_ac].stdjseq,g_stdj_d[l_ac].stdj001,g_stdj_d[l_ac].stdj002, 
                      g_stdj_d[l_ac].stdj003,g_stdj_d[l_ac].stdj004,g_stdj_d[l_ac].stdj005,g_stdj_d[l_ac].stdj006, 
                      g_stdj_d[l_ac].stdj007,g_stdj_d[l_ac].stdj008,g_stdj_d[l_ac].stdj009,g_stdj_d[l_ac].stdj010, 
                      g_stdj_d[l_ac].stdj011,g_stdj_d[l_ac].stdj012,g_stdj_d[l_ac].stdj013,g_stdj_d[l_ac].stdj014, 
                      g_stdj_d[l_ac].stdj015,g_stdj_d[l_ac].stdj016,g_stdj_d[l_ac].stdj017,g_stdj_d[l_ac].stdj018, 
                      g_stdj_d[l_ac].stdj019,g_stdj_d[l_ac].stdj020,g_stdj_d[l_ac].stdj021,g_stdj_d[l_ac].stdj022, 
                      g_stdj_d[l_ac].stdj023,g_stdj_d[l_ac].stdj024,g_stdj_d[l_ac].stdj025,g_stdj_d[l_ac].stdj026, 
                      g_stdj_d[l_ac].stdjsite,g_stdj_d[l_ac].stdjunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stdj_d_t.stdjseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stdj_d_mask_o[l_ac].* =  g_stdj_d[l_ac].*
                  CALL astt605_stdj_t_mask()
                  LET g_stdj_d_mask_n[l_ac].* =  g_stdj_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt605_show()
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
            INITIALIZE g_stdj_d[l_ac].* TO NULL 
            INITIALIZE g_stdj_d_t.* TO NULL 
            INITIALIZE g_stdj_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stdj_d[l_ac].stdj010 = "0"
      LET g_stdj_d[l_ac].stdj011 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stdj_d_t.* = g_stdj_d[l_ac].*     #新輸入資料
            LET g_stdj_d_o.* = g_stdj_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt605_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt605_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stdj_d[li_reproduce_target].* = g_stdj_d[li_reproduce].*
 
               LET g_stdj_d[li_reproduce_target].stdjseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stdj_t 
             WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
 
               AND stdjseq = g_stdj_d[l_ac].stdjseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdi_m.stdidocno
               LET gs_keys[2] = g_stdj_d[g_detail_idx].stdjseq
               CALL astt605_insert_b('stdj_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stdj_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt605_b_fill()
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
               LET gs_keys[01] = g_stdi_m.stdidocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stdj_d_t.stdjseq
 
            
               #刪除同層單身
               IF NOT astt605_delete_b('stdj_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt605_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt605_key_delete_b(gs_keys,'stdj_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt605_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt605_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stdj_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stdj_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjseq
            #add-point:BEFORE FIELD stdjseq name="input.b.page1.stdjseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjseq
            
            #add-point:AFTER FIELD stdjseq name="input.a.page1.stdjseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_stdi_m.stdidocno IS NOT NULL AND g_stdj_d[g_detail_idx].stdjseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stdi_m.stdidocno != g_stdidocno_t OR g_stdj_d[g_detail_idx].stdjseq != g_stdj_d_t.stdjseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stdj_t WHERE "||"stdjent = '" ||g_enterprise|| "' AND "||"stdjdocno = '"||g_stdi_m.stdidocno ||"' AND "|| "stdjseq = '"||g_stdj_d[g_detail_idx].stdjseq ||"'",'std-00004',0) THEN 
                     LET g_stdj_d[l_ac].stdjseq = g_stdj_d_t.stdjseq 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdjseq
            #add-point:ON CHANGE stdjseq name="input.g.page1.stdjseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj001
            #add-point:BEFORE FIELD stdj001 name="input.b.page1.stdj001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj001
            
            #add-point:AFTER FIELD stdj001 name="input.a.page1.stdj001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj001
            #add-point:ON CHANGE stdj001 name="input.g.page1.stdj001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj002
            #add-point:BEFORE FIELD stdj002 name="input.b.page1.stdj002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj002
            
            #add-point:AFTER FIELD stdj002 name="input.a.page1.stdj002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj002
            #add-point:ON CHANGE stdj002 name="input.g.page1.stdj002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj003
            #add-point:BEFORE FIELD stdj003 name="input.b.page1.stdj003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj003
            
            #add-point:AFTER FIELD stdj003 name="input.a.page1.stdj003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj003
            #add-point:ON CHANGE stdj003 name="input.g.page1.stdj003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj004
            #add-point:BEFORE FIELD stdj004 name="input.b.page1.stdj004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj004
            
            #add-point:AFTER FIELD stdj004 name="input.a.page1.stdj004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj004
            #add-point:ON CHANGE stdj004 name="input.g.page1.stdj004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj005
            
            #add-point:AFTER FIELD stdj005 name="input.a.page1.stdj005"
           

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj005
            #add-point:BEFORE FIELD stdj005 name="input.b.page1.stdj005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj005
            #add-point:ON CHANGE stdj005 name="input.g.page1.stdj005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj006
            
            #add-point:AFTER FIELD stdj006 name="input.a.page1.stdj006"
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj006
            #add-point:BEFORE FIELD stdj006 name="input.b.page1.stdj006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj006
            #add-point:ON CHANGE stdj006 name="input.g.page1.stdj006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj007
            #add-point:BEFORE FIELD stdj007 name="input.b.page1.stdj007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj007
            
            #add-point:AFTER FIELD stdj007 name="input.a.page1.stdj007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj007
            #add-point:ON CHANGE stdj007 name="input.g.page1.stdj007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj008
            #add-point:BEFORE FIELD stdj008 name="input.b.page1.stdj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj008
            
            #add-point:AFTER FIELD stdj008 name="input.a.page1.stdj008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj008
            #add-point:ON CHANGE stdj008 name="input.g.page1.stdj008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj009
            #add-point:BEFORE FIELD stdj009 name="input.b.page1.stdj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj009
            
            #add-point:AFTER FIELD stdj009 name="input.a.page1.stdj009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj009
            #add-point:ON CHANGE stdj009 name="input.g.page1.stdj009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj010
            #add-point:BEFORE FIELD stdj010 name="input.b.page1.stdj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj010
            
            #add-point:AFTER FIELD stdj010 name="input.a.page1.stdj010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj010
            #add-point:ON CHANGE stdj010 name="input.g.page1.stdj010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj011
            #add-point:BEFORE FIELD stdj011 name="input.b.page1.stdj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj011
            
            #add-point:AFTER FIELD stdj011 name="input.a.page1.stdj011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj011
            #add-point:ON CHANGE stdj011 name="input.g.page1.stdj011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj012
            #add-point:BEFORE FIELD stdj012 name="input.b.page1.stdj012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj012
            
            #add-point:AFTER FIELD stdj012 name="input.a.page1.stdj012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj012
            #add-point:ON CHANGE stdj012 name="input.g.page1.stdj012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj013
            #add-point:BEFORE FIELD stdj013 name="input.b.page1.stdj013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj013
            
            #add-point:AFTER FIELD stdj013 name="input.a.page1.stdj013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj013
            #add-point:ON CHANGE stdj013 name="input.g.page1.stdj013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj014
            #add-point:BEFORE FIELD stdj014 name="input.b.page1.stdj014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj014
            
            #add-point:AFTER FIELD stdj014 name="input.a.page1.stdj014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj014
            #add-point:ON CHANGE stdj014 name="input.g.page1.stdj014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj015
            #add-point:BEFORE FIELD stdj015 name="input.b.page1.stdj015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj015
            
            #add-point:AFTER FIELD stdj015 name="input.a.page1.stdj015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj015
            #add-point:ON CHANGE stdj015 name="input.g.page1.stdj015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj016
            #add-point:BEFORE FIELD stdj016 name="input.b.page1.stdj016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj016
            
            #add-point:AFTER FIELD stdj016 name="input.a.page1.stdj016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj016
            #add-point:ON CHANGE stdj016 name="input.g.page1.stdj016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj017
            #add-point:BEFORE FIELD stdj017 name="input.b.page1.stdj017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj017
            
            #add-point:AFTER FIELD stdj017 name="input.a.page1.stdj017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj017
            #add-point:ON CHANGE stdj017 name="input.g.page1.stdj017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj018
            #add-point:BEFORE FIELD stdj018 name="input.b.page1.stdj018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj018
            
            #add-point:AFTER FIELD stdj018 name="input.a.page1.stdj018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj018
            #add-point:ON CHANGE stdj018 name="input.g.page1.stdj018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj019
            #add-point:BEFORE FIELD stdj019 name="input.b.page1.stdj019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj019
            
            #add-point:AFTER FIELD stdj019 name="input.a.page1.stdj019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj019
            #add-point:ON CHANGE stdj019 name="input.g.page1.stdj019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj020
            #add-point:BEFORE FIELD stdj020 name="input.b.page1.stdj020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj020
            
            #add-point:AFTER FIELD stdj020 name="input.a.page1.stdj020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj020
            #add-point:ON CHANGE stdj020 name="input.g.page1.stdj020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj021
            #add-point:BEFORE FIELD stdj021 name="input.b.page1.stdj021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj021
            
            #add-point:AFTER FIELD stdj021 name="input.a.page1.stdj021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj021
            #add-point:ON CHANGE stdj021 name="input.g.page1.stdj021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj022
            #add-point:BEFORE FIELD stdj022 name="input.b.page1.stdj022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj022
            
            #add-point:AFTER FIELD stdj022 name="input.a.page1.stdj022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj022
            #add-point:ON CHANGE stdj022 name="input.g.page1.stdj022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj023
            #add-point:BEFORE FIELD stdj023 name="input.b.page1.stdj023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj023
            
            #add-point:AFTER FIELD stdj023 name="input.a.page1.stdj023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj023
            #add-point:ON CHANGE stdj023 name="input.g.page1.stdj023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj024
            #add-point:BEFORE FIELD stdj024 name="input.b.page1.stdj024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj024
            
            #add-point:AFTER FIELD stdj024 name="input.a.page1.stdj024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj024
            #add-point:ON CHANGE stdj024 name="input.g.page1.stdj024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj025
            #add-point:BEFORE FIELD stdj025 name="input.b.page1.stdj025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj025
            
            #add-point:AFTER FIELD stdj025 name="input.a.page1.stdj025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj025
            #add-point:ON CHANGE stdj025 name="input.g.page1.stdj025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdj026
            #add-point:BEFORE FIELD stdj026 name="input.b.page1.stdj026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdj026
            
            #add-point:AFTER FIELD stdj026 name="input.a.page1.stdj026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdj026
            #add-point:ON CHANGE stdj026 name="input.g.page1.stdj026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjsite
            #add-point:BEFORE FIELD stdjsite name="input.b.page1.stdjsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjsite
            
            #add-point:AFTER FIELD stdjsite name="input.a.page1.stdjsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdjsite
            #add-point:ON CHANGE stdjsite name="input.g.page1.stdjsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdjunit
            #add-point:BEFORE FIELD stdjunit name="input.b.page1.stdjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdjunit
            
            #add-point:AFTER FIELD stdjunit name="input.a.page1.stdjunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdjunit
            #add-point:ON CHANGE stdjunit name="input.g.page1.stdjunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stdjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjseq
            #add-point:ON ACTION controlp INFIELD stdjseq name="input.c.page1.stdjseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj001
            #add-point:ON ACTION controlp INFIELD stdj001 name="input.c.page1.stdj001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj002
            #add-point:ON ACTION controlp INFIELD stdj002 name="input.c.page1.stdj002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj003
            #add-point:ON ACTION controlp INFIELD stdj003 name="input.c.page1.stdj003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj004
            #add-point:ON ACTION controlp INFIELD stdj004 name="input.c.page1.stdj004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj005
            #add-point:ON ACTION controlp INFIELD stdj005 name="input.c.page1.stdj005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdj_d[l_ac].stdj005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stdj_d[l_ac].stdj005 = g_qryparam.return1              

            DISPLAY g_stdj_d[l_ac].stdj005 TO stdj005              #

            NEXT FIELD stdj005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj006
            #add-point:ON ACTION controlp INFIELD stdj006 name="input.c.page1.stdj006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdj_d[l_ac].stdj006             #給予default值
            LET g_qryparam.default2 = "" #g_stdj_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stdj_d[l_ac].stae001 #費用編號
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stae001()                                #呼叫開窗

            LET g_stdj_d[l_ac].stdj006 = g_qryparam.return1              
            #LET g_stdj_d[l_ac].stael003 = g_qryparam.return2 
            #LET g_stdj_d[l_ac].stae001 = g_qryparam.return3 
            DISPLAY g_stdj_d[l_ac].stdj006 TO stdj006              #
            #DISPLAY g_stdj_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stdj_d[l_ac].stae001 TO stae001 #費用編號
            NEXT FIELD stdj006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj007
            #add-point:ON ACTION controlp INFIELD stdj007 name="input.c.page1.stdj007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj008
            #add-point:ON ACTION controlp INFIELD stdj008 name="input.c.page1.stdj008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj009
            #add-point:ON ACTION controlp INFIELD stdj009 name="input.c.page1.stdj009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj010
            #add-point:ON ACTION controlp INFIELD stdj010 name="input.c.page1.stdj010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj011
            #add-point:ON ACTION controlp INFIELD stdj011 name="input.c.page1.stdj011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj012
            #add-point:ON ACTION controlp INFIELD stdj012 name="input.c.page1.stdj012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj013
            #add-point:ON ACTION controlp INFIELD stdj013 name="input.c.page1.stdj013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj014
            #add-point:ON ACTION controlp INFIELD stdj014 name="input.c.page1.stdj014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj015
            #add-point:ON ACTION controlp INFIELD stdj015 name="input.c.page1.stdj015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj016
            #add-point:ON ACTION controlp INFIELD stdj016 name="input.c.page1.stdj016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj017
            #add-point:ON ACTION controlp INFIELD stdj017 name="input.c.page1.stdj017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj018
            #add-point:ON ACTION controlp INFIELD stdj018 name="input.c.page1.stdj018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj019
            #add-point:ON ACTION controlp INFIELD stdj019 name="input.c.page1.stdj019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj020
            #add-point:ON ACTION controlp INFIELD stdj020 name="input.c.page1.stdj020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj021
            #add-point:ON ACTION controlp INFIELD stdj021 name="input.c.page1.stdj021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj022
            #add-point:ON ACTION controlp INFIELD stdj022 name="input.c.page1.stdj022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj023
            #add-point:ON ACTION controlp INFIELD stdj023 name="input.c.page1.stdj023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj024
            #add-point:ON ACTION controlp INFIELD stdj024 name="input.c.page1.stdj024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj025
            #add-point:ON ACTION controlp INFIELD stdj025 name="input.c.page1.stdj025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdj026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdj026
            #add-point:ON ACTION controlp INFIELD stdj026 name="input.c.page1.stdj026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdjsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjsite
            #add-point:ON ACTION controlp INFIELD stdjsite name="input.c.page1.stdjsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdjunit
            #add-point:ON ACTION controlp INFIELD stdjunit name="input.c.page1.stdjunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stdj_d[l_ac].* = g_stdj_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt605_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stdj_d[l_ac].stdjseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stdj_d[l_ac].* = g_stdj_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt605_stdj_t_mask_restore('restore_mask_o')
      
               UPDATE stdj_t SET (stdjdocno,stdjseq,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006, 
                   stdj007,stdj008,stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017, 
                   stdj018,stdj019,stdj020,stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite, 
                   stdjunit) = (g_stdi_m.stdidocno,g_stdj_d[l_ac].stdjseq,g_stdj_d[l_ac].stdj001,g_stdj_d[l_ac].stdj002, 
                   g_stdj_d[l_ac].stdj003,g_stdj_d[l_ac].stdj004,g_stdj_d[l_ac].stdj005,g_stdj_d[l_ac].stdj006, 
                   g_stdj_d[l_ac].stdj007,g_stdj_d[l_ac].stdj008,g_stdj_d[l_ac].stdj009,g_stdj_d[l_ac].stdj010, 
                   g_stdj_d[l_ac].stdj011,g_stdj_d[l_ac].stdj012,g_stdj_d[l_ac].stdj013,g_stdj_d[l_ac].stdj014, 
                   g_stdj_d[l_ac].stdj015,g_stdj_d[l_ac].stdj016,g_stdj_d[l_ac].stdj017,g_stdj_d[l_ac].stdj018, 
                   g_stdj_d[l_ac].stdj019,g_stdj_d[l_ac].stdj020,g_stdj_d[l_ac].stdj021,g_stdj_d[l_ac].stdj022, 
                   g_stdj_d[l_ac].stdj023,g_stdj_d[l_ac].stdj024,g_stdj_d[l_ac].stdj025,g_stdj_d[l_ac].stdj026, 
                   g_stdj_d[l_ac].stdjsite,g_stdj_d[l_ac].stdjunit)
                WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno 
 
                  AND stdjseq = g_stdj_d_t.stdjseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stdj_d[l_ac].* = g_stdj_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdj_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stdj_d[l_ac].* = g_stdj_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdi_m.stdidocno
               LET gs_keys_bak[1] = g_stdidocno_t
               LET gs_keys[2] = g_stdj_d[g_detail_idx].stdjseq
               LET gs_keys_bak[2] = g_stdj_d_t.stdjseq
               CALL astt605_update_b('stdj_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt605_stdj_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stdj_d[g_detail_idx].stdjseq = g_stdj_d_t.stdjseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stdi_m.stdidocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stdj_d_t.stdjseq
 
                  CALL astt605_key_update_b(gs_keys,'stdj_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stdi_m),util.JSON.stringify(g_stdj_d_t)
               LET g_log2 = util.JSON.stringify(g_stdi_m),util.JSON.stringify(g_stdj_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt605_unlock_b("stdj_t","'1'")
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
               LET g_stdj_d[li_reproduce_target].* = g_stdj_d[li_reproduce].*
 
               LET g_stdj_d[li_reproduce_target].stdjseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stdj_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stdj_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt605.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stdisite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdjseq
 
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
            NEXT FIELD stdidocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdjseq
 
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
   SELECT SUM(stdj010),SUM(stdj011) INTO  g_stdi_m.sq_amount,g_stdi_m.hx_amount FROM stdj_t
    WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
   DISPLAY BY NAME g_stdi_m.sq_amount,g_stdi_m.hx_amount
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt605_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt605_b_fill() #單身填充
      CALL astt605_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt605_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL astt605_stdi012_ref()
   SELECT SUM(stdj010),SUM(stdj011) INTO  g_stdi_m.sq_amount,g_stdi_m.hx_amount FROM stdj_t
    WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
   DISPLAY BY NAME g_stdi_m.sq_amount,g_stdi_m.hx_amount
   
   IF NOT cl_null(g_stdi_m.stdidocno) THEN
      CALL s_aooi360_sel('2',g_stdi_m.stdidocno,'','','','','','','','','','4') RETURNING l_success,g_stdi_m.ooff013
   END IF
   DISPLAY BY NAME g_stdi_m.ooff013
   #end add-point
   
   #遮罩相關處理
   LET g_stdi_m_mask_o.* =  g_stdi_m.*
   CALL astt605_stdi_t_mask()
   LET g_stdi_m_mask_n.* =  g_stdi_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdisite_desc,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001, 
       g_stdi_m.stdi002,g_stdi_m.stdi002_desc,g_stdi_m.stdi003,g_stdi_m.stdi003_desc,g_stdi_m.stdi004, 
       g_stdi_m.stdi004_desc,g_stdi_m.stdi005,g_stdi_m.stdi005_desc,g_stdi_m.stdi006,g_stdi_m.stdi006_desc, 
       g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.sq_amount,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi010_desc,g_stdi_m.hx_amount,g_stdi_m.stdi011,g_stdi_m.stdi011_desc, 
       g_stdi_m.stdi012,g_stdi_m.stdi012_desc,g_stdi_m.ooff013,g_stdi_m.stdiownid,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp,g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp, 
       g_stdi_m.stdicrtdp_desc,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimodid_desc,g_stdi_m.stdimoddt, 
       g_stdi_m.stdicnfid,g_stdi_m.stdicnfid_desc,g_stdi_m.stdicnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdi_m.stdistus 
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
   FOR l_ac = 1 TO g_stdj_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt605_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt605_detail_show()
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
 
{<section id="astt605.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt605_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stdi_t.stdidocno 
   DEFINE l_oldno     LIKE stdi_t.stdidocno 
 
   DEFINE l_master    RECORD LIKE stdi_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stdj_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_stdi_m.stdidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stdidocno_t = g_stdi_m.stdidocno
 
    
   LET g_stdi_m.stdidocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdi_m.stdiownid = g_user
      LET g_stdi_m.stdiowndp = g_dept
      LET g_stdi_m.stdicrtid = g_user
      LET g_stdi_m.stdicrtdp = g_dept 
      LET g_stdi_m.stdicrtdt = cl_get_current()
      LET g_stdi_m.stdimodid = g_user
      LET g_stdi_m.stdimoddt = cl_get_current()
      LET g_stdi_m.stdistus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdi_m.stdistus 
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
   
   
   CALL astt605_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stdi_m.* TO NULL
      INITIALIZE g_stdj_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt605_show()
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
   CALL astt605_set_act_visible()   
   CALL astt605_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdidocno_t = g_stdi_m.stdidocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdient = " ||g_enterprise|| " AND",
                      " stdidocno = '", g_stdi_m.stdidocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt605_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt605_idx_chk()
   
   LET g_data_owner = g_stdi_m.stdiownid      
   LET g_data_dept  = g_stdi_m.stdiowndp
   
   #功能已完成,通報訊息中心
   CALL astt605_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt605_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stdj_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt605_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stdj_t
    WHERE stdjent = g_enterprise AND stdjdocno = g_stdidocno_t
 
    INTO TEMP astt605_detail
 
   #將key修正為調整後   
   UPDATE astt605_detail 
      #更新key欄位
      SET stdjdocno = g_stdi_m.stdidocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stdj_t SELECT * FROM astt605_detail
   
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
   DROP TABLE astt605_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stdidocno_t = g_stdi_m.stdidocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt605_delete()
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
   
   IF g_stdi_m.stdidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt605_cl USING g_enterprise,g_stdi_m.stdidocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt605_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt605_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt605_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdi_m_mask_o.* =  g_stdi_m.*
   CALL astt605_stdi_t_mask()
   LET g_stdi_m_mask_n.* =  g_stdi_m.*
   
   CALL astt605_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt605_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stdidocno_t = g_stdi_m.stdidocno
 
 
      DELETE FROM stdi_t
       WHERE stdient = g_enterprise AND stdidocno = g_stdi_m.stdidocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stdi_m.stdidocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stdj_t
       WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stdi_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt605_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stdj_d.clear() 
 
     
      CALL astt605_ui_browser_refresh()  
      #CALL astt605_ui_headershow()  
      #CALL astt605_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt605_browser_fill("")
         CALL astt605_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt605_cl
 
   #功能已完成,通報訊息中心
   CALL astt605_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt605.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt605_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stdj_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt605_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stdjseq,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007, 
             stdj008,stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018, 
             stdj019,stdj020,stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit ,t1.pmaal004 , 
             t2.stael003 FROM stdj_t",   
                     " INNER JOIN stdi_t ON stdient = " ||g_enterprise|| " AND stdidocno = stdjdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN pmaal_t t1 ON t1.pmaalent="||g_enterprise||" AND t1.pmaal001=stdj005 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=stdj006 AND t2.stael002='"||g_dlang||"' ",
 
                     " WHERE stdjent=? AND stdjdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
      LET g_sql = "SELECT  UNIQUE stdjseq,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007,stdj008, 
          stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020, 
          stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit ,t1.pmaal004 ,t2.stael003 FROM stdj_t", 

                  #"",
                  
                  "",
                                 " LEFT JOIN pmaal_t t1 ON t1.pmaalent='"||g_enterprise||"' AND t1.pmaal001=stdj005 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent='"||g_enterprise||"' AND t2.stael001=stdj006 AND t2.stael002='"||g_dlang||"' ",
 
                  " WHERE stdjent=? AND stdjdocno=?"
      LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stdj_t.stdjseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt605_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt605_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stdi_m.stdidocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stdi_m.stdidocno INTO g_stdj_d[l_ac].stdjseq,g_stdj_d[l_ac].stdj001, 
          g_stdj_d[l_ac].stdj002,g_stdj_d[l_ac].stdj003,g_stdj_d[l_ac].stdj004,g_stdj_d[l_ac].stdj005, 
          g_stdj_d[l_ac].stdj006,g_stdj_d[l_ac].stdj007,g_stdj_d[l_ac].stdj008,g_stdj_d[l_ac].stdj009, 
          g_stdj_d[l_ac].stdj010,g_stdj_d[l_ac].stdj011,g_stdj_d[l_ac].stdj012,g_stdj_d[l_ac].stdj013, 
          g_stdj_d[l_ac].stdj014,g_stdj_d[l_ac].stdj015,g_stdj_d[l_ac].stdj016,g_stdj_d[l_ac].stdj017, 
          g_stdj_d[l_ac].stdj018,g_stdj_d[l_ac].stdj019,g_stdj_d[l_ac].stdj020,g_stdj_d[l_ac].stdj021, 
          g_stdj_d[l_ac].stdj022,g_stdj_d[l_ac].stdj023,g_stdj_d[l_ac].stdj024,g_stdj_d[l_ac].stdj025, 
          g_stdj_d[l_ac].stdj026,g_stdj_d[l_ac].stdjsite,g_stdj_d[l_ac].stdjunit,g_stdj_d[l_ac].stdj005_desc, 
          g_stdj_d[l_ac].stdj006_desc   #(ver:78)
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
   
   CALL g_stdj_d.deleteElement(g_stdj_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt605_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stdj_d.getLength()
      LET g_stdj_d_mask_o[l_ac].* =  g_stdj_d[l_ac].*
      CALL astt605_stdj_t_mask()
      LET g_stdj_d_mask_n[l_ac].* =  g_stdj_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt605_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stdj_t
       WHERE stdjent = g_enterprise AND
         stdjdocno = ps_keys_bak[1] AND stdjseq = ps_keys_bak[2]
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
         CALL g_stdj_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt605_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stdj_t
                  (stdjent,
                   stdjdocno,
                   stdjseq
                   ,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007,stdj008,stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020,stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stdj_d[g_detail_idx].stdj001,g_stdj_d[g_detail_idx].stdj002,g_stdj_d[g_detail_idx].stdj003, 
                       g_stdj_d[g_detail_idx].stdj004,g_stdj_d[g_detail_idx].stdj005,g_stdj_d[g_detail_idx].stdj006, 
                       g_stdj_d[g_detail_idx].stdj007,g_stdj_d[g_detail_idx].stdj008,g_stdj_d[g_detail_idx].stdj009, 
                       g_stdj_d[g_detail_idx].stdj010,g_stdj_d[g_detail_idx].stdj011,g_stdj_d[g_detail_idx].stdj012, 
                       g_stdj_d[g_detail_idx].stdj013,g_stdj_d[g_detail_idx].stdj014,g_stdj_d[g_detail_idx].stdj015, 
                       g_stdj_d[g_detail_idx].stdj016,g_stdj_d[g_detail_idx].stdj017,g_stdj_d[g_detail_idx].stdj018, 
                       g_stdj_d[g_detail_idx].stdj019,g_stdj_d[g_detail_idx].stdj020,g_stdj_d[g_detail_idx].stdj021, 
                       g_stdj_d[g_detail_idx].stdj022,g_stdj_d[g_detail_idx].stdj023,g_stdj_d[g_detail_idx].stdj024, 
                       g_stdj_d[g_detail_idx].stdj025,g_stdj_d[g_detail_idx].stdj026,g_stdj_d[g_detail_idx].stdjsite, 
                       g_stdj_d[g_detail_idx].stdjunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stdj_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt605_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stdj_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt605_stdj_t_mask_restore('restore_mask_o')
               
      UPDATE stdj_t 
         SET (stdjdocno,
              stdjseq
              ,stdj001,stdj002,stdj003,stdj004,stdj005,stdj006,stdj007,stdj008,stdj009,stdj010,stdj011,stdj012,stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020,stdj021,stdj022,stdj023,stdj024,stdj025,stdj026,stdjsite,stdjunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stdj_d[g_detail_idx].stdj001,g_stdj_d[g_detail_idx].stdj002,g_stdj_d[g_detail_idx].stdj003, 
                  g_stdj_d[g_detail_idx].stdj004,g_stdj_d[g_detail_idx].stdj005,g_stdj_d[g_detail_idx].stdj006, 
                  g_stdj_d[g_detail_idx].stdj007,g_stdj_d[g_detail_idx].stdj008,g_stdj_d[g_detail_idx].stdj009, 
                  g_stdj_d[g_detail_idx].stdj010,g_stdj_d[g_detail_idx].stdj011,g_stdj_d[g_detail_idx].stdj012, 
                  g_stdj_d[g_detail_idx].stdj013,g_stdj_d[g_detail_idx].stdj014,g_stdj_d[g_detail_idx].stdj015, 
                  g_stdj_d[g_detail_idx].stdj016,g_stdj_d[g_detail_idx].stdj017,g_stdj_d[g_detail_idx].stdj018, 
                  g_stdj_d[g_detail_idx].stdj019,g_stdj_d[g_detail_idx].stdj020,g_stdj_d[g_detail_idx].stdj021, 
                  g_stdj_d[g_detail_idx].stdj022,g_stdj_d[g_detail_idx].stdj023,g_stdj_d[g_detail_idx].stdj024, 
                  g_stdj_d[g_detail_idx].stdj025,g_stdj_d[g_detail_idx].stdj026,g_stdj_d[g_detail_idx].stdjsite, 
                  g_stdj_d[g_detail_idx].stdjunit) 
         WHERE stdjent = g_enterprise AND stdjdocno = ps_keys_bak[1] AND stdjseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdj_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdj_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt605_stdj_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt605.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt605_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt605.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt605_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt605.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt605_lock_b(ps_table,ps_page)
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
   #CALL astt605_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stdj_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt605_bcl USING g_enterprise,
                                       g_stdi_m.stdidocno,g_stdj_d[g_detail_idx].stdjseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt605_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt605.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt605_unlock_b(ps_table,ps_page)
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
      CLOSE astt605_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt605_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stdidocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stdidocno",TRUE)
      CALL cl_set_comp_entry("stdidocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stdisite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt605_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stdidocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stdidocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stdidocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF g_flag THEN
      CALL cl_set_comp_entry("stdidocno,stdidocdt",FALSE)
   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stdisite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stdisite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt605_set_entry_b(p_cmd)
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
 
{<section id="astt605.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt605_set_no_entry_b(p_cmd)
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
 
{<section id="astt605.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt605_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,modify_detail,delete", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt605_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stdi_m.stdistus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt605_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt605.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt605_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt605.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt605_default_search()
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
      LET ls_wc = ls_wc, " stdidocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stdi_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stdj_t" 
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
 
{<section id="astt605.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt605_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stdi_m.stdidocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt605_cl USING g_enterprise,g_stdi_m.stdidocno
   IF STATUS THEN
      CLOSE astt605_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt605_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
       g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
       g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
       g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
       g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
       g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
       g_stdi_m.stdicnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt605_action_chk() THEN
      CLOSE astt605_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdisite_desc,g_stdi_m.stdidocdt,g_stdi_m.stdidocno,g_stdi_m.stdi001, 
       g_stdi_m.stdi002,g_stdi_m.stdi002_desc,g_stdi_m.stdi003,g_stdi_m.stdi003_desc,g_stdi_m.stdi004, 
       g_stdi_m.stdi004_desc,g_stdi_m.stdi005,g_stdi_m.stdi005_desc,g_stdi_m.stdi006,g_stdi_m.stdi006_desc, 
       g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.sq_amount,g_stdi_m.stdi009, 
       g_stdi_m.stdi010,g_stdi_m.stdi010_desc,g_stdi_m.hx_amount,g_stdi_m.stdi011,g_stdi_m.stdi011_desc, 
       g_stdi_m.stdi012,g_stdi_m.stdi012_desc,g_stdi_m.ooff013,g_stdi_m.stdiownid,g_stdi_m.stdiownid_desc, 
       g_stdi_m.stdiowndp,g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp, 
       g_stdi_m.stdicrtdp_desc,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimodid_desc,g_stdi_m.stdimoddt, 
       g_stdi_m.stdicnfid,g_stdi_m.stdicnfid_desc,g_stdi_m.stdicnfdt
 
   CASE g_stdi_m.stdistus
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
         CASE g_stdi_m.stdistus
            
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
      CASE g_stdi_m.stdistus
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
            IF NOT astt605_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt605_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt605_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt605_cl
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
      g_stdi_m.stdistus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt605_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   LET l_success = TRUE
   CASE lc_state 
      WHEN 'Y'       
         CALL s_astt605_conf_chk(g_stdi_m.stdidocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astt605_conf_upd(g_stdi_m.stdidocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdi_m.stdidocno
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
               LET g_errparam.extend = g_stdi_m.stdidocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN            
         END IF         
      WHEN 'X'
         CALL s_astt605_void_chk(g_stdi_m.stdidocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt605_void_upd(g_stdi_m.stdidocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdi_m.stdidocno
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
            LET g_errparam.extend = g_stdi_m.stdidocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
         
       WHEN 'N' 
         CALL s_astt605_unconf_chk(g_stdi_m.stdidocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt605_unconf_upd(g_stdi_m.stdidocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdi_m.stdidocno
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
            LET g_errparam.extend = g_stdi_m.stdidocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
   END CASE	  
   #end add-point
   
   LET g_stdi_m.stdimodid = g_user
   LET g_stdi_m.stdimoddt = cl_get_current()
   LET g_stdi_m.stdistus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stdi_t 
      SET (stdistus,stdimodid,stdimoddt) 
        = (g_stdi_m.stdistus,g_stdi_m.stdimodid,g_stdi_m.stdimoddt)     
    WHERE stdient = g_enterprise AND stdidocno = g_stdi_m.stdidocno
 
    
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
      EXECUTE astt605_master_referesh USING g_stdi_m.stdidocno INTO g_stdi_m.stdisite,g_stdi_m.stdidocdt, 
          g_stdi_m.stdidocno,g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi005, 
          g_stdi_m.stdi006,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008,g_stdi_m.stdi009, 
          g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012,g_stdi_m.stdiownid,g_stdi_m.stdiowndp,g_stdi_m.stdicrtid, 
          g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid, 
          g_stdi_m.stdicnfdt,g_stdi_m.stdisite_desc,g_stdi_m.stdi002_desc,g_stdi_m.stdi003_desc,g_stdi_m.stdi004_desc, 
          g_stdi_m.stdi005_desc,g_stdi_m.stdi006_desc,g_stdi_m.stdi010_desc,g_stdi_m.stdi011_desc,g_stdi_m.stdiownid_desc, 
          g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdimodid_desc, 
          g_stdi_m.stdicnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stdi_m.stdisite,g_stdi_m.stdisite_desc,g_stdi_m.stdidocdt,g_stdi_m.stdidocno, 
          g_stdi_m.stdi001,g_stdi_m.stdi002,g_stdi_m.stdi002_desc,g_stdi_m.stdi003,g_stdi_m.stdi003_desc, 
          g_stdi_m.stdi004,g_stdi_m.stdi004_desc,g_stdi_m.stdi005,g_stdi_m.stdi005_desc,g_stdi_m.stdi006, 
          g_stdi_m.stdi006_desc,g_stdi_m.stdiunit,g_stdi_m.stdistus,g_stdi_m.stdi007,g_stdi_m.stdi008, 
          g_stdi_m.sq_amount,g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi010_desc,g_stdi_m.hx_amount, 
          g_stdi_m.stdi011,g_stdi_m.stdi011_desc,g_stdi_m.stdi012,g_stdi_m.stdi012_desc,g_stdi_m.ooff013, 
          g_stdi_m.stdiownid,g_stdi_m.stdiownid_desc,g_stdi_m.stdiowndp,g_stdi_m.stdiowndp_desc,g_stdi_m.stdicrtid, 
          g_stdi_m.stdicrtid_desc,g_stdi_m.stdicrtdp,g_stdi_m.stdicrtdp_desc,g_stdi_m.stdicrtdt,g_stdi_m.stdimodid, 
          g_stdi_m.stdimodid_desc,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid,g_stdi_m.stdicnfid_desc,g_stdi_m.stdicnfdt 
 
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   SELECT   stdimodid,stdimoddt,stdicnfid,stdicnfdt INTO  g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid,g_stdi_m.stdicnfdt FROM stdi_t
    WHERE stdient = g_enterprise AND stdidocno = g_stdi_m.stdidocno
   DISPLAY BY NAME g_stdi_m.stdimodid,g_stdi_m.stdimoddt,g_stdi_m.stdicnfid,g_stdi_m.stdicnfdt
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt605_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt605_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt605.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt605_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stdj_d.getLength() THEN
         LET g_detail_idx = g_stdj_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stdj_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stdj_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt605_b_fill2(pi_idx)
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
   
   CALL astt605_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt605_fill_chk(ps_idx)
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
 
{<section id="astt605.status_show" >}
PRIVATE FUNCTION astt605_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt605.mask_functions" >}
&include "erp/ast/astt605_mask.4gl"
 
{</section>}
 
{<section id="astt605.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt605_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt605_show()
   CALL astt605_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt605_conf_chk(g_stdi_m.stdidocno) RETURNING l_success,g_errno
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
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stdi_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stdj_d))
 
 
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
   #CALL astt605_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt605_ui_headershow()
   CALL astt605_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt605_draw_out()
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
   CALL astt605_ui_headershow()  
   CALL astt605_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt605.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt605_set_pk_array()
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
   LET g_pk_array[1].values = g_stdi_m.stdidocno
   LET g_pk_array[1].column = 'stdidocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt605.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt605.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt605_msgcentre_notify(lc_state)
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
   CALL astt605_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stdi_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt605.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt605_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stdistus  INTO g_stdi_m.stdistus
     FROM stdi_t
    WHERE stdient = g_enterprise
      AND stdidocno = g_stdi_m.stdidocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stdi_m.stdistus
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
        LET g_errparam.extend = g_stdi_m.stdidocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt605_set_act_visible()
        CALL astt605_set_act_no_visible()
        CALL astt605_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt605.other_function" readonly="Y" >}

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
PUBLIC FUNCTION astt605_stdisite_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdisite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdisite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdisite_desc
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
PUBLIC FUNCTION astt605_stdi002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi002
   CALL ap_ref_array2(g_ref_fields,"SELECT prcdl003 FROM prcdl_t WHERE prcdlent='"||g_enterprise||"' AND prcdl001=? AND prcdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi002_desc

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
PUBLIC FUNCTION astt605_stdi003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi003
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2100' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi003_desc
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
PUBLIC FUNCTION astt605_stdi004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi004
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2101' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi004_desc
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
PUBLIC FUNCTION astt605_stdi005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi005
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi005_desc
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
PUBLIC FUNCTION astt605_stdi006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi006
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi006_desc
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
PUBLIC FUNCTION astt605_stdi010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi010
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi010_desc
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
PUBLIC FUNCTION astt605_stdi011_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdi_m.stdi011
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdi_m.stdi011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi011_desc
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
PUBLIC FUNCTION astt605_stdi012_ref()
DEFINE l_ooef019    LIKE ooef_t.ooef019

    SELECT ooef019 INTO l_ooef019 FROM ooef_t 
     WHERE ooefent = g_enterprise AND ooef001 = g_site 
    
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stdi_m.stdi012
    CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stdi_m.stdi012_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdi_m.stdi012_desc
   
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
PUBLIC FUNCTION astt605_stdj005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdj_d[l_ac].stdj005
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdj_d[l_ac].stdj005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdj_d[l_ac].stdj005_desc

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
PUBLIC FUNCTION astt605_stdj006_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stdj_d[l_ac].stdj006
  CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stdj_d[l_ac].stdj006_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stdj_d[l_ac].stdj006_desc
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
PUBLIC FUNCTION astt605_stdi001_chk()
DEFINE l_n      LIKE type_t.num5

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stdi_m.stdi001
   IF NOT cl_chk_exist("v_stcxdocno") THEN
      RETURN FALSE
   END IF
   
   SELECT COUNT(*) INTO l_n FROM stdi_t
    WHERE stdient = g_enterprise AND stdi001 = g_stdi_m.stdi001 AND stdistus <>'X' AND stdidocno <> g_stdi_m.stdidocno
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00190'
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
PUBLIC FUNCTION astt605_stdi001_other()
   SELECT stcx001,stcx002,stcx003,stcx006,stcx007,stcx008,stcx009,stcx010,stcx011 
     INTO g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi007,g_stdi_m.stdi008,
          g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012
     FROM stcx_t
    WHERE stcxent = g_enterprise AND stcxdocno = g_stdi_m.stdi001
  
   SELECT SUM(stcy008) INTO g_stdi_m.sq_amount FROM stcy_t
    WHERE stcyent = g_enterprise AND stcydocno =  g_stdi_m.stdi001
  
   IF cl_null(g_stdi_m.sq_amount ) THEN
      LET g_stdi_m.sq_amount = 0
   END IF
   
   SELECT SUM(stdj011) INTO g_stdi_m.sq_amount FROM stdj_t
    WHERE stdjent = g_enterprise AND stdjdocno =  g_stdi_m.stdidocno
   IF cl_null(g_stdi_m.hx_amount) THEN
      LET g_stdi_m.hx_amount = 0
   END IF

   DISPLAY BY NAME g_stdi_m.stdi002,g_stdi_m.stdi003,g_stdi_m.stdi004,g_stdi_m.stdi007,g_stdi_m.stdi008,
                   g_stdi_m.stdi009,g_stdi_m.stdi010,g_stdi_m.stdi011,g_stdi_m.stdi012
                  ,g_stdi_m.sq_amount,g_stdi_m.hx_amount
   CALL astt605_stdi002_ref()
   CALL astt605_stdi003_ref()
   CALL astt605_stdi004_ref()
   CALL astt605_stdi010_ref()  
   CALL astt605_stdi011_ref()
   CALL astt605_stdi012_ref()   
                
   #160824-00007#198 161120 by lori add---(S)
   LET g_stdi_m_o.stdi002 = g_stdi_m.stdi002
   LET g_stdi_m_o.stdi003 = g_stdi_m.stdi003
   LET g_stdi_m_o.stdi004 = g_stdi_m.stdi004
   LET g_stdi_m_o.stdi007 = g_stdi_m.stdi007
   LET g_stdi_m_o.stdi008 = g_stdi_m.stdi008
   LET g_stdi_m_o.stdi009 = g_stdi_m.stdi009
   LET g_stdi_m_o.stdi010 = g_stdi_m.stdi010
   LET g_stdi_m_o.stdi011 = g_stdi_m.stdi011
   LET g_stdi_m_o.stdi012 = g_stdi_m.stdi012
   LET g_stdi_m_o.sq_amount = g_stdi_m.sq_amount
   LET g_stdi_m_o.hx_amount = g_stdi_m.hx_amount
   #160824-00007#198 151120 by lori add---(E)
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
PUBLIC FUNCTION astt605_stdi001_genb()
DEFINE l_n  LIKE type_t.num5   
   
   SELECT COUNT(*) INTO l_n FROM stdj_t
    WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
   
   IF l_n > 0 THEN
     DELETE FROM stdj_t WHERE stdjent = g_enterprise AND stdjdocno = g_stdi_m.stdidocno
     IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = ''
       LET g_errparam.popup = TRUE
       CALL cl_err()
       RETURN FALSE
     END IF 
   END IF
   INSERT INTO stdj_t(stdjent,stdjsite,stdjunit,stdjdocno,stdjseq,stdj001,stdj002,stdj003,
                      stdj004,stdj005,stdj006,stdj007,stdj008,stdj009,stdj010,stdj011,stdj012,
                      stdj013,stdj014,stdj015,stdj016,stdj017,stdj018,stdj019,stdj020,stdj021,stdj022,
                      stdj023,stdj024,stdj025,stdj026)
               SELECT stcyent,g_stdi_m.stdisite,g_stdi_m.stdiunit,g_stdi_m.stdidocno,rownum,g_stdi_m.stdi001,stcyseq,stcy001,
                 stcy002,stcy003,stcy004,stcy005,stcy006,stcy007,stcy008,stcy008,stcy009,
                 stcy010,stcy011,stcy012,stcy013,stcy014,stcy015,stcy016,stcy017,stcy018,stcy019,stcy020,stcy021,stcy022,
                  stcy023 FROM stcy_t WHERE stcyent = g_enterprise AND stcydocno = g_stdi_m.stdi001
                  
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
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
PUBLIC FUNCTION astt605_reflesh()
   DISPLAY ARRAY g_stdj_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1                
       BEFORE DISPLAY
          EXIT DISPLAY
   END DISPLAY 
END FUNCTION

 
{</section>}
 
