#該程式未解開Section, 採用最新樣板產出!
{<section id="astq507.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:8(2016-09-14 15:28:17), PR版次:0008(2016-09-14 13:46:10)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000051
#+ Filename...: astq507
#+ Description: 專櫃每日效益表查詢作業
#+ Creator....: 06815(2015-05-10 18:22:46)
#+ Modifier...: 08742 -SD/PR- 08742
 
{</section>}
 
{<section id="astq507.global" >}
#應用 q01 樣板自動產生(Version:34)
#add-point:填寫註解說明 name="global.memo"
#160913-00034#3  2016/09/14    by 08742    q_pmaa001開窗改成 q_pmaa001_1抓類型=3 的條件
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
PRIVATE TYPE type_g_stgg_d RECORD
       
       sel LIKE type_t.chr1, 
   sdate LIKE type_t.chr500, 
   edate LIKE type_t.chr500, 
   stfa051 LIKE stfa_t.stfa051, 
   l_rtaxl003 LIKE type_t.chr500, 
   stggsite LIKE stgg_t.stggsite, 
   stggsite_desc LIKE type_t.chr500, 
   stgg002 LIKE stgg_t.stgg002, 
   stgg002_desc LIKE type_t.chr500, 
   stgg003 LIKE stgg_t.stgg003, 
   stgg003_desc LIKE type_t.chr500, 
   stgg004 LIKE stgg_t.stgg004, 
   stgg004_desc LIKE type_t.chr500, 
   stgg005 LIKE stgg_t.stgg005, 
   stgg005_desc LIKE type_t.chr500, 
   stgg006 LIKE stgg_t.stgg006, 
   stgg006_desc LIKE type_t.chr500, 
   stgg007 LIKE stgg_t.stgg007, 
   stgg008 LIKE stgg_t.stgg008, 
   stgg009 LIKE stgg_t.stgg009, 
   stgg010 LIKE stgg_t.stgg010, 
   stgg011 LIKE stgg_t.stgg011, 
   stgg012 LIKE stgg_t.stgg012, 
   stgg013 LIKE stgg_t.stgg013, 
   stgg014 LIKE stgg_t.stgg014, 
   stgg001 LIKE stgg_t.stgg001
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
TYPE type_tm        RECORD
      l_sdate        LIKE stgg_t.stgg001,
      l_edate        LIKE stgg_t.stgg001,
      cnd1           LIKE type_t.chr1
                     END RECORD
DEFINE tm              type_tm
DEFINE g_pmel003_acc STRING

 TYPE type_g_stgg2_d RECORD
       l_sel LIKE type_t.chr500, 
   l_sdate2 LIKE type_t.chr500, 
   l_edate2 LIKE type_t.chr500, 
   l_stfa051 LIKE type_t.chr10,
   l_rtaxl003 LIKE type_t.chr500,  
   l_stggsite LIKE type_t.chr10, 
   l_stggsite_desc LIKE type_t.chr500, 
   l_stgg002 LIKE type_t.chr10, 
   l_stgg002_desc LIKE type_t.chr500, 
   l_stgg003 LIKE type_t.chr10, 
   l_stgg003_desc LIKE type_t.chr500, 
   l_stgg004 LIKE type_t.chr10, 
   l_stgg004_desc LIKE type_t.chr500, 
   l_stgg005 LIKE type_t.chr10, 
   l_stgg005_desc LIKE type_t.chr500, 
   l_stgg006 LIKE type_t.chr10, 
   l_stgg006_desc LIKE type_t.chr500, 
   l_stgg007 LIKE type_t.num20_6, 
   l_stgg008 LIKE type_t.num20_6, 
   l_stgg009 LIKE type_t.num20_6, 
   l_stgg010 LIKE type_t.num20_6, 
   l_stgg011 LIKE type_t.num20_6, 
   l_stgg012 LIKE type_t.num20_6, 
   l_stgg013 LIKE type_t.num20_6, 
   l_stgg014 LIKE type_t.num20_6
       END RECORD
       
DEFINE g_stgg2_d     DYNAMIC ARRAY OF type_g_stgg2_d
DEFINE g_stgg2_d_t   type_g_stgg2_d



# add by chenhz 15/09/09 (s)  添加兩個明細頁簽和品類的匯總及明細頁簽    
 TYPE type_g_stgg3_d RECORD
       
   b_stgg001_1 LIKE stgg_t.stgg001, 
   b_stfa051_1 LIKE stfa_t.stfa051,
   l_rtaxl003 LIKE type_t.chr500, 
   b_stggsite_1 LIKE stgg_t.stggsite, 
   b_ooefl003 LIKE type_t.chr500, 
   b_stgg003_1 LIKE stgg_t.stgg003, 
   b_mhael023 LIKE type_t.chr500, 
   b_stgg004_1 LIKE stgg_t.stgg004, 
   b_pmaal003 LIKE type_t.chr500, 
   b_stgg005_1 LIKE stgg_t.stgg005, 
   b_mhabl004 LIKE type_t.chr500, 
   b_stgg006_1 LIKE stgg_t.stgg006, 
   b_rtaxl003 LIKE type_t.chr500, 
   b_stgg007_1 LIKE stgg_t.stgg007, 
   b_stgg008_1 LIKE stgg_t.stgg008, 
   b_stgg009_1 LIKE stgg_t.stgg009, 
   b_stgg010_1 LIKE stgg_t.stgg010, 
   b_stgg011_1 LIKE stgg_t.stgg011, 
   b_stgg012_1 LIKE stgg_t.stgg012, 
   b_stgg013_1 LIKE stgg_t.stgg013, 
   b_stgg014_1 LIKE stgg_t.stgg014
       END RECORD
       
 TYPE type_g_stgg4_d RECORD
       
   b_stgg001_2 LIKE stgg_t.stgg001, 
   b_stfa051_2 LIKE stfa_t.stfa051, 
   l_rtaxl003 LIKE type_t.chr500,
   b_stggsite_2 LIKE stgg_t.stggsite, 
   b_ooefl003_1 LIKE type_t.chr500, 
   b_stgg002  LIKE stgg_t.stgg002,
   b_inayl003 LIKE type_t.chr500, 
   b_stgg003_2 LIKE stgg_t.stgg003, 
   b_mhael023_1 LIKE type_t.chr500, 
   b_stgg004_2 LIKE stgg_t.stgg004, 
   b_pmaal003_1 LIKE type_t.chr500, 
   b_stgg005_2 LIKE stgg_t.stgg005, 
   b_mhabl004_1 LIKE type_t.chr500, 
   b_stgg006_2 LIKE stgg_t.stgg006, 
   b_rtaxl003_1 LIKE type_t.chr500, 
   b_stgg007_2 LIKE stgg_t.stgg007, 
   b_stgg008_2 LIKE stgg_t.stgg008, 
   b_stgg009_2 LIKE stgg_t.stgg009, 
   b_stgg010_2 LIKE stgg_t.stgg010, 
   b_stgg011_2 LIKE stgg_t.stgg011, 
   b_stgg012_2 LIKE stgg_t.stgg012, 
   b_stgg013_2 LIKE stgg_t.stgg013, 
   b_stgg014_2 LIKE stgg_t.stgg014
       END RECORD
       
 TYPE type_g_stgg5_d RECORD
       
   l_sdate3 LIKE type_t.chr500, 
   l_edate3 LIKE type_t.chr500, 
   b_stfa051_3 LIKE stfa_t.stfa051, 
   l_rtaxl003 LIKE type_t.chr500,
   b_stggsite_3 LIKE stgg_t.stggsite, 
   b_ooefl003_2 LIKE type_t.chr500, 
   b_stgg007_3 LIKE stgg_t.stgg007, 
   b_stgg008_3 LIKE stgg_t.stgg008, 
   b_stgg009_3 LIKE stgg_t.stgg009, 
   b_stgg010_3 LIKE stgg_t.stgg010, 
   b_stgg011_3 LIKE stgg_t.stgg011, 
   b_stgg012_3 LIKE stgg_t.stgg012, 
   b_stgg013_3 LIKE stgg_t.stgg013, 
   b_stgg014_3 LIKE stgg_t.stgg014
       END RECORD      
       
 TYPE type_g_stgg6_d RECORD
       
   b_stgg001_3 LIKE stgg_t.stgg001, 
   b_stfa051_4 LIKE stfa_t.stfa051, 
   l_rtaxl003 LIKE type_t.chr500,
   b_stggsite_4 LIKE stgg_t.stggsite, 
   b_ooefl003_3 LIKE type_t.chr500, 
   b_stgg007_4 LIKE stgg_t.stgg007, 
   b_stgg008_4 LIKE stgg_t.stgg008, 
   b_stgg009_4 LIKE stgg_t.stgg009, 
   b_stgg010_4 LIKE stgg_t.stgg010, 
   b_stgg011_4 LIKE stgg_t.stgg011, 
   b_stgg012_4 LIKE stgg_t.stgg012, 
   b_stgg013_4 LIKE stgg_t.stgg013, 
   b_stgg014_4 LIKE stgg_t.stgg014
       END RECORD   


       
DEFINE g_stgg3_d            DYNAMIC ARRAY OF type_g_stgg3_d
DEFINE g_stgg3_d_t          type_g_stgg3_d
DEFINE g_stgg4_d            DYNAMIC ARRAY OF type_g_stgg4_d
DEFINE g_stgg4_d_t          type_g_stgg4_d
DEFINE g_stgg5_d            DYNAMIC ARRAY OF type_g_stgg5_d
DEFINE g_stgg5_d_t          type_g_stgg5_d
DEFINE g_stgg6_d            DYNAMIC ARRAY OF type_g_stgg6_d
DEFINE g_stgg6_d_t          type_g_stgg6_d


DEFINE g_detail_cnt_2      LIKE type_t.num10
DEFINE g_detail_cnt_3      LIKE type_t.num10
DEFINE g_detail_cnt_4      LIKE type_t.num10
DEFINE g_detail_cnt_5      LIKE type_t.num10
DEFINE g_detail_cnt_6      LIKE type_t.num10
# add by chenhz 15/09/09 (e)      
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stgg_d            DYNAMIC ARRAY OF type_g_stgg_d
DEFINE g_stgg_d_t          type_g_stgg_d
 
 
 
 
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
 
{<section id="astq507.main" >}
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
   DECLARE astq507_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq507_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq507_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq507 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq507_init()   
 
      #進入選單 Menu (="N")
      CALL astq507_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq507
      
   END IF 
   
   CLOSE astq507_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq507.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astq507_init()
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
   CALL cl_set_combo_scc_part('stfa003','6013','4,5')  #lanjj add on 2016-05-04
   #end add-point
 
   CALL astq507_default_search()
END FUNCTION
 
{</section>}
 
{<section id="astq507.default_search" >}
PRIVATE FUNCTION astq507_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " stggsite = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " stgg001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " stgg002 = '", g_argv[03], "' AND "
   END IF
 
 
 
 
 
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   IF g_wc = " 1=2" THEN
   LET g_wc = " 1=1"
   END IF
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq507.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astq507_ui_dialog() 
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
 
   
   CALL astq507_b_fill()
  
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stgg_d.clear()
 
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
 
         CALL astq507_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT BY NAME tm.l_sdate,tm.l_edate ATTRIBUTE(WITHOUT DEFAULTS)
            AFTER INPUT
               IF INT_FLAG THEN
                  EXIT DIALOG
               END IF
         END INPUT
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
#         CONSTRUCT BY NAME g_wc ON stgg002,stgg003,stgg004,stgg005,stgg006,stggsite,stfa051 #MARKED BY LANJJ 2015-10-10
          CONSTRUCT BY NAME g_wc ON stgg002,stgg003,stgg004,stgg005,stgg006,stggsite,stfa051,stfa050,stfa003   #ADDED BY LANJJ 2015-10-10   （stfa003 2016-05-04 ） 
         
         ON ACTION controlp INFIELD stgg002        
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg002  #顯示到畫面上
            NEXT FIELD stgg002                     #返回原欄位
    

         ON ACTION controlp INFIELD stgg003      
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg003  #顯示到畫面上
            NEXT FIELD stgg003                     #返回原欄位
    

         ON ACTION controlp INFIELD stgg004
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#3 -S
            #CALL q_pmaa001()                                       
            LET g_qryparam.arg1 = "('3')"            
            CALL q_pmaa001_1()                           #呼叫開窗
            #160913-00034#3 -E
            DISPLAY g_qryparam.return1 TO stgg004  #顯示到畫面上
            NEXT FIELD stgg004                     #返回原欄位
    

         ON ACTION controlp INFIELD stgg005
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg005  #顯示到畫面上
            NEXT FIELD stgg005                     #返回原欄位
    

         ON ACTION controlp INFIELD stgg006
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg006  #顯示到畫面上
            NEXT FIELD stgg006                     #返回原欄位
 
        ON ACTION controlp INFIELD stfa051
		      INITIALIZE g_qryparam.* TO NULL
           LET g_qryparam.state = 'c'
		    	LET g_qryparam.reqry = FALSE
			   LET g_qryparam.where = " rtax004 ='",cl_get_para(g_enterprise,"","E-CIR-0001"),"'"
           CALL q_rtax001()                       #呼叫開窗
           DISPLAY g_qryparam.return1 TO stfa051  #顯示到畫面上
           NEXT FIELD stfa051                     #返回原欄位  
           
         ON ACTION controlp INFIELD stggsite
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stggsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stggsite  #顯示到畫面上
            NEXT FIELD stggsite                     #返回原欄位
            
         END CONSTRUCT
         #end add-point
     
         DISPLAY ARRAY g_stgg_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL astq507_detail_action_trans()
 
               LET g_master_idx = l_ac
               #為避免按上下筆時影響執行效能，所以做一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq507_b_fill2()
               LET g_action_choice = lc_action_choice_old
 
               #add-point:input段before row name="input.body.before_row"
#add by chenhz 15/09/09(s) 修噶單身筆數顯示不正確
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end
#add by chenhz 15/09/09(e)        
               #end add-point
 
            
 
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
 
         #add-point:第一頁籤程式段mark結束用 name="ui_dialog.page1.mark.end"
         
         #end add-point
 
 
 
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
#modify by chenhz 15/09/09(s) 修噶單身筆數顯示不正確
         DISPLAY ARRAY g_stgg2_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt_2)
            BEFORE DISPLAY
               LET g_current_page = 2
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg2_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end
         END DISPLAY
 #modify by chenhz 15/09/09(e)  

         

