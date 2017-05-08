#該程式未解開Section, 採用最新樣板產出!
{<section id="astq730.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:4(2015-11-16 14:33:07), PR版次:0004(2016-10-24 17:36:01)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000061
#+ Filename...: astq730
#+ Description: 內部結算明細查詢調整作業
#+ Creator....: 03247(2014-11-21 10:34:57)
#+ Modifier...: 06189 -SD/PR- 08172
 
{</section>}
 
{<section id="astq730.global" >}
#應用 q02 樣板自動產生(Version:42)
#add-point:填寫註解說明 name="global.memo"
#161024-00025#4   2016/10/24 by 08172   组织调整
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
PRIVATE TYPE type_g_stde_d RECORD
       #statepic       LIKE type_t.chr1,
       
       sel LIKE type_t.chr1, 
   stde001 LIKE stde_t.stde001, 
   stde001_desc LIKE type_t.chr500, 
   stde002 LIKE stde_t.stde002, 
   stde003 LIKE stde_t.stde003, 
   stde004 LIKE stde_t.stde004, 
   stde005 LIKE stde_t.stde005, 
   stde006 LIKE stde_t.stde006, 
   stde007 LIKE stde_t.stde007, 
   stde031 LIKE stde_t.stde031, 
   stde008 LIKE stde_t.stde008, 
   stde008_desc LIKE type_t.chr500, 
   stde008_desc_desc LIKE type_t.chr500, 
   stde009 LIKE stde_t.stde009, 
   stde010 LIKE stde_t.stde010, 
   stde011 LIKE stde_t.stde011, 
   stde011_desc LIKE type_t.chr500, 
   stde012 LIKE stde_t.stde012, 
   stde013 LIKE stde_t.stde013, 
   stde013_desc LIKE type_t.chr500, 
   stde014 LIKE stde_t.stde014, 
   stde014_desc LIKE type_t.chr500, 
   stde015 LIKE stde_t.stde015, 
   stde015_desc LIKE type_t.chr500, 
   stde016 LIKE stde_t.stde016, 
   stde017 LIKE stde_t.stde017, 
   stde018 LIKE stde_t.stde018, 
   stde019 LIKE stde_t.stde019, 
   stde020 LIKE stde_t.stde020, 
   stde020_desc LIKE type_t.chr500, 
   stde021 LIKE stde_t.stde021, 
   stde021_desc LIKE type_t.chr500, 
   stde022 LIKE stde_t.stde022, 
   stde022_desc LIKE type_t.chr500, 
   stde023 LIKE stde_t.stde023, 
   stde023_desc LIKE type_t.chr500, 
   stde024 LIKE stde_t.stde024, 
   stde024_desc LIKE type_t.chr500, 
   stde025 LIKE stde_t.stde025, 
   stde025_desc LIKE type_t.chr500, 
   stde026 LIKE stde_t.stde026, 
   stde026_desc LIKE type_t.chr500, 
   stde027 LIKE stde_t.stde027, 
   stde027_desc LIKE type_t.chr500, 
   stde028 LIKE stde_t.stde028, 
   stde029 LIKE stde_t.stde029, 
   stde030 LIKE stde_t.stde030, 
   stdestus LIKE stde_t.stdestus 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_stde_d_colour DYNAMIC ARRAY OF RECORD       
   sel      STRING, 
   stde001  STRING,
   stde001_desc  STRING,
   stde002  STRING, 
   stde003  STRING, 
   stde004  STRING, 
   stde005  STRING, 
   stde006  STRING, 
   stde007  STRING, 
   stde008  STRING,
   stde008_desc  STRING,
   stde008_desc_desc STRING,
   stde009  STRING, 
   stde010  STRING, 
   stde011  STRING,
   stde011_desc  STRING, 
   stde012  STRING, 
   stde013  STRING,
   stde013_desc  STRING,
   stde014  STRING, 
   stde014_desc  STRING,
   stde015  STRING,
   stde015_desc  STRING,   
   stde016  STRING, 
   stde017  STRING, 
   stde018  STRING, 
   stde019  STRING, 
   stde020  STRING,
   stde020_desc  STRING,
   stde021  STRING,
   stde021_desc  STRING,   
   stde022  STRING,
   stde022_desc  STRING,   
   stde023  STRING,
   stde023_desc  STRING,   
   stde024  STRING,
   stde024_desc  STRING,
   stde025  STRING,
   stde025_desc  STRING,   
   stde026  STRING,
   stde026_desc  STRING,
   stde027  STRING,
   stde027_desc  STRING,   
   stde028  STRING, 
   stde029  STRING, 
   stde030  STRING, 
   stdestus STRING 
       END RECORD
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_stde_d
DEFINE g_master_t                   type_g_stde_d
DEFINE g_stde_d          DYNAMIC ARRAY OF type_g_stde_d
DEFINE g_stde_d_t        type_g_stde_d
 
      
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
 
{<section id="astq730.main" >}
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
   LET g_forupd_sql = " ", 
                      " FROM ",
                      " "
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq730_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq730_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   LET g_forupd_sql = "SELECT UNIQUE stde001,stde002,stde003,stde004,stde005,stde006,stde007,stde008,stde009, 
       stde010,stde011,stde012,stde013,stde014,stde015,stde016,stde017,stde018,stde019,stde020,stde021, 
       stde022,stde023,stde024,stde025,stde026,stde027,stde028,stde029,stde030,stdestus FROM stde_t
       WHERE stdeent=? AND stde006=? AND stde007=? FOR UPDATE "       
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq730_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq730 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq730_init()   
 
      #進入選單 Menu (="N")
      CALL astq730_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq730
      
   END IF 
   
   CLOSE astq730_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq730.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq730_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc("b_stde003",'6082')
   CALL cl_set_combo_scc("b_stde004",'6083')
   CALL cl_set_combo_scc("b_stdestus",'6084')
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
 
   CALL astq730_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="astq730.default_search" >}
PRIVATE FUNCTION astq730_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stde006 = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stde007 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stde031 = '", g_argv[03], "' AND "
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
 
{<section id="astq730.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq730_ui_dialog()
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
      CALL astq730_b_fill()
   ELSE
      CALL astq730_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stde_d.clear()
 
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
 
         CALL astq730_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stde_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq730_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq730_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq730_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            CALL DIALOG.setCellAttributes(g_stde_d_colour)    #参数：屏幕变量,属性数组
            CALL DIALOG.setArrayAttributes("s_detail1",g_stde_d_colour)    #参数：屏幕变量,属性数组
            #end add-point
 
         
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
               CALL astq730_query()
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
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION upd_stde028
            LET g_action_choice="upd_stde028"
            IF cl_auth_chk_act("upd_stde028") THEN
               
               #add-point:ON ACTION upd_stde028 name="menu.upd_stde028"
               CALL astq730_modify()
               #END add-point
               
               
            END IF
 
 
 
 
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq730_filter()
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
            CALL astq730_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stde_d)
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
            CALL astq730_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq730_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq730_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq730_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stde_d.getLength()
               LET g_stde_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stde_d.getLength()
               LET g_stde_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stde_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stde_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stde_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stde_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         
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
 
