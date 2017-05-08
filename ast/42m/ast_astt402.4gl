#該程式未解開Section, 採用最新樣板產出!
{<section id="astt402.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2016-06-21 16:26:00), PR版次:0006(2016-08-26 10:12:33)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000049
#+ Filename...: astt402
#+ Description: 供應商人員合約異動申請作業
#+ Creator....: 06189(2015-04-22 20:43:25)
#+ Modifier...: 07142 -SD/PR- 08734
 
{</section>}
 
{<section id="astt402.global" >}
#應用 i01 樣板自動產生(Version:50)
#add-point:填寫註解說明 name="global.memo"
#+ Modifier...:   No.160318-00025#34   2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#             :      160705-00042#6    2016/07/12 By sakura   查詢程式段q_ooba002_1開窗，呼叫開窗前的g_qryparam.arg若是要傳入程式代號，要改傳入g_prog
#             :      160816-00068#15   2016/08/18 By earl     調整transaction
#160818-00017#39 2016-08-24 By 08734 删除修改未重新判断状态码
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
PRIVATE TYPE type_g_steq_m RECORD
       steqsite LIKE steq_t.steqsite, 
   steqsite_desc LIKE type_t.chr80, 
   steqdocdt LIKE steq_t.steqdocdt, 
   steqdocno LIKE steq_t.steqdocno, 
   stequnit LIKE steq_t.stequnit, 
   stequnit_desc LIKE type_t.chr80, 
   steq000 LIKE steq_t.steq000, 
   steq001 LIKE steq_t.steq001, 
   steq002 LIKE steq_t.steq002, 
   steq015 LIKE steq_t.steq015, 
   steq003 LIKE steq_t.steq003, 
   steq003_desc LIKE type_t.chr500, 
   steq004 LIKE steq_t.steq004, 
   steq004_desc LIKE type_t.chr80, 
   steq005 LIKE steq_t.steq005, 
   steq006 LIKE steq_t.steq006, 
   steq007 LIKE steq_t.steq007, 
   steq008 LIKE steq_t.steq008, 
   steq009 LIKE steq_t.steq009, 
   steq010 LIKE steq_t.steq010, 
   steq011 LIKE steq_t.steq011, 
   steq012 LIKE steq_t.steq012, 
   steq013 LIKE steq_t.steq013, 
   steq013_desc LIKE type_t.chr80, 
   steqacti LIKE steq_t.steqacti, 
   steq014 LIKE steq_t.steq014, 
   steqstus LIKE steq_t.steqstus, 
   steqownid LIKE steq_t.steqownid, 
   steqownid_desc LIKE type_t.chr80, 
   steqowndp LIKE steq_t.steqowndp, 
   steqowndp_desc LIKE type_t.chr80, 
   steqcrtid LIKE steq_t.steqcrtid, 
   steqcrtid_desc LIKE type_t.chr80, 
   steqcrtdp LIKE steq_t.steqcrtdp, 
   steqcrtdp_desc LIKE type_t.chr80, 
   steqcrtdt LIKE steq_t.steqcrtdt, 
   steqmodid LIKE steq_t.steqmodid, 
   steqmodid_desc LIKE type_t.chr80, 
   steqmoddt LIKE steq_t.steqmoddt, 
   steqcnfid LIKE steq_t.steqcnfid, 
   steqcnfid_desc LIKE type_t.chr80, 
   steqcnfdt LIKE steq_t.steqcnfdt
       END RECORD
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD  #查詢方案用陣列 
         b_statepic     LIKE type_t.chr50,
            b_stequnit LIKE steq_t.stequnit,
   b_stequnit_desc LIKE type_t.chr80,
      b_steqsite LIKE steq_t.steqsite,
   b_steqsite_desc LIKE type_t.chr80,
      b_steqdocdt LIKE steq_t.steqdocdt,
      b_steqdocno LIKE steq_t.steqdocno,
      b_steq000 LIKE steq_t.steq000,
      b_steq001 LIKE steq_t.steq001,
      b_steq002 LIKE steq_t.steq002,
      b_steq003 LIKE steq_t.steq003,
      b_steq004 LIKE steq_t.steq004,
   b_steq004_desc LIKE type_t.chr80,
      b_steq005 LIKE steq_t.steq005,
      b_steq006 LIKE steq_t.steq006,
      b_steq007 LIKE steq_t.steq007,
      b_steq008 LIKE steq_t.steq008,
      b_steq009 LIKE steq_t.steq009,
      b_steq010 LIKE steq_t.steq010,
      b_steq011 LIKE steq_t.steq011,
      b_steq012 LIKE steq_t.steq012,
      b_steq013 LIKE steq_t.steq013,
   b_steq013_desc LIKE type_t.chr80,
      b_steqacti LIKE steq_t.steqacti,
      b_steq014 LIKE steq_t.steq014
      END RECORD 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag           LIKE type_t.num5
#end add-point
 
#模組變數(Module Variables)
DEFINE g_steq_m        type_g_steq_m  #單頭變數宣告
DEFINE g_steq_m_t      type_g_steq_m  #單頭舊值宣告(系統還原用)
DEFINE g_steq_m_o      type_g_steq_m  #單頭舊值宣告(其他用途)
DEFINE g_steq_m_mask_o type_g_steq_m  #轉換遮罩前資料
DEFINE g_steq_m_mask_n type_g_steq_m  #轉換遮罩後資料
 
   DEFINE g_steqdocno_t LIKE steq_t.steqdocno
 
   
 
   
 
DEFINE g_wc                  STRING                        #儲存查詢條件
DEFINE g_wc_t                STRING                        #備份查詢條件
DEFINE g_wc_filter           STRING                        #儲存過濾查詢條件
DEFINE g_wc_filter_t         STRING                        #備份過濾查詢條件
DEFINE g_sql                 STRING                        #資料撈取用SQL(含reference)
DEFINE g_forupd_sql          STRING                        #資料鎖定用SQL
DEFINE g_cnt                 LIKE type_t.num10             #指標/統計用變數
DEFINE g_jump                LIKE type_t.num10             #查詢指定的筆數 
DEFINE g_no_ask              LIKE type_t.num5              #是否開啟指定筆視窗 
DEFINE g_rec_b               LIKE type_t.num10             #單身筆數                         
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_pagestart           LIKE type_t.num10             #page起始筆數
DEFINE g_page_action         STRING                        #page action
DEFINE g_header_hidden       LIKE type_t.num5              #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5              #隱藏工作Panel
DEFINE g_page                STRING                        #第幾頁
DEFINE g_current_sw          BOOLEAN                       #Browser所在筆數用開關
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_state               STRING                        #確認前一個動作是否為新增/複製
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_error_show          LIKE type_t.num5              #是否顯示資料過多的錯誤訊息
DEFINE g_aw                  STRING                        #確定當下點擊的單身(modify_detail用)
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #cl_log_modified_record用(舊值)
DEFINE g_log2                STRING                        #cl_log_modified_record用(新值)
 
#快速搜尋用
DEFINE g_searchcol           STRING                        #查詢欄位代碼
DEFINE g_searchstr           STRING                        #查詢欄位字串
DEFINE g_order               STRING                        #查詢排序模式
 
#Browser用
DEFINE g_current_idx         LIKE type_t.num10             #Browser 所在筆數(當下page)
DEFINE g_current_row         LIKE type_t.num10             #Browser 所在筆數(暫存用)
DEFINE g_current_cnt         LIKE type_t.num10             #Browser 總筆數(當下page)
DEFINE g_browser_idx         LIKE type_t.num10             #Browser 所在筆數(所有資料)
DEFINE g_browser_cnt         LIKE type_t.num10             #Browser 總筆數(所有資料)
DEFINE g_row_index           LIKE type_t.num10             #階層樹狀用指標
DEFINE g_add_browse          STRING                        #新增填充用WC
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization" 

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astt402.main" >}
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
   CALL s_aooi390_cre_tmp_table() RETURNING l_success
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT steqsite,'',steqdocdt,steqdocno,stequnit,'',steq000,steq001,steq002,steq015, 
       steq003,'',steq004,'',steq005,steq006,steq007,steq008,steq009,steq010,steq011,steq012,steq013, 
       '',steqacti,steq014,steqstus,steqownid,'',steqowndp,'',steqcrtid,'',steqcrtdp,'',steqcrtdt,steqmodid, 
       '',steqmoddt,steqcnfid,'',steqcnfdt", 
                      " FROM steq_t",
                      " WHERE steqent= ? AND steqdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt402_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.steqsite,t0.steqdocdt,t0.steqdocno,t0.stequnit,t0.steq000,t0.steq001, 
       t0.steq002,t0.steq015,t0.steq003,t0.steq004,t0.steq005,t0.steq006,t0.steq007,t0.steq008,t0.steq009, 
       t0.steq010,t0.steq011,t0.steq012,t0.steq013,t0.steqacti,t0.steq014,t0.steqstus,t0.steqownid,t0.steqowndp, 
       t0.steqcrtid,t0.steqcrtdp,t0.steqcrtdt,t0.steqmodid,t0.steqmoddt,t0.steqcnfid,t0.steqcnfdt,t1.ooefl003 , 
       t2.ooefl003 ,t3.pmaal004 ,t4.ooag011 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 ,t8.ooefl003 ,t9.ooag011 , 
       t10.ooag011",
               " FROM steq_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.steqsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stequnit AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.steq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.steq013  ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.steqownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.steqowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.steqcrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.steqcrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.steqmodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.steqcnfid  ",
 
               " WHERE t0.steqent = " ||g_enterprise|| " AND t0.steqdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt402_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt402 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt402_init()   
 
      #進入選單 Menu (="N")
      CALL astt402_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt402
      
   END IF 
   
   CLOSE astt402_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   CALL s_aooi390_drop_tmp_table()   #add--2015/03/20 By shiun
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt402.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt402_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   #定義combobox狀態
      CALL cl_set_combo_scc_part('steqstus','13','A,D,N,R,W,Y,X')
 
   
   LET g_error_show = 1
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('steq000','32')
   CALL cl_set_combo_scc('steq015','6946')
   CALL cl_set_combo_scc('b_steq000','32')
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
   #根據外部參數進行搜尋
   CALL astt402_default_search()
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astt402_ui_dialog() 
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit   LIKE type_t.num10       #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10       #指標變數
   DEFINE ls_wc     STRING                  #wc用
   DEFINE la_param  RECORD                  #程式串查用變數
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING                  #轉換後的json字串
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET li_exit = FALSE
   LET g_current_row = 0
   LET g_current_idx = 0
 
   #若有外部參數查詢, 則直接顯示資料(隱藏查詢方案)
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
            CALL astt402_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE li_exit = FALSE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_steq_m.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL astt402_init()
      END IF
      
      CALL lib_cl_dlg.cl_dlg_before_display()
      CALL cl_notice()
    
      #確保g_current_idx位於正常區間內
      #小於,等於0則指到第1筆
      IF g_current_idx <= 0 THEN
         LET g_current_idx = 1
      END IF
               
      IF g_main_hidden = 0 THEN
         MENU
            BEFORE MENU 
               #先填充browser資料
               CALL astt402_browser_fill(g_wc,"")
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               
               #還原為原本指定筆數
               IF g_current_row > 0 THEN
                  LET g_current_idx = g_current_row
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL astt402_fetch("")   
               END IF               
               #add-point:ui_dialog段 before menu name="ui_dialog.before_menu"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astt402_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astt402_set_act_visible()
               CALL astt402_set_act_no_visible()
               IF NOT (g_steq_m.steqdocno IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " steqent = " ||g_enterprise|| " AND",
                                     " steqdocno = '", g_steq_m.steqdocno, "' "
 
                  #填到對應位置
                  CALL astt402_browser_fill(g_wc,"")
               END IF
               
            #第一筆資料
            ON ACTION first
               CALL astt402_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astt402_fetch("N")
               LET g_current_row = g_current_idx
            
            #指定筆資料
            ON ACTION jump
               CALL astt402_fetch("/")
               LET g_current_row = g_current_idx
            
            #上一筆資料
            ON ACTION previous
               CALL astt402_fetch("P")
               LET g_current_row = g_current_idx
            
            #最後筆資料
            ON ACTION last 
               CALL astt402_fetch("L")  
               LET g_current_row = g_current_idx
            
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU 
            
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU
            
            #主頁摺疊
            ON ACTION mainhidden   
               LET g_action_choice = "mainhidden"            
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
               EXIT MENU
               
            ON ACTION worksheethidden   #瀏覽頁折疊
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               EXIT MENU
            
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
          
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  CALL astt402_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt402_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt402_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
            
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt402_modify()
               #add-point:ON ACTION modify name="menu2.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt402_delete()
               #add-point:ON ACTION delete name="menu2.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt402_insert()
               #add-point:ON ACTION insert name="menu2.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu2.output"
               
               #END add-point
               &include "erp/ast/astt402_rep.4gl"
               #add-point:ON ACTION output.after name="menu2.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu2.quickprint"
               
               #END add-point
               &include "erp/ast/astt402_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu2.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt402_reproduce()
               #add-point:ON ACTION reproduce name="menu2.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt402_query()
               #add-point:ON ACTION query name="menu2.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu2.bpm_status"
            
            #END add-point
 
 
 
            
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt402_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.menu.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt402_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.menu.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt402_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.menu.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_steq_m.steqdocdt)
 
 
 
            
            #主選單用ACTION
            &include "main_menu_exit_menu.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END MENU
      
      ELSE
      
         DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
           
      
            #左側瀏覽頁簽
            DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTE(COUNT=g_rec_b)
            
               BEFORE ROW
                  #回歸舊筆數位置 (回到當時異動的筆數)
                  LET g_current_idx = DIALOG.getCurrentRow("s_browse")
                  IF g_current_idx = 0 THEN
                     LET g_current_idx = 1
                  END IF
                  LET g_current_row = g_current_idx  #目前指標
                  LET g_current_sw = TRUE
                  CALL cl_show_fld_cont()     
                  
                  #當每次點任一筆資料都會需要用到               
                  CALL astt402_fetch("")
 
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
    
               
            
            END DISPLAY
 
            #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
            
            #end add-point
 
            #查詢方案用
            SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
            SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
         
            BEFORE DIALOG
               #先填充browser資料
               IF g_action_choice <> "mainhidden" THEN
                  CALL astt402_browser_fill(g_wc,"")
               END IF
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               LET g_curr_diag = ui.DIALOG.getCurrent()
               #還原為原本指定筆數
               IF g_current_row > 1 THEN
                  #當刪除最後一筆資料時可能產生錯誤, 進行額外判斷
                  IF g_current_row > g_browser.getLength() THEN
                     LET g_current_row = g_browser.getLength()
                  END IF 
                  LET g_current_idx = g_current_row
                  CALL DIALOG.setCurrentRow("s_browse",g_current_idx)
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL astt402_fetch("")   
               END IF          
               CALL cl_notice()
               
               #add-point:ui_dialog段before name="ui_dialog.b_dialog"
               
               #end add-point  
            
            AFTER DIALOG
               #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astt402_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astt402_set_act_visible()
               CALL astt402_set_act_no_visible()
               IF NOT (g_steq_m.steqdocno IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " steqent = " ||g_enterprise|| " AND",
                                     " steqdocno = '", g_steq_m.steqdocno, "' "
 
                  #填到對應位置
                  CALL astt402_browser_fill(g_wc,"")
               END IF
         
            #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL astt402_filter()
               EXIT DIALOG
 
 
 
            
            #第一筆資料
            ON ACTION first
               CALL astt402_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astt402_fetch("N")
               LET g_current_row = g_current_idx
         
            #指定筆資料
            ON ACTION jump
               CALL astt402_fetch("/")
               LET g_current_row = g_current_idx
         
            #上一筆資料
            ON ACTION previous
               CALL astt402_fetch("P")
               LET g_current_row = g_current_idx
          
            #最後筆資料
            ON ACTION last 
               CALL astt402_fetch("L")  
               LET g_current_row = g_current_idx
         
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
         
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
    
            #主頁摺疊
            ON ACTION mainhidden 
               LET g_action_choice = "mainhidden"                
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
               #EXIT DIALOG
               
            ON ACTION worksheethidden   #瀏覽頁折疊
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               #EXIT DIALOG
         
            ON ACTION exporttoexcel
               LET g_action_choice="exporttoexcel"
               IF cl_auth_chk_act("exporttoexcel") THEN
                  #browser
                  CALL g_export_node.clear()
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
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
 
            
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  CALL astt402_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt402_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt402_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
               
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt402_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt402_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt402_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt402_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt402_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt402_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt402_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
 
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt402_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt402_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt402_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_steq_m.steqdocdt)
 
 
 
 
            #主選單用ACTION
            &include "main_menu_exit_dialog.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END DIALOG 
      
      END IF
      
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      
      #(ver:50) ---start---
      IF li_exit THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      #(ver:50) --- end ---
 
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.browser_fill" >}
#應用 a29 樣板自動產生(Version:15)
#+ 瀏覽頁簽資料填充(一般單檔)
PRIVATE FUNCTION astt402_browser_fill(p_wc,ps_page_action) 
   #add-point:browser_fill段define name="browser_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc              STRING
   DEFINE ls_wc             STRING
   DEFINE ps_page_action    STRING
   DEFINE l_searchcol       STRING
   DEFINE l_sql             STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING
   #end add-point
   
   #add-point:Function前置處理  name="browser_fill.pre_function"
   
   #end add-point
   
   LET l_searchcol = "steqdocno"
 
   LET p_wc = p_wc.trim() #當查詢按下Q時 按下放棄 g_wc = "  " 所以要清掉空白
   IF cl_null(p_wc) THEN  #p_wc 查詢條件
      LET p_wc = " 1=1 " 
   END IF
   #add-point:browser_fill段wc控制 name="browser_fill.wc"
   CALL s_aooi500_sql_where(g_prog,'steqsite') RETURNING l_where
   LET p_wc = p_wc," AND ",l_where
   LET p_wc  = p_wc.trim()
   #end add-point
 
   LET g_sql = " SELECT COUNT(1) FROM steq_t ",
               "  ",
               "  ",
               " WHERE steqent = " ||g_enterprise|| " AND ", 
               p_wc CLIPPED, cl_sql_add_filter("steq_t")
                
   #add-point:browser_fill段cnt_sql name="browser_fill.cnt_sql"
   
   #end add-point
                
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt
      FREE header_cnt_pre 
   END IF
   
   #若超過最大顯示筆數
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt 
         LET g_errparam.code   = 9035
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
   END IF
   
   LET g_error_show = 0
   
   IF ps_page_action = "F" OR
      ps_page_action = "P"  OR
      ps_page_action = "N"  OR
      ps_page_action = "L"  THEN
      LET g_page_action = ps_page_action
   END IF
   
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM
      INITIALIZE g_steq_m.* TO NULL
      CALL g_browser.clear()
      LET g_cnt = 1
      LET ls_wc = p_wc
   ELSE
      LET ls_wc = g_add_browse
      LET g_cnt = g_current_idx
   END IF
   
   LET g_sql = " SELECT t0.steqstus,t0.stequnit,t0.steqsite,t0.steqdocdt,t0.steqdocno,t0.steq000,t0.steq001, 
       t0.steq002,t0.steq003,t0.steq004,t0.steq005,t0.steq006,t0.steq007,t0.steq008,t0.steq009,t0.steq010, 
       t0.steq011,t0.steq012,t0.steq013,t0.steqacti,t0.steq014,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 , 
       t4.ooag011",
               " FROM steq_t t0 ",
               "  ",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stequnit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.steqsite AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.steq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.steq013  ",
 
               " WHERE t0.steqent = " ||g_enterprise|| " AND ", ls_wc, cl_sql_add_filter("steq_t")
   #add-point:browser_fill段fill_wc name="browser_fill.fill_wc"
   
   #end add-point 
   LET g_sql = g_sql, " ORDER BY ",l_searchcol," ",g_order
   #add-point:browser_fill段before_pre name="browser_fill.before_pre"
   
   #end add-point                    
 
   #LET g_sql = cl_sql_add_tabid(g_sql,"steq_t")             #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stequnit,g_browser[g_cnt].b_steqsite, 
          g_browser[g_cnt].b_steqdocdt,g_browser[g_cnt].b_steqdocno,g_browser[g_cnt].b_steq000,g_browser[g_cnt].b_steq001, 
          g_browser[g_cnt].b_steq002,g_browser[g_cnt].b_steq003,g_browser[g_cnt].b_steq004,g_browser[g_cnt].b_steq005, 
          g_browser[g_cnt].b_steq006,g_browser[g_cnt].b_steq007,g_browser[g_cnt].b_steq008,g_browser[g_cnt].b_steq009, 
          g_browser[g_cnt].b_steq010,g_browser[g_cnt].b_steq011,g_browser[g_cnt].b_steq012,g_browser[g_cnt].b_steq013, 
          g_browser[g_cnt].b_steqacti,g_browser[g_cnt].b_steq014,g_browser[g_cnt].b_stequnit_desc,g_browser[g_cnt].b_steqsite_desc, 
          g_browser[g_cnt].b_steq004_desc,g_browser[g_cnt].b_steq013_desc
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "foreach:" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         
         
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
         
         #遮罩相關處理
         CALL astt402_browser_mask()
         
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_rec THEN
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
   
   IF cl_null(g_browser[g_cnt].b_steqdocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt = g_browser.getLength()
   LET g_current_cnt = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   LET g_rec_b = g_browser.getLength()
   LET g_cnt = 0
   DISPLAY g_browser_cnt TO FORMONLY.b_count
   DISPLAY g_browser_cnt TO FORMONLY.h_count
   
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   CALL astt402_set_act_visible()
   CALL astt402_set_act_no_visible()
   #end add-point   
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt402.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt402_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point
   DEFINE ls_return      STRING
   DEFINE ls_result      STRING 
   DEFINE ls_wc          STRING 
   #add-point:cs段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
   
   #清空畫面&資料初始化
   CLEAR FORM
   INITIALIZE g_steq_m.* TO NULL
   INITIALIZE g_wc TO NULL
   LET g_current_row = 1
 
   LET g_qryparam.state = "c"
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #螢幕上取條件
      CONSTRUCT BY NAME g_wc ON steqsite,steqdocdt,steqdocno,stequnit,steq000,steq001,steq002,steq015, 
          steq003,steq003_desc,steq004,steq005,steq006,steq007,steq008,steq009,steq010,steq011,steq012, 
          steq013,steqacti,steq014,steqstus,steqownid,steqowndp,steqcrtid,steqcrtdp,steqcrtdt,steqmodid, 
          steqmoddt,steqcnfid,steqcnfdt
      
         BEFORE CONSTRUCT                                    
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point             
      
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<steqcrtdt>>----
         AFTER FIELD steqcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<steqmoddt>>----
         AFTER FIELD steqmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<steqcnfdt>>----
         AFTER FIELD steqcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<steqpstdt>>----
 
 
 
      
         #一般欄位
                  #Ctrlp:construct.c.steqsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqsite
            #add-point:ON ACTION controlp INFIELD steqsite name="construct.c.steqsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'steqsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqsite  #顯示到畫面上          
            NEXT FIELD steqsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqsite
            #add-point:BEFORE FIELD steqsite name="construct.b.steqsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqsite
            
            #add-point:AFTER FIELD steqsite name="construct.a.steqsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqdocdt
            #add-point:BEFORE FIELD steqdocdt name="construct.b.steqdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqdocdt
            
            #add-point:AFTER FIELD steqdocdt name="construct.a.steqdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqdocdt
            #add-point:ON ACTION controlp INFIELD steqdocdt name="construct.c.steqdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steqdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqdocno
            #add-point:ON ACTION controlp INFIELD steqdocno name="construct.c.steqdocno"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_steqdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqdocno  #顯示到畫面上
            NEXT FIELD steqdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqdocno
            #add-point:BEFORE FIELD steqdocno name="construct.b.steqdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqdocno
            
            #add-point:AFTER FIELD steqdocno name="construct.a.steqdocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stequnit
            #add-point:BEFORE FIELD stequnit name="construct.b.stequnit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stequnit
            
            #add-point:AFTER FIELD stequnit name="construct.a.stequnit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stequnit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stequnit
            #add-point:ON ACTION controlp INFIELD stequnit name="construct.c.stequnit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stequnit',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stequnit  #顯示到畫面上
            NEXT FIELD stequnit                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq000
            #add-point:BEFORE FIELD steq000 name="construct.b.steq000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq000
            
            #add-point:AFTER FIELD steq000 name="construct.a.steq000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq000
            #add-point:ON ACTION controlp INFIELD steq000 name="construct.c.steq000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steq001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq001
            #add-point:ON ACTION controlp INFIELD steq001 name="construct.c.steq001"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stfqunit = '",g_site,"'"
            CALL q_stfq001()                                #呼叫開窗
            DISPLAY g_qryparam.return1 TO steq001             #顯示到畫面上
            NEXT FIELD steq001  
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq001
            #add-point:BEFORE FIELD steq001 name="construct.b.steq001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq001
            
            #add-point:AFTER FIELD steq001 name="construct.a.steq001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq002
            #add-point:BEFORE FIELD steq002 name="construct.b.steq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq002
            
            #add-point:AFTER FIELD steq002 name="construct.a.steq002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq002
            #add-point:ON ACTION controlp INFIELD steq002 name="construct.c.steq002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq015
            #add-point:BEFORE FIELD steq015 name="construct.b.steq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq015
            
            #add-point:AFTER FIELD steq015 name="construct.a.steq015"
          
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq015
            #add-point:ON ACTION controlp INFIELD steq015 name="construct.c.steq015"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq003
            #add-point:ON ACTION controlp INFIELD steq003 name="construct.c.steq003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
         
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            if g_steq_m.steq015 ='1'  or g_steq_m.steq015 IS NULL then 
              CALL q_mhae001()                           #呼叫開窗
            else 
              CALL q_mhbe001()
            end if 
            DISPLAY g_qryparam.return1 TO steq003  #顯示到畫面上
            NEXT FIELD steq003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq003
            #add-point:BEFORE FIELD steq003 name="construct.b.steq003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq003
            
            #add-point:AFTER FIELD steq003 name="construct.a.steq003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq003_desc
            #add-point:BEFORE FIELD steq003_desc name="construct.b.steq003_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq003_desc
            
            #add-point:AFTER FIELD steq003_desc name="construct.a.steq003_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq003_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq003_desc
            #add-point:ON ACTION controlp INFIELD steq003_desc name="construct.c.steq003_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq004
            #add-point:ON ACTION controlp INFIELD steq004 name="construct.c.steq004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = " (1,3)"
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steq004  #顯示到畫面上
            NEXT FIELD steq004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq004
            #add-point:BEFORE FIELD steq004 name="construct.b.steq004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq004
            
            #add-point:AFTER FIELD steq004 name="construct.a.steq004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq005
            #add-point:BEFORE FIELD steq005 name="construct.b.steq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq005
            
            #add-point:AFTER FIELD steq005 name="construct.a.steq005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq005
            #add-point:ON ACTION controlp INFIELD steq005 name="construct.c.steq005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq006
            #add-point:BEFORE FIELD steq006 name="construct.b.steq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq006
            
            #add-point:AFTER FIELD steq006 name="construct.a.steq006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq006
            #add-point:ON ACTION controlp INFIELD steq006 name="construct.c.steq006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq007
            #add-point:BEFORE FIELD steq007 name="construct.b.steq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq007
            
            #add-point:AFTER FIELD steq007 name="construct.a.steq007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq007
            #add-point:ON ACTION controlp INFIELD steq007 name="construct.c.steq007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq008
            #add-point:BEFORE FIELD steq008 name="construct.b.steq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq008
            
            #add-point:AFTER FIELD steq008 name="construct.a.steq008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq008
            #add-point:ON ACTION controlp INFIELD steq008 name="construct.c.steq008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq009
            #add-point:BEFORE FIELD steq009 name="construct.b.steq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq009
            
            #add-point:AFTER FIELD steq009 name="construct.a.steq009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq009
            #add-point:ON ACTION controlp INFIELD steq009 name="construct.c.steq009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq010
            #add-point:BEFORE FIELD steq010 name="construct.b.steq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq010
            
            #add-point:AFTER FIELD steq010 name="construct.a.steq010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq010
            #add-point:ON ACTION controlp INFIELD steq010 name="construct.c.steq010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq011
            #add-point:BEFORE FIELD steq011 name="construct.b.steq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq011
            
            #add-point:AFTER FIELD steq011 name="construct.a.steq011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq011
            #add-point:ON ACTION controlp INFIELD steq011 name="construct.c.steq011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq012
            #add-point:BEFORE FIELD steq012 name="construct.b.steq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq012
            
            #add-point:AFTER FIELD steq012 name="construct.a.steq012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq012
            #add-point:ON ACTION controlp INFIELD steq012 name="construct.c.steq012"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steq013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq013
            #add-point:ON ACTION controlp INFIELD steq013 name="construct.c.steq013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steq013  #顯示到畫面上
            NEXT FIELD steq013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq013
            #add-point:BEFORE FIELD steq013 name="construct.b.steq013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq013
            
            #add-point:AFTER FIELD steq013 name="construct.a.steq013"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqacti
            #add-point:BEFORE FIELD steqacti name="construct.b.steqacti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqacti
            
            #add-point:AFTER FIELD steqacti name="construct.a.steqacti"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqacti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqacti
            #add-point:ON ACTION controlp INFIELD steqacti name="construct.c.steqacti"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq014
            #add-point:BEFORE FIELD steq014 name="construct.b.steq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq014
            
            #add-point:AFTER FIELD steq014 name="construct.a.steq014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq014
            #add-point:ON ACTION controlp INFIELD steq014 name="construct.c.steq014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqstus
            #add-point:BEFORE FIELD steqstus name="construct.b.steqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqstus
            
            #add-point:AFTER FIELD steqstus name="construct.a.steqstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqstus
            #add-point:ON ACTION controlp INFIELD steqstus name="construct.c.steqstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steqownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqownid
            #add-point:ON ACTION controlp INFIELD steqownid name="construct.c.steqownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqownid  #顯示到畫面上
            NEXT FIELD steqownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqownid
            #add-point:BEFORE FIELD steqownid name="construct.b.steqownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqownid
            
            #add-point:AFTER FIELD steqownid name="construct.a.steqownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqowndp
            #add-point:ON ACTION controlp INFIELD steqowndp name="construct.c.steqowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqowndp  #顯示到畫面上
            NEXT FIELD steqowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqowndp
            #add-point:BEFORE FIELD steqowndp name="construct.b.steqowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqowndp
            
            #add-point:AFTER FIELD steqowndp name="construct.a.steqowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqcrtid
            #add-point:ON ACTION controlp INFIELD steqcrtid name="construct.c.steqcrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqcrtid  #顯示到畫面上
            NEXT FIELD steqcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqcrtid
            #add-point:BEFORE FIELD steqcrtid name="construct.b.steqcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqcrtid
            
            #add-point:AFTER FIELD steqcrtid name="construct.a.steqcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steqcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqcrtdp
            #add-point:ON ACTION controlp INFIELD steqcrtdp name="construct.c.steqcrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqcrtdp  #顯示到畫面上
            NEXT FIELD steqcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqcrtdp
            #add-point:BEFORE FIELD steqcrtdp name="construct.b.steqcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqcrtdp
            
            #add-point:AFTER FIELD steqcrtdp name="construct.a.steqcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqcrtdt
            #add-point:BEFORE FIELD steqcrtdt name="construct.b.steqcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steqmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqmodid
            #add-point:ON ACTION controlp INFIELD steqmodid name="construct.c.steqmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqmodid  #顯示到畫面上
            NEXT FIELD steqmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqmodid
            #add-point:BEFORE FIELD steqmodid name="construct.b.steqmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqmodid
            
            #add-point:AFTER FIELD steqmodid name="construct.a.steqmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqmoddt
            #add-point:BEFORE FIELD steqmoddt name="construct.b.steqmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.steqcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqcnfid
            #add-point:ON ACTION controlp INFIELD steqcnfid name="construct.c.steqcnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steqcnfid  #顯示到畫面上
            NEXT FIELD steqcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqcnfid
            #add-point:BEFORE FIELD steqcnfid name="construct.b.steqcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqcnfid
            
            #add-point:AFTER FIELD steqcnfid name="construct.a.steqcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqcnfdt
            #add-point:BEFORE FIELD steqcnfdt name="construct.b.steqcnfdt"
            
            #END add-point
 
 
 
           
      END CONSTRUCT
      
      #add-point:cs段more_construct name="cs.more_construct"
      
      #end add-point   
      
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG
  
   #add-point:cs段after_construct name="cs.after_construct"
   
   #end add-point
  
END FUNCTION
 
{</section>}
 
{<section id="astt402.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt402_filter()
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
      CONSTRUCT g_wc_filter ON stequnit,steqsite,steqdocdt,steqdocno,steq000,steq001,steq002,steq003, 
          steq004,steq005,steq006,steq007,steq008,steq009,steq010,steq011,steq012,steq013,steqacti,steq014 
 
                          FROM s_browse[1].b_stequnit,s_browse[1].b_steqsite,s_browse[1].b_steqdocdt, 
                              s_browse[1].b_steqdocno,s_browse[1].b_steq000,s_browse[1].b_steq001,s_browse[1].b_steq002, 
                              s_browse[1].b_steq003,s_browse[1].b_steq004,s_browse[1].b_steq005,s_browse[1].b_steq006, 
                              s_browse[1].b_steq007,s_browse[1].b_steq008,s_browse[1].b_steq009,s_browse[1].b_steq010, 
                              s_browse[1].b_steq011,s_browse[1].b_steq012,s_browse[1].b_steq013,s_browse[1].b_steqacti, 
                              s_browse[1].b_steq014
 
         BEFORE CONSTRUCT
               DISPLAY astt402_filter_parser('stequnit') TO s_browse[1].b_stequnit
            DISPLAY astt402_filter_parser('steqsite') TO s_browse[1].b_steqsite
            DISPLAY astt402_filter_parser('steqdocdt') TO s_browse[1].b_steqdocdt
            DISPLAY astt402_filter_parser('steqdocno') TO s_browse[1].b_steqdocno
            DISPLAY astt402_filter_parser('steq000') TO s_browse[1].b_steq000
            DISPLAY astt402_filter_parser('steq001') TO s_browse[1].b_steq001
            DISPLAY astt402_filter_parser('steq002') TO s_browse[1].b_steq002
            DISPLAY astt402_filter_parser('steq003') TO s_browse[1].b_steq003
            DISPLAY astt402_filter_parser('steq004') TO s_browse[1].b_steq004
            DISPLAY astt402_filter_parser('steq005') TO s_browse[1].b_steq005
            DISPLAY astt402_filter_parser('steq006') TO s_browse[1].b_steq006
            DISPLAY astt402_filter_parser('steq007') TO s_browse[1].b_steq007
            DISPLAY astt402_filter_parser('steq008') TO s_browse[1].b_steq008
            DISPLAY astt402_filter_parser('steq009') TO s_browse[1].b_steq009
            DISPLAY astt402_filter_parser('steq010') TO s_browse[1].b_steq010
            DISPLAY astt402_filter_parser('steq011') TO s_browse[1].b_steq011
            DISPLAY astt402_filter_parser('steq012') TO s_browse[1].b_steq012
            DISPLAY astt402_filter_parser('steq013') TO s_browse[1].b_steq013
            DISPLAY astt402_filter_parser('steqacti') TO s_browse[1].b_steqacti
            DISPLAY astt402_filter_parser('steq014') TO s_browse[1].b_steq014
      
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
 
      CALL astt402_filter_show('stequnit')
   CALL astt402_filter_show('steqsite')
   CALL astt402_filter_show('steqdocdt')
   CALL astt402_filter_show('steqdocno')
   CALL astt402_filter_show('steq000')
   CALL astt402_filter_show('steq001')
   CALL astt402_filter_show('steq002')
   CALL astt402_filter_show('steq003')
   CALL astt402_filter_show('steq004')
   CALL astt402_filter_show('steq005')
   CALL astt402_filter_show('steq006')
   CALL astt402_filter_show('steq007')
   CALL astt402_filter_show('steq008')
   CALL astt402_filter_show('steq009')
   CALL astt402_filter_show('steq010')
   CALL astt402_filter_show('steq011')
   CALL astt402_filter_show('steq012')
   CALL astt402_filter_show('steq013')
   CALL astt402_filter_show('steqacti')
   CALL astt402_filter_show('steq014')
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt402_filter_parser(ps_field)
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
 
{<section id="astt402.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt402_filter_show(ps_field)
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
   LET ls_condition = astt402_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt402_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc STRING
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   LET ls_wc = g_wc
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL g_browser.clear() 
 
   #browser panel折疊
   IF g_worksheet_hidden THEN
      CALL gfrm_curr.setElementHidden("worksheet_vbox",0)
      CALL gfrm_curr.setElementImage("worksheethidden","worksheethidden-24.png")
      LET g_worksheet_hidden = 0
   END IF
   
   #單頭折疊
   IF g_header_hidden THEN
      CALL gfrm_curr.setElementHidden("vb_master",0)
      CALL gfrm_curr.setElementImage("controls","headerhidden-24")
      LET g_header_hidden = 0
   END IF
 
   INITIALIZE g_steq_m.* TO NULL
   ERROR ""
 
   DISPLAY " " TO FORMONLY.b_count
   DISPLAY " " TO FORMONLY.h_count
   CALL astt402_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt402_browser_fill(g_wc,"F")
      CALL astt402_fetch("")
      RETURN
   ELSE
      LET g_current_row = 1
      LET g_current_cnt = 0
   END IF
   
   #根據條件從新抓取資料
   LET g_error_show = 1
   CALL astt402_browser_fill(g_wc,"F")   # 移到第一頁
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||")")
   
   #備份搜尋條件
   LET ls_wc = g_wc
   
   IF g_browser.getLength() = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "-100" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   ELSE
      CALL astt402_fetch("F") 
   END IF
   
   LET g_wc_filter = ""
   
END FUNCTION
 
{</section>}
 
{<section id="astt402.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt402_fetch(p_fl)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE p_fl       LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   #根據傳入的條件決定抓取的資料
   CASE p_fl
      WHEN "F" 
         LET g_current_idx = 1
      WHEN "P"
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN "N"
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN "L" 
         #LET g_current_idx = g_header_cnt        
         LET g_current_idx = g_browser.getLength()    
      WHEN "/"
         #詢問要指定的筆數
         IF (NOT g_no_ask) THEN      
            CALL cl_getmsg("fetch", g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,": " FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl"
            END PROMPT
            
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               EXIT CASE  
            END IF           
         END IF
         IF g_jump > 0 THEN
            LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE     
   END CASE
 
   #筆數顯示
   LET g_browser_idx = g_current_idx 
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
   END IF
   
   
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength() 
   END IF
   
   # 設定browse索引
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx)
   CALL cl_navigator_setting(g_browser_idx, g_browser_cnt) 
 
   #代表沒有資料, 無需做後續資料撈取之動作
   IF g_current_idx = 0 THEN
      RETURN
   END IF
 
   #根據選定的筆數給予key欄位值
   LET g_steq_m.steqdocno = g_browser[g_current_idx].b_steqdocno
 
                       
   #讀取單頭所有欄位資料
   EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
       g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
       g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
       g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
       g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp, 
       g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt, 
       g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc,g_steq_m.steqownid_desc, 
       g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc,g_steq_m.steqmodid_desc, 
       g_steq_m.steqcnfid_desc
   
   #遮罩相關處理
   LET g_steq_m_mask_o.* =  g_steq_m.*
   CALL astt402_steq_t_mask()
   LET g_steq_m_mask_n.* =  g_steq_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt402_set_act_visible()
   CALL astt402_set_act_no_visible()
 
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #保存單頭舊值
   LET g_steq_m_t.* = g_steq_m.*
   LET g_steq_m_o.* = g_steq_m.*
   
   LET g_data_owner = g_steq_m.steqownid      
   LET g_data_dept  = g_steq_m.steqowndp
   
   #重新顯示
   CALL astt402_show()
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt402_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert      LIKE type_t.num5   
   DEFINE l_success     LIKE type_t.num5   
   DEFINE l_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   CLEAR FORM #清畫面欄位內容
   INITIALIZE g_steq_m.* TO NULL             #DEFAULT 設定
   LET g_steqdocno_t = NULL
 
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   
   WHILE TRUE
      
      #公用欄位給值
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_steq_m.steqownid = g_user
      LET g_steq_m.steqowndp = g_dept
      LET g_steq_m.steqcrtid = g_user
      LET g_steq_m.steqcrtdp = g_dept 
      LET g_steq_m.steqcrtdt = cl_get_current()
      LET g_steq_m.steqmodid = g_user
      LET g_steq_m.steqmoddt = cl_get_current()
      LET g_steq_m.steqstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_steq_m.steq006 = "0"
      LET g_steq_m.steq008 = "0"
      LET g_steq_m.steq009 = "0"
      LET g_steq_m.steq011 = "0"
      LET g_steq_m.steq012 = "0"
 
 
      #add-point:單頭預設值 name="insert.default"
      #site預設值
      CALL s_aooi500_default(g_prog,'steqsite',g_steq_m.steqsite)
         RETURNING l_insert,g_steq_m.steqsite
      IF l_insert = FALSE THEN
         RETURN
      END IF
      LET g_site_flag = FALSE
      CALL astt402_steqsite_ref()
      LET g_steq_m.stequnit = g_site
      CALL astt402_stequnit_ref() 
      LET g_steq_m.steqdocdt = g_today
          
      #单据别
      LET l_success = ''
      LET l_doctype = ''
      CALL s_arti200_get_def_doc_type(g_steq_m.steqsite,g_prog,'1')
           RETURNING l_success, l_doctype
      LET g_steq_m.steqdocno = l_doctype
      LET g_steq_m.steq000 = 'I'
      IF g_steq_m.steq000 = 'I'  THEN 
         LET g_steq_m.steq002 = "1"
      END IF 
      LET g_steq_m.steq013 = g_user
      CALL astt402_steq013_ref()
      LET g_steq_m.steqacti = "Y"
      #end add-point   
     
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_steq_m.steqstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
     
      #資料輸入
      CALL astt402_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         #取消
         LET INT_FLAG = 0
         DISPLAY g_current_cnt TO FORMONLY.h_count     #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index     #當下筆數
         INITIALIZE g_steq_m.* TO NULL
         CALL astt402_show()
         CALL s_transaction_end('N','0')
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN
      END IF
 
      LET g_rec_b = 0
      EXIT WHILE
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt402_set_act_visible()
   CALL astt402_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_steqdocno_t = g_steq_m.steqdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " steqent = " ||g_enterprise|| " AND",
                      " steqdocno = '", g_steq_m.steqdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt402_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
 
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
       g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
       g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
       g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
       g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp, 
       g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt, 
       g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc,g_steq_m.steqownid_desc, 
       g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc,g_steq_m.steqmodid_desc, 
       g_steq_m.steqcnfid_desc
   
   
   #遮罩相關處理
   LET g_steq_m_mask_o.* =  g_steq_m.*
   CALL astt402_steq_t_mask()
   LET g_steq_m_mask_n.* =  g_steq_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_steq_m.steqsite,g_steq_m.steqsite_desc,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit, 
       g_steq_m.stequnit_desc,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003, 
       g_steq_m.steq003_desc,g_steq_m.steq004,g_steq_m.steq004_desc,g_steq_m.steq005,g_steq_m.steq006, 
       g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012, 
       g_steq_m.steq013,g_steq_m.steq013_desc,g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid, 
       g_steq_m.steqownid_desc,g_steq_m.steqowndp,g_steq_m.steqowndp_desc,g_steq_m.steqcrtid,g_steq_m.steqcrtid_desc, 
       g_steq_m.steqcrtdp,g_steq_m.steqcrtdp_desc,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmodid_desc, 
       g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfid_desc,g_steq_m.steqcnfdt
 
   #add-point:新增結束後 name="insert.after"
   if g_steq_m.steq015='1' or g_steq_m.steq015 is null then 
      call astt402_steq003_ref()
   else
      call astt402_steq003_ref_1()
   end if 
   #end add-point 
 
   LET g_data_owner = g_steq_m.steqownid      
   LET g_data_dept  = g_steq_m.steqowndp
 
   #功能已完成,通報訊息中心
   CALL astt402_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt402.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt402_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="modify.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_steq_m.steqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF 
 
   ERROR ""
  
   #備份key值
   LET g_steqdocno_t = g_steq_m.steqdocno
 
   
   CALL s_transaction_begin()
   
   #先lock資料
   OPEN astt402_cl USING g_enterprise,g_steq_m.steqdocno
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt402_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astt402_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
       g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
       g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
       g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
       g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp, 
       g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt, 
       g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc,g_steq_m.steqownid_desc, 
       g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc,g_steq_m.steqmodid_desc, 
       g_steq_m.steqcnfid_desc
 
   #檢查是否允許此動作
   IF NOT astt402_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #遮罩相關處理
   LET g_steq_m_mask_o.* =  g_steq_m.*
   CALL astt402_steq_t_mask()
   LET g_steq_m_mask_n.* =  g_steq_m.*
   
   
 
   #顯示資料
   CALL astt402_show()
   
   WHILE TRUE
      LET g_steq_m.steqdocno = g_steqdocno_t
 
      
      #寫入修改者/修改日期資訊
      LET g_steq_m.steqmodid = g_user 
LET g_steq_m.steqmoddt = cl_get_current()
LET g_steq_m.steqmodid_desc = cl_get_username(g_steq_m.steqmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
 
      #資料輸入
      CALL astt402_input("u")     
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         LET g_steq_m.* = g_steq_m_t.*
         CALL astt402_show()
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         EXIT WHILE
      END IF
 
      #若有modid跟moddt則進行update
      UPDATE steq_t SET (steqmodid,steqmoddt) = (g_steq_m.steqmodid,g_steq_m.steqmoddt)
       WHERE steqent = g_enterprise AND steqdocno = g_steqdocno_t
 
 
      EXIT WHILE
      
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt402_set_act_visible()
   CALL astt402_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " steqent = " ||g_enterprise|| " AND",
                      " steqdocno = '", g_steq_m.steqdocno, "' "
 
   #填到對應位置
   CALL astt402_browser_fill(g_wc,"")
 
   CLOSE astt402_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt402_msgcentre_notify('modify')
   
   LET g_worksheet_hidden = 0
   
END FUNCTION   
 
{</section>}
 
{<section id="astt402.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt402_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point
   DEFINE p_cmd           LIKE type_t.chr1
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_n             LIKE type_t.num10       #檢查重複用  
   DEFINE l_cnt           LIKE type_t.num10       #檢查重複用  
   DEFINE l_lock_sw       LIKE type_t.chr1        #單身鎖住否  
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_i             LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num10
   DEFINE ls_return       STRING
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   define l_msg   string
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_flag                LIKE type_t.chr1
   DEFINE  l_stfqsite            LIKE stfq_t.stfqsite
   #add--2015/07/14 By shiun--(E)
   DEFINE l_oofg_return    DYNAMIC ARRAY OF RECORD    
                   oofg019     LIKE oofg_t.oofg019,   #field
                   oofg020     LIKE oofg_t.oofg020    #value
                           END RECORD
   #add--2015/07/14 By shiun--(E)
   #end add-point
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #切換至輸入畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_steq_m.steqsite,g_steq_m.steqsite_desc,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit, 
       g_steq_m.stequnit_desc,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003, 
       g_steq_m.steq003_desc,g_steq_m.steq004,g_steq_m.steq004_desc,g_steq_m.steq005,g_steq_m.steq006, 
       g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012, 
       g_steq_m.steq013,g_steq_m.steq013_desc,g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid, 
       g_steq_m.steqownid_desc,g_steq_m.steqowndp,g_steq_m.steqowndp_desc,g_steq_m.steqcrtid,g_steq_m.steqcrtid_desc, 
       g_steq_m.steqcrtdp,g_steq_m.steqcrtdp_desc,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmodid_desc, 
       g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfid_desc,g_steq_m.steqcnfdt
   
   CALL cl_set_head_visible("","YES")  
   
   #a-新增,r-複製,u-修改
   IF p_cmd = 'r' THEN
      #此段落的r動作等同於a
      LET p_cmd = 'a'
   END IF
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   LET g_qryparam.state = "i"
   
   #控制key欄位可否輸入
   CALL astt402_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt402_set_no_entry(p_cmd)
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #單頭段
      INPUT BY NAME g_steq_m.steqsite,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000, 
          g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003,g_steq_m.steq003_desc, 
          g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009, 
          g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti,g_steq_m.steq014, 
          g_steq_m.steqstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            #其他table資料備份(確定是否更改用)
            
            #add-point:input開始前 name="input.before.input"
            
            #end add-point
   
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqsite
            
            #add-point:AFTER FIELD steqsite name="input.a.steqsite"
            IF NOT cl_null(g_steq_m.steqsite) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_steq_m.steqsite != g_steq_m_t.steqsite OR g_steq_m_t.steqsite IS NULL )) THEN
                  CALL s_aooi500_chk(g_prog,'steqsite',g_steq_m.steqsite,g_steq_m.steqsite)
                     RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET g_steq_m.steqsite = g_steq_m_t.steqsite
                     CALL astt402_steqsite_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
               LET g_site_flag = TRUE
               CALL astt402_set_entry(p_cmd)
               CALL astt402_set_no_entry(p_cmd)
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steqsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.steqsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steqsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqsite
            #add-point:BEFORE FIELD steqsite name="input.b.steqsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steqsite
            #add-point:ON CHANGE steqsite name="input.g.steqsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqdocdt
            #add-point:BEFORE FIELD steqdocdt name="input.b.steqdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqdocdt
            
            #add-point:AFTER FIELD steqdocdt name="input.a.steqdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steqdocdt
            #add-point:ON CHANGE steqdocdt name="input.g.steqdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqdocno
            #add-point:BEFORE FIELD steqdocno name="input.b.steqdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqdocno
            
            #add-point:AFTER FIELD steqdocno name="input.a.steqdocno"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_steq_m.steqdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_steq_m.steqdocno != g_steqdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM steq_t WHERE "||"steqent = '" ||g_enterprise|| "' AND "||"steqdocno = '"||g_steq_m.steqdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF       
               IF NOT s_aooi200_chk_slip(g_steq_m.steqsite,'',g_steq_m.steqdocno,g_prog) THEN
                  LET g_steq_m.steqdocno = g_steqdocno_t
                  NEXT FIELD CURRENT   
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steqdocno
            #add-point:ON CHANGE steqdocno name="input.g.steqdocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stequnit
            
            #add-point:AFTER FIELD stequnit name="input.a.stequnit"
            IF NOT cl_null(g_steq_m.stequnit) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_steq_m.stequnit != g_steq_m_t.stequnit OR g_steq_m_t.stequnit IS NULL )) THEN
                  CALL s_aooi500_chk(g_prog,'stequnit',g_steq_m.stequnit,g_steq_m.steqsite)
                     RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET g_steq_m.stequnit = g_steq_m_t.stequnit
                     CALL astt402_stequnit_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #修改的時候判斷合同組織要與主檔裡面的合同組織一致
            IF g_steq_m.steq000 = 'U' THEN 
               IF NOT cl_null(g_steq_m.steq001) THEN
                  INITIALIZE l_stfqsite TO NULL 
                  SELECT stfqsite INTO l_stfqsite FROM stfq_t WHERE stfqent = g_enterprise AND stfq001 = g_steq_m.steq001
                  IF l_stfqsite != g_steq_m.stequnit  THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00242'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_steq_m.stequnit = g_steq_m_t.stequnit
                     NEXT FIELD CURRENT
                  END IF                  
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.stequnit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.stequnit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.stequnit_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stequnit
            #add-point:BEFORE FIELD stequnit name="input.b.stequnit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stequnit
            #add-point:ON CHANGE stequnit name="input.g.stequnit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq000
            #add-point:BEFORE FIELD steq000 name="input.b.steq000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq000
            
            #add-point:AFTER FIELD steq000 name="input.a.steq000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq000
            #add-point:ON CHANGE steq000 name="input.g.steq000"
            LET g_steq_m.steq001 = ''
            DISPLAY BY NAME g_steq_m.steq001
            IF g_steq_m.steq000 = 'I' THEN
               LET g_steq_m.steqacti = 'Y'
            END IF
            CALL astt402_set_entry(p_cmd)
            CALL astt402_set_no_entry(p_cmd)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq001
            #add-point:BEFORE FIELD steq001 name="input.b.steq001"
            IF p_cmd = 'a' AND g_steq_m.steq000 = 'I' AND cl_null(g_steq_m.steq001) THEN    
#               CALL s_aooi390('28') RETURNING l_flag,g_steq_m.steq001
               CALL s_aooi390_gen('28') RETURNING l_flag,g_steq_m.steq001,l_oofg_return   #add--2015/07/14 By shiun
               IF g_steq_m.steq000 = 'I' THEN 
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM stfq_t WHERE stfqent = g_enterprise AND stfq001 = g_steq_m.steq001 AND stfqstus = 'Y'
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00230'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_steq_m.steq001 = g_steq_m_t.steq001
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF g_steq_m.steq000 = 'U' THEN 
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM stfq_t WHERE stfqent = g_enterprise AND stfq001 = g_steq_m.steq001 AND stfqstus = 'Y'
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00230'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_steq_m.steq001 = g_steq_m_t.steq001
                     NEXT FIELD CURRENT
                  END IF   
                  CALL astt402_steq001_init()
               END IF
               
            END IF   
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq001
            
            #add-point:AFTER FIELD steq001 name="input.a.steq001"
            IF  NOT cl_null(g_steq_m.steq001) THEN 
#               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_steq_m.steq001 != g_steq_m_t.steq001 )) THEN 
#                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM steq_t WHERE "||"steqent = '" ||g_enterprise|| "' AND "||"steq001 = '"||g_steq_m.steq001 ||"'",'std-00004',0) THEN 
#                     NEXT FIELD CURRENT
#                  END IF
#               END IF
               #add--2015/07/14 By shiun--(S)
               IF NOT s_aooi390_chk('28',g_steq_m.steq001) THEN
                  LET g_steq_m.steq001 = g_steq_m_t.steq001
                  DISPLAY BY NAME g_steq_m.steq001
                  NEXT FIELD CURRENT
               END IF
               #add--2015/07/14 By shiun--(E)
               IF g_steq_m.steq000 = 'I' THEN 
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM stfq_t WHERE stfqent = g_enterprise AND stfq001 = g_steq_m.steq001 
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00230'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_steq_m.steq001 = g_steq_m_t.steq001
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF g_steq_m.steq000 = 'U' THEN 
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt 
                    FROM stfq_t 
                   WHERE stfqent = g_enterprise 
                     AND stfq001 = g_steq_m.steq001 
                     
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00231'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_steq_m.steq001 = g_steq_m_t.steq001
                     NEXT FIELD CURRENT
                  ELSE   
                     SELECT COUNT(*) INTO l_cnt 
                       FROM stfq_t 
                      WHERE stfqent = g_enterprise 
                        AND stfq001 = g_steq_m.steq001 
                        AND stfqstus = 'Y' 
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00243'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_steq_m.steq001 = g_steq_m_t.steq001
                        NEXT FIELD CURRENT   
                     ELSE
                        LET l_cnt = 0
                        SELECT COUNT(*) INTO l_cnt 
                          FROM stfq_t 
                         WHERE stfqent = g_enterprise 
                           AND stfq001 = g_steq_m.steq001 
                           AND stfqstus = 'Y' 
                           AND stfqunit = g_steq_m.steqsite
                        IF l_cnt = 0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'ast-00241'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           LET g_steq_m.steq001 = g_steq_m_t.steq001
                           NEXT FIELD CURRENT
                        ELSE
                           INITIALIZE l_stfqsite TO NULL                        
                           SELECT stfqsite INTO l_stfqsite 
                             FROM stfq_t 
                            WHERE stfqent = g_enterprise 
                              AND stfq001 = g_steq_m.steq001 
                           IF l_stfqsite != g_steq_m.stequnit  THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'ast-00242'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              LET g_steq_m.steq001 = g_steq_m_t.steq001
                              NEXT FIELD CURRENT   
                           ELSE
                              LET l_cnt = 0
                              SELECT COUNT(*) INTO l_cnt 
                                FROM steq_t 
                               WHERE steqent = g_enterprise 
                                 AND steq001 = g_steq_m.steq001 
                                 AND steqstus = 'N' 
                                 AND stequnit = g_steq_m.stequnit
                              IF l_cnt > 0 AND p_cmd = 'a' THEN
                                 INITIALIZE g_errparam TO NULL
                                 LET g_errparam.code = 'ast-00245'
                                 LET g_errparam.extend = ''
                                 LET g_errparam.popup = TRUE
                                 CALL cl_err()
                                 LET g_steq_m.steq001 = g_steq_m_t.steq001
                                 NEXT FIELD CURRENT   
                              END IF                           
                           END IF                                 
                        END IF                        
                     END IF  
                  END IF                     
                  CALL astt402_steq001_init()
               END IF
            END IF   
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq001
            #add-point:ON CHANGE steq001 name="input.g.steq001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq002
            #add-point:BEFORE FIELD steq002 name="input.b.steq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq002
            
            #add-point:AFTER FIELD steq002 name="input.a.steq002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq002
            #add-point:ON CHANGE steq002 name="input.g.steq002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq015
            #add-point:BEFORE FIELD steq015 name="input.b.steq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq015
            
            #add-point:AFTER FIELD steq015 name="input.a.steq015"
            IF g_steq_m.steq015='2' THEN
             LET l_msg=cl_getmsg('amh-00662',g_dlang)
             call cl_set_comp_att_text("steq003",l_msg)
           end if 
           IF g_steq_m.steq015='1' THEN
             LET l_msg=cl_getmsg('amh-00663',g_dlang)
             call cl_set_comp_att_text("steq003",l_msg)
           end if 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq015
            #add-point:ON CHANGE steq015 name="input.g.steq015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq003
            
            #add-point:AFTER FIELD steq003 name="input.a.steq003"
          IF  g_steq_m.steq015='1' THEN 
            IF NOT cl_null(g_steq_m.steq003) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_steq_m.steq003

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhae001") THEN
                  #檢查成功時後續處理
                  #检查专柜编号是否属于当头组织
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt
                    FROM mhae_t 
                   WHERE mhaeent = g_enterprise AND mhae001 = g_steq_m.steq003 AND  mhaesite = g_steq_m.stequnit
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00229'
                     LET g_errparam.extend ='' 
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     
                     LET g_steq_m.steq003 = g_steq_m_t.steq003
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  #檢查失敗時後續處理
                  LET g_steq_m.steq003 = g_steq_m_t.steq003
                  NEXT FIELD CURRENT
               END IF


            END IF 
            CALL astt402_steq003_init()
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.steq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steq003_desc
         ELSE
            IF NOT cl_null(g_steq_m.steq003) THEN 
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_steq_m.steq003
               IF cl_chk_exist("v_mhbe001") THEN
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt
                    FROM mhbe_t 
                   WHERE mhbeent = g_enterprise AND mhbe001 = g_steq_m.steq003 AND  mhbesite = g_steq_m.stequnit
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'amh-00643'
                     LET g_errparam.extend ='' 
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_steq_m.steq003 = g_steq_m_t.steq003
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  #檢查失敗時後續處理
                  LET g_steq_m.steq003 = g_steq_m_t.steq003
                  NEXT FIELD CURRENT
               END IF
            END IF 
            CALL astt402_steq003_init_1()
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.steq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steq003_desc
          end if 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq003
            #add-point:BEFORE FIELD steq003 name="input.b.steq003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq003
            #add-point:ON CHANGE steq003 name="input.g.steq003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq003_desc
            #add-point:BEFORE FIELD steq003_desc name="input.b.steq003_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq003_desc
            
            #add-point:AFTER FIELD steq003_desc name="input.a.steq003_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq003_desc
            #add-point:ON CHANGE steq003_desc name="input.g.steq003_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq004
            
            #add-point:AFTER FIELD steq004 name="input.a.steq004"
            IF NOT cl_null(g_steq_m.steq004) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_steq_m.steq004

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_pmaa001_1") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_steq_m.steq004 = g_steq_m_t.steq004
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steq004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.steq004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steq004_desc
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq004
            #add-point:BEFORE FIELD steq004 name="input.b.steq004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq004
            #add-point:ON CHANGE steq004 name="input.g.steq004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq005
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_steq_m.steq005,"0","0","","","azz-00079",1) THEN
               NEXT FIELD steq005
            END IF 
 
 
 
            #add-point:AFTER FIELD steq005 name="input.a.steq005"
            IF NOT cl_null(g_steq_m.steq005) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq005
            #add-point:BEFORE FIELD steq005 name="input.b.steq005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq005
            #add-point:ON CHANGE steq005 name="input.g.steq005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq006
            #add-point:BEFORE FIELD steq006 name="input.b.steq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq006
            
            #add-point:AFTER FIELD steq006 name="input.a.steq006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq006
            #add-point:ON CHANGE steq006 name="input.g.steq006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq007
            #add-point:BEFORE FIELD steq007 name="input.b.steq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq007
            
            #add-point:AFTER FIELD steq007 name="input.a.steq007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq007
            #add-point:ON CHANGE steq007 name="input.g.steq007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq008
            #add-point:BEFORE FIELD steq008 name="input.b.steq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq008
            
            #add-point:AFTER FIELD steq008 name="input.a.steq008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq008
            #add-point:ON CHANGE steq008 name="input.g.steq008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq009
            #add-point:BEFORE FIELD steq009 name="input.b.steq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq009
            
            #add-point:AFTER FIELD steq009 name="input.a.steq009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq009
            #add-point:ON CHANGE steq009 name="input.g.steq009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq010
            #add-point:BEFORE FIELD steq010 name="input.b.steq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq010
            
            #add-point:AFTER FIELD steq010 name="input.a.steq010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq010
            #add-point:ON CHANGE steq010 name="input.g.steq010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq011
            #add-point:BEFORE FIELD steq011 name="input.b.steq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq011
            
            #add-point:AFTER FIELD steq011 name="input.a.steq011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq011
            #add-point:ON CHANGE steq011 name="input.g.steq011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq012
            #add-point:BEFORE FIELD steq012 name="input.b.steq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq012
            
            #add-point:AFTER FIELD steq012 name="input.a.steq012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq012
            #add-point:ON CHANGE steq012 name="input.g.steq012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq013
            
            #add-point:AFTER FIELD steq013 name="input.a.steq013"
            IF NOT cl_null(g_steq_m.steq013) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_steq_m.steq013
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_steq_m.steq013 = g_steq_m_t.steq013
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steq013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_steq_m.steq013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steq013_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq013
            #add-point:BEFORE FIELD steq013 name="input.b.steq013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq013
            #add-point:ON CHANGE steq013 name="input.g.steq013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqacti
            #add-point:BEFORE FIELD steqacti name="input.b.steqacti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqacti
            
            #add-point:AFTER FIELD steqacti name="input.a.steqacti"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steqacti
            #add-point:ON CHANGE steqacti name="input.g.steqacti"
            IF g_steq_m.steq000 = 'I' THEN
               LET g_steq_m.steqacti = 'Y'
            END IF
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steq014
            #add-point:BEFORE FIELD steq014 name="input.b.steq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steq014
            
            #add-point:AFTER FIELD steq014 name="input.a.steq014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steq014
            #add-point:ON CHANGE steq014 name="input.g.steq014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steqstus
            #add-point:BEFORE FIELD steqstus name="input.b.steqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steqstus
            
            #add-point:AFTER FIELD steqstus name="input.a.steqstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE steqstus
            #add-point:ON CHANGE steqstus name="input.g.steqstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.steqsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqsite
            #add-point:ON ACTION controlp INFIELD steqsite name="input.c.steqsite"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.steqsite             #給予default值

            #給予arg
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'steqsite',g_steq_m.steqsite,'i')

            CALL q_ooef001_24()                                #呼叫開窗

            LET g_steq_m.steqsite = g_qryparam.return1              

            DISPLAY g_steq_m.steqsite TO steqsite              #
            CALL astt402_steqsite_ref()
            
            NEXT FIELD steqsite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.steqdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqdocdt
            #add-point:ON ACTION controlp INFIELD steqdocdt name="input.c.steqdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.steqdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqdocno
            #add-point:ON ACTION controlp INFIELD steqdocno name="input.c.steqdocno"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.steqdocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_steq_m.steqsite AND ooefent  = g_enterprise
            LET g_qryparam.arg1 = l_ooef004
            #LET g_qryparam.arg2 = "astt402"     #160705-00042#6 160712 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#6 160712 by sakura add

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_steq_m.steqdocno = g_qryparam.return1              

            DISPLAY g_steq_m.steqdocno TO steqdocno              #

            NEXT FIELD steqdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stequnit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stequnit
            #add-point:ON ACTION controlp INFIELD stequnit name="input.c.stequnit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.stequnit             #給予default值

            #給予arg
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stequnit',g_steq_m.steqsite,'i')

            CALL q_ooef001_24()                                #呼叫開窗

            LET g_steq_m.stequnit = g_qryparam.return1              

            DISPLAY g_steq_m.stequnit TO stequnit              #
            CALL astt402_stequnit_ref()
            
            NEXT FIELD stequnit    
            #END add-point
 
 
         #Ctrlp:input.c.steq000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq000
            #add-point:ON ACTION controlp INFIELD steq000 name="input.c.steq000"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq001
            #add-point:ON ACTION controlp INFIELD steq001 name="input.c.steq001"
            #開窗i段
            IF g_steq_m.steq000 = 'U' THEN  #申請類型為修改時,才提供開窗
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_steq_m.steq001      #給予default值
               LET g_qryparam.where = " stfqunit = '",g_steq_m.steqsite,"'"      #給予default值
               CALL q_stfq001()                                #呼叫開窗
               LET g_steq_m.steq001 = g_qryparam.return1       #將開窗取得的值回傳到變數
               DISPLAY g_steq_m.steq001 TO steq001             #顯示到畫面上
               NEXT FIELD steq001                              #返回原欄位 
            END IF
            #END add-point
 
 
         #Ctrlp:input.c.steq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq002
            #add-point:ON ACTION controlp INFIELD steq002 name="input.c.steq002"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq015
            #add-point:ON ACTION controlp INFIELD steq015 name="input.c.steq015"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq003
            #add-point:ON ACTION controlp INFIELD steq003 name="input.c.steq003"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.steq003             #給予default值
            LET g_qryparam.default2 = "" #g_steq_m.mhael023 #简称
            #給予arg
            LET g_qryparam.arg1 = g_steq_m.stequnit 


            if g_steq_m.steq015 <>'2'  then 
              CALL q_mhae001()
             LET g_steq_m.steq003 = g_qryparam.return1              
            #LET g_steq_m.mhael023 = g_qryparam.return2 
            DISPLAY g_steq_m.steq003 TO steq003              #
            #DISPLAY g_steq_m.mhael023 TO mhael023 #简称
            CALL astt402_steq003_ref()
            NEXT FIELD steq003                 #呼叫開窗
            else 
              CALL q_mhbe001()
               LET g_steq_m.steq003 = g_qryparam.return1              
               DISPLAY g_steq_m.steq003 TO steq003              #
               CALL astt402_steq003_ref_1()
               NEXT FIELD steq003   
            end if                           #呼叫開窗

            LET g_steq_m.steq003 = g_qryparam.return1              
            #LET g_steq_m.mhael023 = g_qryparam.return2 
            DISPLAY g_steq_m.steq003 TO steq003              #
            #DISPLAY g_steq_m.mhael023 TO mhael023 #简称
            CALL astt402_steq003_ref()
            NEXT FIELD steq003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.steq003_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq003_desc
            #add-point:ON ACTION controlp INFIELD steq003_desc name="input.c.steq003_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq004
            #add-point:ON ACTION controlp INFIELD steq004 name="input.c.steq004"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.steq004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = " (1,3)"


            CALL q_pmaa001_1()                                #呼叫開窗

            LET g_steq_m.steq004 = g_qryparam.return1              

            DISPLAY g_steq_m.steq004 TO steq004              #
            CALL astt402_steq004_ref()
            NEXT FIELD steq004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.steq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq005
            #add-point:ON ACTION controlp INFIELD steq005 name="input.c.steq005"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq006
            #add-point:ON ACTION controlp INFIELD steq006 name="input.c.steq006"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq007
            #add-point:ON ACTION controlp INFIELD steq007 name="input.c.steq007"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq008
            #add-point:ON ACTION controlp INFIELD steq008 name="input.c.steq008"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq009
            #add-point:ON ACTION controlp INFIELD steq009 name="input.c.steq009"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq010
            #add-point:ON ACTION controlp INFIELD steq010 name="input.c.steq010"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq011
            #add-point:ON ACTION controlp INFIELD steq011 name="input.c.steq011"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq012
            #add-point:ON ACTION controlp INFIELD steq012 name="input.c.steq012"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq013
            #add-point:ON ACTION controlp INFIELD steq013 name="input.c.steq013"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_steq_m.steq013             #給予default值
            LET g_qryparam.default2 = "" #g_steq_m.ooag003 #归属部门
            LET g_qryparam.default3 = "" #g_steq_m.ooefl003 #說明(簡稱)
            LET g_qryparam.default4 = "" #g_steq_m.ooag011 #全名
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_ooag001_6()                                #呼叫開窗

            LET g_steq_m.steq013 = g_qryparam.return1              
            #LET g_steq_m.ooag003 = g_qryparam.return2 
            #LET g_steq_m.ooefl003 = g_qryparam.return3 
            #LET g_steq_m.ooag011 = g_qryparam.return4 
            DISPLAY g_steq_m.steq013 TO steq013              #
            #DISPLAY g_steq_m.ooag003 TO ooag003 #归属部门
            #DISPLAY g_steq_m.ooefl003 TO ooefl003 #說明(簡稱)
            #DISPLAY g_steq_m.ooag011 TO ooag011 #全名
            CALL astt402_steq013_ref()
            NEXT FIELD steq013                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.steqacti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqacti
            #add-point:ON ACTION controlp INFIELD steqacti name="input.c.steqacti"
            
            #END add-point
 
 
         #Ctrlp:input.c.steq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steq014
            #add-point:ON ACTION controlp INFIELD steq014 name="input.c.steq014"
            
            #END add-point
 
 
         #Ctrlp:input.c.steqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steqstus
            #add-point:ON ACTION controlp INFIELD steqstus name="input.c.steqstus"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #若點選cancel則離開dialog
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
            
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
  
            IF p_cmd <> "u" THEN
               #當p_cmd不為u代表為新增/複製
               LET l_count = 1  
 
               #確定新增的資料不存在(不重複)
               SELECT COUNT(1) INTO l_count FROM steq_t
                WHERE steqent = g_enterprise AND steqdocno = g_steq_m.steqdocno
 
               IF l_count = 0 THEN
               
                  #add-point:單頭新增前 name="input.head.b_insert"
                  CALL s_aooi200_gen_docno(g_steq_m.steqsite,g_steq_m.steqdocno,g_steq_m.steqdocdt,g_prog)
                     RETURNING l_success,g_steq_m.steqdocno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'apm-00003'
                     LET g_errparam.extend = g_steq_m.steqdocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD indpdocno           
                  END IF  
                  IF g_steq_m.steq000 = 'I' THEN      
                     #add--2015/07/14 By shiun--(S)
                     CALL s_aooi390_get_auto_no('28',g_steq_m.steq001) RETURNING l_success,g_steq_m.steq001
                     IF NOT l_success THEN
                        CALL s_transaction_end('N','0')
                        NEXT FIELD CURRENT
                     END IF   
                     DISPLAY BY NAME g_steq_m.steq001
                     CALL s_aooi390_oofi_upd('28',g_steq_m.steq001) RETURNING l_success
                     #add--2015/07/14 By shiun--(E)
                  END IF                     
                  #end add-point
               
                  #將新增的單頭資料寫入資料庫
                  INSERT INTO steq_t (steqent,steqsite,steqdocdt,steqdocno,stequnit,steq000,steq001, 
                      steq002,steq015,steq003,steq004,steq005,steq006,steq007,steq008,steq009,steq010, 
                      steq011,steq012,steq013,steqacti,steq014,steqstus,steqownid,steqowndp,steqcrtid, 
                      steqcrtdp,steqcrtdt,steqmodid,steqmoddt,steqcnfid,steqcnfdt)
                  VALUES (g_enterprise,g_steq_m.steqsite,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit, 
                      g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003, 
                      g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
                      g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013, 
                      g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp, 
                      g_steq_m.steqcrtid,g_steq_m.steqcrtdp,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt, 
                      g_steq_m.steqcnfid,g_steq_m.steqcnfdt) 
                  
                  #add-point:單頭新增中 name="input.head.m_insert"
                  
                  #end add-point
                  
                  #若寫入錯誤則提示錯誤訊息並返回輸入頁面
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "steq_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  END IF
                  
                  
                  
                  #資料多語言用-增/改
                  
                  
                  #add-point:單頭新增後 name="input.head.a_insert"
                  
                  #end add-point
                  
                  CALL s_transaction_end('Y','0')
               ELSE
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_steq_m.steqdocno
                  LET g_errparam.code   = "std-00006" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF 
            ELSE
               #add-point:單頭修改前 name="input.head.b_update"
               #mark by geza 20150729(S)
               #add--2015/07/14 By shiun--(S)
