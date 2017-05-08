#該程式未解開Section, 採用最新樣板產出!
{<section id="astq802.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:7(2016-09-13 15:33:59), PR版次:0007(2016-10-26 14:51:09)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000023
#+ Filename...: astq802
#+ Description: 商戶欠費經營狀況查詢
#+ Creator....: 06540(2016-06-21 15:04:54)
#+ Modifier...: 07142 -SD/PR- 06189
 
{</section>}
 
{<section id="astq802.global" >}
#應用 q02 樣板自動產生(Version:42)
#add-point:填寫註解說明 name="global.memo"
#160604-00009#68 2016/7/14  by 08172  画面调整
#160907-00025#1 2016/09/07 by 08172  楼层欠租页签新增楼栋
#160913-00011#1 2016/09/13 by 08172  铺位欠租页签新增楼栋楼层
#add by geza 20161024 #161024-00025#10 aooi500规范调整
#161024-00025#3  2016/10/26 By dongsz     b_stbcsite开窗替换q_ooef001_24  where ooef201 = 'Y'
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
       #statepic       LIKE type_t.chr1,
       
       sel LIKE type_t.chr1, 
   stbcsite LIKE stbc_t.stbcsite, 
   l_ooefl003 LIKE type_t.chr500, 
   stbc008 LIKE stbc_t.stbc008, 
   l_pmaal003 LIKE type_t.chr500, 
   l_stje019_1 LIKE type_t.chr10, 
   l_mhaal003_1 LIKE type_t.chr500, 
   l_stje020_1 LIKE type_t.chr10, 
   l_mhabl004_1 LIKE type_t.chr500, 
   l_stje021 LIKE type_t.chr10, 
   l_stje021_desc LIKE type_t.chr500, 
   stbc033 LIKE stbc_t.stbc033, 
   l_mhbel003 LIKE type_t.chr500, 
   l_stje010 LIKE type_t.chr500, 
   l_stje029 LIKE type_t.chr10, 
   l_stje029_desc LIKE type_t.chr500, 
   l_stje001 LIKE type_t.chr20, 
   stbc012 LIKE stbc_t.stbc012, 
   l_stael003 LIKE type_t.chr500, 
   l_stje025 LIKE type_t.num20_6, 
   l_dayrent LIKE type_t.num20_6, 
   l_stje011 LIKE type_t.dat, 
   l_stje012 LIKE type_t.dat, 
   l_freeday LIKE type_t.num10, 
   l_stjm007 LIKE type_t.num20_6, 
   l_remoney LIKE type_t.num20_6, 
   l_stbc020 LIKE type_t.num20_6, 
   l_stbc019 LIKE type_t.num20_6, 
   l_rentdate LIKE type_t.dat, 
   l_owe LIKE type_t.chr1, 
   l_owedays LIKE type_t.num10, 
   l_owemoney LIKE type_t.num20_6, 
   l_returnmoney LIKE type_t.num20_6 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE  g_stbc_d2 DYNAMIC ARRAY OF RECORD
   stbcsite    LIKE stbc_t.stbcsite, 
   ooefl003    LIKE type_t.chr500, 
   stbc008     LIKE stbc_t.stbc008, 
   pmaal003    LIKE type_t.chr500, 
   stbc012     LIKE stbc_t.stbc012, 
   stael003    LIKE type_t.chr500, 
   stjm007     LIKE type_t.num20_6,
   remoney     LIKE type_t.num20_6,    #160604-00009#68   
   stbc020     LIKE type_t.num20_6, 
   stbc019     LIKE type_t.num20_6, 
   owe         LIKE type_t.chr1,   
   owemoney    LIKE type_t.num20_6, 
   returnmoney LIKE type_t.num20_6 
       END RECORD

DEFINE  g_stbc_d3 DYNAMIC ARRAY OF RECORD 
   stbcsite    LIKE stbc_t.stbcsite, 
   ooefl003    LIKE type_t.chr500,
   stje019     LIKE stje_t.stje019,     #160907-00025#1 by 08172
   mhaal003    LIKE mhaal_t.mhaal003,   #160907-00025#1 by 08172   
   stje020     LIKE stje_t.stje020,
   mhabl004    LIKE mhabl_t.mhabl004,
   stbc012     LIKE stbc_t.stbc012, 
   stael003    LIKE type_t.chr500, 
   stjm007     LIKE type_t.num20_6,
   remoney     LIKE type_t.num20_6,    #160604-00009#68   
   stbc020     LIKE type_t.num20_6, 
   stbc019     LIKE type_t.num20_6, 
   owe         LIKE type_t.chr1, 
   owemoney    LIKE type_t.num20_6,
   returnmoney LIKE type_t.num20_6 
       END RECORD
       
DEFINE  g_stbc_d4 DYNAMIC ARRAY OF RECORD 
   stbcsite    LIKE stbc_t.stbcsite, 
   ooefl003    LIKE type_t.chr500, 
   stje019     LIKE stje_t.stje019,
   mhaal003    LIKE mhaal_t.mhaal003,
   stbc012     LIKE stbc_t.stbc012, 
   stael003    LIKE type_t.chr500, 
   stjm007     LIKE type_t.num20_6,
   remoney     LIKE type_t.num20_6,    #160604-00009#68    
   stbc020     LIKE type_t.num20_6, 
   stbc019     LIKE type_t.num20_6, 
   owe         LIKE type_t.chr1,
   owemoney    LIKE type_t.num20_6,
   returnmoney LIKE type_t.num20_6 
       END RECORD
       
DEFINE  g_stbc_d5 DYNAMIC ARRAY OF RECORD 
   stbcsite    LIKE stbc_t.stbcsite, 
   ooefl003    LIKE type_t.chr500, 
   stbc012     LIKE stbc_t.stbc012, 
   stael003    LIKE type_t.chr500, 
   stjm007     LIKE type_t.num20_6,
   remoney     LIKE type_t.num20_6,    #160604-00009#68   
   stbc020     LIKE type_t.num20_6, 
   stbc019     LIKE type_t.num20_6, 
   owe         LIKE type_t.chr1,
   owemoney    LIKE type_t.num20_6,
   returnmoney LIKE type_t.num20_6 
       END RECORD
       
DEFINE l_enddate  LIKE type_t.dat
DEFINE l_merchant LIKE type_t.chr1
DEFINE l_floor    LIKE type_t.chr1
DEFINE l_building LIKE type_t.chr1
DEFINE l_store    LIKE type_t.chr1
DEFINE g_where         STRING
DEFINE g_where1        STRING
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_stbc_d
DEFINE g_master_t                   type_g_stbc_d
DEFINE g_stbc_d          DYNAMIC ARRAY OF type_g_stbc_d
DEFINE g_stbc_d_t        type_g_stbc_d
 
      
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
 
{<section id="astq802.main" >}
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
   DECLARE astq802_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astq802_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astq802_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astq802 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astq802_init()   
 
      #進入選單 Menu (="N")
      CALL astq802_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      CALL astq802_drop_tmp() RETURNING l_success
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astq802
      
   END IF 
   
   CLOSE astq802_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #add by geza 20161024 #161024-00025#10 
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astq802.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astq802_init()
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
   CALL astq802_create_tmp() RETURNING l_success
   CALL s_aooi500_create_temp() RETURNING l_success
   LET l_enddate  = g_today
   LET l_merchant = 'N'
   LET l_floor    = 'N'
   LET l_building = 'N'
   LET l_store    = 'N'
   CALL cl_set_comp_visible("page_3,page_4,page_5,page_6",FALSE)  #160604-00009#68
   #end add-point
 
   CALL astq802_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="astq802.default_search" >}
PRIVATE FUNCTION astq802_default_search()
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
 
   #add-point:default_search段開始後 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq802.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION astq802_ui_dialog()
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
      CALL astq802_b_fill()
   ELSE
      CALL astq802_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_stbc_d.clear()
 
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
 
         CALL astq802_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_stbc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq802_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq802_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         CONSTRUCT g_wc_table ON stjesite,stje019,stje007,stje020,stje008,stje001,stje021,stje028,stji002
                            FROM stjesite,stje019,stje007,stje020,stje008,stje001,stje021,stje028,stbc012
                      
         BEFORE CONSTRUCT
        
         ON ACTION controlp INFIELD stjesite
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbcsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stjesite  #顯示到畫面上
            NEXT FIELD stjesite                     #返回原欄位

         ON ACTION controlp INFIELD stje007  
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')" 
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje007  #顯示到畫面上
            NEXT FIELD stje007                     #返回原欄位
            
         ON ACTION controlp INFIELD stje008
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje008  #顯示到畫面上
            NEXT FIELD stje008                     #返回原欄位
         
         ON ACTION controlp INFIELD stje001
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stje001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje001  #顯示到畫面上
            NEXT FIELD stje001                     #返回原欄位
            
         ON ACTION controlp INFIELD stje019
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje019  #顯示到畫面上
            NEXT FIELD stje019                     #返回原欄位

         ON ACTION controlp INFIELD stje020
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje020  #顯示到畫面上
            NEXT FIELD stje020                     #返回原欄位

         ON ACTION controlp INFIELD stje021
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhac003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje021  #顯示到畫面上
            NEXT FIELD stje021                     #返回原欄位
            
         ON ACTION controlp INFIELD stje028
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,g_site,'E-CIR-0001') #
            CALL q_rtax001_3()                              #呼叫開窗
            DISPLAY g_qryparam.return1 TO stje028  #顯示到畫面上
            NEXT FIELD stje028                     #返回原欄位
            
         ON ACTION controlp INFIELD stbc012
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                              #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbc012  #顯示到畫面上
            NEXT FIELD stbc012                     #返回原欄位
            
         END CONSTRUCT
         
         INPUT l_enddate,l_merchant,l_floor,l_building,l_store
          FROM l_enddate,l_merchant,l_floor,l_building,l_store
            ATTRIBUTE(WITHOUT DEFAULTS)
            
               ON CHANGE l_merchant
                  #160604-00009#68 -s by 08172
                  IF l_merchant = 'Y' THEN
                     CALL cl_set_comp_visible("page_3",TRUE)
                  ELSE
                     CALL cl_set_comp_visible("page_3",FALSE)
                  END IF
                  #160604-00009#68 -e by 08172
#                  IF g_stbc_d.getLength() > 0 THEN
#                     IF l_merchant = 'Y' THEN
#                        CALL astq802_b_fill2()
#                     END IF
#                  END IF
                  
               ON CHANGE l_floor
                  #160604-00009#68 -s by 08172
                  IF l_floor = 'Y' THEN
                     CALL cl_set_comp_visible("page_4",TRUE)
                  ELSE
                     CALL cl_set_comp_visible("page_4",FALSE)
                  END IF
                  #160604-00009#68 -e by 08172 
