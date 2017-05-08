#該程式未解開Section, 採用最新樣板產出!
{<section id="astq502.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:6(2016-09-14 09:52:00), PR版次:0006(2016-09-14 09:30:01)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000111
#+ Filename...: astq502
#+ Description: 每日銀行卡手續費明細查詢作業
#+ Creator....: 06815(2015-05-07 11:04:22)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq502.global" >}
#應用 q02 樣板自動產生(Version:42)
#add-point:填寫註解說明 name="global.memo"
#160913-00034#2    2016/09/14 by 08742      q_pmaa001開窗改成 q_pmaa001_1抓類型=3 的條件
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_stgb_d RECORD
       #statepic       LIKE type_t.chr1,
       
       sel LIKE type_t.chr1, 
   stgbsite LIKE stgb_t.stgbsite, 
   stgb001 LIKE stgb_t.stgb001, 
   stgb012 LIKE stgb_t.stgb012, 
   stgb013 LIKE stgb_t.stgb013, 
   stgb002 LIKE stgb_t.stgb002, 
   stgb002_desc LIKE type_t.chr500, 
   stgb003 LIKE stgb_t.stgb003, 
   stgb003_desc LIKE type_t.chr500, 
   stfa051 LIKE stfa_t.stfa051, 
   stfa051_desc LIKE type_t.chr500, 
   stgb004 LIKE stgb_t.stgb004, 
   stgb004_desc LIKE type_t.chr500, 
   stgb005 LIKE stgb_t.stgb005, 
   stgb006 LIKE stgb_t.stgb006, 
   stgb007 LIKE stgb_t.stgb007, 
   stgb014 LIKE stgb_t.stgb014, 
   stgb008 LIKE stgb_t.stgb008, 
   stgb009 LIKE stgb_t.stgb009, 
   stgb010 LIKE stgb_t.stgb010, 
   stgb011 LIKE stgb_t.stgb011 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sql2                STRING

#add by dengdd 151010----str-----------------
 TYPE type_g_stgb2_d RECORD
   l_stgbsite LIKE stgb_t.stgbsite, 
   l_sdate LIKE stgb_t.stgb001, 
   l_edate LIKE stgb_t.stgb001,
   l_stgb012 LIKE stgb_t.stgb012,    #160613-00045#2 20160615 add by beckxie
   l_stgb013 LIKE stgb_t.stgb013,    #160613-00045#2 20160615 add by beckxie
   l_stgb002 LIKE stgb_t.stgb002, 
   l_stgb002_desc LIKE type_t.chr500, 
   l_stgb003 LIKE stgb_t.stgb003, 
   l_stgb003_desc LIKE type_t.chr500,
   l_stfa051 LIKE stfa_t.stfa051, 
   l_stfa051_desc LIKE type_t.chr500,   
   l_stgb004 LIKE stgb_t.stgb004, 
   l_stgb004_desc LIKE type_t.chr500, 
   l_stgb005 LIKE stgb_t.stgb005, 
   l_stgb006 LIKE stgb_t.stgb006, 
   l_stgb007 LIKE stgb_t.stgb007, 
   l_stgb014 LIKE stgb_t.stgb014,   #160615-00046#6 20160617 add by beckxie 
   l_stgb008 LIKE stgb_t.stgb008, 
   l_stgb009 LIKE stgb_t.stgb009, 
   l_stgb010 LIKE stgb_t.stgb010, 
   l_stgb011 LIKE stgb_t.stgb011
   
       END RECORD
 
 
#模組變數(Module Variables)
DEFINE g_stgb2_d          DYNAMIC ARRAY OF type_g_stgb2_d
DEFINE g_stgb2_d_t        type_g_stgb2_d
DEFINE g_sql_del          STRING
DEFINE g_sql_ins          STRING

#INPUT 条件
DEFINE l_sdate           LIKE stgb_t.stgb001
DEFINE l_edate           LIKE stgb_t.stgb001
#add by dengdd 151010----end------------------
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_stgb_d
DEFINE g_master_t                   type_g_stgb_d
DEFINE g_stgb_d          DYNAMIC ARRAY OF type_g_stgb_d
DEFINE g_stgb_d_t        type_g_stgb_d
 
      
DEFINE g_wc                 STRING
DEFINE g_wc_t               STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                STRING
DEFINE g_wc_filter          STRING
DEFINE g_wc_filter_t        STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10              
DEFINE l_ac_d               LIKE type_t.num10              #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_detail_cnt2        LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
DEFINE g_detail_idx         LIKE type_t.num10
DEFINE g_detail_idx2        LIKE type_t.num10
DEFINE g_hyper_url          STRING                        #hyperlink的主要網址
DEFINE g_tot_cnt            LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page        LIKE type_t.num10             #每頁筆數
DEFINE g_current_row_tot    LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_act_list      STRING                        #分頁ACTION清單
DEFINE g_page_start_num     LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num       LIKE type_t.num10             #目前頁面結束筆數
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_wc_filter_table    STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

##end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astq502.main" >}
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
   LET g_forupd_sql = " ", 
                      " FROM ",
                      " "
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq502_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq502_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq502_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq502 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq502_init()   
 
      #進入選單 Menu (="N")
      CALL astq502_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq502
      
   END IF 
   
   CLOSE astq502_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq502.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq502_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
      CALL cl_set_combo_scc('b_stgb012','6013') 
   CALL cl_set_combo_scc('b_stgb010','6006') 
 
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   #160613-00045#2 20160615 add by beckxie---S
   CALL cl_set_combo_scc_part('stgb012','6013','1,2,3,4,5')
   CALL cl_set_combo_scc_part('b_stgb012','6013','1,2,3,4,5')
   CALL cl_set_combo_scc_part('l_stgb012','6013','1,2,3,4,5')
   #160613-00045#2 20160615 add by beckxie---E
   CALL cl_set_combo_scc_part('b_stgb010','6006','1,2')
   CALL cl_set_combo_scc_part('l_stgb010','6006','1,2')
   
   CALL cl_set_combo_scc_part('stgb010','6006','1,2')#add by dengdd 151010
   
   #add by dengdd 151010-----str---------------------
       
   LET l_sdate=g_today
   LET l_edate=g_today
   DISPLAY l_sdate,l_edate TO l_stgb001_s,l_stgb001_e
   CALL s_aooi500_create_temp() RETURNING l_success     
   #add by dengdd 151010-----end----------------------
   #end add-point
 
   CALL astq502_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="astq502.default_search" >}
