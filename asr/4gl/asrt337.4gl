#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt337.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-02-03 17:02:17), PR版次:0009(2016-12-29 13:41:02)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000135
#+ Filename...: asrt337
#+ Description: 重覆性生產工單當站下線作業
#+ Creator....: 01258(2015-06-12 16:26:59)
#+ Modifier...: 02295 -SD/PR- 02159
 
{</section>}
 
{<section id="asrt337.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#150826-00008#6   2016/02/04 By xianghui 增加制造批序号管理
#160314-00008#1   2016/03/14 By catmoon  批/序號3:不控管時,修改儲位/批號時沒有更新到inao_t
#160314-00009#5   2016/03/17 By zhujing  各程式增加产品特征是否需要自动开窗的程式段处理
#160316-00007#7   2016/03/18 By xianghui 库存管理特征处增加制造批序号处理
#160318-00025#34  2016/04/14 By pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160818-00017#37  2016/08/26 By lixh     单据类作业修改，删除时需重新检查状态
#160905-00007#15  2016/09/05 by 08172    调整系统中无ENT的SQL条件增加ent
#161124-00048#12  2016/12/13 By xujing   整批调整系统RECORD LIKE xxxx_t.* 星号写法
#160824-00007#285 2016/12/23 By sakura   新舊值備份處理
#161228-00024#1   2016/12/29 By 02295    工单类型asr模组的调整为11-15
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"
IMPORT FGL sub_s_lot
#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_sfha_m        RECORD
       sfhadocno LIKE sfha_t.sfhadocno, 
   sfhadocdt LIKE sfha_t.sfhadocdt, 
   sfha002 LIKE sfha_t.sfha002, 
   sfha002_desc LIKE type_t.chr80, 
   sfhadocno_desc LIKE type_t.chr80, 
   sfha001 LIKE sfha_t.sfha001, 
   sfha003 LIKE sfha_t.sfha003, 
   sfha003_desc LIKE type_t.chr80, 
   sfhastus LIKE sfha_t.sfhastus, 
   sfhasite LIKE sfha_t.sfhasite, 
   sfha012 LIKE sfha_t.sfha012, 
   sfha012_desc LIKE type_t.chr80, 
   sfha013 LIKE sfha_t.sfha013, 
   sfha006 LIKE sfha_t.sfha006, 
   sfha006_desc LIKE type_t.chr80, 
   sfha010 LIKE type_t.chr20, 
   sfha011 LIKE type_t.num10, 
   imaal003 LIKE type_t.chr500, 
   sfha007 LIKE sfha_t.sfha007, 
   sfha009 LIKE sfha_t.sfha009, 
   imaal004 LIKE type_t.chr500, 
   sfha008 LIKE sfha_t.sfha008, 
   sfha014 LIKE sfha_t.sfha014, 
   sfha016 LIKE type_t.chr10, 
   sfha016_desc LIKE type_t.chr80, 
   sfha015 LIKE sfha_t.sfha015, 
   sfhaownid LIKE sfha_t.sfhaownid, 
   sfhaownid_desc LIKE type_t.chr80, 
   sfhaowndp LIKE sfha_t.sfhaowndp, 
   sfhaowndp_desc LIKE type_t.chr80, 
   sfhacrtid LIKE sfha_t.sfhacrtid, 
   sfhacrtid_desc LIKE type_t.chr80, 
   sfhacrtdp LIKE sfha_t.sfhacrtdp, 
   sfhacrtdp_desc LIKE type_t.chr80, 
   sfhacrtdt LIKE sfha_t.sfhacrtdt, 
   sfhamodid LIKE sfha_t.sfhamodid, 
   sfhamodid_desc LIKE type_t.chr80, 
   sfhamoddt LIKE sfha_t.sfhamoddt, 
   sfhacnfid LIKE sfha_t.sfhacnfid, 
   sfhacnfid_desc LIKE type_t.chr80, 
   sfhacnfdt LIKE sfha_t.sfhacnfdt, 
   sfhapstid LIKE sfha_t.sfhapstid, 
   sfhapstid_desc LIKE type_t.chr80, 
   sfhapstdt LIKE sfha_t.sfhapstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sfhb_d        RECORD
       sfhbseq LIKE type_t.num10, 
   sfhb001 LIKE type_t.chr500, 
   sfhb001_desc LIKE type_t.chr500, 
   sfhb001_desc1 LIKE type_t.chr500, 
   sfhb002 LIKE type_t.chr500, 
   sfhb003 LIKE type_t.chr10, 
   sfhb003_desc LIKE type_t.chr500, 
   sfhb004 LIKE type_t.chr10, 
   sfhb004_desc LIKE type_t.chr500, 
   sfhb005 LIKE type_t.chr30, 
   sfhb006 LIKE type_t.chr30, 
   sfhb007 LIKE type_t.chr10, 
   sfhb007_desc LIKE type_t.chr500, 
   sfhb008 LIKE type_t.num20_6, 
   sfhb009 LIKE type_t.chr10, 
   sfhb009_desc LIKE type_t.chr500, 
   sfhb010 LIKE type_t.num20_6, 
   sfhb011 LIKE type_t.dat, 
   sfhb012 LIKE type_t.chr500, 
   sfhbsite LIKE type_t.chr10
       END RECORD
PRIVATE TYPE type_g_sfhb2_d RECORD
       sfhcseq LIKE type_t.num10, 
   sfhcseq1 LIKE type_t.num10, 
   sfhc001 LIKE type_t.chr500, 
   sfhc001_desc LIKE type_t.chr500, 
   sfhc001_desc1 LIKE type_t.chr500, 
   sfhc002 LIKE type_t.chr500, 
   sfhc003 LIKE type_t.chr10, 
   sfhc003_desc LIKE type_t.chr500, 
   sfhc004 LIKE type_t.chr10, 
   sfhc004_desc LIKE type_t.chr500, 
   sfhc005 LIKE type_t.chr30, 
   sfhc006 LIKE type_t.chr30, 
   sfhc007 LIKE type_t.chr10, 
   sfhc007_desc LIKE type_t.chr500, 
   sfhc008 LIKE type_t.num20_6, 
   sfhc009 LIKE type_t.chr10, 
   sfhc009_desc LIKE type_t.chr500, 
   sfhc010 LIKE type_t.num20_6, 
   sfhc011 LIKE type_t.dat, 
   sfhc012 LIKE type_t.chr500, 
   sfhcsite LIKE type_t.chr10
       END RECORD
PRIVATE TYPE type_g_sfhb4_d RECORD
       inaoseq LIKE inao_t.inaoseq, 
   inaoseq1 LIKE inao_t.inaoseq1, 
   inaoseq2 LIKE inao_t.inaoseq2, 
   inao001 LIKE inao_t.inao001, 
   inao001_1_desc LIKE type_t.chr500, 
   inao001_1_desc1 LIKE type_t.chr500, 
   inao008 LIKE inao_t.inao008, 
   inao009 LIKE inao_t.inao009, 
   inao010 LIKE inao_t.inao010, 
   inao012 LIKE inao_t.inao012, 
   inao000 LIKE inao_t.inao000
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sfhadocno LIKE sfha_t.sfhadocno,
   b_sfhadocno_desc LIKE type_t.chr80,
      b_sfhadocdt LIKE sfha_t.sfhadocdt,
      b_sfha002 LIKE sfha_t.sfha002,
   b_sfha002_desc LIKE type_t.chr80,
      b_sfha003 LIKE sfha_t.sfha003,
   b_sfha003_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sfhbseq             LIKE sfhb_t.sfhbseq
 TYPE type_g_inao_d        RECORD   #汇出excel用,注意，比s_lot里的定义少了inaoseq1
    inao000           LIKE inao_t.inao000, 
    inao013           LIKE inao_t.inao013, 
    inaodocno         LIKE inao_t.inaodocno, 
    inaoseq           LIKE inao_t.inaoseq, 
    inaoseq2          LIKE inao_t.inaoseq2, 
    inao001           LIKE inao_t.inao001, 
    inao001_desc      LIKE type_t.chr500,
    inao001_desc_desc LIKE type_t.chr500,
    inao008           LIKE inao_t.inao008, 
    inao009           LIKE inao_t.inao009, 
    inao012           LIKE inao_t.inao012, 
    inao010           LIKE inao_t.inao010,
    inao011           LIKE inao_t.inao011
                  END RECORD
 
DEFINE g_inao_d            DYNAMIC ARRAY OF type_g_inao_d
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sfha_m          type_g_sfha_m
DEFINE g_sfha_m_t        type_g_sfha_m
DEFINE g_sfha_m_o        type_g_sfha_m
DEFINE g_sfha_m_mask_o   type_g_sfha_m #轉換遮罩前資料
DEFINE g_sfha_m_mask_n   type_g_sfha_m #轉換遮罩後資料
 
   DEFINE g_sfhadocno_t LIKE sfha_t.sfhadocno
 
 
DEFINE g_sfhb_d          DYNAMIC ARRAY OF type_g_sfhb_d
DEFINE g_sfhb_d_t        type_g_sfhb_d
DEFINE g_sfhb_d_o        type_g_sfhb_d
DEFINE g_sfhb_d_mask_o   DYNAMIC ARRAY OF type_g_sfhb_d #轉換遮罩前資料
DEFINE g_sfhb_d_mask_n   DYNAMIC ARRAY OF type_g_sfhb_d #轉換遮罩後資料
DEFINE g_sfhb2_d          DYNAMIC ARRAY OF type_g_sfhb2_d
DEFINE g_sfhb2_d_t        type_g_sfhb2_d
DEFINE g_sfhb2_d_o        type_g_sfhb2_d
DEFINE g_sfhb2_d_mask_o   DYNAMIC ARRAY OF type_g_sfhb2_d #轉換遮罩前資料
DEFINE g_sfhb2_d_mask_n   DYNAMIC ARRAY OF type_g_sfhb2_d #轉換遮罩後資料
DEFINE g_sfhb4_d          DYNAMIC ARRAY OF type_g_sfhb4_d
DEFINE g_sfhb4_d_t        type_g_sfhb4_d
DEFINE g_sfhb4_d_o        type_g_sfhb4_d
DEFINE g_sfhb4_d_mask_o   DYNAMIC ARRAY OF type_g_sfhb4_d #轉換遮罩前資料
DEFINE g_sfhb4_d_mask_n   DYNAMIC ARRAY OF type_g_sfhb4_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
DEFINE g_wc2_table3   STRING
 
 
 
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
 
{<section id="asrt337.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
                      
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("asr","")
 
   #add-point:作業初始化 name="main.init"
                        
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
                        
   #end add-point
   LET g_forupd_sql = " SELECT sfhadocno,sfhadocdt,sfha002,'','',sfha001,sfha003,'',sfhastus,sfhasite, 
       sfha012,'',sfha013,sfha006,'','','','',sfha007,sfha009,'',sfha008,sfha014,'','',sfha015,sfhaownid, 
       '',sfhaowndp,'',sfhacrtid,'',sfhacrtdp,'',sfhacrtdt,sfhamodid,'',sfhamoddt,sfhacnfid,'',sfhacnfdt, 
       sfhapstid,'',sfhapstdt", 
                      " FROM sfha_t",
                      " WHERE sfhaent= ? AND sfhadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
                        
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt337_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sfhadocno,t0.sfhadocdt,t0.sfha002,t0.sfha001,t0.sfha003,t0.sfhastus, 
       t0.sfhasite,t0.sfha012,t0.sfha013,t0.sfha006,t0.sfha010,t0.sfha011,t0.sfha007,t0.sfha009,t0.sfha008, 
       t0.sfha014,t0.sfha016,t0.sfha015,t0.sfhaownid,t0.sfhaowndp,t0.sfhacrtid,t0.sfhacrtdp,t0.sfhacrtdt, 
       t0.sfhamodid,t0.sfhamoddt,t0.sfhacnfid,t0.sfhacnfdt,t0.sfhapstid,t0.sfhapstdt,t1.ooag011 ,t2.ooefl003 , 
       t3.srza002 ,t4.oocql004 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 , 
       t11.ooag011 ,t12.ooag011",
               " FROM sfha_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfha002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfha003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN srza_t t3 ON t3.srzaent="||g_enterprise||" AND t3.srza001=t0.sfha012  ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='221' AND t4.oocql002=t0.sfha006 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='1125' AND t5.oocql002=t0.sfha016 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.sfhaownid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.sfhaowndp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.sfhacrtid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.sfhacrtdp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.sfhamodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.sfhacnfid  ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.sfhapstid  ",
 
               " WHERE t0.sfhaent = " ||g_enterprise|| " AND t0.sfhadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asrt337_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
                                                
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrt337 WITH FORM cl_ap_formpath("asr",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asrt337_init()   
 
      #進入選單 Menu (="N")
      CALL asrt337_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
                                                
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asrt337
      
   END IF 
   
   CLOSE asrt337_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_lot_ins_drop_tmp()    #150826-00008#6
   CALL s_lot_sel_drop_tmp()    #150826-00008#6
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asrt337.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt337_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success              LIKE type_t.num5  #150826-00008#6           
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
      CALL cl_set_combo_scc_part('sfhastus','13','N,Y,S,A,D,R,W,Z,X')
 
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
   CALL g_idx_group.addAttribute("'3',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'N' THEN  
      CALL cl_set_comp_visible("sfhb009,sfhb009_desc,sfhb010,sfhc009,sfhc009_desc,sfhc010",FALSE)
   END IF
   CALL cl_ui_replace_sub_window(cl_ap_formpath("sub", "s_lot_s01"), "grid_s_lot", "Table", "s_detail1_s_lot_s01") 
   CALL s_lot_ins_create_tmp()  #150826-00008#6
   CALL s_lot_sel_create_tmp()  #150826-00008#6
   #160314-00009#5 zhujing add 2016-3-17---(S)
   #判斷據點參數若不使用產品特徵時，則產品特徵需隱藏不可以維護(據點參數:S-BAS-0036)
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0036') = 'N' THEN
      CALL cl_set_comp_visible("sfhb002",FALSE)
   END IF
   #160314-00009#5 zhujing add 2016-3-17---(E)
   #end add-point
   
   #初始化搜尋條件
   CALL asrt337_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt337.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt337_ui_dialog()
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
   DEFINE l_success LIKE type_t.num5  
   DEFINE l_inao012 LIKE inao_t.inao012   
   DEFINE l_wc      STRING
   DEFINE l_cnt     LIKE type_t.num5
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
            CALL asrt337_insert()
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
         INITIALIZE g_sfha_m.* TO NULL
         CALL g_sfhb_d.clear()
         CALL g_sfhb2_d.clear()
         CALL g_sfhb4_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt337_init()
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
               
               CALL asrt337_fetch('') # reload data
               LET l_ac = 1
               CALL asrt337_ui_detailshow() #Setting the current row 
         
               CALL asrt337_idx_chk()
               #NEXT FIELD sfhbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sfhb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt337_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
#备份项次，为显示s_lot的批序号单身使用
               LET g_sfhbseq = g_sfhb_d[g_detail_idx].sfhbseq                                                                                                       
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
               CALL asrt337_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
                                                                                                                        
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins1
            LET g_action_choice="s_lot_ins1"
            IF cl_auth_chk_act("s_lot_ins1") THEN
               
               #add-point:ON ACTION s_lot_ins1 name="menu.detail_show.page1.s_lot_ins1"
               #150826-00008#6-b
               IF cl_null(g_detail_idx) OR g_detail_idx = 0 THEN
                  #单身缺少资料，不可维护！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'abm-00073'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               
               IF g_sfha_m.sfhastus <> 'N' THEN
                  #此笔单据状态不是未审核,不可修改！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00035'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF 
              #IF s_lot_batch_number(g_sfhb_d[g_detail_idx].sfhb001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfhb_d[g_detail_idx].sfhb001,g_site) THEN  #160314-00008#1 add              
                  IF NOT cl_null(g_sfhb_d[g_detail_idx].sfhbseq) THEN
                     LET l_success = ''
                     CALL s_transaction_begin()                   
                     CALL s_lot_ins(g_site,g_sfha_m.sfhadocno,g_sfhb_d[g_detail_idx].sfhbseq,'1',
                                    g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,
                                    g_sfhb_d[g_detail_idx].sfhb007,g_sfhb_d[g_detail_idx].sfhb008,
                                    '1',g_sfha_m.sfha002,'0',
                                    g_site,g_sfhb_d[g_detail_idx].sfhb003,g_sfhb_d[g_detail_idx].sfhb004,
                                    g_sfhb_d[g_detail_idx].sfhb005,g_sfhb_d[g_detail_idx].sfhb006)   #160316-00007#7 add sfhb006
                          RETURNING l_success,l_inao012
                     CALL asrt340_ins_inao() RETURNING l_success    
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                     CALL asrt337_b_fill()
                  END IF
               END IF
               #150826-00008#6-e
               #END add-point
               
            END IF
 
 
 
 
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
                                                                                                
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_sfhb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt337_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
                                                                                                                        
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL asrt337_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
                                                                                                                        
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel
            LET g_action_choice="s_lot_sel"
            IF cl_auth_chk_act("s_lot_sel") THEN
               
               #add-point:ON ACTION s_lot_sel name="menu.detail_show.page2.s_lot_sel"
               #150826-00008#6-b
               IF cl_null(g_detail_idx) OR g_detail_idx = 0 THEN
                  #未選擇資料,不可執行此操作;请选择一笔明细资料再执行此操作！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00390'  
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF

               IF g_sfha_m.sfhastus <> 'Y' THEN
                  #此笔单据状态不是未审核,不可修改！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00189'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF               
              #IF s_lot_batch_number(g_sfhb2_d[g_detail_idx].sfhc001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfhb2_d[g_detail_idx].sfhc001,g_site) THEN  #160314-00008#1 add              
                  LET l_success = ''
                  CALL s_transaction_begin()
                  #資料抓取來源'1'代表從現有的製造批序號庫存明細檔inai_t中抓出資料供挑選
                  #           '2'代表從單據對應的申請資料inao_t中抓取出資料供挑選
                  #    資料類型:1.申請資料， 2.實際異動資料
                  CALL s_lot_sel('2','2',
                                 #營運據點 目的單據編號
                                 g_site,g_sfha_m.sfhadocno,
                                 #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳0)
                                 g_sfhb2_d[g_detail_idx].sfhcseq,g_sfhb2_d[g_detail_idx].sfhcseq1,
                                 #料件編號                        產品特徵
                                 g_sfhb2_d[g_detail_idx].sfhc001,g_sfhb2_d[g_detail_idx].sfhc002,
                                 #庫存管理特徵                   庫位                    
                                 g_sfhb2_d[g_detail_idx].sfhc006,g_sfhb2_d[g_detail_idx].sfhc003,
                                 #儲位                          批號                     
                                 g_sfhb2_d[g_detail_idx].sfhc004,g_sfhb2_d[g_detail_idx].sfhc005,
                                 #交易單位                      交易數量                 
                                 g_sfhb2_d[g_detail_idx].sfhc007,g_sfhb2_d[g_detail_idx].sfhc008,
                                 #'入庫'  作業編號 營運據點
                                 '1',g_prog,g_site,
                                 #来源單據編號       来源單據項次
                                 g_sfha_m.sfhadocno,g_sfhb2_d[g_detail_idx].sfhcseq,
                                 #来源單據項序(若單據沒有到項序層則此參數固定傳0)  启用来源单据
                                 '','1'
                                 )
                       RETURNING l_success                  
                  IF l_success THEN
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                  END IF
               END IF
               #150826-00008#6-e
               #END add-point
               
            END IF
 
 
 
 
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
                                                                                               
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_sfhb4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt337_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("'3',",l_ac)
               
               #add-point:page3, before row動作 name="ui_dialog.body4.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 3
               #顯示單身筆數
               CALL asrt337_idx_chk()
               #add-point:page3自定義行為 name="ui_dialog.body4.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_3)
            
         
            #add-point:page3自定義行為 name="ui_dialog.body4.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         SUBDIALOG sub_s_lot.s_lot_display                                                               
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt337_browser_fill("")
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
               CALL asrt337_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt337_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt337_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            LET lb_first = FALSE    #毫无意义的变量，只会让操作变得怪怪的！         
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asrt337_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asrt337_set_act_visible()   
            CALL asrt337_set_act_no_visible()
            IF NOT (g_sfha_m.sfhadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sfhaent = " ||g_enterprise|| " AND",
                                  " sfhadocno = '", g_sfha_m.sfhadocno, "' "
 
               #填到對應位置
               CALL asrt337_browser_fill("")
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
 
               INITIALIZE g_wc2_table3 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfha_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfhb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfhc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "inao_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
                  IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL asrt337_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
               INITIALIZE g_wc2_table3 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfha_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfhb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfhc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "inao_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
                  IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL asrt337_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt337_fetch("F")
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
               CALL asrt337_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt337_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt337_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt337_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt337_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt337_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt337_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt337_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt337_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt337_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt337_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_sfhb_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_sfhb2_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_sfhb4_d)
                  LET g_export_id[3]   = "s_detail4"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  #CALL asrt337_inao_b_fill()   #150826-00008#6-mark
                  LET g_export_node[4] = base.typeInfo.create(g_inao_d)
                  LET g_export_id[4]   = "s_detail1_s_lot_s01"
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
               NEXT FIELD sfhbseq
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
               CALL asrt337_modify()
               #add-point:ON ACTION modify name="menu.modify"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asrt337_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asrt337_delete()
               #add-point:ON ACTION delete name="menu.delete"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt337_insert()
               #add-point:ON ACTION insert name="menu.insert"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET l_wc = " sfhadocno = '",g_sfha_m.sfhadocno,"'"
              
               LET g_rep_wc = l_wc                                                                                                                        
               #END add-point
               &include "erp/asr/asrt337_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET l_wc = " sfhadocno = '",g_sfha_m.sfhadocno,"'"
              
               LET g_rep_wc = l_wc                                                                                                                        
               #END add-point
               &include "erp/asr/asrt337_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL asrt337_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asrt337_query()
               #add-point:ON ACTION query name="menu.query"
                                                                                                                        
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
               CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION mn_stock_in
            LET g_action_choice="mn_stock_in"
            IF cl_auth_chk_act("mn_stock_in") THEN
               
               #add-point:ON ACTION mn_stock_in name="menu.mn_stock_in"
               #150826-00008#6-b
               IF g_sfha_m.sfhastus <> 'Y' THEN
                  #此笔单据状态不是未审核,不可修改！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00189'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               #150826-00008#6-e
               IF s_chr_chk_str(g_sfha_m.sfhadocno,cl_get_para(g_enterprise,'','E-COM-0005'),'') THEN
                  IF g_sfhb_d.getLength()>0 THEN
                     CALL asrt337_01(g_sfha_m.sfhadocno)
                     CALL asrt337_b_fill()
                  ELSE
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "asr-00066" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  END IF
               END IF
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt337_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt337_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt337_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_sfha_m.sfhadocdt)
 
 
 
         
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
 
{<section id="asrt337.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt337_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
                        
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
   IF cl_null(g_wc) THEN
      LET g_wc = " sfhasite = '",g_site,"' AND sfha004 IS  NULL AND sfha012 IS NOT NULL "
   ELSE
      LET g_wc = g_wc," AND sfhasite = '",g_site,"' AND sfha004 IS  NULL AND sfha012 IS NOT NULL "
   END IF 
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sfhadocno ",
                      " FROM sfha_t ",
                      " ",
                      " LEFT JOIN sfhb_t ON sfhbent = sfhaent AND sfhadocno = sfhbdocno ", "  ",
                      #add-point:browser_fill段sql(sfhb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN sfhc_t ON sfhcent = sfhaent AND sfhadocno = sfhcdocno", "  ",
                      #add-point:browser_fill段sql(sfhc_t1) name="browser_fill.cnt.join.sfhc_t1"
                      
                      #end add-point
 
                      " LEFT JOIN inao_t ON inaoent = sfhaent AND sfhadocno = inaodocno", "  ",
                      #add-point:browser_fill段sql(inao_t1) name="browser_fill.cnt.join.inao_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
                      " ",                      
 
 
 
                      " WHERE sfhaent = " ||g_enterprise|| " AND sfhbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sfha_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sfhadocno ",
                      " FROM sfha_t ", 
                      "  ",
                      "  ",
                      " WHERE sfhaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sfha_t")
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
      INITIALIZE g_sfha_m.* TO NULL
      CALL g_sfhb_d.clear()        
      CALL g_sfhb2_d.clear() 
      CALL g_sfhb4_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sfhadocno,t0.sfhadocdt,t0.sfha002,t0.sfha003 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfhastus,t0.sfhadocno,t0.sfhadocdt,t0.sfha002,t0.sfha003,t1.ooag011 , 
          t2.ooefl003 ",
                  " FROM sfha_t t0",
                  "  ",
                  "  LEFT JOIN sfhb_t ON sfhbent = sfhaent AND sfhadocno = sfhbdocno ", "  ", 
                  #add-point:browser_fill段sql(sfhb_t1) name="browser_fill.join.sfhb_t1"
                  
                  #end add-point
                  "  LEFT JOIN sfhc_t ON sfhcent = sfhaent AND sfhadocno = sfhcdocno", "  ", 
                  #add-point:browser_fill段sql(sfhc_t1) name="browser_fill.join.sfhc_t1"
                  
                  #end add-point
 
                  "  LEFT JOIN inao_t ON inaoent = sfhaent AND sfhadocno = inaodocno", "  ", 
                  #add-point:browser_fill段sql(inao_t1) name="browser_fill.join.inao_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfha002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfha003 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfhaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sfha_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfhastus,t0.sfhadocno,t0.sfhadocdt,t0.sfha002,t0.sfha003,t1.ooag011 , 
          t2.ooefl003 ",
                  " FROM sfha_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfha002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfha003 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfhaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sfha_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY sfhadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
                        
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sfha_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
                        
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sfhadocno,g_browser[g_cnt].b_sfhadocdt, 
          g_browser[g_cnt].b_sfha002,g_browser[g_cnt].b_sfha003,g_browser[g_cnt].b_sfha002_desc,g_browser[g_cnt].b_sfha003_desc 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      LET g_browser[g_cnt].b_sfhadocno_desc = s_aooi200_get_slip_desc(g_browser[g_cnt].b_sfhadocno)                                              
         #end add-point
      
         #遮罩相關處理
         CALL asrt337_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
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
   
   IF cl_null(g_browser[g_cnt].b_sfhadocno) THEN
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
 
{<section id="asrt337.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt337_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
                        
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sfha_m.sfhadocno = g_browser[g_current_idx].b_sfhadocno   
 
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
   CALL asrt337_sfha_t_mask()
   CALL asrt337_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt337.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt337_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
                        
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
                        
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail4",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
                        
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt337_ui_browser_refresh()
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
      IF g_browser[l_i].b_sfhadocno = g_sfha_m.sfhadocno 
 
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
 
{<section id="asrt337.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt337_construct()
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
   INITIALIZE g_sfha_m.* TO NULL
   CALL g_sfhb_d.clear()        
   CALL g_sfhb2_d.clear() 
   CALL g_sfhb4_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
   INITIALIZE g_wc2_table3 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
                        
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sfhadocno,sfhadocdt,sfha002,sfhadocno_desc,sfha001,sfha003,sfhastus, 
          sfhasite,sfha012,sfha013,sfha006,sfha010,sfha011,sfha007,sfha009,sfha008,sfha014,sfha016,sfha015, 
          sfhaownid,sfhaowndp,sfhacrtid,sfhacrtdp,sfhacrtdt,sfhamodid,sfhamoddt,sfhacnfid,sfhacnfdt, 
          sfhapstid,sfhapstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
                                                                                                
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sfhacrtdt>>----
         AFTER FIELD sfhacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sfhamoddt>>----
         AFTER FIELD sfhamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfhacnfdt>>----
         AFTER FIELD sfhacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfhapstdt>>----
         AFTER FIELD sfhapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sfhadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhadocno
            #add-point:ON ACTION controlp INFIELD sfhadocno name="construct.c.sfhadocno"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.where=" sfha004 IS  NULL AND sfha012 IS NOT NULL"
            CALL q_sfhadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhadocno  #顯示到畫面上

            NEXT FIELD sfhadocno                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhadocno
            #add-point:BEFORE FIELD sfhadocno name="construct.b.sfhadocno"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhadocno
            
            #add-point:AFTER FIELD sfhadocno name="construct.a.sfhadocno"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhadocdt
            #add-point:BEFORE FIELD sfhadocdt name="construct.b.sfhadocdt"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhadocdt
            
            #add-point:AFTER FIELD sfhadocdt name="construct.a.sfhadocdt"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhadocdt
            #add-point:ON ACTION controlp INFIELD sfhadocdt name="construct.c.sfhadocdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfha002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha002
            #add-point:ON ACTION controlp INFIELD sfha002 name="construct.c.sfha002"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha002  #顯示到畫面上

            NEXT FIELD sfha002                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha002
            #add-point:BEFORE FIELD sfha002 name="construct.b.sfha002"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha002
            
            #add-point:AFTER FIELD sfha002 name="construct.a.sfha002"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhadocno_desc
            #add-point:BEFORE FIELD sfhadocno_desc name="construct.b.sfhadocno_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhadocno_desc
            
            #add-point:AFTER FIELD sfhadocno_desc name="construct.a.sfhadocno_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhadocno_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhadocno_desc
            #add-point:ON ACTION controlp INFIELD sfhadocno_desc name="construct.c.sfhadocno_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha001
            #add-point:BEFORE FIELD sfha001 name="construct.b.sfha001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha001
            
            #add-point:AFTER FIELD sfha001 name="construct.a.sfha001"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha001
            #add-point:ON ACTION controlp INFIELD sfha001 name="construct.c.sfha001"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfha003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha003
            #add-point:ON ACTION controlp INFIELD sfha003 name="construct.c.sfha003"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha003  #顯示到畫面上

            NEXT FIELD sfha003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha003
            #add-point:BEFORE FIELD sfha003 name="construct.b.sfha003"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha003
            
            #add-point:AFTER FIELD sfha003 name="construct.a.sfha003"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhastus
            #add-point:BEFORE FIELD sfhastus name="construct.b.sfhastus"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhastus
            
            #add-point:AFTER FIELD sfhastus name="construct.a.sfhastus"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhastus
            #add-point:ON ACTION controlp INFIELD sfhastus name="construct.c.sfhastus"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhasite
            #add-point:BEFORE FIELD sfhasite name="construct.b.sfhasite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhasite
            
            #add-point:AFTER FIELD sfhasite name="construct.a.sfhasite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhasite
            #add-point:ON ACTION controlp INFIELD sfhasite name="construct.c.sfhasite"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfha012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha012
            #add-point:ON ACTION controlp INFIELD sfha012 name="construct.c.sfha012"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_sraa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha012  #顯示到畫面上
            NEXT FIELD sfha012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha012
            #add-point:BEFORE FIELD sfha012 name="construct.b.sfha012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha012
            
            #add-point:AFTER FIELD sfha012 name="construct.a.sfha012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha013
            #add-point:ON ACTION controlp INFIELD sfha013 name="construct.c.sfha013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha013  #顯示到畫面上
            NEXT FIELD sfha013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha013
            #add-point:BEFORE FIELD sfha013 name="construct.b.sfha013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha013
            
            #add-point:AFTER FIELD sfha013 name="construct.a.sfha013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha006
            #add-point:ON ACTION controlp INFIELD sfha006 name="construct.c.sfha006"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "221" #

            CALL q_oocq002()  
            DISPLAY g_qryparam.return1 TO sfha006  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO sfcb004 #作業序 

            NEXT FIELD sfha006                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha006
            #add-point:BEFORE FIELD sfha006 name="construct.b.sfha006"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha006
            
            #add-point:AFTER FIELD sfha006 name="construct.a.sfha006"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha010
            #add-point:BEFORE FIELD sfha010 name="construct.b.sfha010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha010
            
            #add-point:AFTER FIELD sfha010 name="construct.a.sfha010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha010
            #add-point:ON ACTION controlp INFIELD sfha010 name="construct.c.sfha010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha011
            #add-point:BEFORE FIELD sfha011 name="construct.b.sfha011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha011
            
            #add-point:AFTER FIELD sfha011 name="construct.a.sfha011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha011
            #add-point:ON ACTION controlp INFIELD sfha011 name="construct.c.sfha011"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfha007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha007
            #add-point:ON ACTION controlp INFIELD sfha007 name="construct.c.sfha007"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		   	LET g_qryparam.reqry = FALSE
            CALL q_sfcb004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha007  #顯示到畫面上

            NEXT FIELD sfha007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha007
            #add-point:BEFORE FIELD sfha007 name="construct.b.sfha007"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha007
            
            #add-point:AFTER FIELD sfha007 name="construct.a.sfha007"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha009
            #add-point:BEFORE FIELD sfha009 name="construct.b.sfha009"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha009
            
            #add-point:AFTER FIELD sfha009 name="construct.a.sfha009"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha009
            #add-point:ON ACTION controlp INFIELD sfha009 name="construct.c.sfha009"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha008
            #add-point:BEFORE FIELD sfha008 name="construct.b.sfha008"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha008
            
            #add-point:AFTER FIELD sfha008 name="construct.a.sfha008"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha008
            #add-point:ON ACTION controlp INFIELD sfha008 name="construct.c.sfha008"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfha014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha014
            #add-point:ON ACTION controlp INFIELD sfha014 name="construct.c.sfha014"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha014  #顯示到畫面上
            NEXT FIELD sfha014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha014
            #add-point:BEFORE FIELD sfha014 name="construct.b.sfha014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha014
            
            #add-point:AFTER FIELD sfha014 name="construct.a.sfha014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha016
            #add-point:ON ACTION controlp INFIELD sfha016 name="construct.c.sfha016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha016  #顯示到畫面上
            NEXT FIELD sfha016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha016
            #add-point:BEFORE FIELD sfha016 name="construct.b.sfha016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha016
            
            #add-point:AFTER FIELD sfha016 name="construct.a.sfha016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfha015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha015
            #add-point:ON ACTION controlp INFIELD sfha015 name="construct.c.sfha015"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfha015  #顯示到畫面上
            NEXT FIELD sfha015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha015
            #add-point:BEFORE FIELD sfha015 name="construct.b.sfha015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha015
            
            #add-point:AFTER FIELD sfha015 name="construct.a.sfha015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhaownid
            #add-point:ON ACTION controlp INFIELD sfhaownid name="construct.c.sfhaownid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhaownid  #顯示到畫面上

            NEXT FIELD sfhaownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhaownid
            #add-point:BEFORE FIELD sfhaownid name="construct.b.sfhaownid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhaownid
            
            #add-point:AFTER FIELD sfhaownid name="construct.a.sfhaownid"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhaowndp
            #add-point:ON ACTION controlp INFIELD sfhaowndp name="construct.c.sfhaowndp"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhaowndp  #顯示到畫面上

            NEXT FIELD sfhaowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhaowndp
            #add-point:BEFORE FIELD sfhaowndp name="construct.b.sfhaowndp"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhaowndp
            
            #add-point:AFTER FIELD sfhaowndp name="construct.a.sfhaowndp"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhacrtid
            #add-point:ON ACTION controlp INFIELD sfhacrtid name="construct.c.sfhacrtid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhacrtid  #顯示到畫面上

            NEXT FIELD sfhacrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhacrtid
            #add-point:BEFORE FIELD sfhacrtid name="construct.b.sfhacrtid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhacrtid
            
            #add-point:AFTER FIELD sfhacrtid name="construct.a.sfhacrtid"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfhacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhacrtdp
            #add-point:ON ACTION controlp INFIELD sfhacrtdp name="construct.c.sfhacrtdp"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhacrtdp  #顯示到畫面上

            NEXT FIELD sfhacrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhacrtdp
            #add-point:BEFORE FIELD sfhacrtdp name="construct.b.sfhacrtdp"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhacrtdp
            
            #add-point:AFTER FIELD sfhacrtdp name="construct.a.sfhacrtdp"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhacrtdt
            #add-point:BEFORE FIELD sfhacrtdt name="construct.b.sfhacrtdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfhamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhamodid
            #add-point:ON ACTION controlp INFIELD sfhamodid name="construct.c.sfhamodid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhamodid  #顯示到畫面上

            NEXT FIELD sfhamodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhamodid
            #add-point:BEFORE FIELD sfhamodid name="construct.b.sfhamodid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhamodid
            
            #add-point:AFTER FIELD sfhamodid name="construct.a.sfhamodid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhamoddt
            #add-point:BEFORE FIELD sfhamoddt name="construct.b.sfhamoddt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfhacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhacnfid
            #add-point:ON ACTION controlp INFIELD sfhacnfid name="construct.c.sfhacnfid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhacnfid  #顯示到畫面上

            NEXT FIELD sfhacnfid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhacnfid
            #add-point:BEFORE FIELD sfhacnfid name="construct.b.sfhacnfid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhacnfid
            
            #add-point:AFTER FIELD sfhacnfid name="construct.a.sfhacnfid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhacnfdt
            #add-point:BEFORE FIELD sfhacnfdt name="construct.b.sfhacnfdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfhapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhapstid
            #add-point:ON ACTION controlp INFIELD sfhapstid name="construct.c.sfhapstid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhapstid  #顯示到畫面上

            NEXT FIELD sfhapstid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhapstid
            #add-point:BEFORE FIELD sfhapstid name="construct.b.sfhapstid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhapstid
            
            #add-point:AFTER FIELD sfhapstid name="construct.a.sfhapstid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhapstdt
            #add-point:BEFORE FIELD sfhapstdt name="construct.b.sfhapstdt"
                                                                                                
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008, 
          sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite
           FROM s_detail1[1].sfhbseq,s_detail1[1].sfhb001,s_detail1[1].sfhb002,s_detail1[1].sfhb003, 
               s_detail1[1].sfhb004,s_detail1[1].sfhb005,s_detail1[1].sfhb006,s_detail1[1].sfhb007,s_detail1[1].sfhb008, 
               s_detail1[1].sfhb009,s_detail1[1].sfhb010,s_detail1[1].sfhb011,s_detail1[1].sfhb012,s_detail1[1].sfhbsite 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
                                                                                                
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhbseq
            #add-point:BEFORE FIELD sfhbseq name="construct.b.page1.sfhbseq"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhbseq
            
            #add-point:AFTER FIELD sfhbseq name="construct.a.page1.sfhbseq"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhbseq
            #add-point:ON ACTION controlp INFIELD sfhbseq name="construct.c.page1.sfhbseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfhb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb001
            #add-point:ON ACTION controlp INFIELD sfhb001 name="construct.c.page1.sfhb001"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb001  #顯示到畫面上

            NEXT FIELD sfhb001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb001
            #add-point:BEFORE FIELD sfhb001 name="construct.b.page1.sfhb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb001
            
            #add-point:AFTER FIELD sfhb001 name="construct.a.page1.sfhb001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb002
            #add-point:BEFORE FIELD sfhb002 name="construct.b.page1.sfhb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb002
            
            #add-point:AFTER FIELD sfhb002 name="construct.a.page1.sfhb002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb002
            #add-point:ON ACTION controlp INFIELD sfhb002 name="construct.c.page1.sfhb002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfhb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb003
            #add-point:ON ACTION controlp INFIELD sfhb003 name="construct.c.page1.sfhb003"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb003  #顯示到畫面上

            NEXT FIELD sfhb003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb003
            #add-point:BEFORE FIELD sfhb003 name="construct.b.page1.sfhb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb003
            
            #add-point:AFTER FIELD sfhb003 name="construct.a.page1.sfhb003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb004
            #add-point:BEFORE FIELD sfhb004 name="construct.b.page1.sfhb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb004
            
            #add-point:AFTER FIELD sfhb004 name="construct.a.page1.sfhb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb004
            #add-point:ON ACTION controlp INFIELD sfhb004 name="construct.c.page1.sfhb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb005
            #add-point:BEFORE FIELD sfhb005 name="construct.b.page1.sfhb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb005
            
            #add-point:AFTER FIELD sfhb005 name="construct.a.page1.sfhb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb005
            #add-point:ON ACTION controlp INFIELD sfhb005 name="construct.c.page1.sfhb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb006
            #add-point:BEFORE FIELD sfhb006 name="construct.b.page1.sfhb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb006
            
            #add-point:AFTER FIELD sfhb006 name="construct.a.page1.sfhb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb006
            #add-point:ON ACTION controlp INFIELD sfhb006 name="construct.c.page1.sfhb006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfhb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb007
            #add-point:ON ACTION controlp INFIELD sfhb007 name="construct.c.page1.sfhb007"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb007  #顯示到畫面上

            NEXT FIELD sfhb007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb007
            #add-point:BEFORE FIELD sfhb007 name="construct.b.page1.sfhb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb007
            
            #add-point:AFTER FIELD sfhb007 name="construct.a.page1.sfhb007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb008
            #add-point:BEFORE FIELD sfhb008 name="construct.b.page1.sfhb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb008
            
            #add-point:AFTER FIELD sfhb008 name="construct.a.page1.sfhb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb008
            #add-point:ON ACTION controlp INFIELD sfhb008 name="construct.c.page1.sfhb008"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfhb009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb009
            #add-point:ON ACTION controlp INFIELD sfhb009 name="construct.c.page1.sfhb009"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb009  #顯示到畫面上

            NEXT FIELD sfhb009                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb009
            #add-point:BEFORE FIELD sfhb009 name="construct.b.page1.sfhb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb009
            
            #add-point:AFTER FIELD sfhb009 name="construct.a.page1.sfhb009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb010
            #add-point:BEFORE FIELD sfhb010 name="construct.b.page1.sfhb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb010
            
            #add-point:AFTER FIELD sfhb010 name="construct.a.page1.sfhb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb010
            #add-point:ON ACTION controlp INFIELD sfhb010 name="construct.c.page1.sfhb010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb011
            #add-point:BEFORE FIELD sfhb011 name="construct.b.page1.sfhb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb011
            
            #add-point:AFTER FIELD sfhb011 name="construct.a.page1.sfhb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb011
            #add-point:ON ACTION controlp INFIELD sfhb011 name="construct.c.page1.sfhb011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb012
            #add-point:BEFORE FIELD sfhb012 name="construct.b.page1.sfhb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb012
            
            #add-point:AFTER FIELD sfhb012 name="construct.a.page1.sfhb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb012
            #add-point:ON ACTION controlp INFIELD sfhb012 name="construct.c.page1.sfhb012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhbsite
            #add-point:BEFORE FIELD sfhbsite name="construct.b.page1.sfhbsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhbsite
            
            #add-point:AFTER FIELD sfhbsite name="construct.a.page1.sfhbsite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfhbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhbsite
            #add-point:ON ACTION controlp INFIELD sfhbsite name="construct.c.page1.sfhbsite"
                                                                                                
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON sfhcseq,sfhcseq1,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006,sfhc007, 
          sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite
           FROM s_detail2[1].sfhcseq,s_detail2[1].sfhcseq1,s_detail2[1].sfhc001,s_detail2[1].sfhc002, 
               s_detail2[1].sfhc003,s_detail2[1].sfhc004,s_detail2[1].sfhc005,s_detail2[1].sfhc006,s_detail2[1].sfhc007, 
               s_detail2[1].sfhc008,s_detail2[1].sfhc009,s_detail2[1].sfhc010,s_detail2[1].sfhc011,s_detail2[1].sfhc012, 
               s_detail2[1].sfhcsite
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
                                                                                                
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhcseq
            #add-point:BEFORE FIELD sfhcseq name="construct.b.page2.sfhcseq"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhcseq
            
            #add-point:AFTER FIELD sfhcseq name="construct.a.page2.sfhcseq"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhcseq
            #add-point:ON ACTION controlp INFIELD sfhcseq name="construct.c.page2.sfhcseq"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhcseq1
            #add-point:BEFORE FIELD sfhcseq1 name="construct.b.page2.sfhcseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhcseq1
            
            #add-point:AFTER FIELD sfhcseq1 name="construct.a.page2.sfhcseq1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhcseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhcseq1
            #add-point:ON ACTION controlp INFIELD sfhcseq1 name="construct.c.page2.sfhcseq1"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfhc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc001
            #add-point:ON ACTION controlp INFIELD sfhc001 name="construct.c.page2.sfhc001"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhc001  #顯示到畫面上

            NEXT FIELD sfhc001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc001
            #add-point:BEFORE FIELD sfhc001 name="construct.b.page2.sfhc001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc001
            
            #add-point:AFTER FIELD sfhc001 name="construct.a.page2.sfhc001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc002
            #add-point:BEFORE FIELD sfhc002 name="construct.b.page2.sfhc002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc002
            
            #add-point:AFTER FIELD sfhc002 name="construct.a.page2.sfhc002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc002
            #add-point:ON ACTION controlp INFIELD sfhc002 name="construct.c.page2.sfhc002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfhc003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc003
            #add-point:ON ACTION controlp INFIELD sfhc003 name="construct.c.page2.sfhc003"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhc003  #顯示到畫面上

            NEXT FIELD sfhc003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc003
            #add-point:BEFORE FIELD sfhc003 name="construct.b.page2.sfhc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc003
            
            #add-point:AFTER FIELD sfhc003 name="construct.a.page2.sfhc003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc004
            #add-point:BEFORE FIELD sfhc004 name="construct.b.page2.sfhc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc004
            
            #add-point:AFTER FIELD sfhc004 name="construct.a.page2.sfhc004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc004
            #add-point:ON ACTION controlp INFIELD sfhc004 name="construct.c.page2.sfhc004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc005
            #add-point:BEFORE FIELD sfhc005 name="construct.b.page2.sfhc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc005
            
            #add-point:AFTER FIELD sfhc005 name="construct.a.page2.sfhc005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc005
            #add-point:ON ACTION controlp INFIELD sfhc005 name="construct.c.page2.sfhc005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc006
            #add-point:BEFORE FIELD sfhc006 name="construct.b.page2.sfhc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc006
            
            #add-point:AFTER FIELD sfhc006 name="construct.a.page2.sfhc006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc006
            #add-point:ON ACTION controlp INFIELD sfhc006 name="construct.c.page2.sfhc006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfhc007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc007
            #add-point:ON ACTION controlp INFIELD sfhc007 name="construct.c.page2.sfhc007"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhc007  #顯示到畫面上

            NEXT FIELD sfhc007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc007
            #add-point:BEFORE FIELD sfhc007 name="construct.b.page2.sfhc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc007
            
            #add-point:AFTER FIELD sfhc007 name="construct.a.page2.sfhc007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc008
            #add-point:BEFORE FIELD sfhc008 name="construct.b.page2.sfhc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc008
            
            #add-point:AFTER FIELD sfhc008 name="construct.a.page2.sfhc008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc008
            #add-point:ON ACTION controlp INFIELD sfhc008 name="construct.c.page2.sfhc008"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfhc009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc009
            #add-point:ON ACTION controlp INFIELD sfhc009 name="construct.c.page2.sfhc009"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhc009  #顯示到畫面上

            NEXT FIELD sfhc009                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc009
            #add-point:BEFORE FIELD sfhc009 name="construct.b.page2.sfhc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc009
            
            #add-point:AFTER FIELD sfhc009 name="construct.a.page2.sfhc009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc010
            #add-point:BEFORE FIELD sfhc010 name="construct.b.page2.sfhc010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc010
            
            #add-point:AFTER FIELD sfhc010 name="construct.a.page2.sfhc010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc010
            #add-point:ON ACTION controlp INFIELD sfhc010 name="construct.c.page2.sfhc010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc011
            #add-point:BEFORE FIELD sfhc011 name="construct.b.page2.sfhc011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc011
            
            #add-point:AFTER FIELD sfhc011 name="construct.a.page2.sfhc011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc011
            #add-point:ON ACTION controlp INFIELD sfhc011 name="construct.c.page2.sfhc011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhc012
            #add-point:BEFORE FIELD sfhc012 name="construct.b.page2.sfhc012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhc012
            
            #add-point:AFTER FIELD sfhc012 name="construct.a.page2.sfhc012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhc012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhc012
            #add-point:ON ACTION controlp INFIELD sfhc012 name="construct.c.page2.sfhc012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhcsite
            #add-point:BEFORE FIELD sfhcsite name="construct.b.page2.sfhcsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhcsite
            
            #add-point:AFTER FIELD sfhcsite name="construct.a.page2.sfhcsite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfhcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhcsite
            #add-point:ON ACTION controlp INFIELD sfhcsite name="construct.c.page2.sfhcsite"
                                                                                                
            #END add-point
 
 
   
       
      END CONSTRUCT
 
      CONSTRUCT g_wc2_table3 ON inaoseq_1,inaoseq1_1,inaoseq2_1,inao001_1,inao008_1,inao009_1,inao010_1, 
          inao012_1,inao000_1
           FROM s_detail4[1].inaoseq_1,s_detail4[1].inaoseq1_1,s_detail4[1].inaoseq2_1,s_detail4[1].inao001_1, 
               s_detail4[1].inao008_1,s_detail4[1].inao009_1,s_detail4[1].inao010_1,s_detail4[1].inao012_1, 
               s_detail4[1].inao000_1
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body3.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 3)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inaoseq_1
            #add-point:BEFORE FIELD inaoseq_1 name="construct.b.page4.inaoseq_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inaoseq_1
            
            #add-point:AFTER FIELD inaoseq_1 name="construct.a.page4.inaoseq_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inaoseq_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inaoseq_1
            #add-point:ON ACTION controlp INFIELD inaoseq_1 name="construct.c.page4.inaoseq_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inaoseq1_1
            #add-point:BEFORE FIELD inaoseq1_1 name="construct.b.page4.inaoseq1_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inaoseq1_1
            
            #add-point:AFTER FIELD inaoseq1_1 name="construct.a.page4.inaoseq1_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inaoseq1_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inaoseq1_1
            #add-point:ON ACTION controlp INFIELD inaoseq1_1 name="construct.c.page4.inaoseq1_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inaoseq2_1
            #add-point:BEFORE FIELD inaoseq2_1 name="construct.b.page4.inaoseq2_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inaoseq2_1
            
            #add-point:AFTER FIELD inaoseq2_1 name="construct.a.page4.inaoseq2_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inaoseq2_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inaoseq2_1
            #add-point:ON ACTION controlp INFIELD inaoseq2_1 name="construct.c.page4.inaoseq2_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao001_1
            #add-point:BEFORE FIELD inao001_1 name="construct.b.page4.inao001_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao001_1
            
            #add-point:AFTER FIELD inao001_1 name="construct.a.page4.inao001_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao001_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao001_1
            #add-point:ON ACTION controlp INFIELD inao001_1 name="construct.c.page4.inao001_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao008_1
            #add-point:BEFORE FIELD inao008_1 name="construct.b.page4.inao008_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao008_1
            
            #add-point:AFTER FIELD inao008_1 name="construct.a.page4.inao008_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao008_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao008_1
            #add-point:ON ACTION controlp INFIELD inao008_1 name="construct.c.page4.inao008_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao009_1
            #add-point:BEFORE FIELD inao009_1 name="construct.b.page4.inao009_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao009_1
            
            #add-point:AFTER FIELD inao009_1 name="construct.a.page4.inao009_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao009_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao009_1
            #add-point:ON ACTION controlp INFIELD inao009_1 name="construct.c.page4.inao009_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao010_1
            #add-point:BEFORE FIELD inao010_1 name="construct.b.page4.inao010_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao010_1
            
            #add-point:AFTER FIELD inao010_1 name="construct.a.page4.inao010_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao010_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao010_1
            #add-point:ON ACTION controlp INFIELD inao010_1 name="construct.c.page4.inao010_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao012_1
            #add-point:BEFORE FIELD inao012_1 name="construct.b.page4.inao012_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao012_1
            
            #add-point:AFTER FIELD inao012_1 name="construct.a.page4.inao012_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao012_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao012_1
            #add-point:ON ACTION controlp INFIELD inao012_1 name="construct.c.page4.inao012_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao000_1
            #add-point:BEFORE FIELD inao000_1 name="construct.b.page4.inao000_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao000_1
            
            #add-point:AFTER FIELD inao000_1 name="construct.a.page4.inao000_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao000_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao000_1
            #add-point:ON ACTION controlp INFIELD inao000_1 name="construct.c.page4.inao000_1"
            
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
 
            INITIALIZE g_wc2_table3 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "sfha_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfhb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfhc_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
                  WHEN la_wc[li_idx].tableid = "inao_t" 
                     LET g_wc2_table3 = la_wc[li_idx].wc
 
 
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
 
   IF g_wc2_table3 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
                        
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asrt337_filter()
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
      CONSTRUCT g_wc_filter ON sfhadocno,sfhadocdt,sfha002,sfha003
                          FROM s_browse[1].b_sfhadocno,s_browse[1].b_sfhadocdt,s_browse[1].b_sfha002, 
                              s_browse[1].b_sfha003
 
         BEFORE CONSTRUCT
               DISPLAY asrt337_filter_parser('sfhadocno') TO s_browse[1].b_sfhadocno
            DISPLAY asrt337_filter_parser('sfhadocdt') TO s_browse[1].b_sfhadocdt
            DISPLAY asrt337_filter_parser('sfha002') TO s_browse[1].b_sfha002
            DISPLAY asrt337_filter_parser('sfha003') TO s_browse[1].b_sfha003
      
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
 
      CALL asrt337_filter_show('sfhadocno')
   CALL asrt337_filter_show('sfhadocdt')
   CALL asrt337_filter_show('sfha002')
   CALL asrt337_filter_show('sfha003')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asrt337_filter_parser(ps_field)
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
 
{<section id="asrt337.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asrt337_filter_show(ps_field)
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
   LET ls_condition = asrt337_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt337_query()
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
   CALL g_sfhb_d.clear()
   CALL g_sfhb2_d.clear()
   CALL g_sfhb4_d.clear()
 
   
   #add-point:query段other name="query.other"
                        
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt337_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt337_browser_fill("")
      CALL asrt337_fetch("")
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
      CALL asrt337_filter_show('sfhadocno')
   CALL asrt337_filter_show('sfhadocdt')
   CALL asrt337_filter_show('sfha002')
   CALL asrt337_filter_show('sfha003')
   CALL asrt337_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt337_fetch("F") 
      #顯示單身筆數
      CALL asrt337_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt337_fetch(p_flag)
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
   
   LET g_sfha_m.sfhadocno = g_browser[g_current_idx].b_sfhadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
   #遮罩相關處理
   LET g_sfha_m_mask_o.* =  g_sfha_m.*
   CALL asrt337_sfha_t_mask()
   LET g_sfha_m_mask_n.* =  g_sfha_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt337_set_act_visible()   
   CALL asrt337_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
                        
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
                        
   #end add-point
   
   #保存單頭舊值
   LET g_sfha_m_t.* = g_sfha_m.*
   LET g_sfha_m_o.* = g_sfha_m.*
   
   LET g_data_owner = g_sfha_m.sfhaownid      
   LET g_data_dept  = g_sfha_m.sfhaowndp
   
   #重新顯示   
   CALL asrt337_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt337_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
                        
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sfhb_d.clear()   
   CALL g_sfhb2_d.clear()  
   CALL g_sfhb4_d.clear()  
 
 
   INITIALIZE g_sfha_m.* TO NULL             #DEFAULT 設定
   
   LET g_sfhadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfha_m.sfhaownid = g_user
      LET g_sfha_m.sfhaowndp = g_dept
      LET g_sfha_m.sfhacrtid = g_user
      LET g_sfha_m.sfhacrtdp = g_dept 
      LET g_sfha_m.sfhacrtdt = cl_get_current()
      LET g_sfha_m.sfhamodid = g_user
      LET g_sfha_m.sfhamoddt = cl_get_current()
      LET g_sfha_m.sfhastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      LET g_sfha_m.sfhadocdt = cl_get_today()
      LET g_sfha_m.sfha001 = cl_get_today()
      LET g_sfha_m.sfha002 = g_user
      LET g_sfha_m.sfha002_desc = s_desc_get_person_desc(g_sfha_m.sfha002)
      DISPLAY BY NAME g_sfha_m.sfha002_desc
      LET g_sfha_m.sfha003 = g_dept
      LET g_sfha_m.sfha003_desc = s_desc_get_department_desc(g_sfha_m.sfha003)
      DISPLAY BY NAME g_sfha_m.sfha002_desc,g_sfha_m.sfha003_desc
      LET g_sfha_m.sfha008 = 0
      LET g_sfha_m.sfhastus = 'N'
      CALL s_lot_clear_detail()
      LET g_sfha_m_t.* = g_sfha_m.*
      LET g_sfhbseq = NULL
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sfha_m_t.* = g_sfha_m.*
      LET g_sfha_m_o.* = g_sfha_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfha_m.sfhastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL asrt337_input("a")
      
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
         INITIALIZE g_sfha_m.* TO NULL
         INITIALIZE g_sfhb_d TO NULL
         INITIALIZE g_sfhb2_d TO NULL
         INITIALIZE g_sfhb4_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt337_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sfhb_d.clear()
      #CALL g_sfhb2_d.clear()
      #CALL g_sfhb4_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt337_set_act_visible()   
   CALL asrt337_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfhaent = " ||g_enterprise|| " AND",
                      " sfhadocno = '", g_sfha_m.sfhadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt337_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt337_cl
   
   CALL asrt337_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
   
   #遮罩相關處理
   LET g_sfha_m_mask_o.* =  g_sfha_m.*
   CALL asrt337_sfha_t_mask()
   LET g_sfha_m_mask_n.* =  g_sfha_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha002_desc,g_sfha_m.sfhadocno_desc, 
       g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfha003_desc,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha012_desc,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha006_desc,g_sfha_m.sfha010, 
       g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
       g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha016_desc,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp, 
       g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamodid_desc,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc, 
       g_sfha_m.sfhapstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sfha_m.sfhaownid      
   LET g_data_dept  = g_sfha_m.sfhaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt337_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt337_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
   DEFINE l_wc2_table3   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   IF g_sfha_m.sfhastus <> 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00035'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF                        
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_sfha_m_t.* = g_sfha_m.*
   LET g_sfha_m_o.* = g_sfha_m.*
   
   IF g_sfha_m.sfhadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
   CALL s_transaction_begin()
   
   OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt337_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
   #檢查是否允許此動作
   IF NOT asrt337_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfha_m_mask_o.* =  g_sfha_m.*
   CALL asrt337_sfha_t_mask()
   LET g_sfha_m_mask_n.* =  g_sfha_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
   #LET l_wc2_table3 = g_wc2_table3
   #LET l_wc2_table3 = " 1=1"
 
 
 
   
   CALL asrt337_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
   #LET  g_wc2_table3 = l_wc2_table3 
 
 
 
    
   WHILE TRUE
      LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sfha_m.sfhamodid = g_user 
LET g_sfha_m.sfhamoddt = cl_get_current()
LET g_sfha_m.sfhamodid_desc = cl_get_username(g_sfha_m.sfhamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_sfha_m.sfhastus MATCHES "[DR]" THEN
         LET g_sfha_m.sfhastus = "N"
      END IF                                            
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt337_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
                                                
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sfha_t SET (sfhamodid,sfhamoddt) = (g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt)
          WHERE sfhaent = g_enterprise AND sfhadocno = g_sfhadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sfha_m.* = g_sfha_m_t.*
            CALL asrt337_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sfha_m.sfhadocno != g_sfha_m_t.sfhadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
                                                                        
         #end add-point
         
         #更新單身key值
         UPDATE sfhb_t SET sfhbdocno = g_sfha_m.sfhadocno
 
          WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfha_m_t.sfhadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
                                                                        
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfhb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
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
         
         UPDATE sfhc_t
            SET sfhcdocno = g_sfha_m.sfhadocno
 
          WHERE sfhcent = g_enterprise AND
                sfhcdocno = g_sfhadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
                                                                        
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfhc_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
                                                                        
         #end add-point
 
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update3"
         
         #end add-point
         
         UPDATE inao_t
            SET inaodocno = g_sfha_m.sfhadocno
 
          WHERE inaoent = g_enterprise AND
                inaodocno = g_sfhadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update3"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "inao_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update3"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt337_set_act_visible()   
   CALL asrt337_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sfhaent = " ||g_enterprise|| " AND",
                      " sfhadocno = '", g_sfha_m.sfhadocno, "' "
 
   #填到對應位置
   CALL asrt337_browser_fill("")
 
   CLOSE asrt337_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt337_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt337.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt337_input(p_cmd)
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
   DEFINE  l_sfaa061             LIKE sfaa_t.sfaa061 
   DEFINE  l_sffb009             LIKE sffb_t.sffb009
   DEFINE  l_sffb016             LIKE sffb_t.sffb016 
   DEFINE  l_success             LIKE type_t.num5 
   DEFINE  l_flag1               LIKE type_t.num5
   DEFINE  l_qty                 LIKE sfha_t.sfha008
   DEFINE  l_ooba002             LIKE ooba_t.ooba002
   DEFINE  l_ooba014             LIKE ooba_t.ooba014
   DEFINE  l_site                LIKE ooef_t.ooef001
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_imaa005             LIKE imaa_t.imaa005       #特徵類別
   DEFINE  l_inam                DYNAMIC ARRAY OF RECORD   #記錄產品特徵
              inam001            LIKE inam_t.inam001,
              inam002            LIKE inam_t.inam002,
              inam004            LIKE inam_t.inam004
                        END RECORD 
   DEFINE  l_inaa007             LIKE inaa_t.inaa007 
   DEFINE l_inao012              LIKE inao_t.inao012  
   DEFINE l_sql1                 STRING   
   DEFINE l_year                 LIKE type_t.num5
   DEFINE l_month                LIKE type_t.num5

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
   DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha002_desc,g_sfha_m.sfhadocno_desc, 
       g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfha003_desc,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha012_desc,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha006_desc,g_sfha_m.sfha010, 
       g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
       g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha016_desc,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp, 
       g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamodid_desc,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc, 
       g_sfha_m.sfhapstdt
   
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
   LET g_forupd_sql = "SELECT sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008, 
       sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite FROM sfhb_t WHERE sfhbent=? AND sfhbdocno=? AND sfhbseq=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
#环境产生的sql是错的，自己写
   LET g_forupd_sql = "SELECT sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite FROM sfhb_t  
       WHERE sfhbent=? AND sfhbdocno=? AND sfhbseq=? FOR UPDATE"                        
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt337_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
                        
   #end add-point    
   LET g_forupd_sql = "SELECT sfhcseq,sfhcseq1,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006,sfhc007, 
       sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite FROM sfhc_t WHERE sfhcent=? AND sfhcdocno=?  
       AND sfhcseq=? AND sfhcseq1=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   LET g_forupd_sql = "SELECT sfhcseq,sfhcseq1,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006,sfhc007,sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite FROM sfhc_t  
       WHERE sfhcent=? AND sfhcdocno=? AND sfhcseq=? AND sfhcseq1=?  FOR UPDATE"                         
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt337_bcl2 CURSOR FROM g_forupd_sql
 
   #add-point:input段define_sql name="input.define_sql3"
   
   #end add-point    
   LET g_forupd_sql = "SELECT inaoseq,inaoseq1,inaoseq2,inao001,inao008,inao009,inao010,inao012,inao000  
       FROM inao_t WHERE inaoent=? AND inaosite=? AND inaodocno=? AND inaoseq=? AND inaoseq1=? AND inaoseq2=?  
       AND inao000=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql3"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt337_bcl3 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
                        
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt337_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
                        
   #end add-point
   CALL asrt337_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003, 
       g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010, 
       g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
       g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
                        
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt337.input.head" >}
      #單頭段
      INPUT BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003, 
          g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010, 
          g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
          g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt337_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt337_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            LET g_sfha_m.sfhasite = g_site  
            CALL asrt337_set_no_required()
            CALL asrt337_set_required()            
            #end add-point
            CALL asrt337_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhadocno
            
            #add-point:AFTER FIELD sfhadocno name="input.a.sfhadocno"
                                                                                                            #此段落由子樣板a05產生
            IF  NOT cl_null(g_sfha_m.sfhadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfha_m.sfhadocno != g_sfhadocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfha_t WHERE "||"sfhaent = '" ||g_enterprise|| "' AND "||"sfhadocno = '"||g_sfha_m.sfhadocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_sfha_m.sfhadocno) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfha_m_t.sfhadocno IS NULL OR g_sfha_m.sfhadocno <> g_sfha_m_t.sfhadocno)) THEN  
#有单别检查单别，是完整单号检查完整单号，传入完整单号的话，会截取单别做单别合法性检查               
                  IF NOT s_aooi200_chk_docno(g_site,g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_prog) THEN
                     LET g_sfha_m.sfhadocno = g_sfhadocno_t
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF
            END IF 
            LET g_sfha_m.sfhadocno_desc = s_aooi200_get_slip_desc(g_sfha_m.sfhadocno)
            DISPLAY BY NAME g_sfha_m.sfhadocno_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhadocno
            #add-point:BEFORE FIELD sfhadocno name="input.b.sfhadocno"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhadocno
            #add-point:ON CHANGE sfhadocno name="input.g.sfhadocno"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhadocdt
            #add-point:BEFORE FIELD sfhadocdt name="input.b.sfhadocdt"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhadocdt
            
            #add-point:AFTER FIELD sfhadocdt name="input.a.sfhadocdt"
            IF  NOT cl_null(g_sfha_m.sfhadocdt) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfha_m_t.sfhadocdt IS NULL OR g_sfha_m.sfhadocdt != g_sfha_m_t.sfhadocdt)) THEN 
                  IF NOT s_date_chk_close(g_sfha_m.sfhadocdt,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhadocdt
            #add-point:ON CHANGE sfhadocdt name="input.g.sfhadocdt"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha002
            
            #add-point:AFTER FIELD sfha002 name="input.a.sfha002"
                                                                                                
            IF NOT cl_null(g_sfha_m.sfha002) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfha_m_t.sfha002 IS NULL OR g_sfha_m.sfha002 <> g_sfha_m_t.sfha002)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfha_m.sfha002
			         LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfha_m.sfha002 = g_sfha_m_t.sfha002
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfha_m.sfha002_desc = s_desc_get_person_desc(g_sfha_m.sfha002)            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha002
            #add-point:BEFORE FIELD sfha002 name="input.b.sfha002"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha002
            #add-point:ON CHANGE sfha002 name="input.g.sfha002"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha001
            #add-point:BEFORE FIELD sfha001 name="input.b.sfha001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha001
            
            #add-point:AFTER FIELD sfha001 name="input.a.sfha001"
            IF  NOT cl_null(g_sfha_m.sfha001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfha_m_t.sfha001 IS NULL OR g_sfha_m.sfha001 != g_sfha_m_t.sfha001)) THEN 
                  IF NOT s_date_chk_close(g_sfha_m.sfha001,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF             
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha001
            #add-point:ON CHANGE sfha001 name="input.g.sfha001"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha003
            
            #add-point:AFTER FIELD sfha003 name="input.a.sfha003"
            IF NOT cl_null(g_sfha_m.sfha003) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfha_m_t.sfha003 IS NULL OR g_sfha_m.sfha003 != g_sfha_m_t.sfha003)) THEN 
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfha_m.sfha003
                  LET g_chkparam.arg2 = g_sfha_m.sfhadocdt
			         LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooeg001_3") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfha_m.sfha003 = g_sfha_m_t.sfha003
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfha_m.sfha003_desc = s_desc_get_department_desc(g_sfha_m.sfha003)
            DISPLAY BY NAME g_sfha_m.sfha003_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha003
            #add-point:BEFORE FIELD sfha003 name="input.b.sfha003"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha003
            #add-point:ON CHANGE sfha003 name="input.g.sfha003"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhastus
            #add-point:BEFORE FIELD sfhastus name="input.b.sfhastus"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhastus
            
            #add-point:AFTER FIELD sfhastus name="input.a.sfhastus"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhastus
            #add-point:ON CHANGE sfhastus name="input.g.sfhastus"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhasite
            #add-point:BEFORE FIELD sfhasite name="input.b.sfhasite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhasite
            
            #add-point:AFTER FIELD sfhasite name="input.a.sfhasite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhasite
            #add-point:ON CHANGE sfhasite name="input.g.sfhasite"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha012
            
            #add-point:AFTER FIELD sfha012 name="input.a.sfha012"
            IF NOT cl_null(g_sfha_m.sfha012) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha012 IS NULL OR g_sfha_m.sfha012 != g_sfha_m_t.sfha012)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha012 = g_sfha_m_t.sfha012
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF               
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfha_m.sfha012
            CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srza001=? ","") RETURNING g_rtn_fields
            LET g_sfha_m.sfha012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfha_m.sfha012_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha012
            #add-point:BEFORE FIELD sfha012 name="input.b.sfha012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha012
            #add-point:ON CHANGE sfha012 name="input.g.sfha012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha013
            #add-point:BEFORE FIELD sfha013 name="input.b.sfha013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha013
            
            #add-point:AFTER FIELD sfha013 name="input.a.sfha013"
            IF NOT cl_null(g_sfha_m.sfha013) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha013 IS NULL OR g_sfha_m.sfha013 != g_sfha_m_t.sfha013)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha013 = g_sfha_m_t.sfha013
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF               
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha013
            #add-point:ON CHANGE sfha013 name="input.g.sfha013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha006
            
            #add-point:AFTER FIELD sfha006 name="input.a.sfha006"
#当工单栏位是新增或者修改后，如果对应的run card是唯一的，则预设到run card栏位
#预设工单对应的其他资料
            IF NOT cl_null(g_sfha_m.sfha006) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha006 IS NULL OR g_sfha_m.sfha006 != g_sfha_m_t.sfha006)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha006 = g_sfha_m.sfha006
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_sfha_m.sfha006
                  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
                  LET g_sfha_m.sfha006_desc = '', g_rtn_fields[1] , ''
                  DISPLAY BY NAME g_sfha_m.sfha006_desc                   
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha006
            #add-point:BEFORE FIELD sfha006 name="input.b.sfha006"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha006
            #add-point:ON CHANGE sfha006 name="input.g.sfha006"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha010
            #add-point:BEFORE FIELD sfha010 name="input.b.sfha010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha010
            
            #add-point:AFTER FIELD sfha010 name="input.a.sfha010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha010
            #add-point:ON CHANGE sfha010 name="input.g.sfha010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha011
            #add-point:BEFORE FIELD sfha011 name="input.b.sfha011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha011
            
            #add-point:AFTER FIELD sfha011 name="input.a.sfha011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha011
            #add-point:ON CHANGE sfha011 name="input.g.sfha011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaal003
            #add-point:BEFORE FIELD imaal003 name="input.b.imaal003"
                                                            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaal003
            
            #add-point:AFTER FIELD imaal003 name="input.a.imaal003"
                                                            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imaal003
            #add-point:ON CHANGE imaal003 name="input.g.imaal003"
                                                            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha007
            #add-point:BEFORE FIELD sfha007 name="input.b.sfha007"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha007
            
            #add-point:AFTER FIELD sfha007 name="input.a.sfha007"