#               CALL s_aooi390_get_auto_no('28',g_steq_m.steq001) RETURNING l_success,g_steq_m.steq001
#               IF NOT l_success THEN
#                  CALL s_transaction_end('N','0')
#                  NEXT FIELD CURRENT
#               END IF   
#               DISPLAY BY NAME g_steq_m.steq001
#               CALL s_aooi390_oofi_upd('28',g_steq_m.steq001) RETURNING l_success
               #add--2015/07/14 By shiun--(E)    
               #mark by geza 20150729(E)
               #end add-point
               
               #將遮罩欄位還原
               CALL astt402_steq_t_mask_restore('restore_mask_o')
               
               UPDATE steq_t SET (steqsite,steqdocdt,steqdocno,stequnit,steq000,steq001,steq002,steq015, 
                   steq003,steq004,steq005,steq006,steq007,steq008,steq009,steq010,steq011,steq012,steq013, 
                   steqacti,steq014,steqstus,steqownid,steqowndp,steqcrtid,steqcrtdp,steqcrtdt,steqmodid, 
                   steqmoddt,steqcnfid,steqcnfdt) = (g_steq_m.steqsite,g_steq_m.steqdocdt,g_steq_m.steqdocno, 
                   g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
                   g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007, 
                   g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012, 
                   g_steq_m.steq013,g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid, 
                   g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp,g_steq_m.steqcrtdt,g_steq_m.steqmodid, 
                   g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt)
                WHERE steqent = g_enterprise AND steqdocno = g_steqdocno_t #
 
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "steq_t" 
                     LET g_errparam.code   = "std-00009" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "steq_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  OTHERWISE
                     
                     #資料多語言用-增/改
                     
                     
                     #將遮罩欄位進行遮蔽
                     CALL astt402_steq_t_mask_restore('restore_mask_n')
                     
                     #add-point:單頭修改後 name="input.head.a_update"
                     
                     #end add-point
                     #修改歷程記錄(單頭修改)
                     LET g_log1 = util.JSON.stringify(g_steq_m_t)
                     LET g_log2 = util.JSON.stringify(g_steq_m)
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                        CALL s_transaction_end('N','0')
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
               END CASE
               
            END IF
           #controlp
      END INPUT
      
      #add-point:input段more input  name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG
         #CALL cl_err_collect_init()
         #add-point:input段before_dialog  name="input.before_dialog"
         
         #end add-point
          
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name, g_fld_name, g_lang)
 
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
         ACCEPT DIALOG
         
      #放棄輸入
      ON ACTION cancel
         LET g_action_choice=""
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      #在dialog 右上角 (X)
      ON ACTION close 
         LET INT_FLAG = TRUE 
         EXIT DIALOG
    
      #toolbar 離開
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt402_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point
   DEFINE l_newno     LIKE steq_t.steqdocno 
   DEFINE l_oldno     LIKE steq_t.steqdocno 
 
   DEFINE l_master    RECORD LIKE steq_t.* #此變數樣板目前無使用
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_insert      LIKE type_t.num5   
   DEFINE l_success     LIKE type_t.num5   
   DEFINE l_doctype     LIKE rtai_t.rtai004
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #先確定key值無遺漏
   IF g_steq_m.steqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #備份key值
   LET g_steqdocno_t = g_steq_m.steqdocno
 
   
   #清空key值
   LET g_steq_m.steqdocno = ""
 
    
   CALL astt402_set_entry("a")
   CALL astt402_set_no_entry("a")
   
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_steq_m.steqownid = g_user
      LET g_steq_m.steqowndp = g_dept
      LET g_steq_m.steqcrtid = g_user
      LET g_steq_m.steqcrtdp = g_dept 
      LET g_steq_m.steqcrtdt = cl_get_current()
      LET g_steq_m.steqmodid = g_user
      LET g_steq_m.steqmoddt = cl_get_current()
      LET g_steq_m.steqstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   #site預設值
   CALL s_aooi500_default(g_prog,'steqsite',g_steq_m.steqsite)
      RETURNING l_insert,g_steq_m.steqsite
   IF l_insert = FALSE THEN
      RETURN
   END IF
   LET g_site_flag = FALSE
   CALL astt402_steqsite_ref()
   LET g_steq_m.stequnit = g_site
   CALL astt402_stequnit_ref() 
   LET g_steq_m.steqdocdt = g_today
       
   #单据别
   LET l_success = ''
   LET l_doctype = ''
   CALL s_arti200_get_def_doc_type(g_steq_m.steqsite,g_prog,'1')
        RETURNING l_success, l_doctype
   LET g_steq_m.steqdocno = l_doctype
   LET g_steq_m.steq000 = 'I'
   IF g_steq_m.steq000 = 'I'  THEN 
      LET g_steq_m.steq002 = "1"
   END IF 
   LET g_steq_m.steq013 = g_user
   CALL astt402_steq013_ref()
   LET g_steq_m.steqacti = "Y"
   LET g_steq_m.steq001 = ''
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_steq_m.steqstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   #資料輸入
   CALL astt402_input("r")
   
   IF INT_FLAG THEN
      #取消
      INITIALIZE g_steq_m.* TO NULL
      CALL astt402_show()
      CALL s_transaction_end('N','0')
      LET INT_FLAG = 0
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = 9001 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   CALL s_transaction_begin()
   
   #add-point:單頭複製前 name="reproduce.head.b_insert"
   
   #end add-point
   
   #add-point:單頭複製中 name="reproduce.head.m_insert"
   
   #end add-point
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "steq_t:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單頭複製後 name="reproduce.head.a_insert"
   
   #end add-point
   
   CALL s_transaction_end('Y','0')
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt402_set_act_visible()
   CALL astt402_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_steqdocno_t = g_steq_m.steqdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " steqent = " ||g_enterprise|| " AND",
                      " steqdocno = '", g_steq_m.steqdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt402_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
              
   LET g_data_owner = g_steq_m.steqownid      
   LET g_data_dept  = g_steq_m.steqowndp
              
   #功能已完成,通報訊息中心
   CALL astt402_msgcentre_notify('reproduce')
                 
