#該程式未解開Section, 採用最新樣板產出!
{<section id="astm252.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2016-12-09 10:07:34), PR版次:0006(2016-12-09 10:05:46)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000028
#+ Filename...: astm252
#+ Description: 費用標準設定維護作業
#+ Creator....: 04226(2016-03-24 17:56:30)
#+ Modifier...: 08172 -SD/PR- 08172
 
{</section>}
 
{<section id="astm252.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#Memos
#161207-00059#1 2016/12/09 by 08172  分量设定单身费用比例显示**
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
PRIVATE type type_g_sthi_m        RECORD
       sthisite LIKE sthi_t.sthisite, 
   sthisite_desc LIKE type_t.chr80, 
   sthi002 LIKE sthi_t.sthi002, 
   sthi003 LIKE sthi_t.sthi003, 
   sthil003 LIKE sthil_t.sthil003, 
   sthi004 LIKE sthi_t.sthi004, 
   sthi004_desc LIKE type_t.chr80, 
   sthi005 LIKE sthi_t.sthi005, 
   sthi006 LIKE sthi_t.sthi006, 
   sthi007 LIKE sthi_t.sthi007, 
   sthi008 LIKE sthi_t.sthi008, 
   sthi008_desc LIKE type_t.chr80, 
   sthi009 LIKE sthi_t.sthi009, 
   sthi009_desc LIKE type_t.chr80, 
   sthi001 LIKE sthi_t.sthi001, 
   sthiunit LIKE sthi_t.sthiunit, 
   sthistus LIKE sthi_t.sthistus, 
   sthiownid LIKE sthi_t.sthiownid, 
   sthiownid_desc LIKE type_t.chr80, 
   sthiowndp LIKE sthi_t.sthiowndp, 
   sthiowndp_desc LIKE type_t.chr80, 
   sthicrtid LIKE sthi_t.sthicrtid, 
   sthicrtid_desc LIKE type_t.chr80, 
   sthicrtdp LIKE sthi_t.sthicrtdp, 
   sthicrtdp_desc LIKE type_t.chr80, 
   sthicrtdt LIKE sthi_t.sthicrtdt, 
   sthimodid LIKE sthi_t.sthimodid, 
   sthimodid_desc LIKE type_t.chr80, 
   sthimoddt LIKE sthi_t.sthimoddt, 
   sthicnfid LIKE sthi_t.sthicnfid, 
   sthicnfid_desc LIKE type_t.chr80, 
   sthicnfdt LIKE sthi_t.sthicnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sthj_d        RECORD
       sthjseq LIKE sthj_t.sthjseq, 
   sthj002 LIKE sthj_t.sthj002, 
   sthj002_desc LIKE type_t.chr500, 
   sthj003 LIKE sthj_t.sthj003, 
   sthj003_desc LIKE type_t.chr500, 
   sthj004 LIKE sthj_t.sthj004, 
   sthj004_desc LIKE type_t.chr500, 
   sthj005 LIKE sthj_t.sthj005, 
   sthj005_desc LIKE type_t.chr500, 
   sthj006 LIKE sthj_t.sthj006, 
   sthj006_desc LIKE type_t.chr500, 
   sthj007 LIKE sthj_t.sthj007, 
   sthj007_desc LIKE type_t.chr500, 
   sthj008 LIKE sthj_t.sthj008, 
   sthj009 LIKE sthj_t.sthj009, 
   sthj010 LIKE sthj_t.sthj010, 
   sthj011 LIKE sthj_t.sthj011, 
   sthjsite LIKE sthj_t.sthjsite, 
   sthjunit LIKE sthj_t.sthjunit
       END RECORD
PRIVATE TYPE type_g_sthj2_d RECORD
       sthkseq1 LIKE sthk_t.sthkseq1, 
   sthk002 LIKE sthk_t.sthk002, 
   sthk003 LIKE sthk_t.sthk003, 
   sthk004 LIKE sthk_t.sthk004, 
   sthk005 LIKE sthk_t.sthk005, 
   sthk006 LIKE sthk_t.sthk006, 
   sthk007 LIKE sthk_t.sthk007, 
   sthk008 LIKE sthk_t.sthk008, 
   sthk009 LIKE sthk_t.sthk009, 
   sthk010 LIKE sthk_t.sthk010, 
   sthksite LIKE sthk_t.sthksite, 
   sthkunit LIKE sthk_t.sthkunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sthisite LIKE sthi_t.sthisite,
   b_sthisite_desc LIKE type_t.chr80,
      b_sthi002 LIKE sthi_t.sthi002,
   b_sthi002_desc LIKE type_t.chr80,
      b_sthi004 LIKE sthi_t.sthi004,
   b_sthi004_desc LIKE type_t.chr80,
      b_sthi007 LIKE sthi_t.sthi007,
      b_sthi008 LIKE sthi_t.sthi008,
   b_sthi008_desc LIKE type_t.chr80,
      b_sthi009 LIKE sthi_t.sthi009,
   b_sthi009_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_sthj3_d RECORD
        sthlseq2            LIKE sthl_t.sthlseq2, 
        sthl002             LIKE sthl_t.sthl002, 
        sthl003             LIKE sthl_t.sthl003, 
        sthl004             LIKE sthl_t.sthl004, 
        sthl005             LIKE sthl_t.sthl005,
        sthlsite            LIKE sthl_t.sthlsite, 
        sthlunit            LIKE sthl_t.sthlunit
                            END RECORD
DEFINE g_sthj3_d          DYNAMIC ARRAY OF type_g_sthj3_d
DEFINE g_sthj3_d_t        type_g_sthj3_d
DEFINE g_sthj3_d_o        type_g_sthj3_d
DEFINE g_sthj3_d_mask_o   DYNAMIC ARRAY OF type_g_sthj3_d #轉換遮罩前資料
DEFINE g_sthj3_d_mask_n   DYNAMIC ARRAY OF type_g_sthj3_d #轉換遮罩後資料
DEFINE g_wc2_table3       STRING
DEFINE g_detail_idx3      LIKE type_t.num10
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sthi_m          type_g_sthi_m
DEFINE g_sthi_m_t        type_g_sthi_m
DEFINE g_sthi_m_o        type_g_sthi_m
DEFINE g_sthi_m_mask_o   type_g_sthi_m #轉換遮罩前資料
DEFINE g_sthi_m_mask_n   type_g_sthi_m #轉換遮罩後資料
 
   DEFINE g_sthi002_t LIKE sthi_t.sthi002
 
 
DEFINE g_sthj_d          DYNAMIC ARRAY OF type_g_sthj_d
DEFINE g_sthj_d_t        type_g_sthj_d
DEFINE g_sthj_d_o        type_g_sthj_d
DEFINE g_sthj_d_mask_o   DYNAMIC ARRAY OF type_g_sthj_d #轉換遮罩前資料
DEFINE g_sthj_d_mask_n   DYNAMIC ARRAY OF type_g_sthj_d #轉換遮罩後資料
DEFINE g_sthj2_d          DYNAMIC ARRAY OF type_g_sthj2_d
DEFINE g_sthj2_d_t        type_g_sthj2_d
DEFINE g_sthj2_d_o        type_g_sthj2_d
DEFINE g_sthj2_d_mask_o   DYNAMIC ARRAY OF type_g_sthj2_d #轉換遮罩前資料
DEFINE g_sthj2_d_mask_n   DYNAMIC ARRAY OF type_g_sthj2_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
DEFINE g_master_multi_table_t    RECORD
      sthil001 LIKE sthil_t.sthil001,
      sthil003 LIKE sthil_t.sthil003
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
 
{<section id="astm252.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success     LIKE type_t.num5
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
   LET g_forupd_sql = " SELECT sthisite,'',sthi002,sthi003,'',sthi004,'',sthi005,sthi006,sthi007,sthi008, 
       '',sthi009,'',sthi001,sthiunit,sthistus,sthiownid,'',sthiowndp,'',sthicrtid,'',sthicrtdp,'',sthicrtdt, 
       sthimodid,'',sthimoddt,sthicnfid,'',sthicnfdt", 
                      " FROM sthi_t",
                      " WHERE sthient= ? AND sthi002=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm252_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sthisite,t0.sthi002,t0.sthi003,t0.sthi004,t0.sthi005,t0.sthi006, 
       t0.sthi007,t0.sthi008,t0.sthi009,t0.sthi001,t0.sthiunit,t0.sthistus,t0.sthiownid,t0.sthiowndp, 
       t0.sthicrtid,t0.sthicrtdp,t0.sthicrtdt,t0.sthimodid,t0.sthimoddt,t0.sthicnfid,t0.sthicnfdt,t1.ooefl003 , 
       t2.stael003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 ,t8.ooefl003 ,t9.ooag011 , 
       t10.ooag011",
               " FROM sthi_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=t0.sthi004 AND t2.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.sthi008  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.sthi009 AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.sthiownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.sthiowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.sthicrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.sthicrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.sthimodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.sthicnfid  ",
 
               " WHERE t0.sthient = " ||g_enterprise|| " AND t0.sthi002 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   LET g_sql = g_sql," AND sthi001 = '",g_argv[01],"'"
   #end add-point
   PREPARE astm252_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astm252 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astm252_init()   
 
      #進入選單 Menu (="N")
      CALL astm252_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astm252
      
   END IF 
   
   CLOSE astm252_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astm252.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astm252_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success     LIKE type_t.num5
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
      CALL cl_set_combo_scc_part('sthistus','13','N,Y,E,X')
 
      CALL cl_set_combo_scc('sthi001','6908') 
   CALL cl_set_combo_scc('sthj008','6920') 
   CALL cl_set_combo_scc('sthj010','6909') 
   CALL cl_set_combo_scc('sthj011','6904') 
   CALL cl_set_combo_scc('sthk007','6010') 
   CALL cl_set_combo_scc('sthk010','6011') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('sthk010','6011','1,2,3')    #160229-00001#27 20160512 add by beckxie
   LET g_errshow = 1
   LET l_success = ''
   CALL s_aooi500_create_temp() RETURNING l_success
   
   CALL astm252_comp_visible()
   CALL astm252_comp_no_visible('1')
   CALL astm252_set_act_visible()
   CALL astm252_set_act_no_visible()
   #add by geza 20160623 160604-00009#104(S)
   CALL s_asti800_set_comp_format("sthk005",g_site,'1')
   CALL s_asti800_set_comp_format("sthk008",g_site,'1')
   CALL s_asti800_set_comp_format("sthl004",g_site,'1')   
   #add by geza 20160623 160604-00009#104(E)
   #end add-point
   
   #初始化搜尋條件
   CALL astm252_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astm252.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astm252_ui_dialog()
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
            CALL astm252_insert()
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
         INITIALIZE g_sthi_m.* TO NULL
         CALL g_sthj_d.clear()
         CALL g_sthj2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astm252_init()
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
               
               CALL astm252_fetch('') # reload data
               LET l_ac = 1
               CALL astm252_ui_detailshow() #Setting the current row 
         
               CALL astm252_idx_chk()
               #NEXT FIELD sthjseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sthj_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm252_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               CALL astm252_b_fill2('2')
 
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
               CALL astm252_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
         #第二階單身段落
         DISPLAY ARRAY g_sthj2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm252_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx2 = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在下階單身則控制筆數位置
               IF g_loc = 'd' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'd'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astm252_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         #第三階單身段落
         DISPLAY ARRAY g_sthj3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm252_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx2 = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("'3',",l_ac)
               
            BEFORE DISPLAY
               #如果一直都在下階單身則控制筆數位置
               IF g_loc = 'd' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
               END IF
               LET g_loc = 'd'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 3
               #顯示單身筆數
               CALL astm252_idx_chk()         
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astm252_browser_fill("")
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
               CALL astm252_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astm252_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astm252_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            CALL astm252_set_act_visible()
            CALL astm252_set_act_no_visible()
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astm252_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astm252_set_act_visible()   
            CALL astm252_set_act_no_visible()
            IF NOT (g_sthi_m.sthi002 IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sthient = " ||g_enterprise|| " AND",
                                  " sthi002 = '", g_sthi_m.sthi002, "' "
 
               #填到對應位置
               CALL astm252_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "sthi_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthj_t" 
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
               CALL astm252_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "sthi_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthj_t" 
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
                  CALL astm252_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astm252_fetch("F")
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
               CALL astm252_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astm252_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm252_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astm252_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm252_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astm252_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm252_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astm252_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm252_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astm252_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm252_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_sthj_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_sthj2_d)
                  LET g_export_id[2]   = "s_detail2"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  LET g_export_node[3] = base.typeInfo.create(g_sthj3_d)
                  LET g_export_id[3]   = "s_detail3"
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
               NEXT FIELD sthjseq
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
               CALL astm252_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astm252_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astm252_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astm252_insert()
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
               CALL astm252_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astm252_query()
               #add-point:ON ACTION query name="menu.query"
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astm252_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astm252_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astm252_set_pk_array()
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
 
{<section id="astm252.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astm252_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'sthisite') RETURNING l_where
   #LET g_wc = g_wc," AND ",l_where   #160604-00009#102 20160623 mark by beckxie
   LET g_wc = g_wc," AND ",g_wc2," AND ",l_where   #160604-00009#102 20160623 add by beckxie
   LET l_wc  = g_wc.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sthi002 ",
                      " FROM sthi_t ",
                      " ",
                      " LEFT JOIN sthj_t ON sthjent = sthient AND sthi002 = sthj001 ", "  ",
                      #add-point:browser_fill段sql(sthj_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
                      " LEFT JOIN sthk_t ON sthkent = sthient AND sthj001 = sthk001 AND sthjseq = sthkseq", "  ",
                      #add-point:browser_fill段sql(sthk_t1) name="browser_fill.cnt.join.sthk_t1"
                      " LEFT JOIN sthl_t ON sthlent = sthkent AND sthk001 = sthl001 AND sthkseq = sthlseq AND sthkseq1 = sthlseq1",
                      #end add-point
 
 
                      " LEFT JOIN sthil_t ON sthilent = "||g_enterprise||" AND sthi002 = sthil001 AND sthil002 = '",g_dlang,"' ", 
                      " ", 
 
                      " ",
 
 
                      " WHERE sthient = " ||g_enterprise|| " AND sthjent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sthi_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sthi002 ",
                      " FROM sthi_t ", 
                      "  ",
                      "  LEFT JOIN sthil_t ON sthilent = "||g_enterprise||" AND sthi002 = sthil001 AND sthil002 = '",g_dlang,"' ",
                      " WHERE sthient = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sthi_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   LET l_sub_sql = l_sub_sql," AND sthi001 = '",g_argv[01],"'"
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
      INITIALIZE g_sthi_m.* TO NULL
      CALL g_sthj_d.clear()        
      CALL g_sthj2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      CALL g_sthj3_d.clear() 
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sthisite,t0.sthi002,t0.sthi004,t0.sthi007,t0.sthi008,t0.sthi009 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthistus,t0.sthisite,t0.sthi002,t0.sthi004,t0.sthi007,t0.sthi008, 
          t0.sthi009,t1.ooefl003 ,t2.sthil003 ,t3.stael003 ,t4.ooag011 ,t5.ooefl003 ",
                  " FROM sthi_t t0",
                  "  ",
                  "  LEFT JOIN sthj_t ON sthjent = sthient AND sthi002 = sthj001 ", "  ", 
                  #add-point:browser_fill段sql(sthj_t1) name="browser_fill.join.sthj_t1"
                  #" LEFT JOIN sthl_t ON sthlent = sthkent AND sthk001 = sthl001 AND sthkseq = sthlseq AND sthkseq1 = sthlseq1",   #160604-00009#102 20160623 mark by beckxie
                  #end add-point
 
                  "  LEFT JOIN sthk_t ON sthkent = sthient AND sthj001 = sthk001 AND sthjseq = sthkseq", "  ", 
                  #add-point:browser_fill段sql(sthk_t1) name="browser_fill.join.sthk_t1"
                  " LEFT JOIN sthl_t ON sthlent = sthkent AND sthk001 = sthl001 AND sthkseq = sthlseq AND sthkseq1 = sthlseq1",
                  #end add-point
 
 
                  " ", 
 
                  " ",
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN sthil_t t2 ON t2.sthilent="||g_enterprise||" AND t2.sthil001=t0.sthi002 AND t2.sthil002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t3 ON t3.staelent="||g_enterprise||" AND t3.stael001=t0.sthi004 AND t3.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.sthi008  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.sthi009 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sthient = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sthi_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthistus,t0.sthisite,t0.sthi002,t0.sthi004,t0.sthi007,t0.sthi008, 
          t0.sthi009,t1.ooefl003 ,t2.sthil003 ,t3.stael003 ,t4.ooag011 ,t5.ooefl003 ",
                  " FROM sthi_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthisite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN sthil_t t2 ON t2.sthilent="||g_enterprise||" AND t2.sthil001=t0.sthi002 AND t2.sthil002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t3 ON t3.staelent="||g_enterprise||" AND t3.stael001=t0.sthi004 AND t3.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.sthi008  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.sthi009 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sthient = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sthi_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql," AND sthi001 = '",g_argv[01],"'"
   #end add-point
   LET g_sql = g_sql, " ORDER BY sthi002 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sthi_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sthisite,g_browser[g_cnt].b_sthi002, 
          g_browser[g_cnt].b_sthi004,g_browser[g_cnt].b_sthi007,g_browser[g_cnt].b_sthi008,g_browser[g_cnt].b_sthi009, 
          g_browser[g_cnt].b_sthisite_desc,g_browser[g_cnt].b_sthi002_desc,g_browser[g_cnt].b_sthi004_desc, 
          g_browser[g_cnt].b_sthi008_desc,g_browser[g_cnt].b_sthi009_desc
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
         CALL astm252_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "E"
            LET g_browser[g_cnt].b_statepic = "stus/16/ended.png"
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
   
   IF cl_null(g_browser[g_cnt].b_sthi002) THEN
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
 
{<section id="astm252.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astm252_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sthi_m.sthi002 = g_browser[g_current_idx].b_sthi002   
 
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
   CALL astm252_sthi_t_mask()
   CALL astm252_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astm252.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astm252_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)  
   END IF
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astm252_ui_browser_refresh()
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
      IF g_browser[l_i].b_sthi002 = g_sthi_m.sthi002 
 
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
 
{<section id="astm252.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astm252_construct()
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
   INITIALIZE g_sthi_m.* TO NULL
   CALL g_sthj_d.clear()        
   CALL g_sthj2_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   CALL g_sthj3_d.clear() 
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sthisite,sthi002,sthi003,sthil003,sthi004,sthi005,sthi006,sthi007,sthi008, 
          sthi009,sthi001,sthiunit,sthistus,sthiownid,sthiowndp,sthicrtid,sthicrtdp,sthicrtdt,sthimodid, 
          sthimoddt,sthicnfid,sthicnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sthicrtdt>>----
         AFTER FIELD sthicrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sthimoddt>>----
         AFTER FIELD sthimoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sthicnfdt>>----
         AFTER FIELD sthicnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sthipstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sthisite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthisite
            #add-point:ON ACTION controlp INFIELD sthisite name="construct.c.sthisite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthisite',g_sthi_m.sthisite,'c')
            CALL q_ooef001_24()                      #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthisite   #顯示到畫面上
            NEXT FIELD sthisite                      #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthisite
            #add-point:BEFORE FIELD sthisite name="construct.b.sthisite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthisite
            
            #add-point:AFTER FIELD sthisite name="construct.a.sthisite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi002
            #add-point:ON ACTION controlp INFIELD sthi002 name="construct.c.sthi002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " sthi001 = '",g_argv[01],"' and sthisite='",g_site,"'"
            CALL q_sthi002()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthi002    #顯示到畫面上
            NEXT FIELD sthi002                       #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi002
            #add-point:BEFORE FIELD sthi002 name="construct.b.sthi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi002
            
            #add-point:AFTER FIELD sthi002 name="construct.a.sthi002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi003
            #add-point:BEFORE FIELD sthi003 name="construct.b.sthi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi003
            
            #add-point:AFTER FIELD sthi003 name="construct.a.sthi003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi003
            #add-point:ON ACTION controlp INFIELD sthi003 name="construct.c.sthi003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthil003
            #add-point:BEFORE FIELD sthil003 name="construct.b.sthil003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthil003
            
            #add-point:AFTER FIELD sthil003 name="construct.a.sthil003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthil003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthil003
            #add-point:ON ACTION controlp INFIELD sthil003 name="construct.c.sthil003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthi004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi004
            #add-point:ON ACTION controlp INFIELD sthi004 name="construct.c.sthi004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001_4()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthi004  #顯示到畫面上
            NEXT FIELD sthi004                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi004
            #add-point:BEFORE FIELD sthi004 name="construct.b.sthi004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi004
            
            #add-point:AFTER FIELD sthi004 name="construct.a.sthi004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi005
            #add-point:BEFORE FIELD sthi005 name="construct.b.sthi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi005
            
            #add-point:AFTER FIELD sthi005 name="construct.a.sthi005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi005
            #add-point:ON ACTION controlp INFIELD sthi005 name="construct.c.sthi005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi006
            #add-point:BEFORE FIELD sthi006 name="construct.b.sthi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi006
            
            #add-point:AFTER FIELD sthi006 name="construct.a.sthi006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi006
            #add-point:ON ACTION controlp INFIELD sthi006 name="construct.c.sthi006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi007
            #add-point:BEFORE FIELD sthi007 name="construct.b.sthi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi007
            
            #add-point:AFTER FIELD sthi007 name="construct.a.sthi007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi007
            #add-point:ON ACTION controlp INFIELD sthi007 name="construct.c.sthi007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthi008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi008
            #add-point:ON ACTION controlp INFIELD sthi008 name="construct.c.sthi008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthi008  #顯示到畫面上
            NEXT FIELD sthi008                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi008
            #add-point:BEFORE FIELD sthi008 name="construct.b.sthi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi008
            
            #add-point:AFTER FIELD sthi008 name="construct.a.sthi008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi009
            #add-point:ON ACTION controlp INFIELD sthi009 name="construct.c.sthi009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthi008  #顯示到畫面上
            NEXT FIELD sthi008                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi009
            #add-point:BEFORE FIELD sthi009 name="construct.b.sthi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi009
            
            #add-point:AFTER FIELD sthi009 name="construct.a.sthi009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi001
            #add-point:BEFORE FIELD sthi001 name="construct.b.sthi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi001
            
            #add-point:AFTER FIELD sthi001 name="construct.a.sthi001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthi001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi001
            #add-point:ON ACTION controlp INFIELD sthi001 name="construct.c.sthi001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthiunit
            #add-point:BEFORE FIELD sthiunit name="construct.b.sthiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthiunit
            
            #add-point:AFTER FIELD sthiunit name="construct.a.sthiunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthiunit
            #add-point:ON ACTION controlp INFIELD sthiunit name="construct.c.sthiunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthistus
            #add-point:BEFORE FIELD sthistus name="construct.b.sthistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthistus
            
            #add-point:AFTER FIELD sthistus name="construct.a.sthistus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthistus
            #add-point:ON ACTION controlp INFIELD sthistus name="construct.c.sthistus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthiownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthiownid
            #add-point:ON ACTION controlp INFIELD sthiownid name="construct.c.sthiownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthiownid  #顯示到畫面上
            NEXT FIELD sthiownid                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthiownid
            #add-point:BEFORE FIELD sthiownid name="construct.b.sthiownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthiownid
            
            #add-point:AFTER FIELD sthiownid name="construct.a.sthiownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthiowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthiowndp
            #add-point:ON ACTION controlp INFIELD sthiowndp name="construct.c.sthiowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthiowndp  #顯示到畫面上
            NEXT FIELD sthiowndp                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthiowndp
            #add-point:BEFORE FIELD sthiowndp name="construct.b.sthiowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthiowndp
            
            #add-point:AFTER FIELD sthiowndp name="construct.a.sthiowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthicrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthicrtid
            #add-point:ON ACTION controlp INFIELD sthicrtid name="construct.c.sthicrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthicrtid  #顯示到畫面上
            NEXT FIELD sthicrtid                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthicrtid
            #add-point:BEFORE FIELD sthicrtid name="construct.b.sthicrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthicrtid
            
            #add-point:AFTER FIELD sthicrtid name="construct.a.sthicrtid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthicrtdp
            #add-point:BEFORE FIELD sthicrtdp name="construct.b.sthicrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthicrtdp
            
            #add-point:AFTER FIELD sthicrtdp name="construct.a.sthicrtdp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthicrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthicrtdp
            #add-point:ON ACTION controlp INFIELD sthicrtdp name="construct.c.sthicrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthicrtdp  #顯示到畫面上
            NEXT FIELD sthicrtdp                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthicrtdt
            #add-point:BEFORE FIELD sthicrtdt name="construct.b.sthicrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthimodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthimodid
            #add-point:ON ACTION controlp INFIELD sthimodid name="construct.c.sthimodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthimodid  #顯示到畫面上
            NEXT FIELD sthimodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthimodid
            #add-point:BEFORE FIELD sthimodid name="construct.b.sthimodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthimodid
            
            #add-point:AFTER FIELD sthimodid name="construct.a.sthimodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthimoddt
            #add-point:BEFORE FIELD sthimoddt name="construct.b.sthimoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthicnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthicnfid
            #add-point:ON ACTION controlp INFIELD sthicnfid name="construct.c.sthicnfid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthicnfid  #顯示到畫面上
            NEXT FIELD sthicnfid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthicnfid
            #add-point:BEFORE FIELD sthicnfid name="construct.b.sthicnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthicnfid
            
            #add-point:AFTER FIELD sthicnfid name="construct.a.sthicnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthicnfdt
            #add-point:BEFORE FIELD sthicnfdt name="construct.b.sthicnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sthjseq,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008,sthj009, 
          sthj010,sthj011,sthjsite,sthjunit
           FROM s_detail1[1].sthjseq,s_detail1[1].sthj002,s_detail1[1].sthj003,s_detail1[1].sthj004, 
               s_detail1[1].sthj005,s_detail1[1].sthj006,s_detail1[1].sthj007,s_detail1[1].sthj008,s_detail1[1].sthj009, 
               s_detail1[1].sthj010,s_detail1[1].sthj011,s_detail1[1].sthjsite,s_detail1[1].sthjunit 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjseq
            #add-point:BEFORE FIELD sthjseq name="construct.b.page1.sthjseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjseq
            
            #add-point:AFTER FIELD sthjseq name="construct.a.page1.sthjseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjseq
            #add-point:ON ACTION controlp INFIELD sthjseq name="construct.c.page1.sthjseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sthj002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj002
            #add-point:ON ACTION controlp INFIELD sthj002 name="construct.c.page1.sthj002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj002  #顯示到畫面上
            NEXT FIELD sthj002                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj002
            #add-point:BEFORE FIELD sthj002 name="construct.b.page1.sthj002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj002
            
            #add-point:AFTER FIELD sthj002 name="construct.a.page1.sthj002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj003
            #add-point:ON ACTION controlp INFIELD sthj003 name="construct.c.page1.sthj003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj003  #顯示到畫面上
            NEXT FIELD sthj003                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj003
            #add-point:BEFORE FIELD sthj003 name="construct.b.page1.sthj003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj003
            
            #add-point:AFTER FIELD sthj003 name="construct.a.page1.sthj003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj004
            #add-point:ON ACTION controlp INFIELD sthj004 name="construct.c.page1.sthj004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhac003()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj004  #顯示到畫面上
            NEXT FIELD sthj004                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj004
            #add-point:BEFORE FIELD sthj004 name="construct.b.page1.sthj004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj004
            
            #add-point:AFTER FIELD sthj004 name="construct.a.page1.sthj004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj005
            #add-point:ON ACTION controlp INFIELD sthj005 name="construct.c.page1.sthj005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj005  #顯示到畫面上
            NEXT FIELD sthj005                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj005
            #add-point:BEFORE FIELD sthj005 name="construct.b.page1.sthj005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj005
            
            #add-point:AFTER FIELD sthj005 name="construct.a.page1.sthj005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj006
            #add-point:ON ACTION controlp INFIELD sthj006 name="construct.c.page1.sthj006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2144'
            CALL q_oocq002()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj006  #顯示到畫面上
            NEXT FIELD sthj006                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj006
            #add-point:BEFORE FIELD sthj006 name="construct.b.page1.sthj006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj006
            
            #add-point:AFTER FIELD sthj006 name="construct.a.page1.sthj006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj007
            #add-point:ON ACTION controlp INFIELD sthj007 name="construct.c.page1.sthj007"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthj007  #顯示到畫面上
            NEXT FIELD sthj007                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj007
            #add-point:BEFORE FIELD sthj007 name="construct.b.page1.sthj007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj007
            
            #add-point:AFTER FIELD sthj007 name="construct.a.page1.sthj007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj008
            #add-point:BEFORE FIELD sthj008 name="construct.b.page1.sthj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj008
            
            #add-point:AFTER FIELD sthj008 name="construct.a.page1.sthj008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj008
            #add-point:ON ACTION controlp INFIELD sthj008 name="construct.c.page1.sthj008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj009
            #add-point:BEFORE FIELD sthj009 name="construct.b.page1.sthj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj009
            
            #add-point:AFTER FIELD sthj009 name="construct.a.page1.sthj009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj009
            #add-point:ON ACTION controlp INFIELD sthj009 name="construct.c.page1.sthj009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj010
            #add-point:BEFORE FIELD sthj010 name="construct.b.page1.sthj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj010
            
            #add-point:AFTER FIELD sthj010 name="construct.a.page1.sthj010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj010
            #add-point:ON ACTION controlp INFIELD sthj010 name="construct.c.page1.sthj010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj011
            #add-point:BEFORE FIELD sthj011 name="construct.b.page1.sthj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj011
            
            #add-point:AFTER FIELD sthj011 name="construct.a.page1.sthj011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj011
            #add-point:ON ACTION controlp INFIELD sthj011 name="construct.c.page1.sthj011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjsite
            #add-point:BEFORE FIELD sthjsite name="construct.b.page1.sthjsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjsite
            
            #add-point:AFTER FIELD sthjsite name="construct.a.page1.sthjsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthjsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjsite
            #add-point:ON ACTION controlp INFIELD sthjsite name="construct.c.page1.sthjsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjunit
            #add-point:BEFORE FIELD sthjunit name="construct.b.page1.sthjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjunit
            
            #add-point:AFTER FIELD sthjunit name="construct.a.page1.sthjunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjunit
            #add-point:ON ACTION controlp INFIELD sthjunit name="construct.c.page1.sthjunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
      CONSTRUCT g_wc2_table2 ON sthkseq1,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007,sthk008,sthk009, 
          sthk010,sthksite,sthkunit
           FROM s_detail2[1].sthkseq1,s_detail2[1].sthk002,s_detail2[1].sthk003,s_detail2[1].sthk004, 
               s_detail2[1].sthk005,s_detail2[1].sthk006,s_detail2[1].sthk007,s_detail2[1].sthk008,s_detail2[1].sthk009, 
               s_detail2[1].sthk010,s_detail2[1].sthksite,s_detail2[1].sthkunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthkseq1
            #add-point:BEFORE FIELD sthkseq1 name="construct.b.page2.sthkseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthkseq1
            
            #add-point:AFTER FIELD sthkseq1 name="construct.a.page2.sthkseq1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthkseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthkseq1
            #add-point:ON ACTION controlp INFIELD sthkseq1 name="construct.c.page2.sthkseq1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk002
            #add-point:BEFORE FIELD sthk002 name="construct.b.page2.sthk002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk002
            
            #add-point:AFTER FIELD sthk002 name="construct.a.page2.sthk002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk002
            #add-point:ON ACTION controlp INFIELD sthk002 name="construct.c.page2.sthk002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk003
            #add-point:BEFORE FIELD sthk003 name="construct.b.page2.sthk003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk003
            
            #add-point:AFTER FIELD sthk003 name="construct.a.page2.sthk003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk003
            #add-point:ON ACTION controlp INFIELD sthk003 name="construct.c.page2.sthk003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk004
            #add-point:BEFORE FIELD sthk004 name="construct.b.page2.sthk004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk004
            
            #add-point:AFTER FIELD sthk004 name="construct.a.page2.sthk004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk004
            #add-point:ON ACTION controlp INFIELD sthk004 name="construct.c.page2.sthk004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk005
            #add-point:BEFORE FIELD sthk005 name="construct.b.page2.sthk005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk005
            
            #add-point:AFTER FIELD sthk005 name="construct.a.page2.sthk005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk005
            #add-point:ON ACTION controlp INFIELD sthk005 name="construct.c.page2.sthk005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk006
            #add-point:BEFORE FIELD sthk006 name="construct.b.page2.sthk006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk006
            
            #add-point:AFTER FIELD sthk006 name="construct.a.page2.sthk006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk006
            #add-point:ON ACTION controlp INFIELD sthk006 name="construct.c.page2.sthk006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk007
            #add-point:BEFORE FIELD sthk007 name="construct.b.page2.sthk007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk007
            
            #add-point:AFTER FIELD sthk007 name="construct.a.page2.sthk007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk007
            #add-point:ON ACTION controlp INFIELD sthk007 name="construct.c.page2.sthk007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk008
            #add-point:BEFORE FIELD sthk008 name="construct.b.page2.sthk008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk008
            
            #add-point:AFTER FIELD sthk008 name="construct.a.page2.sthk008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk008
            #add-point:ON ACTION controlp INFIELD sthk008 name="construct.c.page2.sthk008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk009
            #add-point:BEFORE FIELD sthk009 name="construct.b.page2.sthk009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk009
            
            #add-point:AFTER FIELD sthk009 name="construct.a.page2.sthk009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk009
            #add-point:ON ACTION controlp INFIELD sthk009 name="construct.c.page2.sthk009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk010
            #add-point:BEFORE FIELD sthk010 name="construct.b.page2.sthk010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk010
            
            #add-point:AFTER FIELD sthk010 name="construct.a.page2.sthk010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthk010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk010
            #add-point:ON ACTION controlp INFIELD sthk010 name="construct.c.page2.sthk010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthksite
            #add-point:BEFORE FIELD sthksite name="construct.b.page2.sthksite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthksite
            
            #add-point:AFTER FIELD sthksite name="construct.a.page2.sthksite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthksite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthksite
            #add-point:ON ACTION controlp INFIELD sthksite name="construct.c.page2.sthksite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthkunit
            #add-point:BEFORE FIELD sthkunit name="construct.b.page2.sthkunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthkunit
            
            #add-point:AFTER FIELD sthkunit name="construct.a.page2.sthkunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthkunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthkunit
            #add-point:ON ACTION controlp INFIELD sthkunit name="construct.c.page2.sthkunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
     CONSTRUCT g_wc2_table3
            ON sthlseq2, sthl002, sthl003, sthl004, sthl005, sthlsite, sthlunit
          FROM s_detail3[1].sthlseq2, s_detail3[1].sthl002, s_detail3[1].sthl003,
               s_detail3[1].sthl004,  s_detail3[1].sthl005, s_detail3[1].sthlsite,
               s_detail3[1].sthlunit
               
      END CONSTRUCT
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
                  WHEN la_wc[li_idx].tableid = "sthi_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sthj_t" 
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
 
 
   IF g_wc2_table2 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
   END IF
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   #160604-00009#102 20160623 add by beckxie---S
   IF g_wc2_table3 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
   END IF
   #160604-00009#102 20160623 add by beckxie---E
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astm252_filter()
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
      CONSTRUCT g_wc_filter ON sthisite,sthi002,sthi004,sthi007,sthi008,sthi009
                          FROM s_browse[1].b_sthisite,s_browse[1].b_sthi002,s_browse[1].b_sthi004,s_browse[1].b_sthi007, 
                              s_browse[1].b_sthi008,s_browse[1].b_sthi009
 
         BEFORE CONSTRUCT
               DISPLAY astm252_filter_parser('sthisite') TO s_browse[1].b_sthisite
            DISPLAY astm252_filter_parser('sthi002') TO s_browse[1].b_sthi002
            DISPLAY astm252_filter_parser('sthi004') TO s_browse[1].b_sthi004
            DISPLAY astm252_filter_parser('sthi007') TO s_browse[1].b_sthi007
            DISPLAY astm252_filter_parser('sthi008') TO s_browse[1].b_sthi008
            DISPLAY astm252_filter_parser('sthi009') TO s_browse[1].b_sthi009
      
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
 
      CALL astm252_filter_show('sthisite')
   CALL astm252_filter_show('sthi002')
   CALL astm252_filter_show('sthi004')
   CALL astm252_filter_show('sthi007')
   CALL astm252_filter_show('sthi008')
   CALL astm252_filter_show('sthi009')
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astm252_filter_parser(ps_field)
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
 
{<section id="astm252.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astm252_filter_show(ps_field)
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
   LET ls_condition = astm252_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astm252_query()
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
   CALL g_sthj_d.clear()
   CALL g_sthj2_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL g_sthj3_d.clear() 
   CALL astm252_comp_visible()
   CALL astm252_comp_no_visible('1')
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astm252_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astm252_browser_fill("")
      CALL astm252_fetch("")
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
      CALL astm252_filter_show('sthisite')
   CALL astm252_filter_show('sthi002')
   CALL astm252_filter_show('sthi004')
   CALL astm252_filter_show('sthi007')
   CALL astm252_filter_show('sthi008')
   CALL astm252_filter_show('sthi009')
   CALL astm252_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astm252_fetch("F") 
      #顯示單身筆數
      CALL astm252_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astm252_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   CALL g_sthj3_d.clear()
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
   CALL g_sthj2_d.clear()
 
   
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
   
   LET g_sthi_m.sthi002 = g_browser[g_current_idx].b_sthi002
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
   #遮罩相關處理
   LET g_sthi_m_mask_o.* =  g_sthi_m.*
   CALL astm252_sthi_t_mask()
   LET g_sthi_m_mask_n.* =  g_sthi_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm252_set_act_visible()   
   CALL astm252_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_sthi_m_t.* = g_sthi_m.*
   LET g_sthi_m_o.* = g_sthi_m.*
   
   LET g_data_owner = g_sthi_m.sthiownid      
   LET g_data_dept  = g_sthi_m.sthiowndp
   
   #重新顯示   
   CALL astm252_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.insert" >}
#+ 資料新增
PRIVATE FUNCTION astm252_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sthj_d.clear()   
   CALL g_sthj2_d.clear()  
 
 
   INITIALIZE g_sthi_m.* TO NULL             #DEFAULT 設定
   
   LET g_sthi002_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sthi_m.sthiownid = g_user
      LET g_sthi_m.sthiowndp = g_dept
      LET g_sthi_m.sthicrtid = g_user
      LET g_sthi_m.sthicrtdp = g_dept 
      LET g_sthi_m.sthicrtdt = cl_get_current()
      LET g_sthi_m.sthimodid = g_user
      LET g_sthi_m.sthimoddt = cl_get_current()
      LET g_sthi_m.sthistus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_sthi_m.sthi007 = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
      
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sthi_m_t.* = g_sthi_m.*
      LET g_sthi_m_o.* = g_sthi_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthi_m.sthistus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astm252_input("a")
      
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
         INITIALIZE g_sthi_m.* TO NULL
         INITIALIZE g_sthj_d TO NULL
         INITIALIZE g_sthj2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astm252_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sthj_d.clear()
      #CALL g_sthj2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm252_set_act_visible()   
   CALL astm252_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sthi002_t = g_sthi_m.sthi002
 
   
   #組合新增資料的條件
   LET g_add_browse = " sthient = " ||g_enterprise|| " AND",
                      " sthi002 = '", g_sthi_m.sthi002, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm252_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astm252_cl
   
   CALL astm252_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
   
   #遮罩相關處理
   LET g_sthi_m_mask_o.* =  g_sthi_m.*
   CALL astm252_sthi_t_mask()
   LET g_sthi_m_mask_n.* =  g_sthi_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthisite_desc,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003, 
       g_sthi_m.sthi004,g_sthi_m.sthi004_desc,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
       g_sthi_m.sthi008_desc,g_sthi_m.sthi009,g_sthi_m.sthi009_desc,g_sthi_m.sthi001,g_sthi_m.sthiunit, 
       g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp,g_sthi_m.sthiowndp_desc, 
       g_sthi_m.sthicrtid,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdp_desc,g_sthi_m.sthicrtdt, 
       g_sthi_m.sthimodid,g_sthi_m.sthimodid_desc,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid,g_sthi_m.sthicnfid_desc, 
       g_sthi_m.sthicnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sthi_m.sthiownid      
   LET g_data_dept  = g_sthi_m.sthiowndp
   
   #功能已完成,通報訊息中心
   CALL astm252_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.modify" >}
#+ 資料修改
PRIVATE FUNCTION astm252_modify()
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
   LET g_sthi_m_t.* = g_sthi_m.*
   LET g_sthi_m_o.* = g_sthi_m.*
   
   IF g_sthi_m.sthi002 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sthi002_t = g_sthi_m.sthi002
 
   CALL s_transaction_begin()
   
   OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm252_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm252_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
   #檢查是否允許此動作
   IF NOT astm252_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sthi_m_mask_o.* =  g_sthi_m.*
   CALL astm252_sthi_t_mask()
   LET g_sthi_m_mask_n.* =  g_sthi_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
   
   CALL astm252_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
    
   WHILE TRUE
      LET g_sthi002_t = g_sthi_m.sthi002
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sthi_m.sthimodid = g_user 
LET g_sthi_m.sthimoddt = cl_get_current()
LET g_sthi_m.sthimodid_desc = cl_get_username(g_sthi_m.sthimodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astm252_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sthi_t SET (sthimodid,sthimoddt) = (g_sthi_m.sthimodid,g_sthi_m.sthimoddt)
          WHERE sthient = g_enterprise AND sthi002 = g_sthi002_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sthi_m.* = g_sthi_m_t.*
            CALL astm252_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sthi_m.sthi002 != g_sthi_m_t.sthi002
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE sthj_t SET sthj001 = g_sthi_m.sthi002
 
          WHERE sthjent = g_enterprise AND sthj001 = g_sthi_m_t.sthi002
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sthj_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
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
         UPDATE sthk_t
            SET sthk001 = g_sthi_m.sthi002
 
          WHERE sthkent = g_enterprise AND
                sthk001 = g_sthi002_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthk_t" 
               LET g_errparam.code = "std-00009" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         UPDATE sthl_t
            SET sthl001 = g_sthi_m.sthi002
          WHERE sthlent = g_enterprise
            AND sthl001 = g_sthi002_t
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthl_t" 
               LET g_errparam.code   = "std-00009" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthl_t:",SQLERRMESSAGE 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
         END CASE
         #end add-point
 
 
         
         #UPDATE 多語言table key值
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm252_set_act_visible()   
   CALL astm252_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sthient = " ||g_enterprise|| " AND",
                      " sthi002 = '", g_sthi_m.sthi002, "' "
 
   #填到對應位置
   CALL astm252_browser_fill("")
 
   CLOSE astm252_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm252_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astm252.input" >}
#+ 資料輸入
PRIVATE FUNCTION astm252_input(p_cmd)
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
   DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthisite_desc,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003, 
       g_sthi_m.sthi004,g_sthi_m.sthi004_desc,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
       g_sthi_m.sthi008_desc,g_sthi_m.sthi009,g_sthi_m.sthi009_desc,g_sthi_m.sthi001,g_sthi_m.sthiunit, 
       g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp,g_sthi_m.sthiowndp_desc, 
       g_sthi_m.sthicrtid,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdp_desc,g_sthi_m.sthicrtdt, 
       g_sthi_m.sthimodid,g_sthi_m.sthimodid_desc,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid,g_sthi_m.sthicnfid_desc, 
       g_sthi_m.sthicnfdt
   
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
   LET g_forupd_sql = "SELECT sthjseq,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008,sthj009, 
       sthj010,sthj011,sthjsite,sthjunit FROM sthj_t WHERE sthjent=? AND sthj001=? AND sthjseq=? FOR  
       UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm252_bcl CURSOR FROM g_forupd_sql
   
 
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point 
   LET g_forupd_sql = "SELECT sthkseq1,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007,sthk008,sthk009, 
       sthk010,sthksite,sthkunit FROM sthk_t WHERE sthkent=? AND sthk001=? AND sthkseq=? AND sthkseq1=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm252_bcl2 CURSOR FROM g_forupd_sql
 
 
 
   #add-point:input段define_sql name="input.other_sql"
   LET g_forupd_sql = "SELECT sthlseq2, sthl002,  sthl003, sthl004,",
                      "       shtl005,  sthlsite, sthlunit",
                      "  FROM sthl_t",
                      " WHERE sthlent = ?",
                      "   AND sthl001 = ?",
                      "   AND sthlseq = ?",
                      "   AND sthlseq1 = ? ",
                      "   AND sthlseq2 = ? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm252_bcl3 CURSOR FROM g_forupd_sql
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astm252_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astm252_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003,g_sthi_m.sthi004, 
       g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009,g_sthi_m.sthi001, 
       g_sthi_m.sthiunit,g_sthi_m.sthistus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astm252.input.head" >}
      #單頭段
      INPUT BY NAME g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003,g_sthi_m.sthi004, 
          g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009,g_sthi_m.sthi001, 
          g_sthi_m.sthiunit,g_sthi_m.sthistus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_item
            LET g_action_choice="update_item"
            IF cl_auth_chk_act("update_item") THEN
               
               #add-point:ON ACTION update_item name="input.master_input.update_item"
               IF NOT cl_null(g_sthi_m.sthi002)  THEN
                  CALL n_sthil(g_sthi_m.sthi002)
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthi_m.sthi002

                  CALL ap_ref_array2(g_ref_fields," SELECT sthil003 FROM sthil_t"||
                                                  "  WHERE sthilent = "||g_enterprise||
                                                  "    AND sthil001 = ?"||
                                                  "    AND sthil002 = '"||g_dlang||"'","")
                     RETURNING g_rtn_fields
                  LET g_sthi_m.sthi002 = g_rtn_fields[1]
                  DISPLAY BY NAME g_sthi_m.sthi002
               END IF
               #END add-point
            END IF
 
 
 
 
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            LET g_master_multi_table_t.sthil001 = g_sthi_m.sthi002
LET g_master_multi_table_t.sthil003 = g_sthi_m.sthil003
 
            IF l_cmd_t = 'r' THEN
               LET g_master_multi_table_t.sthil001 = ''
LET g_master_multi_table_t.sthil003 = ''
 
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astm252_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astm252_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthisite
            
            #add-point:AFTER FIELD sthisite name="input.a.sthisite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthisite
            #add-point:BEFORE FIELD sthisite name="input.b.sthisite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthisite
            #add-point:ON CHANGE sthisite name="input.g.sthisite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi002
            #add-point:BEFORE FIELD sthi002 name="input.b.sthi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi002
            
            #add-point:AFTER FIELD sthi002 name="input.a.sthi002"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_sthi_m.sthi002) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sthi_m.sthi002 != g_sthi002_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthi_t WHERE "||"sthient = '" ||g_enterprise|| "' AND "||"sthi002 = '"||g_sthi_m.sthi002 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF




            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi002
            #add-point:ON CHANGE sthi002 name="input.g.sthi002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi003
            #add-point:BEFORE FIELD sthi003 name="input.b.sthi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi003
            
            #add-point:AFTER FIELD sthi003 name="input.a.sthi003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi003
            #add-point:ON CHANGE sthi003 name="input.g.sthi003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthil003
            #add-point:BEFORE FIELD sthil003 name="input.b.sthil003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthil003
            
            #add-point:AFTER FIELD sthil003 name="input.a.sthil003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthil003
            #add-point:ON CHANGE sthil003 name="input.g.sthil003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi004
            
            #add-point:AFTER FIELD sthi004 name="input.a.sthi004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi004
            #add-point:BEFORE FIELD sthi004 name="input.b.sthi004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi004
            #add-point:ON CHANGE sthi004 name="input.g.sthi004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi005
            #add-point:BEFORE FIELD sthi005 name="input.b.sthi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi005
            
            #add-point:AFTER FIELD sthi005 name="input.a.sthi005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi005
            #add-point:ON CHANGE sthi005 name="input.g.sthi005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi006
            #add-point:BEFORE FIELD sthi006 name="input.b.sthi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi006
            
            #add-point:AFTER FIELD sthi006 name="input.a.sthi006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi006
            #add-point:ON CHANGE sthi006 name="input.g.sthi006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi007
            #add-point:BEFORE FIELD sthi007 name="input.b.sthi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi007
            
            #add-point:AFTER FIELD sthi007 name="input.a.sthi007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi007
            #add-point:ON CHANGE sthi007 name="input.g.sthi007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi008
            
            #add-point:AFTER FIELD sthi008 name="input.a.sthi008"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi008
            #add-point:BEFORE FIELD sthi008 name="input.b.sthi008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi008
            #add-point:ON CHANGE sthi008 name="input.g.sthi008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi009
            
            #add-point:AFTER FIELD sthi009 name="input.a.sthi009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi009
            #add-point:BEFORE FIELD sthi009 name="input.b.sthi009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi009
            #add-point:ON CHANGE sthi009 name="input.g.sthi009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthi001
            #add-point:BEFORE FIELD sthi001 name="input.b.sthi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthi001
            
            #add-point:AFTER FIELD sthi001 name="input.a.sthi001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthi001
            #add-point:ON CHANGE sthi001 name="input.g.sthi001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthiunit
            #add-point:BEFORE FIELD sthiunit name="input.b.sthiunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthiunit
            
            #add-point:AFTER FIELD sthiunit name="input.a.sthiunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthiunit
            #add-point:ON CHANGE sthiunit name="input.g.sthiunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthistus
            #add-point:BEFORE FIELD sthistus name="input.b.sthistus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthistus
            
            #add-point:AFTER FIELD sthistus name="input.a.sthistus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthistus
            #add-point:ON CHANGE sthistus name="input.g.sthistus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sthisite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthisite
            #add-point:ON ACTION controlp INFIELD sthisite name="input.c.sthisite"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi002
            #add-point:ON ACTION controlp INFIELD sthi002 name="input.c.sthi002"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi003
            #add-point:ON ACTION controlp INFIELD sthi003 name="input.c.sthi003"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthil003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthil003
            #add-point:ON ACTION controlp INFIELD sthil003 name="input.c.sthil003"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi004
            #add-point:ON ACTION controlp INFIELD sthi004 name="input.c.sthi004"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi005
            #add-point:ON ACTION controlp INFIELD sthi005 name="input.c.sthi005"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi006
            #add-point:ON ACTION controlp INFIELD sthi006 name="input.c.sthi006"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi007
            #add-point:ON ACTION controlp INFIELD sthi007 name="input.c.sthi007"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi008
            #add-point:ON ACTION controlp INFIELD sthi008 name="input.c.sthi008"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi009
            #add-point:ON ACTION controlp INFIELD sthi009 name="input.c.sthi009"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthi001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthi001
            #add-point:ON ACTION controlp INFIELD sthi001 name="input.c.sthi001"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthiunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthiunit
            #add-point:ON ACTION controlp INFIELD sthiunit name="input.c.sthiunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthistus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthistus
            #add-point:ON ACTION controlp INFIELD sthistus name="input.c.sthistus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sthi_m.sthi002
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               
               #end add-point
               
               INSERT INTO sthi_t (sthient,sthisite,sthi002,sthi003,sthi004,sthi005,sthi006,sthi007, 
                   sthi008,sthi009,sthi001,sthiunit,sthistus,sthiownid,sthiowndp,sthicrtid,sthicrtdp, 
                   sthicrtdt,sthimodid,sthimoddt,sthicnfid,sthicnfdt)
               VALUES (g_enterprise,g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthi004, 
                   g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
                   g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp, 
                   g_sthi_m.sthicrtid,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt, 
                   g_sthi_m.sthicnfid,g_sthi_m.sthicnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sthi_m:",SQLERRMESSAGE 
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
         IF g_sthi_m.sthi002 = g_master_multi_table_t.sthil001 AND
         g_sthi_m.sthil003 = g_master_multi_table_t.sthil003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthilent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_sthi_m.sthi002
            LET l_field_keys[02] = 'sthil001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.sthil001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthil002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_sthi_m.sthil003
            LET l_fields[01] = 'sthil003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthil_t')
         END IF 
 
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astm252_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astm252_b_fill()
                  CALL astm252_b_fill2('0')
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
               CALL astm252_sthi_t_mask_restore('restore_mask_o')
               
               UPDATE sthi_t SET (sthisite,sthi002,sthi003,sthi004,sthi005,sthi006,sthi007,sthi008,sthi009, 
                   sthi001,sthiunit,sthistus,sthiownid,sthiowndp,sthicrtid,sthicrtdp,sthicrtdt,sthimodid, 
                   sthimoddt,sthicnfid,sthicnfdt) = (g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
                   g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
                   g_sthi_m.sthi009,g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid, 
                   g_sthi_m.sthiowndp,g_sthi_m.sthicrtid,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid, 
                   g_sthi_m.sthimoddt,g_sthi_m.sthicnfid,g_sthi_m.sthicnfdt)
                WHERE sthient = g_enterprise AND sthi002 = g_sthi002_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sthi_t:",SQLERRMESSAGE 
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
         IF g_sthi_m.sthi002 = g_master_multi_table_t.sthil001 AND
         g_sthi_m.sthil003 = g_master_multi_table_t.sthil003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthilent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_sthi_m.sthi002
            LET l_field_keys[02] = 'sthil001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.sthil001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthil002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_sthi_m.sthil003
            LET l_fields[01] = 'sthil003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthil_t')
         END IF 
 
               
               #將遮罩欄位進行遮蔽
               CALL astm252_sthi_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sthi_m_t)
               LET g_log2 = util.JSON.stringify(g_sthi_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sthi002_t = g_sthi_m.sthi002
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astm252.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sthj_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthj_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm252_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sthj_d.getLength()
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
            CALL astm252_b_fill2('2')
 
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sthj_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthj_d[l_ac].sthjseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sthj_d_t.* = g_sthj_d[l_ac].*  #BACKUP
               LET g_sthj_d_o.* = g_sthj_d[l_ac].*  #BACKUP
               CALL astm252_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astm252_set_no_entry_b(l_cmd)
               IF NOT astm252_lock_b("sthj_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm252_bcl INTO g_sthj_d[l_ac].sthjseq,g_sthj_d[l_ac].sthj002,g_sthj_d[l_ac].sthj003, 
                      g_sthj_d[l_ac].sthj004,g_sthj_d[l_ac].sthj005,g_sthj_d[l_ac].sthj006,g_sthj_d[l_ac].sthj007, 
                      g_sthj_d[l_ac].sthj008,g_sthj_d[l_ac].sthj009,g_sthj_d[l_ac].sthj010,g_sthj_d[l_ac].sthj011, 
                      g_sthj_d[l_ac].sthjsite,g_sthj_d[l_ac].sthjunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sthj_d_t.sthjseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthj_d_mask_o[l_ac].* =  g_sthj_d[l_ac].*
                  CALL astm252_sthj_t_mask()
                  LET g_sthj_d_mask_n[l_ac].* =  g_sthj_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm252_show()
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
            INITIALIZE g_sthj_d[l_ac].* TO NULL 
            INITIALIZE g_sthj_d_t.* TO NULL 
            INITIALIZE g_sthj_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_sthj_d[l_ac].sthjseq = "0"
      LET g_sthj_d[l_ac].sthj009 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_sthj_d_t.* = g_sthj_d[l_ac].*     #新輸入資料
            LET g_sthj_d_o.* = g_sthj_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm252_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astm252_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthj_d[li_reproduce_target].* = g_sthj_d[li_reproduce].*
 
               LET g_sthj_d[li_reproduce_target].sthjseq = NULL
 
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
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sthj_t 
             WHERE sthjent = g_enterprise AND sthj001 = g_sthi_m.sthi002
 
               AND sthjseq = g_sthj_d[l_ac].sthjseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthi_m.sthi002
               LET gs_keys[2] = g_sthj_d[g_detail_idx].sthjseq
               CALL astm252_insert_b('sthj_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sthj_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm252_b_fill()
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
               LET gs_keys[01] = g_sthi_m.sthi002
 
               LET gs_keys[gs_keys.getLength()+1] = g_sthj_d_t.sthjseq
 
            
               #刪除同層單身
               IF NOT astm252_delete_b('sthj_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm252_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm252_key_delete_b(gs_keys,'sthj_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm252_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astm252_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_sthj_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthj_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjseq
            #add-point:BEFORE FIELD sthjseq name="input.b.page1.sthjseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjseq
            
            #add-point:AFTER FIELD sthjseq name="input.a.page1.sthjseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_sthi_m.sthi002 IS NOT NULL AND g_sthj_d[g_detail_idx].sthjseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sthi_m.sthi002 != g_sthi002_t OR g_sthj_d[g_detail_idx].sthjseq != g_sthj_d_t.sthjseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthj_t WHERE "||"sthjent = '" ||g_enterprise|| "' AND "||"sthj001 = '"||g_sthi_m.sthi002 ||"' AND "|| "sthjseq = '"||g_sthj_d[g_detail_idx].sthjseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthjseq
            #add-point:ON CHANGE sthjseq name="input.g.page1.sthjseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj002
            
            #add-point:AFTER FIELD sthj002 name="input.a.page1.sthj002"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj002
            CALL ap_ref_array2(g_ref_fields,"SELECT mhaal003 FROM mhaal_t WHERE mhaalent='"||g_enterprise||"' AND mhaal001=? AND mhaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj002
            #add-point:BEFORE FIELD sthj002 name="input.b.page1.sthj002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj002
            #add-point:ON CHANGE sthj002 name="input.g.page1.sthj002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj003
            
            #add-point:AFTER FIELD sthj003 name="input.a.page1.sthj003"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj002
            LET g_ref_fields[2] = g_sthj_d[l_ac].sthj003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl001=? AND mhabl002=? AND mhabl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj003
            #add-point:BEFORE FIELD sthj003 name="input.b.page1.sthj003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj003
            #add-point:ON CHANGE sthj003 name="input.g.page1.sthj003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj004
            
            #add-point:AFTER FIELD sthj004 name="input.a.page1.sthj004"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj002
            LET g_ref_fields[2] = g_sthj_d[l_ac].sthj003
            LET g_ref_fields[3] = g_sthj_d[l_ac].sthj004
            CALL ap_ref_array2(g_ref_fields,"SELECT mhacl005 FROM mhacl_t WHERE mhaclent='"||g_enterprise||"' AND mhacl001=? AND mhacl002=? AND mhacl003=? AND mhacl004='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj004
            #add-point:BEFORE FIELD sthj004 name="input.b.page1.sthj004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj004
            #add-point:ON CHANGE sthj004 name="input.g.page1.sthj004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj005
            
            #add-point:AFTER FIELD sthj005 name="input.a.page1.sthj005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj005
            CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj005
            #add-point:BEFORE FIELD sthj005 name="input.b.page1.sthj005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj005
            #add-point:ON CHANGE sthj005 name="input.g.page1.sthj005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj006
            
            #add-point:AFTER FIELD sthj006 name="input.a.page1.sthj006"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj006
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND ooql001='2144' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj006_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj006
            #add-point:BEFORE FIELD sthj006 name="input.b.page1.sthj006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj006
            #add-point:ON CHANGE sthj006 name="input.g.page1.sthj006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj007
            
            #add-point:AFTER FIELD sthj007 name="input.a.page1.sthj007"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sthj_d[l_ac].sthj007
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sthj_d[l_ac].sthj007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sthj_d[l_ac].sthj007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj007
            #add-point:BEFORE FIELD sthj007 name="input.b.page1.sthj007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj007
            #add-point:ON CHANGE sthj007 name="input.g.page1.sthj007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj008
            #add-point:BEFORE FIELD sthj008 name="input.b.page1.sthj008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj008
            
            #add-point:AFTER FIELD sthj008 name="input.a.page1.sthj008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj008
            #add-point:ON CHANGE sthj008 name="input.g.page1.sthj008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj009
            #add-point:BEFORE FIELD sthj009 name="input.b.page1.sthj009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj009
            
            #add-point:AFTER FIELD sthj009 name="input.a.page1.sthj009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj009
            #add-point:ON CHANGE sthj009 name="input.g.page1.sthj009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj010
            #add-point:BEFORE FIELD sthj010 name="input.b.page1.sthj010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj010
            
            #add-point:AFTER FIELD sthj010 name="input.a.page1.sthj010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj010
            #add-point:ON CHANGE sthj010 name="input.g.page1.sthj010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthj011
            #add-point:BEFORE FIELD sthj011 name="input.b.page1.sthj011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthj011
            
            #add-point:AFTER FIELD sthj011 name="input.a.page1.sthj011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthj011
            #add-point:ON CHANGE sthj011 name="input.g.page1.sthj011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjsite
            #add-point:BEFORE FIELD sthjsite name="input.b.page1.sthjsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjsite
            
            #add-point:AFTER FIELD sthjsite name="input.a.page1.sthjsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthjsite
            #add-point:ON CHANGE sthjsite name="input.g.page1.sthjsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthjunit
            #add-point:BEFORE FIELD sthjunit name="input.b.page1.sthjunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthjunit
            
            #add-point:AFTER FIELD sthjunit name="input.a.page1.sthjunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthjunit
            #add-point:ON CHANGE sthjunit name="input.g.page1.sthjunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sthjseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjseq
            #add-point:ON ACTION controlp INFIELD sthjseq name="input.c.page1.sthjseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj002
            #add-point:ON ACTION controlp INFIELD sthj002 name="input.c.page1.sthj002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj003
            #add-point:ON ACTION controlp INFIELD sthj003 name="input.c.page1.sthj003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj004
            #add-point:ON ACTION controlp INFIELD sthj004 name="input.c.page1.sthj004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj005
            #add-point:ON ACTION controlp INFIELD sthj005 name="input.c.page1.sthj005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj006
            #add-point:ON ACTION controlp INFIELD sthj006 name="input.c.page1.sthj006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj007
            #add-point:ON ACTION controlp INFIELD sthj007 name="input.c.page1.sthj007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj008
            #add-point:ON ACTION controlp INFIELD sthj008 name="input.c.page1.sthj008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj009
            #add-point:ON ACTION controlp INFIELD sthj009 name="input.c.page1.sthj009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj010
            #add-point:ON ACTION controlp INFIELD sthj010 name="input.c.page1.sthj010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthj011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthj011
            #add-point:ON ACTION controlp INFIELD sthj011 name="input.c.page1.sthj011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthjsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjsite
            #add-point:ON ACTION controlp INFIELD sthjsite name="input.c.page1.sthjsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthjunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthjunit
            #add-point:ON ACTION controlp INFIELD sthjunit name="input.c.page1.sthjunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sthj_d[l_ac].* = g_sthj_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sthj_d[l_ac].sthjseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sthj_d[l_ac].* = g_sthj_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astm252_sthj_t_mask_restore('restore_mask_o')
      
               UPDATE sthj_t SET (sthj001,sthjseq,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008, 
                   sthj009,sthj010,sthj011,sthjsite,sthjunit) = (g_sthi_m.sthi002,g_sthj_d[l_ac].sthjseq, 
                   g_sthj_d[l_ac].sthj002,g_sthj_d[l_ac].sthj003,g_sthj_d[l_ac].sthj004,g_sthj_d[l_ac].sthj005, 
                   g_sthj_d[l_ac].sthj006,g_sthj_d[l_ac].sthj007,g_sthj_d[l_ac].sthj008,g_sthj_d[l_ac].sthj009, 
                   g_sthj_d[l_ac].sthj010,g_sthj_d[l_ac].sthj011,g_sthj_d[l_ac].sthjsite,g_sthj_d[l_ac].sthjunit) 
 
                WHERE sthjent = g_enterprise AND sthj001 = g_sthi_m.sthi002 
 
                  AND sthjseq = g_sthj_d_t.sthjseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sthj_d[l_ac].* = g_sthj_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthj_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sthj_d[l_ac].* = g_sthj_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthi_m.sthi002
               LET gs_keys_bak[1] = g_sthi002_t
               LET gs_keys[2] = g_sthj_d[g_detail_idx].sthjseq
               LET gs_keys_bak[2] = g_sthj_d_t.sthjseq
               CALL astm252_update_b('sthj_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astm252_sthj_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sthj_d[g_detail_idx].sthjseq = g_sthj_d_t.sthjseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sthi_m.sthi002
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sthj_d_t.sthjseq
 
                  CALL astm252_key_update_b(gs_keys,'sthj_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sthi_m),util.JSON.stringify(g_sthj_d_t)
               LET g_log2 = util.JSON.stringify(g_sthi_m),util.JSON.stringify(g_sthj_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astm252_unlock_b("sthj_t","'1'")
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
               LET g_sthj_d[li_reproduce_target].* = g_sthj_d[li_reproduce].*
 
               LET g_sthj_d[li_reproduce_target].sthjseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthj_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthj_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
      INPUT ARRAY g_sthj2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
        
         BEFORE INPUT
            #先將上層單身的idx放入g_detail_idx
            LET g_detail_idx_tmp = g_detail_idx
            LET g_detail_idx = g_detail_idx_list[1]
            #檢查上層單身是否為空
            IF g_detail_idx = 0 OR g_sthj_d.getLength() = 0 THEN
               NEXT FIELD sthjseq
            END IF
            #檢查上層單身是否有資料
            IF cl_null(g_sthj_d[g_detail_idx].sthjseq) THEN
               NEXT FIELD sthjseq
            END IF
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthj2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            #如果一直都在單身2則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sthj2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sthj2_d[l_ac].* TO NULL 
            INITIALIZE g_sthj2_d_t.* TO NULL 
            INITIALIZE g_sthj2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_sthj2_d[l_ac].sthkseq1 = "0"
      LET g_sthj2_d[l_ac].sthk005 = "0"
      LET g_sthj2_d[l_ac].sthk006 = "0"
      LET g_sthj2_d[l_ac].sthk008 = "0"
      LET g_sthj2_d[l_ac].sthk009 = "0"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_sthj2_d_t.* = g_sthj2_d[l_ac].*     #新輸入資料
            LET g_sthj2_d_o.* = g_sthj2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm252_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astm252_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthj2_d[li_reproduce_target].* = g_sthj2_d[li_reproduce].*
 
               LET g_sthj2_d[li_reproduce_target].sthkseq1 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            
            #end add-point  
            
         BEFORE ROW
            #add-point:modify段before row2 name="input.body2.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx2 = l_ac
            LET g_detail_idx_list[2] = l_ac
            LET g_current_page = 2
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
            #(ver:78) ---start---
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CLOSE astm252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            #(ver:78) --- end ---
            OPEN astm252_bcl USING g_enterprise,g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm252_bcl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm252_cl
               CLOSE astm252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sthj2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthj2_d[l_ac].sthkseq1 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sthj2_d_t.* = g_sthj2_d[l_ac].*  #BACKUP
               LET g_sthj2_d_o.* = g_sthj2_d[l_ac].*  #BACKUP
               CALL astm252_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astm252_set_no_entry_b(l_cmd)
               IF NOT astm252_lock_b("sthk_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm252_bcl2 INTO g_sthj2_d[l_ac].sthkseq1,g_sthj2_d[l_ac].sthk002,g_sthj2_d[l_ac].sthk003, 
                      g_sthj2_d[l_ac].sthk004,g_sthj2_d[l_ac].sthk005,g_sthj2_d[l_ac].sthk006,g_sthj2_d[l_ac].sthk007, 
                      g_sthj2_d[l_ac].sthk008,g_sthj2_d[l_ac].sthk009,g_sthj2_d[l_ac].sthk010,g_sthj2_d[l_ac].sthksite, 
                      g_sthj2_d[l_ac].sthkunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthj2_d_mask_o[l_ac].* =  g_sthj2_d[l_ac].*
                  CALL astm252_sthk_t_mask()
                  LET g_sthj2_d_mask_n[l_ac].* =  g_sthj2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm252_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body2.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body2.b_delete_ask"
               
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
               
               #add-point:單身2刪除前 name="input.body2.b_delete"
               
               #end add-point    
 
               #取得該筆資料key值
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthi_m.sthi002
               LET gs_keys[2] = g_sthj_d[g_detail_idx].sthjseq
               LET gs_keys[3] = g_sthj2_d_t.sthkseq1
 
 
               #刪除同層單身
               IF NOT astm252_delete_b('sthk_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm252_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point   
               
               CALL s_transaction_end('Y','0')
               CLOSE astm252_bcl
                  
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
 
               LET l_count = g_sthj_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthj2_d.getLength() + 1) THEN
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
               
            #add-point:單身2新增前 name="input.body2.b_a_insert"
            
            #end add-point
    
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sthk_t 
             WHERE sthkent = g_enterprise AND sthk001 = g_sthi_m.sthi002 AND sthkseq = g_sthj_d[g_detail_idx].sthjseq  
                 AND sthkseq1 = g_sthj2_d[g_detail_idx2].sthkseq1
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthi_m.sthi002
               LET gs_keys[2] = g_sthj_d[g_detail_idx].sthjseq
               LET gs_keys[3] = g_sthj2_d[g_detail_idx2].sthkseq1
               CALL astm252_insert_b('sthk_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_sthj_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm252_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body2.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
            #還原g_detail_idx
            LET g_detail_idx = g_detail_idx_tmp
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sthj2_d[l_ac].* = g_sthj2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm252_bcl2
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
               LET g_sthj2_d[l_ac].* = g_sthj2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astm252_sthk_t_mask_restore('restore_mask_o')
               
               UPDATE sthk_t SET (sthk001,sthkseq,sthkseq1,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007, 
                   sthk008,sthk009,sthk010,sthksite,sthkunit) = (g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq, 
                   g_sthj2_d[l_ac].sthkseq1,g_sthj2_d[l_ac].sthk002,g_sthj2_d[l_ac].sthk003,g_sthj2_d[l_ac].sthk004, 
                   g_sthj2_d[l_ac].sthk005,g_sthj2_d[l_ac].sthk006,g_sthj2_d[l_ac].sthk007,g_sthj2_d[l_ac].sthk008, 
                   g_sthj2_d[l_ac].sthk009,g_sthj2_d[l_ac].sthk010,g_sthj2_d[l_ac].sthksite,g_sthj2_d[l_ac].sthkunit)  
                   #自訂欄位頁簽
                WHERE sthkent = g_enterprise AND sthk001 = g_sthi002_t AND sthkseq = g_sthj_d[g_detail_idx].sthjseq  
                    AND sthkseq1 = g_sthj2_d_t.sthkseq1
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sthj2_d[l_ac].* = g_sthj2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthk_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sthj2_d[l_ac].* = g_sthj2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthi_m.sthi002
               LET gs_keys_bak[1] = g_sthi002_t
               LET gs_keys[2] = g_sthj_d[g_detail_idx].sthjseq
               LET gs_keys_bak[2] = g_sthj_d[g_detail_idx].sthjseq
               LET gs_keys[3] = g_sthj2_d[g_detail_idx2].sthkseq1
               LET gs_keys_bak[3] = g_sthj2_d_t.sthkseq1
               CALL astm252_update_b('sthk_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astm252_sthk_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sthi_m),util.JSON.stringify(g_sthj2_d_t)
               LET g_log2 = util.JSON.stringify(g_sthi_m),util.JSON.stringify(g_sthj2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthkseq1
            #add-point:BEFORE FIELD sthkseq1 name="input.b.page2.sthkseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthkseq1
            
            #add-point:AFTER FIELD sthkseq1 name="input.a.page2.sthkseq1"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_sthi_m.sthi002 IS NOT NULL AND g_sthj_d[g_detail_idx].sthjseq IS NOT NULL AND g_sthj2_d[g_detail_idx2].sthkseq1 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sthi_m.sthi002 != g_sthi002_t OR g_sthj_d[g_detail_idx].sthjseq != g_sthj_d[g_detail_idx].sthjseq OR g_sthj2_d[g_detail_idx2].sthkseq1 != g_sthj2_d_t.sthkseq1)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthk_t WHERE "||"sthkent = '" ||g_enterprise|| "' AND "||"sthk001 = '"||g_sthi_m.sthi002 ||"' AND "|| "sthkseq = '"||g_sthj_d[g_detail_idx].sthjseq ||"' AND "|| "sthkseq1 = '"||g_sthj2_d[g_detail_idx2].sthkseq1 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthkseq1
            #add-point:ON CHANGE sthkseq1 name="input.g.page2.sthkseq1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk002
            #add-point:BEFORE FIELD sthk002 name="input.b.page2.sthk002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk002
            
            #add-point:AFTER FIELD sthk002 name="input.a.page2.sthk002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk002
            #add-point:ON CHANGE sthk002 name="input.g.page2.sthk002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk003
            #add-point:BEFORE FIELD sthk003 name="input.b.page2.sthk003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk003
            
            #add-point:AFTER FIELD sthk003 name="input.a.page2.sthk003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk003
            #add-point:ON CHANGE sthk003 name="input.g.page2.sthk003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk004
            #add-point:BEFORE FIELD sthk004 name="input.b.page2.sthk004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk004
            
            #add-point:AFTER FIELD sthk004 name="input.a.page2.sthk004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk004
            #add-point:ON CHANGE sthk004 name="input.g.page2.sthk004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk005
            #add-point:BEFORE FIELD sthk005 name="input.b.page2.sthk005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk005
            
            #add-point:AFTER FIELD sthk005 name="input.a.page2.sthk005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk005
            #add-point:ON CHANGE sthk005 name="input.g.page2.sthk005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk006
            #add-point:BEFORE FIELD sthk006 name="input.b.page2.sthk006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk006
            
            #add-point:AFTER FIELD sthk006 name="input.a.page2.sthk006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk006
            #add-point:ON CHANGE sthk006 name="input.g.page2.sthk006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk007
            #add-point:BEFORE FIELD sthk007 name="input.b.page2.sthk007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk007
            
            #add-point:AFTER FIELD sthk007 name="input.a.page2.sthk007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk007
            #add-point:ON CHANGE sthk007 name="input.g.page2.sthk007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk008
            #add-point:BEFORE FIELD sthk008 name="input.b.page2.sthk008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk008
            
            #add-point:AFTER FIELD sthk008 name="input.a.page2.sthk008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk008
            #add-point:ON CHANGE sthk008 name="input.g.page2.sthk008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk009
            #add-point:BEFORE FIELD sthk009 name="input.b.page2.sthk009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk009
            
            #add-point:AFTER FIELD sthk009 name="input.a.page2.sthk009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk009
            #add-point:ON CHANGE sthk009 name="input.g.page2.sthk009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthk010
            #add-point:BEFORE FIELD sthk010 name="input.b.page2.sthk010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthk010
            
            #add-point:AFTER FIELD sthk010 name="input.a.page2.sthk010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthk010
            #add-point:ON CHANGE sthk010 name="input.g.page2.sthk010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthksite
            #add-point:BEFORE FIELD sthksite name="input.b.page2.sthksite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthksite
            
            #add-point:AFTER FIELD sthksite name="input.a.page2.sthksite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthksite
            #add-point:ON CHANGE sthksite name="input.g.page2.sthksite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthkunit
            #add-point:BEFORE FIELD sthkunit name="input.b.page2.sthkunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthkunit
            
            #add-point:AFTER FIELD sthkunit name="input.a.page2.sthkunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthkunit
            #add-point:ON CHANGE sthkunit name="input.g.page2.sthkunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.sthkseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthkseq1
            #add-point:ON ACTION controlp INFIELD sthkseq1 name="input.c.page2.sthkseq1"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk002
            #add-point:ON ACTION controlp INFIELD sthk002 name="input.c.page2.sthk002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk003
            #add-point:ON ACTION controlp INFIELD sthk003 name="input.c.page2.sthk003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk004
            #add-point:ON ACTION controlp INFIELD sthk004 name="input.c.page2.sthk004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk005
            #add-point:ON ACTION controlp INFIELD sthk005 name="input.c.page2.sthk005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk006
            #add-point:ON ACTION controlp INFIELD sthk006 name="input.c.page2.sthk006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk007
            #add-point:ON ACTION controlp INFIELD sthk007 name="input.c.page2.sthk007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk008
            #add-point:ON ACTION controlp INFIELD sthk008 name="input.c.page2.sthk008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk009
            #add-point:ON ACTION controlp INFIELD sthk009 name="input.c.page2.sthk009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthk010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthk010
            #add-point:ON ACTION controlp INFIELD sthk010 name="input.c.page2.sthk010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthksite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthksite
            #add-point:ON ACTION controlp INFIELD sthksite name="input.c.page2.sthksite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthkunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthkunit
            #add-point:ON ACTION controlp INFIELD sthkunit name="input.c.page2.sthkunit"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2_after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sthj2_d[l_ac].* = g_sthj2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm252_bcl2
               CLOSE astm252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm252_unlock_b("sthk_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2_after_row2 name="input.body2.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            
            #end add-point  
 
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sthj2_d[li_reproduce_target].* = g_sthj2_d[li_reproduce].*
 
               LET g_sthj2_d[li_reproduce_target].sthkseq1 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthj2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthj2_d.getLength()+1
            END IF
        
      END INPUT
 
 
 
 
{</section>}
 
{<section id="astm252.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sthi002
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sthjseq
               WHEN "s_detail2"
                  NEXT FIELD sthkseq1
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               WHEN "s_detail3"
                  NEXT FIELD sthlseq2
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
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
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
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astm252_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astm252_b_fill() #單身填充
      CALL astm252_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astm252_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthi_m.sthi002
   CALL ap_ref_array2(g_ref_fields,"SELECT sthil003 FROM sthil_t WHERE sthilent="||g_enterprise||" AND sthil001=? AND sthil002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthi_m.sthil003 = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthi_m.sthil003
   #end add-point
   
   #遮罩相關處理
   LET g_sthi_m_mask_o.* =  g_sthi_m.*
   CALL astm252_sthi_t_mask()
   LET g_sthi_m_mask_n.* =  g_sthi_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthisite_desc,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003, 
       g_sthi_m.sthi004,g_sthi_m.sthi004_desc,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
       g_sthi_m.sthi008_desc,g_sthi_m.sthi009,g_sthi_m.sthi009_desc,g_sthi_m.sthi001,g_sthi_m.sthiunit, 
       g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp,g_sthi_m.sthiowndp_desc, 
       g_sthi_m.sthicrtid,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdp_desc,g_sthi_m.sthicrtdt, 
       g_sthi_m.sthimodid,g_sthi_m.sthimodid_desc,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid,g_sthi_m.sthicnfid_desc, 
       g_sthi_m.sthicnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthi_m.sthistus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sthj_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_sthj2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astm252_detail_show()
 
   #add-point:show段之後 name="show.after"
   CALL astm252_comp_visible()
   CALL astm252_comp_no_visible('2')
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astm252_detail_show()
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
 
{<section id="astm252.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astm252_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sthi_t.sthi002 
   DEFINE l_oldno     LIKE sthi_t.sthi002 
 
   DEFINE l_master    RECORD LIKE sthi_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sthj_t.* #此變數樣板目前無使用
 
   DEFINE l_detail2    RECORD LIKE sthk_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_detail3    RECORD LIKE sthl_t.*
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
   
   IF g_sthi_m.sthi002 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sthi002_t = g_sthi_m.sthi002
 
    
   LET g_sthi_m.sthi002 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sthi_m.sthiownid = g_user
      LET g_sthi_m.sthiowndp = g_dept
      LET g_sthi_m.sthicrtid = g_user
      LET g_sthi_m.sthicrtdp = g_dept 
      LET g_sthi_m.sthicrtdt = cl_get_current()
      LET g_sthi_m.sthimodid = g_user
      LET g_sthi_m.sthimoddt = cl_get_current()
      LET g_sthi_m.sthistus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthi_m.sthistus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astm252_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sthi_m.* TO NULL
      INITIALIZE g_sthj_d TO NULL
      INITIALIZE g_sthj2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astm252_show()
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
   CALL astm252_set_act_visible()   
   CALL astm252_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sthi002_t = g_sthi_m.sthi002
 
   
   #組合新增資料的條件
   LET g_add_browse = " sthient = " ||g_enterprise|| " AND",
                      " sthi002 = '", g_sthi_m.sthi002, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm252_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astm252_idx_chk()
   
   LET g_data_owner = g_sthi_m.sthiownid      
   LET g_data_dept  = g_sthi_m.sthiowndp
   
   #功能已完成,通報訊息中心
   CALL astm252_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astm252_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sthj_t.* #此變數樣板目前無使用
 
   DEFINE l_detail2    RECORD LIKE sthk_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astm252_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sthj_t
    WHERE sthjent = g_enterprise AND sthj001 = g_sthi002_t
 
    INTO TEMP astm252_detail
 
   #將key修正為調整後   
   UPDATE astm252_detail 
      #更新key欄位
      SET sthj001 = g_sthi_m.sthi002
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sthj_t SELECT * FROM astm252_detail
   
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
   DROP TABLE astm252_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sthk_t 
    WHERE sthkent = g_enterprise AND sthk001 = g_sthi002_t
 
    INTO TEMP astm252_detail
 
   #將key修正為調整後   
   UPDATE astm252_detail SET sthk001 = g_sthi_m.sthi002
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
  
   #將資料塞回原table   
   INSERT INTO sthk_t SELECT * FROM astm252_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm252_detail
   
   LET g_data_owner = g_sthi_m.sthiownid      
   LET g_data_dept  = g_sthi_m.sthiowndp
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   #CREATE TEMP TABLE
   SELECT *
     FROM sthl_t 
    WHERE sthlent = g_enterprise
      AND sthl001 = g_sthi002_t
     INTO TEMP astm252_detail
 
   #將key修正為調整後   
   UPDATE astm252_detail SET sthl001 = g_sthi_m.sthi002

   #將資料塞回原table   
   INSERT INTO sthl_t SELECT * FROM astm252_detail
   DROP TABLE astm252_detail
   #end add-point
 
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sthi002_t = g_sthi_m.sthi002
 
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astm252_delete()
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
   
   IF g_sthi_m.sthi002 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   LET g_master_multi_table_t.sthil001 = g_sthi_m.sthi002
LET g_master_multi_table_t.sthil003 = g_sthi_m.sthil003
 
   
   CALL s_transaction_begin()
 
   OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm252_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm252_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astm252_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sthi_m_mask_o.* =  g_sthi_m.*
   CALL astm252_sthi_t_mask()
   LET g_sthi_m_mask_n.* =  g_sthi_m.*
   
   CALL astm252_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astm252_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sthi002_t = g_sthi_m.sthi002
 
 
      DELETE FROM sthi_t
       WHERE sthient = g_enterprise AND sthi002 = g_sthi_m.sthi002
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sthi_m.sthi002,":",SQLERRMESSAGE  
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
      
      DELETE FROM sthj_t
       WHERE sthjent = g_enterprise AND sthj001 = g_sthi_m.sthi002
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
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
      DELETE FROM sthk_t
       WHERE sthkent = g_enterprise AND
             sthk001 = g_sthi_m.sthi002
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      DELETE FROM sthl_t
       WHERE sthlent = g_enterprise
         AND sthl001 = g_sthi_m.sthi002
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthl_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF      
      #end add-point
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sthi_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astm252_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sthj_d.clear() 
      CALL g_sthj2_d.clear()       
 
     
      CALL astm252_ui_browser_refresh()  
      #CALL astm252_ui_headershow()  
      #CALL astm252_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      INITIALIZE l_var_keys_bak TO NULL 
   INITIALIZE l_field_keys   TO NULL 
   LET l_var_keys_bak[01] = g_enterprise
   LET l_field_keys[01] = 'sthilent'
   LET l_var_keys_bak[02] = g_master_multi_table_t.sthil001
   LET l_field_keys[02] = 'sthil001'
   CALL cl_multitable_delete(l_field_keys,l_var_keys_bak,'sthil_t')
 
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astm252_browser_fill("")
         CALL astm252_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astm252_cl
 
   #功能已完成,通報訊息中心
   CALL astm252_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astm252.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astm252_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sthj_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astm252_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sthjseq,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008, 
             sthj009,sthj010,sthj011,sthjsite,sthjunit ,t1.mhaal003 ,t2.mhabl004 ,t3.mhacl005 ,t4.rtaxl003 , 
             t5.oocql004 ,t6.mhbel003 FROM sthj_t",   
                     " INNER JOIN sthi_t ON sthient = " ||g_enterprise|| " AND sthi002 = sthj001 ",
 
                     #"",
                     " LEFT JOIN sthk_t ON sthjent = sthkent AND sthj001 = sthk001 AND sthjseq = sthkseq ",
                     "",
                     #下層單身所需的join條件
                     " ",
 
 
                                    " LEFT JOIN mhaal_t t1 ON t1.mhaalent="||g_enterprise||" AND t1.mhaal001=sthj002 AND t1.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t2 ON t2.mhablent="||g_enterprise||" AND t2.mhabl001=sthj002 AND t2.mhabl002=sthj003 AND t2.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN mhacl_t t3 ON t3.mhaclent="||g_enterprise||" AND t3.mhacl001=sthj002 AND t3.mhacl002=sthj003 AND t3.mhacl003=sthj004 AND t3.mhacl004='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=sthj005 AND t4.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2144' AND t5.oocql002=sthj006 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t6 ON t6.mhbelent="||g_enterprise||" AND t6.mhbel001=sthj007 AND t6.mhbel002='"||g_dlang||"' ",
 
                     " WHERE sthjent=? AND sthj001=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         LET g_sql = "SELECT DISTINCT sthjseq,     sthj002,     sthj003,     sthj004,",
                     "                sthj005,     sthj006,     sthj007,     sthj008,",
                     "                sthj009,     sthj010,     sthj011,     sthjsite,",
                     "                sthjunit,    t1.mhaal003, t2.mhabl004, t3.mhacl005,",
                     "                t4.rtaxl003, t5.oocql004 ,t6.mhbel003",
                     "  FROM sthj_t", 
                     "  LEFT JOIN sthk_t ON sthjent = sthkent AND sthj001 = sthk001 AND sthjseq = sthkseq ",
                     "  LEFT JOIN sthl_t ON sthkent = sthlent AND sthk001 = sthl001 AND sthkseq = sthlseq AND sthkseq1 = sthlseq1",
                     " LEFT JOIN mhaal_t t1 ON t1.mhaalent='"||g_enterprise||"' AND t1.mhaal001=sthj002 AND t1.mhaal002='"||g_dlang||"' ",
                     " LEFT JOIN mhabl_t t2 ON t2.mhablent='"||g_enterprise||"' AND t2.mhabl001=sthj002 AND t2.mhabl002=sthj003 AND t2.mhabl003='"||g_dlang||"' ",
                     " LEFT JOIN mhacl_t t3 ON t3.mhaclent='"||g_enterprise||"' AND t3.mhacl001=sthj002 AND t3.mhacl002=sthj003 AND t3.mhacl003=sthj004 AND t3.mhacl004='"||g_dlang||"' ",
                     " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent='"||g_enterprise||"' AND t4.rtaxl001=sthj005 AND t4.rtaxl002='"||g_dlang||"' ",
                     " LEFT JOIN oocql_t t5 ON t5.oocqlent='"||g_enterprise||"' AND t5.oocql001='2144' AND t5.oocql002=sthj006 AND t5.oocql003='"||g_dlang||"' ",
                     " LEFT JOIN mhbel_t t6 ON t6.mhbelent='"||g_enterprise||"' AND t6.mhbel001=sthj007 AND t6.mhbel002='"||g_dlang||"' ",
                     " WHERE sthjent = ?",
                     "   AND sthj001 = ?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         IF NOT cl_null(g_wc2_table3) THEN 
            LET g_sql = g_sql CLIPPED," AND ", g_wc2_table3 CLIPPED
         END IF 
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
            IF NOT cl_null(g_wc2_table2) THEN 
      LET g_sql = g_sql CLIPPED," AND ", g_wc2_table2 CLIPPED
   END IF 
 
         
         LET g_sql = g_sql, " ORDER BY sthj_t.sthjseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm252_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astm252_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sthi_m.sthi002   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sthi_m.sthi002 INTO g_sthj_d[l_ac].sthjseq,g_sthj_d[l_ac].sthj002, 
          g_sthj_d[l_ac].sthj003,g_sthj_d[l_ac].sthj004,g_sthj_d[l_ac].sthj005,g_sthj_d[l_ac].sthj006, 
          g_sthj_d[l_ac].sthj007,g_sthj_d[l_ac].sthj008,g_sthj_d[l_ac].sthj009,g_sthj_d[l_ac].sthj010, 
          g_sthj_d[l_ac].sthj011,g_sthj_d[l_ac].sthjsite,g_sthj_d[l_ac].sthjunit,g_sthj_d[l_ac].sthj002_desc, 
          g_sthj_d[l_ac].sthj003_desc,g_sthj_d[l_ac].sthj004_desc,g_sthj_d[l_ac].sthj005_desc,g_sthj_d[l_ac].sthj006_desc, 
          g_sthj_d[l_ac].sthj007_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         
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
   
   CALL g_sthj_d.deleteElement(g_sthj_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astm252_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sthj_d.getLength()
      LET g_sthj_d_mask_o[l_ac].* =  g_sthj_d[l_ac].*
      CALL astm252_sthj_t_mask()
      LET g_sthj_d_mask_n[l_ac].* =  g_sthj_d[l_ac].*
   END FOR
   
   LET g_sthj2_d_mask_o.* =  g_sthj2_d.*
   FOR l_ac = 1 TO g_sthj2_d.getLength()
      LET g_sthj2_d_mask_o[l_ac].* =  g_sthj2_d[l_ac].*
      CALL astm252_sthk_t_mask()
      LET g_sthj2_d_mask_n[l_ac].* =  g_sthj2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astm252_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM sthj_t
       WHERE sthjent = g_enterprise AND
         sthj001 = ps_keys_bak[1] AND sthjseq = ps_keys_bak[2]
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
         CALL g_sthj_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table2
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM sthk_t
       WHERE sthkent = g_enterprise AND
             sthk001 = ps_keys_bak[1] AND sthkseq = ps_keys_bak[2] AND sthkseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
    
      LET li_idx = g_detail_idx2
      IF ps_page <> "'2'" THEN 
         CALL g_sthj2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
   #add-point:delete_b段other name="delete_b.other"
   LET ls_group = "'3',"
   #判斷是否是同一群組的table3
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      DELETE FROM sthl_t
       WHERE sthlent = g_enterprise
         AND sthl001 = ps_keys_bak[1]
         AND sthlseq = ps_keys_bak[2]
         AND sthlseq1 = ps_keys_bak[3]
         AND sthlseq2 = ps_keys_bak[4]
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthl_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
    
      LET li_idx = g_detail_idx3
      IF ps_page <> "'3'" THEN 
         CALL g_sthj3_d.deleteElement(li_idx) 
      END IF
   END IF
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astm252_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO sthj_t
                  (sthjent,
                   sthj001,
                   sthjseq
                   ,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008,sthj009,sthj010,sthj011,sthjsite,sthjunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sthj_d[g_detail_idx].sthj002,g_sthj_d[g_detail_idx].sthj003,g_sthj_d[g_detail_idx].sthj004, 
                       g_sthj_d[g_detail_idx].sthj005,g_sthj_d[g_detail_idx].sthj006,g_sthj_d[g_detail_idx].sthj007, 
                       g_sthj_d[g_detail_idx].sthj008,g_sthj_d[g_detail_idx].sthj009,g_sthj_d[g_detail_idx].sthj010, 
                       g_sthj_d[g_detail_idx].sthj011,g_sthj_d[g_detail_idx].sthjsite,g_sthj_d[g_detail_idx].sthjunit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sthj_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO sthk_t
                  (sthkent,
                   sthk001,sthkseq,
                   sthkseq1
                   ,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007,sthk008,sthk009,sthk010,sthksite,sthkunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sthj2_d[g_detail_idx2].sthk002,g_sthj2_d[g_detail_idx2].sthk003,g_sthj2_d[g_detail_idx2].sthk004, 
                       g_sthj2_d[g_detail_idx2].sthk005,g_sthj2_d[g_detail_idx2].sthk006,g_sthj2_d[g_detail_idx2].sthk007, 
                       g_sthj2_d[g_detail_idx2].sthk008,g_sthj2_d[g_detail_idx2].sthk009,g_sthj2_d[g_detail_idx2].sthk010, 
                       g_sthj2_d[g_detail_idx2].sthksite,g_sthj2_d[g_detail_idx2].sthkunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx2
      IF ps_page <> "'2'" THEN 
         CALL g_sthj2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
   #add-point:insert_b段other name="insert_b.other"
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      INSERT INTO sthl_t(sthlent,  sthl001,  sthlseq, sthlseq1,
                         sthlseq2, sthl002,  sthl003, sthl004,
                         sthl005,  sthlsite, sthlunit)
         VALUES(g_enterprise, ps_keys[1], ps_keys[2], ps_keys[3], ps_keys[4],
                g_sthj3_d[g_detail_idx3].sthl002, g_sthj3_d[g_detail_idx3].sthl003,  g_sthj3_d[g_detail_idx3].sthl004,
                g_sthj3_d[g_detail_idx3].sthl005, g_sthj3_d[g_detail_idx3].sthlsite, g_sthj3_d[g_detail_idx3].sthlunit)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthl_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx3
      IF ps_page <> "'3'" THEN 
         CALL g_sthj3_d.insertElement(li_idx) 
      END IF
   END IF
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astm252_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthj_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astm252_sthj_t_mask_restore('restore_mask_o')
               
      UPDATE sthj_t 
         SET (sthj001,
              sthjseq
              ,sthj002,sthj003,sthj004,sthj005,sthj006,sthj007,sthj008,sthj009,sthj010,sthj011,sthjsite,sthjunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sthj_d[g_detail_idx].sthj002,g_sthj_d[g_detail_idx].sthj003,g_sthj_d[g_detail_idx].sthj004, 
                  g_sthj_d[g_detail_idx].sthj005,g_sthj_d[g_detail_idx].sthj006,g_sthj_d[g_detail_idx].sthj007, 
                  g_sthj_d[g_detail_idx].sthj008,g_sthj_d[g_detail_idx].sthj009,g_sthj_d[g_detail_idx].sthj010, 
                  g_sthj_d[g_detail_idx].sthj011,g_sthj_d[g_detail_idx].sthjsite,g_sthj_d[g_detail_idx].sthjunit)  
 
         WHERE sthjent = g_enterprise AND sthj001 = ps_keys_bak[1] AND sthjseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthj_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthj_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm252_sthj_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthk_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point
      
      #將遮罩欄位還原
      CALL astm252_sthk_t_mask_restore('restore_mask_o')
               
      UPDATE sthk_t 
         SET (sthk001,sthkseq,
              sthkseq1
              ,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007,sthk008,sthk009,sthk010,sthksite,sthkunit) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sthj2_d[g_detail_idx2].sthk002,g_sthj2_d[g_detail_idx2].sthk003,g_sthj2_d[g_detail_idx2].sthk004, 
                  g_sthj2_d[g_detail_idx2].sthk005,g_sthj2_d[g_detail_idx2].sthk006,g_sthj2_d[g_detail_idx2].sthk007, 
                  g_sthj2_d[g_detail_idx2].sthk008,g_sthj2_d[g_detail_idx2].sthk009,g_sthj2_d[g_detail_idx2].sthk010, 
                  g_sthj2_d[g_detail_idx2].sthksite,g_sthj2_d[g_detail_idx2].sthkunit) 
         WHERE sthkent = g_enterprise AND sthk001 = ps_keys_bak[1] AND sthkseq = ps_keys_bak[2] AND sthkseq1 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthk_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm252_sthk_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
   #add-point:update_b段other name="update_b.other"
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthl_t" THEN
      #將遮罩欄位還原
      CALL astm252_sthk_t_mask_restore('restore_mask_o')
      
      UPDATE sthl_t 
         SET (sthl001,  sthlseq, sthlseq1, sthlseq2,
              sthl002,  sthl003, sthl004,  sthl005,
              sthlsite, sthlunit)
           = (ps_keys[1], ps_keys[2], ps_keys[3], ps_keys[4],
              g_sthj3_d[g_detail_idx3].sthl002, g_sthj3_d[g_detail_idx3].sthl003,  g_sthj3_d[g_detail_idx3].sthl004,
              g_sthj3_d[g_detail_idx3].sthl005, g_sthj3_d[g_detail_idx3].sthlsite, g_sthj3_d[g_detail_idx3].sthlunit) 
        WHERE sthkent = g_enterprise
          AND sthk001 = ps_keys_bak[1]
          AND sthkseq = ps_keys_bak[2]
          AND sthkseq1 = ps_keys_bak[3]
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthl_t" 
            LET g_errparam.code   = "std-00009" 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthl_t:",SQLERRMESSAGE 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            CALL s_transaction_end('N','0')
         OTHERWISE
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm252_sthk_t_mask_restore('restore_mask_n')
               
   END IF
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astm252_key_update_b(ps_keys_bak,ps_table)
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
   
   #如果是上層單身則進行update
   IF ps_table = 'sthj_t' THEN
      #add-point:update_b段修改前 name="key_update_b.before_update2"
      
      #end add-point
      
      UPDATE sthk_t 
         SET (sthk001,sthkseq) 
              = 
             (g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq) 
         WHERE sthkent = g_enterprise AND
               sthk001 = ps_keys_bak[1] AND sthkseq = ps_keys_bak[2]
 
      #add-point:update_b段修改中 name="key_update_b.m_update2"
      
      #end add-point
              
      CASE
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
            #若有多語言table資料一同更新
            
      END CASE
      
      #add-point:update_b段修改後 name="key_update_b.after_update2"
      
      #end add-point
   END IF
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astm252_key_delete_b(ps_keys_bak,ps_table)
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
   
   #如果是上層單身則進行delete
   IF ps_table = 'sthj_t' THEN
      #add-point:delete_b段修改前 name="key_delete_b.before_delete2"
      
      #end add-point
      
      DELETE FROM sthk_t 
            WHERE sthkent = g_enterprise AND
                  sthk001 = ps_keys_bak[1] AND sthkseq = ps_keys_bak[2]
 
      #add-point:delete_b段修改中 name="key_delete_b.m_delete2"
      
      #end add-point
              
      CASE
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthk_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            RETURN FALSE
         OTHERWISE
      END CASE
 
       
 
      #add-point:delete_b段修改後 name="key_delete_b.after_delete2"
      
      #end add-point
   END IF
 
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astm252_lock_b(ps_table,ps_page)
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
   #CALL astm252_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sthj_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astm252_bcl USING g_enterprise,
                                       g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm252_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
 
   
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "sthk_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm252_bcl2 USING g_enterprise,
                                             g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq,
                                             g_sthj2_d[g_detail_idx2].sthkseq1
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm252_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
   #add-point:lock_b段other name="lock_b.other"
   #鎖定整組table
   #LET ls_group = "'3',"
   #僅鎖定自身table
   LET ls_group = "sthl_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astm252_bcl3
         USING g_enterprise, g_sthi_m.sthi002, g_sthj_d[g_detail_idx].sthjseq,
               g_sthj2_d[g_detail_idx2].sthkseq1, g_sthj3_d[g_detail_idx3].sthlseq2
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm252_bcl3:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astm252_unlock_b(ps_table,ps_page)
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
      CLOSE astm252_bcl
   END IF
   
 
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm252_bcl2
   END IF
 
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astm252_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sthi002",TRUE)
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astm252_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sthi002",FALSE)
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
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astm252_set_entry_b(p_cmd)
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
 
{<section id="astm252.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astm252_set_no_entry_b(p_cmd)
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
 
{<section id="astm252.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astm252_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify",TRUE)
   CALL cl_set_act_visible("modify_detail",TRUE)
   CALL cl_set_act_visible("delete",TRUE)
   CALL cl_set_act_visible("reproduce",TRUE)
   CALL cl_set_act_visible("insert",TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astm252_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:2)
   IF g_sthi_m.sthistus NOT MATCHES "[NDRE]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   CALL cl_set_act_visible("modify",FALSE)
   CALL cl_set_act_visible("modify_detail",FALSE)
   CALL cl_set_act_visible("delete",FALSE)
   CALL cl_set_act_visible("reproduce",FALSE)
   CALL cl_set_act_visible("insert",FALSE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astm252_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm252.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astm252_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm252.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astm252_default_search()
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
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " sthi002 = '", g_argv[02], "' AND "
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
               WHEN la_wc[li_idx].tableid = "sthi_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sthj_t" 
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
 
{<section id="astm252.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astm252_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_sthi_m.sthistus = 'E' OR g_sthi_m.sthistus = 'X' THEN
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sthi_m.sthi002 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astm252_cl USING g_enterprise,g_sthi_m.sthi002
   IF STATUS THEN
      CLOSE astm252_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm252_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002,g_sthi_m.sthi003, 
       g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008,g_sthi_m.sthi009, 
       g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp,g_sthi_m.sthicrtid, 
       g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
       g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc,g_sthi_m.sthi009_desc, 
       g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp_desc, 
       g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astm252_action_chk() THEN
      CLOSE astm252_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthisite_desc,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003, 
       g_sthi_m.sthi004,g_sthi_m.sthi004_desc,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
       g_sthi_m.sthi008_desc,g_sthi_m.sthi009,g_sthi_m.sthi009_desc,g_sthi_m.sthi001,g_sthi_m.sthiunit, 
       g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp,g_sthi_m.sthiowndp_desc, 
       g_sthi_m.sthicrtid,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdp_desc,g_sthi_m.sthicrtdt, 
       g_sthi_m.sthimodid,g_sthi_m.sthimodid_desc,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid,g_sthi_m.sthicnfid_desc, 
       g_sthi_m.sthicnfdt
 
   CASE g_sthi_m.sthistus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "E"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_sthi_m.sthistus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "E"
               HIDE OPTION "ended"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CASE g_sthi_m.sthistus
         WHEN "X"
            CALL cl_set_act_visible("unconfirmed",FALSE)
            CALL cl_set_act_visible("invalid",FALSE)
            CALL cl_set_act_visible("confirmed",FALSE)
            CALL cl_set_act_visible("ended",FALSE)
         WHEN "Y"
            CALL cl_set_act_visible("unconfirmed",FALSE)
            CALL cl_set_act_visible("invalid",FALSE)
            CALL cl_set_act_visible("confirmed",FALSE)
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
      ON ACTION ended
         IF cl_auth_chk_act("ended") THEN
            LET lc_state = "E"
            #add-point:action控制 name="statechange.ended"
            
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
      AND lc_state <> "E"
      AND lc_state <> "X"
      ) OR 
      g_sthi_m.sthistus = lc_state OR cl_null(lc_state) THEN
      CLOSE astm252_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_sthi_m.sthimodid = g_user
   LET g_sthi_m.sthimoddt = cl_get_current()
   LET g_sthi_m.sthistus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sthi_t 
      SET (sthistus,sthimodid,sthimoddt) 
        = (g_sthi_m.sthistus,g_sthi_m.sthimodid,g_sthi_m.sthimoddt)     
    WHERE sthient = g_enterprise AND sthi002 = g_sthi_m.sthi002
 
    
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
         WHEN "E"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/ended.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astm252_master_referesh USING g_sthi_m.sthi002 INTO g_sthi_m.sthisite,g_sthi_m.sthi002, 
          g_sthi_m.sthi003,g_sthi_m.sthi004,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007,g_sthi_m.sthi008, 
          g_sthi_m.sthi009,g_sthi_m.sthi001,g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiowndp, 
          g_sthi_m.sthicrtid,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimoddt, 
          g_sthi_m.sthicnfid,g_sthi_m.sthicnfdt,g_sthi_m.sthisite_desc,g_sthi_m.sthi004_desc,g_sthi_m.sthi008_desc, 
          g_sthi_m.sthi009_desc,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid_desc, 
          g_sthi_m.sthicrtdp_desc,g_sthi_m.sthimodid_desc,g_sthi_m.sthicnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sthi_m.sthisite,g_sthi_m.sthisite_desc,g_sthi_m.sthi002,g_sthi_m.sthi003,g_sthi_m.sthil003, 
          g_sthi_m.sthi004,g_sthi_m.sthi004_desc,g_sthi_m.sthi005,g_sthi_m.sthi006,g_sthi_m.sthi007, 
          g_sthi_m.sthi008,g_sthi_m.sthi008_desc,g_sthi_m.sthi009,g_sthi_m.sthi009_desc,g_sthi_m.sthi001, 
          g_sthi_m.sthiunit,g_sthi_m.sthistus,g_sthi_m.sthiownid,g_sthi_m.sthiownid_desc,g_sthi_m.sthiowndp, 
          g_sthi_m.sthiowndp_desc,g_sthi_m.sthicrtid,g_sthi_m.sthicrtid_desc,g_sthi_m.sthicrtdp,g_sthi_m.sthicrtdp_desc, 
          g_sthi_m.sthicrtdt,g_sthi_m.sthimodid,g_sthi_m.sthimodid_desc,g_sthi_m.sthimoddt,g_sthi_m.sthicnfid, 
          g_sthi_m.sthicnfid_desc,g_sthi_m.sthicnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astm252_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm252_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm252.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astm252_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sthj_d.getLength() THEN
         LET g_detail_idx = g_sthj_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sthj_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sthj_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx2 = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx2 > g_sthj2_d.getLength() THEN
         LET g_detail_idx2 = g_sthj2_d.getLength()
      END IF
      IF g_detail_idx2 = 0 AND g_sthj2_d.getLength() <> 0 THEN
         LET g_detail_idx2 = 1
      END IF
      DISPLAY g_detail_idx2 TO FORMONLY.idx
      DISPLAY g_sthj2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   IF g_current_page = 3 THEN
      LET g_detail_idx3 = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx3 > g_sthj3_d.getLength() THEN
         LET g_detail_idx3 = g_sthj3_d.getLength()
      END IF
      IF g_detail_idx3 = 0 AND g_sthj3_d.getLength() <> 0 THEN
         LET g_detail_idx3 = 1
      END IF
      DISPLAY g_detail_idx3 TO FORMONLY.idx
      DISPLAY g_sthj3_d.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astm252_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   DEFINE l_idx                  LIKE type_t.num10
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
   IF astm252_fill_chk(2) THEN
      IF (pi_idx = 2 OR pi_idx = 0 ) AND g_sthj_d.getLength() > 0 THEN
               CALL g_sthj2_d.clear()
 
         
         #取得該單身上階單身的idx
         LET g_detail_idx = g_detail_idx_list[1]
         
         LET g_sql = "SELECT  DISTINCT sthkseq1,sthk002,sthk003,sthk004,sthk005,sthk006,sthk007,sthk008, 
             sthk009,sthk010,sthksite,sthkunit  FROM sthk_t",    
                     "",
                     
                     " WHERE sthkent=? AND sthk001=? AND sthkseq=?"
         
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  sthk_t.sthkseq1" 
                            
         #add-point:單身填充前 name="b_fill2.before_fill2"
         
         #end add-point
         
         #先清空資料
               CALL g_sthj2_d.clear()
 
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm252_pb2 FROM g_sql
         DECLARE b_fill_curs2 CURSOR FOR astm252_pb2
         
      #  OPEN b_fill_curs2 USING g_enterprise,g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq   #(ver:78) 
 
         LET l_ac = 1
         FOREACH b_fill_curs2 USING g_enterprise,g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq INTO g_sthj2_d[l_ac].sthkseq1, 
             g_sthj2_d[l_ac].sthk002,g_sthj2_d[l_ac].sthk003,g_sthj2_d[l_ac].sthk004,g_sthj2_d[l_ac].sthk005, 
             g_sthj2_d[l_ac].sthk006,g_sthj2_d[l_ac].sthk007,g_sthj2_d[l_ac].sthk008,g_sthj2_d[l_ac].sthk009, 
             g_sthj2_d[l_ac].sthk010,g_sthj2_d[l_ac].sthksite,g_sthj2_d[l_ac].sthkunit   #(ver:78)
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            #add-point:b_fill段資料填充 name="b_fill2.fill2"
            
            #end add-point
           
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            LET l_ac = l_ac + 1
            
         END FOREACH
               CALL g_sthj2_d.deleteElement(g_sthj2_d.getLength())
 
      END IF
   END IF
 
 
      
   LET g_sthj2_d_mask_o.* =  g_sthj2_d.*
   FOR l_ac = 1 TO g_sthj2_d.getLength()
      LET g_sthj2_d_mask_o[l_ac].* =  g_sthj2_d[l_ac].*
      CALL astm252_sthk_t_mask()
      LET g_sthj2_d_mask_n[l_ac].* =  g_sthj2_d[l_ac].*
   END FOR
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   LET l_idx = pi_idx
   IF l_idx = 2 THEN
      LET l_idx = 3
   END IF
   CALL astm252_b_fill3(l_idx)
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astm252_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astm252_fill_chk(ps_idx)
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
 
{<section id="astm252.status_show" >}
PRIVATE FUNCTION astm252_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astm252.mask_functions" >}
&include "erp/ast/astm252_mask.4gl"
 
{</section>}
 
{<section id="astm252.signature" >}
   
 
{</section>}
 
{<section id="astm252.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astm252_set_pk_array()
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
   LET g_pk_array[1].values = g_sthi_m.sthi002
   LET g_pk_array[1].column = 'sthi002'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm252.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astm252.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astm252_msgcentre_notify(lc_state)
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
   CALL astm252_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sthi_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm252.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astm252_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm252.other_function" readonly="Y" >}

PRIVATE FUNCTION astm252_b_fill3(pi_idx)
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   
   LET li_ac = l_ac 
   
   IF g_detail_idx2 <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx2
   
   IF astm252_fill_chk(3) THEN
      IF (pi_idx = 3 OR pi_idx = 0 ) AND g_sthj2_d.getLength() > 0 THEN
         CALL g_sthj3_d.clear()
         #取得該單身上階單身的idx
         LET g_detail_idx2 = g_detail_idx_list[1]
         
#         LET g_sql = "SELECT DISTINCT sthlseq2, sthl002,  sthl003, sthl004",    #161207-00059#1 by 08172
         LET g_sql = "SELECT DISTINCT sthlseq2, sthl002,  sthl003, sthl004,",    #161207-00059#1 by 08172
                     "                sthl005,  sthlsite, sthlunit",
                     "  FROM sthl_t", 
                     " WHERE sthlent = ?",
                     "   AND sthl001 = ?",
                     "   AND sthlseq = ?",
                     "   AND sthlseq1 = ?"
         IF NOT cl_null(g_wc2_table3) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table3 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  sthl_t.sthlseq2" 
         
         #先清空資料
         CALL g_sthj3_d.clear()
 
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm252_pb3 FROM g_sql
         DECLARE b_fill_curs3 CURSOR FOR astm252_pb3
         
         OPEN b_fill_curs3 USING g_enterprise,g_sthi_m.sthi002,g_sthj_d[g_detail_idx].sthjseq,g_sthj2_d[g_detail_idx2].sthkseq1
         LET l_ac = 1
         FOREACH b_fill_curs3
            INTO g_sthj3_d[l_ac].sthlseq2, g_sthj3_d[l_ac].sthl002, g_sthj3_d[l_ac].sthl003, 
                 g_sthj3_d[l_ac].sthl004,  g_sthj3_d[l_ac].sthl005, g_sthj3_d[l_ac].sthlsite, 
                 g_sthj3_d[l_ac].sthlunit 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
           
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code   = 9035 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            LET l_ac = l_ac + 1
            
         END FOREACH
         CALL g_sthj3_d.deleteElement(g_sthj3_d.getLength())
      END IF
   END IF
 
 
      
   LET g_sthj3_d_mask_o.* =  g_sthj3_d.*
   FOR l_ac = 1 TO g_sthj3_d.getLength()
      LET g_sthj3_d_mask_o[l_ac].* =  g_sthj3_d[l_ac].*
      #CALL astm252_sthl_t_mask()
      LET g_sthj3_d_mask_n[l_ac].* =  g_sthj3_d[l_ac].*
   END FOR
    
   LET l_ac = li_ac
   
   CALL astm252_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION

################################################################################
# Descriptions...: 欄位顯示
# Memo...........:
# Usage..........: CALL astm252_comp_visible()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/03/25 By pomelo
# Modify.........:
################################################################################
PRIVATE FUNCTION astm252_comp_visible()

   #樓棟
   CALL cl_set_comp_visible("sthj002",TRUE)
   CALL cl_set_comp_visible("sthj002_desc",TRUE)
   #樓層
   CALL cl_set_comp_visible("sthj003",TRUE)
   CALL cl_set_comp_visible("sthj003_desc",TRUE)
   #區域
   CALL cl_set_comp_visible("sthj004",TRUE)
   CALL cl_set_comp_visible("sthj004_desc",TRUE)
   #品類
   CALL cl_set_comp_visible("sthj005",TRUE)
   CALL cl_set_comp_visible("sthj005_desc",TRUE)
   #160512-00003#17 20160526 add (sthc006) by beckxie---S
   CALL cl_set_comp_visible("sthj006",TRUE)
   CALL cl_set_comp_visible("sthj006_desc",TRUE)
   #160512-00003#17 20160526 add (sthc006) by beckxie---E
   #分量設定頁籤
   CALL cl_set_comp_visible("bpage_3",TRUE)
   
END FUNCTION

################################################################################
# Descriptions...: 欄位隱藏
# Memo...........:
# Usage..........: CALL astm252_comp_no_visible(p_type)
# Input parameter: p_type        1.固定 2.變動
# Return code....: 無
# Date & Author..: 2016/03/25 By pomelo
# Modify.........:
################################################################################
PRIVATE FUNCTION astm252_comp_no_visible(p_type)
DEFINE p_type            LIKE type_t.chr1
DEFINE l_sthc            RECORD
       sthc002           LIKE sthc_t.sthc002,   #按樓棟設定
       sthc003           LIKE sthc_t.sthc003,   #按樓層設定
       sthc004           LIKE sthc_t.sthc004,   #按區域設定
       sthc005           LIKE sthc_t.sthc005,   #按品類設定
       sthc006           LIKE sthc_t.sthc006    #按鋪位用途設定   #160512-00003#17 20160526 add (sthc006) by beckxie
                         END RECORD
                         
   IF g_argv[01] = '1' THEN
      CALL cl_set_comp_visible("sthj007",FALSE)
      CALL cl_set_comp_visible("sthj007_desc",FALSE)
   END IF
   
   IF p_type = '2' THEN
      INITIALIZE l_sthc.* TO NULL
      #160512-00003#17 20160526 add (sthc006) by beckxie---S
      SELECT sthc002, sthc003, sthc004, sthc005 ,sthc006 
        INTO l_sthc.sthc002, l_sthc.sthc003, l_sthc.sthc004, l_sthc.sthc005,l_sthc.sthc006
      #160512-00003#17 20160526 add (sthc006) by beckxie---E
        FROM sthc_t
       WHERE sthcent = g_enterprise
         AND sthcsite = g_sthi_m.sthisite
         AND sthc001 = g_sthi_m.sthi004
      
      #按樓棟設定
      IF l_sthc.sthc002 = 'N' OR cl_null(l_sthc.sthc002) THEN
         CALL cl_set_comp_visible("sthj002",FALSE)
         CALL cl_set_comp_visible("sthj002_desc",FALSE)
      END IF
      
      #按樓層設定
      IF l_sthc.sthc003 = 'N' OR cl_null(l_sthc.sthc003) THEN
         CALL cl_set_comp_visible("sthj003",FALSE)
         CALL cl_set_comp_visible("sthj003_desc",FALSE)
      END IF
      
      #按區域設定
      IF l_sthc.sthc004 = 'N' OR cl_null(l_sthc.sthc004) THEN
         CALL cl_set_comp_visible("sthj004",FALSE)
         CALL cl_set_comp_visible("sthj004_desc",FALSE)
      END IF
      
      #按品類設定
      IF l_sthc.sthc005 = 'N' OR cl_null(l_sthc.sthc005) THEN
         CALL cl_set_comp_visible("sthj005",FALSE)
         CALL cl_set_comp_visible("sthj005_desc",FALSE)
      END IF
      #160512-00003#17 20160526 add (sthc006) by beckxie---S
      #按鋪位用途設定
      IF l_sthc.sthc006 = 'N' OR cl_null(l_sthc.sthc006) THEN
         CALL cl_set_comp_visible("sthj006",FALSE)
         CALL cl_set_comp_visible("sthj006_desc",FALSE)
      END IF
      #160512-00003#17 20160526 add (sthc006) by beckxie---E
      #分量設定頁籤
      IF g_sthj2_d[g_detail_idx2].sthk010 = '1' THEN
         CALL cl_set_comp_visible("bpage_3",FALSE)
      END IF
   END IF
END FUNCTION

 
{</section>}
 
