#該程式未解開Section, 採用最新樣板產出!
{<section id="astq861.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:3(2016-11-05 18:19:28), PR版次:0003(2016-09-05 21:00:26)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000020
#+ Filename...: astq861
#+ Description: 促銷商戶分攤費用明細查詢作業
#+ Creator....: 05948(2016-07-31 21:25:37)
#+ Modifier...: 07142 -SD/PR- 02599
 
{</section>}
 
{<section id="astq861.global" >}
#應用 q02 樣板自動產生(Version:42)
#add-point:填寫註解說明 name="global.memo"
#160905-00007#16   2016/09/05  By 02599       SQL条件增加ent
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
PRIVATE TYPE type_g_stkb_d RECORD
       #statepic       LIKE type_t.chr1,
       
       stkbseq LIKE stkb_t.stkbseq, 
   stkbdocno LIKE stkb_t.stkbdocno, 
   stkbsite LIKE stkb_t.stkbsite, 
   stkbsite_desc LIKE type_t.chr500, 
   stkb002 LIKE stkb_t.stkb002, 
   stkb002_desc LIKE type_t.chr500, 
   stkb001 LIKE stkb_t.stkb001, 
   stkb003 LIKE stkb_t.stkb003, 
   stkb004 LIKE stkb_t.stkb004, 
   stkb004_desc LIKE type_t.chr500, 
   stkb005 LIKE stkb_t.stkb005, 
   stkb005_desc LIKE type_t.chr500, 
   stkb006 LIKE stkb_t.stkb006, 
   stkb007 LIKE stkb_t.stkb007, 
   stkb008 LIKE stkb_t.stkb008, 
   stkb010 LIKE stkb_t.stkb010, 
   stkb011 LIKE stkb_t.stkb011, 
   stkb011_desc LIKE type_t.chr500, 
   stkb012 LIKE stkb_t.stkb012, 
   stkb013 LIKE stkb_t.stkb013, 
   stkb014 LIKE stkb_t.stkb014, 
   stkb015 LIKE stkb_t.stkb015, 
   stkb016 LIKE stkb_t.stkb016 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_select   LIKE type_t.chr1
DEFINE g_wc1      STRING
DEFINE g_rcnt     LIKE type_t.num5
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_stkb_d
DEFINE g_master_t                   type_g_stkb_d
DEFINE g_stkb_d          DYNAMIC ARRAY OF type_g_stkb_d
DEFINE g_stkb_d_t        type_g_stkb_d
 
      
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
 
{<section id="astq861.main" >}
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
   DECLARE astq861_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq861_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq861_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq861 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq861_init()   
 
      #進入選單 Menu (="N")
      CALL astq861_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq861
      
   END IF 
   
   CLOSE astq861_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq861.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq861_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success    LIKE type_t.num5
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL cl_set_combo_scc('stkb001','6952')
   CALL cl_set_combo_scc('b_stkb001','6952')
   DISPLAY g_today TO b_stkb003
   #end add-point
 
   CALL astq861_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="astq861.default_search" >}
PRIVATE FUNCTION astq861_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stkbdocno = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stkbseq = '", g_argv[02], "' AND "
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
 
