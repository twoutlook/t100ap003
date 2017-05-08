#該程式未解開Section, 採用最新樣板產出!
{<section id="astq505.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:5(2016-09-14 09:50:29), PR版次:0005(2016-09-14 09:26:59)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000039
#+ Filename...: astq505
#+ Description: 專櫃銷售成本月匯總查詢作業
#+ Creator....: 06137(2015-05-11 16:55:03)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq505.global" >}
#應用 q01 樣板自動產生(Version:34)
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
PRIVATE TYPE type_g_stge_d RECORD
       
       sel LIKE type_t.chr1, 
   stge001 LIKE stge_t.stge001, 
   stge002 LIKE stge_t.stge002, 
   stge002_desc LIKE type_t.chr500, 
   stge003 LIKE stge_t.stge003, 
   stge003_desc LIKE type_t.chr500, 
   stge004 LIKE stge_t.stge004, 
   stge004_desc LIKE type_t.chr500, 
   stge005 LIKE stge_t.stge005, 
   stge005_desc LIKE type_t.chr500, 
   stge006 LIKE stge_t.stge006, 
   stfa050 LIKE stfa_t.stfa050, 
   stgesite LIKE stge_t.stgesite, 
   stge007 LIKE stge_t.stge007, 
   stge008 LIKE stge_t.stge008, 
   stge009 LIKE stge_t.stge009, 
   stge010 LIKE stge_t.stge010, 
   stge011 LIKE stge_t.stge011, 
   stge012 LIKE stge_t.stge012, 
   stge013 LIKE stge_t.stge013, 
   stge014 LIKE stge_t.stge014, 
   stge020 LIKE stge_t.stge020, 
   stge021 LIKE stge_t.stge021, 
   stge019 LIKE stge_t.stge019, 
   l_sum LIKE type_t.num20_6, 
   stge015 LIKE stge_t.stge015, 
   stge016 LIKE stge_t.stge016, 
   stge017 LIKE stge_t.stge017, 
   stge018 LIKE stge_t.stge018, 
   stge022 LIKE stge_t.stge022, 
   stgeunit LIKE stge_t.stgeunit
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sql_sum   STRING #LANJJ ADD ON 2016-02-17 
DEFINE sum_astq505 LIKE type_t.num20_6 #LANJJ ADD ON 2016-02-17 
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stge_d            DYNAMIC ARRAY OF type_g_stge_d
DEFINE g_stge_d_t          type_g_stge_d
 
 
 
 
DEFINE g_wc                  STRING                        #儲存 user 的查詢條件
DEFINE g_wc_t                STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                 STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
DEFINE g_sql                 STRING                        #組 sql 用 
DEFINE g_forupd_sql          STRING                        #SELECT ... FOR UPDATE  SQL    
DEFINE g_cnt                 LIKE type_t.num10              
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_current_page        LIKE type_t.num5              #目前所在頁數
DEFINE g_current_row         LIKE type_t.num10             #目前所在筆數
DEFINE g_current_idx         LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_page                STRING                        #第幾頁
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_error_show          LIKE type_t.num5
DEFINE g_row_index           LIKE type_t.num10
DEFINE g_master_idx          LIKE type_t.num10
DEFINE g_detail_idx          LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_idx2         LIKE type_t.num10
DEFINE g_hyper_url           STRING                        #hyperlink的主要網址
DEFINE g_qbe_hidden          LIKE type_t.num5              #qbe頁籤折疊
DEFINE g_tot_cnt             LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page         LIKE type_t.num10             #每頁筆數
DEFINE g_page_act_list       STRING                        #分頁ACTION清單
DEFINE g_current_row_tot     LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_start_num      LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num        LIKE type_t.num10             #目前頁面結束筆數
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
DEFINE g_wc_filter_table           STRING
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astq505.main" >}
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
   DECLARE astq505_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq505_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq505_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq505 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq505_init()   
 
      #進入選單 Menu (="N")
      CALL astq505_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq505
      
   END IF 
   
   CLOSE astq505_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #add by dengdd 151020
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq505.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astq505_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success  LIKE type_t.num5
   #end add-point
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1" 
   LET g_error_show  = 1
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   
      CALL cl_set_combo_scc('b_stge006','6013') 
  
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('stge006','6013')

   CALL s_aooi500_create_temp() RETURNING l_success #add by dengdd 151020
   #end add-point
 
   CALL astq505_default_search()
END FUNCTION
 
{</section>}
 
{<section id="astq505.default_search" >}
PRIVATE FUNCTION astq505_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stgesite = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stge001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stge002 = '", g_argv[03], "' AND "
   END IF
 
 
 
 
 
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astq505_ui_dialog() 
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit   LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10
   DEFINE ls_result STRING
   DEFINE ls_wc     STRING
   DEFINE lc_action_choice_old   STRING
   DEFINE ls_js     STRING
   DEFINE la_param  RECORD
                    prog       STRING,
                    actionid   STRING,
                    background LIKE type_t.chr1,
                    param      DYNAMIC ARRAY OF STRING
                    END RECORD
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
 
   LET li_exit = FALSE
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   LET g_current_idx = 1
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   LET g_current_row_tot = 0
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   LET l_ac = 1
 
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   
   CALL astq505_b_fill()
  
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stge_d.clear()
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 0
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL astq505_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON stge001,stge002,stge003,stge006,
                                   stge004,stge005,stgesite,mhae035 #lanjj add mhae035 on 2016-07-18
                                   
               
            #專櫃編號            
            ON ACTION controlp INFIELD stge002
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_mhae001()
               DISPLAY g_qryparam.return1 TO stge002
               NEXT FIELD stge002
            
            #供應商編號   
            ON ACTION controlp INFIELD stge003
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #160913-00034#2 -S
               #CALL q_pmaa001()                           #呼叫開窗            
               LET g_qryparam.arg1 = "('3')"            
               CALL q_pmaa001_1()                           #呼叫開窗
               #160913-00034#2 -E
               DISPLAY g_qryparam.return1 TO stge003
               NEXT FIELD stge003
            
            #樓層編號
            ON ACTION controlp INFIELD stge004
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_mhab002()
               DISPLAY g_qryparam.return1 TO stge004
               NEXT FIELD stge004  
               
            #經營品類
            ON ACTION controlp INFIELD stge005
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_rtax001()
               DISPLAY g_qryparam.return1 TO stge005
               NEXT FIELD stge005  

            #營運組織
            ON ACTION controlp INFIELD stgesite #營運組織
			      INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgesite',g_site,'c') 
               CALL q_ooef001_24()
               DISPLAY g_qryparam.return1 TO stgesite
               NEXT FIELD stgesite  


         END CONSTRUCT  
         #end add-point
     
         DISPLAY ARRAY g_stge_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL astq505_detail_action_trans()
 
               LET g_master_idx = l_ac
               #為避免按上下筆時影響執行效能，所以做一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq505_b_fill2()
               LET g_action_choice = lc_action_choice_old
 
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point
 
            
 
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
 
         #add-point:第一頁籤程式段mark結束用 name="ui_dialog.page1.mark.end"
         
         #end add-point
 
 
 
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
 
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq505_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
            NEXT FIELD stge001
 
         AFTER DIALOG
            #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
            
            #end add-point
            
         ON ACTION exit
            LET g_action_choice="exit"
            LET INT_FLAG = FALSE
            LET li_exit = TRUE
            EXIT DIALOG 
      
         ON ACTION close
            LET INT_FLAG=FALSE
            LET li_exit = TRUE
            EXIT DIALOG
 
         ON ACTION accept
            INITIALIZE g_wc_filter TO NULL
            IF cl_null(g_wc) THEN
               LET g_wc = " 1=1"
            END IF
 
 
         
            IF cl_null(g_wc2) THEN
               LET g_wc2 = " 1=1"
            END IF
 
 
 
            #add-point:ON ACTION accept name="ui_dialog.accept"
            
            #end add-point
 
            LET g_detail_idx = 1
            LET g_detail_idx2 = 1
            CALL astq505_b_fill()
 
            IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = -100
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            END IF
 
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #end add-point
            CALL cl_user_overview()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stge_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
         ON ACTION datarefresh   # 重新整理
            CALL astq505_b_fill()
 
         ON ACTION qbehidden     #qbe頁籤折疊
            IF g_qbe_hidden THEN
               CALL gfrm_curr.setElementHidden("qbe",0)
               CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
               LET g_qbe_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            CALL astq505_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq505_b_fill()
 
         ON ACTION detail_next               #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq505_b_fill()
 
         ON ACTION detail_last               #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq505_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stge_d.getLength()
               LET g_stge_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stge_d.getLength()
               LET g_stge_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stge_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stge_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stge_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stge_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         #應用 qs16 樣板自動產生(Version:3)
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq505_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
            #END add-point
            EXIT DIALOG
 
 
 
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               
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
 
 
 
 
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         ON ACTION qbeclear   # 條件清除
            CLEAR FORM
            #add-point:條件清除後 name="ui_dialog.qbeclear"
            
            #end add-point
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point
 
      END DIALOG 
   
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq505_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE l_pid           LIKE type_t.chr50
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where           STRING 
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stgesite') RETURNING l_where
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
 
   LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter, cl_sql_auth_filter()   #(ver:34) add cl_sql_auth_filter()
 
   CALL g_stge_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   LET ls_wc = ls_wc CLIPPED," AND ",l_where
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1
 
   # b_fill段sql組成及FOREACH撰寫
   #應用 qs04 樣板自動產生(Version:9)
   #+ b_fill段資料取得(包含sql組成及FOREACH段撰寫)
   LET ls_sql_rank = "SELECT  UNIQUE '',stge001,stge002,'',stge003,'',stge004,'',stge005,'',stge006, 
       '',stgesite,stge007,stge008,stge009,stge010,stge011,stge012,stge013,stge014,stge020,stge021,stge019, 
       '',stge015,stge016,stge017,stge018,stge022,stgeunit  ,DENSE_RANK() OVER( ORDER BY stge_t.stgesite, 
       stge_t.stge001,stge_t.stge002) AS RANK FROM stge_t",
 
 
                     "",
                     " WHERE stgeent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stge_t"),
                     " ORDER BY stge_t.stgesite,stge_t.stge001,stge_t.stge002"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   LET ls_wc = ls_wc CLIPPED," AND ",l_where  #add by dengdd 151020
   LET ls_sql_rank = "SELECT  UNIQUE 'N',stge001,stge002,mhael023,stge003,pmaal004,stge004,mhabl004,stge005,rtaxl003,stge006,mhae035, 
       stgesite,stge007,stge008,stge009,stge010,stge011,stge012,stge013,stge014,stge020,stge021,stge019,(stge011+stge012+stge013+stge014+stge020+stge021+stge019) l_sum,stge015,stge016,stge017, 
       stge018,stge022,stgeunit  ,DENSE_RANK() OVER( ORDER BY stge_t.stgesite, 
       stge_t.stge001,stge_t.stge002) AS RANK FROM stge_t", #lanjj add mhae035 on 2016-07-18
                     "       LEFT JOIN mhae_t  ON stgeent = mhaeent  AND stgesite = mhaesite  AND stge002  = mhae001                                  ",       
                     "       LEFT JOIN mhael_t ON mhaeent = mhaelent AND mhaesite = mhaelsite AND mhae001  = mhael001 AND mhael022 = '"||g_dlang||"'  ",                     
                     "       LEFT JOIN pmaal_t ON stgeent = pmaalent AND stge003  = pmaal001  AND pmaal002 = '"||g_dlang||"'                          ",
                     "       LEFT JOIN mhabl_t ON mhaeent = mhablent AND mhae020  = mhabl001  AND mhae021  = mhabl002 AND mhabl003 = '"||g_dlang||"'  ",
                     "       LEFT JOIN rtaxl_t ON stgeent = rtaxlent AND stge005  = rtaxl001  AND rtaxl002 = '"||g_dlang||"'                          ",
                     "",
                     " WHERE stgeent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stge_t"),
                     " ORDER BY stge_t.stgesite,stge_t.stge001,stge_t.stge002"
   #end add-point
 
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"
 
   PREPARE b_fill_cnt_pre FROM g_sql  #總筆數
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
 
   LET g_sql = "SELECT '',stge001,stge002,'',stge003,'',stge004,'',stge005,'',stge006,'',stgesite,stge007, 
       stge008,stge009,stge010,stge011,stge012,stge013,stge014,stge020,stge021,stge019,'',stge015,stge016, 
       stge017,stge018,stge022,stgeunit",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   #LANJJ ADD ON 2016-02-17 单头增加全部成本的汇总显示 ---start---
   LET g_sql_sum = "SELECT SUM(stge011)+SUM(stge012)+SUM(stge013)+SUM(stge014)
                          +SUM(stge015)+SUM(stge016)+SUM(stge017)+SUM(stge018)
                          +SUM(stge019)+SUM(stge020)+SUM(stge021)+SUM(stge022)",
                   "  FROM (",ls_sql_rank,")"
   PREPARE astq505_SUM FROM g_sql_sum
   EXECUTE astq505_SUM INTO sum_astq505 USING g_enterprise
   DISPLAY BY NAME sum_astq505
   #LANJJ ADD ON 2016-02-17 单头增加全部成本的汇总显示 ----end----
   
   LET g_sql = "SELECT 'N'       ,stge001  ,stge002   ,mhael023   ,stge003   , 
                       pmaal004  ,stge004  ,mhabl004  ,stge005    ,rtaxl003  ,
                       stge006   ,mhae035  ,stgesite  ,stge007    ,stge008   ,stge009   ,
                       stge010   ,stge011  ,stge012   ,stge013    ,stge014   ,
                       stge020   ,stge021  ,stge019   ,l_sum      ,stge015   ,
                       stge016   ,stge017  ,stge018   ,stge022    ,stgeunit", 
                       #lanjj add on 2016-02-23 l_sum = (stge011+stge012+stge013+stge014+stge020+stge021+stge019)
                       #lanjj add on 2016-07-18 mhae035
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq505_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq505_pb
 
   OPEN b_fill_curs USING g_enterprise
 
   FOREACH b_fill_curs INTO g_stge_d[l_ac].sel,g_stge_d[l_ac].stge001,g_stge_d[l_ac].stge002,g_stge_d[l_ac].stge002_desc, 
       g_stge_d[l_ac].stge003,g_stge_d[l_ac].stge003_desc,g_stge_d[l_ac].stge004,g_stge_d[l_ac].stge004_desc, 
       g_stge_d[l_ac].stge005,g_stge_d[l_ac].stge005_desc,g_stge_d[l_ac].stge006,g_stge_d[l_ac].stfa050, 
       g_stge_d[l_ac].stgesite,g_stge_d[l_ac].stge007,g_stge_d[l_ac].stge008,g_stge_d[l_ac].stge009, 
       g_stge_d[l_ac].stge010,g_stge_d[l_ac].stge011,g_stge_d[l_ac].stge012,g_stge_d[l_ac].stge013,g_stge_d[l_ac].stge014, 
       g_stge_d[l_ac].stge020,g_stge_d[l_ac].stge021,g_stge_d[l_ac].stge019,g_stge_d[l_ac].l_sum,g_stge_d[l_ac].stge015, 
       g_stge_d[l_ac].stge016,g_stge_d[l_ac].stge017,g_stge_d[l_ac].stge018,g_stge_d[l_ac].stge022,g_stge_d[l_ac].stgeunit 
 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      
      #end add-point
 
      CALL astq505_detail_show("'1'")
 
      CALL astq505_stge_t_mask()
 
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
 
 
 
 
 
   #應用 qs05 樣板自動產生(Version:4)
   #+ b_fill段其他table資料取得(包含sql組成及資料填充)
 
 
 
 
 
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
 
   CALL g_stge_d.deleteElement(g_stge_d.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
 
   LET g_error_show = 0
 
   LET g_detail_cnt = g_stge_d.getLength()
   LET l_ac = g_cnt
   LET g_cnt = 0
 
   #應用 qs06 樣板自動產生(Version:3)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs
   FREE astq505_pb
 
 
 
 
 
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq505_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq505_detail_action_trans()
 
   LET l_ac = 1
   IF g_stge_d.getLength() > 0 THEN
      CALL astq505_b_fill2()
   END IF
 
      CALL astq505_filter_show('stge001','b_stge001')
   CALL astq505_filter_show('stge002','b_stge002')
   CALL astq505_filter_show('stge003','b_stge003')
   CALL astq505_filter_show('stge004','b_stge004')
   CALL astq505_filter_show('stge005','b_stge005')
   CALL astq505_filter_show('stge006','b_stge006')
   CALL astq505_filter_show('stfa050','b_stfa050')
   CALL astq505_filter_show('stgesite','b_stgesite')
   CALL astq505_filter_show('stge007','b_stge007')
   CALL astq505_filter_show('stge008','b_stge008')
   CALL astq505_filter_show('stge009','b_stge009')
   CALL astq505_filter_show('stge010','b_stge010')
   CALL astq505_filter_show('stge011','b_stge011')
   CALL astq505_filter_show('stge012','b_stge012')
   CALL astq505_filter_show('stge013','b_stge013')
   CALL astq505_filter_show('stge014','b_stge014')
   CALL astq505_filter_show('stge020','b_stge020')
   CALL astq505_filter_show('stge021','b_stge021')
   CALL astq505_filter_show('stge019','b_stge019')
   CALL astq505_filter_show('stge015','b_stge015')
   CALL astq505_filter_show('stge016','b_stge016')
   CALL astq505_filter_show('stge017','b_stge017')
   CALL astq505_filter_show('stge018','b_stge018')
   CALL astq505_filter_show('stge022','b_stge022')
   CALL astq505_filter_show('stgeunit','b_stgeunit')
 
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq505_b_fill2()
   #add-point:b_fill2段define-客製 name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:b_fill2段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="b_fill2.before_function"
   
   #end add-point
 
   LET li_ac = l_ac
 
   #單身組成
   #應用 qs07 樣板自動產生(Version:7)
   #+ b_fill2段table資料取得(包含sql組成及資料填充)
 
   #add-point:陣列清空 name="b_fill2.array_clear"
   
   #end add-point
 
 
 
 
   #add-point:陣列長度調整 name="b_fill2.array_deleteElement"
   
   #end add-point
 
 
   DISPLAY li_ac TO FORMONLY.cnt
   LET g_detail_idx2 = 1
   DISPLAY g_detail_idx2 TO FORMONLY.idx
 
 
 
 
 
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
 
   LET l_ac = li_ac
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq505_detail_show(ps_page)
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

            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stge_d[l_ac].stge002
            #LET ls_sql = "SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'"
            #LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            #CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            #LET g_stge_d[l_ac].stge002_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stge_d[l_ac].stge002_desc
            #
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stge_d[l_ac].stge003
            #LET ls_sql = "SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
            #LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            #CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            #LET g_stge_d[l_ac].stge003_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stge_d[l_ac].stge003_desc
            #
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stge_d[l_ac].stge004
            #LET ls_sql = "SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl002=? AND mhabl003='"||g_dlang||"'"
            #LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            #CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            #LET g_stge_d[l_ac].stge004_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stge_d[l_ac].stge004_desc
            #
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stge_d[l_ac].stge005
            #LET ls_sql = "SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'"
            #LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            #CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            #LET g_stge_d[l_ac].stge005_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_stge_d[l_ac].stge005_desc

      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.filter" >}
#應用 qs13 樣板自動產生(Version:8)
#+ filter段相關程式段
#+ filter過濾功能
PRIVATE FUNCTION astq505_filter()
   #add-point:filter段define-客製 name="filter.define_customerization"
   
   #end add-point
   DEFINE  ls_result   STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter.before_function"
   
   #end add-point
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", TRUE)
 
   
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   #應用 qs08 樣板自動產生(Version:5)
   #+ filter段DIALOG段的組成
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON stge001,stge002,stge003,stge004,stge005,stge006,stfa050,stgesite,stge007, 
          stge008,stge009,stge010,stge011,stge012,stge013,stge014,stge020,stge021,stge019,stge015,stge016, 
          stge017,stge018,stge022,stgeunit
                          FROM s_detail1[1].b_stge001,s_detail1[1].b_stge002,s_detail1[1].b_stge003, 
                              s_detail1[1].b_stge004,s_detail1[1].b_stge005,s_detail1[1].b_stge006,s_detail1[1].b_stfa050, 
                              s_detail1[1].b_stgesite,s_detail1[1].b_stge007,s_detail1[1].b_stge008, 
                              s_detail1[1].b_stge009,s_detail1[1].b_stge010,s_detail1[1].b_stge011,s_detail1[1].b_stge012, 
                              s_detail1[1].b_stge013,s_detail1[1].b_stge014,s_detail1[1].b_stge020,s_detail1[1].b_stge021, 
                              s_detail1[1].b_stge019,s_detail1[1].b_stge015,s_detail1[1].b_stge016,s_detail1[1].b_stge017, 
                              s_detail1[1].b_stge018,s_detail1[1].b_stge022,s_detail1[1].b_stgeunit
 
         BEFORE CONSTRUCT
                     DISPLAY astq505_filter_parser('stge001') TO s_detail1[1].b_stge001
            DISPLAY astq505_filter_parser('stge002') TO s_detail1[1].b_stge002
            DISPLAY astq505_filter_parser('stge003') TO s_detail1[1].b_stge003
            DISPLAY astq505_filter_parser('stge004') TO s_detail1[1].b_stge004
            DISPLAY astq505_filter_parser('stge005') TO s_detail1[1].b_stge005
            DISPLAY astq505_filter_parser('stge006') TO s_detail1[1].b_stge006
            DISPLAY astq505_filter_parser('stfa050') TO s_detail1[1].b_stfa050
            DISPLAY astq505_filter_parser('stgesite') TO s_detail1[1].b_stgesite
            DISPLAY astq505_filter_parser('stge007') TO s_detail1[1].b_stge007
            DISPLAY astq505_filter_parser('stge008') TO s_detail1[1].b_stge008
            DISPLAY astq505_filter_parser('stge009') TO s_detail1[1].b_stge009
            DISPLAY astq505_filter_parser('stge010') TO s_detail1[1].b_stge010
            DISPLAY astq505_filter_parser('stge011') TO s_detail1[1].b_stge011
            DISPLAY astq505_filter_parser('stge012') TO s_detail1[1].b_stge012
            DISPLAY astq505_filter_parser('stge013') TO s_detail1[1].b_stge013
            DISPLAY astq505_filter_parser('stge014') TO s_detail1[1].b_stge014
            DISPLAY astq505_filter_parser('stge020') TO s_detail1[1].b_stge020
            DISPLAY astq505_filter_parser('stge021') TO s_detail1[1].b_stge021
            DISPLAY astq505_filter_parser('stge019') TO s_detail1[1].b_stge019
            DISPLAY astq505_filter_parser('stge015') TO s_detail1[1].b_stge015
            DISPLAY astq505_filter_parser('stge016') TO s_detail1[1].b_stge016
            DISPLAY astq505_filter_parser('stge017') TO s_detail1[1].b_stge017
            DISPLAY astq505_filter_parser('stge018') TO s_detail1[1].b_stge018
            DISPLAY astq505_filter_parser('stge022') TO s_detail1[1].b_stge022
            DISPLAY astq505_filter_parser('stgeunit') TO s_detail1[1].b_stgeunit
 
 
         #單身公用欄位開窗相關處理
         
 
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stge001>>----
         #Ctrlp:construct.c.filter.page1.b_stge001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge001
            #add-point:ON ACTION controlp INFIELD b_stge001 name="construct.c.filter.page1.b_stge001"
            
            #END add-point
 
 
         #----<<b_stge002>>----
         #Ctrlp:construct.c.page1.b_stge002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge002
            #add-point:ON ACTION controlp INFIELD b_stge002 name="construct.c.filter.page1.b_stge002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stge002  #顯示到畫面上
            NEXT FIELD b_stge002                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stge002_desc>>----
         #----<<b_stge003>>----
         #Ctrlp:construct.c.page1.b_stge003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge003
            #add-point:ON ACTION controlp INFIELD b_stge003 name="construct.c.filter.page1.b_stge003"
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
            DISPLAY g_qryparam.return1 TO b_stge003  #顯示到畫面上
            NEXT FIELD b_stge003                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stge003_desc>>----
         #----<<b_stge004>>----
         #Ctrlp:construct.c.page1.b_stge004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge004
            #add-point:ON ACTION controlp INFIELD b_stge004 name="construct.c.filter.page1.b_stge004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stge004  #顯示到畫面上
            NEXT FIELD b_stge004                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stge004_desc>>----
         #----<<b_stge005>>----
         #Ctrlp:construct.c.page1.b_stge005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge005
            #add-point:ON ACTION controlp INFIELD b_stge005 name="construct.c.filter.page1.b_stge005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stge005  #顯示到畫面上
            NEXT FIELD b_stge005                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stge005_desc>>----
         #----<<b_stge006>>----
         #Ctrlp:construct.c.filter.page1.b_stge006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge006
            #add-point:ON ACTION controlp INFIELD b_stge006 name="construct.c.filter.page1.b_stge006"
            
            #END add-point
 
 
         #----<<b_stfa050>>----
         #Ctrlp:construct.c.filter.page1.b_stfa050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stfa050
            #add-point:ON ACTION controlp INFIELD b_stfa050 name="construct.c.filter.page1.b_stfa050"
            
            #END add-point
 
 
         #----<<b_stgesite>>----
         #Ctrlp:construct.c.page1.b_stgesite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgesite
            #add-point:ON ACTION controlp INFIELD b_stgesite name="construct.c.filter.page1.b_stgesite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgesite  #顯示到畫面上
            NEXT FIELD b_stgesite                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stge007>>----
         #Ctrlp:construct.c.filter.page1.b_stge007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge007
            #add-point:ON ACTION controlp INFIELD b_stge007 name="construct.c.filter.page1.b_stge007"
            
            #END add-point
 
 
         #----<<b_stge008>>----
         #Ctrlp:construct.c.filter.page1.b_stge008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge008
            #add-point:ON ACTION controlp INFIELD b_stge008 name="construct.c.filter.page1.b_stge008"
            
            #END add-point
 
 
         #----<<b_stge009>>----
         #Ctrlp:construct.c.filter.page1.b_stge009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge009
            #add-point:ON ACTION controlp INFIELD b_stge009 name="construct.c.filter.page1.b_stge009"
            
            #END add-point
 
 
         #----<<b_stge010>>----
         #Ctrlp:construct.c.filter.page1.b_stge010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge010
            #add-point:ON ACTION controlp INFIELD b_stge010 name="construct.c.filter.page1.b_stge010"
            
            #END add-point
 
 
         #----<<b_stge011>>----
         #Ctrlp:construct.c.filter.page1.b_stge011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge011
            #add-point:ON ACTION controlp INFIELD b_stge011 name="construct.c.filter.page1.b_stge011"
            
            #END add-point
 
 
         #----<<b_stge012>>----
         #Ctrlp:construct.c.filter.page1.b_stge012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge012
            #add-point:ON ACTION controlp INFIELD b_stge012 name="construct.c.filter.page1.b_stge012"
            
            #END add-point
 
 
         #----<<b_stge013>>----
         #Ctrlp:construct.c.filter.page1.b_stge013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge013
            #add-point:ON ACTION controlp INFIELD b_stge013 name="construct.c.filter.page1.b_stge013"
            
            #END add-point
 
 
         #----<<b_stge014>>----
         #Ctrlp:construct.c.filter.page1.b_stge014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge014
            #add-point:ON ACTION controlp INFIELD b_stge014 name="construct.c.filter.page1.b_stge014"
            
            #END add-point
 
 
         #----<<b_stge020>>----
         #Ctrlp:construct.c.filter.page1.b_stge020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge020
            #add-point:ON ACTION controlp INFIELD b_stge020 name="construct.c.filter.page1.b_stge020"
            
            #END add-point
 
 
         #----<<b_stge021>>----
         #Ctrlp:construct.c.filter.page1.b_stge021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge021
            #add-point:ON ACTION controlp INFIELD b_stge021 name="construct.c.filter.page1.b_stge021"
            
            #END add-point
 
 
         #----<<b_stge019>>----
         #Ctrlp:construct.c.filter.page1.b_stge019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge019
            #add-point:ON ACTION controlp INFIELD b_stge019 name="construct.c.filter.page1.b_stge019"
            
            #END add-point
 
 
         #----<<l_sum>>----
         #----<<b_stge015>>----
         #Ctrlp:construct.c.filter.page1.b_stge015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge015
            #add-point:ON ACTION controlp INFIELD b_stge015 name="construct.c.filter.page1.b_stge015"
            
            #END add-point
 
 
         #----<<b_stge016>>----
         #Ctrlp:construct.c.filter.page1.b_stge016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge016
            #add-point:ON ACTION controlp INFIELD b_stge016 name="construct.c.filter.page1.b_stge016"
            
            #END add-point
 
 
         #----<<b_stge017>>----
         #Ctrlp:construct.c.filter.page1.b_stge017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge017
            #add-point:ON ACTION controlp INFIELD b_stge017 name="construct.c.filter.page1.b_stge017"
            
            #END add-point
 
 
         #----<<b_stge018>>----
         #Ctrlp:construct.c.filter.page1.b_stge018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge018
            #add-point:ON ACTION controlp INFIELD b_stge018 name="construct.c.filter.page1.b_stge018"
            
            #END add-point
 
 
         #----<<b_stge022>>----
         #Ctrlp:construct.c.filter.page1.b_stge022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stge022
            #add-point:ON ACTION controlp INFIELD b_stge022 name="construct.c.filter.page1.b_stge022"
            
            #END add-point
 
 
         #----<<b_stgeunit>>----
         #Ctrlp:construct.c.filter.page1.b_stgeunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgeunit
            #add-point:ON ACTION controlp INFIELD b_stgeunit name="construct.c.filter.page1.b_stgeunit"
            
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
 
 
 
 
 
   
 
   #add-point:離開DIALOG後相關處理 name="filter.after_dialog"
   
   #end add-point
 
   IF NOT INT_FLAG THEN
      LET g_wc_filter = g_wc_filter, " "
   ELSE
      LET g_wc_filter = g_wc_filter_t
   END IF
 
      CALL astq505_filter_show('stge001','b_stge001')
   CALL astq505_filter_show('stge002','b_stge002')
   CALL astq505_filter_show('stge003','b_stge003')
   CALL astq505_filter_show('stge004','b_stge004')
   CALL astq505_filter_show('stge005','b_stge005')
   CALL astq505_filter_show('stge006','b_stge006')
   CALL astq505_filter_show('stfa050','b_stfa050')
   CALL astq505_filter_show('stgesite','b_stgesite')
   CALL astq505_filter_show('stge007','b_stge007')
   CALL astq505_filter_show('stge008','b_stge008')
   CALL astq505_filter_show('stge009','b_stge009')
   CALL astq505_filter_show('stge010','b_stge010')
   CALL astq505_filter_show('stge011','b_stge011')
   CALL astq505_filter_show('stge012','b_stge012')
   CALL astq505_filter_show('stge013','b_stge013')
   CALL astq505_filter_show('stge014','b_stge014')
   CALL astq505_filter_show('stge020','b_stge020')
   CALL astq505_filter_show('stge021','b_stge021')
   CALL astq505_filter_show('stge019','b_stge019')
   CALL astq505_filter_show('stge015','b_stge015')
   CALL astq505_filter_show('stge016','b_stge016')
   CALL astq505_filter_show('stge017','b_stge017')
   CALL astq505_filter_show('stge018','b_stge018')
   CALL astq505_filter_show('stge022','b_stge022')
   CALL astq505_filter_show('stgeunit','b_stgeunit')
 
 
   CALL astq505_b_fill()
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq505.filter_parser" >}
#應用 qs14 樣板自動產生(Version:6)
#+ filter pasara段
#+ filter欄位解析
PRIVATE FUNCTION astq505_filter_parser(ps_field)
   #add-point:filter段define-客製 name="filter_parser.define_customerization"
   
   #end add-point
   {<Local define>}
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   {</Local define>}
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
 
{<section id="astq505.filter_show" >}
#應用 qs15 樣板自動產生(Version:6)
#+ filter標題欄位顯示搜尋條件
PRIVATE FUNCTION astq505_filter_show(ps_field,ps_object)
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
      LET ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = astq505_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
 
{</section>}
 
{<section id="astq505.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq505_detail_action_trans()
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
 
{<section id="astq505.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq505_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="detail_index_setting.define_customerization"
   
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
            IF g_stge_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stge_d.getLength() AND g_stge_d.getLength() > 0
            LET g_detail_idx = g_stge_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stge_d.getLength() THEN
               LET g_detail_idx = g_stge_d.getLength()
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
 
{<section id="astq505.mask_functions" >}
 &include "erp/ast/astq505_mask.4gl"
 
{</section>}
 
{<section id="astq505.other_function" readonly="Y" >}

 
{</section>}
 
