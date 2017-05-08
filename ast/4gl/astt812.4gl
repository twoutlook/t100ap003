#該程式未解開Section, 採用最新樣板產出!
{<section id="astt812.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-09-14 17:24:47), PR版次:0009(2016-11-17 20:59:55)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000034
#+ Filename...: astt812
#+ Description: 預租協議維護作業
#+ Creator....: 06137(2016-03-22 10:15:20)
#+ Modifier...: 08172 -SD/PR- 06137
 
{</section>}
 
{<section id="astt812.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160516-00018#1  2016/05/17  by 08172    整单操作费用单修改
#160512-00003#15 20160526 by geza 增加终止状态
#160513-00037#21 2016/06/03  by 08172   费用单修改，预租开始和结束时间修改
#160816-00068#16 2016/08/19  By 08209   調整transaction
#160818-00017#41 2016-08-24  By 08734   删除修改未重新判断状态码
#160913-00034#4  2016/09/14  by 08172   q_pmaa001開窗修改
#161024-00025#11 2016/10/27  by 08742   组织开窗修改
#160824-00007#209 2016/11/17  By 06137   修正舊值備份寫法

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
PRIVATE type type_g_stic_m        RECORD
       sticsite LIKE stic_t.sticsite, 
   sticsite_desc LIKE type_t.chr80, 
   sticdocdt LIKE stic_t.sticdocdt, 
   sticdocno LIKE stic_t.sticdocno, 
   stic001 LIKE stic_t.stic001, 
   stic006 LIKE stic_t.stic006, 
   stic007 LIKE stic_t.stic007, 
   stic002 LIKE stic_t.stic002, 
   stic002_desc LIKE type_t.chr80, 
   stic003 LIKE stic_t.stic003, 
   stic015 LIKE stic_t.stic015, 
   stic015_desc LIKE type_t.chr80, 
   stic016 LIKE stic_t.stic016, 
   stic010 LIKE stic_t.stic010, 
   stic010_desc LIKE type_t.chr80, 
   stic011 LIKE stic_t.stic011, 
   stic012 LIKE stic_t.stic012, 
   stic012_desc LIKE type_t.chr80, 
   stic013 LIKE stic_t.stic013, 
   stic013_desc LIKE type_t.chr80, 
   stic014 LIKE stic_t.stic014, 
   stic014_desc LIKE type_t.chr80, 
   stic004 LIKE stic_t.stic004, 
   stic005 LIKE stic_t.stic005, 
   stic008 LIKE stic_t.stic008, 
   stic009 LIKE stic_t.stic009, 
   sticunit LIKE stic_t.sticunit, 
   stic018 LIKE stic_t.stic018, 
   stic018_desc LIKE type_t.chr80, 
   stic019 LIKE stic_t.stic019, 
   stic017 LIKE stic_t.stic017, 
   stic020 LIKE stic_t.stic020, 
   stic020_desc LIKE type_t.chr80, 
   stic021 LIKE stic_t.stic021, 
   stic021_desc LIKE type_t.chr80, 
   stic022 LIKE stic_t.stic022, 
   stic023 LIKE stic_t.stic023, 
   stic023_desc LIKE type_t.chr80, 
   stic024 LIKE stic_t.stic024, 
   stic024_desc LIKE type_t.chr80, 
   stic025 LIKE stic_t.stic025, 
   sticstus LIKE stic_t.sticstus, 
   sticownid LIKE stic_t.sticownid, 
   sticownid_desc LIKE type_t.chr80, 
   sticowndp LIKE stic_t.sticowndp, 
   sticowndp_desc LIKE type_t.chr80, 
   sticcrtid LIKE stic_t.sticcrtid, 
   sticcrtid_desc LIKE type_t.chr80, 
   sticcrtdp LIKE stic_t.sticcrtdp, 
   sticcrtdp_desc LIKE type_t.chr80, 
   sticcrtdt LIKE stic_t.sticcrtdt, 
   sticmodid LIKE stic_t.sticmodid, 
   sticmodid_desc LIKE type_t.chr80, 
   sticmoddt LIKE stic_t.sticmoddt, 
   sticcnfid LIKE stic_t.sticcnfid, 
   sticcnfid_desc LIKE type_t.chr80, 
   sticcnfdt LIKE stic_t.sticcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stid_d        RECORD
       stidseq LIKE stid_t.stidseq, 
   stid001 LIKE stid_t.stid001, 
   stid001_desc LIKE type_t.chr500, 
   stid002 LIKE stid_t.stid002, 
   l_mhad008 LIKE type_t.chr10, 
   stid003 LIKE stid_t.stid003, 
   stid003_desc LIKE type_t.chr500, 
   stid004 LIKE stid_t.stid004, 
   stid004_desc LIKE type_t.chr500, 
   stid005 LIKE stid_t.stid005, 
   stid005_desc LIKE type_t.chr500, 
   stid006 LIKE stid_t.stid006, 
   stid007 LIKE stid_t.stid007, 
   stid008 LIKE stid_t.stid008
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sticsite LIKE stic_t.sticsite,
      b_sticdocdt LIKE stic_t.sticdocdt,
      b_sticdocno LIKE stic_t.sticdocno,
      b_stic001 LIKE stic_t.stic001,
      b_stic002 LIKE stic_t.stic002,
   b_stic002_desc LIKE type_t.chr80,
      b_stic010 LIKE stic_t.stic010,
   b_stic010_desc LIKE type_t.chr80,
      b_stic004 LIKE stic_t.stic004,
      b_stic005 LIKE stic_t.stic005
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag    LIKE type_t.num5        #用來判斷單頭site的輸入狀況，用來欄位開關
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stic_m          type_g_stic_m
DEFINE g_stic_m_t        type_g_stic_m
DEFINE g_stic_m_o        type_g_stic_m
DEFINE g_stic_m_mask_o   type_g_stic_m #轉換遮罩前資料
DEFINE g_stic_m_mask_n   type_g_stic_m #轉換遮罩後資料
 
   DEFINE g_sticdocno_t LIKE stic_t.sticdocno
 
 
DEFINE g_stid_d          DYNAMIC ARRAY OF type_g_stid_d
DEFINE g_stid_d_t        type_g_stid_d
DEFINE g_stid_d_o        type_g_stid_d
DEFINE g_stid_d_mask_o   DYNAMIC ARRAY OF type_g_stid_d #轉換遮罩前資料
DEFINE g_stid_d_mask_n   DYNAMIC ARRAY OF type_g_stid_d #轉換遮罩後資料
 
 
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
 
{<section id="astt812.main" >}
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
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT sticsite,'',sticdocdt,sticdocno,stic001,stic006,stic007,stic002,'',stic003, 
       stic015,'',stic016,stic010,'',stic011,stic012,'',stic013,'',stic014,'',stic004,stic005,stic008, 
       stic009,sticunit,stic018,'',stic019,stic017,stic020,'',stic021,'',stic022,stic023,'',stic024, 
       '',stic025,sticstus,sticownid,'',sticowndp,'',sticcrtid,'',sticcrtdp,'',sticcrtdt,sticmodid,'', 
       sticmoddt,sticcnfid,'',sticcnfdt", 
                      " FROM stic_t",
                      " WHERE sticent= ? AND sticdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt812_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sticsite,t0.sticdocdt,t0.sticdocno,t0.stic001,t0.stic006,t0.stic007, 
       t0.stic002,t0.stic003,t0.stic015,t0.stic016,t0.stic010,t0.stic011,t0.stic012,t0.stic013,t0.stic014, 
       t0.stic004,t0.stic005,t0.stic008,t0.stic009,t0.sticunit,t0.stic018,t0.stic019,t0.stic017,t0.stic020, 
       t0.stic021,t0.stic022,t0.stic023,t0.stic024,t0.stic025,t0.sticstus,t0.sticownid,t0.sticowndp, 
       t0.sticcrtid,t0.sticcrtdp,t0.sticcrtdt,t0.sticmodid,t0.sticmoddt,t0.sticcnfid,t0.sticcnfdt,t1.ooefl003 , 
       t2.pmaal003 ,t3.oocql004 ,t4.mhbel003 ,t5.mhaal003 ,t6.mhabl004 ,t7.rtaxl003 ,t8.stael003 ,t9.ooag011 , 
       t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 ,t13.ooag011 ,t14.ooefl003 ,t15.ooag011 ,t16.ooefl003 , 
       t17.ooag011 ,t18.ooag011",
               " FROM stic_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sticsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stic002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2002' AND t3.oocql002=t0.stic015 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t4 ON t4.mhbelent="||g_enterprise||" AND t4.mhbel001=t0.stic010 AND t4.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t5 ON t5.mhaalent="||g_enterprise||" AND t5.mhaal001=t0.stic012 AND t5.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t6 ON t6.mhablent="||g_enterprise||" AND t6.mhabl001=t0.stic012 AND t6.mhabl002=t0.stic013 AND t6.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t7 ON t7.rtaxlent="||g_enterprise||" AND t7.rtaxl001=t0.stic014 AND t7.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=t0.stic018 AND t8.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stic020  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stic021 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stic023  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stic024 AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.sticownid  ",
               " LEFT JOIN ooefl_t t14 ON t14.ooeflent="||g_enterprise||" AND t14.ooefl001=t0.sticowndp AND t14.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.sticcrtid  ",
               " LEFT JOIN ooefl_t t16 ON t16.ooeflent="||g_enterprise||" AND t16.ooefl001=t0.sticcrtdp AND t16.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.sticmodid  ",
               " LEFT JOIN ooag_t t18 ON t18.ooagent="||g_enterprise||" AND t18.ooag001=t0.sticcnfid  ",
 
               " WHERE t0.sticent = " ||g_enterprise|| " AND t0.sticdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt812_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt812 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt812_init()   
 
      #進入選單 Menu (="N")
      CALL astt812_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt812
      
   END IF 
   
   CLOSE astt812_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt812.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt812_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success     LIKE type_t.num5
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
      CALL cl_set_combo_scc_part('sticstus','13','N,Y,A,D,R,W,X,E')
 
      CALL cl_set_combo_scc('stic001','6918') 
   CALL cl_set_combo_scc('stic016','6202') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   LET g_errshow = 1
   CALL s_aooi500_create_temp() RETURNING l_success 
   CALL cl_set_combo_scc('l_mhad008','6020')
   #160421-00013#5 160428 by sakura add(S)
   CALL s_asti800_set_comp_format("stid006",g_site,'2')
   CALL s_asti800_set_comp_format("stid007",g_site,'2')
   CALL s_asti800_set_comp_format("stid008",g_site,'2')
   #160421-00013#5 160428 by sakura add(E)   
   #end add-point
   
   #初始化搜尋條件
   CALL astt812_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt812.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt812_ui_dialog()
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
   DEFINE l_cnt           LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_stbadocno     LIKE stba_t.stbadocno
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
            CALL astt812_insert()
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
         INITIALIZE g_stic_m.* TO NULL
         CALL g_stid_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt812_init()
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
               
               CALL astt812_fetch('') # reload data
               LET l_ac = 1
               CALL astt812_ui_detailshow() #Setting the current row 
         
               CALL astt812_idx_chk()
               #NEXT FIELD stidseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stid_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt812_idx_chk()
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
               CALL astt812_idx_chk()
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
            CALL astt812_browser_fill("")
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
               CALL astt812_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt812_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt812_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt812_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt812_set_act_visible()   
            CALL astt812_set_act_no_visible()
            IF NOT (g_stic_m.sticdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sticent = " ||g_enterprise|| " AND",
                                  " sticdocno = '", g_stic_m.sticdocno, "' "
 
               #填到對應位置
               CALL astt812_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stic_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stid_t" 
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
               CALL astt812_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stic_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stid_t" 
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
                  CALL astt812_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt812_fetch("F")
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
               CALL astt812_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt812_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt812_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt812_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt812_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt812_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt812_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt812_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt812_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt812_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt812_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stid_d)
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
               NEXT FIELD stidseq
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
               CALL astt812_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt812_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt812_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt812_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt812_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt812_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt812_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt812_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_expense
            LET g_action_choice="gen_expense"
            IF cl_auth_chk_act("gen_expense") THEN
               
               #add-point:ON ACTION gen_expense name="menu.gen_expense"
               IF cl_null(g_stic_m.sticdocno) THEN
                  #尚未選擇欲執行的單據
				      INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "amm-00129"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM stic_t
                WHERE sticent = g_enterprise
                  AND sticdocno = g_stic_m.sticdocno
                  AND sticstus = 'Y'
               IF l_cnt = 0 THEN
               #預租協議狀態未確認，不可產生費用單！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "ast-00624"
                  LET g_errparam.popup  = TRUE
                  LET g_errparam.replace[1] = g_stic_m.sticdocno
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF

               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM stba_t
                WHERE stbaent = g_enterprise
                  AND stba007 = g_stic_m.sticdocno
                  AND stbastus <> 'X'                   #160516-00018#1
               IF l_cnt > 0 THEN
			      #已有費用單存在，不可重複產生！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "ain-00628"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF               
               CALL s_transaction_begin()
               CALL cl_err_collect_init() 
               
			      #是否產生費用單？
			      IF cl_ask_confirm('ain-00620') THEN
                  LET l_success = TRUE
                  LET l_stbadocno = ''
                  CALL s_expense_astt812(g_stic_m.sticdocno) RETURNING l_success,l_stbadocno
                  IF l_success THEN
                     CALL astt812_stic017_upd(l_stbadocno)
                     CALL s_transaction_end('Y','0')
                     CALL astt812_b_fill()
                  ELSE
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00556'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()   
                  END IF
               END IF
               CALL cl_err_collect_show()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stic017
            LET g_action_choice="prog_stic017"
            IF cl_auth_chk_act("prog_stic017") THEN
               
               #add-point:ON ACTION prog_stic017 name="menu.prog_stic017"
               #應用 a41 樣板自動產生(Version:3)
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'astt810'
               LET la_param.param[1] = g_stic_m.stic017

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
 



               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stic020
            LET g_action_choice="prog_stic020"
            IF cl_auth_chk_act("prog_stic020") THEN
               
               #add-point:ON ACTION prog_stic020 name="menu.prog_stic020"
               #應用 a45 樣板自動產生(Version:3)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_stic_m.stic020)
 



               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stic023
            LET g_action_choice="prog_stic023"
            IF cl_auth_chk_act("prog_stic023") THEN
               
               #add-point:ON ACTION prog_stic023 name="menu.prog_stic023"
               #應用 a45 樣板自動產生(Version:3)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_stic_m.stic023)
 



               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt812_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt812_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt812_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stic_m.sticdocdt)
 
 
 
         
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
 
{<section id="astt812.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt812_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING     #161024-00025#11   2016/10/27  by 08742 
   
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
   #161024-00025#11   2016/10/27  by 08742  -S
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'sticsite') RETURNING l_where
   LET l_wc = l_wc," AND ",l_where
   #161024-00025#11   2016/10/27  by 08742   -E
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sticdocno ",
                      " FROM stic_t ",
                      " ",
                      " LEFT JOIN stid_t ON stident = sticent AND sticdocno = stiddocno ", "  ",
                      #add-point:browser_fill段sql(stid_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE sticent = " ||g_enterprise|| " AND stident = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stic_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sticdocno ",
                      " FROM stic_t ", 
                      "  ",
                      "  ",
                      " WHERE sticent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stic_t")
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
      INITIALIZE g_stic_m.* TO NULL
      CALL g_stid_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sticsite,t0.sticdocdt,t0.sticdocno,t0.stic001,t0.stic002,t0.stic010,t0.stic004,t0.stic005 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sticstus,t0.sticsite,t0.sticdocdt,t0.sticdocno,t0.stic001,t0.stic002, 
          t0.stic010,t0.stic004,t0.stic005,t1.pmaal003 ,t2.mhbel003 ",
                  " FROM stic_t t0",
                  "  ",
                  "  LEFT JOIN stid_t ON stident = sticent AND sticdocno = stiddocno ", "  ", 
                  #add-point:browser_fill段sql(stid_t1) name="browser_fill.join.stid_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN pmaal_t t1 ON t1.pmaalent="||g_enterprise||" AND t1.pmaal001=t0.stic002 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t2 ON t2.mhbelent="||g_enterprise||" AND t2.mhbel001=t0.stic010 AND t2.mhbel002='"||g_dlang||"' ",
 
                  " WHERE t0.sticent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stic_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sticstus,t0.sticsite,t0.sticdocdt,t0.sticdocno,t0.stic001,t0.stic002, 
          t0.stic010,t0.stic004,t0.stic005,t1.pmaal003 ,t2.mhbel003 ",
                  " FROM stic_t t0",
                  "  ",
                                 " LEFT JOIN pmaal_t t1 ON t1.pmaalent="||g_enterprise||" AND t1.pmaal001=t0.stic002 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t2 ON t2.mhbelent="||g_enterprise||" AND t2.mhbel001=t0.stic010 AND t2.mhbel002='"||g_dlang||"' ",
 
                  " WHERE t0.sticent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stic_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY sticdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stic_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sticsite,g_browser[g_cnt].b_sticdocdt, 
          g_browser[g_cnt].b_sticdocno,g_browser[g_cnt].b_stic001,g_browser[g_cnt].b_stic002,g_browser[g_cnt].b_stic010, 
          g_browser[g_cnt].b_stic004,g_browser[g_cnt].b_stic005,g_browser[g_cnt].b_stic002_desc,g_browser[g_cnt].b_stic010_desc 
 
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
         CALL astt812_browser_mask()
      
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
         WHEN "E"
            LET g_browser[g_cnt].b_statepic = "stus/16/ended.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_sticdocno) THEN
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
 
