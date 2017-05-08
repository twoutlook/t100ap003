#該程式未解開Section, 採用最新樣板產出!
{<section id="astt560.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0014(2015-12-01 12:02:10), PR版次:0014(2017-02-20 15:02:27)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000079
#+ Filename...: astt560
#+ Description: 專櫃成本審批處理作業
#+ Creator....: 06189(2015-08-27 09:27:54)
#+ Modifier...: 06254 -SD/PR- 09042
 
{</section>}
 
{<section id="astt560.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#22    2016/04/21   BY 07900    校验代码重复错误讯息的修改
#160604-00009#92    2016/06/23   by 08172    新增参数判断是否抛转财务单据
#160816-00068#17    2016/08/23   By 08209    調整transaction
#160818-00017#39    2016/08/30   By 08734    删除修改未重新判断状态码
#160905-00007#17    2016/09/05   By 08734    ent调整
#161024-00025#3     2016/10/26   By dongsz   stbbsite开窗替换q_ooef001_24
#160824-00007#193   2016/11/20   by lori     修正舊值備份寫法
#170207-00018#9     2016/02/13   By 09042    ROWNUM整批调整
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
PRIVATE type type_g_stba_m        RECORD
       stbasite LIKE stba_t.stbasite, 
   stbasite_desc LIKE type_t.chr80, 
   stbadocdt LIKE stba_t.stbadocdt, 
   stbadocno LIKE stba_t.stbadocno, 
   stba014 LIKE stba_t.stba014, 
   stbaunit LIKE stba_t.stbaunit, 
   stbaunit_desc LIKE type_t.chr80, 
   stba013 LIKE stba_t.stba013, 
   stba013_desc LIKE type_t.chr80, 
   stba010 LIKE stba_t.stba010, 
   stba002 LIKE stba_t.stba002, 
   stba002_desc LIKE type_t.chr80, 
   stba003 LIKE stba_t.stba003, 
   stba005 LIKE stba_t.stba005, 
   stba005_desc LIKE type_t.chr80, 
   stba004 LIKE stba_t.stba004, 
   stba004_desc LIKE type_t.chr80, 
   stbastus LIKE stba_t.stbastus, 
   stba001 LIKE stba_t.stba001, 
   stba001_desc LIKE type_t.chr80, 
   stba021 LIKE stba_t.stba021, 
   sum_stbb025 LIKE type_t.num20_6, 
   sum_stbb026 LIKE type_t.num20_6, 
   stba017 LIKE stba_t.stba017, 
   stba018 LIKE stba_t.stba018, 
   stba019 LIKE stba_t.stba019, 
   stba020 LIKE stba_t.stba020, 
   stba023 LIKE stba_t.stba023, 
   stba008 LIKE stba_t.stba008, 
   stba008_desc LIKE type_t.chr80, 
   stba009 LIKE stba_t.stba009, 
   stba009_desc LIKE type_t.chr80, 
   stbaownid LIKE stba_t.stbaownid, 
   stbaownid_desc LIKE type_t.chr80, 
   stbaowndp LIKE stba_t.stbaowndp, 
   stbaowndp_desc LIKE type_t.chr80, 
   stbacrtid LIKE stba_t.stbacrtid, 
   stbacrtid_desc LIKE type_t.chr80, 
   stbacrtdp LIKE stba_t.stbacrtdp, 
   stbacrtdp_desc LIKE type_t.chr80, 
   stbacrtdt LIKE stba_t.stbacrtdt, 
   stbamodid LIKE stba_t.stbamodid, 
   stbamodid_desc LIKE type_t.chr80, 
   stbamoddt LIKE stba_t.stbamoddt, 
   stbacnfid LIKE stba_t.stbacnfid, 
   stbacnfid_desc LIKE type_t.chr80, 
   stbacnfdt LIKE stba_t.stbacnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stbb_d        RECORD
       stbbseq LIKE stbb_t.stbbseq, 
   stbb020 LIKE stbb_t.stbb020, 
   stbb021 LIKE stbb_t.stbb021, 
   stbb005 LIKE stbb_t.stbb005, 
   stbb006 LIKE stbb_t.stbb006, 
   stbb022 LIKE stbb_t.stbb022, 
   stbb022_desc LIKE type_t.chr500, 
   stbb023 LIKE stbb_t.stbb023, 
   stbb023_desc LIKE type_t.chr500, 
   stbb024 LIKE stbb_t.stbb024, 
   stbb024_desc LIKE type_t.chr500, 
   stbb011 LIKE stbb_t.stbb011, 
   stbb011_desc LIKE type_t.chr500, 
   stbb012 LIKE stbb_t.stbb012, 
   stbb012_desc LIKE type_t.chr500, 
   stbbud001 LIKE stbb_t.stbbud001, 
   stbb001 LIKE stbb_t.stbb001, 
   stbb001_desc LIKE type_t.chr500, 
   stbb004 LIKE stbb_t.stbb004, 
   stbb025 LIKE stbb_t.stbb025, 
   stbb026 LIKE stbb_t.stbb026, 
   stbb027 LIKE stbb_t.stbb027, 
   stbb028 LIKE stbb_t.stbb028, 
   stbb009 LIKE stbb_t.stbb009, 
   stbb017 LIKE stbb_t.stbb017, 
   stbb002 LIKE stbb_t.stbb002, 
   stbb002_desc LIKE type_t.chr500, 
   stbb003 LIKE stbb_t.stbb003, 
   stbb007 LIKE stbb_t.stbb007, 
   stbb008 LIKE stbb_t.stbb008, 
   stbb014 LIKE stbb_t.stbb014, 
   stbb015 LIKE stbb_t.stbb015, 
   stbb016 LIKE stbb_t.stbb016, 
   stbb018 LIKE stbb_t.stbb018, 
   stbbsite LIKE stbb_t.stbbsite
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stbadocno LIKE stba_t.stbadocno,
      b_stbadocdt LIKE stba_t.stbadocdt,
      b_stbaunit LIKE stba_t.stbaunit,
   b_stbaunit_desc LIKE type_t.chr80,
      b_stba001 LIKE stba_t.stba001,
   b_stba001_desc LIKE type_t.chr80,
      b_stba002 LIKE stba_t.stba002,
   b_stba002_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE l_seq               LIKE stfj_t.stfjseq
DEFINE g_type              LIKE type_t.chr1   #'1'時代表是 astt560 '2'時代表是 astt511
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stba_m          type_g_stba_m
DEFINE g_stba_m_t        type_g_stba_m
DEFINE g_stba_m_o        type_g_stba_m
DEFINE g_stba_m_mask_o   type_g_stba_m #轉換遮罩前資料
DEFINE g_stba_m_mask_n   type_g_stba_m #轉換遮罩後資料
 
   DEFINE g_stbadocno_t LIKE stba_t.stbadocno
 
 
DEFINE g_stbb_d          DYNAMIC ARRAY OF type_g_stbb_d
DEFINE g_stbb_d_t        type_g_stbb_d
DEFINE g_stbb_d_o        type_g_stbb_d
DEFINE g_stbb_d_mask_o   DYNAMIC ARRAY OF type_g_stbb_d #轉換遮罩前資料
DEFINE g_stbb_d_mask_n   DYNAMIC ARRAY OF type_g_stbb_d #轉換遮罩後資料
 
 
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
 
{<section id="astt560.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5 #150308-00001#5  By geza 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   #add by geza 20150812(S)
   IF NOT cl_null(g_argv[1]) THEN
      LET g_type = g_argv[1]
   END IF
   #add by geza 20150812(E)
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT stbasite,'',stbadocdt,stbadocno,stba014,stbaunit,'',stba013,'',stba010, 
       stba002,'',stba003,stba005,'',stba004,'',stbastus,stba001,'',stba021,'','',stba017,stba018,stba019, 
       stba020,stba023,stba008,'',stba009,'',stbaownid,'',stbaowndp,'',stbacrtid,'',stbacrtdp,'',stbacrtdt, 
       stbamodid,'',stbamoddt,stbacnfid,'',stbacnfdt", 
                      " FROM stba_t",
                      " WHERE stbaent= ? AND stbadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt560_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stbasite,t0.stbadocdt,t0.stbadocno,t0.stba014,t0.stbaunit,t0.stba013, 
       t0.stba010,t0.stba002,t0.stba003,t0.stba005,t0.stba004,t0.stbastus,t0.stba001,t0.stba021,t0.stba017, 
       t0.stba018,t0.stba019,t0.stba020,t0.stba023,t0.stba008,t0.stba009,t0.stbaownid,t0.stbaowndp,t0.stbacrtid, 
       t0.stbacrtdp,t0.stbacrtdt,t0.stbamodid,t0.stbamoddt,t0.stbacnfid,t0.stbacnfdt,t1.ooefl003 ,t2.ooefl003 , 
       t3.mhael023 ,t4.pmaal004 ,t5.oocql004 ,t6.staal003 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 , 
       t11.ooefl003 ,t12.ooag011 ,t13.ooefl003 ,t14.ooag011 ,t15.ooag011",
               " FROM stba_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stbaunit AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN mhael_t t3 ON t3.mhaelent="||g_enterprise||" AND t3.mhael001=t0.stba013 AND t3.mhael022='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.stba002 AND t4.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stba004 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN staal_t t6 ON t6.staalent="||g_enterprise||" AND t6.staal001=t0.stba004 AND t6.staal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stba001 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stba008  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stba009 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stbaownid  ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.stbaowndp AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stbacrtid  ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stbacrtdp AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.stbamodid  ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stbacnfid  ",
 
               " WHERE t0.stbaent = " ||g_enterprise|| " AND t0.stbadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt560_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt560 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt560_init()   
 
      #進入選單 Menu (="N")
      CALL astt560_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt560
      
   END IF 
   
   CLOSE astt560_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #150308-00001#5  By geza 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt560.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt560_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5  # 150308-00001#5  By geza 150309
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
      CALL cl_set_combo_scc_part('stbastus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stba003','6013') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"

   
   CALL cl_set_combo_scc_part('stba003','6013','4')
   CALL cl_set_combo_scc_part('stbb004','6006','1,2')
   CALL cl_set_combo_scc('stba014','6807')
   CALL cl_set_combo_scc('stbb020','6800')
   CALL s_aooi500_create_temp() RETURNING l_success  #150308-00001#5  By geza 150309
 
   #end add-point
   
   #初始化搜尋條件
   CALL astt560_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt560.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt560_ui_dialog()
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
   
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_stba_m.* TO NULL
         CALL g_stbb_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt560_init()
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
               
               CALL astt560_fetch('') # reload data
               LET l_ac = 1
               CALL astt560_ui_detailshow() #Setting the current row 
         
               CALL astt560_idx_chk()
               #NEXT FIELD stbbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stbb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt560_idx_chk()
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
               CALL astt560_idx_chk()
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
            CALL astt560_browser_fill("")
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
               CALL astt560_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt560_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt560_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt560_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt560_set_act_visible()   
            CALL astt560_set_act_no_visible()
            IF NOT (g_stba_m.stbadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                                  " stbadocno = '", g_stba_m.stbadocno, "' "
 
               #填到對應位置
               CALL astt560_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stba_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbb_t" 
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
               CALL astt560_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stba_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbb_t" 
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
                  CALL astt560_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt560_fetch("F")
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
               CALL astt560_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt560_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt560_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt560_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt560_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt560_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt560_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt560_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt560_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt560_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt560_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stbb_d)
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
               NEXT FIELD stbbseq
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
               CALL astt560_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt560_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt560_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt560_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt560_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query_papers
            LET g_action_choice="query_papers"
            IF cl_auth_chk_act("query_papers") THEN
               
               #add-point:ON ACTION query_papers name="menu.query_papers"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt560_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_data
            LET g_action_choice="modify_data"
            IF cl_auth_chk_act("modify_data") THEN
               
               #add-point:ON ACTION modify_data name="menu.modify_data"
               IF NOT cl_null(g_stba_m.stbadocno) THEN               
                  IF g_stba_m.stbastus  = 'N' THEN
                     CALL astt560_modify()
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
         ON ACTION prog_stba008
            LET g_action_choice="prog_stba008"
            IF cl_auth_chk_act("prog_stba008") THEN
               
               #add-point:ON ACTION prog_stba008 name="menu.prog_stba008"
               #應用 a45 樣板自動產生(Version:2)
               CALL cl_user_contact("aooi130","ooag_t","ooag002","ooag001",g_stba_m.stba008)
 


               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt560_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt560_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt560_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stba_m.stbadocdt)
 
 
 
         
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
 
{<section id="astt560.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt560_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stbasite') RETURNING l_where
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
   LET l_wc=l_wc," AND stba014='6' " 
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stbadocno ",
                      " FROM stba_t ",
                      " ",
                      " LEFT JOIN stbb_t ON stbbent = stbaent AND stbadocno = stbbdocno ", "  ",
                      #add-point:browser_fill段sql(stbb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stbaent = " ||g_enterprise|| " AND stbbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stba_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stbadocno ",
                      " FROM stba_t ", 
                      "  ",
                      "  ",
                      " WHERE stbaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stba_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   LET l_sub_sql = l_sub_sql," AND ", l_where
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
      INITIALIZE g_stba_m.* TO NULL
      CALL g_stbb_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbastus,t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002, 
          t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stba_t t0",
                  "  ",
                  "  LEFT JOIN stbb_t ON stbbent = stbaent AND stbadocno = stbbdocno ", "  ", 
                  #add-point:browser_fill段sql(stbb_t1) name="browser_fill.join.stbb_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbaunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stba001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stba002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stba_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbastus,t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002, 
          t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stba_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbaunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stba001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stba002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stba_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql," AND ", l_where
   #end add-point
   LET g_sql = g_sql, " ORDER BY stbadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stba_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stbadocno,g_browser[g_cnt].b_stbadocdt, 
          g_browser[g_cnt].b_stbaunit,g_browser[g_cnt].b_stba001,g_browser[g_cnt].b_stba002,g_browser[g_cnt].b_stbaunit_desc, 
          g_browser[g_cnt].b_stba001_desc,g_browser[g_cnt].b_stba002_desc
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
         CALL astt560_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stbadocno) THEN
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
 
{<section id="astt560.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt560_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stba_m.stbadocno = g_browser[g_current_idx].b_stbadocno   
 
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   CALL astt560_stba_t_mask()
   CALL astt560_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt560.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt560_ui_detailshow()
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
 
{<section id="astt560.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt560_ui_browser_refresh()
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
      IF g_browser[l_i].b_stbadocno = g_stba_m.stbadocno 
 
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
 
{<section id="astt560.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt560_construct()
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
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stba_m.* TO NULL
   CALL g_stbb_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   CALL cl_set_combo_scc('stbb020','6800')
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stbasite,stbadocdt,stbadocno,stba014,stbaunit,stba013,stba010,stba002, 
          stba003,stba005,stba004,stbastus,stba001,stba021,sum_stbb025,sum_stbb026,stba017,stba018,stba019, 
          stba020,stba023,stba008,stba009,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid, 
          stbamoddt,stbacnfid,stbacnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbacrtdt>>----
         AFTER FIELD stbacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stbamoddt>>----
         AFTER FIELD stbamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbacnfdt>>----
         AFTER FIELD stbacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stbasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbasite
            #add-point:ON ACTION controlp INFIELD stbasite name="construct.c.stbasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbasite',g_site,'c') #150308-00001#5  By geza add 'c'
            CALL q_ooef001_24()                            #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbasite  #顯示到畫面上
            NEXT FIELD stbasite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbasite
            #add-point:BEFORE FIELD stbasite name="construct.b.stbasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbasite
            
            #add-point:AFTER FIELD stbasite name="construct.a.stbasite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocdt
            #add-point:BEFORE FIELD stbadocdt name="construct.b.stbadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocdt
            
            #add-point:AFTER FIELD stbadocdt name="construct.a.stbadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocdt
            #add-point:ON ACTION controlp INFIELD stbadocdt name="construct.c.stbadocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocno
            #add-point:ON ACTION controlp INFIELD stbadocno name="construct.c.stbadocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stba014='6'"
            CALL q_stbadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbadocno  #顯示到畫面上
            NEXT FIELD stbadocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocno
            #add-point:BEFORE FIELD stbadocno name="construct.b.stbadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocno
            
            #add-point:AFTER FIELD stbadocno name="construct.a.stbadocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba014
            #add-point:BEFORE FIELD stba014 name="construct.b.stba014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba014
            
            #add-point:AFTER FIELD stba014 name="construct.a.stba014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba014
            #add-point:ON ACTION controlp INFIELD stba014 name="construct.c.stba014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbaunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaunit
            #add-point:ON ACTION controlp INFIELD stbaunit name="construct.c.stbaunit"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbaunit',g_site,'c') #150308-00001#5  By geza add 'c'
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbaunit  #顯示到畫面上
            NEXT FIELD stbaunit                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaunit
            #add-point:BEFORE FIELD stbaunit name="construct.b.stbaunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaunit
            
            #add-point:AFTER FIELD stbaunit name="construct.a.stbaunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba013
            #add-point:ON ACTION controlp INFIELD stba013 name="construct.c.stba013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba013  #顯示到畫面上
            NEXT FIELD stba013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba013
            #add-point:BEFORE FIELD stba013 name="construct.b.stba013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba013
            
            #add-point:AFTER FIELD stba013 name="construct.a.stba013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba010
            #add-point:ON ACTION controlp INFIELD stba010 name="construct.c.stba010"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stfa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba010  #顯示到畫面上
            NEXT FIELD stba010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba010
            #add-point:BEFORE FIELD stba010 name="construct.b.stba010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba010
            
            #add-point:AFTER FIELD stba010 name="construct.a.stba010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba002
            #add-point:BEFORE FIELD stba002 name="construct.b.stba002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba002
            
            #add-point:AFTER FIELD stba002 name="construct.a.stba002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba002
            #add-point:ON ACTION controlp INFIELD stba002 name="construct.c.stba002"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba002  #顯示到畫面上
            NEXT FIELD stba002     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba003
            #add-point:BEFORE FIELD stba003 name="construct.b.stba003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba003
            
            #add-point:AFTER FIELD stba003 name="construct.a.stba003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba003
            #add-point:ON ACTION controlp INFIELD stba003 name="construct.c.stba003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba005
            #add-point:BEFORE FIELD stba005 name="construct.b.stba005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba005
            
            #add-point:AFTER FIELD stba005 name="construct.a.stba005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba005
            #add-point:ON ACTION controlp INFIELD stba005 name="construct.c.stba005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba005  #顯示到畫面上
            NEXT FIELD stba005                     #返回原欄位            

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba004
            #add-point:BEFORE FIELD stba004 name="construct.b.stba004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba004
            
            #add-point:AFTER FIELD stba004 name="construct.a.stba004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba004
            #add-point:ON ACTION controlp INFIELD stba004 name="construct.c.stba004"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba004  #顯示到畫面上
            NEXT FIELD stba004                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbastus
            #add-point:BEFORE FIELD stbastus name="construct.b.stbastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbastus
            
            #add-point:AFTER FIELD stbastus name="construct.a.stbastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbastus
            #add-point:ON ACTION controlp INFIELD stbastus name="construct.c.stbastus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba001
            #add-point:BEFORE FIELD stba001 name="construct.b.stba001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba001
            
            #add-point:AFTER FIELD stba001 name="construct.a.stba001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba001
            #add-point:ON ACTION controlp INFIELD stba001 name="construct.c.stba001"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stba001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stba001',g_site,'c') #150308-00001#5  By geza add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stba001  #顯示到畫面上
            NEXT FIELD stba001 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba021
            #add-point:BEFORE FIELD stba021 name="construct.b.stba021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba021
            
            #add-point:AFTER FIELD stba021 name="construct.a.stba021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba021
            #add-point:ON ACTION controlp INFIELD stba021 name="construct.c.stba021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sum_stbb025
            #add-point:BEFORE FIELD sum_stbb025 name="construct.b.sum_stbb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sum_stbb025
            
            #add-point:AFTER FIELD sum_stbb025 name="construct.a.sum_stbb025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sum_stbb025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sum_stbb025
            #add-point:ON ACTION controlp INFIELD sum_stbb025 name="construct.c.sum_stbb025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sum_stbb026
            #add-point:BEFORE FIELD sum_stbb026 name="construct.b.sum_stbb026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sum_stbb026
            
            #add-point:AFTER FIELD sum_stbb026 name="construct.a.sum_stbb026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sum_stbb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sum_stbb026
            #add-point:ON ACTION controlp INFIELD sum_stbb026 name="construct.c.sum_stbb026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba017
            #add-point:BEFORE FIELD stba017 name="construct.b.stba017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba017
            
            #add-point:AFTER FIELD stba017 name="construct.a.stba017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba017
            #add-point:ON ACTION controlp INFIELD stba017 name="construct.c.stba017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba018
            #add-point:BEFORE FIELD stba018 name="construct.b.stba018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba018
            
            #add-point:AFTER FIELD stba018 name="construct.a.stba018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba018
            #add-point:ON ACTION controlp INFIELD stba018 name="construct.c.stba018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba019
            #add-point:BEFORE FIELD stba019 name="construct.b.stba019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba019
            
            #add-point:AFTER FIELD stba019 name="construct.a.stba019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba019
            #add-point:ON ACTION controlp INFIELD stba019 name="construct.c.stba019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba020
            #add-point:BEFORE FIELD stba020 name="construct.b.stba020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba020
            
            #add-point:AFTER FIELD stba020 name="construct.a.stba020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba020
            #add-point:ON ACTION controlp INFIELD stba020 name="construct.c.stba020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba023
            #add-point:BEFORE FIELD stba023 name="construct.b.stba023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba023
            
            #add-point:AFTER FIELD stba023 name="construct.a.stba023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba023
            #add-point:ON ACTION controlp INFIELD stba023 name="construct.c.stba023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba008
            #add-point:BEFORE FIELD stba008 name="construct.b.stba008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba008
            
            #add-point:AFTER FIELD stba008 name="construct.a.stba008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba008
            #add-point:ON ACTION controlp INFIELD stba008 name="construct.c.stba008"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba008  #顯示到畫面上
            NEXT FIELD stba008 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba009
            #add-point:BEFORE FIELD stba009 name="construct.b.stba009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba009
            
            #add-point:AFTER FIELD stba009 name="construct.a.stba009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba009
            #add-point:ON ACTION controlp INFIELD stba009 name="construct.c.stba009"
             #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today
            CALL q_ooeg001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba009  #顯示到畫面上
            NEXT FIELD stba009
            #END add-point
 
 
         #Ctrlp:construct.c.stbaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaownid
            #add-point:ON ACTION controlp INFIELD stbaownid name="construct.c.stbaownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbaownid  #顯示到畫面上
            NEXT FIELD stbaownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaownid
            #add-point:BEFORE FIELD stbaownid name="construct.b.stbaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaownid
            
            #add-point:AFTER FIELD stbaownid name="construct.a.stbaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaowndp
            #add-point:ON ACTION controlp INFIELD stbaowndp name="construct.c.stbaowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbaowndp  #顯示到畫面上
            NEXT FIELD stbaowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaowndp
            #add-point:BEFORE FIELD stbaowndp name="construct.b.stbaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaowndp
            
            #add-point:AFTER FIELD stbaowndp name="construct.a.stbaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacrtid
            #add-point:ON ACTION controlp INFIELD stbacrtid name="construct.c.stbacrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacrtid  #顯示到畫面上
            NEXT FIELD stbacrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtid
            #add-point:BEFORE FIELD stbacrtid name="construct.b.stbacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacrtid
            
            #add-point:AFTER FIELD stbacrtid name="construct.a.stbacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacrtdp
            #add-point:ON ACTION controlp INFIELD stbacrtdp name="construct.c.stbacrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacrtdp  #顯示到畫面上
            NEXT FIELD stbacrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtdp
            #add-point:BEFORE FIELD stbacrtdp name="construct.b.stbacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacrtdp
            
            #add-point:AFTER FIELD stbacrtdp name="construct.a.stbacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtdt
            #add-point:BEFORE FIELD stbacrtdt name="construct.b.stbacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbamodid
            #add-point:ON ACTION controlp INFIELD stbamodid name="construct.c.stbamodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbamodid  #顯示到畫面上
            NEXT FIELD stbamodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbamodid
            #add-point:BEFORE FIELD stbamodid name="construct.b.stbamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbamodid
            
            #add-point:AFTER FIELD stbamodid name="construct.a.stbamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbamoddt
            #add-point:BEFORE FIELD stbamoddt name="construct.b.stbamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacnfid
            #add-point:ON ACTION controlp INFIELD stbacnfid name="construct.c.stbacnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacnfid  #顯示到畫面上
            NEXT FIELD stbacnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacnfid
            #add-point:BEFORE FIELD stbacnfid name="construct.b.stbacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacnfid
            
            #add-point:AFTER FIELD stbacnfid name="construct.a.stbacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacnfdt
            #add-point:BEFORE FIELD stbacnfdt name="construct.b.stbacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stbbseq,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023,stbb024,stbb011, 
          stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028,stbb009,stbb017,stbb002, 
          stbb003,stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite
           FROM s_detail1[1].stbbseq,s_detail1[1].stbb020,s_detail1[1].stbb021,s_detail1[1].stbb005, 
               s_detail1[1].stbb006,s_detail1[1].stbb022,s_detail1[1].stbb023,s_detail1[1].stbb024,s_detail1[1].stbb011, 
               s_detail1[1].stbb012,s_detail1[1].stbbud001,s_detail1[1].stbb001,s_detail1[1].stbb004, 
               s_detail1[1].stbb025,s_detail1[1].stbb026,s_detail1[1].stbb027,s_detail1[1].stbb028,s_detail1[1].stbb009, 
               s_detail1[1].stbb017,s_detail1[1].stbb002,s_detail1[1].stbb003,s_detail1[1].stbb007,s_detail1[1].stbb008, 
               s_detail1[1].stbb014,s_detail1[1].stbb015,s_detail1[1].stbb016,s_detail1[1].stbb018,s_detail1[1].stbbsite 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbseq
            #add-point:BEFORE FIELD stbbseq name="construct.b.page1.stbbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbseq
            
            #add-point:AFTER FIELD stbbseq name="construct.a.page1.stbbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbseq
            #add-point:ON ACTION controlp INFIELD stbbseq name="construct.c.page1.stbbseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb020
            #add-point:BEFORE FIELD stbb020 name="construct.b.page1.stbb020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb020
            
            #add-point:AFTER FIELD stbb020 name="construct.a.page1.stbb020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb020
            #add-point:ON ACTION controlp INFIELD stbb020 name="construct.c.page1.stbb020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb021
            #add-point:BEFORE FIELD stbb021 name="construct.b.page1.stbb021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb021
            
            #add-point:AFTER FIELD stbb021 name="construct.a.page1.stbb021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb021
            #add-point:ON ACTION controlp INFIELD stbb021 name="construct.c.page1.stbb021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb005
            #add-point:BEFORE FIELD stbb005 name="construct.b.page1.stbb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb005
            
            #add-point:AFTER FIELD stbb005 name="construct.a.page1.stbb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb005
            #add-point:ON ACTION controlp INFIELD stbb005 name="construct.c.page1.stbb005"
 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb006
            #add-point:BEFORE FIELD stbb006 name="construct.b.page1.stbb006"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb006
            
            #add-point:AFTER FIELD stbb006 name="construct.a.page1.stbb006"
 
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb006
            #add-point:ON ACTION controlp INFIELD stbb006 name="construct.c.page1.stbb006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb022
            #add-point:ON ACTION controlp INFIELD stbb022 name="construct.c.page1.stbb022"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001_15()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb022  #顯示到畫面上
            NEXT FIELD stbb022                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb022
            #add-point:BEFORE FIELD stbb022 name="construct.b.page1.stbb022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb022
            
            #add-point:AFTER FIELD stbb022 name="construct.a.page1.stbb022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb023
            #add-point:ON ACTION controlp INFIELD stbb023 name="construct.c.page1.stbb023"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb023  #顯示到畫面上
            NEXT FIELD stbb023                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb023
            #add-point:BEFORE FIELD stbb023 name="construct.b.page1.stbb023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb023
            
            #add-point:AFTER FIELD stbb023 name="construct.a.page1.stbb023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb024
            #add-point:ON ACTION controlp INFIELD stbb024 name="construct.c.page1.stbb024"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb024  #顯示到畫面上
            NEXT FIELD stbb024                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb024
            #add-point:BEFORE FIELD stbb024 name="construct.b.page1.stbb024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb024
            
            #add-point:AFTER FIELD stbb024 name="construct.a.page1.stbb024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb011
            #add-point:ON ACTION controlp INFIELD stbb011 name="construct.c.page1.stbb011"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')
            CALL q_rtax001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb011  #顯示到畫面上
            NEXT FIELD stbb011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb011
            #add-point:BEFORE FIELD stbb011 name="construct.b.page1.stbb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb011
            
            #add-point:AFTER FIELD stbb011 name="construct.a.page1.stbb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb012
            #add-point:ON ACTION controlp INFIELD stbb012 name="construct.c.page1.stbb012"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb012  #顯示到畫面上
            NEXT FIELD stbb012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb012
            #add-point:BEFORE FIELD stbb012 name="construct.b.page1.stbb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb012
            
            #add-point:AFTER FIELD stbb012 name="construct.a.page1.stbb012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbud001
            #add-point:BEFORE FIELD stbbud001 name="construct.b.page1.stbbud001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbud001
            
            #add-point:AFTER FIELD stbbud001 name="construct.a.page1.stbbud001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbbud001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbud001
            #add-point:ON ACTION controlp INFIELD stbbud001 name="construct.c.page1.stbbud001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb001
            #add-point:ON ACTION controlp INFIELD stbb001 name="construct.c.page1.stbb001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb001  #顯示到畫面上
            NEXT FIELD stbb001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb001
            #add-point:BEFORE FIELD stbb001 name="construct.b.page1.stbb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb001
            
            #add-point:AFTER FIELD stbb001 name="construct.a.page1.stbb001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb004
            #add-point:BEFORE FIELD stbb004 name="construct.b.page1.stbb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb004
            
            #add-point:AFTER FIELD stbb004 name="construct.a.page1.stbb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb004
            #add-point:ON ACTION controlp INFIELD stbb004 name="construct.c.page1.stbb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb025
            #add-point:BEFORE FIELD stbb025 name="construct.b.page1.stbb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb025
            
            #add-point:AFTER FIELD stbb025 name="construct.a.page1.stbb025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb025
            #add-point:ON ACTION controlp INFIELD stbb025 name="construct.c.page1.stbb025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb026
            #add-point:BEFORE FIELD stbb026 name="construct.b.page1.stbb026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb026
            
            #add-point:AFTER FIELD stbb026 name="construct.a.page1.stbb026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb026
            #add-point:ON ACTION controlp INFIELD stbb026 name="construct.c.page1.stbb026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb027
            #add-point:BEFORE FIELD stbb027 name="construct.b.page1.stbb027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb027
            
            #add-point:AFTER FIELD stbb027 name="construct.a.page1.stbb027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb027
            #add-point:ON ACTION controlp INFIELD stbb027 name="construct.c.page1.stbb027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb028
            #add-point:BEFORE FIELD stbb028 name="construct.b.page1.stbb028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb028
            
            #add-point:AFTER FIELD stbb028 name="construct.a.page1.stbb028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb028
            #add-point:ON ACTION controlp INFIELD stbb028 name="construct.c.page1.stbb028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb009
            #add-point:BEFORE FIELD stbb009 name="construct.b.page1.stbb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb009
            
            #add-point:AFTER FIELD stbb009 name="construct.a.page1.stbb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb009
            #add-point:ON ACTION controlp INFIELD stbb009 name="construct.c.page1.stbb009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb017
            #add-point:BEFORE FIELD stbb017 name="construct.b.page1.stbb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb017
            
            #add-point:AFTER FIELD stbb017 name="construct.a.page1.stbb017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb017
            #add-point:ON ACTION controlp INFIELD stbb017 name="construct.c.page1.stbb017"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb002
            #add-point:ON ACTION controlp INFIELD stbb002 name="construct.c.page1.stbb002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 =g_site 
            CALL q_ooaj002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb002  #顯示到畫面上
            NEXT FIELD stbb002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb002
            #add-point:BEFORE FIELD stbb002 name="construct.b.page1.stbb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb002
            
            #add-point:AFTER FIELD stbb002 name="construct.a.page1.stbb002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb003
            #add-point:ON ACTION controlp INFIELD stbb003 name="construct.c.page1.stbb003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site 
            CALL q_oodb002_3()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb003  #顯示到畫面上
            NEXT FIELD stbb003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb003
            #add-point:BEFORE FIELD stbb003 name="construct.b.page1.stbb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb003
            
            #add-point:AFTER FIELD stbb003 name="construct.a.page1.stbb003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb007
            #add-point:BEFORE FIELD stbb007 name="construct.b.page1.stbb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb007
            
            #add-point:AFTER FIELD stbb007 name="construct.a.page1.stbb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb007
            #add-point:ON ACTION controlp INFIELD stbb007 name="construct.c.page1.stbb007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb008
            #add-point:BEFORE FIELD stbb008 name="construct.b.page1.stbb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb008
            
            #add-point:AFTER FIELD stbb008 name="construct.a.page1.stbb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb008
            #add-point:ON ACTION controlp INFIELD stbb008 name="construct.c.page1.stbb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb014
            #add-point:BEFORE FIELD stbb014 name="construct.b.page1.stbb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb014
            
            #add-point:AFTER FIELD stbb014 name="construct.a.page1.stbb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb014
            #add-point:ON ACTION controlp INFIELD stbb014 name="construct.c.page1.stbb014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb015
            #add-point:BEFORE FIELD stbb015 name="construct.b.page1.stbb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb015
            
            #add-point:AFTER FIELD stbb015 name="construct.a.page1.stbb015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb015
            #add-point:ON ACTION controlp INFIELD stbb015 name="construct.c.page1.stbb015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb016
            #add-point:BEFORE FIELD stbb016 name="construct.b.page1.stbb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb016
            
            #add-point:AFTER FIELD stbb016 name="construct.a.page1.stbb016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb016
            #add-point:ON ACTION controlp INFIELD stbb016 name="construct.c.page1.stbb016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb018
            #add-point:BEFORE FIELD stbb018 name="construct.b.page1.stbb018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb018
            
            #add-point:AFTER FIELD stbb018 name="construct.a.page1.stbb018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb018
            #add-point:ON ACTION controlp INFIELD stbb018 name="construct.c.page1.stbb018"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbsite
            #add-point:ON ACTION controlp INFIELD stbbsite name="construct.c.page1.stbbsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                           #呼叫開窗   #161024-00025#3 mark
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbbsite',g_site,'c')   #161024-00025#3 add
            CALL q_ooef001_24()              #161024-00025#3 add
            DISPLAY g_qryparam.return1 TO stbbsite  #顯示到畫面上
            NEXT FIELD stbbsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbsite
            #add-point:BEFORE FIELD stbbsite name="construct.b.page1.stbbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbsite
            
            #add-point:AFTER FIELD stbbsite name="construct.a.page1.stbbsite"
            
            #END add-point
            
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         #add by geza 20151010(S)
         LET g_stbb_d[1].stbbseq = ""
         DISPLAY ARRAY g_stbb_d TO s_detail1.*
            BEFORE DISPLAY
               EXIT DISPLAY
         END DISPLAY
         #add by geza 20151010(E)
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
                  WHEN la_wc[li_idx].tableid = "stba_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbb_t" 
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
 
{<section id="astt560.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt560_filter()
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
      CONSTRUCT g_wc_filter ON stbadocno,stbadocdt,stbaunit,stba001,stba002
                          FROM s_browse[1].b_stbadocno,s_browse[1].b_stbadocdt,s_browse[1].b_stbaunit, 
                              s_browse[1].b_stba001,s_browse[1].b_stba002
 
         BEFORE CONSTRUCT
               DISPLAY astt560_filter_parser('stbadocno') TO s_browse[1].b_stbadocno
            DISPLAY astt560_filter_parser('stbadocdt') TO s_browse[1].b_stbadocdt
            DISPLAY astt560_filter_parser('stbaunit') TO s_browse[1].b_stbaunit
            DISPLAY astt560_filter_parser('stba001') TO s_browse[1].b_stba001
            DISPLAY astt560_filter_parser('stba002') TO s_browse[1].b_stba002
      
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
 
      CALL astt560_filter_show('stbadocno')
   CALL astt560_filter_show('stbadocdt')
   CALL astt560_filter_show('stbaunit')
   CALL astt560_filter_show('stba001')
   CALL astt560_filter_show('stba002')
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt560_filter_parser(ps_field)
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
 
{<section id="astt560.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt560_filter_show(ps_field)
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
   LET ls_condition = astt560_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt560_query()
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
   CALL g_stbb_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt560_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt560_browser_fill("")
      CALL astt560_fetch("")
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
      CALL astt560_filter_show('stbadocno')
   CALL astt560_filter_show('stbadocdt')
   CALL astt560_filter_show('stbaunit')
   CALL astt560_filter_show('stba001')
   CALL astt560_filter_show('stba002')
   CALL astt560_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt560_fetch("F") 
      #顯示單身筆數
      CALL astt560_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt560_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
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
   
   LET g_stba_m.stbadocno = g_browser[g_current_idx].b_stbadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt560_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt560_set_act_visible()   
   CALL astt560_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)
   IF g_stba_m.stbastus != 'N'  THEN
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stba_m_t.* = g_stba_m.*
   LET g_stba_m_o.* = g_stba_m.*
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #重新顯示   
   CALL astt560_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt560_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_insert       LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stbb_d.clear()   
 
 
   INITIALIZE g_stba_m.* TO NULL             #DEFAULT 設定
   
   LET g_stbadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stba_m.stbaownid = g_user
      LET g_stba_m.stbaowndp = g_dept
      LET g_stba_m.stbacrtid = g_user
      LET g_stba_m.stbacrtdp = g_dept 
      LET g_stba_m.stbacrtdt = cl_get_current()
      LET g_stba_m.stbamodid = g_user
      LET g_stba_m.stbamoddt = cl_get_current()
      LET g_stba_m.stbastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stba_m.stba021 = "0"
      LET g_stba_m.sum_stbb025 = "0"
      LET g_stba_m.sum_stbb026 = "0"
      LET g_stba_m.stba017 = "0"
      LET g_stba_m.stba023 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stba_m_t.*=g_stba_m.*     
#      LET g_stba_m.stbaunit=g_site

      LET r_insert=TRUE
      #CALL s_aooi500_default(g_prog,'stbaunit',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbaunit   #161024-00025#3 mark
      CALL s_aooi500_default(g_prog,'stbasite',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbasite   #161024-00025#3 add
      IF NOT r_insert THEN
         RETURN 
      END IF

      LET g_stba_m.stba014 = '6'

      #LET g_stba_m.stbasite=g_site    #161024-00025#3 mark
      LET g_stba_m.stbaunit=g_stba_m.stbasite    #161024-00025#3 add
      LET g_stba_m.stbadocdt=g_today

      LET g_stba_m.stbastus='N'
      LET g_stba_m.stba021=0
 
     ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stba_m.stbaunit,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stba_m.stbadocno = r_doctype

      SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stbaunit
         AND ooefl002=g_dlang  
         
      #SELECT oofa011 INTO g_stba_m.stba008_desc
      #  FROM oofa_t
      # WHERE oofa002='2'
      #   AND oofa003=g_stba_m.stba008
      #   
      #SELECT ooefl003 INTO g_stba_m.stba009_desc
      #  FROM ooefl_t
      # WHERE ooeflent=g_enterprise
      #   AND ooefl001=g_stba_m.stba009
      #   AND ooefl002=g_dlang        
         
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbaownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbamodid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbamodid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbamodid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacnfid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacnfid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacnfid_desc         


      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stba_m_t.* = g_stba_m.*
      LET g_stba_m_o.* = g_stba_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
 
 
 
    
      CALL astt560_input("a")
      
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
         INITIALIZE g_stba_m.* TO NULL
         INITIALIZE g_stbb_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt560_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stbb_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt560_set_act_visible()   
   CALL astt560_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt560_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt560_cl
   
   CALL astt560_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt560_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stba_m.stbasite,g_stba_m.stbasite_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014, 
       g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010, 
       g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc, 
       g_stba_m.stba004,g_stba_m.stba004_desc,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba001_desc, 
       g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017,g_stba_m.stba018, 
       g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009, 
       g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc, 
       g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt, 
       g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc, 
       g_stba_m.stbacnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #功能已完成,通報訊息中心
   CALL astt560_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt560_modify()
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
   LET g_stba_m_t.* = g_stba_m.*
   LET g_stba_m_o.* = g_stba_m.*
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   CALL s_transaction_begin()
   
   OPEN astt560_cl USING g_enterprise,g_stba_m.stbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt560_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt560_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt560_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt560_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stbadocno_t = g_stba_m.stbadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stba_m.stbamodid = g_user 
LET g_stba_m.stbamoddt = cl_get_current()
LET g_stba_m.stbamodid_desc = cl_get_username(g_stba_m.stbamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stba_m.stbastus MATCHES "[DR]" THEN
         LET g_stba_m.stbastus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt560_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stba_t SET (stbamodid,stbamoddt) = (g_stba_m.stbamodid,g_stba_m.stbamoddt)
          WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stba_m.* = g_stba_m_t.*
            CALL astt560_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stba_m.stbadocno != g_stba_m_t.stbadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stbb_t SET stbbdocno = g_stba_m.stbadocno
 
          WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m_t.stbadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
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
   CALL astt560_set_act_visible()   
   CALL astt560_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
   #填到對應位置
   CALL astt560_browser_fill("")
 
   CLOSE astt560_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt560_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt560.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt560_input(p_cmd)
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
   DEFINE l_ooef004             LIKE ooef_t.ooef004
   DEFINE l_success             LIKE type_t.num5
   DEFINE l_errno               STRING
   DEFINE l_oodb006             LIKE oodb_t.oodb006
   DEFINE l_ooef019             LIKE ooef_t.ooef019
   DEFINE r_insert              LIKE type_t.num5
   DEFINE r_success             LIKE type_t.num5
   DEFINE r_stau004             LIKE stau_t.stau004
   DEFINE r_period              LIKE type_t.num5
   DEFINE r_period2             LIKE type_t.num5
   DEFINE l_stae006             LIKE stae_t.stae006
   DEFINE l_stae005             LIKE stae_t.stae005
   DEFINE l_stan005             LIKE stan_t.stan005
   DEFINE l_stfa019             LIKE stfa_t.stfa019
   DEFINE l_stfa020             LIKE stfa_t.stfa020
   DEFINE l_stfa010             LIKE stfa_t.stfa010
   DEFINE l_stfj002             LIKE stfj_t.stfj002
   DEFINE l_stfj003             LIKE stfj_t.stfj003
   DEFINE l_ooef017             LIKE ooef_t.ooef017
   DEFINE l_glaa003             LIKE glaa_t.glaa003
   DEFINE l_flag                LIKE type_t.chr1
#   DEFINE l_errno               LIKE type_t.chr100 
   DEFINE l_glav005             LIKE glav_t.glav005
   DEFINE l_sdate_s             LIKE type_t.chr500
   DEFINE  l_sdate_e            LIKE type_t.chr500
   DEFINE l_pdate_s             LIKE type_t.chr500
   DEFINE l_pdate_e             LIKE type_t.chr500
   DEFINE l_glav007             LIKE glav_t.glav007
   DEFINE l_wdate_s             LIKE type_t.chr500
   DEFINE l_wdate_e             LIKE type_t.chr500
   DEFINE l_glav002_1           LIKE glav_t.glav002
   DEFINE l_glav002             LIKE glav_t.glav002
   DEFINE l_glav006_1           LIKE glav_t.glav006
   DEFINE l_glav006             LIKE glav_t.glav006
   DEFINE l_stba021             LIKE stba_t.stba021
  
   DEFINE p_wc STRING #ADDED BY LANJJ 151022
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
   DISPLAY BY NAME g_stba_m.stbasite,g_stba_m.stbasite_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014, 
       g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010, 
       g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc, 
       g_stba_m.stba004,g_stba_m.stba004_desc,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba001_desc, 
       g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017,g_stba_m.stba018, 
       g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009, 
       g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc, 
       g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt, 
       g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc, 
       g_stba_m.stbacnfdt
   
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
   LET g_forupd_sql = "SELECT stbbseq,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023,stbb024,stbb011, 
       stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028,stbb009,stbb017,stbb002,stbb003, 
       stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite FROM stbb_t WHERE stbbent=? AND stbbdocno=?  
       AND stbbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt560_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt560_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt560_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013, 
       g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus, 
       g_stba_m.stba001,g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017, 
       g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba009 
 
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba021,g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba004, 
       g_stba_m.stba004_desc,g_stba_m.stba005,g_stba_m.stba005_desc,
       g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbasite,g_stba_m.stbastus,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid, 
       g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt560.input.head" >}
      #單頭段
      INPUT BY NAME g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013, 
          g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus, 
          g_stba_m.stba001,g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017, 
          g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba009  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt560_cl USING g_enterprise,g_stba_m.stbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt560_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt560_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt560_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL astt560_set_entry(p_cmd)
            CALL astt560_set_no_entry(p_cmd)
            IF p_cmd = 'a' THEN
               IF NOT cl_null(g_stba_m.stba001) AND NOT cl_null(g_stba_m.stbadocdt) THEN
                  CALL s_asti206_check(g_stba_m.stba001,g_stba_m.stbadocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     LET g_stba_m.stbadocdt=''
                  END IF
                END IF
            END IF
            #end add-point
            CALL astt560_set_no_entry(p_cmd)
    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocdt
            #add-point:BEFORE FIELD stbadocdt name="input.b.stbadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocdt
            
            #add-point:AFTER FIELD stbadocdt name="input.a.stbadocdt"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbadocdt
            #add-point:ON CHANGE stbadocdt name="input.g.stbadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocno
            #add-point:BEFORE FIELD stbadocno name="input.b.stbadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocno
            
            #add-point:AFTER FIELD stbadocno name="input.a.stbadocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stba_m.stbadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stbadocno != g_stbadocno_t )) THEN 
                  IF NOT s_aooi200_chk_slip(g_site,'',g_stba_m.stbadocno,g_prog) THEN
                     LET g_stba_m.stbadocno =  g_stba_m_t.stbadocno                    
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbadocno
            #add-point:ON CHANGE stbadocno name="input.g.stbadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba014
            #add-point:BEFORE FIELD stba014 name="input.b.stba014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba014
            
            #add-point:AFTER FIELD stba014 name="input.a.stba014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba014
            #add-point:ON CHANGE stba014 name="input.g.stba014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaunit
            
            #add-point:AFTER FIELD stbaunit name="input.a.stbaunit"
            IF  NOT cl_null(g_stba_m.stbaunit) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stbaunit != g_stba_m_t.stbaunit )) THEN 
                  CALL s_aooi500_chk(g_prog,'stbaunit',g_stba_m.stbaunit,g_site)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stba_m.stbaunit
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stba_m.stbaunit = g_stba_m_t.stbaunit
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF      

            CALL astt560_set_entry(p_cmd)
            CALL astt560_set_no_entry(p_cmd)
            
            CALL s_desc_get_department_desc(g_stba_m.stbaunit) RETURNING g_stba_m.stbaunit_desc
            DISPLAY BY NAME g_stba_m.stbaunit_desc             
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaunit
            #add-point:BEFORE FIELD stbaunit name="input.b.stbaunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbaunit
            #add-point:ON CHANGE stbaunit name="input.g.stbaunit"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba013
            
            #add-point:AFTER FIELD stba013 name="input.a.stba013"
            LET g_stba_m.stba013_desc = ' '
            DISPLAY BY NAME g_stba_m.stba013_desc
            IF NOT cl_null(g_stba_m.stba013) THEN
               IF g_stba_m.stba013 != g_stba_m_o.stba013 OR g_stba_m_o.stba013 IS NULL  THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stba_m.stba013
                  IF NOT cl_chk_exist("v_mhae001") THEN
                     LET g_stba_m.stba013 = g_stba_m_o.stba013
                     CALL astt560_stba013_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            #LET g_stba_m_o.stba013 = g_stba_m.stba013 #mark by geza 20150812
            #160824-00007#193 161120 by lori mark and add---(S)
            #CALL astt560_stba013_other()
            IF NOT astt560_stba013_other() THEN    #含舊值備份
               LET g_stba_m.stba013 = g_stba_m_o.stba013
               CALL astt560_stba013_ref()
               NEXT FIELD CURRENT   
            END IF
            #160824-00007#193 161120 by lori mark and add---(E)
            
            #160824-00007#193 161120 by lori mark---(S)
            #將校驗搬遷至astt560_stba013_other()
            #add by geza 20150812(E) 
            #IF NOT cl_null(g_stba_m.stba010) THEN
            #   LET l_cnt = 0               
            #      SELECT COUNT(*) INTO l_cnt    
            #        FROM stfa_t
            #       WHERE stfaent = g_enterprise
            #         AND stfa001=g_stba_m.stba010
            #         AND stfastus='Y' 
            #         AND stfa004 != '7'                     
            #      IF l_cnt < 1 THEN
            #         INITIALIZE g_errparam TO NULL
            #         LET g_errparam.code = "ast-00273"
            #         LET g_errparam.extend = g_stba_m.stba010
            #         LET g_errparam.popup = TRUE
            #         CALL cl_err()
            #         LET g_stba_m.stba013 = g_stba_m_o.stba013
            #         CALL astt560_stba013_ref()
            #         LET g_stba_m.stba002 = g_stba_m_t.stba002
            #         LET g_stba_m.stba003 = g_stba_m_t.stba003
            #         LET g_stba_m.stba004 = g_stba_m_t.stba004
            #         LET g_stba_m.stba005 = g_stba_m_t.stba005
            #         LET g_stba_m.stba001 = g_stba_m_t.stba001
            #         LET g_stba_m.stba010 = g_stba_m_t.stba010
            #         LET g_stba_m.stba008 = g_stba_m_t.stba008 
            #         LET g_stba_m.stba009 = g_stba_m_t.stba009                      
            #         CALL astt560_stba002_ref()   
            #         CALL astt560_stba004_ref()
            #         CALL astt560_stba005_ref()
            #         #結算中心說明
            #         CALL s_desc_get_department_desc(g_stba_m.stba001) RETURNING g_stba_m.stba001_desc
            #         DISPLAY BY NAME g_stba_m.stba001_desc     
            #         #業務人員說明
            #         CALL s_desc_get_person_desc(g_stba_m.stba008) RETURNING g_stba_m.stba008_desc
            #         DISPLAY BY NAME g_stba_m.stba008_desc 
            #         #部門說明
            #         CALL s_desc_get_department_desc(g_stba_m.stba009) RETURNING g_stba_m.stba009_desc
            #         DISPLAY BY NAME g_stba_m.stba009_desc
            #         NEXT FIELD CURRENT
            #      END IF                           
            #END IF   
            #160824-00007#193 161120 by lori mark---(E)
            
            LET g_stba_m_o.stba013 = g_stba_m.stba013 #add by geza 20150812
            #add by geza 20150812(E)
            CALL astt560_stba013_ref()            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba013
            #add-point:BEFORE FIELD stba013 name="input.b.stba013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba013
            #add-point:ON CHANGE stba013 name="input.g.stba013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba010
            
            #add-point:AFTER FIELD stba010 name="input.a.stba010"
            IF NOT cl_null(g_stba_m.stba010) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba010 != g_stba_m_t.stba010 )) THEN   #160824-00007#193 161120 by lori mark
               IF g_stba_m.stba010 != g_stba_m_o.stba010 OR cl_null(g_stba_m_o.stba010) THEN         #160824-00007#193 161120 by lori add
                  INITIALIZE g_chkparam.* TO NULL		      
                  LET g_chkparam.arg1 = g_stba_m.stba010            
                  IF NOT cl_chk_exist("v_stfa001") THEN
                     LET g_stba_m.stba010 = g_stba_m_o.stba010      #160824-00007#193 161120 by lori mod:g_stba_m_o.stba010->g_stba_m_t.stba010             
                     DISPLAY BY NAME g_stba_m.stba010               #160824-00007#193 161120 by lori add
                     NEXT FIELD CURRENT
                  END IF 
                  #add by geza 20150812(S)
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt    
                    FROM stfa_t
                   WHERE stfaent = g_enterprise
                     AND stfa001=g_stba_m.stba010
                     AND stfastus='Y' 
                     AND stfa004 != '7'                     
                  IF l_cnt < 1 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00273"
                     LET g_errparam.extend = g_stba_m.stba010
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     
                     LET g_stba_m.stba010 = g_stba_m_o.stba010      #160824-00007#193 161120 by lori mod:g_stba_m_o.stba010->g_stba_m_t.stba010
                     DISPLAY BY NAME g_stba_m.stba010               #160824-00007#193 161120 by lori add
                     NEXT FIELD CURRENT
                  END IF                   
                  #add by geza 20150812(E)
                  #合約生效日期範圍判斷
                  IF NOT cl_null(g_stba_m.stbadocdt) THEN
                     SELECT stfa019,stfa020 INTO l_stfa019,l_stfa020
                       FROM stfa_t
                      WHERE stfaent=g_enterprise
                        AND stfa001=g_stba_m.stba010
                        AND stfastus='Y' 
                     IF l_stfa019>g_stba_m.stbadocdt OR l_stfa020<g_stba_m.stbadocdt THEN
                        LET g_stba_m.stba010 = g_stba_m_t.stba010
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00047"
                        LET g_errparam.extend = g_stba_m.stba010
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        
                        LET g_stba_m.stba010 = g_stba_m_o.stba010   #160824-00007#193 161120 by lori mod:g_stba_m_o.stba010->g_stba_m_t.stba010
                        DISPLAY BY NAME g_stba_m.stba010               #160824-00007#193 161120 by lori add
                        NEXT FIELD CURRENT
                     END IF  
                  END IF
                  
                  CALL astt560_stba010_other()   #含舊值備份
                  LET g_stba_m_o.stba010 = g_stba_m.stba010   #160824-00007#193 161120 by lori 
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba010
            #add-point:BEFORE FIELD stba010 name="input.b.stba010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba010
            #add-point:ON CHANGE stba010 name="input.g.stba010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba002
            
            #add-point:AFTER FIELD stba002 name="input.a.stba002"
     
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba002
            #add-point:BEFORE FIELD stba002 name="input.b.stba002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba002
            #add-point:ON CHANGE stba002 name="input.g.stba002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba003
            #add-point:BEFORE FIELD stba003 name="input.b.stba003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba003
            
            #add-point:AFTER FIELD stba003 name="input.a.stba003"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba003
            #add-point:ON CHANGE stba003 name="input.g.stba003"
    
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba005
            
            #add-point:AFTER FIELD stba005 name="input.a.stba005"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba005
            #add-point:BEFORE FIELD stba005 name="input.b.stba005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba005
            #add-point:ON CHANGE stba005 name="input.g.stba005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba004
            
            #add-point:AFTER FIELD stba004 name="input.a.stba004"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba004
            #add-point:BEFORE FIELD stba004 name="input.b.stba004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba004
            #add-point:ON CHANGE stba004 name="input.g.stba004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbastus
            #add-point:BEFORE FIELD stbastus name="input.b.stbastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbastus
            
            #add-point:AFTER FIELD stbastus name="input.a.stbastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbastus
            #add-point:ON CHANGE stbastus name="input.g.stbastus"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba001
            
            #add-point:AFTER FIELD stba001 name="input.a.stba001"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba001
            #add-point:BEFORE FIELD stba001 name="input.b.stba001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba001
            #add-point:ON CHANGE stba001 name="input.g.stba001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba021
            #add-point:BEFORE FIELD stba021 name="input.b.stba021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba021
            
            #add-point:AFTER FIELD stba021 name="input.a.stba021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba021
            #add-point:ON CHANGE stba021 name="input.g.stba021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sum_stbb025
            #add-point:BEFORE FIELD sum_stbb025 name="input.b.sum_stbb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sum_stbb025
            
            #add-point:AFTER FIELD sum_stbb025 name="input.a.sum_stbb025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sum_stbb025
            #add-point:ON CHANGE sum_stbb025 name="input.g.sum_stbb025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sum_stbb026
            #add-point:BEFORE FIELD sum_stbb026 name="input.b.sum_stbb026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sum_stbb026
            
            #add-point:AFTER FIELD sum_stbb026 name="input.a.sum_stbb026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sum_stbb026
            #add-point:ON CHANGE sum_stbb026 name="input.g.sum_stbb026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba017
            #add-point:BEFORE FIELD stba017 name="input.b.stba017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba017
            
            #add-point:AFTER FIELD stba017 name="input.a.stba017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba017
            #add-point:ON CHANGE stba017 name="input.g.stba017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba018
            #add-point:BEFORE FIELD stba018 name="input.b.stba018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba018
            
            #add-point:AFTER FIELD stba018 name="input.a.stba018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba018
            #add-point:ON CHANGE stba018 name="input.g.stba018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba019
            #add-point:BEFORE FIELD stba019 name="input.b.stba019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba019
            
            #add-point:AFTER FIELD stba019 name="input.a.stba019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba019
            #add-point:ON CHANGE stba019 name="input.g.stba019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba020
            #add-point:BEFORE FIELD stba020 name="input.b.stba020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba020
            
            #add-point:AFTER FIELD stba020 name="input.a.stba020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba020
            #add-point:ON CHANGE stba020 name="input.g.stba020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba023
            #add-point:BEFORE FIELD stba023 name="input.b.stba023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba023
            
            #add-point:AFTER FIELD stba023 name="input.a.stba023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba023
            #add-point:ON CHANGE stba023 name="input.g.stba023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba008
            
            #add-point:AFTER FIELD stba008 name="input.a.stba008"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba008
            #add-point:BEFORE FIELD stba008 name="input.b.stba008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba008
            #add-point:ON CHANGE stba008 name="input.g.stba008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba009
            
            #add-point:AFTER FIELD stba009 name="input.a.stba009"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba009
            #add-point:BEFORE FIELD stba009 name="input.b.stba009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba009
            #add-point:ON CHANGE stba009 name="input.g.stba009"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocdt
            #add-point:ON ACTION controlp INFIELD stbadocdt name="input.c.stbadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocno
            #add-point:ON ACTION controlp INFIELD stbadocno name="input.c.stbadocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stbadocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise            
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stba_m.stbadocno = g_qryparam.return1              

            DISPLAY g_stba_m.stbadocno TO stbadocno              #

            NEXT FIELD stbadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba014
            #add-point:ON ACTION controlp INFIELD stba014 name="input.c.stba014"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbaunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaunit
            #add-point:ON ACTION controlp INFIELD stbaunit name="input.c.stbaunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stbaunit            #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbaunit',g_stba_m.stbaunit,'i') #150308-00001#5  By geza add 'i'
            CALL q_ooef001_24()

            LET  g_stba_m.stbaunit = g_qryparam.return1              

            DISPLAY g_stba_m.stbaunit TO stbaunit              #
            
            CALL s_desc_get_department_desc(g_stba_m.stbaunit)  RETURNING g_stba_m.stbaunit_desc
            DISPLAY BY NAME g_stba_m.stbaunit_desc
            NEXT FIELD stbaunit             
                         #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stba013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba013
            #add-point:ON ACTION controlp INFIELD stba013 name="input.c.stba013"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba013             #給予default值
            LET g_qryparam.default2 = "" #g_stba_m.mhael023 #简称
            #給予arg
            LET g_qryparam.arg1 = g_site #s

            CALL q_mhae001()                                #呼叫開窗

            LET g_stba_m.stba013 = g_qryparam.return1              
            #LET g_stba_m.mhael023 = g_qryparam.return2 
            DISPLAY g_stba_m.stba013 TO stba013              #
            #DISPLAY g_stba_m.mhael023 TO mhael023 #简称
            NEXT FIELD stba013                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba010
            #add-point:ON ACTION controlp INFIELD stba010 name="input.c.stba010"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

            CALL q_stfa001()                                #呼叫開窗

            LET g_stba_m.stba010 = g_qryparam.return1              

            DISPLAY g_stba_m.stba010 TO stba010              #

            NEXT FIELD stba010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba002
            #add-point:ON ACTION controlp INFIELD stba002 name="input.c.stba002"
  
            #END add-point
 
 
         #Ctrlp:input.c.stba003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba003
            #add-point:ON ACTION controlp INFIELD stba003 name="input.c.stba003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba005
            #add-point:ON ACTION controlp INFIELD stba005 name="input.c.stba005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba004
            #add-point:ON ACTION controlp INFIELD stba004 name="input.c.stba004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbastus
            #add-point:ON ACTION controlp INFIELD stbastus name="input.c.stbastus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba001
            #add-point:ON ACTION controlp INFIELD stba001 name="input.c.stba001"
 
            #END add-point
 
 
         #Ctrlp:input.c.stba021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba021
            #add-point:ON ACTION controlp INFIELD stba021 name="input.c.stba021"
            
            #END add-point
 
 
         #Ctrlp:input.c.sum_stbb025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sum_stbb025
            #add-point:ON ACTION controlp INFIELD sum_stbb025 name="input.c.sum_stbb025"
            
            #END add-point
 
 
         #Ctrlp:input.c.sum_stbb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sum_stbb026
            #add-point:ON ACTION controlp INFIELD sum_stbb026 name="input.c.sum_stbb026"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba017
            #add-point:ON ACTION controlp INFIELD stba017 name="input.c.stba017"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba018
            #add-point:ON ACTION controlp INFIELD stba018 name="input.c.stba018"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba019
            #add-point:ON ACTION controlp INFIELD stba019 name="input.c.stba019"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba020
            #add-point:ON ACTION controlp INFIELD stba020 name="input.c.stba020"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba023
            #add-point:ON ACTION controlp INFIELD stba023 name="input.c.stba023"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba008
            #add-point:ON ACTION controlp INFIELD stba008 name="input.c.stba008"
 
            #END add-point
 
 
         #Ctrlp:input.c.stba009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba009
            #add-point:ON ACTION controlp INFIELD stba009 name="input.c.stba009"
 
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stba_m.stbadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_stba_m.stbadocno,g_stba_m.stbadocdt,g_prog) RETURNING l_success,g_stba_m.stbadocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG                  
               END IF 
               #end add-point
               
               INSERT INTO stba_t (stbaent,stbasite,stbadocdt,stbadocno,stba014,stbaunit,stba013,stba010, 
                   stba002,stba003,stba005,stba004,stbastus,stba001,stba021,stba017,stba018,stba019, 
                   stba020,stba023,stba008,stba009,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt, 
                   stbamodid,stbamoddt,stbacnfid,stbacnfdt)
               VALUES (g_enterprise,g_stba_m.stbasite,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014, 
                   g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba003, 
                   g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
                   g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023, 
                   g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid, 
                   g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid, 
                   g_stba_m.stbacnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stba_m:",SQLERRMESSAGE 
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
                  CALL astt560_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt560_b_fill()
                  CALL astt560_b_fill2('0')
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
               CALL astt560_stba_t_mask_restore('restore_mask_o')
               
               UPDATE stba_t SET (stbasite,stbadocdt,stbadocno,stba014,stbaunit,stba013,stba010,stba002, 
                   stba003,stba005,stba004,stbastus,stba001,stba021,stba017,stba018,stba019,stba020, 
                   stba023,stba008,stba009,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid, 
                   stbamoddt,stbacnfid,stbacnfdt) = (g_stba_m.stbasite,g_stba_m.stbadocdt,g_stba_m.stbadocno, 
                   g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
                   g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001, 
                   g_stba_m.stba021,g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020, 
                   g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp, 
                   g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt, 
                   g_stba_m.stbacnfid,g_stba_m.stbacnfdt)
                WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stba_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt560_stba_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stba_m_t)
               LET g_log2 = util.JSON.stringify(g_stba_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stbadocno_t = g_stba_m.stbadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt560.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt560_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stbb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            CALL astt560_set_entry(p_cmd)
            CALL astt560_set_no_entry(p_cmd)
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            CALL astt560_set_entry(p_cmd)
            CALL astt560_set_no_entry(p_cmd)
            
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
            OPEN astt560_cl USING g_enterprise,g_stba_m.stbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt560_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt560_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbb_d[l_ac].stbbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbb_d_t.* = g_stbb_d[l_ac].*  #BACKUP
               LET g_stbb_d_o.* = g_stbb_d[l_ac].*  #BACKUP
               CALL astt560_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
              

              IF g_stbb_d[l_ac].stbb001 IS NOT NULL THEN
            
                  SELECT stae006 
                    INTO l_stae006
                    FROM stae_t
                   WHERE staeent = g_enterprise 
                     AND stae001 = g_stbb_d[l_ac].stbb001
                  IF l_stae006 = '1' OR l_stae006 = '2' THEN
                     CALL cl_set_comp_entry('stbb004',FALSE)
                  ELSE 
                     CALL cl_set_comp_entry('stbb004',TRUE)               
                  END IF
               END IF 
            SELECT DISTINCT stfjseq INTO g_stbb_d[l_ac].stbb018
              FROM stfj_t
             WHERE stfj001 = g_stba_m.stba010
               AND stfj002 <= g_stba_m.stbadocdt 
               AND stfj003 >= g_stba_m.stbadocdt 
               AND stfjent=g_enterprise #160905-00007#17 add              
               #end add-point  
               CALL astt560_set_no_entry_b(l_cmd)
               IF NOT astt560_lock_b("stbb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt560_bcl INTO g_stbb_d[l_ac].stbbseq,g_stbb_d[l_ac].stbb020,g_stbb_d[l_ac].stbb021, 
                      g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbb022,g_stbb_d[l_ac].stbb023, 
                      g_stbb_d[l_ac].stbb024,g_stbb_d[l_ac].stbb011,g_stbb_d[l_ac].stbb012,g_stbb_d[l_ac].stbbud001, 
                      g_stbb_d[l_ac].stbb001,g_stbb_d[l_ac].stbb004,g_stbb_d[l_ac].stbb025,g_stbb_d[l_ac].stbb026, 
                      g_stbb_d[l_ac].stbb027,g_stbb_d[l_ac].stbb028,g_stbb_d[l_ac].stbb009,g_stbb_d[l_ac].stbb017, 
                      g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb007,g_stbb_d[l_ac].stbb008, 
                      g_stbb_d[l_ac].stbb014,g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016,g_stbb_d[l_ac].stbb018, 
                      g_stbb_d[l_ac].stbbsite
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbb_d_t.stbbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbb_d_mask_o[l_ac].* =  g_stbb_d[l_ac].*
                  CALL astt560_stbb_t_mask()
                  LET g_stbb_d_mask_n[l_ac].* =  g_stbb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt560_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            IF g_stbb_d[l_ac].stbb020 != '2' AND g_stbb_d[l_ac].stbb020 != '8' AND g_stbb_d[l_ac].stbb020 != '12'  AND g_stbb_d[l_ac].stbb020 != '15' AND g_stbb_d[l_ac].stbb020 != '16' AND g_stbb_d[l_ac].stbb020 !='18' AND g_stbb_d[l_ac].stbb020 !='19' AND g_stbb_d[l_ac].stbb020 !='20' AND g_stbb_d[l_ac].stbb020 !='21'  THEN   #add by geza 20151011 类型18,19,20,21  
               NEXT FIELD stbbsite
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
            INITIALIZE g_stbb_d[l_ac].* TO NULL 
            INITIALIZE g_stbb_d_t.* TO NULL 
            INITIALIZE g_stbb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stbb_d[l_ac].stbb004 = "1"
      LET g_stbb_d[l_ac].stbb025 = "0"
      LET g_stbb_d[l_ac].stbb026 = "0"
      LET g_stbb_d[l_ac].stbb027 = "0"
      LET g_stbb_d[l_ac].stbb014 = "0"
      LET g_stbb_d[l_ac].stbb018 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT MAX(stbbseq) INTO g_stbb_d[l_ac].stbbseq
              FROM stbb_t
             WHERE stbbent= g_enterprise
               AND stbbdocno= g_stba_m.stbadocno
            IF cl_null(g_stbb_d[l_ac].stbbseq) THEN
               LET g_stbb_d[l_ac].stbbseq=1
            ELSE
               LET  g_stbb_d[l_ac].stbbseq=g_stbb_d[l_ac].stbbseq+1
            END IF 
            DISPLAY g_stbb_d[l_ac].stbbseq TO stbbseq
                         
            #LET g_stbb_d[l_ac].stbbsite = g_site      #mark by geza 20151205
            LET g_stbb_d[l_ac].stbbsite = g_stba_m.stbasite     #add by geza 20151205
            LET g_stbb_d[l_ac].stbb005 = g_stba_m.stba019
            LET g_stbb_d[l_ac].stbb006 = g_stba_m.stba020
            CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt560')
               RETURNING r_success,r_stau004,r_period,r_period2
               LET g_stbb_d[l_ac].stbb007 = r_stau004
               LET g_stbb_d[l_ac].stbb008 = r_period
               LET g_stbb_d[l_ac].stbb014 = r_period2
            #所屬部門說明 
            #根据合同带币别税别
            SELECT stfa032,stfa033 INTO g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb003
              FROM stfa_t
             WHERE stfaent  =  g_enterprise
               AND stfa001  =  g_stba_m.stba010
            LET g_stbb_d[l_ac].stbb020 = "2"   
            IF g_stbb_d[l_ac].stbb020 = '2' OR g_stbb_d[l_ac].stbb020 = '8' THEN
               CALL cl_set_comp_required('stbb023',TRUE)
            ELSE
               CALL cl_set_comp_required('stbb023',FALSE)               
            END IF
            LET g_stbb_d[l_ac].stbb012 = g_stba_m.stba009
            CALL astt560_stbb012_ref()
            LET g_stbb_d[l_ac].stbb011 = astt560_get_stbb011()
            CALL astt560_stbb011_ref()
            #add by geza 20151010(S) #含发票否
            SELECT stfa050 INTO g_stbb_d[l_ac].stbbud001
              FROM stfa_t
             WHERE stfaent = g_enterprise
               AND stfa001 = g_stba_m.stba010
            #add by geza 20151010(E)
            
            #add by dengdd 2015/11/4(S)
            LET g_stbb_d[l_ac].stbb024 = g_stba_m.stba013  #add by dengdd 15/11/4
            CALL astt560_stbb024_ref()
            #add by dengdd 2015/11/4(E)      
            #add by geza 20151119(S)
            #纳入结算单否和票扣否都默认为Y
            LET g_stbb_d[l_ac].stbb015 = 'Y'
            LET g_stbb_d[l_ac].stbb016 = 'Y'
            #add by geza 20151119(E)
            #end add-point
            LET g_stbb_d_t.* = g_stbb_d[l_ac].*     #新輸入資料
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt560_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt560_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbb_d[li_reproduce_target].* = g_stbb_d[li_reproduce].*
 
               LET g_stbb_d[li_reproduce_target].stbbseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stbb_t 
             WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno
 
               AND stbbseq = g_stbb_d[l_ac].stbbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stba_m.stbadocno
               LET gs_keys[2] = g_stbb_d[g_detail_idx].stbbseq
               CALL astt560_insert_b('stbb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               #mark by geza 20151202(S)
               #added by lanjj 151022 ---s---
#               IF g_stbb_d[l_ac].stbb020 = '2' OR g_stbb_d[l_ac].stbb020 = '8' OR g_stbb_d[l_ac].stbb020 = '12' OR g_stbb_d[l_ac].stbb020 = '15' OR g_stbb_d[l_ac].stbb020 = '16' OR g_stbb_d[l_ac].stbb020 = '18' OR g_stbb_d[l_ac].stbb020 = '19' OR g_stbb_d[l_ac].stbb020 = '20' OR g_stbb_d[l_ac].stbb020 = '21' THEN 
#                  LET p_wc = " stgesite = '",g_site,"' and stge002 = '",g_stba_m.stba013,"' " 
#                  CALL s_astp513_insert(p_wc,g_stba_m.stbadocdt) RETURNING l_success
#               END IF 
               #added by lanjj 151022 ---e---
               #mark by geza 20151202(E)
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stbb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt560_b_fill()
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
               LET gs_keys[01] = g_stba_m.stbadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbb_d_t.stbbseq
 
            
               #刪除同層單身
               IF NOT astt560_delete_b('stbb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt560_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt560_key_delete_b(gs_keys,'stbb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt560_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt560_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stbb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbseq
            #add-point:BEFORE FIELD stbbseq name="input.b.page1.stbbseq"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbseq
            
            #add-point:AFTER FIELD stbbseq name="input.a.page1.stbbseq"
            #此段落由子樣板a05產生
            IF  g_stba_m.stbadocno IS NOT NULL AND g_stbb_d[g_detail_idx].stbbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stba_m.stbadocno != g_stbadocno_t OR g_stbb_d[g_detail_idx].stbbseq != g_stbb_d_t.stbbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbb_t WHERE "||"stbbent = '" ||g_enterprise|| "' AND "||"stbbdocno = '"||g_stba_m.stbadocno ||"' AND "|| "stbbseq = '"||g_stbb_d[g_detail_idx].stbbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbbseq
            #add-point:ON CHANGE stbbseq name="input.g.page1.stbbseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb020
            #add-point:BEFORE FIELD stbb020 name="input.b.page1.stbb020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb020
            
            #add-point:AFTER FIELD stbb020 name="input.a.page1.stbb020"
#            IF NOT cl_null(g_stbb_d[l_ac].stbb020) THEN
#               IF g_stbb_d[l_ac].stbb020 != '2' AND g_stbb_d[l_ac].stbb020 != '8' AND g_stbb_d[l_ac].stbb020 != '12' AND g_stbb_d[l_ac].stbb020 != '13' AND g_stbb_d[l_ac].stbb020 != '15' AND g_stbb_d[l_ac].stbb020 != '16' THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = "ast-00435"
#                  LET g_errparam.extend = ""
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                 
#                  LET g_stbb_d[l_ac].stbb020 =  g_stbb_d_t.stbb020
#                  NEXT FIELD CURRENT 
#               END IF
#            END IF
            #add by dengdd 15/11/5(S)
            IF NOT cl_null(g_stbb_d[l_ac].stbb020) AND NOT cl_null(g_stbb_d[l_ac].stbb021)THEN
               SELECT COUNT(*) INTO l_cnt 
                 FROM stbb_t 
                WHERE stbbent=g_enterprise 
                  AND stbbdocno=g_stba_m.stbadocno
                  AND stbbseq<>g_stbb_d[l_ac].stbbseq
                  AND stbb020=g_stbb_d[l_ac].stbb020
                  AND stbb021=g_stbb_d[l_ac].stbb021
               IF l_cnt > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00494"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                
                  LET g_stbb_d[l_ac].stbb020 =  g_stbb_d_t.stbb020
                  NEXT FIELD CURRENT
               END IF
            END IF
            #add by dengdd 15/11/5(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb020
            #add-point:ON CHANGE stbb020 name="input.g.page1.stbb020"
            IF NOT cl_null(g_stbb_d[l_ac].stbb020) THEN
               IF g_stbb_d[l_ac].stbb020 != '2' AND g_stbb_d[l_ac].stbb020 != '8' AND g_stbb_d[l_ac].stbb020 != '12'  AND g_stbb_d[l_ac].stbb020 != '15' AND g_stbb_d[l_ac].stbb020 != '16' AND g_stbb_d[l_ac].stbb020 !='18' AND g_stbb_d[l_ac].stbb020 !='19' AND g_stbb_d[l_ac].stbb020 !='20' AND g_stbb_d[l_ac].stbb020 !='21' THEN  #add by geza 20151011 类型18,19,20,21 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00435"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                 
                  LET g_stbb_d[l_ac].stbb020 =  g_stbb_d_t.stbb020
                  NEXT FIELD CURRENT 
               END IF
               IF g_stbb_d[l_ac].stbb020 = '2' OR g_stbb_d[l_ac].stbb020 = '8' THEN
                  CALL cl_set_comp_required('stbb023',TRUE)
                  #mark by geza 20151105(S)
#                  LET g_stbb_d[l_ac].stbb024 =''
#                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb024
#                  LET g_stbb_d[l_ac].stbb024_desc =''
#                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb024_desc
                  #mark by geza 20151105(E)
               ELSE
                  CALL cl_set_comp_required('stbb023',FALSE) 
                  LET g_stbb_d[l_ac].stbb022 =''
                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb022 
                  LET g_stbb_d[l_ac].stbb023 =''
                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb023  
                  LET g_stbb_d[l_ac].stbb022_desc =''
                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb022_desc
                  LET g_stbb_d[l_ac].stbb023_desc =''
                  DISPLAY BY NAME  g_stbb_d[l_ac].stbb023_desc                     
               END IF
            END IF
            CALL astt560_set_entry_b(l_cmd)
            CALL astt560_set_no_entry_b(l_cmd)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb021
            #add-point:BEFORE FIELD stbb021 name="input.b.page1.stbb021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb021
            
            #add-point:AFTER FIELD stbb021 name="input.a.page1.stbb021"
            #add by dengdd 15/11/5(S)
            IF NOT cl_null(g_stbb_d[l_ac].stbb020) AND NOT cl_null(g_stbb_d[l_ac].stbb021)THEN
               SELECT COUNT(*) INTO l_cnt 
                 FROM stbb_t 
                WHERE stbbent=g_enterprise 
                  AND stbbdocno=g_stba_m.stbadocno
                  AND stbbseq<>g_stbb_d[l_ac].stbbseq
                  AND stbb020=g_stbb_d[l_ac].stbb020
                  AND stbb021=g_stbb_d[l_ac].stbb021
               IF l_cnt > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00494"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                
                  LET g_stbb_d[l_ac].stbb020 =  g_stbb_d_t.stbb020
                  NEXT FIELD CURRENT
               END IF
            END IF
            #add by dengdd 15/11/5(E)
            
            #add by dengdd 151201(S)
            IF NOT cl_null(g_stbb_d[l_ac].stbb021) THEN
               IF g_stbb_d[l_ac].stbb021>g_stba_m.stba020 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00304"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                  
                  NEXT FIELD CURRENT
               END IF
            END IF
            #add by dengdd 151201(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb021
            #add-point:ON CHANGE stbb021 name="input.g.page1.stbb021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb005
            #add-point:BEFORE FIELD stbb005 name="input.b.page1.stbb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb005
            
            #add-point:AFTER FIELD stbb005 name="input.a.page1.stbb005"
            IF NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
               IF NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                  IF g_stbb_d[l_ac].stbb006<g_stbb_d[l_ac].stbb005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ain-00128"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                    
                     LET g_stbb_d[l_ac].stbb005 =  g_stbb_d_t.stbb005
                     NEXT FIELD CURRENT
                  END IF
               END IF
                  #mark by liaolong   150629-00016 #14  2015/08/6  --Begin--
                  #權責發生制費用不可以跨月錄入                  
#                  IF NOT cl_null(g_stbb_d[l_ac].stbb001) AND NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
#                     LET l_stae005=''
#                     SELECT stae005 INTO l_stae005
#                       FROM stae_t
#                      WHERE staeent=g_enterprise
#                        AND stae001=g_stbb_d[l_ac].stbb001
#                        AND staestus='Y'
##                     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
##                     
##                        SELECT stfj002,stfj003 INTO l_stfj002,l_stfj003
##                         FROM stfj_t,stfa_t 
##                        WHERE stfj001 = g_stba_m.stba010
##                          AND stfjent = g_enterprise
##                          
###                        IF NOT( g_stbb_d[l_ac].stbb006>g_stbb_d[l_ac].stbb005 
###                            OR  l_stfj003 >g_stbb_d[l_ac].stbb006 > l_stfj002 
###                            OR  l_stfj003 >g_stbb_d[l_ac].stbb005 > l_stfj002) THEN
###                           INITIALIZE g_errparam TO NULL
###                           LET g_errparam.code = "ast-00084"
###                           LET g_errparam.extend = ""
###                           LET g_errparam.popup = TRUE
###                           CALL cl_err()                           
###                           LET g_stbb_d[l_ac].stbb005 = g_stbb_d_t.stbb005
###                           LET g_stbb_d[l_ac].stbb007 = g_stbb_d_t.stbb007
###                           LET g_stbb_d[l_ac].stbb008 = g_stbb_d_t.stbb008
###                           LET g_stbb_d[l_ac].stbb014 = g_stbb_d_t.stbb014
###                           NEXT FIELD CURRENT
###                        END IF   
##                     END IF
#                  END IF 
            #mark by liaolong   150629-00016 #14  2015/08/6  --End--
            END IF
            IF cl_null(g_stbb_d[l_ac].stbb005) THEN
                LET g_stbb_d[l_ac].stbb007 = ''
                LET g_stbb_d[l_ac].stbb008 = ''
                LET g_stbb_d[l_ac].stbb014 = ''
                DISPLAY g_stbb_d[l_ac].stbb007 TO stbb007
                DISPLAY g_stbb_d[l_ac].stbb008 TO stbb008
                DISPLAY g_stbb_d[l_ac].stbb014 TO stbb014
             
            END IF 
            IF NOT cl_null(g_stbb_d[l_ac].stbb006) AND NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
               CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt560')
               RETURNING r_success,r_stau004,r_period,r_period2
               LET g_stbb_d[l_ac].stbb007 = r_stau004
               LET g_stbb_d[l_ac].stbb008 = r_period
               LET g_stbb_d[l_ac].stbb014 = r_period2
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb005
            #add-point:ON CHANGE stbb005 name="input.g.page1.stbb005"
 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb006
            #add-point:BEFORE FIELD stbb006 name="input.b.page1.stbb006"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb006
            
            #add-point:AFTER FIELD stbb006 name="input.a.page1.stbb006"
            IF NOT cl_null(g_stbb_d[l_ac].stbb006) THEN               
               IF NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
                  IF g_stbb_d[l_ac].stbb006<g_stbb_d[l_ac].stbb005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ain-00128"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                    
                     LET g_stbb_d[l_ac].stbb006 =  g_stbb_d_t.stbb006
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF      
            IF cl_null(g_stbb_d[l_ac].stbb006) THEN
                LET g_stbb_d[l_ac].stbb007 = ''
                LET g_stbb_d[l_ac].stbb008 = ''
                LET g_stbb_d[l_ac].stbb014 = ''
                DISPLAY g_stbb_d[l_ac].stbb007 TO stbb007
                DISPLAY g_stbb_d[l_ac].stbb008 TO stbb008
                DISPLAY g_stbb_d[l_ac].stbb014 TO stbb014
             
            END IF 
            IF NOT cl_null(g_stbb_d[l_ac].stbb006) AND NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
               CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt560')
               RETURNING r_success,r_stau004,r_period,r_period2
               LET g_stbb_d[l_ac].stbb007 = r_stau004
               LET g_stbb_d[l_ac].stbb008 = r_period
               LET g_stbb_d[l_ac].stbb014 = r_period2
            END IF
            #END add-point            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb006
            #add-point:ON CHANGE stbb006 name="input.g.page1.stbb006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb022
            
            #add-point:AFTER FIELD stbb022 name="input.a.page1.stbb022"
 IF NOT cl_null(g_stbb_d[l_ac].stbb022) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb022

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_imaa001") THEN
                  #檢查成功時後續處理
                  #add by geza 20150907(S)
                  #商品属于单头专柜
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt 
                    FROM rtei_t 
                   WHERE rtei004 = g_stba_m.stba013
                     AND rtei002 = g_stbb_d[l_ac].stbb022
                     AND rteient = g_enterprise 
                  IF l_cnt < 1 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00450"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                          
                     NEXT FIELD CURRENT
                  END IF
                  #add by geza 20150907(E)
                  #商品属于当前库区
                  IF NOT cl_null(g_stbb_d[l_ac].stbb023) THEN 
                     #
                     LET l_cnt = 0
                     SELECT COUNT(*) INTO l_cnt 
                       FROM rtei_t 
                      WHERE rtei001 = g_stbb_d[l_ac].stbb023
                        AND rtei002 = g_stbb_d[l_ac].stbb022
                        AND rteient = g_enterprise 
                     IF l_cnt < 1 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00438"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()                          
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb022
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb022_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb022_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb022
            #add-point:BEFORE FIELD stbb022 name="input.b.page1.stbb022"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb022
            #add-point:ON CHANGE stbb022 name="input.g.page1.stbb022"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb023
            
            #add-point:AFTER FIELD stbb023 name="input.a.page1.stbb023"
            IF NOT cl_null(g_stbb_d[l_ac].stbb023) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_site
               LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb023
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
               #160318-00025#22  by 07900 --add-end    
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_inaa001") THEN
                  #檢查成功時後續處理
                  #add by geza 20150907(S)
                  #库区属于单头专柜
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt 
                    FROM rtei_t 
                   WHERE rtei004 = g_stba_m.stba013
                     AND rtei001 = g_stbb_d[l_ac].stbb023
                     AND rteient = g_enterprise 
                  IF l_cnt < 1 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00451"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                          
                     NEXT FIELD CURRENT
                  END IF
                  #add by geza 20150907(E)
                  #商品属于当前库区
                  IF NOT cl_null(g_stbb_d[l_ac].stbb022) THEN 
                     LET l_cnt = 0
                     SELECT COUNT(*) INTO l_cnt 
                       FROM rtei_t 
                      WHERE rtei001 = g_stbb_d[l_ac].stbb023
                        AND rtei002 = g_stbb_d[l_ac].stbb022
                        AND rteient = g_enterprise 
                     IF l_cnt < 1 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ast-00438"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()                          
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb023
            CALL ap_ref_array2(g_ref_fields,"SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb023_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb023_desc
            CALL astt560_stbb023_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb023
            #add-point:BEFORE FIELD stbb023 name="input.b.page1.stbb023"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb023
            #add-point:ON CHANGE stbb023 name="input.g.page1.stbb023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb024
            
            #add-point:AFTER FIELD stbb024 name="input.a.page1.stbb024"
             IF NOT cl_null(g_stbb_d[l_ac].stbb024) THEN 
               #應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               #mark by geza 20151204(S)
#               INITIALIZE g_chkparam.* TO NULL
#
#               #設定g_chkparam.*的參數
#               LET g_chkparam.arg1 = g_site
#               LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb024
#                  
#               #呼叫檢查存在並帶值的library
#               IF cl_chk_exist("v_mhae001_1") THEN
#                  #檢查成功時後續處理
               #mark by geza 20151204(E)   
                  #add by geza 20150907(S)
                  #专柜编号等于单头专柜
                  IF g_stbb_d[l_ac].stbb024  != g_stba_m.stba013 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00452"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                          
                     NEXT FIELD CURRENT
                  END IF
                  #add by geza 20150907(E)     
               #mark by geza 20151204(S)                     
#               ELSE
#                  #檢查失敗時後續處理
#                  NEXT FIELD CURRENT
#               END IF
               #mark by geza 20151204(E)

            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb024
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb024_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb024_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb024
            #add-point:BEFORE FIELD stbb024 name="input.b.page1.stbb024"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb024
            #add-point:ON CHANGE stbb024 name="input.g.page1.stbb024"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb011
            
            #add-point:AFTER FIELD stbb011 name="input.a.page1.stbb011"
            IF NOT cl_null(g_stbb_d[l_ac].stbb011) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb011<>g_stbb_d_t.stbb011)) THEN
                  INITIALIZE g_chkparam.* TO NULL               
                  LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb011
                  LET g_chkparam.arg2 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')  
                  #160318-00025#22  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗                   
                  LET g_chkparam.err_str[1] ="ast-00215:sub-01302|arti202|",cl_get_progname("arti202",g_lang,"2"),"|:EXEPROGarti202"
                   #160318-00025#22  by 07900 --add-end 
                  IF NOT cl_chk_exist("v_rtax001_2") THEN
                     LET g_stbb_d[l_ac].stbb011 =  g_stbb_d_t.stbb011
                     NEXT FIELD CURRENT
                  END IF              
               END IF
            END IF
            CALL astt560_stbb011_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb011
            #add-point:BEFORE FIELD stbb011 name="input.b.page1.stbb011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb011
            #add-point:ON CHANGE stbb011 name="input.g.page1.stbb011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb012
            
            #add-point:AFTER FIELD stbb012 name="input.a.page1.stbb012"
            IF NOT cl_null(g_stbb_d[l_ac].stbb012) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb012<>g_stbb_d_t.stbb012)) THEN
                  INITIALIZE g_chkparam.* TO NULL               
                  LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb012
                  IF NOT cl_chk_exist("v_ooeg001_1") THEN
                     LET g_stbb_d[l_ac].stbb012 =  g_stbb_d_t.stbb012
                     NEXT FIELD CURRENT
                  END IF              
               END IF
            END IF
            CALL astt560_stbb012_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb012
            #add-point:BEFORE FIELD stbb012 name="input.b.page1.stbb012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb012
            #add-point:ON CHANGE stbb012 name="input.g.page1.stbb012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbud001
            #add-point:BEFORE FIELD stbbud001 name="input.b.page1.stbbud001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbud001
            
            #add-point:AFTER FIELD stbbud001 name="input.a.page1.stbbud001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbbud001
            #add-point:ON CHANGE stbbud001 name="input.g.page1.stbbud001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb001
            
            #add-point:AFTER FIELD stbb001 name="input.a.page1.stbb001"
            IF NOT cl_null(g_stbb_d[l_ac].stbb001) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb001<>g_stbb_d_t.stbb001)) THEN   #160824-00007#193 161120 by lori mark
               IF g_stbb_d[l_ac].stbb001 <> g_stbb_d_o.stbb001 OR cl_null(g_stbb_d_o.stbb001) THEN     #160824-00007#193 161120 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb001
                  IF NOT cl_chk_exist("v_stae001") THEN
                     LET g_stbb_d[l_ac].stbb001 = g_stbb_d_o.stbb001   #160824-00007#193 161120 by lori mod:g_stbb_d_t.stbb001->g_stbb_d_o.stbb001
                     NEXT FIELD CURRENT
                  END IF
                  
                  CALL astt560_stbb001_other()   #含舊值備份
                  #mark by liaolong   150629-00016 #14  2015/08/6  --Begin--
                  ##權責發生制費用不可以跨月錄入                  
                  # IF NOT cl_null(g_stbb_d[l_ac].stbb001) AND NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                  #    LET l_stae005=''
                  #    SELECT stae005 INTO l_stae005
                  #      FROM stae_t
                  #     WHERE staeent=g_enterprise
                  #       AND stae001=g_stbb_d[l_ac].stbb001
                  #       AND staestus='Y'
                  #     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN                   
                  #         IF YEAR(g_stbb_d[l_ac].stbb006)-YEAR(g_stbb_d[l_ac].stbb005)>0 OR MONTH(g_stbb_d[l_ac].stbb006)-MONTH(g_stbb_d[l_ac].stbb005)>0 THEN
                  #            INITIALIZE g_errparam TO NULL
                  #            LET g_errparam.code = "ast-00084"
                  #            LET g_errparam.extend = ""
                  #            LET g_errparam.popup = TRUE
                  #            CALL cl_err()                          
                  #            LET g_stbb_d[l_ac].stbb006 = g_stbb_d_t.stbb006
                  #            LET g_stbb_d[l_ac].stbb001 = g_stbb_d_t.stbb001
                  #            LET g_stbb_d[l_ac].stbb004 = g_stbb_d_t.stbb004
                  #            LET g_stbb_d[l_ac].stbb007 = g_stbb_d_t.stbb007
                  #            LET g_stbb_d[l_ac].stbb008 = g_stbb_d_t.stbb008
                  #            LET g_stbb_d[l_ac].stbb014 = g_stbb_d_t.stbb014
                  #            NEXT FIELD CURRENT
                  #         END IF   
                  #     END IF
                  # END IF 
                  #mark by liaolong   150629-00016 #14  2015/08/6  --End--
               END IF
               
               #判断价格类型的栏位开启与关闭
               SELECT stae006 
                 INTO l_stae006
                 FROM stae_t
                WHERE staeent = g_enterprise 
                  AND stae001 = g_stbb_d[l_ac].stbb001 
               IF l_stae006 = '1' OR l_stae006 = '2' THEN
                  CALL cl_set_comp_entry('stbb004',FALSE)
               ELSE 
                  CALL cl_set_comp_entry('stbb004',TRUE)               
               END IF 
            END IF             
            #add by geza 20150610(S)
            CALL astt560_set_entry_b(l_cmd)
            CALL astt560_set_no_entry_b(l_cmd)
            #add by geza 20150610(E)
            
            LET g_stbb_d_o.stbb001 = g_stbb_d[l_ac].stbb001   #160824-00007#193 161120 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb001
            #add-point:BEFORE FIELD stbb001 name="input.b.page1.stbb001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb001
            #add-point:ON CHANGE stbb001 name="input.g.page1.stbb001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb004
            #add-point:BEFORE FIELD stbb004 name="input.b.page1.stbb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb004
            
            #add-point:AFTER FIELD stbb004 name="input.a.page1.stbb004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb004
            #add-point:ON CHANGE stbb004 name="input.g.page1.stbb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb025
            #add-point:BEFORE FIELD stbb025 name="input.b.page1.stbb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb025
            
            #add-point:AFTER FIELD stbb025 name="input.a.page1.stbb025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb025
            #add-point:ON CHANGE stbb025 name="input.g.page1.stbb025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb026
            #add-point:BEFORE FIELD stbb026 name="input.b.page1.stbb026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb026
            
            #add-point:AFTER FIELD stbb026 name="input.a.page1.stbb026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb026
            #add-point:ON CHANGE stbb026 name="input.g.page1.stbb026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb027
            #add-point:BEFORE FIELD stbb027 name="input.b.page1.stbb027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb027
            
            #add-point:AFTER FIELD stbb027 name="input.a.page1.stbb027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb027
            #add-point:ON CHANGE stbb027 name="input.g.page1.stbb027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb028
            #add-point:BEFORE FIELD stbb028 name="input.b.page1.stbb028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb028
            
            #add-point:AFTER FIELD stbb028 name="input.a.page1.stbb028"
            IF NOT cl_null(g_stbb_d[l_ac].stbb028) THEN
               IF g_stbb_d[l_ac].stbb028 <> g_stbb_d_o.stbb028 OR cl_null(g_stbb_d_o.stbb028) THEN   #160824-00007#193 161120 by lori add
                  IF g_stbb_d[l_ac].stbb028 = 0  THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "axr-00047"
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err() 
                     LET g_stbb_d[l_ac].stbb028 = g_stbb_d_o.stbb028    #160824-00007#193 161120 by lori mod:g_stbb_d_t.stbb028->g_stbb_d_o.stbb028             
                     NEXT FIELD CURRENT               
                  END IF
                  IF g_stbb_d[l_ac].stbb020 != '19' THEN
                     LET g_stbb_d[l_ac].stbb009 = g_stbb_d[l_ac].stbb028 * -1 #add BY geza 20151010
                  END IF
               END IF   #160824-00007#193 161120 by lori add   
            END IF
            
            LET g_stbb_d_o.stbb028 = g_stbb_d[l_ac].stbb028   #160824-00007#193 161120 by lori add   
            LET g_stbb_d_o.stbb009 = g_stbb_d[l_ac].stbb009   #160824-00007#193 161120 by lori add   
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb028
            #add-point:ON CHANGE stbb028 name="input.g.page1.stbb028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb009
            #add-point:BEFORE FIELD stbb009 name="input.b.page1.stbb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb009
            
            #add-point:AFTER FIELD stbb009 name="input.a.page1.stbb009"
            IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
               #160824-00007#193 161120 by lori mark---(S)
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb009<>g_stbb_d_t.stbb009)) THEN                  
               #END IF
               #160824-00007#193 161120 by lori mark---(E)
               
               IF g_stbb_d[l_ac].stbb009 <> g_stbb_d_o.stbb009 OR cl_null(g_stbb_d_o.stbb009) THEN   #160824-00007#193 161120 by lori add
                  #add by geza 20151010(S)
                  #mark by dengdd 2015/11/5(S)
                  #IF g_stbb_d[l_ac].stbb009 = 0  THEN 
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = "axr-00047"
                  #   LET g_errparam.extend = ""
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err() 
                  #   LET  g_stbb_d[l_ac].stbb009 = g_stbb_d_t.stbb009                  
                  #   NEXT FIELD CURRENT               
                  #END IF
                  #mark by dengdd 2015/11/5(E)
                  IF g_stbb_d[l_ac].stbb020 != '19' THEN
                     LET g_stbb_d[l_ac].stbb028 = g_stbb_d[l_ac].stbb009 * -1
                  END IF
                  #add by geza 20151010(S)
               END IF   #160824-00007#193 161120 by lori add   
            END IF
            
            LET g_stbb_d_o.stbb009 = g_stbb_d[l_ac].stbb009   #160824-00007#193 161120 by lori add
            LET g_stbb_d_o.stbb028 = g_stbb_d[l_ac].stbb028   #160824-00007#193 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb009
            #add-point:ON CHANGE stbb009 name="input.g.page1.stbb009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb017
            #add-point:BEFORE FIELD stbb017 name="input.b.page1.stbb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb017
            
            #add-point:AFTER FIELD stbb017 name="input.a.page1.stbb017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb017
            #add-point:ON CHANGE stbb017 name="input.g.page1.stbb017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb002
            
            #add-point:AFTER FIELD stbb002 name="input.a.page1.stbb002"
            IF NOT cl_null(g_stbb_d[l_ac].stbb002) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb002<>g_stbb_d_t.stbb002)) THEN   #160824-00007#193 161120 by lori mark
               IF g_stbb_d[l_ac].stbb002 <> g_stbb_d_o.stbb002 OR cl_null( g_stbb_d_o.stbb002) THEN    #160824-00007#193 161120 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb002   
                  #160318-00025#22  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗                   
                  LET g_chkparam.err_str[1] ="aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                  #160318-00025#22  by 07900 --add-end                   
                  IF NOT cl_chk_exist("v_ooaj002") THEN
                     LET g_stbb_d[l_ac].stbb002 = g_stbb_d_o.stbb002   #160824-00007#193 161120 by lori mod:g_stbb_d_t.stbb002->g_stbb_d_o.stbb002
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
                     CALL s_curr_round('',g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb009,'2') RETURNING g_stbb_d[l_ac].stbb009 
                  END IF                   
               END IF
            END IF
            DISPLAY g_stbb_d[l_ac].stbb009 TO stbb009   
            CALL astt560_stbb002_ref()
            
            LET g_stbb_d_o.stbb002 = g_stbb_d[l_ac].stbb002   #160824-00007#193 161120 by lori add
            LET g_stbb_d_o.stbb009 = g_stbb_d[l_ac].stbb009   #160824-00007#193 161120 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb002
            #add-point:BEFORE FIELD stbb002 name="input.b.page1.stbb002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb002
            #add-point:ON CHANGE stbb002 name="input.g.page1.stbb002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb003
            #add-point:BEFORE FIELD stbb003 name="input.b.page1.stbb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb003
            
            #add-point:AFTER FIELD stbb003 name="input.a.page1.stbb003"
            IF NOT cl_null(g_stbb_d[l_ac].stbb003) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb003<>g_stbb_d_t.stbb003)) THEN
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數 
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb003  
                  #160318-00025#22  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗                   
                  LET g_chkparam.err_str[1] ="aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
                  #160318-00025#22  by 07900 --add-end                   
                  IF NOT cl_chk_exist("v_oodb002") THEN
                     LET g_stbb_d[l_ac].stbb003 =  g_stbb_d_t.stbb003
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb003
            #add-point:ON CHANGE stbb003 name="input.g.page1.stbb003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb007
            #add-point:BEFORE FIELD stbb007 name="input.b.page1.stbb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb007
            
            #add-point:AFTER FIELD stbb007 name="input.a.page1.stbb007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb007
            #add-point:ON CHANGE stbb007 name="input.g.page1.stbb007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb008
            #add-point:BEFORE FIELD stbb008 name="input.b.page1.stbb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb008
            
            #add-point:AFTER FIELD stbb008 name="input.a.page1.stbb008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb008
            #add-point:ON CHANGE stbb008 name="input.g.page1.stbb008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb014
            #add-point:BEFORE FIELD stbb014 name="input.b.page1.stbb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb014
            
            #add-point:AFTER FIELD stbb014 name="input.a.page1.stbb014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb014
            #add-point:ON CHANGE stbb014 name="input.g.page1.stbb014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb015
            #add-point:BEFORE FIELD stbb015 name="input.b.page1.stbb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb015
            
            #add-point:AFTER FIELD stbb015 name="input.a.page1.stbb015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb015
            #add-point:ON CHANGE stbb015 name="input.g.page1.stbb015"
            #add by geza 20150610(S)
            IF g_stbb_d[l_ac].stbb015 = 'N' THEN
               LET g_stbb_d[l_ac].stbb016 = 'N'
            END IF
            CALL astt560_set_entry_b(l_cmd)
            CALL astt560_set_no_entry_b(l_cmd)
            #add by geza 20150610(E)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb016
            #add-point:BEFORE FIELD stbb016 name="input.b.page1.stbb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb016
            
            #add-point:AFTER FIELD stbb016 name="input.a.page1.stbb016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb016
            #add-point:ON CHANGE stbb016 name="input.g.page1.stbb016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb018
            #add-point:BEFORE FIELD stbb018 name="input.b.page1.stbb018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb018
            
            #add-point:AFTER FIELD stbb018 name="input.a.page1.stbb018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb018
            #add-point:ON CHANGE stbb018 name="input.g.page1.stbb018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbsite
            #add-point:BEFORE FIELD stbbsite name="input.b.page1.stbbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbsite
            
            #add-point:AFTER FIELD stbbsite name="input.a.page1.stbbsite"
            IF NOT cl_null(g_stbb_d[l_ac].stbbsite) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbbsite<>g_stbb_d_t.stbbsite)) THEN
                  CALL s_aooi500_chk(g_prog,'stbbsite',g_stbb_d[l_ac].stbbsite,g_stba_m.stbasite)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stbb_d[l_ac].stbbsite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stbb_d[l_ac].stbbsite=g_stbb_d_t.stbbsite
                     NEXT FIELD CURRENT
                  END IF       
               END IF  
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbbsite
            #add-point:ON CHANGE stbbsite name="input.g.page1.stbbsite"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbseq
            #add-point:ON ACTION controlp INFIELD stbbseq name="input.c.page1.stbbseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb020
            #add-point:ON ACTION controlp INFIELD stbb020 name="input.c.page1.stbb020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb021
            #add-point:ON ACTION controlp INFIELD stbb021 name="input.c.page1.stbb021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb005
            #add-point:ON ACTION controlp INFIELD stbb005 name="input.c.page1.stbb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb006
            #add-point:ON ACTION controlp INFIELD stbb006 name="input.c.page1.stbb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb022
            #add-point:ON ACTION controlp INFIELD stbb022 name="input.c.page1.stbb022"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb022             #給予default值

            #給予arg
            LET g_qryparam.where = "  EXISTS (SELECT 1 FROM rtei_t WHERE rteient = ",g_enterprise," AND rtei002 = imaa001 AND rtei004 = '",g_stba_m.stba013,"') "  #add by geza 20150907
            IF g_stbb_d[l_ac].stbb023 IS NOT NULL THEN
               LET g_qryparam.where = g_qryparam.where ," AND EXISTS (SELECT 1 FROM rtei_t WHERE rteient = ",g_enterprise," AND rtei002 = imaa001 AND rtei001 = '",g_stbb_d[l_ac].stbb023,"') " #s
            END IF

            CALL q_imaa001_15()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb022 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb022 TO stbb022              #

            NEXT FIELD stbb022                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb023
            #add-point:ON ACTION controlp INFIELD stbb023 name="input.c.page1.stbb023"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb023             #給予default值

            #給予arg
            LET g_qryparam.where = "  EXISTS (SELECT 1 FROM rtei_t WHERE rteient = ",g_enterprise," AND rtei001 = inaa001 AND rtei004 = '",g_stba_m.stba013,"') "  #add by geza 20150907
            IF g_stbb_d[l_ac].stbb022 IS NOT NULL THEN
               LET g_qryparam.where = g_qryparam.where, " AND EXISTS (SELECT 1 FROM rtei_t WHERE rteient = ",g_enterprise," AND rtei001 = inaa001 AND rtei002 = '",g_stbb_d[l_ac].stbb022,"') " #s
            END IF

            CALL q_inaa001_1()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb023 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb023 TO stbb023              #
            CALL astt560_stbb023_ref()
            NEXT FIELD stbb023                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb024
            #add-point:ON ACTION controlp INFIELD stbb024 name="input.c.page1.stbb024"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb024            #給予default值
            LET g_qryparam.default2 = "" #g_stba_m.mhael023 #简称
            #給予arg
            LET g_qryparam.arg1 = g_site #s
            LET g_qryparam.where = " mhae001 = '",g_stba_m.stba013,"'"   #add by geza 20150907
            CALL q_mhae001()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb024 = g_qryparam.return1              
            #LET g_stba_m.mhael023 = g_qryparam.return2 
            DISPLAY g_stbb_d[l_ac].stbb024 TO stbb024              #
            CALL astt560_stbb024_ref()
            NEXT FIELD stbb024 
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb011
            #add-point:ON ACTION controlp INFIELD stbb011 name="input.c.page1.stbb011"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb011             #給予default值

            #給予arg
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')


            CALL q_rtax001_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb011 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb011 TO stbb011              #

            NEXT FIELD stbb011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb012
            #add-point:ON ACTION controlp INFIELD stbb012 name="input.c.page1.stbb012"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_ooeg001_9()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb012 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb012 TO stbb012              #

            NEXT FIELD stbb012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbbud001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbud001
            #add-point:ON ACTION controlp INFIELD stbbud001 name="input.c.page1.stbbud001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb001
            #add-point:ON ACTION controlp INFIELD stbb001 name="input.c.page1.stbb001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb001             #給予default值
            LET g_qryparam.default2 = "" #g_stbb_d[l_ac].stael004 #助記碼
            LET g_qryparam.default3 = "" #g_stbb_d[l_ac].stael003 #說明
            
            CALL q_stae001()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb001 = g_qryparam.return1              
            #LET g_stbb_d[l_ac].stael004 = g_qryparam.return2 
            #LET g_stbb_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stbb_d[l_ac].stbb001 TO stbb001              #
            #DISPLAY g_stbb_d[l_ac].stael004 TO stael004 #助記碼
            #DISPLAY g_stbb_d[l_ac].stael003 TO stael003 #說明
            CALL astt560_stbb001_other()                #含舊值備份       
            NEXT FIELD stbb001                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb004
            #add-point:ON ACTION controlp INFIELD stbb004 name="input.c.page1.stbb004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb025
            #add-point:ON ACTION controlp INFIELD stbb025 name="input.c.page1.stbb025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb026
            #add-point:ON ACTION controlp INFIELD stbb026 name="input.c.page1.stbb026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb027
            #add-point:ON ACTION controlp INFIELD stbb027 name="input.c.page1.stbb027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb028
            #add-point:ON ACTION controlp INFIELD stbb028 name="input.c.page1.stbb028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb009
            #add-point:ON ACTION controlp INFIELD stbb009 name="input.c.page1.stbb009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb017
            #add-point:ON ACTION controlp INFIELD stbb017 name="input.c.page1.stbb017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb002
            #add-point:ON ACTION controlp INFIELD stbb002 name="input.c.page1.stbb002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb002             #給予default值

            #給予arg
            LET g_qryparam.arg1 =g_site #

            
            CALL q_ooaj002_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb002 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb002
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb002_desc
            DISPLAY g_stbb_d[l_ac].stbb002 TO stbb002              #

            NEXT FIELD stbb002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb003
            #add-point:ON ACTION controlp INFIELD stbb003 name="input.c.page1.stbb003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site

            
            CALL q_oodb002_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb003 = g_qryparam.return1              
            
            DISPLAY g_stbb_d[l_ac].stbb003 TO stbb003              #

            NEXT FIELD stbb003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb007
            #add-point:ON ACTION controlp INFIELD stbb007 name="input.c.page1.stbb007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb008
            #add-point:ON ACTION controlp INFIELD stbb008 name="input.c.page1.stbb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb014
            #add-point:ON ACTION controlp INFIELD stbb014 name="input.c.page1.stbb014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb015
            #add-point:ON ACTION controlp INFIELD stbb015 name="input.c.page1.stbb015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb016
            #add-point:ON ACTION controlp INFIELD stbb016 name="input.c.page1.stbb016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb018
            #add-point:ON ACTION controlp INFIELD stbb018 name="input.c.page1.stbb018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbsite
            #add-point:ON ACTION controlp INFIELD stbbsite name="input.c.page1.stbbsite"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbbsite           #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbbsite',g_stba_m.stbasite,'i') #150308-00001#5  By geza add 'i'
            CALL q_ooef001_24()

            LET g_stbb_d[l_ac].stbbsite = g_qryparam.return1              
                         
            #LET g_stbb_d[l_ac].ooefl003 = g_qryparam.return2 
            
            NEXT FIELD stbbsite                          #返回原欄位


            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbb_d[l_ac].* = g_stbb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt560_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbb_d[l_ac].stbbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbb_d[l_ac].* = g_stbb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt560_stbb_t_mask_restore('restore_mask_o')
      
               UPDATE stbb_t SET (stbbdocno,stbbseq,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023, 
                   stbb024,stbb011,stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028, 
                   stbb009,stbb017,stbb002,stbb003,stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite) = (g_stba_m.stbadocno, 
                   g_stbb_d[l_ac].stbbseq,g_stbb_d[l_ac].stbb020,g_stbb_d[l_ac].stbb021,g_stbb_d[l_ac].stbb005, 
                   g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbb022,g_stbb_d[l_ac].stbb023,g_stbb_d[l_ac].stbb024, 
                   g_stbb_d[l_ac].stbb011,g_stbb_d[l_ac].stbb012,g_stbb_d[l_ac].stbbud001,g_stbb_d[l_ac].stbb001, 
                   g_stbb_d[l_ac].stbb004,g_stbb_d[l_ac].stbb025,g_stbb_d[l_ac].stbb026,g_stbb_d[l_ac].stbb027, 
                   g_stbb_d[l_ac].stbb028,g_stbb_d[l_ac].stbb009,g_stbb_d[l_ac].stbb017,g_stbb_d[l_ac].stbb002, 
                   g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb007,g_stbb_d[l_ac].stbb008,g_stbb_d[l_ac].stbb014, 
                   g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016,g_stbb_d[l_ac].stbb018,g_stbb_d[l_ac].stbbsite) 
 
                WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno 
 
                  AND stbbseq = g_stbb_d_t.stbbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbb_d[l_ac].* = g_stbb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbb_d[l_ac].* = g_stbb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stba_m.stbadocno
               LET gs_keys_bak[1] = g_stbadocno_t
               LET gs_keys[2] = g_stbb_d[g_detail_idx].stbbseq
               LET gs_keys_bak[2] = g_stbb_d_t.stbbseq
               CALL astt560_update_b('stbb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt560_stbb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stbb_d[g_detail_idx].stbbseq = g_stbb_d_t.stbbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stba_m.stbadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stbb_d_t.stbbseq
 
                  CALL astt560_key_update_b(gs_keys,'stbb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stba_m),util.JSON.stringify(g_stbb_d_t)
               LET g_log2 = util.JSON.stringify(g_stba_m),util.JSON.stringify(g_stbb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            #汇总单身本次成本金额合计
            INITIALIZE l_stba021 TO NULL
            SELECT SUM(stbb028) INTO l_stba021
              FROM stbb_t
             WHERE stbbent = g_enterprise
               AND stbbdocno = g_stba_m.stbadocno  
            IF l_stba021 IS NOT NULL THEN  
               UPDATE stba_t SET stba021 = l_stba021  
                WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_stba_m.stbadocno 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  LET g_stbb_d[l_ac].* = g_stbb_d_t.* 
               END IF
            END IF 
                       
            SELECT stba021 INTO  g_stba_m.stba021
              FROM stba_t 
             WHERE stbaent = g_enterprise
               AND stbadocno = g_stba_m.stbadocno 
            DISPLAY BY NAME  g_stba_m.stba021  
            
             
            #end add-point
            CALL astt560_unlock_b("stbb_t","'1'")
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
               LET g_stbb_d[li_reproduce_target].* = g_stbb_d[li_reproduce].*
 
               LET g_stbb_d[li_reproduce_target].stbbseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt560.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stbaunit
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbbseq
 
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
            NEXT FIELD stbadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbbseq
 
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
 
{<section id="astt560.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt560_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019 LIKE ooef_t.ooef019
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
 

   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt560_b_fill() #單身填充
      CALL astt560_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt560_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL astt560_stba005_ref()

   CALL s_desc_get_department_desc(g_stba_m.stba001) RETURNING g_stba_m.stba001_desc
   DISPLAY BY NAME g_stba_m.stba001_desc   
  
   #end add-point
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt560_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stba_m.stbasite,g_stba_m.stbasite_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014, 
       g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010, 
       g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc, 
       g_stba_m.stba004,g_stba_m.stba004_desc,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba001_desc, 
       g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017,g_stba_m.stba018, 
       g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009, 
       g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc, 
       g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt, 
       g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc, 
       g_stba_m.stbacnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
   FOR l_ac = 1 TO g_stbb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
               
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
  
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt560_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt560_detail_show()
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
 
{<section id="astt560.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt560_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stba_t.stbadocno 
   DEFINE l_oldno     LIKE stba_t.stbadocno 
 
   DEFINE l_master    RECORD LIKE stba_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stbb_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE r_insert       LIKE type_t.num5
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
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stbadocno_t = g_stba_m.stbadocno
 
    
   LET g_stba_m.stbadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stba_m.stbaownid = g_user
      LET g_stba_m.stbaowndp = g_dept
      LET g_stba_m.stbacrtid = g_user
      LET g_stba_m.stbacrtdp = g_dept 
      LET g_stba_m.stbacrtdt = cl_get_current()
      LET g_stba_m.stbamodid = g_user
      LET g_stba_m.stbamoddt = cl_get_current()
      LET g_stba_m.stbastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
      LET g_stba_m.stbacnfid = ""
      LET g_stba_m.stbacnfdt = ""
#      LET g_stba_m.stbaunit=g_site
      LET r_insert=TRUE
      #CALL s_aooi500_default(g_prog,'stbaunit',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbaunit   #161024-00025#3 mark
      CALL s_aooi500_default(g_prog,'stbasite',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbasite   #161024-00025#3 add
      IF NOT r_insert THEN
         RETURN 
      END IF

      CALL s_aooi500_default(g_prog,'stba001',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stba001
      IF NOT r_insert THEN
         RETURN 
      END IF
      #LET g_stba_m.stbasite=g_site      #161024-00025#3 mark
      LET g_stba_m.stbaunit=g_stba_m.stbasite    #161024-00025#3 add
      LET g_stba_m.stbadocdt=g_today
      LET g_stba_m.stba008=g_user
      LET g_stba_m.stba009=g_dept
      LET g_stba_m.stbastus='N'
      
      SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stbaunit
         AND ooefl002=g_dlang  
         
      SELECT oofa011 INTO g_stba_m.stba008_desc
        FROM oofa_t
       WHERE oofa002='2'
         AND oofa003=g_stba_m.stba008
         AND oofaent=g_enterprise  #160905-00007#17 add
         
      SELECT ooefl003 INTO g_stba_m.stba009_desc
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stba009
         AND ooefl002=g_dlang        
         
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaunit
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaunit_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaunit_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stba001
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stba001_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stba001_desc
      
     INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbaownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbamodid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbamodid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbamodid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacnfid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacnfid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacnfid_desc  
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
   
   
   CALL astt560_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stba_m.* TO NULL
      INITIALIZE g_stbb_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt560_show()
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
   CALL astt560_set_act_visible()   
   CALL astt560_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt560_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt560_idx_chk()
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #功能已完成,通報訊息中心
   CALL astt560_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt560_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stbb_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt560_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbb_t
    WHERE stbbent = g_enterprise AND stbbdocno = g_stbadocno_t
 
    INTO TEMP astt560_detail
 
   #將key修正為調整後   
   UPDATE astt560_detail 
      #更新key欄位
      SET stbbdocno = g_stba_m.stbadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stbb_t SELECT * FROM astt560_detail
   
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
   DROP TABLE astt560_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt560_delete()
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
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt560_cl USING g_enterprise,g_stba_m.stbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt560_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt560_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt560_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   CALL astt560_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      #更新astq501的资料
      UPDATE stga_t SET stga016='',stga017='',stga015='N'
       WHERE stgaent=g_enterprise
         AND stga016=g_stba_m.stbadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stba_m.stbadocno 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt560_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stbadocno_t = g_stba_m.stbadocno
 
 
      DELETE FROM stba_t
       WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stba_m.stbadocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stbb_t
       WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stba_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt560_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stbb_d.clear() 
 
     
      CALL astt560_ui_browser_refresh()  
      #CALL astt560_ui_headershow()  
      #CALL astt560_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt560_browser_fill("")
         CALL astt560_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt560_cl
 
   #功能已完成,通報訊息中心
   CALL astt560_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt560.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt560_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_stbb025             LIKE stbb_t.stbb025
   DEFINE l_stbb026             LIKE stbb_t.stbb026

   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stbb_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
 
   #end add-point
   
   #判斷是否填充
   IF astt560_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbbseq,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023,stbb024, 
             stbb011,stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028,stbb009,stbb017, 
             stbb002,stbb003,stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite ,t1.imaal003 , 
             t2.inayl003 ,t4.rtaxl003 ,t5.ooefl003 ,t6.stael003 ,t7.ooail003 FROM stbb_t",   
                     " INNER JOIN stba_t ON stbaent = " ||g_enterprise|| " AND stbadocno = stbbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=stbb022 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inayl_t t2 ON t2.inaylent="||g_enterprise||" AND t2.inayl001=stbb023 AND t2.inayl002='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=stbb011 AND t4.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=stbb012 AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t6 ON t6.staelent="||g_enterprise||" AND t6.stael001=stbb001 AND t6.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t7 ON t7.ooailent="||g_enterprise||" AND t7.ooail001=stbb002 AND t7.ooail002='"||g_dlang||"' ",
 
                     " WHERE stbbent=? AND stbbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbb_t.stbbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt560_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt560_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stba_m.stbadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stba_m.stbadocno INTO g_stbb_d[l_ac].stbbseq,g_stbb_d[l_ac].stbb020, 
          g_stbb_d[l_ac].stbb021,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbb022, 
          g_stbb_d[l_ac].stbb023,g_stbb_d[l_ac].stbb024,g_stbb_d[l_ac].stbb011,g_stbb_d[l_ac].stbb012, 
          g_stbb_d[l_ac].stbbud001,g_stbb_d[l_ac].stbb001,g_stbb_d[l_ac].stbb004,g_stbb_d[l_ac].stbb025, 
          g_stbb_d[l_ac].stbb026,g_stbb_d[l_ac].stbb027,g_stbb_d[l_ac].stbb028,g_stbb_d[l_ac].stbb009, 
          g_stbb_d[l_ac].stbb017,g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb007, 
          g_stbb_d[l_ac].stbb008,g_stbb_d[l_ac].stbb014,g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016, 
          g_stbb_d[l_ac].stbb018,g_stbb_d[l_ac].stbbsite,g_stbb_d[l_ac].stbb022_desc,g_stbb_d[l_ac].stbb023_desc, 
          g_stbb_d[l_ac].stbb011_desc,g_stbb_d[l_ac].stbb012_desc,g_stbb_d[l_ac].stbb001_desc,g_stbb_d[l_ac].stbb002_desc  
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
         CALL astt560_stbb024_ref()
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
   # 汇总单身原价金额 add by linjm
   SELECT SUM(stbb025) INTO l_stbb025
     FROM stbb_t
    WHERE stbbent = g_enterprise
      AND stbbdocno = g_stba_m.stbadocno 
          
   LET g_stba_m.sum_stbb025=l_stbb025
   DISPLAY g_stba_m.sum_stbb025 TO sum_stbb025 
   
   # 汇总单身实收金额 add by linjm
   SELECT SUM(stbb026) INTO l_stbb026
     FROM stbb_t
    WHERE stbbent = g_enterprise
      AND stbbdocno = g_stba_m.stbadocno
   LET g_stba_m.sum_stbb026=l_stbb026     
   DISPLAY g_stba_m.sum_stbb026 TO sum_stbb026
   #end add-point
   
   CALL g_stbb_d.deleteElement(g_stbb_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt560_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbb_d.getLength()
      LET g_stbb_d_mask_o[l_ac].* =  g_stbb_d[l_ac].*
      CALL astt560_stbb_t_mask()
      LET g_stbb_d_mask_n[l_ac].* =  g_stbb_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt560_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stbb_t
       WHERE stbbent = g_enterprise AND
         stbbdocno = ps_keys_bak[1] AND stbbseq = ps_keys_bak[2]
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
         CALL g_stbb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt560_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stbb_t
                  (stbbent,
                   stbbdocno,
                   stbbseq
                   ,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023,stbb024,stbb011,stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028,stbb009,stbb017,stbb002,stbb003,stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbb_d[g_detail_idx].stbb020,g_stbb_d[g_detail_idx].stbb021,g_stbb_d[g_detail_idx].stbb005, 
                       g_stbb_d[g_detail_idx].stbb006,g_stbb_d[g_detail_idx].stbb022,g_stbb_d[g_detail_idx].stbb023, 
                       g_stbb_d[g_detail_idx].stbb024,g_stbb_d[g_detail_idx].stbb011,g_stbb_d[g_detail_idx].stbb012, 
                       g_stbb_d[g_detail_idx].stbbud001,g_stbb_d[g_detail_idx].stbb001,g_stbb_d[g_detail_idx].stbb004, 
                       g_stbb_d[g_detail_idx].stbb025,g_stbb_d[g_detail_idx].stbb026,g_stbb_d[g_detail_idx].stbb027, 
                       g_stbb_d[g_detail_idx].stbb028,g_stbb_d[g_detail_idx].stbb009,g_stbb_d[g_detail_idx].stbb017, 
                       g_stbb_d[g_detail_idx].stbb002,g_stbb_d[g_detail_idx].stbb003,g_stbb_d[g_detail_idx].stbb007, 
                       g_stbb_d[g_detail_idx].stbb008,g_stbb_d[g_detail_idx].stbb014,g_stbb_d[g_detail_idx].stbb015, 
                       g_stbb_d[g_detail_idx].stbb016,g_stbb_d[g_detail_idx].stbb018,g_stbb_d[g_detail_idx].stbbsite) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt560_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt560_stbb_t_mask_restore('restore_mask_o')
               
      UPDATE stbb_t 
         SET (stbbdocno,
              stbbseq
              ,stbb020,stbb021,stbb005,stbb006,stbb022,stbb023,stbb024,stbb011,stbb012,stbbud001,stbb001,stbb004,stbb025,stbb026,stbb027,stbb028,stbb009,stbb017,stbb002,stbb003,stbb007,stbb008,stbb014,stbb015,stbb016,stbb018,stbbsite) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbb_d[g_detail_idx].stbb020,g_stbb_d[g_detail_idx].stbb021,g_stbb_d[g_detail_idx].stbb005, 
                  g_stbb_d[g_detail_idx].stbb006,g_stbb_d[g_detail_idx].stbb022,g_stbb_d[g_detail_idx].stbb023, 
                  g_stbb_d[g_detail_idx].stbb024,g_stbb_d[g_detail_idx].stbb011,g_stbb_d[g_detail_idx].stbb012, 
                  g_stbb_d[g_detail_idx].stbbud001,g_stbb_d[g_detail_idx].stbb001,g_stbb_d[g_detail_idx].stbb004, 
                  g_stbb_d[g_detail_idx].stbb025,g_stbb_d[g_detail_idx].stbb026,g_stbb_d[g_detail_idx].stbb027, 
                  g_stbb_d[g_detail_idx].stbb028,g_stbb_d[g_detail_idx].stbb009,g_stbb_d[g_detail_idx].stbb017, 
                  g_stbb_d[g_detail_idx].stbb002,g_stbb_d[g_detail_idx].stbb003,g_stbb_d[g_detail_idx].stbb007, 
                  g_stbb_d[g_detail_idx].stbb008,g_stbb_d[g_detail_idx].stbb014,g_stbb_d[g_detail_idx].stbb015, 
                  g_stbb_d[g_detail_idx].stbb016,g_stbb_d[g_detail_idx].stbb018,g_stbb_d[g_detail_idx].stbbsite)  
 
         WHERE stbbent = g_enterprise AND stbbdocno = ps_keys_bak[1] AND stbbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt560_stbb_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt560.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt560_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt560.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt560_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt560.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt560_lock_b(ps_table,ps_page)
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
   #CALL astt560_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stbb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt560_bcl USING g_enterprise,
                                       g_stba_m.stbadocno,g_stbb_d[g_detail_idx].stbbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt560_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt560.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt560_unlock_b(ps_table,ps_page)
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
      CLOSE astt560_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt560_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stbadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stbadocno",TRUE)
      CALL cl_set_comp_entry("stbadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stbaunit",TRUE)
      CALL cl_set_comp_required('stbaunit',TRUE)
      CALL cl_set_comp_entry('stbadocdt',TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("stba010",TRUE)
   CALL cl_set_comp_entry("stba013",TRUE)
   CALL cl_set_comp_entry("stbasite",TRUE)      #161024-00025#3 add
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt560_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_stae006    LIKE stae_t.stae006
   DEFINE  l_cnt       LIKE type_t.num10 #5                #檢查重複用  
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stbadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stbadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stbadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #161024-00025#3--mark--s
#   IF NOT s_aooi500_comp_entry(g_prog,'stbaunit') THEN
#      CALL cl_set_comp_entry("stbaunit",FALSE)
#   END IF
   #161024-00025#3--mark--e
   #161024-00025#3--add--s
   IF NOT s_aooi500_comp_entry(g_prog,'stbasite') THEN
      CALL cl_set_comp_entry("stbasite",FALSE)
   END IF
   #161024-00025#3--add--e
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stbaunit",FALSE)
      CALL cl_set_comp_entry("stba010",FALSE)
      CALL cl_set_comp_entry("stba013",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt560_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry('stbb016',TRUE)  #add  by geza 20150610
   CALL cl_set_comp_entry("stbb025",TRUE)
   CALL cl_set_comp_entry("stbb026",TRUE)
   CALL cl_set_comp_entry("stbb027",TRUE)
   CALL cl_set_comp_entry("stbb005",TRUE)
   CALL cl_set_comp_entry("stbb006",TRUE)
   CALL cl_set_comp_entry("stbb024",TRUE)
   CALL cl_set_comp_entry("stbb022",TRUE)
   CALL cl_set_comp_entry("stbb023",TRUE)
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt560_set_no_entry_b(p_cmd)
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
   #型2/8时，可以录入商品编号、库区编号。商品编号不要求必须输入，库区编号要求必须输入。根据库区编号带出专柜编号、专柜名称。应收金额、实收金额、费率都赋值为0不可录入，开始日期、结束日期不可录入。仅要求调整日期、成本金额必须输入。
   IF g_stbb_d[l_ac].stbb020 = '2' OR g_stbb_d[l_ac].stbb020 ='8' THEN
      CALL cl_set_comp_entry("stbb025",FALSE)
      CALL cl_set_comp_entry("stbb026",FALSE)
      CALL cl_set_comp_entry("stbb027",FALSE)
      CALL cl_set_comp_entry("stbb005",FALSE)
      CALL cl_set_comp_entry("stbb006",FALSE)
      CALL cl_set_comp_entry("stbb024",FALSE)
   ELSE
      CALL cl_set_comp_entry("stbb025",FALSE)
      CALL cl_set_comp_entry("stbb026",FALSE)
      CALL cl_set_comp_entry("stbb027",FALSE)
      CALL cl_set_comp_entry("stbb005",FALSE)
      CALL cl_set_comp_entry("stbb006",FALSE)
      CALL cl_set_comp_entry("stbb022",FALSE) 
      CALL cl_set_comp_entry("stbb023",FALSE)       
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt560_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt560_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stba_m.stbastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt560_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt560.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt560_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt560.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt560_default_search()
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
      LET ls_wc = ls_wc, " stbadocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stba_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbb_t" 
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
 
{<section id="astt560.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt560_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   DEFINE p_wc           STRING                  #add by geza 20151201
   #add by geza 20151130(S)     
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD       
   DEFINE ls_js      STRING
   DEFINE ls_js1     STRING    
   DEFINE l_comp       LIKE ooef_t.ooef001
   DEFINE g_glaa003    LIKE glaa_t.glaa003
   DEFINE g_glaa024    LIKE glaa_t.glaa024
   DEFINE l_stbasite   LIKE stba_t.stbasite
   DEFINE l_ooba002    LIKE ooba_t.ooba002
   DEFINE l_ooba002_1  LIKE ooba_t.ooba002
   DEFINE g_ld         LIKE apca_t.apcald
   #add by geza 20151130(E) 
   #add by 08172
   DEFINE   l_ooac002      LIKE ooac_t.ooac002
   DEFINE   l_ooac004      LIKE ooac_t.ooac004
   DEFINE   l_flag1        LIKE type_t.num5 
   #add by 08172
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stba_m.stbastus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt560_cl USING g_enterprise,g_stba_m.stbadocno
   IF STATUS THEN
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt560_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
       g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
       g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
       g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc,g_stba_m.stba005_desc, 
       g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt560_action_chk() THEN
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stba_m.stbasite,g_stba_m.stbasite_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba014, 
       g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010, 
       g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc, 
       g_stba_m.stba004,g_stba_m.stba004_desc,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba001_desc, 
       g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017,g_stba_m.stba018, 
       g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009, 
       g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc, 
       g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt, 
       g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc, 
       g_stba_m.stbacnfdt
 
   CASE g_stba_m.stbastus
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
         CASE g_stba_m.stbastus
            
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
         CALL cl_set_act_visible("signing,withdraw",FALSE)
         CASE g_stba_m.stbastus
            WHEN "N"
               #HIDE OPTION "open"
               #CALL cl_set_act_visible("unconfirmed",FALSE)  #mark by geza 20151217 
               CALL cl_set_act_visible("unconfirmed,invalid",FALSE)  #add by geza 20151217 #隐藏作废
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
            IF NOT astt560_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt560_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt560_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt560_cl
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
      g_stba_m.stbastus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL cl_err_collect_init()   
   LET l_success = TRUE
   LET g_stba_m.stbacnfdt=cl_get_current()
   LET g_stba_m.stbamoddt=cl_get_current()
   
   CASE 
      WHEN lc_state = 'Y'
         CALL s_astt560_conf_chk(g_stba_m.stbadocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-014') THEN
               CALL s_transaction_begin()
               CALL s_astt560_conf_upd(g_stba_m.stbadocno) RETURNING l_success 
               UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=g_stba_m.stbacnfdt,status = lc_state
               WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
                  #160604-00009#92 -s by 08172
                  CALL s_aooi200_get_slip(g_stba_m.stbadocno) RETURNING l_flag1,l_ooac002
                  CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'E-CIR-0066') RETURNING l_ooac004
                  IF l_ooac004='Y' THEN
                  #160604-00009#92 -e by 08172
                     #add by geza 20151201(S) 
                     #审核如果单身有手动调整类型，则重新计算专柜每月成本汇总
                     LET p_wc = " stge002 = '",g_stba_m.stba013,"'"
                     CALL s_astp513_insert(p_wc,g_stba_m.stba018) RETURNING l_success        
                     #调用aapp131生成aapt320暂估单                 
                     INITIALIZE la_param.* TO NULL 
                     LET la_param.prog = "aapp131"
                     LET la_param.param[1] = 'Y'  
                     LET la_param.param[2] = " stbc004 = '",g_stba_m.stbadocno,"' "
                     LET la_param.param[3] = g_stba_m.stbasite   
                     CALL s_fin_orga_get_comp_ld(g_stba_m.stbasite) RETURNING l_success,l_errno,l_comp,g_ld
                     LET la_param.param[4] = g_ld
                     LET la_param.param[5] = ''
                     LET la_param.param[6] = ''
                     LET la_param.param[7] = '1'
                     LET la_param.param[8] = '1'   
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
                     #                      AND oobl002 = 'aapt320')
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
                                                  AND oobl002 = 'aapt320')
                                       AND oobastus = 'Y'
                                       AND ooba001 =  g_glaa024 
                                       AND ooac003 = 'E-FINC1001'
                                       AND ooac004 = 'Y'
                                     ORDER BY ooba002   
                                    ) a
                     WHERE rownum = 1;
                     # 170207-00018#9  2017/02/13 By 09042 add(E)                     
                     LET la_param.param[9] = l_ooba002
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
                     #                      AND oobl002 = 'aapt320')
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
                                                  AND oobl002 = 'aapt320')
                                       AND oobastus = 'Y'
                                       AND ooba001 =  g_glaa024 
                                       AND ooac003 = 'E-FINC1001'
                                       AND ooac004 = 'N'
                                     ORDER BY ooba002   
                                    ) b
                     WHERE rownum = 1; 
                     # 170207-00018#9  2017/02/13 By 09042 add(E)                      
                     LET la_param.param[10] = l_ooba002_1 
                     LET la_param.param[11] = ''   
                     LET la_param.param[12] = g_stba_m.stbadocdt    
                     
                     LET ls_js = util.JSON.stringify(la_param)
                     CALL cl_cmdrun_wait(ls_js)
                     #add by geza 20151201(E)
                  END IF
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN            
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN            
         END IF         
      WHEN lc_state = 'X'  
         CALL s_astt560_void_chk(g_stba_m.stbadocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt560_void_upd(g_stba_m.stbadocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  #add by geza 20151030(S)
                  #更新astq501的资料
                  UPDATE stga_t SET stga016='',stga017='',stga015='N'
                   WHERE stgaent=g_enterprise
                     AND stga016=g_stba_m.stbadocno
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stba_m.stbadocno 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = FALSE 
                     CALL cl_err()
                     CALL s_transaction_end('N','0')
                     RETURN
                  END IF
                  #add by geza 20151030(E)
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
      WHEN lc_state = 'N' 
         CALL s_astt560_unconf_chk(g_stba_m.stbadocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt560_unconf_upd(g_stba_m.stbadocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
                  #add by geza 20151201(S) 
                  #取消审核如果单身有手动调整类型，则重新计算专柜每月成本汇总                  
                  LET p_wc = " stge002 = '",g_stba_m.stba013,"'"
                  CALL s_astp513_insert(p_wc,g_stba_m.stba018) RETURNING l_success         
                  #add by geza 20151201(E)
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
      OTHERWISE
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
         RETURN
   END CASE      
   
   
   
   
   
   #CASE lc_state 
   #   WHEN 'Y' 
   #      SELECT stbastus INTO  g_stba_m.stbastus 
   #        FROM stba_t 
   #       WHERE stbadocno = g_stba_m.stbadocno
   #         AND stbaent = g_enterprise 
   #         
   #      CALL s_astt560_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
   #      
   #      IF l_success THEN
   #         IF cl_ask_confirm('lib-014') THEN
   #            CALL s_transaction_begin()
   #            CALL s_astt560_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
   #            UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=g_stba_m.stbacnfdt
   #                 WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno               
   #            IF NOT l_success THEN
   #               CALL s_transaction_end('N','0')
   #               INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #               RETURN
   #            ELSE
   #               CALL s_transaction_end('Y','1')
   #            END IF
   #         ELSE
   #            RETURN            
   #         END IF
   #      ELSE
   #         INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #         RETURN            
   #      END IF  
   #      
   #   WHEN 'N'
   #      SELECT stbastus INTO  g_stba_m.stbastus 
   #        FROM stba_t 
   #       WHERE stbadocno = g_stba_m.stbadocno
   #         AND stbaent = g_enterprise 
   #         
   #      CALL s_astt560_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
   #      
   #      IF l_success THEN
   #         IF cl_ask_confirm('lib-015') THEN
   #            CALL s_transaction_begin()
   #            CALL s_astt560_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
   #            UPDATE stba_t SET stbacnfid = '',stbacnfdt='',stbamodid = g_user,stbamoddt=g_stba_m.stbamoddt
   #                 WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno                     
   #            IF NOT l_success THEN
   #               CALL s_transaction_end('N','0')
   #               INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #               RETURN
   #            ELSE
   #               CALL s_transaction_end('Y','1')
   #            END IF
   #         ELSE
   #            RETURN            
   #         END IF
   #      ELSE
   #         INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #         RETURN            
   #      END IF
   #   
   #      
   #   WHEN 'X'
   #      SELECT stbastus INTO  g_stba_m.stbastus 
   #        FROM stba_t 
   #       WHERE stbadocno = g_stba_m.stbadocno
   #         AND stbaent = g_enterprise 
   #         
   #      CALL s_astt560_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
   #      
   #      IF l_success THEN
   #         IF cl_ask_confirm('lib-016') THEN
   #            CALL s_transaction_begin()
   #            CALL s_astt560_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno  
   #            UPDATE stba_t SET stbamodid = g_user,stbamoddt=g_stba_m.stbamoddt
   #                 WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno                 
   #            IF NOT l_success THEN
   #               CALL s_transaction_end('N','0')
   #               INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #               RETURN
   #            ELSE
   #               CALL s_transaction_end('Y','1')
   #            END IF
   #         ELSE
   #            RETURN            
   #         END IF
   #      ELSE
   #         INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = l_errno
   #               LET g_errparam.extend = g_stba_m.stbadocno
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #         RETURN            
   #      END IF            
   #   
   #  OTHERWISE 
   #      EXIT CASE          
   #END CASE 
   #end add-point
   
   LET g_stba_m.stbamodid = g_user
   LET g_stba_m.stbamoddt = cl_get_current()
   LET g_stba_m.stbastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stba_t 
      SET (stbastus,stbamodid,stbamoddt) 
        = (g_stba_m.stbastus,g_stba_m.stbamodid,g_stba_m.stbamoddt)     
    WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
 
    
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
      EXECUTE astt560_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbasite,g_stba_m.stbadocdt, 
          g_stba_m.stbadocno,g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba002, 
          g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stbastus,g_stba_m.stba001,g_stba_m.stba021, 
          g_stba_m.stba017,g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008, 
          g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
          g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt, 
          g_stba_m.stbasite_desc,g_stba_m.stbaunit_desc,g_stba_m.stba013_desc,g_stba_m.stba002_desc, 
          g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc, 
          g_stba_m.stbaownid_desc,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc, 
          g_stba_m.stbamodid_desc,g_stba_m.stbacnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stba_m.stbasite,g_stba_m.stbasite_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno, 
          g_stba_m.stba014,g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba013,g_stba_m.stba013_desc, 
          g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba005, 
          g_stba_m.stba005_desc,g_stba_m.stba004,g_stba_m.stba004_desc,g_stba_m.stbastus,g_stba_m.stba001, 
          g_stba_m.stba001_desc,g_stba_m.stba021,g_stba_m.sum_stbb025,g_stba_m.sum_stbb026,g_stba_m.stba017, 
          g_stba_m.stba018,g_stba_m.stba019,g_stba_m.stba020,g_stba_m.stba023,g_stba_m.stba008,g_stba_m.stba008_desc, 
          g_stba_m.stba009,g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp, 
          g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc, 
          g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid, 
          g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt560_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt560_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt560.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt560_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stbb_d.getLength() THEN
         LET g_detail_idx = g_stbb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbb_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt560_b_fill2(pi_idx)
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
   
   CALL astt560_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt560_fill_chk(ps_idx)
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
 
{<section id="astt560.status_show" >}
PRIVATE FUNCTION astt560_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt560.mask_functions" >}
&include "erp/ast/astt560_mask.4gl"
 
{</section>}
 
{<section id="astt560.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt560_send()
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
 
 
   CALL astt560_show()
   CALL astt560_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt560_conf_chk(g_stba_m.stbadocno) RETURNING l_success
   IF NOT l_success THEN
      CLOSE astt560_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stba_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stbb_d))
 
 
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
   #CALL astt560_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt560_ui_headershow()
   CALL astt560_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt560_draw_out()
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
   CALL astt560_ui_headershow()  
   CALL astt560_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt560.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt560_set_pk_array()
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
   LET g_pk_array[1].values = g_stba_m.stbadocno
   LET g_pk_array[1].column = 'stbadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt560.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt560.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt560_msgcentre_notify(lc_state)
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
   CALL astt560_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stba_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt560.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt560_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#39 add-S
   SELECT stbastus  INTO g_stba_m.stbastus
     FROM stba_t
    WHERE stbaent = g_enterprise
      AND stbadocno = g_stba_m.stbadocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stba_m.stbastus
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
        LET g_errparam.extend = g_stba_m.stbadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt560_set_act_visible()
        CALL astt560_set_act_no_visible()
        CALL astt560_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#39 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt560.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 供應商依照合約帶出經營方式、結算類型、結算方式
# Memo...........:
# Usage..........: CALL astt560_stba002_other()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PUBLIC FUNCTION astt560_stba002_other()
DEFINE l_count      LIKE type_t.num5
DEFINE l_stan001    LIKE stan_t.stan001
DEFINE  l_ooef019             LIKE ooef_t.ooef019

   LET g_stba_m.stba010=''
   LET g_stba_m.stba003=''
   LET g_stba_m.stba004=''
   LET g_stba_m.stba005=''   
   LET g_stba_m.stba001=''

   LET l_count=0
   SELECT count(*) INTO l_count
     FROM stfa_t
    WHERE stfaent  = g_enterprise
      AND stfa010  = g_stba_m.stba002
      AND stfastus = 'Y'
      AND stfa019  <=g_stba_m.stbadocdt
      AND stfa020  > g_stba_m.stbadocdt
      
   #若多筆合約，任意取一筆   
   IF NOT cl_null(l_count) AND l_count>1 THEN
#      SELECT MAX(stan001) INTO l_stan001
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today   
#      SELECT stan002,stan010,stan009 INTO g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stan001=l_stan001
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today         
   ELSE   
#      SELECT stan002,stan010,stan009 INTO g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today
      SELECT stfa001,stfa003,stfa036,stfa037#,stfa038 
      INTO 
             g_stba_m.stba010,g_stba_m.stba003,g_stba_m.stba004,g_stba_m.stba005#,g_stba_m.stba001
        FROM stan_t
       WHERE stfaent  =  g_enterprise
         AND stfa010  =  g_stba_m.stba002
         AND stfastus =  'Y' 
         AND stfa019  <= g_stba_m.stbadocdt
         AND stfa020  >  g_stba_m.stbadocdt   
   END IF
   CALL s_astt401_stey006_get(g_stba_m.stba013,g_stba_m.stbadocdt) RETURNING g_stba_m.stba001   #l 结算中心 anjj add on 2016-07-28
   
   DISPLAY BY NAME g_stba_m.stba010 
   DISPLAY BY NAME g_stba_m.stba003 
   DISPLAY BY NAME g_stba_m.stba004 
   DISPLAY BY NAME g_stba_m.stba005
   DISPLAY BY NAME g_stba_m.stba001


   CALL astt560_stba004_ref()
   CALL astt560_stba005_ref()
   #結算中心說明
   CALL s_desc_get_department_desc(g_stba_m.stba001) RETURNING g_stba_m.stba001_desc
   DISPLAY BY NAME g_stba_m.stba001_desc  
END FUNCTION

################################################################################
# Descriptions...: 專櫃編號帶出資料
# Memo...........:
# Usage..........: CALL astt560_stba013_other()
#                     RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/14 By Ken
# Modify.........: 2016/11/20 By Lori   增加回傳參數,stba010校驗段從AFTER FIELD遷於此處
################################################################################
PRIVATE FUNCTION astt560_stba013_other()
   DEFINE r_success   LIKE type_t.num5    #160824-00007#193 161120 by lori add
   DEFINE l_cnt       LIKE type_t.num10   #160824-00007#193 161120 by lori add
   
   LET r_success = TRUE                   #160824-00007#193 161120 by lori add 
   
   #带出供应商、经营方式、结算方式、结算类型、结算中心、币别、税别(目前抓進項稅),合同編號、業務人員、部門
   SELECT stfa010,stfa003,stfa036,stfa037,#stfa038,
          stfa001,stfa015,stfa044 INTO 
          g_stba_m.stba002,g_stba_m.stba003,g_stba_m.stba004,g_stba_m.stba005,#g_stba_m.stba001,
          g_stba_m.stba010,g_stba_m.stba008,g_stba_m.stba009
     FROM stfa_t
    WHERE stfaent  =  g_enterprise
      AND stfa005  =  g_stba_m.stba013
      AND stfastus =  'Y' 
      AND stfa019  <= g_stba_m.stbadocdt
      AND stfa020  >= g_stba_m.stbadocdt    
      
   #160824-00007#193 161120 by lori add---(S)
   #將stba010校驗段遷至於此處, 還原舊值才會正確
   IF NOT cl_null(g_stba_m.stba010) THEN
      LET l_cnt = 0               
      SELECT COUNT(*) INTO l_cnt    
        FROM stfa_t
       WHERE stfaent = g_enterprise
         AND stfa001 = g_stba_m.stba010
         AND stfastus = 'Y' 
         AND stfa004 != '7'  
         
      IF l_cnt < 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "ast-00273"
         LET g_errparam.extend = g_stba_m.stba010
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         RETURN r_success
      END IF 
   END IF      
   #160824-00007#193 161120 by lori add---(E)
   
   CALL s_astt401_stey006_get(g_stba_m.stba013,g_stba_m.stbadocdt) RETURNING g_stba_m.stba001   #l 结算中心 anjj add on 2016-07-28
   
   DISPLAY BY NAME g_stba_m.stba002 
   DISPLAY BY NAME g_stba_m.stba003 
   DISPLAY BY NAME g_stba_m.stba004 
   DISPLAY BY NAME g_stba_m.stba005
   DISPLAY BY NAME g_stba_m.stba001
   DISPLAY BY NAME g_stba_m.stba010
   
   CALL astt560_stba002_ref()   
   CALL astt560_stba004_ref()
   CALL astt560_stba005_ref()
   #結算中心說明
   CALL s_desc_get_department_desc(g_stba_m.stba001) RETURNING g_stba_m.stba001_desc
   DISPLAY BY NAME g_stba_m.stba001_desc     
   #業務人員說明
   CALL s_desc_get_person_desc(g_stba_m.stba008) RETURNING g_stba_m.stba008_desc
   DISPLAY BY NAME g_stba_m.stba008_desc 
   #部門說明
   CALL s_desc_get_department_desc(g_stba_m.stba009) RETURNING g_stba_m.stba009_desc
   DISPLAY BY NAME g_stba_m.stba009_desc 
   
   #160824-00007#193 161120 by lori add---(S)
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba003 = g_stba_m.stba003
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba010 = g_stba_m.stba010
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   LET g_stba_m_o.stba001 = g_stba_m.stba001
   #160824-00007#193 161120 by lori add---(E)
   
   RETURN r_success   #160824-00007#193 161120 by lori add
END FUNCTION

################################################################################
# Descriptions...: 取得結算中心說明
# Memo...........:
# Usage..........: CALL astt560_stba001_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba001_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba001_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba001_desc
END FUNCTION

################################################################################
# Descriptions...: 費用編號帶出費用說明、費用總類、費用性質、稅別、價款類別
# Memo...........:
# Usage..........: CALL astt560_stbb001_other()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........: 2015/06/10 by geza
################################################################################
PUBLIC FUNCTION astt560_stbb001_other()
   DEFINE l_ooef019 LIKE ooef_t.ooef019   
   DEFINE l_stfa050 LIKE stfa_t.stfa050
   
   #LET g_stbb_d[l_ac].stbb004=''
   LET g_stbb_d[l_ac].stbb009=0

   #INITIALIZE g_ref_fields TO NULL
   #LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
   #CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004,stae006 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
   #LET g_stbb_d[l_ac].stbb004 = '', g_rtn_fields[3] , ''
   #DISPLAY g_stbb_d[l_ac].stbb004 TO stbb004

   #幣別
   #SELECT pmab033 INTO g_stbb_d[l_ac].stbb002
   #  FROM pmab_t
   # WHERE pmabent=g_enterprise
   #   AND pmabsite='ALL'
   #   AND pmab001=g_stba_m.stba002 
   
   IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
      CALL s_curr_round('',g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb009,'2') RETURNING g_stbb_d[l_ac].stbb009 
   END IF      
      
      
   #稅別   
   #IF cl_null(g_stbb_d[l_ac].stbb003) THEN   
   #   SELECT pmab034 INTO g_stbb_d[l_ac].stbb003
   #     FROM pmab_t
   #    WHERE pmabent=g_enterprise
   #      AND pmabsite='ALL'
   #      AND pmab001=g_stba_m.stba002
   #END IF   

   DISPLAY g_stbb_d[l_ac].stbb009 TO stbb009   
   DISPLAY g_stbb_d[l_ac].stbb002 TO stbb002
   
   CALL astt560_stbb001_ref()
   CALL astt560_stbb002_ref()
   
   #mark by geza 20151010(S)
   #帶出納入結算單否，票扣否   #add by geza 20150610(S)
   #SELECT stae011,stae007 INTO g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016
   #  FROM stae_t
   # WHERE staeent = g_enterprise   
   #   AND stae001 = g_stbb_d[l_ac].stbb001
   #
   #IF cl_null(g_stbb_d[l_ac].stbb015) THEN
   #   LET g_stbb_d[l_ac].stbb015 = 'Y' 
   #END IF
   #IF cl_null(g_stbb_d[l_ac].stbb016) THEN
   #   LET g_stbb_d[l_ac].stbb016 = 'N' 
   #END IF
   #DISPLAY g_stbb_d[l_ac].stbb015 TO stbb015   
   #DISPLAY g_stbb_d[l_ac].stbb016 TO stbb016
   #add by geza 20150610(E)
   #mark by geza 20151010(E)
   #mark by geza 20151119(S)
   #add by geza 20151010(S)
   #SELECT stfa050 INTO l_stfa050
   #  FROM stfa_t
   # WHERE stfaent = g_enterprise
   #   AND stfa001 = g_stba_m.stba010 
   #CALL s_astt401_get_stae007(l_stfa050,g_stbb_d[l_ac].stbb001) RETURNING g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016
   #add by geza 20151010(E)  
   #mark by geza 20151119(E)
   
   #160824-00007#193 161120 by lori add---(S)
   LET g_stbb_d_o.stbb009 = g_stbb_d[l_ac].stbb009
   LET g_stbb_d_o.stbb002 = g_stbb_d[l_ac].stbb002
   #160824-00007#193 161120 by lori add---(E)

END FUNCTION

################################################################################
# Descriptions...: 專櫃合同編號帶出資料
# Memo...........:
# Usage..........: CALL astt560_stba010_other()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/14 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba010_other()
   #带出供应商、经营方式、结算方式、结算类型、结算中心、币别、税别(目前抓進項稅),專櫃編號,業務人員、部門
   SELECT stfa010,stfa003,stfa036,stfa037,#stfa038,
          stfa005,stfa015,stfa044 INTO 
          g_stba_m.stba002,g_stba_m.stba003,g_stba_m.stba004,g_stba_m.stba005,#g_stba_m.stba001,
          g_stba_m.stba013,g_stba_m.stba008,g_stba_m.stba009
     FROM stfa_t
    WHERE stfaent  =  g_enterprise
      AND stfa001  =  g_stba_m.stba010
      AND stfastus =  'Y' 
      AND stfa019  <= g_stba_m.stbadocdt
      AND stfa020  >= g_stba_m.stbadocdt     
   CALL s_astt401_stey006_get(g_stba_m.stba013,g_stba_m.stbadocdt) RETURNING g_stba_m.stba001   #l 结算中心 anjj add on 2016-07-28
   
   DISPLAY BY NAME g_stba_m.stba002 
   DISPLAY BY NAME g_stba_m.stba003 
   DISPLAY BY NAME g_stba_m.stba004 
   DISPLAY BY NAME g_stba_m.stba005
   DISPLAY BY NAME g_stba_m.stba001
   DISPLAY BY NAME g_stba_m.stba013
   DISPLAY BY NAME g_stba_m.stba008,g_stba_m.stba009   #160824-00007#193 161129 by lori add
   
   CALL astt560_stba002_ref()
   CALL astt560_stba004_ref() 
   CALL astt560_stba005_ref()
   CALL astt560_stba013_ref()  
   #結算中心說明
   CALL s_desc_get_department_desc(g_stba_m.stba001) RETURNING g_stba_m.stba001_desc
   DISPLAY BY NAME g_stba_m.stba001_desc  
   #業務人員說明
   CALL s_desc_get_person_desc(g_stba_m.stba008) RETURNING g_stba_m.stba008_desc
   DISPLAY BY NAME g_stba_m.stba008_desc 
   #部門說明
   CALL s_desc_get_department_desc(g_stba_m.stba009) RETURNING g_stba_m.stba009_desc
   DISPLAY BY NAME g_stba_m.stba009_desc   
   
   #160824-00007#193 161129 by lori add---(S)
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba003 = g_stba_m.stba003
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba013 = g_stba_m.stba013
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   #160824-00007#193 161129 by lori add---(E)
END FUNCTION

################################################################################
# Descriptions...: 取得單頭供應商說明
# Memo...........:
# Usage..........: CALL astt560_stba002_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba002_desc  
END FUNCTION

################################################################################
# Descriptions...: 取得單頭結算方式說明
# Memo...........:
# Usage..........: CALL astt560_stba004_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba004_desc  
END FUNCTION

################################################################################
# Descriptions...: 取得單頭結算類型說明
# Memo...........:
# Usage..........: CALL astt560_stba005_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba005_desc
END FUNCTION

################################################################################
# Descriptions...: 取得單頭專櫃說明
# Memo...........:
# Usage..........: CALL astt560_stba013_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stba013_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba013
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba013_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba013_desc
END FUNCTION

################################################################################
# Descriptions...: 取得單身費用編號說明
# Memo...........:
# Usage..........: CALL astt560_stbb001_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb001_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb001_desc = '', g_rtn_fields[1] , ''
   DISPLAY g_stbb_d[l_ac].stbb001_desc TO stbb001_desc 
END FUNCTION

################################################################################
# Descriptions...: 取得專櫃合同中的主品類欄位
# Memo...........:
# Usage..........: CALL astt560_get_stbb011()
#                  RETURNING r_stbb011
# Input parameter: 
# Return code....: r_stbb011      專櫃合同的主品類
# Date & Author..: 2015/05/19 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_get_stbb011()
DEFINE r_stbb011        LIKE stbb_t.stbb011

  LET r_stbb011 = ''

   SELECT stfa051 INTO r_stbb011
     FROM stfa_t
    WHERE stfaent  =  g_enterprise
      AND stfa001  =  g_stba_m.stba010
      AND stfastus =  'Y' 
      #AND stfa019  <= g_stba_m.stbadocdt  #mark by geza 20151205
      #AND stfa020  >= g_stba_m.stbadocdt  #mark by geza 20151205

  RETURN r_stbb011
END FUNCTION

################################################################################
# Descriptions...: 库区编号带值
# Memo...........:
# Usage..........: CALL astt560_stbb023_ref()
#                  RETURNING 回传参数
# Date & Author..: 20150828 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb023_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb023
   CALL ap_ref_array2(g_ref_fields,"SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb023_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb023_desc
   
   SELECT inaa120 INTO g_stbb_d[l_ac].stbb024
     FROM inaa_t
    WHERE inaaent = g_enterprise
      AND inaa001 = g_stbb_d[l_ac].stbb023
      AND inaastus= 'Y'   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb024
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb024_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb024_desc
   
END FUNCTION

################################################################################
# Descriptions...: 取得單身幣別說明
# Memo...........:
# Usage..........: CALL astt560_stbb002_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/05/15 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb002
   CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb002_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt560_stbb022_ref()
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb022_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stbb_d[l_ac].stbb022
  CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stbb_d[l_ac].stbb022_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stbb_d[l_ac].stbb022_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL  astt560_stbb024_ref()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb024_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb024
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb024_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb024_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt560_stbb011_ref()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb011_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb011
   CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb011_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt560_stbb012_ref()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt560_stbb012_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb012
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb012_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb012_desc
END FUNCTION

 
{</section>}
 