{<section id="astq861.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq861_ui_dialog()
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
   
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL astq861_b_fill()
   ELSE
      CALL astq861_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stkb_d.clear()
 
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
 
         CALL astq861_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stkb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq861_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq861_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         CONSTRUCT BY NAME g_wc
                ON stkbsite,stkbdocno,stkb003,stkb004,stkb005,stkb006,stkb011,stkb001,stkb002
            
            BEFORE CONSTRUCT
            ON ACTION controlp INFIELD stkbsite
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stkbsite',g_site,'c')
               CALL q_ooef001_24()
               DISPLAY g_qryparam.return1 TO stkbsite
               NEXT FIELD stkbsite
            ON ACTION controlp INFIELD stkbdocno
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = " prhastus='Y'"
               CALL q_prhadocno()
               DISPLAY g_qryparam.return1 TO stkbdocno
               NEXT FIELD stkbdocno
            
            ON ACTION controlp INFIELD stkb004
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = " ('1','3') "
               CALL q_pmaa001_1()
               DISPLAY g_qryparam.return1 TO stkb004
               NEXT FIELD stkb004
            ON ACTION controlp INFIELD stkb005
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_mhbe001()
               DISPLAY g_qryparam.return1 TO stkb005
               NEXT FIELD stkb005
            ON ACTION controlp INFIELD stkb006
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_stje001()
               DISPLAY g_qryparam.return1 TO stkb006
               NEXT FIELD stkb006
            ON ACTION controlp INFIELD stkb011
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_stae001()
               DISPLAY g_qryparam.return1 TO stkb011
               NEXT FIELD stkb011
            ON ACTION controlp INFIELD stkb002
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "c"
               LET g_qryparam.reqry = FALSE
               CALL q_prhb002_1()
               DISPLAY g_qryparam.return1 TO stkb002
               NEXT FIELD stkb002
            
            AFTER CONSTRUCT  
         END CONSTRUCT
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq861_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astq861_insert()
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
               CALL astq861_query()
               #add-point:ON ACTION query name="menu.query"
               
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
            CALL astq861_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
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
            CALL astq861_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stkb_d)
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
            CALL astq861_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq861_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq861_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq861_b_fill()
 
         
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         ON ACTION accept
            IF cl_null(g_wc) THEN
               LET g_wc="1=1"
            END IF            
            CALL astq861_b_fill()
         
         ON ACTION cancel
               LET g_action_choice = "exit"   
               EXIT DIALOG
       
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
 