PRIVATE FUNCTION astq502_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stgbsite = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stgb001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stgb002 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET g_wc = g_wc, " stgb004 = '", g_argv[04], "' AND "
   END IF
   IF NOT cl_null(g_argv[05]) THEN
      LET g_wc = g_wc, " stgb013 = '", g_argv[05], "' AND "
   END IF
 
 
 
 
 
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段開始後 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq502_ui_dialog()
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE li_idx     LIKE type_t.num10
   DEFINE lc_action_choice_old     STRING
   DEFINE lc_current_row           LIKE type_t.num10
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point 
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
         
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   LET g_wc = g_wc," AND 1=1"     #160126-00002#1 160128 By pomelo add
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL astq502_b_fill()
   ELSE
      CALL astq502_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stgb_d.clear()
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 1
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL astq502_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stgb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq502_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq502_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_stgb2_d TO s_detail2.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq502_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq502_detail_action_trans()
               #add-point:input段before row

               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為

            #end add-point
 
         END DISPLAY
         #160126-00002#1 160128 By pomelo add(S)
         CONSTRUCT g_wc ON stgb002,stgbsite,stgb003,stgb004,stgb010,stgb011,stgb012,stgb013   #160613-00045#2 20160615 modify(stgb012,stgb013) by beckxie
              FROM stgb002,stgbsite,stgb003,stgb004,stgb010,stgb011,stgb012,stgb013           #160613-00045#2 20160615 modify(stgb012,stgb013) by beckxie
              
            ON ACTION controlp INFIELD stgbsite
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgbsite',g_site,'c')
               CALL q_ooef001_24()
               DISPLAY g_qryparam.return1 TO stgbsite
               NEXT FIELD stgbsite
               
            ON ACTION controlp INFIELD stgb002
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1=g_site
               CALL q_mhae001()
               DISPLAY g_qryparam.return1 TO stgb002
               NEXT FIELD stgb002
               
            ON ACTION controlp INFIELD stgb003
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               #160913-00034#2 -S
               #CALL q_pmaa001()                           #呼叫開窗            
               LET g_qryparam.arg1 = "('3')"            
               CALL q_pmaa001_1()                           #呼叫開窗
               #160913-00034#2 -E
               DISPLAY g_qryparam.return1 TO stgb003
               NEXT FIELD stgb003
               
            ON ACTION controlp INFIELD stgb004
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               CALL q_stae001()
               DISPLAY g_qryparam.return1 TO stgb004
               NEXT FIELD stgb004
               
            #160613-00045#2 20160615 add by beckxie---S   
            ON ACTION controlp INFIELD stgb013
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c' 
               LET g_qryparam.reqry = FALSE
               CALL q_stgb013()
               DISPLAY g_qryparam.return1 TO stgb013
               NEXT FIELD stgb013
            #160613-00045#2 20160615 add by beckxie---E
            
         END CONSTRUCT
      
         INPUT l_sdate,l_edate FROM l_stgb001_s,l_stgb001_e ATTRIBUTE(WITHOUT DEFAULTS)
            BEFORE INPUT
               IF g_wc = " 1=2 AND 1=1" THEN
                  LET g_wc = " 1=1"
               END IF
         
         END INPUT
         #160126-00002#1 160128 By pomelo add(E)
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq502_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            #將規格<選取項目checkbox>屬性勾選hidden
            CALL cl_set_act_visible("selall,selnone,sel,unsel", FALSE) 
            CALL cl_set_comp_visible("sel", FALSE) 
            #160126-00002#1 160128 By pomelo add(S)
            CALL cl_set_act_visible("insert,query", FALSE) 
            LET l_sdate = g_today
            LET l_edate = g_today
            DISPLAY l_sdate TO l_stgb001_s
            DISPLAY l_edate TO l_stgb001_e
            DISPLAY 'N' TO stgb011
            #160126-00002#1 160128 By pomelo add(E)
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astq502_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
               
            END IF
 
 
 
 
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
               CALL astq502_query()
               #add-point:ON ACTION query name="menu.query"
               CALL astq502_query2()
               EXIT DIALOG   #將規格<選取項目checkbox>屬性勾選hidden
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo name="menu.datainfo"
               
               #END add-point
               
               
            END IF
 
 
 
 
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq502_filter()
            #add-point:ON ACTION filter name="menu.filter"
            #EXIT DIALOG   #將規格<選取項目checkbox>屬性勾選hidden  #160126-00002#1 160128 By pomelo mark
            CALL cl_set_comp_visible("sel",FALSE)   #160126-00002#1 160128 By pomelo add
            #END add-point
 
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
 
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION datarefresh   # 重新整理
            LET g_error_show = 1
            CALL astq502_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stgb_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            CALL astq502_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq502_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq502_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq502_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stgb_d.getLength()
               LET g_stgb_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stgb_d.getLength()
               LET g_stgb_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stgb_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stgb_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stgb_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stgb_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         #160126-00002#1 160128 By pomelo add(S)
         ON ACTION ACCEPT
            IF cl_null(l_sdate) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'acr-00015'
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
               NEXT FIELD l_stgb001_s
            END IF
            IF cl_null(l_edate) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'acr-00015'
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
               NEXT FIELD l_stgb001_e
            END IF
            
            LET g_detail_idx = 1
            CALL astq502_b_fill()
            IF g_stgb_d.getLength() > 0 THEN
               CALL DIALOG.setCurrentRow("s_detail1", g_detail_idx)
            END IF
 
            IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = -100
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            END IF
         #160126-00002#1 160128 By pomelo add(E)
         #end add-point
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq502_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   RETURN
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
   
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_stgb_d.clear()
 
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_wc_filter = " 1=1"
   LET g_detail_page_action = ""
   LET g_pagestart = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET ls_wc2 = g_wc2
   LET g_master_idx = l_ac
 
   
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON stgbsite,stgb012,stgb013,stgb014
           FROM s_detail1[1].b_stgbsite,s_detail1[1].b_stgb012,s_detail1[1].b_stgb013,s_detail1[1].b_stgb014 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<b_stgbsite>>----
         #Ctrlp:construct.c.page1.b_stgbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgbsite
            #add-point:ON ACTION controlp INFIELD b_stgbsite name="construct.c.page1.b_stgbsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgbsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgbsite  #顯示到畫面上
            NEXT FIELD b_stgbsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stgbsite
            #add-point:BEFORE FIELD b_stgbsite name="construct.b.page1.b_stgbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stgbsite
            
            #add-point:AFTER FIELD b_stgbsite name="construct.a.page1.b_stgbsite"
            
            #END add-point
            
 
 
         #----<<b_stgb001>>----
         #----<<b_stgb012>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stgb012
            #add-point:BEFORE FIELD b_stgb012 name="construct.b.page1.b_stgb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stgb012
            
            #add-point:AFTER FIELD b_stgb012 name="construct.a.page1.b_stgb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stgb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb012
            #add-point:ON ACTION controlp INFIELD b_stgb012 name="construct.c.page1.b_stgb012"
            
            #END add-point
 
 
         #----<<b_stgb013>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stgb013
            #add-point:BEFORE FIELD b_stgb013 name="construct.b.page1.b_stgb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stgb013
            
            #add-point:AFTER FIELD b_stgb013 name="construct.a.page1.b_stgb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stgb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb013
            #add-point:ON ACTION controlp INFIELD b_stgb013 name="construct.c.page1.b_stgb013"
            
            #END add-point
 
 
         #----<<b_stgb002>>----
         #----<<b_stgb002_desc>>----
         #----<<b_stgb003>>----
         #----<<b_stgb003_desc>>----
         #----<<b_stfa051>>----
         #----<<b_stfa051_desc>>----
         #----<<b_stgb004>>----
         #----<<b_stgb004_desc>>----
         #----<<b_stgb005>>----
         #----<<b_stgb006>>----
         #----<<b_stgb007>>----
         #----<<b_stgb014>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stgb014
            #add-point:BEFORE FIELD b_stgb014 name="construct.b.page1.b_stgb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stgb014
            
            #add-point:AFTER FIELD b_stgb014 name="construct.a.page1.b_stgb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stgb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb014
            #add-point:ON ACTION controlp INFIELD b_stgb014 name="construct.c.page1.b_stgb014"
            
            #END add-point
 
 
         #----<<b_stgb008>>----
         #----<<b_stgb009>>----
         #----<<b_stgb010>>----
         #----<<b_stgb011>>----
   
       
      END CONSTRUCT
      
 
      
 
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
 
      ON ACTION accept
         #add-point:ON ACTION accept name="query.accept"
         
         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前 name="query.set_qbe_action_before"
      
      #end add-point 
 
      ON ACTION qbeclear   # 條件清除
         CLEAR FORM
         #add-point:條件清除後 name="query.qbeclear"
         
         #end add-point 
 
      #add-point:query段查詢方案相關ACTION設定後 name="query.set_qbe_action_after"
      
      #end add-point 
 
   END DIALOG
 
   
 
   LET g_wc = g_wc_table 
 
 
   
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
 
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = " 1=2"
      LET g_wc2 = " 1=1"
      LET g_wc_filter = g_wc_filter_t
      RETURN
   ELSE
      LET g_master_idx = 1
   END IF
        
   #add-point:cs段after_construct name="cs.after_construct"
   
   #end add-point
        
   LET g_error_show = 1
   CALL astq502_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION
 
