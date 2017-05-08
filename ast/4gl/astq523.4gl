#該程式未解開Section, 採用最新樣板產出!
{<section id="astq523.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:4(2016-03-29 17:52:32), PR版次:0004(2016-11-01 14:12:58)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000036
#+ Filename...: astq523
#+ Description: 庫區週期銷售毛利及坪效對比查詢作業
#+ Creator....: 06540(2015-10-31 14:54:27)
#+ Modifier...: 06540 -SD/PR- 02481
 
{</section>}
 
{<section id="astq523.global" >}
#應用 q02 樣板自動產生(Version:42)
#add-point:填寫註解說明 name="global.memo"
#161101-00022#1  2016/11/01  By 02481  aooi500规范调整
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
PRIVATE TYPE type_g_debc_d RECORD
       #statepic       LIKE type_t.chr1,
       
       debc005 LIKE debc_t.debc005, 
   inayl003 LIKE inayl_t.inayl003, 
   debc010 LIKE debc_t.debc010, 
   mhael023 LIKE mhael_t.mhael023, 
   rtaw001 LIKE rtaw_t.rtaw001, 
   rtaxl003 LIKE rtaxl_t.rtaxl003, 
   l_un_day LIKE type_t.num5, 
   l_debc016 LIKE type_t.num20_6, 
   l_discount LIKE type_t.num20_6, 
   l_debc020 LIKE type_t.num20_6, 
   l_stgg009 LIKE type_t.num20_6, 
   l_stgg010 LIKE type_t.num20_6, 
   l_stfc018 LIKE type_t.num20_6, 
   l_deduct LIKE type_t.num20_6, 
   l_deduct_l LIKE type_t.num20_6, 
   l_k LIKE type_t.num15_3, 
   l_debc024 LIKE type_t.num20_6, 
   l_rank LIKE type_t.chr500, 
   l_debc016_2 LIKE type_t.num20_6, 
   l_discount_2 LIKE type_t.num20_6, 
   l_debc020_2 LIKE type_t.num20_6, 
   l_stgg009_2 LIKE type_t.num20_6, 
   l_stgg010_2 LIKE type_t.num20_6, 
   l_stfc018_2 LIKE type_t.num20_6, 
   l_k_2 LIKE type_t.num15_3, 
   l_debc024_2 LIKE type_t.num20_6, 
   l_rank_2 LIKE type_t.chr500, 
   l_debc016_3 LIKE type_t.num20_6, 
   l_discount_3 LIKE type_t.num20_6, 
   l_debc020_3 LIKE type_t.num20_6, 
   l_stgg009_3 LIKE type_t.num20_6, 
   l_stgg010_3 LIKE type_t.num20_6, 
   l_stfc018_3 LIKE type_t.num20_6, 
   l_k_3 LIKE type_t.num15_3, 
   l_debc024_3 LIKE type_t.num20_6, 
   l_rank_3 LIKE type_t.chr500, 
   l_rate1 LIKE type_t.num20_6, 
   l_rate2 LIKE type_t.num20_6 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE ls_unlist_sql       STRING
DEFINE ls_now_sql          STRING
DEFINE last_period_sql     STRING
DEFINE last_year_sql       STRING
DEFINE ls_unlist_day       STRING 
DEFINE g_sql_del           STRING
DEFINE g_sql_ins           STRING
DEFINE merge_margin1       STRING
DEFINE merge_margin2       STRING
DEFINE merge_margin3       STRING
DEFINE merge_discount1     STRING
DEFINE merge_discount2     STRING
DEFINE merge_discount3     STRING
DEFINE merge_discount4     STRING
DEFINE merge_sql1          STRING
DEFINE merge_sql2          STRING
DEFINE merge_sql3          STRING
DEFINE merge_sql4          STRING
DEFINE merge_sql5          STRING
DEFINE merge_sql6          STRING
DEFINE merge_sql7          STRING
DEFINE merge_sql8          STRING
DEFINE merge_sql9          STRING 
DEFINE upd_sql1            STRING
DEFINE ls_sql_union        STRING
DEFINE merge_prei1         STRING 
DEFINE merge_prei2         STRING 
DEFINE merge_prei3         STRING 
DEFINE merge_prei4         STRING 
DEFINE merge_prei5         STRING 
DEFINE merge_prei6         STRING 
DEFINE l_days              LIKE type_t.num5 #前后差异天数DEFINE 
DEFINE merge_stgg010       STRING
DEFINE l_ins_astq523_rtja1 STRING
DEFINE l_ins_astq523_rtja2 STRING
DEFINE l_ins_astq523_rtja3 STRING
DEFINE l_ins_astq523_rtjb  STRING
DEFINE l_ins_astq523_rtjc  STRING

#INPUT条件
DEFINE queryby          LIKE type_t.chr10
DEFINE bdate            DATE
DEFINE edate            DATE
DEFINE bdate1           DATE
DEFINE edate1           DATE
DEFINE bdate11          DATE
DEFINE edate11          DATE
DEFINE dateinput        DATE
DEFINE l_monday         DATE

#存旧值
DEFINE ldebcsite        STRING
DEFINE lrtaw001         STRING
DEFINE lstfa003         STRING
DEFINE ldebc005         STRING
DEFINE ldebc010         STRING
DEFINE lstfa010         STRING

#第二页签 按专柜汇总 
DEFINE g_debc_d1 DYNAMIC ARRAY OF RECORD  #按专柜汇总
   l_debc010_11    LIKE debc_t.debc010,
   l_mhael023_11   LIKE mhael_t.mhael023,
   l_rtaw001_11    LIKE type_t.chr10, 
   l_rtaxl003_11   LIKE type_t.chr500, 
   l_un_day_1      LIKE type_t.num5, 
   l_debc016_11    LIKE type_t.num20_6, 
   l_discount_11   LIKE type_t.num20_6, 
   l_debc020_11    LIKE type_t.num20_6, 
   l_rank_sum      LIKE type_t.num20_6, 
   l_rate_sum      LIKE type_t.num20_6,
   l_stgg009_11    LIKE type_t.num20_6, 
   l_rank_sum2     LIKE type_t.num20_6,
   l_rate_sum2     LIKE type_t.num20_6,
   l_stgg010_11    LIKE type_t.num20_6, 
   l_debc024_11    LIKE type_t.num20_6,
   l_debc016_12    LIKE type_t.num20_6, 
   l_discount_12   LIKE type_t.num20_6, 
   l_debc020_12    LIKE type_t.num20_6, 
   l_stgg009_12    LIKE type_t.num20_6, 
   l_stgg010_12    LIKE type_t.num20_6, 
   l_debc024_12    LIKE type_t.num20_6,
   l_debc016_13    LIKE type_t.num20_6, 
   l_discount_13   LIKE type_t.num20_6, 
   l_debc020_13    LIKE type_t.num20_6, 
   l_stgg009_13    LIKE type_t.num20_6, 
   l_stgg010_13    LIKE type_t.num20_6, 
   l_debc024_13    LIKE type_t.num20_6,
   l_rate11        LIKE type_t.num20_6, 
   l_rate21        LIKE type_t.num20_6
       END RECORD

#第三页签 按管理品类汇总 
DEFINE g_debc_d2 DYNAMIC ARRAY OF RECORD 
   l_rtaw001_11_1  LIKE type_t.chr10, 
   l_rtaxl003_11_1 LIKE type_t.chr500, 
   l_un_day_1_1    LIKE type_t.num5, 
   l_debc016_11_1  LIKE type_t.num20_6, 
   l_discount_11_1 LIKE type_t.num20_6, 
   l_debc020_11_1  LIKE type_t.num20_6, 
   l_stgg009_11_1  LIKE type_t.num20_6, 
   l_stgg010_11_1  LIKE type_t.num20_6, 
   l_debc024_11_1  LIKE type_t.num20_6,
   l_debc016_12_1  LIKE type_t.num20_6, 
   l_discount_12_1 LIKE type_t.num20_6, 
   l_debc020_12_1  LIKE type_t.num20_6, 
   l_stgg009_12_1  LIKE type_t.num20_6, 
   l_stgg010_12_1  LIKE type_t.num20_6, 
   l_debc024_12_1  LIKE type_t.num20_6,
   l_debc016_13_1  LIKE type_t.num20_6, 
   l_discount_13_1 LIKE type_t.num20_6, 
   l_debc020_13_1  LIKE type_t.num20_6, 
   l_stgg009_13_1  LIKE type_t.num20_6, 
   l_stgg010_13_1  LIKE type_t.num20_6, 
   l_debc024_13_1  LIKE type_t.num20_6,
   l_debc024_add   LIKE type_t.num20_6,
   l_debc024_add2  LIKE type_t.num20_6,
   l_debc010_add   LIKE type_t.num20_6,
   l_rate_sell     LIKE type_t.num20_6,
   l_debc010_add_1 LIKE type_t.num20_6,
   l_rate_sell_1   LIKE type_t.num20_6,
   l_stgg009_add   LIKE type_t.num20_6,
   l_rate_sell_2   LIKE type_t.num20_6,
   l_stgg009_add_1 LIKE type_t.num20_6,
   l_rate_sell_3   LIKE type_t.num20_6,
   l_rate11_1      LIKE type_t.num20_6, 
   l_rate21_1      LIKE type_t.num20_6
       END RECORD
DEFINE g_first_qty       LIKE type_t.chr1   #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用       
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_debc_d
DEFINE g_master_t                   type_g_debc_d
DEFINE g_debc_d          DYNAMIC ARRAY OF type_g_debc_d
DEFINE g_debc_d_t        type_g_debc_d
 
      
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
 
{<section id="astq523.main" >}
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
   DECLARE astq523_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq523_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq523_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq523 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq523_init()   
 
      #進入選單 Menu (="N")
      CALL astq523_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
 
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq523
      
   END IF 
   
   CLOSE astq523_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL astq523_drop_tmp() RETURNING l_success
   DROP INDEX astq523_tmp_01
   
   LET l_success = ''                                #161101-00022#1--add
   CALL s_aooi500_drop_temp() RETURNING l_success    #161101-00022#1--add
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq523.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq523_init()
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
   
   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL astq523_create_tmp() RETURNING l_success
   
   #combobox
   CALL cl_set_combo_scc_part('stfa003','6013','4,5')
   
   #清空
   LET lrtaw001 = ''
   LET lstfa003 = ''
   LET ldebc005 = ''  
   LET ldebc010 = ''
   LET lstfa010 = ''

   #赋初值
   LET dateinput = g_today 
   SELECT trunc(dateinput,'d') 
     INTO bdate 
     FROM dual  
   LET edate = bdate + 6
   LET l_days = edate - bdate + 1
   #上周期
   LET bdate11 = bdate - l_days
   LET edate11 = edate - l_days
   #对比周期
   LET edate1 = s_date_get_date(edate,-12,0)
   LET bdate1 = s_date_get_date(bdate,-12,0)
   LET queryby = '1'
   DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1,queryby
   
   #LET g_first_qty = 'N'  #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用 程式一開啟先給N
   #lanjj mark on 2016-07-28 移到uidialog，否则切换门店时初始化为N
   
   #end add-point
 
   CALL astq523_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="astq523.default_search" >}
