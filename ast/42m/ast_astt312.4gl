#該程式未解開Section, 採用最新樣板產出!
{<section id="astt312.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0010(2015-05-22 09:42:23), PR版次:0010(2016-11-09 17:28:11)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000068
#+ Filename...: astt312
#+ Description: 促銷協議維護作業
#+ Creator....: 02003(2015-05-21 14:48:58)
#+ Modifier...: 02003 -SD/PR- 06137
 
{</section>}
 
{<section id="astt312.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#34..: 2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#  Modify.....:   NO.160816-00068#16    2016/08/19 By 08209    調整transaction
#  Modify.....:   NO.160818-00017#38    2016-08-24 By 08734    删除修改未重新判断状态码
#  Modify.....:   NO.161024-00025#10    2016-10-26 By 06189    aooi500
#  Modify.....:   NO.160824-00007#179   2016/11/09 By 06137    修正舊值備份寫法
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
PRIVATE type type_g_stbh_m        RECORD
       stbhsite LIKE stbh_t.stbhsite, 
   stbhsite_desc LIKE type_t.chr80, 
   stbhdocno LIKE stbh_t.stbhdocno, 
   stbhdocdt LIKE stbh_t.stbhdocdt, 
   stbh001 LIKE stbh_t.stbh001, 
   stbh002 LIKE stbh_t.stbh002, 
   stbh002_desc LIKE type_t.chr80, 
   stbh003 LIKE stbh_t.stbh003, 
   stbh004 LIKE stbh_t.stbh004, 
   stbh004_desc LIKE type_t.chr80, 
   stbh005 LIKE stbh_t.stbh005, 
   stbh005_desc LIKE type_t.chr80, 
   stbh006 LIKE stbh_t.stbh006, 
   stbh007 LIKE stbh_t.stbh007, 
   stbh008 LIKE stbh_t.stbh008, 
   stbh008_desc LIKE type_t.chr80, 
   stbh009 LIKE stbh_t.stbh009, 
   stbh009_desc LIKE type_t.chr80, 
   stbhunit LIKE stbh_t.stbhunit, 
   stbhstus LIKE stbh_t.stbhstus, 
   stbhownid LIKE stbh_t.stbhownid, 
   stbhownid_desc LIKE type_t.chr80, 
   stbhowndp LIKE stbh_t.stbhowndp, 
   stbhowndp_desc LIKE type_t.chr80, 
   stbhcrtid LIKE stbh_t.stbhcrtid, 
   stbhcrtid_desc LIKE type_t.chr80, 
   stbhcrtdp LIKE stbh_t.stbhcrtdp, 
   stbhcrtdp_desc LIKE type_t.chr80, 
   stbhcrtdt LIKE stbh_t.stbhcrtdt, 
   stbhmodid LIKE stbh_t.stbhmodid, 
   stbhmodid_desc LIKE type_t.chr80, 
   stbhmoddt LIKE stbh_t.stbhmoddt, 
   stbhcnfid LIKE stbh_t.stbhcnfid, 
   stbhcnfid_desc LIKE type_t.chr80, 
   stbhcnfdt LIKE stbh_t.stbhcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stbi_d        RECORD
       stbiseq LIKE stbi_t.stbiseq, 
   stbisite LIKE stbi_t.stbisite, 
   stbisite_desc LIKE type_t.chr500, 
   stbi002 LIKE stbi_t.stbi002, 
   stbi001 LIKE stbi_t.stbi001, 
   stbi001_desc LIKE type_t.chr500, 
   stbi001_desc_1 LIKE type_t.chr500, 
   imaa009 LIKE type_t.chr10, 
   imaa009_desc LIKE type_t.chr500, 
   stbi003 LIKE stbi_t.stbi003, 
   stbi005 LIKE stbi_t.stbi005, 
   stbi006 LIKE stbi_t.stbi006, 
   stbi007 LIKE stbi_t.stbi007, 
   stbi004 LIKE stbi_t.stbi004, 
   stbi008 LIKE stbi_t.stbi008, 
   stbi010 LIKE stbi_t.stbi010, 
   stbi011 LIKE stbi_t.stbi011, 
   stbi012 LIKE stbi_t.stbi012, 
   stbi009 LIKE stbi_t.stbi009, 
   stbi013 LIKE stbi_t.stbi013, 
   stbi014 LIKE stbi_t.stbi014, 
   stbi015 LIKE stbi_t.stbi015, 
   stbi016 LIKE stbi_t.stbi016, 
   stbi032 LIKE stbi_t.stbi032, 
   stbi017 LIKE stbi_t.stbi017, 
   stbi018 LIKE stbi_t.stbi018, 
   stbi019 LIKE stbi_t.stbi019, 
   stbi020 LIKE stbi_t.stbi020, 
   stbi021 LIKE stbi_t.stbi021, 
   stbi021_desc LIKE type_t.chr500, 
   stbi022 LIKE stbi_t.stbi022, 
   stbi023 LIKE stbi_t.stbi023, 
   stbi030 LIKE stbi_t.stbi030, 
   stbi024 LIKE stbi_t.stbi024, 
   stbi025 LIKE stbi_t.stbi025, 
   stbi026 LIKE stbi_t.stbi026, 
   stbi027 LIKE stbi_t.stbi027, 
   stbi028 LIKE stbi_t.stbi028, 
   stbi031 LIKE stbi_t.stbi031, 
   stbi029 LIKE stbi_t.stbi029, 
   stbiunit LIKE stbi_t.stbiunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stbhsite LIKE stbh_t.stbhsite,
   b_stbhsite_desc LIKE type_t.chr80,
      b_stbhdocdt LIKE stbh_t.stbhdocdt,
      b_stbhdocno LIKE stbh_t.stbhdocno,
      b_stbh001 LIKE stbh_t.stbh001,
      b_stbh002 LIKE stbh_t.stbh002,
   b_stbh002_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag     LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stbh_m          type_g_stbh_m
DEFINE g_stbh_m_t        type_g_stbh_m
DEFINE g_stbh_m_o        type_g_stbh_m
DEFINE g_stbh_m_mask_o   type_g_stbh_m #轉換遮罩前資料
DEFINE g_stbh_m_mask_n   type_g_stbh_m #轉換遮罩後資料
 
   DEFINE g_stbhdocno_t LIKE stbh_t.stbhdocno
 
 
DEFINE g_stbi_d          DYNAMIC ARRAY OF type_g_stbi_d
DEFINE g_stbi_d_t        type_g_stbi_d
DEFINE g_stbi_d_o        type_g_stbi_d
DEFINE g_stbi_d_mask_o   DYNAMIC ARRAY OF type_g_stbi_d #轉換遮罩前資料
DEFINE g_stbi_d_mask_n   DYNAMIC ARRAY OF type_g_stbi_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
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
 
{<section id="astt312.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5 #add by geza 20161026 #161024-00025#10
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
   LET g_forupd_sql = " SELECT stbhsite,'',stbhdocno,stbhdocdt,stbh001,stbh002,'',stbh003,stbh004,'', 
       stbh005,'',stbh006,stbh007,stbh008,'',stbh009,'',stbhunit,stbhstus,stbhownid,'',stbhowndp,'', 
       stbhcrtid,'',stbhcrtdp,'',stbhcrtdt,stbhmodid,'',stbhmoddt,stbhcnfid,'',stbhcnfdt", 
                      " FROM stbh_t",
                      " WHERE stbhent= ? AND stbhdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt312_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stbhsite,t0.stbhdocno,t0.stbhdocdt,t0.stbh001,t0.stbh002,t0.stbh003, 
       t0.stbh004,t0.stbh005,t0.stbh006,t0.stbh007,t0.stbh008,t0.stbh009,t0.stbhunit,t0.stbhstus,t0.stbhownid, 
       t0.stbhowndp,t0.stbhcrtid,t0.stbhcrtdp,t0.stbhcrtdt,t0.stbhmodid,t0.stbhmoddt,t0.stbhcnfid,t0.stbhcnfdt, 
       t1.ooefl003 ,t2.pmaal004 ,t3.staal003 ,t4.oocql004 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 ,t8.ooefl003 , 
       t9.ooag011 ,t10.ooefl003 ,t11.ooag011 ,t12.ooag011",
               " FROM stbh_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbhsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbh002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t3 ON t3.staalent="||g_enterprise||" AND t3.staal001=t0.stbh004 AND t3.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2060' AND t4.oocql002=t0.stbh005 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stbh008  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stbh009 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.stbhownid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stbhowndp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stbhcrtid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stbhcrtdp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stbhmodid  ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stbhcnfid  ",
 
               " WHERE t0.stbhent = " ||g_enterprise|| " AND t0.stbhdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt312_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt312 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt312_init()   
 
      #進入選單 Menu (="N")
      CALL astt312_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt312
      
   END IF 
   
   CLOSE astt312_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #add by geza 20161026 #161024-00025#10
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt312.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt312_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_gzcbl004   LIKE gzcbl_t.gzcbl004 #add by geza 20160229
   DEFINE l_success LIKE type_t.num5 #add by geza 20161026 #161024-00025#10
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
      CALL cl_set_combo_scc_part('stbhstus','13','N,Y,X')
 
      CALL cl_set_combo_scc('stbh003','6013') 
   CALL cl_set_combo_scc('stbi018','6073') 
   CALL cl_set_combo_scc('stbi024','6812') 
   CALL cl_set_combo_scc('stbi025','6730') 
   CALL cl_set_combo_scc('stbi026','6792') 
   CALL cl_set_combo_scc('stbi029','6812') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stbi025','6730','1,2,3')
   #add by geza 20160229(S)
   #栏位名称重新显示
   CALL s_desc_gzcbl004_desc('6899','4') RETURNING l_gzcbl004
   CALL cl_set_comp_att_text("stbi014",l_gzcbl004)
   CALL s_desc_gzcbl004_desc('6899','5') RETURNING l_gzcbl004
   CALL cl_set_comp_att_text("stbi015",l_gzcbl004)
   CALL s_desc_gzcbl004_desc('6899','6') RETURNING l_gzcbl004
   CALL cl_set_comp_att_text("stbi016",l_gzcbl004)
   #add by geza 20160229(E)     
   CALL s_aooi500_create_temp() RETURNING l_success #add by geza 20161026 #161024-00025#10
   #end add-point
   
   #初始化搜尋條件
   CALL astt312_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt312.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt312_ui_dialog()
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
            CALL astt312_insert()
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
         INITIALIZE g_stbh_m.* TO NULL
         CALL g_stbi_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt312_init()
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
               
               CALL astt312_fetch('') # reload data
               LET l_ac = 1
               CALL astt312_ui_detailshow() #Setting the current row 
         
               CALL astt312_idx_chk()
               #NEXT FIELD stbiseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stbi_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt312_idx_chk()
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
               CALL astt312_idx_chk()
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
            CALL astt312_browser_fill("")
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
               CALL astt312_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt312_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt312_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt312_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt312_set_act_visible()   
            CALL astt312_set_act_no_visible()
            IF NOT (g_stbh_m.stbhdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stbhent = " ||g_enterprise|| " AND",
                                  " stbhdocno = '", g_stbh_m.stbhdocno, "' "
 
               #填到對應位置
               CALL astt312_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stbh_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbi_t" 
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
               CALL astt312_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stbh_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbi_t" 
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
                  CALL astt312_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt312_fetch("F")
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
               CALL astt312_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt312_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt312_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt312_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt312_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt312_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt312_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt312_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt312_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt312_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt312_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stbi_d)
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
               NEXT FIELD stbiseq
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
               CALL astt312_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt312_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt312_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt312_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt312_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt312_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt312_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt312_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt312_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt312_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt312_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stbh_m.stbhdocdt)
 
 
 
         
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
 
{<section id="astt312.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt312_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
 
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
   #add by geza 20161026 #161024-00025#10(S)
   CALL s_aooi500_sql_where(g_prog,'stbhsite') RETURNING l_where
   LET l_wc = l_wc," AND ",l_where
   #add by geza 20161026 #161024-00025#10(E)
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stbhdocno ",
                      " FROM stbh_t ",
                      " ",
                      " LEFT JOIN stbi_t ON stbient = stbhent AND stbhdocno = stbidocno ", "  ",
                      #add-point:browser_fill段sql(stbi_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stbhent = " ||g_enterprise|| " AND stbient = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stbh_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stbhdocno ",
                      " FROM stbh_t ", 
                      "  ",
                      "  ",
                      " WHERE stbhent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stbh_t")
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
      INITIALIZE g_stbh_m.* TO NULL
      CALL g_stbi_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stbhsite,t0.stbhdocdt,t0.stbhdocno,t0.stbh001,t0.stbh002 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbhstus,t0.stbhsite,t0.stbhdocdt,t0.stbhdocno,t0.stbh001,t0.stbh002, 
          t1.ooefl003 ,t2.pmaal004 ",
                  " FROM stbh_t t0",
                  "  ",
                  "  LEFT JOIN stbi_t ON stbient = stbhent AND stbhdocno = stbidocno ", "  ", 
                  #add-point:browser_fill段sql(stbi_t1) name="browser_fill.join.stbi_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbhsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbh002 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbhent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stbh_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbhstus,t0.stbhsite,t0.stbhdocdt,t0.stbhdocno,t0.stbh001,t0.stbh002, 
          t1.ooefl003 ,t2.pmaal004 ",
                  " FROM stbh_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbhsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stbh002 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbhent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stbh_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stbhdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stbh_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stbhsite,g_browser[g_cnt].b_stbhdocdt, 
          g_browser[g_cnt].b_stbhdocno,g_browser[g_cnt].b_stbh001,g_browser[g_cnt].b_stbh002,g_browser[g_cnt].b_stbhsite_desc, 
          g_browser[g_cnt].b_stbh002_desc
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
         CALL astt312_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_stbhdocno) THEN
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
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt312_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stbh_m.stbhdocno = g_browser[g_current_idx].b_stbhdocno   
 
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
   CALL astt312_stbh_t_mask()
   CALL astt312_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt312.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt312_ui_detailshow()
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
 
{<section id="astt312.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt312_ui_browser_refresh()
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
      IF g_browser[l_i].b_stbhdocno = g_stbh_m.stbhdocno 
 
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
 
{<section id="astt312.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt312_construct()
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
   INITIALIZE g_stbh_m.* TO NULL
   CALL g_stbi_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stbhsite,stbhdocno,stbhdocdt,stbh001,stbh002,stbh003,stbh004,stbh005, 
          stbh006,stbh007,stbh008,stbh009,stbhunit,stbhstus,stbhownid,stbhowndp,stbhcrtid,stbhcrtdp, 
          stbhcrtdt,stbhmodid,stbhmoddt,stbhcnfid,stbhcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbhcrtdt>>----
         AFTER FIELD stbhcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stbhmoddt>>----
         AFTER FIELD stbhmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbhcnfdt>>----
         AFTER FIELD stbhcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbhpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stbhsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhsite
            #add-point:ON ACTION controlp INFIELD stbhsite name="construct.c.stbhsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbhsite',g_site,'c') #add by geza 20161026 #161024-00025#10
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhsite  #顯示到畫面上
            NEXT FIELD stbhsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhsite
            #add-point:BEFORE FIELD stbhsite name="construct.b.stbhsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhsite
            
            #add-point:AFTER FIELD stbhsite name="construct.a.stbhsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhdocno
            #add-point:ON ACTION controlp INFIELD stbhdocno name="construct.c.stbhdocno"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stbhdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhdocno  #顯示到畫面上
            NEXT FIELD stbhdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhdocno
            #add-point:BEFORE FIELD stbhdocno name="construct.b.stbhdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhdocno
            
            #add-point:AFTER FIELD stbhdocno name="construct.a.stbhdocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhdocdt
            #add-point:BEFORE FIELD stbhdocdt name="construct.b.stbhdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhdocdt
            
            #add-point:AFTER FIELD stbhdocdt name="construct.a.stbhdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhdocdt
            #add-point:ON ACTION controlp INFIELD stbhdocdt name="construct.c.stbhdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbh001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh001
            #add-point:ON ACTION controlp INFIELD stbh001 name="construct.c.stbh001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stan001_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh001  #顯示到畫面上
            NEXT FIELD stbh001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh001
            #add-point:BEFORE FIELD stbh001 name="construct.b.stbh001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh001
            
            #add-point:AFTER FIELD stbh001 name="construct.a.stbh001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh002
            #add-point:ON ACTION controlp INFIELD stbh002 name="construct.c.stbh002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh002  #顯示到畫面上
            NEXT FIELD stbh002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh002
            #add-point:BEFORE FIELD stbh002 name="construct.b.stbh002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh002
            
            #add-point:AFTER FIELD stbh002 name="construct.a.stbh002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh003
            #add-point:BEFORE FIELD stbh003 name="construct.b.stbh003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh003
            
            #add-point:AFTER FIELD stbh003 name="construct.a.stbh003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh003
            #add-point:ON ACTION controlp INFIELD stbh003 name="construct.c.stbh003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh004
            #add-point:BEFORE FIELD stbh004 name="construct.b.stbh004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh004
            
            #add-point:AFTER FIELD stbh004 name="construct.a.stbh004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh004
            #add-point:ON ACTION controlp INFIELD stbh004 name="construct.c.stbh004"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh004  #顯示到畫面上

            NEXT FIELD stbh004                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh005
            #add-point:BEFORE FIELD stbh005 name="construct.b.stbh005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh005
            
            #add-point:AFTER FIELD stbh005 name="construct.a.stbh005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh005
            #add-point:ON ACTION controlp INFIELD stbh005 name="construct.c.stbh005"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "2060"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh005  #顯示到畫面上

            NEXT FIELD stbh005     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh006
            #add-point:BEFORE FIELD stbh006 name="construct.b.stbh006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh006
            
            #add-point:AFTER FIELD stbh006 name="construct.a.stbh006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh006
            #add-point:ON ACTION controlp INFIELD stbh006 name="construct.c.stbh006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh007
            #add-point:BEFORE FIELD stbh007 name="construct.b.stbh007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh007
            
            #add-point:AFTER FIELD stbh007 name="construct.a.stbh007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh007
            #add-point:ON ACTION controlp INFIELD stbh007 name="construct.c.stbh007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbh008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh008
            #add-point:ON ACTION controlp INFIELD stbh008 name="construct.c.stbh008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh008  #顯示到畫面上
            NEXT FIELD stbh008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh008
            #add-point:BEFORE FIELD stbh008 name="construct.b.stbh008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh008
            
            #add-point:AFTER FIELD stbh008 name="construct.a.stbh008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbh009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh009
            #add-point:ON ACTION controlp INFIELD stbh009 name="construct.c.stbh009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbh009  #顯示到畫面上
            NEXT FIELD stbh009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh009
            #add-point:BEFORE FIELD stbh009 name="construct.b.stbh009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh009
            
            #add-point:AFTER FIELD stbh009 name="construct.a.stbh009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhunit
            #add-point:BEFORE FIELD stbhunit name="construct.b.stbhunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhunit
            
            #add-point:AFTER FIELD stbhunit name="construct.a.stbhunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhunit
            #add-point:ON ACTION controlp INFIELD stbhunit name="construct.c.stbhunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhstus
            #add-point:BEFORE FIELD stbhstus name="construct.b.stbhstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhstus
            
            #add-point:AFTER FIELD stbhstus name="construct.a.stbhstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhstus
            #add-point:ON ACTION controlp INFIELD stbhstus name="construct.c.stbhstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbhownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhownid
            #add-point:ON ACTION controlp INFIELD stbhownid name="construct.c.stbhownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhownid  #顯示到畫面上
            NEXT FIELD stbhownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhownid
            #add-point:BEFORE FIELD stbhownid name="construct.b.stbhownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhownid
            
            #add-point:AFTER FIELD stbhownid name="construct.a.stbhownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhowndp
            #add-point:ON ACTION controlp INFIELD stbhowndp name="construct.c.stbhowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhowndp  #顯示到畫面上
            NEXT FIELD stbhowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhowndp
            #add-point:BEFORE FIELD stbhowndp name="construct.b.stbhowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhowndp
            
            #add-point:AFTER FIELD stbhowndp name="construct.a.stbhowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhcrtid
            #add-point:ON ACTION controlp INFIELD stbhcrtid name="construct.c.stbhcrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhcrtid  #顯示到畫面上
            NEXT FIELD stbhcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhcrtid
            #add-point:BEFORE FIELD stbhcrtid name="construct.b.stbhcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhcrtid
            
            #add-point:AFTER FIELD stbhcrtid name="construct.a.stbhcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbhcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhcrtdp
            #add-point:ON ACTION controlp INFIELD stbhcrtdp name="construct.c.stbhcrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhcrtdp  #顯示到畫面上
            NEXT FIELD stbhcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhcrtdp
            #add-point:BEFORE FIELD stbhcrtdp name="construct.b.stbhcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhcrtdp
            
            #add-point:AFTER FIELD stbhcrtdp name="construct.a.stbhcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhcrtdt
            #add-point:BEFORE FIELD stbhcrtdt name="construct.b.stbhcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbhmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhmodid
            #add-point:ON ACTION controlp INFIELD stbhmodid name="construct.c.stbhmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhmodid  #顯示到畫面上
            NEXT FIELD stbhmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhmodid
            #add-point:BEFORE FIELD stbhmodid name="construct.b.stbhmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhmodid
            
            #add-point:AFTER FIELD stbhmodid name="construct.a.stbhmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhmoddt
            #add-point:BEFORE FIELD stbhmoddt name="construct.b.stbhmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbhcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhcnfid
            #add-point:ON ACTION controlp INFIELD stbhcnfid name="construct.c.stbhcnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbhcnfid  #顯示到畫面上
            NEXT FIELD stbhcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhcnfid
            #add-point:BEFORE FIELD stbhcnfid name="construct.b.stbhcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhcnfid
            
            #add-point:AFTER FIELD stbhcnfid name="construct.a.stbhcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhcnfdt
            #add-point:BEFORE FIELD stbhcnfdt name="construct.b.stbhcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stbiseq,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006,stbi007,stbi004, 
          stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016,stbi032,stbi017,stbi018, 
          stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025,stbi026,stbi027,stbi028,stbi031, 
          stbi029,stbiunit
           FROM s_detail1[1].stbiseq,s_detail1[1].stbisite,s_detail1[1].stbi002,s_detail1[1].stbi001, 
               s_detail1[1].stbi003,s_detail1[1].stbi005,s_detail1[1].stbi006,s_detail1[1].stbi007,s_detail1[1].stbi004, 
               s_detail1[1].stbi008,s_detail1[1].stbi010,s_detail1[1].stbi011,s_detail1[1].stbi012,s_detail1[1].stbi009, 
               s_detail1[1].stbi013,s_detail1[1].stbi014,s_detail1[1].stbi015,s_detail1[1].stbi016,s_detail1[1].stbi032, 
               s_detail1[1].stbi017,s_detail1[1].stbi018,s_detail1[1].stbi019,s_detail1[1].stbi020,s_detail1[1].stbi021, 
               s_detail1[1].stbi022,s_detail1[1].stbi023,s_detail1[1].stbi030,s_detail1[1].stbi024,s_detail1[1].stbi025, 
               s_detail1[1].stbi026,s_detail1[1].stbi027,s_detail1[1].stbi028,s_detail1[1].stbi031,s_detail1[1].stbi029, 
               s_detail1[1].stbiunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbiseq
            #add-point:BEFORE FIELD stbiseq name="construct.b.page1.stbiseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbiseq
            
            #add-point:AFTER FIELD stbiseq name="construct.a.page1.stbiseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbiseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbiseq
            #add-point:ON ACTION controlp INFIELD stbiseq name="construct.c.page1.stbiseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbisite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbisite
            #add-point:ON ACTION controlp INFIELD stbisite name="construct.c.page1.stbisite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbisite',g_site,'c') #add by geza 20161026 #161024-00025#10
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbisite  #顯示到畫面上
            NEXT FIELD stbisite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbisite
            #add-point:BEFORE FIELD stbisite name="construct.b.page1.stbisite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbisite
            
            #add-point:AFTER FIELD stbisite name="construct.a.page1.stbisite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi002
            #add-point:BEFORE FIELD stbi002 name="construct.b.page1.stbi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi002
            
            #add-point:AFTER FIELD stbi002 name="construct.a.page1.stbi002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi002
            #add-point:ON ACTION controlp INFIELD stbi002 name="construct.c.page1.stbi002"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            LET g_qryparam.arg1 = g_stbh_m.stbhsite
            CALL q_rtdx001_1()
            DISPLAY g_qryparam.return1 TO stbi002
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi001
            #add-point:BEFORE FIELD stbi001 name="construct.b.page1.stbi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi001
            
            #add-point:AFTER FIELD stbi001 name="construct.a.page1.stbi001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi001
            #add-point:ON ACTION controlp INFIELD stbi001 name="construct.c.page1.stbi001"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_imay003_8()
            DISPLAY g_qryparam.return1 TO stbi001
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi003
            #add-point:BEFORE FIELD stbi003 name="construct.b.page1.stbi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi003
            
            #add-point:AFTER FIELD stbi003 name="construct.a.page1.stbi003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi003
            #add-point:ON ACTION controlp INFIELD stbi003 name="construct.c.page1.stbi003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi005
            #add-point:BEFORE FIELD stbi005 name="construct.b.page1.stbi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi005
            
            #add-point:AFTER FIELD stbi005 name="construct.a.page1.stbi005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi005
            #add-point:ON ACTION controlp INFIELD stbi005 name="construct.c.page1.stbi005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi006
            #add-point:BEFORE FIELD stbi006 name="construct.b.page1.stbi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi006
            
            #add-point:AFTER FIELD stbi006 name="construct.a.page1.stbi006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi006
            #add-point:ON ACTION controlp INFIELD stbi006 name="construct.c.page1.stbi006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi007
            #add-point:BEFORE FIELD stbi007 name="construct.b.page1.stbi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi007
            
            #add-point:AFTER FIELD stbi007 name="construct.a.page1.stbi007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi007
            #add-point:ON ACTION controlp INFIELD stbi007 name="construct.c.page1.stbi007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi004
            #add-point:BEFORE FIELD stbi004 name="construct.b.page1.stbi004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi004
            
            #add-point:AFTER FIELD stbi004 name="construct.a.page1.stbi004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi004
            #add-point:ON ACTION controlp INFIELD stbi004 name="construct.c.page1.stbi004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi008
            #add-point:BEFORE FIELD stbi008 name="construct.b.page1.stbi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi008
            
            #add-point:AFTER FIELD stbi008 name="construct.a.page1.stbi008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi008
            #add-point:ON ACTION controlp INFIELD stbi008 name="construct.c.page1.stbi008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi010
            #add-point:BEFORE FIELD stbi010 name="construct.b.page1.stbi010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi010
            
            #add-point:AFTER FIELD stbi010 name="construct.a.page1.stbi010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi010
            #add-point:ON ACTION controlp INFIELD stbi010 name="construct.c.page1.stbi010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi011
            #add-point:BEFORE FIELD stbi011 name="construct.b.page1.stbi011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi011
            
            #add-point:AFTER FIELD stbi011 name="construct.a.page1.stbi011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi011
            #add-point:ON ACTION controlp INFIELD stbi011 name="construct.c.page1.stbi011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi012
            #add-point:BEFORE FIELD stbi012 name="construct.b.page1.stbi012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi012
            
            #add-point:AFTER FIELD stbi012 name="construct.a.page1.stbi012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi012
            #add-point:ON ACTION controlp INFIELD stbi012 name="construct.c.page1.stbi012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi009
            #add-point:BEFORE FIELD stbi009 name="construct.b.page1.stbi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi009
            
            #add-point:AFTER FIELD stbi009 name="construct.a.page1.stbi009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi009
            #add-point:ON ACTION controlp INFIELD stbi009 name="construct.c.page1.stbi009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi013
            #add-point:BEFORE FIELD stbi013 name="construct.b.page1.stbi013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi013
            
            #add-point:AFTER FIELD stbi013 name="construct.a.page1.stbi013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi013
            #add-point:ON ACTION controlp INFIELD stbi013 name="construct.c.page1.stbi013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi014
            #add-point:BEFORE FIELD stbi014 name="construct.b.page1.stbi014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi014
            
            #add-point:AFTER FIELD stbi014 name="construct.a.page1.stbi014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi014
            #add-point:ON ACTION controlp INFIELD stbi014 name="construct.c.page1.stbi014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi015
            #add-point:BEFORE FIELD stbi015 name="construct.b.page1.stbi015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi015
            
            #add-point:AFTER FIELD stbi015 name="construct.a.page1.stbi015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi015
            #add-point:ON ACTION controlp INFIELD stbi015 name="construct.c.page1.stbi015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi016
            #add-point:BEFORE FIELD stbi016 name="construct.b.page1.stbi016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi016
            
            #add-point:AFTER FIELD stbi016 name="construct.a.page1.stbi016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi016
            #add-point:ON ACTION controlp INFIELD stbi016 name="construct.c.page1.stbi016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi032
            #add-point:BEFORE FIELD stbi032 name="construct.b.page1.stbi032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi032
            
            #add-point:AFTER FIELD stbi032 name="construct.a.page1.stbi032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi032
            #add-point:ON ACTION controlp INFIELD stbi032 name="construct.c.page1.stbi032"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi017
            #add-point:BEFORE FIELD stbi017 name="construct.b.page1.stbi017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi017
            
            #add-point:AFTER FIELD stbi017 name="construct.a.page1.stbi017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi017
            #add-point:ON ACTION controlp INFIELD stbi017 name="construct.c.page1.stbi017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi018
            #add-point:BEFORE FIELD stbi018 name="construct.b.page1.stbi018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi018
            
            #add-point:AFTER FIELD stbi018 name="construct.a.page1.stbi018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi018
            #add-point:ON ACTION controlp INFIELD stbi018 name="construct.c.page1.stbi018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi019
            #add-point:BEFORE FIELD stbi019 name="construct.b.page1.stbi019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi019
            
            #add-point:AFTER FIELD stbi019 name="construct.a.page1.stbi019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi019
            #add-point:ON ACTION controlp INFIELD stbi019 name="construct.c.page1.stbi019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi020
            #add-point:BEFORE FIELD stbi020 name="construct.b.page1.stbi020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi020
            
            #add-point:AFTER FIELD stbi020 name="construct.a.page1.stbi020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi020
            #add-point:ON ACTION controlp INFIELD stbi020 name="construct.c.page1.stbi020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi021
            #add-point:BEFORE FIELD stbi021 name="construct.b.page1.stbi021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi021
            
            #add-point:AFTER FIELD stbi021 name="construct.a.page1.stbi021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi021
            #add-point:ON ACTION controlp INFIELD stbi021 name="construct.c.page1.stbi021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi022
            #add-point:BEFORE FIELD stbi022 name="construct.b.page1.stbi022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi022
            
            #add-point:AFTER FIELD stbi022 name="construct.a.page1.stbi022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi022
            #add-point:ON ACTION controlp INFIELD stbi022 name="construct.c.page1.stbi022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi023
            #add-point:BEFORE FIELD stbi023 name="construct.b.page1.stbi023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi023
            
            #add-point:AFTER FIELD stbi023 name="construct.a.page1.stbi023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi023
            #add-point:ON ACTION controlp INFIELD stbi023 name="construct.c.page1.stbi023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi030
            #add-point:BEFORE FIELD stbi030 name="construct.b.page1.stbi030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi030
            
            #add-point:AFTER FIELD stbi030 name="construct.a.page1.stbi030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi030
            #add-point:ON ACTION controlp INFIELD stbi030 name="construct.c.page1.stbi030"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi024
            #add-point:BEFORE FIELD stbi024 name="construct.b.page1.stbi024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi024
            
            #add-point:AFTER FIELD stbi024 name="construct.a.page1.stbi024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi024
            #add-point:ON ACTION controlp INFIELD stbi024 name="construct.c.page1.stbi024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi025
            #add-point:BEFORE FIELD stbi025 name="construct.b.page1.stbi025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi025
            
            #add-point:AFTER FIELD stbi025 name="construct.a.page1.stbi025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi025
            #add-point:ON ACTION controlp INFIELD stbi025 name="construct.c.page1.stbi025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi026
            #add-point:BEFORE FIELD stbi026 name="construct.b.page1.stbi026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi026
            
            #add-point:AFTER FIELD stbi026 name="construct.a.page1.stbi026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi026
            #add-point:ON ACTION controlp INFIELD stbi026 name="construct.c.page1.stbi026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi027
            #add-point:BEFORE FIELD stbi027 name="construct.b.page1.stbi027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi027
            
            #add-point:AFTER FIELD stbi027 name="construct.a.page1.stbi027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi027
            #add-point:ON ACTION controlp INFIELD stbi027 name="construct.c.page1.stbi027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi028
            #add-point:BEFORE FIELD stbi028 name="construct.b.page1.stbi028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi028
            
            #add-point:AFTER FIELD stbi028 name="construct.a.page1.stbi028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi028
            #add-point:ON ACTION controlp INFIELD stbi028 name="construct.c.page1.stbi028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi031
            #add-point:BEFORE FIELD stbi031 name="construct.b.page1.stbi031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi031
            
            #add-point:AFTER FIELD stbi031 name="construct.a.page1.stbi031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi031
            #add-point:ON ACTION controlp INFIELD stbi031 name="construct.c.page1.stbi031"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi029
            #add-point:BEFORE FIELD stbi029 name="construct.b.page1.stbi029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi029
            
            #add-point:AFTER FIELD stbi029 name="construct.a.page1.stbi029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbi029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi029
            #add-point:ON ACTION controlp INFIELD stbi029 name="construct.c.page1.stbi029"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbiunit
            #add-point:BEFORE FIELD stbiunit name="construct.b.page1.stbiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbiunit
            
            #add-point:AFTER FIELD stbiunit name="construct.a.page1.stbiunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbiunit
            #add-point:ON ACTION controlp INFIELD stbiunit name="construct.c.page1.stbiunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stbh_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbi_t" 
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
 
{<section id="astt312.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt312_filter()
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
      CONSTRUCT g_wc_filter ON stbhsite,stbhdocdt,stbhdocno,stbh001,stbh002
                          FROM s_browse[1].b_stbhsite,s_browse[1].b_stbhdocdt,s_browse[1].b_stbhdocno, 
                              s_browse[1].b_stbh001,s_browse[1].b_stbh002
 
         BEFORE CONSTRUCT
               DISPLAY astt312_filter_parser('stbhsite') TO s_browse[1].b_stbhsite
            DISPLAY astt312_filter_parser('stbhdocdt') TO s_browse[1].b_stbhdocdt
            DISPLAY astt312_filter_parser('stbhdocno') TO s_browse[1].b_stbhdocno
            DISPLAY astt312_filter_parser('stbh001') TO s_browse[1].b_stbh001
            DISPLAY astt312_filter_parser('stbh002') TO s_browse[1].b_stbh002
      
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
 
      CALL astt312_filter_show('stbhsite')
   CALL astt312_filter_show('stbhdocdt')
   CALL astt312_filter_show('stbhdocno')
   CALL astt312_filter_show('stbh001')
   CALL astt312_filter_show('stbh002')
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt312_filter_parser(ps_field)
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
 
{<section id="astt312.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt312_filter_show(ps_field)
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
   LET ls_condition = astt312_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt312_query()
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
   CALL g_stbi_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt312_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt312_browser_fill("")
      CALL astt312_fetch("")
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
      CALL astt312_filter_show('stbhsite')
   CALL astt312_filter_show('stbhdocdt')
   CALL astt312_filter_show('stbhdocno')
   CALL astt312_filter_show('stbh001')
   CALL astt312_filter_show('stbh002')
   CALL astt312_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt312_fetch("F") 
      #顯示單身筆數
      CALL astt312_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt312_fetch(p_flag)
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
   
   LET g_stbh_m.stbhdocno = g_browser[g_current_idx].b_stbhdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
   #遮罩相關處理
   LET g_stbh_m_mask_o.* =  g_stbh_m.*
   CALL astt312_stbh_t_mask()
   LET g_stbh_m_mask_n.* =  g_stbh_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt312_set_act_visible()   
   CALL astt312_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stbh_m_t.* = g_stbh_m.*
   LET g_stbh_m_o.* = g_stbh_m.*
   
   LET g_data_owner = g_stbh_m.stbhownid      
   LET g_data_dept  = g_stbh_m.stbhowndp
   
   #重新顯示   
   CALL astt312_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt312_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert      LIKE type_t.num5
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_doctype     LIKE rtai_t.rtai004  
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stbi_d.clear()   
 
 
   INITIALIZE g_stbh_m.* TO NULL             #DEFAULT 設定
   
   LET g_stbhdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbh_m.stbhownid = g_user
      LET g_stbh_m.stbhowndp = g_dept
      LET g_stbh_m.stbhcrtid = g_user
      LET g_stbh_m.stbhcrtdp = g_dept 
      LET g_stbh_m.stbhcrtdt = cl_get_current()
      LET g_stbh_m.stbhmodid = g_user
      LET g_stbh_m.stbhmoddt = cl_get_current()
      LET g_stbh_m.stbhstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stbh_m.stbh006 = "100"
      LET g_stbh_m.stbh007 = "100"
 
  
      #add-point:單頭預設值 name="insert.default"
      CALL s_aooi500_default(g_prog,'stbhsite',g_stbh_m.stbhsite)
         RETURNING l_insert,g_stbh_m.stbhsite
      IF NOT l_insert THEN
         RETURN
      END IF
      LET g_stbh_m.stbhunit = g_stbh_m.stbhsite
      LET g_site_flag = FALSE
      #預設單據日期
      LET g_stbh_m.stbhdocdt = g_today
      #預設業務人員，部門
      LET g_stbh_m.stbh008 = g_user
      SELECT ooag003 INTO g_stbh_m.stbh009
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = g_stbh_m.stbh008
      #預設單據的單別 
      LET l_success = ''
      LET l_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stbh_m.stbhsite,g_prog,'1')
           RETURNING l_success, l_doctype
      LET g_stbh_m.stbhdocno = l_doctype
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbh_m.stbh008
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stbh_m.stbh008_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbh_m.stbh008_desc
       
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stbh_m.stbh009
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stbh_m.stbh009_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stbh_m.stbh009_desc
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stbh_m_t.* = g_stbh_m.*
      LET g_stbh_m_o.* = g_stbh_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbh_m.stbhstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astt312_input("a")
      
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
         INITIALIZE g_stbh_m.* TO NULL
         INITIALIZE g_stbi_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt312_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stbi_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt312_set_act_visible()   
   CALL astt312_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbhent = " ||g_enterprise|| " AND",
                      " stbhdocno = '", g_stbh_m.stbhdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt312_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt312_cl
   
   CALL astt312_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
   
   #遮罩相關處理
   LET g_stbh_m_mask_o.* =  g_stbh_m.*
   CALL astt312_stbh_t_mask()
   LET g_stbh_m_mask_n.* =  g_stbh_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhsite_desc,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001, 
       g_stbh_m.stbh002,g_stbh_m.stbh002_desc,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh004_desc, 
       g_stbh_m.stbh005,g_stbh_m.stbh005_desc,g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh008_desc, 
       g_stbh_m.stbh009,g_stbh_m.stbh009_desc,g_stbh_m.stbhunit,g_stbh_m.stbhstus,g_stbh_m.stbhownid, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtid_desc, 
       g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdp_desc,g_stbh_m.stbhcrtdt,g_stbh_m.stbhmodid,g_stbh_m.stbhmodid_desc, 
       g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfid_desc,g_stbh_m.stbhcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stbh_m.stbhownid      
   LET g_data_dept  = g_stbh_m.stbhowndp
   
   #功能已完成,通報訊息中心
   CALL astt312_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt312_modify()
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
   LET g_stbh_m_t.* = g_stbh_m.*
   LET g_stbh_m_o.* = g_stbh_m.*
   
   IF g_stbh_m.stbhdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
   CALL s_transaction_begin()
   
   OPEN astt312_cl USING g_enterprise,g_stbh_m.stbhdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt312_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt312_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt312_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbh_m_mask_o.* =  g_stbh_m.*
   CALL astt312_stbh_t_mask()
   LET g_stbh_m_mask_n.* =  g_stbh_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt312_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stbh_m.stbhmodid = g_user 
LET g_stbh_m.stbhmoddt = cl_get_current()
LET g_stbh_m.stbhmodid_desc = cl_get_username(g_stbh_m.stbhmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt312_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stbh_t SET (stbhmodid,stbhmoddt) = (g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt)
          WHERE stbhent = g_enterprise AND stbhdocno = g_stbhdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stbh_m.* = g_stbh_m_t.*
            CALL astt312_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stbh_m.stbhdocno != g_stbh_m_t.stbhdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stbi_t SET stbidocno = g_stbh_m.stbhdocno
 
          WHERE stbient = g_enterprise AND stbidocno = g_stbh_m_t.stbhdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbi_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
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
   CALL astt312_set_act_visible()   
   CALL astt312_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stbhent = " ||g_enterprise|| " AND",
                      " stbhdocno = '", g_stbh_m.stbhdocno, "' "
 
   #填到對應位置
   CALL astt312_browser_fill("")
 
   CLOSE astt312_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt312_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt312.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt312_input(p_cmd)
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
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_success             LIKE type_t.num5   
   DEFINE  l_flag                LIKE type_t.num5
   DEFINE  r_success             LIKE type_t.num5 
   DEFINE  l_rtaastus            LIKE rtaa_t.rtaastus
   DEFINE  l_ooez006             LIKE ooez_t.ooez006
   DEFINE  l_ooez007             LIKE ooez_t.ooez007
   DEFINE  l_star001             LIKE star_t.star001
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
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
   DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhsite_desc,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001, 
       g_stbh_m.stbh002,g_stbh_m.stbh002_desc,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh004_desc, 
       g_stbh_m.stbh005,g_stbh_m.stbh005_desc,g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh008_desc, 
       g_stbh_m.stbh009,g_stbh_m.stbh009_desc,g_stbh_m.stbhunit,g_stbh_m.stbhstus,g_stbh_m.stbhownid, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtid_desc, 
       g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdp_desc,g_stbh_m.stbhcrtdt,g_stbh_m.stbhmodid,g_stbh_m.stbhmodid_desc, 
       g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfid_desc,g_stbh_m.stbhcnfdt
   
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
   LET g_forupd_sql = "SELECT stbiseq,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006,stbi007,stbi004, 
       stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016,stbi032,stbi017,stbi018, 
       stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025,stbi026,stbi027,stbi028,stbi031, 
       stbi029,stbiunit FROM stbi_t WHERE stbient=? AND stbidocno=? AND stbiseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt312_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt312_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt312_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus 
 
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt312.input.head" >}
      #單頭段
      INPUT BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002, 
          g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt312_cl USING g_enterprise,g_stbh_m.stbhdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt312_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt312_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt312_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt312_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhsite
            
            #add-point:AFTER FIELD stbhsite name="input.a.stbhsite"
            IF NOT cl_null(g_stbh_m.stbhsite) THEN
               CALL s_aooi500_chk(g_prog,'stbhsite',g_stbh_m.stbhsite,g_stbh_m.stbhsite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stbh_m.stbhsite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stbh_m.stbhsite = g_stbh_m_t.stbhsite
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stbh_m.stbhsite
                  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_stbh_m.stbhsite_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_stbh_m.stbhsite_desc
                  NEXT FIELD CURRENT
               END IF
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET g_stbh_m.stbhsite = g_stbh_m_t.stbhsite
               NEXT FIELD CURRENT
            END IF
            LET g_site_flag = TRUE
            CALL astt312_set_entry(p_cmd)
            CALL astt312_set_no_entry(p_cmd)   
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbh_m.stbhsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbh_m.stbhsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbh_m.stbhsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhsite
            #add-point:BEFORE FIELD stbhsite name="input.b.stbhsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbhsite
            #add-point:ON CHANGE stbhsite name="input.g.stbhsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhdocno
            #add-point:BEFORE FIELD stbhdocno name="input.b.stbhdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhdocno
            
            #add-point:AFTER FIELD stbhdocno name="input.a.stbhdocno"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF NOT cl_null(g_stbh_m.stbhdocno) AND p_cmd = 'a' THEN
               IF NOT s_aooi200_chk_slip(g_stbh_m.stbhsite,'',g_stbh_m.stbhdocno,g_prog) THEN
                  LET g_stbh_m.stbhdocno = g_stbh_m_t.stbhdocno
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF  NOT cl_null(g_stbh_m.stbhdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stbh_m.stbhdocno != g_stbhdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbh_t WHERE "||"stbhent = '" ||g_enterprise|| "' AND "||"stbhdocno = '"||g_stbh_m.stbhdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt312_set_entry(p_cmd)
            CALL astt312_set_no_entry(p_cmd)   


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbhdocno
            #add-point:ON CHANGE stbhdocno name="input.g.stbhdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhdocdt
            #add-point:BEFORE FIELD stbhdocdt name="input.b.stbhdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhdocdt
            
            #add-point:AFTER FIELD stbhdocdt name="input.a.stbhdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbhdocdt
            #add-point:ON CHANGE stbhdocdt name="input.g.stbhdocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh001
            
            #add-point:AFTER FIELD stbh001 name="input.a.stbh001"
            IF NOT cl_null(g_stbh_m.stbh001) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbh_m.stbh001

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_stan001") THEN
                  #檢查成功時後續處理
               ELSE
                  LET g_stbh_m.stbh001 = g_stbh_m_t.stbh001
                  DISPLAY BY NAME g_stbh_m.stbh001
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               #抓取合同對應的供應商編號/經營方式/結算方式/結算類別
               CALL astt312_stbh001_get()
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh001
            #add-point:BEFORE FIELD stbh001 name="input.b.stbh001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh001
            #add-point:ON CHANGE stbh001 name="input.g.stbh001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh002
            
            #add-point:AFTER FIELD stbh002 name="input.a.stbh002"
            IF NOT cl_null(g_stbh_m.stbh002) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbh_m.stbh002

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_pmaa001_1") THEN
                  #檢查成功時後續處理
               ELSE
                  LET g_stbh_m.stbh002 = g_stbh_m_t.stbh002
                  LET g_stbh_m.stbh002_desc = ""
                  DISPLAY BY NAME g_stbh_m.stbh002,g_stbh_m.stbh002_desc
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               IF NOT astt312_chk_stbh002() THEN
                  LET g_stbh_m.stbh002 = g_stbh_m_t.stbh002
                  LET g_stbh_m.stbh002_desc = ""
                  DISPLAY BY NAME g_stbh_m.stbh002,g_stbh_m.stbh002_desc
                  NEXT FIELD CURRENT
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbh_m.stbh002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbh_m.stbh002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbh_m.stbh002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh002
            #add-point:BEFORE FIELD stbh002 name="input.b.stbh002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh002
            #add-point:ON CHANGE stbh002 name="input.g.stbh002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh006
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbh_m.stbh006,"0.000","1","100.000","1","azz-00087",1) THEN
               NEXT FIELD stbh006
            END IF 
 
 
 
            #add-point:AFTER FIELD stbh006 name="input.a.stbh006"
            IF NOT cl_null(g_stbh_m.stbh006) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh006
            #add-point:BEFORE FIELD stbh006 name="input.b.stbh006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh006
            #add-point:ON CHANGE stbh006 name="input.g.stbh006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh007
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbh_m.stbh007,"0.000","1","100.000","1","azz-00087",1) THEN
               NEXT FIELD stbh007
            END IF 
 
 
 
            #add-point:AFTER FIELD stbh007 name="input.a.stbh007"
            IF NOT cl_null(g_stbh_m.stbh007) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh007
            #add-point:BEFORE FIELD stbh007 name="input.b.stbh007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh007
            #add-point:ON CHANGE stbh007 name="input.g.stbh007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh008
            
            #add-point:AFTER FIELD stbh008 name="input.a.stbh008"
            IF NOT cl_null(g_stbh_m.stbh008) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
                LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbh_m.stbh008
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  LET g_stbh_m.stbh008 = g_stbh_m_t.stbh008
                  LET g_stbh_m.stbh008_desc = ""
                  DISPLAY BY NAME g_stbh_m.stbh008,g_stbh_m.stbh008_desc
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               #自動帶出部門
               SELECT ooag003 INTO g_stbh_m.stbh009
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = g_stbh_m.stbh008
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbh_m.stbh008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stbh_m.stbh008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbh_m.stbh008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh008
            #add-point:BEFORE FIELD stbh008 name="input.b.stbh008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh008
            #add-point:ON CHANGE stbh008 name="input.g.stbh008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbh009
            
            #add-point:AFTER FIELD stbh009 name="input.a.stbh009"
            IF NOT cl_null(g_stbh_m.stbh009) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbh_m.stbh009
               LET g_chkparam.arg2 = g_today
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooeg001") THEN
                  #檢查成功時後續處理
                  IF NOT cl_null(g_stbh_m.stbh008) THEN
                     INITIALIZE g_chkparam.* TO NULL
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_stbh_m.stbh008
                     LET g_chkparam.arg2 = g_stbh_m.stbh009
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_ooag003") THEN
                     ELSE
                        #檢查失敗時後續處理
                        LET g_stbh_m.stbh009 = g_stbh_m_t.stbh009
                        INITIALIZE g_ref_fields TO NULL
                        LET g_ref_fields[1] = g_stbh_m.stbh009
                        CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
                        LET g_stbh_m.stbh009_desc = '', g_rtn_fields[1] , ''
                        DISPLAY BY NAME g_stbh_m.stbh009_desc
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               ELSE
                  LET g_stbh_m.stbh009 = g_stbh_m_t.stbh009
                  LET g_stbh_m.stbh009_desc = ""
                  DISPLAY BY NAME g_stbh_m.stbh009,g_stbh_m.stbh009_desc
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbh_m.stbh009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbh_m.stbh009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbh_m.stbh009_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbh009
            #add-point:BEFORE FIELD stbh009 name="input.b.stbh009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbh009
            #add-point:ON CHANGE stbh009 name="input.g.stbh009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhunit
            #add-point:BEFORE FIELD stbhunit name="input.b.stbhunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhunit
            
            #add-point:AFTER FIELD stbhunit name="input.a.stbhunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbhunit
            #add-point:ON CHANGE stbhunit name="input.g.stbhunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbhstus
            #add-point:BEFORE FIELD stbhstus name="input.b.stbhstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbhstus
            
            #add-point:AFTER FIELD stbhstus name="input.a.stbhstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbhstus
            #add-point:ON CHANGE stbhstus name="input.g.stbhstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stbhsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhsite
            #add-point:ON ACTION controlp INFIELD stbhsite name="input.c.stbhsite"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbhsite             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbhsite',g_stbh_m.stbhsite,'i')  #add by geza 20161026 #161024-00025#10

            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stbh_m.stbhsite = g_qryparam.return1              

            DISPLAY g_stbh_m.stbhsite TO stbhsite              #

            NEXT FIELD stbhsite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbhdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhdocno
            #add-point:ON ACTION controlp INFIELD stbhdocno name="input.c.stbhdocno"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbhdocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s
            LET g_qryparam.arg2 = "" #s

            #150613-00058#1--add by dongsz--str---
            CALL s_aooi100_sel_ooef004(g_stbh_m.stbhsite)
               RETURNING l_success,l_ooef004
            LET g_qryparam.arg1 = l_ooef004   #參照表編號
            LET g_qryparam.arg2 = g_prog   #對應程式代號
            #150613-00058#1--add by dongsz--end---

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stbh_m.stbhdocno = g_qryparam.return1              

            DISPLAY g_stbh_m.stbhdocno TO stbhdocno              #

            NEXT FIELD stbhdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbhdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhdocdt
            #add-point:ON ACTION controlp INFIELD stbhdocdt name="input.c.stbhdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbh001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh001
            #add-point:ON ACTION controlp INFIELD stbh001 name="input.c.stbh001"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbh001             #給予default值
            LET g_qryparam.default2 = "" #g_stbh_m.stan005 #供應商編號
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stan001_2()                                #呼叫開窗

            LET g_stbh_m.stbh001 = g_qryparam.return1              
            #LET g_stbh_m.stan005 = g_qryparam.return2 
            DISPLAY g_stbh_m.stbh001 TO stbh001              #
            #DISPLAY g_stbh_m.stan005 TO stan005 #供應商編號
            NEXT FIELD stbh001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbh002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh002
            #add-point:ON ACTION controlp INFIELD stbh002 name="input.c.stbh002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbh002             #給予default值
            LET g_qryparam.default2 = "" #g_stbh_m.pmaal004 #交易對象簡稱
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_pmaa001_10()                                #呼叫開窗

            LET g_stbh_m.stbh002 = g_qryparam.return1              
            #LET g_stbh_m.pmaal004 = g_qryparam.return2 
            DISPLAY g_stbh_m.stbh002 TO stbh002              #
            #DISPLAY g_stbh_m.pmaal004 TO pmaal004 #交易對象簡稱
            NEXT FIELD stbh002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbh006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh006
            #add-point:ON ACTION controlp INFIELD stbh006 name="input.c.stbh006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbh007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh007
            #add-point:ON ACTION controlp INFIELD stbh007 name="input.c.stbh007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbh008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh008
            #add-point:ON ACTION controlp INFIELD stbh008 name="input.c.stbh008"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbh008             #給予default值
            LET g_qryparam.default2 = "" #g_stbh_m.ooag003 #归属部门
            LET g_qryparam.default3 = "" #g_stbh_m.ooefl003 #說明(簡稱)
            LET g_qryparam.default4 = "" #g_stbh_m.ooag011 #全名
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_ooag001_6()                                #呼叫開窗

            LET g_stbh_m.stbh008 = g_qryparam.return1              
            #LET g_stbh_m.ooag003 = g_qryparam.return2 
            #LET g_stbh_m.ooefl003 = g_qryparam.return3 
            #LET g_stbh_m.ooag011 = g_qryparam.return4 
            DISPLAY g_stbh_m.stbh008 TO stbh008              #
            #DISPLAY g_stbh_m.ooag003 TO ooag003 #归属部门
            #DISPLAY g_stbh_m.ooefl003 TO ooefl003 #說明(簡稱)
            #DISPLAY g_stbh_m.ooag011 TO ooag011 #全名
            NEXT FIELD stbh008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbh009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbh009
            #add-point:ON ACTION controlp INFIELD stbh009 name="input.c.stbh009"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbh_m.stbh009             #給予default值
            LET g_qryparam.default2 = "" #g_stbh_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = "" #s

            LET g_qryparam.arg1 = g_today    #150613-00059#1--add by dongsz
            CALL q_ooeg001()                                #呼叫開窗

            LET g_stbh_m.stbh009 = g_qryparam.return1              
            #LET g_stbh_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stbh_m.stbh009 TO stbh009              #
            #DISPLAY g_stbh_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD stbh009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stbhunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhunit
            #add-point:ON ACTION controlp INFIELD stbhunit name="input.c.stbhunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbhstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbhstus
            #add-point:ON ACTION controlp INFIELD stbhstus name="input.c.stbhstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stbh_m.stbhdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stbh_m.stbhsite,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_prog) RETURNING l_flag,g_stbh_m.stbhdocno
               IF NOT l_flag THEN
                  NEXT FIELD stbhdocno
               END IF 
               LET g_stbh_m.stbhunit = g_stbh_m.stbhsite
               #end add-point
               
               INSERT INTO stbh_t (stbhent,stbhsite,stbhdocno,stbhdocdt,stbh001,stbh002,stbh003,stbh004, 
                   stbh005,stbh006,stbh007,stbh008,stbh009,stbhunit,stbhstus,stbhownid,stbhowndp,stbhcrtid, 
                   stbhcrtdp,stbhcrtdt,stbhmodid,stbhmoddt,stbhcnfid,stbhcnfdt)
               VALUES (g_enterprise,g_stbh_m.stbhsite,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001, 
                   g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005,g_stbh_m.stbh006, 
                   g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
                   g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
                   g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stbh_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt312_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt312_b_fill()
                  CALL astt312_b_fill2('0')
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
               CALL astt312_stbh_t_mask_restore('restore_mask_o')
               
               UPDATE stbh_t SET (stbhsite,stbhdocno,stbhdocdt,stbh001,stbh002,stbh003,stbh004,stbh005, 
                   stbh006,stbh007,stbh008,stbh009,stbhunit,stbhstus,stbhownid,stbhowndp,stbhcrtid,stbhcrtdp, 
                   stbhcrtdt,stbhmodid,stbhmoddt,stbhcnfid,stbhcnfdt) = (g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
                   g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004, 
                   g_stbh_m.stbh005,g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009, 
                   g_stbh_m.stbhunit,g_stbh_m.stbhstus,g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid, 
                   g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt,g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid, 
                   g_stbh_m.stbhcnfdt)
                WHERE stbhent = g_enterprise AND stbhdocno = g_stbhdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stbh_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt312_stbh_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stbh_m_t)
               LET g_log2 = util.JSON.stringify(g_stbh_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt312.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbi_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            IF g_stbh_m.stbh003 = '1' OR g_stbh_m.stbh003 = '2' THEN 
               CALL cl_set_comp_visible('stbi017,stbi032',FALSE)
            ELSE
               CALL cl_set_comp_visible('stbi017,stbi032',TRUE)
            END IF 
            IF g_stbh_m.stbh003 = '3' THEN
               CALL cl_set_comp_visible('stbi004,stbi006,stbi007,stbi008',FALSE)
            ELSE
               CALL cl_set_comp_visible('stbi004,stbi006,stbi007,stbi008',TRUE)
            END IF 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbi_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt312_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stbi_d.getLength()
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
            OPEN astt312_cl USING g_enterprise,g_stbh_m.stbhdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt312_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt312_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbi_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbi_d[l_ac].stbiseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbi_d_t.* = g_stbi_d[l_ac].*  #BACKUP
               LET g_stbi_d_o.* = g_stbi_d[l_ac].*  #BACKUP
               CALL astt312_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt312_set_no_entry_b(l_cmd)
               IF NOT astt312_lock_b("stbi_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt312_bcl INTO g_stbi_d[l_ac].stbiseq,g_stbi_d[l_ac].stbisite,g_stbi_d[l_ac].stbi002, 
                      g_stbi_d[l_ac].stbi001,g_stbi_d[l_ac].stbi003,g_stbi_d[l_ac].stbi005,g_stbi_d[l_ac].stbi006, 
                      g_stbi_d[l_ac].stbi007,g_stbi_d[l_ac].stbi004,g_stbi_d[l_ac].stbi008,g_stbi_d[l_ac].stbi010, 
                      g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012,g_stbi_d[l_ac].stbi009,g_stbi_d[l_ac].stbi013, 
                      g_stbi_d[l_ac].stbi014,g_stbi_d[l_ac].stbi015,g_stbi_d[l_ac].stbi016,g_stbi_d[l_ac].stbi032, 
                      g_stbi_d[l_ac].stbi017,g_stbi_d[l_ac].stbi018,g_stbi_d[l_ac].stbi019,g_stbi_d[l_ac].stbi020, 
                      g_stbi_d[l_ac].stbi021,g_stbi_d[l_ac].stbi022,g_stbi_d[l_ac].stbi023,g_stbi_d[l_ac].stbi030, 
                      g_stbi_d[l_ac].stbi024,g_stbi_d[l_ac].stbi025,g_stbi_d[l_ac].stbi026,g_stbi_d[l_ac].stbi027, 
                      g_stbi_d[l_ac].stbi028,g_stbi_d[l_ac].stbi031,g_stbi_d[l_ac].stbi029,g_stbi_d[l_ac].stbiunit 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbi_d_t.stbiseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbi_d_mask_o[l_ac].* =  g_stbi_d[l_ac].*
                  CALL astt312_stbi_t_mask()
                  LET g_stbi_d_mask_n[l_ac].* =  g_stbi_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt312_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            CALL astt312_stbi_set('1',g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            CALL astt312_stbi_set('2',g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            CALL astt312_comp_set()
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
            INITIALIZE g_stbi_d[l_ac].* TO NULL 
            INITIALIZE g_stbi_d_t.* TO NULL 
            INITIALIZE g_stbi_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stbi_d[l_ac].stbi008 = "0"
      LET g_stbi_d[l_ac].stbi013 = "0"
      LET g_stbi_d[l_ac].stbi030 = "100"
      LET g_stbi_d[l_ac].stbi031 = "100"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT MAX(stbiseq) + 1
              INTO g_stbi_d[l_ac].stbiseq
              FROM stbi_t
             WHERE stbient = g_enterprise
               AND stbidocno = g_stbh_m.stbhdocno
            IF cl_null(g_stbi_d[l_ac].stbiseq) THEN 
               LET g_stbi_d[l_ac].stbiseq = 1
            END IF
            LET g_stbi_d[l_ac].stbisite = g_stbh_m.stbhsite
            LET g_stbi_d[l_ac].stbiunit = g_stbh_m.stbhsite
            LET g_stbi_d[l_ac].stbi006 = g_today
            LET g_stbi_d[l_ac].stbi007 = g_today
            LET g_stbi_d[l_ac].stbi011 = g_today
            LET g_stbi_d[l_ac].stbi012 = g_today    
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbisite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbisite_desc = '', g_rtn_fields[1] , ''      
            #end add-point
            LET g_stbi_d_t.* = g_stbi_d[l_ac].*     #新輸入資料
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt312_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt312_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbi_d[li_reproduce_target].* = g_stbi_d[li_reproduce].*
 
               LET g_stbi_d[li_reproduce_target].stbiseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            
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
            IF cl_null(g_stbi_d[l_ac].stbi008) AND cl_null(g_stbi_d[l_ac].stbi013) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'ast-00275'
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               NEXT FIELD CURRENT 
            END IF 
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stbi_t 
             WHERE stbient = g_enterprise AND stbidocno = g_stbh_m.stbhdocno
 
               AND stbiseq = g_stbi_d[l_ac].stbiseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbh_m.stbhdocno
               LET gs_keys[2] = g_stbi_d[g_detail_idx].stbiseq
               CALL astt312_insert_b('stbi_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stbi_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt312_b_fill()
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
               LET gs_keys[01] = g_stbh_m.stbhdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbi_d_t.stbiseq
 
            
               #刪除同層單身
               IF NOT astt312_delete_b('stbi_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt312_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt312_key_delete_b(gs_keys,'stbi_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt312_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt312_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stbi_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbi_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbiseq
            #add-point:BEFORE FIELD stbiseq name="input.b.page1.stbiseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbiseq
            
            #add-point:AFTER FIELD stbiseq name="input.a.page1.stbiseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stbh_m.stbhdocno IS NOT NULL AND g_stbi_d[g_detail_idx].stbiseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stbh_m.stbhdocno != g_stbhdocno_t OR g_stbi_d[g_detail_idx].stbiseq != g_stbi_d_t.stbiseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbi_t WHERE "||"stbient = '" ||g_enterprise|| "' AND "||"stbidocno = '"||g_stbh_m.stbhdocno ||"' AND "|| "stbiseq = '"||g_stbi_d[g_detail_idx].stbiseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbiseq
            #add-point:ON CHANGE stbiseq name="input.g.page1.stbiseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbisite
            
            #add-point:AFTER FIELD stbisite name="input.a.page1.stbisite"
            IF NOT cl_null(g_stbi_d[l_ac].stbisite) THEN
               CALL s_aooi500_chk(g_prog,'stbisite',g_stbi_d[l_ac].stbisite,g_stbi_d[l_ac].stbisite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stbi_d[l_ac].stbisite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stbi_d[l_ac].stbisite = g_stbi_d_t.stbisite
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stbi_d[l_ac].stbisite
                  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_stbi_d[l_ac].stbisite_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_stbi_d[l_ac].stbisite_desc
                  NEXT FIELD CURRENT
               END IF
               IF NOT cl_null(g_stbi_d[l_ac].stbi001) THEN 
                  IF NOT astt312_stbi001_chk_1() THEN 
                     LET g_stbi_d[l_ac].stbisite = g_stbi_d_t.stbisite
                     DISPLAY BY NAME g_stbi_d[l_ac].stbisite
                     NEXT FIELD CURRENT
                  END IF 
                  IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbisite != g_stbi_d_t.stbisite) THEN 
                     LET l_n = 0
                     SELECT COUNT(*) INTO l_n 
                       FROM stbi_t 
                      WHERE stbient = g_enterprise
                        AND stbidocno = g_stbh_m.stbhdocno
                        AND stbi001 = g_stbi_d[l_ac].stbi001
                        AND stbisite = g_stbi_d[l_ac].stbisite
                     IF l_n > 0 THEN 
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = g_stbi_d[l_ac].stbisite
                        LET g_errparam.code   = 'art-00489'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_stbi_d[l_ac].stbisite = g_stbi_d_t.stbisite
                        DISPLAY BY NAME g_stbi_d[l_ac].stbisite
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbisite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbisite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbisite_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbisite
            #add-point:BEFORE FIELD stbisite name="input.b.page1.stbisite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbisite
            #add-point:ON CHANGE stbisite name="input.g.page1.stbisite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi002
            #add-point:BEFORE FIELD stbi002 name="input.b.page1.stbi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi002
            
            #add-point:AFTER FIELD stbi002 name="input.a.page1.stbi002"
            IF NOT cl_null(g_stbi_d[l_ac].stbi002) THEN 
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbi_d[l_ac].stbi002
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_imay003_1") THEN
               ELSE
                  #檢查失敗時後續處理
                  #LET g_stbi_d[l_ac].stbi002 = g_stbi_d_t.stbi002   #160824-00007#179 Mark By Ken 161109
                  LET g_stbi_d[l_ac].stbi002 = g_stbi_d_o.stbi002    #160824-00007#179 Add By Ken 161109
                  DISPLAY BY NAME g_stbi_d[l_ac].stbi002
                  NEXT FIELD CURRENT
               END IF
               CALL astt312_stbi002_display()
               IF NOT cl_null(g_stbi_d[l_ac].stbi001) AND NOT cl_null(g_stbi_d[l_ac].stbisite) THEN 
                  #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi002 != g_stbi_d_t.stbi002) THEN    #160824-00007#179 Mark By Ken 161109 
                  IF g_stbi_d[l_ac].stbi002 != g_stbi_d_o.stbi002 THEN    #160824-00007#179 Add By Ken 161109
                     LET l_n = 0
                     SELECT COUNT(*) INTO l_n 
                       FROM stbi_t 
                      WHERE stbient = g_enterprise
                        AND stbidocno = g_stbh_m.stbhdocno
                        AND stbi001 = g_stbi_d[l_ac].stbi001
                        AND stbisite = g_stbi_d[l_ac].stbisite
                     IF l_n > 0 THEN 
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = g_stbi_d[l_ac].stbi002
                        LET g_errparam.code   = 'ast-00285'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_stbi_d[l_ac].stbi001 = ''
                        #LET g_stbi_d[l_ac].stbi002 = g_stbi_d_t.stbi002   #160824-00007#179 Mark By Ken 161109
                        LET g_stbi_d[l_ac].stbi002 = g_stbi_d_o.stbi002    #160824-00007#179 Add By Ken 161109
                        DISPLAY BY NAME g_stbi_d[l_ac].stbi001
                        NEXT FIELD CURRENT
                     END IF 
                  END IF
                  IF NOT astt312_stbi001_chk_1() THEN 
                     #LET g_stbi_d[l_ac].stbi002 = g_stbi_d_t.stbi002   #160824-00007#179 Mark By Ken 161109
                     LET g_stbi_d[l_ac].stbi002 = g_stbi_d_o.stbi002    #160824-00007#179 Add By Ken 161109                     
                     DISPLAY BY NAME g_stbi_d[l_ac].stbi002
                     NEXT FIELD CURRENT
                  END IF 
               END IF 
               #根据商品编号带值
               CALL astt312_stbi001_get()
               #检查生命周期有效性
               #CALL s_life_cycle_chk(g_prog,g_stbh_m.stbhsite,'1',g_stbi_d[l_ac].stbi001) RETURNING r_success   #150616-00035#78-mark by dongsz
               CALL s_life_cycle_chk(g_prog,g_stbh_m.stbhsite,'1',g_stbi_d[l_ac].stbi001,'','') RETURNING r_success   #150616-00035#78-add by dongsz               
               IF r_success = FALSE THEN 
                  NEXT FIELD CURRENT
               END IF              
            END IF 
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi002
            #add-point:ON CHANGE stbi002 name="input.g.page1.stbi002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi001
            
            #add-point:AFTER FIELD stbi001 name="input.a.page1.stbi001"
            IF NOT cl_null(g_stbi_d[l_ac].stbi001) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stbi_d[l_ac].stbi001
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_imaa001") THEN
                  
               ELSE
                  #檢查失敗時後續處理
                  #LET g_stbi_d[l_ac].stbi001 = g_stbi_d_t.stbi001   #160824-00007#179 Mark By Ken 161109
                  LET g_stbi_d[l_ac].stbi001 = g_stbi_d_o.stbi001    #160824-00007#179 Add By Ken 161109
                  DISPLAY BY NAME g_stbi_d[l_ac].stbi001
                  NEXT FIELD CURRENT
               END IF
               #检查是否存在商品清单档中
               CALL astt312_stbi001_chk()  
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_stbi_d[l_ac].stbi001
                  LET g_errparam.code   = g_errno
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  #LET g_stbi_d[l_ac].stbi001 = g_stbi_d_t.stbi001   #160824-00007#179 Mark By Ken 161109
                  LET g_stbi_d[l_ac].stbi001 = g_stbi_d_o.stbi001    #160824-00007#179 Add By Ken 161109
                  DISPLAY BY NAME g_stbi_d[l_ac].stbi001
                  NEXT FIELD CURRENT
               END IF 
               IF NOT cl_null(g_stbi_d[l_ac].stbisite) THEN 
                  IF NOT astt312_stbi001_chk_1() THEN 
                     #LET g_stbi_d[l_ac].stbi001 = g_stbi_d_t.stbi001   #160824-00007#179 Mark By Ken 161109
                     LET g_stbi_d[l_ac].stbi001 = g_stbi_d_o.stbi001    #160824-00007#179 Add By Ken 161109                     
                     DISPLAY BY NAME g_stbi_d[l_ac].stbi001
                     NEXT FIELD CURRENT
                  END IF
                  #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi001 != g_stbi_d_t.stbi001) THEN   #160824-00007#179 Mark By Ken 161109                     
                  IF g_stbi_d[l_ac].stbi001 != g_stbi_d_o.stbi001 THEN    #160824-00007#179 Add By Ken 161109                     
                     LET l_n = 0
                     SELECT COUNT(*) INTO l_n 
                       FROM stbi_t 
                      WHERE stbient = g_enterprise
                        AND stbidocno = g_stbh_m.stbhdocno
                        AND stbi001 = g_stbi_d[l_ac].stbi001
                        AND stbisite = g_stbi_d[l_ac].stbisite
                     IF l_n > 0 THEN 
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = g_stbi_d[l_ac].stbi001
                        LET g_errparam.code   = 'art-00489'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        #LET g_stbi_d[l_ac].stbi001 = g_stbi_d_t.stbi001   #160824-00007#179 Mark By Ken 161109
                        LET g_stbi_d[l_ac].stbi001 = g_stbi_d_o.stbi001    #160824-00007#179 Add By Ken 161109                        
                        DISPLAY BY NAME g_stbi_d[l_ac].stbi001
                        NEXT FIELD CURRENT
                     END IF 
                     CALL s_astt313_get_stao029(g_stbi_d[l_ac].stbisite,g_stbh_m.stbh002,g_stbi_d[l_ac].stbi001,g_stbh_m.stbhdocdt) RETURNING g_stbi_d[l_ac].stbi017
                  END IF 
               END IF 
               #根据商品编号检验或带出商品条码
               CALL astt312_stbi001_display()
               #根据商品编号带值
               CALL astt312_stbi001_get()
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbi001
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbi001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbi001_desc
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi001
            #add-point:BEFORE FIELD stbi001 name="input.b.page1.stbi001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi001
            #add-point:ON CHANGE stbi001 name="input.g.page1.stbi001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi003
            #add-point:BEFORE FIELD stbi003 name="input.b.page1.stbi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi003
            
            #add-point:AFTER FIELD stbi003 name="input.a.page1.stbi003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi003
            #add-point:ON CHANGE stbi003 name="input.g.page1.stbi003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi005
            #add-point:BEFORE FIELD stbi005 name="input.b.page1.stbi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi005
            
            #add-point:AFTER FIELD stbi005 name="input.a.page1.stbi005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi005
            #add-point:ON CHANGE stbi005 name="input.g.page1.stbi005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi006
            #add-point:BEFORE FIELD stbi006 name="input.b.page1.stbi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi006
            
            #add-point:AFTER FIELD stbi006 name="input.a.page1.stbi006"
            #日期检查
            CALL astt312_stbidate_chk(g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            IF NOT cl_null(g_errno) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbi_d[l_ac].stbi006
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               #LET g_stbi_d[l_ac].stbi006 = g_stbi_d_t.stbi006   #160824-00007#179 Mark By Ken 161109
               LET g_stbi_d[l_ac].stbi006 = g_stbi_d_o.stbi006    #160824-00007#179 Add By Ken 161109
               DISPLAY BY NAME g_stbi_d[l_ac].stbi006
               NEXT FIELD CURRENT
            END IF 
            #设置开启关闭进价栏位
            CALL astt312_stbi_set('1',g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi006 != g_stbi_d_t.stbi006) THEN   #160824-00007#179 Mark By Ken 161109
            IF g_stbi_d[l_ac].stbi006 != g_stbi_d_o.stbi006 THEN    #160824-00007#179 Add By Ken 161109
               CALL astt312_stbi_default('1',g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            END IF 
            IF NOT cl_null(g_stbi_d[l_ac].stbi006) AND cl_null(g_stbi_d[l_ac].stbi007) THEN 
               LET g_stbi_d[l_ac].stbi007 = g_stbi_d[l_ac].stbi006
            END IF 
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi006
            #add-point:ON CHANGE stbi006 name="input.g.page1.stbi006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi007
            #add-point:BEFORE FIELD stbi007 name="input.b.page1.stbi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi007
            
            #add-point:AFTER FIELD stbi007 name="input.a.page1.stbi007"
            #日期检查
            CALL astt312_stbidate_chk(g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            IF NOT cl_null(g_errno) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbi_d[l_ac].stbi007
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               #LET g_stbi_d[l_ac].stbi007 = g_stbi_d_t.stbi007  #160824-00007#179 Mark By Ken 161109
               LET g_stbi_d[l_ac].stbi007 = g_stbi_d_o.stbi007   #160824-00007#179 Add By Ken 161109
               DISPLAY BY NAME g_stbi_d[l_ac].stbi007
               NEXT FIELD CURRENT
            END IF
            #设置开启关闭进价栏位
            CALL astt312_stbi_set('1',g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi007 != g_stbi_d_t.stbi007) THEN     #160824-00007#179 Mark By Ken 161109
            IF g_stbi_d[l_ac].stbi007 != g_stbi_d_o.stbi007 THEN     #160824-00007#179 Add By Ken 161109
               CALL astt312_stbi_default('1',g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007)
            END IF 
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi007
            #add-point:ON CHANGE stbi007 name="input.g.page1.stbi007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi008,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi008
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi008 name="input.a.page1.stbi008"
            IF NOT cl_null(g_stbi_d[l_ac].stbi008) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi008
            #add-point:BEFORE FIELD stbi008 name="input.b.page1.stbi008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi008
            #add-point:ON CHANGE stbi008 name="input.g.page1.stbi008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi010
            #add-point:BEFORE FIELD stbi010 name="input.b.page1.stbi010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi010
            
            #add-point:AFTER FIELD stbi010 name="input.a.page1.stbi010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi010
            #add-point:ON CHANGE stbi010 name="input.g.page1.stbi010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi011
            #add-point:BEFORE FIELD stbi011 name="input.b.page1.stbi011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi011
            
            #add-point:AFTER FIELD stbi011 name="input.a.page1.stbi011"
            #日期检查
            CALL astt312_stbidate_chk(g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            IF NOT cl_null(g_errno) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbi_d[l_ac].stbi011
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               #LET g_stbi_d[l_ac].stbi011 = g_stbi_d_t.stbi011  #160824-00007#179 Mark By Ken 161109 
               LET g_stbi_d[l_ac].stbi011 = g_stbi_d_o.stbi011   #160824-00007#179 Add By Ken 161109
               DISPLAY BY NAME g_stbi_d[l_ac].stbi011
               NEXT FIELD CURRENT
            END IF
            #设置开启关闭进价栏位
            CALL astt312_stbi_set('2',g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi011 != g_stbi_d_t.stbi011) THEN     #160824-00007#179 Mark By Ken 161109
            IF g_stbi_d[l_ac].stbi011 != g_stbi_d_o.stbi011 THEN      #160824-00007#179 Add By Ken 161109
               CALL astt312_stbi_default('2',g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            END IF 
            IF NOT cl_null(g_stbi_d[l_ac].stbi011) AND cl_null(g_stbi_d[l_ac].stbi012) THEN 
               LET g_stbi_d[l_ac].stbi012 = g_stbi_d[l_ac].stbi011
            END IF 
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi011
            #add-point:ON CHANGE stbi011 name="input.g.page1.stbi011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi012
            #add-point:BEFORE FIELD stbi012 name="input.b.page1.stbi012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi012
            
            #add-point:AFTER FIELD stbi012 name="input.a.page1.stbi012"
            #日期检查
            CALL astt312_stbidate_chk(g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            IF NOT cl_null(g_errno) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbi_d[l_ac].stbi012
               LET g_errparam.code   = g_errno
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               #LET g_stbi_d[l_ac].stbi012 = g_stbi_d_t.stbi012  #160824-00007#179 Mark By Ken 161109
               LET g_stbi_d[l_ac].stbi012 = g_stbi_d_o.stbi012   #160824-00007#179 Add By Ken 161109
               DISPLAY BY NAME g_stbi_d[l_ac].stbi012
               NEXT FIELD CURRENT
            END IF
            #设置开启关闭进价栏位
            #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_stbi_d[l_ac].stbi012 != g_stbi_d_t.stbi012) THEN   #160824-00007#179 Mark By Ken 161109
            IF g_stbi_d[l_ac].stbi012 != g_stbi_d_o.stbi012 THEN     #160824-00007#179 Add By Ken 161109
               CALL astt312_stbi_default('2',g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012)
            END IF 
            LET g_stbi_d_o.* = g_stbi_d[l_ac].*     #160824-00007#179 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi012
            #add-point:ON CHANGE stbi012 name="input.g.page1.stbi012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi013
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi013,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi013
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi013 name="input.a.page1.stbi013"
            IF NOT cl_null(g_stbi_d[l_ac].stbi013) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi013
            #add-point:BEFORE FIELD stbi013 name="input.b.page1.stbi013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi013
            #add-point:ON CHANGE stbi013 name="input.g.page1.stbi013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi014
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi014,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi014
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi014 name="input.a.page1.stbi014"
            IF NOT cl_null(g_stbi_d[l_ac].stbi014) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi014
            #add-point:BEFORE FIELD stbi014 name="input.b.page1.stbi014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi014
            #add-point:ON CHANGE stbi014 name="input.g.page1.stbi014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi015
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi015,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi015
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi015 name="input.a.page1.stbi015"
            IF NOT cl_null(g_stbi_d[l_ac].stbi015) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi015
            #add-point:BEFORE FIELD stbi015 name="input.b.page1.stbi015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi015
            #add-point:ON CHANGE stbi015 name="input.g.page1.stbi015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi016
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi016,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi016
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi016 name="input.a.page1.stbi016"
            IF NOT cl_null(g_stbi_d[l_ac].stbi016) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi016
            #add-point:BEFORE FIELD stbi016 name="input.b.page1.stbi016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi016
            #add-point:ON CHANGE stbi016 name="input.g.page1.stbi016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi017
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi017,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stbi017
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi017 name="input.a.page1.stbi017"
            IF NOT cl_null(g_stbi_d[l_ac].stbi017) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi017
            #add-point:BEFORE FIELD stbi017 name="input.b.page1.stbi017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi017
            #add-point:ON CHANGE stbi017 name="input.g.page1.stbi017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi018
            #add-point:BEFORE FIELD stbi018 name="input.b.page1.stbi018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi018
            
            #add-point:AFTER FIELD stbi018 name="input.a.page1.stbi018"
        
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi018
            #add-point:ON CHANGE stbi018 name="input.g.page1.stbi018"
            CALL astt312_comp_set()
            IF NOT cl_null(g_stbi_d[l_ac].stbi018) THEN 
               LET g_stbi_d[l_ac].stbi023 = g_today
               LET g_stbi_d[l_ac].stbi024 = '1'
            END IF 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi019
            #add-point:BEFORE FIELD stbi019 name="input.b.page1.stbi019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi019
            
            #add-point:AFTER FIELD stbi019 name="input.a.page1.stbi019"
            IF NOT cl_null(g_stbi_d[l_ac].stbi019) THEN          
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbi_d[l_ac].stbisite
               LET g_chkparam.arg2 = g_stbi_d[l_ac].stbi019

               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_infc001") THEN
                  #檢查成功時後續處理

               ELSE
                  #檢查失敗時後續處理
                  LET g_stbi_d[l_ac].stbi019 = g_stbi_d_t.stbi019
                  DISPLAY BY NAME g_stbi_d[l_ac].stbi019
                  NEXT FIELD CURRENT
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi019
            #add-point:ON CHANGE stbi019 name="input.g.page1.stbi019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi020
            #add-point:BEFORE FIELD stbi020 name="input.b.page1.stbi020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi020
            
            #add-point:AFTER FIELD stbi020 name="input.a.page1.stbi020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi020
            #add-point:ON CHANGE stbi020 name="input.g.page1.stbi020"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi021
            
            #add-point:AFTER FIELD stbi021 name="input.a.page1.stbi021"
            IF NOT cl_null(g_stbi_d[l_ac].stbi021) THEN 
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbi_d[l_ac].stbi021
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_stae001") THEN
                  #檢查成功時後續處理

               ELSE
                  #檢查失敗時後續處理
                  LET g_stbi_d[l_ac].stbi021 = g_stbi_d_t.stbi021
                  DISPLAY BY NAME g_stbi_d[l_ac].stbi021
                  NEXT FIELD CURRENT
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbi021
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbi021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbi021_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi021
            #add-point:BEFORE FIELD stbi021 name="input.b.page1.stbi021"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi021
            #add-point:ON CHANGE stbi021 name="input.g.page1.stbi021"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi022
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi022,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stbi022
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi022 name="input.a.page1.stbi022"
            IF NOT cl_null(g_stbi_d[l_ac].stbi022) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi022
            #add-point:BEFORE FIELD stbi022 name="input.b.page1.stbi022"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi022
            #add-point:ON CHANGE stbi022 name="input.g.page1.stbi022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi023
            #add-point:BEFORE FIELD stbi023 name="input.b.page1.stbi023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi023
            
            #add-point:AFTER FIELD stbi023 name="input.a.page1.stbi023"
            IF NOT cl_null(g_stbi_d[l_ac].stbi023) THEN 
               LET g_stbi_d[l_ac].stbi024 = '1'
            ELSE
               LET g_stbi_d[l_ac].stbi024 = ''
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi023
            #add-point:ON CHANGE stbi023 name="input.g.page1.stbi023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi030
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi030,"0.000","1","100.000","1","azz-00087",1) THEN 
 
               NEXT FIELD stbi030
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi030 name="input.a.page1.stbi030"
            IF NOT cl_null(g_stbi_d[l_ac].stbi030) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi030
            #add-point:BEFORE FIELD stbi030 name="input.b.page1.stbi030"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi030
            #add-point:ON CHANGE stbi030 name="input.g.page1.stbi030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi025
            #add-point:BEFORE FIELD stbi025 name="input.b.page1.stbi025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi025
            
            #add-point:AFTER FIELD stbi025 name="input.a.page1.stbi025"
            IF NOT cl_null(g_stbi_d[l_ac].stbi026) THEN 
               CASE g_stbi_d[l_ac].stbi025
                  WHEN '1'
                      IF g_stbi_d[l_ac].stbi026 = '3' THEN 
                         INITIALIZE g_errparam TO NULL 
                         LET g_errparam.extend = ''
                         LET g_errparam.code   = 'ast-00279'
                         LET g_errparam.popup  = TRUE 
                         CALL cl_err()
                         LET g_stbi_d[l_ac].stbi025 = g_stbi_d_t.stbi025
                         NEXT FIELD CURRENT 
                      END IF 
                  WHEN '2'
                      IF g_stbi_d[l_ac].stbi026 = '3' THEN 
                         INITIALIZE g_errparam TO NULL 
                         LET g_errparam.extend = ''
                         LET g_errparam.code   = 'ast-00280'
                         LET g_errparam.popup  = TRUE 
                         CALL cl_err()
                         LET g_stbi_d[l_ac].stbi025 = g_stbi_d_t.stbi025
                         NEXT FIELD CURRENT
                      END IF 
                  WHEN '3'
                      #151013-00001#43--dongsz mark--str
#                      IF g_stbi_d[l_ac].stbi026 = '2' THEN 
#                         INITIALIZE g_errparam TO NULL 
#                         LET g_errparam.extend = ''
#                         LET g_errparam.code   = 'ast-00281'
#                         LET g_errparam.popup  = TRUE 
#                         CALL cl_err()
#                         LET g_stbi_d[l_ac].stbi025 = g_stbi_d_t.stbi025
#                         NEXT FIELD CURRENT
#                      END IF 
                      #151013-00001#43--dongsz mark--end
               END CASE
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi025
            #add-point:ON CHANGE stbi025 name="input.g.page1.stbi025"
            CALL astt312_comp_set()
            IF NOT cl_null(g_stbi_d[l_ac].stbi025) THEN 
               LET g_stbi_d[l_ac].stbi028 = g_today
               LET g_stbi_d[l_ac].stbi029 = '1'
            END IF 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi026
            #add-point:BEFORE FIELD stbi026 name="input.b.page1.stbi026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi026
            
            #add-point:AFTER FIELD stbi026 name="input.a.page1.stbi026"
            CASE g_stbi_d[l_ac].stbi025
               WHEN '1'
                   IF g_stbi_d[l_ac].stbi026 = '3' THEN 
                      INITIALIZE g_errparam TO NULL 
                      LET g_errparam.extend = ''
                      LET g_errparam.code   = 'ast-00279'
                      LET g_errparam.popup  = TRUE 
                      CALL cl_err()
                      LET g_stbi_d[l_ac].stbi026 = g_stbi_d_t.stbi026
                      NEXT FIELD CURRENT
                   END IF 
               WHEN '2'
                   IF g_stbi_d[l_ac].stbi026 = '3' THEN 
                      INITIALIZE g_errparam TO NULL 
                      LET g_errparam.extend = ''
                      LET g_errparam.code   = 'ast-00280'
                      LET g_errparam.popup  = TRUE 
                      CALL cl_err()
                      LET g_stbi_d[l_ac].stbi026 = g_stbi_d_t.stbi026
                      NEXT FIELD CURRENT
                   END IF 
               WHEN '3'
                   #151013-00001#43--dongsz mark--str
#                   IF g_stbi_d[l_ac].stbi026 = '2' THEN 
#                      INITIALIZE g_errparam TO NULL 
#                      LET g_errparam.extend = ''
#                      LET g_errparam.code   = 'ast-00281'
#                      LET g_errparam.popup  = TRUE
#                      CALL cl_err()
#                      LET g_stbi_d[l_ac].stbi026 = g_stbi_d_t.stbi026
#                      NEXT FIELD CURRENT
#                   END IF 
                   #151013-00001#43--dongsz mark--end
            END CASE 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi026
            #add-point:ON CHANGE stbi026 name="input.g.page1.stbi026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi027
            #add-point:BEFORE FIELD stbi027 name="input.b.page1.stbi027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi027
            
            #add-point:AFTER FIELD stbi027 name="input.a.page1.stbi027"
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi027,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stbi027
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi027
            #add-point:ON CHANGE stbi027 name="input.g.page1.stbi027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi028
            #add-point:BEFORE FIELD stbi028 name="input.b.page1.stbi028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi028
            
            #add-point:AFTER FIELD stbi028 name="input.a.page1.stbi028"
            IF NOT cl_null(g_stbi_d[l_ac].stbi028) THEN 
               LET g_stbi_d[l_ac].stbi029 = '1'
            ELSE
               LET g_stbi_d[l_ac].stbi029 = ''
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi028
            #add-point:ON CHANGE stbi028 name="input.g.page1.stbi028"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbi031
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stbi_d[l_ac].stbi031,"0.000","1","100.000","1","azz-00087",1) THEN 
 
               NEXT FIELD stbi031
            END IF 
 
 
 
            #add-point:AFTER FIELD stbi031 name="input.a.page1.stbi031"
            IF NOT cl_null(g_stbi_d[l_ac].stbi031) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbi031
            #add-point:BEFORE FIELD stbi031 name="input.b.page1.stbi031"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbi031
            #add-point:ON CHANGE stbi031 name="input.g.page1.stbi031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbiunit
            #add-point:BEFORE FIELD stbiunit name="input.b.page1.stbiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbiunit
            
            #add-point:AFTER FIELD stbiunit name="input.a.page1.stbiunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbiunit
            #add-point:ON CHANGE stbiunit name="input.g.page1.stbiunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbiseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbiseq
            #add-point:ON ACTION controlp INFIELD stbiseq name="input.c.page1.stbiseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbisite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbisite
            #add-point:ON ACTION controlp INFIELD stbisite name="input.c.page1.stbisite"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbi_d[l_ac].stbisite             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = "" #s
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbisite',g_stbh_m.stbhsite,'i') #add by geza 20161026 #161024-00025#10

            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stbi_d[l_ac].stbisite = g_qryparam.return1              

            DISPLAY g_stbi_d[l_ac].stbisite TO stbisite              #

            NEXT FIELD stbisite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi002
            #add-point:ON ACTION controlp INFIELD stbi002 name="input.c.page1.stbi002"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_stbh_m.stbhsite
            LET g_qryparam.where = "1=1"
            CALL q_imay003_8()
            LET g_stbi_d[l_ac].stbi002 = g_qryparam.return1
            CALL astt312_stbi002_display()
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbi001
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbi001_desc = '', g_rtn_fields[1] , ''
            LET g_stbi_d[l_ac].stbi001_desc_1 = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbi001_desc,g_stbi_d[l_ac].stbi001_desc_1
            DISPLAY g_stbi_d[l_ac].stbi002 TO stbi002
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi001
            #add-point:ON ACTION controlp INFIELD stbi001 name="input.c.page1.stbi001"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stbi_d[l_ac].stbi001
            #抓取采购协议
            SELECT star001 INTO l_star001
              FROM star_t
             WHERE starent = g_enterprise
               AND star004 = g_stbh_m.stbh001
               AND starsite = g_stbh_m.stbhsite
            LET g_qryparam.where = " rtdx001 IN(SELECT stas003 FROM stas_t WHERE stasent = '",g_enterprise,"' AND stas001 = '",l_star001,"') "
            LET g_qryparam.arg1 = g_stbh_m.stbhsite
            CALL q_rtdx001_1()
            LET g_stbi_d[l_ac].stbi001 = g_qryparam.return1
            DISPLAY g_stbi_d[l_ac].stbi001 TO stbi001
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbi001
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbi001_desc = '', g_rtn_fields[1] , ''
            LET g_stbi_d[l_ac].stbi001_desc_1 = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbi001_desc,g_stbi_d[l_ac].stbi001_desc_1
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi003
            #add-point:ON ACTION controlp INFIELD stbi003 name="input.c.page1.stbi003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi005
            #add-point:ON ACTION controlp INFIELD stbi005 name="input.c.page1.stbi005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi006
            #add-point:ON ACTION controlp INFIELD stbi006 name="input.c.page1.stbi006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi007
            #add-point:ON ACTION controlp INFIELD stbi007 name="input.c.page1.stbi007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi008
            #add-point:ON ACTION controlp INFIELD stbi008 name="input.c.page1.stbi008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi010
            #add-point:ON ACTION controlp INFIELD stbi010 name="input.c.page1.stbi010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi011
            #add-point:ON ACTION controlp INFIELD stbi011 name="input.c.page1.stbi011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi012
            #add-point:ON ACTION controlp INFIELD stbi012 name="input.c.page1.stbi012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi013
            #add-point:ON ACTION controlp INFIELD stbi013 name="input.c.page1.stbi013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi014
            #add-point:ON ACTION controlp INFIELD stbi014 name="input.c.page1.stbi014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi015
            #add-point:ON ACTION controlp INFIELD stbi015 name="input.c.page1.stbi015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi016
            #add-point:ON ACTION controlp INFIELD stbi016 name="input.c.page1.stbi016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi017
            #add-point:ON ACTION controlp INFIELD stbi017 name="input.c.page1.stbi017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi018
            #add-point:ON ACTION controlp INFIELD stbi018 name="input.c.page1.stbi018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi019
            #add-point:ON ACTION controlp INFIELD stbi019 name="input.c.page1.stbi019"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_stbi_d[l_ac].stbisite
            LET g_qryparam.where = "1=1"
            CALL q_infc001_1()
            LET g_stbi_d[l_ac].stbi019 = g_qryparam.return1
            DISPLAY BY NAME g_stbi_d[l_ac].stbi019
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi020
            #add-point:ON ACTION controlp INFIELD stbi020 name="input.c.page1.stbi020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi021
            #add-point:ON ACTION controlp INFIELD stbi021 name="input.c.page1.stbi021"
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stae001()
            LET g_stbi_d[l_ac].stbi021 = g_qryparam.return1
            DISPLAY BY NAME g_stbi_d[l_ac].stbi021
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbi_d[l_ac].stbi021
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbi_d[l_ac].stbi021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbi_d[l_ac].stbi021_desc
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi022
            #add-point:ON ACTION controlp INFIELD stbi022 name="input.c.page1.stbi022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi023
            #add-point:ON ACTION controlp INFIELD stbi023 name="input.c.page1.stbi023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi030
            #add-point:ON ACTION controlp INFIELD stbi030 name="input.c.page1.stbi030"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi025
            #add-point:ON ACTION controlp INFIELD stbi025 name="input.c.page1.stbi025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi026
            #add-point:ON ACTION controlp INFIELD stbi026 name="input.c.page1.stbi026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi027
            #add-point:ON ACTION controlp INFIELD stbi027 name="input.c.page1.stbi027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi028
            #add-point:ON ACTION controlp INFIELD stbi028 name="input.c.page1.stbi028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbi031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbi031
            #add-point:ON ACTION controlp INFIELD stbi031 name="input.c.page1.stbi031"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbiunit
            #add-point:ON ACTION controlp INFIELD stbiunit name="input.c.page1.stbiunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbi_d[l_ac].* = g_stbi_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt312_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbi_d[l_ac].stbiseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbi_d[l_ac].* = g_stbi_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               IF cl_null(g_stbi_d[l_ac].stbi008) AND cl_null(g_stbi_d[l_ac].stbi013) THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'ast-00275'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT 
               END IF 
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt312_stbi_t_mask_restore('restore_mask_o')
      
               UPDATE stbi_t SET (stbidocno,stbiseq,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006, 
                   stbi007,stbi004,stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016, 
                   stbi032,stbi017,stbi018,stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025, 
                   stbi026,stbi027,stbi028,stbi031,stbi029,stbiunit) = (g_stbh_m.stbhdocno,g_stbi_d[l_ac].stbiseq, 
                   g_stbi_d[l_ac].stbisite,g_stbi_d[l_ac].stbi002,g_stbi_d[l_ac].stbi001,g_stbi_d[l_ac].stbi003, 
                   g_stbi_d[l_ac].stbi005,g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007,g_stbi_d[l_ac].stbi004, 
                   g_stbi_d[l_ac].stbi008,g_stbi_d[l_ac].stbi010,g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012, 
                   g_stbi_d[l_ac].stbi009,g_stbi_d[l_ac].stbi013,g_stbi_d[l_ac].stbi014,g_stbi_d[l_ac].stbi015, 
                   g_stbi_d[l_ac].stbi016,g_stbi_d[l_ac].stbi032,g_stbi_d[l_ac].stbi017,g_stbi_d[l_ac].stbi018, 
                   g_stbi_d[l_ac].stbi019,g_stbi_d[l_ac].stbi020,g_stbi_d[l_ac].stbi021,g_stbi_d[l_ac].stbi022, 
                   g_stbi_d[l_ac].stbi023,g_stbi_d[l_ac].stbi030,g_stbi_d[l_ac].stbi024,g_stbi_d[l_ac].stbi025, 
                   g_stbi_d[l_ac].stbi026,g_stbi_d[l_ac].stbi027,g_stbi_d[l_ac].stbi028,g_stbi_d[l_ac].stbi031, 
                   g_stbi_d[l_ac].stbi029,g_stbi_d[l_ac].stbiunit)
                WHERE stbient = g_enterprise AND stbidocno = g_stbh_m.stbhdocno 
 
                  AND stbiseq = g_stbi_d_t.stbiseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbi_d[l_ac].* = g_stbi_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbi_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbi_d[l_ac].* = g_stbi_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stbh_m.stbhdocno
               LET gs_keys_bak[1] = g_stbhdocno_t
               LET gs_keys[2] = g_stbi_d[g_detail_idx].stbiseq
               LET gs_keys_bak[2] = g_stbi_d_t.stbiseq
               CALL astt312_update_b('stbi_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt312_stbi_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stbi_d[g_detail_idx].stbiseq = g_stbi_d_t.stbiseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stbh_m.stbhdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stbi_d_t.stbiseq
 
                  CALL astt312_key_update_b(gs_keys,'stbi_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stbh_m),util.JSON.stringify(g_stbi_d_t)
               LET g_log2 = util.JSON.stringify(g_stbh_m),util.JSON.stringify(g_stbi_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
 
            #end add-point
            CALL astt312_unlock_b("stbi_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            IF cl_null(g_stbi_d[l_ac].stbi008) AND cl_null(g_stbi_d[l_ac].stbi013) THEN 
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'ast-00275'
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               NEXT FIELD CURRENT 
            END IF 
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stbi_d[li_reproduce_target].* = g_stbi_d[li_reproduce].*
 
               LET g_stbi_d[li_reproduce_target].stbiseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbi_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbi_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt312.input.other" >}
      
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
            
            #end add-point  
            NEXT FIELD stbhdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbiseq
 
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
 
{<section id="astt312.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt312_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt312_b_fill() #單身填充
      CALL astt312_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt312_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stbh_m_mask_o.* =  g_stbh_m.*
   CALL astt312_stbh_t_mask()
   LET g_stbh_m_mask_n.* =  g_stbh_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhsite_desc,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001, 
       g_stbh_m.stbh002,g_stbh_m.stbh002_desc,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh004_desc, 
       g_stbh_m.stbh005,g_stbh_m.stbh005_desc,g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh008_desc, 
       g_stbh_m.stbh009,g_stbh_m.stbh009_desc,g_stbh_m.stbhunit,g_stbh_m.stbhstus,g_stbh_m.stbhownid, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtid_desc, 
       g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdp_desc,g_stbh_m.stbhcrtdt,g_stbh_m.stbhmodid,g_stbh_m.stbhmodid_desc, 
       g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfid_desc,g_stbh_m.stbhcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbh_m.stbhstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stbi_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt312_detail_show()
 
   #add-point:show段之後 name="show.after"
   IF g_stbh_m.stbh003 = '1' OR g_stbh_m.stbh003 = '2' THEN 
      CALL cl_set_comp_visible('stbi017,stbi032',FALSE)
   ELSE
      CALL cl_set_comp_visible('stbi017,stbi032',TRUE)
   END IF 
   IF g_stbh_m.stbh003 = '3' THEN
      CALL cl_set_comp_visible('stbi004,stbi006,stbi007,stbi008',FALSE)
   ELSE
      CALL cl_set_comp_visible('stbi004,stbi006,stbi007,stbi008',TRUE)
   END IF 
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt312_detail_show()
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
 
{<section id="astt312.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt312_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stbh_t.stbhdocno 
   DEFINE l_oldno     LIKE stbh_t.stbhdocno 
 
   DEFINE l_master    RECORD LIKE stbh_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stbi_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
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
   
   IF g_stbh_m.stbhdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
    
   LET g_stbh_m.stbhdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stbh_m.stbhownid = g_user
      LET g_stbh_m.stbhowndp = g_dept
      LET g_stbh_m.stbhcrtid = g_user
      LET g_stbh_m.stbhcrtdp = g_dept 
      LET g_stbh_m.stbhcrtdt = cl_get_current()
      LET g_stbh_m.stbhmodid = g_user
      LET g_stbh_m.stbhmoddt = cl_get_current()
      LET g_stbh_m.stbhstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stbh_m.stbhstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt312_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stbh_m.* TO NULL
      INITIALIZE g_stbi_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt312_show()
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
   CALL astt312_set_act_visible()   
   CALL astt312_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbhent = " ||g_enterprise|| " AND",
                      " stbhdocno = '", g_stbh_m.stbhdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt312_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt312_idx_chk()
   
   LET g_data_owner = g_stbh_m.stbhownid      
   LET g_data_dept  = g_stbh_m.stbhowndp
   
   #功能已完成,通報訊息中心
   CALL astt312_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt312_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stbi_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt312_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbi_t
    WHERE stbient = g_enterprise AND stbidocno = g_stbhdocno_t
 
    INTO TEMP astt312_detail
 
   #將key修正為調整後   
   UPDATE astt312_detail 
      #更新key欄位
      SET stbidocno = g_stbh_m.stbhdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   UPDATE astt312_detail SET stbi029 = '1'
    WHERE stbi029 IS NOT NULL
   UPDATE astt312_detail SET stbi024 = '1'
    WHERE stbi024 IS NOT NULL
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stbi_t SELECT * FROM astt312_detail
   
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
   DROP TABLE astt312_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt312_delete()
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
   
   IF g_stbh_m.stbhdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt312_cl USING g_enterprise,g_stbh_m.stbhdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt312_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt312_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt312_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stbh_m_mask_o.* =  g_stbh_m.*
   CALL astt312_stbh_t_mask()
   LET g_stbh_m_mask_n.* =  g_stbh_m.*
   
   CALL astt312_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt312_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stbhdocno_t = g_stbh_m.stbhdocno
 
 
      DELETE FROM stbh_t
       WHERE stbhent = g_enterprise AND stbhdocno = g_stbh_m.stbhdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stbh_m.stbhdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stbi_t
       WHERE stbient = g_enterprise AND stbidocno = g_stbh_m.stbhdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stbh_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt312_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stbi_d.clear() 
 
     
      CALL astt312_ui_browser_refresh()  
      #CALL astt312_ui_headershow()  
      #CALL astt312_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt312_browser_fill("")
         CALL astt312_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt312_cl
 
   #功能已完成,通報訊息中心
   CALL astt312_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt312.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt312_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stbi_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt312_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbiseq,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006,stbi007, 
             stbi004,stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016,stbi032, 
             stbi017,stbi018,stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025,stbi026, 
             stbi027,stbi028,stbi031,stbi029,stbiunit ,t1.ooefl003 ,t2.imaal003 ,t4.stael003 FROM stbi_t", 
                
                     " INNER JOIN stbh_t ON stbhent = " ||g_enterprise|| " AND stbhdocno = stbidocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=stbisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=stbi001 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t4 ON t4.staelent="||g_enterprise||" AND t4.stael001=stbi021 AND t4.stael002='"||g_dlang||"' ",
 
                     " WHERE stbient=? AND stbidocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbi_t.stbiseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt312_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt312_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stbh_m.stbhdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stbh_m.stbhdocno INTO g_stbi_d[l_ac].stbiseq,g_stbi_d[l_ac].stbisite, 
          g_stbi_d[l_ac].stbi002,g_stbi_d[l_ac].stbi001,g_stbi_d[l_ac].stbi003,g_stbi_d[l_ac].stbi005, 
          g_stbi_d[l_ac].stbi006,g_stbi_d[l_ac].stbi007,g_stbi_d[l_ac].stbi004,g_stbi_d[l_ac].stbi008, 
          g_stbi_d[l_ac].stbi010,g_stbi_d[l_ac].stbi011,g_stbi_d[l_ac].stbi012,g_stbi_d[l_ac].stbi009, 
          g_stbi_d[l_ac].stbi013,g_stbi_d[l_ac].stbi014,g_stbi_d[l_ac].stbi015,g_stbi_d[l_ac].stbi016, 
          g_stbi_d[l_ac].stbi032,g_stbi_d[l_ac].stbi017,g_stbi_d[l_ac].stbi018,g_stbi_d[l_ac].stbi019, 
          g_stbi_d[l_ac].stbi020,g_stbi_d[l_ac].stbi021,g_stbi_d[l_ac].stbi022,g_stbi_d[l_ac].stbi023, 
          g_stbi_d[l_ac].stbi030,g_stbi_d[l_ac].stbi024,g_stbi_d[l_ac].stbi025,g_stbi_d[l_ac].stbi026, 
          g_stbi_d[l_ac].stbi027,g_stbi_d[l_ac].stbi028,g_stbi_d[l_ac].stbi031,g_stbi_d[l_ac].stbi029, 
          g_stbi_d[l_ac].stbiunit,g_stbi_d[l_ac].stbisite_desc,g_stbi_d[l_ac].stbi001_desc,g_stbi_d[l_ac].stbi021_desc  
            #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_stbi_d[l_ac].stbi001
         CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stbi_d[l_ac].stbi001_desc = '', g_rtn_fields[1] , ''
         LET g_stbi_d[l_ac].stbi001_desc_1 = '', g_rtn_fields[2] , ''
         DISPLAY BY NAME g_stbi_d[l_ac].stbi001_desc,g_stbi_d[l_ac].stbi001_desc_1
         
         #抓取品类，品类名称
         SELECT imaa009,rtaxl003
           INTO g_stbi_d[l_ac].imaa009,g_stbi_d[l_ac].imaa009_desc
           FROM imaa_t LEFT JOIN rtaxl_t ON imaaent = rtaxlent AND rtaxl001 = imaa009 AND rtaxl002 = g_lang
          WHERE imaaent = g_enterprise
            AND imaa001 = g_stbi_d[l_ac].stbi001  
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
   
   CALL g_stbi_d.deleteElement(g_stbi_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt312_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbi_d.getLength()
      LET g_stbi_d_mask_o[l_ac].* =  g_stbi_d[l_ac].*
      CALL astt312_stbi_t_mask()
      LET g_stbi_d_mask_n[l_ac].* =  g_stbi_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt312_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stbi_t
       WHERE stbient = g_enterprise AND
         stbidocno = ps_keys_bak[1] AND stbiseq = ps_keys_bak[2]
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
         CALL g_stbi_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt312_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stbi_t
                  (stbient,
                   stbidocno,
                   stbiseq
                   ,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006,stbi007,stbi004,stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016,stbi032,stbi017,stbi018,stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025,stbi026,stbi027,stbi028,stbi031,stbi029,stbiunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbi_d[g_detail_idx].stbisite,g_stbi_d[g_detail_idx].stbi002,g_stbi_d[g_detail_idx].stbi001, 
                       g_stbi_d[g_detail_idx].stbi003,g_stbi_d[g_detail_idx].stbi005,g_stbi_d[g_detail_idx].stbi006, 
                       g_stbi_d[g_detail_idx].stbi007,g_stbi_d[g_detail_idx].stbi004,g_stbi_d[g_detail_idx].stbi008, 
                       g_stbi_d[g_detail_idx].stbi010,g_stbi_d[g_detail_idx].stbi011,g_stbi_d[g_detail_idx].stbi012, 
                       g_stbi_d[g_detail_idx].stbi009,g_stbi_d[g_detail_idx].stbi013,g_stbi_d[g_detail_idx].stbi014, 
                       g_stbi_d[g_detail_idx].stbi015,g_stbi_d[g_detail_idx].stbi016,g_stbi_d[g_detail_idx].stbi032, 
                       g_stbi_d[g_detail_idx].stbi017,g_stbi_d[g_detail_idx].stbi018,g_stbi_d[g_detail_idx].stbi019, 
                       g_stbi_d[g_detail_idx].stbi020,g_stbi_d[g_detail_idx].stbi021,g_stbi_d[g_detail_idx].stbi022, 
                       g_stbi_d[g_detail_idx].stbi023,g_stbi_d[g_detail_idx].stbi030,g_stbi_d[g_detail_idx].stbi024, 
                       g_stbi_d[g_detail_idx].stbi025,g_stbi_d[g_detail_idx].stbi026,g_stbi_d[g_detail_idx].stbi027, 
                       g_stbi_d[g_detail_idx].stbi028,g_stbi_d[g_detail_idx].stbi031,g_stbi_d[g_detail_idx].stbi029, 
                       g_stbi_d[g_detail_idx].stbiunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbi_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt312_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbi_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt312_stbi_t_mask_restore('restore_mask_o')
               
      UPDATE stbi_t 
         SET (stbidocno,
              stbiseq
              ,stbisite,stbi002,stbi001,stbi003,stbi005,stbi006,stbi007,stbi004,stbi008,stbi010,stbi011,stbi012,stbi009,stbi013,stbi014,stbi015,stbi016,stbi032,stbi017,stbi018,stbi019,stbi020,stbi021,stbi022,stbi023,stbi030,stbi024,stbi025,stbi026,stbi027,stbi028,stbi031,stbi029,stbiunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbi_d[g_detail_idx].stbisite,g_stbi_d[g_detail_idx].stbi002,g_stbi_d[g_detail_idx].stbi001, 
                  g_stbi_d[g_detail_idx].stbi003,g_stbi_d[g_detail_idx].stbi005,g_stbi_d[g_detail_idx].stbi006, 
                  g_stbi_d[g_detail_idx].stbi007,g_stbi_d[g_detail_idx].stbi004,g_stbi_d[g_detail_idx].stbi008, 
                  g_stbi_d[g_detail_idx].stbi010,g_stbi_d[g_detail_idx].stbi011,g_stbi_d[g_detail_idx].stbi012, 
                  g_stbi_d[g_detail_idx].stbi009,g_stbi_d[g_detail_idx].stbi013,g_stbi_d[g_detail_idx].stbi014, 
                  g_stbi_d[g_detail_idx].stbi015,g_stbi_d[g_detail_idx].stbi016,g_stbi_d[g_detail_idx].stbi032, 
                  g_stbi_d[g_detail_idx].stbi017,g_stbi_d[g_detail_idx].stbi018,g_stbi_d[g_detail_idx].stbi019, 
                  g_stbi_d[g_detail_idx].stbi020,g_stbi_d[g_detail_idx].stbi021,g_stbi_d[g_detail_idx].stbi022, 
                  g_stbi_d[g_detail_idx].stbi023,g_stbi_d[g_detail_idx].stbi030,g_stbi_d[g_detail_idx].stbi024, 
                  g_stbi_d[g_detail_idx].stbi025,g_stbi_d[g_detail_idx].stbi026,g_stbi_d[g_detail_idx].stbi027, 
                  g_stbi_d[g_detail_idx].stbi028,g_stbi_d[g_detail_idx].stbi031,g_stbi_d[g_detail_idx].stbi029, 
                  g_stbi_d[g_detail_idx].stbiunit) 
         WHERE stbient = g_enterprise AND stbidocno = ps_keys_bak[1] AND stbiseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbi_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbi_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt312_stbi_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt312.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt312_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt312.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt312_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt312.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt312_lock_b(ps_table,ps_page)
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
   #CALL astt312_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stbi_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt312_bcl USING g_enterprise,
                                       g_stbh_m.stbhdocno,g_stbi_d[g_detail_idx].stbiseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt312_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt312.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt312_unlock_b(ps_table,ps_page)
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
      CLOSE astt312_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt312_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   DEFINE l_n     LIKE type_t.num5
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stbhdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stbhdocno",TRUE)
      CALL cl_set_comp_entry("stbhdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stajsite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   #add by yangxf ----start----
   LET l_n = 0
   #单身有资料关闭合同和客户编号
   SELECT COUNT(*) INTO l_n
     FROM stbi_t
    WHERE stbient = g_enterprise
      AND stbidocno = g_stbh_m.stbhdocno
   IF l_n > 0 THEN 
      CALL cl_set_comp_entry("stbh001,stbh002",FALSE)
   ELSE
      CALL cl_set_comp_entry("stbh001,stbh002",TRUE)
   END IF 
   #add by yangxf ----end------
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt312_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stbhdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stbhdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stbhdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stbhsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stbhsite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt312_set_entry_b(p_cmd)
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
 
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt312_set_no_entry_b(p_cmd)
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
   
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt312_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt312_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stbh_m.stbhstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt312_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt312.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt312_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt312.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt312_default_search()
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
      LET ls_wc = ls_wc, " stbhdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stbh_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbi_t" 
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
 
{<section id="astt312.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt312_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_run      LIKE type_t.chr1   #20151110--dongsz add
   DEFINE l_n        LIKE type_t.num5   #20151110--dongsz add
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stbh_m.stbhdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt312_cl USING g_enterprise,g_stbh_m.stbhdocno
   IF STATUS THEN
      CLOSE astt312_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt312_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
       g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
       g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
       g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
       g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
       g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
       g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt312_action_chk() THEN
      CLOSE astt312_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhsite_desc,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt,g_stbh_m.stbh001, 
       g_stbh_m.stbh002,g_stbh_m.stbh002_desc,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh004_desc, 
       g_stbh_m.stbh005,g_stbh_m.stbh005_desc,g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh008_desc, 
       g_stbh_m.stbh009,g_stbh_m.stbh009_desc,g_stbh_m.stbhunit,g_stbh_m.stbhstus,g_stbh_m.stbhownid, 
       g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtid_desc, 
       g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdp_desc,g_stbh_m.stbhcrtdt,g_stbh_m.stbhmodid,g_stbh_m.stbhmodid_desc, 
       g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfid_desc,g_stbh_m.stbhcnfdt
 
   CASE g_stbh_m.stbhstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stbh_m.stbhstus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
         CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
         CASE g_stbh_m.stbhstus
            WHEN "N"
               CALL cl_set_act_visible("unconfirmed",FALSE)
            WHEN "X"
               CALL cl_set_act_visible("invalid,unconfirmed,confirmed",FALSE)
            WHEN "Y"
               CALL cl_set_act_visible("invalid,confirmed",FALSE)
         END CASE
      #end add-point
      
      
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            
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
      g_stbh_m.stbhstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt312_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   LET l_success = TRUE
   CASE
      WHEN lc_state = 'Y'
         CALL s_astt312_conf_chk(g_stbh_m.stbhdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               #CALL s_astt312_conf_upd(g_stbh_m.stbhdocno) RETURNING l_success    #20151110--dongsz mark
               #20151110--dongsz add--str---
               #執行日期為當前日期，則立即執行調價作業aprp125
               #判断单身开始日期是否等于当前日期
               LET l_n = 0
               LET l_run = 'N'
               SELECT COUNT(*) INTO l_n
                 FROM stbi_t
                WHERE stbient = g_enterprise
                  AND stbidocno = g_stbh_m.stbhdocno
                  AND ((stbi008 IS NOT NULL AND stbi006 = g_today) OR
                       (stbi013 IS NOT NULL AND stbi011 = g_today))
               IF l_n > 0 THEN
                  IF cl_ask_confirm("apr-00271") THEN
                     LET l_run = 'Y'
                  END IF
               END IF
               CALL s_astt312_conf_upd(g_stbh_m.stbhdocno,l_run) RETURNING l_success
               #20151110--dongsz add--end---
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stbh_m.stbhdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         END IF
      WHEN lc_state = 'X'
         CALL s_astt312_void_chk(g_stbh_m.stbhdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('art-00039') THEN

            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stbh_m.stbhdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         END IF
      WHEN lc_state = 'N'
         CALL s_astt312_unconf_chk(g_stbh_m.stbhdocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_begin()
               CALL s_astt312_unconf_upd(g_stbh_m.stbhdocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stbh_m.stbhdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         END IF
      OTHERWISE
         CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
         RETURN
   END CASE
   #end add-point
   
   LET g_stbh_m.stbhmodid = g_user
   LET g_stbh_m.stbhmoddt = cl_get_current()
   LET g_stbh_m.stbhstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stbh_t 
      SET (stbhstus,stbhmodid,stbhmoddt) 
        = (g_stbh_m.stbhstus,g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt)     
    WHERE stbhent = g_enterprise AND stbhdocno = g_stbh_m.stbhdocno
 
    
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt312_master_referesh USING g_stbh_m.stbhdocno INTO g_stbh_m.stbhsite,g_stbh_m.stbhdocno, 
          g_stbh_m.stbhdocdt,g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005, 
          g_stbh_m.stbh006,g_stbh_m.stbh007,g_stbh_m.stbh008,g_stbh_m.stbh009,g_stbh_m.stbhunit,g_stbh_m.stbhstus, 
          g_stbh_m.stbhownid,g_stbh_m.stbhowndp,g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdt, 
          g_stbh_m.stbhmodid,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfdt,g_stbh_m.stbhsite_desc, 
          g_stbh_m.stbh002_desc,g_stbh_m.stbh004_desc,g_stbh_m.stbh005_desc,g_stbh_m.stbh008_desc,g_stbh_m.stbh009_desc, 
          g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp_desc,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp_desc, 
          g_stbh_m.stbhmodid_desc,g_stbh_m.stbhcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stbh_m.stbhsite,g_stbh_m.stbhsite_desc,g_stbh_m.stbhdocno,g_stbh_m.stbhdocdt, 
          g_stbh_m.stbh001,g_stbh_m.stbh002,g_stbh_m.stbh002_desc,g_stbh_m.stbh003,g_stbh_m.stbh004, 
          g_stbh_m.stbh004_desc,g_stbh_m.stbh005,g_stbh_m.stbh005_desc,g_stbh_m.stbh006,g_stbh_m.stbh007, 
          g_stbh_m.stbh008,g_stbh_m.stbh008_desc,g_stbh_m.stbh009,g_stbh_m.stbh009_desc,g_stbh_m.stbhunit, 
          g_stbh_m.stbhstus,g_stbh_m.stbhownid,g_stbh_m.stbhownid_desc,g_stbh_m.stbhowndp,g_stbh_m.stbhowndp_desc, 
          g_stbh_m.stbhcrtid,g_stbh_m.stbhcrtid_desc,g_stbh_m.stbhcrtdp,g_stbh_m.stbhcrtdp_desc,g_stbh_m.stbhcrtdt, 
          g_stbh_m.stbhmodid,g_stbh_m.stbhmodid_desc,g_stbh_m.stbhmoddt,g_stbh_m.stbhcnfid,g_stbh_m.stbhcnfid_desc, 
          g_stbh_m.stbhcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   CALL astt312_b_fill()
   #end add-point  
 
   CLOSE astt312_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt312_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt312.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt312_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stbi_d.getLength() THEN
         LET g_detail_idx = g_stbi_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbi_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbi_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt312_b_fill2(pi_idx)
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
   
   CALL astt312_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt312_fill_chk(ps_idx)
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
 
{<section id="astt312.status_show" >}
PRIVATE FUNCTION astt312_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt312.mask_functions" >}
&include "erp/ast/astt312_mask.4gl"
 
{</section>}
 
{<section id="astt312.signature" >}
   
 
{</section>}
 
{<section id="astt312.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt312_set_pk_array()
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
   LET g_pk_array[1].values = g_stbh_m.stbhdocno
   LET g_pk_array[1].column = 'stbhdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt312.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt312.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt312_msgcentre_notify(lc_state)
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
   CALL astt312_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stbh_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt312.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt312_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT stbhstus  INTO g_stbh_m.stbhstus
     FROM stbh_t
    WHERE stbhent = g_enterprise
      AND stbhdocno = g_stbh_m.stbhdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stbh_m.stbhstus
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
        LET g_errparam.extend = g_stbh_m.stbhdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt312_set_act_visible()
        CALL astt312_set_act_no_visible()
        CALL astt312_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt312.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 檢查供應商與合約編號是否對應
# Memo...........:
# Usage..........: CALL astt312_chk_stbh002()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2015/05/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_chk_stbh002()
DEFINE l_n       LIKE type_t.num5
   
   LET l_n = 0
   IF NOT cl_null(g_stbh_m.stbh001) THEN
      #检查供应商合约
      SELECT COUNT(*) INTO l_n
        FROM stan_t
       WHERE stanent = g_enterprise
         AND stan001 = g_stbh_m.stbh001
         AND stan005 = g_stbh_m.stbh002
      IF l_n < 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stbh_m.stbh002
         LET g_errparam.code   = "ast-00342"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   ELSE
      #帶出供应商合约
      SELECT COUNT(*) INTO l_n
        FROM stan_t
       WHERE stanent = g_enterprise
         AND stan005 = g_stbh_m.stbh002
         AND stanstus = 'Y'
      IF l_n = 1 THEN
         SELECT stan001 INTO g_stbh_m.stbh001
           FROM stan_t
          WHERE stanent = g_enterprise
            AND stan005 = g_stbh_m.stbh002
            AND stanstus = 'Y'
      END IF
   END IF
   #合約編號帶值
   CALL astt312_stbh001_get()
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 合約編號帶值
# Memo...........:
# Usage..........: CALL astt312_stbh001_get()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2015/05/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbh001_get()

   IF cl_null(g_stbh_m.stbh001) THEN 
      RETURN 
   END IF 
   #抓取合同對應的供應商編號/經營方式/結算方式/結算類別
   SELECT stan005,stan002,stan009,stan010
     INTO g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005
     FROM stan_t
    WHERE stanent = g_enterprise
      AND stan001 = g_stbh_m.stbh001
   DISPLAY BY NAME g_stbh_m.stbh002,g_stbh_m.stbh003,g_stbh_m.stbh004,g_stbh_m.stbh005
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbh_m.stbh002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbh_m.stbh002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbh_m.stbh002_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbh_m.stbh004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbh_m.stbh004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbh_m.stbh004_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbh_m.stbh005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001= '2060' AND oocql002 = ? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbh_m.stbh005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbh_m.stbh005_desc
END FUNCTION

################################################################################
# Descriptions...: 根据条码带出商品编号
# Memo...........:
# Usage..........: CALL astt312_stbi002_display()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/05/22 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi002_display()
   DEFINE r_success    LIKE type_t.num5 
   
   SELECT DISTINCT imay001 
     INTO g_stbi_d[l_ac].stbi001
     FROM imay_t
    WHERE imayent = g_enterprise
      AND imay003 = g_stbi_d[l_ac].stbi002
      
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbi_d[l_ac].stbi001
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbi_d[l_ac].stbi001_desc = '', g_rtn_fields[1] , ''
   LET g_stbi_d[l_ac].stbi001_desc_1 = '', g_rtn_fields[2] , ''
   DISPLAY BY NAME g_stbi_d[l_ac].stbi001_desc,g_stbi_d[l_ac].stbi001_desc_1
END FUNCTION

################################################################################
# Descriptions...: 根据商品编号带出相关资料
# Memo...........:
# Usage..........: CALL astt312_stbi001_get()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/05/22 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi001_get()
   
   IF cl_null(g_stbi_d[l_ac].stbi001) THEN 
      RETURN 
   END IF 
   #抓取品类，品类名称，特征码
   SELECT imaa009,rtaxl003,imaa005
     INTO g_stbi_d[l_ac].imaa009,g_stbi_d[l_ac].imaa009_desc,g_stbi_d[l_ac].stbi003
     FROM imaa_t LEFT JOIN rtaxl_t ON imaaent = rtaxlent AND rtaxl001 = imaa009 AND rtaxl002 = g_lang
    WHERE imaaent = g_enterprise
      AND imaa001 = g_stbi_d[l_ac].stbi001  
      
   #抓取门店商品清单中进项税目/计价单位/促销进价/销项税目/销售计价单位/促销售价/门店会员价1/门店会员价2/门店会员价3
   SELECT rtdx034,imaf144,rtdx032,rtdx016,imaf113,rtdx021,rtdx017,rtdx018,rtdx019
     INTO g_stbi_d[l_ac].stbi005,g_stbi_d[l_ac].stbi004,g_stbi_d[l_ac].stbi008,
          g_stbi_d[l_ac].stbi010,g_stbi_d[l_ac].stbi009,g_stbi_d[l_ac].stbi013,
          g_stbi_d[l_ac].stbi014,g_stbi_d[l_ac].stbi015,g_stbi_d[l_ac].stbi016
     FROM rtdx_t,imaf_t
    WHERE rtdxent = g_enterprise
      AND rtdxent = imafent
      AND rtdx001 = imaf001
      AND rtdxsite = imafsite
      AND rtdx001 = g_stbi_d[l_ac].stbi001  
      AND rtdxsite = g_stbi_d[l_ac].stbisite

END FUNCTION

################################################################################
# Descriptions...: 商品检查是否存在商品清单中
# Memo...........:
# Usage..........: CALL astt312_stbi001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi001_chk()
DEFINE r_success    LIKE type_t.num5
DEFINE l_rtdxstus   LIKE rtdx_t.rtdxstus

   LET g_errno = ''
   SELECT rtdxstus INTO l_rtdxstus
     FROM rtdx_t
    WHERE rtdxent = g_enterprise
      AND rtdxsite = g_stbh_m.stbhsite
      AND rtdx001 = g_stbi_d[l_ac].stbi001
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00264'
      WHEN l_rtdxstus <> 'Y'   LET g_errno = 'art-00265'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 商品带条码+判断
# Memo...........:
# Usage..........: CALL astt312_stbi001_display()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi001_display()
DEFINE l_imaystus  LIKE imay_t.imaystus

   IF NOT cl_null(g_stbi_d[l_ac].stbi002) THEN 
      SELECT imaystus INTO l_imaystus
        FROM imay_t
       WHERE imayent = g_enterprise
         AND imay001 = g_stbi_d[l_ac].stbi001
         AND imay003 = g_stbi_d[l_ac].stbi002
      CASE 
        WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00295'
        WHEN l_imaystus <> 'Y'   LET g_errno = 'art-00047'
        OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE
      IF NOT cl_null(g_errno) THEN 
         LET g_errno = ''
         LET g_stbi_d[l_ac].stbi002 = ''
      END IF 
   END IF 
   IF cl_null(g_stbi_d[l_ac].stbi002) THEN 
      SELECT DISTINCT imay003 
        INTO g_stbi_d[l_ac].stbi002
        FROM imay_t
       WHERE imayent = g_enterprise
         AND imay001 = g_stbi_d[l_ac].stbi001
         AND imay006 = 'Y'      
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 进价与售价的开启关闭
# Memo...........:
# Usage..........: CALL astt312_stbi006_set(p_type,p_sdate,p_edate)
# Input parameter: p_type         1.進價   2.售價
#                : p_sdate        起始日期
#                : p_edate        截止日期
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi_set(p_type,p_sdate,p_edate)
   DEFINE p_sdate   LIKE stbi_t.stbi006
   DEFINE p_edate   LIKE stbi_t.stbi007
   DEFINE p_type    LIKE type_t.chr1
   
   IF p_type = '1' THEN 
      #日期都为空关闭进价栏位
      IF cl_null(p_sdate) AND cl_null(p_edate) THEN 
         LET g_stbi_d[l_ac].stbi008 = ''
         CALL cl_set_comp_entry("stbi008",FALSE) 
      ELSE
         CALL cl_set_comp_entry("stbi008",TRUE)
      END IF
   ELSE
      #日期都为空关闭进价栏位
      IF cl_null(p_sdate) AND cl_null(p_edate) THEN 
         LET g_stbi_d[l_ac].stbi013 = ''
         LET g_stbi_d[l_ac].stbi009 = ''
         LET g_stbi_d[l_ac].stbi014 = ''
         LET g_stbi_d[l_ac].stbi015 = ''
         LET g_stbi_d[l_ac].stbi016 = ''
         LET g_stbi_d[l_ac].stbi017 = ''
         CALL cl_set_comp_entry("stbi013,stbi014,stbi015,stbi016,stbi017",FALSE) 
      ELSE
         CALL cl_set_comp_entry("stbi013,stbi014,stbi015,stbi016,stbi017",TRUE)
      END IF
   END IF 
   
END FUNCTION

################################################################################
# Descriptions...: 起始日期和截止日期判断
# Memo...........:
# Usage..........: CALL astt312_stbidate_chk(p_sdate,p_edate)
# Input parameter: p_sdate        起始日期
#                : p_edate        截止日期
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbidate_chk(p_sdate,p_edate)
   DEFINE p_sdate   LIKE stbi_t.stbi006
   DEFINE p_edate   LIKE stbi_t.stbi007
   
   LET g_errno = ''
   IF cl_null(p_sdate) OR cl_null(p_edate) THEN 
      RETURN 
   END IF 
   IF p_sdate > p_edate THEN 
      LET g_errno = 'ast-00063'
   END IF 
   
END FUNCTION

################################################################################
# Descriptions...: 栏位开启关闭
# Memo...........:
# Usage..........: CALL astt312_comp_set()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_comp_set()

   #货架部分
   IF cl_null(g_stbi_d[l_ac].stbi018) THEN 
      LET g_stbi_d[l_ac].stbi019 = ''
      LET g_stbi_d[l_ac].stbi020 = ''
      LET g_stbi_d[l_ac].stbi021 = ''
      LET g_stbi_d[l_ac].stbi021_desc = ''
      LET g_stbi_d[l_ac].stbi022 = ''
      LET g_stbi_d[l_ac].stbi023 = ''
      LET g_stbi_d[l_ac].stbi024 = ''
      LET g_stbi_d[l_ac].stbi030 = ''
      CALL cl_set_comp_entry("stbi019,stbi020,stbi021,stbi022,stbi023,stbi030",FALSE)
   ELSE
      CALL cl_set_comp_entry("stbi019,stbi020,stbi021,stbi022,stbi023,stbi030",TRUE)
   END IF 
   #补差部分
   IF cl_null(g_stbi_d[l_ac].stbi025) THEN 
      LET g_stbi_d[l_ac].stbi026 = ''
      LET g_stbi_d[l_ac].stbi027 = ''
      LET g_stbi_d[l_ac].stbi028 = ''
      LET g_stbi_d[l_ac].stbi029 = ''
      LET g_stbi_d[l_ac].stbi031 = ''
      CALL cl_set_comp_entry("stbi026,stbi027,stbi028,stbi031",FALSE)
   ELSE
      CALL cl_set_comp_entry("stbi026,stbi027,stbi028,stbi031",TRUE)
      #151013-00001#43--dongsz add--str
      #库存补差，补差日期默认当前日期，不可修改
      IF g_stbi_d[l_ac].stbi025 = '2' THEN
         CALL cl_set_comp_entry("stbi028",FALSE)
      END IF
      #151013-00001#43--dongsz add--end
   END IF
   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt312_stbi001_chk_1()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/06/04 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi001_chk_1()
DEFINE l_star001   LIKE star_t.star001
DEFINE l_stas018   LIKE stas_t.stas018
DEFINE l_stas019   LIKE stas_t.stas019
DEFINE l_n         LIKE type_t.num5
DEFINE l_stas025   LIKE stas_t.stas025

   IF cl_null(g_stbi_d[l_ac].stbisite) OR cl_null(g_stbi_d[l_ac].stbi001) THEN 
      RETURN TRUE 
   END IF 
   #根据合同编号+门店抓取采购协议
   SELECT star001 INTO l_star001
     FROM star_t
    WHERE starent = g_enterprise
      AND starsite = g_stbi_d[l_ac].stbisite
      AND star004 = g_stbh_m.stbh001
   IF cl_null(l_star001) THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_stbi_d[l_ac].stbisite
      LET g_errparam.code   = "art-00594"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF
   LET l_n = 0
   #检查商品是否存在采购协议
   SELECT COUNT(*) INTO l_n
     FROM stas_t
    WHERE stasent = g_enterprise
      AND stas003 = g_stbi_d[l_ac].stbi001
      AND stas001 = l_star001
   IF l_n = 0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_stbi_d[l_ac].stbi001
      LET g_errparam.code   = "art-00595"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF 
   #检查商品生效日期是否在单据日期范围内
   SELECT stas018,stas019,stas025
     INTO l_stas018,l_stas019,l_stas025
     FROM stas_t
    WHERE stasent = g_enterprise
      AND stas001 = l_star001
      AND stas003 = g_stbi_d[l_ac].stbi001
   IF l_stas018 > g_stbh_m.stbhdocdt OR g_stbh_m.stbhdocdt > l_stas019 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_stbi_d[l_ac].stbi001
      LET g_errparam.code   = "art-00596"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF 
   LET g_stbi_d[l_ac].stbi032 = l_stas025
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 进价与售价的开启关闭
# Memo...........:
# Usage..........: CALL astt312_stbi_default(p_type,p_sdate,p_edate)
# Input parameter: p_type         1.進價   2.售價
#                : p_sdate        起始日期
#                : p_edate        截止日期
# Return code....: 无
# Date & Author..: 2015/05/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt312_stbi_default(p_type,p_sdate,p_edate)
   DEFINE p_sdate   LIKE stbi_t.stbi006
   DEFINE p_edate   LIKE stbi_t.stbi007
   DEFINE p_type    LIKE type_t.chr1
   
   IF p_type = '1' THEN 
      #日期都为空关闭进价栏位
      IF cl_null(p_sdate) AND cl_null(p_edate) THEN 
         LET g_stbi_d[l_ac].stbi008 = ''
      ELSE
         #抓取门店商品清单促销进价
         SELECT rtdx035,imaf144,rtdx032
           INTO g_stbi_d[l_ac].stbi005,g_stbi_d[l_ac].stbi004,g_stbi_d[l_ac].stbi008
           FROM rtdx_t,imaf_t
          WHERE rtdxent = g_enterprise
            AND rtdxent = imafent
            AND rtdx001 = imaf001
            AND rtdxsite = imafsite
            AND rtdx001 = g_stbi_d[l_ac].stbi001  
            AND rtdxsite = g_stbi_d[l_ac].stbisite
      END IF
   ELSE
      #日期都为空关闭进价栏位
      IF cl_null(p_sdate) AND cl_null(p_edate) THEN 
         LET g_stbi_d[l_ac].stbi013 = ''
         LET g_stbi_d[l_ac].stbi014 = ''
         LET g_stbi_d[l_ac].stbi015 = ''
         LET g_stbi_d[l_ac].stbi016 = ''
         LET g_stbi_d[l_ac].stbi017 = ''
      ELSE
         #抓取门店商品清单中销售计价单位/促销售价/门店会员价1/门店会员价2/门店会员价3
         SELECT rtdx014,imaf113,rtdx021,rtdx017,rtdx018,rtdx019
           INTO g_stbi_d[l_ac].stbi010,g_stbi_d[l_ac].stbi009,g_stbi_d[l_ac].stbi013,
                g_stbi_d[l_ac].stbi014,g_stbi_d[l_ac].stbi015,g_stbi_d[l_ac].stbi016
           FROM rtdx_t,imaf_t
          WHERE rtdxent = g_enterprise
            AND rtdxent = imafent
            AND rtdx001 = imaf001
            AND rtdxsite = imafsite
            AND rtdx001 = g_stbi_d[l_ac].stbi001  
            AND rtdxsite = g_stbi_d[l_ac].stbisite
         IF g_stbi_d[l_ac].stbi014 > g_stbi_d[l_ac].stbi013 THEN 
            LET g_stbi_d[l_ac].stbi014 = g_stbi_d[l_ac].stbi013
         END IF 
         IF g_stbi_d[l_ac].stbi015 > g_stbi_d[l_ac].stbi013 THEN 
            LET g_stbi_d[l_ac].stbi015 = g_stbi_d[l_ac].stbi013
         END IF 
         IF g_stbi_d[l_ac].stbi016 > g_stbi_d[l_ac].stbi013 THEN 
            LET g_stbi_d[l_ac].stbi016 = g_stbi_d[l_ac].stbi013
         END IF 
         CALL s_astt313_get_stao029(g_stbi_d[l_ac].stbisite,g_stbh_m.stbh002,g_stbi_d[l_ac].stbi001,g_stbh_m.stbhdocdt) RETURNING g_stbi_d[l_ac].stbi017
      END IF
   END IF 
END FUNCTION

 
{</section>}
 
