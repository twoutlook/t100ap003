#該程式未解開Section, 採用最新樣板產出!
{<section id="astq341.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:4(2016-09-14 10:10:17), PR版次:0004(2016-10-26 11:24:20)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000042
#+ Filename...: astq341
#+ Description: 扣率代銷銷售成本查詢
#+ Creator....: 06189(2015-08-02 12:17:24)
#+ Modifier...: 08742 -SD/PR- 03247
 
{</section>}
 
{<section id="astq341.global" >}
#應用 q01 樣板自動產生(Version:34)
#add-point:填寫註解說明 name="global.memo"
#160913-00034#2    2016/09/14 by 08742      q_pmaa001開窗改成 q_pmaa001_1抓類型=3 的條件
#161024-00025#3    2016/10/26 By dongsz     b_stbcsite查询开窗替换q_ooef001_24 where ooef201 = 'Y'
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
PRIVATE TYPE type_g_stbc_d RECORD
       
       sel LIKE type_t.chr1, 
   stbcsite LIKE stbc_t.stbcsite, 
   stbcsite_desc LIKE type_t.chr500, 
   stbc008 LIKE stbc_t.stbc008, 
   stbc008_desc LIKE type_t.chr500, 
   stbc002 LIKE stbc_t.stbc002, 
   stbc025 LIKE stbc_t.stbc025, 
   stbc025_desc LIKE type_t.chr500, 
   stbcud001 LIKE stbc_t.stbcud001, 
   stbc042 LIKE stbc_t.stbc042, 
   stbc041 LIKE stbc_t.stbc041, 
   stao011 LIKE stao_t.stao011, 
   stbc039 LIKE stbc_t.stbc039, 
   stbc020 LIKE stbc_t.stbc020, 
   stbc018 LIKE stbc_t.stbc018, 
   stbc017 LIKE stbc_t.stbc017, 
   stbc021 LIKE stbc_t.stbc021, 
   stbe031 LIKE stbe_t.stbe031, 
   stbc030 LIKE stbc_t.stbc030
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE sdate        LIKE stbc_t.stbc002     #add by geza 20150802
DEFINE edate        LIKE stbc_t.stbc002     #add by geza 20150802
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stbc_d            DYNAMIC ARRAY OF type_g_stbc_d
DEFINE g_stbc_d_t          type_g_stbc_d
 
 
 
 
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
 
{<section id="astq341.main" >}
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
   DECLARE astq341_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq341_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq341_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq341 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq341_init()   
 
      #進入選單 Menu (="N")
      CALL astq341_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq341
      
   END IF 
   
   CLOSE astq341_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success 
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq341.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astq341_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1" 
   LET g_error_show  = 1
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   
     
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success  
   CALL cl_set_combo_scc('b_stbc041','6855')
   #end add-point
 
   CALL astq341_default_search()
END FUNCTION
 
{</section>}
 
{<section id="astq341.default_search" >}
PRIVATE FUNCTION astq341_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stbc001 = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stbc004 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stbc005 = '", g_argv[03], "' AND "
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
 
{<section id="astq341.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astq341_ui_dialog() 
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
   DEFINE l_ooef008            LIKE ooef_t.ooef008
   DEFINE l_ooef010            LIKE ooef_t.ooef010
   DEFINE r_flag               LIKE type_t.chr1  
   DEFINE r_errno              LIKE type_t.chr100
   DEFINE r_oogc015            LIKE oogc_t.oogc015
   DEFINE r_oogc007            LIKE oogc_t.oogc007
   DEFINE r_sdate_s            LIKE oogc_t.oogc003
   DEFINE r_sdate_e            LIKE oogc_t.oogc003
   DEFINE r_oogc006            LIKE oogc_t.oogc006
   DEFINE r_pdate_s            LIKE oogc_t.oogc003
   DEFINE r_pdate_e            LIKE oogc_t.oogc003
   DEFINE r_oogc008            LIKE oogc_t.oogc008
   DEFINE r_wdate_s            LIKE oogc_t.oogc003
   DEFINE r_wdate_e            LIKE oogc_t.oogc003
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
 
   
   CALL astq341_b_fill()
  
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbc_d.clear()
 
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
 
         CALL astq341_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT sdate,edate FROM sdate,edate
            BEFORE INPUT
            
         END INPUT 
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON stbcsite,stbc008,stbc025,stbc030       
            BEFORE CONSTRUCT        
               DISPlAY g_site TO stbcsite
               #获取当前日期的所在月的起始日期和结束日期
               LET l_ooef008 = ''
               LET l_ooef010 = ''
               SELECT ooef008,ooef010 INTO l_ooef008,l_ooef010
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_site
               CALL s_get_oogcdate(l_ooef008,l_ooef010,g_today,'','')
                   RETURNING r_flag,r_errno,r_oogc015,r_oogc007,r_sdate_s,r_sdate_e,r_oogc006,r_pdate_s,r_pdate_e,r_oogc008,r_wdate_s,r_wdate_e
               IF sdate IS NULL THEN
                  LET sdate = r_pdate_s
               END IF
                IF edate IS NULL THEN
                  LET edate = r_pdate_e
               END IF
            #门店编号            
            ON ACTION controlp INFIELD stbcsite
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbcsite',g_site,'c')
               CALL q_ooef001_24()
               DISPLAY g_qryparam.return1 TO stbcsite  #顯示到畫面上
               NEXT FIELD stbcsite                     #返回原欄位
               
            #供应商编号           
            ON ACTION controlp INFIELD stbc008
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #160913-00034#2 -S
               #CALL q_pmaa001()                           #呼叫開窗            
               LET g_qryparam.arg1 = "('3')"            
               CALL q_pmaa001_1()                           #呼叫開窗
               #160913-00034#2 -E
               DISPLAY g_qryparam.return1 TO stbc008
               NEXT FIELD stbc008      

            #管理品类           
            ON ACTION controlp INFIELD stbc025
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = cl_get_para(g_enterprise,"","E-CIR-0001")
               CALL q_rtax001_3()
               DISPLAY g_qryparam.return1 TO stbc025
               NEXT FIELD stbc025  
   
            #结算合同  
            ON ACTION controlp INFIELD stbc030
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_stan001_1()
               DISPLAY g_qryparam.return1 TO stbc030
               NEXT FIELD stbc030  


         END CONSTRUCT  
         #end add-point
     
         DISPLAY ARRAY g_stbc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL astq341_detail_action_trans()
 
               LET g_master_idx = l_ac
               #為避免按上下筆時影響執行效能，所以做一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq341_b_fill2()
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
            CALL astq341_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
            NEXT FIELD stbcsite
 
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
            CALL astq341_b_fill()
 
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
               LET g_export_node[1] = base.typeInfo.create(g_stbc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
         ON ACTION datarefresh   # 重新整理
            CALL astq341_b_fill()
 
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
            CALL astq341_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq341_b_fill()
 
         ON ACTION detail_next               #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq341_b_fill()
 
         ON ACTION detail_last               #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq341_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stbc_d.getLength()
               LET g_stbc_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stbc_d.getLength()
               LET g_stbc_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stbc_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stbc_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stbc_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stbc_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         #應用 qs16 樣板自動產生(Version:3)
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq341_filter()
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
 
{<section id="astq341.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq341_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE l_pid           LIKE type_t.chr50
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where         STRING 
   DEFINE l_cnt           LIKE type_t.num10
   DEFINE l_ooef019       LIKE ooef_t.ooef019
   DEFINE l_stan007       LIKE stan_t.stan007
   DEFINE l_oodb006       LIKE oodb_t.oodb006 
   DEFINE l_stao003       LIKE stao_t.stao003
   DEFINE l_staq003       LIKE staq_t.staq003    
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stbcsite') RETURNING l_where
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
 
   CALL g_stbc_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   IF sdate IS NOT NULL THEN
      LET ls_wc =ls_wc," AND stbc002 >='",sdate,"'" 
   END IF
   IF edate IS NOT NULL THEN
      LET ls_wc =ls_wc," AND stbc002 <='",edate,"'" 
   END IF
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
   LET ls_sql_rank = "SELECT  UNIQUE '',stbcsite,'',stbc008,'',stbc002,stbc025,'',stbcud001,stbc042, 
       stbc041,'',stbc039,stbc020,stbc018,stbc017,stbc021,'',stbc030  ,DENSE_RANK() OVER( ORDER BY stbc_t.stbc001, 
       stbc_t.stbc004,stbc_t.stbc005) AS RANK FROM stbc_t",
 
 
                     "",
                     " WHERE stbcent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbc_t"),
                     " ORDER BY stbc_t.stbc001,stbc_t.stbc004,stbc_t.stbc005"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
#   LET ls_sql_rank = "SELECT  UNIQUE '',stbcsite,'',stbc008,'',stbc002,stbc025,stbcud001,stbc042,stbc041, 
#       '','',stbc020,stbc018,stbc017,'','',stbc030  ,DENSE_RANK() OVER( ORDER BY stbc_t.stbcsite, 
#       stbc_t.stbc008,stbc_t.stbc002,stbc_t.stbc025) AS RANK FROM stbc_t",
#                     " WHERE stbcent= ? AND stbc009 = '3' AND ", ls_wc   #只抓取扣率代销的
#   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbc_t"),
#                     " ORDER BY stbc_t.stbcsite,stbc_t.stbc008,stbc_t.stbc002,stbc_t.stbc025"
   LET ls_sql_rank = "SELECT  UNIQUE '',stbcsite,'',stbc008,'','',stbc025,rtaxl003,stbcud001,SUM(stbc042) AS stbc042 ,stbc041, 
       '','',SUM(stbc020) AS stbc020 ,SUM(stbc018) AS stbc018,SUM(stbc017) AS stbc017 ,'','',stbc030  ,DENSE_RANK() OVER( ORDER BY stbc_t.stbcsite, 
       stbc_t.stbc008,stbc_t.stbc025) AS RANK FROM stbc_t",
                     " LEFT JOIN rtaxl_t ON rtaxlent = stbcent AND stbc025 = rtaxl001 AND rtaxl002 ='"||g_dlang||"'",  #add by geza 20151208
                     " WHERE stbcent= ? AND stbc009 ='3' AND ", ls_wc   #只抓取扣率代销的
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbc_t"),
                     " GROUP BY stbcsite,stbc008,stbc025,stbcud001,stbc041,stbc030,rtaxl003",
                     " ORDER BY stbc_t.stbcsite,stbc_t.stbc008,stbc_t.stbc025"
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
 
   LET g_sql = "SELECT '',stbcsite,'',stbc008,'',stbc002,stbc025,'',stbcud001,stbc042,stbc041,'',stbc039, 
       stbc020,stbc018,stbc017,stbc021,'',stbc030",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
#   LET g_sql = "SELECT '',stbcsite,'',stbc008,'',stbc002,stbc025,stbcud001,SUM(stbc042),stbc041,'','', 
#       SUM(stbc020),SUM(stbc018),SUM(stbc017),'','',stbc030",
#               " FROM (",ls_sql_rank,")",
#              " WHERE RANK >= ",g_pagestart,
#                " AND RANK < ",g_pagestart + g_num_in_page,
#                " GROUP BY stbcsite,stbc008,stbc002,stbc025,stbcud001,stbc041,stbc030"
    LET g_sql = "SELECT '',stbcsite,'',stbc008,'','',stbc025,rtaxl003,stbcud001,stbc042,stbc041,'','', 
       stbc020,stbc018,stbc017,'','',stbc030",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq341_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq341_pb
 
   OPEN b_fill_curs USING g_enterprise
 
   FOREACH b_fill_curs INTO g_stbc_d[l_ac].sel,g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].stbcsite_desc, 
       g_stbc_d[l_ac].stbc008,g_stbc_d[l_ac].stbc008_desc,g_stbc_d[l_ac].stbc002,g_stbc_d[l_ac].stbc025, 
       g_stbc_d[l_ac].stbc025_desc,g_stbc_d[l_ac].stbcud001,g_stbc_d[l_ac].stbc042,g_stbc_d[l_ac].stbc041, 
       g_stbc_d[l_ac].stao011,g_stbc_d[l_ac].stbc039,g_stbc_d[l_ac].stbc020,g_stbc_d[l_ac].stbc018,g_stbc_d[l_ac].stbc017, 
       g_stbc_d[l_ac].stbc021,g_stbc_d[l_ac].stbe031,g_stbc_d[l_ac].stbc030
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      IF g_stbc_d[l_ac].stbc042 IS NULL THEN
         LET g_stbc_d[l_ac].stbc042 = 0
      END IF
      #计算固定租
      #固定租就显示主品类上面
      SELECT staq003 INTO l_staq003 
        FROM staq_t
       WHERE staqent = g_enterprise
         AND staq001 = g_stbc_d[l_ac].stbc030
         AND staq005 = 'Y'         
      IF l_staq003 = g_stbc_d[l_ac].stbc025 THEN
         SELECT SUM(stao011) INTO g_stbc_d[l_ac].stao011
           FROM stao_t 
          WHERE staoent = g_enterprise
            AND stao001 = g_stbc_d[l_ac].stbc030
            AND EXISTS (SELECT 1 FROM stae_t WHERE staeent = g_enterprise AND stae001 = stao003 AND stae012 = '0001')         
         IF g_stbc_d[l_ac].stao011 IS NULL THEN
            LET g_stbc_d[l_ac].stao011 = 0
         END IF
      ELSE
         LET g_stbc_d[l_ac].stao011 = 0
      END IF
      LET l_cnt = 0
      LET l_stao003 = cl_get_para(g_enterprise,"","E-CIR-0045")      
      SELECT COUNT(*) INTO l_cnt 
        FROM stao_t 
       WHERE staoent = g_enterprise
         AND stao003 = l_stao003
         AND stao001 = g_stbc_d[l_ac].stbc030
      #计算抽成方式,抽成率,抽成金额,销售成本,未税金额，税额，毛利率
      #没有扣率代销编号且有固定租金的为固定租否则都是一般抽成
      IF g_stbc_d[l_ac].stao011 > 0 AND l_cnt = 0 THEN
         LET g_stbc_d[l_ac].stbc041 = '0'                                                # 抽成方式
      ELSE
         LET g_stbc_d[l_ac].stbc041 = '1'          
      END IF   
      #抽成率抓取合同中费用编号1113的第一个不为空的费用扣率   
      SELECT stao012 INTO  g_stbc_d[l_ac].stbc039
        FROM stao_t 
       WHERE staoent=g_enterprise
         AND stao001 = g_stbc_d[l_ac].stbc030        
         AND stao012 IS NOT NULL
         AND stao003 = l_stao003
         AND rownum =1 
      IF g_stbc_d[l_ac].stbc039 IS NULL THEN
         LET g_stbc_d[l_ac].stbc039 = 0
      END IF 
      #抽成金额为销售金额stbc042-stbc018含税金额+固定租   
      LET g_stbc_d[l_ac].stbc020 = g_stbc_d[l_ac].stao011+g_stbc_d[l_ac].stbc042-g_stbc_d[l_ac].stbc018                          
      IF g_stbc_d[l_ac].stbc020 IS NULL THEN
         LET g_stbc_d[l_ac].stbc020 = 0
      END IF 
      #销售成本为营业额stbc042 - 抽成金额      
      LET g_stbc_d[l_ac].stbc018 = g_stbc_d[l_ac].stbc042 - g_stbc_d[l_ac].stbc020 # 销售成本
      IF g_stbc_d[l_ac].stbc018 IS NULL THEN
         LET g_stbc_d[l_ac].stbc018 = 0
      END IF  
      #查出税区
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t
       WHERE ooefent = g_enterprise           
         AND ooef001 = g_stbc_d[l_ac].stbcsite
      #查出税别
      SELECT stan007  INTO l_stan007
        FROM stan_t
       WHERE stanent = g_enterprise
         AND stan001 = g_stbc_d[l_ac].stbc030
      #查出合同的进项税率
      SELECT oodb006 INTO l_oodb006
        FROM oodb_t
       WHERE oodbent = g_enterprise AND oodb001 = l_ooef019 AND oodb002 = l_stan007          
      LET g_stbc_d[l_ac].stbc017 = g_stbc_d[l_ac].stbc018 / (1+l_oodb006/100)      # 未税金额
      IF g_stbc_d[l_ac].stbc017 IS NULL THEN
         LET g_stbc_d[l_ac].stbc017 = 0
      END IF 
      #税额= 销售成本- 未税金额
      LET g_stbc_d[l_ac].stbc021 = g_stbc_d[l_ac].stbc018 - g_stbc_d[l_ac].stbc017 # 税额
      IF g_stbc_d[l_ac].stbc021 IS NULL THEN
         LET g_stbc_d[l_ac].stbc021 = 0
      END IF
      #毛利率 = （营业额-销售成本）/营业额
      LET g_stbc_d[l_ac].stbe031 = (g_stbc_d[l_ac].stbc042 - g_stbc_d[l_ac].stbc018)/g_stbc_d[l_ac].stbc042*100 # 毛利率 
      IF g_stbc_d[l_ac].stbe031 IS NULL THEN
         LET g_stbc_d[l_ac].stbe031 = 0
      END IF
      #end add-point
 
      CALL astq341_detail_show("'1'")
 
      CALL astq341_stbc_t_mask()
 
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
 
   CALL g_stbc_d.deleteElement(g_stbc_d.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   LET g_tot_cnt = g_stbc_d.getLength()
   #end add-point
 
   LET g_error_show = 0
 
   LET g_detail_cnt = g_stbc_d.getLength()
   LET l_ac = g_cnt
   LET g_cnt = 0
 
   #應用 qs06 樣板自動產生(Version:3)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs
   FREE astq341_pb
 
 
 
 
 
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq341_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq341_detail_action_trans()
 
   LET l_ac = 1
   IF g_stbc_d.getLength() > 0 THEN
      CALL astq341_b_fill2()
   END IF
 
      CALL astq341_filter_show('stbcsite','b_stbcsite')
   CALL astq341_filter_show('stbc008','b_stbc008')
   CALL astq341_filter_show('stbc002','b_stbc002')
   CALL astq341_filter_show('stbc025','b_stbc025')
   CALL astq341_filter_show('stbcud001','b_stbcud001')
   CALL astq341_filter_show('stbc042','b_stbc042')
   CALL astq341_filter_show('stbc041','b_stbc041')
   CALL astq341_filter_show('stao011','b_stao011')
   CALL astq341_filter_show('stbc039','b_stbc039')
   CALL astq341_filter_show('stbc020','b_stbc020')
   CALL astq341_filter_show('stbc018','b_stbc018')
   CALL astq341_filter_show('stbc017','b_stbc017')
   CALL astq341_filter_show('stbc021','b_stbc021')
   CALL astq341_filter_show('stbe031','b_stbe031')
   CALL astq341_filter_show('stbc030','b_stbc030')
 
 
END FUNCTION
 
{</section>}
 
{<section id="astq341.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq341_b_fill2()
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
 
{<section id="astq341.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq341_detail_show(ps_page)
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
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbcsite
            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbcsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbcsite_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbc_d[l_ac].stbc008
            LET ls_sql = "SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_stbc_d[l_ac].stbc008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbc_d[l_ac].stbc008_desc

      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq341.filter" >}
#應用 qs13 樣板自動產生(Version:8)
#+ filter段相關程式段
#+ filter過濾功能
PRIVATE FUNCTION astq341_filter()
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
      CONSTRUCT g_wc_filter ON stbcsite,stbc008,stbc002,stbc025,stbcud001,stbc042,stbc041,stao011,stbc039, 
          stbc020,stbc018,stbc017,stbc021,stbe031,stbc030
                          FROM s_detail1[1].b_stbcsite,s_detail1[1].b_stbc008,s_detail1[1].b_stbc002, 
                              s_detail1[1].b_stbc025,s_detail1[1].b_stbcud001,s_detail1[1].b_stbc042, 
                              s_detail1[1].b_stbc041,s_detail1[1].b_stao011,s_detail1[1].b_stbc039,s_detail1[1].b_stbc020, 
                              s_detail1[1].b_stbc018,s_detail1[1].b_stbc017,s_detail1[1].b_stbc021,s_detail1[1].b_stbe031, 
                              s_detail1[1].b_stbc030
 
         BEFORE CONSTRUCT
                     DISPLAY astq341_filter_parser('stbcsite') TO s_detail1[1].b_stbcsite
            DISPLAY astq341_filter_parser('stbc008') TO s_detail1[1].b_stbc008
            DISPLAY astq341_filter_parser('stbc002') TO s_detail1[1].b_stbc002
            DISPLAY astq341_filter_parser('stbc025') TO s_detail1[1].b_stbc025
            DISPLAY astq341_filter_parser('stbcud001') TO s_detail1[1].b_stbcud001
            DISPLAY astq341_filter_parser('stbc042') TO s_detail1[1].b_stbc042
            DISPLAY astq341_filter_parser('stbc041') TO s_detail1[1].b_stbc041
            DISPLAY astq341_filter_parser('stao011') TO s_detail1[1].b_stao011
            DISPLAY astq341_filter_parser('stbc039') TO s_detail1[1].b_stbc039
            DISPLAY astq341_filter_parser('stbc020') TO s_detail1[1].b_stbc020
            DISPLAY astq341_filter_parser('stbc018') TO s_detail1[1].b_stbc018
            DISPLAY astq341_filter_parser('stbc017') TO s_detail1[1].b_stbc017
            DISPLAY astq341_filter_parser('stbc021') TO s_detail1[1].b_stbc021
            DISPLAY astq341_filter_parser('stbe031') TO s_detail1[1].b_stbe031
            DISPLAY astq341_filter_parser('stbc030') TO s_detail1[1].b_stbc030
 
 
         #單身公用欄位開窗相關處理
         
 
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stbcsite>>----
         #Ctrlp:construct.c.page1.b_stbcsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbcsite
            #add-point:ON ACTION controlp INFIELD b_stbcsite name="construct.c.filter.page1.b_stbcsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                           #呼叫開窗   #161024-00025#3 mark
            LET g_qryparam.where = " ooef201 = 'Y' "    #161024-00025#3 add
            CALL q_ooef001_24()                         #161024-00025#3 add
            DISPLAY g_qryparam.return1 TO b_stbcsite  #顯示到畫面上
            NEXT FIELD b_stbcsite                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stbcsite_desc>>----
         #----<<b_stbc008>>----
         #Ctrlp:construct.c.page1.b_stbc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc008
            #add-point:ON ACTION controlp INFIELD b_stbc008 name="construct.c.filter.page1.b_stbc008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc008  #顯示到畫面上
            NEXT FIELD b_stbc008                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stbc008_desc>>----
         #----<<b_stbc002>>----
         #Ctrlp:construct.c.filter.page1.b_stbc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc002
            #add-point:ON ACTION controlp INFIELD b_stbc002 name="construct.c.filter.page1.b_stbc002"
            
            #END add-point
 
 
         #----<<b_stbc025>>----
         #Ctrlp:construct.c.filter.page1.b_stbc025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc025
            #add-point:ON ACTION controlp INFIELD b_stbc025 name="construct.c.filter.page1.b_stbc025"
            
            #END add-point
 
 
         #----<<b_stbc025_desc>>----
         #----<<b_stbcud001>>----
         #Ctrlp:construct.c.filter.page1.b_stbcud001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbcud001
            #add-point:ON ACTION controlp INFIELD b_stbcud001 name="construct.c.filter.page1.b_stbcud001"
            
            #END add-point
 
 
         #----<<b_stbc042>>----
         #Ctrlp:construct.c.filter.page1.b_stbc042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc042
            #add-point:ON ACTION controlp INFIELD b_stbc042 name="construct.c.filter.page1.b_stbc042"
            
            #END add-point
 
 
         #----<<b_stbc041>>----
         #Ctrlp:construct.c.filter.page1.b_stbc041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc041
            #add-point:ON ACTION controlp INFIELD b_stbc041 name="construct.c.filter.page1.b_stbc041"
            
            #END add-point
 
 
         #----<<b_stao011>>----
         #Ctrlp:construct.c.filter.page1.b_stao011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stao011
            #add-point:ON ACTION controlp INFIELD b_stao011 name="construct.c.filter.page1.b_stao011"
            
            #END add-point
 
 
         #----<<b_stbc039>>----
         #Ctrlp:construct.c.filter.page1.b_stbc039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc039
            #add-point:ON ACTION controlp INFIELD b_stbc039 name="construct.c.filter.page1.b_stbc039"
            
            #END add-point
 
 
         #----<<b_stbc020>>----
         #Ctrlp:construct.c.filter.page1.b_stbc020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc020
            #add-point:ON ACTION controlp INFIELD b_stbc020 name="construct.c.filter.page1.b_stbc020"
            
            #END add-point
 
 
         #----<<b_stbc018>>----
         #Ctrlp:construct.c.filter.page1.b_stbc018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc018
            #add-point:ON ACTION controlp INFIELD b_stbc018 name="construct.c.filter.page1.b_stbc018"
            
            #END add-point
 
 
         #----<<b_stbc017>>----
         #Ctrlp:construct.c.filter.page1.b_stbc017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc017
            #add-point:ON ACTION controlp INFIELD b_stbc017 name="construct.c.filter.page1.b_stbc017"
            
            #END add-point
 
 
         #----<<b_stbc021>>----
         #Ctrlp:construct.c.filter.page1.b_stbc021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc021
            #add-point:ON ACTION controlp INFIELD b_stbc021 name="construct.c.filter.page1.b_stbc021"
            
            #END add-point
 
 
         #----<<b_stbe031>>----
         #Ctrlp:construct.c.filter.page1.b_stbe031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbe031
            #add-point:ON ACTION controlp INFIELD b_stbe031 name="construct.c.filter.page1.b_stbe031"
            
            #END add-point
 
 
         #----<<b_stbc030>>----
         #Ctrlp:construct.c.page1.b_stbc030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc030
            #add-point:ON ACTION controlp INFIELD b_stbc030 name="construct.c.filter.page1.b_stbc030"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc030  #顯示到畫面上
            NEXT FIELD b_stbc030                     #返回原欄位
    


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
 
      CALL astq341_filter_show('stbcsite','b_stbcsite')
   CALL astq341_filter_show('stbc008','b_stbc008')
   CALL astq341_filter_show('stbc002','b_stbc002')
   CALL astq341_filter_show('stbc025','b_stbc025')
   CALL astq341_filter_show('stbcud001','b_stbcud001')
   CALL astq341_filter_show('stbc042','b_stbc042')
   CALL astq341_filter_show('stbc041','b_stbc041')
   CALL astq341_filter_show('stao011','b_stao011')
   CALL astq341_filter_show('stbc039','b_stbc039')
   CALL astq341_filter_show('stbc020','b_stbc020')
   CALL astq341_filter_show('stbc018','b_stbc018')
   CALL astq341_filter_show('stbc017','b_stbc017')
   CALL astq341_filter_show('stbc021','b_stbc021')
   CALL astq341_filter_show('stbe031','b_stbe031')
   CALL astq341_filter_show('stbc030','b_stbc030')
 
 
   CALL astq341_b_fill()
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq341.filter_parser" >}
#應用 qs14 樣板自動產生(Version:6)
#+ filter pasara段
#+ filter欄位解析
PRIVATE FUNCTION astq341_filter_parser(ps_field)
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
 
{<section id="astq341.filter_show" >}
#應用 qs15 樣板自動產生(Version:6)
#+ filter標題欄位顯示搜尋條件
PRIVATE FUNCTION astq341_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq341_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
 
{</section>}
 
{<section id="astq341.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq341_detail_action_trans()
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
 
{<section id="astq341.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq341_detail_index_setting()
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
            IF g_stbc_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stbc_d.getLength() AND g_stbc_d.getLength() > 0
            LET g_detail_idx = g_stbc_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stbc_d.getLength() THEN
               LET g_detail_idx = g_stbc_d.getLength()
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
 
{<section id="astq341.mask_functions" >}
 &include "erp/ast/astq341_mask.4gl"
 
{</section>}
 
{<section id="astq341.other_function" readonly="Y" >}

 
{</section>}
 