{</section>}
 
{<section id="astq502.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq502_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where         STRING
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
    
   CALL s_aooi500_sql_where(g_prog,'stgbsite') RETURNING l_where
  
   #end add-point
 
   IF cl_null(g_wc_filter) THEN
      LET g_wc_filter = " 1=1"
   END IF
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   
   LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter, cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()
 
   LET ls_sql_rank = "SELECT  UNIQUE '',stgbsite,stgb001,stgb012,stgb013,stgb002,'',stgb003,'','','', 
       stgb004,'',stgb005,stgb006,stgb007,stgb014,stgb008,stgb009,stgb010,stgb011  ,DENSE_RANK() OVER( ORDER BY stgb_t.stgbsite, 
       stgb_t.stgb001,stgb_t.stgb002,stgb_t.stgb004,stgb_t.stgb013) AS RANK FROM stgb_t",
 
 
                     "",
                     " WHERE stgbent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stgb_t"),
                     " ORDER BY stgb_t.stgbsite,stgb_t.stgb001,stgb_t.stgb002,stgb_t.stgb004,stgb_t.stgb013"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   LET ls_wc = ls_wc CLIPPED," AND ",l_where
   
   #LET ls_sql_rank = " SELECT  UNIQUE 'N',stgbent,stgbsite,stgb001,stgb002,mhael023 stgb002_desc,stgb003,pmaal004 stgb003_desc,stfa051,rtaxl003 stfa051_desc,",   #160613-00045#2 20160615 mark by beckxie
   LET ls_sql_rank = " SELECT  UNIQUE 'N',stgbent,stgbsite,stgb001,stgb012,stgb013,stgb002,CASE WHEN stgb012 = '5' THEN mhbel003 ELSE mhael023 END stgb002_desc,stgb003,pmaal004 stgb003_desc,stfa051,rtaxl003 stfa051_desc,", #160613-00045#2 20160615 add by beckxie
                   "                      stgb004,stael003 stgb004_desc,stgb005,stgb006,stgb007,stgb014,stgb008,stgb009,stgb010,stgb011 ",  #160615-00046#6 20160617 add(stgb014) by beckxie
    #               " DENSE_RANK() OVER( ORDER BY stgb_t.stgbsite,stgb_t.stgb001,stgb_t.stgb002) AS RANK                                    ",
                   " FROM stgb_t                                                                                                           ",
                   " LEFT JOIN mhael_t  ON mhaelent = stgbent AND mhael001 = stgb002 AND stgbsite=mhaelsite AND mhael022 = '"||g_dlang||"' ",
                   " LEFT JOIN mhbel_t  ON mhbelent = stgbent AND mhbel001 = stgb002 AND mhbel002 = '"||g_dlang||"' ",   #160613-00045#2 20160615 add by beckxie
			  	       " LEFT JOIN pmaal_t  ON pmaalent = stgbent AND pmaal001 = stgb003 AND pmaal002 = '"||g_dlang||"'                        ",
			  	       " LEFT JOIN stael_t  ON staelent = stgbent AND stael001=  stgb004 AND stael002 = '"||g_dlang||"'                        ",
			  	       " LEFT JOIN  stfa_t  ON stfaent=stgbent AND stfasite=stgbsite AND stfa005=stgb002                                       ",
			  	       " LEFT JOIN rtaxl_t  ON rtaxlent = stgbent AND rtaxl001= stfa051 AND rtaxl002= '"||g_dlang||"'                                                ",
				#"     LEFT JOIN mhael_t ON stgbent=mhaelent AND stgbsite=mhaelsite AND stgb002=mhael001 AND mhael022 = '"||g_dlang||"'       ",
            #"     LEFT JOIN pmaal_t ON stgbent=pmaalent AND stgb003=pmaal001 AND pmaal002 = '"||g_dlang||"'                              ",
            #"     LEFT JOIN stael_t ON stgbent=staelent AND stgb004=stael001 AND stael002 = '"||g_dlang||"'                              ",