{<section id="astq730.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq730_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
   
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_stde_d.clear()
 
   
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
      CONSTRUCT g_wc_table ON stde001,stde002,stde003,stde004,stde005,stde006,stde007,stde031,stde008, 
          stde009,stde010,stde011,stde012,stde013,stde014,stde015,stde016,stde017,stde018,stde019,stde020, 
          stde021,stde022,stde023,stde024,stde025,stde026,stde027,stde028,stde029,stde030,stdestus
           FROM s_detail1[1].b_stde001,s_detail1[1].b_stde002,s_detail1[1].b_stde003,s_detail1[1].b_stde004, 
               s_detail1[1].b_stde005,s_detail1[1].b_stde006,s_detail1[1].b_stde007,s_detail1[1].b_stde031, 
               s_detail1[1].b_stde008,s_detail1[1].b_stde009,s_detail1[1].b_stde010,s_detail1[1].b_stde011, 
               s_detail1[1].b_stde012,s_detail1[1].b_stde013,s_detail1[1].b_stde014,s_detail1[1].b_stde015, 
               s_detail1[1].b_stde016,s_detail1[1].b_stde017,s_detail1[1].b_stde018,s_detail1[1].b_stde019, 
               s_detail1[1].b_stde020,s_detail1[1].b_stde021,s_detail1[1].b_stde022,s_detail1[1].b_stde023, 
               s_detail1[1].b_stde024,s_detail1[1].b_stde025,s_detail1[1].b_stde026,s_detail1[1].b_stde027, 
               s_detail1[1].b_stde028,s_detail1[1].b_stde029,s_detail1[1].b_stde030,s_detail1[1].b_stdestus 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stdecrtdt>>----
         #AFTER FIELD stdecrtdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stdemoddt>>----
         #AFTER FIELD stdemoddt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdecnfdt>>----
         #AFTER FIELD stdecnfdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdepstdt>>----
         #AFTER FIELD stdepstdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<b_stde001>>----
         #Ctrlp:construct.c.page1.b_stde001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde001
            #add-point:ON ACTION controlp INFIELD b_stde001 name="construct.c.page1.b_stde001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef212 = 'Y' "
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stde001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stde001',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               LET g_qryparam.where = " ooef212 = 'Y' "
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO b_stde001  #顯示到畫面上
            NEXT FIELD b_stde001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde001
            #add-point:BEFORE FIELD b_stde001 name="construct.b.page1.b_stde001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde001
            
            #add-point:AFTER FIELD b_stde001 name="construct.a.page1.b_stde001"
            
            #END add-point
            
 
 
         #----<<b_stde001_desc>>----
         #----<<b_stde002>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde002
            #add-point:BEFORE FIELD b_stde002 name="construct.b.page1.b_stde002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde002
            
            #add-point:AFTER FIELD b_stde002 name="construct.a.page1.b_stde002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde002
            #add-point:ON ACTION controlp INFIELD b_stde002 name="construct.c.page1.b_stde002"
            
            #END add-point
 
 
         #----<<b_stde003>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde003
            #add-point:BEFORE FIELD b_stde003 name="construct.b.page1.b_stde003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde003
            
            #add-point:AFTER FIELD b_stde003 name="construct.a.page1.b_stde003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde003
            #add-point:ON ACTION controlp INFIELD b_stde003 name="construct.c.page1.b_stde003"
            
            #END add-point
 
 
         #----<<b_stde004>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde004
            #add-point:BEFORE FIELD b_stde004 name="construct.b.page1.b_stde004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde004
            
            #add-point:AFTER FIELD b_stde004 name="construct.a.page1.b_stde004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde004
            #add-point:ON ACTION controlp INFIELD b_stde004 name="construct.c.page1.b_stde004"
            
            #END add-point
 
 
         #----<<b_stde005>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde005
            #add-point:BEFORE FIELD b_stde005 name="construct.b.page1.b_stde005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde005
            
            #add-point:AFTER FIELD b_stde005 name="construct.a.page1.b_stde005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde005
            #add-point:ON ACTION controlp INFIELD b_stde005 name="construct.c.page1.b_stde005"
            
            #END add-point
 
 
         #----<<b_stde006>>----
         #Ctrlp:construct.c.page1.b_stde006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde006
            #add-point:ON ACTION controlp INFIELD b_stde006 name="construct.c.page1.b_stde006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stde006()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde006  #顯示到畫面上
            NEXT FIELD b_stde006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde006
            #add-point:BEFORE FIELD b_stde006 name="construct.b.page1.b_stde006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde006
            
            #add-point:AFTER FIELD b_stde006 name="construct.a.page1.b_stde006"
            
            #END add-point
            
 
 
         #----<<b_stde007>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde007
            #add-point:BEFORE FIELD b_stde007 name="construct.b.page1.b_stde007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde007
            
            #add-point:AFTER FIELD b_stde007 name="construct.a.page1.b_stde007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde007
            #add-point:ON ACTION controlp INFIELD b_stde007 name="construct.c.page1.b_stde007"
            
            #END add-point
 
 
         #----<<b_stde031>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde031
            #add-point:BEFORE FIELD b_stde031 name="construct.b.page1.b_stde031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde031
            
            #add-point:AFTER FIELD b_stde031 name="construct.a.page1.b_stde031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde031
            #add-point:ON ACTION controlp INFIELD b_stde031 name="construct.c.page1.b_stde031"
            
            #END add-point
 
 
         #----<<b_stde008>>----
         #Ctrlp:construct.c.page1.b_stde008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde008
            #add-point:ON ACTION controlp INFIELD b_stde008 name="construct.c.page1.b_stde008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde008  #顯示到畫面上
            NEXT FIELD b_stde008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde008
            #add-point:BEFORE FIELD b_stde008 name="construct.b.page1.b_stde008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde008
            
            #add-point:AFTER FIELD b_stde008 name="construct.a.page1.b_stde008"
            
            #END add-point
            
 
 
         #----<<b_stde008_desc>>----
         #----<<b_stde008_desc_desc>>----
         #----<<b_stde009>>----
         #Ctrlp:construct.c.page1.b_stde009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde009
            #add-point:ON ACTION controlp INFIELD b_stde009 name="construct.c.page1.b_stde009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imay003_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde009  #顯示到畫面上
            NEXT FIELD b_stde009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde009
            #add-point:BEFORE FIELD b_stde009 name="construct.b.page1.b_stde009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde009
            
            #add-point:AFTER FIELD b_stde009 name="construct.a.page1.b_stde009"
            
            #END add-point
            
 
 
         #----<<b_stde010>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde010
            #add-point:BEFORE FIELD b_stde010 name="construct.b.page1.b_stde010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde010
            
            #add-point:AFTER FIELD b_stde010 name="construct.a.page1.b_stde010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde010
            #add-point:ON ACTION controlp INFIELD b_stde010 name="construct.c.page1.b_stde010"
            
            #END add-point
 
 
         #----<<b_stde011>>----
         #Ctrlp:construct.c.page1.b_stde011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde011
            #add-point:ON ACTION controlp INFIELD b_stde011 name="construct.c.page1.b_stde011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde011  #顯示到畫面上
            NEXT FIELD b_stde011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde011
            #add-point:BEFORE FIELD b_stde011 name="construct.b.page1.b_stde011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde011
            
            #add-point:AFTER FIELD b_stde011 name="construct.a.page1.b_stde011"
            
            #END add-point
            
 
 
         #----<<b_stde011_desc>>----
         #----<<b_stde012>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde012
            #add-point:BEFORE FIELD b_stde012 name="construct.b.page1.b_stde012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde012
            
            #add-point:AFTER FIELD b_stde012 name="construct.a.page1.b_stde012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde012
            #add-point:ON ACTION controlp INFIELD b_stde012 name="construct.c.page1.b_stde012"
            
            #END add-point
 
 
         #----<<b_stde013>>----
         #Ctrlp:construct.c.page1.b_stde013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde013
            #add-point:ON ACTION controlp INFIELD b_stde013 name="construct.c.page1.b_stde013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde013  #顯示到畫面上
            NEXT FIELD b_stde013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde013
            #add-point:BEFORE FIELD b_stde013 name="construct.b.page1.b_stde013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde013
            
            #add-point:AFTER FIELD b_stde013 name="construct.a.page1.b_stde013"
            
            #END add-point
            
 
 
         #----<<b_stde013_desc>>----
         #----<<b_stde014>>----
         #Ctrlp:construct.c.page1.b_stde014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde014
            #add-point:ON ACTION controlp INFIELD b_stde014 name="construct.c.page1.b_stde014"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde014  #顯示到畫面上
            NEXT FIELD b_stde014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde014
            #add-point:BEFORE FIELD b_stde014 name="construct.b.page1.b_stde014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde014
            
            #add-point:AFTER FIELD b_stde014 name="construct.a.page1.b_stde014"
            
            #END add-point
            
 
 
         #----<<b_stde014_desc>>----
         #----<<b_stde015>>----
         #Ctrlp:construct.c.page1.b_stde015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde015
            #add-point:ON ACTION controlp INFIELD b_stde015 name="construct.c.page1.b_stde015"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde015  #顯示到畫面上
            NEXT FIELD b_stde015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde015
            #add-point:BEFORE FIELD b_stde015 name="construct.b.page1.b_stde015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde015
            
            #add-point:AFTER FIELD b_stde015 name="construct.a.page1.b_stde015"
            
            #END add-point
            
 
 
         #----<<stde015_desc>>----
         #----<<b_stde016>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde016
            #add-point:BEFORE FIELD b_stde016 name="construct.b.page1.b_stde016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde016
            
            #add-point:AFTER FIELD b_stde016 name="construct.a.page1.b_stde016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde016
            #add-point:ON ACTION controlp INFIELD b_stde016 name="construct.c.page1.b_stde016"
            
            #END add-point
 
 
         #----<<b_stde017>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde017
            #add-point:BEFORE FIELD b_stde017 name="construct.b.page1.b_stde017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde017
            
            #add-point:AFTER FIELD b_stde017 name="construct.a.page1.b_stde017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde017
            #add-point:ON ACTION controlp INFIELD b_stde017 name="construct.c.page1.b_stde017"
            
            #END add-point
 
 
         #----<<b_stde018>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde018
            #add-point:BEFORE FIELD b_stde018 name="construct.b.page1.b_stde018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde018
            
            #add-point:AFTER FIELD b_stde018 name="construct.a.page1.b_stde018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde018
            #add-point:ON ACTION controlp INFIELD b_stde018 name="construct.c.page1.b_stde018"
            
            #END add-point
 
 
         #----<<b_stde019>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde019
            #add-point:BEFORE FIELD b_stde019 name="construct.b.page1.b_stde019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde019
            
            #add-point:AFTER FIELD b_stde019 name="construct.a.page1.b_stde019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde019
            #add-point:ON ACTION controlp INFIELD b_stde019 name="construct.c.page1.b_stde019"
            
            #END add-point
 
 
         #----<<b_stde020>>----
         #Ctrlp:construct.c.page1.b_stde020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde020
            #add-point:ON ACTION controlp INFIELD b_stde020 name="construct.c.page1.b_stde020"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stde020') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stde020',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO b_stde020  #顯示到畫面上
            NEXT FIELD b_stde020                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde020
            #add-point:BEFORE FIELD b_stde020 name="construct.b.page1.b_stde020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde020
            
            #add-point:AFTER FIELD b_stde020 name="construct.a.page1.b_stde020"
            
            #END add-point
            
 
 
         #----<<b_stde020_desc>>----
         #----<<b_stde021>>----
         #Ctrlp:construct.c.page1.b_stde021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde021
            #add-point:ON ACTION controlp INFIELD b_stde021 name="construct.c.page1.b_stde021"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde021  #顯示到畫面上
            NEXT FIELD b_stde021                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde021
            #add-point:BEFORE FIELD b_stde021 name="construct.b.page1.b_stde021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde021
            
            #add-point:AFTER FIELD b_stde021 name="construct.a.page1.b_stde021"
            
            #END add-point
            
 
 
         #----<<b_stde021_desc>>----
         #----<<b_stde022>>----
         #Ctrlp:construct.c.page1.b_stde022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde022
            #add-point:ON ACTION controlp INFIELD b_stde022 name="construct.c.page1.b_stde022"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde022  #顯示到畫面上
            NEXT FIELD b_stde022                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde022
            #add-point:BEFORE FIELD b_stde022 name="construct.b.page1.b_stde022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde022
            
            #add-point:AFTER FIELD b_stde022 name="construct.a.page1.b_stde022"
            
            #END add-point
            
 
 
         #----<<b_stde022_desc>>----
         #----<<b_stde023>>----
         #Ctrlp:construct.c.page1.b_stde023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde023
            #add-point:ON ACTION controlp INFIELD b_stde023 name="construct.c.page1.b_stde023"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stde023') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stde023',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO b_stde023  #顯示到畫面上
            NEXT FIELD b_stde023                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde023
            #add-point:BEFORE FIELD b_stde023 name="construct.b.page1.b_stde023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde023
            
            #add-point:AFTER FIELD b_stde023 name="construct.a.page1.b_stde023"
            
            #END add-point
            
 
 
         #----<<b_stde023_desc>>----
         #----<<b_stde024>>----
         #Ctrlp:construct.c.page1.b_stde024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde024
            #add-point:ON ACTION controlp INFIELD b_stde024 name="construct.c.page1.b_stde024"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde024  #顯示到畫面上
            NEXT FIELD b_stde024                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde024
            #add-point:BEFORE FIELD b_stde024 name="construct.b.page1.b_stde024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde024
            
            #add-point:AFTER FIELD b_stde024 name="construct.a.page1.b_stde024"
            
            #END add-point
            
 
 
         #----<<b_stde024_desc>>----
         #----<<b_stde025>>----
         #Ctrlp:construct.c.page1.b_stde025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde025
            #add-point:ON ACTION controlp INFIELD b_stde025 name="construct.c.page1.b_stde025"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde025  #顯示到畫面上
            NEXT FIELD b_stde025                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde025
            #add-point:BEFORE FIELD b_stde025 name="construct.b.page1.b_stde025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde025
            
            #add-point:AFTER FIELD b_stde025 name="construct.a.page1.b_stde025"
            
            #END add-point
            
 
 
         #----<<b_stde025_desc>>----
         #----<<b_stde026>>----
         #Ctrlp:construct.c.page1.b_stde026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde026
            #add-point:ON ACTION controlp INFIELD b_stde026 name="construct.c.page1.b_stde026"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stde026') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stde026',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO b_stde026  #顯示到畫面上
            NEXT FIELD b_stde026                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde026
            #add-point:BEFORE FIELD b_stde026 name="construct.b.page1.b_stde026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde026
            
            #add-point:AFTER FIELD b_stde026 name="construct.a.page1.b_stde026"
            
            #END add-point
            
 
 
         #----<<b_stde026_desc>>----
         #----<<b_stde027>>----
         #Ctrlp:construct.c.page1.b_stde027
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde027
            #add-point:ON ACTION controlp INFIELD b_stde027 name="construct.c.page1.b_stde027"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde027  #顯示到畫面上
            NEXT FIELD b_stde027                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde027
            #add-point:BEFORE FIELD b_stde027 name="construct.b.page1.b_stde027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde027
            
            #add-point:AFTER FIELD b_stde027 name="construct.a.page1.b_stde027"
            
            #END add-point
            
 
 
         #----<<b_stde027_desc>>----
         #----<<b_stde028>>----
         #Ctrlp:construct.c.page1.b_stde028
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde028
            #add-point:ON ACTION controlp INFIELD b_stde028 name="construct.c.page1.b_stde028"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stdb001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde028  #顯示到畫面上
            NEXT FIELD b_stde028                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde028
            #add-point:BEFORE FIELD b_stde028 name="construct.b.page1.b_stde028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde028
            
            #add-point:AFTER FIELD b_stde028 name="construct.a.page1.b_stde028"
            
            #END add-point
            
 
 
         #----<<b_stde029>>----
         #Ctrlp:construct.c.page1.b_stde029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde029
            #add-point:ON ACTION controlp INFIELD b_stde029 name="construct.c.page1.b_stde029"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stde029()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde029  #顯示到畫面上
            NEXT FIELD b_stde029                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde029
            #add-point:BEFORE FIELD b_stde029 name="construct.b.page1.b_stde029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde029
            
            #add-point:AFTER FIELD b_stde029 name="construct.a.page1.b_stde029"
            
            #END add-point
            
 
 
         #----<<b_stde030>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stde030
            #add-point:BEFORE FIELD b_stde030 name="construct.b.page1.b_stde030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stde030
            
            #add-point:AFTER FIELD b_stde030 name="construct.a.page1.b_stde030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stde030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde030
            #add-point:ON ACTION controlp INFIELD b_stde030 name="construct.c.page1.b_stde030"
            
            #END add-point
 
 
         #----<<b_stdestus>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stdestus
            #add-point:BEFORE FIELD b_stdestus name="construct.b.page1.b_stdestus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stdestus
            
            #add-point:AFTER FIELD b_stdestus name="construct.a.page1.b_stdestus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stdestus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stdestus
            #add-point:ON ACTION controlp INFIELD b_stdestus name="construct.c.page1.b_stdestus"
            
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
   CALL astq730_b_fill()
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
 
{<section id="astq730.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq730_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
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
 
   LET ls_sql_rank = "SELECT  UNIQUE '',stde001,'',stde002,stde003,stde004,stde005,stde006,stde007,stde031, 
       stde008,'','',stde009,stde010,stde011,'',stde012,stde013,'',stde014,'',stde015,'',stde016,stde017, 
       stde018,stde019,stde020,'',stde021,'',stde022,'',stde023,'',stde024,'',stde025,'',stde026,'', 
       stde027,'',stde028,stde029,stde030,stdestus  ,DENSE_RANK() OVER( ORDER BY stde_t.stde006,stde_t.stde007, 
       stde_t.stde031) AS RANK FROM stde_t",
 
 
                     "",
                     " WHERE stdeent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stde_t"),
                     " ORDER BY stde_t.stde006,stde_t.stde007,stde_t.stde031"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   
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
 
   LET g_sql = "SELECT '',stde001,'',stde002,stde003,stde004,stde005,stde006,stde007,stde031,stde008, 
       '','',stde009,stde010,stde011,'',stde012,stde013,'',stde014,'',stde015,'',stde016,stde017,stde018, 
       stde019,stde020,'',stde021,'',stde022,'',stde023,'',stde024,'',stde025,'',stde026,'',stde027, 
       '',stde028,stde029,stde030,stdestus",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq730_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq730_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stde_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   CALL g_stde_d_colour.clear()
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_stde_d[l_ac].sel,g_stde_d[l_ac].stde001,g_stde_d[l_ac].stde001_desc,g_stde_d[l_ac].stde002, 
       g_stde_d[l_ac].stde003,g_stde_d[l_ac].stde004,g_stde_d[l_ac].stde005,g_stde_d[l_ac].stde006,g_stde_d[l_ac].stde007, 
       g_stde_d[l_ac].stde031,g_stde_d[l_ac].stde008,g_stde_d[l_ac].stde008_desc,g_stde_d[l_ac].stde008_desc_desc, 
       g_stde_d[l_ac].stde009,g_stde_d[l_ac].stde010,g_stde_d[l_ac].stde011,g_stde_d[l_ac].stde011_desc, 
       g_stde_d[l_ac].stde012,g_stde_d[l_ac].stde013,g_stde_d[l_ac].stde013_desc,g_stde_d[l_ac].stde014, 
       g_stde_d[l_ac].stde014_desc,g_stde_d[l_ac].stde015,g_stde_d[l_ac].stde015_desc,g_stde_d[l_ac].stde016, 
       g_stde_d[l_ac].stde017,g_stde_d[l_ac].stde018,g_stde_d[l_ac].stde019,g_stde_d[l_ac].stde020,g_stde_d[l_ac].stde020_desc, 
       g_stde_d[l_ac].stde021,g_stde_d[l_ac].stde021_desc,g_stde_d[l_ac].stde022,g_stde_d[l_ac].stde022_desc, 
       g_stde_d[l_ac].stde023,g_stde_d[l_ac].stde023_desc,g_stde_d[l_ac].stde024,g_stde_d[l_ac].stde024_desc, 
       g_stde_d[l_ac].stde025,g_stde_d[l_ac].stde025_desc,g_stde_d[l_ac].stde026,g_stde_d[l_ac].stde026_desc, 
       g_stde_d[l_ac].stde027,g_stde_d[l_ac].stde027_desc,g_stde_d[l_ac].stde028,g_stde_d[l_ac].stde029, 
       g_stde_d[l_ac].stde030,g_stde_d[l_ac].stdestus
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_stde_d[l_ac].statepic = cl_get_actipic(g_stde_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      LET g_stde_d[l_ac].sel = "N"
      IF cl_null(g_stde_d[l_ac].stde028) THEN
         LET g_stde_d_colour[l_ac].sel = "red reverse"
         LET g_stde_d_colour[l_ac].stde001 = "red reverse"
         LET g_stde_d_colour[l_ac].stde001_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde002 = "red reverse"
         LET g_stde_d_colour[l_ac].stde003 = "red reverse"
         LET g_stde_d_colour[l_ac].stde004 = "red reverse"
         LET g_stde_d_colour[l_ac].stde005 = "red reverse"
         LET g_stde_d_colour[l_ac].stde006 = "red reverse"
         LET g_stde_d_colour[l_ac].stde007 = "red reverse"
         LET g_stde_d_colour[l_ac].stde008 = "red reverse"
         LET g_stde_d_colour[l_ac].stde008_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde008_desc_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde009 = "red reverse"
         LET g_stde_d_colour[l_ac].stde010 = "red reverse"
         LET g_stde_d_colour[l_ac].stde011 = "red reverse"
         LET g_stde_d_colour[l_ac].stde011_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde012 = "red reverse"
         LET g_stde_d_colour[l_ac].stde013 = "red reverse"
         LET g_stde_d_colour[l_ac].stde013_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde014 = "red reverse"
         LET g_stde_d_colour[l_ac].stde014_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde015 = "red reverse"
         LET g_stde_d_colour[l_ac].stde015_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde016 = "red reverse"
         LET g_stde_d_colour[l_ac].stde017 = "red reverse"
         LET g_stde_d_colour[l_ac].stde018 = "red reverse"
         LET g_stde_d_colour[l_ac].stde019 = "red reverse"
         LET g_stde_d_colour[l_ac].stde020 = "red reverse"
         LET g_stde_d_colour[l_ac].stde020_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde021 = "red reverse"
         LET g_stde_d_colour[l_ac].stde021_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde022 = "red reverse"
         LET g_stde_d_colour[l_ac].stde022_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde023 = "red reverse"
         LET g_stde_d_colour[l_ac].stde023_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde024 = "red reverse"
         LET g_stde_d_colour[l_ac].stde024_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde025 = "red reverse"
         LET g_stde_d_colour[l_ac].stde025_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde026 = "red reverse"
         LET g_stde_d_colour[l_ac].stde026_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde027 = "red reverse"
         LET g_stde_d_colour[l_ac].stde027_desc = "red reverse"
         LET g_stde_d_colour[l_ac].stde028 = "red reverse"
         LET g_stde_d_colour[l_ac].stde029 = "red reverse"
         LET g_stde_d_colour[l_ac].stde030 = "red reverse"
         LET g_stde_d_colour[l_ac].stdestus = "red reverse"
      END IF
      #end add-point
 
      CALL astq730_detail_show("'1'")      
 
      CALL astq730_stde_t_mask()
 
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
   
 
   
   CALL g_stde_d.deleteElement(g_stde_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
 
   LET g_detail_cnt = g_stde_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astq730_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq730_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq730_detail_action_trans()
 
   IF g_stde_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL astq730_fetch()
   END IF
   
      CALL astq730_filter_show('stde001','b_stde001')
   CALL astq730_filter_show('stde002','b_stde002')
   CALL astq730_filter_show('stde003','b_stde003')
   CALL astq730_filter_show('stde004','b_stde004')
   CALL astq730_filter_show('stde005','b_stde005')
   CALL astq730_filter_show('stde006','b_stde006')
   CALL astq730_filter_show('stde007','b_stde007')
   CALL astq730_filter_show('stde031','b_stde031')
   CALL astq730_filter_show('stde008','b_stde008')
   CALL astq730_filter_show('stde009','b_stde009')
   CALL astq730_filter_show('stde010','b_stde010')
   CALL astq730_filter_show('stde011','b_stde011')
   CALL astq730_filter_show('stde012','b_stde012')
   CALL astq730_filter_show('stde013','b_stde013')
   CALL astq730_filter_show('stde014','b_stde014')
   CALL astq730_filter_show('stde015','b_stde015')
   CALL astq730_filter_show('stde016','b_stde016')
   CALL astq730_filter_show('stde017','b_stde017')
   CALL astq730_filter_show('stde018','b_stde018')
   CALL astq730_filter_show('stde019','b_stde019')
   CALL astq730_filter_show('stde020','b_stde020')
   CALL astq730_filter_show('stde021','b_stde021')
   CALL astq730_filter_show('stde022','b_stde022')
   CALL astq730_filter_show('stde023','b_stde023')
   CALL astq730_filter_show('stde024','b_stde024')
   CALL astq730_filter_show('stde025','b_stde025')
   CALL astq730_filter_show('stde026','b_stde026')
   CALL astq730_filter_show('stde027','b_stde027')
   CALL astq730_filter_show('stde028','b_stde028')
   CALL astq730_filter_show('stde029','b_stde029')
   CALL astq730_filter_show('stde030','b_stde030')
   CALL astq730_filter_show('stdestus','b_stdestus')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq730.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq730_fetch()
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
 
{<section id="astq730.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq730_detail_show(ps_page)
   #add-point:show段define-客製 name="detail_show.define_customerization"
   
   #end add-point
   DEFINE ps_page    STRING
   DEFINE ls_sql     STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   DEFINE l_ooef019  LIKE ooef_t.ooef019
   #end add-point
 
   #add-point:detail_show段之前 name="detail_show.before"
   
   #end add-point
   
   
 
   #讀入ref值
   IF ps_page.getIndexOf("'1'",1) > 0 THEN
      #帶出公用欄位reference值page1
      #應用 a12 樣板自動產生(Version:4)
 
 
 
 
      #add-point:show段單身reference name="detail_show.body.reference"

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde001
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde001_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde008
            LET ls_sql = "SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde008_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde008
            LET ls_sql = "SELECT imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde008_desc_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde008_desc_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde011
            LET ls_sql = "SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde011_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde013
            LET ls_sql = "SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde013_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde014
            LET ls_sql = "SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde014_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde014_desc
            
            SELECT ooef019 INTO l_ooef019 FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stde_d[l_ac].stde015
            LET ls_sql = "SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde015_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde015_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde020
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde020_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde020_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde021
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde021_desc

#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stde_d[l_ac].stde020
#            LET g_ref_fields[2] = g_stde_d[l_ac].stde022
#            LET ls_sql = "SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite=? AND inaa001=? "
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stde_d[l_ac].stde022_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stde_d[l_ac].stde022_desc
            CALL s_desc_get_stock_desc(g_stde_d[l_ac].stde020,g_stde_d[l_ac].stde022) RETURNING g_stde_d[l_ac].stde022_desc
            DISPLAY BY NAME g_stde_d[l_ac].stde022_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde023
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde023_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde023_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde024
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde024_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde024_desc

#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stde_d[l_ac].stde023
#            LET g_ref_fields[2] = g_stde_d[l_ac].stde025
#            LET ls_sql = "SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite=? AND inaa001=? "
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stde_d[l_ac].stde025_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stde_d[l_ac].stde025_desc
            CALL s_desc_get_stock_desc(g_stde_d[l_ac].stde023,g_stde_d[l_ac].stde025) RETURNING g_stde_d[l_ac].stde025_desc
            DISPLAY BY NAME g_stde_d[l_ac].stde025_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde026
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde026_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde026_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stde_d[l_ac].stde027
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stde_d[l_ac].stde027_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stde_d[l_ac].stde027_desc

      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq730.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astq730_filter()
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
      CONSTRUCT g_wc_filter ON stde001,stde002,stde003,stde004,stde005,stde006,stde007,stde031,stde008, 
          stde009,stde010,stde011,stde012,stde013,stde014,stde015,stde016,stde017,stde018,stde019,stde020, 
          stde021,stde022,stde023,stde024,stde025,stde026,stde027,stde028,stde029,stde030,stdestus
                          FROM s_detail1[1].b_stde001,s_detail1[1].b_stde002,s_detail1[1].b_stde003, 
                              s_detail1[1].b_stde004,s_detail1[1].b_stde005,s_detail1[1].b_stde006,s_detail1[1].b_stde007, 
                              s_detail1[1].b_stde031,s_detail1[1].b_stde008,s_detail1[1].b_stde009,s_detail1[1].b_stde010, 
                              s_detail1[1].b_stde011,s_detail1[1].b_stde012,s_detail1[1].b_stde013,s_detail1[1].b_stde014, 
                              s_detail1[1].b_stde015,s_detail1[1].b_stde016,s_detail1[1].b_stde017,s_detail1[1].b_stde018, 
                              s_detail1[1].b_stde019,s_detail1[1].b_stde020,s_detail1[1].b_stde021,s_detail1[1].b_stde022, 
                              s_detail1[1].b_stde023,s_detail1[1].b_stde024,s_detail1[1].b_stde025,s_detail1[1].b_stde026, 
                              s_detail1[1].b_stde027,s_detail1[1].b_stde028,s_detail1[1].b_stde029,s_detail1[1].b_stde030, 
                              s_detail1[1].b_stdestus
 
         BEFORE CONSTRUCT
                     DISPLAY astq730_filter_parser('stde001') TO s_detail1[1].b_stde001
            DISPLAY astq730_filter_parser('stde002') TO s_detail1[1].b_stde002
            DISPLAY astq730_filter_parser('stde003') TO s_detail1[1].b_stde003
            DISPLAY astq730_filter_parser('stde004') TO s_detail1[1].b_stde004
            DISPLAY astq730_filter_parser('stde005') TO s_detail1[1].b_stde005
            DISPLAY astq730_filter_parser('stde006') TO s_detail1[1].b_stde006
            DISPLAY astq730_filter_parser('stde007') TO s_detail1[1].b_stde007
            DISPLAY astq730_filter_parser('stde031') TO s_detail1[1].b_stde031
            DISPLAY astq730_filter_parser('stde008') TO s_detail1[1].b_stde008
            DISPLAY astq730_filter_parser('stde009') TO s_detail1[1].b_stde009
            DISPLAY astq730_filter_parser('stde010') TO s_detail1[1].b_stde010
            DISPLAY astq730_filter_parser('stde011') TO s_detail1[1].b_stde011
            DISPLAY astq730_filter_parser('stde012') TO s_detail1[1].b_stde012
            DISPLAY astq730_filter_parser('stde013') TO s_detail1[1].b_stde013
            DISPLAY astq730_filter_parser('stde014') TO s_detail1[1].b_stde014
            DISPLAY astq730_filter_parser('stde015') TO s_detail1[1].b_stde015
            DISPLAY astq730_filter_parser('stde016') TO s_detail1[1].b_stde016
            DISPLAY astq730_filter_parser('stde017') TO s_detail1[1].b_stde017
            DISPLAY astq730_filter_parser('stde018') TO s_detail1[1].b_stde018
            DISPLAY astq730_filter_parser('stde019') TO s_detail1[1].b_stde019
            DISPLAY astq730_filter_parser('stde020') TO s_detail1[1].b_stde020
            DISPLAY astq730_filter_parser('stde021') TO s_detail1[1].b_stde021
            DISPLAY astq730_filter_parser('stde022') TO s_detail1[1].b_stde022
            DISPLAY astq730_filter_parser('stde023') TO s_detail1[1].b_stde023
            DISPLAY astq730_filter_parser('stde024') TO s_detail1[1].b_stde024
            DISPLAY astq730_filter_parser('stde025') TO s_detail1[1].b_stde025
            DISPLAY astq730_filter_parser('stde026') TO s_detail1[1].b_stde026
            DISPLAY astq730_filter_parser('stde027') TO s_detail1[1].b_stde027
            DISPLAY astq730_filter_parser('stde028') TO s_detail1[1].b_stde028
            DISPLAY astq730_filter_parser('stde029') TO s_detail1[1].b_stde029
            DISPLAY astq730_filter_parser('stde030') TO s_detail1[1].b_stde030
            DISPLAY astq730_filter_parser('stdestus') TO s_detail1[1].b_stdestus
 
 
         #單身公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stdecrtdt>>----
         #AFTER FIELD stdecrtdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stdemoddt>>----
         #AFTER FIELD stdemoddt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdecnfdt>>----
         #AFTER FIELD stdecnfdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdepstdt>>----
         #AFTER FIELD stdepstdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
           
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stde001>>----
         #Ctrlp:construct.c.page1.b_stde001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde001
            #add-point:ON ACTION controlp INFIELD b_stde001 name="construct.c.filter.page1.b_stde001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde001  #顯示到畫面上
            NEXT FIELD b_stde001                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde001_desc>>----
         #----<<b_stde002>>----
         #Ctrlp:construct.c.filter.page1.b_stde002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde002
            #add-point:ON ACTION controlp INFIELD b_stde002 name="construct.c.filter.page1.b_stde002"
            
            #END add-point
 
 
         #----<<b_stde003>>----
         #Ctrlp:construct.c.filter.page1.b_stde003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde003
            #add-point:ON ACTION controlp INFIELD b_stde003 name="construct.c.filter.page1.b_stde003"
            
            #END add-point
 
 
         #----<<b_stde004>>----
         #Ctrlp:construct.c.filter.page1.b_stde004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde004
            #add-point:ON ACTION controlp INFIELD b_stde004 name="construct.c.filter.page1.b_stde004"
            
            #END add-point
 
 
         #----<<b_stde005>>----
         #Ctrlp:construct.c.filter.page1.b_stde005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde005
            #add-point:ON ACTION controlp INFIELD b_stde005 name="construct.c.filter.page1.b_stde005"
            
            #END add-point
 
 
         #----<<b_stde006>>----
         #Ctrlp:construct.c.page1.b_stde006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde006
            #add-point:ON ACTION controlp INFIELD b_stde006 name="construct.c.filter.page1.b_stde006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stde006()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde006  #顯示到畫面上
            NEXT FIELD b_stde006                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde007>>----
         #Ctrlp:construct.c.filter.page1.b_stde007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde007
            #add-point:ON ACTION controlp INFIELD b_stde007 name="construct.c.filter.page1.b_stde007"
            
            #END add-point
 
 
         #----<<b_stde031>>----
         #Ctrlp:construct.c.filter.page1.b_stde031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde031
            #add-point:ON ACTION controlp INFIELD b_stde031 name="construct.c.filter.page1.b_stde031"
            
            #END add-point
 
 
         #----<<b_stde008>>----
         #Ctrlp:construct.c.page1.b_stde008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde008
            #add-point:ON ACTION controlp INFIELD b_stde008 name="construct.c.filter.page1.b_stde008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde008  #顯示到畫面上
            NEXT FIELD b_stde008                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde008_desc>>----
         #----<<b_stde008_desc_desc>>----
         #----<<b_stde009>>----
         #Ctrlp:construct.c.page1.b_stde009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde009
            #add-point:ON ACTION controlp INFIELD b_stde009 name="construct.c.filter.page1.b_stde009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imay003_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde009  #顯示到畫面上
            NEXT FIELD b_stde009                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde010>>----
         #Ctrlp:construct.c.filter.page1.b_stde010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde010
            #add-point:ON ACTION controlp INFIELD b_stde010 name="construct.c.filter.page1.b_stde010"
            
            #END add-point
 
 
         #----<<b_stde011>>----
         #Ctrlp:construct.c.page1.b_stde011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde011
            #add-point:ON ACTION controlp INFIELD b_stde011 name="construct.c.filter.page1.b_stde011"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde011  #顯示到畫面上
            NEXT FIELD b_stde011                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde011_desc>>----
         #----<<b_stde012>>----
         #Ctrlp:construct.c.filter.page1.b_stde012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde012
            #add-point:ON ACTION controlp INFIELD b_stde012 name="construct.c.filter.page1.b_stde012"
            
            #END add-point
 
 
         #----<<b_stde013>>----
         #Ctrlp:construct.c.page1.b_stde013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde013
            #add-point:ON ACTION controlp INFIELD b_stde013 name="construct.c.filter.page1.b_stde013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde013  #顯示到畫面上
            NEXT FIELD b_stde013                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde013_desc>>----
         #----<<b_stde014>>----
         #Ctrlp:construct.c.page1.b_stde014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde014
            #add-point:ON ACTION controlp INFIELD b_stde014 name="construct.c.filter.page1.b_stde014"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde014  #顯示到畫面上
            NEXT FIELD b_stde014                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde014_desc>>----
         #----<<b_stde015>>----
         #Ctrlp:construct.c.page1.b_stde015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde015
            #add-point:ON ACTION controlp INFIELD b_stde015 name="construct.c.filter.page1.b_stde015"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde015  #顯示到畫面上
            NEXT FIELD b_stde015                     #返回原欄位
    


            #END add-point
 
 
         #----<<stde015_desc>>----
         #----<<b_stde016>>----
         #Ctrlp:construct.c.filter.page1.b_stde016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde016
            #add-point:ON ACTION controlp INFIELD b_stde016 name="construct.c.filter.page1.b_stde016"
            
            #END add-point
 
 
         #----<<b_stde017>>----
         #Ctrlp:construct.c.filter.page1.b_stde017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde017
            #add-point:ON ACTION controlp INFIELD b_stde017 name="construct.c.filter.page1.b_stde017"
            
            #END add-point
 
 
         #----<<b_stde018>>----
         #Ctrlp:construct.c.filter.page1.b_stde018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde018
            #add-point:ON ACTION controlp INFIELD b_stde018 name="construct.c.filter.page1.b_stde018"
            
            #END add-point
 
 
         #----<<b_stde019>>----
         #Ctrlp:construct.c.filter.page1.b_stde019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde019
            #add-point:ON ACTION controlp INFIELD b_stde019 name="construct.c.filter.page1.b_stde019"
            
            #END add-point
 
 
         #----<<b_stde020>>----
         #Ctrlp:construct.c.page1.b_stde020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde020
            #add-point:ON ACTION controlp INFIELD b_stde020 name="construct.c.filter.page1.b_stde020"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde020  #顯示到畫面上
            NEXT FIELD b_stde020                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde020_desc>>----
         #----<<b_stde021>>----
         #Ctrlp:construct.c.page1.b_stde021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde021
            #add-point:ON ACTION controlp INFIELD b_stde021 name="construct.c.filter.page1.b_stde021"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde021  #顯示到畫面上
            NEXT FIELD b_stde021                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde021_desc>>----
         #----<<b_stde022>>----
         #Ctrlp:construct.c.page1.b_stde022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde022
            #add-point:ON ACTION controlp INFIELD b_stde022 name="construct.c.filter.page1.b_stde022"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde022  #顯示到畫面上
            NEXT FIELD b_stde022                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde022_desc>>----
         #----<<b_stde023>>----
         #Ctrlp:construct.c.page1.b_stde023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde023
            #add-point:ON ACTION controlp INFIELD b_stde023 name="construct.c.filter.page1.b_stde023"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde023  #顯示到畫面上
            NEXT FIELD b_stde023                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde023_desc>>----
         #----<<b_stde024>>----
         #Ctrlp:construct.c.page1.b_stde024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde024
            #add-point:ON ACTION controlp INFIELD b_stde024 name="construct.c.filter.page1.b_stde024"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde024  #顯示到畫面上
            NEXT FIELD b_stde024                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde024_desc>>----
         #----<<b_stde025>>----
         #Ctrlp:construct.c.page1.b_stde025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde025
            #add-point:ON ACTION controlp INFIELD b_stde025 name="construct.c.filter.page1.b_stde025"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde025  #顯示到畫面上
            NEXT FIELD b_stde025                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde025_desc>>----
         #----<<b_stde026>>----
         #Ctrlp:construct.c.page1.b_stde026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde026
            #add-point:ON ACTION controlp INFIELD b_stde026 name="construct.c.filter.page1.b_stde026"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde026  #顯示到畫面上
            NEXT FIELD b_stde026                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde026_desc>>----
         #----<<b_stde027>>----
         #Ctrlp:construct.c.page1.b_stde027
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde027
            #add-point:ON ACTION controlp INFIELD b_stde027 name="construct.c.filter.page1.b_stde027"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO b_stde027  #顯示到畫面上
            NEXT FIELD b_stde027                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde027_desc>>----
         #----<<b_stde028>>----
         #Ctrlp:construct.c.page1.b_stde028
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde028
            #add-point:ON ACTION controlp INFIELD b_stde028 name="construct.c.filter.page1.b_stde028"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stdb001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde028  #顯示到畫面上
            NEXT FIELD b_stde028                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde029>>----
         #Ctrlp:construct.c.page1.b_stde029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde029
            #add-point:ON ACTION controlp INFIELD b_stde029 name="construct.c.filter.page1.b_stde029"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stde029()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stde029  #顯示到畫面上
            NEXT FIELD b_stde029                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stde030>>----
         #Ctrlp:construct.c.filter.page1.b_stde030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stde030
            #add-point:ON ACTION controlp INFIELD b_stde030 name="construct.c.filter.page1.b_stde030"
            
            #END add-point
 
 
         #----<<b_stdestus>>----
         #Ctrlp:construct.c.filter.page1.b_stdestus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stdestus
            #add-point:ON ACTION controlp INFIELD b_stdestus name="construct.c.filter.page1.b_stdestus"
            
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
   
      CALL astq730_filter_show('stde001','b_stde001')
   CALL astq730_filter_show('stde002','b_stde002')
   CALL astq730_filter_show('stde003','b_stde003')
   CALL astq730_filter_show('stde004','b_stde004')
   CALL astq730_filter_show('stde005','b_stde005')
   CALL astq730_filter_show('stde006','b_stde006')
   CALL astq730_filter_show('stde007','b_stde007')
   CALL astq730_filter_show('stde031','b_stde031')
   CALL astq730_filter_show('stde008','b_stde008')
   CALL astq730_filter_show('stde009','b_stde009')
   CALL astq730_filter_show('stde010','b_stde010')
   CALL astq730_filter_show('stde011','b_stde011')
   CALL astq730_filter_show('stde012','b_stde012')
   CALL astq730_filter_show('stde013','b_stde013')
   CALL astq730_filter_show('stde014','b_stde014')
   CALL astq730_filter_show('stde015','b_stde015')
   CALL astq730_filter_show('stde016','b_stde016')
   CALL astq730_filter_show('stde017','b_stde017')
   CALL astq730_filter_show('stde018','b_stde018')
   CALL astq730_filter_show('stde019','b_stde019')
   CALL astq730_filter_show('stde020','b_stde020')
   CALL astq730_filter_show('stde021','b_stde021')
   CALL astq730_filter_show('stde022','b_stde022')
   CALL astq730_filter_show('stde023','b_stde023')
   CALL astq730_filter_show('stde024','b_stde024')
   CALL astq730_filter_show('stde025','b_stde025')
   CALL astq730_filter_show('stde026','b_stde026')
   CALL astq730_filter_show('stde027','b_stde027')
   CALL astq730_filter_show('stde028','b_stde028')
   CALL astq730_filter_show('stde029','b_stde029')
   CALL astq730_filter_show('stde030','b_stde030')
   CALL astq730_filter_show('stdestus','b_stdestus')
 
    
   CALL astq730_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq730.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astq730_filter_parser(ps_field)
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
 
{<section id="astq730.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astq730_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq730_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astq730.insert" >}
#+ insert
PRIVATE FUNCTION astq730_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astq730.modify" >}
#+ modify
PRIVATE FUNCTION astq730_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   DEFINE  l_cmd                  LIKE type_t.chr1
   DEFINE  l_ac_t                 LIKE type_t.num5                #未取消的ARRAY CNT 
   DEFINE  l_n                    LIKE type_t.num5                #檢查重複用  
   DEFINE  l_cnt                  LIKE type_t.num5                #檢查重複用  
   DEFINE  l_lock_sw              LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert         LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete         LIKE type_t.num5                #可刪除否  
   DEFINE  l_count                LIKE type_t.num5
   DEFINE  l_i                    LIKE type_t.num5
   DEFINE  ls_return              STRING
   DEFINE  l_var_keys             DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys           DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                 DYNAMIC ARRAY OF STRING
   DEFINE  l_fields               DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak         DYNAMIC ARRAY OF STRING
   DEFINE  li_reproduce           LIKE type_t.num5
   DEFINE  li_reproduce_target    LIKE type_t.num5
   DEFINE  lb_reproduce           BOOLEAN
   DEFINE  l_sql                  STRING
   DEFINE  r_success              LIKE type_t.num5
   DEFINE  r_errno                LIKE type_t.chr50
   DEFINE  l_stdb002              LIKE stdb_t.stdb002
   DEFINE  l_stdb007              LIKE stdb_t.stdb007
   DEFINE  l_stdbstus             LIKE stdb_t.stdbstus
   #end add-point
 
   #add-point:modify段control name="modify.control"
   LET g_action_choice = ""

   LET g_qryparam.state = "i"
   
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   LET INT_FLAG = FALSE
   LET lb_reproduce = FALSE
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      INPUT ARRAY g_stde_d FROM s_detail1.*
         ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
                  
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stde_d.getLength()+1) 
              LET g_insert = 'N' 
            END IF 
 
            CALL astq730_b_fill()
            LET g_detail_cnt = g_stde_d.getLength()
         
         BEFORE ROW
            #add-point:modify段before row

            #end add-point  
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            LET l_cmd = ''
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_stde_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_stde_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_stde_d[l_ac].stde006 IS NOT NULL
               AND g_stde_d[l_ac].stde007 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stde_d_t.* = g_stde_d[l_ac].*  #BACKUP
#               IF g_stde_d[l_ac].stdestus = '0' THEN
#                  CALL cl_set_comp_entry("stde028",TRUE)
#               ELSE
#                  CALL cl_set_comp_entry("stde028",FALSE)
#               END IF
#               IF NOT astq730_lock_b("stde_t") THEN
#                  LET l_lock_sw='Y'
#               ELSE
#                  FETCH astq730_bcl INTO g_stde_d[l_ac].stde001,g_stde_d[l_ac].stde002,g_stde_d[l_ac].stde003, 
#                                         g_stde_d[l_ac].stde004,g_stde_d[l_ac].stde005,g_stde_d[l_ac].stde006,g_stde_d[l_ac].stde007,g_stde_d[l_ac].stde008, 
#                                         g_stde_d[l_ac].stde009,g_stde_d[l_ac].stde010,g_stde_d[l_ac].stde011,g_stde_d[l_ac].stde012,g_stde_d[l_ac].stde013, 
#                                         g_stde_d[l_ac].stde014,g_stde_d[l_ac].stde015,g_stde_d[l_ac].stde016,g_stde_d[l_ac].stde017,g_stde_d[l_ac].stde018, 
#                                         g_stde_d[l_ac].stde019,g_stde_d[l_ac].stde020,g_stde_d[l_ac].stde021,g_stde_d[l_ac].stde022,g_stde_d[l_ac].stde023, 
#                                         g_stde_d[l_ac].stde024,g_stde_d[l_ac].stde025,g_stde_d[l_ac].stde026,g_stde_d[l_ac].stde027,g_stde_d[l_ac].stde028, 
#                                         g_stde_d[l_ac].stde029,g_stde_d[l_ac].stde030,g_stde_d[l_ac].stdestus
#                  IF SQLCA.sqlcode THEN
#                     INITIALIZE g_errparam TO NULL 
#                     LET g_errparam.extend = g_stde_d_t.stde006 
#                     LET g_errparam.code   = SQLCA.sqlcode 
#                     LET g_errparam.popup  = TRUE 
#                     CALL cl_err()
# 
#                     LET l_lock_sw = "Y"
#                  END IF
#                  
#                  CALL astq730_detail_show("'1'") 
#                  CALL cl_show_fld_cont()
#               END IF
            ELSE
               EXIT DIALOG
            END IF
            #add-point:modify段before row

            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
        
#         BEFORE INSERT
#            
#            CALL s_transaction_begin()
#            LET l_n = ARR_COUNT()
#            LET l_cmd = 'a'
#            INITIALIZE g_stau_d_t.* TO NULL
#            INITIALIZE g_stau_d_o.* TO NULL
#            INITIALIZE g_stau_d[l_ac].* TO NULL 
#            #公用欄位給值(單身)
#            #此段落由子樣板a14產生    
#      #公用欄位新增給值
#      LET g_stau2_d[l_ac].stauownid = g_user
#      LET g_stau2_d[l_ac].stauowndp = g_dept
#      LET g_stau2_d[l_ac].staucrtid = g_user
#      LET g_stau2_d[l_ac].staucrtdp = g_dept 
#      LET g_stau2_d[l_ac].staucrtdt = cl_get_current()
#      LET g_stau2_d[l_ac].staumodid = ""
#      LET g_stau2_d[l_ac].staumoddt = ""
# 
# 
#                  LET g_stau_d[l_ac].stau002 = "1"
# 
#            #add-point:modify段before備份
#
#            #end add-point
#            LET g_stau_d_t.* = g_stau_d[l_ac].*     #新輸入資料
#            LET g_stau_d_o.* = g_stau_d[l_ac].*     #新輸入資料
#            CALL cl_show_fld_cont()
#            CALL asti206_set_entry_b("a")
#            CALL asti206_set_no_entry_b("a")
#            IF lb_reproduce THEN
#               LET lb_reproduce = FALSE
#               LET g_stau_d[li_reproduce_target].* = g_stau_d[li_reproduce].*
#               LET g_stau2_d[li_reproduce_target].* = g_stau2_d[li_reproduce].*
# 
#               LET g_stau_d[g_stau_d.getLength()].stausite = NULL
#               LET g_stau_d[g_stau_d.getLength()].stau001 = NULL
# 
#            END IF
#            
#            #add-point:modify段before insert
#            LET g_stau_d[l_ac].stau003 = g_today
#            #end add-point  
#  
#         AFTER INSERT
#            IF INT_FLAG THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = '' 
#               LET g_errparam.code   = 9001 
#               LET g_errparam.popup  = FALSE 
#               CALL cl_err()
# 
#               LET INT_FLAG = 0
#               CANCEL INSERT
#            END IF
#               
#            LET l_count = 1  
#            SELECT COUNT(*) INTO l_count FROM stau_t 
#             WHERE stauent = g_enterprise AND stausite = g_stau_d[l_ac].stausite
#                                       AND stau001 = g_stau_d[l_ac].stau001
# 
#                
#            #資料未重複, 插入新增資料
#            IF l_count = 0 THEN 
#               #add-point:單身新增前
#
#               #end add-point
#            
#                              INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_stau_d[g_detail_idx].stausite
#               LET gs_keys[2] = g_stau_d[g_detail_idx].stau001
#               CALL asti206_insert_b('stau_t',gs_keys,"'1'")
#                           
#               #add-point:單身新增後
#
#               #end add-point
#            ELSE    
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = 'INSERT' 
#               LET g_errparam.code   = "std-00006" 
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()
# 
#               INITIALIZE g_stau_d[l_ac].* TO NULL
#               CALL s_transaction_end('N','0')
#               CANCEL INSERT
#            END IF
# 
#            IF SQLCA.SQLcode  THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = "stau_t" 
#               LET g_errparam.code   = SQLCA.sqlcode 
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()
# 
#               CALL s_transaction_end('N','0')                    
#               CANCEL INSERT
#            ELSE
#               #先刷新資料
#               #CALL asti206_b_fill(g_wc2)
#               #資料多語言用-增/改
#               
#               #add-point:input段-after_insert
#
#               #end add-point
#               CALL s_transaction_end('Y','0')
#               ERROR 'INSERT O.K'
#               LET g_detail_cnt = g_detail_cnt + 1
#               
#               LET g_wc2 = g_wc2, " OR (stausite = '", g_stau_d[l_ac].stausite, "' "
#                                  ," AND stau001 = '", g_stau_d[l_ac].stau001, "' "
# 
#                                  ,")"
#            END IF                
              
#         BEFORE DELETE                            #是否取消單身
#            IF l_cmd = 'a' THEN
#               LET l_cmd='d'
#            ELSE
#               #add-point:單身刪除ask前
#
#               #end add-point   
#               
#               IF NOT cl_ask_del_detail() THEN
#                  CANCEL DELETE
#               END IF
#               IF l_lock_sw = "Y" THEN
#                  INITIALIZE g_errparam TO NULL 
#                  LET g_errparam.extend = "" 
#                  LET g_errparam.code   = -263 
#                  LET g_errparam.popup  = TRUE 
#                  CALL cl_err()
# 
#                  CANCEL DELETE
#               END IF
#               
#               #add-point:單身刪除前
#
#               #end add-point   
#               
#               DELETE FROM stau_t
#                WHERE stauent = g_enterprise AND 
#                      stausite = g_stau_d_t.stausite
#                      AND stau001 = g_stau_d_t.stau001
# 
#                      
#               #add-point:單身刪除中
#
#               #end add-point  
#                      
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL 
#                  LET g_errparam.extend = "stau_t" 
#                  LET g_errparam.code   = SQLCA.sqlcode 
#                  LET g_errparam.popup  = TRUE 
#                  CALL cl_err()
# 
#                  CALL s_transaction_end('N','0')
#                  CANCEL DELETE   
#               ELSE
#                  LET g_detail_cnt = g_detail_cnt-1
#                  
#                  #add-point:單身刪除後
#
#                  #end add-point
#                  CALL s_transaction_end('Y','0')
#               END IF 
#               CLOSE asti206_bcl
#               LET l_count = g_stau_d.getLength()
#                              INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_stau_d[g_detail_idx].stausite
#               LET gs_keys[2] = g_stau_d[g_detail_idx].stau001
# 
#               #+ 此段落由子樣板a47產生
#      #刪除相關文件
#      CALL asti206_set_pk_array()
#      #add-point:相關文件刪除前
#
#      #end add-point   
#      CALL cl_doc_remove()  
# 
# 
#            END IF 
#              
#         AFTER DELETE 
#		    IF l_cmd <> 'd' THEN
#               #add-point:單身刪除後2
#
#               #end add-point
#                              CALL asti206_delete_b('stau_t',gs_keys,"'1'")
#			END IF
#            #如果是最後一筆
#            IF l_ac = (g_stau_d.getLength() + 1) THEN
#               CALL FGL_SET_ARR_CURR(l_ac-1)
#            END IF
 
                  #此段落由子樣板a02產生
         AFTER FIELD b_stde028
            
            #add-point:AFTER FIELD stausite
            IF NOT cl_null(g_stde_d[l_ac].stde028) THEN
#               SELECT COUNT(*) INTO l_n
#                 FROM stdb_t
#                WHERE stdbent = g_enterprise
#                  AND stdb001 = g_stde_d[l_ac].stde028
#                  AND stdb005 = g_stde_d[l_ac].stde024
#                  AND stdb006 = g_stde_d[l_ac].stde021
#                  AND stdb002 = g_stde_d[l_ac].stde001
#                  AND stdb003 = g_stde_d[l_ac].stde003
#                  AND stdbstus = 'Y'
#               IF l_n < 1 THEN
#                  INITIALIZE g_errparam TO NULL 
#                  LET g_errparam.extend = g_stde_d[l_ac].stde028
#                  LET g_errparam.code   = 'ast-00129'
#                  LET g_errparam.popup  = TRUE
#                  CALL cl_err()
#                  LET g_stde_d[l_ac].stde028 = g_stde_d_t.stde028
#                  NEXT FIELD b_stde028
#               END IF
               CALL s_asti701_stdb001_chk(g_stde_d[l_ac].stde028,g_stde_d[l_ac].stde001,g_stde_d[l_ac].stde024,g_stde_d[l_ac].stde021,g_stde_d[l_ac].stde023,g_stde_d[l_ac].stde020,g_stde_d[l_ac].stde003,'1')
                  RETURNING r_success,r_errno
               IF NOT r_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stde_d[l_ac].stde028
                  LET g_errparam.code   = r_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stde_d[l_ac].stde028 = g_stde_d_t.stde028
                  DISPLAY BY NAME g_stde_d[l_ac].stde028
                  NEXT FIELD b_stde028
               END IF
               
               SELECT stdb007 INTO l_stdb007
                 FROM stdb_t
                WHERE stdbent = g_enterprise
                  AND stdb001 = g_stde_d[l_ac].stde028
               IF l_stdb007 = '1' THEN
                  IF cl_ask_confirm('ast-00206') THEN
                     CALL s_transaction_begin()
                     LET g_stde_d[l_ac].stdestus = '2'
                     LET l_stdb002 = ''
                     SELECT stdb002 INTO l_stdb002
                       FROM stdb_t
                      WHERE stdbent = g_enterprise
                        AND stdb001 = g_stde_d[l_ac].stde028
                    #SELECT stdd001 INTO l_stdb002
                    #  FROM stdd_t 
                    # WHERE stddent = g_enterprise 
                    #   AND ((stdd004 = g_stde_d[l_ac].stde021 AND stdd005 = g_stde_d[l_ac].stde024) OR (stdd005 = g_stde_d[l_ac].stde021 AND stdd004 = g_stde_d[l_ac].stde024))
                     UPDATE stde_t SET stde028 = g_stde_d[l_ac].stde028,
                                       stde001 = l_stdb002,
                                       stdestus = g_stde_d[l_ac].stdestus
                      WHERE stdeent = g_enterprise 
                        AND stde006 = g_stde_d_t.stde006  
                        AND stde007 = g_stde_d_t.stde007
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "stde_t" 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        CALL s_transaction_end('N','0')
                        LET g_stde_d[l_ac].stde028 = g_stde_d_t.stde028
                        LET g_stde_d[l_ac].stde001 = g_stde_d_t.stde001
                        LET g_stde_d[l_ac].stdestus = g_stde_d_t.stdestus
                        DISPLAY BY NAME g_stde_d[l_ac].stde028,g_stde_d[l_ac].stde001,g_stde_d[l_ac].stdestus
                        NEXT FIELD b_stde028
                     END IF
                     #产生虚拟异动档(對應交易頻率為1.實時)
                     #CALL s_astp731_inaj_pro('s',g_stde_d[l_ac].stde003,g_stde_d[l_ac].stde006,g_stde_d[l_ac].stde007,'') RETURNING r_success #mark by geza 20151116
                     CALL s_astp731_inaj_pro('s',g_stde_d[l_ac].stde003,g_stde_d[l_ac].stde006,g_stde_d[l_ac].stde007,g_stde_d[l_ac].stde031,'') RETURNING r_success  #add by geza 20151116 增加项序
                     IF NOT r_success THEN
                        CALL s_transaction_end('N','0')
                        LET g_stde_d[l_ac].stde028 = g_stde_d_t.stde028
                        LET g_stde_d[l_ac].stde001 = g_stde_d_t.stde001
                        LET g_stde_d[l_ac].stdestus = g_stde_d_t.stdestus
                        DISPLAY BY NAME g_stde_d[l_ac].stde028,g_stde_d[l_ac].stde001,g_stde_d[l_ac].stdestus
                        NEXT FIELD b_stde028
                     END IF
                  ELSE
                     LET g_stde_d[l_ac].stde028 = g_stde_d_t.stde028
                     DISPLAY BY NAME g_stde_d[l_ac].stde028
                     NEXT FIELD b_stde028                 
                  END IF
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD b_stde028
            #add-point:BEFORE FIELD stausite
            IF g_stde_d[l_ac].stdestus <> '0' THEN
               NEXT FIELD b_stde029
            END IF
            IF cl_null(g_stde_d[l_ac].stde028) THEN
               CALL s_asti701_stdb001_get(g_stde_d[l_ac].stde001,g_stde_d[l_ac].stde003,'1',g_stde_d[l_ac].stde024,g_stde_d[l_ac].stde021)
                  RETURNING g_stde_d[l_ac].stde028,g_stde_d[l_ac].stde001
               DISPLAY g_stde_d[l_ac].stde028 TO b_stde028
               DISPLAY g_stde_d[l_ac].stde001 TO b_stde001
            END IF
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE b_stde028
            #add-point:ON CHANGE stausite

            #END add-point
 

         ON ACTION controlp INFIELD b_stde028
            #add-point:ON ACTION controlp INFIELD stausite
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stde_d[l_ac].stde028             #給予default值
            #給予arg
            LET g_qryparam.where = " stdb005 = '",g_stde_d[l_ac].stde024,"' AND stdb006 = '",g_stde_d[l_ac].stde021,"' ",
                                   " AND stdb003 = '",g_stde_d[l_ac].stde003,"' "
#                                   " AND stdb002 = '",g_stde_d[l_ac].stde001,"' AND stdb003 = '",g_stde_d[l_ac].stde003,"' "

            
            CALL q_stdb001()                                #呼叫開窗

            LET g_stde_d[l_ac].stde028 = g_qryparam.return1              
            DISPLAY g_stde_d[l_ac].stde028 TO b_stde028              #
            NEXT FIELD b_stde028                         #返回原欄位


            #END add-point
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
 
               LET INT_FLAG = 0
               LET g_stde_d[l_ac].* = g_stde_d_t.*
               CLOSE astq730_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stde_d[l_ac].stde006 
               LET g_errparam.code   = -263 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
 
               LET g_stde_d[l_ac].* = g_stde_d_t.*
            ELSE
               
               #寫入修改者/修改日期資訊(單身)
            
               #add-point:單身修改前
               LET l_stdb002 = ''
               SELECT stdb002 INTO l_stdb002
                 FROM stdb_t
                WHERE stdbent = g_enterprise
                  AND stdb001 = g_stde_d[l_ac].stde028
               #end add-point
               
               UPDATE stde_t SET stde028 = g_stde_d[l_ac].stde028,
                                 stde001 = l_stdb002,
                                 stdestus = g_stde_d[l_ac].stdestus
                WHERE stdeent = g_enterprise AND
                  stde006 = g_stde_d_t.stde006  
                  AND stde007 = g_stde_d_t.stde007  
 
                  
               #add-point:單身修改中

               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stde_t" 
                     LET g_errparam.code   = "std-00009" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                    WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stde_t" 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                  OTHERWISE                    

               END CASE
               
               #add-point:單身修改後

               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astq730_unlock_b("stde_t")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
             #add-point:單身after row

            #end add-point
            
         AFTER INPUT
            #add-point:單身input後

            #end add-point
            
         ON ACTION controlo   
            CALL FGL_SET_ARR_CURR(g_stde_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_stde_d.getLength()+1
            
      END INPUT
      
      #add-point:before_more_input

      #end add-point
      
      BEFORE DIALOG 
#         IF g_temp_idx > 0 THEN
#            LET l_ac = g_temp_idx
#            CALL DIALOG.setCurrentRow("s_detail1",l_ac)
#            LET g_temp_idx = 1
#         END IF
         LET g_curr_diag = ui.DIALOG.getCurrent()
         #add-point:before_dialog

         #end add-point
#         CASE g_aw
#            WHEN "s_detail1"
#               NEXT FIELD stde001
# 
#         END CASE
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
   
   #add-point:modify段修改後
   CALL astq730_b_fill()
   #end add-point
 
   CLOSE astq730_bcl
   CALL s_transaction_end('Y','0')
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq730.reproduce" >}
#+ reproduce
PRIVATE FUNCTION astq730_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq730.delete" >}
#+ delete
PRIVATE FUNCTION astq730_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq730.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq730_detail_action_trans()
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
 
{<section id="astq730.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq730_detail_index_setting()
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
            IF g_stde_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stde_d.getLength() AND g_stde_d.getLength() > 0
            LET g_detail_idx = g_stde_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stde_d.getLength() THEN
               LET g_detail_idx = g_stde_d.getLength()
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
 
{<section id="astq730.mask_functions" >}
 &include "erp/ast/astq730_mask.4gl"
 
{</section>}
 
{<section id="astq730.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 锁资料
# Memo...........:
# Usage..........: CALL astq730_lock_b(ps_table)
# Date & Author..: 20140723 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astq730_lock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define

   #end add-point
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "stde_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astq730_bcl USING g_enterprise,g_stde_d[g_detail_idx].stde006,g_stde_d[g_detail_idx].stde007

                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astq730_bcl" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         RETURN FALSE
      END IF
   
   END IF                                 
   
   RETURN TRUE
   
END FUNCTION

################################################################################
# Descriptions...: 解锁
# Memo...........:
# Usage..........: CALL astq730_unlock_b(ps_table)
# Date & Author..: 20140723 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astq730_unlock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define

   #end add-point  
   
   LET ls_group = ""
   
   #IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE astq730_bcl
   #END IF
   
END FUNCTION

 
{</section>}
 
