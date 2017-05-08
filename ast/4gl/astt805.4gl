#該程式未解開Section, 採用最新樣板產出!
{<section id="astt805.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-08-24 14:36:57), PR版次:0009(2017-02-13 17:55:52)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000039
#+ Filename...: astt805
#+ Description: 招商租賃合約終止申請作業
#+ Creator....: 03247(2016-04-14 11:26:07)
#+ Modifier...: 06189 -SD/PR- 06189
 
{</section>}
 
{<section id="astt805.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160421-00013#8  2016/04/22  by 08172  面积显示规格调整
#160324-00008#14 2016/05/05  by 06189     添加审核产生astt801的逻辑
#160324-00008#16 2016/05/06  by 08172     合同开窗和检查修改
#160512-00003#4  2016/05/16  by dongsz    收付实现制判断修改
#160512-00003#5  20160516    by 01689     终止变更，如果清退日期+1天开始的账单有产生费用单，也不允许变更，提示
#160604-00009#39 2016/06/14  By dongsz    收付实现制和权责发生制的费用都可以退
#160604-00009#49 2016/06/17  By dongsz    1~6状态的合同都可以维护
#160816-00068#16 2016/08/19  By 08209     調整transaction
#160818-00017#41 2016-08-25  By 08734     删除修改未重新判断状态码
#170117-00025#2  2017/02/13  by 06189     新增BPM集成功
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
PRIVATE type type_g_stem_m        RECORD
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
   stem024 LIKE stem_t.stem024, 
   stem025 LIKE stem_t.stem025, 
   stem026 LIKE stem_t.stem026, 
   stem027 LIKE stem_t.stem027, 
   stem028 LIKE stem_t.stem028, 
   stem029 LIKE stem_t.stem029, 
   stem029_desc LIKE type_t.chr80, 
   stem030 LIKE stem_t.stem030, 
   stem031 LIKE stem_t.stem031, 
   stem032 LIKE stem_t.stem032, 
   stem033 LIKE stem_t.stem033, 
   stem012 LIKE stem_t.stem012, 
   stem012_desc LIKE type_t.chr80, 
   stem013 LIKE stem_t.stem013, 
   stem013_desc LIKE type_t.chr80, 
   stem034 LIKE stem_t.stem034, 
   stemunit LIKE stem_t.stemunit, 
   stem000 LIKE stem_t.stem000, 
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
 
#單身 type 宣告
PRIVATE TYPE type_g_stjc_d        RECORD
       stjcseq LIKE stjc_t.stjcseq, 
   stjc002 LIKE stjc_t.stjc002, 
   stjc002_desc LIKE type_t.chr500, 
   stae004 LIKE stae_t.stae004, 
   stjc003 LIKE stjc_t.stjc003, 
   stjc004 LIKE stjc_t.stjc004, 
   stjc005 LIKE stjc_t.stjc005, 
   stjc006 LIKE stjc_t.stjc006, 
   stjc001 LIKE stjc_t.stjc001, 
   stjcsite LIKE stjc_t.stjcsite, 
   stjcunit LIKE stjc_t.stjcunit
       END RECORD
PRIVATE TYPE type_g_stjc2_d RECORD
       stjd002 LIKE stjd_t.stjd002, 
   stjdseq LIKE stjd_t.stjdseq, 
   stjd003 LIKE stjd_t.stjd003, 
   stjd003_desc LIKE type_t.chr500, 
   stae004 LIKE stae_t.stae004, 
   stjd004 LIKE stjd_t.stjd004, 
   stjd001 LIKE stjd_t.stjd001, 
   stjdsite LIKE stjd_t.stjdsite, 
   stjdunit LIKE stjd_t.stjdunit
       END RECORD
PRIVATE TYPE type_g_stjc3_d RECORD
       l_stjd002 LIKE type_t.chr10, 
   l_stjdseq LIKE type_t.num10, 
   l_stjd003 LIKE type_t.chr10, 
   stjd003_desc_1 LIKE type_t.chr500, 
   stae004 LIKE stae_t.stae004, 
   l_stjd004 LIKE type_t.num20_6, 
   l_stjd001 LIKE type_t.chr20, 
   l_stjdsite LIKE type_t.chr10, 
   l_stjdunit LIKE type_t.chr10
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stemsite LIKE stem_t.stemsite,
   b_stemsite_desc LIKE type_t.chr80,
      b_stemdocdt LIKE stem_t.stemdocdt,
      b_stemdocno LIKE stem_t.stemdocno,
      b_stem001 LIKE stem_t.stem001,
      b_stem024 LIKE stem_t.stem024,
      b_stem025 LIKE stem_t.stem025,
      b_stem026 LIKE stem_t.stem026,
      b_stem012 LIKE stem_t.stem012,
   b_stem012_desc LIKE type_t.chr80,
      b_stem013 LIKE stem_t.stem013,
   b_stem013_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag           LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stem_m          type_g_stem_m
DEFINE g_stem_m_t        type_g_stem_m
DEFINE g_stem_m_o        type_g_stem_m
DEFINE g_stem_m_mask_o   type_g_stem_m #轉換遮罩前資料
DEFINE g_stem_m_mask_n   type_g_stem_m #轉換遮罩後資料
 
   DEFINE g_stemdocno_t LIKE stem_t.stemdocno
 
 
DEFINE g_stjc_d          DYNAMIC ARRAY OF type_g_stjc_d
DEFINE g_stjc_d_t        type_g_stjc_d
DEFINE g_stjc_d_o        type_g_stjc_d
DEFINE g_stjc_d_mask_o   DYNAMIC ARRAY OF type_g_stjc_d #轉換遮罩前資料
DEFINE g_stjc_d_mask_n   DYNAMIC ARRAY OF type_g_stjc_d #轉換遮罩後資料
DEFINE g_stjc2_d          DYNAMIC ARRAY OF type_g_stjc2_d
DEFINE g_stjc2_d_t        type_g_stjc2_d
DEFINE g_stjc2_d_o        type_g_stjc2_d
DEFINE g_stjc2_d_mask_o   DYNAMIC ARRAY OF type_g_stjc2_d #轉換遮罩前資料
DEFINE g_stjc2_d_mask_n   DYNAMIC ARRAY OF type_g_stjc2_d #轉換遮罩後資料
DEFINE g_stjc3_d          DYNAMIC ARRAY OF type_g_stjc3_d
DEFINE g_stjc3_d_t        type_g_stjc3_d
DEFINE g_stjc3_d_o        type_g_stjc3_d
DEFINE g_stjc3_d_mask_o   DYNAMIC ARRAY OF type_g_stjc3_d #轉換遮罩前資料
DEFINE g_stjc3_d_mask_n   DYNAMIC ARRAY OF type_g_stjc3_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
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
 
{<section id="astt805.main" >}
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
       stem005,'',stem004,'',stem006,stem017,stem007,stem009,stem010,stem011,stem024,stem025,stem026, 
       stem027,stem028,stem029,'',stem030,stem031,stem032,stem033,stem012,'',stem013,'',stem034,stemunit, 
       stem000,stemstus,stemownid,'',stemowndp,'',stemcrtid,'',stemcrtdp,'',stemcrtdt,stemmodid,'',stemmoddt, 
       stemcnfid,'',stemcnfdt", 
                      " FROM stem_t",
                      " WHERE stement= ? AND stemdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt805_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem016,t0.stem002, 
       t0.stem003,t0.stem005,t0.stem004,t0.stem006,t0.stem017,t0.stem007,t0.stem009,t0.stem010,t0.stem011, 
       t0.stem024,t0.stem025,t0.stem026,t0.stem027,t0.stem028,t0.stem029,t0.stem030,t0.stem031,t0.stem032, 
       t0.stem033,t0.stem012,t0.stem013,t0.stem034,t0.stemunit,t0.stem000,t0.stemstus,t0.stemownid,t0.stemowndp, 
       t0.stemcrtid,t0.stemcrtdp,t0.stemcrtdt,t0.stemmodid,t0.stemmoddt,t0.stemcnfid,t0.stemcnfdt,t1.ooefl003 , 
       t2.mhbel003 ,t3.pmaal004 ,t4.rtaxl003 ,t5.oocql004 ,t6.stael003 ,t7.ooag011 ,t8.ooefl003 ,t9.ooag011 , 
       t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 ,t13.ooag011 ,t14.ooag011",
               " FROM stem_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stemsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t2 ON t2.mhbelent="||g_enterprise||" AND t2.mhbel001=t0.stem002 AND t2.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stem003 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=t0.stem005 AND t4.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2002' AND t5.oocql002=t0.stem004 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN stael_t t6 ON t6.staelent="||g_enterprise||" AND t6.stael001=t0.stem029 AND t6.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.stem012  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stem013 AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stemownid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stemowndp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stemcrtid  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stemcrtdp AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stemmodid  ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.stemcnfid  ",
 
               " WHERE t0.stement = " ||g_enterprise|| " AND t0.stemdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt805_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt805 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt805_init()   
 
      #進入選單 Menu (="N")
      CALL astt805_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt805
      
   END IF 
   
   CLOSE astt805_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt805.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt805_init()
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
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stemstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stem024','6923') 
   CALL cl_set_combo_scc('stem026','6924') 
   CALL cl_set_combo_scc('stjc004','6915') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2','3',","1")
   CALL g_idx_group.addAttribute("","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('stae004_1','6004')
   CALL cl_set_combo_scc('stae004_2','6004')
   CALL cl_set_combo_scc('stae004_3','6004')
   CALL cl_set_combo_scc_part('stjc004','6915','1,2') 
   CALL s_aooi500_create_temp() RETURNING l_success
   #160421-00013#8
   CALL s_asti800_set_comp_format("stem006",g_stem_m.stemsite,'2')
   CALL s_asti800_set_comp_format("stem017",g_stem_m.stemsite,'2')
   CALL s_asti800_set_comp_format("stem007",g_stem_m.stemsite,'2')
   #end add-point
   
   #初始化搜尋條件
   CALL astt805_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt805.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt805_ui_dialog()
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
            CALL astt805_insert()
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
         INITIALIZE g_stem_m.* TO NULL
         CALL g_stjc_d.clear()
         CALL g_stjc2_d.clear()
         CALL g_stjc3_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt805_init()
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
               
               CALL astt805_fetch('') # reload data
               LET l_ac = 1
               CALL astt805_ui_detailshow() #Setting the current row 
         
               CALL astt805_idx_chk()
               #NEXT FIELD stjcseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stjc_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt805_idx_chk()
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
               CALL astt805_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stjc2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt805_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2','3',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2','3',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astt805_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_stjc3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt805_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("",l_ac)
               
               #add-point:page3, before row動作 name="ui_dialog.body3.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 3
               #顯示單身筆數
               CALL astt805_idx_chk()
               #add-point:page3自定義行為 name="ui_dialog.body3.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_3)
            
         
            #add-point:page3自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt805_browser_fill("")
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
               CALL astt805_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt805_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt805_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt805_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt805_set_act_visible()   
            CALL astt805_set_act_no_visible()
            IF NOT (g_stem_m.stemdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                                  " stemdocno = '", g_stem_m.stemdocno, "' "
 
               #填到對應位置
               CALL astt805_browser_fill("")
            END IF
         #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
          
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
                     WHEN la_wc[li_idx].tableid = "stem_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stjc_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stjd_t" 
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
               CALL astt805_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
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
                     WHEN la_wc[li_idx].tableid = "stem_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stjc_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stjd_t" 
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
                  CALL astt805_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt805_fetch("F")
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
               CALL astt805_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt805_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt805_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt805_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt805_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt805_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt805_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt805_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt805_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt805_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt805_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stjc_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stjc2_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_stjc3_d)
                  LET g_export_id[3]   = "s_detail3"
 
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
               NEXT FIELD stjcseq
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
               CALL astt805_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt805_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION astt805_update
            LET g_action_choice="astt805_update"
            IF cl_auth_chk_act("astt805_update") THEN
               
               #add-point:ON ACTION astt805_update name="menu.astt805_update"
               IF g_stem_m.stemstus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "aap-00324" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt805_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt805_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt805_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt805_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt805_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt805_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt805_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt805_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stem_m.stemdocdt)
 
 
 
         
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
 
{<section id="astt805.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt805_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stemsite') RETURNING l_where
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
      LET l_sub_sql = " SELECT DISTINCT stemdocno ",
                      " FROM stem_t ",
                      " ",
                      " LEFT JOIN stjc_t ON stjcent = stement AND stemdocno = stjcdocno ", "  ",
                      #add-point:browser_fill段sql(stjc_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stjd_t ON stjdent = stement AND stemdocno = stjddocno", "  ",
                      #add-point:browser_fill段sql(stjd_t1) name="browser_fill.cnt.join.stjd_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stement = " ||g_enterprise|| " AND stjcent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stem_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stemdocno ",
                      " FROM stem_t ", 
                      "  ",
                      "  ",
                      " WHERE stement = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stem_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   LET l_sub_sql = l_sub_sql," AND ",l_where," AND stem000 = '",g_prog,"' "
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
      INITIALIZE g_stem_m.* TO NULL
      CALL g_stjc_d.clear()        
      CALL g_stjc2_d.clear() 
      CALL g_stjc3_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem024,t0.stem025,t0.stem026,t0.stem012,t0.stem013 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stemstus,t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem024, 
          t0.stem025,t0.stem026,t0.stem012,t0.stem013,t1.ooefl003 ,t2.ooag011 ,t3.ooefl003 ",
                  " FROM stem_t t0",
                  "  ",
                  "  LEFT JOIN stjc_t ON stjcent = stement AND stemdocno = stjcdocno ", "  ", 
                  #add-point:browser_fill段sql(stjc_t1) name="browser_fill.join.stjc_t1"
                  
                  #end add-point
                  "  LEFT JOIN stjd_t ON stjdent = stement AND stemdocno = stjddocno", "  ", 
                  #add-point:browser_fill段sql(stjd_t1) name="browser_fill.join.stjd_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stemsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.stem012  ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stem013 AND t3.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stement = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stem_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stemstus,t0.stemsite,t0.stemdocdt,t0.stemdocno,t0.stem001,t0.stem024, 
          t0.stem025,t0.stem026,t0.stem012,t0.stem013,t1.ooefl003 ,t2.ooag011 ,t3.ooefl003 ",
                  " FROM stem_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stemsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.stem012  ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stem013 AND t3.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stement = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stem_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql," AND ",l_where," AND stem000 = '",g_prog,"' "
   #end add-point
   LET g_sql = g_sql, " ORDER BY stemdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stem_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stemsite,g_browser[g_cnt].b_stemdocdt, 
          g_browser[g_cnt].b_stemdocno,g_browser[g_cnt].b_stem001,g_browser[g_cnt].b_stem024,g_browser[g_cnt].b_stem025, 
          g_browser[g_cnt].b_stem026,g_browser[g_cnt].b_stem012,g_browser[g_cnt].b_stem013,g_browser[g_cnt].b_stemsite_desc, 
          g_browser[g_cnt].b_stem012_desc,g_browser[g_cnt].b_stem013_desc
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
         CALL astt805_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stemdocno) THEN
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
 
{<section id="astt805.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt805_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stem_m.stemdocno = g_browser[g_current_idx].b_stemdocno   
 
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
   CALL astt805_stem_t_mask()
   CALL astt805_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt805.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt805_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt805_ui_browser_refresh()
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
      IF g_browser[l_i].b_stemdocno = g_stem_m.stemdocno 
 
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
 
{<section id="astt805.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt805_construct()
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
   DEFINE l_rtax004   LIKE rtax_t.rtax004
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stem_m.* TO NULL
   CALL g_stjc_d.clear()        
   CALL g_stjc2_d.clear() 
   CALL g_stjc3_d.clear() 
 
   
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
      CONSTRUCT BY NAME g_wc ON stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003,stem005, 
          stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem024,stem025,stem026,stem027,stem028, 
          stem029,stem030,stem031,stem032,stem033,stem012,stem013,stem034,stemunit,stem000,stemstus, 
          stemownid,stemowndp,stemcrtid,stemcrtdp,stemcrtdt,stemmodid,stemmoddt,stemcnfid,stemcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
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
 
 
 
            
         #一般欄位開窗相關處理    
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
            #LET g_qryparam.where = " stjesite = '",g_stem_m.stemsite,"' AND stje005 IN ('2','3','4','5') "  #160324-00008#16 by 08172  #160604-00009#49 dongsz mark
            LET g_qryparam.where = " stjesite = '",g_site,"' "    #160604-00009#49 dongsz add
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
         BEFORE FIELD stem024
            #add-point:BEFORE FIELD stem024 name="construct.b.stem024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem024
            
            #add-point:AFTER FIELD stem024 name="construct.a.stem024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem024
            #add-point:ON ACTION controlp INFIELD stem024 name="construct.c.stem024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem025
            #add-point:BEFORE FIELD stem025 name="construct.b.stem025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem025
            
            #add-point:AFTER FIELD stem025 name="construct.a.stem025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem025
            #add-point:ON ACTION controlp INFIELD stem025 name="construct.c.stem025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem026
            #add-point:BEFORE FIELD stem026 name="construct.b.stem026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem026
            
            #add-point:AFTER FIELD stem026 name="construct.a.stem026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem026
            #add-point:ON ACTION controlp INFIELD stem026 name="construct.c.stem026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem027
            #add-point:BEFORE FIELD stem027 name="construct.b.stem027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem027
            
            #add-point:AFTER FIELD stem027 name="construct.a.stem027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem027
            #add-point:ON ACTION controlp INFIELD stem027 name="construct.c.stem027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem028
            #add-point:BEFORE FIELD stem028 name="construct.b.stem028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem028
            
            #add-point:AFTER FIELD stem028 name="construct.a.stem028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem028
            #add-point:ON ACTION controlp INFIELD stem028 name="construct.c.stem028"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stem029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem029
            #add-point:ON ACTION controlp INFIELD stem029 name="construct.c.stem029"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stem029  #顯示到畫面上
            NEXT FIELD stem029                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem029
            #add-point:BEFORE FIELD stem029 name="construct.b.stem029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem029
            
            #add-point:AFTER FIELD stem029 name="construct.a.stem029"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem030
            #add-point:BEFORE FIELD stem030 name="construct.b.stem030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem030
            
            #add-point:AFTER FIELD stem030 name="construct.a.stem030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem030
            #add-point:ON ACTION controlp INFIELD stem030 name="construct.c.stem030"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem031
            #add-point:BEFORE FIELD stem031 name="construct.b.stem031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem031
            
            #add-point:AFTER FIELD stem031 name="construct.a.stem031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem031
            #add-point:ON ACTION controlp INFIELD stem031 name="construct.c.stem031"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem032
            #add-point:BEFORE FIELD stem032 name="construct.b.stem032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem032
            
            #add-point:AFTER FIELD stem032 name="construct.a.stem032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem032
            #add-point:ON ACTION controlp INFIELD stem032 name="construct.c.stem032"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem033
            #add-point:BEFORE FIELD stem033 name="construct.b.stem033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem033
            
            #add-point:AFTER FIELD stem033 name="construct.a.stem033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stem033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem033
            #add-point:ON ACTION controlp INFIELD stem033 name="construct.c.stem033"
            
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
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stjcseq,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001,stjcsite,stjcunit 
 
           FROM s_detail1[1].stjcseq,s_detail1[1].stjc002,s_detail1[1].stjc003,s_detail1[1].stjc004, 
               s_detail1[1].stjc005,s_detail1[1].stjc006,s_detail1[1].stjc001,s_detail1[1].stjcsite, 
               s_detail1[1].stjcunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcseq
            #add-point:BEFORE FIELD stjcseq name="construct.b.page1.stjcseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcseq
            
            #add-point:AFTER FIELD stjcseq name="construct.a.page1.stjcseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcseq
            #add-point:ON ACTION controlp INFIELD stjcseq name="construct.c.page1.stjcseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stjc002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc002
            #add-point:ON ACTION controlp INFIELD stjc002 name="construct.c.page1.stjc002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stjc002  #顯示到畫面上
            NEXT FIELD stjc002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc002
            #add-point:BEFORE FIELD stjc002 name="construct.b.page1.stjc002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc002
            
            #add-point:AFTER FIELD stjc002 name="construct.a.page1.stjc002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjc003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc003
            #add-point:ON ACTION controlp INFIELD stjc003 name="construct.c.page1.stjc003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stha001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stjc003  #顯示到畫面上
            NEXT FIELD stjc003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc003
            #add-point:BEFORE FIELD stjc003 name="construct.b.page1.stjc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc003
            
            #add-point:AFTER FIELD stjc003 name="construct.a.page1.stjc003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc004
            #add-point:BEFORE FIELD stjc004 name="construct.b.page1.stjc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc004
            
            #add-point:AFTER FIELD stjc004 name="construct.a.page1.stjc004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc004
            #add-point:ON ACTION controlp INFIELD stjc004 name="construct.c.page1.stjc004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc005
            #add-point:BEFORE FIELD stjc005 name="construct.b.page1.stjc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc005
            
            #add-point:AFTER FIELD stjc005 name="construct.a.page1.stjc005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc005
            #add-point:ON ACTION controlp INFIELD stjc005 name="construct.c.page1.stjc005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc006
            #add-point:BEFORE FIELD stjc006 name="construct.b.page1.stjc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc006
            
            #add-point:AFTER FIELD stjc006 name="construct.a.page1.stjc006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc006
            #add-point:ON ACTION controlp INFIELD stjc006 name="construct.c.page1.stjc006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc001
            #add-point:BEFORE FIELD stjc001 name="construct.b.page1.stjc001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc001
            
            #add-point:AFTER FIELD stjc001 name="construct.a.page1.stjc001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjc001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc001
            #add-point:ON ACTION controlp INFIELD stjc001 name="construct.c.page1.stjc001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcsite
            #add-point:BEFORE FIELD stjcsite name="construct.b.page1.stjcsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcsite
            
            #add-point:AFTER FIELD stjcsite name="construct.a.page1.stjcsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcsite
            #add-point:ON ACTION controlp INFIELD stjcsite name="construct.c.page1.stjcsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcunit
            #add-point:BEFORE FIELD stjcunit name="construct.b.page1.stjcunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcunit
            
            #add-point:AFTER FIELD stjcunit name="construct.a.page1.stjcunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stjcunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcunit
            #add-point:ON ACTION controlp INFIELD stjcunit name="construct.c.page1.stjcunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stjd002,stjdseq,stjd003,stjd004,stjd001,stjdsite,stjdunit,l_stjd002, 
          l_stjdseq,l_stjd003,l_stjd004,l_stjd001,l_stjdsite,l_stjdunit
           FROM s_detail2[1].stjd002,s_detail2[1].stjdseq,s_detail2[1].stjd003,s_detail2[1].stjd004, 
               s_detail2[1].stjd001,s_detail2[1].stjdsite,s_detail2[1].stjdunit,s_detail3[1].l_stjd002, 
               s_detail3[1].l_stjdseq,s_detail3[1].l_stjd003,s_detail3[1].l_stjd004,s_detail3[1].l_stjd001, 
               s_detail3[1].l_stjdsite,s_detail3[1].l_stjdunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjd002
            #add-point:BEFORE FIELD stjd002 name="construct.b.page2.stjd002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjd002
            
            #add-point:AFTER FIELD stjd002 name="construct.a.page2.stjd002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjd002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjd002
            #add-point:ON ACTION controlp INFIELD stjd002 name="construct.c.page2.stjd002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjdseq
            #add-point:BEFORE FIELD stjdseq name="construct.b.page2.stjdseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjdseq
            
            #add-point:AFTER FIELD stjdseq name="construct.a.page2.stjdseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjdseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjdseq
            #add-point:ON ACTION controlp INFIELD stjdseq name="construct.c.page2.stjdseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stjd003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjd003
            #add-point:ON ACTION controlp INFIELD stjd003 name="construct.c.page2.stjd003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stjd003  #顯示到畫面上
            NEXT FIELD stjd003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjd003
            #add-point:BEFORE FIELD stjd003 name="construct.b.page2.stjd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjd003
            
            #add-point:AFTER FIELD stjd003 name="construct.a.page2.stjd003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjd004
            #add-point:BEFORE FIELD stjd004 name="construct.b.page2.stjd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjd004
            
            #add-point:AFTER FIELD stjd004 name="construct.a.page2.stjd004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjd004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjd004
            #add-point:ON ACTION controlp INFIELD stjd004 name="construct.c.page2.stjd004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjd001
            #add-point:BEFORE FIELD stjd001 name="construct.b.page2.stjd001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjd001
            
            #add-point:AFTER FIELD stjd001 name="construct.a.page2.stjd001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjd001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjd001
            #add-point:ON ACTION controlp INFIELD stjd001 name="construct.c.page2.stjd001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjdsite
            #add-point:BEFORE FIELD stjdsite name="construct.b.page2.stjdsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjdsite
            
            #add-point:AFTER FIELD stjdsite name="construct.a.page2.stjdsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjdsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjdsite
            #add-point:ON ACTION controlp INFIELD stjdsite name="construct.c.page2.stjdsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjdunit
            #add-point:BEFORE FIELD stjdunit name="construct.b.page2.stjdunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjdunit
            
            #add-point:AFTER FIELD stjdunit name="construct.a.page2.stjdunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stjdunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjdunit
            #add-point:ON ACTION controlp INFIELD stjdunit name="construct.c.page2.stjdunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjd002
            #add-point:BEFORE FIELD l_stjd002 name="construct.b.page3.l_stjd002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjd002
            
            #add-point:AFTER FIELD l_stjd002 name="construct.a.page3.l_stjd002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjd002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjd002
            #add-point:ON ACTION controlp INFIELD l_stjd002 name="construct.c.page3.l_stjd002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjdseq
            #add-point:BEFORE FIELD l_stjdseq name="construct.b.page3.l_stjdseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjdseq
            
            #add-point:AFTER FIELD l_stjdseq name="construct.a.page3.l_stjdseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjdseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjdseq
            #add-point:ON ACTION controlp INFIELD l_stjdseq name="construct.c.page3.l_stjdseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjd003
            #add-point:BEFORE FIELD l_stjd003 name="construct.b.page3.l_stjd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjd003
            
            #add-point:AFTER FIELD l_stjd003 name="construct.a.page3.l_stjd003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjd003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjd003
            #add-point:ON ACTION controlp INFIELD l_stjd003 name="construct.c.page3.l_stjd003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO l_stjd003  #顯示到畫面上
            NEXT FIELD l_stjd003                       #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjd004
            #add-point:BEFORE FIELD l_stjd004 name="construct.b.page3.l_stjd004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjd004
            
            #add-point:AFTER FIELD l_stjd004 name="construct.a.page3.l_stjd004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjd004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjd004
            #add-point:ON ACTION controlp INFIELD l_stjd004 name="construct.c.page3.l_stjd004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjd001
            #add-point:BEFORE FIELD l_stjd001 name="construct.b.page3.l_stjd001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjd001
            
            #add-point:AFTER FIELD l_stjd001 name="construct.a.page3.l_stjd001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjd001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjd001
            #add-point:ON ACTION controlp INFIELD l_stjd001 name="construct.c.page3.l_stjd001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjdsite
            #add-point:BEFORE FIELD l_stjdsite name="construct.b.page3.l_stjdsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjdsite
            
            #add-point:AFTER FIELD l_stjdsite name="construct.a.page3.l_stjdsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjdsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjdsite
            #add-point:ON ACTION controlp INFIELD l_stjdsite name="construct.c.page3.l_stjdsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_stjdunit
            #add-point:BEFORE FIELD l_stjdunit name="construct.b.page3.l_stjdunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_stjdunit
            
            #add-point:AFTER FIELD l_stjdunit name="construct.a.page3.l_stjdunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.l_stjdunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_stjdunit
            #add-point:ON ACTION controlp INFIELD l_stjdunit name="construct.c.page3.l_stjdunit"
            
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
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stem_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stjc_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stjd_t" 
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
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt805_filter()
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
      CONSTRUCT g_wc_filter ON stemsite,stemdocdt,stemdocno,stem001,stem024,stem025,stem026,stem012, 
          stem013
                          FROM s_browse[1].b_stemsite,s_browse[1].b_stemdocdt,s_browse[1].b_stemdocno, 
                              s_browse[1].b_stem001,s_browse[1].b_stem024,s_browse[1].b_stem025,s_browse[1].b_stem026, 
                              s_browse[1].b_stem012,s_browse[1].b_stem013
 
         BEFORE CONSTRUCT
               DISPLAY astt805_filter_parser('stemsite') TO s_browse[1].b_stemsite
            DISPLAY astt805_filter_parser('stemdocdt') TO s_browse[1].b_stemdocdt
            DISPLAY astt805_filter_parser('stemdocno') TO s_browse[1].b_stemdocno
            DISPLAY astt805_filter_parser('stem001') TO s_browse[1].b_stem001
            DISPLAY astt805_filter_parser('stem024') TO s_browse[1].b_stem024
            DISPLAY astt805_filter_parser('stem025') TO s_browse[1].b_stem025
            DISPLAY astt805_filter_parser('stem026') TO s_browse[1].b_stem026
            DISPLAY astt805_filter_parser('stem012') TO s_browse[1].b_stem012
            DISPLAY astt805_filter_parser('stem013') TO s_browse[1].b_stem013
      
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
 
      CALL astt805_filter_show('stemsite')
   CALL astt805_filter_show('stemdocdt')
   CALL astt805_filter_show('stemdocno')
   CALL astt805_filter_show('stem001')
   CALL astt805_filter_show('stem024')
   CALL astt805_filter_show('stem025')
   CALL astt805_filter_show('stem026')
   CALL astt805_filter_show('stem012')
   CALL astt805_filter_show('stem013')
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt805_filter_parser(ps_field)
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
 
{<section id="astt805.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt805_filter_show(ps_field)
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
   LET ls_condition = astt805_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt805_query()
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
   CALL g_stjc_d.clear()
   CALL g_stjc2_d.clear()
   CALL g_stjc3_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt805_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt805_browser_fill("")
      CALL astt805_fetch("")
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
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL astt805_filter_show('stemsite')
   CALL astt805_filter_show('stemdocdt')
   CALL astt805_filter_show('stemdocno')
   CALL astt805_filter_show('stem001')
   CALL astt805_filter_show('stem024')
   CALL astt805_filter_show('stem025')
   CALL astt805_filter_show('stem026')
   CALL astt805_filter_show('stem012')
   CALL astt805_filter_show('stem013')
   CALL astt805_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt805_fetch("F") 
      #顯示單身筆數
      CALL astt805_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt805_fetch(p_flag)
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
   
   LET g_stem_m.stemdocno = g_browser[g_current_idx].b_stemdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt805_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt805_set_act_visible()   
   CALL astt805_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stem_m_t.* = g_stem_m.*
   LET g_stem_m_o.* = g_stem_m.*
   
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
   
   #重新顯示   
   CALL astt805_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt805_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE r_insert      LIKE type_t.num5
   DEFINE l_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stjc_d.clear()   
   CALL g_stjc2_d.clear()  
   CALL g_stjc3_d.clear()  
 
 
   INITIALIZE g_stem_m.* TO NULL             #DEFAULT 設定
   
   LET g_stemdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
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
            LET g_stem_m.stem027 = "0"
      LET g_stem_m.stem028 = "0"
      LET g_stem_m.stem030 = "0"
      LET g_stem_m.stem031 = "0"
      LET g_stem_m.stem032 = "0"
      LET g_stem_m.stem033 = "0"
 
  
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
      
      LET g_stem_m.stem024 = "1"    #終止類型
      LET g_stem_m.stem026 = "1"    #違約方
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stem_m_t.* = g_stem_m.*
      LET g_stem_m_o.* = g_stem_m.*
      
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
 
 
 
    
      CALL astt805_input("a")
      
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
         INITIALIZE g_stem_m.* TO NULL
         INITIALIZE g_stjc_d TO NULL
         INITIALIZE g_stjc2_d TO NULL
         INITIALIZE g_stjc3_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt805_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stjc_d.clear()
      #CALL g_stjc2_d.clear()
      #CALL g_stjc3_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt805_set_act_visible()   
   CALL astt805_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt805_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt805_cl
   
   CALL astt805_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt805_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024, 
       g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem029_desc, 
       g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem012_desc, 
       g_stem_m.stem013,g_stem_m.stem013_desc,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus, 
       g_stem_m.stemownid,g_stem_m.stemownid_desc,g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp,g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmodid_desc,g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt 
 
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
   
   #功能已完成,通報訊息中心
   CALL astt805_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt805_modify()
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
   LET g_stem_m_t.* = g_stem_m.*
   LET g_stem_m_o.* = g_stem_m.*
   
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   CALL s_transaction_begin()
   
   OPEN astt805_cl USING g_enterprise,g_stem_m.stemdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt805_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt805_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt805_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt805_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astt805_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stemdocno_t = g_stem_m.stemdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stem_m.stemmodid = g_user 
LET g_stem_m.stemmoddt = cl_get_current()
LET g_stem_m.stemmodid_desc = cl_get_username(g_stem_m.stemmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #add by geza 20170213 #170117-00025#2(S)
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stem_m.stemstus MATCHES "[DR]" THEN 
         LET g_stem_m.stemstus = "N"
      END IF
      #add by geza 20170213 #170117-00025#2(E)
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt805_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stem_t SET (stemmodid,stemmoddt) = (g_stem_m.stemmodid,g_stem_m.stemmoddt)
          WHERE stement = g_enterprise AND stemdocno = g_stemdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stem_m.* = g_stem_m_t.*
            CALL astt805_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stem_m.stemdocno != g_stem_m_t.stemdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stjc_t SET stjcdocno = g_stem_m.stemdocno
 
          WHERE stjcent = g_enterprise AND stjcdocno = g_stem_m_t.stemdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stjc_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
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
         
         UPDATE stjd_t
            SET stjddocno = g_stem_m.stemdocno
 
          WHERE stjdent = g_enterprise AND
                stjddocno = g_stemdocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stjd_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stjd_t:",SQLERRMESSAGE 
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
   CALL astt805_set_act_visible()   
   CALL astt805_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
   #填到對應位置
   CALL astt805_browser_fill("")
 
   CLOSE astt805_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt805_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt805.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt805_input(p_cmd)
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
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_stje043             LIKE stje_t.stje043
   DEFINE  l_stje045             LIKE stje_t.stje045
   DEFINE  l_flag                LIKE type_t.num5
   DEFINE  l_sum_stjn006         LIKE stjn_t.stjn006
   DEFINE  l_stae005             LIKE stae_t.stae005
   DEFINE  l_stjm004             LIKE stjm_t.stjm004   #add by diping.ruan
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
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024, 
       g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem029_desc, 
       g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem012_desc, 
       g_stem_m.stem013,g_stem_m.stem013_desc,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus, 
       g_stem_m.stemownid,g_stem_m.stemownid_desc,g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp,g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmodid_desc,g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt 
 
   
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
   LET g_forupd_sql = "SELECT stjcseq,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001,stjcsite,stjcunit  
       FROM stjc_t WHERE stjcent=? AND stjcdocno=? AND stjcseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt805_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stjd002,stjdseq,stjd003,stjd004,stjd001,stjdsite,stjdunit FROM stjd_t  
       WHERE stjdent=? AND stjddocno=? AND stjdseq=? AND stjd002=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt805_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt805_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt805_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016, 
       g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017, 
       g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025, 
       g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031, 
       g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit, 
       g_stem_m.stem000,g_stem_m.stemstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt805.input.head" >}
      #單頭段
      INPUT BY NAME g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016, 
          g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017, 
          g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025, 
          g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031, 
          g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit, 
          g_stem_m.stem000,g_stem_m.stemstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt805_cl USING g_enterprise,g_stem_m.stemdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt805_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt805_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt805_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt805_set_no_entry(p_cmd)
    
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
            CALL astt805_set_entry(p_cmd)
            CALL astt805_set_no_entry(p_cmd)
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
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM stje_t
                WHERE stjeent = g_enterprise
                  AND stje001 = g_stem_m.stem001
               IF l_n < 1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = "ast-00633"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD stem001
               END IF
               #检查组织      #160324-00008#16 by 08172
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM stje_t
                WHERE stjeent = g_enterprise
                  AND stje001 = g_stem_m.stem001
                  AND stjesite = g_stem_m.stemsite
               IF l_n < 1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = "ast-00744"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD stem001
               END IF
               #检查合同状态
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM stje_t
                WHERE stjeent = g_enterprise
                  AND stje001 = g_stem_m.stem001           
                  #AND stje005 IN ('6')       #160604-00009#49 dongsz mark
                  AND stje005 IN ('1','2','3','4','5','6')   #160604-00009#49 dongsz add
               IF l_n < 1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  #LET g_errparam.code   = "ast-00641"    #160604-00009#49 dongsz mark
                  LET g_errparam.code   = "ast-00816"     #160604-00009#49 dongsz add
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD stem001
               END IF
               
               #检查是否存在未审核资料
               IF NOT s_astt805_chk_stem(g_stem_m.stemdocno,g_stem_m.stem001) THEN
                  LET g_stem_m.stem001 = g_stem_m_t.stem001
                  DISPLAY BY NAME g_stem_m.stem001
                  NEXT FIELD stem001
               END IF
 
               #合同带值
               CALL astt805_stem001_ref()
               #合同变更，預設終止結算日
               IF g_stem_m.stem001 <> g_stem_m_o.stem001 OR cl_null(g_stem_m_o.stem001) THEN
                  LET l_stje045 = ''
                  SELECT stje045 INTO l_stje045 FROM stje_t
                   WHERE stjeent = g_enterprise
                     AND stje001 = g_stem_m.stem001
                  LET g_stem_m.stem025 = l_stje045
                  DISPLAY BY NAME g_stem_m.stem025
               END IF
            END IF 
            CALL astt805_set_entry(p_cmd)     #160604-00009#49 dongsz add
            CALL astt805_set_no_entry(p_cmd)  #160604-00009#49 dongsz add

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
         BEFORE FIELD stem024
            #add-point:BEFORE FIELD stem024 name="input.b.stem024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem024
            
            #add-point:AFTER FIELD stem024 name="input.a.stem024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem024
            #add-point:ON CHANGE stem024 name="input.g.stem024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem025
            #add-point:BEFORE FIELD stem025 name="input.b.stem025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem025
            
            #add-point:AFTER FIELD stem025 name="input.a.stem025"
            SELECT min(stjm004) INTO l_stjm004       #add by diping.ruan
                 FROM stjm_t
                WHERE stjment = g_enterprise
                  AND stjm001 = g_stem_m.stem001    
            IF NOT cl_null(g_stem_m.stem025) THEN
               #可以小于合同开始日，但是不能小于合同账单的最小出帐日     #add by diping.ruan
               
                IF g_stem_m.stem025 < l_stjm004 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "ast-00643"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem025 = g_stem_m_t.stem025
                  DISPLAY BY NAME g_stem_m.stem025
                  NEXT FIELD stem025
               END IF
#               #不可小于合同开始日期                                 #marked by diping.ruan
#               IF g_stem_m.stem025 < g_stem_m.stem009 THEN
#                  INITIALIZE g_errparam TO NULL 
#                  LET g_errparam.extend = "" 
#                  LET g_errparam.code   = "ast-00643"
#                  LET g_errparam.popup  = TRUE
#                  CALL cl_err()
#                  LET g_stem_m.stem025 = g_stem_m_t.stem025
#                  DISPLAY BY NAME g_stem_m.stem025
#                  NEXT FIELD stem025
#               END IF
               #不可大于合同结束日期或延期日期
               SELECT stje043 INTO l_stje043
                 FROM stje_t
                WHERE stjeent = g_enterprise
                  AND stje001 = g_stem_m.stem001
               IF cl_null(l_stje043) THEN
                  IF g_stem_m.stem025 > g_stem_m.stem010 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "ast-00674"
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET g_stem_m.stem025 = g_stem_m_t.stem025
                     DISPLAY BY NAME g_stem_m.stem025
                     NEXT FIELD stem025
                  END IF
               ELSE
                  IF g_stem_m.stem025 > l_stje043 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "ast-00675"
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET g_stem_m.stem025 = g_stem_m_t.stem025
                     DISPLAY BY NAME g_stem_m.stem025
                     NEXT FIELD stem025
                  END IF
               END IF
               #add by geza 20160816 #160728-00006#26(S)
               #astt805，清退日期可以小于今天，且大于清退日期没有销售和收款记录
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM rtja_t
                WHERE rtjaent = g_enterprise
                  AND rtja105 = g_stem_m.stem001
                  AND rtjastus <> 'X'
                  AND rtjadocdt > g_stem_m.stem025
               IF l_cnt > 0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.replace[1] = g_stem_m.stem001
                  LET g_errparam.code   = "ast-00840"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem025 = g_stem_m_t.stem025
                  DISPLAY BY NAME g_stem_m.stem025
                  NEXT FIELD stem025
               END IF
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM rtjf_t,rtja_t
                WHERE rtjfent = g_enterprise
                  AND rtjfent = rtjaent 
                  AND rtjfdocno = rtjadocno
                  AND rtja105 = g_stem_m.stem001
                  AND rtjastus <> 'X'
                  AND rtjf025 > g_stem_m.stem025
               IF l_cnt > 0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.replace[1] = g_stem_m.stem001
                  LET g_errparam.code   = "ast-00840"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stem_m.stem025 = g_stem_m_t.stem025
                  DISPLAY BY NAME g_stem_m.stem025
                  NEXT FIELD stem025
               END IF
               #add by geza 20160816 #160728-00006#26(E)
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem025
            #add-point:ON CHANGE stem025 name="input.g.stem025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem026
            #add-point:BEFORE FIELD stem026 name="input.b.stem026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem026
            
            #add-point:AFTER FIELD stem026 name="input.a.stem026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem026
            #add-point:ON CHANGE stem026 name="input.g.stem026"
            IF NOT astt805_upd_stem('1') THEN
               NEXT FIELD stem026
            END IF
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem027
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stem_m.stem027,"0","1","100","1","azz-00087",1) THEN
               NEXT FIELD stem027
            END IF 
 
 
 
            #add-point:AFTER FIELD stem027 name="input.a.stem027"
            IF NOT cl_null(g_stem_m.stem027) THEN
               #计算违约金额(抓取合同中收入类费用的日核算总和*比列)
               LET l_sum_stjn006 = 0
               SELECT SUM(stjn006) INTO l_sum_stjn006
                 FROM stjn_t,stae_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjnent = staeent
                  AND stjn005 = stae001
                  AND stae002 = '1'
               IF cl_null(l_sum_stjn006) THEN
                  LET l_sum_stjn006 = 0
               END IF
               LET g_stem_m.stem028 = g_stem_m.stem027/100*l_sum_stjn006
               LET g_stem_m_o.stem028 = g_stem_m.stem028
               DISPLAY BY NAME g_stem_m.stem028
               
               IF NOT astt805_upd_stem('1') THEN
                  NEXT FIELD stem027
               END IF
            END IF
            
            CALL astt805_set_entry(p_cmd)
            CALL astt805_set_no_entry(p_cmd)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem027
            #add-point:BEFORE FIELD stem027 name="input.b.stem027"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem027
            #add-point:ON CHANGE stem027 name="input.g.stem027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem028
            #add-point:BEFORE FIELD stem028 name="input.b.stem028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem028
            
            #add-point:AFTER FIELD stem028 name="input.a.stem028"
            IF NOT cl_null(g_stem_m.stem028) THEN
               IF g_stem_m.stem028 <> g_stem_m_o.stem028 OR cl_null(g_stem_m_o.stem028) THEN
                  #回写违约金比例
                  LET l_sum_stjn006 = 0
                  SELECT SUM(stjn006) INTO l_sum_stjn006
                    FROM stjn_t,stae_t
                   WHERE stjnent = g_enterprise
                     AND stjn001 = g_stem_m.stem001
                     AND stjnent = staeent
                     AND stjn005 = stae001
                     AND stae002 = '1'
                  IF cl_null(l_sum_stjn006) THEN
                     LET l_sum_stjn006 = 0
                  END IF
                  LET g_stem_m.stem027 = g_stem_m.stem028*100/l_sum_stjn006
                  DISPLAY BY NAME g_stem_m.stem027
               END IF
               
               IF NOT astt805_upd_stem('1') THEN
                  NEXT FIELD stem028
               END IF
            END IF
            LET g_stem_m_o.stem028 = g_stem_m.stem028 
            
            CALL astt805_set_entry(p_cmd)
            CALL astt805_set_no_entry(p_cmd)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem028
            #add-point:ON CHANGE stem028 name="input.g.stem028"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem029
            
            #add-point:AFTER FIELD stem029 name="input.a.stem029"
            IF NOT cl_null(g_stem_m.stem029) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stem_m.stem029

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_stae001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stem_m.stem029
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stem_m.stem029_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stem_m.stem029_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem029
            #add-point:BEFORE FIELD stem029 name="input.b.stem029"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem029
            #add-point:ON CHANGE stem029 name="input.g.stem029"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem030
            #add-point:BEFORE FIELD stem030 name="input.b.stem030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem030
            
            #add-point:AFTER FIELD stem030 name="input.a.stem030"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem030
            #add-point:ON CHANGE stem030 name="input.g.stem030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem031
            #add-point:BEFORE FIELD stem031 name="input.b.stem031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem031
            
            #add-point:AFTER FIELD stem031 name="input.a.stem031"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem031
            #add-point:ON CHANGE stem031 name="input.g.stem031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem032
            #add-point:BEFORE FIELD stem032 name="input.b.stem032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem032
            
            #add-point:AFTER FIELD stem032 name="input.a.stem032"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem032
            #add-point:ON CHANGE stem032 name="input.g.stem032"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stem033
            #add-point:BEFORE FIELD stem033 name="input.b.stem033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stem033
            
            #add-point:AFTER FIELD stem033 name="input.a.stem033"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stem033
            #add-point:ON CHANGE stem033 name="input.g.stem033"
            
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
            #LET g_qryparam.where = " stjesite = '",g_stem_m.stemsite,"' AND stje005 IN ('6') "   #160324-00008#16 by 08172 #160604-00009#49 dongsz mark
            LET g_qryparam.where = " stjesite = '",g_stem_m.stemsite,"' AND stje005 IN ('1','2','3','4','5','6') "  #160604-00009#49 dongsz add
 
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
 
 
         #Ctrlp:input.c.stem024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem024
            #add-point:ON ACTION controlp INFIELD stem024 name="input.c.stem024"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem025
            #add-point:ON ACTION controlp INFIELD stem025 name="input.c.stem025"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem026
            #add-point:ON ACTION controlp INFIELD stem026 name="input.c.stem026"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem027
            #add-point:ON ACTION controlp INFIELD stem027 name="input.c.stem027"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem028
            #add-point:ON ACTION controlp INFIELD stem028 name="input.c.stem028"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem029
            #add-point:ON ACTION controlp INFIELD stem029 name="input.c.stem029"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stem_m.stem029             #給予default值
            LET g_qryparam.default2 = g_stem_m.stem029_desc #說明
            LET g_qryparam.default3 = "" #g_stem_m.stael004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_stae001()                                #呼叫開窗
 
            LET g_stem_m.stem029 = g_qryparam.return1              
            LET g_stem_m.stem029_desc = g_qryparam.return2 
            #LET g_stem_m.stael004 = g_qryparam.return3 
            DISPLAY g_stem_m.stem029 TO stem029              #
            DISPLAY g_stem_m.stem029_desc TO stem029_desc #說明
            #DISPLAY g_stem_m.stael004 TO stael004 #助記碼
            NEXT FIELD stem029                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stem030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem030
            #add-point:ON ACTION controlp INFIELD stem030 name="input.c.stem030"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem031
            #add-point:ON ACTION controlp INFIELD stem031 name="input.c.stem031"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem032
            #add-point:ON ACTION controlp INFIELD stem032 name="input.c.stem032"
            
            #END add-point
 
 
         #Ctrlp:input.c.stem033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem033
            #add-point:ON ACTION controlp INFIELD stem033 name="input.c.stem033"
            
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
 
 
         #Ctrlp:input.c.stem000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stem000
            #add-point:ON ACTION controlp INFIELD stem000 name="input.c.stem000"
            
            #END add-point
 
 
         #Ctrlp:input.c.stemstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stemstus
            #add-point:ON ACTION controlp INFIELD stemstus name="input.c.stemstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stem_m.stemdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
         
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stem_m.stemsite,g_stem_m.stemdocno,g_stem_m.stemdocdt,g_prog) RETURNING l_flag,g_stem_m.stemdocno
               IF NOT l_flag THEN
                  NEXT FIELD stemdocno
               END IF
               #end add-point
               
               INSERT INTO stem_t (stement,stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003, 
                   stem005,stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem024,stem025,stem026, 
                   stem027,stem028,stem029,stem030,stem031,stem032,stem033,stem012,stem013,stem034,stemunit, 
                   stem000,stemstus,stemownid,stemowndp,stemcrtid,stemcrtdp,stemcrtdt,stemmodid,stemmoddt, 
                   stemcnfid,stemcnfdt)
               VALUES (g_enterprise,g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
                   g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004, 
                   g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
                   g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027, 
                   g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032, 
                   g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit, 
                   g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
                   g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
                   g_stem_m.stemcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stem_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               IF NOT astt805_ins_detail1() THEN
                  NEXT FIELD CURRENT
               END IF
               IF NOT astt805_ins_detail2() THEN
                  NEXT FIELD CURRENT
               END IF
               IF NOT astt805_ins_detail3() THEN
                  NEXT FIELD CURRENT
               END IF
               IF NOT astt805_upd_stem('2') THEN
                  NEXT FIELD CURRENT
               END IF
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt805_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt805_b_fill()
                  CALL astt805_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               CALL astt805_b_fill()
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt805_stem_t_mask_restore('restore_mask_o')
               
               UPDATE stem_t SET (stemsite,stemdocdt,stemdocno,stem001,stem016,stem002,stem003,stem005, 
                   stem004,stem006,stem017,stem007,stem009,stem010,stem011,stem024,stem025,stem026,stem027, 
                   stem028,stem029,stem030,stem031,stem032,stem033,stem012,stem013,stem034,stemunit, 
                   stem000,stemstus,stemownid,stemowndp,stemcrtid,stemcrtdp,stemcrtdt,stemmodid,stemmoddt, 
                   stemcnfid,stemcnfdt) = (g_stem_m.stemsite,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
                   g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005,g_stem_m.stem004, 
                   g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
                   g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027, 
                   g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032, 
                   g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit, 
                   g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemowndp,g_stem_m.stemcrtid, 
                   g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmoddt,g_stem_m.stemcnfid, 
                   g_stem_m.stemcnfdt)
                WHERE stement = g_enterprise AND stemdocno = g_stemdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stem_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               IF g_stem_m.stem025 <> g_stem_m_t.stem025 THEN
                  IF NOT astt805_ins_detail3() THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF NOT astt805_upd_stem('2') THEN
                  NEXT FIELD CURRENT
               END IF
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt805_stem_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stem_m_t)
               LET g_log2 = util.JSON.stringify(g_stem_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               CALL astt805_b_fill()
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stemdocno_t = g_stem_m.stemdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt805.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stjc_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stjc_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt805_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stjc_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            CALL astt805_set_act_no_visible_b()
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
            OPEN astt805_cl USING g_enterprise,g_stem_m.stemdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt805_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt805_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stjc_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stjc_d[l_ac].stjcseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stjc_d_t.* = g_stjc_d[l_ac].*  #BACKUP
               LET g_stjc_d_o.* = g_stjc_d[l_ac].*  #BACKUP
               CALL astt805_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt805_set_no_entry_b(l_cmd)
               IF NOT astt805_lock_b("stjc_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt805_bcl INTO g_stjc_d[l_ac].stjcseq,g_stjc_d[l_ac].stjc002,g_stjc_d[l_ac].stjc003, 
                      g_stjc_d[l_ac].stjc004,g_stjc_d[l_ac].stjc005,g_stjc_d[l_ac].stjc006,g_stjc_d[l_ac].stjc001, 
                      g_stjc_d[l_ac].stjcsite,g_stjc_d[l_ac].stjcunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stjc_d_t.stjcseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stjc_d_mask_o[l_ac].* =  g_stjc_d[l_ac].*
                  CALL astt805_stjc_t_mask()
                  LET g_stjc_d_mask_n[l_ac].* =  g_stjc_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt805_show()
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
            INITIALIZE g_stjc_d[l_ac].* TO NULL 
            INITIALIZE g_stjc_d_t.* TO NULL 
            INITIALIZE g_stjc_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stjc_d[l_ac].stjc006 = "N"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stjc_d_t.* = g_stjc_d[l_ac].*     #新輸入資料
            LET g_stjc_d_o.* = g_stjc_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt805_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt805_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stjc_d[li_reproduce_target].* = g_stjc_d[li_reproduce].*
 
               LET g_stjc_d[li_reproduce_target].stjcseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stjc_t 
             WHERE stjcent = g_enterprise AND stjcdocno = g_stem_m.stemdocno
 
               AND stjcseq = g_stjc_d[l_ac].stjcseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stem_m.stemdocno
               LET gs_keys[2] = g_stjc_d[g_detail_idx].stjcseq
               CALL astt805_insert_b('stjc_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stjc_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt805_b_fill()
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
               LET gs_keys[01] = g_stem_m.stemdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stjc_d_t.stjcseq
 
            
               #刪除同層單身
               IF NOT astt805_delete_b('stjc_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt805_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt805_key_delete_b(gs_keys,'stjc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt805_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt805_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stjc_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stjc_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcseq
            #add-point:BEFORE FIELD stjcseq name="input.b.page1.stjcseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcseq
            
            #add-point:AFTER FIELD stjcseq name="input.a.page1.stjcseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_stem_m.stemdocno IS NOT NULL AND g_stjc_d[g_detail_idx].stjcseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stem_m.stemdocno != g_stemdocno_t OR g_stjc_d[g_detail_idx].stjcseq != g_stjc_d_t.stjcseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stjc_t WHERE "||"stjcent = '" ||g_enterprise|| "' AND "||"stjcdocno = '"||g_stem_m.stemdocno ||"' AND "|| "stjcseq = '"||g_stjc_d[g_detail_idx].stjcseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjcseq
            #add-point:ON CHANGE stjcseq name="input.g.page1.stjcseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc002
            
            #add-point:AFTER FIELD stjc002 name="input.a.page1.stjc002"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stjc_d[l_ac].stjc002
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stjc_d[l_ac].stjc002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stjc_d[l_ac].stjc002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc002
            #add-point:BEFORE FIELD stjc002 name="input.b.page1.stjc002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc002
            #add-point:ON CHANGE stjc002 name="input.g.page1.stjc002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc003
            #add-point:BEFORE FIELD stjc003 name="input.b.page1.stjc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc003
            
            #add-point:AFTER FIELD stjc003 name="input.a.page1.stjc003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc003
            #add-point:ON CHANGE stjc003 name="input.g.page1.stjc003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc004
            #add-point:BEFORE FIELD stjc004 name="input.b.page1.stjc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc004
            
            #add-point:AFTER FIELD stjc004 name="input.a.page1.stjc004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc004
            #add-point:ON CHANGE stjc004 name="input.g.page1.stjc004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc005
            #add-point:BEFORE FIELD stjc005 name="input.b.page1.stjc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc005
            
            #add-point:AFTER FIELD stjc005 name="input.a.page1.stjc005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc005
            #add-point:ON CHANGE stjc005 name="input.g.page1.stjc005"
            IF g_stjc_d[l_ac].stjc005 = 'Y' THEN
               #收付实现制的费用不可以退
               #160512-00003#4--dongsz mark--str
#               LET l_stae005 = ''
#               SELECT stae005 INTO l_stae005
#                 FROM stae_t
#                WHERE staeent = g_enterprise
#                  AND stae001 = g_stjc_d[l_ac].stjc002
               #160512-00003#4--dongsz mark--end
               #160604-00009#39--dongsz mark--s
               #160512-00003#4--dongsz add--str
               LET l_stae005 = ''
               SELECT stji006 INTO l_stae005
                 FROM stji_t
                WHERE stjient = g_enterprise
                  AND stji001 = g_stem_m.stem001
                  AND stji002 = g_stjc_d[l_ac].stjc002
               #160512-00003#4--dongsz add--end
               #add by geza 20160818 #160728-00006#30(S)
               LET l_cnt = ''
               SELECT COUNT(*) INTO l_cnt
                 FROM stjf_t
                WHERE stjfent = g_enterprise
                  AND stjf001 = g_stem_m.stem001
                  AND stjf004 = g_stjc_d[l_ac].stjc002
                  AND stjf007 = '5'
               #add by geza 20160818 #160728-00006#30(E)
               #IF l_stae005 = '1' THEN #mark by geza 20160818 #160728-00006#30
               IF l_stae005 = '1' AND l_cnt > 0 THEN #mark by geza 20160818 #160728-00006#30
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = "ast-00644"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stjc_d[l_ac].stjc005 = g_stjc_d_t.stjc005
                  DISPLAY BY NAME g_stjc_d[l_ac].stjc005
                  #160728-00006#30 add by geza 20160824(S)
                  IF g_stjc_d[l_ac].stjc005 = 'N' THEN
                     LET g_stjc_d[l_ac].stjc006 = 'N'
                  END IF
                  CALL astt805_set_entry_b(l_cmd) 
                  CALL astt805_set_no_entry_b(l_cmd)
                  #160728-00006#30 add by geza 20160824(E)
                  NEXT FIELD stjc005
               END IF
               #160604-00009#39--dongsz mark--e
            END IF
            #160728-00006#30 add by geza 20160824(S)
            IF g_stjc_d[l_ac].stjc005 = 'N' THEN
               LET g_stjc_d[l_ac].stjc006 = 'N'
            END IF
            CALL astt805_set_entry_b(l_cmd) 
            CALL astt805_set_no_entry_b(l_cmd)
            #160728-00006#30 add by geza 20160824(E)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc006
            #add-point:BEFORE FIELD stjc006 name="input.b.page1.stjc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc006
            
            #add-point:AFTER FIELD stjc006 name="input.a.page1.stjc006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc006
            #add-point:ON CHANGE stjc006 name="input.g.page1.stjc006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjc001
            #add-point:BEFORE FIELD stjc001 name="input.b.page1.stjc001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjc001
            
            #add-point:AFTER FIELD stjc001 name="input.a.page1.stjc001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjc001
            #add-point:ON CHANGE stjc001 name="input.g.page1.stjc001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcsite
            #add-point:BEFORE FIELD stjcsite name="input.b.page1.stjcsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcsite
            
            #add-point:AFTER FIELD stjcsite name="input.a.page1.stjcsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjcsite
            #add-point:ON CHANGE stjcsite name="input.g.page1.stjcsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stjcunit
            #add-point:BEFORE FIELD stjcunit name="input.b.page1.stjcunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stjcunit
            
            #add-point:AFTER FIELD stjcunit name="input.a.page1.stjcunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stjcunit
            #add-point:ON CHANGE stjcunit name="input.g.page1.stjcunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stjcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcseq
            #add-point:ON ACTION controlp INFIELD stjcseq name="input.c.page1.stjcseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc002
            #add-point:ON ACTION controlp INFIELD stjc002 name="input.c.page1.stjc002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc003
            #add-point:ON ACTION controlp INFIELD stjc003 name="input.c.page1.stjc003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc004
            #add-point:ON ACTION controlp INFIELD stjc004 name="input.c.page1.stjc004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc005
            #add-point:ON ACTION controlp INFIELD stjc005 name="input.c.page1.stjc005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc006
            #add-point:ON ACTION controlp INFIELD stjc006 name="input.c.page1.stjc006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjc001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjc001
            #add-point:ON ACTION controlp INFIELD stjc001 name="input.c.page1.stjc001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcsite
            #add-point:ON ACTION controlp INFIELD stjcsite name="input.c.page1.stjcsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stjcunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stjcunit
            #add-point:ON ACTION controlp INFIELD stjcunit name="input.c.page1.stjcunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stjc_d[l_ac].* = g_stjc_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt805_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stjc_d[l_ac].stjcseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stjc_d[l_ac].* = g_stjc_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt805_stjc_t_mask_restore('restore_mask_o')
      
               UPDATE stjc_t SET (stjcdocno,stjcseq,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001, 
                   stjcsite,stjcunit) = (g_stem_m.stemdocno,g_stjc_d[l_ac].stjcseq,g_stjc_d[l_ac].stjc002, 
                   g_stjc_d[l_ac].stjc003,g_stjc_d[l_ac].stjc004,g_stjc_d[l_ac].stjc005,g_stjc_d[l_ac].stjc006, 
                   g_stjc_d[l_ac].stjc001,g_stjc_d[l_ac].stjcsite,g_stjc_d[l_ac].stjcunit)
                WHERE stjcent = g_enterprise AND stjcdocno = g_stem_m.stemdocno 
 
                  AND stjcseq = g_stjc_d_t.stjcseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stjc_d[l_ac].* = g_stjc_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stjc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stjc_d[l_ac].* = g_stjc_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stem_m.stemdocno
               LET gs_keys_bak[1] = g_stemdocno_t
               LET gs_keys[2] = g_stjc_d[g_detail_idx].stjcseq
               LET gs_keys_bak[2] = g_stjc_d_t.stjcseq
               CALL astt805_update_b('stjc_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt805_stjc_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stjc_d[g_detail_idx].stjcseq = g_stjc_d_t.stjcseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stem_m.stemdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stjc_d_t.stjcseq
 
                  CALL astt805_key_update_b(gs_keys,'stjc_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stem_m),util.JSON.stringify(g_stjc_d_t)
               LET g_log2 = util.JSON.stringify(g_stem_m),util.JSON.stringify(g_stjc_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt805_unlock_b("stjc_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            CALL s_transaction_begin()
            IF NOT astt805_ins_detail3() THEN
               NEXT FIELD CURRENT
            END IF
            IF NOT astt805_upd_stem('2') THEN
               NEXT FIELD CURRENT
            END IF
            CALL s_transaction_end('Y','0')
            CALL astt805_b_fill()
            CALL astt805_set_act_visible_b()
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stjc_d[li_reproduce_target].* = g_stjc_d[li_reproduce].*
 
               LET g_stjc_d[li_reproduce_target].stjcseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stjc_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stjc_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
      DISPLAY ARRAY g_stjc2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            CALL astt805_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_detail_idx = l_ac
            
            #add-point:page2, before row動作 name="input.body2.before_row"
            
            #end add-point
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2','3',"))
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            CALL astt805_idx_chk()
            LET g_current_page = 2
      
         #add-point:page2自定義行為 name="input.body2.action"
         
         #end add-point
      
      END DISPLAY
      DISPLAY ARRAY g_stjc3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            CALL astt805_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail3")
            LET g_detail_idx = l_ac
            
            #add-point:page3, before row動作 name="input.body3.before_row"
            
            #end add-point
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail3")
            CALL astt805_idx_chk()
            LET g_current_page = 3
      
         #add-point:page3自定義行為 name="input.body3.action"
         
         #end add-point
      
      END DISPLAY
 
 
 
{</section>}
 
{<section id="astt805.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2','3',"))
         CALL DIALOG.setCurrentRow("s_detail3",g_idx_group.getValue(""))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stemdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stjcseq
               WHEN "s_detail2"
                  NEXT FIELD stjd002
               WHEN "s_detail3"
                  NEXT FIELD l_stjd002
 
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
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
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
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
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
 
{<section id="astt805.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt805_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt805_b_fill() #單身填充
      CALL astt805_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt805_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt805_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024, 
       g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem029_desc, 
       g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem012_desc, 
       g_stem_m.stem013,g_stem_m.stem013_desc,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus, 
       g_stem_m.stemownid,g_stem_m.stemownid_desc,g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp,g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmodid_desc,g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt 
 
   
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
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stjc_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stjc2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
   FOR l_ac = 1 TO g_stjc3_d.getLength()
      #add-point:show段單身reference name="show.body3.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt805_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt805_detail_show()
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
 
{<section id="astt805.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt805_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stem_t.stemdocno 
   DEFINE l_oldno     LIKE stem_t.stemdocno 
 
   DEFINE l_master    RECORD LIKE stem_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stjc_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stjd_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
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
   
   LET g_master_insert = FALSE
   
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stemdocno_t = g_stem_m.stemdocno
 
    
   LET g_stem_m.stemdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
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
   
   
   CALL astt805_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stem_m.* TO NULL
      INITIALIZE g_stjc_d TO NULL
      INITIALIZE g_stjc2_d TO NULL
      INITIALIZE g_stjc3_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt805_show()
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
   CALL astt805_set_act_visible()   
   CALL astt805_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stement = " ||g_enterprise|| " AND",
                      " stemdocno = '", g_stem_m.stemdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt805_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt805_idx_chk()
   
   LET g_data_owner = g_stem_m.stemownid      
   LET g_data_dept  = g_stem_m.stemowndp
   
   #功能已完成,通報訊息中心
   CALL astt805_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt805_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stjc_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stjd_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt805_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stjc_t
    WHERE stjcent = g_enterprise AND stjcdocno = g_stemdocno_t
 
    INTO TEMP astt805_detail
 
   #將key修正為調整後   
   UPDATE astt805_detail 
      #更新key欄位
      SET stjcdocno = g_stem_m.stemdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stjc_t SELECT * FROM astt805_detail
   
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
   DROP TABLE astt805_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stjd_t 
    WHERE stjdent = g_enterprise AND stjddocno = g_stemdocno_t
 
    INTO TEMP astt805_detail
 
   #將key修正為調整後   
   UPDATE astt805_detail SET stjddocno = g_stem_m.stemdocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stjd_t SELECT * FROM astt805_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt805_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stemdocno_t = g_stem_m.stemdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt805_delete()
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
   
   IF g_stem_m.stemdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt805_cl USING g_enterprise,g_stem_m.stemdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt805_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt805_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt805_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stem_m_mask_o.* =  g_stem_m.*
   CALL astt805_stem_t_mask()
   LET g_stem_m_mask_n.* =  g_stem_m.*
   
   CALL astt805_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt805_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stemdocno_t = g_stem_m.stemdocno
 
 
      DELETE FROM stem_t
       WHERE stement = g_enterprise AND stemdocno = g_stem_m.stemdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stem_m.stemdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_stem_m.stemdocno,g_stem_m.stemdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stjc_t
       WHERE stjcent = g_enterprise AND stjcdocno = g_stem_m.stemdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
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
      DELETE FROM stjd_t
       WHERE stjdent = g_enterprise AND
             stjddocno = g_stem_m.stemdocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stjd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stem_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt805_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stjc_d.clear() 
      CALL g_stjc2_d.clear()       
      CALL g_stjc3_d.clear()       
 
     
      CALL astt805_ui_browser_refresh()  
      #CALL astt805_ui_headershow()  
      #CALL astt805_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt805_browser_fill("")
         CALL astt805_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt805_cl
 
   #功能已完成,通報訊息中心
   CALL astt805_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt805.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt805_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stjc_d.clear()
   CALL g_stjc2_d.clear()
   CALL g_stjc3_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt805_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stjcseq,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001,stjcsite, 
             stjcunit ,t1.stael003 FROM stjc_t",   
                     " INNER JOIN stem_t ON stement = " ||g_enterprise|| " AND stemdocno = stjcdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stjc002 AND t1.stael002='"||g_dlang||"' ",
 
                     " WHERE stjcent=? AND stjcdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stjc_t.stjcseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt805_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt805_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stem_m.stemdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stem_m.stemdocno INTO g_stjc_d[l_ac].stjcseq,g_stjc_d[l_ac].stjc002, 
          g_stjc_d[l_ac].stjc003,g_stjc_d[l_ac].stjc004,g_stjc_d[l_ac].stjc005,g_stjc_d[l_ac].stjc006, 
          g_stjc_d[l_ac].stjc001,g_stjc_d[l_ac].stjcsite,g_stjc_d[l_ac].stjcunit,g_stjc_d[l_ac].stjc002_desc  
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
         #费用性质
         SELECT stae004 INTO g_stjc_d[l_ac].stae004
           FROM stae_t
          WHERE staeent = g_enterprise
            AND stae001 = g_stjc_d[l_ac].stjc002
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
   IF astt805_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stjd002,stjdseq,stjd003,stjd004,stjd001,stjdsite,stjdunit ,t2.stael003 FROM stjd_t", 
                
                     " INNER JOIN  stem_t ON stement = " ||g_enterprise|| " AND stemdocno = stjddocno ",
 
                     "",
                     
                                    " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=stjd003 AND t2.stael002='"||g_dlang||"' ",
 
                     " WHERE stjdent=? AND stjddocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         LET g_sql = g_sql CLIPPED," AND stjd002 = '1' "
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stjd_t.stjdseq,stjd_t.stjd002"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt805_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astt805_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stem_m.stemdocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stem_m.stemdocno INTO g_stjc2_d[l_ac].stjd002,g_stjc2_d[l_ac].stjdseq, 
          g_stjc2_d[l_ac].stjd003,g_stjc2_d[l_ac].stjd004,g_stjc2_d[l_ac].stjd001,g_stjc2_d[l_ac].stjdsite, 
          g_stjc2_d[l_ac].stjdunit,g_stjc2_d[l_ac].stjd003_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         #费用性质
         SELECT stae004 INTO g_stjc2_d[l_ac].stae004
           FROM stae_t
          WHERE staeent = g_enterprise
            AND stae001 = g_stjc2_d[l_ac].stjd003
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
   IF astt805_fill_chk(3) THEN
      IF g_action_choice <> 'fetch' OR cl_null(g_action_choice) THEN
         LET g_sql = "SELECT  DISTINCT stjd002,stjdseq,stjd003,stjd004,stjd001,stjdsite,stjdunit ,t2.stael003 FROM stjd_t", 
                
                     " INNER JOIN stem_t ON stemdocno = stjddocno ",
 
                     "",
                     
                                    " LEFT JOIN stael_t t2 ON t2.staelent='"||g_enterprise||"' AND t2.stael001=stjd003 AND t2.stael002='"||g_dlang||"' ",
 
                     " WHERE stjdent=? AND stjddocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body2.fill_sql"
         LET g_sql = g_sql CLIPPED," AND stjd002 = '2' "
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stjd_t.stjdseq,stjd_t.stjd002"
         
         #add-point:單身填充控制 name="b_fill.sql2"

         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt805_pb3 FROM g_sql
         DECLARE b_fill_cs3 CURSOR FOR astt805_pb3
      END IF
    
      LET l_ac = 1
      
      OPEN b_fill_cs3 USING g_enterprise,g_stem_m.stemdocno
                                               
      FOREACH b_fill_cs3 INTO g_stjc3_d[l_ac].l_stjd002,g_stjc3_d[l_ac].l_stjdseq,g_stjc3_d[l_ac].l_stjd003, 
          g_stjc3_d[l_ac].l_stjd004,g_stjc3_d[l_ac].l_stjd001,g_stjc3_d[l_ac].l_stjdsite,g_stjc3_d[l_ac].l_stjdunit, 
          g_stjc3_d[l_ac].stjd003_desc_1
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         #费用性质
         SELECT stae004 INTO g_stjc3_d[l_ac].stae004
           FROM stae_t
          WHERE staeent = g_enterprise
            AND stae001 = g_stjc3_d[l_ac].l_stjd003
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
   #end add-point
   
   CALL g_stjc_d.deleteElement(g_stjc_d.getLength())
   CALL g_stjc2_d.deleteElement(g_stjc2_d.getLength())
   CALL g_stjc3_d.deleteElement(g_stjc3_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt805_pb
   FREE astt805_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stjc_d.getLength()
      LET g_stjc_d_mask_o[l_ac].* =  g_stjc_d[l_ac].*
      CALL astt805_stjc_t_mask()
      LET g_stjc_d_mask_n[l_ac].* =  g_stjc_d[l_ac].*
   END FOR
   
   LET g_stjc2_d_mask_o.* =  g_stjc2_d.*
   FOR l_ac = 1 TO g_stjc2_d.getLength()
      LET g_stjc2_d_mask_o[l_ac].* =  g_stjc2_d[l_ac].*
      CALL astt805_stjd_t_mask()
      LET g_stjc2_d_mask_n[l_ac].* =  g_stjc2_d[l_ac].*
   END FOR
   LET g_stjc3_d_mask_o.* =  g_stjc3_d.*
   FOR l_ac = 1 TO g_stjc3_d.getLength()
      LET g_stjc3_d_mask_o[l_ac].* =  g_stjc3_d[l_ac].*
      CALL astt805_stjd_t_mask()
      LET g_stjc3_d_mask_n[l_ac].* =  g_stjc3_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt805_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stjc_t
       WHERE stjcent = g_enterprise AND
         stjcdocno = ps_keys_bak[1] AND stjcseq = ps_keys_bak[2]
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
         CALL g_stjc_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2','3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stjd_t
       WHERE stjdent = g_enterprise AND
             stjddocno = ps_keys_bak[1] AND stjdseq = ps_keys_bak[2] AND stjd002 = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stjd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stjc2_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'3'" THEN 
         CALL g_stjc3_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt805_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stjc_t
                  (stjcent,
                   stjcdocno,
                   stjcseq
                   ,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001,stjcsite,stjcunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stjc_d[g_detail_idx].stjc002,g_stjc_d[g_detail_idx].stjc003,g_stjc_d[g_detail_idx].stjc004, 
                       g_stjc_d[g_detail_idx].stjc005,g_stjc_d[g_detail_idx].stjc006,g_stjc_d[g_detail_idx].stjc001, 
                       g_stjc_d[g_detail_idx].stjcsite,g_stjc_d[g_detail_idx].stjcunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stjc_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2','3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stjd_t
                  (stjdent,
                   stjddocno,
                   stjdseq,stjd002
                   ,stjd003,stjd004,stjd001,stjdsite,stjdunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_stjc2_d[g_detail_idx].stjd003,g_stjc2_d[g_detail_idx].stjd004,g_stjc2_d[g_detail_idx].stjd001, 
                       g_stjc2_d[g_detail_idx].stjdsite,g_stjc2_d[g_detail_idx].stjdunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stjd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stjc2_d.insertElement(li_idx) 
      END IF 
      IF ps_page <> "'3'" THEN 
         CALL g_stjc3_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt805_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stjc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt805_stjc_t_mask_restore('restore_mask_o')
               
      UPDATE stjc_t 
         SET (stjcdocno,
              stjcseq
              ,stjc002,stjc003,stjc004,stjc005,stjc006,stjc001,stjcsite,stjcunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stjc_d[g_detail_idx].stjc002,g_stjc_d[g_detail_idx].stjc003,g_stjc_d[g_detail_idx].stjc004, 
                  g_stjc_d[g_detail_idx].stjc005,g_stjc_d[g_detail_idx].stjc006,g_stjc_d[g_detail_idx].stjc001, 
                  g_stjc_d[g_detail_idx].stjcsite,g_stjc_d[g_detail_idx].stjcunit) 
         WHERE stjcent = g_enterprise AND stjcdocno = ps_keys_bak[1] AND stjcseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stjc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stjc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt805_stjc_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2','3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stjd_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astt805_stjd_t_mask_restore('restore_mask_o')
               
      UPDATE stjd_t 
         SET (stjddocno,
              stjdseq,stjd002
              ,stjd003,stjd004,stjd001,stjdsite,stjdunit) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_stjc2_d[g_detail_idx].stjd003,g_stjc2_d[g_detail_idx].stjd004,g_stjc2_d[g_detail_idx].stjd001, 
                  g_stjc2_d[g_detail_idx].stjdsite,g_stjc2_d[g_detail_idx].stjdunit) 
         WHERE stjdent = g_enterprise AND stjddocno = ps_keys_bak[1] AND stjdseq = ps_keys_bak[2] AND stjd002 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stjd_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stjd_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt805_stjd_t_mask_restore('restore_mask_n')
 
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
 
{<section id="astt805.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt805_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt805.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt805_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt805.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt805_lock_b(ps_table,ps_page)
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
   #CALL astt805_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stjc_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt805_bcl USING g_enterprise,
                                       g_stem_m.stemdocno,g_stjc_d[g_detail_idx].stjcseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt805_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2','3',"
   #僅鎖定自身table
   LET ls_group = "stjd_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt805_bcl2 USING g_enterprise,
                                             g_stem_m.stemdocno,g_stjc2_d[g_detail_idx].stjdseq,g_stjc2_d[g_detail_idx].stjd002 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt805_bcl2:",SQLERRMESSAGE 
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
 
{<section id="astt805.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt805_unlock_b(ps_table,ps_page)
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
      CLOSE astt805_bcl
   END IF
   
   LET ls_group = "'2','3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt805_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt805_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stemdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stemdocno",TRUE)
      CALL cl_set_comp_entry("stemdocdt",TRUE)
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
   CALL cl_set_comp_entry("stem025",TRUE)     #160604-00009#49 dongsz add
   CALL cl_set_comp_required("stem029",FALSE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt805_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_stje005      LIKE stje_t.stje005  #160604-00009#49 dongsz add
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
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stemdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stemdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stem001",FALSE)
   END IF
   
   IF NOT s_aooi500_comp_entry(g_prog,'stemsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stemsite",FALSE)
   END IF
   
   IF NOT cl_null(g_stem_m.stem028) AND g_stem_m.stem028 <> 0 THEN
      CALL cl_set_comp_required("stem029",TRUE)
   END IF
   
   #160604-00009#49--dongsz add--s
   #如果合同状态不为6.清退中，则开放维护终止结算日
   LET l_stje005 = ''
   SELECT stje005 INTO l_stje005
     FROM stje_t
    WHERE stjeent = g_enterprise
      AND stje001 = g_stem_m.stem001
   IF l_stje005 = '6' THEN
      CALL cl_set_comp_entry("stem025",FALSE)
   END IF
   #160604-00009#49--dongsz add--e
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt805_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("stjc006",TRUE) #160728-00006#30 add by geza 20160824
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt805_set_no_entry_b(p_cmd)
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
   #160728-00006#30 add by geza 20160824(S)
   IF g_stjc_d[l_ac].stjc005 = 'N' THEN
      CALL cl_set_comp_entry("stjc006",FALSE)
   END IF
   #160728-00006#30 add by geza 20160824(E)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt805_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("statechange,modify,delete,modify_detail",TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt805_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:2)
   IF g_stem_m.stemstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF



   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt805_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   CALL cl_set_act_visible("insert,delete", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt805.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt805_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   CALL cl_set_act_visible("insert,delete", FALSE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt805.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt805_default_search()
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
      LET ls_wc = ls_wc, " stemdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stem_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stjc_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stjd_t" 
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
 
{<section id="astt805.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt805_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_stemcnfdt      DATETIME YEAR TO SECOND
   DEFINE p_type           LIKE type_t.chr10     #类型 A优惠变更 B延期变更 C面积变更 D终止申请
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_errno          LIKE type_t.chr100    #add by geza 20160516 #160512-00003#5 
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
   
   OPEN astt805_cl USING g_enterprise,g_stem_m.stemdocno
   IF STATUS THEN
      CLOSE astt805_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt805_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
       g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
       g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
       g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
       g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
       g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
       g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
       g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
       g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
       g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt805_action_chk() THEN
      CLOSE astt805_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno,g_stem_m.stem001, 
       g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003,g_stem_m.stem003_desc, 
       g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc,g_stem_m.stem006, 
       g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011,g_stem_m.stem024, 
       g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029,g_stem_m.stem029_desc, 
       g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012,g_stem_m.stem012_desc, 
       g_stem_m.stem013,g_stem_m.stem013_desc,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus, 
       g_stem_m.stemownid,g_stem_m.stemownid_desc,g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid, 
       g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp,g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
       g_stem_m.stemmodid_desc,g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt 
 
 
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
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed,approved,withdraw,rejection,signing",TRUE)
      CALL cl_set_act_visible("reconciliate,unreconciliate",FALSE)
      CASE g_stem_m.stemstus
         WHEN "N"
            #HIDE OPTION "open"
            CALL cl_set_act_visible("unconfirmed,approved,withdraw,rejection,signing",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
                CALL cl_set_act_visible("confirmed",FALSE) #add by geza 20170204 #170117-00025#2
            END IF
       
         WHEN "X"
            #HIDE OPTION "invalid"
            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE)
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
       
         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("invalid,confirmed,approved,withdraw,rejection,signing",FALSE)
       
         WHEN "A"
            CALL cl_set_act_visible("confirmed ",TRUE)  #add by geza 20170204 #170117-00025#2
            CALL cl_set_act_visible("invalid,unconfirmed,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "D"
            #CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE)   #mark by geza 20170204 #170117-00025#2
            CALL cl_set_act_visible("unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE)   #add by geza 20170204 #170117-00025#2 
            
         WHEN "R"
            CALL cl_set_act_visible("unconfirmed,confirmed,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "W"
            CALL cl_set_act_visible("withdraw",TRUE)   #add by geza 20170204 #170117-00025#2
            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,approved,rejection,signing",FALSE)
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt805_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt805_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt805_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt805_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            #判断是否存在于合同申请档astt801
            IF NOT s_astt805_exist_t801(g_stem_m.stemdocno) THEN
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
            IF NOT cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
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
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
            #160604-00009#49--dongsz add--s
            #更新合同主档为清退中，并更新清退日期
            UPDATE stje_t SET stje005 = '6',
                              stje045 = g_stem_m.stem025
             WHERE stjeent = g_enterprise
               AND stje001 = g_stem_m.stem001
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "upd_stje005"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            #160604-00009#49--dongsz add--e
            #160324-00008#14 add by geza 20160505(S)
            LET p_type = 'D' 
            #合同不为空再根据参数判断是否要生成合同异动申请
            IF cl_get_para(g_enterprise,g_stem_m.stemsite,"S-CIR-2027")  = 'Y' AND g_stem_m.stem001 IS NOT NULL THEN
               #160512-00003#5 add by geza 20160516(S)
               CALL s_astt801_stie200_chk(p_type,g_stem_m.stemdocno) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               ELSE
                  CALL cl_err_collect_init()
                  CALL s_astt801_produce_auto(p_type,g_stem_m.stem001,g_stem_m.stemdocno) RETURNING l_success
                  CALL cl_err_collect_show()
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     RETURN
                  END IF
               END IF
               #160512-00003#5 add by geza 20160516(E)   
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
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
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
      CLOSE astt805_cl
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
      EXECUTE astt805_master_referesh USING g_stem_m.stemdocno INTO g_stem_m.stemsite,g_stem_m.stemdocdt, 
          g_stem_m.stemdocno,g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem003,g_stem_m.stem005, 
          g_stem_m.stem004,g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010, 
          g_stem_m.stem011,g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028, 
          g_stem_m.stem029,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033,g_stem_m.stem012, 
          g_stem_m.stem013,g_stem_m.stem034,g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid, 
          g_stem_m.stemowndp,g_stem_m.stemcrtid,g_stem_m.stemcrtdp,g_stem_m.stemcrtdt,g_stem_m.stemmodid, 
          g_stem_m.stemmoddt,g_stem_m.stemcnfid,g_stem_m.stemcnfdt,g_stem_m.stemsite_desc,g_stem_m.stem002_desc, 
          g_stem_m.stem003_desc,g_stem_m.stem005_desc,g_stem_m.stem004_desc,g_stem_m.stem029_desc,g_stem_m.stem012_desc, 
          g_stem_m.stem013_desc,g_stem_m.stemownid_desc,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid_desc, 
          g_stem_m.stemcrtdp_desc,g_stem_m.stemmodid_desc,g_stem_m.stemcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stem_m.stemsite,g_stem_m.stemsite_desc,g_stem_m.stemdocdt,g_stem_m.stemdocno, 
          g_stem_m.stem001,g_stem_m.stem016,g_stem_m.stem002,g_stem_m.stem002_desc,g_stem_m.stem003, 
          g_stem_m.stem003_desc,g_stem_m.stem005,g_stem_m.stem005_desc,g_stem_m.stem004,g_stem_m.stem004_desc, 
          g_stem_m.stem006,g_stem_m.stem017,g_stem_m.stem007,g_stem_m.stem009,g_stem_m.stem010,g_stem_m.stem011, 
          g_stem_m.stem024,g_stem_m.stem025,g_stem_m.stem026,g_stem_m.stem027,g_stem_m.stem028,g_stem_m.stem029, 
          g_stem_m.stem029_desc,g_stem_m.stem030,g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033, 
          g_stem_m.stem012,g_stem_m.stem012_desc,g_stem_m.stem013,g_stem_m.stem013_desc,g_stem_m.stem034, 
          g_stem_m.stemunit,g_stem_m.stem000,g_stem_m.stemstus,g_stem_m.stemownid,g_stem_m.stemownid_desc, 
          g_stem_m.stemowndp,g_stem_m.stemowndp_desc,g_stem_m.stemcrtid,g_stem_m.stemcrtid_desc,g_stem_m.stemcrtdp, 
          g_stem_m.stemcrtdp_desc,g_stem_m.stemcrtdt,g_stem_m.stemmodid,g_stem_m.stemmodid_desc,g_stem_m.stemmoddt, 
          g_stem_m.stemcnfid,g_stem_m.stemcnfid_desc,g_stem_m.stemcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt805_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt805_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt805.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt805_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stjc_d.getLength() THEN
         LET g_detail_idx = g_stjc_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stjc_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stjc_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stjc2_d.getLength() THEN
         LET g_detail_idx = g_stjc2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stjc2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stjc2_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_stjc3_d.getLength() THEN
         LET g_detail_idx = g_stjc3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stjc3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stjc3_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt805_b_fill2(pi_idx)
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
   
   CALL astt805_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt805_fill_chk(ps_idx)
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
 
{<section id="astt805.status_show" >}
PRIVATE FUNCTION astt805_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt805.mask_functions" >}
&include "erp/ast/astt805_mask.4gl"
 
{</section>}
 
{<section id="astt805.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt805_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success   LIKE type_t.num5 #add by geza 20170213 #170117-00025#2
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
 
 
   CALL astt805_show()
   CALL astt805_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   #add by geza 20170213 #170117-00025#2(S)
   CALL s_astt805_conf_chk(g_stem_m.stemdocno,g_stem_m.stemstus) RETURNING l_success
   IF NOT l_success THEN 
      RETURN FALSE 
   END IF
   #add by geza 20170213 #170117-00025#2(E)
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stem_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stjc_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_stjc2_d))
   CALL cl_bpm_set_detail_data("s_detail3", util.JSONArray.fromFGL(g_stjc3_d))
 
 
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
   #CALL astt805_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt805_ui_headershow()
   CALL astt805_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt805_draw_out()
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
   CALL astt805_ui_headershow()  
   CALL astt805_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt805.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt805_set_pk_array()
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
 
{<section id="astt805.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt805.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt805_msgcentre_notify(lc_state)
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
   CALL astt805_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stem_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt805.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt805_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
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
#        WHEN 'A'
#           LET g_errno = 'sub-00180'
        WHEN 'W'
           LET g_errno = 'sub-00180'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_stem_m.stemdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt805_set_act_visible()
        CALL astt805_set_act_no_visible()
        CALL astt805_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#41 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt805.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 合同编号带值
# Memo...........:
# Usage..........: CALL astt805_stem001_ref()
# Date & Author..: 160414 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt805_stem001_ref()


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
   
   #合同总额
   SELECT SUM(stjn006) INTO g_stem_m.stem030
     FROM stjn_t
    WHERE stjnent = g_enterprise
      AND stjn001 = g_stem_m.stem001
   IF cl_null(g_stem_m.stem030) THEN
      LET g_stem_m.stem030 = 0
   END IF
   DISPLAY BY NAME g_stem_m.stem030

END FUNCTION

################################################################################
# Descriptions...: 产生单身资料
# Memo...........:
# Usage..........: CALL astt805_ins_detail1()
# Date & Author..: 20160414 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt805_ins_detail1()
DEFINE l_sql      STRING

   #退场终止条款单身
   #先删除
   DELETE FROM stjc_t
    WHERE stjcent = g_enterprise
      AND stjcdocno = g_stem_m.stemdocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "del_stjc" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   
   #后新增
   LET l_sql = " INSERT INTO stjc_t (stjcent,stjcsite,stjcunit,stjcdocno,stjcseq, ",
               #"                     stjc001,stjc002,stjc003,stjc004,stjc005) ", #mark by geza 20160824 #160728-00006#30
               "                     stjc001,stjc002,stjc003,stjc004,stjc005,stjc006) ", #add by geza 20160824 #160728-00006#30
               " SELECT DISTINCT ",g_enterprise,",stemsite,stemunit,stemdocno,ROWNUM, ",
               #"        stem001,stjf004,stjf003,stjc004,'N' ", #mark by geza 20160824 #160728-00006#30
               "        stem001,stjf004,stjf003,stjc004,'N','N' ", #add by geza 20160824 #160728-00006#30
               "   FROM ( ",
               " SELECT DISTINCT stemsite,stemunit,stemdocno, ",
               "        stem001,stjf004,stjf003,'1' stjc004 ",
               "   FROM stem_t,stjf_t ",
               "  WHERE stement = stjfent AND stement = ",g_enterprise," ",
               "    AND stem001 = stjf001 ",
               #排除掉变动的费用
               "    AND stjf009 <> '2' ", #add by geza 20160831 #160728-00006#43
               "    AND stemdocno = '",g_stem_m.stemdocno,"' ",
               " UNION ",
               " SELECT DISTINCT stemsite,stemunit,stemdocno, ",
               "        stem001,stjh002,stjh003,'2' stjc004 ",
               "   FROM stem_t,stjh_t ",
               "  WHERE stement = stjhent AND stement = ",g_enterprise," ",
               "    AND stem001 = stjh001 ",
               #排除掉变动的费用
               "    AND NOT EXISTS (SELECT 1 FROM stji_t WHERE stjient = stement AND stji001 = stem001 AND stji009 = '2' AND stji002 = stjh002) ", #add by geza 20160831 #160728-00006#43
               "    AND stemdocno = '",g_stem_m.stemdocno,"') ",
               "  ORDER BY stjf004,stjc004,stjf003 "
   PREPARE ins_stjc_pre FROM l_sql
   EXECUTE ins_stjc_pre
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "ins_stjc" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 产生单身资料
# Memo...........:
# Usage..........: CALL astt805_ins_detail2()
# Date & Author..: 20160415 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt805_ins_detail2()
DEFINE l_sql      STRING
   
   #已付款单身
   #先删除
   DELETE FROM stjd_t
    WHERE stjdent = g_enterprise
      AND stjddocno = g_stem_m.stemdocno
      AND stjd002 = '1'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "del_stjd_1" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   
   #后新增
   LET l_sql = " INSERT INTO stjd_t (stjdent,stjdsite,stjdunit,stjddocno,stjdseq, ",
               "                     stjd001,stjd002,stjd003,stjd004) ",
               " SELECT ",g_enterprise,",stemsite,stemunit,stemdocno,ROWNUM, ",
               "        stem001,'1',stjm003,sum1 ",
               "   FROM stem_t, ",
               "        (SELECT stjm001,stjm003,COALESCE(SUM(stjm011),0) sum1 ",
               "           FROM stjm_t ",
               "          WHERE stjment = ",g_enterprise," ",
               "            AND stjm001 = '",g_stem_m.stem001,"' ",
               #"            AND stjm016 IS NOT NULL ", #mark by geza 20160826 #160728-00006#30
               "            AND stjm015 = 'Y' ", #add by geza 20160826 #160728-00006#30
               "          GROUP BY stjm001,stjm003) ",
               "  WHERE stement = ",g_enterprise," ",
               "    AND stemdocno = '",g_stem_m.stemdocno,"' ",
               "    AND stem001 = stjm001 ",
               "  ORDER BY stjm003 "
   PREPARE ins_stjd_pre1 FROM l_sql
   EXECUTE ins_stjd_pre1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "ins_stjd_1" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 产生单身资料
# Memo...........:
# Usage..........: CALL astt805_ins_detail3()
# Date & Author..: 20160415 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt805_ins_detail3()
DEFINE l_sql          STRING
DEFINE l_sql1         STRING
DEFINE l_stjc002      LIKE stjc_t.stjc002
DEFINE l_stjc003      LIKE stjc_t.stjc003
DEFINE l_stjc004      LIKE stjc_t.stjc004
DEFINE l_stjc005      LIKE stjc_t.stjc005
DEFINE l_stjc006      LIKE stjc_t.stjc006
DEFINE l_stjd004      LIKE stjd_t.stjd004
DEFINE l_stjd004_sum  LIKE stjd_t.stjd004
DEFINE l_stjdseq      LIKE stjd_t.stjdseq
DEFINE l_stjd004_1      LIKE stjd_t.stjd004 #记录已产生不退的费用
   #应扣款单身
   #先删除
   DELETE FROM stjd_t
    WHERE stjdent = g_enterprise
      AND stjddocno = g_stem_m.stemdocno
      AND stjd002 = '2'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "del_stjd_2" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF

   #后新增
   LET l_stjdseq = 0
   LET l_sql = " SELECT DISTINCT stjc002 FROM stjc_t ",
               "  WHERE stjcent = ",g_enterprise," ",
               "    AND stjcdocno = '",g_stem_m.stemdocno,"' ",
               "  ORDER BY stjc002 "
   PREPARE sel_stjc_pre FROM l_sql
   DECLARE sel_stjc_cs  CURSOR FOR sel_stjc_pre
   FOREACH sel_stjc_cs  INTO l_stjc002
      LET l_stjd004_sum = 0
      LET l_sql1 = " SELECT DISTINCT stjc003,stjc004,stjc005,stjc006 FROM stjc_t ",
                   "  WHERE stjcent = ",g_enterprise," ",
                   "    AND stjcdocno = '",g_stem_m.stemdocno,"' ",
                   "    AND stjc002 = '",l_stjc002,"' "
      PREPARE sel_stjc_pre1 FROM l_sql1
      DECLARE sel_stjc_cs1  CURSOR FOR sel_stjc_pre1
      FOREACH sel_stjc_cs1  INTO l_stjc003,l_stjc004,l_stjc005,l_stjc006
         LET l_stjd004 = 0
         LET l_stjd004_1 = 0
         #mark by geza 20160826 #160728-00006#30(S)
         #(标准费用及费用退)或(优惠费用及回收)时，抓取起租日到终止日的SUM（日核算）
#         IF (l_stjc004 = '1' AND l_stjc005 = 'Y') OR (l_stjc004 = '2' AND l_stjc005 <> 'Y') THEN
#            IF cl_null(l_stjc003) THEN
#               SELECT SUM(stjn006) INTO l_stjd004
#                 FROM stjn_t
#                WHERE stjnent = g_enterprise
#                  AND stjn001 = g_stem_m.stem001
#                  AND stjn005 = l_stjc002
#                  AND stjn007 IS NULL
#                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
#                  AND stjn002 <= g_stem_m.stem025
#            ELSE
#               SELECT SUM(stjn006) INTO l_stjd004
#                 FROM stjn_t
#                WHERE stjnent = g_enterprise
#                  AND stjn001 = g_stem_m.stem001
#                  AND stjn005 = l_stjc002
#                  AND stjn007 = l_stjc003
#                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
#                  AND stjn002 <= g_stem_m.stem025
#            END IF
#            IF cl_null(l_stjd004) THEN
#               LET l_stjd004 = 0
#            END IF
#         END IF
#         #(标准费用及费用不退)或(优惠费用及费用不回收)时，抓取合同期的sum（日核算）
#         IF (l_stjc004 = '1' AND l_stjc005 <> 'Y') OR (l_stjc004 = '2' AND l_stjc005 = 'Y') THEN
#            IF cl_null(l_stjc003) THEN
#               SELECT SUM(stjn006) INTO l_stjd004
#                 FROM stjn_t
#                WHERE stjnent = g_enterprise
#                  AND stjn001 = g_stem_m.stem001
#                  AND stjn005 = l_stjc002
#                  AND stjn007 IS NULL
#            ELSE
#               SELECT SUM(stjn006) INTO l_stjd004
#                 FROM stjn_t
#                WHERE stjnent = g_enterprise
#                  AND stjn001 = g_stem_m.stem001
#                  AND stjn005 = l_stjc002
#                  AND stjn007 = l_stjc003
#            END IF
#            IF cl_null(l_stjd004) THEN
#               LET l_stjd004 = 0
#            END IF
#         END IF
         #mark by geza 20160826 #160728-00006#30(E)
         #add by geza 20160826 #160728-00006#30(S)
         #(标准费用及费用退)或(优惠费用及回收)时，已产生的费用退，抓取起租日到终止日的SUM（日核算）
         IF l_stjc005 = 'Y' AND l_stjc006 = 'Y' THEN
            IF cl_null(l_stjc003) THEN
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 IS NULL
                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
                  AND stjn002 <= g_stem_m.stem025
            ELSE
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 = l_stjc003
                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
                  AND stjn002 <= g_stem_m.stem025
            END IF
            IF cl_null(l_stjd004) THEN
               LET l_stjd004 = 0
            END IF
         END IF
          #(标准费用及费用退)或(优惠费用及回收)时，已产生的费用不退，抓取起租日到终止日的SUM（日核算）+终止日之后不退的费用
         IF l_stjc005 = 'Y' AND l_stjc006 = 'N' THEN
            IF cl_null(l_stjc003) THEN
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 IS NULL
                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
                  AND stjn002 <= g_stem_m.stem025
               #抓取已产生不退的费用   
               SELECT SUM(stjn006) INTO l_stjd004_1
                 FROM stjn_t,stjm_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = stjm001
                  AND stjnent = stjment
                  AND stjm003 = stjn005
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 IS NULL
                  AND stjn002 > g_stem_m.stem025   
                  AND stjn002 BETWEEN stjm005 AND stjm006
                  AND stjm015 = 'Y'                  
               LET l_stjd004 = l_stjd004+l_stjd004_1
            ELSE
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 = l_stjc003
                  #AND stjn002 >= g_stem_m.stem009 #mark by geza 20160826 #160728-00006#30
                  AND stjn002 <= g_stem_m.stem025
                    #抓取已产生不退的费用   
                      SELECT SUM(stjn006) INTO l_stjd004_1
                 FROM stjn_t,stjm_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = stjm001
                  AND stjnent = stjment
                  AND stjm003 = stjn005
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 = l_stjc003
                  AND stjn002 > g_stem_m.stem025   
                  AND stjn002 BETWEEN stjm005 AND stjm006
                  AND stjm015 = 'Y'    
               LET l_stjd004 = l_stjd004+l_stjd004_1
            END IF
            IF cl_null(l_stjd004) THEN
               LET l_stjd004 = 0
            END IF
         END IF
         #(标准费用及费用不退)或(优惠费用及费用不回收)时，抓取合同期的sum（日核算）
         IF l_stjc005 <> 'Y' AND l_stjc006 <> 'Y' THEN
            IF cl_null(l_stjc003) THEN
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 IS NULL
            ELSE
               SELECT SUM(stjn006) INTO l_stjd004
                 FROM stjn_t
                WHERE stjnent = g_enterprise
                  AND stjn001 = g_stem_m.stem001
                  AND stjn005 = l_stjc002
                  AND stjn007 = l_stjc003
            END IF
            IF cl_null(l_stjd004) THEN
               LET l_stjd004 = 0
            END IF
         END IF
         #add by geza 20160826 #160728-00006#30(E)
         #同一费用编号的费用金额汇总
         LET l_stjd004_sum = l_stjd004_sum + l_stjd004
         
         LET l_stjc003 = ''
         LET l_stjc004 = ''
         LET l_stjc005 = ''
      END FOREACH
      
      LET l_stjdseq = l_stjdseq + 1
      #写入应扣款单身
      INSERT INTO stjd_t (stjdent,stjdsite,stjdunit,stjddocno,stjdseq,stjd001,stjd002,stjd003,stjd004)
      VALUES (g_enterprise,g_stem_m.stemsite,g_stem_m.stemunit,g_stem_m.stemdocno,l_stjdseq,
              g_stem_m.stem001,'2',l_stjc002,l_stjd004_sum)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "ins_stjd_2" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN FALSE
      END IF
      
      LET l_stjc002 = ''
   END FOREACH
   
   RETURN TRUE
   
END FUNCTION

################################################################################
# Descriptions...: 回写单头栏位
# Memo...........:
# Usage..........: CALL astt805_upd_stem()
#                : p_type  类型 1.只更新显示 2.更新表资料
# Date & Author..: 2016/04/15 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt805_upd_stem(p_type)
DEFINE p_type      LIKE type_t.chr1

   #已付款金额
   SELECT SUM(stjd004) INTO g_stem_m.stem031 
     FROM stjd_t
    WHERE stjdent = g_enterprise
      AND stjddocno = g_stem_m.stemdocno
      AND stjd002 = '1'
   IF cl_null(g_stem_m.stem031) THEN
      LET g_stem_m.stem031 = 0
   END IF
   
   #应扣款金额
   SELECT SUM(stjd004) INTO g_stem_m.stem032 
     FROM stjd_t
    WHERE stjdent = g_enterprise
      AND stjddocno = g_stem_m.stemdocno
      AND stjd002 = '2'
   IF cl_null(g_stem_m.stem032) THEN
      LET g_stem_m.stem032 = 0
   END IF
   
   #应退款金额
   IF cl_null(g_stem_m.stem028) THEN
      LET g_stem_m.stem033 = g_stem_m.stem031 - g_stem_m.stem032
   ELSE
      #甲方违约
      IF g_stem_m.stem026 = '1' THEN
         LET g_stem_m.stem033 = g_stem_m.stem031 - g_stem_m.stem032 - g_stem_m.stem028
      #乙方违约
      ELSE
         LET g_stem_m.stem033 = g_stem_m.stem031 - g_stem_m.stem032 + g_stem_m.stem028
      END IF
   END IF
   
   IF p_type = '2' THEN
      UPDATE stem_t SET stem031 = g_stem_m.stem031,
                        stem032 = g_stem_m.stem032,
                        stem033 = g_stem_m.stem033
       WHERE stement = g_enterprise
         AND stemdocno = g_stem_m.stemdocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd_stem" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN FALSE
      END IF
   END IF
   
   DISPLAY BY NAME g_stem_m.stem031,g_stem_m.stem032,g_stem_m.stem033
   
   RETURN TRUE
END FUNCTION

 
{</section>}
 
