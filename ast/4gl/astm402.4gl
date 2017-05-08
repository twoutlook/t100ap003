#該程式未解開Section, 採用最新樣板產出!
{<section id="astm402.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2016-06-21 16:29:45), PR版次:0003(2016-06-21 16:30:58)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000038
#+ Filename...: astm402
#+ Description: 供應商人員合約維護作業
#+ Creator....: 06189(2015-04-24 09:21:15)
#+ Modifier...: 07142 -SD/PR- 07142
 
{</section>}
 
{<section id="astm402.global" >}
#應用 i01 樣板自動產生(Version:50)
#add-point:填寫註解說明 name="global.memo"
#Memos
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
PRIVATE TYPE type_g_stfq_m RECORD
       stfqunit LIKE stfq_t.stfqunit, 
   stfqunit_desc LIKE type_t.chr80, 
   stfqsite LIKE stfq_t.stfqsite, 
   stfqsite_desc LIKE type_t.chr80, 
   stfq001 LIKE stfq_t.stfq001, 
   stfq002 LIKE stfq_t.stfq002, 
   stfq015 LIKE stfq_t.stfq015, 
   stfq003 LIKE stfq_t.stfq003, 
   stfq003_desc LIKE type_t.chr500, 
   stfq004 LIKE stfq_t.stfq004, 
   stfq004_desc LIKE type_t.chr80, 
   stfq005 LIKE stfq_t.stfq005, 
   stfq006 LIKE stfq_t.stfq006, 
   stfq007 LIKE stfq_t.stfq007, 
   stfq008 LIKE stfq_t.stfq008, 
   stfq009 LIKE stfq_t.stfq009, 
   stfq010 LIKE stfq_t.stfq010, 
   stfq011 LIKE stfq_t.stfq011, 
   stfq012 LIKE stfq_t.stfq012, 
   stfq013 LIKE stfq_t.stfq013, 
   stfq013_desc LIKE type_t.chr80, 
   stfq014 LIKE stfq_t.stfq014, 
   stfqstus LIKE stfq_t.stfqstus, 
   stfqownid LIKE stfq_t.stfqownid, 
   stfqownid_desc LIKE type_t.chr80, 
   stfqowndp LIKE stfq_t.stfqowndp, 
   stfqowndp_desc LIKE type_t.chr80, 
   stfqcrtid LIKE stfq_t.stfqcrtid, 
   stfqcrtid_desc LIKE type_t.chr80, 
   stfqcrtdp LIKE stfq_t.stfqcrtdp, 
   stfqcrtdp_desc LIKE type_t.chr80, 
   stfqcrtdt LIKE stfq_t.stfqcrtdt, 
   stfqmodid LIKE stfq_t.stfqmodid, 
   stfqmodid_desc LIKE type_t.chr80, 
   stfqmoddt LIKE stfq_t.stfqmoddt, 
   stfqcnfid LIKE stfq_t.stfqcnfid, 
   stfqcnfid_desc LIKE type_t.chr80, 
   stfqcnfdt LIKE stfq_t.stfqcnfdt
       END RECORD
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD  #查詢方案用陣列 
         b_statepic     LIKE type_t.chr50,
            b_stfqunit LIKE stfq_t.stfqunit,
   b_stfqunit_desc LIKE type_t.chr80,
      b_stfqsite LIKE stfq_t.stfqsite,
   b_stfqsite_desc LIKE type_t.chr80,
      b_stfq001 LIKE stfq_t.stfq001,
      b_stfq002 LIKE stfq_t.stfq002,
      b_stfq003 LIKE stfq_t.stfq003,
      b_stfq004 LIKE stfq_t.stfq004,
   b_stfq004_desc LIKE type_t.chr80,
      b_stfq005 LIKE stfq_t.stfq005,
      b_stfq006 LIKE stfq_t.stfq006,
      b_stfq007 LIKE stfq_t.stfq007,
      b_stfq008 LIKE stfq_t.stfq008,
      b_stfq009 LIKE stfq_t.stfq009,
      b_stfq010 LIKE stfq_t.stfq010,
      b_stfq011 LIKE stfq_t.stfq011,
      b_stfq012 LIKE stfq_t.stfq012,
      b_stfq013 LIKE stfq_t.stfq013,
   b_stfq013_desc LIKE type_t.chr80,
      b_stfq014 LIKE stfq_t.stfq014
      END RECORD 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
#模組變數(Module Variables)
DEFINE g_stfq_m        type_g_stfq_m  #單頭變數宣告
DEFINE g_stfq_m_t      type_g_stfq_m  #單頭舊值宣告(系統還原用)
DEFINE g_stfq_m_o      type_g_stfq_m  #單頭舊值宣告(其他用途)
DEFINE g_stfq_m_mask_o type_g_stfq_m  #轉換遮罩前資料
DEFINE g_stfq_m_mask_n type_g_stfq_m  #轉換遮罩後資料
 
   DEFINE g_stfq001_t LIKE stfq_t.stfq001
 
   
 
   
 
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
 
{<section id="astm402.main" >}
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
   LET g_forupd_sql = " SELECT stfqunit,'',stfqsite,'',stfq001,stfq002,stfq015,stfq003,'',stfq004,'', 
       stfq005,stfq006,stfq007,stfq008,stfq009,stfq010,stfq011,stfq012,stfq013,'',stfq014,stfqstus,stfqownid, 
       '',stfqowndp,'',stfqcrtid,'',stfqcrtdp,'',stfqcrtdt,stfqmodid,'',stfqmoddt,stfqcnfid,'',stfqcnfdt", 
        
                      " FROM stfq_t",
                      " WHERE stfqent= ? AND stfq001=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm402_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stfqunit,t0.stfqsite,t0.stfq001,t0.stfq002,t0.stfq015,t0.stfq003, 
       t0.stfq004,t0.stfq005,t0.stfq006,t0.stfq007,t0.stfq008,t0.stfq009,t0.stfq010,t0.stfq011,t0.stfq012, 
       t0.stfq013,t0.stfq014,t0.stfqstus,t0.stfqownid,t0.stfqowndp,t0.stfqcrtid,t0.stfqcrtdp,t0.stfqcrtdt, 
       t0.stfqmodid,t0.stfqmoddt,t0.stfqcnfid,t0.stfqcnfdt,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ,t4.ooag011 , 
       t5.ooag011 ,t6.ooefl003 ,t7.ooag011 ,t8.ooefl003 ,t9.ooag011 ,t10.ooag011",
               " FROM stfq_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stfqunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stfqsite AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stfq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stfq013  ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stfqownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stfqowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.stfqcrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stfqcrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stfqmodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stfqcnfid  ",
 
               " WHERE t0.stfqent = " ||g_enterprise|| " AND t0.stfq001 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
 
   #end add-point
   PREPARE astm402_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astm402 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astm402_init()   
 
      #進入選單 Menu (="N")
      CALL astm402_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astm402
      
   END IF 
   
   CLOSE astm402_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astm402.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astm402_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   #定義combobox狀態
      CALL cl_set_combo_scc_part('stfqstus','50','N,Y,X')
 
   
   LET g_error_show = 1
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL cl_set_combo_scc('stfq015','6946')
   #end add-point
   
   #根據外部參數進行搜尋
   CALL astm402_default_search()
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astm402_ui_dialog() 
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
   
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE li_exit = FALSE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_stfq_m.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL astm402_init()
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
               CALL astm402_browser_fill(g_wc,"")
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               
               #還原為原本指定筆數
               IF g_current_row > 0 THEN
                  LET g_current_idx = g_current_row
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL astm402_fetch("")   
               END IF               
               #add-point:ui_dialog段 before menu name="ui_dialog.before_menu"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astm402_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astm402_set_act_visible()
               CALL astm402_set_act_no_visible()
               IF NOT (g_stfq_m.stfq001 IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " stfqent = " ||g_enterprise|| " AND",
                                     " stfq001 = '", g_stfq_m.stfq001, "' "
 
                  #填到對應位置
                  CALL astm402_browser_fill(g_wc,"")
               END IF
               
            #第一筆資料
            ON ACTION first
               CALL astm402_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astm402_fetch("N")
               LET g_current_row = g_current_idx
            
            #指定筆資料
            ON ACTION jump
               CALL astm402_fetch("/")
               LET g_current_row = g_current_idx
            
            #上一筆資料
            ON ACTION previous
               CALL astm402_fetch("P")
               LET g_current_row = g_current_idx
            
            #最後筆資料
            ON ACTION last 
               CALL astm402_fetch("L")  
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
                  CALL astm402_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astm402_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astm402_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
            
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu2.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu2.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astm402_query()
               #add-point:ON ACTION query name="menu2.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            
            
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astm402_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.menu.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astm402_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.menu.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astm402_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.menu.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
            
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
                  CALL astm402_fetch("")
 
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
                  CALL astm402_browser_fill(g_wc,"")
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
                  CALL astm402_fetch("")   
               END IF          
               CALL cl_notice()
               
               #add-point:ui_dialog段before name="ui_dialog.b_dialog"
               
               #end add-point  
            
            AFTER DIALOG
               #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astm402_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astm402_set_act_visible()
               CALL astm402_set_act_no_visible()
               IF NOT (g_stfq_m.stfq001 IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " stfqent = " ||g_enterprise|| " AND",
                                     " stfq001 = '", g_stfq_m.stfq001, "' "
 
                  #填到對應位置
                  CALL astm402_browser_fill(g_wc,"")
               END IF
         
            #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL astm402_filter()
               EXIT DIALOG
 
 
 
            
            #第一筆資料
            ON ACTION first
               CALL astm402_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astm402_fetch("N")
               LET g_current_row = g_current_idx
         
            #指定筆資料
            ON ACTION jump
               CALL astm402_fetch("/")
               LET g_current_row = g_current_idx
         
            #上一筆資料
            ON ACTION previous
               CALL astm402_fetch("P")
               LET g_current_row = g_current_idx
          
            #最後筆資料
            ON ACTION last 
               CALL astm402_fetch("L")  
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
                  CALL astm402_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astm402_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astm402_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
               
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astm402_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            
 
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astm402_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astm402_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astm402_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
 
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
 
{<section id="astm402.browser_fill" >}
#應用 a29 樣板自動產生(Version:15)
#+ 瀏覽頁簽資料填充(一般單檔)
PRIVATE FUNCTION astm402_browser_fill(p_wc,ps_page_action) 
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
   
   LET l_searchcol = "stfq001"
 
   LET p_wc = p_wc.trim() #當查詢按下Q時 按下放棄 g_wc = "  " 所以要清掉空白
   IF cl_null(p_wc) THEN  #p_wc 查詢條件
      LET p_wc = " 1=1 " 
   END IF
   #add-point:browser_fill段wc控制 name="browser_fill.wc"
   CALL s_aooi500_sql_where(g_prog,'stfqsite') RETURNING l_where
   LET p_wc = p_wc," AND ",l_where
   LET p_wc  = p_wc.trim()
   #end add-point
 
   LET g_sql = " SELECT COUNT(1) FROM stfq_t ",
               "  ",
               "  ",
               " WHERE stfqent = " ||g_enterprise|| " AND ", 
               p_wc CLIPPED, cl_sql_add_filter("stfq_t")
                
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
      INITIALIZE g_stfq_m.* TO NULL
      CALL g_browser.clear()
      LET g_cnt = 1
      LET ls_wc = p_wc
   ELSE
      LET ls_wc = g_add_browse
      LET g_cnt = g_current_idx
   END IF
   
   LET g_sql = " SELECT t0.stfqstus,t0.stfqunit,t0.stfqsite,t0.stfq001,t0.stfq002,t0.stfq003,t0.stfq004, 
       t0.stfq005,t0.stfq006,t0.stfq007,t0.stfq008,t0.stfq009,t0.stfq010,t0.stfq011,t0.stfq012,t0.stfq013, 
       t0.stfq014,t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ,t4.ooag011",
               " FROM stfq_t t0 ",
               "  ",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stfqunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stfqsite AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stfq004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stfq013  ",
 
               " WHERE t0.stfqent = " ||g_enterprise|| " AND ", ls_wc, cl_sql_add_filter("stfq_t")
   #add-point:browser_fill段fill_wc name="browser_fill.fill_wc"
   
   #end add-point 
   LET g_sql = g_sql, " ORDER BY ",l_searchcol," ",g_order
   #add-point:browser_fill段before_pre name="browser_fill.before_pre"
   
   #end add-point                    
 
   #LET g_sql = cl_sql_add_tabid(g_sql,"stfq_t")             #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stfqunit,g_browser[g_cnt].b_stfqsite, 
          g_browser[g_cnt].b_stfq001,g_browser[g_cnt].b_stfq002,g_browser[g_cnt].b_stfq003,g_browser[g_cnt].b_stfq004, 
          g_browser[g_cnt].b_stfq005,g_browser[g_cnt].b_stfq006,g_browser[g_cnt].b_stfq007,g_browser[g_cnt].b_stfq008, 
          g_browser[g_cnt].b_stfq009,g_browser[g_cnt].b_stfq010,g_browser[g_cnt].b_stfq011,g_browser[g_cnt].b_stfq012, 
          g_browser[g_cnt].b_stfq013,g_browser[g_cnt].b_stfq014,g_browser[g_cnt].b_stfqunit_desc,g_browser[g_cnt].b_stfqsite_desc, 
          g_browser[g_cnt].b_stfq004_desc,g_browser[g_cnt].b_stfq013_desc
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
         CALL astm402_browser_mask()
         
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/open.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/valid.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/void.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_stfq001) THEN
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
   
   #end add-point   
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm402.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astm402_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point
   DEFINE ls_return      STRING
   DEFINE ls_result      STRING 
   DEFINE ls_wc          STRING 
   #add-point:cs段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   DEFINE l_where           STRING
   #end add-point
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
   
   #清空畫面&資料初始化
   CLEAR FORM
   INITIALIZE g_stfq_m.* TO NULL
   INITIALIZE g_wc TO NULL
   LET g_current_row = 1
 
   LET g_qryparam.state = "c"
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #螢幕上取條件
      CONSTRUCT BY NAME g_wc ON stfqunit,stfqsite,stfq001,stfq002,stfq015,stfq003,stfq003_desc,stfq004, 
          stfq005,stfq006,stfq007,stfq008,stfq009,stfq010,stfq011,stfq012,stfq013,stfq014,stfqstus,stfqownid, 
          stfqowndp,stfqcrtid,stfqcrtdp,stfqcrtdt,stfqmodid,stfqmoddt,stfqcnfid,stfqcnfdt
      
         BEFORE CONSTRUCT                                    
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point             
      
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stfqcrtdt>>----
         AFTER FIELD stfqcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stfqmoddt>>----
         AFTER FIELD stfqmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stfqcnfdt>>----
         AFTER FIELD stfqcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stfqpstdt>>----
 
 
 
      
         #一般欄位
                  #Ctrlp:construct.c.stfqunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqunit
            #add-point:ON ACTION controlp INFIELD stfqunit name="construct.c.stfqunit"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfqunit',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqunit  #顯示到畫面上
            NEXT FIELD stfqunit                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqunit
            #add-point:BEFORE FIELD stfqunit name="construct.b.stfqunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqunit
            
            #add-point:AFTER FIELD stfqunit name="construct.a.stfqunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfqsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqsite
            #add-point:ON ACTION controlp INFIELD stfqsite name="construct.c.stfqsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfqsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqsite  #顯示到畫面上
            NEXT FIELD stfqsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqsite
            #add-point:BEFORE FIELD stfqsite name="construct.b.stfqsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqsite
            
            #add-point:AFTER FIELD stfqsite name="construct.a.stfqsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq001
            #add-point:ON ACTION controlp INFIELD stfq001 name="construct.c.stfq001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " stfqsite = '",g_site,"'"
            CALL s_aooi500_sql_where(g_prog,'stfqsite') RETURNING l_where
            LET g_qryparam.where = l_where
            CALL q_stfq001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfq001  #顯示到畫面上
            NEXT FIELD stfq001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq001
            #add-point:BEFORE FIELD stfq001 name="construct.b.stfq001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq001
            
            #add-point:AFTER FIELD stfq001 name="construct.a.stfq001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq002
            #add-point:BEFORE FIELD stfq002 name="construct.b.stfq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq002
            
            #add-point:AFTER FIELD stfq002 name="construct.a.stfq002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq002
            #add-point:ON ACTION controlp INFIELD stfq002 name="construct.c.stfq002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq015
            #add-point:BEFORE FIELD stfq015 name="construct.b.stfq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq015
            
            #add-point:AFTER FIELD stfq015 name="construct.a.stfq015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq015
            #add-point:ON ACTION controlp INFIELD stfq015 name="construct.c.stfq015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq003
            #add-point:BEFORE FIELD stfq003 name="construct.b.stfq003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq003
            
            #add-point:AFTER FIELD stfq003 name="construct.a.stfq003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq003
            #add-point:ON ACTION controlp INFIELD stfq003 name="construct.c.stfq003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            if g_stfq_m.stfq015 ='1'  or g_stfq_m.stfq015 IS NULL then 
              CALL q_mhae001()                           #呼叫開窗
            else 
              CALL q_mhbe001()
            end if                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfq003  #顯示到畫面上
            NEXT FIELD stfq003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq003_desc
            #add-point:BEFORE FIELD stfq003_desc name="construct.b.stfq003_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq003_desc
            
            #add-point:AFTER FIELD stfq003_desc name="construct.a.stfq003_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq003_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq003_desc
            #add-point:ON ACTION controlp INFIELD stfq003_desc name="construct.c.stfq003_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq004
            #add-point:ON ACTION controlp INFIELD stfq004 name="construct.c.stfq004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = " (1,3)"
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfq004  #顯示到畫面上
            NEXT FIELD stfq004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq004
            #add-point:BEFORE FIELD stfq004 name="construct.b.stfq004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq004
            
            #add-point:AFTER FIELD stfq004 name="construct.a.stfq004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq005
            #add-point:BEFORE FIELD stfq005 name="construct.b.stfq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq005
            
            #add-point:AFTER FIELD stfq005 name="construct.a.stfq005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq005
            #add-point:ON ACTION controlp INFIELD stfq005 name="construct.c.stfq005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq006
            #add-point:BEFORE FIELD stfq006 name="construct.b.stfq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq006
            
            #add-point:AFTER FIELD stfq006 name="construct.a.stfq006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq006
            #add-point:ON ACTION controlp INFIELD stfq006 name="construct.c.stfq006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq007
            #add-point:BEFORE FIELD stfq007 name="construct.b.stfq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq007
            
            #add-point:AFTER FIELD stfq007 name="construct.a.stfq007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq007
            #add-point:ON ACTION controlp INFIELD stfq007 name="construct.c.stfq007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq008
            #add-point:BEFORE FIELD stfq008 name="construct.b.stfq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq008
            
            #add-point:AFTER FIELD stfq008 name="construct.a.stfq008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq008
            #add-point:ON ACTION controlp INFIELD stfq008 name="construct.c.stfq008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq009
            #add-point:BEFORE FIELD stfq009 name="construct.b.stfq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq009
            
            #add-point:AFTER FIELD stfq009 name="construct.a.stfq009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq009
            #add-point:ON ACTION controlp INFIELD stfq009 name="construct.c.stfq009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq010
            #add-point:BEFORE FIELD stfq010 name="construct.b.stfq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq010
            
            #add-point:AFTER FIELD stfq010 name="construct.a.stfq010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq010
            #add-point:ON ACTION controlp INFIELD stfq010 name="construct.c.stfq010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq011
            #add-point:BEFORE FIELD stfq011 name="construct.b.stfq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq011
            
            #add-point:AFTER FIELD stfq011 name="construct.a.stfq011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq011
            #add-point:ON ACTION controlp INFIELD stfq011 name="construct.c.stfq011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq012
            #add-point:BEFORE FIELD stfq012 name="construct.b.stfq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq012
            
            #add-point:AFTER FIELD stfq012 name="construct.a.stfq012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq012
            #add-point:ON ACTION controlp INFIELD stfq012 name="construct.c.stfq012"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfq013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq013
            #add-point:ON ACTION controlp INFIELD stfq013 name="construct.c.stfq013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfq013  #顯示到畫面上
            NEXT FIELD stfq013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq013
            #add-point:BEFORE FIELD stfq013 name="construct.b.stfq013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq013
            
            #add-point:AFTER FIELD stfq013 name="construct.a.stfq013"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq014
            #add-point:BEFORE FIELD stfq014 name="construct.b.stfq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq014
            
            #add-point:AFTER FIELD stfq014 name="construct.a.stfq014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq014
            #add-point:ON ACTION controlp INFIELD stfq014 name="construct.c.stfq014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqstus
            #add-point:BEFORE FIELD stfqstus name="construct.b.stfqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqstus
            
            #add-point:AFTER FIELD stfqstus name="construct.a.stfqstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqstus
            #add-point:ON ACTION controlp INFIELD stfqstus name="construct.c.stfqstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfqownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqownid
            #add-point:ON ACTION controlp INFIELD stfqownid name="construct.c.stfqownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqownid  #顯示到畫面上
            NEXT FIELD stfqownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqownid
            #add-point:BEFORE FIELD stfqownid name="construct.b.stfqownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqownid
            
            #add-point:AFTER FIELD stfqownid name="construct.a.stfqownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfqowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqowndp
            #add-point:ON ACTION controlp INFIELD stfqowndp name="construct.c.stfqowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqowndp  #顯示到畫面上
            NEXT FIELD stfqowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqowndp
            #add-point:BEFORE FIELD stfqowndp name="construct.b.stfqowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqowndp
            
            #add-point:AFTER FIELD stfqowndp name="construct.a.stfqowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfqcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqcrtid
            #add-point:ON ACTION controlp INFIELD stfqcrtid name="construct.c.stfqcrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqcrtid  #顯示到畫面上
            NEXT FIELD stfqcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqcrtid
            #add-point:BEFORE FIELD stfqcrtid name="construct.b.stfqcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqcrtid
            
            #add-point:AFTER FIELD stfqcrtid name="construct.a.stfqcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfqcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqcrtdp
            #add-point:ON ACTION controlp INFIELD stfqcrtdp name="construct.c.stfqcrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqcrtdp  #顯示到畫面上
            NEXT FIELD stfqcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqcrtdp
            #add-point:BEFORE FIELD stfqcrtdp name="construct.b.stfqcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqcrtdp
            
            #add-point:AFTER FIELD stfqcrtdp name="construct.a.stfqcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqcrtdt
            #add-point:BEFORE FIELD stfqcrtdt name="construct.b.stfqcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfqmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqmodid
            #add-point:ON ACTION controlp INFIELD stfqmodid name="construct.c.stfqmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqmodid  #顯示到畫面上
            NEXT FIELD stfqmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqmodid
            #add-point:BEFORE FIELD stfqmodid name="construct.b.stfqmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqmodid
            
            #add-point:AFTER FIELD stfqmodid name="construct.a.stfqmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqmoddt
            #add-point:BEFORE FIELD stfqmoddt name="construct.b.stfqmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfqcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqcnfid
            #add-point:ON ACTION controlp INFIELD stfqcnfid name="construct.c.stfqcnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfqcnfid  #顯示到畫面上
            NEXT FIELD stfqcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqcnfid
            #add-point:BEFORE FIELD stfqcnfid name="construct.b.stfqcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqcnfid
            
            #add-point:AFTER FIELD stfqcnfid name="construct.a.stfqcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqcnfdt
            #add-point:BEFORE FIELD stfqcnfdt name="construct.b.stfqcnfdt"
            
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
 
{<section id="astm402.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astm402_filter()
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
      CONSTRUCT g_wc_filter ON stfqunit,stfqsite,stfq001,stfq002,stfq003,stfq004,stfq005,stfq006,stfq007, 
          stfq008,stfq009,stfq010,stfq011,stfq012,stfq013,stfq014
                          FROM s_browse[1].b_stfqunit,s_browse[1].b_stfqsite,s_browse[1].b_stfq001,s_browse[1].b_stfq002, 
                              s_browse[1].b_stfq003,s_browse[1].b_stfq004,s_browse[1].b_stfq005,s_browse[1].b_stfq006, 
                              s_browse[1].b_stfq007,s_browse[1].b_stfq008,s_browse[1].b_stfq009,s_browse[1].b_stfq010, 
                              s_browse[1].b_stfq011,s_browse[1].b_stfq012,s_browse[1].b_stfq013,s_browse[1].b_stfq014 
 
 
         BEFORE CONSTRUCT
               DISPLAY astm402_filter_parser('stfqunit') TO s_browse[1].b_stfqunit
            DISPLAY astm402_filter_parser('stfqsite') TO s_browse[1].b_stfqsite
            DISPLAY astm402_filter_parser('stfq001') TO s_browse[1].b_stfq001
            DISPLAY astm402_filter_parser('stfq002') TO s_browse[1].b_stfq002
            DISPLAY astm402_filter_parser('stfq003') TO s_browse[1].b_stfq003
            DISPLAY astm402_filter_parser('stfq004') TO s_browse[1].b_stfq004
            DISPLAY astm402_filter_parser('stfq005') TO s_browse[1].b_stfq005
            DISPLAY astm402_filter_parser('stfq006') TO s_browse[1].b_stfq006
            DISPLAY astm402_filter_parser('stfq007') TO s_browse[1].b_stfq007
            DISPLAY astm402_filter_parser('stfq008') TO s_browse[1].b_stfq008
            DISPLAY astm402_filter_parser('stfq009') TO s_browse[1].b_stfq009
            DISPLAY astm402_filter_parser('stfq010') TO s_browse[1].b_stfq010
            DISPLAY astm402_filter_parser('stfq011') TO s_browse[1].b_stfq011
            DISPLAY astm402_filter_parser('stfq012') TO s_browse[1].b_stfq012
            DISPLAY astm402_filter_parser('stfq013') TO s_browse[1].b_stfq013
            DISPLAY astm402_filter_parser('stfq014') TO s_browse[1].b_stfq014
      
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
 
      CALL astm402_filter_show('stfqunit')
   CALL astm402_filter_show('stfqsite')
   CALL astm402_filter_show('stfq001')
   CALL astm402_filter_show('stfq002')
   CALL astm402_filter_show('stfq003')
   CALL astm402_filter_show('stfq004')
   CALL astm402_filter_show('stfq005')
   CALL astm402_filter_show('stfq006')
   CALL astm402_filter_show('stfq007')
   CALL astm402_filter_show('stfq008')
   CALL astm402_filter_show('stfq009')
   CALL astm402_filter_show('stfq010')
   CALL astm402_filter_show('stfq011')
   CALL astm402_filter_show('stfq012')
   CALL astm402_filter_show('stfq013')
   CALL astm402_filter_show('stfq014')
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astm402_filter_parser(ps_field)
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
 
{<section id="astm402.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astm402_filter_show(ps_field)
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
   LET ls_condition = astm402_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astm402_query()
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
 
   INITIALIZE g_stfq_m.* TO NULL
   ERROR ""
 
   DISPLAY " " TO FORMONLY.b_count
   DISPLAY " " TO FORMONLY.h_count
   CALL astm402_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astm402_browser_fill(g_wc,"F")
      CALL astm402_fetch("")
      RETURN
   ELSE
      LET g_current_row = 1
      LET g_current_cnt = 0
   END IF
   
   #根據條件從新抓取資料
   LET g_error_show = 1
   CALL astm402_browser_fill(g_wc,"F")   # 移到第一頁
   
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
      CALL astm402_fetch("F") 
   END IF
   
   LET g_wc_filter = ""
   
END FUNCTION
 
{</section>}
 
{<section id="astm402.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astm402_fetch(p_fl)
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
   LET g_stfq_m.stfq001 = g_browser[g_current_idx].b_stfq001
 
                       
   #讀取單頭所有欄位資料
   EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001, 
       g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
       g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
       g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
       g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
       g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc,g_stfq_m.stfq013_desc, 
       g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp_desc, 
       g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
   
   #遮罩相關處理
   LET g_stfq_m_mask_o.* =  g_stfq_m.*
   CALL astm402_stfq_t_mask()
   LET g_stfq_m_mask_n.* =  g_stfq_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astm402_set_act_visible()
   CALL astm402_set_act_no_visible()
 
   #add-point:fetch段action控制 name="fetch.action_control"
    if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          end if  
   #end add-point  
   
   
   
   #保存單頭舊值
   LET g_stfq_m_t.* = g_stfq_m.*
   LET g_stfq_m_o.* = g_stfq_m.*
   
   LET g_data_owner = g_stfq_m.stfqownid      
   LET g_data_dept  = g_stfq_m.stfqowndp
   
   #重新顯示
   CALL astm402_show()
   
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.insert" >}
#+ 資料新增
PRIVATE FUNCTION astm402_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   CLEAR FORM #清畫面欄位內容
   INITIALIZE g_stfq_m.* TO NULL             #DEFAULT 設定
   LET g_stfq001_t = NULL
 
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   
   WHILE TRUE
      
      #公用欄位給值
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stfq_m.stfqownid = g_user
      LET g_stfq_m.stfqowndp = g_dept
      LET g_stfq_m.stfqcrtid = g_user
      LET g_stfq_m.stfqcrtdp = g_dept 
      LET g_stfq_m.stfqcrtdt = cl_get_current()
      LET g_stfq_m.stfqmodid = g_user
      LET g_stfq_m.stfqmoddt = cl_get_current()
      LET g_stfq_m.stfqstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stfq_m.stfq006 = "0"
      LET g_stfq_m.stfq008 = "0"
      LET g_stfq_m.stfq009 = "0"
      LET g_stfq_m.stfq011 = "0"
 
 
      #add-point:單頭預設值 name="insert.default"
      
      #end add-point   
     
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfq_m.stfqstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
     
      #資料輸入
      CALL astm402_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         #取消
         LET INT_FLAG = 0
         DISPLAY g_current_cnt TO FORMONLY.h_count     #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index     #當下筆數
         INITIALIZE g_stfq_m.* TO NULL
         CALL astm402_show()
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
   CALL astm402_set_act_visible()
   CALL astm402_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_stfq001_t = g_stfq_m.stfq001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stfqent = " ||g_enterprise|| " AND",
                      " stfq001 = '", g_stfq_m.stfq001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm402_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
 
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001, 
       g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
       g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
       g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
       g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
       g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc,g_stfq_m.stfq013_desc, 
       g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp_desc, 
       g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
   
   
   #遮罩相關處理
   LET g_stfq_m_mask_o.* =  g_stfq_m.*
   CALL astm402_stfq_t_mask()
   LET g_stfq_m_mask_n.* =  g_stfq_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite,g_stfq_m.stfqsite_desc, 
       g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq003_desc,g_stfq_m.stfq004, 
       g_stfq_m.stfq004_desc,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009, 
       g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq013_desc,g_stfq_m.stfq014, 
       g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp,g_stfq_m.stfqowndp_desc, 
       g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqcrtdt, 
       g_stfq_m.stfqmodid,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfid_desc, 
       g_stfq_m.stfqcnfdt
 
   #add-point:新增結束後 name="insert.after"
     if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          end if  
   #end add-point 
 
   LET g_data_owner = g_stfq_m.stfqownid      
   LET g_data_dept  = g_stfq_m.stfqowndp
 
   #功能已完成,通報訊息中心
   CALL astm402_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astm402.modify" >}
#+ 資料修改
PRIVATE FUNCTION astm402_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="modify.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_stfq_m.stfq001 IS NULL
 
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
   LET g_stfq001_t = g_stfq_m.stfq001
 
   
   CALL s_transaction_begin()
   
   #先lock資料
   OPEN astm402_cl USING g_enterprise,g_stfq_m.stfq001
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm402_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astm402_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001, 
       g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
       g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
       g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
       g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
       g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc,g_stfq_m.stfq013_desc, 
       g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp_desc, 
       g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
 
   #檢查是否允許此動作
   IF NOT astm402_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #遮罩相關處理
   LET g_stfq_m_mask_o.* =  g_stfq_m.*
   CALL astm402_stfq_t_mask()
   LET g_stfq_m_mask_n.* =  g_stfq_m.*
   
   
 
   #顯示資料
   CALL astm402_show()
   
   WHILE TRUE
      LET g_stfq_m.stfq001 = g_stfq001_t
 
      
      #寫入修改者/修改日期資訊
      LET g_stfq_m.stfqmodid = g_user 
LET g_stfq_m.stfqmoddt = cl_get_current()
LET g_stfq_m.stfqmodid_desc = cl_get_username(g_stfq_m.stfqmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
 
      #資料輸入
      CALL astm402_input("u")     
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         LET g_stfq_m.* = g_stfq_m_t.*
         CALL astm402_show()
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         EXIT WHILE
      END IF
 
      #若有modid跟moddt則進行update
      UPDATE stfq_t SET (stfqmodid,stfqmoddt) = (g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt)
       WHERE stfqent = g_enterprise AND stfq001 = g_stfq001_t
 
 
      EXIT WHILE
      
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astm402_set_act_visible()
   CALL astm402_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stfqent = " ||g_enterprise|| " AND",
                      " stfq001 = '", g_stfq_m.stfq001, "' "
 
   #填到對應位置
   CALL astm402_browser_fill(g_wc,"")
 
   CLOSE astm402_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm402_msgcentre_notify('modify')
   
   LET g_worksheet_hidden = 0
   
END FUNCTION   
 
{</section>}
 
{<section id="astm402.input" >}
#+ 資料輸入
PRIVATE FUNCTION astm402_input(p_cmd)
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
  define l_msg   string
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
   DISPLAY BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite,g_stfq_m.stfqsite_desc, 
       g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq003_desc,g_stfq_m.stfq004, 
       g_stfq_m.stfq004_desc,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009, 
       g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq013_desc,g_stfq_m.stfq014, 
       g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp,g_stfq_m.stfqowndp_desc, 
       g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqcrtdt, 
       g_stfq_m.stfqmodid,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfid_desc, 
       g_stfq_m.stfqcnfdt
   
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
   CALL astm402_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astm402_set_no_entry(p_cmd)
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #單頭段
      INPUT BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015, 
          g_stfq_m.stfq003,g_stfq_m.stfq003_desc,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
          g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
          g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus 
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
         AFTER FIELD stfqunit
            
            #add-point:AFTER FIELD stfqunit name="input.a.stfqunit"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfqunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfqunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfqunit_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqunit
            #add-point:BEFORE FIELD stfqunit name="input.b.stfqunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfqunit
            #add-point:ON CHANGE stfqunit name="input.g.stfqunit"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqsite
            
            #add-point:AFTER FIELD stfqsite name="input.a.stfqsite"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfqsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfqsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfqsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqsite
            #add-point:BEFORE FIELD stfqsite name="input.b.stfqsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfqsite
            #add-point:ON CHANGE stfqsite name="input.g.stfqsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq001
            #add-point:BEFORE FIELD stfq001 name="input.b.stfq001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq001
            
            #add-point:AFTER FIELD stfq001 name="input.a.stfq001"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_stfq_m.stfq001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stfq_m.stfq001 != g_stfq001_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfq_t WHERE "||"stfqent = '" ||g_enterprise|| "' AND "||"stfq001 = '"||g_stfq_m.stfq001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq001
            #add-point:ON CHANGE stfq001 name="input.g.stfq001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq002
            #add-point:BEFORE FIELD stfq002 name="input.b.stfq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq002
            
            #add-point:AFTER FIELD stfq002 name="input.a.stfq002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq002
            #add-point:ON CHANGE stfq002 name="input.g.stfq002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq015
            #add-point:BEFORE FIELD stfq015 name="input.b.stfq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq015
            
            #add-point:AFTER FIELD stfq015 name="input.a.stfq015"
          IF g_stfq_m.stfq015='2' THEN
             LET l_msg=cl_getmsg('amh-00662',g_dlang)
             call cl_set_comp_att_text("stfq015",l_msg)
           end if 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq015
            #add-point:ON CHANGE stfq015 name="input.g.stfq015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq003
            
            #add-point:AFTER FIELD stfq003 name="input.a.stfq003"
         if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          end if 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq003
            #add-point:BEFORE FIELD stfq003 name="input.b.stfq003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq003
            #add-point:ON CHANGE stfq003 name="input.g.stfq003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq003_desc
            #add-point:BEFORE FIELD stfq003_desc name="input.b.stfq003_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq003_desc
            
            #add-point:AFTER FIELD stfq003_desc name="input.a.stfq003_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq003_desc
            #add-point:ON CHANGE stfq003_desc name="input.g.stfq003_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq004
            
            #add-point:AFTER FIELD stfq004 name="input.a.stfq004"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq004
            #add-point:BEFORE FIELD stfq004 name="input.b.stfq004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq004
            #add-point:ON CHANGE stfq004 name="input.g.stfq004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq005
            #add-point:BEFORE FIELD stfq005 name="input.b.stfq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq005
            
            #add-point:AFTER FIELD stfq005 name="input.a.stfq005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq005
            #add-point:ON CHANGE stfq005 name="input.g.stfq005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq006
            #add-point:BEFORE FIELD stfq006 name="input.b.stfq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq006
            
            #add-point:AFTER FIELD stfq006 name="input.a.stfq006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq006
            #add-point:ON CHANGE stfq006 name="input.g.stfq006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq007
            #add-point:BEFORE FIELD stfq007 name="input.b.stfq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq007
            
            #add-point:AFTER FIELD stfq007 name="input.a.stfq007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq007
            #add-point:ON CHANGE stfq007 name="input.g.stfq007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq008
            #add-point:BEFORE FIELD stfq008 name="input.b.stfq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq008
            
            #add-point:AFTER FIELD stfq008 name="input.a.stfq008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq008
            #add-point:ON CHANGE stfq008 name="input.g.stfq008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq009
            #add-point:BEFORE FIELD stfq009 name="input.b.stfq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq009
            
            #add-point:AFTER FIELD stfq009 name="input.a.stfq009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq009
            #add-point:ON CHANGE stfq009 name="input.g.stfq009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq010
            #add-point:BEFORE FIELD stfq010 name="input.b.stfq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq010
            
            #add-point:AFTER FIELD stfq010 name="input.a.stfq010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq010
            #add-point:ON CHANGE stfq010 name="input.g.stfq010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq011
            #add-point:BEFORE FIELD stfq011 name="input.b.stfq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq011
            
            #add-point:AFTER FIELD stfq011 name="input.a.stfq011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq011
            #add-point:ON CHANGE stfq011 name="input.g.stfq011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq012
            #add-point:BEFORE FIELD stfq012 name="input.b.stfq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq012
            
            #add-point:AFTER FIELD stfq012 name="input.a.stfq012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq012
            #add-point:ON CHANGE stfq012 name="input.g.stfq012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq013
            
            #add-point:AFTER FIELD stfq013 name="input.a.stfq013"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq013_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq013
            #add-point:BEFORE FIELD stfq013 name="input.b.stfq013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq013
            #add-point:ON CHANGE stfq013 name="input.g.stfq013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfq014
            #add-point:BEFORE FIELD stfq014 name="input.b.stfq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfq014
            
            #add-point:AFTER FIELD stfq014 name="input.a.stfq014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfq014
            #add-point:ON CHANGE stfq014 name="input.g.stfq014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfqstus
            #add-point:BEFORE FIELD stfqstus name="input.b.stfqstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfqstus
            
            #add-point:AFTER FIELD stfqstus name="input.a.stfqstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfqstus
            #add-point:ON CHANGE stfqstus name="input.g.stfqstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stfqunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqunit
            #add-point:ON ACTION controlp INFIELD stfqunit name="input.c.stfqunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfqsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqsite
            #add-point:ON ACTION controlp INFIELD stfqsite name="input.c.stfqsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq001
            #add-point:ON ACTION controlp INFIELD stfq001 name="input.c.stfq001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq002
            #add-point:ON ACTION controlp INFIELD stfq002 name="input.c.stfq002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq015
            #add-point:ON ACTION controlp INFIELD stfq015 name="input.c.stfq015"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq003
            #add-point:ON ACTION controlp INFIELD stfq003 name="input.c.stfq003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq003_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq003_desc
            #add-point:ON ACTION controlp INFIELD stfq003_desc name="input.c.stfq003_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq004
            #add-point:ON ACTION controlp INFIELD stfq004 name="input.c.stfq004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq005
            #add-point:ON ACTION controlp INFIELD stfq005 name="input.c.stfq005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq006
            #add-point:ON ACTION controlp INFIELD stfq006 name="input.c.stfq006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq007
            #add-point:ON ACTION controlp INFIELD stfq007 name="input.c.stfq007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq008
            #add-point:ON ACTION controlp INFIELD stfq008 name="input.c.stfq008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq009
            #add-point:ON ACTION controlp INFIELD stfq009 name="input.c.stfq009"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq010
            #add-point:ON ACTION controlp INFIELD stfq010 name="input.c.stfq010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq011
            #add-point:ON ACTION controlp INFIELD stfq011 name="input.c.stfq011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq012
            #add-point:ON ACTION controlp INFIELD stfq012 name="input.c.stfq012"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq013
            #add-point:ON ACTION controlp INFIELD stfq013 name="input.c.stfq013"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfq014
            #add-point:ON ACTION controlp INFIELD stfq014 name="input.c.stfq014"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfqstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfqstus
            #add-point:ON ACTION controlp INFIELD stfqstus name="input.c.stfqstus"
            
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
               SELECT COUNT(1) INTO l_count FROM stfq_t
                WHERE stfqent = g_enterprise AND stfq001 = g_stfq_m.stfq001
 
               IF l_count = 0 THEN
               
                  #add-point:單頭新增前 name="input.head.b_insert"
                  
                  #end add-point
               
                  #將新增的單頭資料寫入資料庫
                  INSERT INTO stfq_t (stfqent,stfqunit,stfqsite,stfq001,stfq002,stfq015,stfq003,stfq004, 
                      stfq005,stfq006,stfq007,stfq008,stfq009,stfq010,stfq011,stfq012,stfq013,stfq014, 
                      stfqstus,stfqownid,stfqowndp,stfqcrtid,stfqcrtdp,stfqcrtdt,stfqmodid,stfqmoddt, 
                      stfqcnfid,stfqcnfdt)
                  VALUES (g_enterprise,g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001,g_stfq_m.stfq002, 
                      g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
                      g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011, 
                      g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid, 
                      g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid, 
                      g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfdt) 
                  
                  #add-point:單頭新增中 name="input.head.m_insert"
                  
                  #end add-point
                  
                  #若寫入錯誤則提示錯誤訊息並返回輸入頁面
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfq_t:",SQLERRMESSAGE 
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
                  LET g_errparam.extend = g_stfq_m.stfq001
                  LET g_errparam.code   = "std-00006" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF 
            ELSE
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astm402_stfq_t_mask_restore('restore_mask_o')
               
               UPDATE stfq_t SET (stfqunit,stfqsite,stfq001,stfq002,stfq015,stfq003,stfq004,stfq005, 
                   stfq006,stfq007,stfq008,stfq009,stfq010,stfq011,stfq012,stfq013,stfq014,stfqstus, 
                   stfqownid,stfqowndp,stfqcrtid,stfqcrtdp,stfqcrtdt,stfqmodid,stfqmoddt,stfqcnfid,stfqcnfdt) = (g_stfq_m.stfqunit, 
                   g_stfq_m.stfqsite,g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003, 
                   g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008, 
                   g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013, 
                   g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
                   g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
                   g_stfq_m.stfqcnfdt)
                WHERE stfqent = g_enterprise AND stfq001 = g_stfq001_t #
 
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfq_t" 
                     LET g_errparam.code   = "std-00009" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfq_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  OTHERWISE
                     
                     #資料多語言用-增/改
                     
                     
                     #將遮罩欄位進行遮蔽
                     CALL astm402_stfq_t_mask_restore('restore_mask_n')
                     
                     #add-point:單頭修改後 name="input.head.a_update"
                     
                     #end add-point
                     #修改歷程記錄(單頭修改)
                     LET g_log1 = util.JSON.stringify(g_stfq_m_t)
                     LET g_log2 = util.JSON.stringify(g_stfq_m)
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
 
{<section id="astm402.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astm402_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point
   DEFINE l_newno     LIKE stfq_t.stfq001 
   DEFINE l_oldno     LIKE stfq_t.stfq001 
 
   DEFINE l_master    RECORD LIKE stfq_t.* #此變數樣板目前無使用
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
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
   IF g_stfq_m.stfq001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #備份key值
   LET g_stfq001_t = g_stfq_m.stfq001
 
   
   #清空key值
   LET g_stfq_m.stfq001 = ""
 
    
   CALL astm402_set_entry("a")
   CALL astm402_set_no_entry("a")
   
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stfq_m.stfqownid = g_user
      LET g_stfq_m.stfqowndp = g_dept
      LET g_stfq_m.stfqcrtid = g_user
      LET g_stfq_m.stfqcrtdp = g_dept 
      LET g_stfq_m.stfqcrtdt = cl_get_current()
      LET g_stfq_m.stfqmodid = g_user
      LET g_stfq_m.stfqmoddt = cl_get_current()
      LET g_stfq_m.stfqstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfq_m.stfqstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   #資料輸入
   CALL astm402_input("r")
   
   IF INT_FLAG THEN
      #取消
      INITIALIZE g_stfq_m.* TO NULL
      CALL astm402_show()
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
      LET g_errparam.extend = "stfq_t:",SQLERRMESSAGE 
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
   CALL astm402_set_act_visible()
   CALL astm402_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_stfq001_t = g_stfq_m.stfq001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stfqent = " ||g_enterprise|| " AND",
                      " stfq001 = '", g_stfq_m.stfq001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm402_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
              
   LET g_data_owner = g_stfq_m.stfqownid      
   LET g_data_dept  = g_stfq_m.stfqowndp
              
   #功能已完成,通報訊息中心
   CALL astm402_msgcentre_notify('reproduce')
                 
END FUNCTION
 
{</section>}
 
{<section id="astm402.show" >}
#+ 資料顯示 
PRIVATE FUNCTION astm402_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
define l_msg  string
   #end add-point  
   
   #add-point:show段Function前置處理  name="show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astm402_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   IF g_stfq_m.stfq015='1' or g_stfq_m.stfq015 is null THEN
         LET l_msg=cl_getmsg('amh-00663',g_dlang)
         call cl_set_comp_att_text("stfq003",l_msg)
     else
           LET l_msg=cl_getmsg('amh-00662',g_dlang)
           call cl_set_comp_att_text("stfq003",l_msg)
     end if
    if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
      else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
       end if       
   #end add-point
 
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite,g_stfq_m.stfqsite_desc, 
       g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq003_desc,g_stfq_m.stfq004, 
       g_stfq_m.stfq004_desc,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009, 
       g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq013_desc,g_stfq_m.stfq014, 
       g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp,g_stfq_m.stfqowndp_desc, 
       g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqcrtdt, 
       g_stfq_m.stfqmodid,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfid_desc, 
       g_stfq_m.stfqcnfdt
   
   #儲存PK
   LET l_ac = g_current_idx
   CALL astm402_set_pk_array()
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfq_m.stfqstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
 
   #顯示有特殊格式設定的欄位或說明
   CALL cl_show_fld_cont()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.delete" >}
#+ 資料刪除 
PRIVATE FUNCTION astm402_delete()
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
   IF g_stfq_m.stfq001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
    
   LET g_stfq001_t = g_stfq_m.stfq001
 
   
   
 
   OPEN astm402_cl USING g_enterprise,g_stfq_m.stfq001
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm402_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astm402_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001, 
       g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
       g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
       g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
       g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
       g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc,g_stfq_m.stfq013_desc, 
       g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp_desc, 
       g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astm402_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stfq_m_mask_o.* =  g_stfq_m.*
   CALL astm402_stfq_t_mask()
   LET g_stfq_m_mask_n.* =  g_stfq_m.*
   
   #將最新資料顯示到畫面上
   CALL astm402_show()
   
   IF cl_ask_delete() THEN
 
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point
 
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astm402_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
 
      DELETE FROM stfq_t 
       WHERE stfqent = g_enterprise AND stfq001 = g_stfq_m.stfq001 
 
 
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfq_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
  
      
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
      
       
 
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stfq_m)   #(ver:49)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:49)
         CLOSE astm402_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      CLEAR FORM
      CALL astm402_ui_browser_refresh()
      
      #確保畫面上保有資料
      IF g_browser_cnt > 0 THEN
         #CALL astm402_browser_fill(g_wc,"")
         CALL astm402_fetch("P")
      ELSE
         CLEAR FORM
      END IF
      CALL s_transaction_end('Y','0')
   ELSE    
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astm402_cl
 
   #功能已完成,通報訊息中心
   CALL astm402_msgcentre_notify('delete')
 
   #add-point:單頭刪除完成後 name="delete.a_delete"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astm402_ui_browser_refresh()
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
      IF g_browser[l_i].b_stfq001 = g_stfq_m.stfq001
 
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
 
{<section id="astm402.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astm402_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization" 
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point     
    
   #add-point:Function前置處理 name="set_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("stfq001",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astm402_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_no_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stfq001",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm402.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astm402_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization" 
   
   #end add-point  
   #add-point:set_act_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astm402.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astm402_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point
   #add-point:set_act_no_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astm402.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astm402_default_search()
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
      LET ls_wc = ls_wc, " stfq001 = '", g_argv[01], "' AND "
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
 
{<section id="astm402.mask_functions" >}
&include "erp/ast/astm402_mask.4gl"
 
{</section>}
 
{<section id="astm402.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astm402_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   RETURN
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stfq_m.stfq001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astm402_cl USING g_enterprise,g_stfq_m.stfq001
   IF STATUS THEN
      CLOSE astm402_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm402_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite,g_stfq_m.stfq001, 
       g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005,g_stfq_m.stfq006, 
       g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012, 
       g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp,g_stfq_m.stfqcrtid, 
       g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid, 
       g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc,g_stfq_m.stfq013_desc, 
       g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp_desc, 
       g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astm402_action_chk() THEN
      CLOSE astm402_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite,g_stfq_m.stfqsite_desc, 
       g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq003_desc,g_stfq_m.stfq004, 
       g_stfq_m.stfq004_desc,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009, 
       g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq013_desc,g_stfq_m.stfq014, 
       g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp,g_stfq_m.stfqowndp_desc, 
       g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqcrtdt, 
       g_stfq_m.stfqmodid,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqmoddt,g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfid_desc, 
       g_stfq_m.stfqcnfdt
 
   CASE g_stfq_m.stfqstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
    if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          end if  
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stfq_m.stfqstus
            
            WHEN "N"
               HIDE OPTION "open"
            WHEN "Y"
               HIDE OPTION "valid"
            WHEN "X"
               HIDE OPTION "void"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CASE g_stfq_m.stfqstus
         WHEN "N"
            HIDE OPTION "open"
         WHEN "X"
            HIDE OPTION "open"
            HIDE OPTION "valid"
         WHEN "Y"
            HIDE OPTION "void"
            HIDE OPTION "open"
      END CASE
      #end add-point
      
      
	  
      ON ACTION open
         IF cl_auth_chk_act("open") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.open"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION valid
         IF cl_auth_chk_act("valid") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.valid"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION void
         IF cl_auth_chk_act("void") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.void"
            
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "X"
      ) OR 
      g_stfq_m.stfqstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astm402_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stfq_m.stfqmodid = g_user
   LET g_stfq_m.stfqmoddt = cl_get_current()
   LET g_stfq_m.stfqstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stfq_t 
      SET (stfqstus,stfqmodid,stfqmoddt) 
        = (g_stfq_m.stfqstus,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt)     
    WHERE stfqent = g_enterprise AND stfq001 = g_stfq_m.stfq001
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astm402_master_referesh USING g_stfq_m.stfq001 INTO g_stfq_m.stfqunit,g_stfq_m.stfqsite, 
          g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq004,g_stfq_m.stfq005, 
          g_stfq_m.stfq006,g_stfq_m.stfq007,g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011, 
          g_stfq_m.stfq012,g_stfq_m.stfq013,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqowndp, 
          g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtdp,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmoddt, 
          g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfdt,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite_desc,g_stfq_m.stfq004_desc, 
          g_stfq_m.stfq013_desc,g_stfq_m.stfqownid_desc,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid_desc, 
          g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stfq_m.stfqunit,g_stfq_m.stfqunit_desc,g_stfq_m.stfqsite,g_stfq_m.stfqsite_desc, 
          g_stfq_m.stfq001,g_stfq_m.stfq002,g_stfq_m.stfq015,g_stfq_m.stfq003,g_stfq_m.stfq003_desc, 
          g_stfq_m.stfq004,g_stfq_m.stfq004_desc,g_stfq_m.stfq005,g_stfq_m.stfq006,g_stfq_m.stfq007, 
          g_stfq_m.stfq008,g_stfq_m.stfq009,g_stfq_m.stfq010,g_stfq_m.stfq011,g_stfq_m.stfq012,g_stfq_m.stfq013, 
          g_stfq_m.stfq013_desc,g_stfq_m.stfq014,g_stfq_m.stfqstus,g_stfq_m.stfqownid,g_stfq_m.stfqownid_desc, 
          g_stfq_m.stfqowndp,g_stfq_m.stfqowndp_desc,g_stfq_m.stfqcrtid,g_stfq_m.stfqcrtid_desc,g_stfq_m.stfqcrtdp, 
          g_stfq_m.stfqcrtdp_desc,g_stfq_m.stfqcrtdt,g_stfq_m.stfqmodid,g_stfq_m.stfqmodid_desc,g_stfq_m.stfqmoddt, 
          g_stfq_m.stfqcnfid,g_stfq_m.stfqcnfid_desc,g_stfq_m.stfqcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
    if  g_stfq_m.stfq015 is null or g_stfq_m.stfq015='1' then  
           INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          else
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfq_m.stfq003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","")  RETURNING g_rtn_fields
            LET g_stfq_m.stfq003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfq_m.stfq003_desc
          end if  
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astm402_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm402_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm402.signature" >}
   
 
{</section>}
 
{<section id="astm402.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astm402_set_pk_array()
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
   LET g_pk_array[1].values = g_stfq_m.stfq001
   LET g_pk_array[1].column = 'stfq001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm402.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astm402.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astm402_msgcentre_notify(lc_state)
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
   CALL astm402_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stfq_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm402.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astm402_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization" 
   
   #end add-point
   #add-point:action_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm402.other_function" readonly="Y" >}

 
{</section>}
 