#                  IF g_stbc_d.getLength() > 0 THEN
#                     IF l_floor    = 'Y' THEN
#                        CALL astq802_b_fill3()
#                     END IF
#                  END IF
                  
               ON CHANGE l_building
                  #160604-00009#68 -s by 08172
                  IF l_building = 'Y' THEN
                     CALL cl_set_comp_visible("page_5",TRUE)
                  ELSE
                     CALL cl_set_comp_visible("page_5",FALSE)
                  END IF
                  #160604-00009#68 -e by 08172
#                  IF g_stbc_d.getLength() > 0 THEN   
#                     IF l_building = 'Y' THEN
#                        CALL astq802_b_fill4()
#                     END IF
#                  END IF
                  
               ON CHANGE l_store
                  #160604-00009#68 -s by 08172
                  IF l_store = 'Y' THEN
                     CALL cl_set_comp_visible("page_6",TRUE)
                  ELSE                              
                     CALL cl_set_comp_visible("page_6",FALSE)
                  END IF
                  #160604-00009#68 -e by 08172
#                  IF g_stbc_d.getLength() > 0 THEN   
#                     IF l_store    = 'Y' THEN
#                        CALL astq802_b_fill5()
#                     END IF
#                  END IF
            
            AFTER INPUT
               IF INT_FLAG THEN
#               	LET INT_FLAG=0
#                  EXIT INPUT
                  RETURN
               END IF
         END INPUT      


         #DISPLAY第二页签
         DISPLAY ARRAY g_stbc_d2 TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               LET g_current_page = 2
            
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               DISPLAY g_detail_idx TO FORMONLY.h_index
               DISPLAY g_stbc_d2.getLength() TO FORMONLY.h_count
               CALL astq802_fetch()
               LET g_master_idx = l_ac
         END DISPLAY
         
         DISPLAY ARRAY g_stbc_d3 TO s_detail3.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 3
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq802_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq802_detail_action_trans()
               DISPLAY g_stbc_d3.getLength() TO FORMONLY.h_count

         END DISPLAY
         
         DISPLAY ARRAY g_stbc_d4 TO s_detail4.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 4
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail4")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq802_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq802_detail_action_trans()
               DISPLAY g_stbc_d4.getLength() TO FORMONLY.h_count

         END DISPLAY
         
         DISPLAY ARRAY g_stbc_d5 TO s_detail5.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 5
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail5")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL astq802_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL astq802_detail_action_trans()
               DISPLAY g_stbc_d5.getLength() TO FORMONLY.h_count

         END DISPLAY
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL astq802_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            CALL cl_set_act_visible("insert,query", FALSE)
            CALL cl_set_act_visible("selall,selnone,sel,unsel", FALSE)
            CALL cl_set_comp_visible("sel", FALSE)
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astq802_insert()
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
               CALL astq802_query()
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
            CALL astq802_filter()
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
            CALL astq802_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_stbc_d)
               LET g_export_id[1]   = "s_detail1"
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               LET g_export_node[2] = base.typeInfo.create(g_stbc_d2)
               LET g_export_id[2]   = "s_detail2"
               LET g_export_node[3] = base.typeInfo.create(g_stbc_d3)
               LET g_export_id[3]   = "s_detail3"
               LET g_export_node[4] = base.typeInfo.create(g_stbc_d4)
               LET g_export_id[4]   = "s_detail4"
               LET g_export_node[5] = base.typeInfo.create(g_stbc_d5)
               LET g_export_id[5]   = "s_detail5"
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
            CALL astq802_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL astq802_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL astq802_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL astq802_b_fill()
 
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
         ON ACTION ACCEPT
            
            LET g_wc = g_wc_table        
            
            LET g_detail_idx = 1
            LET g_detail_idx2 = 1
            CALL astq802_b_fill()
            IF g_stbc_d.getLength() > 0 THEN
               CALL DIALOG.setCurrentRow("s_detail1", g_detail_idx)
            END IF
 
            IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = -100
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            END IF
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
 