{<section id="astt812.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt812_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stic_m.sticdocno = g_browser[g_current_idx].b_sticdocno   
 
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
   CALL astt812_stic_t_mask()
   CALL astt812_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt812.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt812_ui_detailshow()
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
 
{<section id="astt812.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt812_ui_browser_refresh()
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
      IF g_browser[l_i].b_sticdocno = g_stic_m.sticdocno 
 
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
 
{<section id="astt812.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt812_construct()
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
   INITIALIZE g_stic_m.* TO NULL
   CALL g_stid_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON sticsite,sticdocdt,sticdocno,stic001,stic006,stic007,stic002,stic003, 
          stic015,stic016,stic010,stic011,stic012,stic013,stic014,stic004,stic005,stic008,stic009,stic018, 
          stic019,stic017,stic020,stic021,stic022,stic023,stic024,stic025,sticstus,sticownid,sticowndp, 
          sticcrtid,sticcrtdp,sticcrtdt,sticmodid,sticmoddt,sticcnfid,sticcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sticcrtdt>>----
         AFTER FIELD sticcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sticmoddt>>----
         AFTER FIELD sticmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sticcnfdt>>----
         AFTER FIELD sticcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sticpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sticsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticsite
            #add-point:ON ACTION controlp INFIELD sticsite name="construct.c.sticsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sticsite',g_site,'c') 
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticsite  #顯示到畫面上
            NEXT FIELD sticsite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticsite
            #add-point:BEFORE FIELD sticsite name="construct.b.sticsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticsite
            
            #add-point:AFTER FIELD sticsite name="construct.a.sticsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticdocdt
            #add-point:BEFORE FIELD sticdocdt name="construct.b.sticdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticdocdt
            
            #add-point:AFTER FIELD sticdocdt name="construct.a.sticdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticdocdt
            #add-point:ON ACTION controlp INFIELD sticdocdt name="construct.c.sticdocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticdocno
            #add-point:BEFORE FIELD sticdocno name="construct.b.sticdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticdocno
            
            #add-point:AFTER FIELD sticdocno name="construct.a.sticdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticdocno
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticdocno
            #add-point:ON ACTION controlp INFIELD sticdocno name="construct.c.sticdocno"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic001
            #add-point:BEFORE FIELD stic001 name="construct.b.stic001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic001
            
            #add-point:AFTER FIELD stic001 name="construct.a.stic001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic001
            #add-point:ON ACTION controlp INFIELD stic001 name="construct.c.stic001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic006
            #add-point:BEFORE FIELD stic006 name="construct.b.stic006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic006
            
            #add-point:AFTER FIELD stic006 name="construct.a.stic006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic006
            #add-point:ON ACTION controlp INFIELD stic006 name="construct.c.stic006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic007
            #add-point:BEFORE FIELD stic007 name="construct.b.stic007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic007
            
            #add-point:AFTER FIELD stic007 name="construct.a.stic007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic007
            #add-point:ON ACTION controlp INFIELD stic007 name="construct.c.stic007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic002
            #add-point:ON ACTION controlp INFIELD stic002 name="construct.c.stic002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#4 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stic002  #顯示到畫面上
            NEXT FIELD stic002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic002
            #add-point:BEFORE FIELD stic002 name="construct.b.stic002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic002
            
            #add-point:AFTER FIELD stic002 name="construct.a.stic002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic003
            #add-point:BEFORE FIELD stic003 name="construct.b.stic003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic003
            
            #add-point:AFTER FIELD stic003 name="construct.a.stic003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic003
            #add-point:ON ACTION controlp INFIELD stic003 name="construct.c.stic003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic015
            #add-point:ON ACTION controlp INFIELD stic015 name="construct.c.stic015"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic015  #顯示到畫面上

            NEXT FIELD stic015                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic015
            #add-point:BEFORE FIELD stic015 name="construct.b.stic015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic015
            
            #add-point:AFTER FIELD stic015 name="construct.a.stic015"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic016
            #add-point:BEFORE FIELD stic016 name="construct.b.stic016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic016
            
            #add-point:AFTER FIELD stic016 name="construct.a.stic016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic016
            #add-point:ON ACTION controlp INFIELD stic016 name="construct.c.stic016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic010
            #add-point:ON ACTION controlp INFIELD stic010 name="construct.c.stic010"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbc001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic010  #顯示到畫面上
            NEXT FIELD stic010                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic010
            #add-point:BEFORE FIELD stic010 name="construct.b.stic010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic010
            
            #add-point:AFTER FIELD stic010 name="construct.a.stic010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic011
            #add-point:BEFORE FIELD stic011 name="construct.b.stic011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic011
            
            #add-point:AFTER FIELD stic011 name="construct.a.stic011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic011
            #add-point:ON ACTION controlp INFIELD stic011 name="construct.c.stic011"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic012
            #add-point:ON ACTION controlp INFIELD stic012 name="construct.c.stic012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic012  #顯示到畫面上
            NEXT FIELD stic012                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic012
            #add-point:BEFORE FIELD stic012 name="construct.b.stic012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic012
            
            #add-point:AFTER FIELD stic012 name="construct.a.stic012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic013
            #add-point:ON ACTION controlp INFIELD stic013 name="construct.c.stic013"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic013  #顯示到畫面上
            NEXT FIELD stic013                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic013
            #add-point:BEFORE FIELD stic013 name="construct.b.stic013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic013
            
            #add-point:AFTER FIELD stic013 name="construct.a.stic013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic014
            #add-point:ON ACTION controlp INFIELD stic014 name="construct.c.stic014"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic014  #顯示到畫面上
            NEXT FIELD stic014                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic014
            #add-point:BEFORE FIELD stic014 name="construct.b.stic014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic014
            
            #add-point:AFTER FIELD stic014 name="construct.a.stic014"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic004
            #add-point:BEFORE FIELD stic004 name="construct.b.stic004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic004
            
            #add-point:AFTER FIELD stic004 name="construct.a.stic004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic004
            #add-point:ON ACTION controlp INFIELD stic004 name="construct.c.stic004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic005
            #add-point:BEFORE FIELD stic005 name="construct.b.stic005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic005
            
            #add-point:AFTER FIELD stic005 name="construct.a.stic005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic005
            #add-point:ON ACTION controlp INFIELD stic005 name="construct.c.stic005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic008
            #add-point:BEFORE FIELD stic008 name="construct.b.stic008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic008
            
            #add-point:AFTER FIELD stic008 name="construct.a.stic008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic008
            #add-point:ON ACTION controlp INFIELD stic008 name="construct.c.stic008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic009
            #add-point:BEFORE FIELD stic009 name="construct.b.stic009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic009
            
            #add-point:AFTER FIELD stic009 name="construct.a.stic009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic009
            #add-point:ON ACTION controlp INFIELD stic009 name="construct.c.stic009"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic018
            #add-point:ON ACTION controlp INFIELD stic018 name="construct.c.stic018"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic018  #顯示到畫面上
            NEXT FIELD stic018                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic018
            #add-point:BEFORE FIELD stic018 name="construct.b.stic018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic018
            
            #add-point:AFTER FIELD stic018 name="construct.a.stic018"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic019
            #add-point:BEFORE FIELD stic019 name="construct.b.stic019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic019
            
            #add-point:AFTER FIELD stic019 name="construct.a.stic019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic019
            #add-point:ON ACTION controlp INFIELD stic019 name="construct.c.stic019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic017
            #add-point:BEFORE FIELD stic017 name="construct.b.stic017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic017
            
            #add-point:AFTER FIELD stic017 name="construct.a.stic017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic017
            #add-point:ON ACTION controlp INFIELD stic017 name="construct.c.stic017"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic020
            #add-point:ON ACTION controlp INFIELD stic020 name="construct.c.stic020"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic020  #顯示到畫面上
            NEXT FIELD stic020                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic020
            #add-point:BEFORE FIELD stic020 name="construct.b.stic020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic020
            
            #add-point:AFTER FIELD stic020 name="construct.a.stic020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic021
            #add-point:ON ACTION controlp INFIELD stic021 name="construct.c.stic021"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic021  #顯示到畫面上
            NEXT FIELD stic021                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic021
            #add-point:BEFORE FIELD stic021 name="construct.b.stic021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic021
            
            #add-point:AFTER FIELD stic021 name="construct.a.stic021"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic022
            #add-point:BEFORE FIELD stic022 name="construct.b.stic022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic022
            
            #add-point:AFTER FIELD stic022 name="construct.a.stic022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic022
            #add-point:ON ACTION controlp INFIELD stic022 name="construct.c.stic022"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stic023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic023
            #add-point:ON ACTION controlp INFIELD stic023 name="construct.c.stic023"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic023  #顯示到畫面上
            NEXT FIELD stic023                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic023
            #add-point:BEFORE FIELD stic023 name="construct.b.stic023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic023
            
            #add-point:AFTER FIELD stic023 name="construct.a.stic023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic024
            #add-point:ON ACTION controlp INFIELD stic024 name="construct.c.stic024"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stic024  #顯示到畫面上
            NEXT FIELD stic024                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic024
            #add-point:BEFORE FIELD stic024 name="construct.b.stic024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic024
            
            #add-point:AFTER FIELD stic024 name="construct.a.stic024"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic025
            #add-point:BEFORE FIELD stic025 name="construct.b.stic025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic025
            
            #add-point:AFTER FIELD stic025 name="construct.a.stic025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stic025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic025
            #add-point:ON ACTION controlp INFIELD stic025 name="construct.c.stic025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticstus
            #add-point:BEFORE FIELD sticstus name="construct.b.sticstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticstus
            
            #add-point:AFTER FIELD sticstus name="construct.a.sticstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticstus
            #add-point:ON ACTION controlp INFIELD sticstus name="construct.c.sticstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sticownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticownid
            #add-point:ON ACTION controlp INFIELD sticownid name="construct.c.sticownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticownid  #顯示到畫面上
            NEXT FIELD sticownid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticownid
            #add-point:BEFORE FIELD sticownid name="construct.b.sticownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticownid
            
            #add-point:AFTER FIELD sticownid name="construct.a.sticownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticowndp
            #add-point:ON ACTION controlp INFIELD sticowndp name="construct.c.sticowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticowndp  #顯示到畫面上
            NEXT FIELD sticowndp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticowndp
            #add-point:BEFORE FIELD sticowndp name="construct.b.sticowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticowndp
            
            #add-point:AFTER FIELD sticowndp name="construct.a.sticowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticcrtid
            #add-point:ON ACTION controlp INFIELD sticcrtid name="construct.c.sticcrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticcrtid  #顯示到畫面上
            NEXT FIELD sticcrtid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticcrtid
            #add-point:BEFORE FIELD sticcrtid name="construct.b.sticcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticcrtid
            
            #add-point:AFTER FIELD sticcrtid name="construct.a.sticcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sticcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticcrtdp
            #add-point:ON ACTION controlp INFIELD sticcrtdp name="construct.c.sticcrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticcrtdp  #顯示到畫面上
            NEXT FIELD sticcrtdp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticcrtdp
            #add-point:BEFORE FIELD sticcrtdp name="construct.b.sticcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticcrtdp
            
            #add-point:AFTER FIELD sticcrtdp name="construct.a.sticcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticcrtdt
            #add-point:BEFORE FIELD sticcrtdt name="construct.b.sticcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sticmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticmodid
            #add-point:ON ACTION controlp INFIELD sticmodid name="construct.c.sticmodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticmodid  #顯示到畫面上
            NEXT FIELD sticmodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticmodid
            #add-point:BEFORE FIELD sticmodid name="construct.b.sticmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticmodid
            
            #add-point:AFTER FIELD sticmodid name="construct.a.sticmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticmoddt
            #add-point:BEFORE FIELD sticmoddt name="construct.b.sticmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sticcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticcnfid
            #add-point:ON ACTION controlp INFIELD sticcnfid name="construct.c.sticcnfid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sticcnfid  #顯示到畫面上
            NEXT FIELD sticcnfid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticcnfid
            #add-point:BEFORE FIELD sticcnfid name="construct.b.sticcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticcnfid
            
            #add-point:AFTER FIELD sticcnfid name="construct.a.sticcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticcnfdt
            #add-point:BEFORE FIELD sticcnfdt name="construct.b.sticcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stidseq,stid001,stid002,l_mhad008,stid003,stid004,stid005,stid006,stid007, 
          stid008
           FROM s_detail1[1].stidseq,s_detail1[1].stid001,s_detail1[1].stid002,s_detail1[1].l_mhad008, 
               s_detail1[1].stid003,s_detail1[1].stid004,s_detail1[1].stid005,s_detail1[1].stid006,s_detail1[1].stid007, 
               s_detail1[1].stid008
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stidseq
            #add-point:BEFORE FIELD stidseq name="construct.b.page1.stidseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stidseq
            
            #add-point:AFTER FIELD stidseq name="construct.a.page1.stidseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stidseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stidseq
            #add-point:ON ACTION controlp INFIELD stidseq name="construct.c.page1.stidseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stid001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid001
            #add-point:ON ACTION controlp INFIELD stid001 name="construct.c.page1.stid001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhad001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stid001  #顯示到畫面上
            NEXT FIELD stid001                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid001
            #add-point:BEFORE FIELD stid001 name="construct.b.page1.stid001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid001
            
            #add-point:AFTER FIELD stid001 name="construct.a.page1.stid001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid002
            #add-point:BEFORE FIELD stid002 name="construct.b.page1.stid002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid002
            
            #add-point:AFTER FIELD stid002 name="construct.a.page1.stid002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid002
            #add-point:ON ACTION controlp INFIELD stid002 name="construct.c.page1.stid002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_mhad008
            #add-point:BEFORE FIELD l_mhad008 name="construct.b.page1.l_mhad008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_mhad008
            
            #add-point:AFTER FIELD l_mhad008 name="construct.a.page1.l_mhad008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.l_mhad008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_mhad008
            #add-point:ON ACTION controlp INFIELD l_mhad008 name="construct.c.page1.l_mhad008"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stid003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid003
            #add-point:ON ACTION controlp INFIELD stid003 name="construct.c.page1.stid003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stid003  #顯示到畫面上
            NEXT FIELD stid003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid003
            #add-point:BEFORE FIELD stid003 name="construct.b.page1.stid003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid003
            
            #add-point:AFTER FIELD stid003 name="construct.a.page1.stid003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid004
            #add-point:ON ACTION controlp INFIELD stid004 name="construct.c.page1.stid004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stid004  #顯示到畫面上
            NEXT FIELD stid004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid004
            #add-point:BEFORE FIELD stid004 name="construct.b.page1.stid004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid004
            
            #add-point:AFTER FIELD stid004 name="construct.a.page1.stid004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid005
            #add-point:ON ACTION controlp INFIELD stid005 name="construct.c.page1.stid005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhac003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stid005  #顯示到畫面上
            NEXT FIELD stid005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid005
            #add-point:BEFORE FIELD stid005 name="construct.b.page1.stid005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid005
            
            #add-point:AFTER FIELD stid005 name="construct.a.page1.stid005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid006
            #add-point:BEFORE FIELD stid006 name="construct.b.page1.stid006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid006
            
            #add-point:AFTER FIELD stid006 name="construct.a.page1.stid006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid006
            #add-point:ON ACTION controlp INFIELD stid006 name="construct.c.page1.stid006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid007
            #add-point:BEFORE FIELD stid007 name="construct.b.page1.stid007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid007
            
            #add-point:AFTER FIELD stid007 name="construct.a.page1.stid007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid007
            #add-point:ON ACTION controlp INFIELD stid007 name="construct.c.page1.stid007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stid008
            #add-point:BEFORE FIELD stid008 name="construct.b.page1.stid008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stid008
            
            #add-point:AFTER FIELD stid008 name="construct.a.page1.stid008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stid008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stid008
            #add-point:ON ACTION controlp INFIELD stid008 name="construct.c.page1.stid008"
            
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
                  WHEN la_wc[li_idx].tableid = "stic_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stid_t" 
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
 
{<section id="astt812.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt812_filter()
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
      CONSTRUCT g_wc_filter ON sticsite,sticdocdt,sticdocno,stic001,stic002,stic010,stic004,stic005
                          FROM s_browse[1].b_sticsite,s_browse[1].b_sticdocdt,s_browse[1].b_sticdocno, 
                              s_browse[1].b_stic001,s_browse[1].b_stic002,s_browse[1].b_stic010,s_browse[1].b_stic004, 
                              s_browse[1].b_stic005
 
         BEFORE CONSTRUCT
               DISPLAY astt812_filter_parser('sticsite') TO s_browse[1].b_sticsite
            DISPLAY astt812_filter_parser('sticdocdt') TO s_browse[1].b_sticdocdt
            DISPLAY astt812_filter_parser('sticdocno') TO s_browse[1].b_sticdocno
            DISPLAY astt812_filter_parser('stic001') TO s_browse[1].b_stic001
            DISPLAY astt812_filter_parser('stic002') TO s_browse[1].b_stic002
            DISPLAY astt812_filter_parser('stic010') TO s_browse[1].b_stic010
            DISPLAY astt812_filter_parser('stic004') TO s_browse[1].b_stic004
            DISPLAY astt812_filter_parser('stic005') TO s_browse[1].b_stic005
      
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
 
      CALL astt812_filter_show('sticsite')
   CALL astt812_filter_show('sticdocdt')
   CALL astt812_filter_show('sticdocno')
   CALL astt812_filter_show('stic001')
   CALL astt812_filter_show('stic002')
   CALL astt812_filter_show('stic010')
   CALL astt812_filter_show('stic004')
   CALL astt812_filter_show('stic005')
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt812_filter_parser(ps_field)
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
 
{<section id="astt812.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt812_filter_show(ps_field)
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
   LET ls_condition = astt812_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt812_query()
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
   CALL g_stid_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt812_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt812_browser_fill("")
      CALL astt812_fetch("")
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
      CALL astt812_filter_show('sticsite')
   CALL astt812_filter_show('sticdocdt')
   CALL astt812_filter_show('sticdocno')
   CALL astt812_filter_show('stic001')
   CALL astt812_filter_show('stic002')
   CALL astt812_filter_show('stic010')
   CALL astt812_filter_show('stic004')
   CALL astt812_filter_show('stic005')
   CALL astt812_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt812_fetch("F") 
      #顯示單身筆數
      CALL astt812_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt812_fetch(p_flag)
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
   
   LET g_stic_m.sticdocno = g_browser[g_current_idx].b_sticdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
   #遮罩相關處理
   LET g_stic_m_mask_o.* =  g_stic_m.*
   CALL astt812_stic_t_mask()
   LET g_stic_m_mask_n.* =  g_stic_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt812_set_act_visible()   
   CALL astt812_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stic_m_t.* = g_stic_m.*
   LET g_stic_m_o.* = g_stic_m.*
   
   LET g_data_owner = g_stic_m.sticownid      
   LET g_data_dept  = g_stic_m.sticowndp
   
   #重新顯示   
   CALL astt812_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt812_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_doctype  LIKE rtai_t.rtai004
   DEFINE l_insert   LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stid_d.clear()   
 
 
   INITIALIZE g_stic_m.* TO NULL             #DEFAULT 設定
   
   LET g_sticdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stic_m.sticownid = g_user
      LET g_stic_m.sticowndp = g_dept
      LET g_stic_m.sticcrtid = g_user
      LET g_stic_m.sticcrtdp = g_dept 
      LET g_stic_m.sticcrtdt = cl_get_current()
      LET g_stic_m.sticmodid = g_user
      LET g_stic_m.sticmoddt = cl_get_current()
      LET g_stic_m.sticstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stic_m.stic001 = "1"
      LET g_stic_m.stic016 = "1"
      LET g_stic_m.stic019 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      #營運據點
      CALL s_aooi500_default(g_prog,'sticsite',g_stic_m.sticsite) RETURNING l_insert,g_stic_m.sticsite
      IF NOT l_insert THEN
         RETURN
      END IF
      CALL s_desc_get_department_desc(g_stic_m.sticsite) RETURNING g_stic_m.sticsite_desc
      DISPLAY BY NAME g_stic_m.sticsite_desc      
      
      #單據日期
      LET g_stic_m.sticdocdt = g_today
      
      #單據編號
      CALL s_arti200_get_def_doc_type(g_stic_m.sticsite,g_prog,'1')
         RETURNING l_success,l_doctype
      LET g_stic_m.sticdocno = l_doctype
      DISPLAY BY NAME g_stic_m.sticdocno
      
      #預租開始日期
#      LET g_stic_m.stic004 = g_today   #160513-00037#21

      #預租結束日期
#      LET g_stic_m.stic005 = g_today    #160513-00037#21

      #採購人員
      LET g_stic_m.stic020 = g_user
      CALL s_desc_get_person_desc(g_stic_m.stic020) RETURNING g_stic_m.stic020_desc
      DISPLAY BY NAME g_stic_m.stic020_desc
      
      #採購部門
      LET g_stic_m.stic021 = g_dept
      CALL s_desc_get_department_desc(g_stic_m.stic021) RETURNING g_stic_m.stic021_desc
      DISPLAY BY NAME g_stic_m.stic021_desc
            
      LET g_site_flag = FALSE            
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stic_m_t.* = g_stic_m.*
      LET g_stic_m_o.* = g_stic_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stic_m.sticstus 
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
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         
      END CASE
 
 
 
    
      CALL astt812_input("a")
      
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
         INITIALIZE g_stic_m.* TO NULL
         INITIALIZE g_stid_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt812_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stid_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt812_set_act_visible()   
   CALL astt812_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sticdocno_t = g_stic_m.sticdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sticent = " ||g_enterprise|| " AND",
                      " sticdocno = '", g_stic_m.sticdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt812_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt812_cl
   
   CALL astt812_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
   
   #遮罩相關處理
   LET g_stic_m_mask_o.* =  g_stic_m.*
   CALL astt812_stic_t_mask()
   LET g_stic_m_mask_n.* =  g_stic_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticsite_desc,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
       g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic002_desc,g_stic_m.stic003,g_stic_m.stic015, 
       g_stic_m.stic015_desc,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic010_desc,g_stic_m.stic011, 
       g_stic_m.stic012,g_stic_m.stic012_desc,g_stic_m.stic013,g_stic_m.stic013_desc,g_stic_m.stic014, 
       g_stic_m.stic014_desc,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic018_desc,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic020_desc, 
       g_stic_m.stic021,g_stic_m.stic021_desc,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic023_desc, 
       g_stic_m.stic024,g_stic_m.stic024_desc,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid, 
       g_stic_m.sticownid_desc,g_stic_m.sticowndp,g_stic_m.sticowndp_desc,g_stic_m.sticcrtid,g_stic_m.sticcrtid_desc, 
       g_stic_m.sticcrtdp,g_stic_m.sticcrtdp_desc,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmodid_desc, 
       g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfid_desc,g_stic_m.sticcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stic_m.sticownid      
   LET g_data_dept  = g_stic_m.sticowndp
   
   #功能已完成,通報訊息中心
   CALL astt812_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt812_modify()
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
   LET g_stic_m_t.* = g_stic_m.*
   LET g_stic_m_o.* = g_stic_m.*
   
   IF g_stic_m.sticdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sticdocno_t = g_stic_m.sticdocno
 
   CALL s_transaction_begin()
   
   OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt812_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt812_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stic_m_mask_o.* =  g_stic_m.*
   CALL astt812_stic_t_mask()
   LET g_stic_m_mask_n.* =  g_stic_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   LET g_site_flag = TRUE
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt812_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_sticdocno_t = g_stic_m.sticdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stic_m.sticmodid = g_user 
LET g_stic_m.sticmoddt = cl_get_current()
LET g_stic_m.sticmodid_desc = cl_get_username(g_stic_m.sticmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt812_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stic_t SET (sticmodid,sticmoddt) = (g_stic_m.sticmodid,g_stic_m.sticmoddt)
          WHERE sticent = g_enterprise AND sticdocno = g_sticdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stic_m.* = g_stic_m_t.*
            CALL astt812_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stic_m.sticdocno != g_stic_m_t.sticdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stid_t SET stiddocno = g_stic_m.sticdocno
 
          WHERE stident = g_enterprise AND stiddocno = g_stic_m_t.sticdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stid_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
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
   CALL astt812_set_act_visible()   
   CALL astt812_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sticent = " ||g_enterprise|| " AND",
                      " sticdocno = '", g_stic_m.sticdocno, "' "
 
   #填到對應位置
   CALL astt812_browser_fill("")
 
   CLOSE astt812_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt812_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt812.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt812_input(p_cmd)
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
   DEFINE  l_ooef004    LIKE ooef_t.ooef004
   DEFINE  l_success    LIKE type_t.num5  
   DEFINE  l_errno      LIKE type_t.chr10   
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
   DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticsite_desc,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
       g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic002_desc,g_stic_m.stic003,g_stic_m.stic015, 
       g_stic_m.stic015_desc,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic010_desc,g_stic_m.stic011, 
       g_stic_m.stic012,g_stic_m.stic012_desc,g_stic_m.stic013,g_stic_m.stic013_desc,g_stic_m.stic014, 
       g_stic_m.stic014_desc,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic018_desc,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic020_desc, 
       g_stic_m.stic021,g_stic_m.stic021_desc,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic023_desc, 
       g_stic_m.stic024,g_stic_m.stic024_desc,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid, 
       g_stic_m.sticownid_desc,g_stic_m.sticowndp,g_stic_m.sticowndp_desc,g_stic_m.sticcrtid,g_stic_m.sticcrtid_desc, 
       g_stic_m.sticcrtdp,g_stic_m.sticcrtdp_desc,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmodid_desc, 
       g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfid_desc,g_stic_m.sticcnfdt
   
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
   LET g_forupd_sql = "SELECT stidseq,stid001,stid002,stid003,stid004,stid005,stid006,stid007,stid008  
       FROM stid_t WHERE stident=? AND stiddocno=? AND stidseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt812_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt812_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt812_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006, 
       g_stic_m.stic002,g_stic_m.stic003,g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic004, 
       g_stic_m.stic005,g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic025, 
       g_stic_m.sticstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt812.input.head" >}
      #單頭段
      INPUT BY NAME g_stic_m.sticsite,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006, 
          g_stic_m.stic002,g_stic_m.stic003,g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic004, 
          g_stic_m.stic005,g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic025, 
          g_stic_m.sticstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt812_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt812_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt812_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt812_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticsite
            
            #add-point:AFTER FIELD sticsite name="input.a.sticsite"
            LET g_stic_m.sticsite_desc = ' '
            DISPLAY BY NAME g_stic_m.sticsite_desc
            IF cl_null(g_stic_m.sticsite) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = 'sub-00507'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET g_stic_m.sticsite = g_stic_m_t.sticsite
               CALL s_desc_get_department_desc(g_stic_m.sticsite)
                  RETURNING g_stic_m.sticsite_desc
               DISPLAY BY NAME g_stic_m.sticsite_desc
               NEXT FIELD CURRENT
            ELSE
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.sticsite != g_stic_m_t.sticsite OR g_stic_m_t.sticsite IS NULL )) THEN
                  CALL s_aooi500_chk(g_prog,'sticsite',g_stic_m.sticsite,g_stic_m.sticsite)
                     RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stic_m.sticsite = g_stic_m_t.sticsite
                     CALL s_desc_get_department_desc(g_stic_m.sticsite)
                        RETURNING g_stic_m.sticsite_desc
                     DISPLAY BY NAME g_stic_m.sticsite_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_site_flag = TRUE
            CALL s_desc_get_department_desc(g_stic_m.sticsite)
               RETURNING g_stic_m.sticsite_desc
            DISPLAY BY NAME g_stic_m.sticsite_desc
            CALL astt812_set_entry(p_cmd)
            CALL astt812_set_no_entry(p_cmd)            
            
            
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stic_m.sticsite
            #CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            #LET g_stic_m.sticsite_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stic_m.sticsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticsite
            #add-point:BEFORE FIELD sticsite name="input.b.sticsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sticsite
            #add-point:ON CHANGE sticsite name="input.g.sticsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticdocdt
            #add-point:BEFORE FIELD sticdocdt name="input.b.sticdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticdocdt
            
            #add-point:AFTER FIELD sticdocdt name="input.a.sticdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sticdocdt
            #add-point:ON CHANGE sticdocdt name="input.g.sticdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticdocno
            #add-point:BEFORE FIELD sticdocno name="input.b.sticdocno"
            #取單據別參照表號
            LET l_ooef004 = ''
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_stic_m.sticsite
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticdocno
            
            #add-point:AFTER FIELD sticdocno name="input.a.sticdocno"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_stic_m.sticdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stic_m.sticdocno != g_sticdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stic_t WHERE "||"sticent = '" ||g_enterprise|| "' AND "||"sticdocno = '"||g_stic_m.sticdocno ||"'",'std-00004',0) THEN 
                     LET g_stic_m.sticdocno = g_sticdocno_t
                     NEXT FIELD CURRENT
                  END IF
                  
                  IF NOT s_aooi200_chk_slip(g_stic_m.sticsite,'',g_stic_m.sticdocno,g_prog) THEN
                     LET g_stic_m.sticdocno = g_sticdocno_t
                     NEXT FIELD CURRENT   
                  END IF                  
               END IF
            END IF




            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sticdocno
            #add-point:ON CHANGE sticdocno name="input.g.sticdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic001
            #add-point:BEFORE FIELD stic001 name="input.b.stic001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic001
            
            #add-point:AFTER FIELD stic001 name="input.a.stic001"
            CALL astt812_set_entry(p_cmd)
            CALL astt812_set_no_entry(p_cmd) 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic001
            #add-point:ON CHANGE stic001 name="input.g.stic001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic006
            #add-point:BEFORE FIELD stic006 name="input.b.stic006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic006
            
            #add-point:AFTER FIELD stic006 name="input.a.stic006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic006
            #add-point:ON CHANGE stic006 name="input.g.stic006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic002
            
            #add-point:AFTER FIELD stic002 name="input.a.stic002"
            LET g_stic_m.stic002_desc = ' '
            DISPLAY BY NAME g_stic_m.stic002_desc
            IF NOT cl_null(g_stic_m.stic002) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic002 != g_stic_m_t.stic002 OR g_stic_m_t.stic002 IS NULL )) THEN   #160824-00007#209 Mark By Ken 161117
               IF (g_stic_m.stic002 != g_stic_m_o.stic002 OR g_stic_m_o.stic002 IS NULL ) THEN   #160824-00007#209 Add By Ken 161117
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stic_m.stic002
                  IF NOT cl_chk_exist("v_pmaa001_26") THEN
                     #LET g_stic_m.stic002 = g_stic_m_t.stic002  #160824-00007#209 Mark By Ken 161117
                     LET g_stic_m.stic002 = g_stic_m_o.stic002   #160824-00007#209 Add By Ken 161117
                     CALL s_desc_get_trading_partner_abbr_desc(g_stic_m.stic002)
                        RETURNING g_stic_m.stic002_desc
                     DISPLAY BY NAME g_stic_m.stic002_desc
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
            END IF
            CALL astt812_get_oofc012(g_stic_m.stic002) 
               RETURNING g_stic_m.stic003
            DISPLAY BY NAME g_stic_m.stic003 
            CALL s_desc_get_trading_partner_abbr_desc(g_stic_m.stic002)
               RETURNING g_stic_m.stic002_desc
            DISPLAY BY NAME g_stic_m.stic002_desc
            LET g_stic_m_o.* = g_stic_m.*  #160824-00007#209 Add By Ken 161117
            
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stic_m.stic002
            #CALL ap_ref_array2(g_ref_fields,"SELECT pmaal003 FROM pmaal_t WHERE pmaallent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            #LET g_stic_m.stic002_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stic_m.stic002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic002
            #add-point:BEFORE FIELD stic002 name="input.b.stic002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic002
            #add-point:ON CHANGE stic002 name="input.g.stic002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic003
            #add-point:BEFORE FIELD stic003 name="input.b.stic003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic003
            
            #add-point:AFTER FIELD stic003 name="input.a.stic003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic003
            #add-point:ON CHANGE stic003 name="input.g.stic003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic015
            
            #add-point:AFTER FIELD stic015 name="input.a.stic015"
            LET g_stic_m.stic015_desc = ''
            DISPLAY BY NAME g_stic_m.stic015_desc
            IF NOT cl_null(g_stic_m.stic015) THEN
               IF g_stic_m.stic015 != g_stic_m_o.stic015 OR cl_null(g_stic_m_o.stic015) THEN
                  IF NOT s_azzi650_chk_exist('2002',g_stic_m.stic015) THEN
                     LET g_stic_m.stic015 = g_stic_m_o.stic015
                     CALL s_desc_get_acc_desc('2002',g_stic_m.stic015) RETURNING g_stic_m.stic015_desc
                     DISPLAY BY NAME g_stic_m.stic015_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stic_m_o.stic015 = g_stic_m.stic015
            CALL s_desc_get_acc_desc('2002',g_stic_m.stic015) RETURNING g_stic_m.stic015_desc
            DISPLAY BY NAME g_stic_m.stic015_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic015
            #add-point:BEFORE FIELD stic015 name="input.b.stic015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic015
            #add-point:ON CHANGE stic015 name="input.g.stic015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic016
            #add-point:BEFORE FIELD stic016 name="input.b.stic016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic016
            
            #add-point:AFTER FIELD stic016 name="input.a.stic016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic016
            #add-point:ON CHANGE stic016 name="input.g.stic016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic010
            
            #add-point:AFTER FIELD stic010 name="input.a.stic010"
            LET g_stic_m.stic010_desc = ' '
            DISPLAY BY NAME g_stic_m.stic010_desc
            IF NOT cl_null(g_stic_m.stic010) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic010 != g_stic_m_t.stic010 OR g_stic_m_t.stic010 IS NULL )) THEN   #160824-00007#209 Mark By Ken 161117
               IF (g_stic_m.stic010 != g_stic_m_o.stic010 OR g_stic_m_o.stic010 IS NULL ) THEN    #160824-00007#209 Add By Ken 161117
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stic_m.stic010
                  LET g_chkparam.err_str[1] = "amh-00630|",g_stic_m.stic010
                  IF NOT cl_chk_exist("v_mhbe001") THEN
                     #LET g_stic_m.stic010 = g_stic_m_t.stic010   #160824-00007#209 Mark By Ken 161117
                     LET g_stic_m.stic010 = g_stic_m_o.stic010    #160824-00007#209 Add By Ken 161117
                     CALL astt812_stic010_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt812_stic010_ref()
            CALL astt812_stic010_default()      
            #樓棟
            CALL astt812_stic012_ref(g_stic_m.stic012) RETURNING g_stic_m.stic012_desc
            DISPLAY BY NAME g_stic_m.stic012_desc
            #樓層
            CALL astt812_stic013_ref(g_stic_m.stic012,g_stic_m.stic013) RETURNING g_stic_m.stic013_desc
            DISPLAY BY NAME g_stic_m.stic013_desc
            #品類
            CALL s_desc_get_rtaxl003_desc(g_stic_m.stic014) RETURNING g_stic_m.stic014_desc
            DISPLAY BY NAME g_stic_m.stic014_desc
            LET g_stic_m_o.* = g_stic_m.*  #160824-00007#209 Add By Ken 161117

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic010
            #add-point:BEFORE FIELD stic010 name="input.b.stic010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic010
            #add-point:ON CHANGE stic010 name="input.g.stic010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic004
            #add-point:BEFORE FIELD stic004 name="input.b.stic004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic004
            
            #add-point:AFTER FIELD stic004 name="input.a.stic004"
            IF NOT cl_null(g_stic_m.stic004) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic004 != g_stic_m_o.stic004 OR g_stic_m_o.stic004 IS NULL )) THEN
                  IF g_stic_m.stic004 < g_today THEN
                     #輸入的預租開始日期%1不可小於系統日期！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00552'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     LET g_errparam.replace[1] = g_stic_m.stic004
                     CALL cl_err()
                     LET g_stic_m.stic004 = g_stic_m_o.stic004
                     NEXT FIELD CURRENT                 
                  END IF
                  IF g_stic_m.stic004 > g_stic_m.stic005 THEN
                     #輸入的預租開始日期%1不可大於預租結束日期%2！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00553'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     LET g_errparam.replace[1] = g_stic_m.stic004
                     LET g_errparam.replace[2] = g_stic_m.stic005
                     CALL cl_err()
                     LET g_stic_m.stic004 = g_stic_m_o.stic004
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
            END IF
            LET g_stic_m_o.stic004 = g_stic_m.stic004
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic004
            #add-point:ON CHANGE stic004 name="input.g.stic004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic005
            #add-point:BEFORE FIELD stic005 name="input.b.stic005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic005
            
            #add-point:AFTER FIELD stic005 name="input.a.stic005"
            IF NOT cl_null(g_stic_m.stic005) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic005 != g_stic_m_o.stic005 OR g_stic_m_o.stic005 IS NULL )) THEN
                  IF g_stic_m.stic005 < g_today THEN
                     #輸入的預租結束日期%1不可小於系統日期！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00554'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     LET g_errparam.replace[1] = g_stic_m.stic005
                     CALL cl_err()
                     LET g_stic_m.stic005 = g_stic_m_o.stic005
                     NEXT FIELD CURRENT                 
                  END IF
                  IF g_stic_m.stic005 < g_stic_m.stic004 THEN
                     #輸入的預租結束日期%1不可小於預租開始日期%2！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00555'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     LET g_errparam.replace[1] = g_stic_m.stic005
                     LET g_errparam.replace[2] = g_stic_m.stic004
                     CALL cl_err()
                     LET g_stic_m.stic005 = g_stic_m_o.stic005
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
            END IF
            LET g_stic_m_o.stic005 = g_stic_m.stic005
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic005
            #add-point:ON CHANGE stic005 name="input.g.stic005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic018
            
            #add-point:AFTER FIELD stic018 name="input.a.stic018"
            LET g_stic_m.stic018_desc = ' '
            DISPLAY BY NAME g_stic_m.stic018_desc
            IF NOT cl_null(g_stic_m.stic018) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic018 != g_stic_m_t.stic018 OR g_stic_m_t.stic018 IS NULL )) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stic_m.stic018
                  IF NOT cl_chk_exist("v_stae001") THEN
                     LET g_stic_m.stic018 = g_stic_m_t.stic018
                     CALL astt812_stic018_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt812_stic018_ref()



            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic018
            #add-point:BEFORE FIELD stic018 name="input.b.stic018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic018
            #add-point:ON CHANGE stic018 name="input.g.stic018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic019
            #add-point:BEFORE FIELD stic019 name="input.b.stic019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic019
            
            #add-point:AFTER FIELD stic019 name="input.a.stic019"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic019
            #add-point:ON CHANGE stic019 name="input.g.stic019"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic020
            
            #add-point:AFTER FIELD stic020 name="input.a.stic020"
            LET g_stic_m.stic020_desc = ' '
            DISPLAY BY NAME g_stic_m.stic020_desc
            IF NOT cl_null(g_stic_m.stic020) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic020 != g_stic_m_o.stic020 OR g_stic_m_o.stic020 IS NULL )) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stic_m.stic020
                  IF NOT cl_chk_exist("v_ooag001") THEN
                     LET g_stic_m.stic020 = g_stic_m_o.stic020
                     CALL s_desc_get_person_desc(g_stic_m.stic020) RETURNING g_stic_m.stic020_desc
                     DISPLAY BY NAME g_stic_m.stic020_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stic_m_o.stic020 = g_stic_m.stic020
            CALL s_desc_get_person_desc(g_stic_m.stic020) RETURNING g_stic_m.stic020_desc
            DISPLAY BY NAME g_stic_m.stic020_desc            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic020
            #add-point:BEFORE FIELD stic020 name="input.b.stic020"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic020
            #add-point:ON CHANGE stic020 name="input.g.stic020"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic021
            
            #add-point:AFTER FIELD stic021 name="input.a.stic021"
            LET g_stic_m.stic021_desc = ' '
            DISPLAY BY NAME g_stic_m.stic021_desc
            IF NOT cl_null(g_stic_m.stic021) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stic_m.stic021 != g_stic_m_t.stic021 OR g_stic_m_t.stic021 IS NULL )) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stic_m.stic021
                  LET g_chkparam.arg2 = g_stic_m.sticdocdt
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                     LET g_stic_m.stic021 = g_stic_m_t.stic021
                     CALL s_desc_get_department_desc(g_stic_m_t.stic021) RETURNING g_stic_m_t.stic021_desc
                     DISPLAY BY NAME g_stic_m_t.stic021_desc 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stic_m_t.stic021 = g_stic_m.stic021
            CALL s_desc_get_department_desc(g_stic_m_t.stic021) RETURNING g_stic_m_t.stic021_desc
            DISPLAY BY NAME g_stic_m_t.stic021_desc 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic021
            #add-point:BEFORE FIELD stic021 name="input.b.stic021"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic021
            #add-point:ON CHANGE stic021 name="input.g.stic021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stic025
            #add-point:BEFORE FIELD stic025 name="input.b.stic025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stic025
            
            #add-point:AFTER FIELD stic025 name="input.a.stic025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stic025
            #add-point:ON CHANGE stic025 name="input.g.stic025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sticstus
            #add-point:BEFORE FIELD sticstus name="input.b.sticstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sticstus
            
            #add-point:AFTER FIELD sticstus name="input.a.sticstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sticstus
            #add-point:ON CHANGE sticstus name="input.g.sticstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sticsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticsite
            #add-point:ON ACTION controlp INFIELD sticsite name="input.c.sticsite"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.sticsite             #給予default值
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sticsite','','i') 
            CALL q_ooef001_24()                                #呼叫開窗
 
            LET g_stic_m.sticsite = g_qryparam.return1              
            DISPLAY g_stic_m.sticsite TO sticsite
            CALL s_desc_get_department_desc(g_stic_m.sticsite) RETURNING g_stic_m.sticsite_desc
            DISPLAY BY NAME g_stic_m.sticsite_desc

            NEXT FIELD sticsite                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sticdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticdocdt
            #add-point:ON ACTION controlp INFIELD sticdocdt name="input.c.sticdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.sticdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticdocno
            #add-point:ON ACTION controlp INFIELD sticdocno name="input.c.sticdocno"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.sticdocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = l_ooef004
            LET g_qryparam.arg2 = g_prog
 
            CALL q_ooba002_1()                                #呼叫開窗
 
            LET g_stic_m.sticdocno = g_qryparam.return1              

            DISPLAY g_stic_m.sticdocno TO sticdocno              #

            NEXT FIELD sticdocno                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic001
            #add-point:ON ACTION controlp INFIELD stic001 name="input.c.stic001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic006
            #add-point:ON ACTION controlp INFIELD stic006 name="input.c.stic006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic002
            #add-point:ON ACTION controlp INFIELD stic002 name="input.c.stic002"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic002             #給予default值

            #給予arg