#			      	 " WHERE stgbent= ? AND stgbsite='",g_site,"'  AND 1=1 AND ", ls_wc,
                   " WHERE stgbent= ? AND  1=1 AND ", ls_wc,     #mod by dengdd 151016
			      	 "   AND stgb001 BETWEEN TO_DATE('",l_sdate,"','yy/mm/dd') AND TO_DATE('",l_edate,"','yy/mm/dd')"  #add by dengdd 151010
			      	 
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stgb_t"),
                 " ORDER BY stgb_t.stgbsite,stgb_t.stgb001,stgb_t.stgb002"
                 
   #add by dengdd 151010---str-----------
   IF NOT astq502_create_tmp() THEN
      RETURN
   END IF
   
   #清空临时表
   LET g_sql_del="DELETE FROM astq502_tmp" 
   EXECUTE IMMEDIATE g_sql_del
    
   #数据插入临时表
   LET g_sql_ins = "INSERT INTO astq502_tmp ",ls_sql_rank         
   PREPARE ins_tmp FROM g_sql_ins
   EXECUTE ins_tmp USING g_enterprise
   
   #从临时表中取数
   #LET ls_sql_rank="SELECT  UNIQUE 'N',stgbsite,stgb001,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,   #160613-00045#2 20160615 mark by beckxie
   LET ls_sql_rank="SELECT  UNIQUE 'N',stgbsite,stgb001,stgb012,stgb013,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,",   #160613-00045#2 20160615 add by beckxie
                   "               stgb004,stgb004_desc,stgb005,stgb006,stgb007,COALESCE(stgb014,0) stgb014,stgb008,stgb009,stgb010,stgb011, ", #160615-00046#6 20160617 add(stgb014) by beckxie
                   " DENSE_RANK() OVER( ORDER BY stgbsite,stgb001,stgb002) AS RANK ",
                   "  FROM astq502_tmp ",
                   " WHERE enterprise = ? AND ",l_where CLIPPED
   
   #add by dengdd 151010---end-----------
   #end add-point
 
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"
 
   PREPARE b_fill_cnt_pre FROM g_sql
   EXECUTE b_fill_cnt_pre USING g_enterprise INTO g_tot_cnt
   FREE b_fill_cnt_pre
 
   #add-point:b_fill段rank_sql_after_count name="b_fill.rank_sql_after_count"
   
   #end add-point
 
   CASE g_detail_page_action
      WHEN "detail_first"
          LET g_pagestart = 1
 
      WHEN "detail_previous"
          LET g_pagestart = g_pagestart - g_num_in_page
          IF g_pagestart < 1 THEN
              LET g_pagestart = 1
          END IF
 
      WHEN "detail_next"
         LET g_pagestart = g_pagestart + g_num_in_page
         IF g_pagestart > g_tot_cnt THEN
            LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
            WHILE g_pagestart > g_tot_cnt
               LET g_pagestart = g_pagestart - g_num_in_page
            END WHILE
         END IF
 
      WHEN "detail_last"
         LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
         WHILE g_pagestart > g_tot_cnt
            LET g_pagestart = g_pagestart - g_num_in_page
         END WHILE
 
      OTHERWISE
         LET g_pagestart = 1
 
   END CASE
 
   LET g_sql = "SELECT '',stgbsite,stgb001,stgb012,stgb013,stgb002,'',stgb003,'','','',stgb004,'',stgb005, 
       stgb006,stgb007,stgb014,stgb008,stgb009,stgb010,stgb011",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   #LET g_sql = " SELECT 'N',stgbsite,stgb001,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,",   #160613-00045#2 20160615 mark by beckxie
   LET g_sql = " SELECT 'N',stgbsite,stgb001,stgb012,stgb013,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,",   #160613-00045#2 20160615 add by beckxie
           "                stgb004,stgb004_desc,stgb005,stgb006,stgb007,stgb014,stgb008,stgb009,stgb010,stgb011 ",  #160615-00046#6 20160617 add(stgb014) by beckxie
           " FROM (",ls_sql_rank,")",
           " WHERE RANK >= ",g_pagestart,
           " AND RANK < ",g_pagestart + g_num_in_page
           
  #新增汇总页签by linjm