PRIVATE FUNCTION astq523_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " debc002 = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " debc005 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " debc009 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET g_wc = g_wc, " debc010 = '", g_argv[04], "' AND "
   END IF
   IF NOT cl_null(g_argv[05]) THEN
      LET g_wc = g_wc, " debc011 = '", g_argv[05], "' AND "
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
 
{<section id="astq523.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq523_ui_dialog()
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
   LET g_wc = g_wc," AND 1=1"   #160126-00002#3 160130 By s983961 add
   LET g_first_qty = 'N'  #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用 程式一開啟先給N
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL astq523_b_fill()
   ELSE
      CALL astq523_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_debc_d.clear()
 
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
 
         CALL astq523_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_debc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq523_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq523_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         #160126-00002#3 s983961 --add(s)
         CONSTRUCT g_wc_table ON debcsite,stfa051,stfa003,debc005,debc010,stfa010 #lanjj modify rtaw001 to stfa051 2016-03-28 能效调整
                         FROM debcsite,stfa051,stfa003,debc005,debc010,stfa010
                      
         BEFORE CONSTRUCT
        
         ON ACTION controlp INFIELD debcsite
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'debcsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debcsite  #顯示到畫面上
            NEXT FIELD debcsite                     #返回原欄位
            
         ON ACTION controlp INFIELD stfa051
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " rtax004 ='",cl_get_para(g_enterprise,"","E-CIR-0001"),"'"  #层级
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa051  #顯示到畫面上
            NEXT FIELD stfa051                     #返回原欄位
         
         ON ACTION controlp INFIELD debc005
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debc005  #顯示到畫面上
            NEXT FIELD debc005                     #返回原欄位
            
         ON ACTION controlp INFIELD debc010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa120()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debc010  #顯示到畫面上
            NEXT FIELD debc010                     #返回原欄位
         
         ON ACTION controlp INFIELD stfa010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')"      #供应商类型
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa010  #顯示到畫面上
            NEXT FIELD stfa010                     #返回原欄位
            
         #旧值写入
         AFTER FIELD debcsite CALL FGL_DIALOG_GETBUFFER() RETURNING ldebcsite
         AFTER FIELD stfa051 CALL FGL_DIALOG_GETBUFFER() RETURNING lrtaw001 
         AFTER FIELD stfa003 CALL FGL_DIALOG_GETBUFFER() RETURNING lstfa003
         AFTER FIELD debc005 CALL FGL_DIALOG_GETBUFFER() RETURNING ldebc005
         AFTER FIELD debc010 CALL FGL_DIALOG_GETBUFFER() RETURNING ldebc010
         AFTER FIELD stfa010 CALL FGL_DIALOG_GETBUFFER() RETURNING lstfa010
         
         END CONSTRUCT
         
         INPUT dateinput,bdate,edate,bdate11,edate11,bdate1,edate1,queryby 
          FROM dateinput,bdate,edate,bdate11,edate11,bdate1,edate1,queryby
            ATTRIBUTE(WITHOUT DEFAULTS)
          
          AFTER FIELD queryby
             IF queryby = '1' THEN 
                #本周期
                SELECT trunc(dateinput,'d') 
                  INTO bdate 
                  FROM dual  
                LET edate = bdate + 6 
                LET l_days = edate - bdate + 1
                #上周期
                LET bdate11 = bdate - l_days
                LET edate11 = edate - l_days
                #对比周期
                LET edate1 = s_date_get_date(edate,-12,0)
                LET bdate1 = s_date_get_date(bdate,-12,0)
                DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
                #计算星期
                SELECT trunc(dateinput, 'iw') 
                  INTO l_monday 
                  from dual 
             END IF 
             IF queryby = '2' THEN 
                #本周期
                SELECT last_day(dateinput) INTO edate FROM dual 
                SELECT trunc(dateinput, 'mm') INTO bdate FROM dual 
                LET l_days = edate - bdate + 1
                #上周期
                LET bdate11 = bdate - l_days
                LET edate11 = edate - l_days
                #对比周期
                LET edate1 = s_date_get_date(edate,-12,0)
                LET bdate1 = s_date_get_date(bdate,-12,0)
                DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
             END IF 
          
          
          AFTER FIELD dateinput 
             IF queryby = '1' THEN 
                #本周期
                SELECT trunc(dateinput,'d') 
                  INTO bdate 
                  FROM dual  
                LET edate = bdate + 6 
                LET l_days = edate - bdate + 1
                #上周期
                LET bdate11 = bdate - l_days
                LET edate11 = edate - l_days
                #对比周期
                LET edate1 = s_date_get_date(edate,-12,0)
                LET bdate1 = s_date_get_date(bdate,-12,0)
                DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
                #计算星期
                SELECT trunc(dateinput, 'iw') 
                  INTO l_monday 
                  from dual 
             END IF 
             IF queryby = '2' THEN 
                #本周期
                SELECT last_day(dateinput) INTO edate FROM dual 
                SELECT trunc(dateinput, 'mm') INTO bdate FROM dual 
                LET l_days = edate - bdate + 1
                #上周期
                LET bdate11 = bdate - l_days
                LET edate11 = edate - l_days
                #对比周期
                LET edate1 = s_date_get_date(edate,-12,0)
                LET bdate1 = s_date_get_date(bdate,-12,0)
                DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
             END IF  
            
            AFTER INPUT
               IF INT_FLAG THEN
#               	LET INT_FLAG=0
#                  EXIT INPUT
                  RETURN
               END IF
         END INPUT       
         #160126-00002#3 s983961 --add(e)
         
         #DISPLAY第二页签
         DISPLAY ARRAY g_debc_d1 TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 2
            
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               DISPLAY g_detail_idx TO FORMONLY.h_index
               DISPLAY g_debc_d1.getLength() TO FORMONLY.h_count
               CALL astq523_fetch()
               LET g_master_idx = l_ac
               #add-point:input段before row

               #end add-point  
 
            #自訂ACTION(detail_show,page_2)
            
            #add-point:page2自定義行為

            #end add-point
         END DISPLAY
         
         #DISPLAY第三页签
         DISPLAY ARRAY g_debc_d2 TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 2
            
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx
               DISPLAY g_detail_idx TO FORMONLY.h_index
               DISPLAY g_debc_d2.getLength() TO FORMONLY.h_count
               CALL astq523_fetch()
               LET g_master_idx = l_ac
               #add-point:input段before row

               #end add-point  
 
            #自訂ACTION(detail_show,page_2)
            
            #add-point:page2自定義行為

            #end add-point
         END DISPLAY
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq523_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            #160126-00002#3 160203 By s983961 add(S)
            CALL cl_set_act_visible("insert,query", FALSE)
            CALL cl_set_act_visible("selall,selnone,sel,unsel,filter", FALSE)
            CALL cl_set_comp_visible("sel", FALSE)
            
            DISPLAY ldebcsite,
                 lrtaw001,
                 lstfa003 
              TO debcsite,
                 stfa051, 
                 stfa003 
              
            AFTER DIALOG     
              LET l_days = edate - bdate + 1    
             
            #160126-00002#3 160203 By s983961 add(E)
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astq523_insert()
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
               CALL astq523_query()
               #add-point:ON ACTION query name="menu.query"
               #CALL astq523_query2()  #160126-00002#3 160203 By s983961--mark
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
            CALL astq523_filter()
            #add-point:ON ACTION filter name="menu.filter"
            CALL cl_set_comp_visible("sel", FALSE)   #160126-00002#3 160203 By s983961
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
            CALL astq523_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_debc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               LET g_export_node[2] = base.typeInfo.create(g_debc_d1)
               LET g_export_id[2]   = "s_detail2"
               LET g_export_node[3] = base.typeInfo.create(g_debc_d2)
               LET g_export_id[3]   = "s_detail3"
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
            CALL astq523_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq523_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq523_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq523_b_fill()
 
         
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         #160126-00002#3 160203 By s983961(s)
         ON ACTION ACCEPT
            
            IF cl_null(dateinput) THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = 'acr-00015'
              LET g_errparam.extend = ''
              LET g_errparam.popup = FALSE
              CALL cl_err()
              NEXT FIELD dateinput
            END IF         
         
            LET g_wc = g_wc_table        
            
            LET g_detail_idx = 1
            LET g_detail_idx2 = 1
            CALL astq523_b_fill()
            IF g_debc_d.getLength() > 0 THEN
               CALL DIALOG.setCurrentRow("s_detail1", g_detail_idx)
            END IF
 
            IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = -100
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            END IF
         #160126-00002#3 160203 By s983961(e)   
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
 
{<section id="astq523.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq523_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   #不走本段query，自定单头QBE
   RETURN 
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
   
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_debc_d.clear()
 
   
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
      CONSTRUCT g_wc_table ON debc005,inayl003,debc010,mhael023,rtaw001,rtaxl003
           FROM s_detail1[1].b_debc005,s_detail1[1].b_inayl003,s_detail1[1].b_debc010,s_detail1[1].b_mhael023, 
               s_detail1[1].b_rtaw001,s_detail1[1].b_rtaxl003
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<b_debc005>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_debc005
            #add-point:BEFORE FIELD b_debc005 name="construct.b.page1.b_debc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_debc005
            
            #add-point:AFTER FIELD b_debc005 name="construct.a.page1.b_debc005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_debc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_debc005
            #add-point:ON ACTION controlp INFIELD b_debc005 name="construct.c.page1.b_debc005"
            
            #END add-point
 
 
         #----<<b_inayl003>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_inayl003
            #add-point:BEFORE FIELD b_inayl003 name="construct.b.page1.b_inayl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_inayl003
            
            #add-point:AFTER FIELD b_inayl003 name="construct.a.page1.b_inayl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_inayl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_inayl003
            #add-point:ON ACTION controlp INFIELD b_inayl003 name="construct.c.page1.b_inayl003"
            
            #END add-point
 
 
         #----<<b_debc010>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_debc010
            #add-point:BEFORE FIELD b_debc010 name="construct.b.page1.b_debc010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_debc010
            
            #add-point:AFTER FIELD b_debc010 name="construct.a.page1.b_debc010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_debc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_debc010
            #add-point:ON ACTION controlp INFIELD b_debc010 name="construct.c.page1.b_debc010"
            
            #END add-point
 
 
         #----<<b_mhael023>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_mhael023
            #add-point:BEFORE FIELD b_mhael023 name="construct.b.page1.b_mhael023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_mhael023
            
            #add-point:AFTER FIELD b_mhael023 name="construct.a.page1.b_mhael023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_mhael023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_mhael023
            #add-point:ON ACTION controlp INFIELD b_mhael023 name="construct.c.page1.b_mhael023"
            
            #END add-point
 
 
         #----<<b_rtaw001>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_rtaw001
            #add-point:BEFORE FIELD b_rtaw001 name="construct.b.page1.b_rtaw001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_rtaw001
            
            #add-point:AFTER FIELD b_rtaw001 name="construct.a.page1.b_rtaw001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_rtaw001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_rtaw001
            #add-point:ON ACTION controlp INFIELD b_rtaw001 name="construct.c.page1.b_rtaw001"
            
            #END add-point
 
 
         #----<<b_rtaxl003>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_rtaxl003
            #add-point:BEFORE FIELD b_rtaxl003 name="construct.b.page1.b_rtaxl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_rtaxl003
            
            #add-point:AFTER FIELD b_rtaxl003 name="construct.a.page1.b_rtaxl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_rtaxl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_rtaxl003
            #add-point:ON ACTION controlp INFIELD b_rtaxl003 name="construct.c.page1.b_rtaxl003"
            
            #END add-point
 
 
         #----<<l_un_day>>----
         #----<<l_debc016>>----
         #----<<l_discount>>----
         #----<<l_debc020>>----
         #----<<l_stgg009>>----
         #----<<l_stgg010>>----
         #----<<l_stfc018>>----
         #----<<l_deduct>>----
         #----<<l_deduct_l>>----
         #----<<l_k>>----
         #----<<l_debc024>>----
         #----<<l_rank>>----
         #----<<l_debc016_2>>----
         #----<<l_discount_2>>----
         #----<<l_debc020_2>>----
         #----<<l_stgg009_2>>----
         #----<<l_stgg010_2>>----
         #----<<l_stfc018_2>>----
         #----<<l_k_2>>----
         #----<<l_debc024_2>>----
         #----<<l_rank_2>>----
         #----<<l_debc016_3>>----
         #----<<l_discount_3>>----
         #----<<l_debc020_3>>----
         #----<<l_stgg009_3>>----
         #----<<l_stgg010_3>>----
         #----<<l_stfc018_3>>----
         #----<<l_k_3>>----
         #----<<l_debc024_3>>----
         #----<<l_rank_3>>----
         #----<<l_rate1>>----
         #----<<l_rate2>>----
   
       
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
   CALL astq523_b_fill()
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
 
{<section id="astq523.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq523_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where        STRING
   DEFINE l_where1       STRING
   DEFINE l_where2       STRING
   DEFINE l_ins_astq523_debc1 STRING
   DEFINE l_ins_astq523_debc2 STRING
   DEFINE l_ins_astq523_debc3 STRING
   DEFINE l_ins_astq523_debc_all STRING 
   DEFINE l_success     LIKE type_t.num5
   DEFINE i             LIKE type_t.num5 #用作g_unlist_week数组
   DEFINE l_start_time  DATETIME YEAR TO SECOND #lanjj add on 2016-03-28 用以查看运行时间
   DEFINE l_end_time    DATETIME YEAR TO SECOND #lanjj add on 2016-03-28 用以查看运行时间
   DEFINE l_daterange   STRING 
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'debcsite') RETURNING l_where
   CALL s_aooi500_sql_where(g_prog,'rtjasite') RETURNING l_where1 #lanjj add on 2016-03-29
   CALL s_aooi500_sql_where(g_prog,'stggsite') RETURNING l_where2 #lanjj add on 2016-03-29
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   #LET g_wc = g_wc," AND ",l_where
   
   #Lanjj add on 2016-07-27 start
   LET l_daterange = " 1=1 "
   IF NOT cl_null(bdate) AND NOT cl_null(edate) THEN
      IF NOT cl_null(bdate11) AND NOT cl_null(edate11) THEN
         IF NOT cl_null(bdate1) AND NOT cl_null(edate1) THEN
            LET l_daterange = "  debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                             AND TO_date('",edate,"','yy/mm/dd') 
                              OR debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                             AND TO_date('",edate11,"','yy/mm/dd')
                              OR debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                             AND TO_date('",edate1,"','yy/mm/dd') "
         ELSE 
            LET l_daterange = "  debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                             AND TO_date('",edate,"','yy/mm/dd') 
                              OR debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                             AND TO_date('",edate11,"','yy/mm/dd') "
         END IF
      ELSE 
         IF NOT cl_null(bdate1) AND NOT cl_null(edate1) THEN
            LET l_daterange = "  debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                             AND TO_date('",edate,"','yy/mm/dd') 
                              OR debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                             AND TO_date('",edate1,"','yy/mm/dd') "
         ELSE 
            LET l_daterange = "  debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                             AND TO_date('",edate,"','yy/mm/dd') "
         END IF
      END IF 
   ELSE
      IF NOT cl_null(bdate11) AND NOT cl_null(edate11) THEN
         IF NOT cl_null(bdate1) AND NOT cl_null(edate1) THEN
            LET l_daterange = "  debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                             AND TO_date('",edate11,"','yy/mm/dd')
                              OR debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                             AND TO_date('",edate1,"','yy/mm/dd') "
         ELSE 
            LET l_daterange = " debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                            AND TO_date('",edate11,"','yy/mm/dd') "
         END IF
      ELSE 
         IF NOT cl_null(bdate1) AND NOT cl_null(edate1) THEN
            LET l_daterange = " debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                            AND TO_date('",edate1,"','yy/mm/dd') "
         ELSE 
            LET l_daterange = l_daterange
         END IF
      END IF 
   END IF
   #Lanjj add on 2016-07-27 end
   
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
 
   LET ls_sql_rank = "SELECT  UNIQUE debc005,'',debc010,'','','','','','','','','','','','','','','', 
       '','','','','','','','','','','','','','','','','','','',''  ,DENSE_RANK() OVER( ORDER BY debc_t.debc002, 
       debc_t.debc005,debc_t.debc009,debc_t.debc010,debc_t.debc011) AS RANK FROM debc_t",
 
 
                     "",
                     " WHERE debcent= ? AND debcsite= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("debc_t"),
                     " ORDER BY debc_t.debc002,debc_t.debc005,debc_t.debc009,debc_t.debc010,debc_t.debc011"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   IF g_first_qty='Y' THEN  #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用 當=Y時才需寫tmp table
   SELECT sysdate INTO l_start_time FROM DUAL 
   DISPLAY "l_start_time:",l_start_time
    
   #清空临时表 #lanjj add on 2016-03-29
    TRUNCATE table astq523_debc1
    TRUNCATE table astq523_debc2
    TRUNCATE table astq523_debc3
    TRUNCATE table astq523_rtja
    TRUNCATE table astq523_rtjb
    TRUNCATE table astq523_rtjc
    TRUNCATE TABLE astq523_debc_all #lanjj add on 2016-07-21
    
   #插表astq523_debc1，astq523_debc2，astq523_debc3,astq523_rtja,astq523_rtjb,astq523_rtjc
    
    #lanjj add on 2016-07-21 start
    LET l_ins_astq523_debc_all = " INSERT INTO astq523_debc_all ", 
                                 " SELECT * FROM debc_t WHERE debcent = '",g_enterprise,"' ",
                                 "                        AND ", l_daterange,              
                                 "                        AND ", l_where
    PREPARE ins_debc_all FROM l_ins_astq523_debc_all
    EXECUTE ins_debc_all
    #lanjj add on 2016-07-21 end
    
    LET l_ins_astq523_debc1 = " INSERT INTO astq523_debc1 ",
                              " SELECT * FROM debc_t WHERE debcent = '",g_enterprise,"' ",
                              "                        AND debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                                                       AND TO_date('",edate,"','yy/mm/dd') AND ", l_where
    PREPARE ins_debc1 FROM l_ins_astq523_debc1
    EXECUTE ins_debc1
    
    LET l_ins_astq523_debc2 = " INSERT INTO astq523_debc2 ",
                              " SELECT * FROM debc_t WHERE debcent = '",g_enterprise,"' ",
                              "                        AND debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                                                       AND TO_date('",edate11,"','yy/mm/dd') AND ", l_where
    PREPARE ins_debc2 FROM l_ins_astq523_debc2
    EXECUTE ins_debc2
    
    LET l_ins_astq523_debc3 = " INSERT INTO astq523_debc3 ",
                              " SELECT * FROM debc_t WHERE debcent = '",g_enterprise,"' ",
                              "                        AND debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                                                       AND TO_date('",edate1,"','yy/mm/dd') AND ", l_where
    PREPARE ins_debc3 FROM l_ins_astq523_debc3
    EXECUTE ins_debc3    

    LET l_ins_astq523_rtja1 = " INSERT INTO astq523_rtja ",
                              " SELECT * FROM rtja_t WHERE rtjaent = '",g_enterprise,"' ",
                              "                        AND rtjadocdt BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                                                         AND TO_date('",edate,"','yy/mm/dd') AND ", l_where1
    PREPARE ins_rtja1 FROM l_ins_astq523_rtja1
    EXECUTE ins_rtja1    
    
    LET l_ins_astq523_rtja2 = " INSERT INTO astq523_rtja ",
                              " SELECT * FROM rtja_t WHERE rtjaent = '",g_enterprise,"' ",
                              "                        AND rtjadocdt BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                                                         AND TO_date('",edate11,"','yy/mm/dd') AND ", l_where1,
                              "                        AND NOT EXISTS ( SELECT 1 FROM astq523_rtja 
                                                                         WHERE astq523_rtja.rtjaent = rtja_t.rtjaent
                                                                           AND astq523_rtja.rtjadocno = rtja_t.rtjadocno )" #lanjj add on 2016-07-27
    PREPARE ins_rtja2 FROM l_ins_astq523_rtja2
    EXECUTE ins_rtja2    

    LET l_ins_astq523_rtja3 = " INSERT INTO astq523_rtja ",
                              " SELECT * FROM rtja_t WHERE rtjaent = '",g_enterprise,"' ",
                              "                        AND rtjadocdt BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                                                         AND TO_date('",edate1,"','yy/mm/dd') AND ", l_where1,
                              "                        AND NOT EXISTS ( SELECT 1 FROM astq523_rtja 
                                                                         WHERE astq523_rtja.rtjaent = rtja_t.rtjaent
                                                                           AND astq523_rtja.rtjadocno = rtja_t.rtjadocno )" #lanjj add on 2016-07-27
    PREPARE ins_rtja3 FROM l_ins_astq523_rtja3
    EXECUTE ins_rtja3    
    
    LET l_ins_astq523_rtjb = " INSERT INTO astq523_rtjb ",
                             " SELECT * FROM rtjb_t WHERE rtjbent = '",g_enterprise,"' ",
                             "                        AND EXISTS ( SELECT 1 FROM astq523_rtja WHERE rtjadocno = rtjbdocno) "
    PREPARE ins_rtjb FROM l_ins_astq523_rtjb
    EXECUTE ins_rtjb    
    
    LET l_ins_astq523_rtjc = " INSERT INTO astq523_rtjc ",
                             " SELECT * FROM rtjc_t WHERE rtjcent = '",g_enterprise,"' ",
                             "                        AND EXISTS ( SELECT 1 FROM astq523_rtja WHERE rtjadocno = rtjcdocno) "
    PREPARE ins_rtjc FROM l_ins_astq523_rtjc
    EXECUTE ins_rtjc   
    
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "插临时表:",l_start_time
   
    #未开单库区，未开单天数 经营方式限制为4或5 
    
    #lanjj modify astq523_debc1 to astq523_debc_all on 2016-07-21 抓取三个日期区间全部的库区号 
     LET ls_unlist_sql = " SELECT debcent,debcsite,debc005,inayl003,debc010,mhael023,stfa051,rtaxl003,'",l_days,"'-COUNT(A) days ",
                         "   FROM (      SELECT DISTINCT debcent,debcsite,debc002,debc005,inayl003,debc010,mhael023,stfa051,rtaxl003,SUM(DECODE(debc002, NULL, 0, 1)) A ",
                         "                 FROM astq523_debc_all ",
                         "            LEFT JOIN inayl_t ON inaylent = debcent AND inayl001 = debc005 AND inayl002 = '",g_dlang,"' ",
                         "            LEFT JOIN mhael_t ON mhaelent = debcent AND mhael001 = debc010 AND mhael022 = '",g_dlang,"' ",  
                         "            LEFT JOIN stfa_t ON debcent = stfaent AND debc010 = stfa005 ",
                         #"            LEFT JOIN rtaw_t ON rtawent = debcent AND rtaw002 = debc009 AND rtaw003 = '",cl_get_para(g_enterprise,"","E-CIR-0001"),"' ", lanjj mark 2016-03-29
                         "            LEFT JOIN rtaxl_t ON rtaxlent = debcent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"' ",
                         #"                WHERE debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                         #                                   AND TO_date('",edate,"','yy/mm/dd') ",
                         "                 WHERE debcent = ?  AND stfa003 IN ('4','5') AND ",ls_wc,
                         "             GROUP BY debcent,debcsite,debc002,debc005,inayl003,debc010,mhael023,stfa051,rtaxl003 ",
                         "        ) ",
                         "  GROUP BY debcent,debcsite,debc005,inayl003,debc010,mhael023,stfa051,rtaxl003 "                

   #本周期数据（原价销售额,净销售额,客单数,销售品类排名 ）  经营方式限制为4或5
    LET ls_now_sql = "      SELECT debc005 A1,",
                     "             SUM(debc016) B1,SUM(debc020) C1,SUM(debc024) D1,",
                     "             DENSE_RANK() OVER(PARTITION BY stfa051 ORDER BY SUM(debc020) DESC) l_rank1 ",
                     "       FROM astq523_debc1 ",
                     #"  LEFT JOIN stgg_t ON stggent = debcent and stggsite = debcsite and stgg002 = debc005 AND stgg001 = debc002 ",
                     #"  LEFT JOIN rtaw_t ON rtawent = debcent AND rtaw002 = debc009 AND rtaw003 = '",cl_get_para(g_enterprise,"","E-CIR-0001"),"'", lanjj mark 2016-03-29
                     "  LEFT JOIN stfa_t ON debcent = stfaent AND debc010 = stfa005 ",
                     #"      WHERE debc002 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                     #                         AND TO_date('",edate,"','yy/mm/dd')",
                     #"        AND debcent = '",g_enterprise,"' AND stfa003 IN ('4','5') AND ",ls_wc, 
                     "       WHERE stfa003 IN ('4','5') AND ",ls_wc, 
                     "   GROUP BY stfa051,debc005"                                        
                                        
                     
   #上周期数据（原价销售额,净销售额,客单数,销售品类排名 ）  经营方式限制为4或5
    LET last_period_sql = "      SELECT debc005 A2,",
                          "             SUM(debc016) B2,SUM(debc020) C2,SUM(debc024) D2,",
                          "             DENSE_RANK() OVER(PARTITION BY stfa051 ORDER BY SUM(debc020) DESC) l_rank2 ",
                          "       FROM astq523_debc2 ",
                          #"  LEFT JOIN stgg_t ON stggent = debcent and stggsite = debcsite and stgg002 = debc005 AND stgg001 = debc002 ",
                          #"  LEFT JOIN rtaw_t ON rtawent = debcent AND rtaw002 = debc009 AND rtaw003 = '",cl_get_para(g_enterprise,"","E-CIR-0001"),"'", lanjj mark 2016-03-29
                          "  LEFT JOIN stfa_t ON debcent = stfaent AND debc010 = stfa005 ",
                          #"      WHERE debc002 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                          #                         AND TO_date('",edate11,"','yy/mm/dd')",
                          #"        AND debcent = '",g_enterprise,"' AND stfa003 IN ('4','5') AND ",ls_wc, 
                          "       WHERE stfa003 IN ('4','5') AND ",ls_wc, 
                          "   GROUP BY stfa051,debc005 "  

                          
   #对比周期数据（原价销售额,净销售额,客单数,销售品类排名 ）  经营方式限制为4或5
    LET last_year_sql = "      SELECT debc005 A3,",
                        "             SUM(debc016) B3,SUM(debc020) C3,SUM(debc024) D3,",
                        "             DENSE_RANK() OVER(PARTITION BY stfa051 ORDER BY SUM(debc020) DESC) l_rank3 ",
                        "       FROM astq523_debc3 ",
                        #"  LEFT JOIN stgg_t ON stggent = debcent and stggsite = debcsite and stgg002 = debc005 AND stgg001 = debc002 ",
                        #"  LEFT JOIN rtaw_t ON rtawent = debcent AND rtaw002 = debc009 AND rtaw003 = '",cl_get_para(g_enterprise,"","E-CIR-0001"),"'", lanjj mark 2016-03-29
                        "  LEFT JOIN stfa_t ON debcent = stfaent AND debc010 = stfa005 ",
                        #"      WHERE debc002 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                        #                         AND TO_date('",edate1,"','yy/mm/dd')",
                        #"        AND debcent = '",g_enterprise,"' AND stfa003 IN ('4','5') AND ",ls_wc, 
                        "       WHERE stfa003 IN ('4','5') AND ",ls_wc, 
                        "   GROUP BY stfa051,debc005 "  
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "组sql:",l_start_time                    
                                           
   #联合sql，用作插表                                    
    LET ls_sql_union = "    SELECT debcent,'",g_site,"',debc005,inayl003,debc010,mhael023,stfa051,rtaxl003,days,",
                       "           B1,0,C1,0,'','','',D1,l_rank1,", #本周期
                       "           B2,0,C2,0,'','','',D2,l_rank2,", #上周期
                       "           B3,0,C3,0,'','','',D3,l_rank3,", #对比周期
                       "           DECODE(B2,0,1,B1/B2),DECODE(B3,0,1,B1/B3)",
                       "      FROM (",ls_unlist_sql,") ",
                       " LEFT JOIN (",ls_now_sql,") ON A1 = debc005 ",
                       " LEFT JOIN (",last_period_sql,") ON A2 = debc005 ",
                       " LEFT JOIN (",last_year_sql,") ON A3 = debc005 "
   #清空临时表
    LET g_sql_del = "DELETE FROM astq523_tmp "
    EXECUTE IMMEDIATE g_sql_del
   
   #数据插入临时表
    LET g_sql_ins = " INSERT INTO astq523_tmp 
                      ( enterprise,site,debc005,inayl003,debc010,mhael023,rtaw001,rtaxl003,l_un_day,
                        l_debc016,l_discount,l_debc020,l_stgg009,l_stgg010,l_stfc018,l_k,l_debc024,l_rank,
                        l_debc016_2,l_discount_2,l_debc020_2,l_stgg009_2,l_stgg010_2,l_stfc018_2,l_k_2,l_debc024_2,l_rank_2,
                        l_debc016_3,l_discount_3,l_debc020_3,l_stgg009_3,l_stgg010_3,l_stfc018_3,l_k_3,l_debc024_3,l_rank_3,
                        l_rate1,l_rate2                   
                      )",ls_sql_union         
    PREPARE ins_tmp FROM g_sql_ins
    EXECUTE ins_tmp USING g_enterprise
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "插大临时表:",l_start_time
    
    #更新临时表 本期毛利额
{   毛利额须另外抓取的原因：
       左连接会遗漏无销售数据的专柜产生的毛利额} #现若本周期范围内 若库区（租赁专柜）一笔销售数据也没有，也会产生毛利，但也无法抓到
    LET merge_margin1 = " MERGE INTO astq523_tmp O",
                        " USING ( SELECT stgg002,SUM(stgg009) A ",
                        "           FROM stgg_t ",
                        "          WHERE stgg001 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                                     AND TO_date('",edate,"','yy/mm/dd')",
                        "            AND stggent = '",g_enterprise,"' AND ",l_where2,
                        "       GROUP BY stgg002  ) U ",
                        "   ON (O.debc005 = U.stgg002 ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET O.l_stgg009 = U.A "
    PREPARE upd_margin1 FROM merge_margin1
    EXECUTE upd_margin1

    #更新临时表 上周期毛利额
    LET merge_margin2 = " MERGE INTO astq523_tmp O",
                        " USING ( SELECT stgg002,SUM(stgg009) A ",
                        "           FROM stgg_t ",
                        "          WHERE stgg001 BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                                     AND TO_date('",edate11,"','yy/mm/dd')",
                        "            AND stggent = '",g_enterprise,"' AND ",l_where2,
                        "       GROUP BY stgg002  ) U ",
                        "   ON (O.debc005 = U.stgg002 ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET O.l_stgg009_2 = U.A "
    PREPARE upd_margin2 FROM merge_margin2
    EXECUTE upd_margin2

    #更新临时表 对比周期毛利额 
    LET merge_margin3 = " MERGE INTO astq523_tmp O",
                        " USING ( SELECT stgg002,SUM(stgg009) A ",
                        "           FROM stgg_t ",
                        "          WHERE stgg001 BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                                     AND TO_date('",edate1,"','yy/mm/dd')",
                        "            AND stggent = '",g_enterprise,"' AND ",l_where2,
                        "       GROUP BY stgg002  ) U ",
                        "   ON (O.debc005 = U.stgg002 ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET O.l_stgg009_3 = U.A "
    PREPARE upd_margin3 FROM merge_margin3
    EXECUTE upd_margin3
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "插毛利额:",l_start_time
    #更新临时表 本周期、上周期、对比周期毛利额