#            LET g_qryparam.arg1 = "3" #s     #160913-00034#4 by 08172
            LET g_qryparam.arg1 = "('3')"     #160913-00034#4 by 08172

 
            CALL q_pmaa001_1()                                #呼叫開窗
 
            LET g_stic_m.stic002 = g_qryparam.return1              

            DISPLAY g_stic_m.stic002 TO stic002              #
            CALL s_desc_get_trading_partner_abbr_desc(g_stic_m.stic002)
               RETURNING g_stic_m.stic002_desc
            DISPLAY BY NAME g_stic_m.stic002_desc
            NEXT FIELD stic002                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic003
            #add-point:ON ACTION controlp INFIELD stic003 name="input.c.stic003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic015
            #add-point:ON ACTION controlp INFIELD stic015 name="input.c.stic015"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic015             #給予default值
            LET g_qryparam.default2 = "" #g_stic_m.oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_oocq002_2002()                                #呼叫開窗
 
            LET g_stic_m.stic015 = g_qryparam.return1              
            #LET g_stic_m.oocq002 = g_qryparam.return2 
            DISPLAY g_stic_m.stic015 TO stic015              #
            CALL s_desc_get_acc_desc('2002',g_stic_m.stic015) RETURNING g_stic_m.stic015_desc
            DISPLAY BY NAME g_stic_m.stic015_desc            
            #DISPLAY g_stic_m.oocq002 TO oocq002 #應用分類碼
            NEXT FIELD stic015                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic016
            #add-point:ON ACTION controlp INFIELD stic016 name="input.c.stic016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic010
            #add-point:ON ACTION controlp INFIELD stic010 name="input.c.stic010"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhbe001()                                #呼叫開窗
 
            LET g_stic_m.stic010 = g_qryparam.return1              

            DISPLAY g_stic_m.stic010 TO stic010              #
            CALL astt812_stic010_ref()
            NEXT FIELD stic010                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic004
            #add-point:ON ACTION controlp INFIELD stic004 name="input.c.stic004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic005
            #add-point:ON ACTION controlp INFIELD stic005 name="input.c.stic005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic018
            #add-point:ON ACTION controlp INFIELD stic018 name="input.c.stic018"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic018             #給予default值
            LET g_qryparam.default2 = "" #g_stic_m.stael003 #說明
            LET g_qryparam.default3 = "" #g_stic_m.stael004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_stae001()                                #呼叫開窗
 
            LET g_stic_m.stic018 = g_qryparam.return1              
            #LET g_stic_m.stael003 = g_qryparam.return2 
            #LET g_stic_m.stael004 = g_qryparam.return3 
            DISPLAY g_stic_m.stic018 TO stic018              #
            CALL astt812_stic018_ref()
            #DISPLAY g_stic_m.stael003 TO stael003 #說明
            #DISPLAY g_stic_m.stael004 TO stael004 #助記碼
            NEXT FIELD stic018                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic019
            #add-point:ON ACTION controlp INFIELD stic019 name="input.c.stic019"
            
            #END add-point
 
 
         #Ctrlp:input.c.stic020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic020
            #add-point:ON ACTION controlp INFIELD stic020 name="input.c.stic020"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic020             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_stic_m.stic020 = g_qryparam.return1              

            DISPLAY g_stic_m.stic020 TO stic020              #

            NEXT FIELD stic020                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic021
            #add-point:ON ACTION controlp INFIELD stic021 name="input.c.stic021"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stic_m.stic021             #給予default值
            LET g_qryparam.default2 = "" #g_stic_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooeg001()                                #呼叫開窗
 
            LET g_stic_m.stic021 = g_qryparam.return1              
            #LET g_stic_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stic_m.stic021 TO stic021              #
            #DISPLAY g_stic_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD stic021                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stic025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stic025
            #add-point:ON ACTION controlp INFIELD stic025 name="input.c.stic025"
            
            #END add-point
 
 
         #Ctrlp:input.c.sticstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sticstus
            #add-point:ON ACTION controlp INFIELD sticstus name="input.c.sticstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stic_m.sticdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               LET g_stic_m.sticunit = g_stic_m.sticsite
               CALL s_aooi200_gen_docno(g_stic_m.sticsite,g_stic_m.sticdocno,g_stic_m.sticdocdt,g_prog)
                  RETURNING l_success,g_stic_m.sticdocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stic_m.sticdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD sticdocno           
               END IF
               #end add-point
               
               INSERT INTO stic_t (sticent,sticsite,sticdocdt,sticdocno,stic001,stic006,stic007,stic002, 
                   stic003,stic015,stic016,stic010,stic011,stic012,stic013,stic014,stic004,stic005,stic008, 
                   stic009,sticunit,stic018,stic019,stic017,stic020,stic021,stic022,stic023,stic024, 
                   stic025,sticstus,sticownid,sticowndp,sticcrtid,sticcrtdp,sticcrtdt,sticmodid,sticmoddt, 
                   sticcnfid,sticcnfdt)
               VALUES (g_enterprise,g_stic_m.sticsite,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
                   g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003,g_stic_m.stic015, 
                   g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
                   g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009, 
                   g_stic_m.sticunit,g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020, 
                   g_stic_m.stic021,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025, 
                   g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp,g_stic_m.sticcrtid,g_stic_m.sticcrtdp, 
                   g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stic_m:",SQLERRMESSAGE 
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
                  CALL astt812_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt812_b_fill()
                  CALL astt812_b_fill2('0')
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
               CALL astt812_stic_t_mask_restore('restore_mask_o')
               
               UPDATE stic_t SET (sticsite,sticdocdt,sticdocno,stic001,stic006,stic007,stic002,stic003, 
                   stic015,stic016,stic010,stic011,stic012,stic013,stic014,stic004,stic005,stic008,stic009, 
                   sticunit,stic018,stic019,stic017,stic020,stic021,stic022,stic023,stic024,stic025, 
                   sticstus,sticownid,sticowndp,sticcrtid,sticcrtdp,sticcrtdt,sticmodid,sticmoddt,sticcnfid, 
                   sticcnfdt) = (g_stic_m.sticsite,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
                   g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003,g_stic_m.stic015, 
                   g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
                   g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009, 
                   g_stic_m.sticunit,g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020, 
                   g_stic_m.stic021,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025, 
                   g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp,g_stic_m.sticcrtid,g_stic_m.sticcrtdp, 
                   g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfdt) 
 
                WHERE sticent = g_enterprise AND sticdocno = g_sticdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stic_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt812_stic_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stic_m_t)
               LET g_log2 = util.JSON.stringify(g_stic_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sticdocno_t = g_stic_m.sticdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt812.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stid_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = FALSE, 
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stid_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt812_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stid_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            IF NOT astt812_stidcnt_chk() THEN
               CALL astt812_stid_default()
               CALL astt812_b_fill()
            END IF
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
            OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt812_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt812_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stid_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stid_d[l_ac].stidseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stid_d_t.* = g_stid_d[l_ac].*  #BACKUP
               LET g_stid_d_o.* = g_stid_d[l_ac].*  #BACKUP
               CALL astt812_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt812_set_no_entry_b(l_cmd)
               IF NOT astt812_lock_b("stid_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt812_bcl INTO g_stid_d[l_ac].stidseq,g_stid_d[l_ac].stid001,g_stid_d[l_ac].stid002, 
                      g_stid_d[l_ac].stid003,g_stid_d[l_ac].stid004,g_stid_d[l_ac].stid005,g_stid_d[l_ac].stid006, 
                      g_stid_d[l_ac].stid007,g_stid_d[l_ac].stid008
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stid_d_t.stidseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stid_d_mask_o[l_ac].* =  g_stid_d[l_ac].*
                  CALL astt812_stid_t_mask()
                  LET g_stid_d_mask_n[l_ac].* =  g_stid_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt812_show()
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
            INITIALIZE g_stid_d[l_ac].* TO NULL 
            INITIALIZE g_stid_d_t.* TO NULL 
            INITIALIZE g_stid_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stid_d[l_ac].stidseq = "0"
      LET g_stid_d[l_ac].stid002 = "0"
      LET g_stid_d[l_ac].stid006 = "0"
      LET g_stid_d[l_ac].stid007 = "0"
      LET g_stid_d[l_ac].stid008 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
 
            #end add-point
            LET g_stid_d_t.* = g_stid_d[l_ac].*     #新輸入資料
            LET g_stid_d_o.* = g_stid_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt812_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt812_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stid_d[li_reproduce_target].* = g_stid_d[li_reproduce].*
 
               LET g_stid_d[li_reproduce_target].stidseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stid_t 
             WHERE stident = g_enterprise AND stiddocno = g_stic_m.sticdocno
 
               AND stidseq = g_stid_d[l_ac].stidseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stic_m.sticdocno
               LET gs_keys[2] = g_stid_d[g_detail_idx].stidseq
               CALL astt812_insert_b('stid_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stid_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt812_b_fill()
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
               LET gs_keys[01] = g_stic_m.sticdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stid_d_t.stidseq
 
            
               #刪除同層單身
               IF NOT astt812_delete_b('stid_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt812_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt812_key_delete_b(gs_keys,'stid_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt812_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt812_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stid_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stid_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stidseq
            #add-point:BEFORE FIELD stidseq name="input.b.page1.stidseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stidseq
            
            #add-point:AFTER FIELD stidseq name="input.a.page1.stidseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_stic_m.sticdocno IS NOT NULL AND g_stid_d[g_detail_idx].stidseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stic_m.sticdocno != g_sticdocno_t OR g_stid_d[g_detail_idx].stidseq != g_stid_d_t.stidseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stid_t WHERE "||"stident = '" ||g_enterprise|| "' AND "||"stiddocno = '"||g_stic_m.sticdocno ||"' AND "|| "stidseq = '"||g_stid_d[g_detail_idx].stidseq ||"'",'std-00004',0) THEN 
                     LET g_stid_d[l_ac].stidseq = g_stid_d_t.stidseq
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stidseq
            #add-point:ON CHANGE stidseq name="input.g.page1.stidseq"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stidseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stidseq
            #add-point:ON ACTION controlp INFIELD stidseq name="input.c.page1.stidseq"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stid_d[l_ac].* = g_stid_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt812_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stid_d[l_ac].stidseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stid_d[l_ac].* = g_stid_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt812_stid_t_mask_restore('restore_mask_o')
      
               UPDATE stid_t SET (stiddocno,stidseq,stid001,stid002,stid003,stid004,stid005,stid006, 
                   stid007,stid008) = (g_stic_m.sticdocno,g_stid_d[l_ac].stidseq,g_stid_d[l_ac].stid001, 
                   g_stid_d[l_ac].stid002,g_stid_d[l_ac].stid003,g_stid_d[l_ac].stid004,g_stid_d[l_ac].stid005, 
                   g_stid_d[l_ac].stid006,g_stid_d[l_ac].stid007,g_stid_d[l_ac].stid008)
                WHERE stident = g_enterprise AND stiddocno = g_stic_m.sticdocno 
 
                  AND stidseq = g_stid_d_t.stidseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stid_d[l_ac].* = g_stid_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stid_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stid_d[l_ac].* = g_stid_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stic_m.sticdocno
               LET gs_keys_bak[1] = g_sticdocno_t
               LET gs_keys[2] = g_stid_d[g_detail_idx].stidseq
               LET gs_keys_bak[2] = g_stid_d_t.stidseq
               CALL astt812_update_b('stid_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt812_stid_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stid_d[g_detail_idx].stidseq = g_stid_d_t.stidseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stic_m.sticdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stid_d_t.stidseq
 
                  CALL astt812_key_update_b(gs_keys,'stid_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stic_m),util.JSON.stringify(g_stid_d_t)
               LET g_log2 = util.JSON.stringify(g_stic_m),util.JSON.stringify(g_stid_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt812_unlock_b("stid_t","'1'")
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
               LET g_stid_d[li_reproduce_target].* = g_stid_d[li_reproduce].*
 
               LET g_stid_d[li_reproduce_target].stidseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stid_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stid_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt812.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            NEXT FIELD sticsite
            #end add-point  
            NEXT FIELD sticdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stidseq
 
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
 
{<section id="astt812.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt812_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt812_b_fill() #單身填充
      CALL astt812_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt812_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stic_m_mask_o.* =  g_stic_m.*
   CALL astt812_stic_t_mask()
   LET g_stic_m_mask_n.* =  g_stic_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticsite_desc,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
       g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic002_desc,g_stic_m.stic003,g_stic_m.stic015, 
       g_stic_m.stic015_desc,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic010_desc,g_stic_m.stic011, 
       g_stic_m.stic012,g_stic_m.stic012_desc,g_stic_m.stic013,g_stic_m.stic013_desc,g_stic_m.stic014, 
       g_stic_m.stic014_desc,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic018_desc,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic020_desc, 
       g_stic_m.stic021,g_stic_m.stic021_desc,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic023_desc, 
       g_stic_m.stic024,g_stic_m.stic024_desc,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid, 
       g_stic_m.sticownid_desc,g_stic_m.sticowndp,g_stic_m.sticowndp_desc,g_stic_m.sticcrtid,g_stic_m.sticcrtid_desc, 
       g_stic_m.sticcrtdp,g_stic_m.sticcrtdp_desc,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmodid_desc, 
       g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfid_desc,g_stic_m.sticcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stic_m.sticstus 
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
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stid_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
 
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt812_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt812_detail_show()
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
 
{<section id="astt812.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt812_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stic_t.sticdocno 
   DEFINE l_oldno     LIKE stic_t.sticdocno 
 
   DEFINE l_master    RECORD LIKE stic_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stid_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_doctype  LIKE rtai_t.rtai004
   DEFINE l_insert   LIKE type_t.num5
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
   
   IF g_stic_m.sticdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sticdocno_t = g_stic_m.sticdocno
 
    
   LET g_stic_m.sticdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stic_m.sticownid = g_user
      LET g_stic_m.sticowndp = g_dept
      LET g_stic_m.sticcrtid = g_user
      LET g_stic_m.sticcrtdp = g_dept 
      LET g_stic_m.sticcrtdt = cl_get_current()
      LET g_stic_m.sticmodid = g_user
      LET g_stic_m.sticmoddt = cl_get_current()
      LET g_stic_m.sticstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   #營運據點
   CALL s_aooi500_default(g_prog,'sticsite',g_stic_m.sticsite) RETURNING l_insert,g_stic_m.sticsite
   IF NOT l_insert THEN
      RETURN
   END IF
   CALL s_desc_get_department_desc(g_stic_m.sticsite) RETURNING g_stic_m.sticsite_desc
   DISPLAY BY NAME g_stic_m.sticsite_desc      
   
   #單據日期
   LET g_stic_m.sticdocdt = g_today
   
   #單據編號
   CALL s_arti200_get_def_doc_type(g_stic_m.sticsite,g_prog,'1')
      RETURNING l_success,l_doctype
   LET g_stic_m.sticdocno = l_doctype
   DISPLAY BY NAME g_stic_m.sticdocno
   
   #預租開始日期
   LET g_stic_m.stic004 = g_today
  
   #預租結束日期
   LET g_stic_m.stic005 = g_today
  
   #採購人員
   LET g_stic_m.stic020 = g_user
   CALL s_desc_get_person_desc(g_stic_m.stic020) RETURNING g_stic_m.stic020_desc
   DISPLAY BY NAME g_stic_m.stic020_desc
   
   #採購部門
   LET g_stic_m.stic021 = g_dept
   CALL s_desc_get_department_desc(g_stic_m.stic021) RETURNING g_stic_m.stic021_desc
   DISPLAY BY NAME g_stic_m.stic021_desc
         
   #清除商戶編號/商戶電話/費用編號/預收金額/費用單號/確認人員/確認日期
   LET g_stic_m.stic002 = NULL
   LET g_stic_m.stic003 = NULL
   LET g_stic_m.stic018 = NULL
   LET g_stic_m.stic019 = NULL
   LET g_stic_m.stic017 = NULL
   LET g_stic_m.sticcnfid = NULL
   LET g_stic_m.sticcnfdt = NULL         
         
   LET g_site_flag = FALSE 
   LET g_stic_m_t.* = g_stic_m.*
   LET g_stic_m_o.* = g_stic_m.*   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stic_m.sticstus 
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
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt812_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stic_m.* TO NULL
      INITIALIZE g_stid_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt812_show()
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
   CALL astt812_set_act_visible()   
   CALL astt812_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sticdocno_t = g_stic_m.sticdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sticent = " ||g_enterprise|| " AND",
                      " sticdocno = '", g_stic_m.sticdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt812_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt812_idx_chk()
   
   LET g_data_owner = g_stic_m.sticownid      
   LET g_data_dept  = g_stic_m.sticowndp
   
   #功能已完成,通報訊息中心
   CALL astt812_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt812_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stid_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt812_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stid_t
    WHERE stident = g_enterprise AND stiddocno = g_sticdocno_t
 
    INTO TEMP astt812_detail
 
   #將key修正為調整後   
   UPDATE astt812_detail 
      #更新key欄位
      SET stiddocno = g_stic_m.sticdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stid_t SELECT * FROM astt812_detail
   
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
   DROP TABLE astt812_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sticdocno_t = g_stic_m.sticdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt812_delete()
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
   
   IF g_stic_m.sticdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt812_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt812_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stic_m_mask_o.* =  g_stic_m.*
   CALL astt812_stic_t_mask()
   LET g_stic_m_mask_n.* =  g_stic_m.*
   
   CALL astt812_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt812_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sticdocno_t = g_stic_m.sticdocno
 
 
      DELETE FROM stic_t
       WHERE sticent = g_enterprise AND sticdocno = g_stic_m.sticdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stic_m.sticdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_stic_m.sticdocno,g_stic_m.sticdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stid_t
       WHERE stident = g_enterprise AND stiddocno = g_stic_m.sticdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stic_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt812_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stid_d.clear() 
 
     
      CALL astt812_ui_browser_refresh()  
      #CALL astt812_ui_headershow()  
      #CALL astt812_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt812_browser_fill("")
         CALL astt812_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt812_cl
 
   #功能已完成,通報訊息中心
   CALL astt812_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt812.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt812_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stid_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt812_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stidseq,stid001,stid002,stid003,stid004,stid005,stid006,stid007, 
             stid008 ,t1.mhadl006 ,t2.mhaal003 ,t3.mhabl004 ,t4.mhacl005 FROM stid_t",   
                     " INNER JOIN stic_t ON sticent = " ||g_enterprise|| " AND sticdocno = stiddocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN mhadl_t t1 ON t1.mhadlent="||g_enterprise||" AND t1.mhadl001=stid003 AND t1.mhadl002=stid004 AND t1.mhadl003=stid005 AND t1.mhadl004=stid001 AND t1.mhadl005='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t2 ON t2.mhaalent="||g_enterprise||" AND t2.mhaal001=stid003 AND t2.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t3 ON t3.mhablent="||g_enterprise||" AND t3.mhabl001=stid003 AND t3.mhabl002=stid004 AND t3.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN mhacl_t t4 ON t4.mhaclent="||g_enterprise||" AND t4.mhacl001=stid003 AND t4.mhacl002=stid004 AND t4.mhacl003=stid005 AND t4.mhacl004='"||g_dlang||"' ",
 
                     " WHERE stident=? AND stiddocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stid_t.stidseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt812_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt812_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stic_m.sticdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stic_m.sticdocno INTO g_stid_d[l_ac].stidseq,g_stid_d[l_ac].stid001, 
          g_stid_d[l_ac].stid002,g_stid_d[l_ac].stid003,g_stid_d[l_ac].stid004,g_stid_d[l_ac].stid005, 
          g_stid_d[l_ac].stid006,g_stid_d[l_ac].stid007,g_stid_d[l_ac].stid008,g_stid_d[l_ac].stid001_desc, 
          g_stid_d[l_ac].stid003_desc,g_stid_d[l_ac].stid004_desc,g_stid_d[l_ac].stid005_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         CALL astt812_get_mhad008()
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
   
   CALL g_stid_d.deleteElement(g_stid_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt812_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stid_d.getLength()
      LET g_stid_d_mask_o[l_ac].* =  g_stid_d[l_ac].*
      CALL astt812_stid_t_mask()
      LET g_stid_d_mask_n[l_ac].* =  g_stid_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt812_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stid_t
       WHERE stident = g_enterprise AND
         stiddocno = ps_keys_bak[1] AND stidseq = ps_keys_bak[2]
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
         CALL g_stid_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt812_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stid_t
                  (stident,
                   stiddocno,
                   stidseq
                   ,stid001,stid002,stid003,stid004,stid005,stid006,stid007,stid008) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stid_d[g_detail_idx].stid001,g_stid_d[g_detail_idx].stid002,g_stid_d[g_detail_idx].stid003, 
                       g_stid_d[g_detail_idx].stid004,g_stid_d[g_detail_idx].stid005,g_stid_d[g_detail_idx].stid006, 
                       g_stid_d[g_detail_idx].stid007,g_stid_d[g_detail_idx].stid008)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stid_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt812_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stid_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt812_stid_t_mask_restore('restore_mask_o')
               
      UPDATE stid_t 
         SET (stiddocno,
              stidseq
              ,stid001,stid002,stid003,stid004,stid005,stid006,stid007,stid008) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stid_d[g_detail_idx].stid001,g_stid_d[g_detail_idx].stid002,g_stid_d[g_detail_idx].stid003, 
                  g_stid_d[g_detail_idx].stid004,g_stid_d[g_detail_idx].stid005,g_stid_d[g_detail_idx].stid006, 
                  g_stid_d[g_detail_idx].stid007,g_stid_d[g_detail_idx].stid008) 
         WHERE stident = g_enterprise AND stiddocno = ps_keys_bak[1] AND stidseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stid_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stid_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt812_stid_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt812.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt812_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt812.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt812_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt812.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt812_lock_b(ps_table,ps_page)
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
   #CALL astt812_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stid_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt812_bcl USING g_enterprise,
                                       g_stic_m.sticdocno,g_stid_d[g_detail_idx].stidseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt812_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt812.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt812_unlock_b(ps_table,ps_page)
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
      CLOSE astt812_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt812_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sticdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sticdocno",TRUE)
      CALL cl_set_comp_entry("sticdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("sticsite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("stic006",TRUE)
   CALL cl_set_comp_entry("stic010",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt812_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sticdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sticdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sticdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #營運據點
   IF NOT s_aooi500_comp_entry(g_prog,'sticsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("sticsite",FALSE)
   END IF
   
   #控卡原合約編號是否可輸入  當預租類型=2.續租時才開放維護
   IF g_stic_m.stic001 != '2' THEN
      CALL cl_set_comp_entry("stic006",FALSE)
   END IF
   
   #如修改時，單身已有資料，單頭鋪位編號不可修改
   IF p_cmd = 'u' THEN
      IF NOT astt812_stid_cnt_chk(g_stic_m.sticdocno) THEN
         CALL cl_set_comp_entry("stic010",FALSE)
      END IF
   END IF 
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt812_set_entry_b(p_cmd)
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
 
{<section id="astt812.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt812_set_no_entry_b(p_cmd)
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
 
{<section id="astt812.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt812_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt812_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:2)
   IF g_stic_m.sticstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF



   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt812_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt812.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt812_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt812.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt812_default_search()
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
      LET ls_wc = ls_wc, " sticdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stic_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stid_t" 
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
 
{<section id="astt812.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt812_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_stbadocno     LIKE stba_t.stbadocno
   DEFINE l_cnt           LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   #IF g_stic_m.sticstus = 'X' THEN #作廢狀態 #mark by geza 20160526 #160512-00003#15
   IF g_stic_m.sticstus = 'X' OR g_stic_m.sticstus = 'E' THEN #作廢狀態或者终止状态 #mark by geza 20160526 #160512-00003#15
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stic_m.sticdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
   IF STATUS THEN
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt812_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
       g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
       g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
       g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
       g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
       g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
       g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
       g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
       g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
       g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
       g_stic_m.sticcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt812_action_chk() THEN
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticsite_desc,g_stic_m.sticdocdt,g_stic_m.sticdocno,g_stic_m.stic001, 
       g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic002_desc,g_stic_m.stic003,g_stic_m.stic015, 
       g_stic_m.stic015_desc,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic010_desc,g_stic_m.stic011, 
       g_stic_m.stic012,g_stic_m.stic012_desc,g_stic_m.stic013,g_stic_m.stic013_desc,g_stic_m.stic014, 
       g_stic_m.stic014_desc,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
       g_stic_m.stic018,g_stic_m.stic018_desc,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic020_desc, 
       g_stic_m.stic021,g_stic_m.stic021_desc,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic023_desc, 
       g_stic_m.stic024,g_stic_m.stic024_desc,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid, 
       g_stic_m.sticownid_desc,g_stic_m.sticowndp,g_stic_m.sticowndp_desc,g_stic_m.sticcrtid,g_stic_m.sticcrtid_desc, 
       g_stic_m.sticcrtdp,g_stic_m.sticcrtdp_desc,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmodid_desc, 
       g_stic_m.sticmoddt,g_stic_m.sticcnfid,g_stic_m.sticcnfid_desc,g_stic_m.sticcnfdt
 
   CASE g_stic_m.sticstus
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
      WHEN "E"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stic_m.sticstus
            
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
            WHEN "E"
               HIDE OPTION "ended"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      #mark by geza 20160526 #160512-00003#15 (S)
      #open皆改為unconfirmed
#      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
#      #提交和抽單一開始先無條件關
#      CALL cl_set_act_visible("signing,withdraw",FALSE)
#
#      CASE g_stic_m.sticstus
#         WHEN "N"
#            CALL cl_set_act_visible("unconfirmed",FALSE)
#            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
#            IF cl_bpm_chk() THEN
#               CALL cl_set_act_visible("signing",TRUE)
#               CALL cl_set_act_visible("confirmed",FALSE)
#            END IF
#
#         WHEN "X"
#            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
#
#         WHEN "Y"
#            CALL cl_set_act_visible("invalid,confirmed",FALSE)
#
#         #已核准只能顯示確認;其餘應用功能皆隱藏
#         WHEN "A"
#            CALL cl_set_act_visible("confirmed ",TRUE)
#            CALL cl_set_act_visible("unconfirmed,invalid",FALSE)
#
#        #保留修改的功能(如作廢)，隱藏其他應用功能
#         WHEN "R"
#            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
#
#         WHEN "D"
#            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
#
#         #送簽中只能顯示抽單;其餘應用功能皆隱藏
#         WHEN "W"
#            CALL cl_set_act_visible("withdraw",TRUE)
#            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
#
#      END CASE 
      #mark by geza 20160526 #160512-00003#15 (E)    
      #add by geza 20160526 #160512-00003#15 (S)
      #open皆改為unconfirmed
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed,ended",TRUE)
      #提交和抽單一開始先無條件關
      CALL cl_set_act_visible("signing,withdraw",FALSE)

      CASE g_stic_m.sticstus
         WHEN "N"
            CALL cl_set_act_visible("unconfirmed,ended",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF

         WHEN "X"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,ended",FALSE)

         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)

         #已核准只能顯示確認;其餘應用功能皆隱藏
         WHEN "A"
            CALL cl_set_act_visible("confirmed ",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,ended",FALSE)

        #保留修改的功能(如作廢)，隱藏其他應用功能
         WHEN "R"
            CALL cl_set_act_visible("confirmed,unconfirmed,ended",FALSE)

         WHEN "D"
            CALL cl_set_act_visible("confirmed,unconfirmed,ended",FALSE)

         #送簽中只能顯示抽單;其餘應用功能皆隱藏
         WHEN "W"
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,ended",FALSE)

      END CASE 
      #add by geza 20160526 #160512-00003#15 (E)        
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt812_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt812_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt812_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt812_cl
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
      ON ACTION ended
         IF cl_auth_chk_act("ended") THEN
            LET lc_state = "E"
            #add-point:action控制 name="statechange.ended"
            
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
      AND lc_state <> "E"
      ) OR 
      g_stic_m.sticstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL s_transaction_begin()
   
   OPEN astt812_cl USING g_enterprise,g_stic_m.sticdocno
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt812_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   CALL cl_err_collect_init()
   IF lc_state = 'Y' THEN   
      IF NOT s_astt812_conf_chk(g_stic_m.sticdocno) THEN
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
      ELSE          
         IF NOT cl_ask_confirm('aim-00108') THEN
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         ELSE
            IF NOT s_astt812_conf_upd(g_stic_m.sticdocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               #產生費用單
               CALL s_transaction_begin()
               LET r_success = TRUE
               LET r_stbadocno = ''               
               CALL s_expense_astt812(g_stic_m.sticdocno) RETURNING r_success,r_stbadocno
               IF r_success THEN
                  CALL astt812_stic017_upd(r_stbadocno)
                  CALL s_transaction_end('Y','0')   
                  CALL astt812_b_fill()                  
               ELSE
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00556'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err_collect_show()
                  CALL cl_err()
                  CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
                  RETURN                  
               END IF               
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   
   IF lc_state = 'N' THEN
      ##已產生費用單的不可取消確認
      #IF NOT cl_null(g_stic_m.stic017) THEN
      #   CALL s_transaction_end('N','0')         
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.code   = 'amh-00064'
      #   LET g_errparam.extend = ""         
      #   LET g_errparam.popup  = FALSE
      #   CALL cl_err()
      #   CALL cl_err_collect_show()
      #   CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
      #   RETURN
      #END IF   
   
      #費用單已確認，不可取消確認！
      SELECT COUNT(stbadocno) INTO l_cnt
       FROM stba_t
      WHERE stbaent = g_enterprise
        AND stbadocno = g_stic_m.stic017
        AND stbastus = 'Y'
      IF l_cnt > 0 THEN
         CALL s_transaction_end('N','0')
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00642'
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         LET g_errparam.replace[1] = g_stic_m.stic017
         CALL cl_err()
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
      END IF   
      
      IF NOT s_astt812_unconf_chk(g_stic_m.sticdocno) THEN
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00110') THEN
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         ELSE
            IF NOT s_astt812_unconf_upd(g_stic_m.sticdocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               IF NOT cl_null(g_stic_m.stic017) THEN
                  #取消確認時，同時刪除費用單號且更新單頭費用單為空
                  IF NOT s_expense_unconf(g_stic_m.stic017) THEN
                     CALL s_transaction_end('N','0')
                     CALL cl_err_collect_show()
                     RETURN                     
                  ELSE
                     UPDATE stic_t SET stic017 = ''
                      WHERE sticent = g_enterprise
                        AND sticdocno = g_stic_m.sticdocno
                     CALL s_transaction_end('Y','0')
                  END IF
               ELSE
                 CALL s_transaction_end('Y','0')
               END IF
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   
   IF lc_state = 'X' THEN
      IF NOT s_astt812_void_chk(g_stic_m.sticdocno) THEN
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00109') THEN
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         ELSE
            IF NOT s_astt812_void_upd(g_stic_m.sticdocno)  THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   
   #add by geza 20160526 #160512-00003#15 (S)
   IF lc_state = 'E' THEN
      IF NOT s_astt812_end_chk(g_stic_m.sticdocno) THEN
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
      ELSE
         IF NOT cl_ask_confirm('apr-00469') THEN
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         ELSE
            IF NOT s_astt812_end_upd(g_stic_m.sticdocno)  THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF  
   #add by geza 20160526 #160512-00003#15 (E)
   #end add-point
   
   LET g_stic_m.sticmodid = g_user
   LET g_stic_m.sticmoddt = cl_get_current()
   LET g_stic_m.sticstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stic_t 
      SET (sticstus,sticmodid,sticmoddt) 
        = (g_stic_m.sticstus,g_stic_m.sticmodid,g_stic_m.sticmoddt)     
    WHERE sticent = g_enterprise AND sticdocno = g_stic_m.sticdocno
 
    
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
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt812_master_referesh USING g_stic_m.sticdocno INTO g_stic_m.sticsite,g_stic_m.sticdocdt, 
          g_stic_m.sticdocno,g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic003, 
          g_stic_m.stic015,g_stic_m.stic016,g_stic_m.stic010,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic013, 
          g_stic_m.stic014,g_stic_m.stic004,g_stic_m.stic005,g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit, 
          g_stic_m.stic018,g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic021,g_stic_m.stic022, 
          g_stic_m.stic023,g_stic_m.stic024,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticowndp, 
          g_stic_m.sticcrtid,g_stic_m.sticcrtdp,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmoddt, 
          g_stic_m.sticcnfid,g_stic_m.sticcnfdt,g_stic_m.sticsite_desc,g_stic_m.stic002_desc,g_stic_m.stic015_desc, 
          g_stic_m.stic010_desc,g_stic_m.stic012_desc,g_stic_m.stic013_desc,g_stic_m.stic014_desc,g_stic_m.stic018_desc, 
          g_stic_m.stic020_desc,g_stic_m.stic021_desc,g_stic_m.stic023_desc,g_stic_m.stic024_desc,g_stic_m.sticownid_desc, 
          g_stic_m.sticowndp_desc,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp_desc,g_stic_m.sticmodid_desc, 
          g_stic_m.sticcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stic_m.sticsite,g_stic_m.sticsite_desc,g_stic_m.sticdocdt,g_stic_m.sticdocno, 
          g_stic_m.stic001,g_stic_m.stic006,g_stic_m.stic007,g_stic_m.stic002,g_stic_m.stic002_desc, 
          g_stic_m.stic003,g_stic_m.stic015,g_stic_m.stic015_desc,g_stic_m.stic016,g_stic_m.stic010, 
          g_stic_m.stic010_desc,g_stic_m.stic011,g_stic_m.stic012,g_stic_m.stic012_desc,g_stic_m.stic013, 
          g_stic_m.stic013_desc,g_stic_m.stic014,g_stic_m.stic014_desc,g_stic_m.stic004,g_stic_m.stic005, 
          g_stic_m.stic008,g_stic_m.stic009,g_stic_m.sticunit,g_stic_m.stic018,g_stic_m.stic018_desc, 
          g_stic_m.stic019,g_stic_m.stic017,g_stic_m.stic020,g_stic_m.stic020_desc,g_stic_m.stic021, 
          g_stic_m.stic021_desc,g_stic_m.stic022,g_stic_m.stic023,g_stic_m.stic023_desc,g_stic_m.stic024, 
          g_stic_m.stic024_desc,g_stic_m.stic025,g_stic_m.sticstus,g_stic_m.sticownid,g_stic_m.sticownid_desc, 
          g_stic_m.sticowndp,g_stic_m.sticowndp_desc,g_stic_m.sticcrtid,g_stic_m.sticcrtid_desc,g_stic_m.sticcrtdp, 
          g_stic_m.sticcrtdp_desc,g_stic_m.sticcrtdt,g_stic_m.sticmodid,g_stic_m.sticmodid_desc,g_stic_m.sticmoddt, 
          g_stic_m.sticcnfid,g_stic_m.sticcnfid_desc,g_stic_m.sticcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   IF g_stic_m.sticstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)   
   END IF     
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt812_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt812_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt812.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt812_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stid_d.getLength() THEN
         LET g_detail_idx = g_stid_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stid_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stid_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt812_b_fill2(pi_idx)
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
   
   CALL astt812_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt812_fill_chk(ps_idx)
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
 
{<section id="astt812.status_show" >}
PRIVATE FUNCTION astt812_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt812.mask_functions" >}
&include "erp/ast/astt812_mask.4gl"
 
{</section>}
 
{<section id="astt812.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt812_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt812_show()
   CALL astt812_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stic_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stid_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   #確認前檢核段
   IF NOT s_astt812_conf_chk(g_stic_m.sticdocno) THEN
      CLOSE astt812_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL astt812_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt812_ui_headershow()
   CALL astt812_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt812_draw_out()
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
   CALL astt812_ui_headershow()  
   CALL astt812_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt812.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt812_set_pk_array()
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
   LET g_pk_array[1].values = g_stic_m.sticdocno
   LET g_pk_array[1].column = 'sticdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt812.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt812.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt812_msgcentre_notify(lc_state)
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
   CALL astt812_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stic_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt812.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt812_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#41 add-S
   SELECT sticstus  INTO g_stic_m.sticstus
     FROM stic_t
    WHERE sticent = g_enterprise
      AND sticdocno = g_stic_m.sticdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stic_m.sticstus
        WHEN 'E'
           LET g_errno = 'sub-01360'
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
        LET g_errparam.extend = g_stic_m.sticdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt812_set_act_visible()
        CALL astt812_set_act_no_visible()
        CALL astt812_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#41 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt812.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 取得商戶編號的聯絡電話
# Memo...........:
# Usage..........: CALL astt812_get_oofc012(p_stic002)
#                  RETURNING r_oofc012
# Input parameter: p_stic002      商戶編號
# Return code....: r_oofc012      聯絡電話
# Date & Author..: 2016-03-22 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_get_oofc012(p_stic002)
DEFINE p_stic002        LIKE stic_t.stic002
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_pmaa027        LIKE pmaa_t.pmaa027
DEFINE r_oofc012        LIKE oofc_t.oofc012

   LET l_cnt = 0
   LET l_pmaa027 = ''
   LET r_oofc012 = ''
   
   #先取交易對象的聯絡對象識別碼
   SELECT pmaa027 INTO l_pmaa027
     FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa001 = p_stic002
      
      
   #用聯絡對象識別碼(pmaa027)去oofc取對應資料
   #先判斷在oofc_t有無資料
   SELECT COUNT(*) INTO l_cnt
     FROM oofc_t
    WHERE oofcent = g_enterprise
      AND oofc002 = l_pmaa027
      
   IF l_cnt > 0 THEN #在oofc有資料
      #判斷主要聯絡方式是否為電話類型(1,2,10)
      SELECT oofc012 INTO r_oofc012
        FROM oofc_t
       WHERE oofcent = g_enterprise
         AND oofc008 IN ('1','2','10')
         AND oofc010 = 'Y'
         AND oofc002 = l_pmaa027
         
      IF cl_null(r_oofc012) THEN
         SELECT oofc012 INTO r_oofc012
           FROM oofc_t
          WHERE oofcent = g_enterprise
            AND oofc001 IN ('1','2','10')
            AND oofc002 = l_pmaa027      
      END IF      
   ELSE              #在oofc無資料 直接回傳空白
      LET r_oofc012 = ''
      RETURN r_oofc012      
   END IF
   
   

   
   RETURN r_oofc012
END FUNCTION

################################################################################
# Descriptions...: 取得鋪位名稱
# Memo...........:
# Usage..........: CALL astt812_stic010_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-03-22 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic010_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stic_m.stic010
  CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stic_m.stic010_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stic_m.stic010_desc
END FUNCTION

################################################################################
# Descriptions...: 由鋪位編號帶出其他欄位
# Memo...........: 鋪位版本，樓棟，樓層，經營品類
# Usage..........: CALL astt812_stic010_default()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-03-22 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic010_default()


   SELECT mhbe002,mhbe003,mhbe004,mhbe009
     INTO g_stic_m.stic011,g_stic_m.stic012,
          g_stic_m.stic013,g_stic_m.stic014
     FROM mhbe_t
    WHERE mhbeent = g_enterprise
      AND mhbe001 = g_stic_m.stic010
      
   
   DISPLAY BY NAME g_stic_m.stic011
   DISPLAY BY NAME g_stic_m.stic012
   DISPLAY BY NAME g_stic_m.stic013
   DISPLAY BY NAME g_stic_m.stic014
END FUNCTION

################################################################################
# Descriptions...: 取費用編號的說明
# Memo...........:
# Usage..........: CALL astt812_stic018_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-03-23 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic018_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stic_m.stic018
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stic_m.stic018_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stic_m.stic018_desc
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
PRIVATE FUNCTION astt812_stid001_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stid_d[l_ac].stid003
   LET g_ref_fields[2] = g_stid_d[l_ac].stid004
   LET g_ref_fields[3] = g_stid_d[l_ac].stid005
   LET g_ref_fields[4] = g_stid_d[l_ac].stid001
   CALL ap_ref_array2(g_ref_fields,"SELECT mhadl006 FROM mhadl_t WHERE mhadlent='"||g_enterprise||"' AND mhadl001=? AND mhadl002=? AND mhadl003=? AND mhadl004=? AND mhadl005='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stid_d[l_ac].stid001_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stid_d[l_ac].stid001_desc
END FUNCTION

################################################################################
# Descriptions...: 從單頭的鋪位編號到鋪位主檔取得場地資料
# Memo...........:
# Usage..........: CALL astt812_stid_default()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-03-23 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stid_default()
DEFINE l_sql            STRING
DEFINE l_stidsite       LIKE stid_t.stidsite
DEFINE l_stiddocno      LIKE stid_t.stiddocno

   LET l_ac = 1
   LET l_stidsite  = g_stic_m.sticsite
   LET l_stiddocno = g_stic_m.sticdocno

   LET l_sql = " SELECT mhbf002,mhbf003,mhad008,mhbf004,mhbf005, ",
               "        mhbf006,mhbf007,mhbf008,mhbf009 ",
               "   FROM mhbf_t ",
               "   LEFT JOIN mhad_t ON mhbfent = mhadent ",
               "                   AND mhbf004 = mhad001 ",
               "                   AND mhbf005 = mhad002 ",
               "                   AND mhbf006 = mhad003 ",
               "                   AND mhbf002 = mhad004 ",
               "  WHERE mhbfent = ? ",
               "    AND mhbf001 = ? "
   PREPARE astt812_stid_sel_pre FROM l_sql
   DECLARE astt812_stid_sel_cur CURSOR FOR astt812_stid_sel_pre   

   FOREACH astt812_stid_sel_cur USING g_enterprise,g_stic_m.stic010
      INTO g_stid_d[l_ac].stid001,g_stid_d[l_ac].stid002,g_stid_d[l_ac].l_mhad008,
           g_stid_d[l_ac].stid003,g_stid_d[l_ac].stid004,g_stid_d[l_ac].stid005,
           g_stid_d[l_ac].stid006,g_stid_d[l_ac].stid007,g_stid_d[l_ac].stid008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET g_stid_d[l_ac].stidseq = l_ac

      INSERT INTO stid_t
                  (stident,stidsite,stiddocno,stidseq,stid001,
                   stid002,stid003, stid004,  stid005,stid006,
                   stid007,stid008) 
            VALUES(g_enterprise,            l_stidsite,             l_stiddocno,            g_stid_d[l_ac].stidseq,  g_stid_d[l_ac].stid001,
                   g_stid_d[l_ac].stid002,  g_stid_d[l_ac].stid003, g_stid_d[l_ac].stid004, g_stid_d[l_ac].stid005,  g_stid_d[l_ac].stid006, 
                   g_stid_d[l_ac].stid007,  g_stid_d[l_ac].stid008)
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins_stid_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         EXIT FOREACH         
      END IF      
      
      #CALL astt812_stid001_ref()
      LET l_ac = l_ac + 1   
   END FOREACH
END FUNCTION

################################################################################
# Descriptions...: 取得場地使用狀態
# Memo...........:
# Usage..........: CALL astt812_get_mhad008()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-03-23 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_get_mhad008()
   
     SELECT mhad008 INTO g_stid_d[l_ac].l_mhad008 
       FROM mhad_t 
      WHERE mhadent = g_enterprise
        AND mhad001 = g_stid_d[l_ac].stid003  #樓棟
        AND mhad002 = g_stid_d[l_ac].stid004  #樓層
        AND mhad003 = g_stid_d[l_ac].stid005  #區域
        AND mhad004 = g_stid_d[l_ac].stid001  #場地

END FUNCTION

################################################################################
# Descriptions...: 更新費用單號回單頭
# Memo...........:
# Usage..........: CALL astt812_stic017_upd(p_stbadocno)
# Input parameter: p_stbadocno    費用單號
# Return code....: 
# Date & Author..: 2016-03-24 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic017_upd(p_stbadocno)
DEFINE p_stbadocno      LIKE stba_t.stbadocno

   UPDATE stic_t 
      SET stic017 = p_stbadocno
    WHERE sticent = g_enterprise
      AND sticdocno = g_stic_m.sticdocno
   
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ast-00576'
      LET g_errparam.popup = FALSE
      CALL cl_err()    
   ELSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00577'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      LET g_errparam.replace[1] = p_stbadocno
      CALL cl_err()   
   END IF     
   

   CALL astt812_ui_headershow()   #160518-00076#1 160518 by lori add
END FUNCTION

################################################################################
# Descriptions...: 檢查單身是否有資料
# Memo...........: 有資料回傳TRUE,無回傳FALSE
# Usage..........: CALL astt812_stidcnt_chk()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      TURE/FALSE
# Date & Author..: 2016-03-24 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stidcnt_chk()
DEFINE l_cnt            LIKE type_t.num5
DEFINE r_success        LIKE type_t.num5

   LET l_cnt = 0
   LET r_success = TRUE
      
   SELECT COUNT(*) INTO l_cnt
     FROM stid_t
    WHERE stident = g_enterprise
      AND stiddocno = g_stic_m.sticdocno
   IF l_cnt = 0 THEN
      LET r_success = FALSE
   END IF    
      
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 樓棟說明
# Memo...........:
# Usage..........: CALL astt812_stic012_ref(p_stic012)
#                  RETURNING r_stic012_desc
# Input parameter: p_stic012      樓棟編號
# Return code....: r_stic012_desc 樓棟說明
# Date & Author..: 2016-05-05 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic012_ref(p_stic012)
DEFINE p_stic012 LIKE stic_t.stic012
DEFINE r_stic012_desc LIKE type_t.chr80
    
    LET r_stic012_desc = ''
    SELECT mhaal003 INTO r_stic012_desc
      FROM mhaal_t 
     WHERE mhaalent = g_enterprise
       AND mhaal001 = p_stic012 
       AND mhaal002 = g_dlang
    
    RETURN r_stic012_desc
END FUNCTION

################################################################################
# Descriptions...: 取樓層說明
# Memo...........:
# Usage..........: CALL astt812_stic013_ref(p_stic012,p_stic013)
#                  RETURNING r_stic013_desc
# Input parameter: p_stic012      樓棟編號
#                : p_stic012      樓層編號
# Return code....: r_stic013_desc 樓層說明
# Date & Author..: 2016-05-05 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stic013_ref(p_stic012,p_stic013)
DEFINE p_stic012      LIKE stic_t.stic012   
DEFINE p_stic013      LIKE stic_t.stic013
DEFINE r_stic013_desc LIKE type_t.chr80

   LET r_stic013_desc = ''
   SELECT mhabl004 INTO r_stic013_desc
     FROM mhabl_t 
    WHERE mhablent = g_enterprise
      AND mhabl001 = p_stic012 
      AND mhabl002 = p_stic013
      AND mhabl003 = g_dlang
   
   RETURN r_stic013_desc
END FUNCTION

################################################################################
# Descriptions...: 檢查單身是否有筆數
# Memo...........:
# Usage..........: CALL astt812_stid_cnt_chk(p_stiddocno)
#                  RETURNING r_success
# Input parameter: p_stiddocno    單據編號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2016-05-10 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt812_stid_cnt_chk(p_stiddocno)
DEFINE p_stiddocno      LIKE stid_t.stiddocno
DEFINE l_cnt            LIKE type_t.num5
DEFINE r_success        LIKE type_t.num5

   LET r_success = TRUE
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM stid_t
    WHERE stident = g_enterprise
      AND stiddocno = p_stiddocno
   
   IF l_cnt > 0 THEN
      LET r_success = FALSE
   END IF
   
   RETURN r_success 
END FUNCTION

 
{</section>}
 