#当工单栏位是新增或者修改后，如果对应的run card是唯一的，则预设到run card栏位
#预设工单对应的其他资料
            IF NOT cl_null(g_sfha_m.sfha007) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha007 IS NULL OR g_sfha_m.sfha007 != g_sfha_m_t.sfha007)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha007 = g_sfha_m_t.sfha007
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF                                      
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha007
            #add-point:ON CHANGE sfha007 name="input.g.sfha007"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha009
            #add-point:BEFORE FIELD sfha009 name="input.b.sfha009"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha009
            
            #add-point:AFTER FIELD sfha009 name="input.a.sfha009"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha009
            #add-point:ON CHANGE sfha009 name="input.g.sfha009"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaal004
            #add-point:BEFORE FIELD imaal004 name="input.b.imaal004"
                                                            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaal004
            
            #add-point:AFTER FIELD imaal004 name="input.a.imaal004"
                                                            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imaal004
            #add-point:ON CHANGE imaal004 name="input.g.imaal004"
                                                            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfha_m.sfha008,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfha008
            END IF 
 
 
 
            #add-point:AFTER FIELD sfha008 name="input.a.sfha008"
            IF NOT cl_null(g_sfha_m.sfha008) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfha_m_t.sfha008 IS NULL OR g_sfha_m.sfha008 <> g_sfha_m_t.sfha008)) THEN
                  #CALL s_asrt335_set_qty('','','3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007)     #161228-00024#1 mark
                  CALL s_asrt335_set_qty('','','13',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007)      #161228-00024#1
                   RETURNING l_qty,l_sffb016
                  IF g_sfha_m.sfha008 -l_qty > 0 THEN
                     LET g_sfha_m.sfha008 = g_sfha_m_t.sfha008
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00141'
                     LET g_errparam.extend = g_sfha_m.sfha008
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha008
            #add-point:BEFORE FIELD sfha008 name="input.b.sfha008"
                                                                        CALL asrt337_set_entry(p_cmd)                        
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha008
            #add-point:ON CHANGE sfha008 name="input.g.sfha008"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha014
            #add-point:BEFORE FIELD sfha014 name="input.b.sfha014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha014
            
            #add-point:AFTER FIELD sfha014 name="input.a.sfha014"
            IF NOT cl_null(g_sfha_m.sfha014) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha014 IS NULL OR g_sfha_m.sfha014 != g_sfha_m_t.sfha014)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha014 = g_sfha_m_t.sfha014
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF               
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha014
            #add-point:ON CHANGE sfha014 name="input.g.sfha014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha016
            
            #add-point:AFTER FIELD sfha016 name="input.a.sfha016"
            IF NOT cl_null(g_sfha_m.sfha016) THEN 
