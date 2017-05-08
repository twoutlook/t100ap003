#該程式未解開Section, 採用最新樣板產出!
{<section id="asti250.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0007(2016-06-15 17:22:01), PR版次:0007(2016-10-25 16:04:15)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000031
#+ Filename...: asti250
#+ Description: 合約費用項設定作業
#+ Creator....: 07959(2016-03-11 13:52:24)
#+ Modifier...: 06189 -SD/PR- 03247
 
{</section>}
 
{<section id="asti250.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
# Modify......: NO.160407-00047#1    2016/04/11   By 08172    画面调整
# Modify......: NO.160318-00025#34   2016/04/14   By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
# Modify......: NO.160420-00033#1    2016/04/21   By 08172    方案编号查询开窗修改（r.q）
# Modify......: NO.160510-00010#2    2016/05/11   By 07959    1.增加栏位：“费用归属类型”和“费用归属组织”，
# ............:                                                 新增时自动从asti203带出，可以修改
# ............:                                               2.栏位控管：“费用归属类型”=1-本营运组织时，不允许录入；“费用归属类型”=2-内部营运组织时，要求必须录入；“费用归属类型”：3-外部营运组织，不允许录入。
# Modify......: NO.#160510-00010#11  2016/05/20   By 07959    费用归属类型是3.外部营运组织 时，开放费用归属组织可以维护，选apmm801的交易对象（有效的）
#161024-00025#1 2016/10/24 By dongsz sthb010编辑开窗增加aooi500管控
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
PRIVATE type type_g_stha_m        RECORD
       sthasite LIKE stha_t.sthasite, 
   sthasite_desc LIKE type_t.chr80, 
   stha001 LIKE stha_t.stha001, 
   sthal003 LIKE type_t.chr500, 
   stha002 LIKE stha_t.stha002, 
   stha002_desc LIKE type_t.chr80, 
   stha003 LIKE stha_t.stha003, 
   stha003_desc LIKE type_t.chr80, 
   stha004 LIKE stha_t.stha004, 
   stha004_desc LIKE type_t.chr80, 
   sthadocdt LIKE stha_t.sthadocdt, 
   stha005 LIKE stha_t.stha005, 
   stha005_desc LIKE type_t.chr80, 
   stha006 LIKE stha_t.stha006, 
   stha006_desc LIKE type_t.chr80, 
   sthastus LIKE stha_t.sthastus, 
   sthaownid LIKE stha_t.sthaownid, 
   sthaownid_desc LIKE type_t.chr80, 
   sthaowndp LIKE stha_t.sthaowndp, 
   sthaowndp_desc LIKE type_t.chr80, 
   sthacrtid LIKE stha_t.sthacrtid, 
   sthacrtid_desc LIKE type_t.chr80, 
   sthacrtdp LIKE stha_t.sthacrtdp, 
   sthacrtdp_desc LIKE type_t.chr80, 
   sthacrtdt LIKE stha_t.sthacrtdt, 
   sthamodid LIKE stha_t.sthamodid, 
   sthamodid_desc LIKE type_t.chr80, 
   sthamoddt LIKE stha_t.sthamoddt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sthb_d        RECORD
       sthb002 LIKE sthb_t.sthb002, 
   sthb002_desc LIKE type_t.chr500, 
   sthb003 LIKE sthb_t.sthb003, 
   sthb003_desc LIKE type_t.chr500, 
   sthb012 LIKE sthb_t.sthb012, 
   sthb012_desc LIKE type_t.chr500, 
   sthb004 LIKE sthb_t.sthb004, 
   sthb005 LIKE sthb_t.sthb005, 
   sthb006 LIKE sthb_t.sthb006, 
   sthb007 LIKE sthb_t.sthb007, 
   sthb008 LIKE sthb_t.sthb008, 
   sthb009 LIKE sthb_t.sthb009, 
   sthb010 LIKE sthb_t.sthb010, 
   sthb010_desc LIKE type_t.chr500, 
   sthb011 LIKE sthb_t.sthb011
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stha001 LIKE stha_t.stha001,
      b_sthasite LIKE stha_t.sthasite,
      b_sthadocdt LIKE stha_t.sthadocdt,
      b_stha002 LIKE stha_t.stha002,
      b_stha003 LIKE stha_t.stha003,
      b_stha004 LIKE stha_t.stha004,
      b_stha005 LIKE stha_t.stha005,
      b_stha006 LIKE stha_t.stha006
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag         LIKE type_t.num5    #141208-00001#14 Add By Ken
DEFINE g_ooef004           LIKE ooef_t.ooef004
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stha_m          type_g_stha_m
DEFINE g_stha_m_t        type_g_stha_m
DEFINE g_stha_m_o        type_g_stha_m
DEFINE g_stha_m_mask_o   type_g_stha_m #轉換遮罩前資料
DEFINE g_stha_m_mask_n   type_g_stha_m #轉換遮罩後資料
 
   DEFINE g_stha001_t LIKE stha_t.stha001
 
 
DEFINE g_sthb_d          DYNAMIC ARRAY OF type_g_sthb_d
DEFINE g_sthb_d_t        type_g_sthb_d
DEFINE g_sthb_d_o        type_g_sthb_d
DEFINE g_sthb_d_mask_o   DYNAMIC ARRAY OF type_g_sthb_d #轉換遮罩前資料
DEFINE g_sthb_d_mask_n   DYNAMIC ARRAY OF type_g_sthb_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
DEFINE g_master_multi_table_t    RECORD
      sthal001 LIKE sthal_t.sthal001,
      sthal003 LIKE sthal_t.sthal003
      END RECORD
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asti250.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5   #150308-00001#3 150309 pomelo add 
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   SELECT ooef004 
     INTO g_ooef004 
     FROM ooef_t 
    WHERE ooefent = g_enterprise 
      AND ooef001 = g_site 
      
   #CALL s_aooi390_cre_tmp_table() RETURNING l_success
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT sthasite,'',stha001,'',stha002,'',stha003,'',stha004,'',sthadocdt,stha005, 
       '',stha006,'',sthastus,sthaownid,'',sthaowndp,'',sthacrtid,'',sthacrtdp,'',sthacrtdt,sthamodid, 
       '',sthamoddt", 
                      " FROM stha_t",
                      " WHERE sthaent= ? AND stha001=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asti250_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sthasite,t0.stha001,t0.stha002,t0.stha003,t0.stha004,t0.sthadocdt, 
       t0.stha005,t0.stha006,t0.sthastus,t0.sthaownid,t0.sthaowndp,t0.sthacrtid,t0.sthacrtdp,t0.sthacrtdt, 
       t0.sthamodid,t0.sthamoddt,t1.ooefl003 ,t2.mhaal003 ,t3.mhabl004 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 , 
       t7.ooag011 ,t8.ooefl003 ,t9.ooag011 ,t10.ooefl003 ,t11.ooag011",
               " FROM stha_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t2 ON t2.mhaalent="||g_enterprise||" AND t2.mhaal001=t0.stha002 AND t2.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t3 ON t3.mhablent="||g_enterprise||" AND t3.mhabl001=t0.stha002 AND t3.mhabl002=t0.stha003 AND t3.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2144' AND t4.oocql002=t0.stha004 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stha005  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stha006 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.sthaownid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.sthaowndp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.sthacrtid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.sthacrtdp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.sthamodid  ",
 
               " WHERE t0.sthaent = " ||g_enterprise|| " AND t0.stha001 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asti250_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asti250 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asti250_init()   
 
      #進入選單 Menu (="N")
      CALL asti250_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asti250
      
   END IF 
   
   CLOSE asti250_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success   #150308-00001#3 150309 pomelo add 
   CALL s_aooi390_drop_tmp_table()   #add--2015/03/20 By shiun
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asti250.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asti250_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('sthastus','17','N,Y')
 
      CALL cl_set_combo_scc('sthb004','6903') 
   CALL cl_set_combo_scc('sthb005','6005') 
   CALL cl_set_combo_scc('sthb009','6932') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success   #150308-00001#3 150309 pomelo add
   #end add-point
   
   #初始化搜尋條件
   CALL asti250_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asti250.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asti250_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   #因應查詢方案進行處理
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
            CALL asti250_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_stha_m.* TO NULL
         CALL g_sthb_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asti250_init()
      END IF
   
      CALL lib_cl_dlg.cl_dlg_before_display()
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE
         
               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF 
               
               CALL asti250_fetch('') # reload data
               LET l_ac = 1
               CALL asti250_ui_detailshow() #Setting the current row 
         
               CALL asti250_idx_chk()
               #NEXT FIELD sthb002
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sthb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asti250_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL asti250_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asti250_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL asti250_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asti250_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asti250_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asti250_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asti250_set_act_visible()   
            CALL asti250_set_act_no_visible()
            IF NOT (g_stha_m.stha001 IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sthaent = " ||g_enterprise|| " AND",
                                  " stha001 = '", g_stha_m.stha001, "' "
 
               #填到對應位置
               CALL asti250_browser_fill("")
            END IF
         
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stha_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL asti250_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stha_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL asti250_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asti250_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()
          
         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL asti250_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asti250_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asti250_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asti250_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asti250_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asti250_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asti250_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asti250_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asti250_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asti250_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asti250_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #browser
               CALL g_export_node.clear()
               IF g_main_hidden = 1 THEN
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               #非browser
               ELSE
                  LET g_export_node[1] = base.typeInfo.create(g_sthb_d)
                  LET g_export_id[1]   = "s_detail1"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  
                  #END add-point
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         #主頁摺疊
         ON ACTION mainhidden       
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
            
         #瀏覽頁折疊
         ON ACTION worksheethidden   
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD sthb002
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
    
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL asti250_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asti250_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asti250_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asti250_insert()
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
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL asti250_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asti250_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asti250_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asti250_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asti250_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stha_m.sthadocdt)
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="asti250.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asti250_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING #141208-00001#14 Add By Ken
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   CALL s_aooi500_sql_where(g_prog,'sthasite') RETURNING l_where #141208-00001#14 Add By Ken
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stha001 ",
                      " FROM stha_t ",
                      " ",
                      " LEFT JOIN sthb_t ON sthbent = sthaent AND stha001 = sthb001 ", "  ",
                      #add-point:browser_fill段sql(sthb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " LEFT JOIN sthal_t ON sthalent = "||g_enterprise||" AND stha001 = sthal001 AND sthal002 = '",g_dlang,"' ", 
                      " ", 
 
 
                      " WHERE sthaent = " ||g_enterprise|| " AND sthbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stha_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stha001 ",
                      " FROM stha_t ", 
                      "  ",
                      "  LEFT JOIN sthal_t ON sthalent = "||g_enterprise||" AND stha001 = sthal001 AND sthal002 = '",g_dlang,"' ",
                      " WHERE sthaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stha_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
   
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_stha_m.* TO NULL
      CALL g_sthb_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stha001,t0.sthasite,t0.sthadocdt,t0.stha002,t0.stha003,t0.stha004,t0.stha005,t0.stha006 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthastus,t0.stha001,t0.sthasite,t0.sthadocdt,t0.stha002,t0.stha003, 
          t0.stha004,t0.stha005,t0.stha006 ",
                  " FROM stha_t t0",
                  "  ",
                  "  LEFT JOIN sthb_t ON sthbent = sthaent AND stha001 = sthb001 ", "  ", 
                  #add-point:browser_fill段sql(sthb_t1) name="browser_fill.join.sthb_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                  
               " LEFT JOIN sthal_t ON sthalent = "||g_enterprise||" AND stha001 = sthal001 AND sthal002 = '",g_dlang,"' ",
                  " WHERE t0.sthaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stha_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthastus,t0.stha001,t0.sthasite,t0.sthadocdt,t0.stha002,t0.stha003, 
          t0.stha004,t0.stha005,t0.stha006 ",
                  " FROM stha_t t0",
                  "  ",
                  
               " LEFT JOIN sthal_t ON sthalent = "||g_enterprise||" AND stha001 = sthal001 AND sthal002 = '",g_dlang,"' ",
                  " WHERE t0.sthaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stha_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stha001 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stha_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stha001,g_browser[g_cnt].b_sthasite, 
          g_browser[g_cnt].b_sthadocdt,g_browser[g_cnt].b_stha002,g_browser[g_cnt].b_stha003,g_browser[g_cnt].b_stha004, 
          g_browser[g_cnt].b_stha005,g_browser[g_cnt].b_stha006
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
      
         #遮罩相關處理
         CALL asti250_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/inactive.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/active.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
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
   
   IF cl_null(g_browser[g_cnt].b_stha001) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asti250_set_act_visible()   
   CALL asti250_set_act_no_visible()
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asti250_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stha_m.stha001 = g_browser[g_current_idx].b_stha001   
 
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
   CALL asti250_stha_t_mask()
   CALL asti250_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asti250.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asti250_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asti250_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_stha001 = g_stha_m.stha001 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asti250_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stha_m.* TO NULL
   CALL g_sthb_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sthasite,stha001,sthal003,stha002,stha003,stha004,sthadocdt,stha005, 
          stha006,sthastus,sthaownid,sthaowndp,sthacrtid,sthacrtdp,sthacrtdt,sthamodid,sthamoddt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sthacrtdt>>----
         AFTER FIELD sthacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sthamoddt>>----
         AFTER FIELD sthamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sthacnfdt>>----
         
         #----<<sthapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sthasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthasite
            #add-point:ON ACTION controlp INFIELD sthasite name="construct.c.sthasite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthasite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthasite  #顯示到畫面上
            NEXT FIELD sthasite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthasite
            #add-point:BEFORE FIELD sthasite name="construct.b.sthasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthasite
            
            #add-point:AFTER FIELD sthasite name="construct.a.sthasite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stha001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha001
            #add-point:ON ACTION controlp INFIELD stha001 name="construct.c.stha001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #LET g_qryparam.arg1 = '34'
            #CALL q_oofg001_3()                           #呼叫開窗
            CALL q_stha001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha001  #顯示到畫面上
            NEXT FIELD stha001                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha001
            #add-point:BEFORE FIELD stha001 name="construct.b.stha001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha001
            
            #add-point:AFTER FIELD stha001 name="construct.a.stha001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthal003
            #add-point:BEFORE FIELD sthal003 name="construct.b.sthal003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthal003
            
            #add-point:AFTER FIELD sthal003 name="construct.a.sthal003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthal003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthal003
            #add-point:ON ACTION controlp INFIELD sthal003 name="construct.c.sthal003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stha002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha002
            #add-point:ON ACTION controlp INFIELD stha002 name="construct.c.stha002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha002  #顯示到畫面上
            NEXT FIELD stha002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha002
            #add-point:BEFORE FIELD stha002 name="construct.b.stha002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha002
            
            #add-point:AFTER FIELD stha002 name="construct.a.stha002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stha003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha003
            #add-point:ON ACTION controlp INFIELD stha003 name="construct.c.stha003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha003  #顯示到畫面上
            NEXT FIELD stha003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha003
            #add-point:BEFORE FIELD stha003 name="construct.b.stha003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha003
            
            #add-point:AFTER FIELD stha003 name="construct.a.stha003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stha004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha004
            #add-point:ON ACTION controlp INFIELD stha004 name="construct.c.stha004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "2144"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha004  #顯示到畫面上
            NEXT FIELD stha004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha004
            #add-point:BEFORE FIELD stha004 name="construct.b.stha004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha004
            
            #add-point:AFTER FIELD stha004 name="construct.a.stha004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthadocdt
            #add-point:BEFORE FIELD sthadocdt name="construct.b.sthadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthadocdt
            
            #add-point:AFTER FIELD sthadocdt name="construct.a.sthadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthadocdt
            #add-point:ON ACTION controlp INFIELD sthadocdt name="construct.c.sthadocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stha005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha005
            #add-point:ON ACTION controlp INFIELD stha005 name="construct.c.stha005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha005  #顯示到畫面上
            NEXT FIELD stha005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha005
            #add-point:BEFORE FIELD stha005 name="construct.b.stha005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha005
            
            #add-point:AFTER FIELD stha005 name="construct.a.stha005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stha006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha006
            #add-point:ON ACTION controlp INFIELD stha006 name="construct.c.stha006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stha006  #顯示到畫面上
            NEXT FIELD stha006                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha006
            #add-point:BEFORE FIELD stha006 name="construct.b.stha006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha006
            
            #add-point:AFTER FIELD stha006 name="construct.a.stha006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthastus
            #add-point:BEFORE FIELD sthastus name="construct.b.sthastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthastus
            
            #add-point:AFTER FIELD sthastus name="construct.a.sthastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthastus
            #add-point:ON ACTION controlp INFIELD sthastus name="construct.c.sthastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthaownid
            #add-point:ON ACTION controlp INFIELD sthaownid name="construct.c.sthaownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthaownid  #顯示到畫面上
            NEXT FIELD sthaownid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthaownid
            #add-point:BEFORE FIELD sthaownid name="construct.b.sthaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthaownid
            
            #add-point:AFTER FIELD sthaownid name="construct.a.sthaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthaowndp
            #add-point:ON ACTION controlp INFIELD sthaowndp name="construct.c.sthaowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthaowndp  #顯示到畫面上
            NEXT FIELD sthaowndp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthaowndp
            #add-point:BEFORE FIELD sthaowndp name="construct.b.sthaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthaowndp
            
            #add-point:AFTER FIELD sthaowndp name="construct.a.sthaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthacrtid
            #add-point:ON ACTION controlp INFIELD sthacrtid name="construct.c.sthacrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthacrtid  #顯示到畫面上
            NEXT FIELD sthacrtid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthacrtid
            #add-point:BEFORE FIELD sthacrtid name="construct.b.sthacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthacrtid
            
            #add-point:AFTER FIELD sthacrtid name="construct.a.sthacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthacrtdp
            #add-point:ON ACTION controlp INFIELD sthacrtdp name="construct.c.sthacrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthacrtdp  #顯示到畫面上
            NEXT FIELD sthacrtdp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthacrtdp
            #add-point:BEFORE FIELD sthacrtdp name="construct.b.sthacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthacrtdp
            
            #add-point:AFTER FIELD sthacrtdp name="construct.a.sthacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthacrtdt
            #add-point:BEFORE FIELD sthacrtdt name="construct.b.sthacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthamodid
            #add-point:ON ACTION controlp INFIELD sthamodid name="construct.c.sthamodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthamodid  #顯示到畫面上
            NEXT FIELD sthamodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthamodid
            #add-point:BEFORE FIELD sthamodid name="construct.b.sthamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthamodid
            
            #add-point:AFTER FIELD sthamodid name="construct.a.sthamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthamoddt
            #add-point:BEFORE FIELD sthamoddt name="construct.b.sthamoddt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sthb002,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008,sthb009, 
          sthb010,sthb011
           FROM s_detail1[1].sthb002,s_detail1[1].sthb003,s_detail1[1].sthb012,s_detail1[1].sthb004, 
               s_detail1[1].sthb005,s_detail1[1].sthb006,s_detail1[1].sthb007,s_detail1[1].sthb008,s_detail1[1].sthb009, 
               s_detail1[1].sthb010,s_detail1[1].sthb011
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #Ctrlp:construct.c.page1.sthb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb002
            #add-point:ON ACTION controlp INFIELD sthb002 name="construct.c.page1.sthb002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthb002  #顯示到畫面上
            NEXT FIELD sthb002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb002
            #add-point:BEFORE FIELD sthb002 name="construct.b.page1.sthb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb002
            
            #add-point:AFTER FIELD sthb002 name="construct.a.page1.sthb002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb003
            #add-point:BEFORE FIELD sthb003 name="construct.b.page1.sthb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb003
            
            #add-point:AFTER FIELD sthb003 name="construct.a.page1.sthb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb003
            #add-point:ON ACTION controlp INFIELD sthb003 name="construct.c.page1.sthb003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            CALL q_ooib002_1()                           #呼叫開窗
            CALL q_staa001()
            DISPLAY g_qryparam.return1 TO sthb003  #顯示到畫面上
            NEXT FIELD sthb003                     #返回原欄位
    



            #END add-point
 
 
         #Ctrlp:construct.c.page1.sthb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb012
            #add-point:ON ACTION controlp INFIELD sthb012 name="construct.c.page1.sthb012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthb012  #顯示到畫面上
            NEXT FIELD sthb012                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb012
            #add-point:BEFORE FIELD sthb012 name="construct.b.page1.sthb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb012
            
            #add-point:AFTER FIELD sthb012 name="construct.a.page1.sthb012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb004
            #add-point:BEFORE FIELD sthb004 name="construct.b.page1.sthb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb004
            
            #add-point:AFTER FIELD sthb004 name="construct.a.page1.sthb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb004
            #add-point:ON ACTION controlp INFIELD sthb004 name="construct.c.page1.sthb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb005
            #add-point:BEFORE FIELD sthb005 name="construct.b.page1.sthb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb005
            
            #add-point:AFTER FIELD sthb005 name="construct.a.page1.sthb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb005
            #add-point:ON ACTION controlp INFIELD sthb005 name="construct.c.page1.sthb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb006
            #add-point:BEFORE FIELD sthb006 name="construct.b.page1.sthb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb006
            
            #add-point:AFTER FIELD sthb006 name="construct.a.page1.sthb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb006
            #add-point:ON ACTION controlp INFIELD sthb006 name="construct.c.page1.sthb006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb007
            #add-point:BEFORE FIELD sthb007 name="construct.b.page1.sthb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb007
            
            #add-point:AFTER FIELD sthb007 name="construct.a.page1.sthb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb007
            #add-point:ON ACTION controlp INFIELD sthb007 name="construct.c.page1.sthb007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb008
            #add-point:BEFORE FIELD sthb008 name="construct.b.page1.sthb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb008
            
            #add-point:AFTER FIELD sthb008 name="construct.a.page1.sthb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb008
            #add-point:ON ACTION controlp INFIELD sthb008 name="construct.c.page1.sthb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb009
            #add-point:BEFORE FIELD sthb009 name="construct.b.page1.sthb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb009
            
            #add-point:AFTER FIELD sthb009 name="construct.a.page1.sthb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb009
            #add-point:ON ACTION controlp INFIELD sthb009 name="construct.c.page1.sthb009"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sthb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb010
            #add-point:ON ACTION controlp INFIELD sthb010 name="construct.c.page1.sthb010"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗      #160510-00010#11  mark
            CALL q_sthb010()     #160510-00010#11  add
            DISPLAY g_qryparam.return1 TO sthb010  #顯示到畫面上
            NEXT FIELD sthb010                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb010
            #add-point:BEFORE FIELD sthb010 name="construct.b.page1.sthb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb010
            
            #add-point:AFTER FIELD sthb010 name="construct.a.page1.sthb010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb011
            #add-point:BEFORE FIELD sthb011 name="construct.b.page1.sthb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb011
            
            #add-point:AFTER FIELD sthb011 name="construct.a.page1.sthb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb011
            #add-point:ON ACTION controlp INFIELD sthb011 name="construct.c.page1.sthb011"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stha_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sthb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asti250_filter()
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
      CONSTRUCT g_wc_filter ON stha001,sthasite,sthadocdt,stha002,stha003,stha004,stha005,stha006
                          FROM s_browse[1].b_stha001,s_browse[1].b_sthasite,s_browse[1].b_sthadocdt, 
                              s_browse[1].b_stha002,s_browse[1].b_stha003,s_browse[1].b_stha004,s_browse[1].b_stha005, 
                              s_browse[1].b_stha006
 
         BEFORE CONSTRUCT
               DISPLAY asti250_filter_parser('stha001') TO s_browse[1].b_stha001
            DISPLAY asti250_filter_parser('sthasite') TO s_browse[1].b_sthasite
            DISPLAY asti250_filter_parser('sthadocdt') TO s_browse[1].b_sthadocdt
            DISPLAY asti250_filter_parser('stha002') TO s_browse[1].b_stha002
            DISPLAY asti250_filter_parser('stha003') TO s_browse[1].b_stha003
            DISPLAY asti250_filter_parser('stha004') TO s_browse[1].b_stha004
            DISPLAY asti250_filter_parser('stha005') TO s_browse[1].b_stha005
            DISPLAY asti250_filter_parser('stha006') TO s_browse[1].b_stha006
      
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
 
      CALL asti250_filter_show('stha001')
   CALL asti250_filter_show('sthasite')
   CALL asti250_filter_show('sthadocdt')
   CALL asti250_filter_show('stha002')
   CALL asti250_filter_show('stha003')
   CALL asti250_filter_show('stha004')
   CALL asti250_filter_show('stha005')
   CALL asti250_filter_show('stha006')
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asti250_filter_parser(ps_field)
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
 
{<section id="asti250.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asti250_filter_show(ps_field)
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
   LET ls_condition = asti250_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asti250_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF   
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_sthb_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asti250_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asti250_browser_fill("")
      CALL asti250_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL asti250_filter_show('stha001')
   CALL asti250_filter_show('sthasite')
   CALL asti250_filter_show('sthadocdt')
   CALL asti250_filter_show('stha002')
   CALL asti250_filter_show('stha003')
   CALL asti250_filter_show('stha004')
   CALL asti250_filter_show('stha005')
   CALL asti250_filter_show('stha006')
   CALL asti250_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asti250_fetch("F") 
      #顯示單身筆數
      CALL asti250_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asti250_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_stha_m.stha001 = g_browser[g_current_idx].b_stha001
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
   #遮罩相關處理
   LET g_stha_m_mask_o.* =  g_stha_m.*
   CALL asti250_stha_t_mask()
   LET g_stha_m_mask_n.* =  g_stha_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asti250_set_act_visible()   
   CALL asti250_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stha_m_t.* = g_stha_m.*
   LET g_stha_m_o.* = g_stha_m.*
   
   LET g_data_owner = g_stha_m.sthaownid      
   LET g_data_dept  = g_stha_m.sthaowndp
   
   #重新顯示   
   CALL asti250_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.insert" >}
#+ 資料新增
PRIVATE FUNCTION asti250_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success     LIKE type_t.num5 #sakura add
   DEFINE l_insert      LIKE type_t.num5 #sakura add  
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   CALL cl_set_comp_entry("sthal003",TRUE)
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sthb_d.clear()   
 
 
   INITIALIZE g_stha_m.* TO NULL             #DEFAULT 設定
   
   LET g_stha001_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stha_m.sthaownid = g_user
      LET g_stha_m.sthaowndp = g_dept
      LET g_stha_m.sthacrtid = g_user
      LET g_stha_m.sthacrtdp = g_dept 
      LET g_stha_m.sthacrtdt = cl_get_current()
      LET g_stha_m.sthamodid = g_user
      LET g_stha_m.sthamoddt = cl_get_current()
      LET g_stha_m.sthastus = 'Y'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stha_m.sthastus = "Y"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stha_m.sthadocdt = g_today
      LET g_stha_m.stha005 = g_user
      LET g_stha_m.stha006 = g_dept
      
      SELECT ooag011 INTO g_stha_m.stha005_desc FROM ooag_t
      WHERE ooag001 = g_user
      AND ooagent = g_enterprise
      
      LET g_stha_m.stha005_desc = g_stha_m.stha005_desc  #申请人员带值
      
      SELECT ooag003 INTO g_stha_m.stha006_desc FROM ooag_t
      WHERE ooag001 = g_user
      AND ooagent = g_enterprise
      
      SELECT ooefl003 INTO g_stha_m.stha006_desc FROM ooefl_t
      WHERE ooefl001 = g_stha_m.stha006_desc
      AND ooeflent = g_enterprise
      AND ooefl002 = g_dlang
      
      LET g_stha_m.stha006_desc = g_stha_m.stha006_desc  #申请部门带值
      
      DISPLAY BY NAME g_stha_m.stha005_desc,g_stha_m.stha006_desc
      
      
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'sthasite',g_stha_m.sthasite)
         RETURNING l_insert,g_stha_m.sthasite
      IF NOT l_insert THEN
         RETURN
      END IF
      
      IF NOT cl_null(g_stha_m.sthasite) THEN
         SELECT ooefl003 INTO g_stha_m.sthasite_desc FROM ooefl_t
         WHERE ooefl001 = g_stha_m.sthasite
           AND ooefl002 = g_lang
           AND ooeflent = g_enterprise
         DISPLAY BY NAME g_stha_m.sthasite_desc
      END IF
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stha_m_t.* = g_stha_m.*
      LET g_stha_m_o.* = g_stha_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stha_m.sthastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
    
      CALL asti250_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_stha_m.* TO NULL
         INITIALIZE g_sthb_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asti250_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sthb_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asti250_set_act_visible()   
   CALL asti250_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stha001_t = g_stha_m.stha001
 
   
   #組合新增資料的條件
   LET g_add_browse = " sthaent = " ||g_enterprise|| " AND",
                      " stha001 = '", g_stha_m.stha001, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asti250_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asti250_cl
   
   CALL asti250_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
   
   #遮罩相關處理
   LET g_stha_m_mask_o.* =  g_stha_m.*
   CALL asti250_stha_t_mask()
   LET g_stha_m_mask_n.* =  g_stha_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002, 
       g_stha_m.stha002_desc,g_stha_m.stha003,g_stha_m.stha003_desc,g_stha_m.stha004,g_stha_m.stha004_desc, 
       g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha005_desc,g_stha_m.stha006,g_stha_m.stha006_desc, 
       g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp,g_stha_m.sthacrtdp_desc,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamodid_desc,g_stha_m.sthamoddt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stha_m.sthaownid      
   LET g_data_dept  = g_stha_m.sthaowndp
   
   #功能已完成,通報訊息中心
   CALL asti250_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.modify" >}
#+ 資料修改
PRIVATE FUNCTION asti250_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stha_m_t.* = g_stha_m.*
   LET g_stha_m_o.* = g_stha_m.*
   
   IF g_stha_m.stha001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stha001_t = g_stha_m.stha001
 
   CALL s_transaction_begin()
   
   OPEN asti250_cl USING g_enterprise,g_stha_m.stha001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asti250_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asti250_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
   #檢查是否允許此動作
   IF NOT asti250_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stha_m_mask_o.* =  g_stha_m.*
   CALL asti250_stha_t_mask()
   LET g_stha_m_mask_n.* =  g_stha_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL asti250_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stha001_t = g_stha_m.stha001
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stha_m.sthamodid = g_user 
LET g_stha_m.sthamoddt = cl_get_current()
LET g_stha_m.sthamodid_desc = cl_get_username(g_stha_m.sthamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asti250_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stha_t SET (sthamodid,sthamoddt) = (g_stha_m.sthamodid,g_stha_m.sthamoddt)
          WHERE sthaent = g_enterprise AND stha001 = g_stha001_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stha_m.* = g_stha_m_t.*
            CALL asti250_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stha_m.stha001 != g_stha_m_t.stha001
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE sthb_t SET sthb001 = g_stha_m.stha001
 
          WHERE sthbent = g_enterprise AND sthb001 = g_stha_m_t.stha001
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sthb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asti250_set_act_visible()   
   CALL asti250_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sthaent = " ||g_enterprise|| " AND",
                      " stha001 = '", g_stha_m.stha001, "' "
 
   #填到對應位置
   CALL asti250_browser_fill("")
 
   CLOSE asti250_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asti250_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asti250.input" >}
#+ 資料輸入
PRIVATE FUNCTION asti250_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE  r_success            LIKE type_t.num5
   DEFINE r_no          LIKE type_t.chr30
   DEFINE l_oofg_return DYNAMIC ARRAY OF RECORD
                           oofg019    LIKE oofg_t.oofg019,  #field
                           oofg020    LIKE oofg_t.oofg020   #value
                        END RECORD
   DEFINE  l_errno         LIKE type_t.chr10
   DEFINE  l_success       LIKE type_t.num5
   DEFINE  l_count1         LIKE type_t.num5
   
   DEFINE l_sthb002_t DYNAMIC ARRAY OF STRING
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002, 
       g_stha_m.stha002_desc,g_stha_m.stha003,g_stha_m.stha003_desc,g_stha_m.stha004,g_stha_m.stha004_desc, 
       g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha005_desc,g_stha_m.stha006,g_stha_m.stha006_desc, 
       g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp,g_stha_m.sthacrtdp_desc,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamodid_desc,g_stha_m.sthamoddt
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT sthb002,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008,sthb009, 
       sthb010,sthb011 FROM sthb_t WHERE sthbent=? AND sthb001=? AND sthb002=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asti250_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asti250_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL asti250_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002,g_stha_m.stha003, 
       g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asti250.input.head" >}
      #單頭段
      INPUT BY NAME g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002,g_stha_m.stha003, 
          g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_item
            LET g_action_choice="update_item"
            IF cl_auth_chk_act("update_item") THEN
               
               #add-point:ON ACTION update_item name="input.master_input.update_item"
               IF NOT cl_null(g_stha_m.stha001)  THEN
                  CALL n_sthal(g_stha_m.stha001)               
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stha_m.stha001               
                  CALL ap_ref_array2(g_ref_fields," SELECT sthal003 FROM sthal_t WHERE sthalent ='"||g_enterprise||"' AND sthal001 = ? AND sthal002 = '"||g_dlang||"'","")RETURNING g_rtn_fields
                  LET g_stha_m.sthal003 = g_rtn_fields[1]
                  DISPLAY BY NAME g_stha_m.sthal003
               END IF
               #END add-point
            END IF
 
 
 
 
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asti250_cl USING g_enterprise,g_stha_m.stha001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asti250_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asti250_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            LET g_master_multi_table_t.sthal001 = g_stha_m.stha001
LET g_master_multi_table_t.sthal003 = g_stha_m.sthal003
 
            IF l_cmd_t = 'r' THEN
               LET g_master_multi_table_t.sthal001 = ''
LET g_master_multi_table_t.sthal003 = ''
 
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asti250_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL asti250_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthasite
            
            #add-point:AFTER FIELD sthasite name="input.a.sthasite"
            IF NOT cl_null(g_stha_m.sthasite) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.sthasite
               LET g_chkparam.err_str[1] = "aoo-00095:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooef001_13") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            
            IF NOT cl_null(g_stha_m.sthasite) THEN
               CALL s_aooi500_chk(g_prog,'sthasite',g_stha_m.sthasite,g_stha_m.sthasite)
                  RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
            
                  LET g_stha_m.sthasite = g_stha_m_t.sthasite
                  CALL s_desc_get_department_desc(g_stha_m.sthasite)
                     RETURNING g_stha_m.sthasite_desc
                  DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc
                  NEXT FIELD CURRENT
               END IF
            #sakura---add---str---141009-00031#17
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()

               LET g_stha_m.sthasite = g_stha_m_t.sthasite
               CALL s_desc_get_department_desc(g_stha_m.sthasite)
                  RETURNING g_stha_m.sthasite_desc
               DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc
               NEXT FIELD CURRENT            
            #sakura---add---end---141009-00031#17
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.sthasite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.sthasite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.sthasite_desc
            
            LET g_site_flag = TRUE
            CALL asti250_set_entry(p_cmd)
            CALL asti250_set_no_entry(p_cmd)


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthasite
            #add-point:BEFORE FIELD sthasite name="input.b.sthasite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthasite
            #add-point:ON CHANGE sthasite name="input.g.sthasite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha001
            
            #add-point:AFTER FIELD stha001 name="input.a.stha001"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_stha_m.stha001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stha_m.stha001 != g_stha001_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stha_t WHERE "||"sthaent = '" ||g_enterprise|| "' AND "||"stha001 = '"||g_stha_m.stha001 ||"'",'std-00004',0) THEN 
                     LET g_stha_m.stha001 = g_stha001_t
                     NEXT FIELD CURRENT
                  END IF
                  #add--2015/05/19 By geza--(S)
                  IF NOT s_aooi390_chk('34',g_stha_m.stha001) THEN
                     LET g_stha_m.stha001 = g_stha_m_t.stha001
                     NEXT FIELD CURRENT
                  END IF
                  #add--2015/05/19 By geza--(E)
               END IF
            END IF
            LET g_stha_m_o.* = g_stha_m.*
            #add by geza 20150820(S)
            CALL asti250_set_entry(p_cmd)
            CALL asti250_set_no_entry(p_cmd)
            
            IF  NOT cl_null(g_stha_m.stha001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stha_m.stha001 != g_stha001_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stha_t WHERE "||"sthaent = '" ||g_enterprise|| "' AND "||"stha001 = '"||g_stha_m.stha001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

           

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha001
            #add-point:BEFORE FIELD stha001 name="input.b.stha001"
            IF p_cmd = 'a' AND cl_null(g_stha_m.stha001) THEN    
               CALL s_aooi390_gen('34') RETURNING l_success,g_stha_m.stha001,l_oofg_return              
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha001
            #add-point:ON CHANGE stha001 name="input.g.stha001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthal003
            #add-point:BEFORE FIELD sthal003 name="input.b.sthal003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthal003
            
            #add-point:AFTER FIELD sthal003 name="input.a.sthal003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthal003
            #add-point:ON CHANGE sthal003 name="input.g.sthal003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha002
            
            #add-point:AFTER FIELD stha002 name="input.a.stha002"
            IF NOT cl_null(g_stha_m.stha002) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.stha002    #楼栋编号
               LET g_chkparam.arg2 = g_stha_m.sthasite    #归属组织
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhaa001") THEN
                  #檢查成功時後續處理
                  IF NOT cl_null(g_stha_m.stha003) THEN 
                  #應用 a17 樣板自動產生(Version:3)
                     #欄位存在檢查
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
       
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_stha_m.stha003    #楼栋编号
                     LET g_chkparam.arg2 = g_stha_m.stha002    #楼层组织
                        
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_mhab002") THEN
                        #檢查成功時後續處理
                     ELSE
                        #檢查失敗時後續處理
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            
             
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha002
            CALL ap_ref_array2(g_ref_fields,"SELECT mhaal003 FROM mhaal_t WHERE mhaalent='"||g_enterprise||"' AND mhaal001=? AND mhaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha002
            #add-point:BEFORE FIELD stha002 name="input.b.stha002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha002
            #add-point:ON CHANGE stha002 name="input.g.stha002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha003
            
            #add-point:AFTER FIELD stha003 name="input.a.stha003"
            IF NOT cl_null(g_stha_m.stha003) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.stha003    #楼层
               LET g_chkparam.arg2 = g_stha_m.stha002    #楼栋
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhab002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha002
            LET g_ref_fields[2] = g_stha_m.stha003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl001=? AND mhabl002=? AND mhabl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha003
            #add-point:BEFORE FIELD stha003 name="input.b.stha003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha003
            #add-point:ON CHANGE stha003 name="input.g.stha003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha004
            
            #add-point:AFTER FIELD stha004 name="input.a.stha004"
            IF NOT cl_null(g_stha_m.stha004) THEN 
#應用 a19 樣板自動產生(Version:3)
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#               INITIALIZE g_chkparam.* TO NULL
#               #設定g_chkparam.*的參數
#               LET g_chkparam.arg1 = '2144'       #应用分类
#               LET g_chkparam.arg2 = g_stha_m.stha004      #应用分类码
#                  
#               #呼叫檢查存在並帶值的library
##               IF cl_chk_exist_and_ref_val("v_oocq002") THEN
#               IF cl_chk_exist("v_oocq002_01") THEN
#                  #檢查成功時後續處理
#                  #LET  = g_chkparam.return1
#                  #DISPLAY BY NAME 
#               ELSE
#                  #檢查失敗時後續處理
#                  NEXT FIELD CURRENT
#               END IF
              SELECT COUNT(*) INTO l_count1
              FROM oocq_t
              WHERE oocqent = g_enterprise AND oocq001 = '2144' AND oocq002 = g_stha_m.stha004
              
              IF l_count1 = 0 THEN
                 INITIALIZE g_errparam TO NULL
                 LET l_errno = 'ast-00578'
                 LET g_errparam.code = l_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
             END IF
              
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha004
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"'  AND oocql002=? AND oocql001 = '2144' AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha004_desc
            
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha004
            #add-point:BEFORE FIELD stha004 name="input.b.stha004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha004
            #add-point:ON CHANGE stha004 name="input.g.stha004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthadocdt
            #add-point:BEFORE FIELD sthadocdt name="input.b.sthadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthadocdt
            
            #add-point:AFTER FIELD sthadocdt name="input.a.sthadocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthadocdt
            #add-point:ON CHANGE sthadocdt name="input.g.sthadocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha005
            
            #add-point:AFTER FIELD stha005 name="input.a.stha005"
            IF NOT cl_null(g_stha_m.stha005) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.stha005
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stha_m.stha005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha005_desc
            
            IF NOT cl_null(g_stha_m.stha005) THEN
              
               SELECT ooag003 INTO g_stha_m.stha006_desc FROM ooag_t
               WHERE ooag001 = g_stha_m.stha005
               AND ooagent = g_enterprise
               
               SELECT ooefl003,ooefl001 INTO g_stha_m.stha006_desc,g_stha_m.stha006 FROM ooefl_t
               WHERE ooefl001 = g_stha_m.stha006_desc
               AND ooeflent = g_enterprise
               AND ooefl002 = g_dlang
               
               DISPLAY BY NAME g_stha_m.stha006,g_stha_m.stha006_desc
            END IF
              
            IF cl_null(g_stha_m.stha005) THEN
             LET g_stha_m.stha006 = ""
             LET g_stha_m.stha006_desc = ""
             DISPLAY BY NAME g_stha_m.stha006,g_stha_m.stha006_desc
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha005
            #add-point:BEFORE FIELD stha005 name="input.b.stha005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha005
            #add-point:ON CHANGE stha005 name="input.g.stha005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stha006
            
            #add-point:AFTER FIELD stha006 name="input.a.stha006"
            IF NOT cl_null(g_stha_m.stha006) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.stha006
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooeg001_7") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha006
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha006_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stha006
            #add-point:BEFORE FIELD stha006 name="input.b.stha006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stha006
            #add-point:ON CHANGE stha006 name="input.g.stha006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthastus
            #add-point:BEFORE FIELD sthastus name="input.b.sthastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthastus
            
            #add-point:AFTER FIELD sthastus name="input.a.sthastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthastus
            #add-point:ON CHANGE sthastus name="input.g.sthastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sthasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthasite
            #add-point:ON ACTION controlp INFIELD sthasite name="input.c.sthasite"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stha_m.sthasite             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthasite',g_stha_m.sthasite,'i') #150308-00001#3 150309 pomelo add 'i'
            CALL q_ooef001_24()                                #呼叫開窗
 
            LET g_stha_m.sthasite = g_qryparam.return1              

            DISPLAY g_stha_m.sthasite TO sthasite              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.sthasite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.sthasite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.sthasite_desc

            NEXT FIELD sthasite                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stha001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha001
            #add-point:ON ACTION controlp INFIELD stha001 name="input.c.stha001"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            #INITIALIZE g_qryparam.* TO NULL
            #LET g_qryparam.state = 'i'
            #LET g_qryparam.reqry = FALSE
            #LET g_qryparam.default1 = g_stha_m.stha001             #給予default值
            #給予arg
            #LET g_qryparam.arg1 = '34' #
            #CALL q_oofg001_3()                                #呼叫開窗
            #LET g_stha_m.stha001 = g_qryparam.return1              
            #DISPLAY g_stha_m.stha001 TO stha001              #
            #NEXT FIELD stha001                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sthal003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthal003
            #add-point:ON ACTION controlp INFIELD sthal003 name="input.c.sthal003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stha002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha002
            #add-point:ON ACTION controlp INFIELD stha002 name="input.c.stha002"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stha_m.stha002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stha_m.sthasite #

 
            CALL q_mhaa001_1()                                #呼叫開窗
 
            LET g_stha_m.stha002 = g_qryparam.return1      

            IF NOT cl_null(g_stha_m.stha003) THEN 
            #應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.stha003    #楼栋编号
               LET g_chkparam.arg2 = g_stha_m.stha002    #楼层组织
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhab002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF

            DISPLAY g_stha_m.stha002 TO stha002              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha002
            CALL ap_ref_array2(g_ref_fields,"SELECT mhaal003 FROM mhaal_t WHERE mhaalent='"||g_enterprise||"' AND mhaal001=? AND mhaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha002_desc

            NEXT FIELD stha002                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stha003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha003
            #add-point:ON ACTION controlp INFIELD stha003 name="input.c.stha003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            IF NOT cl_null(g_stha_m.stha002) THEN
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_stha_m.stha003             #給予default值
               #給予arg
               LET g_qryparam.arg1 = g_stha_m.stha002 #
               CALL q_mhab002_1()                                #呼叫開窗
               LET g_stha_m.stha003 = g_qryparam.return1   
               DISPLAY g_stha_m.stha003 TO stha003              #
            ELSE
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_stha_m.stha003             #給予default值
               CALL q_mhab002()                                #呼叫開窗
               LET g_stha_m.stha003 = g_qryparam.return1   
               DISPLAY g_stha_m.stha003 TO stha003              #
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha002
            LET g_ref_fields[2] = g_stha_m.stha003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl001=? AND mhabl002=? AND mhabl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha003_desc

            NEXT FIELD stha003                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stha004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha004
            #add-point:ON ACTION controlp INFIELD stha004 name="input.c.stha004"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stha_m.stha004             #給予default值
            LET g_qryparam.default2 = "" #g_stha_m.oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "2144" #s

 
            CALL q_oocq002()                                #呼叫開窗
 
            LET g_stha_m.stha004 = g_qryparam.return1              
            #LET g_stha_m.oocq002 = g_qryparam.return2 
            DISPLAY g_stha_m.stha004 TO stha004              #
            #DISPLAY g_stha_m.oocq002 TO oocq002 #應用分類碼
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha004
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"'  AND oocql002=? AND oocql001 = '2144' AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha004_desc
            
            
            SELECT t1.oocql004 INTO g_stha_m.stha004_desc
            FROM (
                  SELECT DISTINCT  'Y',  oocq002,oocql004,oocql001   
                  FROM  oocq_t LEFT OUTER JOIN oocql_t ON oocq001 = oocql001 AND oocq002 = oocql002 AND oocqent = oocqlent AND oocql003 =g_dlang  
                  WHERE  oocqent = g_enterprise AND oocq001 = '2144'   AND  1=1  AND oocqstus = 'Y'                  
                  ORDER BY oocq002                          
                 ) t1
            WHERE t1.oocq002 = g_stha_m.stha004
            DISPLAY BY NAME g_stha_m.stha004_desc

            NEXT FIELD stha004                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthadocdt
            #add-point:ON ACTION controlp INFIELD sthadocdt name="input.c.sthadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stha005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha005
            #add-point:ON ACTION controlp INFIELD stha005 name="input.c.stha005"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stha_m.stha005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_stha_m.stha005 = g_qryparam.return1              

            DISPLAY g_stha_m.stha005 TO stha005              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stha_m.stha005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha005_desc
            
            IF NOT cl_null(g_stha_m.stha005) THEN
              
               SELECT ooag003 INTO g_stha_m.stha006_desc FROM ooag_t
               WHERE ooag001 = g_stha_m.stha005
               AND ooagent = g_enterprise
               
               SELECT ooefl003,ooefl001 INTO g_stha_m.stha006_desc,g_stha_m.stha006 FROM ooefl_t
               WHERE ooefl001 = g_stha_m.stha006_desc
               AND ooeflent = g_enterprise
               AND ooefl002 = g_dlang
               
               DISPLAY BY NAME g_stha_m.stha006,g_stha_m.stha006_desc
            END IF
              
            IF cl_null(g_stha_m.stha005) THEN
             LET g_stha_m.stha006 = ""
             LET g_stha_m.stha006_desc = ""
             DISPLAY BY NAME g_stha_m.stha006,g_stha_m.stha006_desc
            END IF

            NEXT FIELD stha005                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stha006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stha006
            #add-point:ON ACTION controlp INFIELD stha006 name="input.c.stha006"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stha_m.stha006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooeg001_9()                                #呼叫開窗
 
            LET g_stha_m.stha006 = g_qryparam.return1              

            DISPLAY g_stha_m.stha006 TO stha006              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stha_m.stha006
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stha_m.stha006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stha_m.stha006_desc

            NEXT FIELD stha006                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthastus
            #add-point:ON ACTION controlp INFIELD sthastus name="input.c.sthastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stha_m.stha001
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi390_get_auto_no('34',g_stha_m.stha001) RETURNING l_success,g_stha_m.stha001

               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               CALL s_aooi390_oofi_upd('34',g_stha_m.stha001) RETURNING l_success  #增加編碼功能
               
               #end add-point
               
               INSERT INTO stha_t (sthaent,sthasite,stha001,stha002,stha003,stha004,sthadocdt,stha005, 
                   stha006,sthastus,sthaownid,sthaowndp,sthacrtid,sthacrtdp,sthacrtdt,sthamodid,sthamoddt) 
 
               VALUES (g_enterprise,g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002,g_stha_m.stha003, 
                   g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
                   g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
                   g_stha_m.sthamodid,g_stha_m.sthamoddt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stha_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
                        INITIALIZE l_var_keys TO NULL 
         INITIALIZE l_field_keys TO NULL 
         INITIALIZE l_vars TO NULL 
         INITIALIZE l_fields TO NULL 
         IF g_stha_m.stha001 = g_master_multi_table_t.sthal001 AND
         g_stha_m.sthal003 = g_master_multi_table_t.sthal003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthalent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stha_m.stha001
            LET l_field_keys[02] = 'sthal001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.sthal001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthal002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stha_m.sthal003
            LET l_fields[01] = 'sthal003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthal_t')
         END IF 
 
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asti250_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asti250_b_fill()
                  CALL asti250_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL asti250_stha_t_mask_restore('restore_mask_o')
               
               UPDATE stha_t SET (sthasite,stha001,stha002,stha003,stha004,sthadocdt,stha005,stha006, 
                   sthastus,sthaownid,sthaowndp,sthacrtid,sthacrtdp,sthacrtdt,sthamodid,sthamoddt) = (g_stha_m.sthasite, 
                   g_stha_m.stha001,g_stha_m.stha002,g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt, 
                   g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaowndp, 
                   g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt,g_stha_m.sthamodid,g_stha_m.sthamoddt) 
 
                WHERE sthaent = g_enterprise AND stha001 = g_stha001_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stha_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
                        INITIALIZE l_var_keys TO NULL 
         INITIALIZE l_field_keys TO NULL 
         INITIALIZE l_vars TO NULL 
         INITIALIZE l_fields TO NULL 
         IF g_stha_m.stha001 = g_master_multi_table_t.sthal001 AND
         g_stha_m.sthal003 = g_master_multi_table_t.sthal003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthalent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stha_m.stha001
            LET l_field_keys[02] = 'sthal001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.sthal001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthal002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stha_m.sthal003
            LET l_fields[01] = 'sthal003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthal_t')
         END IF 
 
               
               #將遮罩欄位進行遮蔽
               CALL asti250_stha_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stha_m_t)
               LET g_log2 = util.JSON.stringify(g_stha_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stha001_t = g_stha_m.stha001
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asti250.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sthb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asti250_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sthb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asti250_cl USING g_enterprise,g_stha_m.stha001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asti250_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asti250_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sthb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthb_d[l_ac].sthb002 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sthb_d_t.* = g_sthb_d[l_ac].*  #BACKUP
               LET g_sthb_d_o.* = g_sthb_d[l_ac].*  #BACKUP
               CALL asti250_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL asti250_set_no_entry_b(l_cmd)
               IF NOT asti250_lock_b("sthb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asti250_bcl INTO g_sthb_d[l_ac].sthb002,g_sthb_d[l_ac].sthb003,g_sthb_d[l_ac].sthb012, 
                      g_sthb_d[l_ac].sthb004,g_sthb_d[l_ac].sthb005,g_sthb_d[l_ac].sthb006,g_sthb_d[l_ac].sthb007, 
                      g_sthb_d[l_ac].sthb008,g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb011 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sthb_d_t.sthb002,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthb_d_mask_o[l_ac].* =  g_sthb_d[l_ac].*
                  CALL asti250_sthb_t_mask()
                  LET g_sthb_d_mask_n[l_ac].* =  g_sthb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asti250_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sthb_d[l_ac].* TO NULL 
            INITIALIZE g_sthb_d_t.* TO NULL 
            INITIALIZE g_sthb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_sthb_d[l_ac].sthb006 = "Y"
      LET g_sthb_d[l_ac].sthb009 = "1"
      LET g_sthb_d[l_ac].sthb011 = "N"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_sthb_d_t.* = g_sthb_d[l_ac].*     #新輸入資料
            LET g_sthb_d_o.* = g_sthb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asti250_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL asti250_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthb_d[li_reproduce_target].* = g_sthb_d[li_reproduce].*
 
               LET g_sthb_d[li_reproduce_target].sthb002 = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            #160510-00010#2   2016/05/14  by pengxin add(S)
            IF cl_null(g_sthb_d[l_ac].sthb009) THEN
               LET g_sthb_d[l_ac].sthb009 = 1
            END IF
            #160510-00010#2   2016/05/14  by pengxin add(E)
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sthb_t 
             WHERE sthbent = g_enterprise AND sthb001 = g_stha_m.stha001
 
               AND sthb002 = g_sthb_d[l_ac].sthb002
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stha_m.stha001
               LET gs_keys[2] = g_sthb_d[g_detail_idx].sthb002
               CALL asti250_insert_b('sthb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sthb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asti250_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stha_m.stha001
 
               LET gs_keys[gs_keys.getLength()+1] = g_sthb_d_t.sthb002
 
            
               #刪除同層單身
               IF NOT asti250_delete_b('sthb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asti250_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asti250_key_delete_b(gs_keys,'sthb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asti250_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asti250_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_sthb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb002
            
            #add-point:AFTER FIELD sthb002 name="input.a.page1.sthb002"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_stha_m.stha001 IS NOT NULL AND g_sthb_d[g_detail_idx].sthb002 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stha_m.stha001 != g_stha001_t OR g_sthb_d[g_detail_idx].sthb002 != g_sthb_d_t.sthb002)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthb_t WHERE "||"sthbent = '" ||g_enterprise|| "' AND "||"sthb001 = '"||g_stha_m.stha001 ||"' AND "|| "sthb002 = '"||g_sthb_d[g_detail_idx].sthb002 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


           
            
            IF NOT cl_null(g_sthb_d[l_ac].sthb002) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sthb_d[l_ac].sthb002

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_stae001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthb_d[l_ac].sthb002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthb_d[l_ac].sthb002_desc
            
            #160510-00010#2   add(S)
            #新增时自动从asti203带出 sthb009,sthb010,sthb010_desc,sthb005
            IF  g_stha_m.stha001 IS NOT NULL AND g_sthb_d[g_detail_idx].sthb002 IS NOT NULL THEN 
               IF l_cmd = 'a' AND cl_null(l_sthb002_t[l_ac]) THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
#                  SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#                  FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'a' AND g_sthb_d[l_ac].sthb002 != l_sthb002_t[l_ac] THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  
                  IF cl_null(g_sthb_d[l_ac].sthb010) THEN
                     LET g_sthb_d[l_ac].sthb010_desc = ''
                  END IF
                  
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'u' AND cl_null(l_sthb002_t[l_ac]) THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
#                  SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#                  FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'u' AND g_sthb_d[l_ac].sthb002 != l_sthb002_t[l_ac] THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  
                  IF cl_null(g_sthb_d[l_ac].sthb010) THEN
                     LET g_sthb_d[l_ac].sthb010_desc = ''
                  END IF
                  
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
            END IF
            
            
            IF g_sthb_d[l_ac].sthb009!='1' THEN
               CALL cl_set_comp_entry('sthb010',TRUE)
            ELSE
               CALL cl_set_comp_entry('sthb010',FALSE)
            END IF
            #160510-00010#2   add(E)


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb002
            #add-point:BEFORE FIELD sthb002 name="input.b.page1.sthb002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb002
            #add-point:ON CHANGE sthb002 name="input.g.page1.sthb002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb003
            
            #add-point:AFTER FIELD sthb003 name="input.a.page1.sthb003"
            IF NOT cl_null(g_sthb_d[l_ac].sthb003) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sthb_d[l_ac].sthb003

                  
               #呼叫檢查存在並帶值的library
#               IF cl_chk_exist("v_ooib002") THEN
               IF cl_chk_exist("v_staa001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthb_d[l_ac].sthb003
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthb_d[l_ac].sthb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthb_d[l_ac].sthb003_desc
            


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb003
            #add-point:BEFORE FIELD sthb003 name="input.b.page1.sthb003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb003
            #add-point:ON CHANGE sthb003 name="input.g.page1.sthb003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb012
            
            #add-point:AFTER FIELD sthb012 name="input.a.page1.sthb012"
            IF NOT cl_null(g_sthb_d[l_ac].sthb012) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stha_m.sthasite
               LET g_chkparam.arg2 = g_sthb_d[l_ac].sthb012
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_oodb002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            CALL s_desc_get_tax_desc1(g_stha_m.sthasite,g_sthb_d[l_ac].sthb012)  RETURNING g_sthb_d[l_ac].sthb012_desc #add by geza 20160615


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb012
            #add-point:BEFORE FIELD sthb012 name="input.b.page1.sthb012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb012
            #add-point:ON CHANGE sthb012 name="input.g.page1.sthb012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb004
            #add-point:BEFORE FIELD sthb004 name="input.b.page1.sthb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb004
            
            #add-point:AFTER FIELD sthb004 name="input.a.page1.sthb004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb004
            #add-point:ON CHANGE sthb004 name="input.g.page1.sthb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb005
            #add-point:BEFORE FIELD sthb005 name="input.b.page1.sthb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb005
            
            #add-point:AFTER FIELD sthb005 name="input.a.page1.sthb005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb005
            #add-point:ON CHANGE sthb005 name="input.g.page1.sthb005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb006
            #add-point:BEFORE FIELD sthb006 name="input.b.page1.sthb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb006
            
            #add-point:AFTER FIELD sthb006 name="input.a.page1.sthb006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb006
            #add-point:ON CHANGE sthb006 name="input.g.page1.sthb006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb007
            #add-point:BEFORE FIELD sthb007 name="input.b.page1.sthb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb007
            
            #add-point:AFTER FIELD sthb007 name="input.a.page1.sthb007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb007
            #add-point:ON CHANGE sthb007 name="input.g.page1.sthb007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sthb_d[l_ac].sthb008,"0","1","31","1","azz-00087",1) THEN
               NEXT FIELD sthb008
            END IF 
 
 
 
            #add-point:AFTER FIELD sthb008 name="input.a.page1.sthb008"
            IF NOT cl_null(g_sthb_d[l_ac].sthb008) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb008
            #add-point:BEFORE FIELD sthb008 name="input.b.page1.sthb008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb008
            #add-point:ON CHANGE sthb008 name="input.g.page1.sthb008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb009
            #add-point:BEFORE FIELD sthb009 name="input.b.page1.sthb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb009
            
            #add-point:AFTER FIELD sthb009 name="input.a.page1.sthb009"
            IF cl_null(g_sthb_d[l_ac].sthb009) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00749'      #费用归属类型不可唯恐
               LET g_errparam.extend = g_sthb_d[l_ac].sthb009
               LET g_errparam.popup = TRUE
               CALL cl_err() 
               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb009
            #add-point:ON CHANGE sthb009 name="input.g.page1.sthb009"
            CALL asti250_set_entry_b("u")
            CALL asti250_set_no_entry_b("u")    #如果费用归属类型为1,关闭费用归属组织和带值栏位
            IF g_sthb_d[l_ac].sthb009 != 2 OR cl_null(g_sthb_d[l_ac].sthb009) THEN
               LET g_sthb_d[l_ac].sthb010 = ''
               LET g_sthb_d[l_ac].sthb010_desc = ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb010_desc
            END IF
            #如果费用归属类型为1,费用归属组织为单头site,并带值    #160510-00010#11  add(S)
            IF g_sthb_d[l_ac].sthb009 = 1 OR cl_null(g_sthb_d[l_ac].sthb009) THEN
               LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sthb_d[l_ac].sthb010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sthb_d[l_ac].sthb010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb010_desc
            END IF
            #160510-00010#11  add(E)
            #如果费用类型不为1，改变类型时，费用归属组织和带值栏位清空   #160510-00010#11  add(S)
            IF g_sthb_d[l_ac].sthb009 != 1 OR cl_null(g_sthb_d[l_ac].sthb009) THEN
               LET g_sthb_d[l_ac].sthb010 = ''
               LET g_sthb_d[l_ac].sthb010_desc = ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb010_desc
            END IF
            #160510-00010#11  add(E)
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb010
            
            #add-point:AFTER FIELD sthb010 name="input.a.page1.sthb010"
            IF NOT cl_null(g_sthb_d[l_ac].sthb010) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sthb_d[l_ac].sthb010

               IF  g_sthb_d[l_ac].sthb009 = '2' THEN  #160510-00010#11  add   费用归属类型为2时的栏位校验
                  #161024-00025#1--mark--s
#                  #呼叫檢查存在並帶值的library
#                  IF cl_chk_exist("v_ooef001") THEN
#                     #檢查成功時後續處理
#                  ELSE
#                     #檢查失敗時後續處理
#                     NEXT FIELD CURRENT
#                  END IF
                  #161024-00025#1--mark--e
                  #161024-00025#1--add--s
                  IF s_aooi500_setpoint(g_prog,'sthb010') THEN
                     CALL s_aooi500_chk(g_prog,'sthb010',g_sthb_d[l_ac].sthb010,g_stha_m.sthasite) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = g_sthb_d[l_ac].sthb010
                        LET g_errparam.code   = l_errno
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                     
                        LET g_sthb_d[l_ac].sthb010 = g_sthb_d_t.sthb010
                        CALL s_desc_get_department_desc(g_sthb_d[l_ac].sthb010) RETURNING g_sthb_d[l_ac].sthb010_desc
                        DISPLAY BY NAME g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb010_desc
                        NEXT FIELD CURRENT
                     END IF
                  ELSE
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_ooef001") THEN
                        #檢查成功時後續處理
                     ELSE
                        #檢查失敗時後續處理
                        LET g_sthb_d[l_ac].sthb010 = g_sthb_d_t.sthb010
                        CALL s_desc_get_department_desc(g_sthb_d[l_ac].sthb010) RETURNING g_sthb_d[l_ac].sthb010_desc
                        DISPLAY BY NAME g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb010_desc
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  #161024-00025#1--add--e
               END IF
               
               IF g_sthb_d[l_ac].sthb009 = '3' THEN   #160510-00010#11  add   费用归属类型为3时的栏位校验
                  LET g_errshow = TRUE
                  LET g_chkparam.err_str[1] = "apm-00024:apm-01098"
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_pmaa001_1") THEN
                     #檢查成功時後續處理
                  ELSE
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF


            END IF 
            
            IF g_sthb_d[l_ac].sthb009 = '2' THEN
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sthb_d[l_ac].sthb010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sthb_d[l_ac].sthb010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
            END IF
            
            IF g_sthb_d[l_ac].sthb009 = '3' THEN
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sthb_d[l_ac].sthb010
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sthb_d[l_ac].sthb010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb010
            #add-point:BEFORE FIELD sthb010 name="input.b.page1.sthb010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb010
            #add-point:ON CHANGE sthb010 name="input.g.page1.sthb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthb011
            #add-point:BEFORE FIELD sthb011 name="input.b.page1.sthb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthb011
            
            #add-point:AFTER FIELD sthb011 name="input.a.page1.sthb011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthb011
            #add-point:ON CHANGE sthb011 name="input.g.page1.sthb011"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sthb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb002
            #add-point:ON ACTION controlp INFIELD sthb002 name="input.c.page1.sthb002"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthb_d[l_ac].sthb002             #給予default值
            LET g_qryparam.default2 = "" #g_sthb_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_sthb_d[l_ac].stael004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_stae001()                                #呼叫開窗
 
            LET g_sthb_d[l_ac].sthb002 = g_qryparam.return1              
            #LET g_sthb_d[l_ac].stael003 = g_qryparam.return2 
            #LET g_sthb_d[l_ac].stael004 = g_qryparam.return3 
            DISPLAY g_sthb_d[l_ac].sthb002 TO sthb002              #
            #DISPLAY g_sthb_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_sthb_d[l_ac].stael004 TO stael004 #助記碼
            
            SELECT t1.stael003 INTO g_sthb_d[l_ac].sthb002_desc
            FROM (
                  SELECT DISTINCT stae001,stael003,stael004
                  FROM stae_t LEFT OUTER JOIN stael_t ON staeent = staelent AND stae001 = stael001 AND stael002 = g_dlang
                  WHERE staeent = g_enterprise AND staestus = 'Y'
                  ORDER BY stae001   
                 ) t1
            WHERE t1.stae001 = g_sthb_d[l_ac].sthb002
            DISPLAY BY NAME g_sthb_d[l_ac].sthb002_desc
            
            #160510-00010#2   add(S)
            #新增时自动从asti203带出 sthb009,sthb010,sthb010_desc,sthb005
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
#            CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
#            LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
#            LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
#            LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
#            DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
#            
#            SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#            FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
#            DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
            
            IF  g_stha_m.stha001 IS NOT NULL AND g_sthb_d[g_detail_idx].sthb002 IS NOT NULL THEN 
               IF l_cmd = 'a' AND cl_null(l_sthb002_t[l_ac]) THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
#                  SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#                  FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
#                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'a' AND g_sthb_d[l_ac].sthb002 != l_sthb002_t[l_ac] THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  IF cl_null(g_sthb_d[l_ac].sthb010) THEN
                     LET g_sthb_d[l_ac].sthb010_desc = ''
                  END IF
                  
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'u' AND cl_null(l_sthb002_t[l_ac]) THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
#                  SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#                  FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
               IF l_cmd = 'u' AND g_sthb_d[l_ac].sthb002 != l_sthb002_t[l_ac] THEN
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthb_d[l_ac].sthb002
                  CALL ap_ref_array2(g_ref_fields,"SELECT stae013,stae014,stae005 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
                  LET g_sthb_d[l_ac].sthb009 = '', g_rtn_fields[1] , ''
                  LET g_sthb_d[l_ac].sthb010 = '', g_rtn_fields[2] , ''
                  LET g_sthb_d[l_ac].sthb005 = '', g_rtn_fields[3] , ''
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010,g_sthb_d[l_ac].sthb005
                  
#                  SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
#                  FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  IF g_sthb_d[l_ac].sthb009 = 1 THEN
                     LET g_sthb_d[l_ac].sthb010 = g_stha_m.sthasite
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                     DISPLAY BY NAME g_sthb_d[l_ac].sthb010
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 2 THEN
                     SELECT ooefl003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM ooefl_t WHERE ooeflent= g_enterprise  AND ooefl001 = g_sthb_d[l_ac].sthb010 AND ooefl002= g_dlang
                  END IF
                  IF g_sthb_d[l_ac].sthb009 = 3 THEN
                     SELECT pmaal003 INTO g_sthb_d[l_ac].sthb010_desc
                     FROM pmaal_t WHERE pmaalent= g_enterprise  AND pmaal001 = g_sthb_d[l_ac].sthb010 AND pmaal002= g_dlang
                  END IF
                  IF cl_null(g_sthb_d[l_ac].sthb010) THEN
                     LET g_sthb_d[l_ac].sthb010_desc = ''
                  END IF
                  
                  DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
                  
                  LET l_sthb002_t[l_ac] = g_sthb_d[l_ac].sthb002
               END IF
            END IF
            
            
            IF g_sthb_d[l_ac].sthb009!='1' THEN
               CALL cl_set_comp_entry('sthb010',TRUE)
            ELSE
               CALL cl_set_comp_entry('sthb010',FALSE)
            END IF
            #160510-00010#2   add(E)
            NEXT FIELD sthb002                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb003
            #add-point:ON ACTION controlp INFIELD sthb003 name="input.c.page1.sthb003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthb_d[l_ac].sthb003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
#            CALL q_ooib002_1()                                #呼叫開窗
            CALL q_staa001()
 
            LET g_sthb_d[l_ac].sthb003 = g_qryparam.return1              

            DISPLAY g_sthb_d[l_ac].sthb003 TO sthb003              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthb_d[l_ac].sthb003
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthb_d[l_ac].sthb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthb_d[l_ac].sthb003_desc
            
#            SELECT t1.staal003 INTO g_sthb_d[l_ac].sthb003_desc
#            FROM (
#                  SELECT DISTINCT staa001,staal003
#                  FROM staa_t LEFT OUTER JOIN staal_t ON staa001 = staal001 AND staaent=staalent AND staaent=g_enterprise  AND  staal002 = g_dlang
#                  WHERE staaent = g_enterprise AND 1=1 AND staastus='Y'
#                  ORDER BY staa001                          
#                 ) t1
#            WHERE t1.staa001 = g_sthb_d[l_ac].sthb003
#            DISPLAY BY NAME g_sthb_d[l_ac].sthb003_desc

            NEXT FIELD sthb003                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb012
            #add-point:ON ACTION controlp INFIELD sthb012 name="input.c.page1.sthb012"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthb_d[l_ac].sthb012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stha_m.sthasite

 
            CALL q_oodb002_1()                                #呼叫開窗
 
            LET g_sthb_d[l_ac].sthb012 = g_qryparam.return1              

            DISPLAY g_sthb_d[l_ac].sthb012 TO sthb012              #

            NEXT FIELD sthb012                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb004
            #add-point:ON ACTION controlp INFIELD sthb004 name="input.c.page1.sthb004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb005
            #add-point:ON ACTION controlp INFIELD sthb005 name="input.c.page1.sthb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb006
            #add-point:ON ACTION controlp INFIELD sthb006 name="input.c.page1.sthb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb007
            #add-point:ON ACTION controlp INFIELD sthb007 name="input.c.page1.sthb007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb008
            #add-point:ON ACTION controlp INFIELD sthb008 name="input.c.page1.sthb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb009
            #add-point:ON ACTION controlp INFIELD sthb009 name="input.c.page1.sthb009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb010
            #add-point:ON ACTION controlp INFIELD sthb010 name="input.c.page1.sthb010"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            IF g_sthb_d[l_ac].sthb009 = '2' THEN
               LET g_qryparam.default1 = g_sthb_d[l_ac].sthb010             #給予default值
               LET g_qryparam.default2 = "" #g_sthb_d[l_ac].ooef001 #组织编号
               #給予arg
               LET g_qryparam.arg1 = "" #s
   
               #161024-00025#1--add--s
               IF s_aooi500_setpoint(g_prog,'sthb010') THEN
                  LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthb010',g_stha_m.sthasite,'i')  
                  CALL q_ooef001_24()
               ELSE
                  CALL q_ooef001()                                #呼叫開窗
               END IF
               #161024-00025#1--add--e
               #CALL q_ooef001()                                #呼叫開窗   #161024-00025#1 mark
    
               LET g_sthb_d[l_ac].sthb010 = g_qryparam.return1              
               #LET g_sthb_d[l_ac].ooef001 = g_qryparam.return2 
               DISPLAY g_sthb_d[l_ac].sthb010 TO sthb010              #
               #DISPLAY g_sthb_d[l_ac].ooef001 TO ooef001 #组织编号
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sthb_d[l_ac].sthb010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sthb_d[l_ac].sthb010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
            END IF
            IF g_sthb_d[l_ac].sthb009 = '3' THEN
               #給予arg
               LET g_qryparam.arg1 = "" #s
   
    
               CALL q_pmaa001_10()                                #呼叫開窗
    
               LET g_sthb_d[l_ac].sthb010 = g_qryparam.return1              
               #LET g_sthb_d[l_ac].ooef001 = g_qryparam.return2 
               DISPLAY g_sthb_d[l_ac].sthb010 TO sthb010              #
               #DISPLAY g_sthb_d[l_ac].ooef001 TO ooef001 #组织编号
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sthb_d[l_ac].sthb010
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sthb_d[l_ac].sthb010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_sthb_d[l_ac].sthb010_desc
            END IF 
            
            NEXT FIELD sthb010                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthb011
            #add-point:ON ACTION controlp INFIELD sthb011 name="input.c.page1.sthb011"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sthb_d[l_ac].* = g_sthb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asti250_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sthb_d[l_ac].sthb002 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sthb_d[l_ac].* = g_sthb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asti250_sthb_t_mask_restore('restore_mask_o')
      
               UPDATE sthb_t SET (sthb001,sthb002,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008, 
                   sthb009,sthb010,sthb011) = (g_stha_m.stha001,g_sthb_d[l_ac].sthb002,g_sthb_d[l_ac].sthb003, 
                   g_sthb_d[l_ac].sthb012,g_sthb_d[l_ac].sthb004,g_sthb_d[l_ac].sthb005,g_sthb_d[l_ac].sthb006, 
                   g_sthb_d[l_ac].sthb007,g_sthb_d[l_ac].sthb008,g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010, 
                   g_sthb_d[l_ac].sthb011)
                WHERE sthbent = g_enterprise AND sthb001 = g_stha_m.stha001 
 
                  AND sthb002 = g_sthb_d_t.sthb002 #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sthb_d[l_ac].* = g_sthb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sthb_d[l_ac].* = g_sthb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stha_m.stha001
               LET gs_keys_bak[1] = g_stha001_t
               LET gs_keys[2] = g_sthb_d[g_detail_idx].sthb002
               LET gs_keys_bak[2] = g_sthb_d_t.sthb002
               CALL asti250_update_b('sthb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asti250_sthb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sthb_d[g_detail_idx].sthb002 = g_sthb_d_t.sthb002 
 
                  ) THEN
                  LET gs_keys[01] = g_stha_m.stha001
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sthb_d_t.sthb002
 
                  CALL asti250_key_update_b(gs_keys,'sthb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stha_m),util.JSON.stringify(g_sthb_d_t)
               LET g_log2 = util.JSON.stringify(g_stha_m),util.JSON.stringify(g_sthb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL asti250_unlock_b("sthb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sthb_d[li_reproduce_target].* = g_sthb_d[li_reproduce].*
 
               LET g_sthb_d[li_reproduce_target].sthb002 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="asti250.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            NEXT FIELD sthasite        #add by pengxin  20160328  新增时光标先放在组织栏位
            #end add-point  
            NEXT FIELD stha001
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sthb002
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
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
         #add-point:input段accept  name="input.accept"
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asti250_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asti250_b_fill() #單身填充
      CALL asti250_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asti250_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stha_m.stha001
   CALL ap_ref_array2(g_ref_fields," SELECT sthal003 FROM sthal_t WHERE sthalent = '"||g_enterprise||"' AND sthal001 = ? AND sthal002 = '"||g_dlang||"'","") RETURNING g_rtn_fields 
   LET g_stha_m.sthal003 = g_rtn_fields[1] 
   DISPLAY g_stha_m.sthal003 TO sthal003
   #end add-point
   
   #遮罩相關處理
   LET g_stha_m_mask_o.* =  g_stha_m.*
   CALL asti250_stha_t_mask()
   LET g_stha_m_mask_n.* =  g_stha_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002, 
       g_stha_m.stha002_desc,g_stha_m.stha003,g_stha_m.stha003_desc,g_stha_m.stha004,g_stha_m.stha004_desc, 
       g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha005_desc,g_stha_m.stha006,g_stha_m.stha006_desc, 
       g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp,g_stha_m.sthacrtdp_desc,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamodid_desc,g_stha_m.sthamoddt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stha_m.sthastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sthb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"

#   INITIALIZE g_ref_fields TO NULL 
#   LET g_ref_fields[1] = g_stha_m.stha001
#   LET g_ref_fields[2] = g_sthb_d[l_ac].sthb002
#   CALL ap_ref_array2(g_ref_fields," SELECT staa001 FROM staa_t WHERE staaent = '"||g_enterprise||"' AND staa001 = ? ","") RETURNING g_rtn_fields 
#   LET g_sthb_d[l_ac].staa001 = g_rtn_fields[1] 
#   DISPLAY BY NAME g_sthb_d[l_ac].staa001
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asti250_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asti250_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asti250_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stha_t.stha001 
   DEFINE l_oldno     LIKE stha_t.stha001 
 
   DEFINE l_master    RECORD LIKE stha_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sthb_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_success     LIKE type_t.num5   #sakura add  
   DEFINE l_insert      LIKE type_t.num5   #sakura add
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   LET g_master_insert = FALSE
   
   IF g_stha_m.stha001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stha001_t = g_stha_m.stha001
 
    
   LET g_stha_m.stha001 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stha_m.sthaownid = g_user
      LET g_stha_m.sthaowndp = g_dept
      LET g_stha_m.sthacrtid = g_user
      LET g_stha_m.sthacrtdp = g_dept 
      LET g_stha_m.sthacrtdt = cl_get_current()
      LET g_stha_m.sthamodid = g_user
      LET g_stha_m.sthamoddt = cl_get_current()
      LET g_stha_m.sthastus = 'Y'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   CALL s_aooi500_default(g_prog,'sthasite',g_stha_m.sthasite)
      RETURNING l_insert,g_stha_m.sthasite
   IF NOT l_insert THEN
      RETURN
   END IF
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stha_m.sthastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL asti250_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stha_m.* TO NULL
      INITIALIZE g_sthb_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asti250_show()
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asti250_set_act_visible()   
   CALL asti250_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stha001_t = g_stha_m.stha001
 
   
   #組合新增資料的條件
   LET g_add_browse = " sthaent = " ||g_enterprise|| " AND",
                      " stha001 = '", g_stha_m.stha001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asti250_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL asti250_idx_chk()
   
   LET g_data_owner = g_stha_m.sthaownid      
   LET g_data_dept  = g_stha_m.sthaowndp
   
   #功能已完成,通報訊息中心
   CALL asti250_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asti250_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sthb_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asti250_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sthb_t
    WHERE sthbent = g_enterprise AND sthb001 = g_stha001_t
 
    INTO TEMP asti250_detail
 
   #將key修正為調整後   
   UPDATE asti250_detail 
      #更新key欄位
      SET sthb001 = g_stha_m.stha001
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sthb_t SELECT * FROM asti250_detail
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asti250_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stha001_t = g_stha_m.stha001
 
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asti250_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stha_m.stha001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   LET g_master_multi_table_t.sthal001 = g_stha_m.stha001
LET g_master_multi_table_t.sthal003 = g_stha_m.sthal003
 
   
   CALL s_transaction_begin()
 
   OPEN asti250_cl USING g_enterprise,g_stha_m.stha001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asti250_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asti250_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
   
   #檢查是否允許此動作
   IF NOT asti250_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stha_m_mask_o.* =  g_stha_m.*
   CALL asti250_stha_t_mask()
   LET g_stha_m_mask_n.* =  g_stha_m.*
   
   CALL asti250_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asti250_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stha001_t = g_stha_m.stha001
 
 
      DELETE FROM stha_t
       WHERE sthaent = g_enterprise AND stha001 = g_stha_m.stha001
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stha_m.stha001,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM sthb_t
       WHERE sthbent = g_enterprise AND sthb001 = g_stha_m.stha001
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stha_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asti250_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sthb_d.clear() 
 
     
      CALL asti250_ui_browser_refresh()  
      #CALL asti250_ui_headershow()  
      #CALL asti250_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      INITIALIZE l_var_keys_bak TO NULL 
   INITIALIZE l_field_keys   TO NULL 
   LET l_var_keys_bak[01] = g_enterprise
   LET l_field_keys[01] = 'sthalent'
   LET l_var_keys_bak[02] = g_master_multi_table_t.sthal001
   LET l_field_keys[02] = 'sthal001'
   CALL cl_multitable_delete(l_field_keys,l_var_keys_bak,'sthal_t')
 
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asti250_browser_fill("")
         CALL asti250_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asti250_cl
 
   #功能已完成,通報訊息中心
   CALL asti250_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asti250.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asti250_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sthb_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF asti250_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sthb002,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008, 
             sthb009,sthb010,sthb011 ,t1.stael003 ,t2.staal003 ,t3.oodbl004 ,t4.ooefl003 FROM sthb_t", 
                
                     " INNER JOIN stha_t ON sthaent = " ||g_enterprise|| " AND stha001 = sthb001 ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=sthb002 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t2 ON t2.staalent="||g_enterprise||" AND t2.staal001=sthb003 AND t2.staal002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t3 ON t3.oodblent="||g_enterprise||" AND t3.oodbl002=sthb012 AND t3.oodbl003='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=sthb010 AND t4.ooefl002='"||g_dlang||"' ",
 
                     " WHERE sthbent=? AND sthb001=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         #add by geza 20160615(S)
         LET g_sql = "SELECT  DISTINCT sthb002,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008, 
             sthb009,sthb010,sthb011 ,t1.stael003 ,t2.staal003 ,'' ,t4.ooefl003 FROM sthb_t", 
                
                     " INNER JOIN stha_t ON sthaent = '" ||g_enterprise|| "' AND stha001 = sthb001 ",
 
                     #"",
                     
                     "",
                                    " LEFT JOIN stael_t t1 ON t1.staelent='"||g_enterprise||"' AND t1.stael001=sthb002 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t2 ON t2.staalent='"||g_enterprise||"' AND t2.staal001=sthb003 AND t2.staal002='"||g_dlang||"' ", 
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent='"||g_enterprise||"' AND t4.ooefl001=sthb010 AND t4.ooefl002='"||g_dlang||"' ",
 
                     " WHERE sthbent=? AND sthb001=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add by geza 20160615(E)
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sthb_t.sthb002"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asti250_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asti250_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stha_m.stha001   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stha_m.stha001 INTO g_sthb_d[l_ac].sthb002,g_sthb_d[l_ac].sthb003, 
          g_sthb_d[l_ac].sthb012,g_sthb_d[l_ac].sthb004,g_sthb_d[l_ac].sthb005,g_sthb_d[l_ac].sthb006, 
          g_sthb_d[l_ac].sthb007,g_sthb_d[l_ac].sthb008,g_sthb_d[l_ac].sthb009,g_sthb_d[l_ac].sthb010, 
          g_sthb_d[l_ac].sthb011,g_sthb_d[l_ac].sthb002_desc,g_sthb_d[l_ac].sthb003_desc,g_sthb_d[l_ac].sthb012_desc, 
          g_sthb_d[l_ac].sthb010_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         IF g_sthb_d[l_ac].sthb009 = '3' THEN
            CALL s_desc_get_trading_partner_full_desc(g_sthb_d[l_ac].sthb010) RETURNING g_sthb_d[l_ac].sthb010_desc
         END IF
         CALL s_desc_get_tax_desc1(g_stha_m.sthasite,g_sthb_d[l_ac].sthb012)  RETURNING g_sthb_d[l_ac].sthb012_desc #add by geza 20160615
         #end add-point
      
         IF l_ac > g_max_rec THEN
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF
            EXIT FOREACH
         END IF
         
         LET l_ac = l_ac + 1
      END FOREACH
      LET g_error_show = 0
   
   END IF
    
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_sthb_d.deleteElement(g_sthb_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asti250_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sthb_d.getLength()
      LET g_sthb_d_mask_o[l_ac].* =  g_sthb_d[l_ac].*
      CALL asti250_sthb_t_mask()
      LET g_sthb_d_mask_n[l_ac].* =  g_sthb_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asti250_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM sthb_t
       WHERE sthbent = g_enterprise AND
         sthb001 = ps_keys_bak[1] AND sthb002 = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sthb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asti250_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO sthb_t
                  (sthbent,
                   sthb001,
                   sthb002
                   ,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008,sthb009,sthb010,sthb011) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sthb_d[g_detail_idx].sthb003,g_sthb_d[g_detail_idx].sthb012,g_sthb_d[g_detail_idx].sthb004, 
                       g_sthb_d[g_detail_idx].sthb005,g_sthb_d[g_detail_idx].sthb006,g_sthb_d[g_detail_idx].sthb007, 
                       g_sthb_d[g_detail_idx].sthb008,g_sthb_d[g_detail_idx].sthb009,g_sthb_d[g_detail_idx].sthb010, 
                       g_sthb_d[g_detail_idx].sthb011)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sthb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asti250_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE   
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL asti250_sthb_t_mask_restore('restore_mask_o')
               
      UPDATE sthb_t 
         SET (sthb001,
              sthb002
              ,sthb003,sthb012,sthb004,sthb005,sthb006,sthb007,sthb008,sthb009,sthb010,sthb011) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sthb_d[g_detail_idx].sthb003,g_sthb_d[g_detail_idx].sthb012,g_sthb_d[g_detail_idx].sthb004, 
                  g_sthb_d[g_detail_idx].sthb005,g_sthb_d[g_detail_idx].sthb006,g_sthb_d[g_detail_idx].sthb007, 
                  g_sthb_d[g_detail_idx].sthb008,g_sthb_d[g_detail_idx].sthb009,g_sthb_d[g_detail_idx].sthb010, 
                  g_sthb_d[g_detail_idx].sthb011) 
         WHERE sthbent = g_enterprise AND sthb001 = ps_keys_bak[1] AND sthb002 = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asti250_sthb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asti250_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asti250_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asti250_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL asti250_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sthb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asti250_bcl USING g_enterprise,
                                       g_stha_m.stha001,g_sthb_d[g_detail_idx].sthb002     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asti250_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asti250_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asti250_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asti250_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stha001",TRUE)
      CALL cl_set_comp_entry("sthadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("sthadocdt",TRUE)
   CALL cl_set_comp_entry("sthasite",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asti250_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stha001",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      IF NOT s_aooi500_comp_entry(g_prog,'sthasite') OR g_site_flag THEN     #OR g_site_flag
         CALL cl_set_comp_entry("sthasite",FALSE)
      END IF
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sthadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'a' AND g_chkey = 'N' THEN
      #CALL cl_set_comp_entry("stha001",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      IF NOT s_aooi500_comp_entry(g_prog,'sthasite') OR g_site_flag THEN     
         CALL cl_set_comp_entry("sthasite",FALSE)
      END IF
      #end add-point 
   END IF 
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asti250_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry('sthb010',TRUE)    #160510-00010#1 add
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asti250_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   #160510-00010#2 add(S)
#   IF g_sthb_d[l_ac].sthb009 != '2'  THEN             #160510-00010#2  add      #160510-00010#11  mark
   IF g_sthb_d[l_ac].sthb009 = '1'  THEN     #160510-00010#11  add
      CALL cl_set_comp_entry('sthb010',FALSE)      
   END IF
   #160510-00010#2 add(E)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asti250_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asti250_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
#   IF g_stha_m.sthastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
#      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
#   END IF
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asti250_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asti250.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asti250_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asti250.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asti250_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " stha001 = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      
      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stha_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sthb_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
 
            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF
         
            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF
    
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
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
 
{<section id="asti250.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asti250_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stha_m.stha001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asti250_cl USING g_enterprise,g_stha_m.stha001
   IF STATUS THEN
      CLOSE asti250_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asti250_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001,g_stha_m.stha002, 
       g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006,g_stha_m.sthastus, 
       g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc,g_stha_m.stha003_desc, 
       g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc
   
 
   #檢查是否允許此動作
   IF NOT asti250_action_chk() THEN
      CLOSE asti250_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002, 
       g_stha_m.stha002_desc,g_stha_m.stha003,g_stha_m.stha003_desc,g_stha_m.stha004,g_stha_m.stha004_desc, 
       g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha005_desc,g_stha_m.stha006,g_stha_m.stha006_desc, 
       g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp,g_stha_m.sthaowndp_desc, 
       g_stha_m.sthacrtid,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp,g_stha_m.sthacrtdp_desc,g_stha_m.sthacrtdt, 
       g_stha_m.sthamodid,g_stha_m.sthamodid_desc,g_stha_m.sthamoddt
 
   CASE g_stha_m.sthastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stha_m.sthastus
            
            WHEN "N"
               HIDE OPTION "inactive"
            WHEN "Y"
               HIDE OPTION "active"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      
      #end add-point
      
      
	  
      ON ACTION inactive
         IF cl_auth_chk_act("inactive") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.inactive"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION active
         IF cl_auth_chk_act("active") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.active"
            
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      ) OR 
      g_stha_m.sthastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asti250_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stha_m.sthamodid = g_user
   LET g_stha_m.sthamoddt = cl_get_current()
   LET g_stha_m.sthastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stha_t 
      SET (sthastus,sthamodid,sthamoddt) 
        = (g_stha_m.sthastus,g_stha_m.sthamodid,g_stha_m.sthamoddt)     
    WHERE sthaent = g_enterprise AND stha001 = g_stha_m.stha001
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE asti250_master_referesh USING g_stha_m.stha001 INTO g_stha_m.sthasite,g_stha_m.stha001, 
          g_stha_m.stha002,g_stha_m.stha003,g_stha_m.stha004,g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha006, 
          g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaowndp,g_stha_m.sthacrtid,g_stha_m.sthacrtdp, 
          g_stha_m.sthacrtdt,g_stha_m.sthamodid,g_stha_m.sthamoddt,g_stha_m.sthasite_desc,g_stha_m.stha002_desc, 
          g_stha_m.stha003_desc,g_stha_m.stha004_desc,g_stha_m.stha005_desc,g_stha_m.stha006_desc,g_stha_m.sthaownid_desc, 
          g_stha_m.sthaowndp_desc,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp_desc,g_stha_m.sthamodid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stha_m.sthasite,g_stha_m.sthasite_desc,g_stha_m.stha001,g_stha_m.sthal003,g_stha_m.stha002, 
          g_stha_m.stha002_desc,g_stha_m.stha003,g_stha_m.stha003_desc,g_stha_m.stha004,g_stha_m.stha004_desc, 
          g_stha_m.sthadocdt,g_stha_m.stha005,g_stha_m.stha005_desc,g_stha_m.stha006,g_stha_m.stha006_desc, 
          g_stha_m.sthastus,g_stha_m.sthaownid,g_stha_m.sthaownid_desc,g_stha_m.sthaowndp,g_stha_m.sthaowndp_desc, 
          g_stha_m.sthacrtid,g_stha_m.sthacrtid_desc,g_stha_m.sthacrtdp,g_stha_m.sthacrtdp_desc,g_stha_m.sthacrtdt, 
          g_stha_m.sthamodid,g_stha_m.sthamodid_desc,g_stha_m.sthamoddt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE asti250_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asti250_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asti250.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asti250_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sthb_d.getLength() THEN
         LET g_detail_idx = g_sthb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sthb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sthb_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asti250_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL asti250_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asti250_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asti250.status_show" >}
PRIVATE FUNCTION asti250_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asti250.mask_functions" >}
&include "erp/ast/asti250_mask.4gl"
 
{</section>}
 
{<section id="asti250.signature" >}
   
 
{</section>}
 
{<section id="asti250.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asti250_set_pk_array()
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
   LET g_pk_array[1].values = g_stha_m.stha001
   LET g_pk_array[1].column = 'stha001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asti250.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asti250.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asti250_msgcentre_notify(lc_state)
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
   CALL asti250_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stha_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asti250.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asti250_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asti250.other_function" readonly="Y" >}

 
{</section>}
 