END FUNCTION
 
{</section>}
 
{<section id="astt402.show" >}
#+ 資料顯示 
PRIVATE FUNCTION astt402_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
    define l_msg   string
   #end add-point  
   
   #add-point:show段Function前置處理  name="show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt402_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

     IF g_steq_m.steq015='1' or g_steq_m.steq015 is null THEN
         LET l_msg=cl_getmsg('amh-00663',g_dlang)
         call cl_set_comp_att_text("steq003",l_msg)
     else
           LET l_msg=cl_getmsg('amh-00662',g_dlang)
           call cl_set_comp_att_text("steq003",l_msg)
     end if 
    if g_steq_m.steq015='1' or g_steq_m.steq015 is null then 
      call astt402_steq003_ref()
   else
      call astt402_steq003_ref_1()
   end if 
   #end add-point
 
   #將資料輸出到畫面上
   DISPLAY BY NAME g_steq_m.steqsite,g_steq_m.steqsite_desc,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit, 
       g_steq_m.stequnit_desc,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003, 
       g_steq_m.steq003_desc,g_steq_m.steq004,g_steq_m.steq004_desc,g_steq_m.steq005,g_steq_m.steq006, 
       g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012, 
       g_steq_m.steq013,g_steq_m.steq013_desc,g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid, 
       g_steq_m.steqownid_desc,g_steq_m.steqowndp,g_steq_m.steqowndp_desc,g_steq_m.steqcrtid,g_steq_m.steqcrtid_desc, 
       g_steq_m.steqcrtdp,g_steq_m.steqcrtdp_desc,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmodid_desc, 
       g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfid_desc,g_steq_m.steqcnfdt
   
   #儲存PK
   LET l_ac = g_current_idx
   CALL astt402_set_pk_array()
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_steq_m.steqstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
 
   #顯示有特殊格式設定的欄位或說明
   CALL cl_show_fld_cont()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.delete" >}
