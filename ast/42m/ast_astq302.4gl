#該程式未解開Section, 採用最新樣板產出!
{<section id="astq302.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:2(2016-09-14 09:35:48), PR版次:0002(2016-09-14 09:26:01)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000029
#+ Filename...: astq302
#+ Description: 扣率代銷銷售成本彙總查詢作業
#+ Creator....: 06189(2016-01-08 16:35:20)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq302.global" >}
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
PRIVATE TYPE type_g_stby_d RECORD
       
       sel LIKE type_t.chr1, 
   stbysite LIKE stby_t.stbysite, 
   stbysite_desc LIKE type_t.chr500, 
   stby020 LIKE stby_t.stby020, 
   stby005 LIKE stby_t.stby005, 
   stby005_desc LIKE type_t.chr500, 
   stby018 LIKE type_t.chr500, 
   stby018_desc LIKE type_t.chr500, 
   stan007 LIKE stan_t.stan007, 
   stan007_desc LIKE type_t.chr500, 
   oodb006 LIKE oodb_t.oodb006, 
   stan037 LIKE stan_t.stan037, 
   stbb009 LIKE stbb_t.stbb009, 
   stbb025 LIKE stbb_t.stbb025, 
   stby009 LIKE stby_t.stby009, 
   stby011 LIKE stby_t.stby011, 
   stby008 LIKE stby_t.stby008, 
   stby012 LIKE stby_t.stby012, 
   stbc017 LIKE stbc_t.stbc017, 
   stbc018 LIKE stbc_t.stbc018, 
   stbe031 LIKE stbe_t.stbe031, 
   stby019 LIKE stby_t.stby019
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_stbysite          LIKE stby_t.stbysite
DEFINE l_sdate             LIKE stby_t.stby001
DEFINE l_edate             LIKE stby_t.stby001
DEFINE g_s_date            LIKE stby_t.stby001
DEFINE g_e_date            LIKE stby_t.stby001
DEFINE g_sdate             LIKE stby_t.stby001
DEFINE g_edate             LIKE stby_t.stby001
#add by geza 20160111(S)
 TYPE type_g_stby1_d RECORD  
   stbysite_1 LIKE stby_t.stbysite, 
   stbysite_1_desc LIKE type_t.chr500,  
   stby020_1 LIKE stby_t.stby020, 
   stby005_1 LIKE stby_t.stby005, 
   stby005_1_desc LIKE type_t.chr500, 
   stan007_1 LIKE stan_t.stan007, 
   stan007_1_desc LIKE type_t.chr500,   
   oodb006_1 LIKE oodb_t.oodb006, 
   stan037_1 LIKE stan_t.stan037, 
   stbb009_1 LIKE stbb_t.stbb009, 
   stbb025_1 LIKE stbb_t.stbb025, 
   stby009_1 LIKE stby_t.stby009, 
   stby011_1 LIKE stby_t.stby011, 
   stby008_1 LIKE stby_t.stby008, 
   stby012_1 LIKE stby_t.stby012, 
   stbc017_1 LIKE stbc_t.stbc017, 
   stbc018_1 LIKE stbc_t.stbc018, 
   stbe031_1 LIKE stbe_t.stbe031, 
   stby019_1 LIKE stby_t.stby019
       END RECORD
DEFINE g_stby1_d            DYNAMIC ARRAY OF type_g_stby1_d
DEFINE g_stby1_d_t          type_g_stby1_d
#add by geza 20160111(E)
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stby_d            DYNAMIC ARRAY OF type_g_stby_d
DEFINE g_stby_d_t          type_g_stby_d
 
 
 
 
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
 
{<section id="astq302.main" >}
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
   DECLARE astq302_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq302_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq302_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq302 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq302_init()   
 
      #進入選單 Menu (="N")
      CALL astq302_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq302
      
   END IF 
   
   CLOSE astq302_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   CALL astq302_drop_tmp()
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq302.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astq302_init()
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
   CALL cl_set_combo_scc('stby013','6800')
   CALL cl_set_combo_scc('b_stby013','6800')
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL astq302_create_tmp() RETURNING l_success   
   #end add-point
 
   CALL astq302_default_search()
END FUNCTION
 
{</section>}
 
{<section id="astq302.default_search" >}
PRIVATE FUNCTION astq302_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stbysite = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stbydocno = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stbyseq = '", g_argv[03], "' AND "
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
 
{<section id="astq302.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astq302_ui_dialog() 
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
 
   
   CALL astq302_b_fill()
  
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stby_d.clear()
 
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
 
         CALL astq302_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
 
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON stbysite,stby005,stby018,stby020   
            BEFORE CONSTRUCT
               LET g_stbysite = GET_FLDBUF(stbysite)
               IF g_stbysite IS NULL THEN            
                  DISPlAY g_site TO stbysite
               END IF   
               #获取当前日期
               LET g_sdate = GET_FLDBUF(sdate)
               IF g_sdate IS NULL THEN            
                  DISPlAY g_today -1 TO sdate
               END IF  
               LET g_edate = GET_FLDBUF(edate)
               IF g_edate IS NULL THEN            
                  DISPlAY g_today -1 TO edate
               END IF                 
            #门店编号           
         
         ON ACTION controlp INFIELD stbysite
            #add-point:ON ACTION controlp INFIELD b_stgasite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbysite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbysite  #顯示到畫面上
            NEXT FIELD stbysite                     #返回原欄位
    
         ON ACTION controlp INFIELD stby005
            #add-point:ON ACTION controlp INFIELD b_stgasite
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
            DISPLAY g_qryparam.return1 TO stby005  #顯示到畫面上
            NEXT FIELD stby005                     #返回原欄位
                    
            
         ON ACTION controlp INFIELD stby018   
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,"","E-CIR-0001")
            CALL q_rtax001_3()
            DISPLAY g_qryparam.return1 TO stby018
            NEXT FIELD stby018
                             
         ON ACTION controlp INFIELD stby020   
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stan001_1()
            DISPLAY g_qryparam.return1 TO stby020
            NEXT FIELD stby020   
         
         END CONSTRUCT
         
         CONSTRUCT l_sdate ON sdate FROM sdate
            BEFORE CONSTRUCT
               #获取当前日期
               LET g_sdate = GET_FLDBUF(sdate)
               IF g_sdate IS NULL THEN            
                  DISPlAY g_today -1 TO sdate
               END IF               
    
         END CONSTRUCT
         CONSTRUCT l_edate ON edate FROM edate
            BEFORE CONSTRUCT
               #获取当前日期
               LET g_edate = GET_FLDBUF(edate)
               IF g_edate IS NULL THEN            
                  DISPlAY g_today - 1 TO edate
               END IF               
    
         END CONSTRUCT    
         #end add-point
     
         DISPLAY ARRAY g_stby_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL astq302_detail_action_trans()
 
               LET g_master_idx = l_ac
               #為避免按上下筆時影響執行效能，所以做一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq302_b_fill2()
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
         #add by geza 20151203(S)
         DISPLAY ARRAY g_stby1_d TO s_detail2.* ATTRIBUTES(COUNT=g_detail_cnt) #page1  
          
           BEFORE ROW
              LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
              IF g_detail_idx > g_stby1_d.getLength() THEN
                 LET g_detail_idx = g_stby1_d.getLength()
              END IF
              IF g_detail_idx = 0 AND g_stby1_d.getLength() <> 0 THEN
                 LET g_detail_idx = 1
              END IF
              DISPLAY g_detail_idx TO FORMONLY.h_index
              DISPLAY g_stby1_d.getLength() TO FORMONLY.h_count
              LET l_ac = DIALOG.getCurrentRow("s_detail2")
              LET g_detail_idx = l_ac
              
             
           BEFORE DISPLAY
              CALL FGL_SET_ARR_CURR(g_detail_idx)
              LET l_ac = DIALOG.getCurrentRow("s_detail2")
              LET g_current_page = 1
          
          
              
         END DISPLAY
         #add by geza 20151203(E)
         #end add-point
 
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq302_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
            NEXT FIELD stbysite
 
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
            LET g_s_date = GET_FLDBUF(sdate)
            IF g_s_date IS NULL THEN            
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "" 
               LET g_errparam.code   = 'ast-00468' 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CONTINUE DIALOG
            END IF 
            LET g_e_date = GET_FLDBUF(edate)
            IF g_e_date IS NULL THEN            
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "" 
               LET g_errparam.code   = 'ast-00469' 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CONTINUE DIALOG
            END IF 
            #end add-point
 
            LET g_detail_idx = 1
            LET g_detail_idx2 = 1
            CALL astq302_b_fill()
 
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
               LET g_export_node[1] = base.typeInfo.create(g_stby_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               #add by geza 20151203(S)
               LET g_export_node[2] = base.typeInfo.create(g_stby1_d)
               LET g_export_id[2]   = "s_detail2"
               #add by geza 20151203(E)
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
         ON ACTION datarefresh   # 重新整理
            CALL astq302_b_fill()
 
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
            CALL astq302_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq302_b_fill()
 
         ON ACTION detail_next               #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq302_b_fill()
 
         ON ACTION detail_last               #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq302_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stby_d.getLength()
               LET g_stby_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stby_d.getLength()
               LET g_stby_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stby_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stby_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stby_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stby_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         #應用 qs16 樣板自動產生(Version:3)
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq302_filter()
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
         ON ACTION query_collect
            LET g_action_choice="query_collect"
            IF cl_auth_chk_act("query_collect") THEN
               
               #add-point:ON ACTION query_collect name="menu.query_collect"
               CALL astq302_b_fill_2() #add by geza 20151204
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
 
{<section id="astq302.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq302_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE l_pid           LIKE type_t.chr50
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where         STRING
   DEFINE l_sql           STRING
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stbysite') RETURNING l_where
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
 
   CALL g_stby_d.clear()
 
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
   LET ls_sql_rank = "SELECT  UNIQUE '',stbysite,'',stby020,stby005,'','','','','','','','','',stby009, 
       stby011,stby008,stby012,'','','',stby019  ,DENSE_RANK() OVER( ORDER BY stby_t.stbysite,stby_t.stbydocno, 
       stby_t.stbyseq) AS RANK FROM stby_t",
 
 
                     "",
                     " WHERE stbyent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stby_t"),
                     " ORDER BY stby_t.stbysite,stby_t.stbydocno,stby_t.stbyseq"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
#   #mark by geza 20151204(S)
#   LET ls_sql_rank = "SELECT  UNIQUE 'N',stbysite,'',stby001,stby020,stby002,'',stby003,'',stby005,'', 
#       stby018,'',stby006,'',stby007,stby008,stby009,stby010,stby011,stby012,stby013,stbydocno,stbyseq,stby015, 
#       stby016,stby017,stby019  ,DENSE_RANK() OVER( ORDER BY stby_t.stbysite,stby_t.stbydocno,stby_t.stbyseq) AS RANK FROM stby_t", 
#
# 
# 
#                     "",
#                     " WHERE stbyent= ? AND 1=1 AND ", ls_wc," AND stby001 >=  to_date('",l_sdate,"','yyyy/mm/dd') AND  stby001 <= to_date('",l_edate,"','yyyy/mm/dd') "
#   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stby_t"),
#                     " ORDER BY stby_t.stbysite,stby_t.stbydocno,stby_t.stbyseq"
#   #mark by geza 20151204(E)                  

    #新增temp table
    LET l_sql = "INSERT INTO astq302_tmp(stbysite,     stbysite_desc,    stby020,     stby005,    stby005_desc,  ",     
                "                        stan007,      stan007_desc,     oodb006,     stan037,    stbb009,",
                "                        stbb025,      stby009,          stby011,     stby008,    stby012,",
                "                        stbc017,      stbc018,          stbe031,     stby019)",
                "  VALUES(?,?,?,?,?, ",
                "         ?,?,?,?,?,",
                "         ?,?,?,?,?,",
                "         ?,?,?,?)"
    PREPARE astq302_in_tmp FROM l_sql
    
    DELETE FROM astq302_tmp
    
    LET ls_sql_rank = "SELECT  UNIQUE 'N',stbysite,ooefl003,stby020,stby005,pmaal003, 
                                      stby018,rtaxl003,stan007,oodbl004,oodb006,stan037,0,0,SUM(stby009) as stby009,SUM(stby011) as stby011,0,SUM(stby012) as stby012,ROUND(SUM(stby012)/(1+COALESCE(oodb006,0)/100),2) as stbc017,SUM(stby012) - ROUND(SUM(stby012)/(1+COALESCE(oodb006,0)/100),2) as stbc018 ,0,SUM(stby019) as stby019,
                                      DENSE_RANK() OVER( ORDER BY stby_t.stbysite,stby_t.stby020,stby_t.stby005) AS RANK FROM stby_t", 
                      "  LEFT JOIN ooefl_t ON ooeflent='"||g_enterprise||"' AND ooefl001 = stbysite AND ooefl002='"||g_dlang||"' ",
                      "  LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001 = stby005  AND pmaal002='"||g_dlang||"' ",
                      "  LEFT JOIN rtaxl_t ON rtaxlent='"||g_enterprise||"' AND rtaxl001 = stby018  AND rtaxl002='"||g_dlang||"' ",
                      "  LEFT JOIN stan_t  ON stanent='"||g_enterprise||"'  AND stan001  = stby020  ",
                      "  LEFT JOIN ooef_t  ON ooefent='"||g_enterprise||"'  AND ooef001  = stbysite  ",
                      "  LEFT JOIN oodbl_t ON oodblent='"||g_enterprise||"' AND oodbl001 = ooef019  AND oodbl002  = stan007 AND oodbl003='"||g_dlang||"' ",
                      "  LEFT JOIN oodb_t  ON oodbent='"||g_enterprise||"'  AND oodb002  = stan007  AND oodb001 = ooef019 ",
                      " WHERE stbyent= ? AND 1=1 AND ", ls_wc," AND stby001 >=  to_date('",l_sdate,"','yyyy/mm/dd') AND  stby001 <= to_date('",l_edate,"','yyyy/mm/dd') "
    LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stby_t"),
                      " GROUP BY stbysite,ooefl003,stby020,stby005,pmaal003,stby018,rtaxl003,stan007,oodbl004,oodb006,stan037",
                      " ORDER BY stby_t.stbysite,stby_t.stby020,stby_t.stby005"
    #add by geza 20151204(E)                 
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
 
   LET g_sql = "SELECT '',stbysite,'',stby020,stby005,'','','','','','','','','',stby009,stby011,stby008, 
       stby012,'','','',stby019",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   LET g_sql = "SELECT  UNIQUE 'N',stbysite,ooefl003,stby020,stby005,pmaal003, 
                        stby018,rtaxl003,stan007,oodbl004,oodb006,stan037,0,0,stby009,stby011,0,stby012,stbc017,stbc018,0,stby019",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq302_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq302_pb
 
   OPEN b_fill_curs USING g_enterprise
 
   FOREACH b_fill_curs INTO g_stby_d[l_ac].sel,g_stby_d[l_ac].stbysite,g_stby_d[l_ac].stbysite_desc, 
       g_stby_d[l_ac].stby020,g_stby_d[l_ac].stby005,g_stby_d[l_ac].stby005_desc,g_stby_d[l_ac].stby018, 
       g_stby_d[l_ac].stby018_desc,g_stby_d[l_ac].stan007,g_stby_d[l_ac].stan007_desc,g_stby_d[l_ac].oodb006, 
       g_stby_d[l_ac].stan037,g_stby_d[l_ac].stbb009,g_stby_d[l_ac].stbb025,g_stby_d[l_ac].stby009,g_stby_d[l_ac].stby011, 
       g_stby_d[l_ac].stby008,g_stby_d[l_ac].stby012,g_stby_d[l_ac].stbc017,g_stby_d[l_ac].stbc018,g_stby_d[l_ac].stbe031, 
       g_stby_d[l_ac].stby019
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      #租金=SUM费用单租金类费用，抓取底稿的结算日期来判断
      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stbb009
        FROM stbc_t
       WHERE stbc003 = '3'
         AND stbcent = g_enterprise
         AND stbc040 >= l_sdate
         AND stbc040 <= l_edate
         AND stbcsite = g_stby_d[l_ac].stbysite
         AND stbc030 = g_stby_d[l_ac].stby020
         AND stbc008 = g_stby_d[l_ac].stby005
         AND stbc025 = g_stby_d[l_ac].stby018
         AND EXISTS (SELECT 1 FROM stae_t WHERE staeent = stbcent AND stae001 = stbc012 AND stae012 = '0001')
      IF g_stby_d[l_ac].stbb009 IS NULL THEN
         LET g_stby_d[l_ac].stbb009 = 0
      END IF
         
      #费用扣项金额=SUM票口否=Y的费用单金额(排除租金类费用)
      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stbb025
        FROM stbc_t
       WHERE stbc003 = '3'
         AND stbcent = g_enterprise
         AND stbc040 >= l_sdate
         AND stbc040 <= l_edate
         AND stbcsite = g_stby_d[l_ac].stbysite
         AND stbc030 = g_stby_d[l_ac].stby020
         AND stbc008 = g_stby_d[l_ac].stby005
         AND stbc025 = g_stby_d[l_ac].stby018
         AND stbc038 = 'Y'
         AND NOT EXISTS (SELECT 1 FROM stae_t WHERE staeent = stbcent AND stae001 = stbc012 AND stae012 = '0001')
      IF g_stby_d[l_ac].stbb025 IS NULL THEN
         LET g_stby_d[l_ac].stbb025 = 0
      END IF
      
      #毛利率=（实收金额-成本金额）/实收金额
      LET g_stby_d[l_ac].stbe031 = (g_stby_d[l_ac].stby009-g_stby_d[l_ac].stby012)/g_stby_d[l_ac].stby009*100
      IF g_stby_d[l_ac].stbe031 IS NULL THEN
         LET g_stby_d[l_ac].stbe031 = 0
      END IF      
      #成本调整金额=SUM日结成本类型为 %调整% 类的金额
      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stby008
        FROM stbc_t
       WHERE stbcent = g_enterprise
         AND stbc040 >= l_sdate
         AND stbc040 <= l_edate
         AND stbcsite = g_stby_d[l_ac].stbysite
         AND stbc030 = g_stby_d[l_ac].stby020
         AND stbc008 = g_stby_d[l_ac].stby005
         AND stbc025 = g_stby_d[l_ac].stby018
         AND stbc041 IN ('2','8','12','15','16','17','18','19','20','21','22')
      IF g_stby_d[l_ac].stby008 IS NULL THEN
         LET g_stby_d[l_ac].stby008 = 0
      END IF   

      #新增 temp table
      EXECUTE astq302_in_tmp USING g_stby_d[l_ac].stbysite,   g_stby_d[l_ac].stbysite_desc,  g_stby_d[l_ac].stby020,   g_stby_d[l_ac].stby005,  g_stby_d[l_ac].stby005_desc,  
                                   g_stby_d[l_ac].stan007,    g_stby_d[l_ac].stan007_desc,   g_stby_d[l_ac].oodb006,   g_stby_d[l_ac].stan037,  g_stby_d[l_ac].stbb009,        
                                   g_stby_d[l_ac].stbb025,    g_stby_d[l_ac].stby009,        g_stby_d[l_ac].stby011,   g_stby_d[l_ac].stby008,  g_stby_d[l_ac].stby012,        
                                   g_stby_d[l_ac].stbc017,    g_stby_d[l_ac].stbc018,        g_stby_d[l_ac].stbe031,   g_stby_d[l_ac].stby019
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "Ins astq302_tmp"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      #end add-point
 
      CALL astq302_detail_show("'1'")
 
      CALL astq302_stby_t_mask()
 
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
 
   CALL g_stby_d.deleteElement(g_stby_d.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   CALL astq302_b_fill_2()  #add by geza 20151203
   #end add-point
 
   LET g_error_show = 0
 
   LET g_detail_cnt = g_stby_d.getLength()
   LET l_ac = g_cnt
   LET g_cnt = 0
 
   #應用 qs06 樣板自動產生(Version:3)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs
   FREE astq302_pb
 
 
 
 
 
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq302_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq302_detail_action_trans()
 
   LET l_ac = 1
   IF g_stby_d.getLength() > 0 THEN
      CALL astq302_b_fill2()
   END IF
 
      CALL astq302_filter_show('stbysite','b_stbysite')
   CALL astq302_filter_show('stby020','b_stby020')
   CALL astq302_filter_show('stby005','b_stby005')
   CALL astq302_filter_show('stan007','b_stan007')
   CALL astq302_filter_show('oodb006','b_oodb006')
   CALL astq302_filter_show('stan037','b_stan037')
   CALL astq302_filter_show('stbb009','b_stbb009')
   CALL astq302_filter_show('stbb025','b_stbb025')
   CALL astq302_filter_show('stby009','b_stby009')
   CALL astq302_filter_show('stby011','b_stby011')
   CALL astq302_filter_show('stby008','b_stby008')
   CALL astq302_filter_show('stby012','b_stby012')
   CALL astq302_filter_show('stbc017','b_stbc017')
   CALL astq302_filter_show('stbc018','b_stbc018')
   CALL astq302_filter_show('stbe031','b_stbe031')
   CALL astq302_filter_show('stby019','b_stby019')
 
 
END FUNCTION
 
{</section>}
 
{<section id="astq302.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq302_b_fill2()
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
 
{<section id="astq302.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq302_detail_show(ps_page)
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
#            LET g_ref_fields[1] = g_stby_d[l_ac].stbysite
#            LET ls_sql = "SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stbysite_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stbysite_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stby_d[l_ac].stby002
#            LET ls_sql = "SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stby002_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stby002_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stby_d[l_ac].stby003
#            LET ls_sql = "SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stby003_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stby003_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stby_d[l_ac].stby005
#            LET ls_sql = "SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stby005_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stby005_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stby_d[l_ac].stby018
#            LET ls_sql = "SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stby018_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stby018_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stby_d[l_ac].stby006
#            LET ls_sql = "SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'"
#            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#            LET g_stby_d[l_ac].stby006_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stby_d[l_ac].stby006_desc

      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq302.filter" >}
#應用 qs13 樣板自動產生(Version:8)
#+ filter段相關程式段
#+ filter過濾功能
PRIVATE FUNCTION astq302_filter()
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
      CONSTRUCT g_wc_filter ON stbysite,stby020,stby005,stan007,oodb006,stan037,stbb009,stbb025,stby009, 
          stby011,stby008,stby012,stbc017,stbc018,stbe031,stby019
                          FROM s_detail1[1].b_stbysite,s_detail1[1].b_stby020,s_detail1[1].b_stby005, 
                              s_detail1[1].b_stan007,s_detail1[1].b_oodb006,s_detail1[1].b_stan037,s_detail1[1].b_stbb009, 
                              s_detail1[1].b_stbb025,s_detail1[1].b_stby009,s_detail1[1].b_stby011,s_detail1[1].b_stby008, 
                              s_detail1[1].b_stby012,s_detail1[1].b_stbc017,s_detail1[1].b_stbc018,s_detail1[1].b_stbe031, 
                              s_detail1[1].b_stby019
 
         BEFORE CONSTRUCT
                     DISPLAY astq302_filter_parser('stbysite') TO s_detail1[1].b_stbysite
            DISPLAY astq302_filter_parser('stby020') TO s_detail1[1].b_stby020
            DISPLAY astq302_filter_parser('stby005') TO s_detail1[1].b_stby005
            DISPLAY astq302_filter_parser('stan007') TO s_detail1[1].b_stan007
            DISPLAY astq302_filter_parser('oodb006') TO s_detail1[1].b_oodb006
            DISPLAY astq302_filter_parser('stan037') TO s_detail1[1].b_stan037
            DISPLAY astq302_filter_parser('stbb009') TO s_detail1[1].b_stbb009
            DISPLAY astq302_filter_parser('stbb025') TO s_detail1[1].b_stbb025
            DISPLAY astq302_filter_parser('stby009') TO s_detail1[1].b_stby009
            DISPLAY astq302_filter_parser('stby011') TO s_detail1[1].b_stby011
            DISPLAY astq302_filter_parser('stby008') TO s_detail1[1].b_stby008
            DISPLAY astq302_filter_parser('stby012') TO s_detail1[1].b_stby012
            DISPLAY astq302_filter_parser('stbc017') TO s_detail1[1].b_stbc017
            DISPLAY astq302_filter_parser('stbc018') TO s_detail1[1].b_stbc018
            DISPLAY astq302_filter_parser('stbe031') TO s_detail1[1].b_stbe031
            DISPLAY astq302_filter_parser('stby019') TO s_detail1[1].b_stby019
 
 
         #單身公用欄位開窗相關處理
         
 
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stbysite>>----
         #Ctrlp:construct.c.filter.page1.b_stbysite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbysite
            #add-point:ON ACTION controlp INFIELD b_stbysite name="construct.c.filter.page1.b_stbysite"
            
            #END add-point
 
 
         #----<<b_stbysite_desc>>----
         #----<<b_stby020>>----
         #Ctrlp:construct.c.filter.page1.b_stby020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby020
            #add-point:ON ACTION controlp INFIELD b_stby020 name="construct.c.filter.page1.b_stby020"
            
            #END add-point
 
 
         #----<<b_stby005>>----
         #Ctrlp:construct.c.filter.page1.b_stby005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby005
            #add-point:ON ACTION controlp INFIELD b_stby005 name="construct.c.filter.page1.b_stby005"
            
            #END add-point
 
 
         #----<<b_stby005_desc>>----
         #----<<b_stby018>>----
         #----<<b_stby018_desc>>----
         #----<<b_stan007>>----
         #Ctrlp:construct.c.page1.b_stan007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stan007
            #add-point:ON ACTION controlp INFIELD b_stan007 name="construct.c.filter.page1.b_stan007"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stan007  #顯示到畫面上
            NEXT FIELD b_stan007                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stan007_desc>>----
         #----<<b_oodb006>>----
         #Ctrlp:construct.c.filter.page1.b_oodb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_oodb006
            #add-point:ON ACTION controlp INFIELD b_oodb006 name="construct.c.filter.page1.b_oodb006"
            
            #END add-point
 
 
         #----<<b_stan037>>----
         #Ctrlp:construct.c.filter.page1.b_stan037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stan037
            #add-point:ON ACTION controlp INFIELD b_stan037 name="construct.c.filter.page1.b_stan037"
            
            #END add-point
 
 
         #----<<b_stbb009>>----
         #Ctrlp:construct.c.filter.page1.b_stbb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbb009
            #add-point:ON ACTION controlp INFIELD b_stbb009 name="construct.c.filter.page1.b_stbb009"
            
            #END add-point
 
 
         #----<<b_stbb025>>----
         #Ctrlp:construct.c.filter.page1.b_stbb025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbb025
            #add-point:ON ACTION controlp INFIELD b_stbb025 name="construct.c.filter.page1.b_stbb025"
            
            #END add-point
 
 
         #----<<b_stby009>>----
         #Ctrlp:construct.c.filter.page1.b_stby009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby009
            #add-point:ON ACTION controlp INFIELD b_stby009 name="construct.c.filter.page1.b_stby009"
            
            #END add-point
 
 
         #----<<b_stby011>>----
         #Ctrlp:construct.c.filter.page1.b_stby011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby011
            #add-point:ON ACTION controlp INFIELD b_stby011 name="construct.c.filter.page1.b_stby011"
            
            #END add-point
 
 
         #----<<b_stby008>>----
         #Ctrlp:construct.c.filter.page1.b_stby008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby008
            #add-point:ON ACTION controlp INFIELD b_stby008 name="construct.c.filter.page1.b_stby008"
            
            #END add-point
 
 
         #----<<b_stby012>>----
         #Ctrlp:construct.c.filter.page1.b_stby012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby012
            #add-point:ON ACTION controlp INFIELD b_stby012 name="construct.c.filter.page1.b_stby012"
            
            #END add-point
 
 
         #----<<b_stbc017>>----
         #Ctrlp:construct.c.filter.page1.b_stbc017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc017
            #add-point:ON ACTION controlp INFIELD b_stbc017 name="construct.c.filter.page1.b_stbc017"
            
            #END add-point
 
 
         #----<<b_stbc018>>----
         #Ctrlp:construct.c.filter.page1.b_stbc018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc018
            #add-point:ON ACTION controlp INFIELD b_stbc018 name="construct.c.filter.page1.b_stbc018"
            
            #END add-point
 
 
         #----<<b_stbe031>>----
         #Ctrlp:construct.c.filter.page1.b_stbe031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbe031
            #add-point:ON ACTION controlp INFIELD b_stbe031 name="construct.c.filter.page1.b_stbe031"
            
            #END add-point
 
 
         #----<<b_stby019>>----
         #Ctrlp:construct.c.filter.page1.b_stby019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stby019
            #add-point:ON ACTION controlp INFIELD b_stby019 name="construct.c.filter.page1.b_stby019"
            
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
 
      CALL astq302_filter_show('stbysite','b_stbysite')
   CALL astq302_filter_show('stby020','b_stby020')
   CALL astq302_filter_show('stby005','b_stby005')
   CALL astq302_filter_show('stan007','b_stan007')
   CALL astq302_filter_show('oodb006','b_oodb006')
   CALL astq302_filter_show('stan037','b_stan037')
   CALL astq302_filter_show('stbb009','b_stbb009')
   CALL astq302_filter_show('stbb025','b_stbb025')
   CALL astq302_filter_show('stby009','b_stby009')
   CALL astq302_filter_show('stby011','b_stby011')
   CALL astq302_filter_show('stby008','b_stby008')
   CALL astq302_filter_show('stby012','b_stby012')
   CALL astq302_filter_show('stbc017','b_stbc017')
   CALL astq302_filter_show('stbc018','b_stbc018')
   CALL astq302_filter_show('stbe031','b_stbe031')
   CALL astq302_filter_show('stby019','b_stby019')
 
 
   CALL astq302_b_fill()
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq302.filter_parser" >}
#應用 qs14 樣板自動產生(Version:6)
#+ filter pasara段
#+ filter欄位解析
PRIVATE FUNCTION astq302_filter_parser(ps_field)
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
 
{<section id="astq302.filter_show" >}
#應用 qs15 樣板自動產生(Version:6)
#+ filter標題欄位顯示搜尋條件
PRIVATE FUNCTION astq302_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq302_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
 
{</section>}
 
{<section id="astq302.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq302_detail_action_trans()
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
 
{<section id="astq302.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq302_detail_index_setting()
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
            IF g_stby_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stby_d.getLength() AND g_stby_d.getLength() > 0
            LET g_detail_idx = g_stby_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stby_d.getLength() THEN
               LET g_detail_idx = g_stby_d.getLength()
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
 
{<section id="astq302.mask_functions" >}
 &include "erp/ast/astq302_mask.4gl"
 
{</section>}
 
{<section id="astq302.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 汇总页签显示
# Memo...........:
# Usage..........: CALL astq302_b_fill_2()
# Date & Author..: 20151203 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astq302_b_fill_2()
DEFINE ls_sql     STRING
DEFINE ls_wc      STRING
DEFINE l_where    STRING
   

   CALL s_aooi500_sql_where(g_prog,'stbysite') RETURNING l_where
 
 
   IF cl_null(g_wc_filter) THEN
      LET g_wc_filter = " 1=1"
   END IF
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
   LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter
 

   LET ls_wc = ls_wc CLIPPED," AND ",l_where   
   
   CALL g_stby1_d.clear()


   IF cl_null(ls_wc) THEN
      LET ls_wc = " 1 = 1 "
   END IF
   
   LET l_ac = 1
   
   LET g_sql = "SELECT  UNIQUE  stbysite,stbysite_desc,stby020,stby005,stby005_desc, 
                                stan007,stan007_desc,oodb006,stan037,SUM(stbb009),SUM(stbb025),SUM(stby009),SUM(stby011),SUM(stby008),SUM(stby012),SUM(stbc017),SUM(stbc018),0,SUM(stby019)",
               "  FROM astq302_tmp",
               " GROUP BY stbysite,stbysite_desc,stby020,stby005,stby005_desc,stan007,stan007_desc,oodb006,stan037"
   
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq302_pb1 FROM g_sql
   DECLARE b_fill_curs1 CURSOR FOR astq302_pb1
 
   OPEN b_fill_curs1 
      
   FOREACH b_fill_curs1 INTO  g_stby1_d[l_ac].stbysite_1,   g_stby1_d[l_ac].stbysite_1_desc, 
                              g_stby1_d[l_ac].stby020_1,    g_stby1_d[l_ac].stby005_1,        g_stby1_d[l_ac].stby005_1_desc, 
                              g_stby1_d[l_ac].stan007_1,    g_stby1_d[l_ac].stan007_1_desc,   g_stby1_d[l_ac].oodb006_1,
                              g_stby1_d[l_ac].stan037_1,    g_stby1_d[l_ac].stbb009_1,        g_stby1_d[l_ac].stbb025_1,
                              g_stby1_d[l_ac].stby009_1,    g_stby1_d[l_ac].stby011_1,        g_stby1_d[l_ac].stby008_1,
                              g_stby1_d[l_ac].stby012_1,    g_stby1_d[l_ac].stbc017_1,        g_stby1_d[l_ac].stbc018_1,
                              g_stby1_d[l_ac].stbe031_1,    g_stby1_d[l_ac].stby019_1   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
 
      
 
      #add-point:b_fill段資料填充
#      #租金=SUM费用单租金类费用，抓取底稿的结算日期来判断
#      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stbb009
#        FROM stbc_t
#       WHERE stbc003 = '3'
#         AND stbcent = g_enterprise
#         AND stbc040 >= l_sdate
#         AND stbc040 <= l_edate
#         AND stbcsite = g_stby_d[l_ac].stbysite
#         AND stbc030 = g_stby_d[l_ac].stby020
#         AND stbc008 = g_stby_d[l_ac].stby005
#         AND stbc025 = g_stby_d[l_ac].stby018
#         AND EXISTS (SELECT 1 FROM stae_t WHERE staeent = stbcent AND stae001 = stbc012 AND stae012 = '0001')
#      IF g_stby_d[l_ac].stbb009 IS NULL THEN
#         LET g_stby_d[l_ac].stbb009 = 0
#      END IF
#         
#      #费用扣项金额=SUM票口否=Y的费用单金额(排除租金类费用)
#      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stbb025
#        FROM stbc_t
#       WHERE stbc003 = '3'
#         AND stbcent = g_enterprise
#         AND stbc040 >= l_sdate
#         AND stbc040 <= l_edate
#         AND stbcsite = g_stby_d[l_ac].stbysite
#         AND stbc030 = g_stby_d[l_ac].stby020
#         AND stbc008 = g_stby_d[l_ac].stby005
#         AND stbc025 = g_stby_d[l_ac].stby018
#         AND stbc038 = 'Y'
#         AND NOT EXISTS (SELECT 1 FROM stae_t WHERE staeent = stbcent AND stae001 = stbc012 AND stae012 = '0001')
#      IF g_stby_d[l_ac].stbb025 IS NULL THEN
#         LET g_stby_d[l_ac].stbb025 = 0
#      END IF
      
      #毛利率=（实收金额-成本金额）/实收金额
      LET g_stby1_d[l_ac].stbe031_1 = (g_stby1_d[l_ac].stby009_1-g_stby1_d[l_ac].stby012_1)/g_stby1_d[l_ac].stby009_1*100
      IF g_stby1_d[l_ac].stbe031_1 IS NULL THEN
         LET g_stby1_d[l_ac].stbe031_1 = 0
      END IF      
#      #成本调整金额=SUM日结成本类型为 %调整% 类的金额
#      SELECT SUM(stbc018) INTO g_stby_d[l_ac].stby008
#        FROM stbc_t
#       WHERE stbcent = g_enterprise
#         AND stbc040 >= l_sdate
#         AND stbc040 <= l_edate
#         AND stbcsite = g_stby_d[l_ac].stbysite
#         AND stbc030 = g_stby_d[l_ac].stby020
#         AND stbc008 = g_stby_d[l_ac].stby005
#         AND stbc025 = g_stby_d[l_ac].stby018
#         AND stbc041 IN ('2','8','12','15','16','17','18','19','20','21','22')
#      IF g_stby_d[l_ac].stby008 IS NULL THEN
#         LET g_stby_d[l_ac].stby008 = 0
#      END IF   
      #end add-point

 
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
  
   CALL g_stby1_d.deleteElement(g_stby1_d.getLength())
 


   #應用 qs06 樣板自動產生(Version:2)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs1
   FREE b_fill_curs1
 
END FUNCTION

################################################################################
# Descriptions...: 创建临时表
# Memo...........:
# Usage..........: CALL astq302_create_tmp()
#                  RETURNING 回传参数
# Date & Author..: 20160111 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astq302_create_tmp()
DEFINE r_success         LIKE type_t.num5

   LET r_success = TRUE
   
   CALL astq302_drop_tmp() 
   CREATE TEMP TABLE astq302_tmp(
      stbysite  VARCHAR(10), 
      stbysite_desc  VARCHAR(500), 
      stby020  VARCHAR(20), 
      stby005  VARCHAR(10), 
      stby005_desc  VARCHAR(500),  
      stan007  VARCHAR(10), 
      stan007_desc  VARCHAR(500), 
      oodb006  DECIMAL(5,2), 
      stan037  VARCHAR(1), 
      stbb009  DECIMAL(20,6), 
      stbb025  DECIMAL(20,6), 
      stby009  DECIMAL(20,6), 
      stby011  DECIMAL(20,6), 
      stby008  DECIMAL(20,6), 
      stby012  DECIMAL(20,6), 
      stbc017  DECIMAL(20,6), 
      stbc018  DECIMAL(20,6), 
      stbe031  DECIMAL(20,6), 
      stby019  DECIMAL(20,6))     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "Create astq302_tmp"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 删除临时表
# Memo...........:
# Usage..........: CALL astq302_drop_tmp()
# Date & Author..: 20160111 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astq302_drop_tmp()
   DROP TABLE astq302_tmp
END FUNCTION

 
{</section>}
 