#   LET g_sql2 = "SELECT DISTINCT stgbsite,stgb001,stgb002,stgb002_desc,stgb003,stgb003_desc,stgb004,stgb004_desc,sum(nvl(stgb005,0)),sum(nvl(stgb006,0)),sum(nvl(stgb007,0)),  #MOD BY dengdd 151010
    #LET g_sql2 = "SELECT DISTINCT stgbsite,MIN(stgb001),MAX(stgb001),stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,   #160613-00045#2 20160615 mark by beckxie
    LET g_sql2 = "SELECT DISTINCT stgbsite,MIN(stgb001),MAX(stgb001),stgb012,stgb013,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc,",   #160613-00045#2 20160615 add by beckxie
                 "                stgb004,stgb004_desc,sum(nvl(stgb005,0)),sum(nvl(stgb006,0)),sum(nvl(stgb007,0)),sum(COALESCE(stgb014,0)),stgb008,sum(nvl(stgb009,0)),stgb010,stgb011 ",   #160615-00046#6 20160617 add(stgb014) by beckxie
                 "  FROM (",ls_sql_rank,")",
                 " WHERE RANK >= ",g_pagestart,
                 "   AND RANK < ",g_pagestart + g_num_in_page ,
                 " GROUP BY stgbsite,stgb012,stgb013,stgb002,stgb002_desc,stgb003,stgb003_desc,stfa051,stfa051_desc," ,   #160613-00045#2 20160615 modify(stgb012,stgb013) by beckxie
                 "          stgb004,stgb004_desc,stgb008,stgb010,stgb011 " ,
                 " ORDER BY stgbsite,stgb012,stgb013,stgb002,stgb002_desc,stgb003,stgb003_desc,stgb004,stgb004_desc," ,   #160613-00045#2 20160615 modify(stgb012,stgb013) by beckxie
                 "         stgb008,stgb010,stgb011"               
  
   LET g_sql2 = cl_sql_add_mask(g_sql2)              #遮蔽特定資料
   PREPARE astq502_pb2 FROM g_sql2
   DECLARE b_fill_curs2 CURSOR FOR astq502_pb2       #第二个页签curs
   
   OPEN b_fill_curs2 USING g_enterprise        
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq502_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq502_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stgb_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_stgb_d[l_ac].sel,g_stgb_d[l_ac].stgbsite,g_stgb_d[l_ac].stgb001,g_stgb_d[l_ac].stgb012, 
       g_stgb_d[l_ac].stgb013,g_stgb_d[l_ac].stgb002,g_stgb_d[l_ac].stgb002_desc,g_stgb_d[l_ac].stgb003, 
       g_stgb_d[l_ac].stgb003_desc,g_stgb_d[l_ac].stfa051,g_stgb_d[l_ac].stfa051_desc,g_stgb_d[l_ac].stgb004, 
       g_stgb_d[l_ac].stgb004_desc,g_stgb_d[l_ac].stgb005,g_stgb_d[l_ac].stgb006,g_stgb_d[l_ac].stgb007, 
       g_stgb_d[l_ac].stgb014,g_stgb_d[l_ac].stgb008,g_stgb_d[l_ac].stgb009,g_stgb_d[l_ac].stgb010,g_stgb_d[l_ac].stgb011 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_stgb_d[l_ac].statepic = cl_get_actipic(g_stgb_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
     #新增管理品类 by linjm
#     SELECT stfa051 INTO g_stgb_d[l_ac].stfa051
#        FROM stfa_t
#       WHERE stfaent=g_enterprise 
#         AND stfa005=g_stgb_d[l_ac].stgb002
#         AND stfasite=g_stgb_d[l_ac].stgbsite
#         
#     SELECT rtaxl003 INTO g_stgb2_d[l_ac].l_stfa051_desc
#       FROM rtaxl_t
#      WHERE rtaxlent=g_enterprise
#        AND stael001= g_stgb2_d[l_ac].l_stfa051
#        AND stael002=g_dlang
      #end add-point
 
      CALL astq502_detail_show("'1'")      
 
      CALL astq502_stgb_t_mask()
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
      
   END FOREACH
   LET g_error_show = 0
   
 
   
   CALL g_stgb_d.deleteElement(g_stgb_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   CALL g_stgb2_d.clear()
    LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
   #FOREACH b_fill_curs2 INTO g_stgb2_d[l_ac].l_stgbsite,g_stgb2_d[l_ac].l_sdate       ,g_stgb2_d[l_ac].l_edate       ,g_stgb2_d[l_ac].l_stgb002     ,   #160613-00045#2 20160615 mark by beckxie
   FOREACH b_fill_curs2 INTO g_stgb2_d[l_ac].l_stgbsite,g_stgb2_d[l_ac].l_sdate       ,g_stgb2_d[l_ac].l_edate       ,g_stgb2_d[l_ac].l_stgb012, g_stgb2_d[l_ac].l_stgb013,g_stgb2_d[l_ac].l_stgb002     ,   #160613-00045#2 20160615 add by beckxie
                             g_stgb2_d[l_ac].l_stgb002_desc,g_stgb2_d[l_ac].l_stgb003 ,g_stgb2_d[l_ac].l_stgb003_desc,g_stgb2_d[l_ac].l_stfa051,
                             g_stgb2_d[l_ac].l_stfa051_desc,g_stgb2_d[l_ac].l_stgb004 ,g_stgb2_d[l_ac].l_stgb004_desc, 
                             g_stgb2_d[l_ac].l_stgb005 ,g_stgb2_d[l_ac].l_stgb006     ,g_stgb2_d[l_ac].l_stgb007     ,g_stgb2_d[l_ac].l_stgb014     ,g_stgb2_d[l_ac].l_stgb008     , #160615-00046#6 20160617 add(stgb014) by beckxie
                             g_stgb2_d[l_ac].l_stgb009 ,g_stgb2_d[l_ac].l_stgb010     ,g_stgb2_d[l_ac].l_stgb011 

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
#mark by dengdd 151010    
#     SELECT stfa051 INTO g_stgb2_d[l_ac].l_stfa051
#        FROM stfa_t
#       WHERE stfaent=g_enterprise 
#         AND stfa005=g_stgb2_d[l_ac].l_stgb002
#         AND stfasite=g_stgb2_d[l_ac].l_stgbsite
 
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
 
         END IF
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
      
   END FOREACH
   CALL g_stgb2_d.deleteElement(g_stgb2_d.getLength())
  
   #end add-point
 
   LET g_detail_cnt = g_stgb_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astq502_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq502_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq502_detail_action_trans()
 
   IF g_stgb_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL astq502_fetch()
   END IF
   
      CALL astq502_filter_show('stgbsite','b_stgbsite')
   CALL astq502_filter_show('stgb012','b_stgb012')
   CALL astq502_filter_show('stgb013','b_stgb013')
   CALL astq502_filter_show('stgb014','b_stgb014')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq502_fetch()
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="fetch.before_function"
   
   #end add-point
 
 
   #add-point:陣列清空 name="fetch.array_clear"
   
   #end add-point
   
   LET li_ac = l_ac 
   
 
   
   #add-point:單身填充後 name="fetch.after_fill"
   
   #end add-point 
   
 
   #add-point:陣列筆數調整 name="fetch.array_deleteElement"
   
   #end add-point
 
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="astq502.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq502_detail_show(ps_page)
   #add-point:show段define-客製 name="detail_show.define_customerization"
   
   #end add-point
   DEFINE ps_page    STRING
   DEFINE ls_sql     STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
 
   #add-point:detail_show段之前 name="detail_show.before"
   
   #end add-point
   
   
 
   #讀入ref值
   IF ps_page.getIndexOf("'1'",1) > 0 THEN
      #帶出公用欄位reference值page1
      
 
      #add-point:show段單身reference name="detail_show.body.reference"

#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stgb_d[l_ac].stgb002
#            LET ls_sql = "SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stgb_d[l_ac].stgb002_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stgb_d[l_ac].stgb002_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stgb_d[l_ac].stgb003
#            LET ls_sql = "SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stgb_d[l_ac].stgb003_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stgb_d[l_ac].stgb003_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stgb_d[l_ac].stgb004
#            LET ls_sql = "SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stgb_d[l_ac].stgb004_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stgb_d[l_ac].stgb004_desc
#
      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astq502_filter()
   #add-point:filter段define-客製 name="filter.define_customerization"
   
   #end add-point
   DEFINE  ls_result   STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="filter.before_function"
   
   #end add-point
 
   LET l_ac = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON stgbsite,stgb012,stgb013,stgb014
                          FROM s_detail1[1].b_stgbsite,s_detail1[1].b_stgb012,s_detail1[1].b_stgb013, 
                              s_detail1[1].b_stgb014
 
         BEFORE CONSTRUCT
                     DISPLAY astq502_filter_parser('stgbsite') TO s_detail1[1].b_stgbsite
            DISPLAY astq502_filter_parser('stgb012') TO s_detail1[1].b_stgb012
            DISPLAY astq502_filter_parser('stgb013') TO s_detail1[1].b_stgb013
            DISPLAY astq502_filter_parser('stgb014') TO s_detail1[1].b_stgb014
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stgbsite>>----
         #Ctrlp:construct.c.page1.b_stgbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgbsite
            #add-point:ON ACTION controlp INFIELD b_stgbsite name="construct.c.filter.page1.b_stgbsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgbsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgbsite  #顯示到畫面上
            NEXT FIELD b_stgbsite                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgb001>>----
         #----<<b_stgb012>>----
         #Ctrlp:construct.c.filter.page1.b_stgb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb012
            #add-point:ON ACTION controlp INFIELD b_stgb012 name="construct.c.filter.page1.b_stgb012"
            
            #END add-point
 
 
         #----<<b_stgb013>>----
         #Ctrlp:construct.c.filter.page1.b_stgb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb013
            #add-point:ON ACTION controlp INFIELD b_stgb013 name="construct.c.filter.page1.b_stgb013"
            
            #END add-point
 
 
         #----<<b_stgb002>>----
         #----<<b_stgb002_desc>>----
         #----<<b_stgb003>>----
         #----<<b_stgb003_desc>>----
         #----<<b_stfa051>>----
         #----<<b_stfa051_desc>>----
         #----<<b_stgb004>>----
         #----<<b_stgb004_desc>>----
         #----<<b_stgb005>>----
         #----<<b_stgb006>>----
         #----<<b_stgb007>>----
         #----<<b_stgb014>>----
         #Ctrlp:construct.c.filter.page1.b_stgb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgb014
            #add-point:ON ACTION controlp INFIELD b_stgb014 name="construct.c.filter.page1.b_stgb014"
            
            #END add-point
 
 
         #----<<b_stgb008>>----
         #----<<b_stgb009>>----
         #----<<b_stgb010>>----
         #----<<b_stgb011>>----
   
 
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
      LET g_wc_filter = g_wc_filter, " "
      LET g_wc_filter_t = g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
   END IF
   
      CALL astq502_filter_show('stgbsite','b_stgbsite')
   CALL astq502_filter_show('stgb012','b_stgb012')
   CALL astq502_filter_show('stgb013','b_stgb013')
   CALL astq502_filter_show('stgb014','b_stgb014')
 
    
   CALL astq502_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astq502_filter_parser(ps_field)
   #add-point:filter段define-客製 name="filter_parser.define_customerization"
   
   #end add-point
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_parser.before_function"
   
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
 
{<section id="astq502.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astq502_filter_show(ps_field,ps_object)
   #add-point:filter_show段define-客製 name="filter_show.define_customerization"
   
   #end add-point
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
   #add-point:filter_show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_show.before_function"
   
   #end add-point
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = astq502_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.insert" >}
#+ insert
PRIVATE FUNCTION astq502_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astq502.modify" >}
#+ modify
PRIVATE FUNCTION astq502_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq502.reproduce" >}
#+ reproduce
PRIVATE FUNCTION astq502_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq502.delete" >}
#+ delete
PRIVATE FUNCTION astq502_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq502.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq502_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   DISPLAY g_current_row_tot TO FORMONLY.h_index
   DISPLAY g_tot_cnt TO FORMONLY.h_count
 
   #顯示單身頁面的起始與結束筆數
   LET g_page_start_num = g_pagestart
   LET g_page_end_num = g_pagestart + g_num_in_page - 1
   DISPLAY g_page_start_num TO FORMONLY.p_start
   DISPLAY g_page_end_num TO FORMONLY.p_end
 
   #目前不支援跳頁功能
   LET g_page_act_list = "detail_first,detail_previous,'',detail_next,detail_last"
   CALL cl_navigator_detail_page_setting(g_page_act_list,g_current_row_tot,g_pagestart,g_num_in_page,g_tot_cnt)
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq502_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="deatil_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_curr_diag IS NOT NULL THEN
      CASE
         WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
            LET g_detail_idx = 1
            IF g_stgb_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stgb_d.getLength() AND g_stgb_d.getLength() > 0
            LET g_detail_idx = g_stgb_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stgb_d.getLength() THEN
               LET g_detail_idx = g_stgb_d.getLength()
            END IF
            LET li_redirect = TRUE
      END CASE
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astq502.mask_functions" >}
 &include "erp/ast/astq502_mask.4gl"
 
{</section>}
 
{<section id="astq502.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astq502_query2()
# Date & Author..: 2015/10/10 By dengdd
# Modify.........:
################################################################################
PRIVATE FUNCTION astq502_query2()
DEFINE ls_wc      LIKE type_t.chr500
DEFINE ls_wc2     LIKE type_t.chr500
DEFINE ls_return  STRING
DEFINE ls_result  STRING 
   #add-point:query段define-標準
   
   #end add-point 
   #add-point:query段define-客製

   #end add-point 
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_stgb_d.clear()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_wc_filter = " 1=1"
   LET g_detail_page_action = ""
   LET g_pagestart = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET ls_wc2 = g_wc2
   LET g_master_idx = l_ac
 
   
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON stgb002,stgbsite,stgb003,stgb004,stgb010,stgb011
                         FROM  stgb002,stgbsite,stgb003,stgb004,stgb010,stgb011
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct

            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<b_stgbsite>>----
         #Ctrlp:construct.c.page1.b_stgbsite
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stgbsite
            #add-point:ON ACTION controlp INFIELD b_stgbsite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgbsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgbsite  #顯示到畫面上
            NEXT FIELD stgbsite                     #返回原欄位

            #END add-point
            
         ON ACTION controlp INFIELD stgb002
            #add-point:ON ACTION controlp INFIELD b_stgbsite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1=g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgb002  #顯示到畫面上
            NEXT FIELD stgb002                     #返回原欄位
            
         ON ACTION controlp INFIELD stgb003
            #add-point:ON ACTION controlp INFIELD b_stgbsite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#2 -S
            #CALL q_pmaa001()                           #呼叫開窗            
            LET g_qryparam.arg1 = "('3')"            
            CALL q_pmaa001_1()                           #呼叫開窗
            #160913-00034#2 -E
            DISPLAY g_qryparam.return1 TO stgb003  #顯示到畫面上
            NEXT FIELD stgb003
            
         ON ACTION controlp INFIELD stgb004
            #add-point:ON ACTION controlp INFIELD b_stgbsite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgb004  #顯示到畫面上
            NEXT FIELD stgb004
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stgbsite
            #add-point:BEFORE FIELD b_stgbsite

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         
            
            
   
       
      END CONSTRUCT
      
      INPUT l_sdate,l_edate FROM l_stgb001_s,l_stgb001_e
          ATTRIBUTE(WITHOUT DEFAULTS)
 
            AFTER INPUT
               IF INT_FLAG THEN
                  RETURN
               END IF
         END INPUT
      
  
      #add-point:query段more_construct
      
      #end add-point 
 
      ON ACTION accept
         #add-point:ON ACTION accept

         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前

      #end add-point 
 
      ON ACTION qbeclear   # 條件清除
         CLEAR FORM
         #add-point:條件清除後

         #end add-point 
 
      #add-point:query段查詢方案相關ACTION設定後

      #end add-point 
 
   END DIALOG
 
   
 
   LET g_wc = g_wc_table 
 
 
        
   LET g_wc2 = " 1=1"
 
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = ls_wc
      LET g_wc2 = ls_wc2
      LET g_wc_filter = g_wc_filter_t
   ELSE
      LET g_master_idx = 1
   END IF
        
   #add-point:cs段after_construct

   #end add-point
        
   LET g_error_show = 1
   CALL astq502_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION

################################################################################
# Descriptions...: 创建临时表
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/10/10 By dengdd
# Modify.........:
################################################################################
PRIVATE FUNCTION astq502_create_tmp()
DEFINE r_success LIKE type_t.num5
       
       WHENEVER ERROR CONTINUE
       LET r_success=TRUE
       
       DROP TABLE astq502_tmp
       IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
           INITIALIZE g_errparam TO NULL 
           LET g_errparam.extend = "drop tmp" 
           LET g_errparam.code   = SQLCA.sqlcode 
           LET g_errparam.popup  = TRUE 
           LET r_success=FALSE
           CALL cl_err()
           RETURN r_success
       END IF
       
       CREATE TEMP TABLE astq502_tmp(
            sel       VARCHAR(1),
            enterprise  SMALLINT,
            stgbsite  VARCHAR(10), 
            stgb001  DATE, 
            stgb012  VARCHAR(10),        #160613-00045#2 20160615 add by beckxie
            stgb013  VARCHAR(20),        #160613-00045#2 20160615 add by beckxie
            stgb002  VARCHAR(20), 
            stgb002_desc  VARCHAR(500), 
            stgb003  VARCHAR(10), 
            stgb003_desc  VARCHAR(500),
            stfa051  VARCHAR(10), 
            stfa051_desc  VARCHAR(500),            
            stgb004  VARCHAR(10), 
            stgb004_desc  VARCHAR(500), 
            stgb005  DECIMAL(20,6), 
            stgb006  DECIMAL(20,6), 
            stgb007  DECIMAL(20,6), 
            stgb014  DECIMAL(20,6),       #160615-00046#6 20160617 add by beckxie
            stgb008  DECIMAL(15,3), 
            stgb009  DECIMAL(20,6), 
            stgb010  VARCHAR(10), 
            stgb011  VARCHAR(1)
            )
            
       IF SQLCA.sqlcode != 0 THEN
           INITIALIZE g_errparam TO NULL 
           LET g_errparam.extend = "create tmp" 
           LET g_errparam.code   = SQLCA.sqlcode 
           LET g_errparam.popup  = TRUE 
           LET r_success=FALSE
           CALL cl_err()
           RETURN r_success
       END IF
       
       RETURN r_success
END FUNCTION

 
{</section>}
 
