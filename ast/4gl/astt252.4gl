#該程式未解開Section, 採用最新樣板產出!
{<section id="astt252.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0012(2016-06-28 19:02:30), PR版次:0012(2016-12-23 10:20:33)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000045
#+ Filename...: astt252
#+ Description: 費用標準設定申請作業
#+ Creator....: 06814(2016-03-25 11:46:25)
#+ Modifier...: 06189 -SD/PR- 07900
 
{</section>}
 
{<section id="astt252.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160604-00009#104 add by geza  20160623  a画面显示和录入金额的截位参考aoos020的金额小数位数S-CIR-2023
#160604-00009#138 add by geza  20160718  计算方式增加6交款金额
#160816-00068#17      By 08209 20160819  調整transaction
#160818-00017#38 2016-08-30 By 08734 删除修改未重新判断状态码
#161223-00004#1  2016/12/23 By 07900  'g_enterpise'->'g_enterprise'
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
PRIVATE type type_g_sthe_m        RECORD
       sthesite LIKE sthe_t.sthesite, 
   sthesite_desc LIKE type_t.chr80, 
   sthedocdt LIKE sthe_t.sthedocdt, 
   sthedocno LIKE sthe_t.sthedocno, 
   sthe000 LIKE sthe_t.sthe000, 
   sthe002 LIKE sthe_t.sthe002, 
   sthe003 LIKE sthe_t.sthe003, 
   sthel002 LIKE sthel_t.sthel002, 
   sthe004 LIKE sthe_t.sthe004, 
   sthe004_desc LIKE type_t.chr80, 
   sthe005 LIKE sthe_t.sthe005, 
   sthe006 LIKE sthe_t.sthe006, 
   sthe007 LIKE sthe_t.sthe007, 
   sthe008 LIKE sthe_t.sthe008, 
   sthe008_desc LIKE type_t.chr80, 
   sthe009 LIKE sthe_t.sthe009, 
   sthe009_desc LIKE type_t.chr80, 
   sthe001 LIKE sthe_t.sthe001, 
   stheunit LIKE sthe_t.stheunit, 
   sthestus LIKE sthe_t.sthestus, 
   stheownid LIKE sthe_t.stheownid, 
   stheownid_desc LIKE type_t.chr80, 
   stheowndp LIKE sthe_t.stheowndp, 
   stheowndp_desc LIKE type_t.chr80, 
   sthecrtid LIKE sthe_t.sthecrtid, 
   sthecrtid_desc LIKE type_t.chr80, 
   sthecrtdp LIKE sthe_t.sthecrtdp, 
   sthecrtdp_desc LIKE type_t.chr80, 
   sthecrtdt LIKE sthe_t.sthecrtdt, 
   sthemodid LIKE sthe_t.sthemodid, 
   sthemodid_desc LIKE type_t.chr80, 
   sthemoddt LIKE sthe_t.sthemoddt, 
   sthecnfid LIKE sthe_t.sthecnfid, 
   sthecnfid_desc LIKE type_t.chr80, 
   sthecnfdt LIKE sthe_t.sthecnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sthf_d        RECORD
       sthfseq LIKE sthf_t.sthfseq, 
   sthf002 LIKE sthf_t.sthf002, 
   sthf002_desc LIKE type_t.chr500, 
   sthf003 LIKE sthf_t.sthf003, 
   sthf003_desc LIKE type_t.chr500, 
   sthf004 LIKE sthf_t.sthf004, 
   sthf004_desc LIKE type_t.chr500, 
   sthf005 LIKE sthf_t.sthf005, 
   sthf005_desc LIKE type_t.chr500, 
   sthf006 LIKE sthf_t.sthf006, 
   sthf006_desc LIKE type_t.chr500, 
   sthf007 LIKE sthf_t.sthf007, 
   sthf007_desc LIKE type_t.chr500, 
   sthf008 LIKE sthf_t.sthf008, 
   sthf009 LIKE sthf_t.sthf009, 
   sthf010 LIKE sthf_t.sthf010, 
   sthf011 LIKE sthf_t.sthf011, 
   sthfsite LIKE sthf_t.sthfsite, 
   sthfunit LIKE sthf_t.sthfunit, 
   sthf001 LIKE sthf_t.sthf001
       END RECORD
PRIVATE TYPE type_g_sthf2_d RECORD
       sthgseq1 LIKE sthg_t.sthgseq1, 
   sthg001 LIKE sthg_t.sthg001, 
   sthg002 LIKE sthg_t.sthg002, 
   sthg003 LIKE sthg_t.sthg003, 
   sthg004 LIKE sthg_t.sthg004, 
   sthg005 LIKE sthg_t.sthg005, 
   sthg006 LIKE sthg_t.sthg006, 
   sthg007 LIKE sthg_t.sthg007, 
   sthg008 LIKE sthg_t.sthg008, 
   sthg009 LIKE sthg_t.sthg009, 
   sthg010 LIKE sthg_t.sthg010, 
   sthgsite LIKE sthg_t.sthgsite, 
   sthgunit LIKE sthg_t.sthgunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sthesite LIKE sthe_t.sthesite,
   b_sthesite_desc LIKE type_t.chr80,
      b_sthedocdt LIKE sthe_t.sthedocdt,
      b_sthedocno LIKE sthe_t.sthedocno,
      b_sthe000 LIKE sthe_t.sthe000,
      b_sthe002 LIKE sthe_t.sthe002,
   b_sthedocno_desc LIKE type_t.chr80,
      b_sthe003 LIKE sthe_t.sthe003,
      b_sthe004 LIKE sthe_t.sthe004,
   b_sthe004_desc LIKE type_t.chr80,
      b_sthe005 LIKE sthe_t.sthe005,
      b_sthe006 LIKE sthe_t.sthe006,
      b_sthe007 LIKE sthe_t.sthe007,
      b_sthe008 LIKE sthe_t.sthe008,
   b_sthe008_desc LIKE type_t.chr80,
      b_sthe009 LIKE sthe_t.sthe009,
   b_sthe009_desc LIKE type_t.chr80,
      b_stheunit LIKE sthe_t.stheunit
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
TYPE type_g_sthf3_d      RECORD
        sthhseq2         LIKE sthh_t.sthhseq2, 
        sthh001          LIKE sthh_t.sthh001, 
        sthh002          LIKE sthh_t.sthh002, 
        sthh003          LIKE sthh_t.sthh003, 
        sthh004          LIKE sthh_t.sthh004, 
        sthh005          LIKE sthh_t.sthh005,
        sthhsite         LIKE sthh_t.sthhsite, 
        sthhunit         LIKE sthh_t.sthhunit
                         END RECORD
DEFINE g_sthf3_d         DYNAMIC ARRAY OF type_g_sthf3_d
DEFINE g_sthf3_d_t       type_g_sthf3_d
DEFINE g_sthf3_d_o       type_g_sthf3_d
DEFINE g_sthf3_d_mask_o  DYNAMIC ARRAY OF type_g_sthf3_d #轉換遮罩前資料
DEFINE g_sthf3_d_mask_n  DYNAMIC ARRAY OF type_g_sthf3_d #轉換遮罩後資料
DEFINE g_wc2_table3      STRING
DEFINE g_detail_idx3     LIKE type_t.num10
                          
DEFINE g_ooef004         LIKE ooef_t.ooef004
DEFINE g_ooef019         LIKE ooef_t.ooef019
DEFINE g_site_flag       LIKE type_t.num5
DEFINE g_reproduce_flag  LIKE type_t.chr1      #160604-00009#25 20160620 add by beckxie

DEFINE g_sthc002         LIKE sthc_t.sthc002   #紀錄sthc_t flag
DEFINE g_sthc003         LIKE sthc_t.sthc003   #紀錄sthc_t flag
DEFINE g_sthc004         LIKE sthc_t.sthc004   #紀錄sthc_t flag
DEFINE g_sthc005         LIKE sthc_t.sthc005   #紀錄sthc_t flag
DEFINE g_sthc006         LIKE sthc_t.sthc006   #紀錄sthc_t flag
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sthe_m          type_g_sthe_m
DEFINE g_sthe_m_t        type_g_sthe_m
DEFINE g_sthe_m_o        type_g_sthe_m
DEFINE g_sthe_m_mask_o   type_g_sthe_m #轉換遮罩前資料
DEFINE g_sthe_m_mask_n   type_g_sthe_m #轉換遮罩後資料
 
   DEFINE g_sthedocno_t LIKE sthe_t.sthedocno
 
 
DEFINE g_sthf_d          DYNAMIC ARRAY OF type_g_sthf_d
DEFINE g_sthf_d_t        type_g_sthf_d
DEFINE g_sthf_d_o        type_g_sthf_d
DEFINE g_sthf_d_mask_o   DYNAMIC ARRAY OF type_g_sthf_d #轉換遮罩前資料
DEFINE g_sthf_d_mask_n   DYNAMIC ARRAY OF type_g_sthf_d #轉換遮罩後資料
DEFINE g_sthf2_d          DYNAMIC ARRAY OF type_g_sthf2_d
DEFINE g_sthf2_d_t        type_g_sthf2_d
DEFINE g_sthf2_d_o        type_g_sthf2_d
DEFINE g_sthf2_d_mask_o   DYNAMIC ARRAY OF type_g_sthf2_d #轉換遮罩前資料
DEFINE g_sthf2_d_mask_n   DYNAMIC ARRAY OF type_g_sthf2_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
DEFINE g_master_multi_table_t    RECORD
      stheldocno LIKE sthel_t.stheldocno,
      sthel002 LIKE sthel_t.sthel002
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
 
{<section id="astt252.main" >}
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
   LET g_forupd_sql = " SELECT sthesite,'',sthedocdt,sthedocno,sthe000,sthe002,sthe003,'',sthe004,'', 
       sthe005,sthe006,sthe007,sthe008,'',sthe009,'',sthe001,stheunit,sthestus,stheownid,'',stheowndp, 
       '',sthecrtid,'',sthecrtdp,'',sthecrtdt,sthemodid,'',sthemoddt,sthecnfid,'',sthecnfdt", 
                      " FROM sthe_t",
                      " WHERE stheent= ? AND sthedocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt252_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sthesite,t0.sthedocdt,t0.sthedocno,t0.sthe000,t0.sthe002,t0.sthe003, 
       t0.sthe004,t0.sthe005,t0.sthe006,t0.sthe007,t0.sthe008,t0.sthe009,t0.sthe001,t0.stheunit,t0.sthestus, 
       t0.stheownid,t0.stheowndp,t0.sthecrtid,t0.sthecrtdp,t0.sthecrtdt,t0.sthemodid,t0.sthemoddt,t0.sthecnfid, 
       t0.sthecnfdt,t1.ooefl003 ,t2.stael003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 , 
       t8.ooefl003 ,t9.ooag011 ,t10.ooag011",
               " FROM sthe_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthesite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=t0.sthe004 AND t2.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.sthe008  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.sthe009 AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stheownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stheowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.sthecrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.sthecrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.sthemodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.sthecnfid  ",
 
               " WHERE t0.stheent = " ||g_enterprise|| " AND t0.sthedocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   LET g_sql = g_sql," AND t0.sthe001 = '",g_argv[01],"'"
   #end add-point
   PREPARE astt252_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt252 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt252_init()   
 
      #進入選單 Menu (="N")
      CALL astt252_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt252
      
   END IF 
   
   CLOSE astt252_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   CALL s_aooi390_drop_tmp_table() 
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt252.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt252_init()
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
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('sthestus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('sthe000','32') 
   CALL cl_set_combo_scc('sthe001','6908') 
   CALL cl_set_combo_scc('sthf008','6920') 
   CALL cl_set_combo_scc('sthf010','6909') 
   CALL cl_set_combo_scc('sthf011','6904') 
   CALL cl_set_combo_scc('sthg007','6010') 
   CALL cl_set_combo_scc('sthg010','6011') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('sthg010','6011','1,2,3')   #160229-00001#27 20160506 add by beckxie
   CALL cl_set_combo_scc('b_sthe000','32') 
   CALL astt252_set_comp_visible()
   CALL astt252_set_comp_no_visible()
   CALL s_aooi500_create_temp() RETURNING l_success
   CALL s_aooi390_cre_tmp_table() RETURNING l_success
   LET g_reproduce_flag = 'N'   #160604-00009#25 20160620 add by beckxie
   #add by geza 20160623 160604-00009#104(S)
   CALL s_asti800_set_comp_format("sthg005",g_site,'1')
   CALL s_asti800_set_comp_format("sthg008",g_site,'1')
   CALL s_asti800_set_comp_format("sthh004",g_site,'1')   
   #add by geza 20160623 160604-00009#104(E)
   #end add-point
   
   #初始化搜尋條件
   CALL astt252_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt252.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt252_ui_dialog()
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
            CALL astt252_insert()
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
         INITIALIZE g_sthe_m.* TO NULL
         CALL g_sthf_d.clear()
         CALL g_sthf2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt252_init()
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
               
               CALL astt252_fetch('') # reload data
               LET l_ac = 1
               CALL astt252_ui_detailshow() #Setting the current row 
         
               CALL astt252_idx_chk()
               #NEXT FIELD sthfseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sthf_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt252_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               CALL astt252_b_fill2('2')
 
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               CALL g_sthf3_d.clear()
               CALL astt252_b_fill3('3')
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
               CALL astt252_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
         #第二階單身段落
         DISPLAY ARRAY g_sthf2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt252_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx2 = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               CALL astt252_b_fill3('3')
               CALL astt252_set_comp_visible()
               CALL astt252_set_comp_no_visible()
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
               CALL astt252_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               CALL astt252_set_comp_visible()
               CALL astt252_set_comp_no_visible()
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            AFTER ROW 
               CALL astt252_set_comp_visible()
               CALL astt252_set_comp_no_visible()
            #end add-point
         
         END DISPLAY
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_sthf3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)
            BEFORE ROW
               #顯示單身筆數
               CALL astt252_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx3 = l_ac
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
               CALL astt252_idx_chk()
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt252_browser_fill("")
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
               CALL astt252_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt252_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt252_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt252_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt252_set_act_visible()   
            CALL astt252_set_act_no_visible()
            IF NOT (g_sthe_m.sthedocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stheent = " ||g_enterprise|| " AND",
                                  " sthedocno = '", g_sthe_m.sthedocno, "' "
 
               #填到對應位置
               CALL astt252_browser_fill("")
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
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sthe_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthf_t" 
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
               CALL astt252_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "sthe_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sthf_t" 
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
                  CALL astt252_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt252_fetch("F")
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
               CALL astt252_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt252_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt252_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt252_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt252_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt252_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt252_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt252_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt252_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt252_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt252_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_sthf_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_sthf2_d)
                  LET g_export_id[2]   = "s_detail2"
 
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
               NEXT FIELD sthfseq
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
               CALL astt252_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt252_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt252_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt252_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt252_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt252_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt252_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               LET g_reproduce_flag = 'N'   #160604-00009#25 20160620 add by beckxie
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt252_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_sthe008
            LET g_action_choice="prog_sthe008"
            IF cl_auth_chk_act("prog_sthe008") THEN
               
               #add-point:ON ACTION prog_sthe008 name="menu.prog_sthe008"
               #應用 a45 樣板自動產生(Version:3)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_sthe_m.sthe008)
 



               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt252_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt252_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt252_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_sthe_m.sthedocdt)
 
 
 
         
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
 
{<section id="astt252.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt252_browser_fill(ps_page_action)
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
    CALL s_aooi500_sql_where(g_prog,'sthesite') RETURNING l_where
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
      LET l_sub_sql = " SELECT DISTINCT sthedocno ",
                      " FROM sthe_t ",
                      " ",
                      " LEFT JOIN sthf_t ON sthfent = stheent AND sthedocno = sthfdocno ", "  ",
                      #add-point:browser_fill段sql(sthf_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
                      " LEFT JOIN sthg_t ON sthgent = stheent AND sthfdocno = sthgdocno AND sthfseq = sthgseq", "  ",
                      #add-point:browser_fill段sql(sthg_t1) name="browser_fill.cnt.join.sthg_t1"
                      " LEFT JOIN sthh_t ON sthhent = sthfent AND sthhdocno = sthgdocno AND sthhseq = sthgseq AND sthhseq1 = sthgseq1",
                      #end add-point
 
 
                      " LEFT JOIN sthel_t ON sthelent = "||g_enterprise||" AND sthedocno = stheldocno AND sthel001 = '",g_dlang,"' ", 
                      " ", 
 
                      " ",
 
 
                      " WHERE stheent = " ||g_enterprise|| " AND sthfent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sthe_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sthedocno ",
                      " FROM sthe_t ", 
                      "  ",
                      "  LEFT JOIN sthel_t ON sthelent = "||g_enterprise||" AND sthedocno = stheldocno AND sthel001 = '",g_dlang,"' ",
                      " WHERE stheent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sthe_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   LET l_sub_sql = l_sub_sql," AND sthe001 = '",g_argv[01],"'"
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
      INITIALIZE g_sthe_m.* TO NULL
      CALL g_sthf_d.clear()        
      CALL g_sthf2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      CALL g_sthf3_d.clear() 
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sthesite,t0.sthedocdt,t0.sthedocno,t0.sthe000,t0.sthe002,t0.sthe003,t0.sthe004,t0.sthe005,t0.sthe006,t0.sthe007,t0.sthe008,t0.sthe009,t0.stheunit Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthestus,t0.sthesite,t0.sthedocdt,t0.sthedocno,t0.sthe000,t0.sthe002, 
          t0.sthe003,t0.sthe004,t0.sthe005,t0.sthe006,t0.sthe007,t0.sthe008,t0.sthe009,t0.stheunit,t1.ooefl003 , 
          t2.sthel002 ,t3.stael003 ,t4.ooag011 ,t5.ooefl003 ",
                  " FROM sthe_t t0",
                  "  ",
                  "  LEFT JOIN sthf_t ON sthfent = stheent AND sthedocno = sthfdocno ", "  ", 
                  #add-point:browser_fill段sql(sthf_t1) name="browser_fill.join.sthf_t1"
                  
                  #end add-point
 
                  "  LEFT JOIN sthg_t ON sthgent = stheent AND sthfdocno = sthgdocno AND sthfseq = sthgseq", "  ", 
                  #add-point:browser_fill段sql(sthg_t1) name="browser_fill.join.sthg_t1"
                  "  LEFT JOIN sthh_t ON sthhent = sthfent AND sthhdocno = sthgdocno AND sthhseq = sthgseq AND sthhseq1 = sthgseq1",
                  #end add-point
 
 
                  " ", 
 
                  " ",
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthesite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN sthel_t t2 ON t2.sthelent="||g_enterprise||" AND t2.stheldocno=t0.sthedocno AND t2.sthel001='"||g_dlang||"' ",
               " LEFT JOIN stael_t t3 ON t3.staelent="||g_enterprise||" AND t3.stael001=t0.sthe004 AND t3.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.sthe008  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.sthe009 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stheent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sthe_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sthestus,t0.sthesite,t0.sthedocdt,t0.sthedocno,t0.sthe000,t0.sthe002, 
          t0.sthe003,t0.sthe004,t0.sthe005,t0.sthe006,t0.sthe007,t0.sthe008,t0.sthe009,t0.stheunit,t1.ooefl003 , 
          t2.sthel002 ,t3.stael003 ,t4.ooag011 ,t5.ooefl003 ",
                  " FROM sthe_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.sthesite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN sthel_t t2 ON t2.sthelent="||g_enterprise||" AND t2.stheldocno=t0.sthedocno AND t2.sthel001='"||g_dlang||"' ",
               " LEFT JOIN stael_t t3 ON t3.staelent="||g_enterprise||" AND t3.stael001=t0.sthe004 AND t3.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.sthe008  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.sthe009 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stheent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sthe_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql," AND sthe001 = '",g_argv[01],"' and ",l_where
   #end add-point
   LET g_sql = g_sql, " ORDER BY sthedocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sthe_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sthesite,g_browser[g_cnt].b_sthedocdt, 
          g_browser[g_cnt].b_sthedocno,g_browser[g_cnt].b_sthe000,g_browser[g_cnt].b_sthe002,g_browser[g_cnt].b_sthe003, 
          g_browser[g_cnt].b_sthe004,g_browser[g_cnt].b_sthe005,g_browser[g_cnt].b_sthe006,g_browser[g_cnt].b_sthe007, 
          g_browser[g_cnt].b_sthe008,g_browser[g_cnt].b_sthe009,g_browser[g_cnt].b_stheunit,g_browser[g_cnt].b_sthesite_desc, 
          g_browser[g_cnt].b_sthedocno_desc,g_browser[g_cnt].b_sthe004_desc,g_browser[g_cnt].b_sthe008_desc, 
          g_browser[g_cnt].b_sthe009_desc
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
         CALL astt252_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_sthedocno) THEN
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
 
{<section id="astt252.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt252_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sthe_m.sthedocno = g_browser[g_current_idx].b_sthedocno   
 
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
   CALL astt252_sthe_t_mask()
   CALL astt252_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt252.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt252_ui_detailshow()
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
 
{<section id="astt252.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt252_ui_browser_refresh()
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
      IF g_browser[l_i].b_sthedocno = g_sthe_m.sthedocno 
 
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
 
{<section id="astt252.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt252_construct()
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
   INITIALIZE g_sthe_m.* TO NULL
   CALL g_sthf_d.clear()        
   CALL g_sthf2_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   CALL g_sthf3_d.clear() 
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sthesite,sthedocdt,sthedocno,sthe000,sthe002,sthe003,sthel002,sthe004, 
          sthe005,sthe006,sthe007,sthe008,sthe009,sthe001,stheunit,sthestus,stheownid,stheowndp,sthecrtid, 
          sthecrtdp,sthecrtdt,sthemodid,sthemoddt,sthecnfid,sthecnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
           
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sthecrtdt>>----
         AFTER FIELD sthecrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sthemoddt>>----
         AFTER FIELD sthemoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sthecnfdt>>----
         AFTER FIELD sthecnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sthepstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sthesite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthesite
            #add-point:ON ACTION controlp INFIELD sthesite name="construct.c.sthesite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthesite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthesite  #顯示到畫面上
            NEXT FIELD sthesite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthesite
            #add-point:BEFORE FIELD sthesite name="construct.b.sthesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthesite
            
            #add-point:AFTER FIELD sthesite name="construct.a.sthesite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthedocdt
            #add-point:BEFORE FIELD sthedocdt name="construct.b.sthedocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthedocdt
            
            #add-point:AFTER FIELD sthedocdt name="construct.a.sthedocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthedocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthedocdt
            #add-point:ON ACTION controlp INFIELD sthedocdt name="construct.c.sthedocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthedocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthedocno
            #add-point:ON ACTION controlp INFIELD sthedocno name="construct.c.sthedocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_sthedocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthedocno  #顯示到畫面上
            NEXT FIELD sthedocno                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthedocno
            #add-point:BEFORE FIELD sthedocno name="construct.b.sthedocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthedocno
            
            #add-point:AFTER FIELD sthedocno name="construct.a.sthedocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe000
            #add-point:BEFORE FIELD sthe000 name="construct.b.sthe000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe000
            
            #add-point:AFTER FIELD sthe000 name="construct.a.sthe000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe000
            #add-point:ON ACTION controlp INFIELD sthe000 name="construct.c.sthe000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthe002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe002
            #add-point:ON ACTION controlp INFIELD sthe002 name="construct.c.sthe002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " sthi001 = '",g_argv[1],"' and sthisite='",g_site,"'"   #160516-00023#1 20160518 add by beckxie
            CALL q_sthi002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthe002  #顯示到畫面上
            NEXT FIELD sthe002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe002
            #add-point:BEFORE FIELD sthe002 name="construct.b.sthe002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe002
            
            #add-point:AFTER FIELD sthe002 name="construct.a.sthe002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe003
            #add-point:BEFORE FIELD sthe003 name="construct.b.sthe003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe003
            
            #add-point:AFTER FIELD sthe003 name="construct.a.sthe003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe003
            #add-point:ON ACTION controlp INFIELD sthe003 name="construct.c.sthe003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthel002
            #add-point:BEFORE FIELD sthel002 name="construct.b.sthel002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthel002
            
            #add-point:AFTER FIELD sthel002 name="construct.a.sthel002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthel002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthel002
            #add-point:ON ACTION controlp INFIELD sthel002 name="construct.c.sthel002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthe004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe004
            #add-point:ON ACTION controlp INFIELD sthe004 name="construct.c.sthe004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthe004  #顯示到畫面上
            NEXT FIELD sthe004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe004
            #add-point:BEFORE FIELD sthe004 name="construct.b.sthe004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe004
            
            #add-point:AFTER FIELD sthe004 name="construct.a.sthe004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe005
            #add-point:BEFORE FIELD sthe005 name="construct.b.sthe005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe005
            
            #add-point:AFTER FIELD sthe005 name="construct.a.sthe005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe005
            #add-point:ON ACTION controlp INFIELD sthe005 name="construct.c.sthe005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe006
            #add-point:BEFORE FIELD sthe006 name="construct.b.sthe006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe006
            
            #add-point:AFTER FIELD sthe006 name="construct.a.sthe006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe006
            #add-point:ON ACTION controlp INFIELD sthe006 name="construct.c.sthe006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe007
            #add-point:BEFORE FIELD sthe007 name="construct.b.sthe007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe007
            
            #add-point:AFTER FIELD sthe007 name="construct.a.sthe007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe007
            #add-point:ON ACTION controlp INFIELD sthe007 name="construct.c.sthe007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthe008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe008
            #add-point:ON ACTION controlp INFIELD sthe008 name="construct.c.sthe008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthe008  #顯示到畫面上
            NEXT FIELD sthe008                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe008
            #add-point:BEFORE FIELD sthe008 name="construct.b.sthe008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe008
            
            #add-point:AFTER FIELD sthe008 name="construct.a.sthe008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe009
            #add-point:ON ACTION controlp INFIELD sthe009 name="construct.c.sthe009"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthe009  #顯示到畫面上
            NEXT FIELD sthe009                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe009
            #add-point:BEFORE FIELD sthe009 name="construct.b.sthe009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe009
            
            #add-point:AFTER FIELD sthe009 name="construct.a.sthe009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe001
            #add-point:BEFORE FIELD sthe001 name="construct.b.sthe001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe001
            
            #add-point:AFTER FIELD sthe001 name="construct.a.sthe001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthe001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe001
            #add-point:ON ACTION controlp INFIELD sthe001 name="construct.c.sthe001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stheunit
            #add-point:BEFORE FIELD stheunit name="construct.b.stheunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stheunit
            
            #add-point:AFTER FIELD stheunit name="construct.a.stheunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stheunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stheunit
            #add-point:ON ACTION controlp INFIELD stheunit name="construct.c.stheunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthestus
            #add-point:BEFORE FIELD sthestus name="construct.b.sthestus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthestus
            
            #add-point:AFTER FIELD sthestus name="construct.a.sthestus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthestus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthestus
            #add-point:ON ACTION controlp INFIELD sthestus name="construct.c.sthestus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stheownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stheownid
            #add-point:ON ACTION controlp INFIELD stheownid name="construct.c.stheownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stheownid  #顯示到畫面上
            NEXT FIELD stheownid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stheownid
            #add-point:BEFORE FIELD stheownid name="construct.b.stheownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stheownid
            
            #add-point:AFTER FIELD stheownid name="construct.a.stheownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stheowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stheowndp
            #add-point:ON ACTION controlp INFIELD stheowndp name="construct.c.stheowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stheowndp  #顯示到畫面上
            NEXT FIELD stheowndp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stheowndp
            #add-point:BEFORE FIELD stheowndp name="construct.b.stheowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stheowndp
            
            #add-point:AFTER FIELD stheowndp name="construct.a.stheowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthecrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthecrtid
            #add-point:ON ACTION controlp INFIELD sthecrtid name="construct.c.sthecrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthecrtid  #顯示到畫面上
            NEXT FIELD sthecrtid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthecrtid
            #add-point:BEFORE FIELD sthecrtid name="construct.b.sthecrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthecrtid
            
            #add-point:AFTER FIELD sthecrtid name="construct.a.sthecrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sthecrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthecrtdp
            #add-point:ON ACTION controlp INFIELD sthecrtdp name="construct.c.sthecrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthecrtdp  #顯示到畫面上
            NEXT FIELD sthecrtdp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthecrtdp
            #add-point:BEFORE FIELD sthecrtdp name="construct.b.sthecrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthecrtdp
            
            #add-point:AFTER FIELD sthecrtdp name="construct.a.sthecrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthecrtdt
            #add-point:BEFORE FIELD sthecrtdt name="construct.b.sthecrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthemodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthemodid
            #add-point:ON ACTION controlp INFIELD sthemodid name="construct.c.sthemodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthemodid  #顯示到畫面上
            NEXT FIELD sthemodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthemodid
            #add-point:BEFORE FIELD sthemodid name="construct.b.sthemodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthemodid
            
            #add-point:AFTER FIELD sthemodid name="construct.a.sthemodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthemoddt
            #add-point:BEFORE FIELD sthemoddt name="construct.b.sthemoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sthecnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthecnfid
            #add-point:ON ACTION controlp INFIELD sthecnfid name="construct.c.sthecnfid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthecnfid  #顯示到畫面上
            NEXT FIELD sthecnfid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthecnfid
            #add-point:BEFORE FIELD sthecnfid name="construct.b.sthecnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthecnfid
            
            #add-point:AFTER FIELD sthecnfid name="construct.a.sthecnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthecnfdt
            #add-point:BEFORE FIELD sthecnfdt name="construct.b.sthecnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sthfseq,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007,sthf008,sthf009, 
          sthf010,sthf011,sthfsite,sthfunit,sthf001
           FROM s_detail1[1].sthfseq,s_detail1[1].sthf002,s_detail1[1].sthf003,s_detail1[1].sthf004, 
               s_detail1[1].sthf005,s_detail1[1].sthf006,s_detail1[1].sthf007,s_detail1[1].sthf008,s_detail1[1].sthf009, 
               s_detail1[1].sthf010,s_detail1[1].sthf011,s_detail1[1].sthfsite,s_detail1[1].sthfunit, 
               s_detail1[1].sthf001
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfseq
            #add-point:BEFORE FIELD sthfseq name="construct.b.page1.sthfseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfseq
            
            #add-point:AFTER FIELD sthfseq name="construct.a.page1.sthfseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthfseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfseq
            #add-point:ON ACTION controlp INFIELD sthfseq name="construct.c.page1.sthfseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sthf002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf002
            #add-point:ON ACTION controlp INFIELD sthf002 name="construct.c.page1.sthf002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf002  #顯示到畫面上
            NEXT FIELD sthf002                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf002
            #add-point:BEFORE FIELD sthf002 name="construct.b.page1.sthf002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf002
            
            #add-point:AFTER FIELD sthf002 name="construct.a.page1.sthf002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf003
            #add-point:ON ACTION controlp INFIELD sthf003 name="construct.c.page1.sthf003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf003  #顯示到畫面上
            NEXT FIELD sthf003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf003
            #add-point:BEFORE FIELD sthf003 name="construct.b.page1.sthf003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf003
            
            #add-point:AFTER FIELD sthf003 name="construct.a.page1.sthf003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf004
            #add-point:ON ACTION controlp INFIELD sthf004 name="construct.c.page1.sthf004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhac003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf004  #顯示到畫面上
            NEXT FIELD sthf004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf004
            #add-point:BEFORE FIELD sthf004 name="construct.b.page1.sthf004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf004
            
            #add-point:AFTER FIELD sthf004 name="construct.a.page1.sthf004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf005
            #add-point:ON ACTION controlp INFIELD sthf005 name="construct.c.page1.sthf005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf005  #顯示到畫面上
            NEXT FIELD sthf005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf005
            #add-point:BEFORE FIELD sthf005 name="construct.b.page1.sthf005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf005
            
            #add-point:AFTER FIELD sthf005 name="construct.a.page1.sthf005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf006
            #add-point:ON ACTION controlp INFIELD sthf006 name="construct.c.page1.sthf006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "2144"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf006  #顯示到畫面上
            NEXT FIELD sthf006                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf006
            #add-point:BEFORE FIELD sthf006 name="construct.b.page1.sthf006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf006
            
            #add-point:AFTER FIELD sthf006 name="construct.a.page1.sthf006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf007
            #add-point:ON ACTION controlp INFIELD sthf007 name="construct.c.page1.sthf007"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbe001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sthf007  #顯示到畫面上
            NEXT FIELD sthf007                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf007
            #add-point:BEFORE FIELD sthf007 name="construct.b.page1.sthf007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf007
            
            #add-point:AFTER FIELD sthf007 name="construct.a.page1.sthf007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf008
            #add-point:BEFORE FIELD sthf008 name="construct.b.page1.sthf008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf008
            
            #add-point:AFTER FIELD sthf008 name="construct.a.page1.sthf008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf008
            #add-point:ON ACTION controlp INFIELD sthf008 name="construct.c.page1.sthf008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf009
            #add-point:BEFORE FIELD sthf009 name="construct.b.page1.sthf009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf009
            
            #add-point:AFTER FIELD sthf009 name="construct.a.page1.sthf009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf009
            #add-point:ON ACTION controlp INFIELD sthf009 name="construct.c.page1.sthf009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf010
            #add-point:BEFORE FIELD sthf010 name="construct.b.page1.sthf010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf010
            
            #add-point:AFTER FIELD sthf010 name="construct.a.page1.sthf010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf010
            #add-point:ON ACTION controlp INFIELD sthf010 name="construct.c.page1.sthf010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf011
            #add-point:BEFORE FIELD sthf011 name="construct.b.page1.sthf011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf011
            
            #add-point:AFTER FIELD sthf011 name="construct.a.page1.sthf011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf011
            #add-point:ON ACTION controlp INFIELD sthf011 name="construct.c.page1.sthf011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfsite
            #add-point:BEFORE FIELD sthfsite name="construct.b.page1.sthfsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfsite
            
            #add-point:AFTER FIELD sthfsite name="construct.a.page1.sthfsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthfsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfsite
            #add-point:ON ACTION controlp INFIELD sthfsite name="construct.c.page1.sthfsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfunit
            #add-point:BEFORE FIELD sthfunit name="construct.b.page1.sthfunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfunit
            
            #add-point:AFTER FIELD sthfunit name="construct.a.page1.sthfunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthfunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfunit
            #add-point:ON ACTION controlp INFIELD sthfunit name="construct.c.page1.sthfunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf001
            #add-point:BEFORE FIELD sthf001 name="construct.b.page1.sthf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf001
            
            #add-point:AFTER FIELD sthf001 name="construct.a.page1.sthf001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sthf001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf001
            #add-point:ON ACTION controlp INFIELD sthf001 name="construct.c.page1.sthf001"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
      CONSTRUCT g_wc2_table2 ON sthgseq1,sthg001,sthg002,sthg003,sthg004,sthg005,sthg006,sthg007,sthg008, 
          sthg009,sthg010,sthgsite,sthgunit
           FROM s_detail2[1].sthgseq1,s_detail2[1].sthg001,s_detail2[1].sthg002,s_detail2[1].sthg003, 
               s_detail2[1].sthg004,s_detail2[1].sthg005,s_detail2[1].sthg006,s_detail2[1].sthg007,s_detail2[1].sthg008, 
               s_detail2[1].sthg009,s_detail2[1].sthg010,s_detail2[1].sthgsite,s_detail2[1].sthgunit 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgseq1
            #add-point:BEFORE FIELD sthgseq1 name="construct.b.page2.sthgseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgseq1
            
            #add-point:AFTER FIELD sthgseq1 name="construct.a.page2.sthgseq1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthgseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgseq1
            #add-point:ON ACTION controlp INFIELD sthgseq1 name="construct.c.page2.sthgseq1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg001
            #add-point:BEFORE FIELD sthg001 name="construct.b.page2.sthg001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg001
            
            #add-point:AFTER FIELD sthg001 name="construct.a.page2.sthg001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg001
            #add-point:ON ACTION controlp INFIELD sthg001 name="construct.c.page2.sthg001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg002
            #add-point:BEFORE FIELD sthg002 name="construct.b.page2.sthg002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg002
            
            #add-point:AFTER FIELD sthg002 name="construct.a.page2.sthg002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg002
            #add-point:ON ACTION controlp INFIELD sthg002 name="construct.c.page2.sthg002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg003
            #add-point:BEFORE FIELD sthg003 name="construct.b.page2.sthg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg003
            
            #add-point:AFTER FIELD sthg003 name="construct.a.page2.sthg003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg003
            #add-point:ON ACTION controlp INFIELD sthg003 name="construct.c.page2.sthg003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg004
            #add-point:BEFORE FIELD sthg004 name="construct.b.page2.sthg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg004
            
            #add-point:AFTER FIELD sthg004 name="construct.a.page2.sthg004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg004
            #add-point:ON ACTION controlp INFIELD sthg004 name="construct.c.page2.sthg004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg005
            #add-point:BEFORE FIELD sthg005 name="construct.b.page2.sthg005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg005
            
            #add-point:AFTER FIELD sthg005 name="construct.a.page2.sthg005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg005
            #add-point:ON ACTION controlp INFIELD sthg005 name="construct.c.page2.sthg005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg006
            #add-point:BEFORE FIELD sthg006 name="construct.b.page2.sthg006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg006
            
            #add-point:AFTER FIELD sthg006 name="construct.a.page2.sthg006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg006
            #add-point:ON ACTION controlp INFIELD sthg006 name="construct.c.page2.sthg006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg007
            #add-point:BEFORE FIELD sthg007 name="construct.b.page2.sthg007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg007
            
            #add-point:AFTER FIELD sthg007 name="construct.a.page2.sthg007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg007
            #add-point:ON ACTION controlp INFIELD sthg007 name="construct.c.page2.sthg007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg008
            #add-point:BEFORE FIELD sthg008 name="construct.b.page2.sthg008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg008
            
            #add-point:AFTER FIELD sthg008 name="construct.a.page2.sthg008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg008
            #add-point:ON ACTION controlp INFIELD sthg008 name="construct.c.page2.sthg008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg009
            #add-point:BEFORE FIELD sthg009 name="construct.b.page2.sthg009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg009
            
            #add-point:AFTER FIELD sthg009 name="construct.a.page2.sthg009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg009
            #add-point:ON ACTION controlp INFIELD sthg009 name="construct.c.page2.sthg009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg010
            #add-point:BEFORE FIELD sthg010 name="construct.b.page2.sthg010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg010
            
            #add-point:AFTER FIELD sthg010 name="construct.a.page2.sthg010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthg010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg010
            #add-point:ON ACTION controlp INFIELD sthg010 name="construct.c.page2.sthg010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgsite
            #add-point:BEFORE FIELD sthgsite name="construct.b.page2.sthgsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgsite
            
            #add-point:AFTER FIELD sthgsite name="construct.a.page2.sthgsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthgsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgsite
            #add-point:ON ACTION controlp INFIELD sthgsite name="construct.c.page2.sthgsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgunit
            #add-point:BEFORE FIELD sthgunit name="construct.b.page2.sthgunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgunit
            
            #add-point:AFTER FIELD sthgunit name="construct.a.page2.sthgunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sthgunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgunit
            #add-point:ON ACTION controlp INFIELD sthgunit name="construct.c.page2.sthgunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      CONSTRUCT g_wc2_table3
            ON sthhseq2, sthh001, sthh002, sthh003, sthh004, sthh005, sthhsite, sthhunit
          FROM s_detail3[1].sthhseq2, s_detail3[1].sthh001, s_detail3[1].sthh002,  s_detail3[1].sthh003,
               s_detail3[1].sthh004,  s_detail3[1].sthh005, s_detail3[1].sthhsite, s_detail3[1].sthhunit
               
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
                  WHEN la_wc[li_idx].tableid = "sthe_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sthf_t" 
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
 
{<section id="astt252.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt252_filter()
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
      CONSTRUCT g_wc_filter ON sthesite,sthedocdt,sthedocno,sthe000,sthe002,sthe003,sthe004,sthe005, 
          sthe006,sthe007,sthe008,sthe009,stheunit
                          FROM s_browse[1].b_sthesite,s_browse[1].b_sthedocdt,s_browse[1].b_sthedocno, 
                              s_browse[1].b_sthe000,s_browse[1].b_sthe002,s_browse[1].b_sthe003,s_browse[1].b_sthe004, 
                              s_browse[1].b_sthe005,s_browse[1].b_sthe006,s_browse[1].b_sthe007,s_browse[1].b_sthe008, 
                              s_browse[1].b_sthe009,s_browse[1].b_stheunit
 
         BEFORE CONSTRUCT
               DISPLAY astt252_filter_parser('sthesite') TO s_browse[1].b_sthesite
            DISPLAY astt252_filter_parser('sthedocdt') TO s_browse[1].b_sthedocdt
            DISPLAY astt252_filter_parser('sthedocno') TO s_browse[1].b_sthedocno
            DISPLAY astt252_filter_parser('sthe000') TO s_browse[1].b_sthe000
            DISPLAY astt252_filter_parser('sthe002') TO s_browse[1].b_sthe002
            DISPLAY astt252_filter_parser('sthe003') TO s_browse[1].b_sthe003
            DISPLAY astt252_filter_parser('sthe004') TO s_browse[1].b_sthe004
            DISPLAY astt252_filter_parser('sthe005') TO s_browse[1].b_sthe005
            DISPLAY astt252_filter_parser('sthe006') TO s_browse[1].b_sthe006
            DISPLAY astt252_filter_parser('sthe007') TO s_browse[1].b_sthe007
            DISPLAY astt252_filter_parser('sthe008') TO s_browse[1].b_sthe008
            DISPLAY astt252_filter_parser('sthe009') TO s_browse[1].b_sthe009
            DISPLAY astt252_filter_parser('stheunit') TO s_browse[1].b_stheunit
      
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
 
      CALL astt252_filter_show('sthesite')
   CALL astt252_filter_show('sthedocdt')
   CALL astt252_filter_show('sthedocno')
   CALL astt252_filter_show('sthe000')
   CALL astt252_filter_show('sthe002')
   CALL astt252_filter_show('sthe003')
   CALL astt252_filter_show('sthe004')
   CALL astt252_filter_show('sthe005')
   CALL astt252_filter_show('sthe006')
   CALL astt252_filter_show('sthe007')
   CALL astt252_filter_show('sthe008')
   CALL astt252_filter_show('sthe009')
   CALL astt252_filter_show('stheunit')
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt252_filter_parser(ps_field)
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
 
{<section id="astt252.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt252_filter_show(ps_field)
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
   LET ls_condition = astt252_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt252_query()
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
   CALL g_sthf_d.clear()
   CALL g_sthf2_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL g_sthf3_d.clear()
   INITIALIZE g_sthc002,g_sthc003,g_sthc004,g_sthc005,g_sthc006 TO NULL
   CALL astt252_set_comp_visible()
   CALL astt252_set_comp_no_visible()
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt252_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt252_browser_fill("")
      CALL astt252_fetch("")
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
      CALL astt252_filter_show('sthesite')
   CALL astt252_filter_show('sthedocdt')
   CALL astt252_filter_show('sthedocno')
   CALL astt252_filter_show('sthe000')
   CALL astt252_filter_show('sthe002')
   CALL astt252_filter_show('sthe003')
   CALL astt252_filter_show('sthe004')
   CALL astt252_filter_show('sthe005')
   CALL astt252_filter_show('sthe006')
   CALL astt252_filter_show('sthe007')
   CALL astt252_filter_show('sthe008')
   CALL astt252_filter_show('sthe009')
   CALL astt252_filter_show('stheunit')
   CALL astt252_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt252_fetch("F") 
      #顯示單身筆數
      CALL astt252_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt252_fetch(p_flag)
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
   CALL g_sthf2_d.clear()
 
   
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
   
   LET g_sthe_m.sthedocno = g_browser[g_current_idx].b_sthedocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
   #遮罩相關處理
   LET g_sthe_m_mask_o.* =  g_sthe_m.*
   CALL astt252_sthe_t_mask()
   LET g_sthe_m_mask_n.* =  g_sthe_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt252_set_act_visible()   
   CALL astt252_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   CALL g_sthf3_d.clear()
   CALL astt252_b_fill3('3')
   #end add-point
   
   #保存單頭舊值
   LET g_sthe_m_t.* = g_sthe_m.*
   LET g_sthe_m_o.* = g_sthe_m.*
   
   LET g_data_owner = g_sthe_m.stheownid      
   LET g_data_dept  = g_sthe_m.stheowndp
   
   #重新顯示   
   CALL astt252_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt252_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success             LIKE type_t.num5
   DEFINE l_insert              LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sthf_d.clear()   
   CALL g_sthf2_d.clear()  
 
 
   INITIALIZE g_sthe_m.* TO NULL             #DEFAULT 設定
   
   LET g_sthedocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   CALL g_sthf3_d.clear() 
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sthe_m.stheownid = g_user
      LET g_sthe_m.stheowndp = g_dept
      LET g_sthe_m.sthecrtid = g_user
      LET g_sthe_m.sthecrtdp = g_dept 
      LET g_sthe_m.sthecrtdt = cl_get_current()
      LET g_sthe_m.sthemodid = g_user
      LET g_sthe_m.sthemoddt = cl_get_current()
      LET g_sthe_m.sthestus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_sthe_m.sthe000 = "I"
      LET g_sthe_m.sthe003 = "1"
      LET g_sthe_m.sthe007 = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
      CALL s_aooi500_default(g_prog,'sthesite',g_sthe_m.sthesite)
         RETURNING l_insert,g_sthe_m.sthesite
      IF l_insert = FALSE THEN
         RETURN
      END IF
      LET g_site_flag = FALSE
      LET g_sthe_m.stheunit = g_sthe_m.sthesite
      CALL astt252_sthesite_ref()
      
      LET g_sthe_m.sthedocdt = g_today
      LET g_sthe_m.sthe001 = g_argv[1]
      #預設單據別
      CALL s_arti200_get_def_doc_type(g_site,g_prog,'1')
         RETURNING l_success,g_sthe_m.sthedocno
      #for 單據別開窗時可以在 營運中心切換時，開出正確的資料
      LET g_ooef004 = ''
      LET g_ooef019 = ''
      SELECT ooef004,ooef019 INTO g_ooef004,g_ooef019 
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_site
      IF cl_null(g_ooef004) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'art-00007'
         LET g_errparam.extend = g_site
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
      LET g_sthe_m.sthe008 = g_user
      LET g_sthe_m.sthe009 = g_dept
      CALL astt252_sthe008_ref()
      CALL astt252_sthe009_ref()
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sthe_m_t.* = g_sthe_m.*
      LET g_sthe_m_o.* = g_sthe_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthe_m.sthestus 
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
 
 
 
    
      CALL astt252_input("a")
      
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
         INITIALIZE g_sthe_m.* TO NULL
         INITIALIZE g_sthf_d TO NULL
         INITIALIZE g_sthf2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt252_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sthf_d.clear()
      #CALL g_sthf2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt252_set_act_visible()   
   CALL astt252_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sthedocno_t = g_sthe_m.sthedocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stheent = " ||g_enterprise|| " AND",
                      " sthedocno = '", g_sthe_m.sthedocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt252_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt252_cl
   
   CALL astt252_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
   
   #遮罩相關處理
   LET g_sthe_m_mask_o.* =  g_sthe_m.*
   CALL astt252_sthe_t_mask()
   LET g_sthe_m_mask_n.* =  g_sthe_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthesite_desc,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000, 
       g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe004_desc,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe008_desc,g_sthe_m.sthe009,g_sthe_m.sthe009_desc, 
       g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp,g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdp_desc,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemodid_desc,g_sthe_m.sthemoddt, 
       g_sthe_m.sthecnfid,g_sthe_m.sthecnfid_desc,g_sthe_m.sthecnfdt
   
   #add-point:新增結束後 name="insert.after"
   CALL astt252_b_fill()
  
   #end add-point 
   
   LET g_data_owner = g_sthe_m.stheownid      
   LET g_data_dept  = g_sthe_m.stheowndp
   
   #功能已完成,通報訊息中心
   CALL astt252_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt252_modify()
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
   LET g_sthe_m_t.* = g_sthe_m.*
   LET g_sthe_m_o.* = g_sthe_m.*
   
   IF g_sthe_m.sthedocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sthedocno_t = g_sthe_m.sthedocno
 
   CALL s_transaction_begin()
   
   OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt252_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt252_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt252_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sthe_m_mask_o.* =  g_sthe_m.*
   CALL astt252_sthe_t_mask()
   LET g_sthe_m_mask_n.* =  g_sthe_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
   
   CALL astt252_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
    
   WHILE TRUE
      LET g_sthedocno_t = g_sthe_m.sthedocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sthe_m.sthemodid = g_user 
LET g_sthe_m.sthemoddt = cl_get_current()
LET g_sthe_m.sthemodid_desc = cl_get_username(g_sthe_m.sthemodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt252_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sthe_t SET (sthemodid,sthemoddt) = (g_sthe_m.sthemodid,g_sthe_m.sthemoddt)
          WHERE stheent = g_enterprise AND sthedocno = g_sthedocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sthe_m.* = g_sthe_m_t.*
            CALL astt252_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sthe_m.sthedocno != g_sthe_m_t.sthedocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE sthf_t SET sthfdocno = g_sthe_m.sthedocno
 
          WHERE sthfent = g_enterprise AND sthfdocno = g_sthe_m_t.sthedocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sthf_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
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
         UPDATE sthg_t
            SET sthgdocno = g_sthe_m.sthedocno
 
          WHERE sthgent = g_enterprise AND
                sthgdocno = g_sthedocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthg_t" 
               LET g_errparam.code = "std-00009" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         UPDATE sthh_t
            SET sthhdocno = g_sthe_m.sthedocno
          WHERE sthhent = g_enterprise
            AND sthhdocno = g_sthedocno_t
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthh_t" 
               LET g_errparam.code   = "std-00009" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
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
   CALL astt252_set_act_visible()   
   CALL astt252_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stheent = " ||g_enterprise|| " AND",
                      " sthedocno = '", g_sthe_m.sthedocno, "' "
 
   #填到對應位置
   CALL astt252_browser_fill("")
 
   CLOSE astt252_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt252_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt252.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt252_input(p_cmd)
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
   DEFINE  l_oofg_return         DYNAMIC ARRAY OF RECORD
           oofg019               LIKE oofg_t.oofg019,  #field
           oofg020               LIKE oofg_t.oofg020   #value
                                 END RECORD
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_sthe001             LIKE sthe_t.sthe001
   DEFINE  l_sthedocno           LIKE sthe_t.sthedocno
   DEFINE  l_sthe005             LIKE sthe_t.sthe005
   DEFINE  l_sthe006             LIKE sthe_t.sthe006
   DEFINE  l_sthi002             LIKE sthi_t.sthi002
   DEFINE  l_sthi005             LIKE sthi_t.sthi005
   DEFINE  l_sthi006             LIKE sthi_t.sthi006
   DEFINE  l_str                 STRING
   DEFINE  l_i1                  LIKE type_t.num5
   DEFINE  l_mhbe003             LIKE mhbe_t.mhbe003
   DEFINE  l_mhbe004             LIKE mhbe_t.mhbe004
   DEFINE  l_mhbe005             LIKE mhbe_t.mhbe005
   DEFINE  l_mhbe009             LIKE mhbe_t.mhbe009
   DEFINE  l_mhbe010             LIKE mhbe_t.mhbe010
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
   DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthesite_desc,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000, 
       g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe004_desc,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe008_desc,g_sthe_m.sthe009,g_sthe_m.sthe009_desc, 
       g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp,g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdp_desc,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemodid_desc,g_sthe_m.sthemoddt, 
       g_sthe_m.sthecnfid,g_sthe_m.sthecnfid_desc,g_sthe_m.sthecnfdt
   
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
   LET g_forupd_sql = "SELECT sthfseq,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007,sthf008,sthf009, 
       sthf010,sthf011,sthfsite,sthfunit,sthf001 FROM sthf_t WHERE sthfent=? AND sthfdocno=? AND sthfseq=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt252_bcl CURSOR FROM g_forupd_sql
   
 
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point 
   LET g_forupd_sql = "SELECT sthgseq1,sthg001,sthg002,sthg003,sthg004,sthg005,sthg006,sthg007,sthg008, 
       sthg009,sthg010,sthgsite,sthgunit FROM sthg_t WHERE sthgent=? AND sthgdocno=? AND sthgseq=? AND  
       sthgseq1=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt252_bcl2 CURSOR FROM g_forupd_sql
 
 
 
   #add-point:input段define_sql name="input.other_sql"
   LET g_forupd_sql = "SELECT sthhseq2, sthh001,  sthh002,  sthh003, sthh004,",
                      "       sthh005,  sthhsite, sthhunit",
                      "  FROM sthh_t",
                      " WHERE sthhent = ?",
                      "   AND sthhdocno = ?",
                      "   AND sthhseq = ?",
                      "   AND sthhseq1 = ? ",
                      "   AND sthhseq2 = ? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt252_bcl3 CURSOR FROM g_forupd_sql
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt252_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt252_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002, 
       g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe007, 
       g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt252.input.head" >}
      #單頭段
      INPUT BY NAME g_sthe_m.sthesite,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002, 
          g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe007, 
          g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_item
            LET g_action_choice="update_item"
            IF cl_auth_chk_act("update_item") THEN
               
               #add-point:ON ACTION update_item name="input.master_input.update_item"
               IF NOT cl_null(g_sthe_m.sthedocno)  THEN
                  CALL n_sthel(g_sthe_m.sthedocno)
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sthe_m.sthedocno
               
                  CALL ap_ref_array2(g_ref_fields," SELECT sthel002 FROM sthel_t"||
                                                  "  WHERE sthelent = "||g_enterprise||
                                                  "    AND stheldocno = ?"||
                                                  "    AND sthel001 = '"||g_dlang||"'","")
                     RETURNING g_rtn_fields
                  LET g_sthe_m.sthel002 = g_rtn_fields[1]
                  DISPLAY BY NAME g_sthe_m.sthel002
               END IF
               #END add-point
            END IF
 
 
 
 
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            LET g_master_multi_table_t.stheldocno = g_sthe_m.sthedocno
LET g_master_multi_table_t.sthel002 = g_sthe_m.sthel002
 
            IF l_cmd_t = 'r' THEN
               LET g_master_multi_table_t.stheldocno = ''
LET g_master_multi_table_t.sthel002 = ''
 
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt252_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt252_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthesite
            
            #add-point:AFTER FIELD sthesite name="input.a.sthesite"
            LET g_sthe_m.sthesite_desc = NULL
            DISPLAY BY NAME g_sthe_m.sthesite_desc
            IF NOT cl_null(g_sthe_m.sthesite) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sthe_m.sthesite != g_sthe_m_t.sthesite OR g_sthe_m_t.sthesite IS null)) THEN
                  CALL s_aooi500_chk(g_prog,'sthesite',g_sthe_m.sthesite,g_site)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_sthe_m.sthesite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET g_sthe_m.sthesite = g_sthe_m_t.sthesite
                     CALL astt252_sthesite_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt252_sthesite_ref()
            LET g_site_flag = TRUE
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthesite
            #add-point:BEFORE FIELD sthesite name="input.b.sthesite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthesite
            #add-point:ON CHANGE sthesite name="input.g.sthesite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthedocdt
            #add-point:BEFORE FIELD sthedocdt name="input.b.sthedocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthedocdt
            
            #add-point:AFTER FIELD sthedocdt name="input.a.sthedocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthedocdt
            #add-point:ON CHANGE sthedocdt name="input.g.sthedocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthedocno
            #add-point:BEFORE FIELD sthedocno name="input.b.sthedocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthedocno
            
            #add-point:AFTER FIELD sthedocno name="input.a.sthedocno"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_sthe_m.sthedocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sthe_m.sthedocno != g_sthedocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthe_t WHERE "||"stheent = '" ||g_enterprise|| "' AND "||"sthedocno = '"||g_sthe_m.sthedocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            IF NOT s_aooi200_chk_slip(g_site,'',g_sthe_m.sthedocno,g_prog) THEN
               LET g_sthe_m.sthedocno = g_sthe_m_o.sthedocno
               NEXT FIELD CURRENT 
            END IF
            LET g_sthe_m_o.sthedocno = g_sthe_m.sthedocno

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthedocno
            #add-point:ON CHANGE sthedocno name="input.g.sthedocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe000
            #add-point:BEFORE FIELD sthe000 name="input.b.sthe000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe000
            
            #add-point:AFTER FIELD sthe000 name="input.a.sthe000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe000
            #add-point:ON CHANGE sthe000 name="input.g.sthe000"
            CALL astt252_set_entry(l_cmd)      #160516-00023#1 20160518 add by beckxie
            CALL astt252_set_no_entry(l_cmd)   #160516-00023#1 20160518 add by beckxie
            LET g_sthe_m.sthe007 = 'N'
            INITIALIZE g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe008,g_sthe_m.sthe009 TO NULL
            INITIALIZE g_sthe_m.sthel002,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc TO NULL
            IF g_sthe_m.sthe000 = 'I' THEN
               LET g_sthe_m.sthe003 = '1'
               LET g_sthe_m.sthe008 = g_user
               LET g_sthe_m.sthe009 = g_dept
               CALL astt252_sthe008_ref()
               CALL astt252_sthe009_ref()
            END IF
            DISPLAY BY NAME g_sthe_m.sthe002,g_sthe_m.sthel002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe002
            
            #add-point:AFTER FIELD sthe002 name="input.a.sthe002"
            IF NOT cl_null(g_sthe_m.sthe002) THEN 
               IF g_sthe_m.sthe000 = 'U' THEN
               #應用 a17 樣板自動產生(Version:3)
                  #欄位存在檢查
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
               
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sthe_m.sthe002
                  LET g_errshow = 1
                  IF g_argv[01] = '1' THEN   
                  #呼叫檢查存在並帶值的library
                     IF NOT cl_chk_exist("v_sthi002") THEN
                        #檢查失敗時後續處理
                        LET g_sthe_m.sthe002 = g_sthe_m_o.sthe002
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  IF g_argv[01] = '2' THEN   
                  #呼叫檢查存在並帶值的library
                     IF NOT cl_chk_exist("v_sthi002_1") THEN
                        #檢查失敗時後續處理
                        LET g_sthe_m.sthe002 = g_sthe_m_o.sthe002
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  #CALL carry 
                  CALL astt252_carry_sthe()               
               END IF 
               #160512-00003#17 20160526 add by beckxie---S
               IF g_sthe_m.sthe000 = 'I' THEN
                  #若新增方案編號,需檢查是否已存在於主檔
                  LET l_cnt = 0
                  IF g_argv[01] = '1' THEN
                     SELECT COUNT(*) INTO l_cnt
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthi001 = '1'
                        AND sthi002 = g_sthe_m.sthe002
                  END IF
                  IF g_argv[01] = '2' THEN
                     SELECT COUNT(*) INTO l_cnt
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthi001 = '2'
                        AND sthi002 = g_sthe_m.sthe002
                  END IF
                  IF l_cnt != 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     CASE g_argv[01]
                        WHEN '1'
                           LET g_errparam.code   = "ast-00787" 
                        WHEN '2'
                           LET g_errparam.code   = "ast-00788" 
                     END CASE
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     
                     LET g_sthe_m.sthe002 = g_sthe_m_o.sthe002
                     NEXT FIELD CURRENT
                  END IF
                  #若新增方案編號,需檢查是否已存在於申請檔,且申請類型為I.新增
                  LET l_cnt = 0
                  IF g_argv[01] = '1' THEN
                     SELECT COUNT(*) INTO l_cnt
                       FROM sthe_t
                      WHERE stheent = g_enterprise
                        AND sthe000 = 'I'
                        AND sthe001 = '1'
                        AND sthe002 = g_sthe_m.sthe002
                  END IF
                  IF g_argv[01] = '2' THEN
                     SELECT COUNT(*) INTO l_cnt
                       FROM sthe_t
                      WHERE stheent = g_enterprise
                        AND sthe000 = 'I'
                        AND sthe001 = '2'
                        AND sthe002 = g_sthe_m.sthe002
                  END IF
                  IF l_cnt != 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     CASE g_argv[01]
                        WHEN '1'
                           LET g_errparam.code   = "ast-00789" 
                        WHEN '2'
                           LET g_errparam.code   = "ast-00790" 
                     END CASE
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     
                     LET g_sthe_m.sthe002 = g_sthe_m_o.sthe002
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #160512-00003#17 20160526 add by beckxie---E
            END IF
            CALL astt252_set_entry(l_cmd)      #160516-00023#1 20160518 add by beckxie
            CALL astt252_set_no_entry(l_cmd)   #160516-00023#1 20160518 add by beckxie
            LET g_sthe_m_o.sthe002 = g_sthe_m.sthe002
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe002
            #add-point:BEFORE FIELD sthe002 name="input.b.sthe002"
            IF cl_null(g_sthe_m.sthe002) AND p_cmd = 'a' AND g_sthe_m.sthe000 = 'I' THEN    
               CALL s_aooi390_gen('34') RETURNING l_success,g_sthe_m.sthe002,l_oofg_return
               DISPLAY BY NAME g_sthe_m.sthe002
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe002
            #add-point:ON CHANGE sthe002 name="input.g.sthe002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe003
            #add-point:BEFORE FIELD sthe003 name="input.b.sthe003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe003
            
            #add-point:AFTER FIELD sthe003 name="input.a.sthe003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe003
            #add-point:ON CHANGE sthe003 name="input.g.sthe003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthel002
            #add-point:BEFORE FIELD sthel002 name="input.b.sthel002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthel002
            
            #add-point:AFTER FIELD sthel002 name="input.a.sthel002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthel002
            #add-point:ON CHANGE sthel002 name="input.g.sthel002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe004
            
            #add-point:AFTER FIELD sthe004 name="input.a.sthe004"
            LET g_sthe_m.sthe004_desc = NULL
            DISPLAY BY NAME g_sthe_m.sthe004_desc
            IF NOT cl_null(g_sthe_m.sthe004) THEN
               IF g_sthe_m.sthe004 != g_sthe_m_o.sthe004 OR cl_null(g_sthe_m_o.sthe004) THEN
                  #欄位存在檢查
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sthe_m.sthesite
                  LET g_chkparam.arg2 = g_sthe_m.sthe004
                  LET g_errshow = 1 
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_sthc001") THEN
                     #檢查失敗時後續處理
                     LET g_sthe_m.sthe004 = g_sthe_m_o.sthe004
                     CALL astt252_sthe004_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_sthe_m_o.sthe004 = g_sthe_m.sthe004
            #取sthc_t
            CALL astt252_get_sthc()   
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
            CALL astt252_sthe004_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe004
            #add-point:BEFORE FIELD sthe004 name="input.b.sthe004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe004
            #add-point:ON CHANGE sthe004 name="input.g.sthe004"
            #取sthc_t
            CALL astt252_get_sthc()   
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
            DELETE FROM sthf_t 
            WHERE sthfent = g_enterprise
              AND sthfdocno = g_sthe_m.sthedocno
            DELETE FROM sthg_t 
            WHERE sthgent = g_enterprise
              AND sthgdocno = g_sthe_m.sthedocno
            DELETE FROM sthf_t 
            WHERE sthhent = g_enterprise
              AND sthhdocno = g_sthe_m.sthedocno      
            CALL g_sthf_d.clear()              
            CALL g_sthf2_d.clear()
            CALL g_sthf3_d.clear()
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe005
            #add-point:BEFORE FIELD sthe005 name="input.b.sthe005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe005
            
            #add-point:AFTER FIELD sthe005 name="input.a.sthe005"
            IF NOT cl_null(g_sthe_m.sthe005) AND NOT cl_null(g_sthe_m.sthe006) THEN
               IF NOT (g_sthe_m.sthe005 <= g_sthe_m.sthe006) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'art-00020'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM sthg_t
                WHERE sthgent = g_enterprise
                  AND sthgdocno = g_sthe_m.sthedocno
                  AND ((sthg002 NOT BETWEEN g_sthe_m.sthe005 AND g_sthe_m.sthe006) OR 
                       (sthg003 NOT BETWEEN g_sthe_m.sthe005 AND g_sthe_m.sthe006))
               IF l_cnt > 0 THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00667'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe005
            #add-point:ON CHANGE sthe005 name="input.g.sthe005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe006
            #add-point:BEFORE FIELD sthe006 name="input.b.sthe006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe006
            
            #add-point:AFTER FIELD sthe006 name="input.a.sthe006"
            IF NOT cl_null(g_sthe_m.sthe005) AND NOT cl_null(g_sthe_m.sthe006) THEN
               IF NOT (g_sthe_m.sthe005 <= g_sthe_m.sthe006) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'amm-00081'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM sthg_t
                WHERE sthgent = g_enterprise
                  AND sthgdocno = g_sthe_m.sthedocno
                  AND ((sthg002 NOT BETWEEN g_sthe_m.sthe005 AND g_sthe_m.sthe006) OR 
                       (sthg003 NOT BETWEEN g_sthe_m.sthe005 AND g_sthe_m.sthe006))
               IF l_cnt > 0 THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00667'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe006
            #add-point:ON CHANGE sthe006 name="input.g.sthe006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe007
            #add-point:BEFORE FIELD sthe007 name="input.b.sthe007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe007
            
            #add-point:AFTER FIELD sthe007 name="input.a.sthe007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe007
            #add-point:ON CHANGE sthe007 name="input.g.sthe007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe008
            
            #add-point:AFTER FIELD sthe008 name="input.a.sthe008"
            LET g_sthe_m.sthe008_desc = NULL
            DISPLAY BY NAME g_sthe_m.sthe008_desc
            IF NOT cl_null(g_sthe_m.sthe008) THEN
               IF g_sthe_m.sthe008 != g_sthe_m_o.sthe008 OR cl_null(g_sthe_m_o.sthe008) THEN
                  #欄位存在檢查
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sthe_m.sthe008
                  LET g_errshow = 1 
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ooag001") THEN
                     #檢查失敗時後續處理
                     LET g_sthe_m.sthe008 = g_sthe_m_o.sthe008
                     CALL astt252_sthe008_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_sthe_m_o.sthe008 = g_sthe_m.sthe008
            CALL astt252_sthe008_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe008
            #add-point:BEFORE FIELD sthe008 name="input.b.sthe008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe008
            #add-point:ON CHANGE sthe008 name="input.g.sthe008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe009
            
            #add-point:AFTER FIELD sthe009 name="input.a.sthe009"
            LET g_sthe_m.sthe009_desc = NULL
            DISPLAY BY NAME g_sthe_m.sthe009_desc
            IF NOT cl_null(g_sthe_m.sthe009) THEN
               IF g_sthe_m.sthe009 != g_sthe_m_o.sthe009 OR cl_null(g_sthe_m_o.sthe009) THEN
                  #欄位存在檢查
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sthe_m.sthe009
                  LET g_errshow = 1 
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                     #檢查失敗時後續處理
                     LET g_sthe_m.sthe009 = g_sthe_m_o.sthe009
                     CALL astt252_sthe009_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_sthe_m_o.sthe009 = g_sthe_m.sthe009
            CALL astt252_sthe009_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe009
            #add-point:BEFORE FIELD sthe009 name="input.b.sthe009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe009
            #add-point:ON CHANGE sthe009 name="input.g.sthe009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthe001
            #add-point:BEFORE FIELD sthe001 name="input.b.sthe001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthe001
            
            #add-point:AFTER FIELD sthe001 name="input.a.sthe001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthe001
            #add-point:ON CHANGE sthe001 name="input.g.sthe001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stheunit
            #add-point:BEFORE FIELD stheunit name="input.b.stheunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stheunit
            
            #add-point:AFTER FIELD stheunit name="input.a.stheunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stheunit
            #add-point:ON CHANGE stheunit name="input.g.stheunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthestus
            #add-point:BEFORE FIELD sthestus name="input.b.sthestus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthestus
            
            #add-point:AFTER FIELD sthestus name="input.a.sthestus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthestus
            #add-point:ON CHANGE sthestus name="input.g.sthestus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sthesite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthesite
            #add-point:ON ACTION controlp INFIELD sthesite name="input.c.sthesite"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthe_m.sthesite             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'sthesite',g_site,'i')
            CALL q_ooef001_24()                                #呼叫開窗
 
            LET g_sthe_m.sthesite = g_qryparam.return1              

            DISPLAY g_sthe_m.sthesite TO sthesite              #
            CALL astt252_sthesite_ref()
            NEXT FIELD sthesite                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthedocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthedocdt
            #add-point:ON ACTION controlp INFIELD sthedocdt name="input.c.sthedocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthedocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthedocno
            #add-point:ON ACTION controlp INFIELD sthedocno name="input.c.sthedocno"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthe_m.sthedocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_ooef004 #s
            LET g_qryparam.arg2 = g_prog #s
 
            CALL q_ooba002_1()                                #呼叫開窗
 
            LET g_sthe_m.sthedocno = g_qryparam.return1              

            DISPLAY g_sthe_m.sthedocno TO sthedocno              #

            NEXT FIELD sthedocno                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthe000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe000
            #add-point:ON ACTION controlp INFIELD sthe000 name="input.c.sthe000"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthe002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe002
            #add-point:ON ACTION controlp INFIELD sthe002 name="input.c.sthe002"
            IF g_sthe_m.sthe000 = 'U' THEN
               #應用 a07 樣板自動產生(Version:3)   
               #開窗i段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               
               LET g_qryparam.default1 = g_sthe_m.sthe002             #給予default值
               
               #給予arg
               LET g_qryparam.arg1 = "" #s
               
               LET g_qryparam.where = " sthi001 = '",g_argv[1],"' and sthisite='",g_site,"'"   #160516-00023#1 20160518 add by beckxie
               CALL q_sthi002()                                #呼叫開窗
               
               LET g_sthe_m.sthe002 = g_qryparam.return1              
               
               DISPLAY g_sthe_m.sthe002 TO sthe002              #
               
               NEXT FIELD sthe002                          #返回原欄位
            END IF


            #END add-point
 
 
         #Ctrlp:input.c.sthe003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe003
            #add-point:ON ACTION controlp INFIELD sthe003 name="input.c.sthe003"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthel002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthel002
            #add-point:ON ACTION controlp INFIELD sthel002 name="input.c.sthel002"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthe004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe004
            #add-point:ON ACTION controlp INFIELD sthe004 name="input.c.sthe004"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthe_m.sthe004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 =  stae001)"
 
            CALL q_stae001_4()                                #呼叫開窗
 
            LET g_sthe_m.sthe004 = g_qryparam.return1              

            DISPLAY g_sthe_m.sthe004 TO sthe004              #
            CALL astt252_sthe004_ref()
            NEXT FIELD sthe004                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthe005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe005
            #add-point:ON ACTION controlp INFIELD sthe005 name="input.c.sthe005"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthe006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe006
            #add-point:ON ACTION controlp INFIELD sthe006 name="input.c.sthe006"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthe007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe007
            #add-point:ON ACTION controlp INFIELD sthe007 name="input.c.sthe007"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthe008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe008
            #add-point:ON ACTION controlp INFIELD sthe008 name="input.c.sthe008"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthe_m.sthe008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_sthe_m.sthe008 = g_qryparam.return1              

            DISPLAY g_sthe_m.sthe008 TO sthe008              #
            CALL astt252_sthe008_ref()
            NEXT FIELD sthe008                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthe009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe009
            #add-point:ON ACTION controlp INFIELD sthe009 name="input.c.sthe009"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthe_m.sthe009             #給予default值
            LET g_qryparam.default2 = "" #g_sthe_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = g_today #s

 
            CALL q_ooeg001()                                #呼叫開窗
 
            LET g_sthe_m.sthe009 = g_qryparam.return1              
            #LET g_sthe_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_sthe_m.sthe009 TO sthe009              #
            CALL astt252_sthe009_ref()
            #DISPLAY g_sthe_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD sthe009                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.sthe001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthe001
            #add-point:ON ACTION controlp INFIELD sthe001 name="input.c.sthe001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stheunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stheunit
            #add-point:ON ACTION controlp INFIELD stheunit name="input.c.stheunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.sthestus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthestus
            #add-point:ON ACTION controlp INFIELD sthestus name="input.c.sthestus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sthe_m.sthedocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            IF NOT cl_null(g_sthe_m.sthe005) AND NOT cl_null(g_sthe_m.sthe006) THEN
               LET l_sthe001 = g_argv[1]
               #同一營運組織+費用編號的日期範圍若與其他未审核的單據內的日期重疊，則報錯：組織+費用編號在此生效日期內與單據xxxxx的日期範圍重疊！
               #20160518 (武英需求:調整報錯訊息) add by beckxie
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt 
                 FROM sthe_t
                WHERE stheent = g_enterprise
                  AND sthesite = g_sthe_m.sthesite
                  AND sthe001 = l_sthe001
                  AND sthe004 = g_sthe_m.sthe004
                  AND ((g_sthe_m.sthe005 BETWEEN sthe005 AND sthe006 ) 
                         OR ( g_sthe_m.sthe006 BETWEEN sthe005 AND sthe006 )) 
                  AND sthestus = 'N'
                  AND sthedocno != g_sthe_m.sthedocno
               
               IF l_cnt > 0 THEN
                  INITIALIZE l_sthedocno,l_sthe005,l_sthe006 TO NULL
                  
                  SELECT sthedocno INTO l_sthedocno
                    FROM sthe_t
                   WHERE stheent = g_enterprise
                     AND sthesite = g_sthe_m.sthesite
                     AND sthe001 = l_sthe001
                     AND sthe004 = g_sthe_m.sthe004
                     AND ((g_sthe_m.sthe005 BETWEEN sthe005 AND sthe006 ) 
                          OR ( g_sthe_m.sthe006 BETWEEN sthe005 AND sthe006 )) 
                     AND sthestus = 'N'
                     AND sthedocno != g_sthe_m.sthedocno
                     
                  SELECT sthe005,sthe006 INTO l_sthe005,l_sthe006
                    FROM sthe_t
                   WHERE stheent = g_enterprise
                     AND sthesite = g_sthe_m.sthesite
                     AND sthe001 = l_sthe001
                     AND sthedocno = l_sthedocno
                  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'ast-00587'
                  LET g_errparam.popup  = TRUE
                  LET g_errparam.replace[1] = g_sthe_m.sthesite
                  LET g_errparam.replace[2] = g_sthe_m.sthe004
                  LET g_errparam.replace[3] = g_sthe_m.sthe005
                  LET g_errparam.replace[4] = g_sthe_m.sthe006
                  LET g_errparam.replace[5] = l_sthedocno
                  LET g_errparam.replace[6] = l_sthe005
                  LET g_errparam.replace[7] = l_sthe006
                  CALL cl_err()
                  NEXT FIELD sthe006
               END IF
               
               #同一營運組織+費用編號的日期範圍若與主檔astm252內的其他方案編號裏的日期重疊，則報錯：組織+費用編號在此生效日期內與方案編號xxxxx的日期範圍重疊！
               IF g_sthe_m.sthe000 ='I' THEN
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt 
                    FROM sthi_t
                   WHERE sthient = g_enterprise
                     AND sthisite = g_sthe_m.sthesite
                     AND sthi001 = l_sthe001
                     AND sthi004 = g_sthe_m.sthe004
                     AND ((g_sthe_m.sthe005 BETWEEN sthi005 AND sthi006 ) 
                          OR ( g_sthe_m.sthe006 BETWEEN sthi005 AND sthi006 )) 
                     AND sthistus <> 'X'
                     AND sthistus <> 'E'   #160604-00009#25 20160613 add by beckxie
                  IF l_cnt > 0 THEN
                     INITIALIZE l_sthi002,l_sthi005,l_sthi006 TO NULL
                     
                     SELECT sthi002 INTO l_sthi002
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthisite = g_sthe_m.sthesite
                        AND sthi001 = l_sthe001
                        AND sthi004 = g_sthe_m.sthe004
                        AND ((g_sthe_m.sthe005 BETWEEN sthi005 AND sthi006 ) 
                             OR ( g_sthe_m.sthe006 BETWEEN sthi005 AND sthi006 )) 
                        AND sthistus <> 'X'
                        AND sthistus <> 'E'   #160604-00009#25 20160613 add by beckxie
                        
                     SELECT sthi005,sthi006 INTO l_sthi005,l_sthi006
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthisite = g_sthe_m.sthesite
                        AND sthi002 = l_sthi002
                     
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = 'ast-00588'
                     LET g_errparam.popup  = TRUE
                     LET g_errparam.replace[1] = g_sthe_m.sthesite
                     LET g_errparam.replace[2] = g_sthe_m.sthe004
                     LET g_errparam.replace[3] = g_sthe_m.sthe005
                     LET g_errparam.replace[4] = g_sthe_m.sthe006
                     LET g_errparam.replace[5] = l_sthi002
                     LET g_errparam.replace[6] = l_sthi005
                     LET g_errparam.replace[7] = l_sthi006
                     CALL cl_err()
                     NEXT FIELD sthe006
                  END IF
               END IF
               IF g_sthe_m.sthe000 ='U' THEN
               #若是修改,需排除原方案編號
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt 
                    FROM sthi_t
                   WHERE sthient = g_enterprise
                     AND sthisite = g_sthe_m.sthesite
                     AND sthi001 = l_sthe001
                     AND sthi002 != g_sthe_m.sthe002
                     AND sthi004 = g_sthe_m.sthe004
                     AND ((g_sthe_m.sthe005 BETWEEN sthi005 AND sthi006 ) 
                          OR ( g_sthe_m.sthe006 BETWEEN sthi005 AND sthi006 )) 
                     AND sthistus <> 'X'
                     AND sthistus <> 'E'   #160604-00009#25 20160613 add by beckxie
                     
                  IF l_cnt > 0 THEN
                     INITIALIZE l_sthi002,l_sthi005,l_sthi006 TO NULL
                     
                     SELECT sthi002 INTO l_sthi002
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthisite = g_sthe_m.sthesite
                        AND sthi002 != g_sthe_m.sthe002
                        AND sthi001 = l_sthe001
                        AND sthi004 = g_sthe_m.sthe004
                        AND ((g_sthe_m.sthe005 BETWEEN sthi005 AND sthi006 ) 
                             OR ( g_sthe_m.sthe006 BETWEEN sthi005 AND sthi006 )) 
                        AND sthistus <> 'X'
                        AND sthistus <> 'E'   #160604-00009#25 20160613 add by beckxie
                     SELECT sthi005,sthi006 INTO l_sthi005,l_sthi006
                       FROM sthi_t
                      WHERE sthient = g_enterprise
                        AND sthisite = g_sthe_m.sthesite
                        AND sthi002 = l_sthi002
                     
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = 'ast-00588'
                     LET g_errparam.popup  = TRUE
                     LET g_errparam.replace[1] = g_sthe_m.sthesite
                     LET g_errparam.replace[2] = g_sthe_m.sthe004
                     LET g_errparam.replace[3] = g_sthe_m.sthe005
                     LET g_errparam.replace[4] = g_sthe_m.sthe006
                     LET g_errparam.replace[5] = l_sthi002
                     LET g_errparam.replace[6] = l_sthi005
                     LET g_errparam.replace[7] = l_sthi006
                     CALL cl_err()
                     NEXT FIELD sthe006
                  END IF
               END IF
            ELSE
               IF cl_null(g_sthe_m.sthe005) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'ast-00468'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  NEXT FIELD sthe005
               END IF
               IF cl_null(g_sthe_m.sthe006) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'ast-00469'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  NEXT FIELD sthe006
               END IF
            END IF
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi390_get_auto_no('34',g_sthe_m.sthe002) RETURNING l_success,g_sthe_m.sthe002
               
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               CALL s_aooi390_oofi_upd('34',g_sthe_m.sthe002) RETURNING l_success  
               IF NOT s_aooi200_chk_slip(g_site,'',g_sthe_m.sthedocno,g_prog) THEN
                  LET g_sthe_m.sthedocno = ''
                  NEXT FIELD sthedocno
               END IF
               
               CALL s_aooi200_gen_docno(g_site,g_sthe_m.sthedocno,g_sthe_m.sthedocdt,g_prog) RETURNING l_success,g_sthe_m.sthedocno
               IF NOT l_success THEN
                  NEXT FIELD sthedocno
               END IF
               ##自動編碼後若編碼結果與原本不同,更新多語言
               #IF g_sthe_m_o.sthedocno != g_sthe_m.sthedocno AND NOT cl_null(g_sthe_m_o.sthedocno) THEN
               #   LET l_cnt = 0
               #   SELECT COUNT(*) INTO l_cnt
               #     FROM sthel_t
               #    WHERE sthelent = g_enterprise
               #      AND stheldocno = g_sthe_m_o.sthedocno
               #   IF l_cnt > 0 THEN
               #      UPDATE sthel_t SET stheldocno = g_sthe_m.sthedocno
               #       WHERE sthelent = g_enterprise
               #         AND stheldocno = g_sthe_m_o.sthedocno
               #
               #      IF SQLCA.sqlcode THEN
               #         INITIALIZE g_errparam TO NULL
               #         LET g_errparam.extend = 'upd sthel_t'
               #         LET g_errparam.code   = SQLCA.sqlcode
               #         LET g_errparam.popup  = TRUE
               #         CALL cl_err()
               #
               #         CALL s_transaction_end('N','0')
               #         NEXT FIELD CURRENT
               #      END IF
               #   END IF
               #END IF
               
               #end add-point
               
               INSERT INTO sthe_t (stheent,sthesite,sthedocdt,sthedocno,sthe000,sthe002,sthe003,sthe004, 
                   sthe005,sthe006,sthe007,sthe008,sthe009,sthe001,stheunit,sthestus,stheownid,stheowndp, 
                   sthecrtid,sthecrtdp,sthecrtdt,sthemodid,sthemoddt,sthecnfid,sthecnfdt)
               VALUES (g_enterprise,g_sthe_m.sthesite,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000, 
                   g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006, 
                   g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
                   g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
                   g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sthe_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               #若是新增,且sthf_t單身無資料,提示詢問是否依asti251帶出單身資訊
               IF g_sthe_m.sthe000 = 'I' THEN
                  LET l_cnt = 0 
                  SELECT COUNT(*) INTO l_cnt
                    FROM sthf_t
                   WHERE sthfent = g_enterprise
                     AND sthfdocno = g_sthe_m.sthedocno
                  IF l_cnt = 0 THEN 
                     IF cl_ask_confirm('ast-00590') THEN
                        CALL astt252_carry_sthd()
                     END IF 
                  END IF
               END IF
               #修改時,單身無資料時帶出單身
               IF g_sthe_m.sthe000 = 'U' THEN
                  LET l_success = TRUE
                  CALL astt252_carry_detail() RETURNING l_success
                  IF NOT l_success THEN 
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG
                  END IF
                  #160604-00009#25 20160613 add by beckxie---S
                  IF cl_ask_confirm('ast-00590') THEN
                     CALL astt252_carry_sthd()
                  END IF
                  #160604-00009#25 20160613 add by beckxie---E
               END IF
               
               #end add-point
               
               
                        INITIALIZE l_var_keys TO NULL 
         INITIALIZE l_field_keys TO NULL 
         INITIALIZE l_vars TO NULL 
         INITIALIZE l_fields TO NULL 
         IF g_sthe_m.sthedocno = g_master_multi_table_t.stheldocno AND
         g_sthe_m.sthel002 = g_master_multi_table_t.sthel002  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthelent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_sthe_m.sthedocno
            LET l_field_keys[02] = 'stheldocno'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stheldocno
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthel001'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_sthe_m.sthel002
            LET l_fields[01] = 'sthel002'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthel_t')
         END IF 
 
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt252_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt252_b_fill()
                  CALL astt252_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               #160604-00009#25 20160613 add by beckxie---S
               #取sthc_t
               CALL astt252_get_sthc()   
               CALL astt252_set_comp_visible()
               CALL astt252_set_comp_no_visible()
               CALL astt252_sthe004_ref()
               #160604-00009#25 20160613 add by beckxie---E
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt252_sthe_t_mask_restore('restore_mask_o')
               
               UPDATE sthe_t SET (sthesite,sthedocdt,sthedocno,sthe000,sthe002,sthe003,sthe004,sthe005, 
                   sthe006,sthe007,sthe008,sthe009,sthe001,stheunit,sthestus,stheownid,stheowndp,sthecrtid, 
                   sthecrtdp,sthecrtdt,sthemodid,sthemoddt,sthecnfid,sthecnfdt) = (g_sthe_m.sthesite, 
                   g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003, 
                   g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008, 
                   g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus,g_sthe_m.stheownid, 
                   g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid, 
                   g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt)
                WHERE stheent = g_enterprise AND sthedocno = g_sthedocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sthe_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               #若是新增,且sthf_t單身無資料,提示詢問是否依asti251帶出單身資訊
               IF g_sthe_m.sthe000 = 'I' THEN
                  LET l_cnt = 0 
                  SELECT COUNT(*) INTO l_cnt
                    FROM sthf_t
                   WHERE sthfent = g_enterprise
                     AND sthfdocno = g_sthe_m.sthedocno
                  IF l_cnt = 0 THEN 
                     IF cl_ask_confirm('ast-00590') THEN
                        CALL astt252_carry_sthd()
                     END IF 
                  END IF
               END IF
               #修改時,單身無資料時帶出單身
               IF g_sthe_m.sthe000 = 'U' THEN
                  LET l_success = TRUE
                  CALL astt252_carry_detail() RETURNING l_success
                  IF NOT l_success THEN 
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG
                  END IF
                  #160604-00009#25 20160613 add by beckxie---S
                  IF cl_ask_confirm('ast-00590') THEN
                     CALL astt252_carry_sthd()
                  END IF
                  #160604-00009#25 20160613 add by beckxie---E
               END IF
               #end add-point
               
               
                        INITIALIZE l_var_keys TO NULL 
         INITIALIZE l_field_keys TO NULL 
         INITIALIZE l_vars TO NULL 
         INITIALIZE l_fields TO NULL 
         IF g_sthe_m.sthedocno = g_master_multi_table_t.stheldocno AND
         g_sthe_m.sthel002 = g_master_multi_table_t.sthel002  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'sthelent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_sthe_m.sthedocno
            LET l_field_keys[02] = 'stheldocno'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stheldocno
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'sthel001'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_sthe_m.sthel002
            LET l_fields[01] = 'sthel002'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'sthel_t')
         END IF 
 
               
               #將遮罩欄位進行遮蔽
               CALL astt252_sthe_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sthe_m_t)
               LET g_log2 = util.JSON.stringify(g_sthe_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               #160604-00009#25 20160613 add by beckxie---S
               #取sthc_t
               CALL astt252_get_sthc()   
               CALL astt252_set_comp_visible()
               CALL astt252_set_comp_no_visible()
               CALL astt252_sthe004_ref()
               #160604-00009#25 20160613 add by beckxie---E
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sthedocno_t = g_sthe_m.sthedocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt252.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sthf_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthf_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt252_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sthf_d.getLength()
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
            CALL astt252_b_fill2('2')
 
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sthf_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthf_d[l_ac].sthfseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sthf_d_t.* = g_sthf_d[l_ac].*  #BACKUP
               LET g_sthf_d_o.* = g_sthf_d[l_ac].*  #BACKUP
               CALL astt252_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt252_set_no_entry_b(l_cmd)
               IF NOT astt252_lock_b("sthf_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt252_bcl INTO g_sthf_d[l_ac].sthfseq,g_sthf_d[l_ac].sthf002,g_sthf_d[l_ac].sthf003, 
                      g_sthf_d[l_ac].sthf004,g_sthf_d[l_ac].sthf005,g_sthf_d[l_ac].sthf006,g_sthf_d[l_ac].sthf007, 
                      g_sthf_d[l_ac].sthf008,g_sthf_d[l_ac].sthf009,g_sthf_d[l_ac].sthf010,g_sthf_d[l_ac].sthf011, 
                      g_sthf_d[l_ac].sthfsite,g_sthf_d[l_ac].sthfunit,g_sthf_d[l_ac].sthf001
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sthf_d_t.sthfseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthf_d_mask_o[l_ac].* =  g_sthf_d[l_ac].*
                  CALL astt252_sthf_t_mask()
                  LET g_sthf_d_mask_n[l_ac].* =  g_sthf_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt252_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            CALL astt252_b_fill3('3')
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
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
            INITIALIZE g_sthf_d[l_ac].* TO NULL 
            INITIALIZE g_sthf_d_t.* TO NULL 
            INITIALIZE g_sthf_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_sthf_d[l_ac].sthfseq = "1"
      LET g_sthf_d[l_ac].sthf009 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_sthf_d[l_ac].sthf001 = g_sthe_m.sthe002 
            LET g_sthf_d[l_ac].sthfsite = g_sthe_m.sthesite 
            LET g_sthf_d[l_ac].sthfunit = g_sthe_m.stheunit 
            SELECT COALESCE(MAX(sthfseq)+1,1) INTO g_sthf_d[l_ac].sthfseq 
              FROM sthf_t
             WHERE sthfent = g_enterprise 
               AND sthfdocno = g_sthe_m.sthedocno 
            CALL g_sthf2_d.clear()
            CALL g_sthf3_d.clear()
            #end add-point
            LET g_sthf_d_t.* = g_sthf_d[l_ac].*     #新輸入資料
            LET g_sthf_d_o.* = g_sthf_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt252_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt252_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthf_d[li_reproduce_target].* = g_sthf_d[li_reproduce].*
 
               LET g_sthf_d[li_reproduce_target].sthfseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM sthf_t 
             WHERE sthfent = g_enterprise AND sthfdocno = g_sthe_m.sthedocno
 
               AND sthfseq = g_sthf_d[l_ac].sthfseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               CALL astt252_insert_b('sthf_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sthf_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt252_b_fill()
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
               LET gs_keys[01] = g_sthe_m.sthedocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_sthf_d_t.sthfseq
 
            
               #刪除同層單身
               IF NOT astt252_delete_b('sthf_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt252_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt252_key_delete_b(gs_keys,'sthf_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt252_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt252_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_sthf_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthf_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfseq
            #add-point:BEFORE FIELD sthfseq name="input.b.page1.sthfseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfseq
            
            #add-point:AFTER FIELD sthfseq name="input.a.page1.sthfseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_sthe_m.sthedocno IS NOT NULL AND g_sthf_d[g_detail_idx].sthfseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sthe_m.sthedocno != g_sthedocno_t OR g_sthf_d[g_detail_idx].sthfseq != g_sthf_d_t.sthfseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthf_t WHERE "||"sthfent = '" ||g_enterprise|| "' AND "||"sthfdocno = '"||g_sthe_m.sthedocno ||"' AND "|| "sthfseq = '"||g_sthf_d[g_detail_idx].sthfseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthfseq
            #add-point:ON CHANGE sthfseq name="input.g.page1.sthfseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf002
            
            #add-point:AFTER FIELD sthf002 name="input.a.page1.sthf002"
            LET g_sthf_d[l_ac].sthf002_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf002) THEN
               IF g_sthf_d[l_ac].sthf002 != g_sthf_d_o.sthf002 OR cl_null(g_sthf_d_o.sthf002) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthe_m.sthe004
                  LET g_chkparam.arg2 = g_sthf_d[l_ac].sthf002
                  #160604-00009#25 20160613 add by beckxie---S
                  IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
                     LET g_chkparam.where = " sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
                  END IF
                  IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
                     IF cl_null(g_chkparam.where) THEN
                        LET g_chkparam.where = " sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
                     ELSE
                        LET g_chkparam.where = g_chkparam.where," AND sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
                     END IF
                  END IF
                  #160604-00009#25 20160613 add by beckxie---E
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_sthf002') THEN
                     LET g_sthf_d[l_ac].sthf002 = g_sthf_d_o.sthf002
                     CALL astt252_sthf002_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
               #160516-00023#1 20160518 add by beckxie---S
               IF NOT astt252_sthf_dup_chk() THEN
                  LET g_sthf_d[l_ac].sthf002 = g_sthf_d_o.sthf002
                  CALL astt252_sthf002_ref()
                  NEXT FIELD CURRENT
               END IF
               #160516-00023#1 20160518 add by beckxie---E
            END IF
            
            LET g_sthf_d_o.sthf002 = g_sthf_d[l_ac].sthf002
            
            CALL astt252_carry_sthf()
            CALL astt252_sthf002_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf002
            #add-point:BEFORE FIELD sthf002 name="input.b.page1.sthf002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf002
            #add-point:ON CHANGE sthf002 name="input.g.page1.sthf002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf003
            
            #add-point:AFTER FIELD sthf003 name="input.a.page1.sthf003"
            LET g_sthf_d[l_ac].sthf003_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
               IF g_sthf_d[l_ac].sthf003 != g_sthf_d_o.sthf003 OR cl_null(g_sthf_d_o.sthf003) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthe_m.sthe004
                  LET g_chkparam.arg2 = g_sthf_d[l_ac].sthf003
                  #160604-00009#25 20160613 add by beckxie---S
                  IF NOT cl_null(g_sthf_d[l_ac].sthf002) THEN
                     LET g_chkparam.where = " sthd003 = '",g_sthf_d[l_ac].sthf002,"' "
                  END IF
                  IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
                     IF cl_null(g_chkparam.where) THEN
                        LET g_chkparam.where = " sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
                     ELSE
                        LET g_chkparam.where = g_chkparam.where," AND sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
                     END IF
                  END IF
                  #160604-00009#25 20160613 add by beckxie---E
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_sthf003') THEN
                     LET g_sthf_d[l_ac].sthf003 = g_sthf_d_o.sthf003
                     CALL astt252_sthf003_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
               #160516-00023#1 20160518 add by beckxie---S
               IF NOT astt252_sthf_dup_chk() THEN
                  LET g_sthf_d[l_ac].sthf003 = g_sthf_d_o.sthf003
                  CALL astt252_sthf003_ref()
                  NEXT FIELD CURRENT
               END IF
               #160516-00023#1 20160518 add by beckxie---E
            END IF
            
            LET g_sthf_d_o.sthf003 = g_sthf_d[l_ac].sthf003
            
            CALL astt252_carry_sthf()
            CALL astt252_sthf003_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf003
            #add-point:BEFORE FIELD sthf003 name="input.b.page1.sthf003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf003
            #add-point:ON CHANGE sthf003 name="input.g.page1.sthf003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf004
            
            #add-point:AFTER FIELD sthf004 name="input.a.page1.sthf004"
            LET g_sthf_d[l_ac].sthf004_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
               IF g_sthf_d[l_ac].sthf004 != g_sthf_d_o.sthf004 OR cl_null(g_sthf_d_o.sthf004) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthe_m.sthe004
                  LET g_chkparam.arg2 = g_sthf_d[l_ac].sthf004
                  #160604-00009#25 20160613 add by beckxie---S
                  IF NOT cl_null(g_sthf_d[l_ac].sthf002) THEN
                     LET g_chkparam.where = " sthd003 = '",g_sthf_d[l_ac].sthf002,"' "
                  END IF
                  IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
                     IF cl_null(g_chkparam.where) THEN
                        LET g_chkparam.where = " sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
                     ELSE
                        LET g_chkparam.where = g_chkparam.where," AND sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
                     END IF
                  END IF
                  #160604-00009#25 20160613 add by beckxie---E
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_sthf004') THEN
                     LET g_sthf_d[l_ac].sthf004 = g_sthf_d_o.sthf004
                     CALL astt252_sthf004_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
               #160516-00023#1 20160518 add by beckxie---S
               IF NOT astt252_sthf_dup_chk() THEN
                  LET g_sthf_d[l_ac].sthf004 = g_sthf_d_o.sthf004
                  CALL astt252_sthf004_ref()
                  NEXT FIELD CURRENT
               END IF
               #160516-00023#1 20160518 add by beckxie---E
            END IF
            
            LET g_sthf_d_o.sthf004 = g_sthf_d[l_ac].sthf004
            
            CALL astt252_carry_sthf()
            CALL astt252_sthf004_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf004
            #add-point:BEFORE FIELD sthf004 name="input.b.page1.sthf004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf004
            #add-point:ON CHANGE sthf004 name="input.g.page1.sthf004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf005
            
            #add-point:AFTER FIELD sthf005 name="input.a.page1.sthf005"
            LET g_sthf_d[l_ac].sthf005_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf005) THEN
               IF g_sthf_d[l_ac].sthf005 != g_sthf_d_o.sthf005 OR cl_null(g_sthf_d_o.sthf005) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthe_m.sthe004
                  LET g_chkparam.arg2 = g_sthf_d[l_ac].sthf005
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_sthf005') THEN
                     LET g_sthf_d[l_ac].sthf005 = g_sthf_d_o.sthf005
                     CALL astt252_sthf005_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
               #160516-00023#1 20160518 add by beckxie---S
               IF NOT astt252_sthf_dup_chk() THEN
                  LET g_sthf_d[l_ac].sthf005 = g_sthf_d_o.sthf005
                  CALL astt252_sthf005_ref()
                  NEXT FIELD CURRENT
               END IF
               #160516-00023#1 20160518 add by beckxie---E
            END IF
            
            LET g_sthf_d_o.sthf005 = g_sthf_d[l_ac].sthf005
            
            CALL astt252_carry_sthf()
            CALL astt252_sthf005_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf005
            #add-point:BEFORE FIELD sthf005 name="input.b.page1.sthf005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf005
            #add-point:ON CHANGE sthf005 name="input.g.page1.sthf005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf006
            
            #add-point:AFTER FIELD sthf006 name="input.a.page1.sthf006"
            LET g_sthf_d[l_ac].sthf006_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf006) THEN
               IF g_sthf_d[l_ac].sthf006 != g_sthf_d_o.sthf006 OR cl_null(g_sthf_d_o.sthf006) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthe_m.sthe004
                  LET g_chkparam.arg2 = g_sthf_d[l_ac].sthf006
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_sthf006') THEN
                     LET g_sthf_d[l_ac].sthf006 = g_sthf_d_o.sthf006
                     CALL astt252_sthf006_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
               #160516-00023#1 20160518 add by beckxie---S
               IF NOT astt252_sthf_dup_chk() THEN
                  LET g_sthf_d[l_ac].sthf006 = g_sthf_d_o.sthf006
                  CALL astt252_sthf006_ref()
                  NEXT FIELD CURRENT
               END IF
               #160516-00023#1 20160518 add by beckxie---E
            END IF
            
            LET g_sthf_d_o.sthf006 = g_sthf_d[l_ac].sthf006
            
            CALL astt252_carry_sthf()
            CALL astt252_sthf006_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf006
            #add-point:BEFORE FIELD sthf006 name="input.b.page1.sthf006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf006
            #add-point:ON CHANGE sthf006 name="input.g.page1.sthf006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf007
            
            #add-point:AFTER FIELD sthf007 name="input.a.page1.sthf007"
            LET g_sthf_d[l_ac].sthf007_desc = ' '
            IF NOT cl_null(g_sthf_d[l_ac].sthf007) THEN
               IF g_sthf_d[l_ac].sthf007 != g_sthf_d_o.sthf007 OR cl_null(g_sthf_d_o.sthf007) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_sthf_d[l_ac].sthf007
                  LET g_chkparam.err_str[1] = "amh-00630|",g_sthf_d[l_ac].sthf007
                  LET g_errshow = 1
                  IF NOT cl_chk_exist('v_mhbe001') THEN
                     LET g_sthf_d[l_ac].sthf007 = g_sthf_d_o.sthf007
                     CALL astt252_sthf007_ref()
                     NEXT FIELD CURRENT                  
                  END IF
               END IF
            END IF
            LET g_sthf_d_o.sthf007 = g_sthf_d[l_ac].sthf007
            
            CALL astt252_sthf007_ref()
            
            #由鋪位主檔 帶出此費用編號,需要的資訊
            INITIALIZE l_mhbe003,l_mhbe004,l_mhbe005,l_mhbe009,l_mhbe010 TO NULL
            SELECT mhbe003,mhbe004,mhbe005,mhbe009,mhbe010
              INTO l_mhbe003,l_mhbe004,l_mhbe005,l_mhbe009,l_mhbe010
              FROM mhbe_t
             WHERE mhbeent = g_enterprise
               AND mhbe001 = g_sthf_d[l_ac].sthf007
            IF g_sthc002 = 'Y' THEN
               IF NOT cl_null(l_mhbe003) THEN
                  LET g_sthf_d[l_ac].sthf002 = l_mhbe003
                  CALL astt252_sthf002_ref()
               END IF
            END IF
            IF g_sthc003 = 'Y' THEN
               IF NOT cl_null(l_mhbe004) THEN
                  LET g_sthf_d[l_ac].sthf003 = l_mhbe004
                  CALL astt252_sthf003_ref()
               END IF
            END IF
            IF g_sthc004 = 'Y' THEN
               IF NOT cl_null(l_mhbe005) THEN
                  LET g_sthf_d[l_ac].sthf004 = l_mhbe005
                  CALL astt252_sthf004_ref()
               END IF
            END IF
            IF g_sthc005 = 'Y' THEN
               IF NOT cl_null(l_mhbe009) THEN
                  LET g_sthf_d[l_ac].sthf005 = l_mhbe009
                  CALL astt252_sthf005_ref()
               END IF
            END IF
            IF g_sthc006 = 'Y' THEN
               IF NOT cl_null(l_mhbe010) THEN
                  LET g_sthf_d[l_ac].sthf006 = l_mhbe010
                  CALL astt252_sthf006_ref()
               END IF
            END IF
            CALL astt252_carry_sthf()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf007
            #add-point:BEFORE FIELD sthf007 name="input.b.page1.sthf007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf007
            #add-point:ON CHANGE sthf007 name="input.g.page1.sthf007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf008
            #add-point:BEFORE FIELD sthf008 name="input.b.page1.sthf008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf008
            
            #add-point:AFTER FIELD sthf008 name="input.a.page1.sthf008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf008
            #add-point:ON CHANGE sthf008 name="input.g.page1.sthf008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf009
            #add-point:BEFORE FIELD sthf009 name="input.b.page1.sthf009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf009
            
            #add-point:AFTER FIELD sthf009 name="input.a.page1.sthf009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf009
            #add-point:ON CHANGE sthf009 name="input.g.page1.sthf009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf010
            #add-point:BEFORE FIELD sthf010 name="input.b.page1.sthf010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf010
            
            #add-point:AFTER FIELD sthf010 name="input.a.page1.sthf010"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf010
            #add-point:ON CHANGE sthf010 name="input.g.page1.sthf010"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf011
            #add-point:BEFORE FIELD sthf011 name="input.b.page1.sthf011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf011
            
            #add-point:AFTER FIELD sthf011 name="input.a.page1.sthf011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf011
            #add-point:ON CHANGE sthf011 name="input.g.page1.sthf011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfsite
            #add-point:BEFORE FIELD sthfsite name="input.b.page1.sthfsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfsite
            
            #add-point:AFTER FIELD sthfsite name="input.a.page1.sthfsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthfsite
            #add-point:ON CHANGE sthfsite name="input.g.page1.sthfsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthfunit
            #add-point:BEFORE FIELD sthfunit name="input.b.page1.sthfunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthfunit
            
            #add-point:AFTER FIELD sthfunit name="input.a.page1.sthfunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthfunit
            #add-point:ON CHANGE sthfunit name="input.g.page1.sthfunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthf001
            #add-point:BEFORE FIELD sthf001 name="input.b.page1.sthf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthf001
            
            #add-point:AFTER FIELD sthf001 name="input.a.page1.sthf001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthf001
            #add-point:ON CHANGE sthf001 name="input.g.page1.sthf001"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sthfseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfseq
            #add-point:ON ACTION controlp INFIELD sthfseq name="input.c.page1.sthfseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf002
            #add-point:ON ACTION controlp INFIELD sthf002 name="input.c.page1.sthf002"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf002             #給予default值
        
            #給予arg
            LET g_qryparam.arg1 = g_sthe_m.sthesite #s
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "                LEFT JOIN sthd_t ON sthcent = sthdent ",
                                   "                                AND sthcsite = sthdsite ",
                                   "                                AND sthc001 =sthd001 ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 = '",g_sthe_m.sthe004,"' ",
                                   "            AND sthd003 = mhaa001 "
            #160604-00009#25 20160613 add by beckxie---S
            IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
               LET g_qryparam.where = g_qryparam.where , " AND sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
            END IF
            IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
               LET g_qryparam.where = g_qryparam.where , " AND sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
            END IF
            LET g_qryparam.where = g_qryparam.where  , " ) "
            #160604-00009#25 20160613 add by beckxie---E                      
 
            CALL q_mhaa001_1()                                #呼叫開窗
            
            LET g_sthf_d[l_ac].sthf002 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf002 TO sthf002              #
            CALL astt252_sthf002_ref()
            CALL astt252_sthf003_ref()
            CALL astt252_sthf004_ref()
            NEXT FIELD sthf002                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf003
            #add-point:ON ACTION controlp INFIELD sthf003 name="input.c.page1.sthf003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sthf_d[l_ac].sthf002
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "                LEFT JOIN sthd_t ON sthcent = sthdent ",
                                   "                                AND sthcsite = sthdsite ",
                                   "                                AND sthc001 =sthd001 ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 = '",g_sthe_m.sthe004,"' ",
                                   "            AND sthd004 = mhab002 "
            #160604-00009#25 20160613 add by beckxie---S
            IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
               LET g_qryparam.where = g_qryparam.where , " AND sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
            END IF
            LET g_qryparam.where = g_qryparam.where  , " ) "
            #160604-00009#25 20160613 add by beckxie---E
            CALL q_mhab002_1()                                #呼叫開窗
 
            LET g_sthf_d[l_ac].sthf003 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf003 TO sthf003              #
            CALL astt252_sthf002_ref()
            CALL astt252_sthf003_ref()
            CALL astt252_sthf004_ref()
            NEXT FIELD sthf003                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf004
            #add-point:ON ACTION controlp INFIELD sthf004 name="input.c.page1.sthf004"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf004             #給予default值
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "                LEFT JOIN sthd_t ON sthcent = sthdent ",
                                   "                                AND sthcsite = sthdsite ",
                                   "                                AND sthc001 =sthd001 ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 = '",g_sthe_m.sthe004,"' ",
                                   "            AND sthd005 = mhac003 ",
                                   "            AND sthd003 = mhac001 AND sthd004 = mhac002 "
            #160604-00009#25 20160613 add by beckxie---S
            IF NOT cl_null(g_sthf_d[l_ac].sthf002) THEN
               LET g_qryparam.where = g_qryparam.where , " AND sthd003 = '",g_sthf_d[l_ac].sthf002,"' "
            END IF
            IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
               LET g_qryparam.where = g_qryparam.where , " AND sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
            END IF
            #160604-00009#25 20160613 add by beckxie---E
            LET g_qryparam.where = g_qryparam.where  , " ) "
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhac003()                                #呼叫開窗
 
            LET g_sthf_d[l_ac].sthf004 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf004 TO sthf004              #
            CALL astt252_sthf002_ref()
            CALL astt252_sthf003_ref()
            CALL astt252_sthf004_ref()
            NEXT FIELD sthf004                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf005
            #add-point:ON ACTION controlp INFIELD sthf005 name="input.c.page1.sthf005"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "                LEFT JOIN sthd_t ON sthcent = sthdent ",
                                   "                                AND sthcsite = sthdsite ",
                                   "                                AND sthc001 =sthd001 ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 = '",g_sthe_m.sthe004,"' ",
                                   "            AND sthd006 = rtax001 )"
 
            CALL q_rtax001_1()                                #呼叫開窗
 
            LET g_sthf_d[l_ac].sthf005 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf005 TO sthf005              #
            CALL astt252_sthf005_ref()
            NEXT FIELD sthf005                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf006
            #add-point:ON ACTION controlp INFIELD sthf006 name="input.c.page1.sthf006"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2144" #s
            LET g_qryparam.where = " EXISTS (SELECT 1 ",
                                   "           FROM sthc_t ",
                                   "                LEFT JOIN sthd_t ON sthcent = sthdent ",
                                   "                                AND sthcsite = sthdsite ",
                                   "                                AND sthc001 =sthd001 ",
                                   "          WHERE sthcent = ",g_enterprise,"",
                                   "            AND sthcsite = '",g_sthe_m.sthesite,"' ",
                                   "            AND sthc001 = '",g_sthe_m.sthe004,"' ",
                                   "            AND sthd007 = oocql002 )"
 
            CALL q_oocq002()                                #呼叫開窗
 
            LET g_sthf_d[l_ac].sthf006 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf006 TO sthf006              #
            CALL astt252_sthf006_ref()
            NEXT FIELD sthf006                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf007
            #add-point:ON ACTION controlp INFIELD sthf007 name="input.c.page1.sthf007"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_sthf_d[l_ac].sthf007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhbe001()                                #呼叫開窗
 
            LET g_sthf_d[l_ac].sthf007 = g_qryparam.return1              

            DISPLAY g_sthf_d[l_ac].sthf007 TO sthf007              #
            CALL astt252_sthf007_ref()
            NEXT FIELD sthf007                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf008
            #add-point:ON ACTION controlp INFIELD sthf008 name="input.c.page1.sthf008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf009
            #add-point:ON ACTION controlp INFIELD sthf009 name="input.c.page1.sthf009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf010
            #add-point:ON ACTION controlp INFIELD sthf010 name="input.c.page1.sthf010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf011
            #add-point:ON ACTION controlp INFIELD sthf011 name="input.c.page1.sthf011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthfsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfsite
            #add-point:ON ACTION controlp INFIELD sthfsite name="input.c.page1.sthfsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthfunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthfunit
            #add-point:ON ACTION controlp INFIELD sthfunit name="input.c.page1.sthfunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sthf001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthf001
            #add-point:ON ACTION controlp INFIELD sthf001 name="input.c.page1.sthf001"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sthf_d[l_ac].* = g_sthf_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sthf_d[l_ac].sthfseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sthf_d[l_ac].* = g_sthf_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
              
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt252_sthf_t_mask_restore('restore_mask_o')
      
               UPDATE sthf_t SET (sthfdocno,sthfseq,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007, 
                   sthf008,sthf009,sthf010,sthf011,sthfsite,sthfunit,sthf001) = (g_sthe_m.sthedocno, 
                   g_sthf_d[l_ac].sthfseq,g_sthf_d[l_ac].sthf002,g_sthf_d[l_ac].sthf003,g_sthf_d[l_ac].sthf004, 
                   g_sthf_d[l_ac].sthf005,g_sthf_d[l_ac].sthf006,g_sthf_d[l_ac].sthf007,g_sthf_d[l_ac].sthf008, 
                   g_sthf_d[l_ac].sthf009,g_sthf_d[l_ac].sthf010,g_sthf_d[l_ac].sthf011,g_sthf_d[l_ac].sthfsite, 
                   g_sthf_d[l_ac].sthfunit,g_sthf_d[l_ac].sthf001)
                WHERE sthfent = g_enterprise AND sthfdocno = g_sthe_m.sthedocno 
 
                  AND sthfseq = g_sthf_d_t.sthfseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sthf_d[l_ac].* = g_sthf_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthf_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sthf_d[l_ac].* = g_sthf_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys_bak[1] = g_sthedocno_t
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys_bak[2] = g_sthf_d_t.sthfseq
               CALL astt252_update_b('sthf_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt252_sthf_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sthf_d[g_detail_idx].sthfseq = g_sthf_d_t.sthfseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sthe_m.sthedocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sthf_d_t.sthfseq
 
                  CALL astt252_key_update_b(gs_keys,'sthf_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sthe_m),util.JSON.stringify(g_sthf_d_t)
               LET g_log2 = util.JSON.stringify(g_sthe_m),util.JSON.stringify(g_sthf_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            IF g_argv[1] = '2' THEN
               IF cl_null(g_sthf_d[g_detail_idx].sthf007)THEN
                  ERROR "This field requires an entered value."
                  NEXT FIELD sthf007
               END IF
            END IF
            #CALL astt252_set_entry_b(l_cmd)
            #CALL astt252_set_no_required_b()
            #CALL astt252_set_required_b()
            #CALL astt252_set_no_entry_b(l_cmd)
            #end add-point
            CALL astt252_unlock_b("sthf_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sthf_d[li_reproduce_target].* = g_sthf_d[li_reproduce].*
 
               LET g_sthf_d[li_reproduce_target].sthfseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthf_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthf_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
      INPUT ARRAY g_sthf2_d FROM s_detail2.*
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
            IF g_detail_idx = 0 OR g_sthf_d.getLength() = 0 THEN
               NEXT FIELD sthfseq
            END IF
            #檢查上層單身是否有資料
            IF cl_null(g_sthf_d[g_detail_idx].sthfseq) THEN
               NEXT FIELD sthfseq
            END IF
            #add-point:資料輸入前 name="input.body2.before_input2"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthf2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            #如果一直都在單身2則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sthf2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sthf2_d[l_ac].* TO NULL 
            INITIALIZE g_sthf2_d_t.* TO NULL 
            INITIALIZE g_sthf2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_sthf2_d[l_ac].sthgseq1 = "1"
      LET g_sthf2_d[l_ac].sthg007 = "1"
      LET g_sthf2_d[l_ac].sthg010 = "1"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            LET g_sthf2_d[l_ac].sthgsite = g_sthe_m.sthesite 
            LET g_sthf2_d[l_ac].sthgunit = g_sthe_m.stheunit 
            LET g_sthf2_d[l_ac].sthg001 = g_sthe_m.sthe002
            SELECT COALESCE(MAX(sthgseq1)+1,1) INTO g_sthf2_d[l_ac].sthgseq1 
              FROM sthg_t
             WHERE sthgent = g_enterprise 
               AND sthgdocno = g_sthe_m.sthedocno 
               AND sthgseq = g_sthf_d[g_detail_idx].sthfseq
            #20160429 add by beckxie---S
            IF g_sthf2_d[l_ac].sthgseq1 = '1' THEN
               LET g_sthf2_d[l_ac].sthg002 = g_sthe_m.sthe005
               LET g_sthf2_d[l_ac].sthg003 = g_sthe_m.sthe006
            END IF
            #20160429 add by beckxie---E
            #sthg010 =1 預設關閉
            CALL cl_set_comp_visible('page_4',FALSE)
            CALL g_sthf3_d.clear()
            #end add-point
            LET g_sthf2_d_t.* = g_sthf2_d[l_ac].*     #新輸入資料
            LET g_sthf2_d_o.* = g_sthf2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt252_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astt252_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthf2_d[li_reproduce_target].* = g_sthf2_d[li_reproduce].*
 
               LET g_sthf2_d[li_reproduce_target].sthgseq1 = NULL
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
            OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
            #(ver:78) ---start---
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt252_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CLOSE astt252_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            #(ver:78) --- end ---
            OPEN astt252_bcl USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt252_bcl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt252_cl
               CLOSE astt252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sthf2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthf2_d[l_ac].sthgseq1 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sthf2_d_t.* = g_sthf2_d[l_ac].*  #BACKUP
               LET g_sthf2_d_o.* = g_sthf2_d[l_ac].*  #BACKUP
               CALL astt252_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astt252_set_no_entry_b(l_cmd)
               IF NOT astt252_lock_b("sthg_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt252_bcl2 INTO g_sthf2_d[l_ac].sthgseq1,g_sthf2_d[l_ac].sthg001,g_sthf2_d[l_ac].sthg002, 
                      g_sthf2_d[l_ac].sthg003,g_sthf2_d[l_ac].sthg004,g_sthf2_d[l_ac].sthg005,g_sthf2_d[l_ac].sthg006, 
                      g_sthf2_d[l_ac].sthg007,g_sthf2_d[l_ac].sthg008,g_sthf2_d[l_ac].sthg009,g_sthf2_d[l_ac].sthg010, 
                      g_sthf2_d[l_ac].sthgsite,g_sthf2_d[l_ac].sthgunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthf2_d_mask_o[l_ac].* =  g_sthf2_d[l_ac].*
                  CALL astt252_sthg_t_mask()
                  LET g_sthf2_d_mask_n[l_ac].* =  g_sthf2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt252_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            CALL astt252_b_fill3('3')
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
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
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys[3] = g_sthf2_d_t.sthgseq1
 
 
               #刪除同層單身
               IF NOT astt252_delete_b('sthg_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt252_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point   
               
               CALL s_transaction_end('Y','0')
               CLOSE astt252_bcl
                  
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
 
               LET l_count = g_sthf_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthf2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM sthg_t 
             WHERE sthgent = g_enterprise AND sthgdocno = g_sthe_m.sthedocno AND sthgseq = g_sthf_d[g_detail_idx].sthfseq  
                 AND sthgseq1 = g_sthf2_d[g_detail_idx2].sthgseq1
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys[3] = g_sthf2_d[g_detail_idx2].sthgseq1
               CALL astt252_insert_b('sthg_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_sthf_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt252_b_fill()
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
               LET g_sthf2_d[l_ac].* = g_sthf2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt252_bcl2
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
               LET g_sthf2_d[l_ac].* = g_sthf2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astt252_sthg_t_mask_restore('restore_mask_o')
               
               UPDATE sthg_t SET (sthgdocno,sthgseq,sthgseq1,sthg001,sthg002,sthg003,sthg004,sthg005, 
                   sthg006,sthg007,sthg008,sthg009,sthg010,sthgsite,sthgunit) = (g_sthe_m.sthedocno, 
                   g_sthf_d[g_detail_idx].sthfseq,g_sthf2_d[l_ac].sthgseq1,g_sthf2_d[l_ac].sthg001,g_sthf2_d[l_ac].sthg002, 
                   g_sthf2_d[l_ac].sthg003,g_sthf2_d[l_ac].sthg004,g_sthf2_d[l_ac].sthg005,g_sthf2_d[l_ac].sthg006, 
                   g_sthf2_d[l_ac].sthg007,g_sthf2_d[l_ac].sthg008,g_sthf2_d[l_ac].sthg009,g_sthf2_d[l_ac].sthg010, 
                   g_sthf2_d[l_ac].sthgsite,g_sthf2_d[l_ac].sthgunit) #自訂欄位頁簽
                WHERE sthgent = g_enterprise AND sthgdocno = g_sthedocno_t AND sthgseq = g_sthf_d[g_detail_idx].sthfseq  
                    AND sthgseq1 = g_sthf2_d_t.sthgseq1
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sthf2_d[l_ac].* = g_sthf2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthg_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sthf2_d[l_ac].* = g_sthf2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys_bak[1] = g_sthedocno_t
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys_bak[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys[3] = g_sthf2_d[g_detail_idx2].sthgseq1
               LET gs_keys_bak[3] = g_sthf2_d_t.sthgseq1
               CALL astt252_update_b('sthg_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astt252_sthg_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sthe_m),util.JSON.stringify(g_sthf2_d_t)
               LET g_log2 = util.JSON.stringify(g_sthe_m),util.JSON.stringify(g_sthf2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgseq1
            #add-point:BEFORE FIELD sthgseq1 name="input.b.page2.sthgseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgseq1
            
            #add-point:AFTER FIELD sthgseq1 name="input.a.page2.sthgseq1"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_sthe_m.sthedocno IS NOT NULL AND g_sthf_d[g_detail_idx].sthfseq IS NOT NULL AND g_sthf2_d[g_detail_idx2].sthgseq1 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sthe_m.sthedocno != g_sthedocno_t OR g_sthf_d[g_detail_idx].sthfseq != g_sthf_d[g_detail_idx].sthfseq OR g_sthf2_d[g_detail_idx2].sthgseq1 != g_sthf2_d_t.sthgseq1)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sthg_t WHERE "||"sthgent = '" ||g_enterprise|| "' AND "||"sthgdocno = '"||g_sthe_m.sthedocno ||"' AND "|| "sthgseq = '"||g_sthf_d[g_detail_idx].sthfseq ||"' AND "|| "sthgseq1 = '"||g_sthf2_d[g_detail_idx2].sthgseq1 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthgseq1
            #add-point:ON CHANGE sthgseq1 name="input.g.page2.sthgseq1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg001
            #add-point:BEFORE FIELD sthg001 name="input.b.page2.sthg001"
            SELECT COUNT(*) INTO l_cnt 
              FROM sthg_t
             WHERE sthgent = g_enterprise 
               AND sthgdocno = g_sthe_m.sthedocno
               AND stheseq = g_sthf_d[g_detail_idx].sthfseq
            IF l_cnt = 0 AND cl_null(g_sthf2_d[l_ac].sthg001) AND cl_null(g_sthf2_d[l_ac].sthg002) THEN
               LET g_sthf2_d[l_ac].sthg001 = g_sthe_m.sthe005
               LET g_sthf2_d[l_ac].sthg002 = g_sthe_m.sthe006
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg001
            
            #add-point:AFTER FIELD sthg001 name="input.a.page2.sthg001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg001
            #add-point:ON CHANGE sthg001 name="input.g.page2.sthg001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg002
            #add-point:BEFORE FIELD sthg002 name="input.b.page2.sthg002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg002
            
            #add-point:AFTER FIELD sthg002 name="input.a.page2.sthg002"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg002) AND NOT cl_null(g_sthf2_d[l_ac].sthg003) THEN
               IF NOT (g_sthf2_d[l_ac].sthg002 <= g_sthf2_d[l_ac].sthg003) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'art-00020'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_sthf2_d[l_ac].sthg002) THEN
               IF g_sthf2_d[l_ac].sthg002 > g_sthe_m.sthe006 OR g_sthf2_d[l_ac].sthg002 < g_sthe_m.sthe005 THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00665'
                  LET g_errparam.popup  = TRUE 
                  LET g_errparam.replace[1] = g_sthf2_d[l_ac].sthg002
                  LET g_errparam.replace[2] = g_sthe_m.sthe005
                  LET g_errparam.replace[3] = g_sthe_m.sthe006
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               LET l_cnt = 0 
               SELECT COUNT(*) INTO l_cnt 
                 FROM sthg_t
                WHERE sthgent = g_enterprise
                  AND sthgdocno = g_sthe_m.sthedocno
                  AND sthgseq = g_sthf_d[g_detail_idx].sthfseq
                  AND sthgseq1 != g_sthf2_d[l_ac].sthgseq1
                  AND g_sthf2_d[l_ac].sthg002 BETWEEN sthg002 AND sthg003
               IF l_cnt >0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00618'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg002
            #add-point:ON CHANGE sthg002 name="input.g.page2.sthg002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg003
            #add-point:BEFORE FIELD sthg003 name="input.b.page2.sthg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg003
            
            #add-point:AFTER FIELD sthg003 name="input.a.page2.sthg003"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg002) AND NOT cl_null(g_sthf2_d[l_ac].sthg003) THEN
               IF NOT (g_sthf2_d[l_ac].sthg002 <= g_sthf2_d[l_ac].sthg003) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'amm-00081'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_sthf2_d[l_ac].sthg003) THEN
               IF g_sthf2_d[l_ac].sthg003 > g_sthe_m.sthe006 OR g_sthf2_d[l_ac].sthg003 < g_sthe_m.sthe005 THEN 
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00666'
                  LET g_errparam.popup  = TRUE 
                  LET g_errparam.replace[1] = g_sthf2_d[l_ac].sthg003
                  LET g_errparam.replace[2] = g_sthe_m.sthe005
                  LET g_errparam.replace[3] = g_sthe_m.sthe006
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               LET l_cnt = 0 
               SELECT COUNT(*) INTO l_cnt 
                 FROM sthg_t
                WHERE sthgent = g_enterprise
                  AND sthgdocno = g_sthe_m.sthedocno
                  AND sthgseq = g_sthf_d[g_detail_idx].sthfseq
                  AND sthgseq1 != g_sthf2_d[l_ac].sthgseq1
                  AND g_sthf2_d[l_ac].sthg003 BETWEEN sthg002 AND sthg003
               IF l_cnt >0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00618'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF   
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg003
            #add-point:ON CHANGE sthg003 name="input.g.page2.sthg003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg004
            #add-point:BEFORE FIELD sthg004 name="input.b.page2.sthg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg004
            
            #add-point:AFTER FIELD sthg004 name="input.a.page2.sthg004"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg004) THEN
               LET l_str = g_sthf2_d[l_ac].sthg004
               LET l_str = l_str.trim()
               IF l_str.getLength() <> 12 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00359'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_sthf2_d[l_ac].sthg004 = g_sthf2_d_t.sthg004
                  NEXT FIELD sthg004 
               END IF 
               FOR l_i1 =1 TO l_str.getLength()
                  IF l_str.subString(l_i1,l_i1) NOT MATCHES '[01]' THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00359'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_sthf2_d[l_ac].sthg004 = g_sthf2_d_t.sthg004
                     NEXT FIELD sthg004 
                  END IF 
               END FOR 
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg004
            #add-point:ON CHANGE sthg004 name="input.g.page2.sthg004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg005
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sthf2_d[l_ac].sthg005,"0","1","","","azz-00079",1) THEN
               NEXT FIELD sthg005
            END IF 
 
 
 
            #add-point:AFTER FIELD sthg005 name="input.a.page2.sthg005"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg005) THEN 
               #add by geza 20160623 160604-00009#104(S)
               CALL s_asti800_curr_round(g_sthe_m.sthesite,'',g_sthf2_d[l_ac].sthg005,'1')
                  RETURNING g_sthf2_d[l_ac].sthg005
               #add by geza 20160623 160604-00009#104(E)
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg005
            #add-point:BEFORE FIELD sthg005 name="input.b.page2.sthg005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg005
            #add-point:ON CHANGE sthg005 name="input.g.page2.sthg005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg006
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sthf2_d[l_ac].sthg006,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sthg006
            END IF 
 
 
 
            #add-point:AFTER FIELD sthg006 name="input.a.page2.sthg006"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg006) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg006
            #add-point:BEFORE FIELD sthg006 name="input.b.page2.sthg006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg006
            #add-point:ON CHANGE sthg006 name="input.g.page2.sthg006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg007
            #add-point:BEFORE FIELD sthg007 name="input.b.page2.sthg007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg007
            
            #add-point:AFTER FIELD sthg007 name="input.a.page2.sthg007"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            IF g_sthf2_d[l_ac].sthg007 ='1' THEN 
               LET g_sthf2_d[l_ac].sthg008 =''
               LET g_sthf2_d[l_ac].sthg009 =''
            END IF
            IF g_sthf2_d[l_ac].sthg007 ='3' THEN 
               LET g_sthf2_d[l_ac].sthg009 =''
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg007
            #add-point:ON CHANGE sthg007 name="input.g.page2.sthg007"
            CALL astt252_set_entry_b(l_cmd)
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            CALL astt252_set_no_entry_b(l_cmd)
            IF g_sthf2_d[l_ac].sthg007 ='1' THEN 
               LET g_sthf2_d[l_ac].sthg008 =''
               LET g_sthf2_d[l_ac].sthg009 =''
            END IF
            IF g_sthf2_d[l_ac].sthg007 ='3' THEN 
               LET g_sthf2_d[l_ac].sthg009 =''
            END IF
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sthf2_d[l_ac].sthg008,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sthg008
            END IF 
 
 
 
            #add-point:AFTER FIELD sthg008 name="input.a.page2.sthg008"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg008) THEN
               #add by geza 20160623 160604-00009#104(S)
               CALL s_asti800_curr_round(g_sthe_m.sthesite,'',g_sthf2_d[l_ac].sthg008,'1')
                  RETURNING g_sthf2_d[l_ac].sthg008
               #add by geza 20160623 160604-00009#104(E)            
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg008
            #add-point:BEFORE FIELD sthg008 name="input.b.page2.sthg008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg008
            #add-point:ON CHANGE sthg008 name="input.g.page2.sthg008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg009
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sthf2_d[l_ac].sthg009,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sthg009
            END IF 
 
 
 
            #add-point:AFTER FIELD sthg009 name="input.a.page2.sthg009"
            IF NOT cl_null(g_sthf2_d[l_ac].sthg009) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg009
            #add-point:BEFORE FIELD sthg009 name="input.b.page2.sthg009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg009
            #add-point:ON CHANGE sthg009 name="input.g.page2.sthg009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthg010
            #add-point:BEFORE FIELD sthg010 name="input.b.page2.sthg010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthg010
            
            #add-point:AFTER FIELD sthg010 name="input.a.page2.sthg010"
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthg010
            #add-point:ON CHANGE sthg010 name="input.g.page2.sthg010"
            CALL astt252_set_comp_visible()
            CALL astt252_set_comp_no_visible()
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgsite
            #add-point:BEFORE FIELD sthgsite name="input.b.page2.sthgsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgsite
            
            #add-point:AFTER FIELD sthgsite name="input.a.page2.sthgsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthgsite
            #add-point:ON CHANGE sthgsite name="input.g.page2.sthgsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sthgunit
            #add-point:BEFORE FIELD sthgunit name="input.b.page2.sthgunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sthgunit
            
            #add-point:AFTER FIELD sthgunit name="input.a.page2.sthgunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sthgunit
            #add-point:ON CHANGE sthgunit name="input.g.page2.sthgunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.sthgseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgseq1
            #add-point:ON ACTION controlp INFIELD sthgseq1 name="input.c.page2.sthgseq1"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg001
            #add-point:ON ACTION controlp INFIELD sthg001 name="input.c.page2.sthg001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg002
            #add-point:ON ACTION controlp INFIELD sthg002 name="input.c.page2.sthg002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg003
            #add-point:ON ACTION controlp INFIELD sthg003 name="input.c.page2.sthg003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg004
            #add-point:ON ACTION controlp INFIELD sthg004 name="input.c.page2.sthg004"
            CALL astt252_get_sthg004() RETURNING g_sthf2_d[l_ac].sthg004
            DISPLAY g_sthf2_d[l_ac].sthg004 TO sthg004
            NEXT FIELD sthg004
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg005
            #add-point:ON ACTION controlp INFIELD sthg005 name="input.c.page2.sthg005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg006
            #add-point:ON ACTION controlp INFIELD sthg006 name="input.c.page2.sthg006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg007
            #add-point:ON ACTION controlp INFIELD sthg007 name="input.c.page2.sthg007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg008
            #add-point:ON ACTION controlp INFIELD sthg008 name="input.c.page2.sthg008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg009
            #add-point:ON ACTION controlp INFIELD sthg009 name="input.c.page2.sthg009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthg010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthg010
            #add-point:ON ACTION controlp INFIELD sthg010 name="input.c.page2.sthg010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthgsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgsite
            #add-point:ON ACTION controlp INFIELD sthgsite name="input.c.page2.sthgsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.sthgunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sthgunit
            #add-point:ON ACTION controlp INFIELD sthgunit name="input.c.page2.sthgunit"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2_after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sthf2_d[l_ac].* = g_sthf2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt252_bcl2
               CLOSE astt252_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt252_unlock_b("sthg_t","'2'")
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
               LET g_sthf2_d[li_reproduce_target].* = g_sthf2_d[li_reproduce].*
 
               LET g_sthf2_d[li_reproduce_target].sthgseq1 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthf2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthf2_d.getLength()+1
            END IF
        
      END INPUT
 
 
 
 
{</section>}
 
{<section id="astt252.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      INPUT ARRAY g_sthf3_d FROM s_detail3.* 
      ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 

                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
         BEFORE INPUT
            #先將上層單身的idx放入g_detail_idx
            LET g_detail_idx_tmp = g_detail_idx2
            LET g_detail_idx2 = g_detail_idx_list[2]
            #檢查上層單身是否為空
            IF g_detail_idx2 = 0 OR g_sthf2_d.getLength() = 0 THEN
               NEXT FIELD sthgseq1
            END IF
            #檢查上層單身是否有資料
            IF cl_null(g_sthf2_d[g_detail_idx2].sthgseq1) THEN
               NEXT FIELD sthgseq1
            END IF
            
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sthf3_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            #如果一直都在單身2則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sthf3_d.getLength()
         BEFORE INSERT
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sthf3_d[l_ac].* TO NULL 
            INITIALIZE g_sthf3_d_t.* TO NULL 
            INITIALIZE g_sthf3_d_o.* TO NULL 
            
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            LET g_sthf3_d[l_ac].sthhsite = g_sthe_m.sthesite 
            LET g_sthf3_d[l_ac].sthhunit = g_sthe_m.stheunit 
            LET g_sthf3_d[l_ac].sthh001 = g_sthe_m.sthe002
            SELECT COALESCE(MAX(sthhseq2)+1,1) INTO g_sthf3_d[l_ac].sthhseq2
              FROM sthh_t
             WHERE sthhent = g_enterprise 
               AND sthhdocno = g_sthe_m.sthedocno 
               AND sthhseq = g_sthf_d[g_detail_idx].sthfseq
               AND sthhseq1 = g_sthf2_d[g_detail_idx2].sthgseq1
            #end add-point
            LET g_sthf3_d_t.* = g_sthf3_d[l_ac].*     #新輸入資料
            LET g_sthf3_d_o.* = g_sthf3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt252_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            CALL astt252_set_no_required_b()
            CALL astt252_set_required_b()
            #end add-point
            CALL astt252_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sthf3_d[li_reproduce_target].* = g_sthf3_d[li_reproduce].*
 
               LET g_sthf3_d[li_reproduce_target].sthhseq2 = NULL
            END IF
         BEFORE ROW
            #add-point:modify段before row2 name="input.body2.before_row2"
            CALL astt252_b_fill3('3')
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx3 = l_ac
            LET g_detail_idx_list[3] = l_ac
            LET g_current_page = 3
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
            #OPEN astt252_bcl USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq
            OPEN astt252_bcl3 USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq,g_sthf2_d[g_detail_idx2].sthgseq1,g_sthf3_d[g_detail_idx3].sthhseq2
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt252_cl:" 
               LET g_errparam.code   = STATUS 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CLOSE astt252_cl
               CLOSE astt252_bcl
               CLOSE astt252_bcl2
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_sthf3_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sthf3_d[l_ac].sthhseq2 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sthf3_d_t.* = g_sthf3_d[l_ac].*  #BACKUP
               LET g_sthf3_d_o.* = g_sthf3_d[l_ac].*  #BACKUP
               CALL astt252_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               CALL astt252_set_no_required_b()
               CALL astt252_set_required_b()
               #end add-point  
               CALL astt252_set_no_entry_b(l_cmd)
               IF NOT astt252_lock_b("sthh_t","'3'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt252_bcl3 INTO g_sthf3_d[l_ac].sthhseq2,g_sthf3_d[l_ac].sthh001,g_sthf3_d[l_ac].sthh002, 
                      g_sthf3_d[l_ac].sthh003,g_sthf3_d[l_ac].sthh004,g_sthf3_d[l_ac].sthh005,
                      g_sthf3_d[l_ac].sthhsite,g_sthf3_d[l_ac].sthhunit
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sthf3_d_mask_o[l_ac].* =  g_sthf3_d[l_ac].*
                  #CALL astt252_sthh_t_mask()
                  LET g_sthf3_d_mask_n[l_ac].* =  g_sthf3_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt252_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            
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
                  LET g_errparam.code   = -263 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身2刪除前 name="input.body2.b_delete"

               #end add-point    
 
               #取得該筆資料key值
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys[3] = g_sthf2_d_t.sthgseq1
               LET gs_keys[3] = g_sthf3_d_t.sthhseq2
 
 
               #刪除同層單身
               IF NOT astt252_delete_b('sthh_t',gs_keys,"'3'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt252_bcl2
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
               
               #add-point:單身2刪除中 name="input.body2.m_delete"

               #end add-point   
               
               CALL s_transaction_end('Y','0')
               CLOSE astt252_bcl2
                  
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"

               #end add-point
 
               LET l_count = g_sthf2_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"

               #end add-point
            END IF 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sthf3_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
         AFTER INSERT    
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身2新增前 name="input.body2.b_a_insert"

            #end add-point
    
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sthh_t 
             WHERE sthhent = g_enterprise AND sthhdocno = g_sthe_m.sthedocno AND sthhseq = g_sthf_d[g_detail_idx].sthfseq  
                 AND sthhseq1 = g_sthf2_d[g_detail_idx2].sthgseq1 AND sthhseq2 = g_sthf3_d[g_detail_idx3].sthhseq2
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"

               #end add-point
            
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sthe_m.sthedocno
               LET gs_keys[2] = g_sthf_d[g_detail_idx].sthfseq
               LET gs_keys[3] = g_sthf2_d[g_detail_idx2].sthgseq1
               LET gs_keys[4] = g_sthf3_d[g_detail_idx3].sthhseq2
               CALL astt252_insert_b('sthh_t',gs_keys,"'3'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code   = "std-00006" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               INITIALIZE g_sthf2_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt252_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body2.after_insert"

               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
            #還原g_detail_idx
            LET g_detail_idx = g_detail_idx_tmp
         AFTER FIELD sthh002
            IF NOT cl_null(g_sthf3_d[l_ac].sthh002) AND NOT cl_null(g_sthf3_d[l_ac].sthh003) THEN
               IF NOT (g_sthf3_d[l_ac].sthh002 <= g_sthf3_d[l_ac].sthh003) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00616'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_sthf3_d[l_ac].sthh002) THEN
               LET l_cnt = 0 
               SELECT COUNT(*) INTO l_cnt 
                 FROM sthh_t
                WHERE sthhent = g_enterprise
                  AND sthhdocno = g_sthe_m.sthedocno
                  AND sthhseq = g_sthf_d[g_detail_idx].sthfseq
                  AND sthhseq1 = g_sthf2_d[g_detail_idx2].sthgseq1
                  AND sthhseq2 != g_sthf3_d[l_ac].sthhseq2
                  AND g_sthf3_d[l_ac].sthh002 BETWEEN sthh002 AND sthh003
               IF l_cnt >0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00617'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         AFTER FIELD sthh003
            IF NOT cl_null(g_sthf3_d[l_ac].sthh002) AND NOT cl_null(g_sthf3_d[l_ac].sthh003) THEN
               IF NOT (g_sthf3_d[l_ac].sthh002 <= g_sthf3_d[l_ac].sthh003) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00615'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_sthf3_d[l_ac].sthh003) THEN
               LET l_cnt = 0 
               SELECT COUNT(*) INTO l_cnt 
                 FROM sthh_t
                WHERE sthhent = g_enterprise
                  AND sthhdocno = g_sthe_m.sthedocno
                  AND sthhseq = g_sthf_d[g_detail_idx].sthfseq
                  AND sthhseq1 = g_sthf2_d[g_detail_idx2].sthgseq1
                  AND sthhseq2 != g_sthf3_d[l_ac].sthhseq2
                  AND g_sthf3_d[l_ac].sthh003 BETWEEN sthh002 AND sthh003
               IF l_cnt >0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code   = 'ast-00617'
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         AFTER FIELD sthh004
            IF NOT cl_ap_chk_range(g_sthf3_d[l_ac].sthh004,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sthh004
            END IF 
            #add by geza 20160623 160604-00009#104(S)
            IF NOT cl_null(g_sthf3_d[l_ac].sthh004) THEN 
               #add by geza 20160623 160604-00009#104(S)
               CALL s_asti800_curr_round(g_sthe_m.sthesite,'',g_sthf3_d[l_ac].sthh004,'1')
                  RETURNING g_sthf3_d[l_ac].sthh004
               #add by geza 20160623 160604-00009#104(E)
            END IF 

            #add by geza 20160623 160604-00009#104(E)
            
         AFTER FIELD sthh005
            IF NOT cl_ap_chk_range(g_sthf3_d[l_ac].sthh005,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sthh005
            END IF 
         AFTER ROW
            #add-point:單身page2_after_row name="input.body2.after_row"

            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = 9001 
               LET g_errparam.popup  = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sthf3_d[l_ac].* = g_sthf3_d_t.*
               END IF
               CLOSE astt252_bcl3
               CLOSE astt252_bcl2
               CLOSE astt252_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt252_unlock_b("sthh_t","'3'")
            CALL s_transaction_end('Y','0')
            
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sthf3_d[li_reproduce_target].* = g_sthf3_d[li_reproduce].*
 
               LET g_sthf3_d[li_reproduce_target].sthhseq2 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sthf3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sthf3_d.getLength()+1
            END IF
      END INPUT
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
            NEXT FIELD sthedocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sthfseq
               WHEN "s_detail2"
                  NEXT FIELD sthgseq1
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               WHEN "s_detail3"
                  NEXT FIELD sthhseq2
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
 
{<section id="astt252.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt252_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt252_b_fill() #單身填充
      CALL astt252_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt252_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   IF g_bfill = "Y" THEN
      CALL astt252_b_fill3('3') #單身填充
   END IF
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthe_m.sthedocno
   CALL ap_ref_array2(g_ref_fields," SELECT sthel002 FROM sthel_t WHERE sthelent = '"||g_enterprise||"' AND stheldocno = ? AND sthel001 = '"||g_dlang||"'","") RETURNING g_rtn_fields 
   LET g_sthe_m.sthel002 = g_rtn_fields[1] 
   DISPLAY g_sthe_m.sthel002 TO sthel002
   #end add-point
   
   #遮罩相關處理
   LET g_sthe_m_mask_o.* =  g_sthe_m.*
   CALL astt252_sthe_t_mask()
   LET g_sthe_m_mask_n.* =  g_sthe_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthesite_desc,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000, 
       g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe004_desc,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe008_desc,g_sthe_m.sthe009,g_sthe_m.sthe009_desc, 
       g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp,g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdp_desc,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemodid_desc,g_sthe_m.sthemoddt, 
       g_sthe_m.sthecnfid,g_sthe_m.sthecnfid_desc,g_sthe_m.sthecnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthe_m.sthestus 
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
   FOR l_ac = 1 TO g_sthf_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_sthf2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt252_detail_show()
 
   #add-point:show段之後 name="show.after"
   CALL astt252_get_sthc()
   CALL astt252_set_comp_visible()
   CALL astt252_set_comp_no_visible()
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt252_detail_show()
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
 
{<section id="astt252.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt252_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sthe_t.sthedocno 
   DEFINE l_oldno     LIKE sthe_t.sthedocno 
 
   DEFINE l_master    RECORD LIKE sthe_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sthf_t.* #此變數樣板目前無使用
 
   DEFINE l_detail2    RECORD LIKE sthg_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_detail3   RECORD LIKE sthh_t.*
   DEFINE l_success   LIKE type_t.num5
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
   
   IF g_sthe_m.sthedocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sthedocno_t = g_sthe_m.sthedocno
 
    
   LET g_sthe_m.sthedocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sthe_m.stheownid = g_user
      LET g_sthe_m.stheowndp = g_dept
      LET g_sthe_m.sthecrtid = g_user
      LET g_sthe_m.sthecrtdp = g_dept 
      LET g_sthe_m.sthecrtdt = cl_get_current()
      LET g_sthe_m.sthemodid = g_user
      LET g_sthe_m.sthemoddt = cl_get_current()
      LET g_sthe_m.sthestus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_sthe_m.sthe000 = 'I'
   #預設單據別
   CALL s_arti200_get_def_doc_type(g_site,g_prog,'1') RETURNING l_success,g_sthe_m.sthedocno
   LET g_sthe_m.sthe002 = ''
   LET g_sthe_m.sthe003 = '1'
   LET g_sthe_m.sthel002 = ''
   LET g_sthe_m.sthecnfid = ''
   LET g_sthe_m.sthecnfdt = ''
   LET g_reproduce_flag = 'Y'   #160604-00009#25 20160620 add by beckxie
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sthe_m.sthestus 
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
   
   
   CALL astt252_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sthe_m.* TO NULL
      INITIALIZE g_sthf_d TO NULL
      INITIALIZE g_sthf2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt252_show()
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
   CALL astt252_set_act_visible()   
   CALL astt252_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sthedocno_t = g_sthe_m.sthedocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stheent = " ||g_enterprise|| " AND",
                      " sthedocno = '", g_sthe_m.sthedocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt252_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt252_idx_chk()
   
   LET g_data_owner = g_sthe_m.stheownid      
   LET g_data_dept  = g_sthe_m.stheowndp
   
   #功能已完成,通報訊息中心
   CALL astt252_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt252_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sthf_t.* #此變數樣板目前無使用
 
   DEFINE l_detail2    RECORD LIKE sthg_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt252_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sthf_t
    WHERE sthfent = g_enterprise AND sthfdocno = g_sthedocno_t
 
    INTO TEMP astt252_detail
 
   #將key修正為調整後   
   UPDATE astt252_detail 
      #更新key欄位
      SET sthfdocno = g_sthe_m.sthedocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   DELETE FROM astt252_detail #160604-00009#25 20160613 add by beckxie
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sthf_t SELECT * FROM astt252_detail
   
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
   DROP TABLE astt252_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sthg_t 
    WHERE sthgent = g_enterprise AND sthgdocno = g_sthedocno_t
 
    INTO TEMP astt252_detail
 
   #將key修正為調整後   
   UPDATE astt252_detail SET sthgdocno = g_sthe_m.sthedocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   UPDATE astt252_detail SET sthg002 = g_sthe_m.sthe005 , sthg003 = g_sthe_m.sthe006
    WHERE sthg002 = (SELECT sthe005 FROM sthe_t WHERE stheent = g_enterprise AND sthedocno = g_sthedocno_t)
      AND sthg003 = (SELECT sthe006 FROM sthe_t WHERE stheent = g_enterprise AND sthedocno = g_sthedocno_t)
   #end add-point    
  
   #將資料塞回原table   
   INSERT INTO sthg_t SELECT * FROM astt252_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt252_detail
   
   LET g_data_owner = g_sthe_m.stheownid      
   LET g_data_dept  = g_sthe_m.stheowndp
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   SELECT *
     FROM sthh_t 
    WHERE sthhent = g_enterprise
      AND sthhdocno = g_sthedocno_t
     INTO TEMP astt252_detail
 
   #將key修正為調整後   
   UPDATE astt252_detail SET sthhdocno = g_sthe_m.sthedocno

   #將資料塞回原table   
   INSERT INTO sthh_t SELECT * FROM astt252_detail
   DROP TABLE astt252_detail
   #end add-point
 
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sthedocno_t = g_sthe_m.sthedocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt252_delete()
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
   
   IF g_sthe_m.sthedocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   LET g_master_multi_table_t.stheldocno = g_sthe_m.sthedocno
LET g_master_multi_table_t.sthel002 = g_sthe_m.sthel002
 
   
   CALL s_transaction_begin()
 
   OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt252_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt252_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt252_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sthe_m_mask_o.* =  g_sthe_m.*
   CALL astt252_sthe_t_mask()
   LET g_sthe_m_mask_n.* =  g_sthe_m.*
   
   CALL astt252_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt252_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sthedocno_t = g_sthe_m.sthedocno
 
 
      DELETE FROM sthe_t
       WHERE stheent = g_enterprise AND sthedocno = g_sthe_m.sthedocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sthe_m.sthedocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_sthe_m.sthedocno,g_sthe_m.sthedocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      DELETE FROM sthel_t
       WHERE sthelent = g_enterprise AND stheldocno = g_sthe_m.sthedocno
       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del sthel_t'
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF   
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM sthf_t
       WHERE sthfent = g_enterprise AND sthfdocno = g_sthe_m.sthedocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
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
      DELETE FROM sthg_t
       WHERE sthgent = g_enterprise AND
             sthgdocno = g_sthe_m.sthedocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      DELETE FROM sthh_t
       WHERE sthhent = g_enterprise
         AND sthhdocno = g_sthe_m.sthedocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF      
      #end add-point
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sthe_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt252_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sthf_d.clear() 
      CALL g_sthf2_d.clear()       
 
     
      CALL astt252_ui_browser_refresh()  
      #CALL astt252_ui_headershow()  
      #CALL astt252_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      INITIALIZE l_var_keys_bak TO NULL 
   INITIALIZE l_field_keys   TO NULL 
   LET l_var_keys_bak[01] = g_enterprise
   LET l_field_keys[01] = 'sthelent'
   LET l_var_keys_bak[02] = g_master_multi_table_t.stheldocno
   LET l_field_keys[02] = 'stheldocno'
   CALL cl_multitable_delete(l_field_keys,l_var_keys_bak,'sthel_t')
 
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt252_browser_fill("")
         CALL astt252_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt252_cl
 
   #功能已完成,通報訊息中心
   CALL astt252_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt252.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt252_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sthf_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt252_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sthfseq,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007,sthf008, 
             sthf009,sthf010,sthf011,sthfsite,sthfunit,sthf001 ,t1.mhaal003 ,t2.mhabl004 ,t3.mhacl005 , 
             t4.rtaxl003 ,t5.oocql004 ,t6.mhbel003 FROM sthf_t",   
                     " INNER JOIN sthe_t ON stheent = " ||g_enterprise|| " AND sthedocno = sthfdocno ",
 
                     #"",
                     " LEFT JOIN sthg_t ON sthfent = sthgent AND sthfdocno = sthgdocno AND sthfseq = sthgseq ",
                     "",
                     #下層單身所需的join條件
                     " ",
 
 
                                    " LEFT JOIN mhaal_t t1 ON t1.mhaalent="||g_enterprise||" AND t1.mhaal001=sthf002 AND t1.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t2 ON t2.mhablent="||g_enterprise||" AND t2.mhabl001=sthf002 AND t2.mhabl002=sthf003 AND t2.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN mhacl_t t3 ON t3.mhaclent="||g_enterprise||" AND t3.mhacl001=sthf002 AND t3.mhacl002=sthf003 AND t3.mhacl003=sthf004 AND t3.mhacl004='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=sthf005 AND t4.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2144' AND t5.oocql002=sthf006 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t6 ON t6.mhbelent="||g_enterprise||" AND t6.mhbel001=sthf007 AND t6.mhbel002='"||g_dlang||"' ",
 
                     " WHERE sthfent=? AND sthfdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         LET g_sql = "SELECT  DISTINCT sthfseq,sthf002,sthf003,sthf004,sthf005, ",
                     "                 sthf006,sthf007,sthf008,sthf009,sthf010, ",
                     "                 sthf011,sthfsite,sthfunit,sthf001,t1.mhaal003 , ",
                     "                 t2.mhabl004 ,t3.mhacl005 ,t4.rtaxl003 ,t5.oocql004 , t6.mhbel003 ",
                     "  FROM sthf_t",   
                     "       LEFT JOIN sthg_t ON sthfent = sthgent AND sthfdocno = sthgdocno AND sthfseq = sthgseq ",
                     "       LEFT JOIN sthh_t ON sthhent = sthgent AND sthhdocno = sthgdocno AND sthhseq = sthgseq AND sthhseq1 = sthgseq1 ",
                     "       LEFT JOIN mhaal_t t1 ON t1.mhaalent='"||g_enterprise||"' AND t1.mhaal001=sthf002 AND t1.mhaal002='"||g_dlang||"' ",
                     "       LEFT JOIN mhabl_t t2 ON t2.mhablent='"||g_enterprise||"' AND t2.mhabl001=sthf002 AND t2.mhabl002=sthf003 AND t2.mhabl003='"||g_dlang||"' ",
                     "       LEFT JOIN mhacl_t t3 ON t3.mhaclent='"||g_enterprise||"' AND t3.mhacl001=sthf002 AND t3.mhacl002=sthf003 AND t3.mhacl003=sthf004 AND t3.mhacl004='"||g_dlang||"' ",
                     "       LEFT JOIN rtaxl_t t4 ON t4.rtaxlent='"||g_enterprise||"' AND t4.rtaxl001=sthf005 AND t4.rtaxl002='"||g_dlang||"' ",
                     "       LEFT JOIN oocql_t t5 ON t5.oocqlent='"||g_enterprise||"' AND t5.oocql001='2144' AND t5.oocql002=sthf006 AND t5.oocql003='"||g_dlang||"' ",
                     "       LEFT JOIN mhbel_t t6 ON t6.mhbelent='"||g_enterprise||"' AND t6.mhbel001=sthf007 AND t6.mhbel002='"||g_dlang||"' ",
 
                     " WHERE sthfent=? AND sthfdocno=?"
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
 
         
         LET g_sql = g_sql, " ORDER BY sthf_t.sthfseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt252_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt252_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sthe_m.sthedocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sthe_m.sthedocno INTO g_sthf_d[l_ac].sthfseq,g_sthf_d[l_ac].sthf002, 
          g_sthf_d[l_ac].sthf003,g_sthf_d[l_ac].sthf004,g_sthf_d[l_ac].sthf005,g_sthf_d[l_ac].sthf006, 
          g_sthf_d[l_ac].sthf007,g_sthf_d[l_ac].sthf008,g_sthf_d[l_ac].sthf009,g_sthf_d[l_ac].sthf010, 
          g_sthf_d[l_ac].sthf011,g_sthf_d[l_ac].sthfsite,g_sthf_d[l_ac].sthfunit,g_sthf_d[l_ac].sthf001, 
          g_sthf_d[l_ac].sthf002_desc,g_sthf_d[l_ac].sthf003_desc,g_sthf_d[l_ac].sthf004_desc,g_sthf_d[l_ac].sthf005_desc, 
          g_sthf_d[l_ac].sthf006_desc,g_sthf_d[l_ac].sthf007_desc   #(ver:78)
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
   
   CALL g_sthf_d.deleteElement(g_sthf_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt252_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sthf_d.getLength()
      LET g_sthf_d_mask_o[l_ac].* =  g_sthf_d[l_ac].*
      CALL astt252_sthf_t_mask()
      LET g_sthf_d_mask_n[l_ac].* =  g_sthf_d[l_ac].*
   END FOR
   
   LET g_sthf2_d_mask_o.* =  g_sthf2_d.*
   FOR l_ac = 1 TO g_sthf2_d.getLength()
      LET g_sthf2_d_mask_o[l_ac].* =  g_sthf2_d[l_ac].*
      CALL astt252_sthg_t_mask()
      LET g_sthf2_d_mask_n[l_ac].* =  g_sthf2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt252_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM sthf_t
       WHERE sthfent = g_enterprise AND
         sthfdocno = ps_keys_bak[1] AND sthfseq = ps_keys_bak[2]
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
         CALL g_sthf_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table2
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM sthg_t
       WHERE sthgent = g_enterprise AND
             sthgdocno = ps_keys_bak[1] AND sthgseq = ps_keys_bak[2] AND sthgseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
    
      LET li_idx = g_detail_idx2
      IF ps_page <> "'2'" THEN 
         CALL g_sthf2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
   #add-point:delete_b段other name="delete_b.other"
   LET ls_group = "'3',"
   #判斷是否是同一群組的table3
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      DELETE FROM sthh_t
       WHERE sthhent = g_enterprise
         AND sthhdocno = ps_keys_bak[1]
         AND sthlseq = ps_keys_bak[2]
         AND sthlseq1 = ps_keys_bak[3]
         AND sthlseq2 = ps_keys_bak[4]
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
    
      LET li_idx = g_detail_idx3
      IF ps_page <> "'3'" THEN 
         CALL g_sthf3_d.deleteElement(li_idx) 
      END IF
   END IF
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt252_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO sthf_t
                  (sthfent,
                   sthfdocno,
                   sthfseq
                   ,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007,sthf008,sthf009,sthf010,sthf011,sthfsite,sthfunit,sthf001) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sthf_d[g_detail_idx].sthf002,g_sthf_d[g_detail_idx].sthf003,g_sthf_d[g_detail_idx].sthf004, 
                       g_sthf_d[g_detail_idx].sthf005,g_sthf_d[g_detail_idx].sthf006,g_sthf_d[g_detail_idx].sthf007, 
                       g_sthf_d[g_detail_idx].sthf008,g_sthf_d[g_detail_idx].sthf009,g_sthf_d[g_detail_idx].sthf010, 
                       g_sthf_d[g_detail_idx].sthf011,g_sthf_d[g_detail_idx].sthfsite,g_sthf_d[g_detail_idx].sthfunit, 
                       g_sthf_d[g_detail_idx].sthf001)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sthf_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO sthg_t
                  (sthgent,
                   sthgdocno,sthgseq,
                   sthgseq1
                   ,sthg001,sthg002,sthg003,sthg004,sthg005,sthg006,sthg007,sthg008,sthg009,sthg010,sthgsite,sthgunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sthf2_d[g_detail_idx2].sthg001,g_sthf2_d[g_detail_idx2].sthg002,g_sthf2_d[g_detail_idx2].sthg003, 
                       g_sthf2_d[g_detail_idx2].sthg004,g_sthf2_d[g_detail_idx2].sthg005,g_sthf2_d[g_detail_idx2].sthg006, 
                       g_sthf2_d[g_detail_idx2].sthg007,g_sthf2_d[g_detail_idx2].sthg008,g_sthf2_d[g_detail_idx2].sthg009, 
                       g_sthf2_d[g_detail_idx2].sthg010,g_sthf2_d[g_detail_idx2].sthgsite,g_sthf2_d[g_detail_idx2].sthgunit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx2
      IF ps_page <> "'2'" THEN 
         CALL g_sthf2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
   #add-point:insert_b段other name="insert_b.other"
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      INSERT INTO sthh_t(sthhent,  sthhdocno,  sthhseq, sthhseq1, sthhseq2, 
                         sthh001,  sthh002,  sthh003, sthh004,  sthh005,
                         sthhsite, sthhunit)
         VALUES(g_enterprise, ps_keys[1], ps_keys[2], ps_keys[3], ps_keys[4],
                g_sthf3_d[g_detail_idx3].sthh001, g_sthf3_d[g_detail_idx3].sthh002, g_sthf3_d[g_detail_idx3].sthh003,  
                g_sthf3_d[g_detail_idx3].sthh004, g_sthf3_d[g_detail_idx3].sthh005, 
                g_sthf3_d[g_detail_idx3].sthhsite, g_sthf3_d[g_detail_idx3].sthhunit)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx3
      IF ps_page <> "'3'" THEN 
         CALL g_sthf3_d.insertElement(li_idx) 
      END IF
   END IF
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt252_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthf_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt252_sthf_t_mask_restore('restore_mask_o')
               
      UPDATE sthf_t 
         SET (sthfdocno,
              sthfseq
              ,sthf002,sthf003,sthf004,sthf005,sthf006,sthf007,sthf008,sthf009,sthf010,sthf011,sthfsite,sthfunit,sthf001) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sthf_d[g_detail_idx].sthf002,g_sthf_d[g_detail_idx].sthf003,g_sthf_d[g_detail_idx].sthf004, 
                  g_sthf_d[g_detail_idx].sthf005,g_sthf_d[g_detail_idx].sthf006,g_sthf_d[g_detail_idx].sthf007, 
                  g_sthf_d[g_detail_idx].sthf008,g_sthf_d[g_detail_idx].sthf009,g_sthf_d[g_detail_idx].sthf010, 
                  g_sthf_d[g_detail_idx].sthf011,g_sthf_d[g_detail_idx].sthfsite,g_sthf_d[g_detail_idx].sthfunit, 
                  g_sthf_d[g_detail_idx].sthf001) 
         WHERE sthfent = g_enterprise AND sthfdocno = ps_keys_bak[1] AND sthfseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthf_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthf_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt252_sthf_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthg_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point
      
      #將遮罩欄位還原
      CALL astt252_sthg_t_mask_restore('restore_mask_o')
               
      UPDATE sthg_t 
         SET (sthgdocno,sthgseq,
              sthgseq1
              ,sthg001,sthg002,sthg003,sthg004,sthg005,sthg006,sthg007,sthg008,sthg009,sthg010,sthgsite,sthgunit) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sthf2_d[g_detail_idx2].sthg001,g_sthf2_d[g_detail_idx2].sthg002,g_sthf2_d[g_detail_idx2].sthg003, 
                  g_sthf2_d[g_detail_idx2].sthg004,g_sthf2_d[g_detail_idx2].sthg005,g_sthf2_d[g_detail_idx2].sthg006, 
                  g_sthf2_d[g_detail_idx2].sthg007,g_sthf2_d[g_detail_idx2].sthg008,g_sthf2_d[g_detail_idx2].sthg009, 
                  g_sthf2_d[g_detail_idx2].sthg010,g_sthf2_d[g_detail_idx2].sthgsite,g_sthf2_d[g_detail_idx2].sthgunit)  
 
         WHERE sthgent = g_enterprise AND sthgdocno = ps_keys_bak[1] AND sthgseq = ps_keys_bak[2] AND sthgseq1 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthg_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt252_sthg_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update2"
      LET ls_group = "'3',"
      #判斷是否是同一群組的table
      IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sthh_t" THEN
         #將遮罩欄位還原
         #CALL astt252_sthh_t_mask_restore('restore_mask_o')
         
         UPDATE sthh_t 
            SET (sthhdocno,  sthhseq, sthhseq1, sthhseq2,
                 sthh001, sthh002,  sthh003, sthh004,  sthh005,
                 sthhsite, sthhunit)
              = (ps_keys[1], ps_keys[2], ps_keys[3], ps_keys[4],
                 g_sthf3_d[g_detail_idx3].sthh001, g_sthf3_d[g_detail_idx3].sthh002, g_sthf3_d[g_detail_idx3].sthh003,  
                 g_sthf3_d[g_detail_idx3].sthh004, g_sthf3_d[g_detail_idx3].sthh005, g_sthf3_d[g_detail_idx3].sthhsite, 
                 g_sthf3_d[g_detail_idx3].sthhunit) 
           WHERE sthhent = g_enterprise
             AND sthhdocno = ps_keys_bak[1]
             AND sthhseq = ps_keys_bak[2]
             AND sthhseq1 = ps_keys_bak[3]
             AND sthhseq2 = ps_keys_bak[4]
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthh_t" 
               LET g_errparam.code   = "std-00009" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sthh_t:",SQLERRMESSAGE 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               CALL s_transaction_end('N','0')
            OTHERWISE
         END CASE
         
         #將遮罩欄位進行遮蔽
         #CALL astt252_sthh_t_mask_restore('restore_mask_n')
                  
      END IF
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt252_key_update_b(ps_keys_bak,ps_table)
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
   IF ps_table = 'sthf_t' THEN
      #add-point:update_b段修改前 name="key_update_b.before_update2"
      
      #end add-point
      
      UPDATE sthg_t 
         SET (sthgdocno,sthgseq) 
              = 
             (g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq) 
         WHERE sthgent = g_enterprise AND
               sthgdocno = ps_keys_bak[1] AND sthgseq = ps_keys_bak[2]
 
      #add-point:update_b段修改中 name="key_update_b.m_update2"
      
      #end add-point
              
      CASE
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
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
 
{<section id="astt252.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt252_key_delete_b(ps_keys_bak,ps_table)
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
   IF ps_table = 'sthf_t' THEN
      #add-point:delete_b段修改前 name="key_delete_b.before_delete2"
      
      #end add-point
      
      DELETE FROM sthg_t 
            WHERE sthgent = g_enterprise AND
                  sthgdocno = ps_keys_bak[1] AND sthgseq = ps_keys_bak[2]
 
      #add-point:delete_b段修改中 name="key_delete_b.m_delete2"
      
      #end add-point
              
      CASE
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sthg_t:",SQLERRMESSAGE 
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
 
{<section id="astt252.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt252_lock_b(ps_table,ps_page)
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
   #CALL astt252_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sthf_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt252_bcl USING g_enterprise,
                                       g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
 
   
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "sthg_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt252_bcl2 USING g_enterprise,
                                             g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq,
                                             g_sthf2_d[g_detail_idx2].sthgseq1
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_bcl2:",SQLERRMESSAGE 
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
   LET ls_group = "sthh_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt252_bcl3
         USING g_enterprise, g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq,
               g_sthf2_d[g_detail_idx2].sthgseq1,g_sthf3_d[g_detail_idx3].sthhseq2
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_bcl3:",SQLERRMESSAGE 
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
 
{<section id="astt252.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt252_unlock_b(ps_table,ps_page)
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
      CLOSE astt252_bcl
   END IF
   
 
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt252_bcl2
   END IF
 
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt252_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sthedocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sthedocno",TRUE)
      CALL cl_set_comp_entry("sthedocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("sthesite",TRUE)   
   CALL cl_set_comp_entry("sthe004",TRUE)   #160516-00023#1 20160518 add by beckxie
   CALL cl_set_comp_entry("sthe002",TRUE)   #160604-00009#25 20160620 add by beckxie
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt252_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_cnt   LIKE type_t.num5   #160604-00009#25 20160620 add by beckxie
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sthedocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sthedocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sthedocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'sthesite') OR g_site_flag THEN
      CALL cl_set_comp_entry("sthesite",FALSE)
   END IF
   #160516-00023#1 20160518 add by beckxie---S
   IF g_sthe_m.sthe000 = 'U' AND NOT cl_null(g_sthe_m.sthe004) THEN 
      CALL cl_set_comp_entry("sthe004",FALSE)
   END IF
   #160516-00023#1 20160518 add by beckxie---E
   #160604-00009#25 20160620 add by beckxie---S
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM sthf_t
    WHERE sthfent = g_enterprise
      AND sthfdocno = g_sthe_m.sthedocno
   IF l_cnt > 0 THEN
      CALL cl_set_comp_entry("sthe002,sthe004",FALSE)
   END IF
   IF g_reproduce_flag='Y' THEN
      CALL cl_set_comp_entry("sthe004",FALSE)
   END IF
   #160604-00009#25 20160620 add by beckxie---E
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt252_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("sthg006,sthg007,sthg008,sthg009,sthh004,sthh005",TRUE) 
   #160512-00003#17 20160526 add by beckxie---S
   CALL cl_set_comp_entry("sthg005",TRUE) 
   #160512-00003#17 20160526 add by beckxie---E   
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt252_set_no_entry_b(p_cmd)
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
   IF g_sthf_d.getLength() > 0 THEN   
      IF g_sthf_d[g_detail_idx].sthf010 = '1' THEN
         CALL cl_set_comp_entry("sthg007",FALSE)
      END IF
      #20160419 add by beckxie---S
      #如果计算类型是1/3时，不可以录入比例，只有计算类型=2变动的时候才可以录入比例的栏位
      #保底也只有计算类型是2.变动才可以选保底，否则默认都是1，不可维护
      IF cl_null(g_sthf_d[g_detail_idx].sthf010) OR g_sthf_d[g_detail_idx].sthf010 != '2' THEN
         CALL cl_set_comp_entry("sthg006,sthg007",FALSE) 
      END IF
      #20160419 add by beckxie---E
      #IF g_sthf_d[g_detail_idx].sthf011 = '5' THEN #mark by geza 20160718 160604-00009#138
      IF g_sthf_d[g_detail_idx].sthf011 = '5' OR g_sthf_d[g_detail_idx].sthf011 = '6' THEN #add by geza 20160718 160604-00009#138
         CALL cl_set_comp_entry("sthg005",FALSE)
         CALL cl_set_comp_entry("sthh004",FALSE)
      END IF
   END IF
   IF g_sthf2_d.getLength() > 0 THEN   
      IF g_sthf2_d[g_detail_idx2].sthg007 = '1' THEN
         CALL cl_set_comp_entry("sthg008,sthg009",FALSE)
      END IF
      IF g_sthf2_d[g_detail_idx2].sthg007 = '3' THEN
         CALL cl_set_comp_entry("sthg009",FALSE)
      END IF
      IF cl_null(g_sthf2_d[g_detail_idx2].sthg006)  THEN
         CALL cl_set_comp_entry("sthh005",FALSE)
      END IF
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt252_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt252_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:2)
   IF g_sthe_m.sthestus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF



   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt252_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt252.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt252_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt252.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt252_default_search()
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
      LET ls_wc = ls_wc, " sthedocno = '", g_argv[02], "' AND "
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
               WHEN la_wc[li_idx].tableid = "sthe_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sthf_t" 
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
 
{<section id="astt252.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt252_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   #作廢或確認後,不得修改狀態
   IF g_sthe_m.sthestus = 'X' OR g_sthe_m.sthestus = 'Y' THEN
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sthe_m.sthedocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt252_cl USING g_enterprise,g_sthe_m.sthedocno
   IF STATUS THEN
      CLOSE astt252_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt252_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
       g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
       g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
       g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
       g_sthe_m.sthecnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt252_action_chk() THEN
      CLOSE astt252_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthesite_desc,g_sthe_m.sthedocdt,g_sthe_m.sthedocno,g_sthe_m.sthe000, 
       g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe004_desc,g_sthe_m.sthe005, 
       g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe008_desc,g_sthe_m.sthe009,g_sthe_m.sthe009_desc, 
       g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheownid_desc, 
       g_sthe_m.stheowndp,g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp, 
       g_sthe_m.sthecrtdp_desc,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemodid_desc,g_sthe_m.sthemoddt, 
       g_sthe_m.sthecnfid,g_sthe_m.sthecnfid_desc,g_sthe_m.sthecnfdt
 
   CASE g_sthe_m.sthestus
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
         CASE g_sthe_m.sthestus
            
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
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      #提交和抽單一開始先無條件關
      CALL cl_set_act_visible("signing,withdraw,released",FALSE)

      CASE g_sthe_m.sthestus
         WHEN "N"
            CALL cl_set_act_visible("unconfirmed",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF

         WHEN "X"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)

         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)

         #已核准只能顯示確認;其餘應用功能皆隱藏
         WHEN "A"
            CALL cl_set_act_visible("confirmed ",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid",FALSE)

        #保留修改的功能(如作廢)，隱藏其他應用功能
         WHEN "R"
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)

         WHEN "D"
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)

         #送簽中只能顯示抽單;其餘應用功能皆隱藏
         WHEN "W"
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)

      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt252_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt252_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt252_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt252_cl
            RETURN
         END IF
 
 
 
	  
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
      g_sthe_m.sthestus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt252_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL cl_err_collect_init()
   LET l_success = TRUE
   IF lc_state = 'Y' THEN
      CALL s_astt252_conf_chk(g_sthe_m.sthedocno) RETURNING l_success
      IF l_success THEN
            IF cl_ask_confirm('ast-00594') THEN
               CALL s_transaction_begin()
               CALL s_astt252_conf_upd(g_sthe_m.sthedocno) RETURNING l_success
               IF NOT l_success THEN 
                  CALL s_transaction_end('N','0')
                  CALL cl_err_collect_show()
                  RETURN
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
      ELSE
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
         RETURN
      END IF
   END IF
   IF lc_state = 'X' THEN
      CALL s_astt252_invalid_chk(g_sthe_m.sthedocno) RETURNING l_success
      IF l_success THEN
            IF cl_ask_confirm('aim-00109') THEN
               CALL s_transaction_begin()
               CALL s_astt252_invalid_upd(g_sthe_m.sthedocno) RETURNING l_success
               IF NOT l_success THEN 
                  CALL s_transaction_end('N','0')
                  CALL cl_err_collect_show()
                  RETURN
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
      ELSE
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
         RETURN
      END IF
   END IF
   #end add-point
   
   LET g_sthe_m.sthemodid = g_user
   LET g_sthe_m.sthemoddt = cl_get_current()
   LET g_sthe_m.sthestus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sthe_t 
      SET (sthestus,sthemodid,sthemoddt) 
        = (g_sthe_m.sthestus,g_sthe_m.sthemodid,g_sthe_m.sthemoddt)     
    WHERE stheent = g_enterprise AND sthedocno = g_sthe_m.sthedocno
 
    
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
      EXECUTE astt252_master_referesh USING g_sthe_m.sthedocno INTO g_sthe_m.sthesite,g_sthe_m.sthedocdt, 
          g_sthe_m.sthedocno,g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005, 
          g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009,g_sthe_m.sthe001,g_sthe_m.stheunit, 
          g_sthe_m.sthestus,g_sthe_m.stheownid,g_sthe_m.stheowndp,g_sthe_m.sthecrtid,g_sthe_m.sthecrtdp, 
          g_sthe_m.sthecrtdt,g_sthe_m.sthemodid,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfdt, 
          g_sthe_m.sthesite_desc,g_sthe_m.sthe004_desc,g_sthe_m.sthe008_desc,g_sthe_m.sthe009_desc,g_sthe_m.stheownid_desc, 
          g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthemodid_desc, 
          g_sthe_m.sthecnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sthe_m.sthesite,g_sthe_m.sthesite_desc,g_sthe_m.sthedocdt,g_sthe_m.sthedocno, 
          g_sthe_m.sthe000,g_sthe_m.sthe002,g_sthe_m.sthe003,g_sthe_m.sthel002,g_sthe_m.sthe004,g_sthe_m.sthe004_desc, 
          g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe008_desc, 
          g_sthe_m.sthe009,g_sthe_m.sthe009_desc,g_sthe_m.sthe001,g_sthe_m.stheunit,g_sthe_m.sthestus, 
          g_sthe_m.stheownid,g_sthe_m.stheownid_desc,g_sthe_m.stheowndp,g_sthe_m.stheowndp_desc,g_sthe_m.sthecrtid, 
          g_sthe_m.sthecrtid_desc,g_sthe_m.sthecrtdp,g_sthe_m.sthecrtdp_desc,g_sthe_m.sthecrtdt,g_sthe_m.sthemodid, 
          g_sthe_m.sthemodid_desc,g_sthe_m.sthemoddt,g_sthe_m.sthecnfid,g_sthe_m.sthecnfid_desc,g_sthe_m.sthecnfdt 
 
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt252_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt252_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt252.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt252_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sthf_d.getLength() THEN
         LET g_detail_idx = g_sthf_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sthf_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sthf_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx2 = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx2 > g_sthf2_d.getLength() THEN
         LET g_detail_idx2 = g_sthf2_d.getLength()
      END IF
      IF g_detail_idx2 = 0 AND g_sthf2_d.getLength() <> 0 THEN
         LET g_detail_idx2 = 1
      END IF
      DISPLAY g_detail_idx2 TO FORMONLY.idx
      DISPLAY g_sthf2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt252_b_fill2(pi_idx)
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
   
   IF astt252_fill_chk(2) THEN
      IF (pi_idx = 2 OR pi_idx = 0 ) AND g_sthf_d.getLength() > 0 THEN
               CALL g_sthf2_d.clear()
 
         
         #取得該單身上階單身的idx
         LET g_detail_idx = g_detail_idx_list[1]
         
         LET g_sql = "SELECT  DISTINCT sthgseq1,sthg001,sthg002,sthg003,sthg004,sthg005,sthg006,sthg007, 
             sthg008,sthg009,sthg010,sthgsite,sthgunit  FROM sthg_t",    
                     "",
                     
                     " WHERE sthgent=? AND sthgdocno=? AND sthgseq=?"
         
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  sthg_t.sthgseq1" 
                            
         #add-point:單身填充前 name="b_fill2.before_fill2"
         
         #end add-point
         
         #先清空資料
               CALL g_sthf2_d.clear()
 
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt252_pb2 FROM g_sql
         DECLARE b_fill_curs2 CURSOR FOR astt252_pb2
         
      #  OPEN b_fill_curs2 USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq   #(ver:78) 
 
         LET l_ac = 1
         FOREACH b_fill_curs2 USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq INTO g_sthf2_d[l_ac].sthgseq1, 
             g_sthf2_d[l_ac].sthg001,g_sthf2_d[l_ac].sthg002,g_sthf2_d[l_ac].sthg003,g_sthf2_d[l_ac].sthg004, 
             g_sthf2_d[l_ac].sthg005,g_sthf2_d[l_ac].sthg006,g_sthf2_d[l_ac].sthg007,g_sthf2_d[l_ac].sthg008, 
             g_sthf2_d[l_ac].sthg009,g_sthf2_d[l_ac].sthg010,g_sthf2_d[l_ac].sthgsite,g_sthf2_d[l_ac].sthgunit  
               #(ver:78)
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
               CALL g_sthf2_d.deleteElement(g_sthf2_d.getLength())
 
      END IF
   END IF
 
 
      
   LET g_sthf2_d_mask_o.* =  g_sthf2_d.*
   FOR l_ac = 1 TO g_sthf2_d.getLength()
      LET g_sthf2_d_mask_o[l_ac].* =  g_sthf2_d[l_ac].*
      CALL astt252_sthg_t_mask()
      LET g_sthf2_d_mask_n[l_ac].* =  g_sthf2_d[l_ac].*
   END FOR
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astt252_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt252_fill_chk(ps_idx)
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
 
{<section id="astt252.status_show" >}
PRIVATE FUNCTION astt252_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt252.mask_functions" >}
&include "erp/ast/astt252_mask.4gl"
 
{</section>}
 
{<section id="astt252.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt252_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt252_show()
   CALL astt252_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sthe_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_sthf_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_sthf2_d))
 
 
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
   #CALL astt252_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt252_ui_headershow()
   CALL astt252_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt252_draw_out()
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
   CALL astt252_ui_headershow()  
   CALL astt252_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt252.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt252_set_pk_array()
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
   LET g_pk_array[1].values = g_sthe_m.sthedocno
   LET g_pk_array[1].column = 'sthedocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt252.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt252.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt252_msgcentre_notify(lc_state)
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
   CALL astt252_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sthe_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt252.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt252_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT sthestus  INTO g_sthe_m.sthestus
     FROM sthe_t
    WHERE stheent = g_enterprise
      AND sthedocno = g_sthe_m.sthedocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_sthe_m.sthestus
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
        LET g_errparam.extend = g_sthe_m.sthedocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt252_set_act_visible()
        CALL astt252_set_act_no_visible()
        CALL astt252_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt252.other_function" readonly="Y" >}

PRIVATE FUNCTION astt252_set_comp_visible()
   CALL cl_set_comp_visible('sthf007,sthf007_desc,page_4',TRUE)
   CALL cl_set_comp_visible('sthf002,sthf002_desc',TRUE)
   CALL cl_set_comp_visible('sthf003,sthf003_desc',TRUE)
   CALL cl_set_comp_visible('sthf004,sthf004_desc',TRUE)
   CALL cl_set_comp_visible('sthf005,sthf005_desc',TRUE)
   CALL cl_set_comp_visible('sthf006,sthf006_desc',TRUE)  
   CALL cl_set_comp_visible('sthg005,sthg006,sthh005,sthh004',TRUE)  
   #CALL cl_set_comp_visible('stgh010',TRUE) #mark by geza 20160718 160604-00009#138
   CALL cl_set_comp_visible('sthg010',TRUE) #add by geza 20160718 160604-00009#138
END FUNCTION
################################################################################
# Descriptions...: 欄位隱藏
# Memo...........:
# Usage..........: CALL astt252_set_comp_no_visible()
# Input parameter: 
# Return code....: 無
# Date & Author..: 20160330 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_set_comp_no_visible()
   DEFINE p_type LIKE type_t.chr1
   
   IF g_argv[1] = '1' THEN
      CALL cl_set_comp_visible('sthf007,sthf007_desc',FALSE)
   END IF
   
   
   IF g_sthc002 = 'N' THEN
      CALL cl_set_comp_visible('sthf002,sthf002_desc',FALSE)
   END IF
   IF g_sthc003 = 'N' THEN
      CALL cl_set_comp_visible('sthf003,sthf003_desc',FALSE)
   END IF
   IF g_sthc004 = 'N' THEN
      CALL cl_set_comp_visible('sthf004,sthf004_desc',FALSE)
   END IF
   IF g_sthc005 = 'N' THEN
      CALL cl_set_comp_visible('sthf005,sthf005_desc',FALSE)
   END IF
   IF g_sthc006 = 'N' THEN
      CALL cl_set_comp_visible('sthf006,sthf006_desc',FALSE)
   END IF
      
   IF g_sthf_d.getLength() > 0 AND g_detail_idx != 0 THEN   
      #IF g_sthf_d[g_detail_idx].sthf011 = '5' THEN #mark by geza 20160718 160604-00009#138
      IF g_sthf_d[g_detail_idx].sthf011 = '5' OR g_sthf_d[g_detail_idx].sthf011 = '6'  THEN #add by geza 20160718 160604-00009#138
         #CALL cl_set_comp_visible('stgh005,sthh004',FALSE) #mark by geza 20160718 160604-00009#138
         CALL cl_set_comp_visible('sthg005,sthh004',FALSE) #add by geza 20160718 160604-00009#138
      END IF
      IF g_sthf_d[g_detail_idx].sthf011 = '1' OR 
         g_sthf_d[g_detail_idx].sthf011 = '2' OR 
         g_sthf_d[g_detail_idx].sthf011 = '3' OR 
         g_sthf_d[g_detail_idx].sthf011 = '4' THEN
         #CALL cl_set_comp_visible('stgh006,sthh005',FALSE) #mark by geza 20160718 160604-00009#138
         CALL cl_set_comp_visible('sthg006,sthh005',FALSE) #add by geza 20160718 160604-00009#138
      END IF
      #20160429 add by beckxie ---S
      IF g_sthf_d[g_detail_idx].sthf010 = '1' AND g_sthf_d[g_detail_idx].sthf011 = '4' THEN
         #CALL cl_set_comp_visible('stgh010',FALSE)    #mark by geza 20160718 160604-00009#138
         CALL cl_set_comp_visible('sthg010',FALSE)     #add by geza 20160718 160604-00009#138
      END IF
      #20160429 add by beckxie ---E
   END IF
   IF g_sthf2_d.getLength() > 0 AND g_detail_idx2 != 0 THEN   
      IF g_sthf2_d[g_detail_idx2].sthg010 = '1' THEN
         CALL cl_set_comp_visible('page_4',FALSE)
      END IF
   END IF
END FUNCTION

PRIVATE FUNCTION astt252_sthesite_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthe_m.sthesite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthe_m.sthesite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthe_m.sthesite_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthe004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthe_m.sthe004
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthe_m.sthe004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthe_m.sthe004_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthe008_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthe_m.sthe008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_sthe_m.sthe008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthe_m.sthe008_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthe009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthe_m.sthe009
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthe_m.sthe009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthe_m.sthe009_desc
END FUNCTION

PRIVATE FUNCTION astt252_b_fill3(pi_idx)
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   
   LET li_ac = l_ac 
   
   IF g_detail_idx2 <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx2
   
   IF astt252_fill_chk(3) THEN
      IF (pi_idx = 3 OR pi_idx = 0 ) AND g_sthf_d.getLength() > 0 AND g_sthf2_d.getLength() > 0 THEN
         
         LET g_detail_idx2 = g_detail_idx_list[2]
         
         LET g_sql = "SELECT  DISTINCT sthhseq2,sthh001,sthh002,sthh003,sthh004,",
                     "                 sthh005,sthhsite,sthhunit  ",
                     "  FROM sthh_t",    
                     " WHERE sthhent=? AND sthhdocno=? AND sthhseq=? AND sthhseq1=?"
         
         IF NOT cl_null(g_wc2_table3) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table3 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  sthh_t.sthhseq2" 
                            
         
         CALL g_sthf3_d.clear()
 
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt252_pb3 FROM g_sql
         DECLARE b_fill_curs3 CURSOR FOR astt252_pb3
         
         OPEN b_fill_curs3 USING g_enterprise,g_sthe_m.sthedocno,g_sthf_d[g_detail_idx].sthfseq,g_sthf2_d[g_detail_idx2].sthgseq1
         LET l_ac = 1
         FOREACH b_fill_curs3 INTO g_sthf3_d[l_ac].sthhseq2,g_sthf3_d[l_ac].sthh001,g_sthf3_d[l_ac].sthh002, 
             g_sthf3_d[l_ac].sthh003,g_sthf3_d[l_ac].sthh004,g_sthf3_d[l_ac].sthh005,
             g_sthf3_d[l_ac].sthhsite,g_sthf3_d[l_ac].sthhunit 
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
               CALL g_sthf3_d.deleteElement(g_sthf3_d.getLength())
 
      END IF
   END IF
 
      
   LET g_sthf3_d_mask_o.* =  g_sthf3_d.*
   FOR l_ac = 1 TO g_sthf3_d.getLength()
      LET g_sthf3_d_mask_o[l_ac].* =  g_sthf3_d[l_ac].*
      #CALL astt252_sthh_t_mask()
      LET g_sthf3_d_mask_n[l_ac].* =  g_sthf3_d[l_ac].*
   END FOR
 
    
   LET l_ac = li_ac
   
   CALL astt252_detail_show()
   
   LET g_detail_idx2 = li_detail_idx_tmp
END FUNCTION

################################################################################
# Descriptions...: 修改時帶出主檔相關資料
# Memo...........:
# Usage..........: CALL astt252_carry_sthe()
# Date & Author..: 20160329 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_carry_sthe()
   DEFINE l_sthi001 LIKE sthi_t.sthi001
   
   LET l_sthi001 = g_argv[01]
   
   SELECT COALESCE(sthi003+1,2),sthi004,sthi005,sthi006,sthi007,sthi008,sthi009
     INTO g_sthe_m.sthe003,g_sthe_m.sthe004,g_sthe_m.sthe005,g_sthe_m.sthe006,g_sthe_m.sthe007,g_sthe_m.sthe008,g_sthe_m.sthe009
     FROM sthi_t
    WHERE sthient = g_enterprise AND sthi001 = l_sthi001 AND sthi002 = g_sthe_m.sthe002 AND sthistus = 'Y'
    
    LET g_sthe_m.sthe003 = g_sthe_m.sthe003 USING "<<<<<<<<<#" 
    
    SELECT sthil003 INTO g_sthe_m.sthel002
      FROM sthil_t
     WHERE sthilent = g_enterprise
       AND sthil001 = g_sthe_m.sthe002
       AND sthil002 = g_dlang
       
    CALL astt252_sthe004_ref()
    CALL astt252_sthe008_ref()
    CALL astt252_sthe009_ref()

END FUNCTION

################################################################################
# Descriptions...: 帶出主檔單身資料
# Memo...........:
# Usage..........: CALL astt252_carry_detail() RETURNING r_success
# Return code....: r_success TRUE/FALSE
# Date & Author..: 20160330 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_carry_detail()
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_cnt        LIKE type_t.num5
   DEFINE l_sthi001    LIKE sthj_t.sthj001
   DEFINE r_success    LIKE type_t.num5

   LET l_success = TRUE 
   LET r_success = TRUE 
   
   LET l_sthi001 = g_argv[1]
   
   LET l_cnt = 0
   SELECT COUNT(sthfseq) INTO l_cnt
     FROM sthf_t
    WHERE sthfent = g_enterprise
      AND sthfdocno = g_sthe_m.sthedocno
   #單身無資料才帶出主檔資料
   IF l_cnt = 0 THEN
      INSERT INTO sthf_t (sthfent,sthfsite,sthfunit,sthfdocno,sthfseq,
                          sthf001,sthf002,sthf003,sthf004,sthf005,
                          sthf006,sthf007,sthf008,sthf009,sthf010,
                          sthf011)
      SELECT sthjent,sthjsite,sthjunit,g_sthe_m.sthedocno,sthjseq,
             sthj001,sthj002,sthj003,sthj004,sthj005,
             sthj006,sthj007,sthj008,sthj009,sthj010,
             sthj011
        FROM sthi_t ,sthj_t
       WHERE sthient = sthjent AND sthi001 = l_sthi001 
         AND sthi002 = sthj001 
         AND sthjent = g_enterprise
         AND sthj001 = g_sthe_m.sthe002
         
       IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_carry_detail:sthf_t" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN r_success
      END IF
      
      #sthg_t
      LET l_cnt = 0
      SELECT COUNT(sthgseq1) INTO l_cnt
        FROM sthg_t
       WHERE sthgent = g_enterprise
         AND sthgdocno = g_sthe_m.sthedocno
      #有資料先刪再INSERT
      IF l_cnt > 0 THEN
         DELETE FROM sthg_t
          WHERE sthgent = g_enterprise
            AND sthgdocno = g_sthe_m.sthedocno
      END IF
      INSERT INTO sthg_t (sthgent,sthgsite,sthgunit,sthgdocno,sthgseq,
                          sthgseq1,sthg001,sthg002,sthg003,sthg004,
                          sthg005,sthg006,sthg007,sthg008,sthg009,
                          sthg010)
      SELECT sthkent,sthksite,sthkunit,g_sthe_m.sthedocno,sthkseq,
             sthkseq1,sthk001,sthk002,sthk003,sthk004,
             sthk005,sthk006,sthk007,sthk008,sthk009,
             sthk010
        FROM sthi_t ,sthk_t
       WHERE sthient = sthkent AND sthi001 = l_sthi001 
         AND sthi002 = sthk001 
         AND sthkent = g_enterprise
         AND sthk001 = g_sthe_m.sthe002
         
       IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_carry_detail:sthg_t" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN r_success
      END IF
      
      #sthh_t
      LET l_cnt = 0
      SELECT COUNT(sthhseq2) INTO l_cnt
        FROM sthh_t
       WHERE sthhent = g_enterprise
         AND sthhdocno = g_sthe_m.sthedocno
      #有資料先刪再INSERT
      IF l_cnt > 0 THEN
         DELETE FROM sthh_t
          WHERE sthhent = g_enterprise         #161223-00004#1 MOD  g_enterpise -> g_enterprise
            AND sthhdocno = g_sthe_m.sthedocno
      END IF
      INSERT INTO sthh_t (sthhent,sthhsite,sthhunit,sthhdocno,sthhseq,
                          sthhseq1,sthhseq2,sthh001,sthh002,sthh003,
                          sthh004,sthh005)
      SELECT sthlent,sthlsite,sthlunit,g_sthe_m.sthedocno,sthlseq,
             sthlseq1,sthlseq2,sthl001,sthl002,sthl003,
             sthl004,sthl005
        FROM sthi_t ,sthl_t
       WHERE sthient = sthlent AND sthi001 = l_sthi001 
         AND sthi002 = sthl001 
         AND sthlent = g_enterprise
         AND sthl001 = g_sthe_m.sthe002
         
       IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt252_carry_detail:sthh_t" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN r_success
      END IF
   END IF  
   
   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 依asti251帶出單身資料
# Memo...........:
# Usage..........: CALL astt252_carry_sthd()
# Date & Author..: 20160330 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_carry_sthd()
   DEFINE l_cnt        LIKE type_t.num5
   DEFINE l_sql        STRING
   
   
   LET l_sql = "INSERT INTO sthf_t (sthfent,sthfsite,sthfunit,sthfdocno,sthfseq, ",
               "                       sthf001,sthf002,sthf003,sthf004,sthf005, ",
               "                       sthf006,sthf008,sthf009,sthf010, ",
               "                       sthf011) ",
               "SELECT sthdent,sthdsite,sthdunit,'",g_sthe_m.sthedocno,"',sthd002, ",
               "       ",g_sthe_m.sthe002,",sthd003,sthd004,sthd005,sthd006, ",
               "       sthd007,sthd008,sthd009,sthd011,sthd010 ",
               "  FROM sthd_t ",
               " WHERE sthdent = ",g_enterprise," ",
               "   AND sthdsite = '",g_sthe_m.sthesite,"' ",
               "   AND sthd001 = '",g_sthe_m.sthe004,"' ",
               "   AND NOT EXISTS (SELECT 1 FROM sthf_t WHERE sthfent = sthdent ",
               "                                          AND sthfdocno = '",g_sthe_m.sthedocno,"' ",
               "                                          AND sthfseq=sthd002) "
    
    
    PREPARE astt252_carry_sthd_pre FROM l_sql
    EXECUTE astt252_carry_sthd_pre
      
    IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "astt252_carry_sthd:" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
END FUNCTION

################################################################################
# Descriptions...: 取sthc資訊
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
PRIVATE FUNCTION astt252_get_sthc()
   INITIALIZE g_sthc002,g_sthc003,g_sthc004,g_sthc005,g_sthc006 TO NULL
   SELECT sthc002,sthc003,sthc004,sthc005,sthc006
     INTO g_sthc002,g_sthc003,g_sthc004,g_sthc005,g_sthc006
     FROM sthc_t
    WHERE sthcent = g_enterprise
      AND sthcsite = g_sthe_m.sthesite 
      AND sthc001 = g_sthe_m.sthe004
END FUNCTION

################################################################################
# Descriptions...: 依asti251帶出sthf
# Memo...........:
# Usage..........: CALL astt252_carry_sthf()
# Date & Author..: 20160331 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_carry_sthf()
   DEFINE l_sql         STRING
   DEFINE l_sql_1       STRING
   DEFINE l_sql_2       STRING
   DEFINE l_sql_3       STRING
   DEFINE l_sql_4       STRING
   DEFINE l_sql_5       STRING
   DEFINE l_carry_flag  LIKE type_t.num5
   DEFINE l_carry_flag1 LIKE type_t.num5
   
   LET l_carry_flag  = FALSE
   LET l_carry_flag1 = TRUE
   
   IF g_sthc002 = 'Y' THEN
      IF NOT cl_null(g_sthf_d[l_ac].sthf002) THEN
         LET l_carry_flag = TRUE
         LET l_sql_1 =" AND sthd003 = '",g_sthf_d[l_ac].sthf002,"' "
      ELSE 
         LET l_carry_flag = FALSE
      END IF
   ELSE 
      LET l_carry_flag = TRUE
   END IF
   
   IF NOT l_carry_flag THEN
      LET l_carry_flag1 = FALSE
   END IF
   
   IF g_sthc003 = 'Y' THEN
      IF NOT cl_null(g_sthf_d[l_ac].sthf003) THEN
         LET l_carry_flag = TRUE
         LET l_sql_2 =" AND sthd004 = '",g_sthf_d[l_ac].sthf003,"' "
      ELSE 
         LET l_carry_flag = FALSE
      END IF
   ELSE 
      LET l_carry_flag = TRUE
   END IF
   
   IF NOT l_carry_flag THEN
      LET l_carry_flag1 = FALSE
   END IF
   IF g_sthc004 = 'Y' THEN
      IF NOT cl_null(g_sthf_d[l_ac].sthf004) THEN
         LET l_carry_flag = TRUE
         LET l_sql_3 =" AND sthd005 = '",g_sthf_d[l_ac].sthf004,"' "
      ELSE 
         LET l_carry_flag = FALSE
      END IF
   ELSE 
      LET l_carry_flag = TRUE
   END IF
   
   IF NOT l_carry_flag THEN
      LET l_carry_flag1 = FALSE
   END IF
   IF g_sthc005 = 'Y' THEN
      IF NOT cl_null(g_sthf_d[l_ac].sthf005) THEN
         LET l_carry_flag = TRUE
         LET l_sql_4 =" AND sthd006 = '",g_sthf_d[l_ac].sthf005,"' "
      ELSE 
         LET l_carry_flag = FALSE
      END IF
   ELSE 
      LET l_carry_flag = TRUE
   END IF
   
   IF NOT l_carry_flag THEN
      LET l_carry_flag1 = FALSE
   END IF
   IF g_sthc006 = 'Y' THEN
      IF NOT cl_null(g_sthf_d[l_ac].sthf006) THEN
         LET l_carry_flag = TRUE
         LET l_sql_5 =" AND sthd007 = '",g_sthf_d[l_ac].sthf006,"' "
      ELSE 
         LET l_carry_flag = FALSE
      END IF
   ELSE 
      LET l_carry_flag = TRUE
   END IF
   
   IF NOT l_carry_flag THEN
      LET l_carry_flag1 = FALSE
   END IF
   
   DISPLAY "l_carry_flag1:",l_carry_flag1
   IF l_carry_flag1 THEN
      LET l_sql = "SELECT sthd008,sthd009,sthd011,sthd010",
                  "  FROM sthc_t,sthd_t ",
                  " WHERE sthcent=sthdent AND sthcsite = sthdsite ",
                  "   AND sthcsite = '",g_sthe_m.sthesite,"' ",
                  "   AND sthc001 =sthd001 ",
                  "   AND sthcent = ",g_enterprise,
                  "   AND sthc001='",g_sthe_m.sthe004,"' "
      LET l_sql = l_sql,l_sql_1,l_sql_2,l_sql_3,l_sql_4,l_sql_5
      DISPLAY "l_sql :",l_sql
      PREPARE carry_sthf_pre FROM l_sql
      DECLARE carry_sthf_cs  SCROLL CURSOR FOR carry_sthf_pre
      OPEN carry_sthf_cs  
      #EXECUTE carry_sthf_pre INTO g_sthf_d[l_ac].sthf008,g_sthf_d[l_ac].sthf009,g_sthf_d[l_ac].sthf010,g_sthf_d[l_ac].sthf011
      FETCH FIRST carry_sthf_cs INTO g_sthf_d[l_ac].sthf008,g_sthf_d[l_ac].sthf009,g_sthf_d[l_ac].sthf010,g_sthf_d[l_ac].sthf011
      
      IF SQLCA.sqlcode AND SQLCA.sqlcode <> '100' THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "carry_sthf_pre:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
      END IF
      CLOSE carry_sthf_cs 
      DISPLAY g_sthf_d[l_ac].sthf008 TO sthf008 #add by geza 160604-00009#138
      DISPLAY g_sthf_d[l_ac].sthf009 TO sthf009 #add by geza 160604-00009#138
      DISPLAY g_sthf_d[l_ac].sthf010 TO sthf010 #add by geza 160604-00009#138
      DISPLAY g_sthf_d[l_ac].sthf011 TO sthf011 #add by geza 160604-00009#138
   END IF
END FUNCTION

################################################################################
# Descriptions...: 月份開窗
# Memo...........: 參考astt301_getstak026
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_get_sthg004()
DEFINE l_stak026_t   LIKE stak_t.stak026
DEFINE lwin_curr     ui.Window
DEFINE lfrm_curr     ui.Form
DEFINE ls_path       STRING
DEFINE l_flag        LIKE type_t.chr1
DEFINE l_stak026     LIKE stak_t.stak026
DEFINE l_str         STRING
DEFINE l_i           LIKE type_t.num10
DEFINE l_item        DYNAMIC ARRAY OF RECORD
            sel      LIKE type_t.chr1,
            b_month  LIKE type_t.num10   
                     END RECORD 

   WHENEVER ERROR CONTINUE
   
   LET l_stak026_t = g_sthf2_d[l_ac].sthg004
   #畫面開啟 (identifier)
   OPEN WINDOW w_astt301_s01 WITH FORM cl_ap_formpath("ast","astt301_s01")
 
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   LET lwin_curr = ui.Window.getCurrent()
   LET lfrm_curr = lwin_curr.getForm()
   LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
   LET ls_path = os.Path.join(ls_path,"toolbar_lib.4tb")
   CALL lfrm_curr.loadToolBar(ls_path)
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL l_item.clear()
   FOR l_i = 1 TO 12
      IF l_stak026_t[l_i,l_i] = '1' THEN 
         LET l_item[l_i].sel = 'Y'
      ELSE
         LET l_item[l_i].sel = 'N'
      END IF 
      LET l_item[l_i].b_month = l_i
   END FOR 
   LET l_flag = 'N'
   WHILE TRUE 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
         INPUT ARRAY l_item FROM s_detail1.*
               ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, 
                  INSERT ROW = TRUE, 
                  DELETE ROW = TRUE,
                  APPEND ROW = TRUE)
         BEFORE INPUT 
            LET g_rec_b = l_item.getLength()
            
         BEFORE INSERT 
            CANCEL INSERT 
            
         BEFORE DELETE
            CANCEL DELETE
            
         END INPUT 
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
         
         ON ACTION cancel
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         ON ACTION accept
            LET l_flag = 'Y'
            ACCEPT DIALOG
            
         #主選單用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
      IF g_action_choice = "exit" OR l_flag = 'Y' THEN
         EXIT WHILE
      END IF
    
   END WHILE
   CALL cl_set_act_visible("accept,cancel", TRUE)
   #畫面關閉
   CLOSE WINDOW w_astt301_s01 
   LET l_str = ''
   IF l_flag = 'Y' THEN 
      FOR l_i =1 TO 12
         IF l_item[l_i].sel = 'Y' THEN 
            IF cl_null(l_str) THEN 
               LET l_str = '1'
            ELSE
               LET l_str = l_str.trim(),'1'
            END IF 
         ELSE
            IF cl_null(l_str) THEN 
               LET l_str = '0'
            ELSE
               LET l_str = l_str.trim(),'0'
            END IF 
         END IF 
      END FOR 
      LET l_stak026 = l_str
      RETURN l_stak026
   ELSE
      RETURN l_stak026_t
   END IF 
END FUNCTION

PRIVATE FUNCTION astt252_sthf002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf002
   CALL ap_ref_array2(g_ref_fields,"SELECT mhaal003 FROM mhaal_t WHERE mhaalent='"||g_enterprise||"' AND mhaal001=? AND mhaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf002_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthf003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf002
   LET g_ref_fields[2] = g_sthf_d[l_ac].sthf003
   CALL ap_ref_array2(g_ref_fields,"SELECT mhabl004 FROM mhabl_t WHERE mhablent='"||g_enterprise||"' AND mhabl001=? AND mhabl002=? AND mhabl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf003_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthf004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf002
   LET g_ref_fields[2] = g_sthf_d[l_ac].sthf003
   LET g_ref_fields[3] = g_sthf_d[l_ac].sthf004
   CALL ap_ref_array2(g_ref_fields,"SELECT mhacl005 FROM mhacl_t WHERE mhaclent='"||g_enterprise||"' AND mhacl001=? AND mhacl002=? AND mhacl003=? AND mhacl004='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf004_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthf005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf005
   CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf005_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthf006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf006
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2144' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf006_desc
END FUNCTION

PRIVATE FUNCTION astt252_sthf007_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sthf_d[l_ac].sthf007
   CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sthf_d[l_ac].sthf007_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_sthf_d[l_ac].sthf007_desc
END FUNCTION

PRIVATE FUNCTION astt252_set_required_b()
   IF g_sthf_d.getLength() > 0 AND g_detail_idx != 0 THEN
      IF g_sthf_d[g_detail_idx].sthf011 = '1' OR 
         g_sthf_d[g_detail_idx].sthf011 = '2' OR 
         g_sthf_d[g_detail_idx].sthf011 = '3' OR 
         g_sthf_d[g_detail_idx].sthf011 = '4' THEN
         CALL cl_set_comp_required("sthg005",TRUE)
      END IF
   END IF
   #160604-00009#25 20160620 add by beckxie---S
   IF g_sthc002 = 'Y' THEN
      CALL cl_set_comp_required("sthf002",TRUE)
   END IF                       
   IF g_sthc003 = 'Y' THEN      
      CALL cl_set_comp_required("sthf003",TRUE)
   END IF                       
   IF g_sthc004 = 'Y' THEN      
      CALL cl_set_comp_required("sthf004",TRUE)
   END IF                       
   IF g_sthc005 = 'Y' THEN      
      CALL cl_set_comp_required("sthf005",TRUE)
   END IF                       
   IF g_sthc006 = 'Y' THEN      
      CALL cl_set_comp_required("sthf006",TRUE)
   END IF
   #160604-00009#25 20160620 add by beckxie---E
END FUNCTION

PRIVATE FUNCTION astt252_set_no_required_b()
   CALL cl_set_comp_required("sthg005",FALSE)
   #160604-00009#25 20160620 add by beckxie---S
   CALL cl_set_comp_required("sthf002",FALSE)
   CALL cl_set_comp_required("sthf003",FALSE)
   CALL cl_set_comp_required("sthf004",FALSE)
   CALL cl_set_comp_required("sthf005",FALSE)
   CALL cl_set_comp_required("sthf006",FALSE)
   #160604-00009#25 20160620 add by beckxie---E
END FUNCTION

################################################################################
# Descriptions...: sthf_t重複檢查
# Memo...........:
# Usage..........: CALL astt252_sthf_dup_chk()
#                  RETURNING r_success
# Input parameter: 無
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 160516-00023#1 20160518 add by beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt252_sthf_dup_chk()
   DEFINE l_sql     STRING
   DEFINE l_cnt     LIKE type_t.num5
   DEFINE r_success LIKE type_t.num5
   
   LET l_cnt = 0
   LET r_success = TRUE
   
   LET l_sql = "SELECT COUNT(*) ",
               "  FROM sthf_t ",
               " WHERE sthfent = ",g_enterprise," ",
               "   AND sthfdocno = '",g_sthe_m.sthedocno,"' ",
               "   AND sthfseq != '",g_sthf_d[l_ac].sthfseq,"' "
   IF g_sthc002 = 'Y' THEN
      IF cl_null(g_sthf_d[l_ac].sthf002) THEN
         RETURN r_success
      END IF
      LET l_sql = l_sql," AND sthf002 = '",g_sthf_d[l_ac].sthf002,"' "
   END IF
   IF g_sthc003 = 'Y' THEN
      IF cl_null(g_sthf_d[l_ac].sthf003) THEN
         RETURN r_success
      END IF
      LET l_sql = l_sql," AND sthf003 = '",g_sthf_d[l_ac].sthf003,"' "
   END IF
   IF g_sthc004 = 'Y' THEN
      IF cl_null(g_sthf_d[l_ac].sthf004) THEN
         RETURN r_success
      END IF
      LET l_sql = l_sql," AND sthf004 = '",g_sthf_d[l_ac].sthf004,"' "
   END IF
   IF g_sthc005 = 'Y' THEN
      IF cl_null(g_sthf_d[l_ac].sthf005) THEN
         RETURN r_success
      END IF
      LET l_sql = l_sql," AND sthf005 = '",g_sthf_d[l_ac].sthf005,"' "
   END IF
   IF g_sthc006 = 'Y' THEN
      IF cl_null(g_sthf_d[l_ac].sthf006) THEN
         RETURN r_success
      END IF
      LET l_sql = l_sql," AND sthf006 = '",g_sthf_d[l_ac].sthf006,"' "
   END IF
   
   PREPARE astt252_sthf_dup_chk_pre FROM l_sql
   EXECUTE astt252_sthf_dup_chk_pre INTO l_cnt
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "EXECUTE astt252_sthf_dup_chk_pre "
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   
   IF l_cnt != 0 THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = ""
      LET g_errparam.code   = 'ast-00780'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
   END IF
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