# add by chenhz 15/09/09 (s)  添加兩個明細頁簽 
         DISPLAY ARRAY g_stgg3_d TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt_3)
            BEFORE DISPLAY
               LET g_current_page = 3
            BEFORE ROW
              LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg3_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end
  
         END DISPLAY
         
         DISPLAY ARRAY g_stgg4_d TO s_detail4.*
            ATTRIBUTES(COUNT=g_detail_cnt_4)
            BEFORE DISPLAY
               LET g_current_page = 4
            BEFORE ROW
              LET g_detail_idx = DIALOG.getCurrentRow("s_detail4")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg4_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end
         END DISPLAY
         
         DISPLAY ARRAY g_stgg5_d TO s_detail5.*
            ATTRIBUTES(COUNT=g_detail_cnt_5)
            BEFORE DISPLAY
               LET g_current_page = 5
            BEFORE ROW
              LET g_detail_idx = DIALOG.getCurrentRow("s_detail5")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg5_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end
         END DISPLAY

         DISPLAY ARRAY g_stgg6_d TO s_detail6.*
            ATTRIBUTES(COUNT=g_detail_cnt_6)
            BEFORE DISPLAY
               LET g_current_page = 6
            BEFORE ROW
              LET g_detail_idx = DIALOG.getCurrentRow("s_detail6")
               LET l_ac = g_detail_idx
               DISPLAY l_ac TO FORMONLY.h_index
               DISPLAY g_stgg6_d.getLength() TO FORMONLY.h_count
               DISPLAY ' ' TO FORMONLY.p_start
               DISPLAY ' ' TO FORMONLY.p_end 
         END DISPLAY