#此段落由子樣板a19產生
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = '1125'
               LET g_chkparam.arg2 = g_sfha_m.sfha016
               LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aqci030",g_lang,"2"),"|:EXEPROGaqci030"  #160318-00025#34  add
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_oocq002_1") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfha_m.sfha016
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1125' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfha_m.sfha016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfha_m.sfha016_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha016
            #add-point:BEFORE FIELD sfha016 name="input.b.sfha016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha016
            #add-point:ON CHANGE sfha016 name="input.g.sfha016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfha015
            #add-point:BEFORE FIELD sfha015 name="input.b.sfha015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfha015
            
            #add-point:AFTER FIELD sfha015 name="input.a.sfha015"
            IF NOT cl_null(g_sfha_m.sfha015) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfha_m_t.sfha015 IS NULL OR g_sfha_m.sfha015 != g_sfha_m_t.sfha015)) THEN 
                  CALL s_asrt335_chk_sffb('3',g_sfha_m.sfha012,g_sfha_m.sfha013,g_sfha_m.sfha014,g_sfha_m.sfha015,g_sfha_m.sfha006,g_sfha_m.sfha007) RETURNING l_success
                  IF NOT l_success THEN
                     LET g_sfha_m.sfha015 = g_sfha_m_t.sfha015
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfha015
            #add-point:ON CHANGE sfha015 name="input.g.sfha015"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sfhadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhadocno
            #add-point:ON ACTION controlp INFIELD sfhadocno name="input.c.sfhadocno"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfhadocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
               
            LET g_qryparam.arg1 = l_ooef004          #
            LET g_qryparam.arg2 = g_prog      #

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_sfha_m.sfhadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfha_m.sfhadocno TO sfhadocno              #顯示到畫面上

            NEXT FIELD sfhadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfhadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhadocdt
            #add-point:ON ACTION controlp INFIELD sfhadocdt name="input.c.sfhadocdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfha002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha002
            #add-point:ON ACTION controlp INFIELD sfha002 name="input.c.sfha002"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha002             #給予default值

            #給予arg

            CALL q_ooag001_4()                                #呼叫開窗

            LET g_sfha_m.sfha002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfha_m.sfha002 TO sfha002              #顯示到畫面上

            NEXT FIELD sfha002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfha001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha001
            #add-point:ON ACTION controlp INFIELD sfha001 name="input.c.sfha001"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfha003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha003
            #add-point:ON ACTION controlp INFIELD sfha003 name="input.c.sfha003"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sfha_m.sfhadocdt

            CALL q_ooeg001()                                #呼叫開窗

            LET g_sfha_m.sfha003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfha_m.sfha003 TO sfha003              #顯示到畫面上

            NEXT FIELD sfha003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfhastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhastus
            #add-point:ON ACTION controlp INFIELD sfhastus name="input.c.sfhastus"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfhasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhasite
            #add-point:ON ACTION controlp INFIELD sfhasite name="input.c.sfhasite"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfha012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha012
            #add-point:ON ACTION controlp INFIELD sfha012 name="input.c.sfha012"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha012             #給予default值

            IF NOT cl_null(g_sfha_m.sfhadocdt) THEN
               LET l_year = YEAR(g_sfha_m.sfhadocdt)
               LET l_month = MONTH(g_sfha_m.sfhadocdt)
               LET g_qryparam.where = " sraa002 ='",l_year,"' AND sraa003 = '",l_month,"'"
            END IF

            CALL q_sraa001()                                #呼叫開窗

            LET g_sfha_m.sfha012 = g_qryparam.return1              

            DISPLAY g_sfha_m.sfha012 TO sfha012              #

            NEXT FIELD sfha012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfha013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha013
            #add-point:ON ACTION controlp INFIELD sfha013 name="input.c.sfha013"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha013         #給予default值
            IF NOT cl_null(g_sfha_m.sfhadocdt) THEN
               LET l_year = YEAR(g_sfha_m.sfhadocdt)
               LET l_month = MONTH(g_sfha_m.sfhadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            IF NOT cl_null(g_sfha_m.sfha013) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha013,"'"
            END IF
            IF NOT cl_null(g_sfha_m.sfhadocdt) AND NOT cl_null(g_sfha_m.sfha013) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha013,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            #呼叫開窗
            CALL q_srab004()

            LET g_sfha_m.sfha013 = g_qryparam.return1
            LET g_sfha_m.sfha014 = g_qryparam.return2 
            LET g_sfha_m.sfha015 = g_qryparam.return3            
            DISPLAY g_sfha_m.sfha013 TO sfha013              #
            NEXT FIELD sfha013                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfha006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha006
            #add-point:ON ACTION controlp INFIELD sfha006 name="input.c.sfha006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha006             #給予default值
            LET g_qryparam.default2 = g_sfha_m.sfha007             #製程序

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_sfcb003_4()                                #呼叫開窗

            LET g_sfha_m.sfha006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfha_m.sfha007 = g_qryparam.return3 #製程序

            DISPLAY g_sfha_m.sfha006 TO sfha006              #顯示到畫面上
            DISPLAY g_sfha_m.sfha007 TO sfha007 #製程序
#            DISPLAY g_sfha_m.sfha004 TO sfha004              #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfha_m.sfha006
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfha_m.sfha006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfha_m.sfha006_desc   
            NEXT FIELD CURRENT                                #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfha010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha010
            #add-point:ON ACTION controlp INFIELD sfha010 name="input.c.sfha010"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfha011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha011
            #add-point:ON ACTION controlp INFIELD sfha011 name="input.c.sfha011"
            
            #END add-point
 
 
         #Ctrlp:input.c.imaal003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaal003
            #add-point:ON ACTION controlp INFIELD imaal003 name="input.c.imaal003"
                                                            
            #END add-point
 
 
         #Ctrlp:input.c.sfha007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha007
            #add-point:ON ACTION controlp INFIELD sfha007 name="input.c.sfha007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha006             #給予default值
            LET g_qryparam.default2 = g_sfha_m.sfha007             #製程序

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_sfcb003_4()                                      #呼叫開窗

            LET g_sfha_m.sfha006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfha_m.sfha007 = g_qryparam.return3              #製程序

            DISPLAY g_sfha_m.sfha006 TO sfha006                    #顯示到畫面上
            DISPLAY g_sfha_m.sfha007 TO sfha007                    #製程序

            NEXT FIELD sfha007                                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfha009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha009
            #add-point:ON ACTION controlp INFIELD sfha009 name="input.c.sfha009"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.imaal004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaal004
            #add-point:ON ACTION controlp INFIELD imaal004 name="input.c.imaal004"
                                                            
            #END add-point
 
 
         #Ctrlp:input.c.sfha008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha008
            #add-point:ON ACTION controlp INFIELD sfha008 name="input.c.sfha008"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfha014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha014
            #add-point:ON ACTION controlp INFIELD sfha014 name="input.c.sfha014"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha014            #給予default值
            IF NOT cl_null(g_sfha_m.sfhadocdt) THEN
               LET l_year = YEAR(g_sfha_m.sfhadocdt)
               LET l_month = MONTH(g_sfha_m.sfhadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfha_m.sfha014) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfha_m.sfha014,"'"
               END IF
            END IF
            IF NOT cl_null(g_sfha_m.sfha012) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"'"
               IF NOT cl_null(g_sfha_m.sfha013) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"'  AND srab004 = '",g_sfha_m.sfha013,"'"
               END IF
            END IF
            IF NOT cl_null(g_sfha_m.sfhadocdt) AND NOT cl_null(g_sfha_m.sfha012) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfha_m.sfha013) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004='",g_sfha_m.sfha013,"'"
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfha_m.sfha013) THEN
               LET g_sfha_m.sfha013 = g_qryparam.return1
            END IF
            LET g_sfha_m.sfha014 = g_qryparam.return2
            LET g_sfha_m.sfha015 = g_qryparam.return3
            NEXT FIELD sfha014                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfha016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha016
            #add-point:ON ACTION controlp INFIELD sfha016 name="input.c.sfha016"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha016             #給予default值
            #給予arg
            LET g_qryparam.arg1 = '1125'

            
            CALL q_oocq002()                                #呼叫開窗

            LET g_sfha_m.sfha016 = g_qryparam.return1              
            #LET g_sfha_m.oocq002 = g_qryparam.return2 
            DISPLAY g_sfha_m.sfha016 TO sfha016              #
            #DISPLAY g_sfha_m.oocq002 TO oocq002 #應用分類碼
            NEXT FIELD sfha016                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfha015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfha015
            #add-point:ON ACTION controlp INFIELD sfha015 name="input.c.sfha015"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfha_m.sfha015             #給予default值

            LET g_qryparam.arg1 = g_sfha_m.sfha015 #s
            IF NOT cl_null(g_sfha_m.sfhadocdt) THEN
               LET l_year = YEAR(g_sfha_m.sfhadocdt)
               LET l_month = MONTH(g_sfha_m.sfhadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfha_m.sfha013) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfha_m.sfha013,"'"  
               END IF
               IF g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
               IF NOT cl_null(g_sfha_m.sfha013) AND g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfha_m.sfha013,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfha_m.sfha012) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"'"
               IF NOT cl_null(g_sfha_m.sfha013) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab004 = '",g_sfha_m.sfha013,"'"  
               END IF
               IF g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
               IF NOT cl_null(g_sfha_m.sfha013) AND g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab004 = '",g_sfha_m.sfha013,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfha_m.sfhadocdt) AND NOT cl_null(g_sfha_m.sfha012) THEN
               LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfha_m.sfha013) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfha_m.sfha013,"'"  
               END IF
               IF g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
               IF NOT cl_null(g_sfha_m.sfha013) AND g_sfha_m.sfha014 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfha_m.sfha012,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfha_m.sfha013,"' AND srab005 = '",g_sfha_m.sfha014,"'"  
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfha_m.sfha013) THEN
               LET g_sfha_m.sfha013 = g_qryparam.return1
            END IF
            IF cl_null(g_sfha_m.sfha014) THEN
               LET g_sfha_m.sfha014 = g_qryparam.return2
            END IF
            LET g_sfha_m.sfha015 = g_qryparam.return3
            DISPLAY g_sfha_m.sfha015 TO sfha015             #
            LET g_qryparam.where = ""
            NEXT FIELD sfha015                          #返回原欄位


            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sfha_m.sfhadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            IF g_sfha_m.sfha008 IS NULL OR g_sfha_m.sfha008 = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00687'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD sfha008           
            END IF
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_prog) RETURNING l_success,g_sfha_m.sfhadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_sfha_m.sfhadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF 
               IF g_sfha_m.sfha006 IS NULL THEN LET g_sfha_m.sfha006 = ' ' END IF
               IF g_sfha_m.sfha007 IS NULL THEN LET g_sfha_m.sfha007 = ' ' END IF                
               #end add-point
               
               INSERT INTO sfha_t (sfhaent,sfhadocno,sfhadocdt,sfha002,sfha001,sfha003,sfhastus,sfhasite, 
                   sfha012,sfha013,sfha006,sfha010,sfha011,sfha007,sfha009,sfha008,sfha014,sfha016,sfha015, 
                   sfhaownid,sfhaowndp,sfhacrtid,sfhacrtdp,sfhacrtdt,sfhamodid,sfhamoddt,sfhacnfid,sfhacnfdt, 
                   sfhapstid,sfhapstdt)
               VALUES (g_enterprise,g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha001, 
                   g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012,g_sfha_m.sfha013, 
                   g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
                   g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid, 
                   g_sfha_m.sfhaowndp,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid, 
                   g_sfha_m.sfhamoddt,g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sfha_m:",SQLERRMESSAGE 
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
                  CALL asrt337_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt337_b_fill()
                  CALL asrt337_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               IF g_sfha_m.sfha006 IS NULL THEN LET g_sfha_m.sfha006 = ' ' END IF
               IF g_sfha_m.sfha007 IS NULL THEN LET g_sfha_m.sfha007 = ' ' END IF                                                                                                                          
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt337_sfha_t_mask_restore('restore_mask_o')
               
               UPDATE sfha_t SET (sfhadocno,sfhadocdt,sfha002,sfha001,sfha003,sfhastus,sfhasite,sfha012, 
                   sfha013,sfha006,sfha010,sfha011,sfha007,sfha009,sfha008,sfha014,sfha016,sfha015,sfhaownid, 
                   sfhaowndp,sfhacrtid,sfhacrtdp,sfhacrtdt,sfhamodid,sfhamoddt,sfhacnfid,sfhacnfdt,sfhapstid, 
                   sfhapstdt) = (g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha001, 
                   g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012,g_sfha_m.sfha013, 
                   g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
                   g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid, 
                   g_sfha_m.sfhaowndp,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid, 
                   g_sfha_m.sfhamoddt,g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt) 
 
                WHERE sfhaent = g_enterprise AND sfhadocno = g_sfhadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sfha_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
                                                                                                                        
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt337_sfha_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sfha_m_t)
               LET g_log2 = util.JSON.stringify(g_sfha_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
                                                                                                                        
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt337.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sfhb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins1
            LET g_action_choice="s_lot_ins1"
            IF cl_auth_chk_act("s_lot_ins1") THEN
               
               #add-point:ON ACTION s_lot_ins1 name="input.detail_input.page1.s_lot_ins1"
               #150826-00008#6-b
              #IF s_lot_batch_number(g_sfhb_d[l_ac].sfhb001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN  #160314-00008#1 add
                  LET l_success = ''
                  CALL s_lot_ins(g_site,g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1',g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,'1',g_sfha_m.sfha002,'0',g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006)   #160316-00007#7 add sfhb006
                       RETURNING l_success,l_inao012
                  CALL asrt340_ins_inao() RETURNING l_success 
                  IF NOT l_success THEN                     
                     CALL s_transaction_end('N','0')
                     RETURN
                  END IF
               END IF
               #150826-00008#6-e
               #END add-point
            END IF
 
 
 
 
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfhb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt337_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sfhb_d.getLength()
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
            OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt337_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfhb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfhb_d[l_ac].sfhbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sfhb_d_t.* = g_sfhb_d[l_ac].*  #BACKUP
               LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*  #BACKUP
               CALL asrt337_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
                                                                                                                        
               #end add-point  
               CALL asrt337_set_no_entry_b(l_cmd)
               IF NOT asrt337_lock_b("sfhb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt337_bcl INTO g_sfhb_d[l_ac].sfhbseq,g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb002, 
                      g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006, 
                      g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010, 
                      g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012,g_sfhb_d[l_ac].sfhbsite
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sfhb_d_t.sfhbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfhb_d_mask_o[l_ac].* =  g_sfhb_d[l_ac].*
                  CALL asrt337_sfhb_t_mask()
                  LET g_sfhb_d_mask_n[l_ac].* =  g_sfhb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt337_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"

#备份项次，为显示s_lot的批序号单身使用
            LET g_sfhbseq = g_sfhb_d[g_detail_idx].sfhbseq                                                                                                 
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
            INITIALIZE g_sfhb_d[l_ac].* TO NULL 
            INITIALIZE g_sfhb_d_t.* TO NULL 
            INITIALIZE g_sfhb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
            
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_sfhb_d_t.* = g_sfhb_d[l_ac].*     #新輸入資料
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt337_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
                                                                                                
            #end add-point
            CALL asrt337_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfhb_d[li_reproduce_target].* = g_sfhb_d[li_reproduce].*
 
               LET g_sfhb_d[li_reproduce_target].sfhbseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            LET g_sfhb_d[l_ac].sfhbsite = g_site 
            IF g_sfhb_d[l_ac].sfhbseq IS NULL OR g_sfhb_d[l_ac].sfhbseq = 0 THEN
               SELECT MAX(sfhbseq)+1 INTO g_sfhb_d[l_ac].sfhbseq
                 FROM sfhb_t
                WHERE sfhbent   = g_enterprise 
                  AND sfhbdocno = g_sfha_m.sfhadocno 

            END IF
            IF g_sfhb_d[l_ac].sfhbseq IS NULL THEN
               LET g_sfhb_d[l_ac].sfhbseq = 1
            END IF 
            LET g_sfhb_d[l_ac].sfhb008 = 0
            LET g_sfhb_d[l_ac].sfhb010 = 0            
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
            SELECT COUNT(1) INTO l_count FROM sfhb_t 
             WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfha_m.sfhadocno
 
               AND sfhbseq = g_sfhb_d[l_ac].sfhbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               IF g_sfhb_d[l_ac].sfhb004 IS NULL THEN LET g_sfhb_d[l_ac].sfhb004 = ' ' END IF 
               IF g_sfhb_d[l_ac].sfhb008 IS NULL OR g_sfhb_d[l_ac].sfhb008 = 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00688'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD sfhb008           
               END IF   
               IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN   #启用参考单位数量
                  IF g_sfhb_d[l_ac].sfhb010 IS NULL OR g_sfhb_d[l_ac].sfhb010 = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00688'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD sfhb010           
                  END IF
               END IF               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfha_m.sfhadocno
               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
               CALL asrt337_insert_b('sfhb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
                                                                                                                        
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sfhb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt337_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               IF NOT s_asrt337_ins_sfhc(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,g_sfhb_d[l_ac].*) THEN     #150826-00008#6
                  CALL s_transaction_end('N','0')
                  CANCEL INSERT
               END IF 
#产品特征产生多笔料件时，都要插入单身
               IF l_inam.getlength() > 1 THEN   #第一笔已经用掉了
                  IF NOT asrt337_ins_sfhb_multi(g_sfhb_d[l_ac].*,l_inam) THEN
                     CALL s_transaction_end('N','0')
                     CANCEL INSERT
                  END IF 
               END IF
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               CALL s_transaction_end('N','0')  #150826-00008#6
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
               LET gs_keys[01] = g_sfha_m.sfhadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_sfhb_d_t.sfhbseq
 
            
               #刪除同層單身
               IF NOT asrt337_delete_b('sfhb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt337_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt337_key_delete_b(gs_keys,'sfhb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt337_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
                                                                                                                        
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt337_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  DELETE FROM sfhc_t WHERE sfhcent = g_enterprise AND sfhcdocno = g_sfha_m.sfhadocno AND sfhcseq = g_sfhb_d_t.sfhbseq
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "del sfhc_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     CANCEL DELETE
                  END IF
               #150826-00008#6-b   
               DELETE FROM inao_t
                WHERE inaoent  = g_enterprise
                  AND inaosite = g_site
                  AND inaodocno= g_sfha_m.sfhadocno
                  AND inaoseq  = g_sfhb_d_t.sfhbseq
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "DELETE inao_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE
               END IF    
               #150826-00008#6-b               
               #end add-point
               LET l_count = g_sfhb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
                                                                                                
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfhb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhbseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfhb_d[l_ac].sfhbseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfhbseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfhbseq name="input.a.page1.sfhbseq"
                                                                                                            #此段落由子樣板a05產生
            IF  g_sfha_m.sfhadocno IS NOT NULL AND g_sfhb_d[g_detail_idx].sfhbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfha_m.sfhadocno != g_sfhadocno_t OR g_sfhb_d[g_detail_idx].sfhbseq != g_sfhb_d_t.sfhbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfhb_t WHERE "||"sfhbent = '" ||g_enterprise|| "' AND "||"sfhbdocno = '"||g_sfha_m.sfhadocno ||"' AND "|| "sfhbseq = '"||g_sfhb_d[g_detail_idx].sfhbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhbseq
            #add-point:BEFORE FIELD sfhbseq name="input.b.page1.sfhbseq"
            IF g_sfhb_d[l_ac].sfhbseq IS NULL OR g_sfhb_d[l_ac].sfhbseq = 0 THEN
               SELECT MAX(sfhbseq)+1 INTO g_sfhb_d[l_ac].sfhbseq
                 FROM sfhb_t
                WHERE sfhbent   = g_enterprise 
                  AND sfhbdocno = g_sfha_m.sfhadocno 

            END IF
            IF g_sfhb_d[l_ac].sfhbseq IS NULL THEN
               LET g_sfhb_d[l_ac].sfhbseq = 1
            END IF                                                 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhbseq
            #add-point:ON CHANGE sfhbseq name="input.g.page1.sfhbseq"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb001
            
            #add-point:AFTER FIELD sfhb001 name="input.a.page1.sfhb001"
            IF NOT cl_null(g_sfhb_d[l_ac].sfhb001) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfhb_d[l_ac].sfhb001 <> g_sfhb_d_t.sfhb001) THEN     #160824-00007#285 by sakura mark
               IF g_sfhb_d[l_ac].sfhb001 <> g_sfhb_d_o.sfhb001 OR cl_null(g_sfhb_d_o.sfhb001) THEN     #160824-00007#285 by sakura add
                  IF NOT asrt337_chk_sfhb001(g_sfhb_d[l_ac].sfhb001) THEN
                    #LET g_sfhb_d[l_ac].sfhb001 = g_sfhb_d_t.sfhb001   #160824-00007#285 by sakura mark
                     LET g_sfhb_d[l_ac].sfhb001 = g_sfhb_d_o.sfhb001   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
#预设料件带出预设值：仓储,单位，参考单位
                  CALL asrt337_warehouse_default(g_sfhb_d[l_ac].sfhb001)
                   RETURNING g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb011
                   
                  CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb007)
                  RETURNING g_sfhb_d[l_ac].sfhb007_desc
		          
                  CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb009)
                  RETURNING g_sfhb_d[l_ac].sfhb009_desc                   
                  CALL s_desc_get_stock_desc(g_site,g_sfhb_d[l_ac].sfhb003)
                  RETURNING g_sfhb_d[l_ac].sfhb003_desc
                  
                  CALL s_desc_get_locator_desc(g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004)
                  RETURNING g_sfhb_d[l_ac].sfhb004_desc
                  
                  CALL s_asrt337_get_sfhb010_default(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010)
                   RETURNING g_sfhb_d[l_ac].sfhb010
                  #150826-00008#6-b
                  #入库料件变化时,需删除原批序号资料(包含申请和实际的)
                  DELETE FROM inao_t
                   WHERE inaoent = g_enterprise AND inaosite = g_site
                     AND inaodocno = g_sfha_m.sfhadocno
                     AND (inaoseq = g_sfhb_d_t.sfhbseq OR inaoseq = g_sfhb_d_o.sfhbseq) #項次
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'del inao'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  END IF
                  #150826-00008#6-e
               END IF
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            CALL s_desc_get_item_desc(g_sfhb_d[l_ac].sfhb001)
            RETURNING g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb001_desc1
            
            CALL asrt337_set_no_entry_b(l_cmd)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb001
            #add-point:BEFORE FIELD sfhb001 name="input.b.page1.sfhb001"
            CALL asrt337_set_entry_b(l_cmd)
            CALL asrt337_set_no_required_b()
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb001
            #add-point:ON CHANGE sfhb001 name="input.g.page1.sfhb001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb002
            #add-point:BEFORE FIELD sfhb002 name="input.b.page1.sfhb002"
            #160314-00009#5 zhujing marked 2016-3-17---(S)
            #取得料件產品特徵
#            LET l_imaa005 = ''
#            CALL asrt337_get_imaa005(g_enterprise,g_sfhb_d[l_ac].sfhb001) RETURNING l_imaa005
#               
#            IF NOT cl_null(l_imaa005) THEN
            #160314-00009#5 zhujing marked 2016-3-17---(E)
            IF s_feature_auto_chk(g_sfhb_d[l_ac].sfhb001) AND cl_null(g_sfhb_d[l_ac].sfhb002) THEN #160314-00009#5 zhujing mod 2016-3-17
               IF l_cmd = 'a' THEN            
                  CALL l_inam.clear()            
                  CALL s_feature(l_cmd,g_sfhb_d[l_ac].sfhb001,'','',g_site,g_sfha_m.sfhadocno) RETURNING l_success,l_inam
                  LET g_sfhb_d[l_ac].sfhb002 = l_inam[1].inam002
                  LET g_sfhb_d[l_ac].sfhb008 = l_inam[1].inam004 
               END IF
               #aimm200_02會改成應用元件,待完成後再調整
               IF l_cmd = 'u' THEN
                  CALL aimm200_02(g_sfhb_d[l_ac].sfhb001) RETURNING g_sfhb_d[l_ac].sfhb002
               END IF
            END IF 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb002
            
            #add-point:AFTER FIELD sfhb002 name="input.a.page1.sfhb002"
            IF g_sfhb_d[l_ac].sfhb002 IS NULL THEN
               LET g_sfhb_d[l_ac].sfhb002 = ' '
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb002
            #add-point:ON CHANGE sfhb002 name="input.g.page1.sfhb002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb003
            
            #add-point:AFTER FIELD sfhb003 name="input.a.page1.sfhb003"
            IF NOT cl_null(g_sfhb_d[l_ac].sfhb003) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfhb_d_t.sfhb003 IS NULL OR g_sfhb_d[l_ac].sfhb003 <> g_sfhb_d_t.sfhb003)) THEN   #160824-00007#285 by sakura mark   
               IF g_sfhb_d_o.sfhb003 IS NULL OR g_sfhb_d[l_ac].sfhb003 <> g_sfhb_d_o.sfhb003 THEN   #160824-00007#285 by sakura add
                  IF NOT s_asrt337_warehouse_chk(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004) THEN
                    #LET g_sfhb_d[l_ac].sfhb003 = g_sfhb_d_t.sfhb003   #160824-00007#285 by sakura mark
                     LET g_sfhb_d[l_ac].sfhb003 = g_sfhb_d_o.sfhb003   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  #150826-00008#6-b
                 #IF s_lot_batch_number(g_sfhb_d[l_ac].sfhb001,g_site) THEN      #160314-00008#1 mark
                  IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN  #160314-00008#1 add
                     IF g_sfhb_d[l_ac].sfhb003 <> g_sfhb_d_o.sfhb003 OR g_sfhb_d_o.sfhb003 IS NULL OR
                        g_sfhb_d[l_ac].sfhb004 <> g_sfhb_d_o.sfhb004 OR g_sfhb_d_o.sfhb004 IS NULL OR
                        g_sfhb_d[l_ac].sfhb005 <> g_sfhb_d_o.sfhb005 OR g_sfhb_d_o.sfhb005 IS NULL THEN
                        CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','1',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)   #160316-00007#7 add sfhb006
                           RETURNING l_success
                        CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','2',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)   #160316-00007#7 add sfhb006
                           RETURNING l_success
                     END IF
                  END IF                     
                  #150826-00008#6-e                  
               END IF
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            CALL s_desc_get_stock_desc(g_site,g_sfhb_d[l_ac].sfhb003)
            RETURNING g_sfhb_d[l_ac].sfhb003_desc
            #160824-00007#285 by sakura mark(S)
            #LET g_sfhb_d_o.sfhb003 = g_sfhb_d[l_ac].sfhb003    #150826-00008#6
            #LET g_sfhb_d_o.sfhb004 = g_sfhb_d[l_ac].sfhb004    #150826-00008#6
            #LET g_sfhb_d_o.sfhb005 = g_sfhb_d[l_ac].sfhb005    #150826-00008#6
            #160824-00007#285 by sakura mark(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb003
            #add-point:BEFORE FIELD sfhb003 name="input.b.page1.sfhb003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb003
            #add-point:ON CHANGE sfhb003 name="input.g.page1.sfhb003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb004
            
            #add-point:AFTER FIELD sfhb004 name="input.a.page1.sfhb004"

            IF g_sfhb_d[l_ac].sfhb004 IS NULL THEN LET g_sfhb_d[l_ac].sfhb004 = ' ' END IF
           #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfhb_d[l_ac].sfhb004 <> g_sfhb_d_t.sfhb004) THEN #160824-00007#285 by sakura mark
            IF g_sfhb_d[l_ac].sfhb004 <> g_sfhb_d_o.sfhb004 OR cl_null(g_sfhb_d_o.sfhb004) THEN   #160824-00007#285 by sakura add
               IF NOT s_asrt337_warehouse_chk(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004) THEN
                #LET g_sfhb_d[l_ac].sfhb004 = g_sfhb_d_t.sfhb004   #160824-00007#285 by sakura mark
                 LET g_sfhb_d[l_ac].sfhb004 = g_sfhb_d_o.sfhb004   #160824-00007#285 by sakura add
                  NEXT FIELD CURRENT
               END IF
               #150826-00008#6-b
              #IF s_lot_batch_number(g_sfhb_d[l_ac].sfhb001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN  #160314-00008#1 add
                  IF g_sfhb_d[l_ac].sfhb003 <> g_sfhb_d_o.sfhb003 OR g_sfhb_d_o.sfhb003 IS NULL OR
                     g_sfhb_d[l_ac].sfhb004 <> g_sfhb_d_o.sfhb004 OR g_sfhb_d_o.sfhb004 IS NULL OR
                     g_sfhb_d[l_ac].sfhb005 <> g_sfhb_d_o.sfhb005 OR g_sfhb_d_o.sfhb005 IS NULL THEN
                     CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','1',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)  #160316-00007#7 add sfhb006
                        RETURNING l_success
                     CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','2',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)  #160316-00007#7 add sfhb006
                        RETURNING l_success
                  END IF
               END IF                     
               #150826-00008#6-e               
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            CALL s_desc_get_locator_desc(g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004)
            RETURNING g_sfhb_d[l_ac].sfhb004_desc
            #160824-00007#285 by sakura mark(S)
            #LET g_sfhb_d_o.sfhb003 = g_sfhb_d[l_ac].sfhb003    #150826-00008#6
            #LET g_sfhb_d_o.sfhb004 = g_sfhb_d[l_ac].sfhb004    #150826-00008#6
            #LET g_sfhb_d_o.sfhb005 = g_sfhb_d[l_ac].sfhb005    #150826-00008#6
            #160824-00007#285 by sakura mark(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb004
            #add-point:BEFORE FIELD sfhb004 name="input.b.page1.sfhb004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb004
            #add-point:ON CHANGE sfhb004 name="input.g.page1.sfhb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb005
            #add-point:BEFORE FIELD sfhb005 name="input.b.page1.sfhb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb005
            
            #add-point:AFTER FIELD sfhb005 name="input.a.page1.sfhb005"
            #150826-00008#6-b
            IF g_sfhb_d[l_ac].sfhb005 IS NULL THEN 
               LET g_sfhb_d[l_ac].sfhb005 = ' ' 
            END IF  
           #IF s_lot_batch_number(g_sfhb_d[l_ac].sfhb001,g_site) THEN      #160314-00008#1 mark
            IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN  #160314-00008#1 add
               IF g_sfhb_d[l_ac].sfhb003 <> g_sfhb_d_o.sfhb003 OR g_sfhb_d_o.sfhb003 IS NULL OR
                  g_sfhb_d[l_ac].sfhb004 <> g_sfhb_d_o.sfhb004 OR g_sfhb_d_o.sfhb004 IS NULL OR
                  g_sfhb_d[l_ac].sfhb005 <> g_sfhb_d_o.sfhb005 OR g_sfhb_d_o.sfhb005 IS NULL THEN
                  CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','1',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)  #160316-00007#7 add sfhb006
                     RETURNING l_success
                  CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','2',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)  #160316-00007#7 add sfhb006
                     RETURNING l_success
               END IF
            END IF                                             
            LET g_sfhb_d_o.sfhb003 = g_sfhb_d[l_ac].sfhb003    
            LET g_sfhb_d_o.sfhb004 = g_sfhb_d[l_ac].sfhb004    
            LET g_sfhb_d_o.sfhb005 = g_sfhb_d[l_ac].sfhb005    
            #150826-00008#6-e 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb005
            #add-point:ON CHANGE sfhb005 name="input.g.page1.sfhb005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb006
            #add-point:BEFORE FIELD sfhb006 name="input.b.page1.sfhb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb006
            
            #add-point:AFTER FIELD sfhb006 name="input.a.page1.sfhb006"
            #160316-00007#7---add---begin
            IF g_sfhb_d[l_ac].sfhb006 IS NULL THEN 
               LET g_sfhb_d[l_ac].sfhb006 = ' ' 
            END IF  
            IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN
               IF g_sfhb_d[l_ac].sfhb006 <> g_sfhb_d_o.sfhb006 OR g_sfhb_d_o.sfhb006 IS NULL THEN
                  CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','1',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)
                     RETURNING l_success
                  CALL s_lot_upd_inao(g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1','2',g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_site,g_sfhb_d[l_ac].sfhb006)
                     RETURNING l_success
               END IF
            END IF                                             
            LET g_sfhb_d_o.sfhb006 = g_sfhb_d[l_ac].sfhb006    
            #160316-00007#7---add---end 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb006
            #add-point:ON CHANGE sfhb006 name="input.g.page1.sfhb006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb007
            
            #add-point:AFTER FIELD sfhb007 name="input.a.page1.sfhb007"
            IF NOT cl_null(g_sfhb_d[l_ac].sfhb007) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfhb_d[l_ac].sfhb007 <> g_sfhb_d_t.sfhb007) THEN   #160824-00007#285 by sakura mark
               IF g_sfhb_d[l_ac].sfhb007 <> g_sfhb_d_o.sfhb007 OR cl_null(g_sfhb_d_o.sfhb007) THEN     #160824-00007#285 by sakura add
                  IF NOT asrt337_chk_unit(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb007) THEN
                    #LET g_sfhb_d[l_ac].sfhb007 = g_sfhb_d_t.sfhb007   #160824-00007#285 by sakura mark
                     LET g_sfhb_d[l_ac].sfhb007 = g_sfhb_d_o.sfhb007   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_asrt337_get_sfhb010_default(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010)
                   RETURNING g_sfhb_d[l_ac].sfhb010
               END IF
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb007)
            RETURNING g_sfhb_d[l_ac].sfhb007_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb007
            #add-point:BEFORE FIELD sfhb007 name="input.b.page1.sfhb007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb007
            #add-point:ON CHANGE sfhb007 name="input.g.page1.sfhb007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfhb_d[l_ac].sfhb008,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfhb008
            END IF 
 
 
 
            #add-point:AFTER FIELD sfhb008 name="input.a.page1.sfhb008"
            IF g_sfhb_d[l_ac].sfhb008 IS NOT NULL THEN
              #IF l_cmd = 'a' OR (l_cmd= 'u' AND g_sfhb_d[l_ac].sfhb008 <> g_sfhb_d_t.sfhb008) THEN  #160824-00007#285 by sakura mark
               IF g_sfhb_d[l_ac].sfhb008 <> g_sfhb_d_o.sfhb008 OR cl_null(g_sfhb_d_o.sfhb008) THEN   #160824-00007#285 by sakura add
                 #预设参考数量=数量*参考单位：单位换算率
                  CALL s_asrt337_get_sfhb010_default(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010)
                  RETURNING g_sfhb_d[l_ac].sfhb010
               END IF
               #150826-00008#6-b
              #IF s_lot_batch_number(g_sfhb_d[l_ac].sfhb001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfhb_d[l_ac].sfhb001,g_site) THEN  #160314-00008#1 add
                  IF g_sfhb_d[l_ac].sfhb008 <> g_sfhb_d_o.sfhb008 OR cl_null(g_sfhb_d_o.sfhb008) THEN
                     LET l_success = ''
                     CALL s_lot_ins(g_site,g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq,'1',g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,'1',g_sfha_m.sfha002,'0',g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006)  #160316-00007#7 add sfhb006
                          RETURNING l_success,l_inao012
                     CALL asrt340_ins_inao() RETURNING l_success
                  END IF
               END IF                 
               #150826-00008#6-e    
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb008
            #add-point:BEFORE FIELD sfhb008 name="input.b.page1.sfhb008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb008
            #add-point:ON CHANGE sfhb008 name="input.g.page1.sfhb008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb009
            
            #add-point:AFTER FIELD sfhb009 name="input.a.page1.sfhb009"
            IF NOT cl_null(g_sfhb_d[l_ac].sfhb009) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfhb_d[l_ac].sfhb009 <> g_sfhb_d_t.sfhb009) THEN  #160824-00007#285 by sakura mark
               IF g_sfhb_d[l_ac].sfhb009 <> g_sfhb_d_o.sfhb009 OR cl_null(g_sfhb_d_o.sfhb009) THEN     #160824-00007#285 by sakura add
                  IF NOT asrt337_chk_unit(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb009) THEN
                    #LET g_sfhb_d[l_ac].sfhb009 = g_sfhb_d_t.sfhb009   #160824-00007#285 by sakura mark
                     LET g_sfhb_d[l_ac].sfhb009 = g_sfhb_d_o.sfhb009   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_asrt337_get_sfhb010_default(g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010)
                   RETURNING g_sfhb_d[l_ac].sfhb010
               END IF
            END IF
            LET g_sfhb_d_o.* = g_sfhb_d[l_ac].*   #160824-00007#285 by sakura add
            CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb009)
            RETURNING g_sfhb_d[l_ac].sfhb009_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb009
            #add-point:BEFORE FIELD sfhb009 name="input.b.page1.sfhb009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb009
            #add-point:ON CHANGE sfhb009 name="input.g.page1.sfhb009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb010
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfhb_d[l_ac].sfhb010,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfhb010
            END IF 
 
 
 
            #add-point:AFTER FIELD sfhb010 name="input.a.page1.sfhb010"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb010
            #add-point:BEFORE FIELD sfhb010 name="input.b.page1.sfhb010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb010
            #add-point:ON CHANGE sfhb010 name="input.g.page1.sfhb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb011
            #add-point:BEFORE FIELD sfhb011 name="input.b.page1.sfhb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb011
            
            #add-point:AFTER FIELD sfhb011 name="input.a.page1.sfhb011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb011
            #add-point:ON CHANGE sfhb011 name="input.g.page1.sfhb011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhb012
            #add-point:BEFORE FIELD sfhb012 name="input.b.page1.sfhb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhb012
            
            #add-point:AFTER FIELD sfhb012 name="input.a.page1.sfhb012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhb012
            #add-point:ON CHANGE sfhb012 name="input.g.page1.sfhb012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhbsite
            #add-point:BEFORE FIELD sfhbsite name="input.b.page1.sfhbsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhbsite
            
            #add-point:AFTER FIELD sfhbsite name="input.a.page1.sfhbsite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhbsite
            #add-point:ON CHANGE sfhbsite name="input.g.page1.sfhbsite"
                                                                                                
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sfhbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhbseq
            #add-point:ON ACTION controlp INFIELD sfhbseq name="input.c.page1.sfhbseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb001
            #add-point:ON ACTION controlp INFIELD sfhb001 name="input.c.page1.sfhb001"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb_d[l_ac].sfhb001             #給予default值
            LET g_qryparam.where = " SELECT imaf001 FROM imaf_t WHERE imafent = '",g_enterprise,"' AND imafsite = '",g_site,"' "
            #獲取單據別
			LET l_ooba002 = ''
			CALL s_aooi200_get_slip(g_sfha_m.sfhadocno) RETURNING l_success,l_ooba002
			#獲取單號的營運據點
			LET l_site = ''
			CALL s_aooi200_get_site(g_sfha_m.sfhadocno) RETURNING l_success,l_site
			#獲取參照表編號
			LET l_ooef004 = ''
			SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooefent = g_enterprise AND ooef005 = l_site
			
			#判斷是否有設定生命週期範圍
			LET l_n = 0
			SELECT COUNT(oobd004) INTO l_n FROM ooba_t,oobd_t WHERE oobaent=oobdent AND ooba001=oobd001 AND ooba002=oobd002 
                AND oobaent = g_enterprise AND ooba001 = l_ooef004 AND ooba002 = l_ooba002 AND oobd003='210'
            IF l_n > 0 THEN
               LET g_qryparam.where = g_qryparam.where," AND imaf016 IN (SELECT oobd004 FROM oobd_t WHERE oobdent = '",g_enterprise,"' AND oobd001 = '",l_ooef004,"' AND oobd002 = '",l_ooba002,"' AND oobd003 = '210') "
            END IF
            
            LET g_qryparam.where = " imaa001 IN ( ",g_qryparam.where,")" 
            
            
            #判斷是否在產品分類設定範圍內
            LET l_n = 0
            SELECT COUNT(oobh003) INTO l_n FROM ooba_t,oobh_t WHERE oobaent=oobhent AND ooba001=oobh001 AND ooba002=oobh002
                AND oobaent = g_enterprise AND ooba001 = l_ooef004 AND ooba002 = l_ooba002
            IF l_n > 0 THEN
               LET l_ooba014 = ''
               SELECT ooba014 INTO l_ooba014 FROM ooba_t WHERE oobaent = g_enterprise AND ooba001 = l_ooef004 AND ooba002 = l_ooba002
               #正向列表
               IF l_ooba014 = '1' THEN
                  LET g_qryparam.where = g_qryparam.where," AND imaa009 IN (SELECT oobh003 FROM oobh_t WHERE oobhent = '",g_enterprise,"' AND oobh001 = '",l_ooef004,"' AND oobh002 = '",l_ooba002,"' ) "
               END IF
               
               #負向列表
               IF l_ooba014 = '2' THEN
                  LET g_qryparam.where = g_qryparam.where," AND imaa009 NOT IN (SELECT oobh003 FROM oobh_t WHERE oobhent = '",g_enterprise,"' AND oobh001 = '",l_ooef004,"' AND oobh002 = '",l_ooba002,"' ) "
               END IF
            END IF 
            

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_imaf001_13()                                #呼叫開窗
            LET g_qryparam.where = " "

            LET g_sfhb_d[l_ac].sfhb001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            NEXT FIELD sfhb001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb002
            #add-point:ON ACTION controlp INFIELD sfhb002 name="input.c.page1.sfhb002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb003
            #add-point:ON ACTION controlp INFIELD sfhb003 name="input.c.page1.sfhb003"