#+ 資料刪除 
PRIVATE FUNCTION astt402_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_steq_m.steqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
    
   LET g_steqdocno_t = g_steq_m.steqdocno
 
   
   
 
   OPEN astt402_cl USING g_enterprise,g_steq_m.steqdocno
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt402_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astt402_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
       g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
       g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
       g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
       g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp, 
       g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt, 
       g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc,g_steq_m.steqownid_desc, 
       g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc,g_steq_m.steqmodid_desc, 
       g_steq_m.steqcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt402_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_steq_m_mask_o.* =  g_steq_m.*
   CALL astt402_steq_t_mask()
   LET g_steq_m_mask_n.* =  g_steq_m.*
   
   #將最新資料顯示到畫面上
   CALL astt402_show()
   
   IF cl_ask_delete() THEN
 
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point
 
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt402_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
 
      DELETE FROM steq_t 
       WHERE steqent = g_enterprise AND steqdocno = g_steq_m.steqdocno 
 
 
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "steq_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
  
      
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_steq_m.steqdocno,g_steq_m.steqdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
      
       
 
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_steq_m)   #(ver:49)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:49)
         CLOSE astt402_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      CLEAR FORM
      CALL astt402_ui_browser_refresh()
      
      #確保畫面上保有資料
      IF g_browser_cnt > 0 THEN
         #CALL astt402_browser_fill(g_wc,"")
         CALL astt402_fetch("P")
      ELSE
         CLEAR FORM
      END IF
      CALL s_transaction_end('Y','0')
   ELSE    
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt402_cl
 
   #功能已完成,通報訊息中心
   CALL astt402_msgcentre_notify('delete')
 
   #add-point:單頭刪除完成後 name="delete.a_delete"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt402_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_steqdocno = g_steq_m.steqdocno
 
         THEN
         CALL g_browser.deleteElement(l_i)
       END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count     #page count
   DISPLAY g_header_cnt  TO FORMONLY.h_count     #page count
  
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
  