{<section id="astq861.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq861_query()
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
   CALL g_stkb_d.clear()
 
   
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
      CONSTRUCT g_wc_table ON stkbseq,stkbdocno,stkbsite,stkb002,stkb001,stkb003,stkb004,stkb005,stkb006, 
          stkb007,stkb008,stkb010,stkb011,stkb012,stkb013,stkb014,stkb015,stkb016
           FROM s_detail1[1].b_stkbseq,s_detail1[1].b_stkbdocno,s_detail1[1].b_stkbsite,s_detail1[1].b_stkb002, 
               s_detail1[1].b_stkb001,s_detail1[1].b_stkb003,s_detail1[1].b_stkb004,s_detail1[1].b_stkb005, 
               s_detail1[1].b_stkb006,s_detail1[1].b_stkb007,s_detail1[1].b_stkb008,s_detail1[1].b_stkb010, 
               s_detail1[1].b_stkb011,s_detail1[1].b_stkb012,s_detail1[1].b_stkb013,s_detail1[1].b_stkb014, 
               s_detail1[1].b_stkb015,s_detail1[1].b_stkb016
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<b_stkbseq>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkbseq
            #add-point:BEFORE FIELD b_stkbseq name="construct.b.page1.b_stkbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkbseq
            
            #add-point:AFTER FIELD b_stkbseq name="construct.a.page1.b_stkbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbseq
            #add-point:ON ACTION controlp INFIELD b_stkbseq name="construct.c.page1.b_stkbseq"
            
            #END add-point
 
 
         #----<<b_stkbdocno>>----
         #Ctrlp:construct.c.page1.b_stkbdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbdocno
            #add-point:ON ACTION controlp INFIELD b_stkbdocno name="construct.c.page1.b_stkbdocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stbhdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkbdocno  #顯示到畫面上
            NEXT FIELD b_stkbdocno                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkbdocno
            #add-point:BEFORE FIELD b_stkbdocno name="construct.b.page1.b_stkbdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkbdocno
            
            #add-point:AFTER FIELD b_stkbdocno name="construct.a.page1.b_stkbdocno"
            
            #END add-point
            
 
 
         #----<<b_stkbsite>>----
         #Ctrlp:construct.c.page1.b_stkbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbsite
            #add-point:ON ACTION controlp INFIELD b_stkbsite name="construct.c.page1.b_stkbsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkbsite  #顯示到畫面上
            NEXT FIELD b_stkbsite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkbsite
            #add-point:BEFORE FIELD b_stkbsite name="construct.b.page1.b_stkbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkbsite
            
            #add-point:AFTER FIELD b_stkbsite name="construct.a.page1.b_stkbsite"
            
            #END add-point
            
 
 
         #----<<b_stkbsite_desc>>----
         #----<<b_stkb002>>----
         #Ctrlp:construct.c.page1.b_stkb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb002
            #add-point:ON ACTION controlp INFIELD b_stkb002 name="construct.c.page1.b_stkb002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_prdw001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb002  #顯示到畫面上
            NEXT FIELD b_stkb002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb002
            #add-point:BEFORE FIELD b_stkb002 name="construct.b.page1.b_stkb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb002
            
            #add-point:AFTER FIELD b_stkb002 name="construct.a.page1.b_stkb002"
            
            #END add-point
            
 
 
         #----<<b_stkb002_desc>>----
         #----<<b_stkb001>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb001
            #add-point:BEFORE FIELD b_stkb001 name="construct.b.page1.b_stkb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb001
            
            #add-point:AFTER FIELD b_stkb001 name="construct.a.page1.b_stkb001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb001
            #add-point:ON ACTION controlp INFIELD b_stkb001 name="construct.c.page1.b_stkb001"
            
            #END add-point
 
 
         #----<<b_stkb003>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb003
            #add-point:BEFORE FIELD b_stkb003 name="construct.b.page1.b_stkb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb003
            
            #add-point:AFTER FIELD b_stkb003 name="construct.a.page1.b_stkb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb003
            #add-point:ON ACTION controlp INFIELD b_stkb003 name="construct.c.page1.b_stkb003"
            
            #END add-point
 
 
         #----<<b_stkb004>>----
         #Ctrlp:construct.c.page1.b_stkb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb004
            #add-point:ON ACTION controlp INFIELD b_stkb004 name="construct.c.page1.b_stkb004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb004  #顯示到畫面上
            NEXT FIELD b_stkb004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb004
            #add-point:BEFORE FIELD b_stkb004 name="construct.b.page1.b_stkb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb004
            
            #add-point:AFTER FIELD b_stkb004 name="construct.a.page1.b_stkb004"
            
            #END add-point
            
 
 
         #----<<b_stkb004_desc>>----
         #----<<b_stkb005>>----
         #Ctrlp:construct.c.page1.b_stkb005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb005
            #add-point:ON ACTION controlp INFIELD b_stkb005 name="construct.c.page1.b_stkb005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb005  #顯示到畫面上
            NEXT FIELD b_stkb005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb005
            #add-point:BEFORE FIELD b_stkb005 name="construct.b.page1.b_stkb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb005
            
            #add-point:AFTER FIELD b_stkb005 name="construct.a.page1.b_stkb005"
            
            #END add-point
            
 
 
         #----<<b_stkb005_desc>>----
         #----<<b_stkb006>>----
         #Ctrlp:construct.c.page1.b_stkb006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb006
            #add-point:ON ACTION controlp INFIELD b_stkb006 name="construct.c.page1.b_stkb006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stje001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb006  #顯示到畫面上
            NEXT FIELD b_stkb006                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb006
            #add-point:BEFORE FIELD b_stkb006 name="construct.b.page1.b_stkb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb006
            
            #add-point:AFTER FIELD b_stkb006 name="construct.a.page1.b_stkb006"
            
            #END add-point
            
 
 
         #----<<b_stkb007>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb007
            #add-point:BEFORE FIELD b_stkb007 name="construct.b.page1.b_stkb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb007
            
            #add-point:AFTER FIELD b_stkb007 name="construct.a.page1.b_stkb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb007
            #add-point:ON ACTION controlp INFIELD b_stkb007 name="construct.c.page1.b_stkb007"
            
            #END add-point
 
 
         #----<<b_stkb008>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb008
            #add-point:BEFORE FIELD b_stkb008 name="construct.b.page1.b_stkb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb008
            
            #add-point:AFTER FIELD b_stkb008 name="construct.a.page1.b_stkb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb008
            #add-point:ON ACTION controlp INFIELD b_stkb008 name="construct.c.page1.b_stkb008"
            
            #END add-point
 
 
         #----<<b_stkb010>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb010
            #add-point:BEFORE FIELD b_stkb010 name="construct.b.page1.b_stkb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb010
            
            #add-point:AFTER FIELD b_stkb010 name="construct.a.page1.b_stkb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb010
            #add-point:ON ACTION controlp INFIELD b_stkb010 name="construct.c.page1.b_stkb010"
            
            #END add-point
 
 
         #----<<b_stkb011>>----
         #Ctrlp:construct.c.page1.b_stkb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb011
            #add-point:ON ACTION controlp INFIELD b_stkb011 name="construct.c.page1.b_stkb011"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb011  #顯示到畫面上
            NEXT FIELD b_stkb011                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb011
            #add-point:BEFORE FIELD b_stkb011 name="construct.b.page1.b_stkb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb011
            
            #add-point:AFTER FIELD b_stkb011 name="construct.a.page1.b_stkb011"
            
            #END add-point
            
 
 
         #----<<b_stkb011_desc>>----
         #----<<b_stkb012>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb012
            #add-point:BEFORE FIELD b_stkb012 name="construct.b.page1.b_stkb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb012
            
            #add-point:AFTER FIELD b_stkb012 name="construct.a.page1.b_stkb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb012
            #add-point:ON ACTION controlp INFIELD b_stkb012 name="construct.c.page1.b_stkb012"
            
            #END add-point
 
 
         #----<<b_stkb013>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb013
            #add-point:BEFORE FIELD b_stkb013 name="construct.b.page1.b_stkb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb013
            
            #add-point:AFTER FIELD b_stkb013 name="construct.a.page1.b_stkb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb013
            #add-point:ON ACTION controlp INFIELD b_stkb013 name="construct.c.page1.b_stkb013"
            
            #END add-point
 
 
         #----<<b_stkb014>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb014
            #add-point:BEFORE FIELD b_stkb014 name="construct.b.page1.b_stkb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb014
            
            #add-point:AFTER FIELD b_stkb014 name="construct.a.page1.b_stkb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb014
            #add-point:ON ACTION controlp INFIELD b_stkb014 name="construct.c.page1.b_stkb014"
            
            #END add-point
 
 
         #----<<b_stkb015>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb015
            #add-point:BEFORE FIELD b_stkb015 name="construct.b.page1.b_stkb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb015
            
            #add-point:AFTER FIELD b_stkb015 name="construct.a.page1.b_stkb015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb015
            #add-point:ON ACTION controlp INFIELD b_stkb015 name="construct.c.page1.b_stkb015"
            
            #END add-point
 
 
         #----<<b_stkb016>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stkb016
            #add-point:BEFORE FIELD b_stkb016 name="construct.b.page1.b_stkb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stkb016
            
            #add-point:AFTER FIELD b_stkb016 name="construct.a.page1.b_stkb016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stkb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb016
            #add-point:ON ACTION controlp INFIELD b_stkb016 name="construct.c.page1.b_stkb016"
            
            #END add-point
 
 
   
       
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
   CALL astq861_b_fill()
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
 
{<section id="astq861.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq861_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where         STRING
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stkbsite') RETURNING l_where
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
 
   LET ls_sql_rank = "SELECT  UNIQUE stkbseq,stkbdocno,stkbsite,'',stkb002,'',stkb001,stkb003,stkb004, 
       '',stkb005,'',stkb006,stkb007,stkb008,stkb010,stkb011,'',stkb012,stkb013,stkb014,stkb015,stkb016  , 
       DENSE_RANK() OVER( ORDER BY stkb_t.stkbdocno,stkb_t.stkbseq) AS RANK FROM stkb_t",
 
 
                     "",
                     " WHERE stkbent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stkb_t"),
                     " ORDER BY stkb_t.stkbdocno,stkb_t.stkbseq"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   LET g_wc=g_wc, " AND ",l_where 
   LET ls_sql_rank = " SELECT DISTINCT stkbseq,stkbdocno,stkbsite,ooefl003,stkb002,'',stkb001,stkb003,",
                     "        stkb004,pmaal004,stkb005,mhbel003,stkb006,stkb007,stkb008,stkb010,stkb011,",
                     "        stael003,stkb012,stkb013,stkb014,stkb015,stkb016",
                     "   FROM stkb_t",
                     "        LEFT JOIN ooefl_t ON ooeflent=stkbent AND ooefl001=stkbsite AND ooefl002='",g_dlang,"'",
                     "        LEFT JOIN pmaal_t ON pmaalent=stkbent AND pmaal001=stkb004 AND pmaal002='",g_dlang,"'",
                     "        LEFT JOIN mhbel_t ON mhbelent=stkbent AND mhbel001=stkb005 AND mhbel002='",g_dlang,"'",
                     "        LEFT JOIN stael_t ON staelent=stkbent AND stael001=stkb011 AND stael002='",g_dlang,"'",
                     "  WHERE stkbent=? AND ", g_wc
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
 
   LET g_sql = "SELECT stkbseq,stkbdocno,stkbsite,'',stkb002,'',stkb001,stkb003,stkb004,'',stkb005,'', 
       stkb006,stkb007,stkb008,stkb010,stkb011,'',stkb012,stkb013,stkb014,stkb015,stkb016",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   LET g_sql = ls_sql_rank
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq861_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq861_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stkb_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_stkb_d[l_ac].stkbseq,g_stkb_d[l_ac].stkbdocno,g_stkb_d[l_ac].stkbsite, 
       g_stkb_d[l_ac].stkbsite_desc,g_stkb_d[l_ac].stkb002,g_stkb_d[l_ac].stkb002_desc,g_stkb_d[l_ac].stkb001, 
       g_stkb_d[l_ac].stkb003,g_stkb_d[l_ac].stkb004,g_stkb_d[l_ac].stkb004_desc,g_stkb_d[l_ac].stkb005, 
       g_stkb_d[l_ac].stkb005_desc,g_stkb_d[l_ac].stkb006,g_stkb_d[l_ac].stkb007,g_stkb_d[l_ac].stkb008, 
       g_stkb_d[l_ac].stkb010,g_stkb_d[l_ac].stkb011,g_stkb_d[l_ac].stkb011_desc,g_stkb_d[l_ac].stkb012, 
       g_stkb_d[l_ac].stkb013,g_stkb_d[l_ac].stkb014,g_stkb_d[l_ac].stkb015,g_stkb_d[l_ac].stkb016
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_stkb_d[l_ac].statepic = cl_get_actipic(g_stkb_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      CALL astq861_stkb002_desc()
      #end add-point
 
      CALL astq861_detail_show("'1'")      
 
      CALL astq861_stkb_t_mask()
 
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
   
 
   
   CALL g_stkb_d.deleteElement(g_stkb_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
 
   LET g_detail_cnt = g_stkb_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astq861_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq861_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq861_detail_action_trans()
 
   IF g_stkb_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL astq861_fetch()
   END IF
   
      CALL astq861_filter_show('stkbseq','b_stkbseq')
   CALL astq861_filter_show('stkbdocno','b_stkbdocno')
   CALL astq861_filter_show('stkbsite','b_stkbsite')
   CALL astq861_filter_show('stkb002','b_stkb002')
   CALL astq861_filter_show('stkb001','b_stkb001')
   CALL astq861_filter_show('stkb003','b_stkb003')
   CALL astq861_filter_show('stkb004','b_stkb004')
   CALL astq861_filter_show('stkb005','b_stkb005')
   CALL astq861_filter_show('stkb006','b_stkb006')
   CALL astq861_filter_show('stkb007','b_stkb007')
   CALL astq861_filter_show('stkb008','b_stkb008')
   CALL astq861_filter_show('stkb010','b_stkb010')
   CALL astq861_filter_show('stkb011','b_stkb011')
   CALL astq861_filter_show('stkb012','b_stkb012')
   CALL astq861_filter_show('stkb013','b_stkb013')
   CALL astq861_filter_show('stkb014','b_stkb014')
   CALL astq861_filter_show('stkb015','b_stkb015')
   CALL astq861_filter_show('stkb016','b_stkb016')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   IF g_stkb_d.getLength() = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ''
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
   END IF  
 
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq861.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq861_fetch()
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
 
{<section id="astq861.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq861_detail_show(ps_page)
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

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stkb_d[l_ac].stkbsite
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stkb_d[l_ac].stkbsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stkb_d[l_ac].stkbsite_desc           

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stkb_d[l_ac].stkb004
            LET ls_sql = "SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stkb_d[l_ac].stkb004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stkb_d[l_ac].stkb004_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stkb_d[l_ac].stkb005
            LET ls_sql = "SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stkb_d[l_ac].stkb005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stkb_d[l_ac].stkb005_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stkb_d[l_ac].stkb011
            LET ls_sql = "SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stkb_d[l_ac].stkb011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stkb_d[l_ac].stkb011_desc

      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq861.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astq861_filter()
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
      CONSTRUCT g_wc_filter ON stkbseq,stkbdocno,stkbsite,stkb002,stkb001,stkb003,stkb004,stkb005,stkb006, 
          stkb007,stkb008,stkb010,stkb011,stkb012,stkb013,stkb014,stkb015,stkb016
                          FROM s_detail1[1].b_stkbseq,s_detail1[1].b_stkbdocno,s_detail1[1].b_stkbsite, 
                              s_detail1[1].b_stkb002,s_detail1[1].b_stkb001,s_detail1[1].b_stkb003,s_detail1[1].b_stkb004, 
                              s_detail1[1].b_stkb005,s_detail1[1].b_stkb006,s_detail1[1].b_stkb007,s_detail1[1].b_stkb008, 
                              s_detail1[1].b_stkb010,s_detail1[1].b_stkb011,s_detail1[1].b_stkb012,s_detail1[1].b_stkb013, 
                              s_detail1[1].b_stkb014,s_detail1[1].b_stkb015,s_detail1[1].b_stkb016
 
         BEFORE CONSTRUCT
                     DISPLAY astq861_filter_parser('stkbseq') TO s_detail1[1].b_stkbseq
            DISPLAY astq861_filter_parser('stkbdocno') TO s_detail1[1].b_stkbdocno
            DISPLAY astq861_filter_parser('stkbsite') TO s_detail1[1].b_stkbsite
            DISPLAY astq861_filter_parser('stkb002') TO s_detail1[1].b_stkb002
            DISPLAY astq861_filter_parser('stkb001') TO s_detail1[1].b_stkb001
            DISPLAY astq861_filter_parser('stkb003') TO s_detail1[1].b_stkb003
            DISPLAY astq861_filter_parser('stkb004') TO s_detail1[1].b_stkb004
            DISPLAY astq861_filter_parser('stkb005') TO s_detail1[1].b_stkb005
            DISPLAY astq861_filter_parser('stkb006') TO s_detail1[1].b_stkb006
            DISPLAY astq861_filter_parser('stkb007') TO s_detail1[1].b_stkb007
            DISPLAY astq861_filter_parser('stkb008') TO s_detail1[1].b_stkb008
            DISPLAY astq861_filter_parser('stkb010') TO s_detail1[1].b_stkb010
            DISPLAY astq861_filter_parser('stkb011') TO s_detail1[1].b_stkb011
            DISPLAY astq861_filter_parser('stkb012') TO s_detail1[1].b_stkb012
            DISPLAY astq861_filter_parser('stkb013') TO s_detail1[1].b_stkb013
            DISPLAY astq861_filter_parser('stkb014') TO s_detail1[1].b_stkb014
            DISPLAY astq861_filter_parser('stkb015') TO s_detail1[1].b_stkb015
            DISPLAY astq861_filter_parser('stkb016') TO s_detail1[1].b_stkb016
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<b_stkbseq>>----
         #Ctrlp:construct.c.filter.page1.b_stkbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbseq
            #add-point:ON ACTION controlp INFIELD b_stkbseq name="construct.c.filter.page1.b_stkbseq"
            
            #END add-point
 
 
         #----<<b_stkbdocno>>----
         #Ctrlp:construct.c.page1.b_stkbdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbdocno
            #add-point:ON ACTION controlp INFIELD b_stkbdocno name="construct.c.filter.page1.b_stkbdocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stbhdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkbdocno  #顯示到畫面上
            NEXT FIELD b_stkbdocno                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkbsite>>----
         #Ctrlp:construct.c.page1.b_stkbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkbsite
            #add-point:ON ACTION controlp INFIELD b_stkbsite name="construct.c.filter.page1.b_stkbsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkbsite  #顯示到畫面上
            NEXT FIELD b_stkbsite                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkbsite_desc>>----
         #----<<b_stkb002>>----
         #Ctrlp:construct.c.page1.b_stkb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb002
            #add-point:ON ACTION controlp INFIELD b_stkb002 name="construct.c.filter.page1.b_stkb002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_prdw001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb002  #顯示到畫面上
            NEXT FIELD b_stkb002                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkb002_desc>>----
         #----<<b_stkb001>>----
         #Ctrlp:construct.c.filter.page1.b_stkb001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb001
            #add-point:ON ACTION controlp INFIELD b_stkb001 name="construct.c.filter.page1.b_stkb001"
            
            #END add-point
 
 
         #----<<b_stkb003>>----
         #Ctrlp:construct.c.filter.page1.b_stkb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb003
            #add-point:ON ACTION controlp INFIELD b_stkb003 name="construct.c.filter.page1.b_stkb003"
            
            #END add-point
 
 
         #----<<b_stkb004>>----
         #Ctrlp:construct.c.page1.b_stkb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb004
            #add-point:ON ACTION controlp INFIELD b_stkb004 name="construct.c.filter.page1.b_stkb004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb004  #顯示到畫面上
            NEXT FIELD b_stkb004                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkb004_desc>>----
         #----<<b_stkb005>>----
         #Ctrlp:construct.c.page1.b_stkb005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb005
            #add-point:ON ACTION controlp INFIELD b_stkb005 name="construct.c.filter.page1.b_stkb005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb005  #顯示到畫面上
            NEXT FIELD b_stkb005                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkb005_desc>>----
         #----<<b_stkb006>>----
         #Ctrlp:construct.c.page1.b_stkb006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb006
            #add-point:ON ACTION controlp INFIELD b_stkb006 name="construct.c.filter.page1.b_stkb006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stje001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb006  #顯示到畫面上
            NEXT FIELD b_stkb006                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkb007>>----
         #Ctrlp:construct.c.filter.page1.b_stkb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb007
            #add-point:ON ACTION controlp INFIELD b_stkb007 name="construct.c.filter.page1.b_stkb007"
            
            #END add-point
 
 
         #----<<b_stkb008>>----
         #Ctrlp:construct.c.filter.page1.b_stkb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb008
            #add-point:ON ACTION controlp INFIELD b_stkb008 name="construct.c.filter.page1.b_stkb008"
            
            #END add-point
 
 
         #----<<b_stkb010>>----
         #Ctrlp:construct.c.filter.page1.b_stkb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb010
            #add-point:ON ACTION controlp INFIELD b_stkb010 name="construct.c.filter.page1.b_stkb010"
            
            #END add-point
 
 
         #----<<b_stkb011>>----
         #Ctrlp:construct.c.page1.b_stkb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb011
            #add-point:ON ACTION controlp INFIELD b_stkb011 name="construct.c.filter.page1.b_stkb011"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stkb011  #顯示到畫面上
            NEXT FIELD b_stkb011                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stkb011_desc>>----
         #----<<b_stkb012>>----
         #Ctrlp:construct.c.filter.page1.b_stkb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb012
            #add-point:ON ACTION controlp INFIELD b_stkb012 name="construct.c.filter.page1.b_stkb012"
            
            #END add-point
 
 
         #----<<b_stkb013>>----
         #Ctrlp:construct.c.filter.page1.b_stkb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb013
            #add-point:ON ACTION controlp INFIELD b_stkb013 name="construct.c.filter.page1.b_stkb013"
            
            #END add-point
 
 
         #----<<b_stkb014>>----
         #Ctrlp:construct.c.filter.page1.b_stkb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb014
            #add-point:ON ACTION controlp INFIELD b_stkb014 name="construct.c.filter.page1.b_stkb014"
            
            #END add-point
 
 
         #----<<b_stkb015>>----
         #Ctrlp:construct.c.filter.page1.b_stkb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb015
            #add-point:ON ACTION controlp INFIELD b_stkb015 name="construct.c.filter.page1.b_stkb015"
            
            #END add-point
 
 
         #----<<b_stkb016>>----
         #Ctrlp:construct.c.filter.page1.b_stkb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stkb016
            #add-point:ON ACTION controlp INFIELD b_stkb016 name="construct.c.filter.page1.b_stkb016"
            
            #END add-point
 
 
   
 
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
   
      CALL astq861_filter_show('stkbseq','b_stkbseq')
   CALL astq861_filter_show('stkbdocno','b_stkbdocno')
   CALL astq861_filter_show('stkbsite','b_stkbsite')
   CALL astq861_filter_show('stkb002','b_stkb002')
   CALL astq861_filter_show('stkb001','b_stkb001')
   CALL astq861_filter_show('stkb003','b_stkb003')
   CALL astq861_filter_show('stkb004','b_stkb004')
   CALL astq861_filter_show('stkb005','b_stkb005')
   CALL astq861_filter_show('stkb006','b_stkb006')
   CALL astq861_filter_show('stkb007','b_stkb007')
   CALL astq861_filter_show('stkb008','b_stkb008')
   CALL astq861_filter_show('stkb010','b_stkb010')
   CALL astq861_filter_show('stkb011','b_stkb011')
   CALL astq861_filter_show('stkb012','b_stkb012')
   CALL astq861_filter_show('stkb013','b_stkb013')
   CALL astq861_filter_show('stkb014','b_stkb014')
   CALL astq861_filter_show('stkb015','b_stkb015')
   CALL astq861_filter_show('stkb016','b_stkb016')
 
    
   CALL astq861_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq861.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astq861_filter_parser(ps_field)
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
 
{<section id="astq861.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astq861_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq861_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astq861.insert" >}
#+ insert
PRIVATE FUNCTION astq861_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astq861.modify" >}
#+ modify
PRIVATE FUNCTION astq861_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq861.reproduce" >}
#+ reproduce
PRIVATE FUNCTION astq861_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq861.delete" >}
#+ delete
PRIVATE FUNCTION astq861_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq861.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq861_detail_action_trans()
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
 
{<section id="astq861.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq861_detail_index_setting()
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
            IF g_stkb_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stkb_d.getLength() AND g_stkb_d.getLength() > 0
            LET g_detail_idx = g_stkb_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stkb_d.getLength() THEN
               LET g_detail_idx = g_stkb_d.getLength()
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
 
{<section id="astq861.mask_functions" >}
 &include "erp/ast/astq861_mask.4gl"
 
{</section>}
 
{<section id="astq861.other_function" readonly="Y" >}

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
PRIVATE FUNCTION astq861_stkb002_desc()
CASE g_stkb_d[l_ac].stkb001
      WHEN '1'
          SELECT prdll003 INTO g_stkb_d[l_ac].stkb002_desc
            FROM prdll_t
           WHERE prdll001=g_stkb_d[l_ac].stkb002
             AND prdll002=g_lang
             AND prdllent=g_enterprise #160905-00007#16 add
      WHEN '2'
         SELECT prdll003 INTO g_stkb_d[l_ac].stkb002_desc
           FROM prdll_t
          WHERE prdll001=g_stkb_d[l_ac].stkb002
            AND prdll002=g_lang
            AND prdllent=g_enterprise #160905-00007#16 add
      WHEN '3'
         SELECT mmbtl003 INTO g_stkb_d[l_ac].stkb002_desc
           FROM mmbtl_t
          WHERE mmbtl001=g_stkb_d[l_ac].stkb002
            AND mmbtl002=g_lang
            AND mmbtlent=g_enterprise #160905-00007#16 add
      WHEN '4'
         SELECT gcafl003 INTO g_stkb_d[l_ac].stkb002_desc
           FROM gcafl_t
          WHERE gcafl001=g_stkb_d[l_ac].stkb002
            AND gcafl002=g_lang
            AND gcaflent=g_enterprise #160905-00007#16 add
      WHEN '5'

      WHEN '6'
         SELECT prdll003 INTO g_stkb_d[l_ac].stkb002_desc
           FROM prdll_t
          WHERE prdll001=g_stkb_d[l_ac].stkb002
            AND prdll002=g_lang
            AND prdllent=g_enterprise #160905-00007#16 add
   END CASE
END FUNCTION

 
{</section>}
 
