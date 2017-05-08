#該程式未解開Section, 採用最新樣板產出!
{<section id="astq340.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:3(2016-06-30 10:11:40), PR版次:0003(2016-10-28 17:54:41)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000022
#+ Filename...: astq340
#+ Description: 自營結算單據批量查詢列印作業
#+ Creator....: 06540(2016-06-30 10:11:40)
#+ Modifier...: 06540 -SD/PR- 03247
 
{</section>}
 
{<section id="astq340.global" >}
#應用 q01 樣板自動產生(Version:34)
#add-point:填寫註解說明 name="global.memo"
#161024-00025#1   2016/10/28 By dongsz   stbd001开窗替换为q_stfa001
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
PRIVATE TYPE type_g_stbd_d RECORD
       
       sel LIKE type_t.chr1, 
   stbdsite LIKE stbd_t.stbdsite, 
   stbdsite_desc LIKE type_t.chr500, 
   stbddocdt LIKE stbd_t.stbddocdt, 
   stbddocno LIKE stbd_t.stbddocno, 
   stbd001 LIKE stbd_t.stbd001, 
   stbd001_desc LIKE type_t.chr500, 
   stbd002 LIKE stbd_t.stbd002, 
   stbd002_desc LIKE type_t.chr500, 
   stbd003 LIKE stbd_t.stbd003, 
   stbdunit LIKE stbd_t.stbdunit, 
   stbd004 LIKE stbd_t.stbd004, 
   stbd005 LIKE stbd_t.stbd005, 
   stbd006 LIKE stbd_t.stbd006, 
   stbd008 LIKE stbd_t.stbd008, 
   stbd011 LIKE stbd_t.stbd011, 
   stbd012 LIKE stbd_t.stbd012, 
   stbd013 LIKE stbd_t.stbd013, 
   stbd015 LIKE stbd_t.stbd015, 
   stbd040 LIKE stbd_t.stbd040, 
   stbd017 LIKE stbd_t.stbd017, 
   stbd018 LIKE stbd_t.stbd018
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE radiogroup_1  LIKE type_t.chr10
DEFINE radiogroup_2  LIKE type_t.chr10
DEFINE stbd043       LIKE stbd_t.stbd043
DEFINE stbd044       LIKE stbd_t.stbd044
DEFINE g_aw          STRING      #確定當下點擊的單身
DEFINE l_wc          STRING
DEFINE i             LIKE type_t.num10
DEFINE stbd003       LIKE stbd_t.stbd003
DEFINE stbdsite      LIKE stbd_t.stbdsite
DEFINE checkbox_1    LIKE type_t.chr10
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stbd_d            DYNAMIC ARRAY OF type_g_stbd_d
DEFINE g_stbd_d_t          type_g_stbd_d
 
 
 
 
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
 
{<section id="astq340.main" >}
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
   DECLARE astq340_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq340_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq340_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq340 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq340_init()   
 
      #進入選單 Menu (="N")
      CALL astq340_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq340
      
   END IF 
   
   CLOSE astq340_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq340.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astq340_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="init.before_function"
 
   #end add-point
 
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1" 
   LET g_error_show  = 1
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   
      CALL cl_set_combo_scc('b_stbd003','6013') 
  
 
   #add-point:畫面資料初始化 name="init.init"
   LET radiogroup_1 = 'N'
   CALL cl_set_combo_scc_part('stbd003','6013',"1,2,3,4,5") 
   CALL cl_set_combo_scc('b_stbd003','6013') 

   INITIALIZE STBD043 TO NULL
   INITIALIZE STBD044 TO NULL
   #end add-point
 
   CALL astq340_default_search()
END FUNCTION
 
{</section>}
 
{<section id="astq340.default_search" >}
PRIVATE FUNCTION astq340_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stbddocno = '", g_argv[01], "' AND "
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
 
{<section id="astq340.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astq340_ui_dialog() 
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
 
   
   CALL astq340_b_fill()
  
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbd_d.clear()
 
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
 
         CALL astq340_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT radiogroup_1,radiogroup_2,checkbox_1,stbd043,stbd044
          FROM  radiogroup_1,radiogroup_2,checkbox_1,stbd043,stbd044
              ATTRIBUTE(WITHOUT DEFAULTS)
         
             BEFORE INPUT 
                DISPLAY BY NAME radiogroup_1,radiogroup_2
                
                IF cl_null(radiogroup_1) then 
                   LET  radiogroup_1 = 'N'
                END IF 
                
                IF cl_null(checkbox_1) then 
                   LET  checkbox_1 = 'Y'
                END IF
         
         
         END INPUT
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
          CONSTRUCT g_wc ON stbddocno,stbd002,stbd003,stbd001,stbddocdt,stbdunit,stbd021,stbdsite
                                                                          
                       FROM stbddocno,stbd002,stbd003,stbd001,stbddocdt,stbdunit,stbd021,stbdsite                                                                         

               BEFORE CONSTRUCT
               
                   IF cl_null(stbd003) THEN
                      LET stbd003 = '1'
                   END IF 
                   DISPLAY BY NAME stbd003
                   IF cl_null(stbdsite) THEN
                      LET stbdsite = g_site
                   END IF 
                   DISPLAY BY NAME stbdsite
                   CALL cl_set_act_visible("filter",FALSE)              
                   
               ON ACTION controlp
                  CASE
                     WHEN INFIELD(stbdsite)   #營運組織
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbdsite',g_site,'c')
                       CALL q_ooef001_24()
                       DISPLAY g_qryparam.return1 TO stbdsite 
                       NEXT FIELD CURRENT
                       
                     
                       
                     WHEN INFIELD(stbd002)   #供应商编号
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_pmaa001_10()
                       DISPLAY g_qryparam.return1 TO stbd002 
                       NEXT FIELD CURRENT
                       
                     WHEN INFIELD(stbd001)   #合同编号
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_stfa001()
                       DISPLAY g_qryparam.return1 TO stbd001 
                       NEXT FIELD CURRENT
                       
                     WHEN INFIELD(stbd021)   #业务员
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_ooag001()
                       DISPLAY g_qryparam.return1 TO stbd021 
                       NEXT FIELD CURRENT
                       
                     WHEN INFIELD(stbdunit)   #结算中心
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbdunit',g_site,'c')            
                       CALL q_ooef001_24()
                       DISPLAY g_qryparam.return1 TO stbdunit 
                       NEXT FIELD CURRENT
                       
                     WHEN INFIELD(stbddocno)   #单号
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.where = " stbd000 = '1' "
                       CALL q_stbddocno()
                       DISPLAY g_qryparam.return1 TO stbddocno 
                       NEXT FIELD CURRENT

                     
                END CASE
         END CONSTRUCT           

         #end add-point
     
         DISPLAY ARRAY g_stbd_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL astq340_detail_action_trans()
 
               LET g_master_idx = l_ac
               #為避免按上下筆時影響執行效能，所以做一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq340_b_fill2()
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
            CALL astq340_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
            NEXT FIELD stbdsite
 
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
            CALL astq340_b_fill()
 
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
               LET g_export_node[1] = base.typeInfo.create(g_stbd_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
         ON ACTION datarefresh   # 重新整理
            CALL astq340_b_fill()
 
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
            CALL astq340_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq340_b_fill()
 
         ON ACTION detail_next               #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq340_b_fill()
 
         ON ACTION detail_last               #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq340_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stbd_d.getLength()
               LET g_stbd_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stbd_d.getLength()
               LET g_stbd_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stbd_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stbd_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stbd_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stbd_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         #應用 qs16 樣板自動產生(Version:3)
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq340_filter()
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
               
               FOR i=1 TO g_stbd_d.getLength()
                  IF g_stbd_d[i].sel='Y' THEN
                     IF cl_null(l_wc) THEN
                       LET l_wc = "'",g_stbd_d[i].stbddocno,"'"
                     ELSE
                        LET l_wc = l_wc,",'",g_stbd_d[i].stbddocno,"'"
                     END IF
                  END IF
               END FOR               
               
               LET g_errno=checkbox_1 # 借用全局变量
               
               IF cl_null(radiogroup_2) THEN 
                  CALL cl_errmsg('radiogroup_2','请选择打印单据类型','请选择打印单据类型','!',1)
               ELSE
                  IF NOT cl_null(l_wc) THEN
                     LET l_wc = " stbddocno IN (",l_wc,") "
                  END IF
                  IF radiogroup_2 = '1' THEN 
                     CALL astr340_g01(l_wc)                 
                  END IF 
                  IF radiogroup_2 = '2' THEN 
                     CALL astr340_g03(l_wc)                 
                  END IF 
                  LET l_wc=''
               END IF 
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               FOR i=1 TO g_stbd_d.getLength()
                  IF g_stbd_d[i].sel='Y' THEN
                     IF cl_null(l_wc) THEN
                       LET l_wc = "'",g_stbd_d[i].stbddocno,"'"
                     ELSE
                        LET l_wc = l_wc,",'",g_stbd_d[i].stbddocno,"'"
                     END IF
                  END IF
               END FOR               
               
               LET g_errno=checkbox_1 # 借用全局变量
               
               IF cl_null(radiogroup_2) THEN 
                  CALL cl_errmsg('radiogroup_2','请选择打印单据类型','请选择打印单据类型','!',1)
               ELSE
                  IF NOT cl_null(l_wc) THEN
                     LET l_wc = " stbddocno IN (",l_wc,") "
                  END IF
                  IF radiogroup_2 = '1' THEN 
                     CALL astr340_g01(l_wc)                 
                  END IF 
                  IF radiogroup_2 = '2' THEN 
                     CALL astr340_g03(l_wc)                 
                  END IF 
                  LET l_wc=''
               END IF 
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
 
{<section id="astq340.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq340_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE l_pid           LIKE type_t.chr50
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_bdate DATE
   DEFINE l_edate DATE
   DEFINE l_day   LIKE type_t.num5
   DEFINE l_wc1   STRING
   DEFINE l_where STRING 
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stbdsite') RETURNING l_where
   LET l_wc1 = "AND 1=1"
   IF cl_null(stbd043) OR cl_null(stbd044) THEN 
      LET l_wc1 = l_wc1
   ELSE 
      LET l_bdate=MDY(stbd044,1,stbd043)  #會計期間開始日期
      CALL s_date_get_max_day(stbd043,stbd044) RETURNING l_day #會計期間最大天數
      LET l_edate= MDY(stbd044,l_day,stbd043)   #會計期間結束日期
      LET l_wc1 = l_wc1,"AND stbd006 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd')"
   END IF
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
 
   CALL g_stbd_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   LET ls_wc= ls_wc," AND ",l_where
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1
 
   # b_fill段sql組成及FOREACH撰寫
   #應用 qs04 樣板自動產生(Version:9)
   #+ b_fill段資料取得(包含sql組成及FOREACH段撰寫)
   LET ls_sql_rank = "SELECT  UNIQUE '',stbdsite,'',stbddocdt,stbddocno,stbd001,'',stbd002,'',stbd003, 
       stbdunit,stbd004,stbd005,stbd006,stbd008,stbd011,stbd012,stbd013,stbd015,stbd040,stbd017,stbd018  , 
       DENSE_RANK() OVER( ORDER BY stbd_t.stbddocno) AS RANK FROM stbd_t",
 
 
                     "",
                     " WHERE stbdent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbd_t"),
                     " ORDER BY stbd_t.stbddocno"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   
   LET ls_sql_rank = "SELECT  UNIQUE 'Y',      stbdsite, ooefl003, stbddocdt, stbddocno,
                                     stbd001,  '',       stbd002,  pmaal004,  stbd003,
                                     stbdunit, stbd004,  stbd005,  stbd006,   stbd008,
                                     stbd011,  stbd012,  stbd013,  stbd015,   stbd040,
                                     stbd017,  stbd018,
                                     DENSE_RANK() OVER( ORDER BY stbd_t.stbddocno) AS RANK ",
                     "  FROM stbd_t",
                     "  LEFT JOIN ooefl_t ON ooeflent = stbdent AND ooefl001 = stbdsite AND ooefl002 = '",g_dlang,"' ",
                     "  LEFT JOIN pmaal_t ON pmaalent = stbdent AND pmaal001 = stbd002 AND pmaal002 = '",g_dlang,"' ",
                     " WHERE stbdent= ? AND stbd000 = '1' AND 1=1 AND ", ls_wc,l_wc1
                  
   IF NOT cl_null(radiogroup_1) AND radiogroup_1 !='0' THEN
      LET ls_sql_rank =ls_sql_rank,"   AND stbdstus = '",radiogroup_1,"' "
   END IF 
                   
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbd_t"),
                     " ORDER BY stbd_t.stbddocno"


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
 
   LET g_sql = "SELECT '',stbdsite,'',stbddocdt,stbddocno,stbd001,'',stbd002,'',stbd003,stbdunit,stbd004, 
       stbd005,stbd006,stbd008,stbd011,stbd012,stbd013,stbd015,stbd040,stbd017,stbd018",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   
   LET g_sql = "SELECT 'Y',      stbdsite, '',      stbddocdt, stbddocno, 
                       stbd001,  '',       stbd002, '',        stbd003,
                       stbdunit, stbd004,  stbd005, stbd006,   stbd008,
                       stbd011,  stbd012,  stbd013, stbd015,   stbd040,
                       stbd017,  stbd018",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
                
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq340_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq340_pb
 
   OPEN b_fill_curs USING g_enterprise
 
   FOREACH b_fill_curs INTO g_stbd_d[l_ac].sel,g_stbd_d[l_ac].stbdsite,g_stbd_d[l_ac].stbdsite_desc, 
       g_stbd_d[l_ac].stbddocdt,g_stbd_d[l_ac].stbddocno,g_stbd_d[l_ac].stbd001,g_stbd_d[l_ac].stbd001_desc, 
       g_stbd_d[l_ac].stbd002,g_stbd_d[l_ac].stbd002_desc,g_stbd_d[l_ac].stbd003,g_stbd_d[l_ac].stbdunit, 
       g_stbd_d[l_ac].stbd004,g_stbd_d[l_ac].stbd005,g_stbd_d[l_ac].stbd006,g_stbd_d[l_ac].stbd008,g_stbd_d[l_ac].stbd011, 
       g_stbd_d[l_ac].stbd012,g_stbd_d[l_ac].stbd013,g_stbd_d[l_ac].stbd015,g_stbd_d[l_ac].stbd040,g_stbd_d[l_ac].stbd017, 
       g_stbd_d[l_ac].stbd018
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
 
      CALL astq340_detail_show("'1'")
 
      CALL astq340_stbd_t_mask()
 
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
 
   CALL g_stbd_d.deleteElement(g_stbd_d.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
 
   LET g_error_show = 0
 
   LET g_detail_cnt = g_stbd_d.getLength()
   LET l_ac = g_cnt
   LET g_cnt = 0
 
   #應用 qs06 樣板自動產生(Version:3)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs
   FREE astq340_pb
 
 
 
 
 
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq340_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq340_detail_action_trans()
 
   LET l_ac = 1
   IF g_stbd_d.getLength() > 0 THEN
      CALL astq340_b_fill2()
   END IF
 
      CALL astq340_filter_show('stbdsite','b_stbdsite')
   CALL astq340_filter_show('stbddocdt','b_stbddocdt')
   CALL astq340_filter_show('stbddocno','b_stbddocno')
   CALL astq340_filter_show('stbd001','b_stbd001')
   CALL astq340_filter_show('stbd002','b_stbd002')
   CALL astq340_filter_show('stbd003','b_stbd003')
   CALL astq340_filter_show('stbdunit','b_stbdunit')
   CALL astq340_filter_show('stbd004','b_stbd004')
   CALL astq340_filter_show('stbd005','b_stbd005')
   CALL astq340_filter_show('stbd006','b_stbd006')
   CALL astq340_filter_show('stbd008','b_stbd008')
   CALL astq340_filter_show('stbd011','b_stbd011')
   CALL astq340_filter_show('stbd012','b_stbd012')
   CALL astq340_filter_show('stbd013','b_stbd013')
   CALL astq340_filter_show('stbd015','b_stbd015')
   CALL astq340_filter_show('stbd040','b_stbd040')
   CALL astq340_filter_show('stbd017','b_stbd017')
   CALL astq340_filter_show('stbd018','b_stbd018')
 
 
END FUNCTION
 
{</section>}
 
{<section id="astq340.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq340_b_fill2()
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
 
{<section id="astq340.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq340_detail_show(ps_page)
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
#            LET g_ref_fields[1] = g_stbd_d[l_ac].stbdsite
#            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stbd_d[l_ac].stbdsite_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stbd_d[l_ac].stbdsite_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stbd_d[l_ac].stbd001
#            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stbd_d[l_ac].stbd001_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stbd_d[l_ac].stbd001_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stbd_d[l_ac].stbd002
#            LET ls_sql = "SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stbd_d[l_ac].stbd002_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stbd_d[l_ac].stbd002_desc

      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq340.filter" >}
#應用 qs13 樣板自動產生(Version:8)
#+ filter段相關程式段
#+ filter過濾功能
PRIVATE FUNCTION astq340_filter()
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
      CONSTRUCT g_wc_filter ON stbdsite,stbddocdt,stbddocno,stbd001,stbd002,stbd003,stbdunit,stbd004, 
          stbd005,stbd006,stbd008,stbd011,stbd012,stbd013,stbd015,stbd040,stbd017,stbd018
                          FROM s_detail1[1].b_stbdsite,s_detail1[1].b_stbddocdt,s_detail1[1].b_stbddocno, 
                              s_detail1[1].b_stbd001,s_detail1[1].b_stbd002,s_detail1[1].b_stbd003,s_detail1[1].b_stbdunit, 
                              s_detail1[1].b_stbd004,s_detail1[1].b_stbd005,s_detail1[1].b_stbd006,s_detail1[1].b_stbd008, 
                              s_detail1[1].b_stbd011,s_detail1[1].b_stbd012,s_detail1[1].b_stbd013,s_detail1[1].b_stbd015, 
                              s_detail1[1].b_stbd040,s_detail1[1].b_stbd017,s_detail1[1].b_stbd018
 
         BEFORE CONSTRUCT
                     DISPLAY astq340_filter_parser('stbdsite') TO s_detail1[1].b_stbdsite
            DISPLAY astq340_filter_parser('stbddocdt') TO s_detail1[1].b_stbddocdt
            DISPLAY astq340_filter_parser('stbddocno') TO s_detail1[1].b_stbddocno
            DISPLAY astq340_filter_parser('stbd001') TO s_detail1[1].b_stbd001
            DISPLAY astq340_filter_parser('stbd002') TO s_detail1[1].b_stbd002
            DISPLAY astq340_filter_parser('stbd003') TO s_detail1[1].b_stbd003
            DISPLAY astq340_filter_parser('stbdunit') TO s_detail1[1].b_stbdunit
            DISPLAY astq340_filter_parser('stbd004') TO s_detail1[1].b_stbd004
            DISPLAY astq340_filter_parser('stbd005') TO s_detail1[1].b_stbd005
            DISPLAY astq340_filter_parser('stbd006') TO s_detail1[1].b_stbd006
            DISPLAY astq340_filter_parser('stbd008') TO s_detail1[1].b_stbd008
            DISPLAY astq340_filter_parser('stbd011') TO s_detail1[1].b_stbd011
            DISPLAY astq340_filter_parser('stbd012') TO s_detail1[1].b_stbd012
            DISPLAY astq340_filter_parser('stbd013') TO s_detail1[1].b_stbd013
            DISPLAY astq340_filter_parser('stbd015') TO s_detail1[1].b_stbd015
            DISPLAY astq340_filter_parser('stbd040') TO s_detail1[1].b_stbd040
            DISPLAY astq340_filter_parser('stbd017') TO s_detail1[1].b_stbd017
            DISPLAY astq340_filter_parser('stbd018') TO s_detail1[1].b_stbd018
 
 
         #單身公用欄位開窗相關處理
         
 
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stbdsite>>----
         #Ctrlp:construct.c.page1.b_stbdsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbdsite
            #add-point:ON ACTION controlp INFIELD b_stbdsite name="construct.c.filter.page1.b_stbdsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbdsite  #顯示到畫面上
            NEXT FIELD b_stbdsite                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stbdsite_desc>>----
         #----<<b_stbddocdt>>----
         #Ctrlp:construct.c.filter.page1.b_stbddocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbddocdt
            #add-point:ON ACTION controlp INFIELD b_stbddocdt name="construct.c.filter.page1.b_stbddocdt"
            
            #END add-point
 
 
         #----<<b_stbddocno>>----
         #Ctrlp:construct.c.page1.b_stbddocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbddocno
            #add-point:ON ACTION controlp INFIELD b_stbddocno name="construct.c.filter.page1.b_stbddocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stbddocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbddocno  #顯示到畫面上
            NEXT FIELD b_stbddocno                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stbd001>>----
         #Ctrlp:construct.c.page1.b_stbd001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd001
            #add-point:ON ACTION controlp INFIELD b_stbd001 name="construct.c.filter.page1.b_stbd001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                      #呼叫開窗    #161024-00025#1 mark
            CALL q_stfa001()                #161024-00025#1 add
            DISPLAY g_qryparam.return1 TO b_stbd001  #顯示到畫面上
            NEXT FIELD b_stbd001                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stbd001_desc>>----
         #----<<b_stbd002>>----
         #Ctrlp:construct.c.page1.b_stbd002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd002
            #add-point:ON ACTION controlp INFIELD b_stbd002 name="construct.c.filter.page1.b_stbd002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbd002  #顯示到畫面上
            NEXT FIELD b_stbd002                     #返回原欄位
    



            #END add-point
 
 
         #----<<b_stbd002_desc>>----
         #----<<b_stbd003>>----
         #Ctrlp:construct.c.filter.page1.b_stbd003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd003
            #add-point:ON ACTION controlp INFIELD b_stbd003 name="construct.c.filter.page1.b_stbd003"
            
            #END add-point
 
 
         #----<<b_stbdunit>>----
         #Ctrlp:construct.c.filter.page1.b_stbdunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbdunit
            #add-point:ON ACTION controlp INFIELD b_stbdunit name="construct.c.filter.page1.b_stbdunit"
            
            #END add-point
 
 
         #----<<b_stbd004>>----
         #Ctrlp:construct.c.filter.page1.b_stbd004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd004
            #add-point:ON ACTION controlp INFIELD b_stbd004 name="construct.c.filter.page1.b_stbd004"
            
            #END add-point
 
 
         #----<<b_stbd005>>----
         #Ctrlp:construct.c.filter.page1.b_stbd005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd005
            #add-point:ON ACTION controlp INFIELD b_stbd005 name="construct.c.filter.page1.b_stbd005"
            
            #END add-point
 
 
         #----<<b_stbd006>>----
         #Ctrlp:construct.c.filter.page1.b_stbd006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd006
            #add-point:ON ACTION controlp INFIELD b_stbd006 name="construct.c.filter.page1.b_stbd006"
            
            #END add-point
 
 
         #----<<b_stbd008>>----
         #Ctrlp:construct.c.filter.page1.b_stbd008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd008
            #add-point:ON ACTION controlp INFIELD b_stbd008 name="construct.c.filter.page1.b_stbd008"
            
            #END add-point
 
 
         #----<<b_stbd011>>----
         #Ctrlp:construct.c.filter.page1.b_stbd011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd011
            #add-point:ON ACTION controlp INFIELD b_stbd011 name="construct.c.filter.page1.b_stbd011"
            
            #END add-point
 
 
         #----<<b_stbd012>>----
         #Ctrlp:construct.c.filter.page1.b_stbd012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd012
            #add-point:ON ACTION controlp INFIELD b_stbd012 name="construct.c.filter.page1.b_stbd012"
            
            #END add-point
 
 
         #----<<b_stbd013>>----
         #Ctrlp:construct.c.filter.page1.b_stbd013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd013
            #add-point:ON ACTION controlp INFIELD b_stbd013 name="construct.c.filter.page1.b_stbd013"
            
            #END add-point
 
 
         #----<<b_stbd015>>----
         #Ctrlp:construct.c.filter.page1.b_stbd015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd015
            #add-point:ON ACTION controlp INFIELD b_stbd015 name="construct.c.filter.page1.b_stbd015"
            
            #END add-point
 
 
         #----<<b_stbd040>>----
         #Ctrlp:construct.c.filter.page1.b_stbd040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd040
            #add-point:ON ACTION controlp INFIELD b_stbd040 name="construct.c.filter.page1.b_stbd040"
            
            #END add-point
 
 
         #----<<b_stbd017>>----
         #Ctrlp:construct.c.filter.page1.b_stbd017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd017
            #add-point:ON ACTION controlp INFIELD b_stbd017 name="construct.c.filter.page1.b_stbd017"
            
            #END add-point
 
 
         #----<<b_stbd018>>----
         #Ctrlp:construct.c.filter.page1.b_stbd018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbd018
            #add-point:ON ACTION controlp INFIELD b_stbd018 name="construct.c.filter.page1.b_stbd018"
            
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
 
      CALL astq340_filter_show('stbdsite','b_stbdsite')
   CALL astq340_filter_show('stbddocdt','b_stbddocdt')
   CALL astq340_filter_show('stbddocno','b_stbddocno')
   CALL astq340_filter_show('stbd001','b_stbd001')
   CALL astq340_filter_show('stbd002','b_stbd002')
   CALL astq340_filter_show('stbd003','b_stbd003')
   CALL astq340_filter_show('stbdunit','b_stbdunit')
   CALL astq340_filter_show('stbd004','b_stbd004')
   CALL astq340_filter_show('stbd005','b_stbd005')
   CALL astq340_filter_show('stbd006','b_stbd006')
   CALL astq340_filter_show('stbd008','b_stbd008')
   CALL astq340_filter_show('stbd011','b_stbd011')
   CALL astq340_filter_show('stbd012','b_stbd012')
   CALL astq340_filter_show('stbd013','b_stbd013')
   CALL astq340_filter_show('stbd015','b_stbd015')
   CALL astq340_filter_show('stbd040','b_stbd040')
   CALL astq340_filter_show('stbd017','b_stbd017')
   CALL astq340_filter_show('stbd018','b_stbd018')
 
 
   CALL astq340_b_fill()
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq340.filter_parser" >}
#應用 qs14 樣板自動產生(Version:6)
#+ filter pasara段
#+ filter欄位解析
PRIVATE FUNCTION astq340_filter_parser(ps_field)
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
 
{<section id="astq340.filter_show" >}
#應用 qs15 樣板自動產生(Version:6)
#+ filter標題欄位顯示搜尋條件
PRIVATE FUNCTION astq340_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq340_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
 
{</section>}
 
{<section id="astq340.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq340_detail_action_trans()
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
 
{<section id="astq340.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq340_detail_index_setting()
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
            IF g_stbd_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stbd_d.getLength() AND g_stbd_d.getLength() > 0
            LET g_detail_idx = g_stbd_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stbd_d.getLength() THEN
               LET g_detail_idx = g_stbd_d.getLength()
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
 
{<section id="astq340.mask_functions" >}
 &include "erp/ast/astq340_mask.4gl"
 
{</section>}
 
{<section id="astq340.other_function" readonly="Y" >}

 
{</section>}
 
