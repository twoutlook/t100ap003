#該程式未解開Section, 採用最新樣板產出!
{<section id="astt803.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-04-29 15:44:39), PR版次:0009(2017-02-14 10:08:59)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000061
#+ Filename...: astt803
#+ Description: 招商租賃合約延期變更申請作業
#+ Creator....: 03247(2016-04-12 18:01:44)
#+ Modifier...: 03247 -SD/PR- 08172
 
{</section>}
 
{<section id="astt803.global" >}
#應用 i01 樣板自動產生(Version:50)
#add-point:填寫註解說明 name="global.memo"
#160318-00025#22   2016/04/20   BY 07900    校验代码重复错误讯息的修改
#160421-00013#8    2016/04/22   by 08172    面积显示规格调整
#160324-00008#14   2016/05/05   by 06189    添加审核产生astt801的逻辑
#160324-00008#16   2016/05/06   by 08172    合同开窗和检查修改
#160816-00068#1    2016/08/17   By earl     調整transaction
#160818-00017#41 2016-08-23 By 08734 删除修改未重新判断状态码
#170117-00025#1    2017/02/04   by 08172    修正BPM集成功能，將確認段拆解至SUB，增加整合用的「確認」功能應用元件 s_xxx_ws_confirm()。
#170214-00002#1    2017/02/14   by 08172    新增元件增加BPM整合所用的背景审核元件
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"  
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE TYPE type_g_stem_m RECORD
       stemsite LIKE stem_t.stemsite, 
   stemsite_desc LIKE type_t.chr80, 
   stemdocdt LIKE stem_t.stemdocdt, 
   stemdocno LIKE stem_t.stemdocno, 
   stem001 LIKE stem_t.stem001, 
   stem016 LIKE stem_t.stem016, 
   stem002 LIKE stem_t.stem002, 
   stem002_desc LIKE type_t.chr80, 
   stem003 LIKE stem_t.stem003, 
   stem003_desc LIKE type_t.chr80, 
   stem005 LIKE stem_t.stem005, 
   stem005_desc LIKE type_t.chr80, 
   stem004 LIKE stem_t.stem004, 
   stem004_desc LIKE type_t.chr80, 
   stem006 LIKE stem_t.stem006, 
   stem017 LIKE stem_t.stem017, 
   stem007 LIKE stem_t.stem007, 
   stem009 LIKE stem_t.stem009, 
   stem010 LIKE stem_t.stem010, 
   stem011 LIKE stem_t.stem011, 
   stem019 LIKE stem_t.stem019, 
   stem000 LIKE stem_t.stem000, 
   stem012 LIKE stem_t.stem012, 
   stem012_desc LIKE type_t.chr80, 
   stem013 LIKE stem_t.stem013, 
   stem013_desc LIKE type_t.chr80, 
   stem034 LIKE stem_t.stem034, 
   stemunit LIKE stem_t.stemunit, 
   stemstus LIKE stem_t.stemstus, 
   stemownid LIKE stem_t.stemownid, 
   stemownid_desc LIKE type_t.chr80, 
   stemowndp LIKE stem_t.stemowndp, 
   stemowndp_desc LIKE type_t.chr80, 
   stemcrtid LIKE stem_t.stemcrtid, 
   stemcrtid_desc LIKE type_t.chr80, 
   stemcrtdp LIKE stem_t.stemcrtdp, 
   stemcrtdp_desc LIKE type_t.chr80, 
   stemcrtdt LIKE stem_t.stemcrtdt, 
   stemmodid LIKE stem_t.stemmodid, 
   stemmodid_desc LIKE type_t.chr80, 
   stemmoddt LIKE stem_t.stemmoddt, 
   stemcnfid LIKE stem_t.stemcnfid, 
   stemcnfid_desc LIKE type_t.chr80, 
   stemcnfdt LIKE stem_t.stemcnfdt
       END RECORD
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD  #查詢方案用陣列 
         b_statepic     LIKE type_t.chr50,
            b_stemsite LIKE stem_t.stemsite,
   b_stemsite_desc LIKE type_t.chr80,
      b_stemdocdt LIKE stem_t.stemdocdt,
      b_stemdocno LIKE stem_t.stemdocno,
      b_stem001 LIKE stem_t.stem001,
      b_stem019 LIKE stem_t.stem019,
      b_stem012 LIKE stem_t.stem012,
   b_stem012_desc LIKE type_t.chr80,
      b_stem013 LIKE stem_t.stem013,
   b_stem013_desc LIKE type_t.chr80
      END RECORD 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag           LIKE type_t.num5
#end add-point
 
#模組變數(Module Variables)
DEFINE g_stem_m        type_g_stem_m  #單頭變數宣告
DEFINE g_stem_m_t      type_g_stem_m  #單頭舊值宣告(系統還原用)
DEFINE g_stem_m_o      type_g_stem_m  #單頭舊值宣告(其他用途)
DEFINE g_stem_m_mask_o type_g_stem_m  #轉換遮罩前資料
DEFINE g_stem_m_mask_n type_g_stem_m  #轉換遮罩後資料
 
   DEFINE g_stemdocno_t LIKE stem_t.stemdocno
 
   
 
   
 
DEFINE g_wc                  STRING                        #儲存查詢條件
DEFINE g_wc_t                STRING                        #備份查詢條件
DEFINE g_wc_filter           STRING                        #儲存過濾查詢條件
DEFINE g_wc_filter_t         STRING                        #備份過濾查詢條件
DEFINE g_sql                 STRING                        #資料撈取用SQL(含reference)
DEFINE g_forupd_sql          STRING                        #資料鎖定用SQL
DEFINE g_cnt                 LIKE type_t.num10             #指標/統計用變數
DEFINE g_jump                LIKE type_t.num10             #查詢指定的筆數 
DEFINE g_no_ask              LIKE type_t.num5              #是否開啟指定筆視窗 
DEFINE g_rec_b               LIKE type_t.num10             #單身筆數                         
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_pagestart           LIKE type_t.num10             #page起始筆數
DEFINE g_page_action         STRING                        #page action
DEFINE g_header_hidden       LIKE type_t.num5              #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5              #隱藏工作Panel
DEFINE g_page                STRING                        #第幾頁
DEFINE g_current_sw          BOOLEAN                       #Browser所在筆數用開關
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_state               STRING                        #確認前一個動作是否為新增/複製
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_error_show          LIKE type_t.num5              #是否顯示資料過多的錯誤訊息
DEFINE g_aw                  STRING                        #確定當下點擊的單身(modify_detail用)
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #cl_log_modified_record用(舊值)
DEFINE g_log2                STRING                        #cl_log_modified_record用(新值)
 
#快速搜尋用
DEFINE g_searchcol           STRING                        #查詢欄位代碼
DEFINE g_searchstr           STRING                        #查詢欄位字串
DEFINE g_order               STRING                        #查詢排序模式
 
#Browser用
DEFINE g_current_idx         LIKE type_t.num10             #Browser 所在筆數(當下page)
DEFINE g_current_row         LIKE type_t.num10             #Browser 所在筆數(暫存用)
DEFINE g_current_cnt         LIKE type_t.num10             #Browser 總筆數(當下page)
DEFINE g_browser_idx         LIKE type_t.num10             #Browser 所在筆數(所有資料)
DEFINE g_browser_cnt         LIKE type_t.num10             #Browser 總筆數(所有資料)
DEFINE g_row_index           LIKE type_t.num10             #階層樹狀用指標
DEFINE g_add_browse          STRING                        #新增填充用WC
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization" 

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astt803.main" >}
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
   LET g_forupd_sql = " SELECT stemsite,'',stemdocdt,stemdocno,stem001,stem016,stem002,'',stem003,'', 
       stem005,'',stem004,'',stem006,stem017,stem007,stem009,stem010,stem011,stem019,stem000,stem012, 
       '',stem013,'',stem034,stemunit,stemstus,stemownid,'',stemowndp,'',stemcrtid,'',stemcrtdp,'',stemcrtdt, 
       stemmodid,'',stemmoddt,stemcnfid,'',stemcnfdt", 
                      " FROM stem_t",
                      " WHERE stement= ? AND stemdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt803_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem016,t0.stem002, 
       t0.stem003,t0.stem005,t0.stem004,t0.stem006,t0.stem017,t0.stem007,t0.stem009,t0.stem010,t0.stem011, 
       t0.stem019,t0.stem000,t0.stem012,t0.stem013,t0.stem034,t0.stemunit,t0.stemstus,t0.stemownid,t0.stemowndp, 
       t0.stemcrtid,t0.stemcrtdp,t0.stemcrtdt,t0.stemmodid,t0.stemmoddt,t0.stemcnfid,t0.stemcnfdt,t1.ooefl003 , 
       t2.mhbel003 ,t3.pmaal004 ,t4.rtaxl003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 , 
       t10.ooag011 ,t11.ooefl003 ,t12.ooag011 ,t13.ooag011",
               " FROM stem_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stemsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t2 ON t2.mhbelent="||g_enterprise||" AND t2.mhbel001=t0.stem002 AND t2.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stem003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=t0.stem005 AND t4.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2002' AND t5.oocql002=t0.stem004 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stem012  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stem013 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stemownid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stemowndp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stemcrtid  ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.stemcrtdp AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stemmodid  ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stemcnfid  ",
 
               " WHERE t0.stement = " ||g_enterprise|| " AND t0.stemdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt803_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt803 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt803_init()   
 
      #進入選單 Menu (="N")
      CALL astt803_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt803
      
   END IF 
   
   CLOSE astt803_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   CALL s_astt801_drop_tmp()   #160324-00008#14 add by geza 20160505
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt803.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt803_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   #定義combobox狀態
      CALL cl_set_combo_scc_part('stemstus','13','N,Y,A,D,R,W,X')
 
   
   LET g_error_show = 1
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL s_asti800_set_comp_format("stem006",g_stem_m.stemsite,'2')
   CALL s_asti800_set_comp_format("stem017",g_stem_m.stemsite,'2')
   CALL s_asti800_set_comp_format("stem007",g_stem_m.stemsite,'2')
   CALL s_astt801_create_tmp() RETURNING l_success  #160324-00008#14 add by geza 20160505
   #end add-point
   
   #根據外部參數進行搜尋
   CALL astt803_default_search()
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astt803_ui_dialog() 
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit   LIKE type_t.num10       #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10       #指標變數
   DEFINE ls_wc     STRING                  #wc用
   DEFINE la_param  RECORD                  #程式串查用變數
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING                  #轉換後的json字串
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET li_exit = FALSE
   LET g_current_row = 0
   LET g_current_idx = 0
 
   #若有外部參數查詢, 則直接顯示資料(隱藏查詢方案)
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL astt803_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE li_exit = FALSE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_stem_m.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL astt803_init()
      END IF
      
      CALL lib_cl_dlg.cl_dlg_before_display()
      CALL cl_notice()
    
      #確保g_current_idx位於正常區間內
      #小於,等於0則指到第1筆
      IF g_current_idx <= 0 THEN
         LET g_current_idx = 1
      END IF
               
      IF g_main_hidden = 0 THEN
         MENU
            BEFORE MENU 
               #先填充browser資料
               CALL astt803_browser_fill(g_wc,"")
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               
               #還原為原本指定筆數
               IF g_current_row > 0 THEN
                  LET g_current_idx = g_current_row
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL astt803_fetch("")   
               END IF               
               #add-point:ui_dialog段 before menu name="ui_dialog.before_menu"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astt803_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astt803_set_act_visible()
               CALL astt803_set_act_no_visible()
               IF NOT (g_stem_m.stemdocno IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                                     " stemdocno = '", g_stem_m.stemdocno, "' "
 
                  #填到對應位置
                  CALL astt803_browser_fill(g_wc,"")
               END IF
               
            #第一筆資料
            ON ACTION first
               CALL astt803_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astt803_fetch("N")
               LET g_current_row = g_current_idx
            
            #指定筆資料
            ON ACTION jump
               CALL astt803_fetch("/")
               LET g_current_row = g_current_idx
            
            #上一筆資料
            ON ACTION previous
               CALL astt803_fetch("P")
               LET g_current_row = g_current_idx
            
            #最後筆資料
            ON ACTION last 
               CALL astt803_fetch("L")  
               LET g_current_row = g_current_idx
            
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU 
            
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU
            
            #主頁摺疊
            ON ACTION mainhidden   
               LET g_action_choice = "mainhidden"            
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
                  CALL cl_notice()
               END IF
               EXIT MENU
               
            ON ACTION worksheethidden   #瀏覽頁折疊
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               EXIT MENU
            
            #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
            ON ACTION controls   
               IF g_header_hidden THEN
                  CALL gfrm_curr.setElementHidden("vb_master",0)
                  CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
                  LET g_header_hidden = 0     #visible
               ELSE
                  CALL gfrm_curr.setElementHidden("vb_master",1)
                  CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
                  LET g_header_hidden = 1     #hidden     
               END IF
          
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  CALL astt803_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt803_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt803_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
            
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt803_modify()
               #add-point:ON ACTION modify name="menu2.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION astt803_date
            LET g_action_choice="astt803_date"
            IF cl_auth_chk_act("astt803_date") THEN
               
               #add-point:ON ACTION astt803_date name="menu2.astt803_date"
               IF g_stem_m.stemstus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "aap-00324" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  EXIT MENU
               END IF 
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt803_delete()
               #add-point:ON ACTION delete name="menu2.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt803_insert()
               #add-point:ON ACTION insert name="menu2.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu2.output"
               
               #END add-point
               &include "erp/ast/astt803_rep.4gl"
               #add-point:ON ACTION output.after name="menu2.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu2.quickprint"
               
               #END add-point
               &include "erp/ast/astt803_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu2.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt803_query()
               #add-point:ON ACTION query name="menu2.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu2.bpm_status"
            
            #END add-point
 
 
 
            
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt803_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.menu.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt803_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.menu.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt803_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.menu.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stem_m.stemdocdt)
 
 
 
            
            #主選單用ACTION
            &include "main_menu_exit_menu.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END MENU
      
      ELSE
      
         DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
           
      
            #左側瀏覽頁簽
            DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTE(COUNT=g_rec_b)
            
               BEFORE ROW
                  #回歸舊筆數位置 (回到當時異動的筆數)
                  LET g_current_idx = DIALOG.getCurrentRow("s_browse")
                  IF g_current_idx = 0 THEN
                     LET g_current_idx = 1
                  END IF
                  LET g_current_row = g_current_idx  #目前指標
                  LET g_current_sw = TRUE
                  CALL cl_show_fld_cont()     
                  
                  #當每次點任一筆資料都會需要用到               
                  CALL astt803_fetch("")
 
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
    
               
            
            END DISPLAY
 
            #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
            
            #end add-point
 
            #查詢方案用
            SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
            SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
         
            BEFORE DIALOG
               #先填充browser資料
               IF g_action_choice <> "mainhidden" THEN
                  CALL astt803_browser_fill(g_wc,"")
               END IF
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               LET g_curr_diag = ui.DIALOG.getCurrent()
               #還原為原本指定筆數
               IF g_current_row > 1 THEN
                  #當刪除最後一筆資料時可能產生錯誤, 進行額外判斷
                  IF g_current_row > g_browser.getLength() THEN
                     LET g_current_row = g_browser.getLength()
                  END IF 
                  LET g_current_idx = g_current_row
                  CALL DIALOG.setCurrentRow("s_browse",g_current_idx)
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL astt803_fetch("")   
               END IF          
               CALL cl_notice()
               
               #add-point:ui_dialog段before name="ui_dialog.b_dialog"
               
               #end add-point  
            
            AFTER DIALOG
               #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL astt803_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL astt803_set_act_visible()
               CALL astt803_set_act_no_visible()
               IF NOT (g_stem_m.stemdocno IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                                     " stemdocno = '", g_stem_m.stemdocno, "' "
 
                  #填到對應位置
                  CALL astt803_browser_fill(g_wc,"")
               END IF
         
            #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL astt803_filter()
               EXIT DIALOG
 
 
 
            
            #第一筆資料
            ON ACTION first
               CALL astt803_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL astt803_fetch("N")
               LET g_current_row = g_current_idx
         
            #指定筆資料
            ON ACTION jump
               CALL astt803_fetch("/")
               LET g_current_row = g_current_idx
         
            #上一筆資料
            ON ACTION previous
               CALL astt803_fetch("P")
               LET g_current_row = g_current_idx
          
            #最後筆資料
            ON ACTION last 
               CALL astt803_fetch("L")  
               LET g_current_row = g_current_idx
         
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
         
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
    
            #主頁摺疊
            ON ACTION mainhidden 
               LET g_action_choice = "mainhidden"                
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
                  CALL cl_notice()
               END IF
               #EXIT DIALOG
               
            ON ACTION worksheethidden   #瀏覽頁折疊
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               #EXIT DIALOG
         
            ON ACTION exporttoexcel
               LET g_action_choice="exporttoexcel"
               IF cl_auth_chk_act("exporttoexcel") THEN
                  #browser
                  CALL g_export_node.clear()
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               END IF
         
            #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
            ON ACTION controls   
               IF g_header_hidden THEN
                  CALL gfrm_curr.setElementHidden("vb_master",0)
                  CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
                  LET g_header_hidden = 0     #visible
               ELSE
                  CALL gfrm_curr.setElementHidden("vb_master",1)
                  CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
                  LET g_header_hidden = 1     #hidden     
               END IF
 
            
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  CALL astt803_browser_fill(g_wc,"F")   #browser_fill()會將notice區塊清空
                  CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               END IF
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  LET g_wc = ls_wc
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt803_browser_fill(g_wc,"F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "-100" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt803_fetch("F")
                  END IF
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()
               
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt803_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION astt803_date
            LET g_action_choice="astt803_date"
            IF cl_auth_chk_act("astt803_date") THEN
               
               #add-point:ON ACTION astt803_date name="menu.astt803_date"
               IF g_stem_m.stemstus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "aap-00324" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  EXIT DIALOG
               END IF 
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt803_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt803_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt803_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt803_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt803_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               
            END IF
 
 
 
 
            
            #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
 
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt803_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt803_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt803_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stem_m.stemdocdt)
 
 
 
 
            #主選單用ACTION
            &include "main_menu_exit_dialog.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END DIALOG 
      
      END IF
      
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      
      #(ver:50) ---start---
      IF li_exit THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      #(ver:50) --- end ---
 
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.browser_fill" >}
#應用 a29 樣板自動產生(Version:15)
#+ 瀏覽頁簽資料填充(一般單檔)
PRIVATE FUNCTION astt803_browser_fill(p_wc,ps_page_action) 
   #add-point:browser_fill段define name="browser_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc              STRING
   DEFINE ls_wc             STRING
   DEFINE ps_page_action    STRING
   DEFINE l_searchcol       STRING
   DEFINE l_sql             STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING
   #end add-point
   
   #add-point:Function前置處理  name="browser_fill.pre_function"
   CALL s_aooi500_sql_where(g_prog,'stemsite') RETURNING l_where
   #end add-point
   
   LET l_searchcol = "stemdocno"
 
   LET p_wc = p_wc.trim() #當查詢按下Q時 按下放棄 g_wc = "  " 所以要清掉空白
   IF cl_null(p_wc) THEN  #p_wc 查詢條件
      LET p_wc = " 1=1 " 
   END IF
   #add-point:browser_fill段wc控制 name="browser_fill.wc"
   
   #end add-point
 
   LET g_sql = " SELECT COUNT(1) FROM stem_t ",
               "  ",
               "  ",
               " WHERE stement = " ||g_enterprise|| " AND ", 
               p_wc CLIPPED, cl_sql_add_filter("stem_t")
                
   #add-point:browser_fill段cnt_sql name="browser_fill.cnt_sql"
   LET g_sql = g_sql," AND ",l_where," AND stem000 = '",g_prog,"' "
   #end add-point
                
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt
      FREE header_cnt_pre 
   END IF
   
   #若超過最大顯示筆數
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt 
         LET g_errparam.code   = 9035
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
   END IF
   
   LET g_error_show = 0
   
   IF ps_page_action = "F" OR
      ps_page_action = "P"  OR
      ps_page_action = "N"  OR
      ps_page_action = "L"  THEN
      LET g_page_action = ps_page_action
   END IF
   
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM
      INITIALIZE g_stem_m.* TO NULL
      CALL g_browser.clear()
      LET g_cnt = 1
      LET ls_wc = p_wc
   ELSE
      LET ls_wc = g_add_browse
      LET g_cnt = g_current_idx
   END IF
   
   LET g_sql = " SELECT t0.stemstus,t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem019,t0.stem012, 
       t0.stem013,t1.ooefl003 ,t2.ooag011 ,t3.ooefl003",
               " FROM stem_t t0 ",
               "  ",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stemsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.stem012  ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stem013 AND t3.ooefl002='"||g_dlang||"' ",
 
               " WHERE t0.stement = " ||g_enterprise|| " AND ", ls_wc, cl_sql_add_filter("stem_t")
   #add-point:browser_fill段fill_wc name="browser_fill.fill_wc"
   LET g_sql = g_sql," AND ",l_where," AND stem000 = '",g_prog,"' "
   #end add-point 
   LET g_sql = g_sql, " ORDER BY ",l_searchcol," ",g_order
   #add-point:browser_fill段before_pre name="browser_fill.before_pre"
   
   #end add-point                    
 
   #LET g_sql = cl_sql_add_tabid(g_sql,"stem_t")             #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stemsite,g_browser[g_cnt].b_stemdocdt, 
          g_browser[g_cnt].b_stemdocno,g_browser[g_cnt].b_stem001,g_browser[g_cnt].b_stem019,g_browser[g_cnt].b_stem012, 
          g_browser[g_cnt].b_stem013,g_browser[g_cnt].b_stemsite_desc,g_browser[g_cnt].b_stem012_desc, 
          g_browser[g_cnt].b_stem013_desc
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "foreach:" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         
         
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
         
         #遮罩相關處理
         CALL astt803_browser_mask()
         
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_rec THEN
            EXIT FOREACH
         END IF
      END FOREACH
 
      FREE browse_pre
 
   END IF
 
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_stemdocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt = g_browser.getLength()
   LET g_current_cnt = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   LET g_rec_b = g_browser.getLength()
   LET g_cnt = 0
   DISPLAY g_browser_cnt TO FORMONLY.b_count
   DISPLAY g_browser_cnt TO FORMONLY.h_count
   
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   
   #end add-point   
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt803.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt803_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point
   DEFINE ls_return      STRING
   DEFINE ls_result      STRING 
   DEFINE ls_wc          STRING 
   #add-point:cs段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   DEFINE l_rtax004   LIKE rtax_t.rtax004
   #end add-point
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
   
   #清空畫面&資料初始化
   CLEAR FORM
   INITIALIZE g_stem_m.* TO NULL
   INITIALIZE g_wc TO NULL
   LET g_current_row = 1
 
   LET g_qryparam.state = "c"
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #螢幕上取條件
      CONSTRUCT BY NAME g_wc ON stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003,stem005, 
          stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem019,stem000,stem012,stem013,stem034, 
          stemunit,stemstus,stemownid,stemowndp,stemcrtid,stemcrtdp,stemcrtdt,stemmodid,stemmoddt,stemcnfid, 
          stemcnfdt
      
         BEFORE CONSTRUCT                                    
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point             
      
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stemcrtdt>>----
         AFTER FIELD stemcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stemmoddt>>----
         AFTER FIELD stemmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stemcnfdt>>----
         AFTER FIELD stemcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stempstdt>>----
 
 
 
      
         #一般欄位
                  #Ctrlp:construct.c.stemsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemsite
            #add-point:ON ACTION controlp INFIELD stemsite name="construct.c.stemsite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stemsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemsite  #顯示到畫面上
            NEXT FIELD stemsite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemsite
            #add-point:BEFORE FIELD stemsite name="construct.b.stemsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemsite
            
            #add-point:AFTER FIELD stemsite name="construct.a.stemsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemdocdt
            #add-point:BEFORE FIELD stemdocdt name="construct.b.stemdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemdocdt
            
            #add-point:AFTER FIELD stemdocdt name="construct.a.stemdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemdocdt
            #add-point:ON ACTION controlp INFIELD stemdocdt name="construct.c.stemdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stemdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemdocno
            #add-point:ON ACTION controlp INFIELD stemdocno name="construct.c.stemdocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stem000 = '",g_prog,"' "
            CALL q_stemdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemdocno  #顯示到畫面上
            NEXT FIELD stemdocno                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemdocno
            #add-point:BEFORE FIELD stemdocno name="construct.b.stemdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemdocno
            
            #add-point:AFTER FIELD stemdocno name="construct.a.stemdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem001
            #add-point:ON ACTION controlp INFIELD stem001 name="construct.c.stem001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "stjesite='",g_site,"'"          #160324-00008#16 by 08172
            CALL q_stje001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem001  #顯示到畫面上
            NEXT FIELD stem001                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem001
            #add-point:BEFORE FIELD stem001 name="construct.b.stem001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem001
            
            #add-point:AFTER FIELD stem001 name="construct.a.stem001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem016
            #add-point:BEFORE FIELD stem016 name="construct.b.stem016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem016
            
            #add-point:AFTER FIELD stem016 name="construct.a.stem016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem016
            #add-point:ON ACTION controlp INFIELD stem016 name="construct.c.stem016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stem002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem002
            #add-point:ON ACTION controlp INFIELD stem002 name="construct.c.stem002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem002  #顯示到畫面上
            NEXT FIELD stem002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem002
            #add-point:BEFORE FIELD stem002 name="construct.b.stem002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem002
            
            #add-point:AFTER FIELD stem002 name="construct.a.stem002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem003
            #add-point:ON ACTION controlp INFIELD stem003 name="construct.c.stem003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem003  #顯示到畫面上
            NEXT FIELD stem003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem003
            #add-point:BEFORE FIELD stem003 name="construct.b.stem003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem003
            
            #add-point:AFTER FIELD stem003 name="construct.a.stem003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem005
            #add-point:ON ACTION controlp INFIELD stem005 name="construct.c.stem005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET l_rtax004 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')
            LET g_qryparam.where = " rtax004 = '",l_rtax004,"' "
            CALL q_rtax001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem005  #顯示到畫面上
            NEXT FIELD stem005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem005
            #add-point:BEFORE FIELD stem005 name="construct.b.stem005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem005
            
            #add-point:AFTER FIELD stem005 name="construct.a.stem005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem004
            #add-point:ON ACTION controlp INFIELD stem004 name="construct.c.stem004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2002'
            CALL q_oocq002_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem004  #顯示到畫面上
            NEXT FIELD stem004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem004
            #add-point:BEFORE FIELD stem004 name="construct.b.stem004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem004
            
            #add-point:AFTER FIELD stem004 name="construct.a.stem004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem006
            #add-point:BEFORE FIELD stem006 name="construct.b.stem006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem006
            
            #add-point:AFTER FIELD stem006 name="construct.a.stem006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem006
            #add-point:ON ACTION controlp INFIELD stem006 name="construct.c.stem006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem017
            #add-point:BEFORE FIELD stem017 name="construct.b.stem017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem017
            
            #add-point:AFTER FIELD stem017 name="construct.a.stem017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem017
            #add-point:ON ACTION controlp INFIELD stem017 name="construct.c.stem017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem007
            #add-point:BEFORE FIELD stem007 name="construct.b.stem007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem007
            
            #add-point:AFTER FIELD stem007 name="construct.a.stem007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem007
            #add-point:ON ACTION controlp INFIELD stem007 name="construct.c.stem007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem009
            #add-point:BEFORE FIELD stem009 name="construct.b.stem009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem009
            
            #add-point:AFTER FIELD stem009 name="construct.a.stem009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem009
            #add-point:ON ACTION controlp INFIELD stem009 name="construct.c.stem009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem010
            #add-point:BEFORE FIELD stem010 name="construct.b.stem010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem010
            
            #add-point:AFTER FIELD stem010 name="construct.a.stem010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem010
            #add-point:ON ACTION controlp INFIELD stem010 name="construct.c.stem010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem011
            #add-point:BEFORE FIELD stem011 name="construct.b.stem011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem011
            
            #add-point:AFTER FIELD stem011 name="construct.a.stem011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem011
            #add-point:ON ACTION controlp INFIELD stem011 name="construct.c.stem011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem019
            #add-point:BEFORE FIELD stem019 name="construct.b.stem019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem019
            
            #add-point:AFTER FIELD stem019 name="construct.a.stem019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem019
            #add-point:ON ACTION controlp INFIELD stem019 name="construct.c.stem019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem000
            #add-point:BEFORE FIELD stem000 name="construct.b.stem000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem000
            
            #add-point:AFTER FIELD stem000 name="construct.a.stem000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem000
            #add-point:ON ACTION controlp INFIELD stem000 name="construct.c.stem000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stem012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem012
            #add-point:ON ACTION controlp INFIELD stem012 name="construct.c.stem012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem012  #顯示到畫面上
            NEXT FIELD stem012                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem012
            #add-point:BEFORE FIELD stem012 name="construct.b.stem012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem012
            
            #add-point:AFTER FIELD stem012 name="construct.a.stem012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem013
            #add-point:ON ACTION controlp INFIELD stem013 name="construct.c.stem013"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem013  #顯示到畫面上
            NEXT FIELD stem013                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem013
            #add-point:BEFORE FIELD stem013 name="construct.b.stem013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem013
            
            #add-point:AFTER FIELD stem013 name="construct.a.stem013"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem034
            #add-point:BEFORE FIELD stem034 name="construct.b.stem034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem034
            
            #add-point:AFTER FIELD stem034 name="construct.a.stem034"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem034
            #add-point:ON ACTION controlp INFIELD stem034 name="construct.c.stem034"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemunit
            #add-point:BEFORE FIELD stemunit name="construct.b.stemunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemunit
            
            #add-point:AFTER FIELD stemunit name="construct.a.stemunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemunit
            #add-point:ON ACTION controlp INFIELD stemunit name="construct.c.stemunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemstus
            #add-point:BEFORE FIELD stemstus name="construct.b.stemstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemstus
            
            #add-point:AFTER FIELD stemstus name="construct.a.stemstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemstus
            #add-point:ON ACTION controlp INFIELD stemstus name="construct.c.stemstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stemownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemownid
            #add-point:ON ACTION controlp INFIELD stemownid name="construct.c.stemownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemownid  #顯示到畫面上
            NEXT FIELD stemownid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemownid
            #add-point:BEFORE FIELD stemownid name="construct.b.stemownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemownid
            
            #add-point:AFTER FIELD stemownid name="construct.a.stemownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemowndp
            #add-point:ON ACTION controlp INFIELD stemowndp name="construct.c.stemowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemowndp  #顯示到畫面上
            NEXT FIELD stemowndp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemowndp
            #add-point:BEFORE FIELD stemowndp name="construct.b.stemowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemowndp
            
            #add-point:AFTER FIELD stemowndp name="construct.a.stemowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemcrtid
            #add-point:ON ACTION controlp INFIELD stemcrtid name="construct.c.stemcrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemcrtid  #顯示到畫面上
            NEXT FIELD stemcrtid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemcrtid
            #add-point:BEFORE FIELD stemcrtid name="construct.b.stemcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemcrtid
            
            #add-point:AFTER FIELD stemcrtid name="construct.a.stemcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stemcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemcrtdp
            #add-point:ON ACTION controlp INFIELD stemcrtdp name="construct.c.stemcrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemcrtdp  #顯示到畫面上
            NEXT FIELD stemcrtdp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemcrtdp
            #add-point:BEFORE FIELD stemcrtdp name="construct.b.stemcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemcrtdp
            
            #add-point:AFTER FIELD stemcrtdp name="construct.a.stemcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemcrtdt
            #add-point:BEFORE FIELD stemcrtdt name="construct.b.stemcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stemmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemmodid
            #add-point:ON ACTION controlp INFIELD stemmodid name="construct.c.stemmodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemmodid  #顯示到畫面上
            NEXT FIELD stemmodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemmodid
            #add-point:BEFORE FIELD stemmodid name="construct.b.stemmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemmodid
            
            #add-point:AFTER FIELD stemmodid name="construct.a.stemmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemmoddt
            #add-point:BEFORE FIELD stemmoddt name="construct.b.stemmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stemcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemcnfid
            #add-point:ON ACTION controlp INFIELD stemcnfid name="construct.c.stemcnfid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stemcnfid  #顯示到畫面上
            NEXT FIELD stemcnfid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemcnfid
            #add-point:BEFORE FIELD stemcnfid name="construct.b.stemcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemcnfid
            
            #add-point:AFTER FIELD stemcnfid name="construct.a.stemcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemcnfdt
            #add-point:BEFORE FIELD stemcnfdt name="construct.b.stemcnfdt"
            
            #END add-point
 
 
 
           
      END CONSTRUCT
      
      #add-point:cs段more_construct name="cs.more_construct"
      
      #end add-point   
      
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG
  
   #add-point:cs段after_construct name="cs.after_construct"
   
   #end add-point
  
END FUNCTION
 
{</section>}
 
{<section id="astt803.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt803_filter()
   #add-point:filter段define name="filter.define_customerization"
   
   #end add-point   
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="filter.pre_function"
   
   #end add-point
   
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON stemsite,stemdocdt,stemdocno,stem001,stem019,stem012,stem013
                          FROM s_browse[1].b_stemsite,s_browse[1].b_stemdocdt,s_browse[1].b_stemdocno, 
                              s_browse[1].b_stem001,s_browse[1].b_stem019,s_browse[1].b_stem012,s_browse[1].b_stem013 
 
 
         BEFORE CONSTRUCT
               DISPLAY astt803_filter_parser('stemsite') TO s_browse[1].b_stemsite
            DISPLAY astt803_filter_parser('stemdocdt') TO s_browse[1].b_stemdocdt
            DISPLAY astt803_filter_parser('stemdocno') TO s_browse[1].b_stemdocno
            DISPLAY astt803_filter_parser('stem001') TO s_browse[1].b_stem001
            DISPLAY astt803_filter_parser('stem019') TO s_browse[1].b_stem019
            DISPLAY astt803_filter_parser('stem012') TO s_browse[1].b_stem012
            DISPLAY astt803_filter_parser('stem013') TO s_browse[1].b_stem013
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         
         #end add-point
      
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
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
 
      CALL astt803_filter_show('stemsite')
   CALL astt803_filter_show('stemdocdt')
   CALL astt803_filter_show('stemdocno')
   CALL astt803_filter_show('stem001')
   CALL astt803_filter_show('stem019')
   CALL astt803_filter_show('stem012')
   CALL astt803_filter_show('stem013')
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt803_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
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
 
{<section id="astt803.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt803_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = astt803_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt803_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc STRING
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   LET ls_wc = g_wc
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL g_browser.clear() 
 
   #browser panel折疊
   IF g_worksheet_hidden THEN
      CALL gfrm_curr.setElementHidden("worksheet_vbox",0)
      CALL gfrm_curr.setElementImage("worksheethidden","worksheethidden-24.png")
      LET g_worksheet_hidden = 0
   END IF
   
   #單頭折疊
   IF g_header_hidden THEN
      CALL gfrm_curr.setElementHidden("vb_master",0)
      CALL gfrm_curr.setElementImage("controls","headerhidden-24")
      LET g_header_hidden = 0
   END IF
 
   INITIALIZE g_stem_m.* TO NULL
   ERROR ""
 
   DISPLAY " " TO FORMONLY.b_count
   DISPLAY " " TO FORMONLY.h_count
   CALL astt803_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt803_browser_fill(g_wc,"F")
      CALL astt803_fetch("")
      RETURN
   ELSE
      LET g_current_row = 1
      LET g_current_cnt = 0
   END IF
   
   #根據條件從新抓取資料
   LET g_error_show = 1
   CALL astt803_browser_fill(g_wc,"F")   # 移到第一頁
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||")")
   
   #備份搜尋條件
   LET ls_wc = g_wc
   
   IF g_browser.getLength() = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "-100" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   ELSE
      CALL astt803_fetch("F") 
   END IF
   
   LET g_wc_filter = ""
   
END FUNCTION
 
{</section>}
 
{<section id="astt803.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt803_fetch(p_fl)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE p_fl       LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   #根據傳入的條件決定抓取的資料
   CASE p_fl
      WHEN "F" 
         LET g_current_idx = 1
      WHEN "P"
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN "N"
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN "L" 
         #LET g_current_idx = g_header_cnt        
         LET g_current_idx = g_browser.getLength()    
      WHEN "/"
         #詢問要指定的筆數
         IF (NOT g_no_ask) THEN      
            CALL cl_getmsg("fetch", g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,": " FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl"
            END PROMPT
            
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               EXIT CASE  
            END IF           
         END IF
         IF g_jump > 0 THEN
            LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE     
   END CASE
 
   #筆數顯示
   LET g_browser_idx = g_current_idx 
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
   END IF
   
   
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength() 
   END IF
   
   # 設定browse索引
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx)
   CALL cl_navigator_setting(g_browser_idx, g_browser_cnt) 
 
   #代表沒有資料, 無需做後續資料撈取之動作
   IF g_current_idx = 0 THEN
      RETURN
   END IF
 
   #根據選定的筆數給予key欄位值
   LET g_stem_m.stemdocno = g_browser[g_current_idx].b_stemdocno
 
                       
   #讀取單頭所有欄位資料
   EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
       g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
       g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
       g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc 
 
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt803_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt803_set_act_visible()
   CALL astt803_set_act_no_visible()
 
   #add-point:fetch段action控制 name="fetch.action_control"
   #170117-00025#1 -s by 08172
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("modify_detail", FALSE)
   ELSE
      CALL cl_set_act_visible("modify_detail",TRUE)
   END IF
   CALL astt803_set_act_visible()   
   CALL astt803_set_act_no_visible() 
   #170117-00025#1 -e by 08172
   #end add-point  
   
   
   
   #保存單頭舊值
   LET g_stem_m_t.* = g_stem_m.*
   LET g_stem_m_o.* = g_stem_m.*
   
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
   
   #重新顯示
   CALL astt803_show()
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt803_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE r_insert      LIKE type_t.num5
   DEFINE l_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   CLEAR FORM #清畫面欄位內容
   INITIALIZE g_stem_m.* TO NULL             #DEFAULT 設定
   LET g_stemdocno_t = NULL
 
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   
   WHILE TRUE
      
      #公用欄位給值
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stem_m.stemownid = g_user
      LET g_stem_m.stemowndp = g_dept
      LET g_stem_m.stemcrtid = g_user
      LET g_stem_m.stemcrtdp = g_dept 
      LET g_stem_m.stemcrtdt = cl_get_current()
      LET g_stem_m.stemmodid = g_user
      LET g_stem_m.stemmoddt = cl_get_current()
      LET g_stem_m.stemstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
 
      #add-point:單頭預設值 name="insert.default"
      LET g_site_flag = FALSE
      LET g_stem_m.stem000 = g_prog
      #组织
      CALL s_aooi500_default(g_prog,'stemsite',g_stem_m.stemsite) RETURNING r_insert,g_stem_m.stemsite
      IF NOT r_insert THEN
         RETURN
      END IF
      CALL s_desc_get_department_desc(g_stem_m.stemsite) RETURNING g_stem_m.stemsite_desc
      DISPLAY BY NAME g_stem_m.stemsite_desc
      LET g_stem_m.stemunit = g_stem_m.stemsite
      #日期
      LET g_stem_m.stemdocdt = g_today
      #單別
      CALL s_arti200_get_def_doc_type(g_stem_m.stemsite,g_prog,'1')
         RETURNING l_success,l_doctype
      LET g_stem_m.stemdocno = l_doctype
      #人员
      LET g_stem_m.stem012 = g_user
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stem_m.stem012
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stem_m.stem012_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stem_m.stem012_desc
      #部门
      LET g_stem_m.stem013 = g_dept
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stem_m.stem013
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stem_m.stem013_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stem_m.stem013_desc
      #end add-point   
     
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stem_m.stemstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
     
      #資料輸入
      CALL astt803_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         #取消
         LET INT_FLAG = 0
         DISPLAY g_current_cnt TO FORMONLY.h_count     #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index     #當下筆數
         INITIALIZE g_stem_m.* TO NULL
         CALL astt803_show()
         CALL s_transaction_end('N','0')
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN
      END IF
 
      LET g_rec_b = 0
      EXIT WHILE
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt803_set_act_visible()
   CALL astt803_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt803_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
 
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
       g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
       g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
       g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc 
 
   
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt803_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019, 
       g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013,g_stem_m.stem013_desc, 
       g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemownid_desc, 
       g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc,g_stem_m.stemmoddt, 
       g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
 
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
 
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
 
   #功能已完成,通報訊息中心
   CALL astt803_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt803.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt803_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="modify.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF 
 
   ERROR ""
  
   #備份key值
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   CALL s_transaction_begin()
   
   #先lock資料
   OPEN astt803_cl USING g_enterprise,g_stem_m.stemdocno
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt803_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
       g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
       g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
       g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc 
 
 
   #檢查是否允許此動作
   IF NOT astt803_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt803_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   
 
   #顯示資料
   CALL astt803_show()
   
   WHILE TRUE
      LET g_stem_m.stemdocno = g_stemdocno_t
 
      
      #寫入修改者/修改日期資訊
      LET g_stem_m.stemmodid = g_user 
LET g_stem_m.stemmoddt = cl_get_current()
LET g_stem_m.stemmodid_desc = cl_get_username(g_stem_m.stemmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #170117-00025#1 -s by 08172
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stem_m.stemstus MATCHES "[DR]" THEN 
         LET g_stem_m.stemstus = "N"
      END IF
      #170117-00025#1 -e by 08172
      #end add-point
 
      #資料輸入
      CALL astt803_input("u")     
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         LET g_stem_m.* = g_stem_m_t.*
         CALL astt803_show()
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         EXIT WHILE
      END IF
 
      #若有modid跟moddt則進行update
      UPDATE stem_t SET (stemmodid,stemmoddt) = (g_stem_m.stemmodid,g_stem_m.stemmoddt)
       WHERE stement = g_enterprise AND stemdocno = g_stemdocno_t
 
 
      EXIT WHILE
      
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt803_set_act_visible()
   CALL astt803_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
   #填到對應位置
   CALL astt803_browser_fill(g_wc,"")
 
   CLOSE astt803_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt803_msgcentre_notify('modify')
   
   LET g_worksheet_hidden = 0
   
END FUNCTION   
 
{</section>}
 
{<section id="astt803.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt803_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point
   DEFINE p_cmd           LIKE type_t.chr1
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_n             LIKE type_t.num10       #檢查重複用  
   DEFINE l_cnt           LIKE type_t.num10       #檢查重複用  
   DEFINE l_lock_sw       LIKE type_t.chr1        #單身鎖住否  
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_i             LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num10
   DEFINE ls_return       STRING
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE l_success             LIKE type_t.num5
   DEFINE l_errno               LIKE type_t.chr10
   DEFINE l_ooef004             LIKE ooef_t.ooef004
   DEFINE l_stje043             LIKE stje_t.stje043
   DEFINE  l_flag               LIKE type_t.num5
   #end add-point
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #切換至輸入畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019, 
       g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013,g_stem_m.stem013_desc, 
       g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemownid_desc, 
       g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc,g_stem_m.stemmoddt, 
       g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
   
   CALL cl_set_head_visible("","YES")  
   
   #a-新增,r-複製,u-修改
   IF p_cmd = 'r' THEN
      #此段落的r動作等同於a
      LET p_cmd = 'a'
   END IF
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   LET g_qryparam.state = "i"
   
   #控制key欄位可否輸入
   CALL astt803_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt803_set_no_entry(p_cmd)
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #單頭段
      INPUT BY NAME g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016, 
          g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017, 
          g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000, 
          g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            #其他table資料備份(確定是否更改用)
            
            #add-point:input開始前 name="input.before.input"
            
            #end add-point
   
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemsite
            
            #add-point:AFTER FIELD stemsite name="input.a.stemsite"
            IF NOT cl_null(g_stem_m.stemsite) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stem_m.stemsite != g_stem_m_t.stemsite OR g_stem_m_t.stemsite IS NULL )) THEN
                  CALL s_aooi500_chk(g_prog,'stemsite',g_stem_m.stemsite,g_stem_m.stemsite) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()

                     LET g_stem_m.stemsite = g_stem_m_t.stemsite
                     CALL s_desc_get_department_desc(g_stem_m.stemsite) RETURNING g_stem_m.stemsite_desc
                     DISPLAY BY NAME g_stem_m.stemsite_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stemsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stemsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stemsite_desc

            LET g_site_flag = TRUE
            CALL astt803_set_entry(p_cmd)
            CALL astt803_set_no_entry(p_cmd)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemsite
            #add-point:BEFORE FIELD stemsite name="input.b.stemsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stemsite
            #add-point:ON CHANGE stemsite name="input.g.stemsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemdocdt
            #add-point:BEFORE FIELD stemdocdt name="input.b.stemdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemdocdt
            
            #add-point:AFTER FIELD stemdocdt name="input.a.stemdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stemdocdt
            #add-point:ON CHANGE stemdocdt name="input.g.stemdocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemdocno
            
            #add-point:AFTER FIELD stemdocno name="input.a.stemdocno"
            IF NOT cl_null(g_stem_m.stemdocno) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               CALL s_aooi100_sel_ooef004(g_stem_m.stemsite)
                   RETURNING l_success,l_ooef004
               LET g_chkparam.arg1 = l_ooef004
               LET g_chkparam.arg2 = g_stem_m.stemdocno
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooba002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_stem_m.stemdocno = g_stem_m_t.stemdocno
                  DISPLAY BY NAME g_stem_m.stemdocno
                  NEXT FIELD CURRENT
               END IF
 

#               CALL s_aooi200_gen_docno(g_stem_m.stemsite,g_stem_m.stemdocno,g_stem_m.stemdocdt,g_prog) RETURNING l_flag,g_stem_m.stemdocno
#               IF NOT l_flag THEN
#                  NEXT FIELD stemdocno
#               END IF
            END IF 

            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_stem_m.stemdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stem_m.stemdocno != g_stemdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stem_t WHERE "||"stement = '" ||g_enterprise|| "' AND "||"stemdocno = '"||g_stem_m.stemdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemdocno
            #add-point:BEFORE FIELD stemdocno name="input.b.stemdocno"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stemdocno
            #add-point:ON CHANGE stemdocno name="input.g.stemdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem001
            #add-point:BEFORE FIELD stem001 name="input.b.stem001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem001
            
            #add-point:AFTER FIELD stem001 name="input.a.stem001"
            IF NOT cl_null(g_stem_m.stem001) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stem_m.stem001
               LET g_chkparam.arg2 = g_stem_m.stemsite          #160324-00008#16 by 08172
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_stje001") THEN
                  #檢查成功時後續處理
                  
               ELSE
                  #檢查失敗時後續處理
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD CURRENT
               END IF
#               LET l_n = 0
#               SELECT COUNT(*) INTO l_n FROM stje_t
#                WHERE stjeent = g_enterprise
#                  AND stje001 = g_stem_m.stem001
#               IF l_n < 1 THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.extend = ''
#                  LET g_errparam.code   = "ast-00633"
#                  LET g_errparam.popup  = TRUE
#                  CALL cl_err()
#                  LET g_stem_m.stem001 = g_stem_m_t.stem001
#                  DISPLAY BY NAME g_stem_m.stem001
#                  NEXT FIELD stem001
#               END IF
#               #检查合同状态
#               LET l_n = 0
#               SELECT COUNT(*) INTO l_n FROM stje_t
#                WHERE stjeent = g_enterprise
#                  AND stje001 = g_stem_m.stem001
#                  AND stjesite = g_stem_m.stemsite       #160324-00008#16 by 08172
#                  AND stje005 IN ('2','3','4','5')
#               IF l_n < 1 THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.extend = ''
#                  LET g_errparam.code   = "ast-00634"
#                  LET g_errparam.popup  = TRUE
#                  CALL cl_err()
#                  LET g_stem_m.stem001 = g_stem_m_t.stem001
#                  DISPLAY BY NAME g_stem_m.stem001
#                  NEXT FIELD stem001
#               END IF
               
               #检查是否存在未审核资料
               IF NOT s_astt805_chk_stem(g_stem_m.stemdocno,g_stem_m.stem001) THEN
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD stem001
               END IF
 
               #合同带值
               CALL astt803_stem001_ref()
               #合同变更，清空延期日期
               IF g_stem_m.stem001 <> g_stem_m_o.stem001 OR cl_null(g_stem_m_o.stem001) THEN
                  LET g_stem_m.stem019 = NULL
                  DISPLAY BY NAME g_stem_m.stem019
               END IF
            END IF 

            LET g_stem_m_o.stem001 = g_stem_m.stem001
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem001
            #add-point:ON CHANGE stem001 name="input.g.stem001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem016
            #add-point:BEFORE FIELD stem016 name="input.b.stem016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem016
            
            #add-point:AFTER FIELD stem016 name="input.a.stem016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem016
            #add-point:ON CHANGE stem016 name="input.g.stem016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem002
            
            #add-point:AFTER FIELD stem002 name="input.a.stem002"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem002
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem002
            #add-point:BEFORE FIELD stem002 name="input.b.stem002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem002
            #add-point:ON CHANGE stem002 name="input.g.stem002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem003
            
            #add-point:AFTER FIELD stem003 name="input.a.stem003"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem003
            #add-point:BEFORE FIELD stem003 name="input.b.stem003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem003
            #add-point:ON CHANGE stem003 name="input.g.stem003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem005
            
            #add-point:AFTER FIELD stem005 name="input.a.stem005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem005
            CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem005
            #add-point:BEFORE FIELD stem005 name="input.b.stem005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem005
            #add-point:ON CHANGE stem005 name="input.g.stem005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem004
            
            #add-point:AFTER FIELD stem004 name="input.a.stem004"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem004
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2002' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem004
            #add-point:BEFORE FIELD stem004 name="input.b.stem004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem004
            #add-point:ON CHANGE stem004 name="input.g.stem004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem006
            #add-point:BEFORE FIELD stem006 name="input.b.stem006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem006
            
            #add-point:AFTER FIELD stem006 name="input.a.stem006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem006
            #add-point:ON CHANGE stem006 name="input.g.stem006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem017
            #add-point:BEFORE FIELD stem017 name="input.b.stem017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem017
            
            #add-point:AFTER FIELD stem017 name="input.a.stem017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem017
            #add-point:ON CHANGE stem017 name="input.g.stem017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem007
            #add-point:BEFORE FIELD stem007 name="input.b.stem007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem007
            
            #add-point:AFTER FIELD stem007 name="input.a.stem007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem007
            #add-point:ON CHANGE stem007 name="input.g.stem007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem009
            #add-point:BEFORE FIELD stem009 name="input.b.stem009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem009
            
            #add-point:AFTER FIELD stem009 name="input.a.stem009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem009
            #add-point:ON CHANGE stem009 name="input.g.stem009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem010
            #add-point:BEFORE FIELD stem010 name="input.b.stem010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem010
            
            #add-point:AFTER FIELD stem010 name="input.a.stem010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem010
            #add-point:ON CHANGE stem010 name="input.g.stem010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem011
            #add-point:BEFORE FIELD stem011 name="input.b.stem011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem011
            
            #add-point:AFTER FIELD stem011 name="input.a.stem011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem011
            #add-point:ON CHANGE stem011 name="input.g.stem011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem019
            #add-point:BEFORE FIELD stem019 name="input.b.stem019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem019
            
            #add-point:AFTER FIELD stem019 name="input.a.stem019"
            IF NOT cl_null(g_stem_m.stem019) THEN
               IF NOT cl_null(g_stem_m.stem010) THEN
                  IF g_stem_m.stem019 <= g_stem_m.stem010 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = "ast-00631"
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     NEXT FIELD stem019
                  END IF
               END IF
               #合同原延期日期
               LET l_stje043 = ''
               SELECT stje043 INTO l_stje043
                 FROM stje_t
                WHERE stjeent = g_enterprise
                  AND stje001 = g_stem_m.stem001
               IF NOT cl_null(l_stje043) THEN
                  IF g_stem_m.stem019 <= l_stje043 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = "ast-00632"
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     NEXT FIELD stem019
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem019
            #add-point:ON CHANGE stem019 name="input.g.stem019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem000
            #add-point:BEFORE FIELD stem000 name="input.b.stem000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem000
            
            #add-point:AFTER FIELD stem000 name="input.a.stem000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem000
            #add-point:ON CHANGE stem000 name="input.g.stem000"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem012
            
            #add-point:AFTER FIELD stem012 name="input.a.stem012"
            IF NOT cl_null(g_stem_m.stem012) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stem_m.stem012

               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               #160318-00025#22  by 07900 --add-end     
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_stem_m.stem012 = g_stem_m_t.stem012
                  LET g_stem_m.stem012_desc = ''
                  DISPLAY BY NAME g_stem_m.stem012,g_stem_m.stem012_desc
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem012
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stem_m.stem012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem012_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem012
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag003 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stem_m.stem013 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem013
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem013_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem012
            #add-point:BEFORE FIELD stem012 name="input.b.stem012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem012
            #add-point:ON CHANGE stem012 name="input.g.stem012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem013
            
            #add-point:AFTER FIELD stem013 name="input.a.stem013"
            IF NOT cl_null(g_stem_m.stem013) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stem_m.stem013
               LET g_chkparam.arg2 = g_today
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
               #160318-00025#22  by 07900 --add-end    
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooeg001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_stem_m.stem013 = g_stem_m_t.stem013
                  LET g_stem_m.stem013_desc = ''
                  DISPLAY BY NAME g_stem_m.stem013,g_stem_m.stem013_desc
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem013
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem013_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem013_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem013
            #add-point:BEFORE FIELD stem013 name="input.b.stem013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem013
            #add-point:ON CHANGE stem013 name="input.g.stem013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem034
            #add-point:BEFORE FIELD stem034 name="input.b.stem034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem034
            
            #add-point:AFTER FIELD stem034 name="input.a.stem034"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem034
            #add-point:ON CHANGE stem034 name="input.g.stem034"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemunit
            #add-point:BEFORE FIELD stemunit name="input.b.stemunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemunit
            
            #add-point:AFTER FIELD stemunit name="input.a.stemunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stemunit
            #add-point:ON CHANGE stemunit name="input.g.stemunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stemstus
            #add-point:BEFORE FIELD stemstus name="input.b.stemstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stemstus
            
            #add-point:AFTER FIELD stemstus name="input.a.stemstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stemstus
            #add-point:ON CHANGE stemstus name="input.g.stemstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stemsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemsite
            #add-point:ON ACTION controlp INFIELD stemsite name="input.c.stemsite"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stemsite             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stemsite',g_stem_m.stemsite,'i')
 
            CALL q_ooef001_24()                                #呼叫開窗
 
            LET g_stem_m.stemsite = g_qryparam.return1              

            DISPLAY g_stem_m.stemsite TO stemsite              #

            NEXT FIELD stemsite                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stemdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemdocdt
            #add-point:ON ACTION controlp INFIELD stemdocdt name="input.c.stemdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stemdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemdocno
            #add-point:ON ACTION controlp INFIELD stemdocno name="input.c.stemdocno"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stemdocno             #給予default值

            #給予arg
            CALL s_aooi100_sel_ooef004(g_stem_m.stemsite)
                RETURNING l_success,l_ooef004
            LET g_qryparam.arg1 = l_ooef004
            LET g_qryparam.arg2 = g_prog
 
            CALL q_ooba002_1()                                #呼叫開窗
 
            LET g_stem_m.stemdocno = g_qryparam.return1              

            DISPLAY g_stem_m.stemdocno TO stemdocno              #

            NEXT FIELD stemdocno                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stem001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem001
            #add-point:ON ACTION controlp INFIELD stem001 name="input.c.stem001"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stem001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s
            LET g_qryparam.where = " stjesite = '",g_stem_m.stemsite,"' AND stje005 IN ('2','3','4','5') "             #160324-00008#16 by 08172
 
            CALL q_stje001()                                #呼叫開窗
 
            LET g_stem_m.stem001 = g_qryparam.return1              

            DISPLAY g_stem_m.stem001 TO stem001              #

            NEXT FIELD stem001                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stem016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem016
            #add-point:ON ACTION controlp INFIELD stem016 name="input.c.stem016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem002
            #add-point:ON ACTION controlp INFIELD stem002 name="input.c.stem002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem003
            #add-point:ON ACTION controlp INFIELD stem003 name="input.c.stem003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem005
            #add-point:ON ACTION controlp INFIELD stem005 name="input.c.stem005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem004
            #add-point:ON ACTION controlp INFIELD stem004 name="input.c.stem004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem006
            #add-point:ON ACTION controlp INFIELD stem006 name="input.c.stem006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem017
            #add-point:ON ACTION controlp INFIELD stem017 name="input.c.stem017"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem007
            #add-point:ON ACTION controlp INFIELD stem007 name="input.c.stem007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem009
            #add-point:ON ACTION controlp INFIELD stem009 name="input.c.stem009"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem010
            #add-point:ON ACTION controlp INFIELD stem010 name="input.c.stem010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem011
            #add-point:ON ACTION controlp INFIELD stem011 name="input.c.stem011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem019
            #add-point:ON ACTION controlp INFIELD stem019 name="input.c.stem019"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem000
            #add-point:ON ACTION controlp INFIELD stem000 name="input.c.stem000"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem012
            #add-point:ON ACTION controlp INFIELD stem012 name="input.c.stem012"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stem012             #給予default值
            LET g_qryparam.default2 = g_stem_m.stem012_desc #全名
            LET g_qryparam.default3 = g_stem_m.stem013 #員工編號
            LET g_qryparam.default4 = g_stem_m.stem013_desc #歸屬部門
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001_6()                                #呼叫開窗
 
            LET g_stem_m.stem012 = g_qryparam.return1              
            LET g_stem_m.stem012_desc = g_qryparam.return2 
            LET g_stem_m.stem013 = g_qryparam.return3 
            LET g_stem_m.stem013_desc = g_qryparam.return4 
            DISPLAY g_stem_m.stem012 TO stem012              #
            DISPLAY g_stem_m.stem012_desc TO stem012_desc #全名
            DISPLAY g_stem_m.stem013 TO stem013 #員工編號
            DISPLAY g_stem_m.stem013_desc TO stem013_desc #歸屬部門
            NEXT FIELD stem012                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stem013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem013
            #add-point:ON ACTION controlp INFIELD stem013 name="input.c.stem013"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stem013             #給予default值
            LET g_qryparam.default2 = g_stem_m.stem013_desc #部門編號
            #給予arg
            LET g_qryparam.arg1 = g_today

 
            CALL q_ooeg001()                                #呼叫開窗
 
            LET g_stem_m.stem013 = g_qryparam.return1              
            LET g_stem_m.stem013_desc = g_qryparam.return2 
            DISPLAY g_stem_m.stem013 TO stem013              #
            DISPLAY g_stem_m.stem013_desc TO stem013_desc #部門編號
            NEXT FIELD stem013                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stem034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem034
            #add-point:ON ACTION controlp INFIELD stem034 name="input.c.stem034"
            
            #END add-point
 
 
         #Ctrlp:input.c.stemunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemunit
            #add-point:ON ACTION controlp INFIELD stemunit name="input.c.stemunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stemstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemstus
            #add-point:ON ACTION controlp INFIELD stemstus name="input.c.stemstus"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #若點選cancel則離開dialog
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
            
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
  
            IF p_cmd <> "u" THEN
               #當p_cmd不為u代表為新增/複製
               LET l_count = 1  
 
               #確定新增的資料不存在(不重複)
               SELECT COUNT(1) INTO l_count FROM stem_t
                WHERE stement = g_enterprise AND stemdocno = g_stem_m.stemdocno
 
               IF l_count = 0 THEN
               
                  #add-point:單頭新增前 name="input.head.b_insert"
                  CALL s_aooi200_gen_docno(g_stem_m.stemsite,g_stem_m.stemdocno,g_stem_m.stemdocdt,g_prog) RETURNING l_flag,g_stem_m.stemdocno
                  IF NOT l_flag THEN
                     NEXT FIELD stemdocno
                  END IF
                  #end add-point
               
                  #將新增的單頭資料寫入資料庫
                  INSERT INTO stem_t (stement,stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003, 
                      stem005,stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem019,stem000, 
                      stem012,stem013,stem034,stemunit,stemstus,stemownid,stemowndp,stemcrtid,stemcrtdp, 
                      stemcrtdt,stemmodid,stemmoddt,stemcnfid,stemcnfdt)
                  VALUES (g_enterprise,g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
                      g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004, 
                      g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
                      g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013, 
                      g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp, 
                      g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt, 
                      g_stem_m.stemcnfid,g_stem_m.stemcnfdt) 
                  
                  #add-point:單頭新增中 name="input.head.m_insert"
                  
                  #end add-point
                  
                  #若寫入錯誤則提示錯誤訊息並返回輸入頁面
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stem_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  END IF
                  
                  
                  
                  #資料多語言用-增/改
                  
                  
                  #add-point:單頭新增後 name="input.head.a_insert"
                  
                  #end add-point
                  
                  CALL s_transaction_end('Y','0')
               ELSE
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_stem_m.stemdocno
                  LET g_errparam.code   = "std-00006" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF 
            ELSE
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt803_stem_t_mask_restore('restore_mask_o')
               
               UPDATE stem_t SET (stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003,stem005, 
                   stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem019,stem000,stem012,stem013, 
                   stem034,stemunit,stemstus,stemownid,stemowndp,stemcrtid,stemcrtdp,stemcrtdt,stemmodid, 
                   stemmoddt,stemcnfid,stemcnfdt) = (g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno, 
                   g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
                   g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009, 
                   g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012, 
                   g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid, 
                   g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
                   g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt)
                WHERE stement = g_enterprise AND stemdocno = g_stemdocno_t #
 
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stem_t" 
                     LET g_errparam.code   = "std-00009" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stem_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  OTHERWISE
                     
                     #資料多語言用-增/改
                     
                     
                     #將遮罩欄位進行遮蔽
                     CALL astt803_stem_t_mask_restore('restore_mask_n')
                     
                     #add-point:單頭修改後 name="input.head.a_update"
                     
                     #end add-point
                     #修改歷程記錄(單頭修改)
                     LET g_log1 = util.JSON.stringify(g_stem_m_t)
                     LET g_log2 = util.JSON.stringify(g_stem_m)
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                        CALL s_transaction_end('N','0')
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
               END CASE
               
            END IF
           #controlp
      END INPUT
      
      #add-point:input段more input  name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG
         #CALL cl_err_collect_init()
         #add-point:input段before_dialog  name="input.before_dialog"
         
         #end add-point
          
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name, g_fld_name, g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         ACCEPT DIALOG
         
      #放棄輸入
      ON ACTION cancel
         LET g_action_choice=""
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      #在dialog 右上角 (X)
      ON ACTION close 
         LET INT_FLAG = TRUE 
         EXIT DIALOG
    
      #toolbar 離開
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt803_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point
   DEFINE l_newno     LIKE stem_t.stemdocno 
   DEFINE l_oldno     LIKE stem_t.stemdocno 
 
   DEFINE l_master    RECORD LIKE stem_t.* #此變數樣板目前無使用
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE r_insert      LIKE type_t.num5
   DEFINE l_doctype     LIKE rtai_t.rtai004
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #先確定key值無遺漏
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #備份key值
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   #清空key值
   LET g_stem_m.stemdocno = ""
 
    
   CALL astt803_set_entry("a")
   CALL astt803_set_no_entry("a")
   
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stem_m.stemownid = g_user
      LET g_stem_m.stemowndp = g_dept
      LET g_stem_m.stemcrtid = g_user
      LET g_stem_m.stemcrtdp = g_dept 
      LET g_stem_m.stemcrtdt = cl_get_current()
      LET g_stem_m.stemmodid = g_user
      LET g_stem_m.stemmoddt = cl_get_current()
      LET g_stem_m.stemstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_site_flag = FALSE
   LET g_stem_m.stem000 = g_prog
   #组织
   CALL s_aooi500_default(g_prog,'stemsite',g_stem_m.stemsite) RETURNING r_insert,g_stem_m.stemsite
   IF NOT r_insert THEN
      RETURN
   END IF
   CALL s_desc_get_department_desc(g_stem_m.stemsite) RETURNING g_stem_m.stemsite_desc
   DISPLAY BY NAME g_stem_m.stemsite_desc
   LET g_stem_m.stemunit = g_stem_m.stemsite
   #日期
   LET g_stem_m.stemdocdt = g_today
   #單別
   CALL s_arti200_get_def_doc_type(g_stem_m.stemsite,g_prog,'1')
      RETURNING l_success,l_doctype
   LET g_stem_m.stemdocno = l_doctype
   #人员
   LET g_stem_m.stem012 = g_user
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem012
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stem_m.stem012_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem012_desc
   #部门
   LET g_stem_m.stem013 = g_dept
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem013
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stem_m.stem013_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem013_desc
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stem_m.stemstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   #資料輸入
   CALL astt803_input("r")
   
   IF INT_FLAG THEN
      #取消
      INITIALIZE g_stem_m.* TO NULL
      CALL astt803_show()
      CALL s_transaction_end('N','0')
      LET INT_FLAG = 0
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = 9001 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   CALL s_transaction_begin()
   
   #add-point:單頭複製前 name="reproduce.head.b_insert"
   
   #end add-point
   
   #add-point:單頭複製中 name="reproduce.head.m_insert"
   
   #end add-point
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "stem_t:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單頭複製後 name="reproduce.head.a_insert"
   
   #end add-point
   
   CALL s_transaction_end('Y','0')
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL astt803_set_act_visible()
   CALL astt803_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt803_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
              
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
              
   #功能已完成,通報訊息中心
   CALL astt803_msgcentre_notify('reproduce')
                 
END FUNCTION
 
{</section>}
 
{<section id="astt803.show" >}
#+ 資料顯示 
PRIVATE FUNCTION astt803_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:show段Function前置處理  name="show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt803_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   ##抓取合同版本
   #SELECT stje002 INTO g_stem_m.stje002
   #  FROM stje_t
   # WHERE stjeent = g_enterprise
   #   AND stje001 = g_stem_m.stem001
   #end add-point
 
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019, 
       g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013,g_stem_m.stem013_desc, 
       g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemownid_desc, 
       g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc,g_stem_m.stemmoddt, 
       g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
   
   #儲存PK
   LET l_ac = g_current_idx
   CALL astt803_set_pk_array()
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stem_m.stemstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
 
   #顯示有特殊格式設定的欄位或說明
   CALL cl_show_fld_cont()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.delete" >}
#+ 資料刪除 
PRIVATE FUNCTION astt803_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
    
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   
 
   OPEN astt803_cl USING g_enterprise,g_stem_m.stemdocno
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt803_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
       g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
       g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
       g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT astt803_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt803_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #將最新資料顯示到畫面上
   CALL astt803_show()
   
   IF cl_ask_delete() THEN
 
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point
 
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt803_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
 
      DELETE FROM stem_t 
       WHERE stement = g_enterprise AND stemdocno = g_stem_m.stemdocno 
 
 
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stem_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
  
      
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_stem_m.stemdocno,g_stem_m.stemdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
      
       
 
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stem_m)   #(ver:49)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:49)
         CLOSE astt803_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      CLEAR FORM
      CALL astt803_ui_browser_refresh()
      
      #確保畫面上保有資料
      IF g_browser_cnt > 0 THEN
         #CALL astt803_browser_fill(g_wc,"")
         CALL astt803_fetch("P")
      ELSE
         CLEAR FORM
      END IF
      CALL s_transaction_end('Y','0')
   ELSE    
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt803_cl
 
   #功能已完成,通報訊息中心
   CALL astt803_msgcentre_notify('delete')
 
   #add-point:單頭刪除完成後 name="delete.a_delete"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt803_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_stemdocno = g_stem_m.stemdocno
 
         THEN
         CALL g_browser.deleteElement(l_i)
       END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count     #page count
   DISPLAY g_header_cnt  TO FORMONLY.h_count     #page count
  
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
  
END FUNCTION
 
{</section>}
 
{<section id="astt803.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt803_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization" 
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point     
    
   #add-point:Function前置處理 name="set_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("stemdocno",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stemsite",TRUE)
      #end add-point 
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("stem001",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt803_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_no_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stemdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stem001",FALSE)
   END IF
   
   IF NOT s_aooi500_comp_entry(g_prog,'stemsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stemsite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt803_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization" 
   
   #end add-point  
   #add-point:set_act_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("statechange,modify,delete",TRUE)
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt803.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt803_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point
   #add-point:set_act_no_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   IF g_stem_m.stemstus NOT MATCHES '[NDR]' THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete",FALSE)
   END IF
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt803.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt803_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization" 
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.pre_function"
   
   #end add-point
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point  
   
   #根據外部參數(g_argv)組合wc
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " stemdocno = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      #若有外部參數則根據該參數組合
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      #預設查詢條件
      LET g_wc = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc) THEN
         LET g_wc = " 1=2"
      END IF
   END IF
   
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt803.mask_functions" >}
&include "erp/ast/astt803_mask.4gl"
 
{</section>}
 
{<section id="astt803.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt803_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_stemcnfdt      DATETIME YEAR TO SECOND
   DEFINE p_type           LIKE type_t.chr10     #类型 A优惠变更 B延期变更 C面积变更 D终止申请
   DEFINE l_success        LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt803_cl USING g_enterprise,g_stem_m.stemdocno
   IF STATUS THEN
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt803_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
       g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
       g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
       g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT astt803_action_chk() THEN
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem019, 
       g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013,g_stem_m.stem013_desc, 
       g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemownid_desc, 
       g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc,g_stem_m.stemmoddt, 
       g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
 
   CASE g_stem_m.stemstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stem_m.stemstus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
#      CALL cl_set_act_visible("unconfirmed,invalid,confirmed,approved,withdraw,rejection,signing",TRUE)  #170117-00025#1 mark by 08172
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)   #170117-00025#1 add by 08172
      CALL cl_set_act_visible("signing,withdraw",FALSE)   #170117-00025#1 add by 08172
      CALL cl_set_act_visible("reconciliate,unreconciliate",FALSE)
      CASE g_stem_m.stemstus
         WHEN "N"
            #HIDE OPTION "open"
#            CALL cl_set_act_visible("unconfirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("unconfirmed",FALSE) #170117-00025#1 add by 08172
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
                CALL cl_set_act_visible("confirmed",FALSE) #170117-00025#1 add by 08172
            END IF
       
         WHEN "X"
            #HIDE OPTION "invalid"
#            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE) #170117-00025#1 add by 08172
            CALL s_transaction_end('N','0') #160816-00068#1 add
            RETURN
       
         WHEN "Y"
            #HIDE OPTION "confirmed"
#            CALL cl_set_act_visible("invalid,confirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("invalid,confirmed",FALSE) #170117-00025#1 add by 08172
       
         WHEN "A"
#            CALL cl_set_act_visible("invalid,unconfirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("confirmed",TRUE) #170117-00025#1 add by 08172
            CALL cl_set_act_visible("invalid,unconfirmed",FALSE) #170117-00025#1 add by 08172
            
         WHEN "D"
#            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("unconfirmed,confirmed",FALSE)  #170117-00025#1 add by 08172
            
         WHEN "R"
#            CALL cl_set_act_visible("unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("unconfirmed,confirmed",FALSE)  #170117-00025#1 add by 08172
            
         WHEN "W"
#            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,rejection,signing",FALSE) #170117-00025#1 mark by 08172
            CALL cl_set_act_visible("withdraw",TRUE) #170117-00025#1 add by 08172
            CALL cl_set_act_visible("invalid,unconfirmed,confirmed",FALSE) #170117-00025#1 add by 08172
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt803_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt803_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt803_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt803_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            #判断是否存在于合同申请档astt801
            IF NOT s_astt805_exist_t801(g_stem_m.stemdocno) THEN
               CALL s_transaction_end('N','0') #160816-00068#1 add
               RETURN
            END IF
            IF NOT cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_end('N','0') #160816-00068#1 add
               RETURN
            END IF
            UPDATE stem_t SET stemstus = lc_state,
                              stemcnfdt = '',
                              stemcnfid = ''
             WHERE stement = g_enterprise
               AND stemdocno = g_stem_m.stemdocno
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = g_stem_m.stemdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            IF NOT cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_end('N','0') #160816-00068#1 add
               RETURN
            END IF
            #160324-00008#14 add by geza 20160505(S)
            LET p_type = 'B' 
            #合同不为空再根据参数判断是否要生成合同异动申请
            IF cl_get_para(g_enterprise,g_stem_m.stemsite,"S-CIR-2027")  = 'Y' AND g_stem_m.stem001 IS NOT NULL THEN
               CALL cl_err_collect_init()
               CALL s_astt801_produce_auto(p_type,g_stem_m.stem001,g_stem_m.stemdocno) RETURNING l_success
               CALL cl_err_collect_show()
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               END IF
            END IF
            #160324-00008#14 add by geza 20160505(E)
            LET l_stemcnfdt = cl_get_current()
            UPDATE stem_t SET stemstus = lc_state,
                              stemcnfdt = l_stemcnfdt,
                              stemcnfid = g_user
             WHERE stement = g_enterprise
               AND stemdocno = g_stem_m.stemdocno
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = g_stem_m.stemdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION approved
         IF cl_auth_chk_act("approved") THEN
            LET lc_state = "A"
            #add-point:action控制 name="statechange.approved"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION signing
      #   IF cl_auth_chk_act("signing") THEN
      #      LET lc_state = "W"
      #      #add-point:action控制 name="statechange.signing"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            IF NOT cl_ask_confirm('aim-00109') THEN
               CALL s_transaction_end('N','0') #160816-00068#1 add
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "X"
      ) OR 
      g_stem_m.stemstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stem_m.stemmodid = g_user
   LET g_stem_m.stemmoddt = cl_get_current()
   LET g_stem_m.stemstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stem_t 
      SET (stemstus,stemmodid,stemmoddt) 
        = (g_stem_m.stemstus,g_stem_m.stemmodid,g_stem_m.stemmoddt)     
    WHERE stement = g_enterprise AND stemdocno = g_stem_m.stemdocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt803_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
          g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
          g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
          g_stem_m.stem011,g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034, 
          g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
          g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
          g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc,g_stem_m.stem003_desc,g_stem_m.stem005_desc, 
          g_stem_m.stem004_desc,g_stem_m.stem012_desc,g_stem_m.stem013_desc,g_stem_m.stemownid_desc, 
          g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc, 
          g_stem_m.stemcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno, 
          g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003, 
          g_stem_m.stem003_desc,g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc, 
          g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011, 
          g_stem_m.stem019,g_stem_m.stem000,g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013, 
          g_stem_m.stem013_desc,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stemstus,g_stem_m.stemownid, 
          g_stem_m.stemownid_desc,g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc, 
          g_stem_m.stemcrtdp,g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc, 
          g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt803_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt803_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt803.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt803_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success  LIKE type_t.num5   #170214-00002#1 by 08172
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
 
 
   CALL astt803_show()
   CALL astt803_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   #170214-00002#1 -s 20170214 mark by 08172
   #170117-00025#1 -s by 08172
#   IF cl_null(g_stem_m.stemdocno) THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'afa-00223'
#      LET g_errparam.extend = g_stem_m.stemdocno
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      CLOSE astt803_cl
#      CALL s_transaction_end('N','0')
#      RETURN FALSE
#   END IF 
#   IF g_stem_m.stemstus NOT MATCHES '[NA]' THEN  
#      INITIALIZE g_errparam TO NULL 
#      LET g_errparam.extend = '' 
#      LET g_errparam.code   = 'sub-00697'
#      LET g_errparam.popup  = TRUE 
#      CALL cl_err()
#      CLOSE astt803_cl
#      CALL s_transaction_end('N','0')
#      RETURN FALSE
#   END IF
   #170117-00025#1 -e by 08172
   #170214-00002#1 -e 20170214 mark by 08172
   #170214-00002#1 -s 20170214 add by 08172
   CALL s_astt803_1_conf_chk(g_stem_m.stemdocno,g_stem_m.stemstus) RETURNING l_success
   IF NOT l_success THEN
      CLOSE astt803_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #170214-00002#1 -e 20170214 add by 08172
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stem_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL astt803_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt803_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt803.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt803_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_stem_m.stemdocno
   LET g_pk_array[1].column = 'stemdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt803.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astt803.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt803_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL astt803_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stem_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt803.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt803_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization" 
   
   #end add-point
   #add-point:action_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#41 add-S
   SELECT stemstus  INTO g_stem_m.stemstus
     FROM stem_t
    WHERE stement = g_enterprise
      AND stemdocno = g_stem_m.stemdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stem_m.stemstus
        WHEN 'W'
           LET g_errno = 'sub-00180'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_stem_m.stemdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt803_set_act_visible()
        CALL astt803_set_act_no_visible()
        CALL astt803_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#41 add-E
   #end add-point
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt803.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 合同编号带值
# Memo...........:
# Usage..........: CALL astt803_stem001_ref()
# Date & Author..: 160413 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt803_stem001_ref()

   LET g_stem_m.stem016 = ''
   LET g_stem_m.stem002 = ''
   LET g_stem_m.stem003 = ''
   LET g_stem_m.stem005 = ''
   LET g_stem_m.stem004 = ''
   LET g_stem_m.stem006 = ''
   LET g_stem_m.stem017 = ''
   LET g_stem_m.stem007 = ''
   LET g_stem_m.stem009 = ''
   LET g_stem_m.stem010 = ''
   LET g_stem_m.stem011 = ''

   SELECT stje002,stje008,stje007,stje028,stje029,
          stje023,stje024,stje025,stje011,stje012,
          stje042
     INTO g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004,
          g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,
          g_stem_m.stem011
     FROM stje_t
    WHERE stjeent = g_enterprise
      AND stje001 = g_stem_m.stem001
      
   #版本号+1
   LET g_stem_m.stem016 = g_stem_m.stem016 + 1 USING "<<<<<<<<<#"
      
   #铺位说明
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem002
   CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stem_m.stem002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem002_desc
   #商户说明
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem003
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stem_m.stem003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem003_desc
   #品类
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem005
   CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stem_m.stem005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem005_desc
   #品牌
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stem_m.stem004
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2002' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stem_m.stem004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stem_m.stem004_desc

END FUNCTION

 
{</section>}
 
