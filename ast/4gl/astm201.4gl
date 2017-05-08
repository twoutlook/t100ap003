#該程式未解開Section, 採用最新樣板產出!
{<section id="astm201.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0016(2016-07-05 11:55:18), PR版次:0016(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000485
#+ Filename...: astm201
#+ Description: 合約模板維護作業
#+ Creator....: 01533(2013-10-08 14:02:12)
#+ Modifier...: 02159 -SD/PR- 00000
 
{</section>}
 
{<section id="astm201.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#37   2016/04/19 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160816-00068#15 2016/08/18 By earl    調整transaction
#160818-00017#38 2016-08-24 By 08734   删除修改未重新判断状态码
#160905-00007#15 2016/09/05 by 08172   调整系统中无ENT的SQL条件增加ent
#170124-00012#1  2017/01/24 by 02749   舊值備份變數調整
#170203-00017#1  2017/02/03 by 02749   調整費用編號不可重複判斷與處理方式  
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
PRIVATE type type_g_stag_m        RECORD
       stagunit LIKE stag_t.stagunit, 
   stagunit_desc LIKE type_t.chr80, 
   stag001 LIKE stag_t.stag001, 
   stagl003 LIKE stagl_t.stagl003, 
   stagl004 LIKE stagl_t.stagl004, 
   stag002 LIKE stag_t.stag002, 
   stag003 LIKE stag_t.stag003, 
   stag003_desc LIKE type_t.chr80, 
   stag004 LIKE stag_t.stag004, 
   stag004_desc LIKE type_t.chr80, 
   stag005 LIKE stag_t.stag005, 
   stag005_desc LIKE type_t.chr80, 
   stag006 LIKE stag_t.stag006, 
   stag006_desc LIKE type_t.chr80, 
   stag007 LIKE stag_t.stag007, 
   stag007_desc LIKE type_t.chr80, 
   stagstus LIKE stag_t.stagstus, 
   stagownid LIKE stag_t.stagownid, 
   stagownid_desc LIKE type_t.chr80, 
   stagowndp LIKE stag_t.stagowndp, 
   stagowndp_desc LIKE type_t.chr80, 
   stagcrtid LIKE stag_t.stagcrtid, 
   stagcrtid_desc LIKE type_t.chr80, 
   stagcrtdp LIKE stag_t.stagcrtdp, 
   stagcrtdp_desc LIKE type_t.chr80, 
   stagcrtdt LIKE stag_t.stagcrtdt, 
   stagmodid LIKE stag_t.stagmodid, 
   stagmodid_desc LIKE type_t.chr80, 
   stagmoddt LIKE stag_t.stagmoddt, 
   stagcnfid LIKE stag_t.stagcnfid, 
   stagcnfid_desc LIKE type_t.chr80, 
   stagcnfdt LIKE stag_t.stagcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stah_d        RECORD
       stah002 LIKE stah_t.stah002, 
   stah003 LIKE stah_t.stah003, 
   stah003_desc LIKE type_t.chr500, 
   stah017 LIKE stah_t.stah017, 
   stah004 LIKE stah_t.stah004, 
   stah005 LIKE stah_t.stah005, 
   stah006 LIKE stah_t.stah006, 
   stah007 LIKE stah_t.stah007, 
   stah008 LIKE stah_t.stah008, 
   stah009 LIKE stah_t.stah009, 
   stah009_desc LIKE type_t.chr500, 
   stah010 LIKE stah_t.stah010, 
   stah010_desc LIKE type_t.chr500, 
   stah011 LIKE stah_t.stah011, 
   stah012 LIKE stah_t.stah012, 
   stah013 LIKE stah_t.stah013, 
   stah014 LIKE stah_t.stah014, 
   stah015 LIKE stah_t.stah015, 
   stah016 LIKE stah_t.stah016
       END RECORD
PRIVATE TYPE type_g_stah3_d RECORD
       stbq002 LIKE stbq_t.stbq002, 
   stbq003 LIKE stbq_t.stbq003, 
   stbq003_desc LIKE type_t.chr500, 
   stbq004 LIKE stbq_t.stbq004, 
   stbq004_desc LIKE type_t.chr500, 
   stbq004_desc_desc LIKE type_t.chr500, 
   stbq005 LIKE stbq_t.stbq005, 
   stbq006 LIKE stbq_t.stbq006, 
   stbq007 LIKE stbq_t.stbq007, 
   stbq008 LIKE stbq_t.stbq008, 
   stbq009 LIKE stbq_t.stbq009, 
   stbq010 LIKE stbq_t.stbq010, 
   stbq011 LIKE stbq_t.stbq011, 
   stbq011_desc LIKE type_t.chr500, 
   stbq012 LIKE stbq_t.stbq012, 
   stbq013 LIKE stbq_t.stbq013, 
   stbq014 LIKE stbq_t.stbq014, 
   stbq015 LIKE stbq_t.stbq015, 
   stbq015_desc LIKE type_t.chr500
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stag001 LIKE stag_t.stag001
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_stai_d        RECORD
    stai003 LIKE stai_t.stai003, 
    stai004 LIKE stai_t.stai004, 
    stai005 LIKE stai_t.stai005, 
    stai006 LIKE stai_t.stai006
       END RECORD
DEFINE g_stai_d        DYNAMIC ARRAY OF type_g_stai_d  
DEFINE g_stai_d_t      type_g_stai_d
DEFINE l_ac2           LIKE type_t.num5
DEFINE g_rec_b2        LIKE type_t.num5
DEFINE g_wc_stai          STRING

#end add-point
       
#模組變數(Module Variables)
DEFINE g_stag_m          type_g_stag_m
DEFINE g_stag_m_t        type_g_stag_m
DEFINE g_stag_m_o        type_g_stag_m
DEFINE g_stag_m_mask_o   type_g_stag_m #轉換遮罩前資料
DEFINE g_stag_m_mask_n   type_g_stag_m #轉換遮罩後資料
 
   DEFINE g_stag001_t LIKE stag_t.stag001
 
 
DEFINE g_stah_d          DYNAMIC ARRAY OF type_g_stah_d
DEFINE g_stah_d_t        type_g_stah_d
DEFINE g_stah_d_o        type_g_stah_d
DEFINE g_stah_d_mask_o   DYNAMIC ARRAY OF type_g_stah_d #轉換遮罩前資料
DEFINE g_stah_d_mask_n   DYNAMIC ARRAY OF type_g_stah_d #轉換遮罩後資料
DEFINE g_stah3_d          DYNAMIC ARRAY OF type_g_stah3_d
DEFINE g_stah3_d_t        type_g_stah3_d
DEFINE g_stah3_d_o        type_g_stah3_d
DEFINE g_stah3_d_mask_o   DYNAMIC ARRAY OF type_g_stah3_d #轉換遮罩前資料
DEFINE g_stah3_d_mask_n   DYNAMIC ARRAY OF type_g_stah3_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
DEFINE g_master_multi_table_t    RECORD
      stagl001 LIKE stagl_t.stagl001,
      stagl003 LIKE stagl_t.stagl003,
      stagl004 LIKE stagl_t.stagl004
      END RECORD
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
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
 
{<section id="astm201.main" >}
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
   LET g_forupd_sql = " SELECT stagunit,'',stag001,'','',stag002,stag003,'',stag004,'',stag005,'',stag006, 
       '',stag007,'',stagstus,stagownid,'',stagowndp,'',stagcrtid,'',stagcrtdp,'',stagcrtdt,stagmodid, 
       '',stagmoddt,stagcnfid,'',stagcnfdt", 
                      " FROM stag_t",
                      " WHERE stagent= ? AND stag001=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm201_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stagunit,t0.stag001,t0.stag002,t0.stag003,t0.stag004,t0.stag005, 
       t0.stag006,t0.stag007,t0.stagstus,t0.stagownid,t0.stagowndp,t0.stagcrtid,t0.stagcrtdp,t0.stagcrtdt, 
       t0.stagmodid,t0.stagmoddt,t0.stagcnfid,t0.stagcnfdt,t1.ooefl003 ,t2.ooibl004 ,t3.staal003 ,t4.oocql004 , 
       t5.ooail003 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 ,t11.ooag011",
               " FROM stag_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stagunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooibl_t t2 ON t2.ooiblent="||g_enterprise||" AND t2.ooibl002=t0.stag003 AND t2.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN staal_t t3 ON t3.staalent="||g_enterprise||" AND t3.staal001=t0.stag004 AND t3.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2060' AND t4.oocql002=t0.stag005 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t5 ON t5.ooailent="||g_enterprise||" AND t5.ooail001=t0.stag006 AND t5.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stagownid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stagowndp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stagcrtid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stagcrtdp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stagmodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stagcnfid  ",
 
               " WHERE t0.stagent = " ||g_enterprise|| " AND t0.stag001 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astm201_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astm201 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astm201_init()   
 
      #進入選單 Menu (="N")
      CALL astm201_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astm201
      
   END IF 
   
   CLOSE astm201_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astm201.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astm201_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stagstus','50','N,Y,X')
 
      CALL cl_set_combo_scc('stag002','6013') 
   CALL cl_set_combo_scc('stah005','6006') 
   CALL cl_set_combo_scc('stah006','6007') 
   CALL cl_set_combo_scc('stah007','6008') 
   CALL cl_set_combo_scc('stah008','6009') 
   CALL cl_set_combo_scc('stah013','6010') 
   CALL cl_set_combo_scc('stah016','6011') 
   CALL cl_set_combo_scc('stbq005','6096') 
   CALL cl_set_combo_scc('stbq006','6097') 
   CALL cl_set_combo_scc('stbq012','6098') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   CALL astm201_set_comp_visible_b('1')   #160513-00033#1 160525 by sakura add
   #end add-point
   
   #初始化搜尋條件
   CALL astm201_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astm201.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astm201_ui_dialog()
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
 
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL astm201_insert()
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
         INITIALIZE g_stag_m.* TO NULL
         CALL g_stah_d.clear()
         CALL g_stah3_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astm201_init()
      END IF
   
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
    
         DISPLAY ARRAY g_stah_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm201_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
                              CALL astm201_b2_fill()
               CALL astm201_reflesh()
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
               CALL astm201_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION detail_qrystr
               MENU "" ATTRIBUTE(STYLE="popup")
                  #add-point:ON ACTION detail_qrystr相關動作 name="menu.detail_show.page1_sub.detail_qrystr"
                  
                  #END add-point
                                 #應用 a43 樣板自動產生(Version:4)
               ON ACTION prog_asti203
                  LET g_action_choice="prog_asti203"
                  IF cl_auth_chk_act("prog_asti203") THEN
                     
                     #add-point:ON ACTION prog_asti203 name="menu.detail_show.page1_sub.prog_asti203"
               #+ 此段落由子樣板a41產生
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'asti203'
               LET la_param.param[1] = g_stah_d[l_ac].stah003

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)


                     #END add-point
                     
                  END IF
 
 
 
 
               END MENU
 
 
 
               #add-point:ON ACTION detail_qrystr name="menu.detail_show.page1.detail_qrystr"
               
               #END add-point
 
 
 
 
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stah3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm201_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body3.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astm201_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body3.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
                   DISPLAY ARRAY g_stai_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b2) #page1  
    
            BEFORE ROW
               CALL astm201_idx_chk2()
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx2 = l_ac2
               
               #add-point:page1, before row動作

               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx2)
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               CALL astm201_idx_chk2()
               LET g_current_page = 2
               
            #自訂ACTION(detail_show,page_1)
            

            #add-point:page1自定義行為
            
            #end add-point
               
         END DISPLAY
         #end add-point
         
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astm201_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            
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
               CALL astm201_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astm201_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astm201_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
         
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astm201_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astm201_set_act_visible()   
            CALL astm201_set_act_no_visible()
            IF NOT (g_stag_m.stag001 IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stagent = " ||g_enterprise|| " AND",
                                  " stag001 = '", g_stag_m.stag001, "' "
 
               #填到對應位置
               CALL astm201_browser_fill("")
            END IF
         
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stag_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stah_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbq_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL astm201_browser_fill("F")   #browser_fill()會將notice區塊清空
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stag_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stah_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbq_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astm201_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astm201_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
          
         
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astm201_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm201_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astm201_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm201_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astm201_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm201_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astm201_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm201_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astm201_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm201_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stah_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stah3_d)
                  LET g_export_id[2]   = "s_detail3"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  LET g_export_node[2] = base.typeInfo.create(g_stai_d)
                  LET g_export_id[2]   = "s_detail2"
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
               CALL astm201_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astm201_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astm201_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astm201_insert()
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
               CALL astm201_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astm201_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stag004
            LET g_action_choice="prog_stag004"
            IF cl_auth_chk_act("prog_stag004") THEN
               
               #add-point:ON ACTION prog_stag004 name="menu.prog_stag004"
               
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astm201_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astm201_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astm201_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
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
 
{<section id="astm201.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astm201_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
      CALL g_stai_d.clear()
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   IF g_wc = " 1=2" THEN
      LET g_wc = " 1=1"
   END IF
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
      LET l_sub_sql = " SELECT DISTINCT stag001 ",
                      " FROM stag_t ",
                      " ",
                      " LEFT JOIN stah_t ON stahent = stagent AND stag001 = stah001 ", "  ",
                      #add-point:browser_fill段sql(stah_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stbq_t ON stbqent = stagent AND stag001 = stbq001", "  ",
                      #add-point:browser_fill段sql(stbq_t1) name="browser_fill.cnt.join.stbq_t1"
                      
                      #end add-point
 
 
 
                      " LEFT JOIN stagl_t ON staglent = "||g_enterprise||" AND stag001 = stagl001 AND stagl002 = '",g_dlang,"' ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stagent = " ||g_enterprise|| " AND stahent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stag_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stag001 ",
                      " FROM stag_t ", 
                      "  ",
                      "  LEFT JOIN stagl_t ON staglent = "||g_enterprise||" AND stag001 = stagl001 AND stagl002 = '",g_dlang,"' ",
                      " WHERE stagent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stag_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
       IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT UNIQUE stag001 ",

                        " FROM stag_t ",
                              " ",
                              " LEFT JOIN stah_t ON stahent = stagent AND stag001 = stah001 ",
                              
                              " LEFT JOIN stai_t ON staient = stahent AND stah001 = stai001 AND stah002 = stai002",


                              " LEFT JOIN stagl_t ON stag001 = stagl001 AND stagl002 = '",g_lang,"' ", 
                              " ", 
                       " WHERE stagent = '" ||g_enterprise|| "' AND stahent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2
 
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT UNIQUE stag001 ",

                        " FROM stag_t ", 
                              " ",
                              " LEFT JOIN stagl_t ON stag001 = stagl001 AND stagl002 = '",g_lang,"' ",
                        "WHERE stagent = '" ||g_enterprise|| "' AND ",l_wc CLIPPED
 
   END IF
   
#   LET g_sql = " SELECT COUNT(*) FROM (",l_sub_sql,")"  #160905-00007#15  by 08172
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"   #160905-00007#15  by 08172
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
      INITIALIZE g_stag_m.* TO NULL
      CALL g_stah_d.clear()        
      CALL g_stah3_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stag001 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stagstus,t0.stag001 ",
                  " FROM stag_t t0",
                  "  ",
                  "  LEFT JOIN stah_t ON stahent = stagent AND stag001 = stah001 ", "  ", 
                  #add-point:browser_fill段sql(stah_t1) name="browser_fill.join.stah_t1"
                  
                  #end add-point
                  "  LEFT JOIN stbq_t ON stbqent = stagent AND stag001 = stbq001", "  ", 
                  #add-point:browser_fill段sql(stbq_t1) name="browser_fill.join.stbq_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                  
               " LEFT JOIN stagl_t ON staglent = "||g_enterprise||" AND stag001 = stagl001 AND stagl002 = '",g_dlang,"' ",
                  " WHERE t0.stagent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stag_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stagstus,t0.stag001 ",
                  " FROM stag_t t0",
                  "  ",
                  
               " LEFT JOIN stagl_t ON staglent = "||g_enterprise||" AND stag001 = stagl001 AND stagl002 = '",g_dlang,"' ",
                  " WHERE t0.stagent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stag_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stag001 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
        #單身有輸入查詢條件且非null
   IF g_wc2 <> " 1=1" AND NOT cl_null(g_wc2) THEN 
      #依照stag001 Browser欄位定義(取代原本bs_sql功能)
      LET l_sql_rank = "SELECT DISTINCT stagstus,stag001,DENSE_RANK() OVER(ORDER BY stag001 ",g_order,") AS RANK ",
                        " FROM stag_t ",
                              " ",
                              " LEFT JOIN stah_t ON stahent = stagent AND stag001 = stah001 ",
                              " LEFT JOIN stai_t ON staient = stahent AND stah001 = stai001 AND stah002 = stai002",
                               
                              " LEFT JOIN stagl_t ON stag001 = stagl001 AND stagl002 = '",g_lang,"' ",
                              " ",
                       " ",
                       " WHERE stagent = '" ||g_enterprise|| "' AND ",g_wc," AND ",g_wc2
   ELSE
      #單身無輸入資料
      LET l_sql_rank = "SELECT DISTINCT stagstus,stag001,DENSE_RANK() OVER(ORDER BY stag001 ",g_order,") AS RANK ",
                       " FROM stag_t ",
                            "  ",
                            "  LEFT JOIN stagl_t ON stag001 = stagl001 AND stagl002 = '",g_lang,"' ",
                       " WHERE stagent = '" ||g_enterprise|| "' AND ", g_wc
   END IF
   
   #定義翻頁CURSOR
   LET g_sql= "SELECT stagstus,stag001 FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY stag001 ",g_order
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stag_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
   
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stag001
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
      
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/open.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/valid.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/void.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_stag001) THEN
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
   CALL astm201_set_act_visible()   
   CALL astm201_set_act_no_visible()
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astm201_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stag_m.stag001 = g_browser[g_current_idx].b_stag001   
 
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
   CALL astm201_stag_t_mask()
   CALL astm201_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astm201.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astm201_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astm201_ui_browser_refresh()
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
      IF g_browser[l_i].b_stag001 = g_stag_m.stag001 
 
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
 