#    LET merge_margin = " MERGE INTO astq523_tmp O",
#                       " USING ( SELECT T1.stgg002 stgg002,",
#                       "                SUM(T1.stgg009) A,",
#                       "                SUM(T2.stgg009) B,",
#                       "                SUM(T3.stgg009) C",
#                       "           FROM stgg_t T1 ",
#                       "      LEFT JOIN stgg_t T2 ON T1.stggent = T2.stggent AND T1.stggsite = T2.stggsite AND T1.stgg002 = T2.stgg002 
#                                                 AND T2.stgg001 BETWEEN TO_date('",bdate11,"','yy/mm/dd') AND TO_date('",edate11,"','yy/mm/dd')",
#                       "      LEFT JOIN stgg_t T3 ON T1.stggent = T3.stggent AND T1.stggsite = T3.stggsite AND T1.stgg002 = T3.stgg002
#                                                 AND T3.stgg001 BETWEEN TO_date('",bdate1,"','yy/mm/dd') AND TO_date('",edate1,"','yy/mm/dd')",
#                       "          WHERE T1.stgg001 BETWEEN TO_date('",bdate,"','yy/mm/dd') 
#                                                       AND TO_date('",edate,"','yy/mm/dd')",
#                       "            AND T1.stggent = '",g_enterprise,"' AND T1.stggsite = '",g_site,"' ",
#                       "       GROUP BY T1.stgg002  ) U ",
#                       "   ON (O.debc005 = U.stgg002 ) ",
#                       " WHEN MATCHED THEN ",
#                       "      UPDATE SET O.l_stgg009 = U.A,
#                                         O.l_stgg009_2 = U.B,
#                                         O.l_stgg009_3 = U.C "
#    PREPARE upd_margin FROM merge_margin
#    EXECUTE upd_margin
    
    #更新三周期毛利率 #LANJJ modify 能效调整 2016-03-29
    #UPDATE astq523_tmp SET l_stgg010 = DECODE(l_debc020,0,1,l_stgg009/l_debc020)*100,
    #                       l_stgg010_2 = DECODE(l_debc020_2,0,1,l_stgg009_2/l_debc020_2)*100,
    #                       l_stgg010_3 = DECODE(l_debc020_3,0,1,l_stgg009_3/l_debc020_3)*100

    LET merge_stgg010 = " MERGE INTO astq523_tmp O",
                        " USING ( SELECT debc005,
                                         DECODE(l_debc020,0,1,l_stgg009/l_debc020)*100 A1,
                                         DECODE(l_debc020_2,0,1,l_stgg009_2/l_debc020_2)*100 A2,
                                         DECODE(l_debc020_3,0,1,l_stgg009_3/l_debc020_3)*100 A3 ",
                        "           FROM astq523_tmp  ) U ",
                        "   ON (O.debc005 = U.debc005 ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET l_stgg010 = U.A1,
                                          l_stgg010_2 = U.A2,
                                          l_stgg010_3 = U.A3 "
    PREPARE merge_stgg010 FROM merge_stgg010
    EXECUTE merge_stgg010
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "更新毛利率:",l_start_time
    
    #更新临时表 本期换倍促销折扣额 AND rtjc006（促销方式）= '换倍' #LANJJ modify ON 2016-03-29 能效调整
    LET merge_discount1 = " MERGE INTO astq523_tmp O",
                          " USING ( SELECT rtjb025,sum(rtjc013) A FROM astq523_rtja,astq523_rtjb,astq523_rtjc
                                     WHERE rtjaent = rtjbent 
                                       AND rtjadocno = rtjbdocno
                                       AND rtjbent = rtjcent 
                                       AND rtjbdocno = rtjcdocno
                                       AND rtjbseq = rtjcseq
                                       AND rtjadocdt BETWEEN TO_date('",bdate,"','yy/mm/dd') 
                                                         AND TO_date('",edate,"','yy/mm/dd')
                                       AND rtjaent = '",g_enterprise,"'
                                       AND rtjc006 = '4'
                                     GROUP BY rtjb025
                                   ) U ", 
                          "   ON (O.debc005 = U.rtjb025 ) ",
                          " WHEN MATCHED THEN ",
                          "      UPDATE SET O.l_discount = U.A "
    PREPARE upd_discount1 FROM merge_discount1
    EXECUTE upd_discount1

    #更新临时表 上周期换倍促销折扣额 AND rtjc006（促销方式）= '换倍' #LANJJ modify ON 2016-03-29 能效调整
    LET merge_discount2 = " MERGE INTO astq523_tmp O",
                          " USING ( SELECT rtjb025,sum(rtjc013) A FROM astq523_rtja,astq523_rtjb,astq523_rtjc
                                     WHERE rtjaent = rtjbent 
                                       AND rtjadocno = rtjbdocno
                                       AND rtjbent = rtjcent 
                                       AND rtjbdocno = rtjcdocno
                                       AND rtjbseq = rtjcseq
                                       AND rtjadocdt BETWEEN TO_date('",bdate11,"','yy/mm/dd') 
                                                         AND TO_date('",edate11,"','yy/mm/dd')
                                       AND rtjaent = '",g_enterprise,"'
                                       AND rtjc006 = '4'
                                     GROUP BY rtjb025
                                   ) U ",
                          "   ON (O.debc005 = U.rtjb025 ) ",
                          " WHEN MATCHED THEN ",
                          "      UPDATE SET O.l_discount_2 = U.A "
    PREPARE upd_discount2 FROM merge_discount2
    EXECUTE upd_discount2

    #更新临时表 对比周期换倍促销折扣额 AND rtjc006（促销方式）= '换倍' #LANJJ modify ON 2016-03-29 能效调整
    LET merge_discount3 = " MERGE INTO astq523_tmp O",
                          " USING ( SELECT rtjb025,sum(rtjc013) A FROM astq523_rtja,astq523_rtjb,astq523_rtjc
                                     WHERE rtjaent = rtjbent 
                                       AND rtjadocno = rtjbdocno
                                       AND rtjbent = rtjcent 
                                       AND rtjbdocno = rtjcdocno
                                       AND rtjbseq = rtjcseq
                                       AND rtjadocdt BETWEEN TO_date('",bdate1,"','yy/mm/dd') 
                                                         AND TO_date('",edate1,"','yy/mm/dd')
                                       AND rtjaent = '",g_enterprise,"'
                                       AND rtjc006 = '4'
                                     GROUP BY rtjb025
                                   ) U ",
                          "   ON (O.debc005 = U.rtjb025 ) ",
                          " WHEN MATCHED THEN ",
                          "      UPDATE SET O.l_discount_3 = U.A "
    PREPARE upd_discount3 FROM merge_discount3
    EXECUTE upd_discount3
    SELECT sysdate INTO l_start_time FROM DUAL 
    DISPLAY "更新折扣额:",l_start_time
    
   #更新临时表 本周期、上周期、对比周期 的 【合同基本扣率】
   #先判断aprm310内库区对应的方案的开始日期是否在单头输入的范围内，是则取对应的第一条执行扣率，若取不到则判断结束日期是否在日期范围内，若再取不到则取合同内的扣率
   {LANJJ MARK ON 2016-01-28 重新取回合同基本扣率 不管促销库区的扣率 }
   
   {   LET merge_prei1 = " MERGE INTO astq523_tmp O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh003 BETWEEN to_date('",bdate,"', 'yy/mm/dd') AND
                                                  to_date('",edate,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018 = U.prei058 "
     PREPARE merge_prei1 FROM merge_prei1
     EXECUTE merge_prei1
     
     LET merge_prei2 = " MERGE INTO astq523_tmp O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh003 BETWEEN to_date('",bdate11,"', 'yy/mm/dd') AND
                                                  to_date('",edate11,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018_2 = U.prei058 "
     PREPARE merge_prei2 FROM merge_prei2
     EXECUTE merge_prei2
     
     LET merge_prei3 = " MERGE INTO astq523_tmp O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh003 BETWEEN to_date('",bdate1,"', 'yy/mm/dd') AND
                                                  to_date('",edate1,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018_3 = U.prei058 "
     PREPARE merge_prei3 FROM merge_prei3
     EXECUTE merge_prei3
     
     LET merge_prei4 = " MERGE INTO (SELECT * FROM astq523_tmp WHERE l_stfc018 IS NULL) O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh004 BETWEEN to_date('",bdate,"', 'yy/mm/dd') AND
                                                  to_date('",edate,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018 = U.prei058 "
     PREPARE merge_prei4 FROM merge_prei4
     EXECUTE merge_prei4
     
     LET merge_prei5 = " MERGE INTO (SELECT * FROM astq523_tmp WHERE l_stfc018_2 IS NULL) O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh004 BETWEEN to_date('",bdate11,"', 'yy/mm/dd') AND
                                                  to_date('",edate11,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018_2 = U.prei058 "
     PREPARE merge_prei5 FROM merge_prei5
     EXECUTE merge_prei5
     
     LET merge_prei6 = " MERGE INTO (SELECT * FROM astq523_tmp WHERE l_stfc018_3 IS NULL) O",
                       " USING (   SELECT DISTINCT preient, prei003, preh003, preh004, prei058
                                     FROM (SELECT DISTINCT preient,prei003,preh003,preh004,prei058,
                                                           row_number() OVER(PARTITION BY prei003 ORDER BY preh003,prei058 DESC) rank
                                             FROM preh_t, prei_t
                                            WHERE preient = prehent
                                              AND prei001 = preh001
                                              AND preh004 BETWEEN to_date('",bdate1,"', 'yy/mm/dd') AND
                                                  to_date('",edate1,"', 'yy/mm/dd')
                                            ORDER BY prei003)
                                    WHERE rank = 1
                                    ORDER BY prei003
                                    ) U ",
                       "   ON (O.debc005 = U.prei003 ) ",
                       " WHEN MATCHED THEN ",
                       "      UPDATE SET O.l_stfc018_3 = U.prei058 "
     PREPARE merge_prei6 FROM merge_prei6
     EXECUTE merge_prei6     }
     
    #lanjj add on 2016-03-29 能效调整
     LET merge_sql4 = " MERGE INTO astq523_tmp O",
                      " USING ( SELECT DISTINCT debc005,stfc018 FROM stfc_t,astq523_tmp
                                 WHERE stfcent = '",g_enterprise,"'
                                   AND stfc002 = debc005) U ",
                      "   ON (O.debc005 = U.debc005 ) ",
                      " WHEN MATCHED THEN ",
                      "      UPDATE SET O.l_stfc018 = U.stfc018, ",
                      "                 O.l_stfc018_2 = U.stfc018,",
                      "                 O.l_stfc018_3 = U.stfc018"
     PREPARE upd_tmp4 FROM merge_sql4
     EXECUTE upd_tmp4
   
#     LET merge_sql5 = " MERGE INTO (SELECT * FROM astq523_tmp WHERE l_stfc018_2 IS NULL) O", #LANJJ MARK ON 2016-03-29 能效调整
#                      " USING (   SELECT DISTINCT debc005,stfc018 FROM stfc_t,debc_t
#                                   WHERE stfcent = debcent 
#                                     AND stfc002 = debc005
#                                   ) U ",
#                      "   ON (O.debc005 = U.debc005 ) ",
#                      " WHEN MATCHED THEN ",
#                      "      UPDATE SET O.l_stfc018_2 = U.stfc018 "
#     PREPARE upd_tmp5 FROM merge_sql5
#     EXECUTE upd_tmp5
#     
#     LET merge_sql6 = " MERGE INTO (SELECT * FROM astq523_tmp WHERE l_stfc018_3 IS NULL) O",
#                      " USING (   SELECT DISTINCT debc005,stfc018 FROM stfc_t,debc_t
#                                   WHERE stfcent = debcent 
#                                     AND stfc002 = debc005
#                                   ) U ",
#                      "   ON (O.debc005 = U.debc005 ) ",
#                      " WHEN MATCHED THEN ",
#                      "      UPDATE SET O.l_stfc018_3 = U.stfc018 "
#     PREPARE upd_tmp6 FROM merge_sql6
#     EXECUTE upd_tmp6
     SELECT sysdate INTO l_start_time FROM DUAL 
     DISPLAY "更新扣率:",l_start_time
    
   #更新临时表 本周期、上周期、对比周期 的 【换倍系数】 lanjj modify on 2016-03-29 能效调整
#     LET merge_sql7 = " UPDATE astq523_tmp ",
#                      #"    SET l_k = DECODE(l_stea008,0,l_debg017,l_debc016/(l_debc016-l_discount)), ",
#                      "    SET l_k = DECODE((l_debc016-l_discount),0,0,l_debc016/(l_debc016-l_discount)) , ",
#                      "        l_k_2 = DECODE((l_debc016_2-l_discount_2),0,0,l_debc016_2/(l_debc016_2-l_discount_2)) , ",
#                      "        l_k_3 = DECODE((l_debc016_3-l_discount_3),0,0,l_debc016_3/(l_debc016_3-l_discount_3)) "
     LET merge_sql7 = " MERGE INTO astq523_tmp O",
                      " USING ( SELECT debc005,
                                       DECODE((l_debc016-l_discount),0,0,l_debc016/(l_debc016-l_discount)) A1,
                                       DECODE((l_debc016_2-l_discount_2),0,0,l_debc016_2/(l_debc016_2-l_discount_2)) A2,
                                       DECODE((l_debc016_3-l_discount_3),0,0,l_debc016_3/(l_debc016_3-l_discount_3)) A3 ",
                      "           FROM astq523_tmp  ) U ",
                      "   ON (O.debc005 = U.debc005 ) ",
                      " WHEN MATCHED THEN ",
                      "      UPDATE SET l_k = U.A1,
                                        l_k_2 = U.A2,
                                        l_k_3 = U.A3 "
     PREPARE upd_tmp7 FROM merge_sql7
     EXECUTE upd_tmp7
     SELECT sysdate INTO l_start_time FROM DUAL 
     DISPLAY "更新换倍系数:",l_start_time
     
     END IF  #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用
     #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用 當為N時更新為Y(S)
     IF g_first_qty='N' THEN  
        LET g_first_qty='Y'
     END IF     
     #160713-00020#3 Add By ken 160714 效能優化 判斷第一次開程式時不需寫tmp table使用 當為N時更新為Y(E)
   
   #从临时表取数，填充g_debc_d
    LET ls_sql_rank = " SELECT 
                        debc005,inayl003,debc010,mhael023,rtaw001,rtaxl003,l_un_day,
                        l_debc016,l_discount,l_debc020,l_stgg009,l_stgg010,l_stfc018,l_debc020*l_stfc018/100,l_stgg009-l_debc020*l_stfc018/100,l_k,l_debc024,l_rank,
                        l_debc016_2,l_discount_2,l_debc020_2,l_stgg009_2,l_stgg010_2,l_stfc018_2,l_k_2,l_debc024_2,l_rank_2,
                        l_debc016_3,l_discount_3,l_debc020_3,l_stgg009_3,l_stgg010_3,l_stfc018_3,l_k_3,l_debc024_3,l_rank_3,
                        l_rate1,l_rate2  ",
                      "   FROM astq523_tmp ",
                      "  WHERE enterprise = ? AND site = ? "
    #lanjj 2016-02-16 add ‘本周期合同扣款额’（合同扣款额=净销售额*合同基本扣率）l_debc020*l_stfc018/100
    #                     ‘活动扣款减少额’（活动扣款减少额=毛利额-合同扣款额）l_stgg009-l_debc020*l_stfc018/100
                
   #end add-point
 
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"
 
   PREPARE b_fill_cnt_pre FROM g_sql
   EXECUTE b_fill_cnt_pre USING g_enterprise, g_site INTO g_tot_cnt
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
 
   LET g_sql = "SELECT debc005,'',debc010,'','','','','','','','','','','','','','','','','','','','', 
       '','','','','','','','','','','','','','',''",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   LET g_sql = ls_sql_rank
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq523_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq523_pb
   
   OPEN b_fill_curs USING g_enterprise, g_site
 
   CALL g_debc_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_debc_d[l_ac].debc005,g_debc_d[l_ac].inayl003,g_debc_d[l_ac].debc010,g_debc_d[l_ac].mhael023, 
       g_debc_d[l_ac].rtaw001,g_debc_d[l_ac].rtaxl003,g_debc_d[l_ac].l_un_day,g_debc_d[l_ac].l_debc016, 
       g_debc_d[l_ac].l_discount,g_debc_d[l_ac].l_debc020,g_debc_d[l_ac].l_stgg009,g_debc_d[l_ac].l_stgg010, 
       g_debc_d[l_ac].l_stfc018,g_debc_d[l_ac].l_deduct,g_debc_d[l_ac].l_deduct_l,g_debc_d[l_ac].l_k, 
       g_debc_d[l_ac].l_debc024,g_debc_d[l_ac].l_rank,g_debc_d[l_ac].l_debc016_2,g_debc_d[l_ac].l_discount_2, 
       g_debc_d[l_ac].l_debc020_2,g_debc_d[l_ac].l_stgg009_2,g_debc_d[l_ac].l_stgg010_2,g_debc_d[l_ac].l_stfc018_2, 
       g_debc_d[l_ac].l_k_2,g_debc_d[l_ac].l_debc024_2,g_debc_d[l_ac].l_rank_2,g_debc_d[l_ac].l_debc016_3, 
       g_debc_d[l_ac].l_discount_3,g_debc_d[l_ac].l_debc020_3,g_debc_d[l_ac].l_stgg009_3,g_debc_d[l_ac].l_stgg010_3, 
       g_debc_d[l_ac].l_stfc018_3,g_debc_d[l_ac].l_k_3,g_debc_d[l_ac].l_debc024_3,g_debc_d[l_ac].l_rank_3, 
       g_debc_d[l_ac].l_rate1,g_debc_d[l_ac].l_rate2
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_debc_d[l_ac].statepic = cl_get_actipic(g_debc_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
   
      #end add-point
 
      CALL astq523_detail_show("'1'")      
 
      CALL astq523_debc_t_mask()
 
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
   
 
   
   CALL g_debc_d.deleteElement(g_debc_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   SELECT sysdate INTO l_start_time FROM DUAL 
   DISPLAY "第一页签 完:",l_start_time
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   CALL astq523_b_fill1()
   SELECT sysdate INTO l_start_time FROM DUAL 
   DISPLAY "第二页签 完:",l_start_time
   CALL astq523_b_fill2()
   SELECT sysdate INTO l_start_time FROM DUAL 
   DISPLAY "第三页签 完:",l_start_time
   #end add-point
 
   LET g_detail_cnt = g_debc_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astq523_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq523_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq523_detail_action_trans()
 
   IF g_debc_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL astq523_fetch()
   END IF
   
      CALL astq523_filter_show('debc005','b_debc005')
   CALL astq523_filter_show('inayl003','b_inayl003')
   CALL astq523_filter_show('debc010','b_debc010')
   CALL astq523_filter_show('mhael023','b_mhael023')
   CALL astq523_filter_show('rtaw001','b_rtaw001')
   CALL astq523_filter_show('rtaxl003','b_rtaxl003')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   SELECT sysdate INTO l_end_time FROM DUAL 
   DISPLAY "l_end_time:",l_end_time
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq523.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq523_fetch()
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
 
{<section id="astq523.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq523_detail_show(ps_page)
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
 
      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq523.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astq523_filter()
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
      CONSTRUCT g_wc_filter ON debc005,inayl003,debc010,mhael023,rtaw001,rtaxl003
                          FROM s_detail1[1].b_debc005,s_detail1[1].b_inayl003,s_detail1[1].b_debc010, 
                              s_detail1[1].b_mhael023,s_detail1[1].b_rtaw001,s_detail1[1].b_rtaxl003 
 
 
         BEFORE CONSTRUCT
                     DISPLAY astq523_filter_parser('debc005') TO s_detail1[1].b_debc005
            DISPLAY astq523_filter_parser('inayl003') TO s_detail1[1].b_inayl003
            DISPLAY astq523_filter_parser('debc010') TO s_detail1[1].b_debc010
            DISPLAY astq523_filter_parser('mhael023') TO s_detail1[1].b_mhael023
            DISPLAY astq523_filter_parser('rtaw001') TO s_detail1[1].b_rtaw001
            DISPLAY astq523_filter_parser('rtaxl003') TO s_detail1[1].b_rtaxl003
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<b_debc005>>----
         #Ctrlp:construct.c.filter.page1.b_debc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_debc005
            #add-point:ON ACTION controlp INFIELD b_debc005 name="construct.c.filter.page1.b_debc005"
            
            #END add-point
 
 
         #----<<b_inayl003>>----
         #Ctrlp:construct.c.filter.page1.b_inayl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_inayl003
            #add-point:ON ACTION controlp INFIELD b_inayl003 name="construct.c.filter.page1.b_inayl003"
            
            #END add-point
 
 
         #----<<b_debc010>>----
         #Ctrlp:construct.c.filter.page1.b_debc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_debc010
            #add-point:ON ACTION controlp INFIELD b_debc010 name="construct.c.filter.page1.b_debc010"
            
            #END add-point
 
 
         #----<<b_mhael023>>----
         #Ctrlp:construct.c.filter.page1.b_mhael023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_mhael023
            #add-point:ON ACTION controlp INFIELD b_mhael023 name="construct.c.filter.page1.b_mhael023"
            
            #END add-point
 
 
         #----<<b_rtaw001>>----
         #Ctrlp:construct.c.filter.page1.b_rtaw001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_rtaw001
            #add-point:ON ACTION controlp INFIELD b_rtaw001 name="construct.c.filter.page1.b_rtaw001"
            
            #END add-point
 
 
         #----<<b_rtaxl003>>----
         #Ctrlp:construct.c.filter.page1.b_rtaxl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_rtaxl003
            #add-point:ON ACTION controlp INFIELD b_rtaxl003 name="construct.c.filter.page1.b_rtaxl003"
            
            #END add-point
 
 
         #----<<l_un_day>>----
         #----<<l_debc016>>----
         #----<<l_discount>>----
         #----<<l_debc020>>----
         #----<<l_stgg009>>----
         #----<<l_stgg010>>----
         #----<<l_stfc018>>----
         #----<<l_deduct>>----
         #----<<l_deduct_l>>----
         #----<<l_k>>----
         #----<<l_debc024>>----
         #----<<l_rank>>----
         #----<<l_debc016_2>>----
         #----<<l_discount_2>>----
         #----<<l_debc020_2>>----
         #----<<l_stgg009_2>>----
         #----<<l_stgg010_2>>----
         #----<<l_stfc018_2>>----
         #----<<l_k_2>>----
         #----<<l_debc024_2>>----
         #----<<l_rank_2>>----
         #----<<l_debc016_3>>----
         #----<<l_discount_3>>----
         #----<<l_debc020_3>>----
         #----<<l_stgg009_3>>----
         #----<<l_stgg010_3>>----
         #----<<l_stfc018_3>>----
         #----<<l_k_3>>----
         #----<<l_debc024_3>>----
         #----<<l_rank_3>>----
         #----<<l_rate1>>----
         #----<<l_rate2>>----
   
 
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
   
      CALL astq523_filter_show('debc005','b_debc005')
   CALL astq523_filter_show('inayl003','b_inayl003')
   CALL astq523_filter_show('debc010','b_debc010')
   CALL astq523_filter_show('mhael023','b_mhael023')
   CALL astq523_filter_show('rtaw001','b_rtaw001')
   CALL astq523_filter_show('rtaxl003','b_rtaxl003')
 
    
   CALL astq523_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq523.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astq523_filter_parser(ps_field)
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
 
{<section id="astq523.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astq523_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq523_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astq523.insert" >}
#+ insert
PRIVATE FUNCTION astq523_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astq523.modify" >}
#+ modify
PRIVATE FUNCTION astq523_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq523.reproduce" >}
#+ reproduce
PRIVATE FUNCTION astq523_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq523.delete" >}
#+ delete
PRIVATE FUNCTION astq523_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq523.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq523_detail_action_trans()
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
 
{<section id="astq523.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq523_detail_index_setting()
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
            IF g_debc_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_debc_d.getLength() AND g_debc_d.getLength() > 0
            LET g_detail_idx = g_debc_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_debc_d.getLength() THEN
               LET g_detail_idx = g_debc_d.getLength()
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
 
{<section id="astq523.mask_functions" >}
 &include "erp/ast/astq523_mask.4gl"
 
{</section>}
 
{<section id="astq523.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 录入查询条件
# Date & Author..: 2015-09-09 BY LanJJ
# Modify.........:
################################################################################
PRIVATE FUNCTION astq523_query2()
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
   CALL g_debc_d.clear()
   
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
      CONSTRUCT g_wc_table ON debcsite,rtaw001,stfa003,debc005,debc010,stfa010
                         FROM debcsite,rtaw001,stfa003,debc005,debc010,stfa010
                      
         BEFORE CONSTRUCT
        
         ON ACTION controlp INFIELD debcsite
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'debcsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debcsite  #顯示到畫面上
            NEXT FIELD debcsite                     #返回原欄位
            
         ON ACTION controlp INFIELD rtaw001
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " rtax004 ='",cl_get_para(g_enterprise,"","E-CIR-0001"),"'"  #层级
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO rtaw001  #顯示到畫面上
            NEXT FIELD rtaw001                     #返回原欄位
         
         ON ACTION controlp INFIELD debc005
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debc005  #顯示到畫面上
            NEXT FIELD debc005                     #返回原欄位
            
         ON ACTION controlp INFIELD debc010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa120()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO debc010  #顯示到畫面上
            NEXT FIELD debc010                     #返回原欄位
         
         ON ACTION controlp INFIELD stfa010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')"      #供应商类型
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa010  #顯示到畫面上
            NEXT FIELD stfa010                     #返回原欄位
            
         #旧值写入
         AFTER FIELD debcsite CALL FGL_DIALOG_GETBUFFER() RETURNING ldebcsite
         AFTER FIELD rtaw001 CALL FGL_DIALOG_GETBUFFER() RETURNING lrtaw001 
         AFTER FIELD stfa003 CALL FGL_DIALOG_GETBUFFER() RETURNING lstfa003
         AFTER FIELD debc005 CALL FGL_DIALOG_GETBUFFER() RETURNING ldebc005
         AFTER FIELD debc010 CALL FGL_DIALOG_GETBUFFER() RETURNING ldebc010
         AFTER FIELD stfa010 CALL FGL_DIALOG_GETBUFFER() RETURNING lstfa010
         
      END CONSTRUCT

      INPUT dateinput,bdate,edate,bdate11,edate11,bdate1,edate1,queryby 
       FROM dateinput,bdate,edate,bdate11,edate11,bdate1,edate1,queryby
         ATTRIBUTE(WITHOUT DEFAULTS)
       
       AFTER FIELD queryby
          IF queryby = '1' THEN 
             #本周期
             SELECT trunc(dateinput,'d') 
               INTO bdate 
               FROM dual  
             LET edate = bdate + 6 
             LET l_days = edate - bdate + 1
             #上周期
             LET bdate11 = bdate - l_days
             LET edate11 = edate - l_days
             #对比周期
             LET edate1 = s_date_get_date(edate,-12,0)
             LET bdate1 = s_date_get_date(bdate,-12,0)
             DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
             #计算星期
             SELECT trunc(dateinput, 'iw') 
               INTO l_monday 
               from dual 
          END IF 
          IF queryby = '2' THEN 
             #本周期
             SELECT last_day(dateinput) INTO edate FROM dual 
             SELECT trunc(dateinput, 'mm') INTO bdate FROM dual 
             LET l_days = edate - bdate + 1
             #上周期
             LET bdate11 = bdate - l_days
             LET edate11 = edate - l_days
             #对比周期
             LET edate1 = s_date_get_date(edate,-12,0)
             LET bdate1 = s_date_get_date(bdate,-12,0)
             DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
          END IF 
       
       
       AFTER FIELD dateinput 
          IF queryby = '1' THEN 
             #本周期
             SELECT trunc(dateinput,'d') 
               INTO bdate 
               FROM dual  
             LET edate = bdate + 6 
             LET l_days = edate - bdate + 1
             #上周期
             LET bdate11 = bdate - l_days
             LET edate11 = edate - l_days
             #对比周期
             LET edate1 = s_date_get_date(edate,-12,0)
             LET bdate1 = s_date_get_date(bdate,-12,0)
             DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
             #计算星期
             SELECT trunc(dateinput, 'iw') 
               INTO l_monday 
               from dual 
          END IF 
          IF queryby = '2' THEN 
             #本周期
             SELECT last_day(dateinput) INTO edate FROM dual 
             SELECT trunc(dateinput, 'mm') INTO bdate FROM dual 
             LET l_days = edate - bdate + 1
             #上周期
             LET bdate11 = bdate - l_days
             LET edate11 = edate - l_days
             #对比周期
             LET edate1 = s_date_get_date(edate,-12,0)
             LET bdate1 = s_date_get_date(bdate,-12,0)
             DISPLAY BY NAME dateinput,edate,bdate,edate11,bdate11,edate1,bdate1
          END IF  
         
         AFTER INPUT
            IF INT_FLAG THEN
#            	LET INT_FLAG=0
#               EXIT INPUT
               RETURN
            END IF
      END INPUT       
 
      ON ACTION accept
         #add-point:ON ACTION accept

         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         RETURN
         EXIT DIALOG
         
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前
      BEFORE DIALOG    
           
         DISPLAY ldebcsite,
                 lrtaw001,
                 lstfa003 
              TO debcsite,
                 rtaw001, 
                 stfa003 
              
      AFTER DIALOG     
         LET l_days = edate - bdate + 1      
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
   CALL astq523_b_fill()
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
# Descriptions...: 按专柜汇总
# Date & Author..: 2015-11-04 BY LanJJ
# Modify.........: 2016-02-16 BY lanjj 增加本周期销售排名’‘本周期毛利额排名’‘本周期专柜净销售额占比’‘本周期专柜毛利额占比’
################################################################################
PRIVATE FUNCTION astq523_b_fill1()
DEFINE l_sql1         STRING
DEFINE l_cnt2         LIKE type_t.num5 
DEFINE l_debc020_sum  LIKE debc_t.debc020
DEFINE l_stgg009_sum  LIKE stgg_t.stgg009

   CALL g_debc_d1.clear()
    LET l_sql1 = " SELECT debc010,mhael023,rtaw001,rtaxl003,SUM(l_un_day),",
                 "        SUM(l_debc016),SUM(l_discount),",
                 --
                 "        SUM(l_debc020),DENSE_RANK() OVER(ORDER BY SUM(l_debc020) DESC),'',",
                 --
                 "        SUM(l_stgg009),DENSE_RANK() OVER(ORDER BY SUM(l_stgg009) DESC),'',", 
                 #lanjj add ‘本周期销售排名’‘本周期毛利额排名’‘本周期专柜净销售额占比’‘本周期专柜毛利额占比’
                 "        SUM(l_stgg009)/SUM(l_debc020)*100,SUM(l_debc024),",#SUM(l_debc016)/(SUM(l_debc016)-SUM(l_discount)),
                 "        SUM(l_debc016_2),SUM(l_discount_2),SUM(l_debc020_2),SUM(l_stgg009_2),",
                 "        SUM(l_stgg009_2)/SUM(l_debc020_2)*100,SUM(l_debc024_2),",#SUM(l_debc016_2)/(SUM(l_debc016_2)-SUM(l_discount_2)),
                 "        SUM(l_debc016_3),SUM(l_discount_3),SUM(l_debc020_3),SUM(l_stgg009_3),",
                 "        SUM(l_stgg009_3)/SUM(l_debc020_3)*100,SUM(l_debc024_3),",#SUM(l_debc016_3)/(SUM(l_debc016_3)-SUM(l_discount_3)),
                 "        SUM(l_debc020)/SUM(l_debc020_2)*100,SUM(l_debc020)/SUM(l_debc020_3)*100  ",
                 "   FROM astq523_tmp ",
                 "  GROUP BY debc010,mhael023,rtaw001,rtaxl003 "
                      

   --DISPLAY "l_sql1:",l_sql1  
   PREPARE sel_debc1_pre1 FROM l_sql1
   DECLARE sel_debc1_cs1  CURSOR FOR sel_debc1_pre1   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_debc1_cs1 # USING g_enterprise,g_site
                       INTO g_debc_d1[l_ac].l_debc010_11,
                            g_debc_d1[l_ac].l_mhael023_11,
                            g_debc_d1[l_ac].l_rtaw001_11, 
                            g_debc_d1[l_ac].l_rtaxl003_11,
                            g_debc_d1[l_ac].l_un_day_1,   
                            g_debc_d1[l_ac].l_debc016_11, 
                            g_debc_d1[l_ac].l_discount_11,
                            g_debc_d1[l_ac].l_debc020_11, 
                            g_debc_d1[l_ac].l_rank_sum,
                            g_debc_d1[l_ac].l_rate_sum,
                            g_debc_d1[l_ac].l_stgg009_11,
                            g_debc_d1[l_ac].l_rank_sum2,
                            g_debc_d1[l_ac].l_rate_sum2,
                            g_debc_d1[l_ac].l_stgg010_11,
                            g_debc_d1[l_ac].l_debc024_11,                            
                            g_debc_d1[l_ac].l_debc016_12, 
                            g_debc_d1[l_ac].l_discount_12,
                            g_debc_d1[l_ac].l_debc020_12, 
                            g_debc_d1[l_ac].l_stgg009_12, 
                            g_debc_d1[l_ac].l_stgg010_12,
                            g_debc_d1[l_ac].l_debc024_12,                             
                            g_debc_d1[l_ac].l_debc016_13, 
                            g_debc_d1[l_ac].l_discount_13,
                            g_debc_d1[l_ac].l_debc020_13,  
                            g_debc_d1[l_ac].l_stgg009_13, 
                            g_debc_d1[l_ac].l_stgg010_13, 
                            g_debc_d1[l_ac].l_debc024_13, 
                            g_debc_d1[l_ac].l_rate11,     
                            g_debc_d1[l_ac].l_rate21    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #销售占比
      LET g_debc_d1[l_ac].l_rate_sum = 0
      SELECT SUM(l_debc020) 
        INTO l_debc020_sum
        FROM astq523_tmp
        
      LET g_debc_d1[l_ac].l_rate_sum = g_debc_d1[l_ac].l_debc020_11/l_debc020_sum*100
      #毛利占比
      LET g_debc_d1[l_ac].l_rate_sum2 = 0
      SELECT SUM(l_stgg009) 
        INTO l_stgg009_sum
        FROM astq523_tmp
        
      LET g_debc_d1[l_ac].l_rate_sum2 = g_debc_d1[l_ac].l_stgg009_11/l_stgg009_sum*100

      LET l_ac = l_ac + 1
   END FOREACH
   
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CALL g_debc_d1.deleteElement(g_debc_d1.getLength())
   
   DISPLAY ARRAY g_debc_d1 TO s_detail2.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_debc1_cs1
   
END FUNCTION

################################################################################
# Descriptions...: 创建临时表
# Date & Author..: 2015-09-18 By LanJJ
# Modify.........: 2016-03-29 BY lanjj 加临时表、索引
################################################################################
PRIVATE FUNCTION astq523_create_tmp()
DEFINE r_success         LIKE type_t.num5
DEFINE l_create1         STRING 
DEFINE l_create2         STRING
DEFINE l_create3         STRING 

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF NOT astq523_drop_tmp() THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   CREATE TEMP TABLE astq523_tmp(
   enterprise    LIKE type_t.chr500, 
   site          LIKE debc_t.debcsite,
   debc005       LIKE debc_t.debc005, 
   inayl003      LIKE inayl_t.inayl003, 
   debc010       LIKE debc_t.debc010, 
   mhael023      LIKE mhael_t.mhael023, 
   rtaw001       LIKE rtaw_t.rtaw001, 
   rtaxl003      LIKE rtaxl_t.rtaxl003, 
   l_un_day      LIKE type_t.num5, 
   l_debc016     LIKE type_t.num20_6,  #本周期 
   l_discount    LIKE type_t.num20_6, 
   l_debc020     LIKE type_t.num20_6, 
   l_stgg009     LIKE type_t.num20_6, 
   l_stgg010     LIKE type_t.num20_6, 
   l_stfc018     LIKE type_t.num20_6, 
   l_k           LIKE type_t.num15_3, 
   l_debc024     LIKE type_t.num20_6, 
   l_rank        LIKE type_t.chr500, 
   l_debc016_2   LIKE type_t.num20_6,  #上周期
   l_discount_2  LIKE type_t.num20_6, 
   l_debc020_2   LIKE type_t.num20_6, 
   l_stgg009_2   LIKE type_t.num20_6, 
   l_stgg010_2   LIKE type_t.num20_6, 
   l_stfc018_2   LIKE type_t.num20_6, 
   l_k_2         LIKE type_t.num15_3, 
   l_debc024_2   LIKE type_t.num20_6, 
   l_rank_2      LIKE type_t.chr500, 
   l_debc016_3   LIKE type_t.num20_6,  #对比周期
   l_discount_3  LIKE type_t.num20_6, 
   l_debc020_3   LIKE type_t.num20_6, 
   l_stgg009_3   LIKE type_t.num20_6, 
   l_stgg010_3   LIKE type_t.num20_6, 
   l_stfc018_3   LIKE type_t.num20_6, 
   l_k_3         LIKE type_t.num15_3, 
   l_debc024_3   LIKE type_t.num20_6, 
   l_rank_3      LIKE type_t.chr500, 
   l_rate1       LIKE type_t.num20_6, 
   l_rate2       LIKE type_t.num20_6
     )

   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_tmp'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT * FROM debc_t WHERE 1=2 INTO TEMP astq523_debc_all
   
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_debc_all'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   
   SELECT * FROM debc_t WHERE 1=2 INTO TEMP astq523_debc1
   
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_debc1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
      
   SELECT * FROM debc_t WHERE 1=2 INTO TEMP astq523_debc2
   
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_debc2'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT * FROM debc_t WHERE 1=2 INTO TEMP astq523_debc3
      
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_debc3'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT * FROM rtja_t WHERE 1=2 INTO TEMP astq523_rtja
      
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_rtja'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT * FROM rtjb_t WHERE 1=2 INTO TEMP astq523_rtjb
      
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_rtjb'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   SELECT * FROM rtjc_t WHERE 1=2 INTO TEMP astq523_rtjc
      
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq523_rtjc'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP INDEX astq523_tmp_01
   CREATE INDEX astq523_tmp_01 ON astq523_rtja(rtjadocdt,rtjaent)
   DROP INDEX astq523_tmp_02
   CREATE INDEX astq523_tmp_02 ON astq523_rtjc(rtjc004)
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: drop临时表
# Date & Author..: 2015-09-18 By lanjj
# Modify.........: 
################################################################################
PRIVATE FUNCTION astq523_drop_tmp()
DEFINE r_success          LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   DROP TABLE astq523_tmp

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_tmp'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_debc_all

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_debc_all'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_debc1

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_debc1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_debc2

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_debc2'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_debc3

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_debc3'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_rtja
   
   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_rtja'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_rtjb
   
   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_rtjb'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE astq523_rtjc
   
   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq523_rtjc'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 第三页签（按管理品类汇总）
# Date & Author..: 2015-11-04 BY LANJJ
# Modify.........: 2016-02-16 BY lanjj
#                  1、在“按管理部类汇总”页签中增加字段，‘本周期与上周期客单数増涨量’‘本周期与对比周期客单数増涨量’
#                  2、在“按管理部类汇总”页签中增加字段‘本周期与上周期净销售増涨额’‘本周期与上周期净销售増涨比’‘本周期与对比周期仅销售増涨额’‘本周期与对比周期仅销售増涨比’
#                  3、在“按管理部类汇总”页签中增加字段‘本周期与上周期毛利额増涨额’‘本周期与上周期毛利额増涨比’‘本周期与对比周期毛利额増涨额’‘本周期与对比周期毛利额増涨比’
################################################################################
PRIVATE FUNCTION astq523_b_fill2()
DEFINE l_sql1   STRING
DEFINE l_cnt2   LIKE type_t.num5 
 
   CALL g_debc_d2.clear()
    LET l_sql1 = " SELECT rtaw001,rtaxl003,SUM(l_un_day),",
                 "        SUM(l_debc016),SUM(l_discount),SUM(l_debc020),SUM(l_stgg009),",
                 "        SUM(l_stgg009)/SUM(l_debc020)*100,SUM(l_debc024),",#SUM(l_debc016)/(SUM(l_debc016)-SUM(l_discount)),
                 "        SUM(l_debc016_2),SUM(l_discount_2),SUM(l_debc020_2),SUM(l_stgg009_2),",
                 "        SUM(l_stgg009_2)/SUM(l_debc020_2)*100,SUM(l_debc024_2),",#SUM(l_debc016_2)/(SUM(l_debc016_2)-SUM(l_discount_2)),
                 "        SUM(l_debc016_3),SUM(l_discount_3),SUM(l_debc020_3),SUM(l_stgg009_3),",
                 "        SUM(l_stgg009_3)/SUM(l_debc020_3)*100,SUM(l_debc024_3),",#SUM(l_debc016_3)/(SUM(l_debc016_3)-SUM(l_discount_3)),
                 "        SUM(l_debc024)-SUM(l_debc024_2),",                     #‘本周期与上周期客单数増涨量’
                 "        SUM(l_debc024)-SUM(l_debc024_3),",                     #‘本周期与对比周期客单数増涨量’
                 "        SUM(l_debc020)-SUM(l_debc020_2),",                     #‘本周期与上周期净销售増涨额’
                 "        DECODE(SUM(l_debc020_2),0,100,(SUM(l_debc020)-SUM(l_debc020_2))/SUM(l_debc020_2)),",  #‘本周期与上周期净销售増涨比’
                 "        SUM(l_debc020)-SUM(l_debc020_3),",                     #‘本周期与对比周期净销售増涨额’
                 "        DECODE(SUM(l_debc020_3),0,100,(SUM(l_debc020)-SUM(l_debc020_3))/SUM(l_debc020_3)),",  #‘本周期与对比周期净销售増涨比’
                 "        SUM(l_stgg009)-SUM(l_stgg009_2),",                     #‘本周期与上周期毛利额増涨额’
                 "        DECODE(SUM(l_stgg009_2),0,100,(SUM(l_stgg009)-SUM(l_stgg009_2))/SUM(l_stgg009_2)),",  #‘本周期与上周期毛利额増涨比’
                 "        SUM(l_stgg009)-SUM(l_stgg009_3),",                     #‘本周期与对比周期毛利额増涨额’
                 "        DECODE(SUM(l_stgg009_3),0,100,(SUM(l_stgg009)-SUM(l_stgg009_3))/SUM(l_stgg009_3)),",  #‘本周期与对比周期毛利额増涨比’
                 "        SUM(l_debc020)/SUM(l_debc020_2)*100,SUM(l_debc020)/SUM(l_debc020_3)*100  ",
                 "   FROM astq523_tmp ",
                 "  GROUP BY rtaw001,rtaxl003 "
                      

   --DISPLAY "l_sql1:",l_sql1  
   PREPARE sel_debc2_pre2 FROM l_sql1
   DECLARE sel_debc2_cs2  CURSOR FOR sel_debc2_pre2   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_debc2_cs2
                       INTO g_debc_d2[l_ac].l_rtaw001_11_1,
                            g_debc_d2[l_ac].l_rtaxl003_11_1,
                            g_debc_d2[l_ac].l_un_day_1_1,   
                            g_debc_d2[l_ac].l_debc016_11_1, 
                            g_debc_d2[l_ac].l_discount_11_1,
                            g_debc_d2[l_ac].l_debc020_11_1, 
                            g_debc_d2[l_ac].l_stgg009_11_1, 
                            g_debc_d2[l_ac].l_stgg010_11_1, 
                            g_debc_d2[l_ac].l_debc024_11_1, 
                            g_debc_d2[l_ac].l_debc016_12_1, 
                            g_debc_d2[l_ac].l_discount_12_1,
                            g_debc_d2[l_ac].l_debc020_12_1, 
                            g_debc_d2[l_ac].l_stgg009_12_1, 
                            g_debc_d2[l_ac].l_stgg010_12_1, 
                            g_debc_d2[l_ac].l_debc024_12_1, 
                            g_debc_d2[l_ac].l_debc016_13_1, 
                            g_debc_d2[l_ac].l_discount_13_1,
                            g_debc_d2[l_ac].l_debc020_13_1,  
                            g_debc_d2[l_ac].l_stgg009_13_1, 
                            g_debc_d2[l_ac].l_stgg010_13_1, 
                            g_debc_d2[l_ac].l_debc024_13_1,
                            g_debc_d2[l_ac].l_debc024_add,
                            g_debc_d2[l_ac].l_debc024_add2, 
                            g_debc_d2[l_ac].l_debc010_add,  
                            g_debc_d2[l_ac].l_rate_sell,    
                            g_debc_d2[l_ac].l_debc010_add_1,
                            g_debc_d2[l_ac].l_rate_sell_1,  
                            g_debc_d2[l_ac].l_stgg009_add,  
                            g_debc_d2[l_ac].l_rate_sell_2,  
                            g_debc_d2[l_ac].l_stgg009_add_1,
                            g_debc_d2[l_ac].l_rate_sell_3,  
                            g_debc_d2[l_ac].l_rate11_1,    
                            g_debc_d2[l_ac].l_rate21_1     
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      LET l_ac = l_ac + 1
   END FOREACH
   
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CALL g_debc_d2.deleteElement(g_debc_d2.getLength())
   
   DISPLAY ARRAY g_debc_d2 TO s_detail3.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_debc2_cs2
   
END FUNCTION

 
{</section>}
 