{<section id="astq802.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astq802_query()
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
   CALL g_stbc_d.clear()
 
   
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
      CONSTRUCT g_wc_table ON stbcsite,stbc008,stbc033,stbc012
           FROM s_detail1[1].b_stbcsite,s_detail1[1].b_stbc008,s_detail1[1].b_stbc033,s_detail1[1].b_stbc012 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<b_stbcsite>>----
         #Ctrlp:construct.c.page1.b_stbcsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbcsite
            #add-point:ON ACTION controlp INFIELD b_stbcsite name="construct.c.page1.b_stbcsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                           #呼叫開窗   #161024-00025#3 mark
            LET g_qryparam.where = " ooef201 = 'Y' "       #161024-00025#3 add
            CALL q_ooef001_24()                            #161024-00025#3 add
            DISPLAY g_qryparam.return1 TO b_stbcsite  #顯示到畫面上
            NEXT FIELD b_stbcsite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stbcsite
            #add-point:BEFORE FIELD b_stbcsite name="construct.b.page1.b_stbcsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stbcsite
            
            #add-point:AFTER FIELD b_stbcsite name="construct.a.page1.b_stbcsite"
            
            #END add-point
            
 
 
         #----<<l_ooefl003>>----
         #----<<b_stbc008>>----
         #Ctrlp:construct.c.page1.b_stbc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc008
            #add-point:ON ACTION controlp INFIELD b_stbc008 name="construct.c.page1.b_stbc008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc008  #顯示到畫面上
            NEXT FIELD b_stbc008                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stbc008
            #add-point:BEFORE FIELD b_stbc008 name="construct.b.page1.b_stbc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stbc008
            
            #add-point:AFTER FIELD b_stbc008 name="construct.a.page1.b_stbc008"
            
            #END add-point
            
 
 
         #----<<l_pmaal003>>----
         #----<<l_stje019_1>>----
         #----<<l_mhaal003_1>>----
         #----<<l_stje020_1>>----
         #----<<l_mhabl004_1>>----
         #----<<l_stje021>>----
         #----<<l_stje021_desc>>----
         #----<<b_stbc033>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stbc033
            #add-point:BEFORE FIELD b_stbc033 name="construct.b.page1.b_stbc033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stbc033
            
            #add-point:AFTER FIELD b_stbc033 name="construct.a.page1.b_stbc033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_stbc033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc033
            #add-point:ON ACTION controlp INFIELD b_stbc033 name="construct.c.page1.b_stbc033"
            
            #END add-point
 
 
         #----<<l_mhbel003>>----
         #----<<l_stje010>>----
         #----<<l_stje029>>----
         #----<<l_stje029_desc>>----
         #----<<l_stje001>>----
         #----<<b_stbc012>>----
         #Ctrlp:construct.c.page1.b_stbc012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc012
            #add-point:ON ACTION controlp INFIELD b_stbc012 name="construct.c.page1.b_stbc012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc012  #顯示到畫面上
            NEXT FIELD b_stbc012                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_stbc012
            #add-point:BEFORE FIELD b_stbc012 name="construct.b.page1.b_stbc012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_stbc012
            
            #add-point:AFTER FIELD b_stbc012 name="construct.a.page1.b_stbc012"
            
            #END add-point
            
 
 
         #----<<l_stael003>>----
         #----<<l_stje025>>----
         #----<<l_dayrent>>----
         #----<<l_stje011>>----
         #----<<l_stje012>>----
         #----<<l_freeday>>----
         #----<<l_stjm007>>----
         #----<<l_remoney>>----
         #----<<l_stbc020>>----
         #----<<l_stbc019>>----
         #----<<l_rentdate>>----
         #----<<l_owe>>----
         #----<<l_owedays>>----
         #----<<l_owemoney>>----
         #----<<l_returnmoney>>----
   
       
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
   CALL astq802_b_fill()
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
 
{<section id="astq802.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astq802_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE g_sql_del       STRING
   DEFINE g_sql_ins       STRING
#   DEFINE l_where         STRING
#   DEFINE l_where1        STRING
    
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stbcsite') RETURNING g_where
   CALL s_aooi500_sql_where(g_prog,'stjesite') RETURNING g_where1
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
 
   LET ls_sql_rank = "SELECT  UNIQUE '',stbcsite,'',stbc008,'','','','','','','',stbc033,'','','','', 
       '',stbc012,'','','','','','','','','','','','','','',''  ,DENSE_RANK() OVER( ORDER BY stbc_t.stbc001, 
       stbc_t.stbc004,stbc_t.stbc005) AS RANK FROM stbc_t",
 
 
                     "",
                     " WHERE stbcent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("stbc_t"),
                     " ORDER BY stbc_t.stbc001,stbc_t.stbc004,stbc_t.stbc005"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
#160604-00009#68 -s  by 08172
#   #                                 门店               商户             铺位             门牌号   楼层             楼栋              费用编号         面积
#   LET ls_sql_rank  = "       SELECT stbcsite,ooefl003,stbc008,pmaal003,stbc033,mhbel003,stje010,stje020,mhabl004,stje019,mhaal003,stbc012,stael003,stje025,",
#                      "              '' dayrent, ",#日租金额
#                      "              stje011,stje012,
#                                     SUM(COALESCE(stje013,0))+SUM(COALESCE(stjh005-stjh004,0)) rentday,",#开始/结束日期/免租天数
#                      "              '' stjm007,
#                                     SUM(stbc020+stbc022) stbc020,
#                                     SUM(stbc019) stbc019,", #费用金额、已收金额、未收金额
#                      "              '' rentdate,",#租金交至日 DECODE(sum(stbc019),0,stbc046,stbc045+(stbc046-stbc045)*sum(stbc019) / sum(stbc018))
#                      "              DECODE(sum(stbc019),0,'N','Y') owe,",#欠租否 DECODE(sum(stbc019),0,'N','Y')
#                      "              '' owedays,
#                                     SUM(stbc019) owemoney,
#                                     '' returnmoney",   #欠租天数、统计截止日期欠费金额、统计日期未返款金额
#                      --"              DENSE_RANK() OVER(PARTITION BY stbcsite,stbc008,stbc033 ORDER BY stbc046 DESC) RANK",
#                      "        FROM stbc_t ",
#                      "   LEFT JOIN ooefl_t ON ooeflent = stbcent 
#                                           AND ooefl001 = stbcsite
#                                           AND ooefl002 = '",g_dlang,"' ",
#                      "   LEFT JOIN pmaal_t ON pmaalent = stbcent 
#                                           AND pmaal001 = stbc008
#                                           AND pmaal002 = '",g_dlang,"' ",
#                      "   LEFT JOIN mhbel_t ON mhbelent = stbcent 
#                                           AND mhbel001 = stbc033
#                                           AND mhbel002 = '",g_dlang,"' ",
#                      "   LEFT JOIN stael_t ON staelent = stbcent 
#                                           AND stael001 = stbc012
#                                           AND stael002 = '",g_dlang,"' ",
#                      "   LEFT JOIN stje_t ON stjeent = stbcent 
#                                          AND stjesite = stbcsite 
#                                          AND stje007 = stbc008 
#                                          AND stje008 = stbc033 
#                                          AND stje011 <=  stbc045 AND stje012 >= stbc046 ",
#                      "   LEFT JOIN mhaal_t ON mhaalent = stbcent 
#                                           AND mhaal001 = stje019
#                                           AND mhaal002 = '",g_dlang,"' ",
#                      "   LEFT JOIN mhabl_t ON mhablent = stbcent 
#                                           AND mhabl001 = stje019
#                                           AND mhabl002 = stje020
#                                           AND mhabl003 = '",g_dlang,"' ",
#                      "   LEFT JOIN stjh_t ON stjhent = stjeent 
#                                          AND stjh001 = stje001 
#                                          AND stjh002 = stbc012 
#                                          AND stjh008 = '3' ", #租期优惠
#                      "   LEFT JOIN stjm_t ON stjment = stjeent 
#                                          AND stjm001 = stje001  ",
#                      "  WHERE '",g_enterprise,"' = ? AND 1=1 AND ", ls_wc,
#                      "    AND stje004 = '5' ", #经营方式 5-租赁
#                      "    AND stbc003 = '3' ", #来源单号为3.费用单    #160604-00009#68  
#                      "    AND ",l_where,
#                      "  GROUP BY stbcsite,ooefl003,stbc008,pmaal003,stbc033,mhbel003,stje010,stje020,mhabl004,stje019,mhaal003,stbc012,stael003,stje025,
#                                  stje011,stje012"
#
#   LET l_detail_sql = "       SELECT stbcsite,ooefl003,stbc008,pmaal003,stbc033,mhbel003,
#                                     stje010,stje020,stje019,stbc012,stael003,stje025,
#                                     dayrent,stje011,stje012,rentday,stjm007,stbc020,
#                                     stbc019,rentdate,owe,owedays,owemoney,returnmoney,MIN(RANK)",
#                      "         FROM (",ls_sql_rank,")",
#                      "        WHERE stbc020 != 0 ",
#                      "        GROUP BY stbcsite,ooefl003,stbc008,pmaal003,stbc033,mhbel003,
#                                        stje010,stje020,stje019,stbc012,stael003,stje025,
#                                        dayrent,stje011,stje012,rentday,stjm007,stbc020,
#                                        stbc019,rentdate,owe,owedays,owemoney,returnmoney"

#                                 门店                  商户             铺位             门牌号           楼层             楼栋              费用编号         面积
   LET ls_sql_rank  = "       SELECT stjesite,ooefl003,stje007,pmaal003,stje008,mhbel003,stje010,stje001,stje020,mhabl004,stje019,mhaal003,stje021,mhacl005,stje029,oocql004,stji002,stael003,stje025,",
                      "              '' dayrent, ",#日租金额
                      "              stje011,stje012,stje044,
                                     '' freeday,",#开始/结束日期/合同原始开始/免租天数
                      "              '' stjm011,
                                     '' remoney,
                                     '' stbc020,
                                     '' stbc019,", #费用总金额、统计截止日应收费用金额、已收金额、未收金额
                      "              '' rentdate,",#租金交至日 DECODE(sum(stbc019),0,stbc046,stbc045+(stbc046-stbc045)*sum(stbc019) / sum(stbc018))
                      "              '' owe,",#欠租否 DECODE(sum(stbc019),0,'N','Y')
                      "              '' owedays,
                                     '' owemoney,
                                     '' returnmoney,",   #欠租天数、统计截止日期欠费金额、统计日期未返款金额
                      "              '' stdate,
                                     '' eddate,
                                     '' countmoney,
                                     '' settlmoney,
                                     '' collmoney",    #合同账期开始日期，结束日期，费用金额，已结算金额，已交款金额
                      --"              DENSE_RANK() OVER(PARTITION BY stbcsite,stbc008,stbc033 ORDER BY stbc046 DESC) RANK",
                      "        FROM stje_t ",
                      "   LEFT JOIN ooefl_t ON ooeflent = stjeent 
                                           AND ooefl001 = stjesite
                                           AND ooefl002 = '",g_dlang,"' ",
                      "   LEFT JOIN pmaal_t ON pmaalent = stjeent 
                                           AND pmaal001 = stje007
                                           AND pmaal002 = '",g_dlang,"' ",
                      "   LEFT JOIN mhbel_t ON mhbelent = stjeent 
                                           AND mhbel001 = stje008
                                           AND mhbel002 = '",g_dlang,"' ",
                      "   LEFT JOIN stji_t ON stjient = stjeent 
                                          AND stji001 = stje001",
                      "   LEFT JOIN stael_t ON staelent = stjeent 
                                           AND stael001 = stji002
                                           AND stael002 = '",g_dlang,"' ",
                      "   LEFT JOIN mhaal_t ON mhaalent = stjeent 
                                           AND mhaal001 = stje019
                                           AND mhaal002 = '",g_dlang,"' ",
                      "   LEFT JOIN mhabl_t ON mhablent = stjeent 
                                           AND mhabl001 = stje019
                                           AND mhabl002 = stje020
                                           AND mhabl003 = '",g_dlang,"' ",
                      "   LEFT JOIN mhacl_t on  mhaclent=stjeent 
                                           AND mhacl001=stje019 
                                           AND mhacl002=stje020 
                                           AND mhacl003=stje021 
                                           AND mhacl004='",g_dlang,"' ",
                      "   LEFT JOIN oocql_t ON oocqlent=stjeent
                                            AND oocql001='2002' 
                                            AND oocql002=stje029 
                                            AND oocql003='",g_dlang,"' ",
                      "   LEFT JOIN stjh_t ON stjhent = stjeent 
                                          AND stjh001 = stje001 
                                          AND stjh002 = stji002 
                                          AND stjh008 = '3' ,stjm_t", #租期优惠
                      "  WHERE stjment = stjeent AND stjm001 = stje001 AND '",g_enterprise,"' = ? AND 1=1 AND ", ls_wc,
                      "    AND stje004 = '5' ", #经营方式 5-租赁
                      "    AND stje011<='",l_enddate,"'",
                      "    AND stje012>='",l_enddate,"'",                      
                      "    AND ",g_where1,
                      "  GROUP BY stjesite,ooefl003,stje007,pmaal003,stje008,mhbel003,stje010,stje001,stje020,mhabl004,stje019,mhaal003,stje021,mhacl005,stje029,oocql004,stji002,stael003,stje025,
                                  stje011,stje012,stje044"
#160604-00009#68 -e  by 08172

#   #清空临时表
#    TRUNCATE TABLE astq802_tmp
#   
#   #数据插入临时表
#    LET g_sql_ins = " INSERT INTO astq802_tmp ",ls_sql_rank         
#    PREPARE ins_tmp FROM g_sql_ins
#    EXECUTE ins_tmp USING g_enterprise
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'ins astq802_tmp'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF
#160604-00009#68 -s by 08172    
#    LET ls_sql_rank = "  SELECT 'N', stbcsite,   
#                                     ooefl003,   
#                                     stbc008 ,   
#                                     pmaal003,   
#                                     stbc033 ,   
#                                     mhbel003,   
#                                     stje010 ,  
#                                     stbc012 ,   
#                                     stael003,
#                                     stje025 ,                
#                                     dayrent ,   
#                                     stje011 ,   
#                                     stje012 ,   
#                                     freeday ,   
#                                     stjm007 ,   
#                                     stbc020 ,   
#                                     stbc019 ,   
#                                     rentdate,   
#                                     owe     ,   
#                                     owedays ,   
#                                     owemoney,   
#                                     returnmoney ",
#                       "  FROM astq802_tmp ",
#                       " WHERE 1=1 AND '",g_enterprise,"' = ? "
    CALL astq802_tmp_mod(ls_sql_rank)
    LET ls_sql_rank = "  SELECT 'N', stjesite,   
                                     ooefl003,   
                                     stje007 ,   
                                     pmaal003,
                                     stje019 ,
                                     mhaal003,
                                     stje020 ,
                                     mhabl004,
                                     stje021 ,
                                     mhacl005,                                     
                                     stje008 ,   
                                     mhbel003,   
                                     stje010 ,
                                     stje029 ,
                                     oocql004,
                                     stje001 ,                                     
                                     stji002 ,   
                                     stael003,
                                     stje025 ,                
                                     dayrent ,   
                                     stje011 ,   
                                     stje012 ,                                     
                                     freeday ,   
                                     stjm011 ,
                                     remoney ,                                     
                                     stbc020 ,   
                                     stbc019 ,   
                                     rentdate,   
                                     owe     ,
                                     owedays ,
                                     owemoney,   
                                     returnmoney ",     #160913-00011#1 add stje019,mhaal003.stje020,mhabl004 by 08172
                       "  FROM astq802_tmp ",
                       " WHERE 1=1 AND '",g_enterprise,"' = ? "
    
#160604-00009#68 -e by 08172
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
 
   LET g_sql = "SELECT '',stbcsite,'',stbc008,'','','','','','','',stbc033,'','','','','',stbc012,'', 
       '','','','','','','','','','','','','',''",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   LET g_sql = ls_sql_rank
   
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astq802_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astq802_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_stbc_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_stbc_d[l_ac].sel,g_stbc_d[l_ac].stbcsite,g_stbc_d[l_ac].l_ooefl003,g_stbc_d[l_ac].stbc008, 
       g_stbc_d[l_ac].l_pmaal003,g_stbc_d[l_ac].l_stje019_1,g_stbc_d[l_ac].l_mhaal003_1,g_stbc_d[l_ac].l_stje020_1, 
       g_stbc_d[l_ac].l_mhabl004_1,g_stbc_d[l_ac].l_stje021,g_stbc_d[l_ac].l_stje021_desc,g_stbc_d[l_ac].stbc033, 
       g_stbc_d[l_ac].l_mhbel003,g_stbc_d[l_ac].l_stje010,g_stbc_d[l_ac].l_stje029,g_stbc_d[l_ac].l_stje029_desc, 
       g_stbc_d[l_ac].l_stje001,g_stbc_d[l_ac].stbc012,g_stbc_d[l_ac].l_stael003,g_stbc_d[l_ac].l_stje025, 
       g_stbc_d[l_ac].l_dayrent,g_stbc_d[l_ac].l_stje011,g_stbc_d[l_ac].l_stje012,g_stbc_d[l_ac].l_freeday, 
       g_stbc_d[l_ac].l_stjm007,g_stbc_d[l_ac].l_remoney,g_stbc_d[l_ac].l_stbc020,g_stbc_d[l_ac].l_stbc019, 
       g_stbc_d[l_ac].l_rentdate,g_stbc_d[l_ac].l_owe,g_stbc_d[l_ac].l_owedays,g_stbc_d[l_ac].l_owemoney, 
       g_stbc_d[l_ac].l_returnmoney
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_stbc_d[l_ac].statepic = cl_get_actipic(g_stbc_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      
      #end add-point
 
      CALL astq802_detail_show("'1'")      
 
      CALL astq802_stbc_t_mask()
 
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
   
 
   
   CALL g_stbc_d.deleteElement(g_stbc_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"

   IF l_merchant = 'Y' THEN
      CALL astq802_b_fill2()
   END IF
   IF l_floor    = 'Y' THEN
      CALL astq802_b_fill3()
   END IF
   IF l_building = 'Y' THEN
      CALL astq802_b_fill4()
   END IF
   IF l_store    = 'Y' THEN
      CALL astq802_b_fill5()
   END IF
   #160604-00009#68 -s by 08172
   IF l_merchant = 'N' THEN
      CALL g_stbc_d2.clear()
   END IF
   IF l_floor = 'N' THEN
      CALL g_stbc_d3.clear()
   END IF
   IF l_building = 'N' THEN
      CALL g_stbc_d4.clear()
   END IF
   IF l_store = 'N' THEN
      CALL g_stbc_d5.clear()
   END IF
   #160604-00009#68 -e by 08172
   #end add-point
 
   LET g_detail_cnt = g_stbc_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astq802_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL astq802_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL astq802_detail_action_trans()
 
   IF g_stbc_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL astq802_fetch()
   END IF
   
      CALL astq802_filter_show('stbcsite','b_stbcsite')
   CALL astq802_filter_show('stbc008','b_stbc008')
   CALL astq802_filter_show('stbc033','b_stbc033')
   CALL astq802_filter_show('stbc012','b_stbc012')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astq802.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astq802_fetch()
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
 
{<section id="astq802.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astq802_detail_show(ps_page)
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
 
{<section id="astq802.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astq802_filter()
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
      CONSTRUCT g_wc_filter ON stbcsite,stbc008,stbc033,stbc012
                          FROM s_detail1[1].b_stbcsite,s_detail1[1].b_stbc008,s_detail1[1].b_stbc033, 
                              s_detail1[1].b_stbc012
 
         BEFORE CONSTRUCT
                     DISPLAY astq802_filter_parser('stbcsite') TO s_detail1[1].b_stbcsite
            DISPLAY astq802_filter_parser('stbc008') TO s_detail1[1].b_stbc008
            DISPLAY astq802_filter_parser('stbc033') TO s_detail1[1].b_stbc033
            DISPLAY astq802_filter_parser('stbc012') TO s_detail1[1].b_stbc012
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_stbcsite>>----
         #Ctrlp:construct.c.page1.b_stbcsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbcsite
            #add-point:ON ACTION controlp INFIELD b_stbcsite name="construct.c.filter.page1.b_stbcsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                           #呼叫開窗    #161024-00025#3 mark
            LET g_qryparam.where = " ooef201 = 'Y' "       #161024-00025#3 add
            CALL q_ooef001_24()                            #161024-00025#3 add
            DISPLAY g_qryparam.return1 TO b_stbcsite  #顯示到畫面上
            NEXT FIELD b_stbcsite                     #返回原欄位
    



            #END add-point
 
 
         #----<<l_ooefl003>>----
         #----<<b_stbc008>>----
         #Ctrlp:construct.c.page1.b_stbc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc008
            #add-point:ON ACTION controlp INFIELD b_stbc008 name="construct.c.filter.page1.b_stbc008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc008  #顯示到畫面上
            NEXT FIELD b_stbc008                     #返回原欄位
    



            #END add-point
 
 
         #----<<l_pmaal003>>----
         #----<<l_stje019_1>>----
         #----<<l_mhaal003_1>>----
         #----<<l_stje020_1>>----
         #----<<l_mhabl004_1>>----
         #----<<l_stje021>>----
         #----<<l_stje021_desc>>----
         #----<<b_stbc033>>----
         #Ctrlp:construct.c.filter.page1.b_stbc033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc033
            #add-point:ON ACTION controlp INFIELD b_stbc033 name="construct.c.filter.page1.b_stbc033"
            
            #END add-point
 
 
         #----<<l_mhbel003>>----
         #----<<l_stje010>>----
         #----<<l_stje029>>----
         #----<<l_stje029_desc>>----
         #----<<l_stje001>>----
         #----<<b_stbc012>>----
         #Ctrlp:construct.c.page1.b_stbc012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_stbc012
            #add-point:ON ACTION controlp INFIELD b_stbc012 name="construct.c.filter.page1.b_stbc012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stbc012  #顯示到畫面上
            NEXT FIELD b_stbc012                     #返回原欄位
    



            #END add-point
 
 
         #----<<l_stael003>>----
         #----<<l_stje025>>----
         #----<<l_dayrent>>----
         #----<<l_stje011>>----
         #----<<l_stje012>>----
         #----<<l_freeday>>----
         #----<<l_stjm007>>----
         #----<<l_remoney>>----
         #----<<l_stbc020>>----
         #----<<l_stbc019>>----
         #----<<l_rentdate>>----
         #----<<l_owe>>----
         #----<<l_owedays>>----
         #----<<l_owemoney>>----
         #----<<l_returnmoney>>----
   
 
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
   
      CALL astq802_filter_show('stbcsite','b_stbcsite')
   CALL astq802_filter_show('stbc008','b_stbc008')
   CALL astq802_filter_show('stbc033','b_stbc033')
   CALL astq802_filter_show('stbc012','b_stbc012')
 
    
   CALL astq802_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="astq802.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astq802_filter_parser(ps_field)
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
 
{<section id="astq802.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astq802_filter_show(ps_field,ps_object)
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
   LET ls_condition = astq802_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astq802.insert" >}
#+ insert
PRIVATE FUNCTION astq802_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astq802.modify" >}
#+ modify
PRIVATE FUNCTION astq802_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq802.reproduce" >}
#+ reproduce
PRIVATE FUNCTION astq802_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq802.delete" >}
#+ delete
PRIVATE FUNCTION astq802_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="astq802.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION astq802_detail_action_trans()
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
 
{<section id="astq802.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION astq802_detail_index_setting()
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
 
{<section id="astq802.mask_functions" >}
 &include "erp/ast/astq802_mask.4gl"
 
{</section>}
 
{<section id="astq802.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 创建临时表
# Date & Author..: 2016-06-22 By LanJJ
################################################################################
PRIVATE FUNCTION astq802_create_tmp()
DEFINE r_success         LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF NOT astq802_drop_tmp() THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   CREATE TEMP TABLE astq802_tmp(
   stjesite    LIKE stje_t.stjesite ,
   ooefl003    LIKE ooefl_t.ooefl003,
   stje007     LIKE stje_t.stje007  ,
   pmaal003    LIKE pmaal_t.pmaal003,
   stje008     LIKE stje_t.stje008  ,
   mhbel003    LIKE mhbel_t.mhbel003,
   stje010     LIKE stje_t.stje010  ,
   stje001     LIKE stje_t.stje001  ,
   stje020     LIKE stje_t.stje020  ,
   mhabl004    LIKE mhabl_t.mhabl004,
   stje019     LIKE stje_t.stje019  ,
   mhaal003    LIKE mhaal_t.mhaal003,
   stje021     LIKE stje_t.stje021  ,
   mhacl005    LIKE mhacl_t.mhacl005,
   stje029     LIKE stje_t.stje029  ,
   oocql004    LIKE oocql_t.oocql004,
   stji002     LIKE stji_t.stji002  ,
   stael003    LIKE stael_t.stael003,
   stje025     LIKE stje_t.stje025  ,
   dayrent     LIKE type_t.num20_6  ,
   stje011     LIKE stje_t.stje011  ,      #合同开始日期
   stje012     LIKE stje_t.stje012  ,      #合同结束日期
   stje044     LIKE stje_t.stje044  ,      #合同原始开始日期
   freeday     LIKE type_t.num5     ,
   stjm011     LIKE stjm_t.stjm011  ,      #费用总金额
   remoney     LIKE type_t.num20_6  ,      #统计截止日应收费用金额
   stbc020     LIKE stbc_t.stbc020  ,
   stbc019     LIKE stbc_t.stbc019  ,
   rentdate    LIKE type_t.dat      ,
   owe         LIKE type_t.chr1     ,
   owedays     LIKE type_t.num5     ,
   owemoney    LIKE type_t.num20_6  ,
   returnmoney LIKE type_t.num20_6  ,
   stdate      LIKE stbc_t.stbc045  ,    #合同账单开始日期
   eddate      LIKE stbc_t.stbc046  ,    #合同账单结束日期
   countmoney  LIKE type_t.num20_6  ,    #合同账期对应费用金额
   settlmoney  LIKE type_t.num20_6  ,    #已结算金额
   collmoney   LIKE type_t.num20_6       #已交款金额
     )

   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create astq802_tmp'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2016-06-22 by lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_drop_tmp()
DEFINE r_success          LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   DROP TABLE astq802_tmp

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop astq802_tmp'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
      
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 商户欠租
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2016-06-23 by lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_b_fill2()
DEFINE l_sql1         STRING
DEFINE l_cnt2         LIKE type_t.num5 
DEFINE l_stbc020_sum  LIKE stbc_t.stbc020
DEFINE l_stgg009_sum  LIKE stgg_t.stgg009

   CALL g_stbc_d2.clear()
    LET l_sql1 = " SELECT stjesite,   
                          ooefl003,   
                          stje007 ,   
                          pmaal003,   
                          stji002 ,   
                          stael003,   
                          SUM(stjm011) ,   
                          SUM(remoney),
                          SUM(stbc020) ,   
                          SUM(stbc019) ,   
                          DECODE(sum(stbc019),0,'N','Y')     , 
                          SUM(owemoney),   
                          SUM(returnmoney) ",
                 "   FROM astq802_tmp ",
                 "  GROUP BY stjesite,ooefl003,stje007,pmaal003,stji002,stael003 "
                      

   PREPARE sel_stbc2_pre2 FROM l_sql1
   DECLARE sel_stbc2_cs2  CURSOR FOR sel_stbc2_pre2   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_stbc2_cs2 
                       INTO g_stbc_d2[l_ac].stbcsite,   
                            g_stbc_d2[l_ac].ooefl003,   
                            g_stbc_d2[l_ac].stbc008 ,   
                            g_stbc_d2[l_ac].pmaal003,   
                            g_stbc_d2[l_ac].stbc012 ,   
                            g_stbc_d2[l_ac].stael003,   
                            g_stbc_d2[l_ac].stjm007 ,   
                            g_stbc_d2[l_ac].remoney   ,          #160604-00009#68
                            g_stbc_d2[l_ac].stbc020 ,   
                            g_stbc_d2[l_ac].stbc019 ,   
                            g_stbc_d2[l_ac].owe     ,
                            g_stbc_d2[l_ac].owemoney,   
                            g_stbc_d2[l_ac].returnmoney
                            
                            
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
   
   CALL g_stbc_d2.deleteElement(g_stbc_d2.getLength())
   
   DISPLAY ARRAY g_stbc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_stbc2_cs2
   
END FUNCTION

################################################################################
# Descriptions...: 楼层欠租
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2016-06-23 by lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_b_fill3()
DEFINE l_sql1         STRING
DEFINE l_cnt2         LIKE type_t.num5 
DEFINE l_stbc020_sum  LIKE stbc_t.stbc020
DEFINE l_stgg009_sum  LIKE stgg_t.stgg009

   CALL g_stbc_d3.clear()
    LET l_sql1 = " SELECT stjesite,   
                          ooefl003,
                          stje019 ,
                          mhaal003,                          
                          stje020 ,   
                          mhabl004,   
                          stji002 ,   
                          stael003,   
                          SUM(stjm011) ,   
                          SUM(remoney), 
                          SUM(stbc020) ,   
                          SUM(stbc019) ,   
                          DECODE(sum(stbc019),0,'N','Y')     ,
                          SUM(owemoney),   
                          SUM(returnmoney) ",
                 "   FROM astq802_tmp ",
                 "  GROUP BY stjesite,ooefl003,stje019,mhaal003,stje020,mhabl004,stji002,stael003 " #160907-00025#1 add stje019,mhaal003 by 08172
                      

   PREPARE sel_stbc3_pre3 FROM l_sql1
   DECLARE sel_stbc3_cs3  CURSOR FOR sel_stbc3_pre3   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_stbc3_cs3 
                       INTO g_stbc_d3[l_ac].stbcsite,    
                            g_stbc_d3[l_ac].ooefl003,
                            g_stbc_d3[l_ac].stje019 ,   #160907-00025#1 by 08172
                            g_stbc_d3[l_ac].mhaal003,   #160907-00025#1 by 08172                            
                            g_stbc_d3[l_ac].stje020 ,    
                            g_stbc_d3[l_ac].mhabl004,    
                            g_stbc_d3[l_ac].stbc012 ,    
                            g_stbc_d3[l_ac].stael003,    
                            g_stbc_d3[l_ac].stjm007 ,    
                            g_stbc_d3[l_ac].remoney   ,       #160604-00009#68  
                            g_stbc_d3[l_ac].stbc020 ,    
                            g_stbc_d3[l_ac].stbc019 ,    
                            g_stbc_d3[l_ac].owe     ,
                            g_stbc_d3[l_ac].owemoney,    
                            g_stbc_d3[l_ac].returnmoney
                            
                            
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
   
   CALL g_stbc_d3.deleteElement(g_stbc_d3.getLength())
   
   DISPLAY ARRAY g_stbc_d3 TO s_detail3.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_stbc3_cs3
   
END FUNCTION

################################################################################
# Descriptions...: 楼栋欠费
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2016-06-23 by lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_b_fill4()
DEFINE l_sql1         STRING
DEFINE l_cnt2         LIKE type_t.num5 
DEFINE l_stbc020_sum  LIKE stbc_t.stbc020
DEFINE l_stgg009_sum  LIKE stgg_t.stgg009

   CALL g_stbc_d4.clear()
    LET l_sql1 = " SELECT stjesite,   
                          ooefl003,   
                          stje019 ,   
                          mhaal003,   
                          stji002 ,   
                          stael003,   
                          SUM(stjm011) ,   
                          SUM(remoney),
                          SUM(stbc020) ,   
                          SUM(stbc019) ,   
                          DECODE(sum(stbc019),0,'N','Y')     ,
                          SUM(owemoney),   
                          SUM(returnmoney) ",
                 "   FROM astq802_tmp ",
                 "  GROUP BY stjesite,ooefl003,stje019,mhaal003,stji002,stael003 "
                      

   PREPARE sel_stbc4_pre4 FROM l_sql1
   DECLARE sel_stbc4_cs4  CURSOR FOR sel_stbc4_pre4   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_stbc4_cs4 
                       INTO g_stbc_d4[l_ac].stbcsite,    
                            g_stbc_d4[l_ac].ooefl003,    
                            g_stbc_d4[l_ac].stje019 ,    
                            g_stbc_d4[l_ac].mhaal003,    
                            g_stbc_d4[l_ac].stbc012 ,    
                            g_stbc_d4[l_ac].stael003,    
                            g_stbc_d4[l_ac].stjm007 ,    
                            g_stbc_d4[l_ac].remoney   ,              #160604-00009#68 
                            g_stbc_d4[l_ac].stbc020 ,    
                            g_stbc_d4[l_ac].stbc019 ,    
                            g_stbc_d4[l_ac].owe     , 
                            g_stbc_d4[l_ac].owemoney,    
                            g_stbc_d4[l_ac].returnmoney
                            
                            
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
   
   CALL g_stbc_d4.deleteElement(g_stbc_d4.getLength())
   
   DISPLAY ARRAY g_stbc_d4 TO s_detail4.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_stbc4_cs4
   
END FUNCTION

################################################################################
# Descriptions...: 门店欠费
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2016-06-23 by lanjj 
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_b_fill5()
DEFINE l_sql1         STRING
DEFINE l_cnt2         LIKE type_t.num5 
DEFINE l_stbc020_sum  LIKE stbc_t.stbc020
DEFINE l_stgg009_sum  LIKE stgg_t.stgg009

   CALL g_stbc_d5.clear()
    LET l_sql1 = " SELECT stjesite,   
                          ooefl003, 
                          stji002 ,   
                          stael003,   
                          SUM(stjm011) ,   
                          SUM(remoney),
                          SUM(stbc020) ,   
                          SUM(stbc019) ,   
                          DECODE(sum(stbc019),0,'N','Y')     , 
                          SUM(owemoney),   
                          SUM(returnmoney) ",
                 "   FROM astq802_tmp ",
                 "  GROUP BY stjesite,ooefl003,stji002,stael003 "
                      

   PREPARE sel_stbc5_pre5 FROM l_sql1
   DECLARE sel_stbc5_cs5  CURSOR FOR sel_stbc5_pre5   
   
   LET g_cnt = l_ac
   LET l_ac = 1
   FOREACH sel_stbc5_cs5 
                       INTO g_stbc_d5[l_ac].stbcsite,    
                            g_stbc_d5[l_ac].ooefl003,  
                            g_stbc_d5[l_ac].stbc012 ,    
                            g_stbc_d5[l_ac].stael003,    
                            g_stbc_d5[l_ac].stjm007 ,    
                            g_stbc_d5[l_ac].remoney   ,          #160604-00009#68
                            g_stbc_d5[l_ac].stbc020 ,    
                            g_stbc_d5[l_ac].stbc019 ,    
                            g_stbc_d5[l_ac].owe     ,
                            g_stbc_d5[l_ac].owemoney,    
                            g_stbc_d5[l_ac].returnmoney
                            
                            
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
   
   CALL g_stbc_d5.deleteElement(g_stbc_d5.getLength())
   
   DISPLAY ARRAY g_stbc_d5 TO s_detail5.* ATTRIBUTES(COUNT=g_detail_cnt)  
   
      BEFORE DISPLAY 
         EXIT DISPLAY

   END DISPLAY

   FREE sel_stbc5_cs5
END FUNCTION

################################################################################
# Descriptions...: 临时表操作
# Date & Author..: 160604-00009#68 2016/07/18 By 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_tmp_mod(p_sql)
   DEFINE p_sql           STRING
   DEFINE l_sql_ins       STRING
   DEFINE l_wc            STRING
   DEFINE l_stjm011       STRING
   DEFINE l_dayrent       STRING
   DEFINE l_rentdate      STRING
   DEFINE l_owedays       STRING
   DEFINE l_stbc019       STRING
   DEFINE l_stbc020       STRING
   DEFINE l_remoney       STRING
   DEFINE l_owemoney      STRING
   DEFINE l_freeday       STRING
   
   
   #清空临时表
    TRUNCATE TABLE astq802_tmp
    TRUNCATE TABLE astq802_tmp1
    LET l_wc = ''
   #数据插入临时表
    LET l_sql_ins = " INSERT INTO astq802_tmp ",p_sql         
    PREPARE ins_tmp FROM l_sql_ins
    EXECUTE ins_tmp USING g_enterprise
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'ins astq802_tmp'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
   #费用总金额、统计截止日应收费用总金额
#    LET merge_stjm011 = " MERGE INTO astq802_tmp O",
#                        " USING ( ",
#                        "         SELECT stjesite,stje001,stjm003,SUM(stjm011) A,SUM(CASE WHEN stjm004<= '",l_enddate,"' THEN stjm011 ELSE 0 END) B",
#                        "           FROM stje_t,stjm_t ",
#                        "          WHERE stjeent = stjment AND stje001 = stjm001 ",
#                        "            AND stje004 = '5' AND ",g_where1,
#                        "            AND stjeent = ",g_enterprise,
#                        "          GROUP BY stjesite, stje001, stjm003 ",
#                        "       ) U ",
#                        "   ON (      U.stjesite = O.stjesite 
#                                  AND U.stje001 =  O.stje001
#                                  AND U.stjm003 =  O.stji002  ) ",
#                        " WHEN MATCHED THEN ",
#                        "      UPDATE SET O.stjm011 = U.A,O.remoney = U.B"
#    PREPARE merge_stjm011_pb FROM merge_stjm011
#    EXECUTE merge_stjm011_pb
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'update merge_stjm011'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF
     CALL astq802_tmp_mod_stjm011()

    #免租天数
    LET l_freeday = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stji002,SUM(COALESCE(stje013,0))+SUM(COALESCE(stjh005-stjh004+1,0)) A",
                        "           FROM stje_t
                                        LEFT JOIN stji_t ON stjient=stjeent
                                                        AND stji001=stje001
                                        LEFT JOIN stjh_t ON stjhent=stjeent
                                                        AND stjh001=stje001
                                                        AND stjh002=stji002
                                                        AND stjh008='3'
                                     AND stjeent=",g_enterprise,
                        "         GROUP BY stjesite,stje001,stji002 ",
                        "       ) U",
                        " ON (        U.stjesite = O.stjesite 
                                  AND U.stje001 =  O.stje001
                                  AND U.stji002 =  O.stji002  ) ",
                        " WHEN MATCHED THEN ",
                        " UPDATE SET O.freeday = U.A"
    PREPARE l_freeday_pb FROM l_freeday
    EXECUTE l_freeday_pb
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update freeday'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
    #日租金额 = 费用金额/（结束日期-开始日期+1-免费天数）
    LET l_dayrent = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stji002,stjm011/(stje012-stje011+1-freeday) A ",
                        "           FROM astq802_tmp ",
                        "       ) U ",
                        "   ON (      U.stjesite = O.stjesite 
                                  AND U.stje001 =  O.stje001
                                  AND U.stji002 =  O.stji002 ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET O.dayrent = U.A "
    PREPARE l_dayrent_pb FROM l_dayrent
    EXECUTE l_dayrent_pb
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update dayrent'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
   #已收金额、未收金额
    #已结算金额
    LET l_wc = cl_replace_str(g_where,'stbcsite','stbdsite')
    LET l_stbc020 = " MERGE INTO astq802_tmp O",
                          " USING ( ",
                          "         SELECT stbdsite,stbd001,stbe005,COALESCE(sum(CASE WHEN stbddocdt <='",l_enddate,"' THEN stbe016 ELSE 0 END),0) A",
                          "           FROM stbd_t,stbe_t",
                          "            WHERE stbdent = '",g_enterprise,"' AND ",l_wc,
                          "              AND stbeent=stbdent AND stbedocno=stbddocno AND stbe001='3' AND stbdstus='Y'",
                          "           GROUP BY stbdsite,stbd001,stbe005
                                   ) U",
                          "          ON (     U.stbdsite = O.stjesite
                                          AND U.stbd001 =  O.stje001 
                                          AND U.stbe005 =  O.stji002   )",
                          " WHEN MATCHED THEN ",
                          "      UPDATE SET O.stbc020 = U.A " 
    PREPARE l_stbc020_pb FROM l_stbc020
    EXECUTE l_stbc020_pb
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update stbc020'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
    #已收款金额
    LET l_wc = cl_replace_str(g_where,'stbcsite','xrdasite')
    LET l_stbc019 = " MERGE INTO astq802_tmp O",
                          " USING ( ",
                          "         SELECT xrdasite,stbc030,xrce055,COALESCE(sum(CASE WHEN xrdadocdt <='",l_enddate,"' THEN xrce109 ELSE 0 END),0) A",
                          "           FROM xrda_t,xrce_t,stbc_t",
                          "            WHERE xrdaent = '",g_enterprise,"' AND ",l_wc,
                          "              AND xrceent=xrdaent AND xrcedocno=xrdadocno AND xrce002='80' AND xrdastus='Y'",
                          "              AND stbcent=xrceent AND stbc004=xrce003 AND stbc005=xrce004 ",
                          "           GROUP BY xrdasite,stbc030,xrce055
                                   ) U",
                          "          ON (     U.xrdasite = O.stjesite
                                          AND U.stbc030 =  O.stje001 
                                          AND U.xrce055 =  O.stji002   )",
                          " WHEN MATCHED THEN ",
                          "      UPDATE SET O.stbc019 = U.A " 
    PREPARE l_stbc019_pb FROM l_stbc019
    EXECUTE l_stbc019_pb
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update stbc019'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
    LET l_stbc020 = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stji002,COALESCE((COALESCE(stbc020,0)+COALESCE(stbc019,0)),0) A,",
                        "                COALESCE((remoney-COALESCE(stbc020,0)-COALESCE(stbc019,0)),0) B",
                        "           FROM astq802_tmp",
                        "        ) U",
                        " ON (     U.stjesite = O.stjesite ",
                        "      AND U.stje001 = O.stje001 ",
                        "      AND U.stji002 = O.stji002  )",
                        " WHEN MATCHED THEN ",
                        "    UPDATE SET O.stbc020 = U.A,O.stbc019 = U.B"
    PREPARE l_stbc020_pb1 FROM l_stbc020
    EXECUTE l_stbc020_pb1
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update stbc020'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
    
#   #租金交至日
#   LET l_wc = cl_replace_str(g_where,'stbcsite','stjmsite')
#  #                              合同     费用    开始    结束    费用金额 已收 
#   LET l_sql = " SELECT stjmsite,stjm001,stjm003,stjm005,stjm006,stjm011,COALESCE(sum(A),0) seltmon,ROW_NUMBER()OVER(PARTITION BY stjmsite,stjm001,stjm003 ORDER BY stjm005) rn",
#               "   FROM (",
#               "           SELECT stjmsite,stjm001,stjm003,stjm005,stjm006,stjm_t.stjm011,COALESCE(sum(stbe016),0) A",
#               "             FROM stjm_t",
#               "                  LEFT JOIN stbc_t ON (stbcent=stjment AND stbcsite=stjmsite AND stbc030=stjm001 ",
#               "                                  AND stbc012=stjm003 AND stbc045>=stjm005 AND stbc046<=stjm006)",
#               "                  LEFT JOIN stbe_t ON (stbeent=stbcent AND stbe002=stbc004 AND stbe003=stbc005 AND stbe001='3')",
#               "                  LEFT JOIN stbd_t ON (stbdent=stbeent AND stbddocno=stbedocno AND stbdstus='Y' AND stbddocdt<='",l_enddate,"'),astq802_tmp",
#               "            WHERE stjmsite=stjesite AND stjm001=stje001 AND stjm003=stji002 ",
#               "              AND stjment='",g_enterprise,"' AND ",l_wc,
#               "            GROUP BY stjmsite,stjm001,stjm003,stjm005,stjm006,stjm_t.stjm011",
#               "            UNION ",
#               "           SELECT stjmsite,stjm001,stjm003,stjm005,stjm006,stjm_t.stjm011,COALESCE(sum(xrce109),0) A",
#               "             FROM stjm_t",
#               "                  LEFT JOIN stbc_t ON (stbcent=stjment AND stbcsite=stjmsite AND stbc030=stjm001 ",
#               "                                  AND stbc012=stjm003 AND stbc045>=stjm005 AND stbc046<=stjm006)",
#               "                  LEFT JOIN ( SELECT xrceent,xrce003,xrce004,xrce109",
#               "                                FROM xrda_t,xrce_t",
#               "                               WHERE xrdaent=xrceent AND xrdadocno=xrcedocno AND xrdastus='Y' AND xrdadocdt<='",l_enddate,"' AND xrce002 = '80')",
#               "                         ON (xrceent=stbcent AND xrce003=stbc004 AND xrce004=stbc005)",
#               "                  ,astq802_tmp",
#               "            WHERE stjmsite=stjesite AND stjm001=stje001 AND stjm003=stji002 ",
#               "              AND stjment='",g_enterprise,"' AND ",l_wc,
#               "            GROUP BY stjmsite,stjm001,stjm003,stjm005,stjm006,stjm_t.stjm011",
#               "        )",
#               "  GROUP BY stjmsite,stjm001,stjm003,stjm005,stjm006,stjm011",
#               "  HAVING (stjm011<>SUM(A) OR stjm011=0)"
#   LET l_sql = " SELECT stjmsite,stjm001,stjm003,stjm005,stjm006,stjm011,seltmon",
#               "   FROM (",l_sql,")",
#               "  WHERE rn=1"
#   PREPARE astq802_tmp_mod_pre  FROM l_sql
#   DECLARE astq802_tmp_mod_cur CURSOR FOR astq802_tmp_mod_pre
#   OPEN astq802_tmp_mod_cur
#   FOREACH astq802_tmp_mod_cur INTO l_stjmsite,l_stjm001,l_stjm003,l_stjm005,l_stjm006,l_stjm011,l_settledmoney
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = "astq802_tmp_mod_cur:" 
#         LET g_errparam.code   = SQLCA.sqlcode 
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         RETURN
#      END IF
#      IF l_stjm011 = 0 THEN LET l_stjm011=1 END IF
#      LET l_rentdate = l_settledmoney*(l_stjm006-l_stjm005+1)/l_stjm011+l_stjm005-1
#      IF l_rentdate < l_stjm005 THEN
#         LET l_rentdate = l_stjm005
#      END IF 
#      SELECT stjm011 INTO l_stjm011_sum
#        FROM astq802_tmp
#       WHERE stjesite = l_stjmsite
#         AND stje001 = l_stjm001
#         AND stji002 = l_stjm003  
#       
#      IF l_rentdate < l_enddate THEN 
#         LET l_owe = 'Y'
#      ELSE
#         LET l_owe = 'N'
#      END IF
#      
#      IF l_stjm011_sum = 0 THEN
#         LET l_owe = 'N'
#      END IF
#      
#      IF l_owe = 'Y' THEN
#         LET l_owedays = l_enddate-l_rentdate+1
#         LET l_owemoney = l_owedays*(l_stjm011/(l_stjm006-l_stjm005+1))
#      ELSE
#         LET l_owedays = 0
#         LET l_owemoney = 0
#      END IF
#           
#      UPDATE astq802_tmp 
#         SET rentdate = l_rentdate,owe = l_owe,owedays = l_owedays,owemoney = l_owemoney
#       WHERE stjesite = l_stjmsite
#         AND stje001 = l_stjm001
#         AND stji002 = l_stjm003
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = " update astq802_tmp:" 
#         LET g_errparam.code   = SQLCA.sqlcode 
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         RETURN
#      END IF
#   END FOREACH
#   CLOSE astq802_tmp_mod_cur
    CALL astq802_tmp_mod_rentdate()
#   #租金交至日 DECODE(sum(stbc019),0,stbc046,stbc045+(stbc046-stbc045)*sum(stbc019) / sum(stbc018))
#   #租期交至日期：已有交款或者结算的日期最大的那笔底稿，如果未结算金额=0，租期交至日期=这期的结束日期；
#    #否则，按以以交款+已结算的总金额跟含税金额和天数，看看交到哪一天
#    LET merge_rentdate = " MERGE INTO astq802_tmp O",
#                         " USING ( ",
#                         #SELECT stbcsite,stbc008,stbc033,stbc012,stbc002,stbc046,stbc045,stbc019,stbc020,stbc018,rentdate,MIN(rank)
#                         "          SELECT stbcsite,stbc008,stbc033,stbc012,rentdate A,MIN(rank) ",
#                         "            FROM ( ",
#                         "                   SELECT stbcsite,stbc008,stbc033,stbc012,stbc002,stbc046,stbc045,
#                                                    SUM(stbc019) stbc019,
#                                                    SUM(stbc020 + stbc022) stbc020,
#                                                    SUM(stbc018) stbc018,
#                                                    DECODE(sum(stbc019),
#                                                           0,
#                                                           stbc046,
#                                                           stbc045 + (stbc046 - stbc045) * sum(stbc019) / sum(stbc018)) rentdate,
#                                                    row_number() OVER(PARTITION BY stbcsite, stbc008, stbc033, stbc012 ORDER BY stbc002 DESC) rank
#                                               FROM stbc_t
#                                               LEFT JOIN stje_t ON stjeent = stbcent
#                                                               AND stjesite = stbcsite
#                                                               AND stje007 = stbc008
#                                                               AND stje008 = stbc033
#                                                               AND stje011 <= stbc045
#                                                               AND stje012 >= stbc046   ",
#                         "                    WHERE stje004 = '5' ",
#                         "                      AND stbcent = '",g_enterprise,"'  ",
#                         "                      AND ",g_where,
#                         "                    GROUP BY stbcsite, stbc008, stbc033, stbc012, stbc002, stbc046, stbc045 ",
#                         "                  ) ",
#                         "           WHERE stbc020 <> 0 ",
#                         "           GROUP BY stbcsite,stbc008,stbc033,stbc012,rentdate  ",
#                         "       ) U ",
#                         "   ON (      U.stbcsite = O.stjesite 
#                                   AND U.stbc008 =  O.stje007 
#                                   AND U.stbc033 =  O.stje008
#                                   AND U.stbc012 =  O.stji002   ) ",
#                         " WHEN MATCHED THEN ",
#                         "      UPDATE SET O.rentdate = U.A "
#    PREPARE merge_rentdate_pb FROM merge_rentdate
#    EXECUTE merge_rentdate_pb
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'update merge_rentdate'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF 
#   #欠租天数  ：截至日期-租期交至日期，如果小于0，表示没有欠租，欠租天数=0
#    LET merge_owedays = " MERGE INTO astq802_tmp O",
#                        " USING ( ",
#                        "         SELECT stjesite,stje001,stji002,
#                                         (CASE WHEN stje012-rentdate >= 0 THEN stje012-rentdate ELSE 0 END) A ",
#                        "           FROM astq802_tmp ",
#                        "       ) U ",
#                        "   ON (      U.stjesite = O.stjesite 
#                                  AND U.stje001 =  O.stje001 
#                                  AND U.stji002 =  O.stji002   ) ",
#                        " WHEN MATCHED THEN ",
#                        "      UPDATE SET O.owedays = U.A "
#    PREPARE merge_owedays_pb FROM merge_owedays
#    EXECUTE merge_owedays_pb
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'update merge_owedays'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF 
#   #欠租否  ：欠租天数如果小于0，表示没有欠租
#    LET merge_owe =     " MERGE INTO astq802_tmp O",
#                        " USING ( ",
#                        "         SELECT stjesite,stje001,stji002,
#                                         (CASE WHEN owedays > 0 THEN 'Y' ELSE 'N' END) A ",
#                        "           FROM astq802_tmp ",
#                        "       ) U ",
#                        "   ON (      U.stjesite = O.stjesite 
#                                  AND U.stje001 =  O.stje001 
#                                  AND U.stji002 =  O.stji002   ) ",
#                        " WHEN MATCHED THEN ",
#                        "      UPDATE SET O.owe = U.A "
#    PREPARE merge_owe_pb FROM merge_owe
#    EXECUTE merge_owe_pb
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'update merge_owe'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF 
#   #欠租金额
#    LET merge_owemoney = " MERGE INTO astq802_tmp O",
#                        " USING ( ",
#                        "         SELECT stjesite,stje001,stji002,dayrent*owedays A ",
#                        "           FROM astq802_tmp ",
#                        "       ) U ",
#                        "   ON (      U.stjesite = O.stjesite 
#                                  AND U.stje001 =  O.stje001 
#                                  AND U.stji002 =  O.stji002   ) ",
#                        " WHEN MATCHED THEN ",
#                        "      UPDATE SET O.owemoney = U.A "
#    PREPARE merge_owemoney_pb FROM merge_owemoney
#    EXECUTE merge_owemoney_pb
#    IF SQLCA.sqlcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = 'update merge_owemoney'
#       LET g_errparam.popup = TRUE
#       CALL cl_err()
#    END IF 
END FUNCTION

################################################################################
# Descriptions...: 费用总金额和统计截至日期应收费用金额
# Date & Author..: 160728-00006#4 2016/08/01 By 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_tmp_mod_stjm011()
DEFINE l_where         STRING
DEFINE l_stjm011   STRING

   LET l_where = ''
   #费用总金额、统计截止日应收费用总金额(在原有基础上加上手动录入费用单)
    LET l_where = cl_replace_str(g_where1,'stjesite','stbbsite')
    LET l_stjm011 = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stjm003,COALESCE(sum(count),0) A,COALESCE(sum(settl),0) B",
                        "           FROM (",
                        "                 SELECT stjesite,stje001,stjm003,SUM(stjm011) count,SUM(CASE WHEN stjm004<= '",l_enddate,"' THEN stjm011 ELSE 0 END) settl",
                        "                   FROM stje_t,stjm_t ",
                        "                  WHERE stjeent = stjment AND stje001 = stjm001 AND stjesite=stjmsite",
                        "                    AND NOT (stjm015 = 'Y' AND (stjm016 IS NULL OR stjm016 = ' '))",
                        "                    AND stje004 = '5' AND ",g_where1,
                        "                    AND stjeent = ",g_enterprise,
                        "                  GROUP BY stjesite, stje001, stjm003 ",
                        "                 UNION ",
                        "                 SELECT stbasite stjesite,stba010 stje001,stbb001 stjm003,SUM(stbb009) count,SUM(CASE WHEN stbb019<='",l_enddate,"' THEN stbb009 ELSE 0 END) settl",
                        "                   FROM stbb_t,stba_t,stji_t",
                        "                  WHERE stbbent = stbaent AND stbbsite=stbasite AND stbbdocno = stbadocno",
                        "                    AND stbbent = stjient AND stbb001=stji002 AND stba010=stji001",
                        "                    AND stbastus = 'Y'",
                        "                    AND stba006 <> '2' AND ",l_where,
                        "                    AND stbbent = '",g_enterprise,"'",
                        "                  GROUP BY stbasite,stba010,stbb001 )",
                        "       GROUP BY stjesite,stje001,stjm003",
                        "       ) U ",
                        "   ON (      U.stjesite = O.stjesite 
                                  AND U.stje001 =  O.stje001
                                  AND U.stjm003 =  O.stji002  ) ",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET O.stjm011 = U.A,O.remoney = U.B"
    PREPARE l_stjm011_pb FROM l_stjm011
    EXECUTE l_stjm011_pb
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update stjm011'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
    LET l_stjm011 = " MERGE INTO astq802_tmp O",
                    " USING ( ",
                    "         SELECT stjesite,stje001,stji002,COALESCE(stjm011,0) A,COALESCE(remoney,0) B",
                    "           FROM astq802_tmp",
                    "          WHERE stjm011 IS NULL",
                    "            AND remoney IS NULL ) U",
                    "   ON (      U.stjesite = O.stjesite 
                              AND U.stje001 =  O.stje001
                              AND U.stji002 =  O.stji002  ) ",
                    " WHEN MATCHED THEN ",
                    "      UPDATE SET O.stjm011 = U.A,O.remoney = U.B"
    PREPARE l_stjm011_pb1 FROM l_stjm011
    EXECUTE l_stjm011_pb1
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'update remoney'
       LET g_errparam.popup = TRUE
       CALL cl_err()
    END IF
END FUNCTION

################################################################################
# Descriptions...: 租金交至日期/欠租否/欠租天数/统计截至日期欠费金额
# Date & Author..: 160728-00006#4 2016/08/01 By 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION astq802_tmp_mod_rentdate()
DEFINE l_stdate      STRING
DEFINE l_settlmoney  STRING
DEFINE l_collmoney   STRING
DEFINE l_rentdate    STRING
DEFINE l_owe         STRING
DEFINE l_owedays     STRING
DEFINE l_owemoney    STRING
DEFINE l_where           STRING

   LET l_where=''
   #合同账单开始日期、结束日期
   LET l_where = cl_replace_str(g_where,'stbcsite','stjmsite')
   LET l_stdate = " MERGE INTO astq802_tmp O ",
                      " USING ( ",
                      "         SELECT DISTINCT stjmsite,stjm001,stjm003,stjm005 A,stjm006 B",
                      "           FROM stjm_t,",
                      "               ( SELECT stbcent,stbcsite,stbc030,stbc012,stbc045,stbc046 FROM",
                      "               ( SELECT stbcent,stbcsite,stbc030,stbc012,stbc045,stbc046,ROW_NUMBER()OVER(PARTITION BY stbcsite,stbc030,stbc012 ORDER BY sd DESC,stbc046 DESC) rn",
                      "                   FROM (SELECT stbcent,stbcsite,stbc030,stbc012,stbc045,stbc046,stbddocdt sd",
                      "                           FROM stbc_t",
                      "                                LEFT JOIN stbe_t ON (stbeent=stbcent AND stbe002=stbc004 AND stbe003=stbc005 AND stbe001='3')",
                      "                                LEFT JOIN stbd_t ON (stbdent=stbeent AND stbddocno=stbedocno AND stbdstus='Y' AND stbddocdt<='",l_enddate,"')",
                      "                          WHERE stbc003='3' AND stbcent='",g_enterprise,"' AND ",g_where,
                      "                          UNION",
                      "                         SELECT stbcent,stbcsite,stbc030,stbc012,stbc045,stbc046,xrdadocdt sd",
                      "                           FROM stbc_t",
                      "                                LEFT JOIN ( SELECT xrceent,xrce003,xrce004,xrdadocdt",
                      "                                              FROM xrda_t,xrce_t",
                      "                                             WHERE xrdaent=xrceent AND xrdadocno=xrcedocno AND xrdastus='Y' AND xrdadocdt<='",l_enddate,"' AND xrce002 = '80')",
                      "                                ON (xrceent=stbcent AND xrce003=stbc004 AND xrce004=stbc005)",
                      "                          WHERE stbc003='3' AND stbcent='",g_enterprise,"' AND ",g_where,
                      "                        )",
                      "                   WHERE sd IS NOT NULL)",
                      "                  WHERE rn=1 )",
                      "          WHERE stjment=stbcent AND stjmsite=stbcsite AND stjm001=stbc030",
                      "            AND stjm003=stbc012 AND stbc045>=stjm005 AND stbc046<=stjm006",
                      "            AND stjment='",g_enterprise,"' AND ",l_where,
                      "        ) U",
                      " ON (      U.stjmsite=O.stjesite",
                      "       AND U.stjm001=O.stje001",
                      "       AND U.stjm003=O.stji002 )",
                      " WHEN MATCHED THEN",
                      "    UPDATE SET O.stdate=U.A,O.eddate=U.B"
   PREPARE l_stdate_pb FROM l_stdate
   EXECUTE l_stdate_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update stdate'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   LET l_stdate = " MERGE INTO astq802_tmp O",
                  " USING ( ",
                  "         SELECT stjmsite,stjm001,stjm003,stjm005 A,stjm006 B",
                  "           FROM (",
                  "                  SELECT stjmsite,stjm001,stjm003,stjm005,stjm006,ROW_NUMBER()OVER(PARTITION BY stjmsite,stjm001,stjm003 ORDER BY stjm005) rn",
                  "                    FROM stjm_t,",
                  "                         ( SELECT stjesite,stje001,stji002",
                  "                             FROM astq802_tmp",
                  "                            WHERE ",g_where1,
                  "                              AND stdate IS NULL",
                  "                              AND eddate IS NULL )",
                  "                   WHERE stjmsite=stjesite AND stjm001=stje001 AND stjm003=stji002",
                  "                     AND stjment='",g_enterprise,"' AND ",l_where,
                  "                 )",
                  "          WHERE rn=1 ) U",
                  " ON (      U.stjmsite=O.stjesite",
                  "       AND U.stjm001=O.stje001",
                  "       AND U.stjm003=O.stji002 )",
                  " WHEN MATCHED THEN",
                  "    UPDATE SET O.stdate=U.A,O.eddate=U.B"
   PREPARE l_stdate_pb1 FROM l_stdate
   EXECUTE l_stdate_pb1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update eddate'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   #合同账期对应的费用金额和已结算金额
   LET l_settlmoney = " MERGE INTO astq802_tmp O",
                          " USING ( ",
                          "         SELECT stbcsite,stbc030,stbc012,COALESCE(sum(stbc018),0) A,COALESCE(sum(stbe016),0) B",
                          "           FROM stbc_t",
                          "                LEFT JOIN stbe_t ON (stbeent=stbcent AND stbe002=stbc004 AND stbe003=stbc005 AND stbe001='3')",
                          "                LEFT JOIN stbd_t ON (stbdent=stbeent AND stbddocno=stbedocno AND stbdstus='Y' AND stbddocdt<='",l_enddate,"'),astq802_tmp",
                          "          WHERE stbcsite=stjesite AND stbc030=stje001 AND stbc012=stji002",
                          "            AND stbc045>=stdate AND stbc046<=eddate",
                          "            AND stbcent='",g_enterprise,"' AND ",g_where,
                          "          GROUP BY stbcsite,stbc030,stbc012 ) U",
                          " ON (       U.stbcsite=O.stjesite",
                          "        AND U.stbc030=O.stje001",
                          "        AND U.stbc012=O.stji002 )",
                          " WHEN MATCHED THEN",
                          "    UPDATE SET O.countmoney=U.A,O.settlmoney=U.B"
   PREPARE l_settlmoney_pb FROM l_settlmoney
   EXECUTE l_settlmoney_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update settlmoney'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   #合同账期对应交款金额
   LET l_collmoney = " MERGE INTO astq802_tmp O",
                         " USING ( ",
                         "         SELECT stbcsite,stbc030,stbc012,COALESCE(sum(xrce109),0) A",
                         "           FROM stbc_t",
                         "                LEFT JOIN ( SELECT xrceent,xrce003,xrce004,xrce109",
                         "                              FROM xrda_t,xrce_t",
                         "                             WHERE xrdaent=xrceent AND xrdadocno=xrcedocno AND xrdastus='Y' AND xrdadocdt<='",l_enddate,"' AND xrce002 = '80')",
                         "                       ON (xrceent=stbcent AND xrce003=stbc004 AND xrce004=stbc005),astq802_tmp",
                         "          WHERE stbcsite=stjesite AND stbc030=stje001 AND stbc012=stji002",
                         "            AND stbc045>=stdate AND stbc046<=eddate",
                         "            AND stbcent='",g_enterprise,"' AND ",g_where,
                         "          GROUP BY stbcsite,stbc030,stbc012 ) U",
                         " ON (       U.stbcsite=O.stjesite",
                         "        AND U.stbc030=O.stje001",
                         "        AND U.stbc012=O.stji002 )",
                         " WHEN MATCHED THEN",
                         "    UPDATE SET O.collmoney=U.A"
   PREPARE l_collmoney_pb FROM l_collmoney
   EXECUTE l_collmoney_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update collmoney'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   #租金交至日
   LET l_rentdate = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stji002,COALESCE((((settlmoney+collmoney)*(eddate-stdate+1)/(CASE WHEN countmoney=0 THEN 1 ELSE countmoney END))+stdate-1),stje011) A",
                        "           FROM astq802_tmp ) U",
                        " ON (     U.stjesite=O.stjesite",
                        "      AND U.stje001=O.stje001",
                        "      AND U.stji002=O.stji002 )",
                        " WHEN MATCHED THEN",
                        "    UPDATE SET O.rentdate=U.A"
   PREPARE l_rentdate_pb FROM l_rentdate
   EXECUTE l_rentdate_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update rentdate'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   LET l_rentdate = " MERGE INTO astq802_tmp O",
                        " USING ( ",
                        "         SELECT stjesite,stje001,stji002,(CASE WHEN rentdate < stje044 THEN stje044 END) A",
                        "           FROM astq802_tmp ",
                        "          WHERE rentdate < stje044) U",
                        " ON (     U.stjesite=O.stjesite",
                        "      AND U.stje001=O.stje001",
                        "      AND U.stji002=O.stji002 )",
                        " WHEN MATCHED THEN",
                        "    UPDATE SET O.rentdate=U.A"
   PREPARE l_rentdate_pb1 FROM l_rentdate
   EXECUTE l_rentdate_pb1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update rentdate_1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   #欠租否
   LET l_owe = " MERGE INTO astq802_tmp O",
                   " USING ( ",
                   "         SELECT stjesite,stje001,stji002,(CASE WHEN rentdate>='",l_enddate,"' OR remoney=0 OR stbc019=0 THEN 'N' ELSE 'Y' END) A",
                   "           FROM astq802_tmp ) U",
                   " ON (     U.stjesite=O.stjesite",
                   "      AND U.stje001=O.stje001",
                   "      AND U.stji002=O.stji002 )",
                   " WHEN MATCHED THEN",
                   "    UPDATE SET O.owe=U.A"
   PREPARE l_owe_pb FROM l_owe
   EXECUTE l_owe_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update we'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   
   #欠租天数
   LET l_owedays = " MERGE INTO astq802_tmp O",
                       " USING ( ",
                       "         SELECT stjesite,stje001,stji002,(CASE WHEN owe='Y' THEN (to_date('",l_enddate,"','yy/mm/dd')-rentdate) ELSE 0 END) A",
                       "           FROM astq802_tmp ) U",
                       " ON (     U.stjesite=O.stjesite",
                       "      AND U.stje001=O.stje001",
                       "      AND U.stji002=O.stji002 )",
                       " WHEN MATCHED THEN",
                       "    UPDATE SET O.owedays=U.A"
   PREPARE l_owedays_pb1 FROM l_owedays
   EXECUTE l_owedays_pb1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update owedays'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   #统计截止日欠费金额
   LET l_owemoney = " MERGE INTO astq802_tmp O",
                       " USING ( ",
                       "         SELECT stjesite,stje001,stji002,(CASE WHEN owe='Y' THEN owedays*(countmoney/(eddate-stdate+1)) ELSE 0 END) A",
                       "           FROM astq802_tmp ) U",
                       " ON (     U.stjesite=O.stjesite",
                       "      AND U.stje001=O.stje001",
                       "      AND U.stji002=O.stji002 )",
                       " WHEN MATCHED THEN",
                       "    UPDATE SET O.owemoney=U.A"
   PREPARE l_owemoney_pb FROM l_owemoney
   EXECUTE l_owemoney_pb
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update owemoney'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   LET l_owemoney = " MERGE INTO astq802_tmp O",
                       " USING ( ",
                       "         SELECT stjesite,stje001,stji002,(CASE WHEN owe='Y' AND stbc020=0 THEN stbc019 END) A",
                       "           FROM astq802_tmp ",
                       "          WHERE owemoney IS NULL) U",
                       " ON (     U.stjesite=O.stjesite",
                       "      AND U.stje001=O.stje001",
                       "      AND U.stji002=O.stji002 )",
                       " WHEN MATCHED THEN",
                       "    UPDATE SET O.owemoney=U.A"
   PREPARE l_owemoney_pb1 FROM l_owemoney
   EXECUTE l_owemoney_pb1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update owemoney_1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   LET l_owemoney = " MERGE INTO astq802_tmp O",
                       " USING ( ",
                       "         SELECT stjesite,stje001,stji002,(CASE WHEN owe='Y' AND owemoney > stbc019 THEN stbc019 ELSE owemoney END) A",
                       "           FROM astq802_tmp ) U",
                       " ON (     U.stjesite=O.stjesite",
                       "      AND U.stje001=O.stje001",
                       "      AND U.stji002=O.stji002 )",
                       " WHEN MATCHED THEN",
                       "    UPDATE SET O.owemoney=U.A"
   PREPARE l_owemoney_pb2 FROM l_owemoney
   EXECUTE l_owemoney_pb2
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update owemoney_2'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
END FUNCTION

 
{</section>}
 