{<section id="astm201.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astm201_construct()
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
      CALL g_stai_d.clear()
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stag_m.* TO NULL
   CALL g_stah_d.clear()        
   CALL g_stah3_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stagunit,stag001,stagl003,stagl004,stag002,stag003,stag004,stag005,stag006, 
          stag007,stag007_desc,stagstus,stagownid,stagowndp,stagcrtid,stagcrtdp,stagcrtdt,stagmodid, 
          stagmoddt,stagcnfid,stagcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stagcrtdt>>----
         AFTER FIELD stagcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stagmoddt>>----
         AFTER FIELD stagmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stagcnfdt>>----
         AFTER FIELD stagcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stagpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagunit
            #add-point:BEFORE FIELD stagunit name="construct.b.stagunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagunit
            
            #add-point:AFTER FIELD stagunit name="construct.a.stagunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagunit
            #add-point:ON ACTION controlp INFIELD stagunit name="construct.c.stagunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			#LET g_qryparam.arg1 = '2'
#			  LET g_qryparam.where = "ooef201 = 'Y'"
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stagunit',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stagunit  #顯示到畫面上

            NEXT FIELD stagunit
            #END add-point
 
 
         #Ctrlp:construct.c.stag001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag001
            #add-point:ON ACTION controlp INFIELD stag001 name="construct.c.stag001"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag001  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stagl003 #說明 

            NEXT FIELD stag001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag001
            #add-point:BEFORE FIELD stag001 name="construct.b.stag001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag001
            
            #add-point:AFTER FIELD stag001 name="construct.a.stag001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagl003
            #add-point:BEFORE FIELD stagl003 name="construct.b.stagl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagl003
            
            #add-point:AFTER FIELD stagl003 name="construct.a.stagl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagl003
            #add-point:ON ACTION controlp INFIELD stagl003 name="construct.c.stagl003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagl004
            #add-point:BEFORE FIELD stagl004 name="construct.b.stagl004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagl004
            
            #add-point:AFTER FIELD stagl004 name="construct.a.stagl004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagl004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagl004
            #add-point:ON ACTION controlp INFIELD stagl004 name="construct.c.stagl004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag002
            #add-point:BEFORE FIELD stag002 name="construct.b.stag002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag002
            
            #add-point:AFTER FIELD stag002 name="construct.a.stag002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag002
            #add-point:ON ACTION controlp INFIELD stag002 name="construct.c.stag002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag003
            #add-point:BEFORE FIELD stag003 name="construct.b.stag003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag003
            
            #add-point:AFTER FIELD stag003 name="construct.a.stag003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag003
            #add-point:ON ACTION controlp INFIELD stag003 name="construct.c.stag003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_ooib002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag003  #顯示到畫面上

            NEXT FIELD stag003                     #返回原欄位 
            #END add-point
 
 
         #Ctrlp:construct.c.stag004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag004
            #add-point:ON ACTION controlp INFIELD stag004 name="construct.c.stag004"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag004  #顯示到畫面上

            NEXT FIELD stag004                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag004
            #add-point:BEFORE FIELD stag004 name="construct.b.stag004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag004
            
            #add-point:AFTER FIELD stag004 name="construct.a.stag004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag005
            #add-point:ON ACTION controlp INFIELD stag005 name="construct.c.stag005"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = "2060"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag005  #顯示到畫面上

            NEXT FIELD stag005                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag005
            #add-point:BEFORE FIELD stag005 name="construct.b.stag005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag005
            
            #add-point:AFTER FIELD stag005 name="construct.a.stag005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag006
            #add-point:ON ACTION controlp INFIELD stag006 name="construct.c.stag006"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag006  #顯示到畫面上

            NEXT FIELD stag006                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag006
            #add-point:BEFORE FIELD stag006 name="construct.b.stag006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag006
            
            #add-point:AFTER FIELD stag006 name="construct.a.stag006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag007
            #add-point:ON ACTION controlp INFIELD stag007 name="construct.c.stag007"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = g_site
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stag007  #顯示到畫面上

            NEXT FIELD stag007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag007
            #add-point:BEFORE FIELD stag007 name="construct.b.stag007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag007
            
            #add-point:AFTER FIELD stag007 name="construct.a.stag007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag007_desc
            #add-point:BEFORE FIELD stag007_desc name="construct.b.stag007_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag007_desc
            
            #add-point:AFTER FIELD stag007_desc name="construct.a.stag007_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stag007_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag007_desc
            #add-point:ON ACTION controlp INFIELD stag007_desc name="construct.c.stag007_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagstus
            #add-point:BEFORE FIELD stagstus name="construct.b.stagstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagstus
            
            #add-point:AFTER FIELD stagstus name="construct.a.stagstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagstus
            #add-point:ON ACTION controlp INFIELD stagstus name="construct.c.stagstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stagownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagownid
            #add-point:ON ACTION controlp INFIELD stagownid name="construct.c.stagownid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagownid  #顯示到畫面上

            NEXT FIELD stagownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagownid
            #add-point:BEFORE FIELD stagownid name="construct.b.stagownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagownid
            
            #add-point:AFTER FIELD stagownid name="construct.a.stagownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagowndp
            #add-point:ON ACTION controlp INFIELD stagowndp name="construct.c.stagowndp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagowndp  #顯示到畫面上

            NEXT FIELD stagowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagowndp
            #add-point:BEFORE FIELD stagowndp name="construct.b.stagowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagowndp
            
            #add-point:AFTER FIELD stagowndp name="construct.a.stagowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagcrtid
            #add-point:ON ACTION controlp INFIELD stagcrtid name="construct.c.stagcrtid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagcrtid  #顯示到畫面上

            NEXT FIELD stagcrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagcrtid
            #add-point:BEFORE FIELD stagcrtid name="construct.b.stagcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagcrtid
            
            #add-point:AFTER FIELD stagcrtid name="construct.a.stagcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stagcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagcrtdp
            #add-point:ON ACTION controlp INFIELD stagcrtdp name="construct.c.stagcrtdp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagcrtdp  #顯示到畫面上

            NEXT FIELD stagcrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagcrtdp
            #add-point:BEFORE FIELD stagcrtdp name="construct.b.stagcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagcrtdp
            
            #add-point:AFTER FIELD stagcrtdp name="construct.a.stagcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagcrtdt
            #add-point:BEFORE FIELD stagcrtdt name="construct.b.stagcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stagmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagmodid
            #add-point:ON ACTION controlp INFIELD stagmodid name="construct.c.stagmodid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagmodid  #顯示到畫面上

            NEXT FIELD stagmodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagmodid
            #add-point:BEFORE FIELD stagmodid name="construct.b.stagmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagmodid
            
            #add-point:AFTER FIELD stagmodid name="construct.a.stagmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagmoddt
            #add-point:BEFORE FIELD stagmoddt name="construct.b.stagmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stagcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagcnfid
            #add-point:ON ACTION controlp INFIELD stagcnfid name="construct.c.stagcnfid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stagcnfid  #顯示到畫面上

            NEXT FIELD stagcnfid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagcnfid
            #add-point:BEFORE FIELD stagcnfid name="construct.b.stagcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagcnfid
            
            #add-point:AFTER FIELD stagcnfid name="construct.a.stagcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagcnfdt
            #add-point:BEFORE FIELD stagcnfdt name="construct.b.stagcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stah002,stah003,stah017,stah004,stah005,stah006,stah007,stah008,stah009, 
          stah010,stah011,stah012,stah013,stah014,stah015,stah016
           FROM s_detail1[1].stah002,s_detail1[1].stah003,s_detail1[1].stah017,s_detail1[1].stah004, 
               s_detail1[1].stah005,s_detail1[1].stah006,s_detail1[1].stah007,s_detail1[1].stah008,s_detail1[1].stah009, 
               s_detail1[1].stah010,s_detail1[1].stah011,s_detail1[1].stah012,s_detail1[1].stah013,s_detail1[1].stah014, 
               s_detail1[1].stah015,s_detail1[1].stah016
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah002
            #add-point:BEFORE FIELD stah002 name="construct.b.page1.stah002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah002
            
            #add-point:AFTER FIELD stah002 name="construct.a.page1.stah002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah002
            #add-point:ON ACTION controlp INFIELD stah002 name="construct.c.page1.stah002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stah003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah003
            #add-point:ON ACTION controlp INFIELD stah003 name="construct.c.page1.stah003"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stah003  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stael003 #說明 
               #DISPLAY g_qryparam.return3 TO stae001 #費用編號 

            NEXT FIELD stah003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah003
            #add-point:BEFORE FIELD stah003 name="construct.b.page1.stah003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah003
            
            #add-point:AFTER FIELD stah003 name="construct.a.page1.stah003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah017
            #add-point:BEFORE FIELD stah017 name="construct.b.page1.stah017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah017
            
            #add-point:AFTER FIELD stah017 name="construct.a.page1.stah017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah017
            #add-point:ON ACTION controlp INFIELD stah017 name="construct.c.page1.stah017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah004
            #add-point:BEFORE FIELD stah004 name="construct.b.page1.stah004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah004
            
            #add-point:AFTER FIELD stah004 name="construct.a.page1.stah004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah004
            #add-point:ON ACTION controlp INFIELD stah004 name="construct.c.page1.stah004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah005
            #add-point:BEFORE FIELD stah005 name="construct.b.page1.stah005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah005
            
            #add-point:AFTER FIELD stah005 name="construct.a.page1.stah005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah005
            #add-point:ON ACTION controlp INFIELD stah005 name="construct.c.page1.stah005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah006
            #add-point:BEFORE FIELD stah006 name="construct.b.page1.stah006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah006
            
            #add-point:AFTER FIELD stah006 name="construct.a.page1.stah006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah006
            #add-point:ON ACTION controlp INFIELD stah006 name="construct.c.page1.stah006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah007
            #add-point:BEFORE FIELD stah007 name="construct.b.page1.stah007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah007
            
            #add-point:AFTER FIELD stah007 name="construct.a.page1.stah007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah007
            #add-point:ON ACTION controlp INFIELD stah007 name="construct.c.page1.stah007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah008
            #add-point:BEFORE FIELD stah008 name="construct.b.page1.stah008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah008
            
            #add-point:AFTER FIELD stah008 name="construct.a.page1.stah008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah008
            #add-point:ON ACTION controlp INFIELD stah008 name="construct.c.page1.stah008"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stah009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah009
            #add-point:ON ACTION controlp INFIELD stah009 name="construct.c.page1.stah009"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stah009  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stah009                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah009
            #add-point:BEFORE FIELD stah009 name="construct.b.page1.stah009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah009
            
            #add-point:AFTER FIELD stah009 name="construct.a.page1.stah009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah010
            #add-point:ON ACTION controlp INFIELD stah010 name="construct.c.page1.stah010"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stah010  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stah010                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah010
            #add-point:BEFORE FIELD stah010 name="construct.b.page1.stah010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah010
            
            #add-point:AFTER FIELD stah010 name="construct.a.page1.stah010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah011
            #add-point:BEFORE FIELD stah011 name="construct.b.page1.stah011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah011
            
            #add-point:AFTER FIELD stah011 name="construct.a.page1.stah011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah011
            #add-point:ON ACTION controlp INFIELD stah011 name="construct.c.page1.stah011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah012
            #add-point:BEFORE FIELD stah012 name="construct.b.page1.stah012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah012
            
            #add-point:AFTER FIELD stah012 name="construct.a.page1.stah012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah012
            #add-point:ON ACTION controlp INFIELD stah012 name="construct.c.page1.stah012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah013
            #add-point:BEFORE FIELD stah013 name="construct.b.page1.stah013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah013
            
            #add-point:AFTER FIELD stah013 name="construct.a.page1.stah013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah013
            #add-point:ON ACTION controlp INFIELD stah013 name="construct.c.page1.stah013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah014
            #add-point:BEFORE FIELD stah014 name="construct.b.page1.stah014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah014
            
            #add-point:AFTER FIELD stah014 name="construct.a.page1.stah014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah014
            #add-point:ON ACTION controlp INFIELD stah014 name="construct.c.page1.stah014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah015
            #add-point:BEFORE FIELD stah015 name="construct.b.page1.stah015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah015
            
            #add-point:AFTER FIELD stah015 name="construct.a.page1.stah015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah015
            #add-point:ON ACTION controlp INFIELD stah015 name="construct.c.page1.stah015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah016
            #add-point:BEFORE FIELD stah016 name="construct.b.page1.stah016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah016
            
            #add-point:AFTER FIELD stah016 name="construct.a.page1.stah016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stah016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah016
            #add-point:ON ACTION controlp INFIELD stah016 name="construct.c.page1.stah016"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stbq002,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009,stbq010, 
          stbq011,stbq012,stbq013,stbq014,stbq015
           FROM s_detail3[1].stbq002,s_detail3[1].stbq003,s_detail3[1].stbq004,s_detail3[1].stbq005, 
               s_detail3[1].stbq006,s_detail3[1].stbq007,s_detail3[1].stbq008,s_detail3[1].stbq009,s_detail3[1].stbq010, 
               s_detail3[1].stbq011,s_detail3[1].stbq012,s_detail3[1].stbq013,s_detail3[1].stbq014,s_detail3[1].stbq015 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq002
            #add-point:BEFORE FIELD stbq002 name="construct.b.page3.stbq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq002
            
            #add-point:AFTER FIELD stbq002 name="construct.a.page3.stbq002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq002
            #add-point:ON ACTION controlp INFIELD stbq002 name="construct.c.page3.stbq002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.stbq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq003
            #add-point:ON ACTION controlp INFIELD stbq003 name="construct.c.page3.stbq003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2147'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbq003  #顯示到畫面上
            NEXT FIELD stbq003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq003
            #add-point:BEFORE FIELD stbq003 name="construct.b.page3.stbq003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq003
            
            #add-point:AFTER FIELD stbq003 name="construct.a.page3.stbq003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq004
            #add-point:ON ACTION controlp INFIELD stbq004 name="construct.c.page3.stbq004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbq004  #顯示到畫面上
            NEXT FIELD stbq004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq004
            #add-point:BEFORE FIELD stbq004 name="construct.b.page3.stbq004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq004
            
            #add-point:AFTER FIELD stbq004 name="construct.a.page3.stbq004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq005
            #add-point:BEFORE FIELD stbq005 name="construct.b.page3.stbq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq005
            
            #add-point:AFTER FIELD stbq005 name="construct.a.page3.stbq005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq005
            #add-point:ON ACTION controlp INFIELD stbq005 name="construct.c.page3.stbq005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq006
            #add-point:BEFORE FIELD stbq006 name="construct.b.page3.stbq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq006
            
            #add-point:AFTER FIELD stbq006 name="construct.a.page3.stbq006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq006
            #add-point:ON ACTION controlp INFIELD stbq006 name="construct.c.page3.stbq006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq007
            #add-point:BEFORE FIELD stbq007 name="construct.b.page3.stbq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq007
            
            #add-point:AFTER FIELD stbq007 name="construct.a.page3.stbq007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq007
            #add-point:ON ACTION controlp INFIELD stbq007 name="construct.c.page3.stbq007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq008
            #add-point:BEFORE FIELD stbq008 name="construct.b.page3.stbq008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq008
            
            #add-point:AFTER FIELD stbq008 name="construct.a.page3.stbq008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq008
            #add-point:ON ACTION controlp INFIELD stbq008 name="construct.c.page3.stbq008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq009
            #add-point:BEFORE FIELD stbq009 name="construct.b.page3.stbq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq009
            
            #add-point:AFTER FIELD stbq009 name="construct.a.page3.stbq009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq009
            #add-point:ON ACTION controlp INFIELD stbq009 name="construct.c.page3.stbq009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq010
            #add-point:BEFORE FIELD stbq010 name="construct.b.page3.stbq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq010
            
            #add-point:AFTER FIELD stbq010 name="construct.a.page3.stbq010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq010
            #add-point:ON ACTION controlp INFIELD stbq010 name="construct.c.page3.stbq010"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.stbq011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq011
            #add-point:ON ACTION controlp INFIELD stbq011 name="construct.c.page3.stbq011"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stat001 = '11'"
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbq011  #顯示到畫面上
            NEXT FIELD stbq011                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq011
            #add-point:BEFORE FIELD stbq011 name="construct.b.page3.stbq011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq011
            
            #add-point:AFTER FIELD stbq011 name="construct.a.page3.stbq011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq012
            #add-point:BEFORE FIELD stbq012 name="construct.b.page3.stbq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq012
            
            #add-point:AFTER FIELD stbq012 name="construct.a.page3.stbq012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq012
            #add-point:ON ACTION controlp INFIELD stbq012 name="construct.c.page3.stbq012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq013
            #add-point:BEFORE FIELD stbq013 name="construct.b.page3.stbq013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq013
            
            #add-point:AFTER FIELD stbq013 name="construct.a.page3.stbq013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq013
            #add-point:ON ACTION controlp INFIELD stbq013 name="construct.c.page3.stbq013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq014
            #add-point:BEFORE FIELD stbq014 name="construct.b.page3.stbq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq014
            
            #add-point:AFTER FIELD stbq014 name="construct.a.page3.stbq014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stbq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq014
            #add-point:ON ACTION controlp INFIELD stbq014 name="construct.c.page3.stbq014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.stbq015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq015
            #add-point:ON ACTION controlp INFIELD stbq015 name="construct.c.page3.stbq015"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2146'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbq015  #顯示到畫面上
            NEXT FIELD stbq015                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq015
            #add-point:BEFORE FIELD stbq015 name="construct.b.page3.stbq015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq015
            
            #add-point:AFTER FIELD stbq015 name="construct.a.page3.stbq015"
            
            #END add-point
            
 
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
         CONSTRUCT g_wc_stai ON stai003,stai004,stai005,stai006
           FROM s_detail2[1].stai003, s_detail2[1].stai004, s_detail2[1].stai005, s_detail2[1].stai006
                      
         BEFORE CONSTRUCT
        
            #add-point:cs段more_construct
      END CONSTRUCT

      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
        # DISPLAY '1' TO stag002
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stag_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stah_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbq_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
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
   IF g_wc2_table2 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"

   IF cl_null(g_wc_stai) THEN
      LET g_wc_stai = " 1=1"
   END IF
   IF g_wc_stai <> " 1=1" THEN
      LET g_wc2 = g_wc_stai," AND ",g_wc_stai
   END IF
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astm201_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
      CALL g_stai_d.clear()
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_stah_d.clear()
   CALL g_stah3_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL cl_set_comp_visible('stah013',TRUE)
   CALL cl_set_comp_visible('stah014',TRUE)
   CALL cl_set_comp_visible('stah015',TRUE)
   CALL cl_set_comp_visible('stah016',TRUE)
   CALL cl_set_comp_visible('group5',TRUE)
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astm201_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astm201_browser_fill("")
      CALL astm201_fetch("")
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
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
   CALL astm201_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astm201_fetch("F") 
      #顯示單身筆數
      CALL astm201_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astm201_fetch(p_flag)
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
   LET g_pagestart = g_current_idx
   DISPLAY g_pagestart TO FORMONLY.b_index   #當下筆數
   DISPLAY g_pagestart TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_pagestart, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_stag_m.stag001 = g_browser[g_current_idx].b_stag001
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
   #遮罩相關處理
   LET g_stag_m_mask_o.* =  g_stag_m.*
   CALL astm201_stag_t_mask()
   LET g_stag_m_mask_n.* =  g_stag_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm201_set_act_visible()   
   CALL astm201_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   IF g_stag_m.stagstus = 'N' THEN
      CALL cl_set_act_visible("modify,delete",TRUE)
   ELSE
      CALL cl_set_act_visible("modify,delete",FALSE)
   END IF
   #單身欄位&頁簽隱藏
   CALL astm201_set_comp_visible_b('2')   #160513-00033#1 160525 by sakura add    
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   # 2015/04/27  geaz add   150402-00005#28
   IF g_stag_m.stag002 = '4' THEN
      CALL cl_set_comp_visible('stah013',FALSE)
      CALL cl_set_comp_visible('stah014',FALSE)
      CALL cl_set_comp_visible('stah015',FALSE)
      CALL cl_set_comp_visible('stah016',FALSE)
      CALL cl_set_comp_visible('group5',FALSE)
   ELSE
      CALL cl_set_comp_visible('stah013',TRUE)
      CALL cl_set_comp_visible('stah014',TRUE)
      CALL cl_set_comp_visible('stah015',TRUE)
      CALL cl_set_comp_visible('stah016',TRUE)
      CALL cl_set_comp_visible('group5',TRUE)
   END IF
   #end add-point
   
   #保存單頭舊值
   LET g_stag_m_t.* = g_stag_m.*
   LET g_stag_m_o.* = g_stag_m.*
   
   LET g_data_owner = g_stag_m.stagownid      
   LET g_data_dept  = g_stag_m.stagowndp
   
   #重新顯示   
   CALL astm201_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.insert" >}
#+ 資料新增
PRIVATE FUNCTION astm201_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert    LIKE type_t.num5    
    CALL g_stai_d.clear()
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stah_d.clear()   
   CALL g_stah3_d.clear()  
 
 
   INITIALIZE g_stag_m.* TO NULL             #DEFAULT 設定
   
   LET g_stag001_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stag_m.stagownid = g_user
      LET g_stag_m.stagowndp = g_dept
      LET g_stag_m.stagcrtid = g_user
      LET g_stag_m.stagcrtdp = g_dept 
      LET g_stag_m.stagcrtdt = cl_get_current()
      LET g_stag_m.stagmodid = g_user
      LET g_stag_m.stagmoddt = cl_get_current()
      LET g_stag_m.stagstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stag_m.stag002 = "1"
      LET g_stag_m.stagstus = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
#      LET g_stag_m.stag008 = g_site
#      CALL astm201_stag008_ref()
      CALL s_aooi500_default(g_prog,'stagunit',g_site) RETURNING l_insert,g_stag_m.stagunit
      IF NOT l_insert THEN
         RETURN
      END IF
      CALL astm201_stagunit_ref()
      LET g_stag_m_t.* = g_stag_m.*
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stag_m_t.* = g_stag_m.*
      LET g_stag_m_o.* = g_stag_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stag_m.stagstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
    
      CALL astm201_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
            CALL g_stai_d.clear()
      LET g_rec_b2 = 0
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
         INITIALIZE g_stag_m.* TO NULL
         INITIALIZE g_stah_d TO NULL
         INITIALIZE g_stah3_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astm201_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stah_d.clear()
      #CALL g_stah3_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm201_set_act_visible()   
   CALL astm201_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stag001_t = g_stag_m.stag001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stagent = " ||g_enterprise|| " AND",
                      " stag001 = '", g_stag_m.stag001, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm201_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astm201_cl
   
   CALL astm201_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
   
   #遮罩相關處理
   LET g_stag_m_mask_o.* =  g_stag_m.*
   CALL astm201_stag_t_mask()
   LET g_stag_m_mask_n.* =  g_stag_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stagunit_desc,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004, 
       g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag003_desc,g_stag_m.stag004,g_stag_m.stag004_desc, 
       g_stag_m.stag005,g_stag_m.stag005_desc,g_stag_m.stag006,g_stag_m.stag006_desc,g_stag_m.stag007, 
       g_stag_m.stag007_desc,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagownid_desc,g_stag_m.stagowndp, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp,g_stag_m.stagcrtdp_desc, 
       g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmodid_desc,g_stag_m.stagmoddt,g_stag_m.stagcnfid, 
       g_stag_m.stagcnfid_desc,g_stag_m.stagcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stag_m.stagownid      
   LET g_data_dept  = g_stag_m.stagowndp
   
   #功能已完成,通報訊息中心
   CALL astm201_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.modify" >}
#+ 資料修改
PRIVATE FUNCTION astm201_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stag_m_t.* = g_stag_m.*
   LET g_stag_m_o.* = g_stag_m.*
   
   IF g_stag_m.stag001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stag001_t = g_stag_m.stag001
 
   CALL s_transaction_begin()
   
   OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm201_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm201_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astm201_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stag_m_mask_o.* =  g_stag_m.*
   CALL astm201_stag_t_mask()
   LET g_stag_m_mask_n.* =  g_stag_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astm201_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stag001_t = g_stag_m.stag001
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stag_m.stagmodid = g_user 
LET g_stag_m.stagmoddt = cl_get_current()
LET g_stag_m.stagmodid_desc = cl_get_username(g_stag_m.stagmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astm201_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stag_t SET (stagmodid,stagmoddt) = (g_stag_m.stagmodid,g_stag_m.stagmoddt)
          WHERE stagent = g_enterprise AND stag001 = g_stag001_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stag_m.* = g_stag_m_t.*
            CALL astm201_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stag_m.stag001 != g_stag_m_t.stag001
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stah_t SET stah001 = g_stag_m.stag001
 
          WHERE stahent = g_enterprise AND stah001 = g_stag_m_t.stag001
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stah_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update2"
         
         #end add-point
         
         UPDATE stbq_t
            SET stbq001 = g_stag_m.stag001
 
          WHERE stbqent = g_enterprise AND
                stbq001 = g_stag001_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbq_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm201_set_act_visible()   
   CALL astm201_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stagent = " ||g_enterprise|| " AND",
                      " stag001 = '", g_stag_m.stag001, "' "
 
   #填到對應位置
   CALL astm201_browser_fill("")
 
   CLOSE astm201_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm201_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astm201.input" >}
#+ 資料輸入
PRIVATE FUNCTION astm201_input(p_cmd)
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
   DEFINE  t_stag002             LIKE stag_t.stag002
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               LIKE type_t.chr10
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
   DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stagunit_desc,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004, 
       g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag003_desc,g_stag_m.stag004,g_stag_m.stag004_desc, 
       g_stag_m.stag005,g_stag_m.stag005_desc,g_stag_m.stag006,g_stag_m.stag006_desc,g_stag_m.stag007, 
       g_stag_m.stag007_desc,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagownid_desc,g_stag_m.stagowndp, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp,g_stag_m.stagcrtdp_desc, 
       g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmodid_desc,g_stag_m.stagmoddt,g_stag_m.stagcnfid, 
       g_stag_m.stagcnfid_desc,g_stag_m.stagcnfdt
   
   #切換畫面
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
      LET g_forupd_sql = "SELECT stai003,stai004,stai005,stai006 FROM stai_t WHERE staient=? AND stai001=? AND stai002=? AND stai003 = ? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astm201_stai_bcl2 CURSOR FROM g_forupd_sql
   #end add-point 
   LET g_forupd_sql = "SELECT stah002,stah003,stah017,stah004,stah005,stah006,stah007,stah008,stah009, 
       stah010,stah011,stah012,stah013,stah014,stah015,stah016 FROM stah_t WHERE stahent=? AND stah001=?  
       AND stah002=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm201_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stbq002,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009,stbq010, 
       stbq011,stbq012,stbq013,stbq014,stbq015 FROM stbq_t WHERE stbqent=? AND stbq001=? AND stbq002=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm201_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astm201_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astm201_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus 
 
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   LET t_stag002 = g_stag_m.stag002
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astm201.input.head" >}
      #單頭段
      INPUT BY NAME g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004,g_stag_m.stag002, 
          g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_item
            LET g_action_choice="update_item"
            IF cl_auth_chk_act("update_item") THEN
               
               #add-point:ON ACTION update_item name="input.master_input.update_item"
                         IF NOT cl_null(g_stag_m.stag001) THEN
                  CALL n_stagl(g_stag_m.stag001)
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stag_m.stag001
                  CALL ap_ref_array2(g_ref_fields," SELECT stagl003,stagl004 FROM stagl_t WHERE staglent = '"||g_enterprise||"' AND stagl001 = ? AND stagl002 = '"||g_lang||"'","") RETURNING g_rtn_fields #160905-00007#15 by 08172 add ent
                  LET g_stag_m.stagl003 = g_rtn_fields[1]
                  LET g_stag_m.stagl004 = g_rtn_fields[2]
                  DISPLAY BY NAME g_stag_m.stagl003
                  DISPLAY BY NAME g_stag_m.stagl004
               END IF
               #END add-point
            END IF
 
 
 
 
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm201_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm201_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            LET g_master_multi_table_t.stagl001 = g_stag_m.stag001
LET g_master_multi_table_t.stagl003 = g_stag_m.stagl003
LET g_master_multi_table_t.stagl004 = g_stag_m.stagl004
 
            IF l_cmd_t = 'r' THEN
               LET g_master_multi_table_t.stagl001 = ''
LET g_master_multi_table_t.stagl003 = ''
LET g_master_multi_table_t.stagl004 = ''
 
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astm201_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astm201_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagunit
            
            #add-point:AFTER FIELD stagunit name="input.a.stagunit"
           
            IF NOT cl_null(g_stag_m.stagunit) THEN 
                  CALL s_aooi500_chk(g_prog,'stagunit',g_stag_m.stagunit,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                  
                     LET g_stag_m.stagunit = g_stag_m_t.stagunit
                     CALL astm201_stagunit_ref()
                     NEXT FIELD CURRENT
                  END IF
                  
                  CALL astm201_set_entry(p_cmd)
                  CALL astm201_set_no_entry(p_cmd)

            END IF            
            
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stag_m.stagunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stag_m.stagunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stag_m.stagunit_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagunit
            #add-point:BEFORE FIELD stagunit name="input.b.stagunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stagunit
            #add-point:ON CHANGE stagunit name="input.g.stagunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag001
            #add-point:BEFORE FIELD stag001 name="input.b.stag001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag001
            
            #add-point:AFTER FIELD stag001 name="input.a.stag001"
                        #此段落由子樣板a05產生
            IF  NOT cl_null(g_stag_m.stag001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND ( p_cmd = 'u' AND (g_stag_m.stag001 != g_stag001_t ))) THEN 
#                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stag_t WHERE "||"stagent = '" ||g_enterprise|| "' AND "||"stag001 = '"||g_stag_m.stag001 ||"'",'std-00004',0) THEN    #160905-00007#15  by 08172
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM stag_t WHERE "||"stagent = '" ||g_enterprise|| "' AND "||"stag001 = '"||g_stag_m.stag001 ||"'",'std-00004',0) THEN   #160905-00007#15  by 08172
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag001
            #add-point:ON CHANGE stag001 name="input.g.stag001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagl003
            #add-point:BEFORE FIELD stagl003 name="input.b.stagl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagl003
            
            #add-point:AFTER FIELD stagl003 name="input.a.stagl003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stagl003
            #add-point:ON CHANGE stagl003 name="input.g.stagl003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagl004
            #add-point:BEFORE FIELD stagl004 name="input.b.stagl004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagl004
            
            #add-point:AFTER FIELD stagl004 name="input.a.stagl004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stagl004
            #add-point:ON CHANGE stagl004 name="input.g.stagl004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag002
            #add-point:BEFORE FIELD stag002 name="input.b.stag002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag002
            
            #add-point:AFTER FIELD stag002 name="input.a.stag002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag002
            #add-point:ON CHANGE stag002 name="input.g.stag002"
            IF NOT cl_null(g_stag_m.stag002) THEN
               IF NOT astm201_b_chk() THEN
                  LET g_stag_m.stag002 = g_stag_m_t.stag002
                  NEXT FIELD stag002
               END IF
               IF t_stag002 MATCHES "[1-5]" AND g_stag_m.stag002 NOT MATCHES "[1-5]" THEN
                  LET g_stag_m.stag003 = ''
                  LET g_stag_m.stag003_desc = ''
               END IF
               IF  t_stag002 NOT MATCHES "[1-5]" AND g_stag_m.stag002 MATCHES "[1-5]" THEN
                  LET g_stag_m.stag003 = ''
                  LET g_stag_m.stag003_desc = ''
               END IF
               DISPLAY BY NAME g_stag_m.stag003,g_stag_m.stag003_desc
            END IF
            LET t_stag002 = g_stag_m.stag002
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag003
            
            #add-point:AFTER FIELD stag003 name="input.a.stag003"
            LET g_stag_m.stag003_desc = ''
            DISPLAY BY NAME g_stag_m.stag003_desc
            IF NOT cl_null(g_stag_m.stag003) THEN
               IF NOT astm201_stag003_chk() THEN
                  LET g_stag_m.stag003 = g_stag_m_t.stag003
                  CALL astm201_stag003_ref()
                  NEXT FIELD stag003 
               END IF
            END IF
            CALL astm201_stag003_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag003
            #add-point:BEFORE FIELD stag003 name="input.b.stag003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag003
            #add-point:ON CHANGE stag003 name="input.g.stag003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag004
            
            #add-point:AFTER FIELD stag004 name="input.a.stag004"
            LET g_stag_m.stag004_desc = ''
            DISPLAY BY NAME g_stag_m.stag004_desc
            IF NOT cl_null(g_stag_m.stag004) THEN
               IF NOT  astm201_stag004_chk(g_stag_m.stag004) THEN
                  LET g_stag_m.stag004 = g_stag_m_t.stag004
                  CALL astm201_stag004_ref()
                  NEXT FIELD stag004 
               END IF
            END IF
            CALL astm201_stag004_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag004
            #add-point:BEFORE FIELD stag004 name="input.b.stag004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag004
            #add-point:ON CHANGE stag004 name="input.g.stag004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag005
            
            #add-point:AFTER FIELD stag005 name="input.a.stag005"
           LET g_stag_m.stag005_desc = ''
           DISPLAY BY NAME g_stag_m.stag005_desc
            IF NOT cl_null(g_stag_m.stag005) THEN
               IF NOT astm201_stag005_chk(g_stag_m.stag005) THEN
                  LET g_stag_m.stag005 = g_stag_m_t.stag005
                  CALL astm201_stag005_ref() 
                  NEXT FIELD stag005
               END IF
               IF NOT astm201_b_chk() THEN
                  LET g_stag_m.stag005 = g_stag_m_t.stag005
                  CALL astm201_stag005_ref() 
                  NEXT FIELD stag005
               END IF
            END IF
            CALL astm201_stag005_ref()

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag005
            #add-point:BEFORE FIELD stag005 name="input.b.stag005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag005
            #add-point:ON CHANGE stag005 name="input.g.stag005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag006
            
            #add-point:AFTER FIELD stag006 name="input.a.stag006"
                       LET g_stag_m.stag006_desc = ''
           DISPLAY BY NAME g_stag_m.stag006_desc
           IF NOT cl_null(g_stag_m.stag006) THEN
              IF NOT astm201_stag006_chk(g_stag_m.stag006) THEN
                 LET g_stag_m.stag006 = g_stag_m_t.stag006
                 CALL astm201_stag006_ref()
                 NEXT FIELD stag006
              END IF
              CALL astm201_stag006_ref()
           END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag006
            #add-point:BEFORE FIELD stag006 name="input.b.stag006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag006
            #add-point:ON CHANGE stag006 name="input.g.stag006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stag007
            
            #add-point:AFTER FIELD stag007 name="input.a.stag007"
                        LET g_stag_m.stag007_desc = ''
            DISPLAY BY NAME g_stag_m.stag007_desc
            IF NOT cl_null(g_stag_m.stag007) THEN
               IF NOT astm201_stag007_chk(g_stag_m.stag007) THEN
                  LET g_stag_m.stag007 = g_stag_m_t.stag007 
                  CALL astm201_stag007_ref()
                  NEXT FIELD stag007
               END IF 
               CALL astm201_stag007_ref()            
            ELSE
               LET g_stag_m.stag007_desc = ''
               DISPLAY BY NAME g_stag_m.stag007_desc
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stag007
            #add-point:BEFORE FIELD stag007 name="input.b.stag007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stag007
            #add-point:ON CHANGE stag007 name="input.g.stag007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stagstus
            #add-point:BEFORE FIELD stagstus name="input.b.stagstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stagstus
            
            #add-point:AFTER FIELD stagstus name="input.a.stagstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stagstus
            #add-point:ON CHANGE stagstus name="input.g.stagstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stagunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagunit
            #add-point:ON ACTION controlp INFIELD stagunit name="input.c.stagunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stagunit             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stagunit',g_site,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stag_m.stagunit = g_qryparam.return1              

            DISPLAY g_stag_m.stagunit TO stagunit              #

            NEXT FIELD stagunit
            #END add-point
 
 
         #Ctrlp:input.c.stag001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag001
            #add-point:ON ACTION controlp INFIELD stag001 name="input.c.stag001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stagl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagl003
            #add-point:ON ACTION controlp INFIELD stagl003 name="input.c.stagl003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stagl004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagl004
            #add-point:ON ACTION controlp INFIELD stagl004 name="input.c.stagl004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stag002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag002
            #add-point:ON ACTION controlp INFIELD stag002 name="input.c.stag002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stag003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag003
            #add-point:ON ACTION controlp INFIELD stag003 name="input.c.stag003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stag003             #給予default值
            
            IF g_stag_m.stag002 MATCHES "[1-5]" THEN
               CALL q_ooib002_1()
            ELSE
               CALL q_ooib002_2()
            END IF

            LET g_stag_m.stag003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stag_m.stag003 TO stag003              #顯示到畫面上
            CALL astm201_stag003_ref()
            
            NEXT FIELD stag003                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stag004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag004
            #add-point:ON ACTION controlp INFIELD stag004 name="input.c.stag004"
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stag004             #給予default值

            #給予arg

            CALL q_staa001()                                #呼叫開窗

            LET g_stag_m.stag004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stag_m.stag004 TO stag004              #顯示到畫面上
            CALL astm201_stag004_ref()
            
            NEXT FIELD stag004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stag005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag005
            #add-point:ON ACTION controlp INFIELD stag005 name="input.c.stag005"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stag005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2060" #

            CALL q_oocq002()                                #呼叫開窗

            LET g_stag_m.stag005 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stag_m.stag005 TO stag005              #顯示到畫面上
            CALL astm201_stag005_ref()
            NEXT FIELD stag005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stag006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag006
            #add-point:ON ACTION controlp INFIELD stag006 name="input.c.stag006"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stag006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                                #呼叫開窗

            LET g_stag_m.stag006 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stag_m.stag006 TO stag006              #顯示到畫面上
            CALL astm201_stag006_ref()
            NEXT FIELD stag006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stag007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stag007
            #add-point:ON ACTION controlp INFIELD stag007 name="input.c.stag007"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stag_m.stag007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            CALL q_oodb002_1()                                #呼叫開窗

            LET g_stag_m.stag007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stag_m.stag007 TO stag007              #顯示到畫面上
            CALL astm201_stag007_ref()
            NEXT FIELD stag007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stagstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stagstus
            #add-point:ON ACTION controlp INFIELD stagstus name="input.c.stagstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stag_m.stag001
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               
               #end add-point
               
               INSERT INTO stag_t (stagent,stagunit,stag001,stag002,stag003,stag004,stag005,stag006, 
                   stag007,stagstus,stagownid,stagowndp,stagcrtid,stagcrtdp,stagcrtdt,stagmodid,stagmoddt, 
                   stagcnfid,stagcnfdt)
               VALUES (g_enterprise,g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002,g_stag_m.stag003, 
                   g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
                   g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
                   g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stag_m:",SQLERRMESSAGE 
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
         IF g_stag_m.stag001 = g_master_multi_table_t.stagl001 AND
         g_stag_m.stagl003 = g_master_multi_table_t.stagl003 AND 
         g_stag_m.stagl004 = g_master_multi_table_t.stagl004  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'staglent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stag_m.stag001
            LET l_field_keys[02] = 'stagl001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stagl001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'stagl002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stag_m.stagl003
            LET l_fields[01] = 'stagl003'
            LET l_vars[02] = g_stag_m.stagl004
            LET l_fields[02] = 'stagl004'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'stagl_t')
         END IF 
 
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astm201_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astm201_b_fill()
                  CALL astm201_b_fill2('0')
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
               CALL astm201_stag_t_mask_restore('restore_mask_o')
               
               UPDATE stag_t SET (stagunit,stag001,stag002,stag003,stag004,stag005,stag006,stag007,stagstus, 
                   stagownid,stagowndp,stagcrtid,stagcrtdp,stagcrtdt,stagmodid,stagmoddt,stagcnfid,stagcnfdt) = (g_stag_m.stagunit, 
                   g_stag_m.stag001,g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005, 
                   g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagowndp, 
                   g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmoddt, 
                   g_stag_m.stagcnfid,g_stag_m.stagcnfdt)
                WHERE stagent = g_enterprise AND stag001 = g_stag001_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stag_t:",SQLERRMESSAGE 
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
         IF g_stag_m.stag001 = g_master_multi_table_t.stagl001 AND
         g_stag_m.stagl003 = g_master_multi_table_t.stagl003 AND 
         g_stag_m.stagl004 = g_master_multi_table_t.stagl004  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'staglent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stag_m.stag001
            LET l_field_keys[02] = 'stagl001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stagl001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'stagl002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stag_m.stagl003
            LET l_fields[01] = 'stagl003'
            LET l_vars[02] = g_stag_m.stagl004
            LET l_fields[02] = 'stagl004'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'stagl_t')
         END IF 
 
               
               #將遮罩欄位進行遮蔽
               CALL astm201_stag_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stag_m_t)
               LET g_log2 = util.JSON.stringify(g_stag_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stag001_t = g_stag_m.stag001
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astm201.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stah_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stah_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm201_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stah_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            #單身欄位&頁簽隱藏
            CALL astm201_set_comp_visible_b('2')   #160513-00033#1 160525 by sakura add
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
            OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm201_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm201_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stah_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stah_d[l_ac].stah002 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stah_d_t.* = g_stah_d[l_ac].*  #BACKUP
               LET g_stah_d_o.* = g_stah_d[l_ac].*  #BACKUP
               CALL astm201_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astm201_set_no_entry_b(l_cmd)
               IF NOT astm201_lock_b("stah_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm201_bcl INTO g_stah_d[l_ac].stah002,g_stah_d[l_ac].stah003,g_stah_d[l_ac].stah017, 
                      g_stah_d[l_ac].stah004,g_stah_d[l_ac].stah005,g_stah_d[l_ac].stah006,g_stah_d[l_ac].stah007, 
                      g_stah_d[l_ac].stah008,g_stah_d[l_ac].stah009,g_stah_d[l_ac].stah010,g_stah_d[l_ac].stah011, 
                      g_stah_d[l_ac].stah012,g_stah_d[l_ac].stah013,g_stah_d[l_ac].stah014,g_stah_d[l_ac].stah015, 
                      g_stah_d[l_ac].stah016
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stah_d_t.stah002,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stah_d_mask_o[l_ac].* =  g_stah_d[l_ac].*
                  CALL astm201_stah_t_mask()
                  LET g_stah_d_mask_n[l_ac].* =  g_stah_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm201_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
                         IF l_cmd = 'u' THEN
                 CALL astm201_b2_fill()
                 CALL astm201_reflesh()
             END IF
             CALL astm201_set_entry_b(l_cmd)
             CALL astm201_set_no_required_b(l_cmd)
             CALL astm201_set_required_b(l_cmd)
             CALL astm201_set_no_entry_b(l_cmd)
             LET g_stah_d_t.* = g_stah_d[l_ac].*     #新輸入資料
             LET g_stah_d_o.* = g_stah_d[l_ac].* 
             # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF
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
            INITIALIZE g_stah_d[l_ac].* TO NULL 
            INITIALIZE g_stah_d_t.* TO NULL 
            INITIALIZE g_stah_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stah_d[l_ac].stah017 = "N"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
 
            #end add-point
            LET g_stah_d_t.* = g_stah_d[l_ac].*     #新輸入資料
            LET g_stah_d_o.* = g_stah_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm201_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astm201_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stah_d[li_reproduce_target].* = g_stah_d[li_reproduce].*
 
               LET g_stah_d[li_reproduce_target].stah002 = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
                        LET g_insert = 'Y'
            CALL g_stai_d.clear()
            CALL astm201_set_entry_b(l_cmd)
             CALL astm201_set_no_required_b(l_cmd)
             CALL astm201_set_required_b(l_cmd)
             CALL astm201_set_no_entry_b(l_cmd)
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF 
            SELECT MAX(stah002)+1 INTO  g_stah_d[l_ac].stah002 FROM stah_t
             WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001
            IF cl_null( g_stah_d[l_ac].stah002 ) THEN             
               LET g_stah_d[l_ac].stah002 = 1
            END IF
            
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
            SELECT COUNT(1) INTO l_count FROM stah_t 
             WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001
 
               AND stah002 = g_stah_d[l_ac].stah002
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys[2] = g_stah_d[g_detail_idx].stah002
               CALL astm201_insert_b('stah_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stah_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm201_b_fill()
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
                               DELETE FROM stai_t
                WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND

                      stai002 = g_stah_d_t.stah002
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stai_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE 
               END IF                  
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stag_m.stag001
 
               LET gs_keys[gs_keys.getLength()+1] = g_stah_d_t.stah002
 
            
               #刪除同層單身
               IF NOT astm201_delete_b('stah_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm201_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm201_key_delete_b(gs_keys,'stah_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm201_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astm201_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  
               #end add-point
               LET l_count = g_stah_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
            
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stah_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah002
            #add-point:BEFORE FIELD stah002 name="input.b.page1.stah002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah002
            
            #add-point:AFTER FIELD stah002 name="input.a.page1.stah002"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stag_m.stag001) AND NOT cl_null(g_stah_d[l_ac].stah002) THEN 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_stag_m.stag001 != g_stag001_t OR g_stah_d[l_ac].stah002 != g_stah_d_t.stah002))) THEN    #170124-00012#1 170124 by 02749 mark
               IF g_stah_d[l_ac].stah002 != g_stah_d_o.stah002 OR cl_null(g_stah_d_o.stah002) THEN   #170124-00012#1 170124 by 02749 add
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM stah_t WHERE "||"stahent = '" ||g_enterprise|| "' AND "||"stah001 = '"||g_stag_m.stag001 ||"' AND "|| "stah002 = '"||g_stah_d[l_ac].stah002 ||"'",'std-00004',0) THEN #160905-00007#15 by 08172 *变1
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
           
           #LET g_stah_d_t.stah002 = g_stah_d[l_ac].stah002   #170124-00012#1 170124 by 02749 mark
            LET g_stah_d_o.stah002 = g_stah_d[l_ac].stah002   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah002
            #add-point:ON CHANGE stah002 name="input.g.page1.stah002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah003
            
            #add-point:AFTER FIELD stah003 name="input.a.page1.stah003"
            LET g_stah_d[l_ac].stah003_desc = ''
            DISPLAY BY NAME g_stah_d[l_ac].stah003_desc           
            IF NOT cl_null(g_stah_d[l_ac].stah003) THEN
               IF g_stah_d[l_ac].stah003 <> g_stah_d_o.stah003 OR cl_null(g_stah_d_o.stah003) THEN        #170124-00012#1 170124 by 02749 add
                  IF NOT astm201_stah003_chk(g_stah_d[l_ac].stah003 ) THEN
                    #LET g_stah_d[l_ac].stah003 = g_stah_d_t.stah003   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah003 = g_stah_d_o.stah003   #170124-00012#1 170124 by 02749 add
                     CALL astm201_stah003_ref() 
                     NEXT FIELD stah003
                  END IF
                 
                 #檢查同一模板是否有重複的費用編號                 
                 #IF l_cmd = 'a' OR ( l_cmd = 'u'  AND  g_stah_d[l_ac].stah003 != g_stah_d_t.stah003) THEN   #170124-00012#1 170124 by 02749 mark
                    #SELECT COUNT(*) INTO l_n FROM stah_t   #160905-00007#15  by 08172
                     SELECT COUNT(1) INTO l_n FROM stah_t   #160905-00007#15  by 08172
                      WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001 AND stah003 = g_stah_d[l_ac].stah003
                     IF l_n > 0 THEN
                        IF l_cmd = 'a' THEN   #170203-00017#1 170203 by 02749 add
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'ast-00033'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                         
                          #LET g_stah_d[l_ac].stah003 = g_stah_d_t.stah003   #170124-00012#1 170124 by 02749 mark
                           LET g_stah_d[l_ac].stah003 = g_stah_d_o.stah003   #170124-00012#1 170124 by 02749 add
                           CALL astm201_stah003_ref() 
                           NEXT FIELD stah003
                        #170203-00017#1 170203 by 02749 add---(S)   
                        ELSE
                           LET l_n = 0
                           SELECT COUNT(stah002) INTO l_n 
                             FROM stah_t   
                            WHERE stahent = g_enterprise 
                              AND stah001 = g_stag_m.stag001 
                              AND stah002 <> g_stah_d[l_ac].stah002
                              AND stah003 = g_stah_d[l_ac].stah003                                 
                           IF l_n > 0 THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'ast-00033'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                             
                              LET g_stah_d[l_ac].stah003 = g_stah_d_o.stah003  
                              CALL astm201_stah003_ref() 
                              NEXT FIELD stah003                              
                           ELSE
                              IF g_stah_d[l_ac].stah003 = g_stah_d_t.stah003 THEN
                                 LET g_stah_d[l_ac].* = g_stah_d_t.*
                                 CALL astm201_stah003_ref() 
                                 CALL astm201_stah009_ref()
                                 CALL astm201_stah010_ref()
                              END IF   
                           END IF
                        END IF  
                       #170203-00017#1 170203 by 02749 add---(E)                         
                     END IF
                 #END IF  #170124-00012#1 170124 by 02749 mark
                 
                 #170124-00012#1 170124 by 02749 mod---(S)
                 #IF (g_stah_d[l_ac].stah003 <> g_stah_d_o.stah003 AND NOT cl_null(g_stah_d_o.stah003))   
                 #    OR (l_cmd = 'a' AND cl_null(g_stah_d_o.stah003) ) THEN                              
                 #    LET g_stah_d_t.stah002 = g_stah_d[l_ac].stah002 
                 #    LET g_stah_d_t.stah003 = g_stah_d[l_ac].stah003
                 #    
                 #    INITIALIZE g_stah_d[l_ac].* TO NULL
                 #    LET g_stah_d[l_ac].stah017 = 'N'                   #160513-00033#1 160525 by sakura add
                 #    LET g_stah_d[l_ac].stah002 = g_stah_d_t.stah002
                 #    LET g_stah_d[l_ac].stah003 = g_stah_d_t.stah003 
                 #    #帶出費用編號預設
                 #    SELECT stae006 INTO  g_stah_d[l_ac].stah005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stah_d[l_ac].stah003
                 #    DISPLAY BY NAME g_stah_d[l_ac].stah003_desc,g_stah_d[l_ac].stah005 
                 #    #費用合約設定asti204
                 #    CALL astm201_default(g_stag_m.stag002,g_stah_d[l_ac].stah003)
                 #    IF l_cmd = 'u' AND g_rec_b2 > 0 THEN
                 #       IF cl_ask_confirm('ast-00018') THEN
                 #          DELETE FROM stai_t
                 #           WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND
                 #                 stai002 = g_stah_d_t.stah002
                 #           CALL g_stai_d.clear()
                 #       END IF 
                 #    END IF  
                 #END IF 
                 #CALL astm201_stah003_ref() 
                 ##SELECT stae006 INTO  g_stah_d[l_ac].stah005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stah_d[l_ac].stah003                 
                     
                 #IF l_cmd = 'a' THEN   #170203-00017#1 170203 by 02749 mark
                  IF l_cmd = 'a' OR ( l_cmd = 'u'  AND  g_stah_d[l_ac].stah003 != g_stah_d_t.stah003) THEN   #170203-00017#1 170203 by 02749 add
                     LET g_stah_d[l_ac].stah017 = 'N'                  
                     
                     #帶出費用編號預設
                     SELECT stae006 INTO g_stah_d[l_ac].stah005 FROM stae_t 
                      WHERE staeent = g_enterprise 
                      AND stae001 = g_stah_d[l_ac].stah003                  
                      
                     #費用合約設定asti204
                     CALL astm201_default(g_stag_m.stag002,g_stah_d[l_ac].stah003)
                     IF l_cmd = 'u' AND g_rec_b2 > 0 THEN
                        IF cl_ask_confirm('ast-00018') THEN
                           #170124-00012#1 170124 by 02749 mod:參照原邏輯,stah002變數使用當前資料變數即可
                           DELETE FROM stai_t
                            WHERE staient = g_enterprise 
                              AND stai001 = g_stag_m.stag001
                              AND stai002 = g_stah_d[l_ac].stah002    
                            CALL g_stai_d.clear()
                        END IF 
                     END IF 
                  END IF   
                 #170124-00012#1 170124 by 02749 mod---(E)
              END IF   #170124-00012#1 170124 by 02749 add 
            ELSE
               LET g_stah_d[l_ac].stah003_desc = ''
               LET g_stah_d[l_ac].stah005 = ''
            END IF
           
            CALL astm201_stah003_ref()                        #170124-00012#1 170124 by 02749 add 
            LET g_stah_d_o.stah003 = g_stah_d[l_ac].stah003
            LET g_stah_d_o.stah005 = g_stah_d[l_ac].stah005   #170124-00012#1 170124 by 02749 add
            LET g_stah_d_o.stah017 = g_stah_d[l_ac].stah017   #170124-00012#1 170124 by 02749 add
            
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_required_b(l_cmd)
            CALL astm201_set_required_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF   
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah003
            #add-point:BEFORE FIELD stah003 name="input.b.page1.stah003"
                        IF cl_null(g_stah_d[l_ac].stah002) THEN
               NEXT FIELD stah002
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah003
            #add-point:ON CHANGE stah003 name="input.g.page1.stah003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah017
            #add-point:BEFORE FIELD stah017 name="input.b.page1.stah017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah017
            
            #add-point:AFTER FIELD stah017 name="input.a.page1.stah017"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah017
            #add-point:ON CHANGE stah017 name="input.g.page1.stah017"
            #160513-00033#1 160525 by sakura add(S)
            IF g_stah_d[l_ac].stah017 = 'Y' THEN
               LET g_stah_d[l_ac].stah005 = NULL
               LET g_stah_d[l_ac].stah007 = NULL
               LET g_stah_d[l_ac].stah008 = NULL
               LET g_stah_d[l_ac].stah009 = NULL
               LET g_stah_d[l_ac].stah009_desc = NULL
               LET g_stah_d[l_ac].stah010 = NULL
               LET g_stah_d[l_ac].stah010_desc = NULL
               LET g_stah_d[l_ac].stah011 = NULL
               LET g_stah_d[l_ac].stah012 = NULL
               LET g_stah_d[l_ac].stah014 = NULL
               LET g_stah_d[l_ac].stah015 = NULL
               LET g_stah_d[l_ac].stah006 = '1'
               LET g_stah_d[l_ac].stah013 = '1'
               LET g_stah_d[l_ac].stah016 = '1'
            END IF
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #160513-00033#1 160525 by sakura add(E)            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah004
            #add-point:BEFORE FIELD stah004 name="input.b.page1.stah004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah004
            
            #add-point:AFTER FIELD stah004 name="input.a.page1.stah004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah004
            #add-point:ON CHANGE stah004 name="input.g.page1.stah004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah005
            #add-point:BEFORE FIELD stah005 name="input.b.page1.stah005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah005
            
            #add-point:AFTER FIELD stah005 name="input.a.page1.stah005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah005
            #add-point:ON CHANGE stah005 name="input.g.page1.stah005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah006
            #add-point:BEFORE FIELD stah006 name="input.b.page1.stah006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah006
            
            #add-point:AFTER FIELD stah006 name="input.a.page1.stah006"
            LET g_stah_d_o.stah006 = g_stah_d[l_ac].stah006   #170124-00012#1 170124 by 02749 add
            
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_required_b(l_cmd)
            CALL astm201_set_required_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah006
            #add-point:ON CHANGE stah006 name="input.g.page1.stah006"
                        
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah007
            #add-point:BEFORE FIELD stah007 name="input.b.page1.stah007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah007
            
            #add-point:AFTER FIELD stah007 name="input.a.page1.stah007"
         
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah007
            #add-point:ON CHANGE stah007 name="input.g.page1.stah007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah008
            #add-point:BEFORE FIELD stah008 name="input.b.page1.stah008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah008
            
            #add-point:AFTER FIELD stah008 name="input.a.page1.stah008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah008
            #add-point:ON CHANGE stah008 name="input.g.page1.stah008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah009
            
            #add-point:AFTER FIELD stah009 name="input.a.page1.stah009"
            LET g_stah_d[l_ac].stah009_desc = ''
            IF NOT cl_null(g_stah_d[l_ac].stah009) THEN   
               IF g_stah_d[l_ac].stah009 <> g_stah_d_o.stah009 OR cl_null(g_stah_d_o.stah009) THEN   #170124-00012#1 170124 by 02749 add
                  IF NOT astm201_stah009_chk(g_stah_d[l_ac].stah009) THEN
                    #LET g_stah_d[l_ac].stah009 = g_stah_d_t.stah009   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah009 = g_stah_d_o.stah009   #170124-00012#1 170124 by 02749 add
                     CALL astm201_stah009_ref()
                     NEXT FIELD stah009
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add
            END IF   
            
            CALL astm201_stah009_ref()
            LET g_stah_d_o.stah009 = g_stah_d[l_ac].stah009   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah009
            #add-point:BEFORE FIELD stah009 name="input.b.page1.stah009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah009
            #add-point:ON CHANGE stah009 name="input.g.page1.stah009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah010
            
            #add-point:AFTER FIELD stah010 name="input.a.page1.stah010"
            LET g_stah_d[l_ac].stah010_desc = ''
            IF NOT cl_null(g_stah_d[l_ac].stah010) THEN   
               IF g_stah_d[l_ac].stah010 <> g_stah_d_o.stah010 OR cl_null(g_stah_d_o.stah010) THEN   #170124-00012#1 170124 by 02749 add
                  IF NOT astm201_stah009_chk(g_stah_d[l_ac].stah010) THEN
                    #LET g_stah_d[l_ac].stah010 = g_stah_d_t.stah010   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah010 = g_stah_d_o.stah010   #170124-00012#1 170124 by 02749 add
                     CALL astm201_stah010_ref()
                     NEXT FIELD stah010
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add   
             END IF
             CALL astm201_stah010_ref()
             LET g_stah_d_o.stah010 = g_stah_d[l_ac].stah010   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah010
            #add-point:BEFORE FIELD stah010 name="input.b.page1.stah010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah010
            #add-point:ON CHANGE stah010 name="input.g.page1.stah010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah011
            #add-point:BEFORE FIELD stah011 name="input.b.page1.stah011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah011
            
            #add-point:AFTER FIELD stah011 name="input.a.page1.stah011"
            IF NOT cl_null(g_stah_d[l_ac].stah011) THEN
               IF g_stah_d[l_ac].stah011 < g_stah_d_o.stah011 OR cl_null(g_stah_d_o.stah011) THEN   #170124-00012#1 170124 by 02749 add
                  IF g_stah_d[l_ac].stah011 <=0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = '-32406'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                  
                    
                    #LET g_stah_d[l_ac].stah011 = g_stah_d_t.stah011   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah011 = g_stah_d_o.stah011   #170124-00012#1 170124 by 02749 add
                     NEXT FIELD stah011
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add
            END IF
            
            LET g_stah_d_o.stah011 = g_stah_d[l_ac].stah011   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah011
            #add-point:ON CHANGE stah011 name="input.g.page1.stah011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah012
            #add-point:BEFORE FIELD stah012 name="input.b.page1.stah012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah012
            
            #add-point:AFTER FIELD stah012 name="input.a.page1.stah012"
            IF NOT cl_null( g_stah_d[l_ac].stah012) THEN
               IF g_stah_d[l_ac].stah012 <> g_stah_d_o.stah012 OR cl_null(g_stah_d_o.stah012) THEN   #170124-00012#1 170124 by 02749 add
                  IF g_stah_d[l_ac].stah012 <=0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = '-32406'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_stah_d[l_ac].stah012 = g_stah_d_t.stah012   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah012 = g_stah_d_o.stah012   #170124-00012#1 170124 by 02749 add
                     NEXT FIELD stah012
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add   
            END IF
            LET g_stah_d_o.stah012 = g_stah_d[l_ac].stah012   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah012
            #add-point:ON CHANGE stah012 name="input.g.page1.stah012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah013
            #add-point:BEFORE FIELD stah013 name="input.b.page1.stah013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah013
            
            #add-point:AFTER FIELD stah013 name="input.a.page1.stah013"
            LET g_stah_d_o.stah013 = g_stah_d[l_ac].stah013   #170124-00012#1 170124 by 02749 add
            
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_required_b(l_cmd)
            CALL astm201_set_required_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF
               
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah013
            #add-point:ON CHANGE stah013 name="input.g.page1.stah013"
            IF NOT cl_null(g_stah_d[l_ac].stah013) THEN
               IF g_stah_d[l_ac].stah013 <> '1' THEN    #保底
                  CALL cl_set_comp_entry('stah014,stah015',TRUE)
                  CALL cl_set_comp_required('stah014,stah015',TRUE)
               ELSE
                  LET g_stah_d[l_ac].stah014 = ''
                  LET g_stah_d[l_ac].stah015 = ''
                  CALL cl_set_comp_entry('stah014,stah015',FALSE)
                  CALL cl_set_comp_required('stah014,stah015',FALSE)
               END IF
            END IF
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah014
            #add-point:BEFORE FIELD stah014 name="input.b.page1.stah014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah014
            
            #add-point:AFTER FIELD stah014 name="input.a.page1.stah014"
            IF NOT cl_null(g_stah_d[l_ac].stah014) THEN
               IF g_stah_d[l_ac].stah014 <> g_stah_d_o.stah014 OR cl_null(g_stah_d_o.stah014) THEN   #170124-00012#1 170124 by 02749 add
                  IF g_stah_d[l_ac].stah014 <=0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = '-32406'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                    #LET g_stah_d[l_ac].stah014 = g_stah_d_t.stah014   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah014 = g_stah_d_o.stah014   #170124-00012#1 170124 by 02749 add
                     NEXT FIELD stah014
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add   
            END IF
            
            LET g_stah_d_o.stah014 = g_stah_d[l_ac].stah014   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah014
            #add-point:ON CHANGE stah014 name="input.g.page1.stah014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah015
            #add-point:BEFORE FIELD stah015 name="input.b.page1.stah015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah015
            
            #add-point:AFTER FIELD stah015 name="input.a.page1.stah015"
            IF NOT cl_null(g_stah_d[l_ac].stah015) THEN
               IF g_stah_d[l_ac].stah015 <> g_stah_d_o.stah015 OR cl_null(g_stah_d_o.stah015) THEN   #170124-00012#1 170124 by 02749 add
                  IF g_stah_d[l_ac].stah015 <=0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = '-32406'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                    #LET g_stah_d[l_ac].stah015 = g_stah_d_t.stah015   #170124-00012#1 170124 by 02749 mark
                     LET g_stah_d[l_ac].stah015 = g_stah_d_o.stah015   #170124-00012#1 170124 by 02749 add
                     NEXT FIELD stah015
                  END IF
               END IF   #170124-00012#1 170124 by 02749 add
            END IF
            
            LET g_stah_d_o.stah015 = g_stah_d[l_ac].stah015   #170124-00012#1 170124 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah015
            #add-point:ON CHANGE stah015 name="input.g.page1.stah015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stah016
            #add-point:BEFORE FIELD stah016 name="input.b.page1.stah016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stah016
            
            #add-point:AFTER FIELD stah016 name="input.a.page1.stah016"
            LET g_stah_d_o.stah016 = g_stah_d[l_ac].stah016   #170124-00012#1 170124 by 02749 add
            
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_required_b(l_cmd)
            CALL astm201_set_required_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            IF g_stah_d[l_ac].stah016 ='1' AND g_stai_d.getLength() > 0 THEN
                IF cl_ask_confirm('ast-00018') THEN
                   DELETE FROM stai_t
                    WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND
                        # stai002 = g_stah_d_t.stah002                                    #170124-00012#1 170124 by 02749 mark
                         (stai002 = g_stah_d_t.stah002 OR stai002 = g_stah_d_o.stah002)   #170124-00012#1 170124 by 02749 add
                    CALL g_stai_d.clear()
                ELSE
                   #LET g_stah_d[l_ac].stah016 = g_stah_d_t.stah016   #170124-00012#1 170124 by 02749 mark
                    LET g_stah_d[l_ac].stah016 = g_stah_d_o.stah016   #170124-00012#1 170124 by 02749 add
                END IF       
             END IF 
            # 2015/04/27  geaz add   150402-00005#28
            IF g_stag_m.stag002 = '4' THEN
               CALL cl_set_comp_visible('stah013',FALSE)
               CALL cl_set_comp_visible('stah014',FALSE)
               CALL cl_set_comp_visible('stah015',FALSE)
               CALL cl_set_comp_visible('stah016',FALSE)
               CALL cl_set_comp_visible('group5',FALSE)
            ELSE
               CALL cl_set_comp_visible('stah013',TRUE)
               CALL cl_set_comp_visible('stah014',TRUE)
               CALL cl_set_comp_visible('stah015',TRUE)
               CALL cl_set_comp_visible('stah016',TRUE)
               CALL cl_set_comp_visible('group5',TRUE)
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stah016
            #add-point:ON CHANGE stah016 name="input.g.page1.stah016"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stah002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah002
            #add-point:ON ACTION controlp INFIELD stah002 name="input.c.page1.stah002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah003
            #add-point:ON ACTION controlp INFIELD stah003 name="input.c.page1.stah003"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stah_d[l_ac].stah003             #給予default值
            LET g_qryparam.default2 = "" #g_stah_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stah_d[l_ac].stae001 #費用編號

            #給予arg
            IF g_stag_m.stag002 NOT MATCHES "[1-5]" THEN
               CALL q_stae001_3()
            ELSE      
               CALL q_stae001()                                #呼叫開窗
            END IF

            LET g_stah_d[l_ac].stah003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stah_d[l_ac].stael003 = g_qryparam.return2 #說明
            #LET g_stah_d[l_ac].stae001 = g_qryparam.return3 #費用編號

            DISPLAY g_stah_d[l_ac].stah003 TO stah003              #顯示到畫面上
            #DISPLAY g_stah_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stah_d[l_ac].stae001 TO stae001 #費用編號
           
            CALL astm201_stah003_ref()  
            NEXT FIELD stah003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stah017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah017
            #add-point:ON ACTION controlp INFIELD stah017 name="input.c.page1.stah017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah004
            #add-point:ON ACTION controlp INFIELD stah004 name="input.c.page1.stah004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah005
            #add-point:ON ACTION controlp INFIELD stah005 name="input.c.page1.stah005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah006
            #add-point:ON ACTION controlp INFIELD stah006 name="input.c.page1.stah006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah007
            #add-point:ON ACTION controlp INFIELD stah007 name="input.c.page1.stah007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah008
            #add-point:ON ACTION controlp INFIELD stah008 name="input.c.page1.stah008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah009
            #add-point:ON ACTION controlp INFIELD stah009 name="input.c.page1.stah009"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stah_d[l_ac].stah009             #給予default值
            LET g_qryparam.default2 = "" #g_stah_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stah_d[l_ac].stabl004 #助記碼

            #給予arg
            LET g_qryparam.arg1 = g_stag_m.stag002
            LET g_qryparam.arg2 = g_stag_m.stag005            
            CALL q_stab001_3()                                #呼叫開窗

            LET g_stah_d[l_ac].stah009 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stah_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stah_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stah_d[l_ac].stah009 TO stah009              #顯示到畫面上
            #DISPLAY g_stah_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stah_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astm201_stah009_ref()
            NEXT FIELD stah009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stah010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah010
            #add-point:ON ACTION controlp INFIELD stah010 name="input.c.page1.stah010"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stah_d[l_ac].stah010             #給予default值
            LET g_qryparam.default2 = "" #g_stah_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stah_d[l_ac].stabl004 #助記碼

            #給予arg
            LET g_qryparam.arg1 = g_stag_m.stag002
            LET g_qryparam.arg2 = g_stag_m.stag005 
            CALL q_stab001_3()                                #呼叫開窗

            LET g_stah_d[l_ac].stah010 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stah_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stah_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stah_d[l_ac].stah010 TO stah010              #顯示到畫面上
            #DISPLAY g_stah_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stah_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astm201_stah010_ref()
            NEXT FIELD stah010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stah011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah011
            #add-point:ON ACTION controlp INFIELD stah011 name="input.c.page1.stah011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah012
            #add-point:ON ACTION controlp INFIELD stah012 name="input.c.page1.stah012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah013
            #add-point:ON ACTION controlp INFIELD stah013 name="input.c.page1.stah013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah014
            #add-point:ON ACTION controlp INFIELD stah014 name="input.c.page1.stah014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah015
            #add-point:ON ACTION controlp INFIELD stah015 name="input.c.page1.stah015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stah016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stah016
            #add-point:ON ACTION controlp INFIELD stah016 name="input.c.page1.stah016"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stah_d[l_ac].* = g_stah_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm201_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stah_d[l_ac].stah002 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stah_d[l_ac].* = g_stah_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astm201_stah_t_mask_restore('restore_mask_o')
      
               UPDATE stah_t SET (stah001,stah002,stah003,stah017,stah004,stah005,stah006,stah007,stah008, 
                   stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016) = (g_stag_m.stag001, 
                   g_stah_d[l_ac].stah002,g_stah_d[l_ac].stah003,g_stah_d[l_ac].stah017,g_stah_d[l_ac].stah004, 
                   g_stah_d[l_ac].stah005,g_stah_d[l_ac].stah006,g_stah_d[l_ac].stah007,g_stah_d[l_ac].stah008, 
                   g_stah_d[l_ac].stah009,g_stah_d[l_ac].stah010,g_stah_d[l_ac].stah011,g_stah_d[l_ac].stah012, 
                   g_stah_d[l_ac].stah013,g_stah_d[l_ac].stah014,g_stah_d[l_ac].stah015,g_stah_d[l_ac].stah016) 
 
                WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001 
 
                  AND stah002 = g_stah_d_t.stah002 #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stah_d[l_ac].* = g_stah_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stah_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stah_d[l_ac].* = g_stah_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys_bak[1] = g_stag001_t
               LET gs_keys[2] = g_stah_d[g_detail_idx].stah002
               LET gs_keys_bak[2] = g_stah_d_t.stah002
               CALL astm201_update_b('stah_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astm201_stah_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stah_d[g_detail_idx].stah002 = g_stah_d_t.stah002 
 
                  ) THEN
                  LET gs_keys[01] = g_stag_m.stag001
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stah_d_t.stah002
 
                  CALL astm201_key_update_b(gs_keys,'stah_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stag_m),util.JSON.stringify(g_stah_d_t)
               LET g_log2 = util.JSON.stringify(g_stag_m),util.JSON.stringify(g_stah_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astm201_unlock_b("stah_t","'1'")
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
               LET g_stah_d[li_reproduce_target].* = g_stah_d[li_reproduce].*
 
               LET g_stah_d[li_reproduce_target].stah002 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stah_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stah_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stah3_d FROM s_detail3.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body3.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stah3_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm201_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stah3_d.getLength()
            #add-point:資料輸入前 name="input.body3.before_input"
 
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stah3_d[l_ac].* TO NULL 
            INITIALIZE g_stah3_d_t.* TO NULL 
            INITIALIZE g_stah3_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_stah3_d[l_ac].stbq009 = "0"
 
            #add-point:modify段before備份 name="input.body3.insert.before_bak"
            #160513-00033#1 160525 by sakura add(S)
            LET g_stah3_d[l_ac].stbq005 = '1'
            LET g_stah3_d[l_ac].stbq007 = g_today
            LET g_stah3_d[l_ac].stbq008 = g_today
            LET g_stah3_d[l_ac].stbq012 = '1'
            IF l_ac > 1 THEN
               LET g_stah3_d[l_ac].stbq011 = g_stah3_d[l_ac-1].stbq011
               CALL astm201_stbq011_ref()
            END IF            
            #160513-00033#1 160525 by sakura add(E)
            #end add-point
            LET g_stah3_d_t.* = g_stah3_d[l_ac].*     #新輸入資料
            LET g_stah3_d_o.* = g_stah3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm201_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body3.insert.after_set_entry_b"
            #160513-00033#1 160525 by sakura add(S)
            #項次
            SELECT MAX(stbq002)+1 INTO g_stah3_d[l_ac].stbq002 
              FROM stbq_t
             WHERE stbqent = g_enterprise 
			      AND stbq001 = g_stag_m.stag001  
            IF cl_null(g_stah3_d[l_ac].stbq002) THEN             
               LET g_stah3_d[l_ac].stbq002 = 1
            END IF            
            #160513-00033#1 160525 by sakura add(E)
            #end add-point
            CALL astm201_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stah3_d[li_reproduce_target].* = g_stah3_d[li_reproduce].*
 
               LET g_stah3_d[li_reproduce_target].stbq002 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body3.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body3.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[2] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 2
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm201_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm201_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stah3_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stah3_d[l_ac].stbq002 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stah3_d_t.* = g_stah3_d[l_ac].*  #BACKUP
               LET g_stah3_d_o.* = g_stah3_d[l_ac].*  #BACKUP
               CALL astm201_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body3.after_set_entry_b"
               
               #end add-point  
               CALL astm201_set_no_entry_b(l_cmd)
               IF NOT astm201_lock_b("stbq_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm201_bcl2 INTO g_stah3_d[l_ac].stbq002,g_stah3_d[l_ac].stbq003,g_stah3_d[l_ac].stbq004, 
                      g_stah3_d[l_ac].stbq005,g_stah3_d[l_ac].stbq006,g_stah3_d[l_ac].stbq007,g_stah3_d[l_ac].stbq008, 
                      g_stah3_d[l_ac].stbq009,g_stah3_d[l_ac].stbq010,g_stah3_d[l_ac].stbq011,g_stah3_d[l_ac].stbq012, 
                      g_stah3_d[l_ac].stbq013,g_stah3_d[l_ac].stbq014,g_stah3_d[l_ac].stbq015
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stah3_d_mask_o[l_ac].* =  g_stah3_d[l_ac].*
                  CALL astm201_stbq_t_mask()
                  LET g_stah3_d_mask_n[l_ac].* =  g_stah3_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm201_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body3.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body3.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body3.b_delete_ask"
               
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
               
               #add-point:單身2刪除前 name="input.body3.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stag_m.stag001
               LET gs_keys[gs_keys.getLength()+1] = g_stah3_d_t.stbq002
            
               #刪除同層單身
               IF NOT astm201_delete_b('stbq_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm201_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm201_key_delete_b(gs_keys,'stbq_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm201_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body3.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astm201_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body3.a_delete"
               
               #end add-point
               LET l_count = g_stah_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body3.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stah3_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
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
               
            #add-point:單身2新增前 name="input.body3.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbq_t 
             WHERE stbqent = g_enterprise AND stbq001 = g_stag_m.stag001
               AND stbq002 = g_stah3_d[l_ac].stbq002
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body3.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys[2] = g_stah3_d[g_detail_idx].stbq002
               CALL astm201_insert_b('stbq_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body3.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stah_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm201_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body3.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stah3_d[l_ac].* = g_stah3_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm201_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stah3_d[l_ac].* = g_stah3_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body3.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astm201_stbq_t_mask_restore('restore_mask_o')
                              
               UPDATE stbq_t SET (stbq001,stbq002,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009, 
                   stbq010,stbq011,stbq012,stbq013,stbq014,stbq015) = (g_stag_m.stag001,g_stah3_d[l_ac].stbq002, 
                   g_stah3_d[l_ac].stbq003,g_stah3_d[l_ac].stbq004,g_stah3_d[l_ac].stbq005,g_stah3_d[l_ac].stbq006, 
                   g_stah3_d[l_ac].stbq007,g_stah3_d[l_ac].stbq008,g_stah3_d[l_ac].stbq009,g_stah3_d[l_ac].stbq010, 
                   g_stah3_d[l_ac].stbq011,g_stah3_d[l_ac].stbq012,g_stah3_d[l_ac].stbq013,g_stah3_d[l_ac].stbq014, 
                   g_stah3_d[l_ac].stbq015) #自訂欄位頁簽
                WHERE stbqent = g_enterprise AND stbq001 = g_stag_m.stag001
                  AND stbq002 = g_stah3_d_t.stbq002 #項次 
                  
               #add-point:單身page2修改中 name="input.body3.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stah3_d[l_ac].* = g_stah3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbq_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stah3_d[l_ac].* = g_stah3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys_bak[1] = g_stag001_t
               LET gs_keys[2] = g_stah3_d[g_detail_idx].stbq002
               LET gs_keys_bak[2] = g_stah3_d_t.stbq002
               CALL astm201_update_b('stbq_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astm201_stbq_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stah3_d[g_detail_idx].stbq002 = g_stah3_d_t.stbq002 
                  ) THEN
                  LET gs_keys[01] = g_stag_m.stag001
                  LET gs_keys[gs_keys.getLength()+1] = g_stah3_d_t.stbq002
                  CALL astm201_key_update_b(gs_keys,'stbq_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stag_m),util.JSON.stringify(g_stah3_d_t)
               LET g_log2 = util.JSON.stringify(g_stag_m),util.JSON.stringify(g_stah3_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body3.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq002
            #add-point:BEFORE FIELD stbq002 name="input.b.page3.stbq002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq002
            
            #add-point:AFTER FIELD stbq002 name="input.a.page3.stbq002"
            IF NOT cl_null(g_stah3_d[l_ac].stbq002) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stah3_d[l_ac].stbq002 != g_stah3_d_o.stbq002 OR g_stah3_d_o.stbq002 IS NULL )) THEN
                  LET l_cnt = 0
                  SELECT count(1) INTO l_cnt  #160905-00007#15 by 08172 *变1
                    FROM stbq_t
                   WHERE stbqent = g_enterprise
                     AND stbq001 = g_stag_m.stag001
					      AND stbq002 = g_stah3_d[l_ac].stbq002
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00004"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     LET  g_stah3_d[l_ac].stbq002 = g_stah3_d_o.stbq002
                     NEXT FIELD CURRENT
                  END IF  
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq002
            #add-point:ON CHANGE stbq002 name="input.g.page3.stbq002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq003
            
            #add-point:AFTER FIELD stbq003 name="input.a.page3.stbq003"
            LET g_stah3_d[l_ac].stbq003_desc = ''
            IF NOT cl_null(g_stah3_d[l_ac].stbq003) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stah3_d[l_ac].stbq003 != g_stah3_d_o.stbq003 OR g_stah3_d_o.stbq003 IS NULL )) THEN
                  IF NOT s_azzi650_chk_exist('2147',g_stah3_d[l_ac].stbq003) THEN
                     LET g_stah3_d[l_ac].stbq003  = g_stah3_d_o.stbq003
                     CALL s_desc_get_acc_desc('2147',g_stah3_d[l_ac].stbq003) RETURNING g_stah3_d[l_ac].stbq003_desc
                     DISPLAY BY NAME g_stah3_d[l_ac].stbq003_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF   
            CALL s_desc_get_acc_desc('2147',g_stah3_d[l_ac].stbq003) RETURNING g_stah3_d[l_ac].stbq003_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq003_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq003
            #add-point:BEFORE FIELD stbq003 name="input.b.page3.stbq003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq003
            #add-point:ON CHANGE stbq003 name="input.g.page3.stbq003"
          
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq004
            
            #add-point:AFTER FIELD stbq004 name="input.a.page3.stbq004"
            #160513-00033#1 160525 by sakura add(S)
            LET g_stah3_d[l_ac].stbq004_desc = ''
            LET g_stah3_d[l_ac].stbq004_desc_desc = ''
            IF NOT cl_null(g_stah3_d[l_ac].stbq004) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stah3_d[l_ac].stbq004 != g_stah3_d_o.stbq004 OR g_stah3_d_o.stbq004 IS NULL )) THEN
                  CALL s_aimm200_chk_item(g_stah3_d[l_ac].stbq004) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     LET g_stah3_d[l_ac].stbq004 = g_stah3_d_o.stbq004
                     NEXT FIELD CURRENT
                  END IF
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stag_m.stagunit
                  LET g_chkparam.arg2 = g_stah3_d[l_ac].stbq004
                  IF NOT cl_chk_exist("v_imaf001_3") THEN
                     LET g_stah3_d[l_ac].stbq004 = g_stah3_d_o.stbq004
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_item_desc(g_stah3_d[l_ac].stbq004) RETURNING g_stah3_d[l_ac].stbq004_desc,g_stah3_d[l_ac].stbq004_desc_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq004_desc,g_stah3_d[l_ac].stbq004_desc_desc
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq004
            #add-point:BEFORE FIELD stbq004 name="input.b.page3.stbq004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq004
            #add-point:ON CHANGE stbq004 name="input.g.page3.stbq004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq005
            #add-point:BEFORE FIELD stbq005 name="input.b.page3.stbq005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq005
            
            #add-point:AFTER FIELD stbq005 name="input.a.page3.stbq005"
            #160704-00007#1 160705 by sakura mark(S)
            ##160629-00005#1 160630 by sakura add(S)            
            #IF g_stah3_d[l_ac].stbq005 = '1' THEN
            #   LET g_stah3_d[l_ac].stbq007 = NULL
            #   LET g_stah3_d[l_ac].stbq008 = NULL
            #END IF
            ##160629-00005#1 160630 by sakura add(E)
            #160704-00007#1 160705 by sakura mark(E)
            #Add By Ken 160613(S)修正bug(s)
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #Add By Ken 160613(S)修正bug(e)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq005
            #add-point:ON CHANGE stbq005 name="input.g.page3.stbq005"
            IF g_stah3_d[l_ac].stbq005 = '1' THEN
               LET g_stah3_d[l_ac].stbq006 = NULL
               #160704-00007#1 160705 by sakura add(S)
               IF cl_null(g_stah3_d[l_ac].stbq007) OR cl_null(g_stah3_d[l_ac].stbq008) THEN
                  LET g_stah3_d[l_ac].stbq007 = g_today
                  LET g_stah3_d[l_ac].stbq008 = g_today
               END IF
               #160704-00007#1 160705 by sakura add(E)               
            END IF
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq006
            #add-point:BEFORE FIELD stbq006 name="input.b.page3.stbq006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq006
            
            #add-point:AFTER FIELD stbq006 name="input.a.page3.stbq006"
            #Add By Ken 160613(S)修正bug(s)
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #Add By Ken 160613(S)修正bug(e)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq006
            #add-point:ON CHANGE stbq006 name="input.g.page3.stbq006"
            #160513-00033#1 160614 by sakura add(S)
            IF g_stah3_d[l_ac].stbq006 MATCHES "[1-3]" THEN
               LET g_stah3_d[l_ac].stbq007 = NULL
               LET g_stah3_d[l_ac].stbq008 = NULL
            ELSE
               LET g_stah3_d[l_ac].stbq007 = g_today
               LET g_stah3_d[l_ac].stbq008 = g_today            
            END IF
            #160513-00033#1 160614 by sakura add(E)            
            #Add By Ken 160613(S)修正bug(s)
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #Add By Ken 160613(S)修正bug(e)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq007
            #add-point:BEFORE FIELD stbq007 name="input.b.page3.stbq007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq007
            
            #add-point:AFTER FIELD stbq007 name="input.a.page3.stbq007"
            #160513-00033#1 160525 by sakura add(S)
            IF NOT cl_null(g_stah3_d[l_ac].stbq007) AND NOT cl_null(g_stah3_d[l_ac].stbq008) THEN
               IF g_stah3_d[l_ac].stbq007 > g_stah3_d[l_ac].stbq008 THEN
                  LET g_stah3_d[l_ac].stbq007 = g_stah3_d_o.stbq007
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00063"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF            
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq007
            #add-point:ON CHANGE stbq007 name="input.g.page3.stbq007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq008
            #add-point:BEFORE FIELD stbq008 name="input.b.page3.stbq008"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq008
            
            #add-point:AFTER FIELD stbq008 name="input.a.page3.stbq008"
            #160513-00033#1 160525 by sakura add(S)
            IF NOT cl_null(g_stah3_d[l_ac].stbq007) AND NOT cl_null(g_stah3_d[l_ac].stbq008) THEN
               IF g_stah3_d[l_ac].stbq008 < g_stah3_d[l_ac].stbq007 THEN
                  LET g_stah3_d[l_ac].stbq008 = g_stah3_d_o.stbq008
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00786"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF            
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq008
            #add-point:ON CHANGE stbq008 name="input.g.page3.stbq008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq009
            #add-point:BEFORE FIELD stbq009 name="input.b.page3.stbq009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq009
            
            #add-point:AFTER FIELD stbq009 name="input.a.page3.stbq009"
            #160513-00033#1 160525 by sakura add(S)
            IF NOT cl_null(g_stah3_d[l_ac].stbq009) THEN
               IF g_stah3_d[l_ac].stbq009 < 0 THEN
                  LET g_stah3_d[l_ac].stbq009 = g_stah3_d_o.stbq009
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_stah3_d[l_ac].stbq009) AND NOT cl_null(g_stah3_d[l_ac].stbq010) THEN
               IF g_stah3_d[l_ac].stbq009 > g_stah3_d[l_ac].stbq010 THEN
                  LET g_stah3_d[l_ac].stbq009 = g_stah3_d_o.stbq009
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00783'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq009
            #add-point:ON CHANGE stbq009 name="input.g.page3.stbq009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq010
            #add-point:BEFORE FIELD stbq010 name="input.b.page3.stbq010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq010
            
            #add-point:AFTER FIELD stbq010 name="input.a.page3.stbq010"
            #160513-00033#1 160525 by sakura add(S)
            IF NOT cl_null(g_stah3_d[l_ac].stbq010) THEN
               IF g_stah3_d[l_ac].stbq010 < 0 THEN
                  LET g_stah3_d[l_ac].stbq010 = g_stah3_d_o.stbq010
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_stah3_d[l_ac].stbq009) AND NOT cl_null(g_stah3_d[l_ac].stbq010) THEN
               IF g_stah3_d[l_ac].stbq009 > g_stah3_d[l_ac].stbq010 THEN
                  LET g_stah3_d[l_ac].stbq010 = g_stah3_d_o.stbq010
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00783'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF            
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq010
            #add-point:ON CHANGE stbq010 name="input.g.page3.stbq010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq011
            
            #add-point:AFTER FIELD stbq011 name="input.a.page3.stbq011"
            LET g_stah3_d[l_ac].stbq011_desc = ''
            IF NOT cl_null(g_stah3_d[l_ac].stbq011) THEN               
               IF NOT astm201_stbq011_chk(g_stah3_d[l_ac].stbq011) THEN
                  LET g_stah3_d[l_ac].stbq011 = g_stah3_d_o.stbq011
                  CALL astm201_stbq011_ref()
                  NEXT FIELD CURRENT
               END IF

            END IF
            CALL astm201_stbq011_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq011
            #add-point:BEFORE FIELD stbq011 name="input.b.page3.stbq011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq011
            #add-point:ON CHANGE stbq011 name="input.g.page3.stbq011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq012
            #add-point:BEFORE FIELD stbq012 name="input.b.page3.stbq012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq012
            
            #add-point:AFTER FIELD stbq012 name="input.a.page3.stbq012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq012
            #add-point:ON CHANGE stbq012 name="input.g.page3.stbq012"
            CASE g_stah3_d[l_ac].stbq012
              WHEN '1'   #1.折扣比率
                LET g_stah3_d[l_ac].stbq014 = NULL
                CALL astm201_set_entry_b(l_cmd)
                CALL astm201_set_no_entry_b(l_cmd)
              WHEN '2'   #2.固定金額
                LET g_stah3_d[l_ac].stbq013 = NULL
                CALL astm201_set_entry_b(l_cmd)
                CALL astm201_set_no_entry_b(l_cmd)                
            END CASE
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq013
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stah3_d[l_ac].stbq013,"0","1","100","1","azz-00087",1) THEN
               NEXT FIELD stbq013
            END IF 
 
 
 
            #add-point:AFTER FIELD stbq013 name="input.a.page3.stbq013"
            #160513-00033#1 160525 by sakura add(S)
            #IF NOT cl_null(g_stah3_d[l_ac].stbq013) THEN
            #   IF NOT cl_ap_chk_range(g_stah3_d[l_ac].stbq013,"0","1","100","1","azz-00087",1) THEN
            #      NEXT FIELD stbq013
            #   END IF
            #END IF
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq013
            #add-point:BEFORE FIELD stbq013 name="input.b.page3.stbq013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq013
            #add-point:ON CHANGE stbq013 name="input.g.page3.stbq013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq014
            #add-point:BEFORE FIELD stbq014 name="input.b.page3.stbq014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq014
            
            #add-point:AFTER FIELD stbq014 name="input.a.page3.stbq014"
            #160513-00033#1 160525 by sakura add(S)
            IF NOT cl_null(g_stah3_d[l_ac].stbq014) THEN
               IF g_stah3_d[l_ac].stbq014 < 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq014
            #add-point:ON CHANGE stbq014 name="input.g.page3.stbq014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbq015
            
            #add-point:AFTER FIELD stbq015 name="input.a.page3.stbq015"
            #160513-00033#1 160525 by sakura add(S)
            LET g_stah3_d[l_ac].stbq015_desc = ''
            IF NOT cl_null(g_stah3_d[l_ac].stbq015) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stah3_d[l_ac].stbq015 != g_stah3_d_o.stbq015 OR g_stah3_d_o.stbq015 IS NULL )) THEN
                  IF NOT s_azzi650_chk_exist('2146',g_stah3_d[l_ac].stbq015) THEN
                     LET g_stah3_d[l_ac].stbq015  = g_stah3_d_o.stbq015
                     CALL s_desc_get_acc_desc('2146',g_stah3_d[l_ac].stbq015) RETURNING g_stah3_d[l_ac].stbq015_desc
                     DISPLAY BY NAME g_stah3_d[l_ac].stbq015_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF   
            CALL s_desc_get_acc_desc('2146',g_stah3_d[l_ac].stbq015) RETURNING g_stah3_d[l_ac].stbq015_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq015_desc
            #160513-00033#1 160525 by sakura add(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbq015
            #add-point:BEFORE FIELD stbq015 name="input.b.page3.stbq015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbq015
            #add-point:ON CHANGE stbq015 name="input.g.page3.stbq015"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page3.stbq002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq002
            #add-point:ON ACTION controlp INFIELD stbq002 name="input.c.page3.stbq002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq003
            #add-point:ON ACTION controlp INFIELD stbq003 name="input.c.page3.stbq003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stah3_d[l_ac].stbq003             #給予default值
            LET g_qryparam.default2 = "" #g_stah3_d[l_ac].oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = '2147'
            CALL q_oocq002()                                #呼叫開窗
            LET g_stah3_d[l_ac].stbq003 = g_qryparam.return1              
            DISPLAY g_stah3_d[l_ac].stbq003 TO stbq003              #
            CALL s_desc_get_acc_desc('2147',g_stah3_d[l_ac].stbq003) RETURNING g_stah3_d[l_ac].stbq003_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq003_desc            
            NEXT FIELD stbq003                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq004
            #add-point:ON ACTION controlp INFIELD stbq004 name="input.c.page3.stbq004"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stah3_d[l_ac].stbq004             #給予default值
            CALL q_imaa001()                                #呼叫開窗
            LET g_stah3_d[l_ac].stbq004 = g_qryparam.return1              
            DISPLAY g_stah3_d[l_ac].stbq004 TO stbq004              #
            CALL s_desc_get_item_desc(g_stah3_d[l_ac].stbq004) RETURNING g_stah3_d[l_ac].stbq004_desc,g_stah3_d[l_ac].stbq004_desc_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq004_desc,g_stah3_d[l_ac].stbq004_desc_desc            
            NEXT FIELD stbq004                          #返回原欄
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq005
            #add-point:ON ACTION controlp INFIELD stbq005 name="input.c.page3.stbq005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq006
            #add-point:ON ACTION controlp INFIELD stbq006 name="input.c.page3.stbq006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq007
            #add-point:ON ACTION controlp INFIELD stbq007 name="input.c.page3.stbq007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq008
            #add-point:ON ACTION controlp INFIELD stbq008 name="input.c.page3.stbq008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq009
            #add-point:ON ACTION controlp INFIELD stbq009 name="input.c.page3.stbq009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq010
            #add-point:ON ACTION controlp INFIELD stbq010 name="input.c.page3.stbq010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq011
            #add-point:ON ACTION controlp INFIELD stbq011 name="input.c.page3.stbq011"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stah3_d[l_ac].stbq011             #給予default值
            LET g_qryparam.arg1 = g_stag_m.stag002
            LET g_qryparam.arg2 = g_stag_m.stag005
            CALL q_stab001_3()                                #呼叫開窗
            LET g_stah3_d[l_ac].stbq011 = g_qryparam.return1              
            DISPLAY g_stah3_d[l_ac].stbq011 TO stbq011
            CALL astm201_stbq011_ref()
            NEXT FIELD stbq011                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq012
            #add-point:ON ACTION controlp INFIELD stbq012 name="input.c.page3.stbq012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq013
            #add-point:ON ACTION controlp INFIELD stbq013 name="input.c.page3.stbq013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq014
            #add-point:ON ACTION controlp INFIELD stbq014 name="input.c.page3.stbq014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stbq015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbq015
            #add-point:ON ACTION controlp INFIELD stbq015 name="input.c.page3.stbq015"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stah3_d[l_ac].stbq015             #給予default值
            LET g_qryparam.arg1 = '2146'
            CALL q_oocq002()                                #呼叫開窗
            LET g_stah3_d[l_ac].stbq015 = g_qryparam.return1
            DISPLAY g_stah3_d[l_ac].stbq015 TO stbq015
            CALL s_desc_get_acc_desc('2146',g_stah3_d[l_ac].stbq015) RETURNING g_stah3_d[l_ac].stbq015_desc
            DISPLAY BY NAME g_stah3_d[l_ac].stbq015_desc            
            NEXT FIELD stbq015                          #返回原欄位



            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body3.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stah3_d[l_ac].* = g_stah3_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm201_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm201_unlock_b("stbq_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body3.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body3.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stah3_d[li_reproduce_target].* = g_stah3_d[li_reproduce].*
 
               LET g_stah3_d[li_reproduce_target].stbq002 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stah3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stah3_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astm201.input.other" >}
      
      #add-point:自定義input name="input.more_input"
             INPUT ARRAY g_stai_d FROM s_detail2.*
          ATTRIBUTE(COUNT = g_rec_b2,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 

         BEFORE INPUT
          
            IF g_stah_d[l_ac].stah016 = '1' OR  cl_null(g_stah_d[l_ac].stah016) THEN 
               NEXT FIELD stah002
            END IF
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stai_d.getLength()+1) 
              LET g_insert = 'N' 
            END IF 

            CALL astm201_b2_fill()
            LET g_rec_b2 = g_stai_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac2 = ARR_CURR()
            LET g_detail_idx2 = l_ac2
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac2 TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm201_cl USING g_enterprise,g_stag_m.stag001

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astm201_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astm201_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b2 = g_stai_d.getLength()
            
            IF g_rec_b2 >= l_ac2 
               AND NOT cl_null(g_stai_d[l_ac2].stai003) 

            THEN
               LET l_cmd='u'
               LET g_stai_d_t.* = g_stai_d[l_ac2].*  #BACKUP
               CALL astm201_set_entry_b(l_cmd)
               CALL astm201_set_no_entry_b(l_cmd)
               IF NOT astm201_lock_b("stai_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm201_stai_bcl2 INTO g_stai_d[l_ac2].stai003,  g_stai_d[l_ac2].stai004,g_stai_d[l_ac2].stai005,g_stai_d[l_ac2].stai006
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stai_d_t.stai003
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astm201_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
      
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stai_d[l_ac2].* TO NULL 
            
            LET g_stai_d_t.* = g_stai_d[l_ac2].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm201_set_entry_b(l_cmd)
            CALL astm201_set_no_entry_b(l_cmd)
            #公用欄位給值(單身)
            
   
            SELECT MAX(stai003)+1 INTO  g_stai_d[l_ac2].stai003 FROM stai_t
             WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND stai002 =g_stah_d[l_ac].stah002  
            IF cl_null(  g_stai_d[l_ac2].stai003 ) THEN             
               LET  g_stai_d[l_ac2].stai003 = 1
            END IF
            
            SELECT MAX(stai005)+1 INTO  g_stai_d[l_ac2].stai004 FROM stai_t
             WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND stai002 =g_stah_d[l_ac].stah002  
            IF cl_null(  g_stai_d[l_ac2].stai004 ) THEN             
               LET  g_stai_d[l_ac2].stai003 = 1
            END IF          
        
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增

            #end add-point
			   
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stai_t   #160905-00007#15 by 08172 *变1
             WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001

               AND stai002 = g_stah_d[l_ac].stah002 AND stai003 = g_stai_d[l_ac2].stai003

                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前

               #end add-point
            
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys[2] = g_stah_d[l_ac].stah002
               CALL astm201_insert_b('stai_t',gs_keys,"'3'")
                           
               #add-point:單身新增後

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_stai_d[l_ac2].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stai_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
              
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b2 = g_rec_b2 + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF NOT cl_null(g_stai_d[l_ac2].stai003) 

               THEN 
               
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  -263
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前

               #end add-point 
               
               DELETE FROM stai_t
                WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 AND

                      stai002 = g_stah_d[l_ac].stah002 AND stai003 =  g_stai_d_t.stai003

                  
               #add-point:單身刪除中

               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stai_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b2 = g_rec_b2-1
                  
                  #add-point:單身刪除後

                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE astm201_stai_bcl2
               LET l_count = g_stai_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stag_m.stag001
               LET gs_keys[2] = g_stah_d[l_ac].stah002



         
         AFTER FIELD stai004,stai005
            IF NOT cl_null(g_stai_d[l_ac2].stai004) THEN
               IF g_stai_d[l_ac2].stai004 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stai_d[l_ac2].stai004 = g_stai_d_t.stai004
                  NEXT FIELD stai004
               END IF
            END IF
            IF NOT cl_null(g_stai_d[l_ac2].stai005) THEN
               IF g_stai_d[l_ac2].stai005 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stai_d[l_ac2].stai005 = g_stai_d_t.stai005
                  NEXT FIELD stai005
               END IF
            END IF
            IF NOT cl_null(g_stai_d[l_ac2].stai004) AND NOT cl_null(g_stai_d[l_ac2].stai005) THEN
               IF g_stai_d[l_ac2].stai005 < g_stai_d[l_ac2].stai004 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00017'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
            
               SELECT COUNT(1) INTO l_n FROM stai_t  #160905-00007#15 by 08172 *变1
                WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 
                  AND stai002 = g_stah_d[l_ac].stah002
                  AND ((stai004 between g_stai_d[l_ac2].stai004 AND g_stai_d[l_ac2].stai005)
                      OR (stai005 between g_stai_d[l_ac2].stai004 AND g_stai_d[l_ac2].stai005)
                      OR (g_stai_d[l_ac2].stai004  between stai004 AND stai005)
                      OR (g_stai_d[l_ac2].stai005  between stai004 AND stai005))
                  AND stai003 <> g_stai_d[l_ac2].stai003
               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00016'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
             
            END IF
         
     
         
         
         AFTER FIELD stai006
            IF NOT cl_null(g_stai_d[l_ac2].stai006) THEN
               IF g_stai_d[l_ac2].stai006<= 0 THEN
                 INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                 LET g_stai_d[l_ac2].stai006 = g_stai_d_t.stai006
                 NEXT FIELD stai006
               END IF
            END IF
         
     
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stai_d[l_ac2].* = g_stai_d_t.*
               CLOSE astm201_stai_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stai_d[l_ac2].stai003
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stai_d[l_ac2].* = g_stai_d_t.*
            ELSE
            
               #add-point:單身修改前

               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stai_t SET (stai003,stai004,stai005,stai006) = (g_stai_d[l_ac2].stai003,g_stai_d[l_ac2].stai004,g_stai_d[l_ac2].stai005,g_stai_d[l_ac2].stai006)
                WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001 
                  AND stai002 = g_stah_d[l_ac].stah002 #項次   
                  AND stai003 = g_stai_d_t.stai003
                  
               #add-point:單身修改中

               #end add-point
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stai_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
   
                  LET g_stai_d[l_ac2].* = g_stai_d_t.*
             
                  
               END IF
               
               #add-point:單身修改後

               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astm201_unlock_b("stai_t","'2'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 

            #end add-point   
              
     
                 
      END INPUT      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail3",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            NEXT FIELD stagunit
            #end add-point  
            NEXT FIELD stag001
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stah002
               WHEN "s_detail3"
                  NEXT FIELD stbq002
 
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
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
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
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astm201_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astm201_b_fill() #單身填充
      CALL astm201_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astm201_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
      
   CALL astm201_stag007_ref()
   
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stag_m.stag001
    CALL ap_ref_array2(g_ref_fields," SELECT stagl003 FROM stagl_t WHERE staglent = '"||g_enterprise||"' AND stagl001 = ? AND stagl002 = '"||g_dlang||"'","") RETURNING g_rtn_fields 
    LET g_stag_m.stagl003 = g_rtn_fields[1] 
    DISPLAY BY NAME g_stag_m.stagl003
    
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stag_m.stag001
    CALL ap_ref_array2(g_ref_fields," SELECT stagl004 FROM stagl_t WHERE staglent = '"||g_enterprise||"' AND stagl001 = ? AND stagl002 = '"||g_dlang||"'","") RETURNING g_rtn_fields 
    LET g_stag_m.stagl004 = g_rtn_fields[1] 
    DISPLAY BY NAME g_stag_m.stagl004
   
  # INITIALIZE g_ref_fields TO NULL
  # LET g_ref_fields[1] = g_stag_m.stag004
  # CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
  # LET g_stag_m.stag004_desc = '', g_rtn_fields[1] , ''
  # DISPLAY BY NAME g_stag_m.stag004_desc
  # 
  # 
  #  INITIALIZE g_ref_fields TO NULL
  #  LET g_ref_fields[1] = g_stag_m.stag005
  #  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
  #  LET g_stag_m.stag005_desc = '', g_rtn_fields[1] , ''
  #  DISPLAY BY NAME g_stag_m.stag005_desc
  # 
  # 
  #  INITIALIZE g_ref_fields TO NULL
  #  LET g_ref_fields[1] = g_stag_m.stag006
  #  CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
  #  LET g_stag_m.stag006_desc = '', g_rtn_fields[1] , ''
  #  DISPLAY BY NAME g_stag_m.stag006_desc
  # 
  # SELECT oodbl004 INTO g_stag_m.stag007_desc  FROM oodbl_t,ooef_t
  #  WHERE oodblent = g_enterprise AND oodbl001 = ooef019 
  #    AND oodbl002 = g_stag_m.stag007  AND oodbl003 = g_dlang
  #    AND ooefent = g_enterprise AND ooef001 = g_site
  #  DISPLAY BY NAME g_stag_m.stag007_desc
  # 
  # 
  # INITIALIZE g_ref_fields TO NULL
  # LET g_ref_fields[1] = g_stag_m.stag008
  # CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  # LET g_stag_m.stag008_desc = '', g_rtn_fields[1] , ''
  # DISPLAY BY NAME g_stag_m.stag008_desc 
  # 
  # 
  # 
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagownid
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagownid_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagownid_desc
  #
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagowndp
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagowndp_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagowndp_desc
  #
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagcrtid
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagcrtid_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagcrtid_desc
  #
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagcrtdp
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagcrtdp_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagcrtdp_desc
  #
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagmodid
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagmodid_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagmodid_desc
  #          
  #          INITIALIZE g_ref_fields TO NULL
  #          LET g_ref_fields[1] = g_stag_m.stagcnfid
  #          CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
  #          LET g_stag_m.stagcnfid_desc = '', g_rtn_fields[1] , ''
  #          DISPLAY BY NAME g_stag_m.stagcnfid_desc
   #end add-point
   
   #遮罩相關處理
   LET g_stag_m_mask_o.* =  g_stag_m.*
   CALL astm201_stag_t_mask()
   LET g_stag_m_mask_n.* =  g_stag_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stagunit_desc,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004, 
       g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag003_desc,g_stag_m.stag004,g_stag_m.stag004_desc, 
       g_stag_m.stag005,g_stag_m.stag005_desc,g_stag_m.stag006,g_stag_m.stag006_desc,g_stag_m.stag007, 
       g_stag_m.stag007_desc,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagownid_desc,g_stag_m.stagowndp, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp,g_stag_m.stagcrtdp_desc, 
       g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmodid_desc,g_stag_m.stagmoddt,g_stag_m.stagcnfid, 
       g_stag_m.stagcnfid_desc,g_stag_m.stagcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stag_m.stagstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stah_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
   #              INITIALIZE g_ref_fields TO NULL
   #        LET g_ref_fields[1] = g_stah_d[l_ac].stah003
   #        CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   #        LET g_stah_d[l_ac].stah003_desc = '', g_rtn_fields[1] , ''
   #        DISPLAY BY NAME g_stah_d[l_ac].stah003_desc
   #        
   #        CALL astm201_stah009_ref()
   #        CALL astm201_stah010_ref()


      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stah3_d.getLength()
      #add-point:show段單身reference name="show.body3.reference"
 
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astm201_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astm201_detail_show()
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
 
{<section id="astm201.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astm201_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stag_t.stag001 
   DEFINE l_oldno     LIKE stag_t.stag001 
 
   DEFINE l_master    RECORD LIKE stag_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stah_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stbq_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_insert    LIKE type_t.num5
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET g_master_insert = FALSE
   
   IF g_stag_m.stag001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stag001_t = g_stag_m.stag001
 
    
   LET g_stag_m.stag001 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stag_m.stagownid = g_user
      LET g_stag_m.stagowndp = g_dept
      LET g_stag_m.stagcrtid = g_user
      LET g_stag_m.stagcrtdp = g_dept 
      LET g_stag_m.stagcrtdt = cl_get_current()
      LET g_stag_m.stagmodid = g_user
      LET g_stag_m.stagmoddt = cl_get_current()
      LET g_stag_m.stagstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
         LET g_stag_m.stag001 = ''
      LET g_stag_m.stagstus = 'N'
      LET g_stag_m.stagcnfid = ""
      LET g_stag_m.stagcnfdt = ""
      LET g_stag_m.stagcnfid_desc = ''
      LET g_stag_m.stagmodid_desc = ''
      DISPLAY BY NAME g_stag_m.*
      CALL s_aooi500_default(g_prog,'stagunit',g_site) RETURNING l_insert,g_stag_m.stagunit
      IF NOT l_insert THEN
         RETURN
      END IF
      CALL astm201_stagunit_ref()
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stag_m.stagstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astm201_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stag_m.* TO NULL
      INITIALIZE g_stah_d TO NULL
      INITIALIZE g_stah3_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astm201_show()
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
   CALL astm201_set_act_visible()   
   CALL astm201_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stag001_t = g_stag_m.stag001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stagent = " ||g_enterprise|| " AND",
                      " stag001 = '", g_stag_m.stag001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm201_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astm201_idx_chk()
   
   LET g_data_owner = g_stag_m.stagownid      
   LET g_data_dept  = g_stag_m.stagowndp
   
   #功能已完成,通報訊息中心
   CALL astm201_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astm201_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stah_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stbq_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astm201_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stah_t
    WHERE stahent = g_enterprise AND stah001 = g_stag001_t
 
    INTO TEMP astm201_detail
 
   #將key修正為調整後   
   UPDATE astm201_detail 
      #更新key欄位
      SET stah001 = g_stag_m.stag001
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stah_t SELECT * FROM astm201_detail
   
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
   DROP TABLE astm201_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
       #CREATE TEMP TABLE
   LET ls_sql = "CREATE GLOBAL TEMPORARY TABLE astm201_detail AS ",
                "SELECT * FROM stai_t "
   PREPARE repro_tb2 FROM ls_sql
   EXECUTE repro_tb2
   FREE repro_tb2
                
   #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astm201_detail SELECT * FROM stai_t 
                                         WHERE staient = g_enterprise AND stai001 = g_stag001_t
 
   
   #將key修正為調整後   
   UPDATE astm201_detail 
      #更新key欄位
      SET stai001 = g_stag_m.stag001
 
      #更新共用欄位
      
                                       
  
   #將資料塞回原table   
   INSERT INTO stai_t SELECT * FROM astm201_detail
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "reproduce"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF
   
   DROP TABLE astm201_detail
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbq_t 
    WHERE stbqent = g_enterprise AND stbq001 = g_stag001_t
 
    INTO TEMP astm201_detail
 
   #將key修正為調整後   
   UPDATE astm201_detail SET stbq001 = g_stag_m.stag001
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stbq_t SELECT * FROM astm201_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm201_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stag001_t = g_stag_m.stag001
 
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astm201_delete()
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
   
   IF g_stag_m.stag001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   LET g_master_multi_table_t.stagl001 = g_stag_m.stag001
LET g_master_multi_table_t.stagl003 = g_stag_m.stagl003
LET g_master_multi_table_t.stagl004 = g_stag_m.stagl004
 
   
   CALL s_transaction_begin()
 
   OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm201_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm201_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astm201_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stag_m_mask_o.* =  g_stag_m.*
   CALL astm201_stag_t_mask()
   LET g_stag_m_mask_n.* =  g_stag_m.*
   
   CALL astm201_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astm201_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stag001_t = g_stag_m.stag001
 
 
      DELETE FROM stag_t
       WHERE stagent = g_enterprise AND stag001 = g_stag_m.stag001
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stag_m.stag001,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
            DELETE FROM stagl_t WHERE staglent =  g_enterprise 
         AND stagl001 = g_stag_m.stag001
       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del stagl_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF 
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
             DELETE FROM stai_t
       WHERE staient = g_enterprise AND stai001 = g_stag_m.stag001
       IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stai_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
       END IF   
      CALL g_stai_d.clear()
      #end add-point
      
      DELETE FROM stah_t
       WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
           
      #end add-point
      
            
                                                               
      #add-point:單身刪除前 name="delete.body.b_delete2"
      
      #end add-point
      DELETE FROM stbq_t
       WHERE stbqent = g_enterprise AND
             stbq001 = g_stag_m.stag001
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stag_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astm201_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stah_d.clear() 
      CALL g_stah3_d.clear()       
 
     
      CALL astm201_ui_browser_refresh()  
      #CALL astm201_ui_headershow()  
      #CALL astm201_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      INITIALIZE l_var_keys_bak TO NULL 
   INITIALIZE l_field_keys   TO NULL 
   LET l_var_keys_bak[01] = g_enterprise
   LET l_field_keys[01] = 'staglent'
   LET l_var_keys_bak[02] = g_master_multi_table_t.stagl001
   LET l_field_keys[02] = 'stagl001'
   CALL cl_multitable_delete(l_field_keys,l_var_keys_bak,'stagl_t')
 
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astm201_browser_fill("")
         CALL astm201_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astm201_cl
 
   #功能已完成,通報訊息中心
   CALL astm201_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astm201.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astm201_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stah_d.clear()
   CALL g_stah3_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astm201_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stah002,stah003,stah017,stah004,stah005,stah006,stah007,stah008, 
             stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016 ,t1.stael003 ,t2.stabl003 , 
             t3.stabl003 FROM stah_t",   
                     " INNER JOIN stag_t ON stagent = " ||g_enterprise|| " AND stag001 = stah001 ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stah003 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t2 ON t2.stablent="||g_enterprise||" AND t2.stabl001=stah009 AND t2.stabl002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t3 ON t3.stablent="||g_enterprise||" AND t3.stabl001=stah010 AND t3.stabl002='"||g_dlang||"' ",
 
                     " WHERE stahent=? AND stah001=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
      
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stah_t.stah002"
         
         #add-point:單身填充控制 name="b_fill.sql"
            LET g_sql = "SELECT  UNIQUE stah002,stah003,stah017,stah004,stah005,stah006,stah007,stah008,stah009,stah010, 
          stah011,stah012,stah013,stah014,stah015,stah016 ,t1.stael003 ,t2.stabl003 ,t3.stabl003 FROM stah_t",   
                  " INNER JOIN stag_t ON stag001 = stah001 ",
                  " LEFT JOIN stai_t ON staient = stahent AND stah001 = stai001 AND stah002 = stai002 ",  
                  "",
                  " LEFT JOIN stael_t t1 ON t1.staelent='"||g_enterprise||"' AND t1.stael001=stah003 AND t1.stael002='"||g_dlang||"' ",
                  " LEFT JOIN stabl_t t2 ON t2.stablent='"||g_enterprise||"' AND t2.stabl001=stah009 AND t2.stabl002='"||g_dlang||"' ",
                  " LEFT JOIN stabl_t t3 ON t3.stablent='"||g_enterprise||"' AND t3.stabl001=stah010 AND t3.stabl002='"||g_dlang||"' ",
                  " WHERE stahent=? AND stah001=?"
      
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      IF NOT cl_null(g_wc_stai) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc_stai CLIPPED
      END IF 
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stah_t.stah002"
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm201_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astm201_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stag_m.stag001   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stag_m.stag001 INTO g_stah_d[l_ac].stah002,g_stah_d[l_ac].stah003, 
          g_stah_d[l_ac].stah017,g_stah_d[l_ac].stah004,g_stah_d[l_ac].stah005,g_stah_d[l_ac].stah006, 
          g_stah_d[l_ac].stah007,g_stah_d[l_ac].stah008,g_stah_d[l_ac].stah009,g_stah_d[l_ac].stah010, 
          g_stah_d[l_ac].stah011,g_stah_d[l_ac].stah012,g_stah_d[l_ac].stah013,g_stah_d[l_ac].stah014, 
          g_stah_d[l_ac].stah015,g_stah_d[l_ac].stah016,g_stah_d[l_ac].stah003_desc,g_stah_d[l_ac].stah009_desc, 
          g_stah_d[l_ac].stah010_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
   #            INITIALIZE g_ref_fields TO NULL
   #   LET g_ref_fields[1] = g_stah_d[l_ac].stah003
   #   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   #   LET g_stah_d[l_ac].stah003_desc = '', g_rtn_fields[1] , ''
   #
   #      CALL astm201_stah009_ref()
   #      CALL astm201_stah010_ref()
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
    
   #判斷是否填充
   IF astm201_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbq002,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009, 
             stbq010,stbq011,stbq012,stbq013,stbq014,stbq015 ,t4.oocql004 ,t5.imaal003 ,t6.imaal004 , 
             t7.stabl003 ,t8.oocql004 FROM stbq_t",   
                     " INNER JOIN  stag_t ON stagent = " ||g_enterprise|| " AND stag001 = stbq001 ",
 
                     "",
                     
                                    " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2147' AND t4.oocql002=stbq003 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t5 ON t5.imaalent="||g_enterprise||" AND t5.imaal001=stbq004 AND t5.imaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t6 ON t6.imaalent="||g_enterprise||" AND t6.imaal001=stbq004 AND t6.imaal002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t7 ON t7.stablent="||g_enterprise||" AND t7.stabl001=stbq011 AND t7.stabl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t8 ON t8.oocqlent="||g_enterprise||" AND t8.oocql001='2146' AND t8.oocql002=stbq015 AND t8.oocql003='"||g_dlang||"' ",
 
                     " WHERE stbqent=? AND stbq001=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbq_t.stbq002"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm201_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astm201_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stag_m.stag001   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stag_m.stag001 INTO g_stah3_d[l_ac].stbq002,g_stah3_d[l_ac].stbq003, 
          g_stah3_d[l_ac].stbq004,g_stah3_d[l_ac].stbq005,g_stah3_d[l_ac].stbq006,g_stah3_d[l_ac].stbq007, 
          g_stah3_d[l_ac].stbq008,g_stah3_d[l_ac].stbq009,g_stah3_d[l_ac].stbq010,g_stah3_d[l_ac].stbq011, 
          g_stah3_d[l_ac].stbq012,g_stah3_d[l_ac].stbq013,g_stah3_d[l_ac].stbq014,g_stah3_d[l_ac].stbq015, 
          g_stah3_d[l_ac].stbq003_desc,g_stah3_d[l_ac].stbq004_desc,g_stah3_d[l_ac].stbq004_desc_desc, 
          g_stah3_d[l_ac].stbq011_desc,g_stah3_d[l_ac].stbq015_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_stah_d.deleteElement(g_stah_d.getLength())
   CALL g_stah3_d.deleteElement(g_stah3_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astm201_pb
   FREE astm201_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stah_d.getLength()
      LET g_stah_d_mask_o[l_ac].* =  g_stah_d[l_ac].*
      CALL astm201_stah_t_mask()
      LET g_stah_d_mask_n[l_ac].* =  g_stah_d[l_ac].*
   END FOR
   
   LET g_stah3_d_mask_o.* =  g_stah3_d.*
   FOR l_ac = 1 TO g_stah3_d.getLength()
      LET g_stah3_d_mask_o[l_ac].* =  g_stah3_d[l_ac].*
      CALL astm201_stbq_t_mask()
      LET g_stah3_d_mask_n[l_ac].* =  g_stah3_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astm201_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stah_t
       WHERE stahent = g_enterprise AND
         stah001 = ps_keys_bak[1] AND stah002 = ps_keys_bak[2]
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
         CALL g_stah_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stbq_t
       WHERE stbqent = g_enterprise AND
             stbq001 = ps_keys_bak[1] AND stbq002 = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stah3_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astm201_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
      LET ls_group = "'3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前

      #end add-point 
      INSERT INTO stai_t
                  (staient,stai001,stai002,stai003,stai004,stai005,stai006)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],
                   g_stai_d[l_ac2].stai003,g_stai_d[l_ac2].stai004,g_stai_d[l_ac2].stai005,g_stai_d[l_ac2].stai006)
      #add-point:insert_b段資料新增中

      #end add-point 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stai_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:insert_b段資料新增後

      #end add-point 
   END IF
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO stah_t
                  (stahent,
                   stah001,
                   stah002
                   ,stah003,stah017,stah004,stah005,stah006,stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stah_d[g_detail_idx].stah003,g_stah_d[g_detail_idx].stah017,g_stah_d[g_detail_idx].stah004, 
                       g_stah_d[g_detail_idx].stah005,g_stah_d[g_detail_idx].stah006,g_stah_d[g_detail_idx].stah007, 
                       g_stah_d[g_detail_idx].stah008,g_stah_d[g_detail_idx].stah009,g_stah_d[g_detail_idx].stah010, 
                       g_stah_d[g_detail_idx].stah011,g_stah_d[g_detail_idx].stah012,g_stah_d[g_detail_idx].stah013, 
                       g_stah_d[g_detail_idx].stah014,g_stah_d[g_detail_idx].stah015,g_stah_d[g_detail_idx].stah016) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stah_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stbq_t
                  (stbqent,
                   stbq001,
                   stbq002
                   ,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009,stbq010,stbq011,stbq012,stbq013,stbq014,stbq015) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stah3_d[g_detail_idx].stbq003,g_stah3_d[g_detail_idx].stbq004,g_stah3_d[g_detail_idx].stbq005, 
                       g_stah3_d[g_detail_idx].stbq006,g_stah3_d[g_detail_idx].stbq007,g_stah3_d[g_detail_idx].stbq008, 
                       g_stah3_d[g_detail_idx].stbq009,g_stah3_d[g_detail_idx].stbq010,g_stah3_d[g_detail_idx].stbq011, 
                       g_stah3_d[g_detail_idx].stbq012,g_stah3_d[g_detail_idx].stbq013,g_stah3_d[g_detail_idx].stbq014, 
                       g_stah3_d[g_detail_idx].stbq015)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stah3_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astm201_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stah_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astm201_stah_t_mask_restore('restore_mask_o')
               
      UPDATE stah_t 
         SET (stah001,
              stah002
              ,stah003,stah017,stah004,stah005,stah006,stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stah_d[g_detail_idx].stah003,g_stah_d[g_detail_idx].stah017,g_stah_d[g_detail_idx].stah004, 
                  g_stah_d[g_detail_idx].stah005,g_stah_d[g_detail_idx].stah006,g_stah_d[g_detail_idx].stah007, 
                  g_stah_d[g_detail_idx].stah008,g_stah_d[g_detail_idx].stah009,g_stah_d[g_detail_idx].stah010, 
                  g_stah_d[g_detail_idx].stah011,g_stah_d[g_detail_idx].stah012,g_stah_d[g_detail_idx].stah013, 
                  g_stah_d[g_detail_idx].stah014,g_stah_d[g_detail_idx].stah015,g_stah_d[g_detail_idx].stah016)  
 
         WHERE stahent = g_enterprise AND stah001 = ps_keys_bak[1] AND stah002 = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stah_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stah_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm201_stah_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbq_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astm201_stbq_t_mask_restore('restore_mask_o')
               
      UPDATE stbq_t 
         SET (stbq001,
              stbq002
              ,stbq003,stbq004,stbq005,stbq006,stbq007,stbq008,stbq009,stbq010,stbq011,stbq012,stbq013,stbq014,stbq015) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stah3_d[g_detail_idx].stbq003,g_stah3_d[g_detail_idx].stbq004,g_stah3_d[g_detail_idx].stbq005, 
                  g_stah3_d[g_detail_idx].stbq006,g_stah3_d[g_detail_idx].stbq007,g_stah3_d[g_detail_idx].stbq008, 
                  g_stah3_d[g_detail_idx].stbq009,g_stah3_d[g_detail_idx].stbq010,g_stah3_d[g_detail_idx].stbq011, 
                  g_stah3_d[g_detail_idx].stbq012,g_stah3_d[g_detail_idx].stbq013,g_stah3_d[g_detail_idx].stbq014, 
                  g_stah3_d[g_detail_idx].stbq015) 
         WHERE stbqent = g_enterprise AND stbq001 = ps_keys_bak[1] AND stbq002 = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbq_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbq_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm201_stbq_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astm201_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astm201.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astm201_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astm201.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astm201_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
      IF ps_table = "stai_t" THEN
      OPEN astm201_stai_bcl2 USING g_enterprise,
                                       g_stag_m.stag001,g_stah_d[l_ac].stah002,g_stai_d[l_ac2].stai003
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astm201_stai_bcl2"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
    
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL astm201_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stah_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astm201_bcl USING g_enterprise,
                                       g_stag_m.stag001,g_stah_d[g_detail_idx].stah002     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm201_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stbq_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm201_bcl2 USING g_enterprise,
                                             g_stag_m.stag001,g_stah3_d[g_detail_idx].stbq002
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm201_bcl2:",SQLERRMESSAGE 
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
 
{<section id="astm201.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astm201_unlock_b(ps_table,ps_page)
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
      CLOSE astm201_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm201_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astm201_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stag001",TRUE)
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stagunit",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astm201_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stag001",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stagunit')  THEN
      CALL cl_set_comp_entry("stagunit",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astm201_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
      DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   
   CALL astm201_init_entry(p_cmd)
   IF g_stah_d[l_ac].stah017 = 'N' THEN #160513-00033#1 160525 by sakura add
      IF NOT cl_null(g_stah_d[l_ac].stah003) THEN
         #檢查費用編號+經營方式是否存在asti204      
         SELECT COUNT(1) INTO l_n FROM staf_t   #160905-00007#15 by 08172 *变1
          WHERE stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
         IF l_n > 0 THEN
            DECLARE sel_staf CURSOR FOR 
             SELECT staf003,staf004,staf005,stafstus FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
            FOREACH sel_staf INTO l_staf003,l_staf004,l_staf005
               LET l_staf003 = cl_str_replace(l_staf003,"stao","stah")
               IF l_staf003 = "stah017" OR l_staf003 = "stah018" THEN
                  CONTINUE FOREACH
               END IF     
               IF l_staf004 = 'Y' THEN
                  CALL cl_set_comp_entry(l_staf003,TRUE)
               END IF                 
            END FOREACH  
         ELSE
             #合同相關欄位必輸控管
             IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
                IF g_stah_d[l_ac].stah016 = '1' THEN      
                   CALL cl_set_comp_entry('stah012',TRUE)
                END IF
                CALL cl_set_comp_entry('stah009,stah010',TRUE)
                CALL cl_set_comp_entry('stah013,stah014,stah015,stah016',TRUE)
             ELSE                                    #固定
                CALL cl_set_comp_entry('stah011',TRUE)
             END IF 
             IF g_stah_d[l_ac].stah013 <> '1' THEN    #保底
                CALL cl_set_comp_entry('stah014,stah015',TRUE)
             END IF      
         END IF    
      ELSE
          #合同相關欄位必輸控管
          IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
             IF g_stah_d[l_ac].stah016 = '1' THEN      
                CALL cl_set_comp_entry('stah012',TRUE)
             END IF
             CALL cl_set_comp_entry('stah009,stah010',TRUE)
             CALL cl_set_comp_entry('stah013,stah014,stah015,stah016',TRUE)
          ELSE                                    #固定
             CALL cl_set_comp_entry('stah011',TRUE)
          END IF 
          IF g_stah_d[l_ac].stah013 <> '1' THEN    #保底
             CALL cl_set_comp_entry('stah014,stah015',TRUE)
          END IF
      END IF
   #160513-00033#1 160525 by sakura add(S)
   ELSE
      CALL cl_set_comp_entry('stah006,stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016',TRUE)
   END IF
   CALL cl_set_comp_entry('stbq006,stbq007,stbq008,stbq013,stbq014',TRUE)
   #160513-00033#1 160525 by sakura add(E)
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astm201_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
      DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
       
  
   IF g_stah_d[l_ac].stah017 = 'N' THEN #參與現金折扣   #160513-00033#1 160525 by sakura add
      IF NOT cl_null(g_stah_d[l_ac].stah003) THEN
         #檢查費用編號+經營方式是否存在asti204
         
         SELECT COUNT(1) INTO l_n FROM staf_t   #160905-00007#15 by 08172 *变1
          WHERE stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
         IF l_n > 0 THEN
            DECLARE sel_staf_ne CURSOR FOR 
             SELECT staf003,staf004,staf005 FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
            FOREACH sel_staf_ne INTO l_staf003,l_staf004,l_staf005
               LET l_staf003 = cl_str_replace(l_staf003,"stao","stah")
                IF l_staf003 = "stah017" OR l_staf003 = "stah018" THEN
                  CONTINUE FOREACH
               END IF
               IF l_staf004 = 'N' THEN
                  CALL cl_set_comp_entry(l_staf003,FALSE)
               END IF
            END FOREACH 
         ELSE
            IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
               IF g_stah_d[l_ac].stah016 <> '1' THEN      
                  LET g_stah_d[l_ac].stah012 = ''
                  CALL cl_set_comp_entry('stah012',FALSE)
               END IF
            ELSE                                    #固定
               LET g_stah_d[l_ac].stah009 = ''
               LET g_stah_d[l_ac].stah009_desc = ''
               LET g_stah_d[l_ac].stah010 = ''
               LET g_stah_d[l_ac].stah010_desc = ''
               LET g_stah_d[l_ac].stah012 = ''
               LET g_stah_d[l_ac].stah013 = '1'
               LET g_stah_d[l_ac].stah014 = ''
               LET g_stah_d[l_ac].stah015 = ''
               LET g_stah_d[l_ac].stah016 = '1'
               CALL cl_set_comp_entry('stah009,stah010,stah012',FALSE)
               CALL cl_set_comp_entry('stah013,stah014,stah015,stah016',FALSE)
            END IF
            
            IF g_stah_d[l_ac].stah013 = '1' THEN    #无保底
               LET g_stah_d[l_ac].stah014 = ''
               LET g_stah_d[l_ac].stah015 = '' 
               CALL cl_set_comp_entry('stah014,stah015',FALSE)
            END IF
            
            IF g_stah_d[l_ac].stah013 = '3' THEN    #保底扣減
               LET g_stah_d[l_ac].stah015 = ''
               CALL cl_set_comp_entry('stah015',FALSE)
            END IF
         END IF  
      ELSE
         IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
            IF g_stah_d[l_ac].stah016 <> '1' THEN      
               LET g_stah_d[l_ac].stah012 = ''
               CALL cl_set_comp_entry('stah012',FALSE)
            END IF
         ELSE                                    #固定
            LET g_stah_d[l_ac].stah009 = ''
            LET g_stah_d[l_ac].stah009_desc = ''
            LET g_stah_d[l_ac].stah010 = ''
            LET g_stah_d[l_ac].stah010_desc = ''
            LET g_stah_d[l_ac].stah012 = ''
            LET g_stah_d[l_ac].stah013 = '1'
            LET g_stah_d[l_ac].stah014 = ''
            LET g_stah_d[l_ac].stah015 = ''
            LET g_stah_d[l_ac].stah016 = '1'
            CALL cl_set_comp_entry('stah009,stah010,stah012',FALSE)
            CALL cl_set_comp_entry('stah013,stah014,stah015,stah016',FALSE)
         END IF
         
         IF g_stah_d[l_ac].stah013 = '1' THEN    #无保底
            LET g_stah_d[l_ac].stah014 = ''
            LET g_stah_d[l_ac].stah015 = '' 
            CALL cl_set_comp_entry('stah014,stah015',FALSE)
         END IF  
         IF g_stah_d[l_ac].stah013 = '3' THEN    #保底扣減
            LET g_stah_d[l_ac].stah015 = ''
            CALL cl_set_comp_entry('stah015',FALSE)
         END IF      
      END IF
   END IF   #160513-00033#1 160525 by sakura add
   
   #160513-00033#1 160525 by sakura add(S)
   IF g_stah_d[l_ac].stah017 = 'Y' THEN #參與現金折扣
      CALL cl_set_comp_entry('stah007,stah008,stah009,stah014,stah015,stah013,stah016',FALSE)
      CASE g_stah_d[l_ac].stah006
        WHEN '1' #計算類型：變動
          LET g_stah_d[l_ac].stah011 = NULL
          CALL cl_set_comp_entry('stah011',FALSE)
        WHEN '2' #計算類型：固定
          LET g_stah_d[l_ac].stah012 = NULL
          CALL cl_set_comp_entry('stah012',FALSE)
      END CASE
   END IF
   #現返類型
   IF g_stah3_d[l_ac].stbq005 = '1' THEN
     CALL cl_set_comp_entry('stbq006',FALSE)
   END IF
   #折扣方式
   CASE g_stah3_d[l_ac].stbq012
     WHEN '1'
       CALL cl_set_comp_entry('stbq014',FALSE)
     WHEN '2'
       CALL cl_set_comp_entry('stbq013',FALSE)
   END CASE
   #160513-00033#1 160525 by sakura add(E)  
   #160704-00007#1 160705 by sakura mark(S)
   #Add By Ken 160613(S)修正bug(s)
   #IF (g_stah3_d[l_ac].stbq005 = '1') THEN
   #   CALL cl_set_comp_entry('stbq007',FALSE)
   #   CALL cl_set_comp_entry('stbq008',FALSE)
   #END IF
   #160704-00007#1 160705 by sakura mark(E)
   #IF (g_stah3_d[l_ac].stbq006 != '4') OR (g_stah3_d[l_ac].stbq006 = '') OR (g_stah3_d[l_ac].stbq006 IS NULL) THEN    #160704-00007#1 160705 by sakura mark
   IF (g_stah3_d[l_ac].stbq006 != '4') THEN     #160704-00007#1 160705 by sakura add
      CALL cl_set_comp_entry('stbq007',FALSE)
      CALL cl_set_comp_entry('stbq008',FALSE)
   END IF   
   #Add By Ken 160613(S)修正bug(e)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astm201_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astm201_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   IF g_stag_m.stagstus  ! = 'N' THEN   # N未確認
      CALL cl_set_act_visible("modify,delete,modify_detail,reproduce", FALSE)
   END IF
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astm201_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm201.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astm201_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm201.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astm201_default_search()
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
      LET ls_wc = ls_wc, " stag001 = '", g_argv[01], "' AND "
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
         INITIALIZE g_wc2_table2 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stag_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stah_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbq_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
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
 
{<section id="astm201.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astm201_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
      DEFINE l_success      LIKE type_t.num5 
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stag_m.stag001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astm201_cl USING g_enterprise,g_stag_m.stag001
   IF STATUS THEN
      CLOSE astm201_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm201_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001,g_stag_m.stag002, 
       g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007,g_stag_m.stagstus, 
       g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp,g_stag_m.stagcrtdt, 
       g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt,g_stag_m.stagunit_desc, 
       g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc,g_stag_m.stagownid_desc, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc,g_stag_m.stagmodid_desc, 
       g_stag_m.stagcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astm201_action_chk() THEN
      CLOSE astm201_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stagunit_desc,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004, 
       g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag003_desc,g_stag_m.stag004,g_stag_m.stag004_desc, 
       g_stag_m.stag005,g_stag_m.stag005_desc,g_stag_m.stag006,g_stag_m.stag006_desc,g_stag_m.stag007, 
       g_stag_m.stag007_desc,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagownid_desc,g_stag_m.stagowndp, 
       g_stag_m.stagowndp_desc,g_stag_m.stagcrtid,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp,g_stag_m.stagcrtdp_desc, 
       g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmodid_desc,g_stag_m.stagmoddt,g_stag_m.stagcnfid, 
       g_stag_m.stagcnfid_desc,g_stag_m.stagcnfdt
 
   CASE g_stag_m.stagstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stag_m.stagstus
            
            WHEN "N"
               HIDE OPTION "open"
            WHEN "Y"
               HIDE OPTION "valid"
            WHEN "X"
               HIDE OPTION "void"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
               CASE g_stag_m.stagstus
            WHEN "Y"
               HIDE OPTION "void"
            WHEN "X"
               HIDE OPTION "valid"
         END CASE
      #end add-point
      
      
	  
      ON ACTION open
         IF cl_auth_chk_act("open") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.open"
         
            #end add-point
         END IF
         EXIT MENU
      ON ACTION valid
         IF cl_auth_chk_act("valid") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.valid"
         
            #end add-point
         END IF
         EXIT MENU
      ON ACTION void
         IF cl_auth_chk_act("void") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.void"
         
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "X"
      ) OR 
      g_stag_m.stagstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astm201_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
      LET l_success = TRUE
   CASE 
      WHEN lc_state = 'Y' AND g_stag_m.stagstus = 'N'
         CALL s_astm201_conf_chk(g_stag_m.stag001) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astm201_conf_upd(g_stag_m.stag001) RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#15
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stag_m.stag001
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#15
            RETURN
         END IF
      WHEN lc_state = 'X' AND g_stag_m.stagstus = 'N'
         CALL s_astm201_void_chk(g_stag_m.stag001) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('art-00039') THEN
               CALL s_transaction_begin()
               CALL s_astm201_void_upd(g_stag_m.stag001) RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#15
               RETURN 
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stag_m.stag001
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#15
            RETURN
         END IF   
       WHEN lc_state = 'N' AND g_stag_m.stagstus = 'X'
         CALL s_astm201_void_chk(g_stag_m.stag001) RETURNING l_success,g_errno
         IF l_success THEN
           IF cl_ask_confirm('art-00038') THEN
              CALL s_transaction_begin()
              CALL s_astm201_void_upd(g_stag_m.stag001) RETURNING l_success
              IF NOT l_success THEN
                 CALL s_transaction_end('N','0')
                 RETURN
              ELSE
                 CALL s_transaction_end('Y','1')
              END IF
           ELSE
              CALL s_transaction_end('N','0')   #160816-00068#15
              RETURN 
           END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stag_m.stag001
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#15
            RETURN
         END IF          
       WHEN lc_state = 'N' AND g_stag_m.stagstus = 'Y'
          CALL s_astm201_unconf_chk(g_stag_m.stag001) RETURNING l_success,g_errno
          IF l_success THEN
             IF cl_ask_confirm('aim-00110') THEN
                CALL s_transaction_begin()
                CALL s_astm201_unconf_upd(g_stag_m.stag001) RETURNING l_success
                IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
                ELSE
                  CALL s_transaction_end('Y','1')
                END IF
             ELSE 
                CALL s_transaction_end('N','0')   #160816-00068#15
                RETURN
             END IF
          ELSE
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = g_errno
             LET g_errparam.extend = g_stag_m.stag001
             LET g_errparam.popup = TRUE
             CALL cl_err()
             CALL s_transaction_end('N','0')   #160816-00068#15
             RETURN
          END IF
                 
               
     END CASE               
   #end add-point
   
   LET g_stag_m.stagmodid = g_user
   LET g_stag_m.stagmoddt = cl_get_current()
   LET g_stag_m.stagstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stag_t 
      SET (stagstus,stagmodid,stagmoddt) 
        = (g_stag_m.stagstus,g_stag_m.stagmodid,g_stag_m.stagmoddt)     
    WHERE stagent = g_enterprise AND stag001 = g_stag_m.stag001
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astm201_master_referesh USING g_stag_m.stag001 INTO g_stag_m.stagunit,g_stag_m.stag001, 
          g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag004,g_stag_m.stag005,g_stag_m.stag006,g_stag_m.stag007, 
          g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagowndp,g_stag_m.stagcrtid,g_stag_m.stagcrtdp, 
          g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmoddt,g_stag_m.stagcnfid,g_stag_m.stagcnfdt, 
          g_stag_m.stagunit_desc,g_stag_m.stag003_desc,g_stag_m.stag004_desc,g_stag_m.stag005_desc,g_stag_m.stag006_desc, 
          g_stag_m.stagownid_desc,g_stag_m.stagowndp_desc,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp_desc, 
          g_stag_m.stagmodid_desc,g_stag_m.stagcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stag_m.stagunit,g_stag_m.stagunit_desc,g_stag_m.stag001,g_stag_m.stagl003,g_stag_m.stagl004, 
          g_stag_m.stag002,g_stag_m.stag003,g_stag_m.stag003_desc,g_stag_m.stag004,g_stag_m.stag004_desc, 
          g_stag_m.stag005,g_stag_m.stag005_desc,g_stag_m.stag006,g_stag_m.stag006_desc,g_stag_m.stag007, 
          g_stag_m.stag007_desc,g_stag_m.stagstus,g_stag_m.stagownid,g_stag_m.stagownid_desc,g_stag_m.stagowndp, 
          g_stag_m.stagowndp_desc,g_stag_m.stagcrtid,g_stag_m.stagcrtid_desc,g_stag_m.stagcrtdp,g_stag_m.stagcrtdp_desc, 
          g_stag_m.stagcrtdt,g_stag_m.stagmodid,g_stag_m.stagmodid_desc,g_stag_m.stagmoddt,g_stag_m.stagcnfid, 
          g_stag_m.stagcnfid_desc,g_stag_m.stagcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astm201_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm201_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm201.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astm201_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stah_d.getLength() THEN
         LET g_detail_idx = g_stah_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stah_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stah_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_stah3_d.getLength() THEN
         LET g_detail_idx = g_stah3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stah3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stah3_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astm201_b_fill2(pi_idx)
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
      CALL astm201_b2_fill()
   CALL astm201_reflesh()
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astm201_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astm201_fill_chk(ps_idx)
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
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astm201.status_show" >}
PRIVATE FUNCTION astm201_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astm201.mask_functions" >}
&include "erp/ast/astm201_mask.4gl"
 
{</section>}
 
{<section id="astm201.signature" >}
   
 
{</section>}
 
{<section id="astm201.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astm201_set_pk_array()
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
   LET g_pk_array[1].values = g_stag_m.stag001
   LET g_pk_array[1].column = 'stag001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm201.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astm201.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astm201_msgcentre_notify(lc_state)
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
   CALL astm201_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stag_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm201.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astm201_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT stagstus  INTO g_stag_m.stagstus
     FROM stag_t
    WHERE stagent = g_enterprise
      AND stag001 = g_stag_m.stag001

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stag_m.stagstus
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
        LET g_errparam.extend = g_stag_m.stag001
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astm201_set_act_visible()
        CALL astm201_set_act_no_visible()
        CALL astm201_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm201.other_function" readonly="Y" >}
#+  檢查結算方式
PUBLIC FUNCTION astm201_stag004_chk(p_staa001)
DEFINE p_staa001  LIKE staa_t.staa001
DEFINE l_staastus LIKE staa_t.staastus

   SELECT staastus INTO l_staastus FROM staa_t 
     WHERE staaent = g_enterprise AND staa001 = p_staa001
     
   IF STATUS = 100 OR cl_null(l_staastus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00003'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_staastus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00004'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
#+ 檢查結算類別
PUBLIC FUNCTION astm201_stag005_chk(p_oocq002)
DEFINE p_oocq002  LIKE oocq_t.oocq002
DEFINE l_oocqstus LIKE oocq_t.oocqstus

   SELECT oocqstus INTO l_oocqstus FROM oocq_t
    WHERE oocqent =  g_enterprise AND oocq001 = '2060' AND oocq002 = p_oocq002
    
   IF STATUS = 100 OR cl_null(l_oocqstus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00005'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_oocqstus = 'N' THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'ast-00006'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()

          RETURN FALSE
      END IF
   END IF
   
  
   RETURN TRUE
END FUNCTION
#+ 檢查營運據點
PUBLIC FUNCTION astm201_stag008_chk(p_ooea001)
 DEFINE p_ooea001   LIKE ooea_t.ooea001
#   DEFINE l_ooeastus  LIKE ooea_t.ooeastus
#   
#   SELECT ooeastus INTO l_ooeastus FROM ooea_t 
#    WHERE ooeaent = g_enterprise  AND ooea001 = p_ooea001  AND ooea004 = 'Y'
#    
#   IF status = 100 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'aoo-00163'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = FALSE
#      CALL cl_err()
#
#      RETURN FALSE
#   END IF  
#   IF l_ooeastus = 'N' THEN 
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'aoo-00012'
#      LET g_errparam.extend = ''
#      LET g_errparam.popup = FALSE
#      CALL cl_err()
#
#      RETURN FALSE
#   END IF
#   RETURN TRUE 
END FUNCTION
#+ 費用編號檢查
PUBLIC FUNCTION astm201_stah003_chk(p_stae001)
DEFINE p_stae001  LIKE stae_t.stae001
DEFINE l_staestus LIKE stae_t.staestus

   #SELECT staestus INTO l_staestus FROM stae_t
   # WHERE stae001 = p_stae001 AND staeent = g_enterprise
   #
   #IF STATUS = 100 OR  cl_null(l_staestus) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'ast-00001'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   RETURN FALSE
   #ELSE
   #   IF l_staestus = 'N' THEN
   #      INITIALIZE g_errparam TO NULL
   #      LET g_errparam.code = 'ast-00002'
   #      LET g_errparam.extend = ''
   #      LET g_errparam.popup = TRUE
   #      CALL cl_err()
   #
   #      RETURN FALSE
   #   END IF
   #END IF
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stae001
   IF g_stag_m.stag002 NOT MATCHES "[1-5]" THEN
      IF NOT cl_chk_exist("v_stae001_1") THEN
         RETURN FALSE
      END IF
   ELSE
      IF NOT cl_chk_exist("v_stae001") THEN
         RETURN FALSE
      END IF
   END IF
   
   RETURN TRUE
    
END FUNCTION
#+
PRIVATE FUNCTION astm201_idx_chk2()
 IF g_current_page = 2 THEN
      LET g_detail_idx2 = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx2 > g_stai_d.getLength() THEN
         LET g_detail_idx2 = g_stai_d.getLength()
      END IF
      IF g_detail_idx2 = 0 AND g_stai_d.getLength() <> 0 THEN
         LET g_detail_idx2 = 1
      END IF
      DISPLAY g_detail_idx2 TO FORMONLY.idx
      DISPLAY g_stai_d.getLength() TO FORMONLY.cnt
   END IF
END FUNCTION
#+
PUBLIC FUNCTION astm201_b2_fill()
 DEFINE p_wc2      STRING
 DEFINE l_a      LIKE type_t.num5
 
   CALL g_stai_d.clear()   
   
   LET g_sql = "SELECT  UNIQUE stai003,stai004,stai005,stai006 FROM stai_t",    
               "",
               " WHERE staient=? AND stai001=? AND stai002 = ?"
 
   IF NOT cl_null(g_wc_stai) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc_stai CLIPPED
   END IF
 
   LET g_sql = g_sql, " ORDER BY stai_t.stai001,stai_t.stai002,stai_t.stai003"
 
   #add-point:單身填充控制

   #end add-point
   
   PREPARE astm201_stai_pb FROM g_sql
   DECLARE b_fill_stai_cs CURSOR FOR astm201_stai_pb
 
   LET g_cnt = l_a
   LET l_a = 1
   IF cl_null(l_ac) OR l_ac = 0 THEN
      LET l_ac = 1
   END IF
   OPEN b_fill_stai_cs USING g_enterprise,g_stag_m.stag001,g_stah_d[l_ac].stah002

                                            
   FOREACH b_fill_stai_cs INTO g_stai_d[l_a].stai003,g_stai_d[l_a].stai004,g_stai_d[l_a].stai005,g_stai_d[l_a].stai006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
     
      #add-point:b_fill段資料填充

      #end add-point
 
      LET l_a = l_a + 1
      IF l_a > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_stai_d.deleteElement(g_stai_d.getLength())

   LET l_a = g_cnt
   LET g_cnt = 0  
   
   FREE astm201_stai_pb
END FUNCTION
#+
PUBLIC FUNCTION astm201_reflesh()
    DISPLAY ARRAY g_stai_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b2)
       BEFORE DISPLAY
         EXIT DISPLAY
    END DISPLAY
END FUNCTION
#+
PUBLIC FUNCTION astm201_stag007_chk(p_stag007)
DEFINE  p_stag007    LIKE stag_t.stag007
DEFINE  l_oodcstus   LIKE oodc_t.oodcstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodcstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise AND oodb001 = ooef019 AND oodb002 = p_stag007 AND oodb004 = '1'
      AND ooefent = g_enterprise AND ooef001 = g_site
   CASE
      WHEN SQLCA.sqlcode = 100 LET g_errno = 'ast-00009' #發票稅目不存在
                               LET g_stag_m.stag007_desc = ''
      WHEN l_oodcstus <> 'Y'   LET g_errno = 'ast-00010' #發票稅目已無效
                               LET  g_stag_m.stag007_desc = ''
   END CASE
   IF cl_null(g_errno) THEN
      RETURN TRUE
   ELSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF

END FUNCTION
#+
PUBLIC FUNCTION astm201_stag006_chk(p_stag006)
DEFINE p_stag006  LIKE stag_t.stag006
  
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = g_site
   LET g_chkparam.arg2 = p_stag006
   
   #160318-00025#37  2016/04/19  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
   #160318-00025#37  2016/04/19  by pengxin  add(E)
               
   IF NOT cl_chk_exist("v_ooaj002") THEN
      RETURN FALSE
   END IF
   RETURN TRUE

END FUNCTION
#+
PUBLIC FUNCTION astm201_set_no_required_b(p_cmd)
 DEFINE p_cmd   LIKE type_t.chr1   
   DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005


   CALL astm201_init_required(p_cmd)
   IF NOT cl_null(g_stah_d[l_ac].stah003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(1) INTO l_n FROM staf_t  #160905-00007#15 by 08172 *变1
       WHERE stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
      IF l_n > 0 THEN
         DECLARE sel_staf_nq CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
         FOREACH sel_staf_nq INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stah")
            #IF l_staf003 = "stah017" OR l_staf003 = "stah018" THEN                           #160513-00033#1 160620 by sakura mark
            IF l_staf003 = "stah017" OR l_staf003 = "stah018" OR l_staf003 = "stah005" THEN   #160513-00033#1 160620 by sakura add
               CONTINUE FOREACH
            END IF
            
            IF l_staf005 = 'N' THEN
               CALL cl_set_comp_required(l_staf003,FALSE)
            END IF
         END FOREACH 
      
      ELSE
          #合同相關欄位必輸控管
          IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
             IF g_stah_d[l_ac].stah016 <> '1' THEN      
                LET g_stah_d[l_ac].stah012 = ''
                CALL cl_set_comp_required('stah012',FALSE)
             END IF
          ELSE                                    #固定
             CALL cl_set_comp_required('stah010',FALSE) 
             LET g_stah_d[l_ac].stah012 = ''
             CALL cl_set_comp_required('stah012',FALSE) 
          END IF   
          IF g_stah_d[l_ac].stah013 = '1' THEN    #保底
             CALL cl_set_comp_required('stah014,stah015',FALSE) 
          END IF
      END IF
   ELSE
      #合同相關欄位必輸控管
       IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
          IF g_stah_d[l_ac].stah016 <> '1' THEN      
             LET g_stah_d[l_ac].stah012 = ''
             CALL cl_set_comp_required('stah012',FALSE)
          END IF
       ELSE                                    #固定
          CALL cl_set_comp_required('stah010',FALSE) 
          LET g_stah_d[l_ac].stah012 = ''
          CALL cl_set_comp_required('stah012',FALSE) 
       END IF   
       IF g_stah_d[l_ac].stah013 = '1' THEN    #保底
          CALL cl_set_comp_required('stah014,stah015',FALSE) 
       END IF   
   END IF  
 
END FUNCTION
#+
PUBLIC FUNCTION astm201_set_required_b(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1   
DEFINE l_n     LIKE type_t.num5
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf004 LIKE staf_t.staf004
DEFINE l_staf005 LIKE staf_t.staf005

  
   IF NOT cl_null(g_stah_d[l_ac].stah003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(1) INTO l_n FROM staf_t   #160905-00007#15 by 08172 *变1
       WHERE stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
      IF l_n > 0 THEN
         DECLARE sel_staf_q CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stah_d[l_ac].stah003 AND staf002 = g_stag_m.stag002
         FOREACH sel_staf_q INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stah")
            #IF l_staf003 = "stah017" OR l_staf003 = "stah018" THEN                           #160513-00033#1 160620 by sakura mark
            IF l_staf003 = "stah017" OR l_staf003 = "stah018" OR l_staf003 = "stah005" THEN   #160513-00033#1 160620 by sakura add
               CONTINUE FOREACH
            END IF
            IF l_staf005 = 'Y' THEN
               CALL cl_set_comp_required(l_staf003,TRUE)
            END IF
         END FOREACH 
      ELSE
          #合同相關欄位必輸控管
         IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
            CALL cl_set_comp_required('stah010',TRUE)
            IF g_stah_d[l_ac].stah016 = '1' THEN      
               CALL cl_set_comp_required('stah012',TRUE) 
            END IF
         ELSE                                    #固定
            CALL cl_set_comp_required('stah011',TRUE)
         END IF   
         IF g_stah_d[l_ac].stah013 <> '1' THEN    #保底
            CALL cl_set_comp_required('stah014,stah015',TRUE)
         END IF       
      END IF 
   ELSE
       #合同相關欄位必輸控管
       IF g_stah_d[l_ac].stah006 = '1' THEN    #變動
          CALL cl_set_comp_required('stah010',TRUE)
          IF g_stah_d[l_ac].stah016 = '1' THEN      
             CALL cl_set_comp_required('stah012',TRUE) 
          END IF
       ELSE                                    #固定
          CALL cl_set_comp_required('stah011',TRUE)
       END IF   
       IF g_stah_d[l_ac].stah013 <> '1' THEN    #保底
          CALL cl_set_comp_required('stah014,stah015',TRUE)
       END IF   
   END IF 
 
END FUNCTION
#+
PUBLIC FUNCTION astm201_stah009_chk(p_stab001)
DEFINE p_stab001   LIKE stab_t.stab001
DEFINE l_stabstus  LIKE stab_t.stabstus
DEFINE l_n         LIKE type_t.num5
  #SELECT stabstus INTO l_stabstus FROM stab_t
  # WHERE stabent = g_enterprise AND stab001 = p_stab001
  # 
  #IF STATUS = 100 OR cl_null(l_stabstus) THEN
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.code = 'ast-00014'
  #   LET g_errparam.extend = ''
  #   LET g_errparam.popup = TRUE
  #   CALL cl_err()
  #
  #   RETURN FALSE
  #ELSE
  #   IF l_stabstus = 'N' THEN
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = 'ast-00015'
  #      LET g_errparam.extend = ''
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #
  #      RETURN FALSE 
  #   END IF
  #END IF
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_stab001
   IF g_stag_m.stag002  MATCHES "[1-5]" THEN
      IF NOT cl_chk_exist("v_stab001") THEN
         RETURN FALSE
      END IF
   ELSE
      IF NOT cl_chk_exist("v_stab001_1") THEN
         RETURN FALSE
      END IF
   END IF
   
#    SELECT COUNT(*) INTO l_n   #160905-00007#15 by 08172
    SELECT COUNT(1) INTO l_n   #160905-00007#15 by 08172
      FROM stab_t 
      LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
#     WHERE  stabent = 99 AND stab001= p_stab001 AND stat001 = g_stag_m.stag002 AND stat002 = g_stag_m.stag005    #160519-00027#1   mark
     WHERE stabent = g_enterprise 
       AND stab001= p_stab001 
       AND stat001 = g_stag_m.stag002 
       AND stat002 = g_stag_m.stag005   #160519-00027#1   add
     
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00189'
      #160513-00033#1 160531 by sakura add(S)
      IF g_stag_m.stag002  MATCHES "[1-5]" THEN
         LET g_errparam.replace[1] = cl_get_progname("asti202",g_lang,"2")
         LET g_errparam.exeprog = "asti202"
      ELSE
         LET g_errparam.replace[1] = cl_get_progname("asti205",g_lang,"2")
         LET g_errparam.exeprog = "asti205"
      END IF
      #160513-00033#1 160531 by sakura add(E)
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   RETURN TRUE
   
END FUNCTION
#+
PUBLIC FUNCTION astm201_default(p_stag002,p_stah003)
DEFINE p_stag002 LIKE stag_t.stag002
DEFINE p_stah003 LIKE stah_t.stah003
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf006 LIKE staf_t.staf006

   DECLARE sel_staf_d CURSOR FOR 
     SELECT staf003,staf006 FROM staf_t
      WHERE  stafent = g_enterprise AND staf001= p_stah003 AND staf002 = p_stag002
        AND stafstus = 'Y'
   FOREACH sel_staf_d INTO l_staf003,l_staf006
      LET l_staf003 = cl_str_replace(l_staf003,"stao","stah")
      CASE l_staf003
          WHEN 'stah004'
             LET g_stah_d[l_ac].stah004 = l_staf006
          WHEN 'stah005'
             IF NOT cl_null(l_staf006) THEN
                LET g_stah_d[l_ac].stah005 = l_staf006
             END IF
          WHEN 'stah006'
             LET g_stah_d[l_ac].stah006 = l_staf006
          WHEN 'stah007'
             LET g_stah_d[l_ac].stah007 = l_staf006
          WHEN 'stah008'
             LET g_stah_d[l_ac].stah008 = l_staf006
          WHEN 'stah009'
             LET g_stah_d[l_ac].stah009 = l_staf006
             CALL astm201_stah009_ref()
          WHEN 'stah010'
             LET g_stah_d[l_ac].stah010 = l_staf006
             CALL astm201_stah010_ref()
          WHEN 'stah011'
             LET g_stah_d[l_ac].stah011 = l_staf006
          WHEN 'stah012'
             LET g_stah_d[l_ac].stah012 = l_staf006
          WHEN 'stah013'
             LET g_stah_d[l_ac].stah013 = l_staf006
          WHEN 'stah014'
             LET g_stah_d[l_ac].stah014 = l_staf006
          WHEN 'stah015'
             LET g_stah_d[l_ac].stah015 = l_staf006
          WHEN 'stah016'
             LET g_stah_d[l_ac].stah016 = l_staf006
       
      END CASE

   END FOREACH 
   DISPLAY BY NAME g_stah_d[l_ac].stah004,g_stah_d[l_ac].stah005,g_stah_d[l_ac].stah006,
                   g_stah_d[l_ac].stah007,g_stah_d[l_ac].stah008,g_stah_d[l_ac].stah009,g_stah_d[l_ac].stah009_desc,
                   g_stah_d[l_ac].stah010,g_stah_d[l_ac].stah010_desc,g_stah_d[l_ac].stah011,g_stah_d[l_ac].stah012,
                   g_stah_d[l_ac].stah013,g_stah_d[l_ac].stah014,g_stah_d[l_ac].stah015,
                   g_stah_d[l_ac].stah016
   
   #170124-00012#1 170124 by 02749 add---(S)   
   LET g_stah_d_o.stah004 = g_stah_d[l_ac].stah004
   LET g_stah_d_o.stah005 = g_stah_d[l_ac].stah005
   LET g_stah_d_o.stah006 = g_stah_d[l_ac].stah006
   LET g_stah_d_o.stah007 = g_stah_d[l_ac].stah007
   LET g_stah_d_o.stah008 = g_stah_d[l_ac].stah008
   LET g_stah_d_o.stah009 = g_stah_d[l_ac].stah009
   LET g_stah_d_o.stah010 = g_stah_d[l_ac].stah010
   LET g_stah_d_o.stah011 = g_stah_d[l_ac].stah011
   LET g_stah_d_o.stah012 = g_stah_d[l_ac].stah012
   LET g_stah_d_o.stah013 = g_stah_d[l_ac].stah013
   LET g_stah_d_o.stah014 = g_stah_d[l_ac].stah014
   LET g_stah_d_o.stah015 = g_stah_d[l_ac].stah015
   LET g_stah_d_o.stah016 = g_stah_d[l_ac].stah016                   
   #170124-00012#1 170124 by 02749 add---(E)   
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stah009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stah_d[l_ac].stah009
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stah_d[l_ac].stah009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stah_d[l_ac].stah009_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stah010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stah_d[l_ac].stah010
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stah_d[l_ac].stah010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stah_d[l_ac].stah010_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stah003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stah_d[l_ac].stah003
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stah_d[l_ac].stah003_desc = '', g_rtn_fields[1] , '' 
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stag_m.stag004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stag_m.stag004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stag_m.stag004_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stag_m.stag005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stag_m.stag005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stag_m.stag005_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stag_m.stag006
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stag_m.stag006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stag_m.stag006_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag007_ref()
   SELECT oodbl004 INTO g_stag_m.stag007_desc
    FROM oodbl_t,ooef_t
   WHERE oodblent = g_enterprise AND oodbl001 = ooef019 
     AND oodbl002 = g_stag_m.stag007  AND oodbl003 = g_dlang
     AND ooefent = g_enterprise AND ooef001 = g_site
   DISPLAY BY NAME g_stag_m.stag007_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag008_ref()
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_stag_m.stag008
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#   LET g_stag_m.stag008_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_stag_m.stag008_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_init_required(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1
   #CALL cl_set_comp_required("stah005,stah006,stah007,stah008,stah009,stah010,stah011,stah013,stah016",TRUE)  #160513-00033#1 160620 by sakura mark
   CALL cl_set_comp_required("stah006,stah007,stah008,stah009,stah010,stah011,stah013,stah016",TRUE)   #160513-00033#1 160620 by sakura add
   CALL cl_set_comp_required("stah004,stah012,stah014,stah015",FALSE)
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_init_entry(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1

   #CALL cl_set_comp_entry("stah004,stah005,stah006,stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016",TRUE)   #160513-00033#1 160620 by sakura mark
   CALL cl_set_comp_entry("stah004,stah006,stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016",TRUE)            #160513-00033#1 160620 by sakura add 
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stag_m.stag003
   CALL ap_ref_array2(g_ref_fields,"SELECT ooibl004 FROM ooibl_t WHERE ooiblent='"||g_enterprise||"' AND ooibl002=? AND ooibl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stag_m.stag003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stag_m.stag003_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stag003_chk()
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stag_m.stag003
   IF g_stag_m.stag002 MATCHES "[1-5]" THEN
      #160318-00025#37  2016/04/19  by pengxin  add(S)
      LET g_errshow = TRUE #是否開窗 
      LET g_chkparam.err_str[1] = "apm-00186:sub-01302|aooi716|",cl_get_progname("aooi716",g_lang,"2"),"|:EXEPROGaooi716"
      #160318-00025#37  2016/04/19  by pengxin  add(E)
      IF NOT cl_chk_exist("v_ooib002") THEN
         RETURN FALSE
      END IF
   ELSE
      #160318-00025#37  2016/04/19  by pengxin  add(S)
      LET g_errshow = TRUE #是否開窗 
      LET g_chkparam.err_str[1] = "apm-00184:sub-01302|aooi714|",cl_get_progname("aooi714",g_lang,"2"),"|:EXEPROGaooi714"
      #160318-00025#37  2016/04/19  by pengxin  add(E)
      IF NOT cl_chk_exist("v_ooib002_1") THEN
         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_b_chk()
DEFINE l_n1        LIKE type_t.num5
DEFINE l_n2        LIKE type_t.num5

#单身条件基准 和单头的结算类型不符合就报错 
#   SELECT COUNT(*) INTO l_n1 FROM stah_t  #160905-00007#15 by 08172
   SELECT COUNT(1) INTO l_n1 FROM stah_t  #160905-00007#15 by 08172
    WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001 AND stah009 IS NOT NULL
      AND  NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stah009 AND stat001 = g_stag_m.stag002 AND stat002 = g_stag_m.stag005)
              
              
#   SELECT COUNT(*) INTO l_n2 FROM stah_t  #160905-00007#15 by 08172
   SELECT COUNT(1) INTO l_n2 FROM stah_t  #160905-00007#15 by 08172
    WHERE stahent = g_enterprise AND stah001 = g_stag_m.stag001 AND stah010 IS NOT NULL
      AND  NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stah010 AND stat001 = g_stag_m.stag002 AND stat002 = g_stag_m.stag005)

   
   IF l_n1 > 0 OR l_n2 > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00110'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   
   RETURN TRUE
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stagunit_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stag_m.stagunit
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stag_m.stagunit_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stag_m.stagunit_desc
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm201_stagunit_chk(p_ooea001)
DEFINE p_ooea001   LIKE ooea_t.ooea001
DEFINE l_ooeastus  LIKE ooea_t.ooeastus
   
   SELECT ooeastus INTO l_ooeastus FROM ooea_t 
    WHERE ooeaent = g_enterprise  AND ooea001 = p_ooea001  AND ooea004 = 'Y'
    
   IF status = 100 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aoo-00163'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()

      RETURN FALSE
   END IF  
   IF l_ooeastus = 'N' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aoo-00012'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()

      RETURN FALSE
   END IF
   RETURN TRUE 
END FUNCTION

################################################################################
# Descriptions...: 單身欄位隱藏
# Memo...........:
# Usage..........: CALL astm201_set_comp_visible_b(p_type)
# Input parameter: p_type        1.程式一進入的欄位隱藏
#                :               2.因欄位值而變動
# Return code....: 無
# Date & Author..: 2016/05/25 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astm201_set_comp_visible_b(p_type)
DEFINE p_type           LIKE type_t.chr1
DEFINE l_ecir0064       LIKE type_t.chr1

   CASE p_type
      WHEN '1'
        CALL cl_get_para(g_enterprise,'','E-CIR-0064') RETURNING l_ecir0064
        IF l_ecir0064 = '1' THEN   #E-CIR-0064:'1.依单据'        
           CALL cl_set_comp_visible('stbq004,stbq004_desc,stbq004_desc_desc',FALSE)   #依单据隐藏商品
        ELSE
           CALL cl_set_comp_visible('stbq003,stbq003_desc',FALSE)   #依商品隐藏摘要
        END IF        
      WHEN '2'
        IF g_stag_m.stag002 <> '11' THEN
           CALL cl_set_comp_visible("stah017",FALSE) #參與現金折扣
           CALL cl_set_comp_visible("page_1",FALSE)  #現返條件
        ELSE
           CALL cl_set_comp_visible("stah017",TRUE) #參與現金折扣
           CALL cl_set_comp_visible("page_1",TRUE)  #現返條件
           CALL cl_set_comp_visible("stah004",FALSE) #會計期間
        END IF
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 計算基準說明
# Memo...........:
# Usage..........: CALL astm201_stbq011_ref()
# Date & Author..: 2016/05/25 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astm201_stbq011_ref()
   SELECT stabl003 INTO g_stah3_d[l_ac].stbq011_desc
     FROM stabl_t 
    WHERE stablent = g_enterprise AND stabl001 = g_stah3_d[l_ac].stbq011 AND stabl002 = g_lang
    
   DISPLAY BY NAME g_stah3_d[l_ac].stbq011_desc
END FUNCTION

################################################################################
# Descriptions...: 計算基準檢查
# Memo...........:
# Usage..........: CALL astm201_stbq011_chk(p_stbq011)
#                  RETURNING _success
# Input parameter: p_stbq011   計算基準
# Return code....: r_success      True/False
# Date & Author..: 2016/05/25 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astm201_stbq011_chk(p_stbq011)
DEFINE p_stbq011   LIKE stbq_t.stbq011
DEFINE r_success   LIKE type_t.num5 
DEFINE l_stabstus  LIKE stab_t.stabstus
DEFINE l_n         LIKE type_t.num5
   
   LET r_success = TRUE
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_stbq011
   IF g_stag_m.stag002  MATCHES "[1-5]" THEN
      IF NOT cl_chk_exist("v_stab001") THEN
         RETURN FALSE
      END IF
   ELSE
      IF NOT cl_chk_exist("v_stab001_1") THEN
         RETURN FALSE
      END IF
   END IF

#   SELECT COUNT(*) INTO l_n   #160905-00007#15 by 08172
   SELECT COUNT(1) INTO l_n   #160905-00007#15 by 08172
     FROM stab_t 
	 LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
    WHERE stabent = g_enterprise 
	  AND stab001 = p_stbq011 
	  AND stat001 = '11'
	  AND stat002 = g_stag_m.stag005
   
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00189'
      #160513-00033#1 160531 by sakura add(S)
      IF g_stag_m.stag002  MATCHES "[1-5]" THEN
         LET g_errparam.replace[1] = cl_get_progname("asti202",g_lang,"2")
         LET g_errparam.exeprog = "asti202"
      ELSE
         LET g_errparam.replace[1] = cl_get_progname("asti205",g_lang,"2")
         LET g_errparam.exeprog = "asti205"
      END IF
      #160513-00033#1 160531 by sakura add(E)      
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION

 
{</section>}
 