#此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb_d[l_ac].sfhb003             #給予default值

            #給予arg
            LET l_sql1 = ''
            LET g_qryparam.where = " 1=1 "
            CALL s_control_get_doc_sql("inaa001",g_sfha_m.sfhadocno,'6') RETURNING l_success,l_sql1
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
            END IF
            LET g_qryparam.where = g_qryparam.where ," AND inaa016 = 'N' "
            CALL q_inaa001_2()

            LET g_sfhb_d[l_ac].sfhb003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfhb_d[l_ac].sfhb003 TO sfhb003              #顯示到畫面上

            NEXT FIELD sfhb003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb004
            #add-point:ON ACTION controlp INFIELD sfhb004 name="input.c.page1.sfhb004"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb_d[l_ac].sfhb004             #給予default值
            
            LET g_qryparam.where = " inab001 = '",g_sfhb_d[l_ac].sfhb003,"' "
            CALL q_inab002()
            LET g_sfhb_d[l_ac].sfhb004 = g_qryparam.return1              #將開窗取得的值回傳到變數
                    
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb005
            #add-point:ON ACTION controlp INFIELD sfhb005 name="input.c.page1.sfhb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb006
            #add-point:ON ACTION controlp INFIELD sfhb006 name="input.c.page1.sfhb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb007
            #add-point:ON ACTION controlp INFIELD sfhb007 name="input.c.page1.sfhb007"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb_d[l_ac].sfhb007             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_sfhb_d[l_ac].sfhb007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfhb_d[l_ac].sfhb007 TO sfhb007              #顯示到畫面上

            NEXT FIELD sfhb007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb008
            #add-point:ON ACTION controlp INFIELD sfhb008 name="input.c.page1.sfhb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb009
            #add-point:ON ACTION controlp INFIELD sfhb009 name="input.c.page1.sfhb009"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb_d[l_ac].sfhb009             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_sfhb_d[l_ac].sfhb009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfhb_d[l_ac].sfhb009 TO sfhb009              #顯示到畫面上

            NEXT FIELD sfhb009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb010
            #add-point:ON ACTION controlp INFIELD sfhb010 name="input.c.page1.sfhb010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb011
            #add-point:ON ACTION controlp INFIELD sfhb011 name="input.c.page1.sfhb011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhb012
            #add-point:ON ACTION controlp INFIELD sfhb012 name="input.c.page1.sfhb012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfhbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhbsite
            #add-point:ON ACTION controlp INFIELD sfhbsite name="input.c.page1.sfhbsite"
                                                                                                
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt337_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sfhb_d[l_ac].sfhbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               IF g_sfhb_d[l_ac].sfhb008 IS NULL OR g_sfhb_d[l_ac].sfhb008 = 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00688'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD sfhb008           
               END IF   
               IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN   #启用参考单位数量
                  IF g_sfhb_d[l_ac].sfhb010 IS NULL OR g_sfhb_d[l_ac].sfhb010 = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00688'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD sfhb010           
                  END IF
               END IF                                                                                                                        
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt337_sfhb_t_mask_restore('restore_mask_o')
      
               UPDATE sfhb_t SET (sfhbdocno,sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006, 
                   sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite) = (g_sfha_m.sfhadocno,g_sfhb_d[l_ac].sfhbseq, 
                   g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004, 
                   g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008, 
                   g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010,g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012, 
                   g_sfhb_d[l_ac].sfhbsite)
                WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfha_m.sfhadocno 
 
                  AND sfhbseq = g_sfhb_d_t.sfhbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
                                                                                                                        
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfhb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfha_m.sfhadocno
               LET gs_keys_bak[1] = g_sfhadocno_t
               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
               LET gs_keys_bak[2] = g_sfhb_d_t.sfhbseq
               CALL asrt337_update_b('sfhb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt337_sfhb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sfhb_d[g_detail_idx].sfhbseq = g_sfhb_d_t.sfhbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sfha_m.sfhadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sfhb_d_t.sfhbseq
 
                  CALL asrt337_key_update_b(gs_keys,'sfhb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfha_m),util.JSON.stringify(g_sfhb_d_t)
               LET g_log2 = util.JSON.stringify(g_sfha_m),util.JSON.stringify(g_sfhb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               IF NOT s_asrt337_ins_sfhc(g_sfha_m.sfhadocno,g_sfhb_d_t.sfhbseq,g_sfhb_d[l_ac].*) THEN    #150826-00008#6
                  LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
                  CLOSE asrt337_bcl
                  CALL s_transaction_end('N','0')
               END IF                                                                                                        
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL asrt337_unlock_b("sfhb_t","'1'")
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
               LET g_sfhb_d[li_reproduce_target].* = g_sfhb_d[li_reproduce].*
 
               LET g_sfhb_d[li_reproduce_target].sfhbseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfhb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfhb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_sfhb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = FALSE, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = FALSE,
                 APPEND ROW = FALSE)
                 
         #自訂ACTION(detail_input,page_2)
         
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel
            LET g_action_choice="s_lot_sel"
            IF cl_auth_chk_act("s_lot_sel") THEN
               
               #add-point:ON ACTION s_lot_sel name="input.detail_input.page2.s_lot_sel"
 
               #END add-point
            END IF
 
 
 
 
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            NEXT FIELD sfhb001    #150826-00008#6 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfhb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt337_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sfhb2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
                                                                                                
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfhb2_d[l_ac].* TO NULL 
            INITIALIZE g_sfhb2_d_t.* TO NULL 
            INITIALIZE g_sfhb2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
            
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_sfhb2_d_t.* = g_sfhb2_d[l_ac].*     #新輸入資料
            LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt337_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
                                                                                                
            #end add-point
            CALL asrt337_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfhb2_d[li_reproduce_target].* = g_sfhb2_d[li_reproduce].*
 
               LET g_sfhb2_d[li_reproduce_target].sfhcseq = NULL
               LET g_sfhb2_d[li_reproduce_target].sfhcseq1 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
             LET g_sfhb2_d[l_ac].sfhcsite = g_site
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body2.before_row2"
 
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
            OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt337_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfhb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfhb2_d[l_ac].sfhcseq IS NOT NULL
               AND g_sfhb2_d[l_ac].sfhcseq1 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sfhb2_d_t.* = g_sfhb2_d[l_ac].*  #BACKUP
               LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*  #BACKUP
               CALL asrt337_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
                                                                                                                        
               #end add-point  
               CALL asrt337_set_no_entry_b(l_cmd)
               IF NOT asrt337_lock_b("sfhc_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt337_bcl2 INTO g_sfhb2_d[l_ac].sfhcseq,g_sfhb2_d[l_ac].sfhcseq1,g_sfhb2_d[l_ac].sfhc001, 
                      g_sfhb2_d[l_ac].sfhc002,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005, 
                      g_sfhb2_d[l_ac].sfhc006,g_sfhb2_d[l_ac].sfhc007,g_sfhb2_d[l_ac].sfhc008,g_sfhb2_d[l_ac].sfhc009, 
                      g_sfhb2_d[l_ac].sfhc010,g_sfhb2_d[l_ac].sfhc011,g_sfhb2_d[l_ac].sfhc012,g_sfhb2_d[l_ac].sfhcsite 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfhb2_d_mask_o[l_ac].* =  g_sfhb2_d[l_ac].*
                  CALL asrt337_sfhc_t_mask()
                  LET g_sfhb2_d_mask_n[l_ac].* =  g_sfhb2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt337_show()
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
               CALL s_transaction_end('N','0')  #150826-00008#6
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
               LET gs_keys[01] = g_sfha_m.sfhadocno
               LET gs_keys[gs_keys.getLength()+1] = g_sfhb2_d_t.sfhcseq
               LET gs_keys[gs_keys.getLength()+1] = g_sfhb2_d_t.sfhcseq1
            
               #刪除同層單身
               IF NOT asrt337_delete_b('sfhc_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt337_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt337_key_delete_b(gs_keys,'sfhc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt337_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
                                                                                                                        
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt337_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
                                                                                                                                                
               #end add-point
               LET l_count = g_sfhb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
                                                                                                
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfhb2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM sfhc_t 
             WHERE sfhcent = g_enterprise AND sfhcdocno = g_sfha_m.sfhadocno
               AND sfhcseq = g_sfhb2_d[l_ac].sfhcseq
               AND sfhcseq1 = g_sfhb2_d[l_ac].sfhcseq1
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
                                                                                                                        
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfha_m.sfhadocno
               LET gs_keys[2] = g_sfhb2_d[g_detail_idx].sfhcseq
               LET gs_keys[3] = g_sfhb2_d[g_detail_idx].sfhcseq1
               CALL asrt337_insert_b('sfhc_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
                                                                                                                        
               #end add-point
            ELSE    
               INITIALIZE g_sfhb_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt337_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body2.after_insert"
                                                                                                                        
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt337_bcl2
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
               LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
                                                                                                                        
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL asrt337_sfhc_t_mask_restore('restore_mask_o')
                              
               UPDATE sfhc_t SET (sfhcdocno,sfhcseq,sfhcseq1,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005, 
                   sfhc006,sfhc007,sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite) = (g_sfha_m.sfhadocno, 
                   g_sfhb2_d[l_ac].sfhcseq,g_sfhb2_d[l_ac].sfhcseq1,g_sfhb2_d[l_ac].sfhc001,g_sfhb2_d[l_ac].sfhc002, 
                   g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_sfhb2_d[l_ac].sfhc006, 
                   g_sfhb2_d[l_ac].sfhc007,g_sfhb2_d[l_ac].sfhc008,g_sfhb2_d[l_ac].sfhc009,g_sfhb2_d[l_ac].sfhc010, 
                   g_sfhb2_d[l_ac].sfhc011,g_sfhb2_d[l_ac].sfhc012,g_sfhb2_d[l_ac].sfhcsite) #自訂欄位頁簽 
 
                WHERE sfhcent = g_enterprise AND sfhcdocno = g_sfha_m.sfhadocno
                  AND sfhcseq = g_sfhb2_d_t.sfhcseq #項次 
                  AND sfhcseq1 = g_sfhb2_d_t.sfhcseq1
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
                                                                                                                        
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfhc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfha_m.sfhadocno
               LET gs_keys_bak[1] = g_sfhadocno_t
               LET gs_keys[2] = g_sfhb2_d[g_detail_idx].sfhcseq
               LET gs_keys_bak[2] = g_sfhb2_d_t.sfhcseq
               LET gs_keys[3] = g_sfhb2_d[g_detail_idx].sfhcseq1
               LET gs_keys_bak[3] = g_sfhb2_d_t.sfhcseq1
               CALL asrt337_update_b('sfhc_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL asrt337_sfhc_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_sfhb2_d[g_detail_idx].sfhcseq = g_sfhb2_d_t.sfhcseq 
                  AND g_sfhb2_d[g_detail_idx].sfhcseq1 = g_sfhb2_d_t.sfhcseq1 
                  ) THEN
                  LET gs_keys[01] = g_sfha_m.sfhadocno
                  LET gs_keys[gs_keys.getLength()+1] = g_sfhb2_d_t.sfhcseq
                  LET gs_keys[gs_keys.getLength()+1] = g_sfhb2_d_t.sfhcseq1
                  CALL asrt337_key_update_b(gs_keys,'sfhc_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfha_m),util.JSON.stringify(g_sfhb2_d_t)
               LET g_log2 = util.JSON.stringify(g_sfha_m),util.JSON.stringify(g_sfhb2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
                                                                                                                        
               #end add-point
            END IF
         
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhcseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfhb2_d[l_ac].sfhcseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfhcseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfhcseq name="input.a.page2.sfhcseq"
                                                                                                
            IF NOT cl_null(g_sfhb2_d[l_ac].sfhcseq) THEN 
            END IF 

            #此段落由子樣板a05產生
            IF  g_sfha_m.sfhadocno IS NOT NULL AND g_sfhb2_d[g_detail_idx].sfhcseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfha_m.sfhadocno != g_sfhadocno_t OR g_sfhb2_d[g_detail_idx].sfhcseq != g_sfhb2_d_t.sfhcseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfhc_t WHERE "||"sfhcent = '" ||g_enterprise|| "' AND "||"sfhcdocno = '"||g_sfha_m.sfhadocno ||"' AND "|| "sfhcseq = '"||g_sfhb2_d[g_detail_idx].sfhcseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhcseq
            #add-point:BEFORE FIELD sfhcseq name="input.b.page2.sfhcseq"
                                                IF g_sfhb2_d[l_ac].sfhcseq IS NULL OR g_sfhb2_d[l_ac].sfhcseq = 0 THEN
               SELECT MAX(sfhcseq)+1 INTO g_sfhb2_d[l_ac].sfhcseq
                 FROM sfhc_t
                WHERE sfhcent   = g_enterprise 
                  AND sfhcdocno = g_sfha_m.sfhadocno 

            END IF
            IF g_sfhb2_d[l_ac].sfhcseq IS NULL THEN
               LET g_sfhb2_d[l_ac].sfhcseq = 1
            END IF                                                            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhcseq
            #add-point:ON CHANGE sfhcseq name="input.g.page2.sfhcseq"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfhcsite
            #add-point:BEFORE FIELD sfhcsite name="input.b.page2.sfhcsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfhcsite
            
            #add-point:AFTER FIELD sfhcsite name="input.a.page2.sfhcsite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfhcsite
            #add-point:ON CHANGE sfhcsite name="input.g.page2.sfhcsite"
                                                                                                
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.sfhcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhcseq
            #add-point:ON ACTION controlp INFIELD sfhcseq name="input.c.page2.sfhcseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfhcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfhcsite
            #add-point:ON ACTION controlp INFIELD sfhcsite name="input.c.page2.sfhcsite"
                                                                                                
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
                                                                                                
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt337_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL asrt337_unlock_b("sfhc_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
 
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sfhb2_d[li_reproduce_target].* = g_sfhb2_d[li_reproduce].*
 
               LET g_sfhb2_d[li_reproduce_target].sfhcseq = NULL
               LET g_sfhb2_d[li_reproduce_target].sfhcseq1 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfhb2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfhb2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
      DISPLAY ARRAY g_sfhb4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            CALL asrt337_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail4")
            LET g_detail_idx = l_ac
            
            #add-point:page3, before row動作 name="input.body4.before_row"
            
            #end add-point
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail4")
            CALL asrt337_idx_chk()
            LET g_current_page = 3
      
         #add-point:page3自定義行為 name="input.body4.action"
         
         #end add-point
      
      END DISPLAY
 
 
 
{</section>}
 
{<section id="asrt337.input.other" >}
      
      #add-point:自定義input name="input.more_input"
                                                
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
                                                                        
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
         CALL DIALOG.setCurrentRow("s_detail4",g_idx_group.getValue("'3',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sfhadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfhbseq
               WHEN "s_detail2"
                  NEXT FIELD sfhcseq
               WHEN "s_detail4"
                  NEXT FIELD inaoseq
 
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
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
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
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   CALL asrt337_b_fill()  #150826-00008#6                      
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt337_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE  l_sffb009             LIKE sffb_t.sffb009 
   DEFINE  l_sfha005             LIKE sfha_t.sfha005
   DEFINE  l_sfha006             LIKE sfha_t.sfha006
   DEFINE  l_sfha007             LIKE sfha_t.sfha007   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
                        
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt337_b_fill() #單身填充
      CALL asrt337_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt337_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

            LET g_sfha_m.sfhadocno_desc = s_aooi200_get_slip_desc(g_sfha_m.sfhadocno)

#            CALL s_asft335_default_sffb056('3',g_sfha_m.sfha004,g_sfha_m.sfha005,g_sfha_m.sfha006,g_sfha_m.sfha007)
#            RETURNING g_sfha_m.sfaa010,l_sfha005,l_sfha006,l_sfha007,l_sffb009
#
#            CALL s_desc_get_item_desc(g_sfha_m.sfaa010)
#            RETURNING g_sfha_m.imaal003,g_sfha_m.imaal004 
   #end add-point
   
   #遮罩相關處理
   LET g_sfha_m_mask_o.* =  g_sfha_m.*
   CALL asrt337_sfha_t_mask()
   LET g_sfha_m_mask_n.* =  g_sfha_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha002_desc,g_sfha_m.sfhadocno_desc, 
       g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfha003_desc,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha012_desc,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha006_desc,g_sfha_m.sfha010, 
       g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
       g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha016_desc,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp, 
       g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamodid_desc,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc, 
       g_sfha_m.sfhapstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfha_m.sfhastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sfhb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      CALL s_desc_get_item_desc(g_sfhb_d[l_ac].sfhb001)
      RETURNING g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb001_desc1 
      
      CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb007)
      RETURNING g_sfhb_d[l_ac].sfhb007_desc

      CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb009)
      RETURNING g_sfhb_d[l_ac].sfhb009_desc
      
      CALL s_desc_get_stock_desc(g_site,g_sfhb_d[l_ac].sfhb003)
      RETURNING g_sfhb_d[l_ac].sfhb003_desc
      
      CALL s_desc_get_locator_desc(g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004)
      RETURNING g_sfhb_d[l_ac].sfhb004_desc

      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_sfhb2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      CALL s_desc_get_item_desc(g_sfhb2_d[l_ac].sfhc001)
      RETURNING g_sfhb2_d[l_ac].sfhc001_desc,g_sfhb2_d[l_ac].sfhc001_desc1

      CALL s_desc_get_unit_desc(g_sfhb2_d[l_ac].sfhc007)
      RETURNING g_sfhb2_d[l_ac].sfhc007_desc

      CALL s_desc_get_unit_desc(g_sfhb2_d[l_ac].sfhc009)
      RETURNING g_sfhb2_d[l_ac].sfhc009_desc
      
      CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
      RETURNING g_sfhb2_d[l_ac].sfhc003_desc
      
      CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
      RETURNING g_sfhb2_d[l_ac].sfhc004_desc
      #end add-point
   END FOR
   FOR l_ac = 1 TO g_sfhb4_d.getLength()
      #add-point:show段單身reference name="show.body4.reference"
      CALL s_desc_get_item_desc(g_sfhb4_d[l_ac].inao001)
      RETURNING g_sfhb4_d[l_ac].inao001_1_desc,g_sfhb4_d[l_ac].inao001_1_desc1
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
                        
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt337_detail_show()
 
   #add-point:show段之後 name="show.after"
                        
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt337_detail_show()
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
 
{<section id="asrt337.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt337_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sfha_t.sfhadocno 
   DEFINE l_oldno     LIKE sfha_t.sfhadocno 
 
   DEFINE l_master    RECORD LIKE sfha_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sfhb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfhc_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE inao_t.* #此變數樣板目前無使用
 
 
 
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
   
   IF g_sfha_m.sfhadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
    
   LET g_sfha_m.sfhadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfha_m.sfhaownid = g_user
      LET g_sfha_m.sfhaowndp = g_dept
      LET g_sfha_m.sfhacrtid = g_user
      LET g_sfha_m.sfhacrtdp = g_dept 
      LET g_sfha_m.sfhacrtdt = cl_get_current()
      LET g_sfha_m.sfhamodid = g_user
      LET g_sfha_m.sfhamoddt = cl_get_current()
      LET g_sfha_m.sfhastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_sfha_m.sfhacnfid = NULL 
   LET g_sfha_m.sfhacnfdt = NULL 
   LET g_sfha_m.sfhapstid = NULL 
   LET g_sfha_m.sfhapstdt = NULL    
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfha_m.sfhastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_sfha_m.sfhadocno_desc = ''
   DISPLAY BY NAME g_sfha_m.sfhadocno_desc
 
   
   CALL asrt337_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sfha_m.* TO NULL
      INITIALIZE g_sfhb_d TO NULL
      INITIALIZE g_sfhb2_d TO NULL
      INITIALIZE g_sfhb4_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt337_show()
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
   CALL asrt337_set_act_visible()   
   CALL asrt337_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfhaent = " ||g_enterprise|| " AND",
                      " sfhadocno = '", g_sfha_m.sfhadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt337_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
                        
   #end add-point
   
   CALL asrt337_idx_chk()
   
   LET g_data_owner = g_sfha_m.sfhaownid      
   LET g_data_dept  = g_sfha_m.sfhaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt337_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt337_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sfhb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfhc_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE inao_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
                        
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt337_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
                        
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfhb_t
    WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfhadocno_t
 
    INTO TEMP asrt337_detail
 
   #將key修正為調整後   
   UPDATE asrt337_detail 
      #更新key欄位
      SET sfhbdocno = g_sfha_m.sfhadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sfhb_t SELECT * FROM asrt337_detail
   
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
   DROP TABLE asrt337_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
                        
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
                        
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfhc_t 
    WHERE sfhcent = g_enterprise AND sfhcdocno = g_sfhadocno_t
 
    INTO TEMP asrt337_detail
 
   #將key修正為調整後   
   UPDATE asrt337_detail SET sfhcdocno = g_sfha_m.sfhadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO sfhc_t SELECT * FROM asrt337_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
                        
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt337_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
                        
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table3.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM inao_t 
    WHERE inaoent = g_enterprise AND inaodocno = g_sfhadocno_t
 
    INTO TEMP asrt337_detail
 
   #將key修正為調整後   
   UPDATE asrt337_detail SET inaodocno = g_sfha_m.sfhadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table3.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO inao_t SELECT * FROM asrt337_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table3.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt337_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table3.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt337_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   IF g_sfha_m.sfhastus <> 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00034'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF                         
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_sfha_m.sfhadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt337_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
   
   #檢查是否允許此動作
   IF NOT asrt337_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfha_m_mask_o.* =  g_sfha_m.*
   CALL asrt337_sfha_t_mask()
   LET g_sfha_m_mask_n.* =  g_sfha_m.*
   
   CALL asrt337_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
                                                
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt337_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sfhadocno_t = g_sfha_m.sfhadocno
 
 
      DELETE FROM sfha_t
       WHERE sfhaent = g_enterprise AND sfhadocno = g_sfha_m.sfhadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
                                                
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sfha_m.sfhadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt) THEN CALL s_transaction_end('N','0') RETURN END IF                                          
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
                                                
      #end add-point
      
      DELETE FROM sfhb_t
       WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfha_m.sfhadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
                                                
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
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
      DELETE FROM sfhc_t
       WHERE sfhcent = g_enterprise AND
             sfhcdocno = g_sfha_m.sfhadocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
                                                
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
                                                
      #end add-point
 
      #add-point:單身刪除前 name="delete.body.b_delete3"
      
      #end add-point
      DELETE FROM inao_t
       WHERE inaoent = g_enterprise AND
             inaodocno = g_sfha_m.sfhadocno
      #add-point:單身刪除中 name="delete.body.m_delete3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete3"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sfha_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt337_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sfhb_d.clear() 
      CALL g_sfhb2_d.clear()       
      CALL g_sfhb4_d.clear()       
 
     
      CALL asrt337_ui_browser_refresh()  
      #CALL asrt337_ui_headershow()  
      #CALL asrt337_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt337_browser_fill("")
         CALL asrt337_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asrt337_cl
 
   #功能已完成,通報訊息中心
   CALL asrt337_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt337.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt337_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
                        
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sfhb_d.clear()
   CALL g_sfhb2_d.clear()
   CALL g_sfhb4_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
                        
   #end add-point
   
   #判斷是否填充
   IF asrt337_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007, 
             sfhb008,sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite ,t1.imaal003 ,t2.inaa002 ,t3.inab003 , 
             t4.oocal003 ,t5.oocal003 FROM sfhb_t",   
                     " INNER JOIN sfha_t ON sfhaent = " ||g_enterprise|| " AND sfhadocno = sfhbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=sfhb001 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inaa_t t2 ON t2.inaaent="||g_enterprise||" AND t2.inaasite=sfhbsite AND t2.inaa001=sfhb003  ",
               " LEFT JOIN inab_t t3 ON t3.inabent="||g_enterprise||" AND t3.inabsite=sfhbsite AND t3.inab001=sfhb003 AND t3.inab002=sfhb004  ",
               " LEFT JOIN oocal_t t4 ON t4.oocalent="||g_enterprise||" AND t4.oocal001=sfhb007 AND t4.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t5 ON t5.oocalent="||g_enterprise||" AND t5.oocal001=sfhb009 AND t5.oocal002='"||g_dlang||"' ",
 
                     " WHERE sfhbent=? AND sfhbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
                                                
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfhb_t.sfhbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
                                                
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt337_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt337_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sfha_m.sfhadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sfha_m.sfhadocno INTO g_sfhb_d[l_ac].sfhbseq,g_sfhb_d[l_ac].sfhb001, 
          g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb005, 
          g_sfhb_d[l_ac].sfhb006,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009, 
          g_sfhb_d[l_ac].sfhb010,g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012,g_sfhb_d[l_ac].sfhbsite, 
          g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb003_desc,g_sfhb_d[l_ac].sfhb004_desc,g_sfhb_d[l_ac].sfhb007_desc, 
          g_sfhb_d[l_ac].sfhb009_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         CALL s_desc_get_item_desc(g_sfhb_d[l_ac].sfhb001)
         RETURNING g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb001_desc1 
         
         CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb007)
         RETURNING g_sfhb_d[l_ac].sfhb007_desc

         CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb009)
         RETURNING g_sfhb_d[l_ac].sfhb009_desc
         
         CALL s_desc_get_stock_desc(g_site,g_sfhb_d[l_ac].sfhb003)
         RETURNING g_sfhb_d[l_ac].sfhb003_desc
         
         CALL s_desc_get_locator_desc(g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004)
         RETURNING g_sfhb_d[l_ac].sfhb004_desc
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
   IF asrt337_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfhcseq,sfhcseq1,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006, 
             sfhc007,sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite ,t6.imaal003 ,t7.inaa002 ,t8.inab003 , 
             t9.oocal003 ,t10.oocal003 FROM sfhc_t",   
                     " INNER JOIN  sfha_t ON sfhaent = " ||g_enterprise|| " AND sfhadocno = sfhcdocno ",
 
                     "",
                     
                                    " LEFT JOIN imaal_t t6 ON t6.imaalent="||g_enterprise||" AND t6.imaal001=sfhc001 AND t6.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inaa_t t7 ON t7.inaaent="||g_enterprise||" AND t7.inaasite=sfhcsite AND t7.inaa001=sfhc003  ",
               " LEFT JOIN inab_t t8 ON t8.inabent="||g_enterprise||" AND t8.inabsite=sfhcsite AND t8.inab001=sfhc003 AND t8.inab002=sfhc004  ",
               " LEFT JOIN oocal_t t9 ON t9.oocalent="||g_enterprise||" AND t9.oocal001=sfhc007 AND t9.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t10 ON t10.oocalent="||g_enterprise||" AND t10.oocal001=sfhc009 AND t10.oocal002='"||g_dlang||"' ",
 
                     " WHERE sfhcent=? AND sfhcdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
                                                
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfhc_t.sfhcseq,sfhc_t.sfhcseq1"
         
         #add-point:單身填充控制 name="b_fill.sql2"
                                                
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt337_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR asrt337_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_sfha_m.sfhadocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_sfha_m.sfhadocno INTO g_sfhb2_d[l_ac].sfhcseq,g_sfhb2_d[l_ac].sfhcseq1, 
          g_sfhb2_d[l_ac].sfhc001,g_sfhb2_d[l_ac].sfhc002,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004, 
          g_sfhb2_d[l_ac].sfhc005,g_sfhb2_d[l_ac].sfhc006,g_sfhb2_d[l_ac].sfhc007,g_sfhb2_d[l_ac].sfhc008, 
          g_sfhb2_d[l_ac].sfhc009,g_sfhb2_d[l_ac].sfhc010,g_sfhb2_d[l_ac].sfhc011,g_sfhb2_d[l_ac].sfhc012, 
          g_sfhb2_d[l_ac].sfhcsite,g_sfhb2_d[l_ac].sfhc001_desc,g_sfhb2_d[l_ac].sfhc003_desc,g_sfhb2_d[l_ac].sfhc004_desc, 
          g_sfhb2_d[l_ac].sfhc007_desc,g_sfhb2_d[l_ac].sfhc009_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         CALL s_desc_get_item_desc(g_sfhb2_d[l_ac].sfhc001)
         RETURNING g_sfhb2_d[l_ac].sfhc001_desc,g_sfhb2_d[l_ac].sfhc001_desc1

         CALL s_desc_get_unit_desc(g_sfhb2_d[l_ac].sfhc007)
         RETURNING g_sfhb2_d[l_ac].sfhc007_desc
	     
         CALL s_desc_get_unit_desc(g_sfhb2_d[l_ac].sfhc009)
         RETURNING g_sfhb2_d[l_ac].sfhc009_desc
         
         CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
         RETURNING g_sfhb2_d[l_ac].sfhc003_desc
         
         CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
         RETURNING g_sfhb2_d[l_ac].sfhc004_desc                                                                        
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
 
   #判斷是否填充
   IF asrt337_fill_chk(3) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body3.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT inaoseq,inaoseq1,inaoseq2,inao001,inao008,inao009,inao010,inao012, 
             inao000  FROM inao_t",   
                     " INNER JOIN  sfha_t ON sfhaent = " ||g_enterprise|| " AND sfhadocno = inaodocno ",
 
                     "",
                     
                     
                     " WHERE inaoent=? AND inaodocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body3.fill_sql"
         LET g_sql = g_sql," AND inao000 ='2' "
         #end add-point
         IF NOT cl_null(g_wc2_table3) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table3 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY inao_t.inaoseq,inao_t.inaoseq1,inao_t.inaoseq2,inao_t.inao000"
         
         #add-point:單身填充控制 name="b_fill.sql3"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt337_pb3 FROM g_sql
         DECLARE b_fill_cs3 CURSOR FOR asrt337_pb3
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs3 USING g_enterprise,g_sfha_m.sfhadocno   #(ver:78)
                                               
      FOREACH b_fill_cs3 USING g_enterprise,g_sfha_m.sfhadocno INTO g_sfhb4_d[l_ac].inaoseq,g_sfhb4_d[l_ac].inaoseq1, 
          g_sfhb4_d[l_ac].inaoseq2,g_sfhb4_d[l_ac].inao001,g_sfhb4_d[l_ac].inao008,g_sfhb4_d[l_ac].inao009, 
          g_sfhb4_d[l_ac].inao010,g_sfhb4_d[l_ac].inao012,g_sfhb4_d[l_ac].inao000   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill3.fill"
         CALL s_desc_get_item_desc(g_sfhb4_d[l_ac].inao001)
         RETURNING g_sfhb4_d[l_ac].inao001_1_desc,g_sfhb4_d[l_ac].inao001_1_desc1
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
   #150826-00008#6-b
   IF NOT cl_null(g_sfha_m.sfhadocno) THEN
      CALL s_lot_b_fill('2',g_site,'1',g_sfha_m.sfhadocno,'','0','1')
   END IF 
   #150826-00008#6-e
   #end add-point
   
   CALL g_sfhb_d.deleteElement(g_sfhb_d.getLength())
   CALL g_sfhb2_d.deleteElement(g_sfhb2_d.getLength())
   CALL g_sfhb4_d.deleteElement(g_sfhb4_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt337_pb
   FREE asrt337_pb2
 
   FREE asrt337_pb3
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sfhb_d.getLength()
      LET g_sfhb_d_mask_o[l_ac].* =  g_sfhb_d[l_ac].*
      CALL asrt337_sfhb_t_mask()
      LET g_sfhb_d_mask_n[l_ac].* =  g_sfhb_d[l_ac].*
   END FOR
   
   LET g_sfhb2_d_mask_o.* =  g_sfhb2_d.*
   FOR l_ac = 1 TO g_sfhb2_d.getLength()
      LET g_sfhb2_d_mask_o[l_ac].* =  g_sfhb2_d[l_ac].*
      CALL asrt337_sfhc_t_mask()
      LET g_sfhb2_d_mask_n[l_ac].* =  g_sfhb2_d[l_ac].*
   END FOR
   LET g_sfhb4_d_mask_o.* =  g_sfhb4_d.*
   FOR l_ac = 1 TO g_sfhb4_d.getLength()
      LET g_sfhb4_d_mask_o[l_ac].* =  g_sfhb4_d[l_ac].*
      CALL asrt337_inao_t_mask()
      LET g_sfhb4_d_mask_n[l_ac].* =  g_sfhb4_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt337_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM sfhb_t
       WHERE sfhbent = g_enterprise AND
         sfhbdocno = ps_keys_bak[1] AND sfhbseq = ps_keys_bak[2]
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
         CALL g_sfhb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
                                                
      #end add-point    
      DELETE FROM sfhc_t
       WHERE sfhcent = g_enterprise AND
             sfhcdocno = ps_keys_bak[1] AND sfhcseq = ps_keys_bak[2] AND sfhcseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
                                                
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfhb2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
                                                
      #end add-point    
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete3"
      
      #end add-point    
      DELETE FROM inao_t
       WHERE inaoent = g_enterprise AND
             inaodocno = ps_keys_bak[1] AND inaoseq = ps_keys_bak[2] AND inaoseq1 = ps_keys_bak[3] AND inaoseq2 = ps_keys_bak[4] AND inao000 = ps_keys_bak[5]
      #add-point:delete_b段刪除中 name="delete_b.m_delete3"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_sfhb4_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete3"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
                        
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt337_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO sfhb_t
                  (sfhbent,
                   sfhbdocno,
                   sfhbseq
                   ,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,g_sfhb_d[g_detail_idx].sfhb003, 
                       g_sfhb_d[g_detail_idx].sfhb004,g_sfhb_d[g_detail_idx].sfhb005,g_sfhb_d[g_detail_idx].sfhb006, 
                       g_sfhb_d[g_detail_idx].sfhb007,g_sfhb_d[g_detail_idx].sfhb008,g_sfhb_d[g_detail_idx].sfhb009, 
                       g_sfhb_d[g_detail_idx].sfhb010,g_sfhb_d[g_detail_idx].sfhb011,g_sfhb_d[g_detail_idx].sfhb012, 
                       g_sfhb_d[g_detail_idx].sfhbsite)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
                                                
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sfhb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
                                                
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
                                                
      #end add-point 
      INSERT INTO sfhc_t
                  (sfhcent,
                   sfhcdocno,
                   sfhcseq,sfhcseq1
                   ,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006,sfhc007,sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sfhb2_d[g_detail_idx].sfhc001,g_sfhb2_d[g_detail_idx].sfhc002,g_sfhb2_d[g_detail_idx].sfhc003, 
                       g_sfhb2_d[g_detail_idx].sfhc004,g_sfhb2_d[g_detail_idx].sfhc005,g_sfhb2_d[g_detail_idx].sfhc006, 
                       g_sfhb2_d[g_detail_idx].sfhc007,g_sfhb2_d[g_detail_idx].sfhc008,g_sfhb2_d[g_detail_idx].sfhc009, 
                       g_sfhb2_d[g_detail_idx].sfhc010,g_sfhb2_d[g_detail_idx].sfhc011,g_sfhb2_d[g_detail_idx].sfhc012, 
                       g_sfhb2_d[g_detail_idx].sfhcsite)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
                                                
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfhb2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
                                                
      #end add-point
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert3"
      
      #end add-point 
      INSERT INTO inao_t
                  (inaoent,
                   inaodocno,
                   inaoseq,inaoseq1,inaoseq2,inao000
                   ,inao001,inao008,inao009,inao010,inao012) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
                   ,g_sfhb4_d[g_detail_idx].inao001,g_sfhb4_d[g_detail_idx].inao008,g_sfhb4_d[g_detail_idx].inao009, 
                       g_sfhb4_d[g_detail_idx].inao010,g_sfhb4_d[g_detail_idx].inao012)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_sfhb4_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert3"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
                        
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt337_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfhb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
                                                
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt337_sfhb_t_mask_restore('restore_mask_o')
               
      UPDATE sfhb_t 
         SET (sfhbdocno,
              sfhbseq
              ,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012,sfhbsite) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,g_sfhb_d[g_detail_idx].sfhb003, 
                  g_sfhb_d[g_detail_idx].sfhb004,g_sfhb_d[g_detail_idx].sfhb005,g_sfhb_d[g_detail_idx].sfhb006, 
                  g_sfhb_d[g_detail_idx].sfhb007,g_sfhb_d[g_detail_idx].sfhb008,g_sfhb_d[g_detail_idx].sfhb009, 
                  g_sfhb_d[g_detail_idx].sfhb010,g_sfhb_d[g_detail_idx].sfhb011,g_sfhb_d[g_detail_idx].sfhb012, 
                  g_sfhb_d[g_detail_idx].sfhbsite) 
         WHERE sfhbent = g_enterprise AND sfhbdocno = ps_keys_bak[1] AND sfhbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
                                                
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfhb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfhb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt337_sfhb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
                                                
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfhc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
                                                
      #end add-point  
      
      #將遮罩欄位還原
      CALL asrt337_sfhc_t_mask_restore('restore_mask_o')
               
      UPDATE sfhc_t 
         SET (sfhcdocno,
              sfhcseq,sfhcseq1
              ,sfhc001,sfhc002,sfhc003,sfhc004,sfhc005,sfhc006,sfhc007,sfhc008,sfhc009,sfhc010,sfhc011,sfhc012,sfhcsite) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sfhb2_d[g_detail_idx].sfhc001,g_sfhb2_d[g_detail_idx].sfhc002,g_sfhb2_d[g_detail_idx].sfhc003, 
                  g_sfhb2_d[g_detail_idx].sfhc004,g_sfhb2_d[g_detail_idx].sfhc005,g_sfhb2_d[g_detail_idx].sfhc006, 
                  g_sfhb2_d[g_detail_idx].sfhc007,g_sfhb2_d[g_detail_idx].sfhc008,g_sfhb2_d[g_detail_idx].sfhc009, 
                  g_sfhb2_d[g_detail_idx].sfhc010,g_sfhb2_d[g_detail_idx].sfhc011,g_sfhb2_d[g_detail_idx].sfhc012, 
                  g_sfhb2_d[g_detail_idx].sfhcsite) 
         WHERE sfhcent = g_enterprise AND sfhcdocno = ps_keys_bak[1] AND sfhcseq = ps_keys_bak[2] AND sfhcseq1 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update2"
                                                
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfhc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfhc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt337_sfhc_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
                                                
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "inao_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update3"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL asrt337_inao_t_mask_restore('restore_mask_o')
               
      UPDATE inao_t 
         SET (inaodocno,
              inaoseq,inaoseq1,inaoseq2,inao000
              ,inao001,inao008,inao009,inao010,inao012) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
              ,g_sfhb4_d[g_detail_idx].inao001,g_sfhb4_d[g_detail_idx].inao008,g_sfhb4_d[g_detail_idx].inao009, 
                  g_sfhb4_d[g_detail_idx].inao010,g_sfhb4_d[g_detail_idx].inao012) 
         WHERE inaoent = g_enterprise AND inaodocno = ps_keys_bak[1] AND inaoseq = ps_keys_bak[2] AND inaoseq1 = ps_keys_bak[3] AND inaoseq2 = ps_keys_bak[4] AND inao000 = ps_keys_bak[5]
      #add-point:update_b段修改中 name="update_b.m_update3"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "inao_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt337_inao_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update3"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
                        
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt337_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt337.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt337_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt337.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt337_lock_b(ps_table,ps_page)
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
   #CALL asrt337_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sfhb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt337_bcl USING g_enterprise,
                                       g_sfha_m.sfhadocno,g_sfhb_d[g_detail_idx].sfhbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt337_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "sfhc_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt337_bcl2 USING g_enterprise,
                                             g_sfha_m.sfhadocno,g_sfhb2_d[g_detail_idx].sfhcseq,g_sfhb2_d[g_detail_idx].sfhcseq1 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt337_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
   #鎖定整組table
   #LET ls_group = "'3',"
   #僅鎖定自身table
   LET ls_group = "inao_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt337_bcl3 USING g_enterprise,
                                             g_sfha_m.sfhadocno,g_sfhb4_d[g_detail_idx].inaoseq,g_sfhb4_d[g_detail_idx].inaoseq1, 
                                                 g_sfhb4_d[g_detail_idx].inaoseq2,g_sfhb4_d[g_detail_idx].inao000 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt337_bcl3:",SQLERRMESSAGE 
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
 
{<section id="asrt337.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt337_unlock_b(ps_table,ps_page)
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
      CLOSE asrt337_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt337_bcl2
   END IF
 
   LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt337_bcl3
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
                        
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt337_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
                        
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sfhadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sfhadocno",TRUE)
      CALL cl_set_comp_entry("sfhadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
                                                
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("sfha006,sfha007",TRUE)      
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt337_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_sfaa061     LIKE sfaa_t.sfaa061                        
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sfhadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
                                                
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sfhadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sfhadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
#   SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t
#    WHERE sfaaent   = g_enterprise
#      AND sfaasite  = g_site
#      AND sfaadocno = g_sfha_m.sfha004
#      
#   
#   IF l_sfaa061 = 'N' THEN
#      LET g_sfha_m.sfha006 = ' '
#      LET g_sfha_m.sfha007 = ' '
#      LET g_sfha_m.sfha006_desc = NULL
#      DISPLAY BY NAME g_sfha_m.sfha006_desc
#      CALL cl_set_comp_entry("sfha006,sfha007",FALSE)              
#   END IF   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt337_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("sfhb002,sfhb004,sfhb005,sfhb006,sfhb009,sfhb010",TRUE)                     
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt337_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   DEFINE l_imaf055  LIKE imaf_t.imaf055
   DEFINE l_inaa007  LIKE inaa_t.inaa007
   DEFINE l_imaf061  LIKE imaf_t.imaf061    
   DEFINE l_imaa005  LIKE imaa_t.imaa005  
   DEFINE l_imea002  LIKE imea_t.imea002                          
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   #若設定imaf055(庫存管理特徵)等於'0.無'時，則[C:庫存管理特徵]欄位不可輸入
   SELECT imaf055,imaf061 INTO l_imaf055,l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imaf001 = g_sfhb_d[l_ac].sfhb001 AND imafsite = g_site
   IF l_imaf055 = '2' THEN
      CALL cl_set_comp_entry("sfhb006",FALSE)
      LET g_sfhb_d[l_ac].sfhb006 = ''
   END IF
   #[T:料件據點進銷存檔].[C:庫存批號控管]=2時,[C:批號]欄位不可輸入
   IF l_imaf061 = '2' THEN
      CALL cl_set_comp_entry("sfhb005",FALSE)
      LET g_sfhb_d[l_ac].sfhb005 = ''      
   END IF
   
   #若[T:庫位資料檔].[C:儲位管理]='5'(不使用儲位管理)時，則[C:限定儲位]不可以維護
   SELECT inaa007 INTO l_inaa007 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = g_sfhb_d[l_ac].sfhb003
   IF l_inaa007 = '5' THEN
      CALL cl_set_comp_entry("sfhb004",FALSE)
      LET g_sfhb_d[l_ac].sfhb004 = ' '
      LET g_sfhb_d[l_ac].sfhb004_desc = ''
   END IF
   
   
   #判斷料件是否存在產品特徵功能
   LET l_imaa005 = ''
   CALL asrt337_get_imaa005(g_enterprise,g_sfhb_d[l_ac].sfhb001) RETURNING l_imaa005
   IF cl_null(l_imaa005) THEN
      CALL cl_set_comp_entry("sfhb002",FALSE)
      LET g_sfhb_d[l_ac].sfhb002 = ' '
   END IF
   
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  ='N' THEN   
      LET g_sfhb_d[l_ac].sfhb009 = ''
      LET g_sfhb_d[l_ac].sfhb009_desc = ''
      LET g_sfhb_d[l_ac].sfhb010 = ''
      CALL cl_set_comp_entry("sfhb009,sfhb010",FALSE)
   END IF   
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt337_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt337_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_sfha_m.sfhastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt337_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
 
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt337_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt337_default_search()
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
      LET ls_wc = ls_wc, " sfhadocno = '", g_argv[01], "' AND "
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
 
         INITIALIZE g_wc2_table3 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "sfha_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfhb_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfhc_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "inao_t" 
                  LET g_wc2_table3 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
            OR NOT cl_null(g_wc2_table3)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
            END IF
 
            IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
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
#以上条件仅限于传入参数是当站下线单号的，我要的是来源单号+项次

   IF NOT cl_null(g_argv[1]) THEN
      LET ls_wc = NULL
      LET ls_wc = ls_wc, " sfha010 = '", g_argv[1], "' AND sfha011 = '",g_argv[2], "' "
   END IF
   
 
   
   IF NOT cl_null(ls_wc) THEN
#      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc = ls_wc
      LET g_default = TRUE
   ELSE
      LET g_default = FALSE
      #預設查詢條件
      LET g_wc = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc) THEN
         LET g_wc = " 1=1"
      END IF
   END IF
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asrt337_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5                     
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
#产生的报工单审核需要tmp表
   IF NOT s_asrt335_cre_tmp_table() THEN
      RETURN      
   END IF                          
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sfha_m.sfhadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asrt337_cl USING g_enterprise,g_sfha_m.sfhadocno
   IF STATUS THEN
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt337_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
       g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
       g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
       g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
       g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
   
 
   #檢查是否允許此動作
   IF NOT asrt337_action_chk() THEN
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha002_desc,g_sfha_m.sfhadocno_desc, 
       g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfha003_desc,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
       g_sfha_m.sfha012_desc,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha006_desc,g_sfha_m.sfha010, 
       g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004,g_sfha_m.sfha008, 
       g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha016_desc,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaownid_desc, 
       g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp, 
       g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamodid_desc,g_sfha_m.sfhamoddt, 
       g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc, 
       g_sfha_m.sfhapstdt
 
   CASE g_sfha_m.sfhastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_sfha_m.sfhastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
#将一些不能切换的状态给隐藏掉，比如post时只能切confimed，不可切unconfirmed和invalid 
         IF g_sfha_m.sfhastus = 'X' THEN
            CLOSE asrt337_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF
         
         HIDE OPTION "signing"
         HIDE OPTION "withdraw"
         HIDE OPTION "closed"
         HIDE OPTION "hold"
         
         CASE g_sfha_m.sfhastus
            WHEN "N"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "posted"
               HIDE OPTION "unposted"
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
               IF cl_bpm_chk() THEN
                  SHOW OPTION "signing"
                  HIDE OPTION "confirmed"
               END IF
            WHEN "X"
               HIDE OPTION "invalid"
               HIDE OPTION "confirmed"
               HIDE OPTION "posted"
               HIDE OPTION "unposted"               
               HIDE OPTION "hold"
            WHEN "Y"
               HIDE OPTION "confirmed"
               HIDE OPTION "invalid"
               HIDE OPTION "hold"
               HIDE OPTION "unposted"
            WHEN "S"
               HIDE OPTION "posted"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "invalid" 
               HIDE OPTION "confirmed"
            WHEN "R"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
            WHEN "D"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
            WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
                SHOW OPTION "withdraw"  
                HIDE OPTION "unconfirmed"
                HIDE OPTION "invalid"
                HIDE OPTION "confirmed"
                HIDE OPTION "hold"
            
            WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
                SHOW OPTION "confirmed" 
                HIDE OPTION "unconfirmed"
                HIDE OPTION "invalid"
                HIDE OPTION "hold"        
         END CASE                                                
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT asrt337_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt337_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT asrt337_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt337_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            IF NOT cl_ask_confirm('aim-00110') THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfha_m.sfhastus NOT MATCHES '[XY]' THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF         
            IF g_sfha_m.sfhastus = 'Y' THEN       
               IF NOT s_asrt337_unconf(g_sfha_m.sfhadocno) THEN
                  LET lc_state = "Y"
                  CALL s_transaction_end('N',0)
               ELSE
                  CALL s_transaction_end('Y',0)
                  CALL asrt337_refresh_stus()                  
               END IF
               CLOSE asrt337_cl
               RETURN                
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
#仅当状态为 N.未审核,才可以切换为Y.已审核
            IF NOT cl_ask_confirm('aim-00108') THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfha_m.sfhastus NOT MATCHES '[N]' THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF         
            IF g_sfha_m.sfhastus = 'N' THEN        
               IF NOT s_asrt337_conf_chk(g_sfha_m.sfhadocno) THEN
                  CALL s_transaction_end('N',0)
                  LET lc_state = "N"
               ELSE
                  IF NOT s_asrt337_conf(g_sfha_m.sfhadocno) THEN
                     CALL s_transaction_end('N',0)
                     LET lc_state = "N"
                  ELSE
                     CALL s_transaction_end('Y',0)  
                     CALL asrt337_refresh_stus()                  
                  END IF
               END IF
               CLOSE asrt337_cl
               RETURN                
            END IF
                                                                                
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
#过帐日期录入
         CALL s_asrt337_post_input(g_sfha_m.sfhadocno)
              RETURNING l_success,g_sfha_m.sfha001
         IF NOT l_success THEN
            LET lc_state = "Y"
            CLOSE asrt337_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF 
             
         CALL s_asrt337_post(g_sfha_m.sfhadocno,g_sfha_m.sfha001)
              RETURNING l_success
         IF NOT l_success THEN
            LET lc_state = "Y"
            CALL s_transaction_end('N',0)
         ELSE
            LET g_sfha_m.sfhastus = 'S'
            CALL s_transaction_end('Y',0)         
         END IF
         CLOSE asrt337_cl
         CALL s_asrt335_drop_tmp_table() 
         CALL asrt337_refresh_stus()            
         RETURN                                                                         
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
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
         LET lc_state = "Y"
         IF g_sfha_m.sfhastus = 'S' THEN     
            IF NOT s_asrt337_unpost(g_sfha_m.sfhadocno) THEN
               LET lc_state = "S"
               CALL s_transaction_end('N',0)
            ELSE
               LET g_sfha_m.sfhastus = 'Y'
               CALL s_transaction_end('Y',0)         
            END IF
            CLOSE asrt337_cl
            CALL s_asrt335_drop_tmp_table() 
            CALL asrt337_refresh_stus()
            RETURN           
         END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            IF NOT cl_ask_confirm('aim-00109') THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfha_m.sfhastus NOT MATCHES '[N]' THEN
               CLOSE asrt337_cl
               CALL s_transaction_end('N','0')
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
      AND lc_state <> "S"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "Z"
      AND lc_state <> "X"
      ) OR 
      g_sfha_m.sfhastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
                        
   #end add-point
   
   LET g_sfha_m.sfhamodid = g_user
   LET g_sfha_m.sfhamoddt = cl_get_current()
   LET g_sfha_m.sfhastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sfha_t 
      SET (sfhastus,sfhamodid,sfhamoddt) 
        = (g_sfha_m.sfhastus,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt)     
    WHERE sfhaent = g_enterprise AND sfhadocno = g_sfha_m.sfhadocno
 
    
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
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE asrt337_master_referesh USING g_sfha_m.sfhadocno INTO g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt, 
          g_sfha_m.sfha002,g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfhastus,g_sfha_m.sfhasite,g_sfha_m.sfha012, 
          g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.sfha007,g_sfha_m.sfha009, 
          g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha015,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp, 
          g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt, 
          g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt,g_sfha_m.sfha002_desc, 
          g_sfha_m.sfha003_desc,g_sfha_m.sfha012_desc,g_sfha_m.sfha006_desc,g_sfha_m.sfha016_desc,g_sfha_m.sfhaownid_desc, 
          g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhamodid_desc, 
          g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhapstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sfha_m.sfhadocno,g_sfha_m.sfhadocdt,g_sfha_m.sfha002,g_sfha_m.sfha002_desc,g_sfha_m.sfhadocno_desc, 
          g_sfha_m.sfha001,g_sfha_m.sfha003,g_sfha_m.sfha003_desc,g_sfha_m.sfhastus,g_sfha_m.sfhasite, 
          g_sfha_m.sfha012,g_sfha_m.sfha012_desc,g_sfha_m.sfha013,g_sfha_m.sfha006,g_sfha_m.sfha006_desc, 
          g_sfha_m.sfha010,g_sfha_m.sfha011,g_sfha_m.imaal003,g_sfha_m.sfha007,g_sfha_m.sfha009,g_sfha_m.imaal004, 
          g_sfha_m.sfha008,g_sfha_m.sfha014,g_sfha_m.sfha016,g_sfha_m.sfha016_desc,g_sfha_m.sfha015, 
          g_sfha_m.sfhaownid,g_sfha_m.sfhaownid_desc,g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid, 
          g_sfha_m.sfhacrtid_desc,g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid, 
          g_sfha_m.sfhamodid_desc,g_sfha_m.sfhamoddt,g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt, 
          g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc,g_sfha_m.sfhapstdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
                        
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
                        
   #end add-point  
 
   CLOSE asrt337_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt337_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt337.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt337_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
                        
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sfhb_d.getLength() THEN
         LET g_detail_idx = g_sfhb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfhb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfhb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_sfhb2_d.getLength() THEN
         LET g_detail_idx = g_sfhb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfhb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfhb2_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_sfhb4_d.getLength() THEN
         LET g_detail_idx = g_sfhb4_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfhb4_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfhb4_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
                        
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt337_b_fill2(pi_idx)
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
   
   CALL asrt337_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt337_fill_chk(ps_idx)
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
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1')  AND 
      (cl_null(g_wc2_table3) OR g_wc2_table3.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
                                                
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337.status_show" >}
PRIVATE FUNCTION asrt337_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt337.mask_functions" >}
&include "erp/asr/asrt337_mask.4gl"
 
{</section>}
 
{<section id="asrt337.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION asrt337_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success  LIKE type_t.num5
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
   LET g_wc2_table3 = " 1=1"
 
 
   CALL asrt337_show()
   CALL asrt337_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_asrt337_conf_chk(g_sfha_m.sfhadocno) RETURNING l_success
   IF NOT l_success THEN
      CLOSE asrt337_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sfha_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_sfhb_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_sfhb2_d))
   CALL cl_bpm_set_detail_data("s_detail4", util.JSONArray.fromFGL(g_sfhb4_d))
 
 
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
   #CALL asrt337_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt337_ui_headershow()
   CALL asrt337_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION asrt337_draw_out()
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
   CALL asrt337_ui_headershow()  
   CALL asrt337_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="asrt337.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt337_set_pk_array()
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
   LET g_pk_array[1].values = g_sfha_m.sfhadocno
   LET g_pk_array[1].column = 'sfhadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt337.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt337.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt337_msgcentre_notify(lc_state)
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
   CALL asrt337_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sfha_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt337.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt337_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#37-s
   SELECT sfhastus INTO g_sfha_m.sfhastus FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfhasite = g_site
      AND sfhadocno = g_sfha_m.sfhadocno
   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_sfha_m.sfhastus
        WHEN 'W'
           LET g_errno = 'sub-01347'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
        WHEN 'Z'
           LET g_errno = 'sub-01351'

     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_sfha_m.sfhadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL asrt337_set_act_visible()
        CALL asrt337_set_act_no_visible()
        CALL asrt337_show()
        RETURN FALSE
     END IF
   END IF      
   #160818-00017#37-e
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 检查料件，与杂收单检查料号逻辑相同
# Memo...........:
# Usage..........: CALL asrt337_chk_sfhb001(p_sfhb002)
#                  RETURNING r_success
# Input parameter: p_sfhb001      料号
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/03/13 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_chk_sfhb001(p_sfhb001)
   DEFINE p_sfhb001        LIKE sfhb_t.sfhb001
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_flag           LIKE type_t.num5
   DEFINE l_slip           LIKE ooba_t.ooba002
    
      LET r_success = TRUE
      
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL

      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = p_sfhb001

      #呼叫檢查存在的library
      IF NOT cl_chk_exist("v_imaa001") THEN
         LET r_success = FALSE
         RETURN r_success  
      END IF   

      #制程中间下线的半成品料件不能与单头最终成品的生产料件相同
      IF p_sfhb001 = g_sfha_m.sfha013 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00156'
         LET g_errparam.extend = p_sfhb001
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success  
      END IF
      
      
      
      #呼叫s_control_doc_chk('4',sfhbdocno,sfhb001,'','','','')應用元件，
      #檢核輸入的料件的生命週期是否在單據別限制範圍內，若不在限制內則不允許雜收此料
      CALL s_aooi200_get_slip(g_sfha_m.sfhadocno)
      RETURNING l_success,l_slip
      CALL s_control_chk_doc('4',l_slip,p_sfhb001,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ain-00015'
            LET g_errparam.extend = p_sfhb001
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      
      #呼叫s_control_doc_chk('5',sfhbdocno,sfhb004,'','','','')應用元件，
      #檢核輸入的料件的產品分類是否在單據別限制範圍內，若不在限制內則不允許雜收此料
      CALL s_control_chk_doc('5',l_slip,p_sfhb001,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'apm-00238'
            LET g_errparam.extend = p_sfhb001
            LET g_errparam.popup = TRUE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      

      
#      #[C:庫位]有值時，需呼叫應用元件取得該庫位是否有設置在庫存控制組中，
#      #若有時需判斷該控制組是否與其他項次的庫位所對應的控制組一樣
#      #若不一樣則需訊息告知，並將游標跳到[C:庫位]欄位供修改
#      IF NOT cl_null(g_sfhb_d[l_ac].sfhb007) AND l_ac > 1 THEN
#
#      END IF
      
      RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 取得產品特徵類別
# Memo...........:
# Usage..........: CALL asrt337_get_imaa005(p_enterprise,p_imaa001)
#                  RETURNING r_imaa005
# Input parameter: p_enterprise   企業編號
#                : p_imaa001      料號
# Return code....: r_imaa005      特徵類別
# Date & Author..: 2014/03/14 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_get_imaa005(p_enterprise,p_imaa001)
   DEFINE p_enterprise   LIKE type_t.num5,
          p_imaa001      LIKE imaa_t.imaa001
   DEFINE r_imaa005      LIKE imaa_t.imaa005

   LET r_imaa005 = ''
   SELECT imaa005 INTO r_imaa005 
     FROM imaa_t 
    WHERE imaaent = p_enterprise 
      AND imaa001 = p_imaa001
      
   RETURN r_imaa005  
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
# Date & Author..: 2014/03/17 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_set_required_b()
   DEFINE l_imaf055  LIKE imaf_t.imaf055
   DEFINE l_imaf056  LIKE imaf_t.imaf056
   DEFINE l_imaf061  LIKE imaf_t.imaf061

#以下都是根据料号在控制
   SELECT imaf055,imaf056,imaf061 INTO l_imaf055,l_imaf056,l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_sfhb_d[l_ac].sfhb001
   IF l_imaf055 = '1' THEN
      CALL cl_set_comp_required("sfhb006",TRUE)
   END IF
#料号设置的批号控制
   IF l_imaf061 = '1' THEN
      CALL cl_set_comp_required("sfhb005",TRUE)
   END IF
   
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN  
      CALL cl_set_comp_required("sfhb009,sfhb010",TRUE)
   END IF
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
# Date & Author..: 2014/03/17 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_set_no_required_b()
   CALL cl_set_comp_required("sfhb005,sfhb006,sfhb009,sfhb010",FALSE)
END FUNCTION
################################################################################
# Descriptions...: 料件带出预设的仓库,储位,单位，参考单位，有效日期
# Memo...........:
# Usage..........: CALL asrt337_warehouse_default(p_sfhb001)
#                  RETURNING r_sfhb003,r_sfhb004
# Input parameter: p_sfhb001      料件
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_sfhb003      库位
#                : r_sfhb004      储位
#                : r_sfhb007      单位
#                : r_sfhb009      参考单位
#                : r_sfhb011      有效日期
# Date & Author..: 2014/03/17 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_warehouse_default(p_sfhb001)
   DEFINE p_sfhb001      LIKE sfhb_t.sfhb001
   DEFINE r_sfhb003      LIKE sfhb_t.sfhb003
   DEFINE r_sfhb004      LIKE sfhb_t.sfhb004
   DEFINE r_sfhb007      LIKE sfhb_t.sfhb007
   DEFINE r_sfhb009      LIKE sfhb_t.sfhb009
   DEFINE r_sfhb011      LIKE sfhb_t.sfhb011
   DEFINE l_imaf061      LIKE imaf_t.imaf061
   DEFINE l_imaf032      LIKE imaf_t.imaf032
   
   SELECT imaf091,imaf092,imaf015,imaf061 INTO r_sfhb003,r_sfhb004,r_sfhb009,l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = p_sfhb001
   SELECT imaa006 INTO r_sfhb007 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = p_sfhb001
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'N' THEN   
      LET r_sfhb009 =''
   END IF
   LET r_sfhb011 = NULL
   IF l_imaf061 = '1' THEN
      LET r_sfhb011 = cl_get_today()
      SELECT imaf032 INTO l_imaf032 
        FROM imaf_t 
       WHERE imafent  = g_enterprise 
         AND imafsite = g_site
         AND imaf001  = p_sfhb001
      IF NOT cl_null(l_imaf032) THEN
         LET r_sfhb011 = r_sfhb011 + l_imaf032
      END IF
      
   END IF
   IF r_sfhb009 IS NULL THEN LET r_sfhb009 = r_sfhb007 END IF
   RETURN r_sfhb003,r_sfhb004,r_sfhb007,r_sfhb009,r_sfhb011
END FUNCTION
################################################################################
# Descriptions...: 检查单位是否存在档案以及与料件基础单位有无换算关系
# Memo...........:
# Usage..........: CALL asrt337_chk_unit(p_item,p_unit)
#                  RETURNING r_success
# Input parameter: p_item         料件
#                : p_unit         单位
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/03/17 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_chk_unit(p_item,p_unit)
   DEFINE p_item     LIKE sfhb_t.sfhb001
   DEFINE p_unit     LIKE sfhb_t.sfhb007
   DEFINE r_success  LIKE type_t.num5
   

   LET r_success = TRUE
   IF p_item IS NULL OR p_unit IS NULL THEN RETURN r_success END IF
   
#此段落由子樣板a19產生
   #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
   #設定g_chkparam.*的參數
   LET g_chkparam.arg1 = p_unit
   LET g_chkparam.err_str[1] = "aim-00005:sub-01302|aooi250|",cl_get_progname("aooi250",g_lang,"2"),"|:EXEPROGaooi250"  #160318-00025#34  add
      
   #呼叫檢查存在並帶值的library
   IF cl_chk_exist("v_ooca001") THEN
      #檢查成功時後續處理
      #LET  = g_chkparam.return1
      #DISPLAY BY NAME 

   ELSE
      #檢查失敗時後續處理
      LET r_success = FALSE
      RETURN r_success
   END IF

#检查传入单位与料件基础单位的换算关系
   LET r_success = s_aimi190_chk_base_convert(p_item,p_unit)
   
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_set_required()
#   DEFINE l_sfaa061     LIKE sfaa_t.sfaa061
#   
#   SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t
#    WHERE sfaaent   = g_enterprise
#      AND sfaasite  = g_site
#      AND sfaadocno = g_sfha_m.sfha004
#      
#   
#   IF l_sfaa061 = 'Y' THEN
#      CALL cl_set_comp_required("sfha006,sfha007",TRUE)              
#   END IF
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
PRIVATE FUNCTION asrt337_set_no_required()
   CALL cl_set_comp_required("sfha006,sfha007",FALSE)
END FUNCTION

################################################################################
# Descriptions...: 根据产品特征组合产生多笔sfhb
# Memo...........:
# Usage..........: CALL asrt337_ins_sfhb_multi(p_sfhb,p_inam)
#                  RETURNING r_success
# Input parameter: p_sfhb         申请入库单身
#                : p_inam         产品特征组合结果
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/05/16 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_ins_sfhb_multi(p_sfhb,p_inam)
   DEFINE p_sfhb                type_g_sfhb_d
   DEFINE r_success             LIKE type_t.num5
#   DEFINE l_sfhb                RECORD LIKE sfhb_t.*   #161124-00048#12 mark
  #161124-00048#12 add-s
   DEFINE l_sfhb RECORD  #工單當站下線入庫申請檔
       sfhbent LIKE sfhb_t.sfhbent, #企业编号
       sfhbsite LIKE sfhb_t.sfhbsite, #营运据点
       sfhbdocno LIKE sfhb_t.sfhbdocno, #单号
       sfhbseq LIKE sfhb_t.sfhbseq, #项次
       sfhb001 LIKE sfhb_t.sfhb001, #料件编号
       sfhb002 LIKE sfhb_t.sfhb002, #产品特征
       sfhb003 LIKE sfhb_t.sfhb003, #库位
       sfhb004 LIKE sfhb_t.sfhb004, #储位
       sfhb005 LIKE sfhb_t.sfhb005, #批号
       sfhb006 LIKE sfhb_t.sfhb006, #库存管理特征
       sfhb007 LIKE sfhb_t.sfhb007, #单位
       sfhb008 LIKE sfhb_t.sfhb008, #数量
       sfhb009 LIKE sfhb_t.sfhb009, #参考单位
       sfhb010 LIKE sfhb_t.sfhb010, #参考数量
       sfhb011 LIKE sfhb_t.sfhb011, #生效日期
       sfhb012 LIKE sfhb_t.sfhb012  #存货备注
  END RECORD
  #161124-00048#12 add-e
   DEFINE p_inam                DYNAMIC ARRAY OF RECORD   #記錄產品特徵
             inam001            LIKE inam_t.inam001,
             inam002            LIKE inam_t.inam002,
             inam004            LIKE inam_t.inam004
                        END RECORD   
   DEFINE i                     LIKE type_t.num5
   DEFINE l_cnt                 LIKE type_t.num5

   LET r_success = TRUE
   LET i = 0
   LET l_cnt = 0
   INITIALIZE l_sfhb.* TO NULL
   
   LET l_sfhb.sfhbent   = g_enterprise  
   LET l_sfhb.sfhbsite  = g_site 
   LET l_sfhb.sfhbdocno = g_sfha_m.sfhadocno 
   LET l_sfhb.sfhb001   = p_sfhb.sfhb001   
   LET l_sfhb.sfhb003   = p_sfhb.sfhb003  
   LET l_sfhb.sfhb004   = p_sfhb.sfhb004  
   LET l_sfhb.sfhb005   = p_sfhb.sfhb005  
   LET l_sfhb.sfhb006   = p_sfhb.sfhb006  
   LET l_sfhb.sfhb007   = p_sfhb.sfhb007    
   LET l_sfhb.sfhb009   = p_sfhb.sfhb009    
   LET l_sfhb.sfhb011   = p_sfhb.sfhb011  
   LET l_sfhb.sfhb012   = p_sfhb.sfhb012 
#当前入库申请单身最大项次
   SELECT MAX(sfhbseq) INTO l_cnt
     FROM sfhb_t
    WHERE sfhbent   = g_enterprise 
      AND sfhbdocno = g_sfha_m.sfhadocno 
      
   FOR i = 2 TO p_inam.getlength()
       LET l_sfhb.sfhbseq = l_cnt + 1
       LET l_sfhb.sfhb002 = p_inam[i].inam002
       LET l_sfhb.sfhb008 = p_inam[i].inam004 
       LET l_sfhb.sfhb010 = s_asrt337_get_sfhb010_default(l_sfhb.sfhb001,l_sfhb.sfhb007,l_sfhb.sfhb008,l_sfhb.sfhb009,0)
       LET l_cnt = l_cnt + 1

#      INSERT INTO sfhb_t VALUES (l_sfhb.*) #161124-00048#12 mark
      #161124-00048#12 add-s
      INSERT INTO sfhb_t(sfhbent,sfhbsite,sfhbdocno,sfhbseq,sfhb001,sfhb002,sfhb003,
                         sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012)
                 VALUES (l_sfhb.sfhbent,l_sfhb.sfhbsite,l_sfhb.sfhbdocno,l_sfhb.sfhbseq,l_sfhb.sfhb001,l_sfhb.sfhb002,l_sfhb.sfhb003,
                         l_sfhb.sfhb004,l_sfhb.sfhb005,l_sfhb.sfhb006,l_sfhb.sfhb007,l_sfhb.sfhb008,l_sfhb.sfhb009,l_sfhb.sfhb010,l_sfhb.sfhb011,l_sfhb.sfhb012)
      #161124-00048#12 add-e
      
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.extend = 'ins_sfhb_mutli'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF 
#只有p_sfhb的字段格式和个数对应单身，所以用p_sfhb传入
      LET p_sfhb.sfhbseq = l_sfhb.sfhbseq
      LET p_sfhb.sfhb002 = l_sfhb.sfhb002
      LET p_sfhb.sfhb008 = l_sfhb.sfhb008
      LET p_sfhb.sfhb010 = l_sfhb.sfhb010
      IF NOT s_asrt337_ins_sfhc(g_sfha_m.sfhadocno,p_sfhb.sfhbseq,p_sfhb.*) THEN    #联动插入第二个单身，入库明细   #150826-00008#6
         LET r_success = FALSE
         RETURN r_success
      END IF      
   END FOR 
   
  
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt337_refresh_stus()
       SELECT DISTINCT sfhastus,sfhaownid,sfhaowndp,sfhacrtid,sfhacrtdp,
                       sfhacrtdt,sfhamodid,sfhamoddt,sfhacnfid,sfhacnfdt,sfhapstid,sfhapstdt
         INTO g_sfha_m.sfhastus,g_sfha_m.sfhaownid,g_sfha_m.sfhaowndp,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtdp,
              g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamoddt,g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstdt
         
         FROM sfha_t
        WHERE sfhaent   = g_enterprise
          AND sfhadocno = g_sfha_m.sfhadocno
       
       LET g_sfha_m.sfhaownid_desc = s_desc_get_person_desc(g_sfha_m.sfhaownid)
       LET g_sfha_m.sfhacrtid_desc = s_desc_get_person_desc(g_sfha_m.sfhacrtid)
       LET g_sfha_m.sfhamodid_desc = s_desc_get_person_desc(g_sfha_m.sfhamodid)
       LET g_sfha_m.sfhacnfid_desc = s_desc_get_person_desc(g_sfha_m.sfhacnfid)
       LET g_sfha_m.sfhapstid_desc = s_desc_get_person_desc(g_sfha_m.sfhapstid)
       
       LET g_sfha_m.sfhaowndp_desc = s_desc_get_department_desc(g_sfha_m.sfhaowndp)
       LET g_sfha_m.sfhacrtdp_desc = s_desc_get_department_desc(g_sfha_m.sfhacrtdp)
 
       CASE g_sfha_m.sfhastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
          
       END CASE 
       
       DISPLAY BY NAME
       g_sfha_m.sfhastus,g_sfha_m.sfhaownid,
       g_sfha_m.sfhaownid_desc,g_sfha_m.sfhaowndp,g_sfha_m.sfhaowndp_desc,g_sfha_m.sfhacrtid,g_sfha_m.sfhacrtid_desc, 
       g_sfha_m.sfhacrtdp,g_sfha_m.sfhacrtdp_desc,g_sfha_m.sfhacrtdt,g_sfha_m.sfhamodid,g_sfha_m.sfhamodid_desc, 
       g_sfha_m.sfhamoddt,g_sfha_m.sfhacnfid,g_sfha_m.sfhacnfid_desc,g_sfha_m.sfhacnfdt,g_sfha_m.sfhapstid,g_sfha_m.sfhapstid_desc,g_sfha_m.sfhapstdt
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
PRIVATE FUNCTION asrt337_inao_b_fill()
   DEFINE l_sql     STRING
   DEFINE l_ac1     LIKE type_t.num5
   
   
   LET l_sql = " SELECT inao000,inao013,inaodocno,inaoseq,inaoseq2, ",
               "        inao001,'','',inao008,inao009,inao012,inao010,inao011 ",
               "   FROM inao_t ",
               "  WHERE inaoent = '",g_enterprise,"' AND inaosite = '",g_site,"' ",
               "    AND inaodocno = '",g_sfha_m.sfhadocno,"' ",
               "    AND inao000 = '1' AND inao013 = '1' "
               
   LET l_sql = l_sql," ORDER BY inao000,inao013,inaodocno,inaoseq,inaoseq2 "
   PREPARE asrt337_inaosel_pb FROM l_sql
   DECLARE asrt337_inaosel_cs CURSOR FOR asrt337_inaosel_pb 
   
   CALL g_inao_d.clear()
   LET g_cnt = l_ac1
   LET l_ac1 = 1
   FOREACH asrt337_inaosel_cs INTO g_inao_d[l_ac1].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      #料號說明
      INITIALIZE g_ref_fields TO NULL 
      LET g_ref_fields[1] = g_inao_d[l_ac1].inao001
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_inao_d[l_ac1].inao001_desc = '', g_rtn_fields[1] , '' 
      DISPLAY BY NAME g_inao_d[l_ac1].inao001_desc

      INITIALIZE g_ref_fields TO NULL 
      LET g_ref_fields[1] = g_inao_d[l_ac1].inao001
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_inao_d[l_ac1].inao001_desc_desc = '', g_rtn_fields[1] , '' 
      DISPLAY BY NAME g_inao_d[l_ac1].inao001_desc_desc
      
      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = FALSE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   
   CALL g_inao_d.deleteElement(g_inao_d.getLength())   
   LET g_cnt = 0
   CLOSE asrt337_inaosel_cs
   FREE asrt337_inaosel_pb

END FUNCTION
################################################################################
#新增制造批序号异动资料
# 150826-00008#6
################################################################################
PRIVATE FUNCTION asrt340_ins_inao()
DEFINE  l_sql       STRING
#DEFINE  l_inao      RECORD LIKE inao_t.* #161124-00048#12 mark
#161124-00048#12 add-s
DEFINE l_inao RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企业编号
       inaosite LIKE inao_t.inaosite, #营运据点
       inaodocno LIKE inao_t.inaodocno, #单号
       inaoseq LIKE inao_t.inaoseq, #项次
       inaoseq1 LIKE inao_t.inaoseq1, #项序
       inaoseq2 LIKE inao_t.inaoseq2, #序号
       inao000 LIKE inao_t.inao000, #数据类型
       inao001 LIKE inao_t.inao001, #料件编号
       inao002 LIKE inao_t.inao002, #产品特征
       inao003 LIKE inao_t.inao003, #库存管理特征
       inao004 LIKE inao_t.inao004, #包装容器编号
       inao005 LIKE inao_t.inao005, #库位
       inao006 LIKE inao_t.inao006, #储位
       inao007 LIKE inao_t.inao007, #批号
       inao008 LIKE inao_t.inao008, #制造批号
       inao009 LIKE inao_t.inao009, #制造序号
       inao010 LIKE inao_t.inao010, #制造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #数量
       inao013 LIKE inao_t.inao013, #出入库码
       inao014 LIKE inao_t.inao014, #库存单位
       inao020 LIKE inao_t.inao020, #检验合格量
       inao021 LIKE inao_t.inao021, #已入库/出货/签收量
       inao022 LIKE inao_t.inao022, #已验退/签退量
       inao023 LIKE inao_t.inao023, #已仓退/销退量
       inao024 LIKE inao_t.inao024, #已转QC量
       inao025 LIKE inao_t.inao025  #已退品量
END RECORD
#161124-00048#12 add-e
DEFINE  r_success   LIKE type_t.num5

   #先刪除實際資料
   DELETE FROM inao_t
    WHERE inaodocno = g_sfha_m.sfhadocno
      AND inaosite = g_site
      AND inaoseq = g_sfhb_d[g_detail_idx].sfhbseq
      AND inao000 = '2'
      AND inaoent = g_enterprise #160905-00007#15 by 08172
#   LET l_sql = "SELECT * FROM inao_t ",  #161124-00048#12 mark
   #161124-00048#12 add-s
   LET l_sql = "SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,",
               "       inao001,inao002,inao003,inao004,inao005,inao006,inao007,inao008,",
               "       inao009,inao010,inao011,inao012,inao013,inao014,inao020,inao021,",
               "       inao022,inao023,inao024,inao025 FROM inao_t ",
   #161124-00048#12 add-e
               " WHERE inaodocno = '",g_sfha_m.sfhadocno,"'",
               "   AND inaoseq = ",g_sfhb_d[g_detail_idx].sfhbseq,
               "   AND inao000 = '1' "

   PREPARE asrt340_inao_pre FROM l_sql
   DECLARE asrt340_inao_ins CURSOR FOR asrt340_inao_pre

   LET r_success = TRUE
   FOREACH asrt340_inao_ins INTO l_inao.*
      LET l_inao.inao000 = '2'
      LET l_inao.inaoseq1 = 1
      INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,inao004,inao005,inao006,
                          inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,inao020,inao021,inao022,inao023,inao024)
                  VALUES (g_enterprise,g_site,l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1,l_inao.inaoseq2,l_inao.inao000,
                          l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                          l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,l_inao.inao014,l_inao.inao020,l_inao.inao021,
                          l_inao.inao022,l_inao.inao023,l_inao.inao024)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH
   RETURN r_success
END FUNCTION

 
{</section>}
 