# add by chenhz 15/09/09 (e)        
         #end add-point
 
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq507_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            CALL cl_set_act_visible("selall,selnone,sel,unsel,filter", FALSE)
            CALL cl_set_comp_visible("sel", FALSE)
            LET tm.l_sdate = g_today
            LET tm.l_edate = g_today
            
            #end add-point
            NEXT FIELD l_sdate
 
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
            CALL astq507_b_fill()
 
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
               LET g_export_node[1] = base.typeInfo.create(g_stgg_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               LET g_export_node[2] = base.typeInfo.create(g_stgg2_d)
               LET g_export_id[2]   = "s_detail2"
               LET g_export_node[3] = base.typeInfo.create(g_stgg3_d)
               LET g_export_id[3]   = "s_detail3"
               LET g_export_node[4] = base.typeInfo.create(g_stgg4_d)
               LET g_export_id[4]   = "s_detail4"
               LET g_export_node[5] = base.typeInfo.create(g_stgg5_d)
               LET g_export_id[5]   = "s_detail5"
               LET g_export_node[6] = base.typeInfo.create(g_stgg6_d)
               LET g_export_id[6]   = "s_detail6"               
               
               #END add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
         ON ACTION datarefresh   # 重新整理
            CALL astq507_b_fill()
 
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
            CALL astq507_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq507_b_fill()
 
         ON ACTION detail_next               #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq507_b_fill()
 
         ON ACTION detail_last               #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq507_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_stgg_d.getLength()
               LET g_stgg_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_stgg_d.getLength()
               LET g_stgg_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_stgg_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stgg_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_stgg_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_stgg_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         #應用 qs16 樣板自動產生(Version:3)
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astq507_filter()
            #add-point:ON ACTION filter name="menu.filter"
            EXIT DIALOG
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
 
{<section id="astq507.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq507_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE l_pid           LIKE type_t.chr50
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_where_date      STRING
   DEFINE l_where           STRING
   DEFINE g_sql2        STRING  
# add by chenhz 15/09/09 (s)  添加兩個明細頁簽 
   DEFINE g_sql3        STRING
   DEFINE g_sql4        STRING
   DEFINE g_sql5        STRING
   DEFINE g_sql6        STRING
   DEFINE ls_sql_rank1     STRING
# add by chenhz 15/09/09 (e)  
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   #控卡
   CALL s_aooi500_sql_where(g_prog,'stggsite') RETURNING l_where
   #串日期
   #modify by liaolong 150805-00003#6 2015/08/07 --Begin--
#   LET l_where_date = "stgg001 BETWEEN TO_DATE('",tm.l_sdate CLIPPED,"','YYYY-MM-DD') ",
#                      "            AND TO_DATE('",tm.l_edate CLIPPED,"','YYYY-MM-DD')"
   LET l_where_date = "stgg001 BETWEEN TO_DATE('",tm.l_sdate CLIPPED,"','YY/MM/DD') ",
                      "            AND TO_DATE('",tm.l_edate CLIPPED,"','YY/MM/DD')"
   #modify by liaolong 150805-00003#6 2015/08/07 --End--                   
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
 
   CALL g_stgg_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   CALL g_stgg3_d.clear()
   CALL g_stgg4_d.clear()
   CALL g_stgg5_d.clear()
   CALL g_stgg6_d.clear()
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1
 
   # b_fill段sql組成及FOREACH撰寫
   #應用 qs04 樣板自動產生(Version:9)
   #+ b_fill段資料取得(包含sql組成及FOREACH段撰寫)
   LET ls_sql_rank = "SELECT  UNIQUE '','','','','',stggsite,'',stgg002,'',stgg003,'',stgg004,'',stgg005, 
       '',stgg006,'',stgg007,stgg008,stgg009,stgg010,stgg011,stgg012,stgg013,stgg014,stgg001  ,DENSE_RANK() OVER( ORDER BY stgg_t.stggsite, 
       stgg_t.stgg001,stgg_t.stgg002) AS RANK FROM stgg_t",
 
 
                     "",
                     " WHERE stggent= ? AND 1=1 AND ", ls_wc
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stgg_t"),
                     " ORDER BY stgg_t.stggsite,stgg_t.stgg001,stgg_t.stgg002"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
    LET ls_wc = ls_wc CLIPPED," AND ",l_where
    LET ls_sql_rank = "SELECT  UNIQUE 'N','','',stggsite,ooefl003 stggsite_desc,stgg002,inayl003 stgg002_desc,stgg003,mhael023 stgg003_desc,stgg004,pmaal004 stgg004_desc,   ",
     "   stgg005, mhabl004 stgg005_desc,stgg006,rtaxl003 stgg006_desc, sum(nvl(stgg007,0)) stgg007,sum(nvl(stgg008,0)) stgg008,sum(nvl(stgg009,0)) stgg009,         ",
     #"   (sum(stgg009)/sum(stgg008)*100) stgg010, ", #20150904  s983961--mark 追天和
     "   case WHEN sum(coalesce(stgg008,0)) = 0 then 100 else (sum(coalesce(stgg009,0))/sum(coalesce(stgg008,0))*100) END stgg010,", #20150904  s983961--add 追天和
     "   sum(nvl(stgg011,0)) stgg011, ",
     #"   (sum(stgg011)/sum(stgg008)*100) stgg012, ", #20150904  s983961--mark 追天和
     "   case WHEN sum(coalesce(stgg008,0)) = 0 then 100 else (sum(coalesce(stgg011,0))/sum(coalesce(stgg008,0))*100) end stgg012,", #20150904  s983961--add 追天和
     "   sum(nvl(stgg013,0)) stgg013,sum(nvl(stgg014,0)) stgg014,  ",
     "   DENSE_RANK() OVER( ORDER BY stgg_t.stggsite,stgg_t.stgg002) AS RANK                                                             ",
     " FROM stfa_t,stgg_t                                                                                                                       ",
     "   LEFT JOIN inayl_t ON stggent=inaylent AND stgg002=inayl001 AND inayl002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN mhae_t  ON stggent= mhaeent AND stggsite = mhaesite AND stgg003=mhae001                                       ",
     "   LEFT JOIN mhael_t ON mhaeent = mhaelent AND mhaesite =mhaelsite AND mhae001 = mhael001 AND mhael022 ='"||g_dlang||"'    ",
     "   LEFT JOIN mhabl_t ON mhaeent = mhablent AND mhae020=mhabl001 AND mhae021 = mhabl002 AND mhabl003 = '"||g_dlang||"'      ",
     "   LEFT JOIN pmaal_t ON stggent=pmaalent AND stgg004=pmaal001 AND pmaal002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN rtaxl_t ON stggent=rtaxlent AND stgg006=rtaxl001 AND rtaxl002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN ooefl_t ON stggent=ooeflent AND stggsite=ooefl001 AND ooefl002 = '"||g_dlang||"'                              ",  
     " WHERE stggent= ?   AND stgg003 = stfa005 AND ",l_where_date," AND 1=1 AND ", ls_wc

   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stgg_t"),
     "  GROUP BY stgg002,inayl003 ,stgg003,mhael023 ,stgg004,pmaal004 ,stgg005, mhabl004 ,stgg006,rtaxl003,stggsite,ooefl003 ", 
     "  ORDER BY stgg_t.stggsite,stgg_t.stgg002"


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
 
   LET g_sql = "SELECT '','','','','',stggsite,'',stgg002,'',stgg003,'',stgg004,'',stgg005,'',stgg006, 
       '',stgg007,stgg008,stgg009,stgg010,stgg011,stgg012,stgg013,stgg014,stgg001",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   #modify by liaolong 150805-00003#6 2015/08/07 --Begin--
#   LET g_sql = "SELECT 'N','','',stggsite,stggsite_desc,stgg002,stgg002_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,",
#            " stgg006,stgg006_desc,stgg007,stgg008,stgg009,stgg010,stgg011,stgg012,stgg013,stgg014         ",
#            " FROM (",ls_sql_rank,") ",
#            " WHERE RANK >= ",g_pagestart,
#                " AND RANK < ",g_pagestart + g_num_in_page



   LET g_sql = "SELECT DISTINCT 'N','','',stfa051,rtaxl003,stggsite,stggsite_desc,'','',stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,",
            " stgg006,stgg006_desc,SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)         ",
            " FROM (",ls_sql_rank,") ",",stfa_t",
            " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
            " WHERE RANK >= ",g_pagestart,
            " AND RANK < ",g_pagestart + g_num_in_page,
            " AND stgg003 = stfa005 ",
            " GROUP BY stfa051,rtaxl003,stggsite,stggsite_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,
              stgg006,stgg006_desc "
   LET g_sql2 = "SELECT DISTINCT 'N','','',stfa051,rtaxl003,stggsite,stggsite_desc,stgg002,stgg002_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,",
                " stgg006,stgg006_desc,SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)        ",
                " FROM (",ls_sql_rank,") ",",stfa_t",
                " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
                " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page,
                " AND stgg003 = stfa005 "  ,
                " GROUP BY stfa051,rtaxl003,stggsite,stggsite_desc,stgg002,stgg002_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,
                 stgg006,stgg006_desc "               
   PREPARE astq507_pb2 FROM g_sql2
   DECLARE b_fill_curs2 CURSOR FOR astq507_pb2
 
   OPEN b_fill_curs2 USING g_enterprise  
   #modify by liaolong 150805-00003#6 2015/08/07 --End--
   
   
 # add by chenhz 15/09/09 (s)  添加兩個明細頁簽
LET ls_sql_rank1 = "SELECT  UNIQUE stgg001,stggsite,ooefl003 stggsite_desc,stgg002,inayl003 stgg002_desc,stgg003,mhael023 stgg003_desc,stgg004,pmaal004 stgg004_desc,   ",
     "   stgg005, mhabl004 stgg005_desc,stgg006,rtaxl003 stgg006_desc, sum(nvl(stgg007,0)) stgg007,sum(nvl(stgg008,0)) stgg008,sum(nvl(stgg009,0)) stgg009,         ",
     #"   (sum(stgg009)/sum(stgg008)*100) stgg010, ", #20150904  s983961--mark 追天和
     "   case WHEN sum(coalesce(stgg008,0)) = 0 then 100 else (sum(coalesce(stgg009,0))/sum(coalesce(stgg008,0))*100) END stgg010,", #20150904  s983961--add 追天和
     "   sum(nvl(stgg011,0)) stgg011, ",
     #"   (sum(stgg011)/sum(stgg008)*100) stgg012, ", #20150904  s983961--mark 追天和
     "   case WHEN sum(coalesce(stgg008,0)) = 0 then 100 else (sum(coalesce(stgg011,0))/sum(coalesce(stgg008,0))*100) end stgg012,", #20150904  s983961--add 追天和
     "    sum(nvl(stgg013,0)) stgg013,sum(nvl(stgg014,0)) stgg014, ",
     "   DENSE_RANK() OVER( ORDER BY stgg_t.stggsite,stgg_t.stgg002) AS RANK                                                             ",
     " FROM stfa_t, stgg_t                                                                                                                       ",
     "   LEFT JOIN inayl_t ON stggent=inaylent AND stgg002=inayl001 AND inayl002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN mhae_t  ON stggent= mhaeent AND stggsite = mhaesite AND stgg003=mhae001                                       ",
     "   LEFT JOIN mhael_t ON mhaeent = mhaelent AND mhaesite =mhaelsite AND mhae001 = mhael001 AND mhael022 ='"||g_dlang||"'    ",
     "   LEFT JOIN mhabl_t ON mhaeent = mhablent AND mhae020=mhabl001 AND mhae021 = mhabl002 AND mhabl003 = '"||g_dlang||"'      ",
     "   LEFT JOIN pmaal_t ON stggent=pmaalent AND stgg004=pmaal001 AND pmaal002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN rtaxl_t ON stggent=rtaxlent AND stgg006=rtaxl001 AND rtaxl002 = '"||g_dlang||"'                               ",
     "   LEFT JOIN ooefl_t ON stggent=ooeflent AND stggsite=ooefl001 AND ooefl002 = '"||g_dlang||"'                              ",  
     " WHERE stggent= ?   AND stgg003 = stfa005  AND ",l_where_date," AND 1=1 AND ", ls_wc

   LET ls_sql_rank1 = ls_sql_rank1, cl_sql_add_filter("stgg_t"),
     "  GROUP BY stgg001,stgg002,inayl003 ,stgg003,mhael023 ,stgg004,pmaal004 ,stgg005, mhabl004 ,stgg006,rtaxl003,stggsite,ooefl003", 
     "  ORDER BY stgg_t.stggsite,stgg_t.stgg001,stgg_t.stgg002"
   
      LET g_sql3 = "SELECT DISTINCT stgg001,stfa051,rtaxl003,stggsite,stggsite_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,",
                " stgg006,stgg006_desc,SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)        ",
                " FROM (",ls_sql_rank1,") ",",stfa_t",
                " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
                " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page,
                " AND stgg003 = stfa005 "  ,
                " GROUP BY stgg001,stfa051,rtaxl003,stggsite,stggsite_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,
                 stgg006,stgg006_desc " ,
                " ORDER BY stggsite,stgg001,stgg003"
   
       PREPARE astq507_pb3 FROM g_sql3
       DECLARE b_fill_curs3 CURSOR FOR astq507_pb3    
       OPEN b_fill_curs3 USING g_enterprise 
   
       LET g_sql4 = "SELECT DISTINCT stgg001,stfa051,rtaxl003,stggsite,stggsite_desc,stgg002,stgg002_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,",
                " stgg006,stgg006_desc,SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)        ",
                " FROM (",ls_sql_rank1,") ",",stfa_t",
                " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
                " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page,
                " AND stgg003 = stfa005 "  ,
                " GROUP BY stgg001,stfa051,rtaxl003,stggsite,stggsite_desc,stgg002,stgg002_desc,stgg003,stgg003_desc,stgg004,stgg004_desc,stgg005,stgg005_desc,
                 stgg006,stgg006_desc ",
                " ORDER BY stggsite,stgg001,stgg002,stgg003 "    

   PREPARE astq507_pb4 FROM g_sql4
   DECLARE b_fill_curs4 CURSOR FOR astq507_pb4
   OPEN b_fill_curs4 USING g_enterprise 
   
       LET g_sql5 = "SELECT DISTINCT '','',stfa051,rtaxl003,stggsite,stggsite_desc,",
                " SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)        ",
                " FROM (",ls_sql_rank1,") ",",stfa_t",
                " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
                " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page,
                " AND stgg003 = stfa005 "  ,
                " GROUP BY stfa051,rtaxl003,stggsite,stggsite_desc ",
                " ORDER BY stggsite,stfa051  "    

   PREPARE astq507_pb5 FROM g_sql5
   DECLARE b_fill_curs5 CURSOR FOR astq507_pb5
   OPEN b_fill_curs5 USING g_enterprise 
   
      LET g_sql6 = "SELECT DISTINCT stgg001,stfa051,rtaxl003,stggsite,stggsite_desc,",
                " SUM(stgg007),SUM(stgg008),SUM(stgg009),'',SUM(stgg011),'',SUM(stgg013),SUM(stgg014)        ",
                " FROM (",ls_sql_rank1,") ",",stfa_t",
                " LEFT JOIN rtaxl_t ON rtaxlent=stfaent AND rtaxl001 = stfa051 AND rtaxl002 = '",g_dlang,"'",
                " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page,
                " AND stgg003 = stfa005 "  ,
                " GROUP BY stgg001,stfa051,rtaxl003,stggsite,stggsite_desc ",
                " ORDER BY stggsite,stgg001,stfa051  "    

   PREPARE astq507_pb6 FROM g_sql6
   DECLARE b_fill_curs6 CURSOR FOR astq507_pb6
   OPEN b_fill_curs6 USING g_enterprise 
 # add by chenhz 15/09/09 (e)  
 
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq507_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq507_pb
 
   OPEN b_fill_curs USING g_enterprise
 
   FOREACH b_fill_curs INTO g_stgg_d[l_ac].sel,g_stgg_d[l_ac].sdate,g_stgg_d[l_ac].edate,g_stgg_d[l_ac].stfa051, 
       g_stgg_d[l_ac].l_rtaxl003,g_stgg_d[l_ac].stggsite,g_stgg_d[l_ac].stggsite_desc,g_stgg_d[l_ac].stgg002, 
       g_stgg_d[l_ac].stgg002_desc,g_stgg_d[l_ac].stgg003,g_stgg_d[l_ac].stgg003_desc,g_stgg_d[l_ac].stgg004, 
       g_stgg_d[l_ac].stgg004_desc,g_stgg_d[l_ac].stgg005,g_stgg_d[l_ac].stgg005_desc,g_stgg_d[l_ac].stgg006, 
       g_stgg_d[l_ac].stgg006_desc,g_stgg_d[l_ac].stgg007,g_stgg_d[l_ac].stgg008,g_stgg_d[l_ac].stgg009, 
       g_stgg_d[l_ac].stgg010,g_stgg_d[l_ac].stgg011,g_stgg_d[l_ac].stgg012,g_stgg_d[l_ac].stgg013,g_stgg_d[l_ac].stgg014, 
       g_stgg_d[l_ac].stgg001
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
     LET g_stgg_d[l_ac].sdate= tm.l_sdate 
     LET g_stgg_d[l_ac].edate= tm.l_edate 
     IF not cl_null(g_stgg_d[l_ac].stgg008) AND g_stgg_d[l_ac].stgg008 <>0 THEN      
        LET g_stgg_d[l_ac].stgg010= g_stgg_d[l_ac].stgg009/g_stgg_d[l_ac].stgg008*100 #lanjj modify 
        LET g_stgg_d[l_ac].stgg012= g_stgg_d[l_ac].stgg011/g_stgg_d[l_ac].stgg008*100 
     ELSE
         LET g_stgg_d[l_ac].stgg010='100'   
         LET g_stgg_d[l_ac].stgg012='100' 
     END IF 
     
#     DISPLAY  g_stgg_d[l_ac].sdate TO g_stgg_d[l_ac].sdate    #lanjj mark on 2016-07-19
#     DISPLAY  g_stgg_d[l_ac].edate TO g_stgg_d[l_ac].edate
#     DISPLAY  g_stgg_d[l_ac].stgg010 TO g_stgg_d[l_ac].stgg010  
#     DISPLAY  g_stgg_d[l_ac].stgg012 TO g_stgg_d[l_ac].stgg012
      
      
      #end add-point
 
      CALL astq507_detail_show("'1'")
 
      CALL astq507_stgg_t_mask()
 
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
   CALL g_stgg2_d.clear()
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1  

   FOREACH b_fill_curs2 INTO g_stgg2_d[l_ac].l_sel, 
       g_stgg2_d[l_ac].l_sdate2,g_stgg2_d[l_ac].l_edate2,g_stgg2_d[l_ac].l_stfa051,g_stgg2_d[l_ac].l_rtaxl003,g_stgg2_d[l_ac].l_stggsite, 
       g_stgg2_d[l_ac].l_stggsite_desc,g_stgg2_d[l_ac].l_stgg002,g_stgg2_d[l_ac].l_stgg002_desc,g_stgg2_d[l_ac].l_stgg003, 
       g_stgg2_d[l_ac].l_stgg003_desc,g_stgg2_d[l_ac].l_stgg004,g_stgg2_d[l_ac].l_stgg004_desc,g_stgg2_d[l_ac].l_stgg005, 
       g_stgg2_d[l_ac].l_stgg005_desc,g_stgg2_d[l_ac].l_stgg006,g_stgg2_d[l_ac].l_stgg006_desc,g_stgg2_d[l_ac].l_stgg007, 
       g_stgg2_d[l_ac].l_stgg008,g_stgg2_d[l_ac].l_stgg009,g_stgg2_d[l_ac].l_stgg010,g_stgg2_d[l_ac].l_stgg011, 
       g_stgg2_d[l_ac].l_stgg012,g_stgg2_d[l_ac].l_stgg013,g_stgg2_d[l_ac].l_stgg014
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF

      LET g_stgg2_d[l_ac].l_sdate2= tm.l_sdate 
      LET g_stgg2_d[l_ac].l_edate2= tm.l_edate 
      DISPLAY  g_stgg_d[l_ac].sdate TO g_stgg_d[l_ac].sdate   
      DISPLAY  g_stgg_d[l_ac].edate TO g_stgg_d[l_ac].edate
      
      IF NOT cl_null(g_stgg2_d[l_ac].l_stgg008) AND g_stgg2_d[l_ac].l_stgg008 <>0 THEN 
         LET g_stgg2_d[l_ac].l_stgg010= g_stgg2_d[l_ac].l_stgg009/g_stgg2_d[l_ac].l_stgg008*100 #lanjj modify 
         LET g_stgg2_d[l_ac].l_stgg012= g_stgg2_d[l_ac].l_stgg011/g_stgg2_d[l_ac].l_stgg008*100 
      ELSE
         LET g_stgg2_d[l_ac].l_stgg010='100'   
         LET g_stgg2_d[l_ac].l_stgg012='100' 
     END IF 
     DISPLAY  g_stgg2_d[l_ac].l_stgg010 TO g_stgg2_d[l_ac].l_stgg010  
     DISPLAY  g_stgg2_d[l_ac].l_stgg012 TO g_stgg2_d[l_ac].l_stgg012
     
  #    CALL astq507_detail_show("'1'")
 
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
 
    CALL g_stgg2_d.deleteElement(g_stgg2_d.getLength())   
 
   LET g_detail_cnt_2 = g_stgg2_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs2
   FREE astq507_pb2
   
   DISPLAY ARRAY g_stgg2_d TO s_detail2.* ATTRIBUTES(COUNT=g_detail_cnt_2)
      BEFORE DISPLAY
         EXIT DISPLAY
   END DISPLAY
   
 # add by chenhz 15/09/09 (s)  添加兩個明細頁簽 
   CALL g_stgg3_d.clear()
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1  

   FOREACH b_fill_curs3 INTO 
       g_stgg3_d[l_ac].b_stgg001_1, g_stgg3_d[l_ac].b_stfa051_1,g_stgg3_d[l_ac].l_rtaxl003,g_stgg3_d[l_ac].b_stggsite_1, g_stgg3_d[l_ac].b_ooefl003,
       g_stgg3_d[l_ac].b_stgg003_1,g_stgg3_d[l_ac].b_mhael023,g_stgg3_d[l_ac].b_stgg004_1,g_stgg3_d[l_ac].b_pmaal003,
       g_stgg3_d[l_ac].b_stgg005_1,g_stgg3_d[l_ac].b_mhabl004,g_stgg3_d[l_ac].b_stgg006_1,g_stgg3_d[l_ac].b_rtaxl003,
       g_stgg3_d[l_ac].b_stgg007_1,g_stgg3_d[l_ac].b_stgg008_1,g_stgg3_d[l_ac].b_stgg009_1,g_stgg3_d[l_ac].b_stgg010_1,
       g_stgg3_d[l_ac].b_stgg011_1,g_stgg3_d[l_ac].b_stgg012_1,g_stgg3_d[l_ac].b_stgg013_1,g_stgg3_d[l_ac].b_stgg014_1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF

     IF NOT cl_null(g_stgg3_d[l_ac].b_stgg008_1) AND g_stgg3_d[l_ac].b_stgg008_1 <>0 THEN 
        LET g_stgg3_d[l_ac].b_stgg010_1= g_stgg3_d[l_ac].b_stgg009_1/g_stgg3_d[l_ac].b_stgg008_1*100 #lanjj modify 
        LET g_stgg3_d[l_ac].b_stgg012_1= g_stgg3_d[l_ac].b_stgg011_1/g_stgg3_d[l_ac].b_stgg008_1*100 
     ELSE
        LET g_stgg3_d[l_ac].b_stgg010_1='100'   
        LET g_stgg3_d[l_ac].b_stgg012_1='100' 
     END IF 
     DISPLAY  g_stgg3_d[l_ac].b_stgg010_1 TO g_stgg3_d[l_ac].b_stgg010_1  
     DISPLAY  g_stgg3_d[l_ac].b_stgg012_1 TO g_stgg3_d[l_ac].b_stgg012_1
     
 
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
   
   CALL g_stgg4_d.clear()
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1  

   FOREACH b_fill_curs4 INTO 
       g_stgg4_d[l_ac].b_stgg001_2, g_stgg4_d[l_ac].b_stfa051_2,g_stgg4_d[l_ac].l_rtaxl003,g_stgg4_d[l_ac].b_stggsite_2,
       g_stgg4_d[l_ac].b_ooefl003_1,
       g_stgg4_d[l_ac].b_stgg002,g_stgg4_d[l_ac].b_inayl003,
       g_stgg4_d[l_ac].b_stgg003_2,g_stgg4_d[l_ac].b_mhael023_1,g_stgg4_d[l_ac].b_stgg004_2,g_stgg4_d[l_ac].b_pmaal003_1,
       g_stgg4_d[l_ac].b_stgg005_2,g_stgg4_d[l_ac].b_mhabl004_1,g_stgg4_d[l_ac].b_stgg006_2,g_stgg4_d[l_ac].b_rtaxl003_1,
       g_stgg4_d[l_ac].b_stgg007_2,g_stgg4_d[l_ac].b_stgg008_2,g_stgg4_d[l_ac].b_stgg009_2,g_stgg4_d[l_ac].b_stgg010_2,
       g_stgg4_d[l_ac].b_stgg011_2,g_stgg4_d[l_ac].b_stgg012_2,g_stgg4_d[l_ac].b_stgg013_2,g_stgg4_d[l_ac].b_stgg014_2
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF

     IF NOT cl_null(g_stgg4_d[l_ac].b_stgg008_2) AND g_stgg4_d[l_ac].b_stgg008_2 <>0 THEN 
        LET g_stgg4_d[l_ac].b_stgg010_2= g_stgg4_d[l_ac].b_stgg009_2/g_stgg4_d[l_ac].b_stgg008_2*100 #lanjj modify 
        LET g_stgg4_d[l_ac].b_stgg012_2= g_stgg4_d[l_ac].b_stgg011_2/g_stgg4_d[l_ac].b_stgg008_2*100 
     ELSE
        LET g_stgg4_d[l_ac].b_stgg010_2='100'   
        LET g_stgg4_d[l_ac].b_stgg012_2='100' 
     END IF 
     DISPLAY  g_stgg4_d[l_ac].b_stgg010_2 TO g_stgg4_d[l_ac].b_stgg010_2  
     DISPLAY  g_stgg4_d[l_ac].b_stgg012_2 TO g_stgg4_d[l_ac].b_stgg012_2

 
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
   

   CALL g_stgg5_d.clear()
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1  

   FOREACH b_fill_curs5 INTO 
       g_stgg5_d[l_ac].l_sdate3,   g_stgg5_d[l_ac].l_edate3,   g_stgg5_d[l_ac].b_stfa051_3,g_stgg5_d[l_ac].l_rtaxl003,g_stgg5_d[l_ac].b_stggsite_3, g_stgg5_d[l_ac].b_ooefl003_2,
       g_stgg5_d[l_ac].b_stgg007_3,g_stgg5_d[l_ac].b_stgg008_3,g_stgg5_d[l_ac].b_stgg009_3,g_stgg5_d[l_ac].b_stgg010_3,
       g_stgg5_d[l_ac].b_stgg011_3,g_stgg5_d[l_ac].b_stgg012_3,g_stgg5_d[l_ac].b_stgg013_3,g_stgg5_d[l_ac].b_stgg014_3
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF

     LET g_stgg5_d[l_ac].l_sdate3= tm.l_sdate 
     LET g_stgg5_d[l_ac].l_edate3= tm.l_edate 
     DISPLAY  g_stgg5_d[l_ac].l_sdate3 TO g_stgg5_d[l_ac].l_sdate3   
     DISPLAY  g_stgg5_d[l_ac].l_edate3 TO g_stgg5_d[l_ac].l_edate3

     IF NOT cl_null(g_stgg5_d[l_ac].b_stgg008_3) AND g_stgg5_d[l_ac].b_stgg008_3 <>0 THEN 
        LET g_stgg5_d[l_ac].b_stgg010_3= g_stgg5_d[l_ac].b_stgg009_3/g_stgg5_d[l_ac].b_stgg008_3*100 #lanjj modify 
        LET g_stgg5_d[l_ac].b_stgg012_3= g_stgg5_d[l_ac].b_stgg011_3/g_stgg5_d[l_ac].b_stgg008_3*100 
     ELSE
        LET g_stgg5_d[l_ac].b_stgg010_3='100'   
        LET g_stgg5_d[l_ac].b_stgg012_3='100' 
     END IF 
     DISPLAY  g_stgg5_d[l_ac].b_stgg010_3 TO g_stgg5_d[l_ac].b_stgg010_3  
     DISPLAY  g_stgg5_d[l_ac].b_stgg012_3 TO g_stgg5_d[l_ac].b_stgg012_3
     
 
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
   
   
      CALL g_stgg6_d.clear()
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1  

   FOREACH b_fill_curs6 INTO 
       g_stgg6_d[l_ac].b_stgg001_3,g_stgg6_d[l_ac].b_stfa051_4,g_stgg6_d[l_ac].l_rtaxl003,g_stgg6_d[l_ac].b_stggsite_4, g_stgg6_d[l_ac].b_ooefl003_3,
       g_stgg6_d[l_ac].b_stgg007_4,g_stgg6_d[l_ac].b_stgg008_4,g_stgg6_d[l_ac].b_stgg009_4,  g_stgg6_d[l_ac].b_stgg010_4,
       g_stgg6_d[l_ac].b_stgg011_4,g_stgg6_d[l_ac].b_stgg012_4,g_stgg6_d[l_ac].b_stgg013_4,  g_stgg6_d[l_ac].b_stgg014_4
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF

     IF NOT cl_null(g_stgg6_d[l_ac].b_stgg008_4) AND g_stgg6_d[l_ac].b_stgg008_4 <>0 THEN 
        LET g_stgg6_d[l_ac].b_stgg010_4= g_stgg6_d[l_ac].b_stgg009_4/g_stgg6_d[l_ac].b_stgg008_4*100 #lanjj modify 
        LET g_stgg6_d[l_ac].b_stgg012_4= g_stgg6_d[l_ac].b_stgg011_4/g_stgg6_d[l_ac].b_stgg008_4*100 
     ELSE
        LET g_stgg6_d[l_ac].b_stgg010_4='100'   
        LET g_stgg6_d[l_ac].b_stgg012_4='100' 
     END IF 
     DISPLAY  g_stgg6_d[l_ac].b_stgg010_4 TO g_stgg6_d[l_ac].b_stgg010_4 
     DISPLAY  g_stgg6_d[l_ac].b_stgg012_4 TO g_stgg5_d[l_ac].b_stgg012_3
 
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
 # add by chenhz 15/09/09 (e)       
   #end add-point
 
   CALL g_stgg_d.deleteElement(g_stgg_d.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
# add by chenhz 15/09/09 (s)  添加兩個明細頁簽
   CALL g_stgg3_d.deleteElement(g_stgg3_d.getLength())
   CALL g_stgg4_d.deleteElement(g_stgg4_d.getLength())
   CALL g_stgg5_d.deleteElement(g_stgg5_d.getLength())
   CALL g_stgg6_d.deleteElement(g_stgg6_d.getLength())
# add by chenhz 15/09/09 (e)    
   #end add-point
 
   LET g_error_show = 0
 
   LET g_detail_cnt = g_stgg_d.getLength()
   LET l_ac = g_cnt
   LET g_cnt = 0
 
   #應用 qs06 樣板自動產生(Version:3)
   #+ b_fill段CURSOR釋放
   CLOSE b_fill_curs
   FREE astq507_pb
 
 
 
 
 
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq507_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq507_detail_action_trans()
 
   LET l_ac = 1
   IF g_stgg_d.getLength() > 0 THEN
      CALL astq507_b_fill2()
   END IF
 
      CALL astq507_filter_show('stfa051','b_stfa051')
   CALL astq507_filter_show('stggsite','b_stggsite')
   CALL astq507_filter_show('stgg002','b_stgg002')
   CALL astq507_filter_show('stgg003','b_stgg003')
   CALL astq507_filter_show('stgg004','b_stgg004')
   CALL astq507_filter_show('stgg005','b_stgg005')
   CALL astq507_filter_show('stgg006','b_stgg006')
   CALL astq507_filter_show('stgg007','b_stgg007')
   CALL astq507_filter_show('stgg008','b_stgg008')
   CALL astq507_filter_show('stgg009','b_stgg009')
   CALL astq507_filter_show('stgg010','b_stgg010')
   CALL astq507_filter_show('stgg011','b_stgg011')
   CALL astq507_filter_show('stgg012','b_stgg012')
   CALL astq507_filter_show('stgg013','b_stgg013')
   CALL astq507_filter_show('stgg014','b_stgg014')
   CALL astq507_filter_show('stgg001','b_stgg001')
 
 
END FUNCTION
 
{</section>}
 
{<section id="astq507.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq507_b_fill2()
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
 
{<section id="astq507.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq507_detail_show(ps_page)
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

#           INITIALIZE g_ref_fields TO NULL
#           LET g_ref_fields[1] = g_stgg_d[l_ac].stgg002
#           LET ls_sql = "SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'"
#           LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#           CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#           LET g_stgg_d[l_ac].stgg002_desc = '', g_rtn_fields[1] , ''
#           DISPLAY BY NAME g_stgg_d[l_ac].stgg002_desc
#
#           INITIALIZE g_ref_fields TO NULL
#           LET g_ref_fields[1] = g_stgg_d[l_ac].stgg003
#           LET ls_sql = "SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'"
#           LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#           CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#           LET g_stgg_d[l_ac].stgg003_desc = '', g_rtn_fields[1] , ''
#           DISPLAY BY NAME g_stgg_d[l_ac].stgg003_desc
#
#           INITIALIZE g_ref_fields TO NULL
#           LET g_ref_fields[1] = g_stgg_d[l_ac].stgg004
#           LET ls_sql = "SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'"
#           LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#           CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#           LET g_stgg_d[l_ac].stgg004_desc = '', g_rtn_fields[1] , ''
#           DISPLAY BY NAME g_stgg_d[l_ac].stgg004_desc
#
#           INITIALIZE g_ref_fields TO NULL
#           LET g_ref_fields[1] = g_stgg_d[l_ac].stgg005
#           LET ls_sql = "SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl002=? AND mhabl003='"||g_dlang||"'"
#           LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#           CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#           LET g_stgg_d[l_ac].stgg005_desc = '', g_rtn_fields[1] , ''
#           DISPLAY BY NAME g_stgg_d[l_ac].stgg005_desc
#
#           INITIALIZE g_ref_fields TO NULL
#           LET g_ref_fields[1] = g_stgg_d[l_ac].stgg006
#           LET ls_sql = "SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'"
#           LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
#           CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
#           LET g_stgg_d[l_ac].stgg006_desc = '', g_rtn_fields[1] , ''
#           DISPLAY BY NAME g_stgg_d[l_ac].stgg006_desc

      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq507.filter" >}
#應用 qs13 樣板自動產生(Version:8)
#+ filter段相關程式段
#+ filter過濾功能
PRIVATE FUNCTION astq507_filter()
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
      CONSTRUCT g_wc_filter ON stfa051,stggsite,stgg002,stgg003,stgg004,stgg005,stgg006,stgg007,stgg008, 
          stgg009,stgg010,stgg011,stgg012,stgg013,stgg014,stgg001
                          FROM s_detail1[1].b_stfa051,s_detail1[1].b_stggsite,s_detail1[1].b_stgg002, 
                              s_detail1[1].b_stgg003,s_detail1[1].b_stgg004,s_detail1[1].b_stgg005,s_detail1[1].b_stgg006, 
                              s_detail1[1].b_stgg007,s_detail1[1].b_stgg008,s_detail1[1].b_stgg009,s_detail1[1].b_stgg010, 
                              s_detail1[1].b_stgg011,s_detail1[1].b_stgg012,s_detail1[1].b_stgg013,s_detail1[1].b_stgg014, 
                              s_detail1[1].b_stgg001
 
         BEFORE CONSTRUCT
                     DISPLAY astq507_filter_parser('stfa051') TO s_detail1[1].b_stfa051
            DISPLAY astq507_filter_parser('stggsite') TO s_detail1[1].b_stggsite
            DISPLAY astq507_filter_parser('stgg002') TO s_detail1[1].b_stgg002
            DISPLAY astq507_filter_parser('stgg003') TO s_detail1[1].b_stgg003
            DISPLAY astq507_filter_parser('stgg004') TO s_detail1[1].b_stgg004
            DISPLAY astq507_filter_parser('stgg005') TO s_detail1[1].b_stgg005
            DISPLAY astq507_filter_parser('stgg006') TO s_detail1[1].b_stgg006
            DISPLAY astq507_filter_parser('stgg007') TO s_detail1[1].b_stgg007
            DISPLAY astq507_filter_parser('stgg008') TO s_detail1[1].b_stgg008
            DISPLAY astq507_filter_parser('stgg009') TO s_detail1[1].b_stgg009
            DISPLAY astq507_filter_parser('stgg010') TO s_detail1[1].b_stgg010
            DISPLAY astq507_filter_parser('stgg011') TO s_detail1[1].b_stgg011
            DISPLAY astq507_filter_parser('stgg012') TO s_detail1[1].b_stgg012
            DISPLAY astq507_filter_parser('stgg013') TO s_detail1[1].b_stgg013
            DISPLAY astq507_filter_parser('stgg014') TO s_detail1[1].b_stgg014
            DISPLAY astq507_filter_parser('stgg001') TO s_detail1[1].b_stgg001
 
 
         #單身公用欄位開窗相關處理
         
 
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_sdate>>----
         #----<<b_edate>>----
         #----<<b_stfa051>>----
         #Ctrlp:construct.c.filter.page1.b_stfa051
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stfa051
            #add-point:ON ACTION controlp INFIELD b_stfa051 name="construct.c.filter.page1.b_stfa051"
            
            #END add-point
 
 
         #----<<l_rtaxl003>>----
         #----<<b_stggsite>>----
         #Ctrlp:construct.c.filter.page1.b_stggsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stggsite
            #add-point:ON ACTION controlp INFIELD b_stggsite name="construct.c.filter.page1.b_stggsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stggsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stggsite  #顯示到畫面上
            NEXT FIELD b_stggsite                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stggsite_desc>>----
         #----<<b_stgg002>>----
         #Ctrlp:construct.c.page1.b_stgg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg002
            #add-point:ON ACTION controlp INFIELD b_stgg002 name="construct.c.filter.page1.b_stgg002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgg002  #顯示到畫面上
            NEXT FIELD b_stgg002                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgg002_desc>>----
         #----<<b_stgg003>>----
         #Ctrlp:construct.c.page1.b_stgg003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg003
            #add-point:ON ACTION controlp INFIELD b_stgg003 name="construct.c.filter.page1.b_stgg003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgg003  #顯示到畫面上
            NEXT FIELD b_stgg003                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgg003_desc>>----
         #----<<b_stgg004>>----
         #Ctrlp:construct.c.page1.b_stgg004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg004
            #add-point:ON ACTION controlp INFIELD b_stgg004 name="construct.c.filter.page1.b_stgg004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#3 -S
            #CALL q_pmaa001()                                       
            LET g_qryparam.arg1 = "('3')"            
            CALL q_pmaa001_1()                           #呼叫開窗
            #160913-00034#3 -E
            DISPLAY g_qryparam.return1 TO b_stgg004  #顯示到畫面上
            NEXT FIELD b_stgg004                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgg004_desc>>----
         #----<<b_stgg005>>----
         #Ctrlp:construct.c.page1.b_stgg005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg005
            #add-point:ON ACTION controlp INFIELD b_stgg005 name="construct.c.filter.page1.b_stgg005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgg005  #顯示到畫面上
            NEXT FIELD b_stgg005                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgg005_desc>>----
         #----<<b_stgg006>>----
         #Ctrlp:construct.c.page1.b_stgg006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg006
            #add-point:ON ACTION controlp INFIELD b_stgg006 name="construct.c.filter.page1.b_stgg006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stgg006  #顯示到畫面上
            NEXT FIELD b_stgg006                     #返回原欄位
    


            #END add-point
 
 
         #----<<b_stgg006_desc>>----
         #----<<b_stgg007>>----
         #Ctrlp:construct.c.filter.page1.b_stgg007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg007
            #add-point:ON ACTION controlp INFIELD b_stgg007 name="construct.c.filter.page1.b_stgg007"
            
            #END add-point
 
 
         #----<<b_stgg008>>----
         #Ctrlp:construct.c.filter.page1.b_stgg008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg008
            #add-point:ON ACTION controlp INFIELD b_stgg008 name="construct.c.filter.page1.b_stgg008"
            
            #END add-point
 
 
         #----<<b_stgg009>>----
         #Ctrlp:construct.c.filter.page1.b_stgg009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg009
            #add-point:ON ACTION controlp INFIELD b_stgg009 name="construct.c.filter.page1.b_stgg009"
            
            #END add-point
 
 
         #----<<b_stgg010>>----
         #Ctrlp:construct.c.filter.page1.b_stgg010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg010
            #add-point:ON ACTION controlp INFIELD b_stgg010 name="construct.c.filter.page1.b_stgg010"
            
            #END add-point
 
 
         #----<<b_stgg011>>----
         #Ctrlp:construct.c.filter.page1.b_stgg011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg011
            #add-point:ON ACTION controlp INFIELD b_stgg011 name="construct.c.filter.page1.b_stgg011"
            
            #END add-point
 
 
         #----<<b_stgg012>>----
         #Ctrlp:construct.c.filter.page1.b_stgg012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg012
            #add-point:ON ACTION controlp INFIELD b_stgg012 name="construct.c.filter.page1.b_stgg012"
            
            #END add-point
 
 
         #----<<b_stgg013>>----
         #Ctrlp:construct.c.filter.page1.b_stgg013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg013
            #add-point:ON ACTION controlp INFIELD b_stgg013 name="construct.c.filter.page1.b_stgg013"
            
            #END add-point
 
 
         #----<<b_stgg014>>----
         #Ctrlp:construct.c.filter.page1.b_stgg014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg014
            #add-point:ON ACTION controlp INFIELD b_stgg014 name="construct.c.filter.page1.b_stgg014"
            
            #END add-point
 
 
         #----<<b_stgg001>>----
         #Ctrlp:construct.c.filter.page1.b_stgg001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stgg001
            #add-point:ON ACTION controlp INFIELD b_stgg001 name="construct.c.filter.page1.b_stgg001"
            
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
 
      CALL astq507_filter_show('stfa051','b_stfa051')
   CALL astq507_filter_show('stggsite','b_stggsite')
   CALL astq507_filter_show('stgg002','b_stgg002')
   CALL astq507_filter_show('stgg003','b_stgg003')
   CALL astq507_filter_show('stgg004','b_stgg004')
   CALL astq507_filter_show('stgg005','b_stgg005')
   CALL astq507_filter_show('stgg006','b_stgg006')
   CALL astq507_filter_show('stgg007','b_stgg007')
   CALL astq507_filter_show('stgg008','b_stgg008')
   CALL astq507_filter_show('stgg009','b_stgg009')
   CALL astq507_filter_show('stgg010','b_stgg010')
   CALL astq507_filter_show('stgg011','b_stgg011')
   CALL astq507_filter_show('stgg012','b_stgg012')
   CALL astq507_filter_show('stgg013','b_stgg013')
   CALL astq507_filter_show('stgg014','b_stgg014')
   CALL astq507_filter_show('stgg001','b_stgg001')
 
 
   CALL astq507_b_fill()
 
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.b_statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq507.filter_parser" >}
#應用 qs14 樣板自動產生(Version:6)
#+ filter pasara段
#+ filter欄位解析
PRIVATE FUNCTION astq507_filter_parser(ps_field)
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
 
{<section id="astq507.filter_show" >}
#應用 qs15 樣板自動產生(Version:6)
#+ filter標題欄位顯示搜尋條件
PRIVATE FUNCTION astq507_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq507_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
 
{</section>}
 
{<section id="astq507.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq507_detail_action_trans()
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
 
{<section id="astq507.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq507_detail_index_setting()
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
            IF g_stgg_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_stgg_d.getLength() AND g_stgg_d.getLength() > 0
            LET g_detail_idx = g_stgg_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_stgg_d.getLength() THEN
               LET g_detail_idx = g_stgg_d.getLength()
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
 
{<section id="astq507.mask_functions" >}
 &include "erp/ast/astq507_mask.4gl"
 
{</section>}
 
{<section id="astq507.other_function" readonly="Y" >}

 
{</section>}
 