END FUNCTION
 
{</section>}
 
{<section id="astt402.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt402_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization" 
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point     
    
   #add-point:Function前置處理 name="set_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("steqdocno",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("steqsite",TRUE)
   CALL cl_set_comp_entry("steq003",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt402_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_no_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("steqdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #aooi500設定的欄位控卡   
   IF NOT s_aooi500_comp_entry(g_prog,'steqsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("steqsite",FALSE)
   END IF
   IF g_steq_m.steq000 = 'U' THEN
      CALL cl_set_comp_entry("steq003",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt402.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt402_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization" 
   
   #end add-point  
   #add-point:set_act_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt402.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt402_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point
   #add-point:set_act_no_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   IF g_steq_m.steqstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
  
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt402.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt402_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization" 
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.pre_function"
   
   #end add-point
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point  
   
   #根據外部參數(g_argv)組合wc
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " steqdocno = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      #若有外部參數則根據該參數組合
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      #預設查詢條件
      LET g_wc = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc) THEN
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
 
{<section id="astt402.mask_functions" >}
&include "erp/ast/astt402_mask.4gl"
 
{</section>}
 
{<section id="astt402.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt402_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success   LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_steq_m.steqstus = 'Y' THEN
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_steq_m.steqdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt402_cl USING g_enterprise,g_steq_m.steqdocno
   IF STATUS THEN
      CLOSE astt402_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt402_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
       g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
       g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
       g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
       g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid,g_steq_m.steqcrtdp, 
       g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfdt, 
       g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc,g_steq_m.steqownid_desc, 
       g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc,g_steq_m.steqmodid_desc, 
       g_steq_m.steqcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt402_action_chk() THEN
      CLOSE astt402_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_steq_m.steqsite,g_steq_m.steqsite_desc,g_steq_m.steqdocdt,g_steq_m.steqdocno,g_steq_m.stequnit, 
       g_steq_m.stequnit_desc,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015,g_steq_m.steq003, 
       g_steq_m.steq003_desc,g_steq_m.steq004,g_steq_m.steq004_desc,g_steq_m.steq005,g_steq_m.steq006, 
       g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012, 
       g_steq_m.steq013,g_steq_m.steq013_desc,g_steq_m.steqacti,g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid, 
       g_steq_m.steqownid_desc,g_steq_m.steqowndp,g_steq_m.steqowndp_desc,g_steq_m.steqcrtid,g_steq_m.steqcrtid_desc, 
       g_steq_m.steqcrtdp,g_steq_m.steqcrtdp_desc,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmodid_desc, 
       g_steq_m.steqmoddt,g_steq_m.steqcnfid,g_steq_m.steqcnfid_desc,g_steq_m.steqcnfdt
 
   CASE g_steq_m.steqstus
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   if g_steq_m.steq015='1' or g_steq_m.steq015 is null then 
      call astt402_steq003_ref()
   else
      call astt402_steq003_ref_1()
   end if 
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_steq_m.steqstus
            
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      #提交和抽單一開始先無條件關
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_steq_m.steqstus
         WHEN "X"
            HIDE OPTION "confirmed"
            HIDE OPTION "unconfirmed"
            CALL s_transaction_end('N','0')   #160816-00068#15
            RETURN
         WHEN "Y"
            HIDE OPTION "invalid"
         WHEN "N"
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
         #已核准只能顯示確認;其餘應用功能皆隱藏
         WHEN "A"
            CALL cl_set_act_visible("confirmed ",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid",FALSE)
         #保留修改的功能(如作廢)，隱藏其他應用功能
         WHEN "R"
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
         WHEN "D"
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
         #送簽中只能顯示抽單;其餘應用功能皆隱藏
         WHEN "W"
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt402_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt402_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt402_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt402_cl
            RETURN
         END IF
 
 
 
	  
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
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            
            #end add-point
         END IF
         EXIT MENU
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
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            
            #end add-point
         END IF
         EXIT MENU
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
   IF (lc_state <> "A" 
      AND lc_state <> "D"
      AND lc_state <> "N"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "Y"
      AND lc_state <> "X"
      ) OR 
      g_steq_m.steqstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt402_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL s_transaction_begin()
   IF lc_state = 'Y' AND g_steq_m.steqstus = 'N' THEN
      CALL s_astt402_conf_chk(g_steq_m.steqdocno,g_steq_m.steqstus,g_steq_m.steq000) RETURNING l_success
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00108') THEN 
            CALL s_transaction_end('N','0')
            RETURN
         ELSE
            CALL s_astt402_conf_upd(g_steq_m.steqdocno) RETURNING l_success
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
      END IF
   END IF
   IF lc_state = 'X' AND g_steq_m.steqstus = 'N' THEN
      CALL s_astt402_void_chk(g_steq_m.steqdocno,g_steq_m.steqstus) RETURNING l_success
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00109') THEN 
            CALL s_transaction_end('N','0')
            RETURN
         ELSE
            CALL s_astt402_void_upd(g_steq_m.steqdocno) RETURNING l_success
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
      END IF
   END IF
   #end add-point
   
   LET g_steq_m.steqmodid = g_user
   LET g_steq_m.steqmoddt = cl_get_current()
   LET g_steq_m.steqstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE steq_t 
      SET (steqstus,steqmodid,steqmoddt) 
        = (g_steq_m.steqstus,g_steq_m.steqmodid,g_steq_m.steqmoddt)     
    WHERE steqent = g_enterprise AND steqdocno = g_steq_m.steqdocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt402_master_referesh USING g_steq_m.steqdocno INTO g_steq_m.steqsite,g_steq_m.steqdocdt, 
          g_steq_m.steqdocno,g_steq_m.stequnit,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002,g_steq_m.steq015, 
          g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008, 
          g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steqacti, 
          g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqowndp,g_steq_m.steqcrtid, 
          g_steq_m.steqcrtdp,g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmoddt,g_steq_m.steqcnfid, 
          g_steq_m.steqcnfdt,g_steq_m.steqsite_desc,g_steq_m.stequnit_desc,g_steq_m.steq004_desc,g_steq_m.steq013_desc, 
          g_steq_m.steqownid_desc,g_steq_m.steqowndp_desc,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp_desc, 
          g_steq_m.steqmodid_desc,g_steq_m.steqcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_steq_m.steqsite,g_steq_m.steqsite_desc,g_steq_m.steqdocdt,g_steq_m.steqdocno, 
          g_steq_m.stequnit,g_steq_m.stequnit_desc,g_steq_m.steq000,g_steq_m.steq001,g_steq_m.steq002, 
          g_steq_m.steq015,g_steq_m.steq003,g_steq_m.steq003_desc,g_steq_m.steq004,g_steq_m.steq004_desc, 
          g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010, 
          g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,g_steq_m.steq013_desc,g_steq_m.steqacti, 
          g_steq_m.steq014,g_steq_m.steqstus,g_steq_m.steqownid,g_steq_m.steqownid_desc,g_steq_m.steqowndp, 
          g_steq_m.steqowndp_desc,g_steq_m.steqcrtid,g_steq_m.steqcrtid_desc,g_steq_m.steqcrtdp,g_steq_m.steqcrtdp_desc, 
          g_steq_m.steqcrtdt,g_steq_m.steqmodid,g_steq_m.steqmodid_desc,g_steq_m.steqmoddt,g_steq_m.steqcnfid, 
          g_steq_m.steqcnfid_desc,g_steq_m.steqcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
   ELSE      
      CALL s_transaction_end('Y','0')
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   if g_steq_m.steq015='1' or g_steq_m.steq015 is null then 
      call astt402_steq003_ref()
   else
      call astt402_steq003_ref_1()
   end if 
   #end add-point  
 
   CLOSE astt402_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt402_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt402.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt402_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
 
 
   CALL astt402_show()
   CALL astt402_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_steq_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
 
 
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
   #CALL astt402_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt402_draw_out()
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
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt402.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt402_set_pk_array()
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
   LET g_pk_array[1].values = g_steq_m.steqdocno
   LET g_pk_array[1].column = 'steqdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt402.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astt402.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt402_msgcentre_notify(lc_state)
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
   CALL astt402_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_steq_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt402.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt402_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization" 
   
   #end add-point
   #add-point:action_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#39 add-S
   SELECT steqstus  INTO g_steq_m.steqstus
     FROM steq_t
    WHERE steqent = g_enterprise
      AND steqdocno = g_steq_m.steqdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_steq_m.steqstus
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
        LET g_errparam.extend = g_steq_m.steqdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt402_set_act_visible()
        CALL astt402_set_act_no_visible()
        CALL astt402_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#39 add-E
   #end add-point
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt402.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 据点带值
# Memo...........:
# Usage..........: astt402_steqsite_ref()
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_steqsite_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_steq_m.steqsite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_steq_m.steqsite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_steq_m.steqsite_desc
END FUNCTION

################################################################################
# Descriptions...: 据点带值
# Memo...........:
# Usage..........: astt402_stequnit_ref()
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_stequnit_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_steq_m.stequnit
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_steq_m.stequnit_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_steq_m.stequnit_desc
END FUNCTION

################################################################################
# Descriptions...: 专柜带值
# Memo...........:
# Usage..........: astt402_steq003_ref()
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_steq003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_steq_m.steq003
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_steq_m.steq003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_steq_m.steq003_desc
END FUNCTION

################################################################################
# Descriptions...: 供应商带值
# Memo...........:
# Usage..........: astt402_steq004_ref()
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_steq004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_steq_m.steq004
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_steq_m.steq004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_steq_m.steq004_desc
END FUNCTION

################################################################################
# Descriptions...: 业务人员带值
# Memo...........:
# Usage..........: astt402_steq013_ref()
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_steq013_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_steq_m.steq013
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_steq_m.steq013_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_steq_m.steq013_desc
END FUNCTION

################################################################################
# Descriptions...: 修改类型时，根据合同编号带值
# Memo...........:
# Date & Author..: 2015/04/23 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt402_steq001_init()
   
   SELECT NVL(stfq002+1,2), stfq003, stfq004, stfq005, stfq006, stfq007,
          stfq008, stfq009, stfq010, stfq011, stfq012, stfq013,
          stfq014,stfqsite
     INTO g_steq_m.steq002,g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,
          g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,
          g_steq_m.steq014,g_steq_m.stequnit
     FROM stfq_t
    WHERE stfq001 = g_steq_m.steq001
      AND stfqent = g_enterprise 
    
    DISPLAY BY NAME  g_steq_m.steq002,g_steq_m.steq003,g_steq_m.steq004,g_steq_m.steq005,g_steq_m.steq006,g_steq_m.steq007,
                     g_steq_m.steq008,g_steq_m.steq009,g_steq_m.steq010,g_steq_m.steq011,g_steq_m.steq012,g_steq_m.steq013,
                     g_steq_m.steq014,g_steq_m.stequnit
      
    CALL astt402_steq003_ref()
    CALL astt402_steq004_ref()
    CALL astt402_steq013_ref()
    CALL astt402_stequnit_ref()
END FUNCTION

################################################################################

################################################################################
PRIVATE FUNCTION astt402_steq003_init()

   SELECT mhae006
     INTO g_steq_m.steq004
     FROM mhae_t
    WHERE mhae001 = g_steq_m.steq003
      AND mhaeent = g_enterprise 
    
    DISPLAY BY NAME  g_steq_m.steq004
   
    CALL astt402_steq004_ref()
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
PRIVATE FUNCTION astt402_steq003_init_1()
 SELECT stje007
     INTO g_steq_m.steq004
     FROM stje_t
    WHERE stje008 = g_steq_m.steq003
      AND stjeent = g_enterprise
      and stje005 in (1,2,3,4,5,6)
   if g_steq_m.steq004 is null then 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00784'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   else
    DISPLAY BY NAME  g_steq_m.steq004  
    CALL astt402_steq004_ref()
   end if 
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
PRIVATE FUNCTION astt402_steq003_ref_1()
 INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_steq_m.steq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_steq_m.steq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_steq_m.steq003_desc
END FUNCTION

 
{</section>}
 
