#該程式未解開Section, 採用最新樣板產出!
{<section id="astt320.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0035(2016-10-27 17:21:37), PR版次:0035(2016-11-22 15:14:54)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000150
#+ Filename...: astt320
#+ Description: 供應商費用單維護作業
#+ Creator....: 03247(2014-11-20 17:48:12)
#+ Modifier...: 08172 -SD/PR- 02481
 
{</section>}
 
{<section id="astt320.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#34   2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#+ Modifier...:   No.160728-00017#1    2016/08/10 by 08172    BPM审核修改
#+ Modifier...:   No.160816-00068#1    2015/08/18 By earl     調整transaction
#+ Modifier...:   No.160905-00007#6    2016/09/05 By 02599    SQL条件增加ent
#160818-00017#38 2016-08-23 By 08734 删除修改未重新判断状态码
#160913-00034#4  2016/09/14 by 08172 q_pmaa001開窗修改
#161024-00025#4  2016/10/24 by 08172       组织调整
#161024-00025#2  2016/10/25 By dongsz  stbb031开窗改为q_ooef001_24
#161024-00025#3  2016/10/26 By dongsz  stbbsite开窗替换q_ooef001_24
#160824-00007#181 2016/11/14   By 06137   修正舊值備份寫法
#161115-00015#1   2016/11/15   by 08172   来源类型不等于1的费用单不能修改/删除
#161111-00028#5   2016/11/22   by 02481       标准程式定义采用宣告模式,弃用.*写法
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
PRIVATE type type_g_stba_m        RECORD
       stbaunit LIKE stba_t.stbaunit, 
   stbaunit_desc LIKE type_t.chr80, 
   stbadocdt LIKE stba_t.stbadocdt, 
   stbadocno LIKE stba_t.stbadocno, 
   stba002 LIKE stba_t.stba002, 
   stba002_desc LIKE type_t.chr80, 
   stba013 LIKE stba_t.stba013, 
   stba013_desc LIKE type_t.chr80, 
   stba010 LIKE stba_t.stba010, 
   stba000 LIKE stba_t.stba000, 
   stba003 LIKE stba_t.stba003, 
   stba005 LIKE stba_t.stba005, 
   stba005_desc LIKE type_t.chr80, 
   stba004 LIKE stba_t.stba004, 
   stba004_desc LIKE type_t.chr80, 
   stba014 LIKE stba_t.stba014, 
   stba015 LIKE stba_t.stba015, 
   stba016 LIKE stba_t.stba016, 
   stbastus LIKE stba_t.stbastus, 
   stba006 LIKE stba_t.stba006, 
   stba007 LIKE stba_t.stba007, 
   stba001 LIKE stba_t.stba001, 
   stba001_desc LIKE type_t.chr80, 
   stba022 LIKE stba_t.stba022, 
   stba022_desc LIKE type_t.chr80, 
   stba025 LIKE stba_t.stba025, 
   stbasite LIKE stba_t.stbasite, 
   stba026 LIKE stba_t.stba026, 
   stba011 LIKE stba_t.stba011, 
   stba011_desc LIKE type_t.chr80, 
   stba012 LIKE stba_t.stba012, 
   stba012_desc LIKE type_t.chr80, 
   l_amount1 LIKE type_t.num20_6, 
   stba008 LIKE stba_t.stba008, 
   stba008_desc LIKE type_t.chr80, 
   stba009 LIKE stba_t.stba009, 
   stba009_desc LIKE type_t.chr80, 
   stbaownid LIKE stba_t.stbaownid, 
   stbaownid_desc LIKE type_t.chr80, 
   stbaowndp LIKE stba_t.stbaowndp, 
   stbaowndp_desc LIKE type_t.chr80, 
   stbacrtid LIKE stba_t.stbacrtid, 
   stbacrtid_desc LIKE type_t.chr80, 
   stbacrtdp LIKE stba_t.stbacrtdp, 
   stbacrtdp_desc LIKE type_t.chr80, 
   stbacrtdt LIKE stba_t.stbacrtdt, 
   stbamodid LIKE stba_t.stbamodid, 
   stbamodid_desc LIKE type_t.chr80, 
   stbamoddt LIKE stba_t.stbamoddt, 
   stbacnfid LIKE stba_t.stbacnfid, 
   stbacnfid_desc LIKE type_t.chr80, 
   stbacnfdt LIKE stba_t.stbacnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stbb_d        RECORD
       stbbseq LIKE stbb_t.stbbseq, 
   stbb001 LIKE stbb_t.stbb001, 
   stbb001_desc LIKE type_t.chr500, 
   stbb030 LIKE stbb_t.stbb030, 
   stbb031 LIKE stbb_t.stbb031, 
   stbb031_desc LIKE type_t.chr500, 
   stbb015 LIKE stbb_t.stbb015, 
   stbb016 LIKE stbb_t.stbb016, 
   stae003 LIKE type_t.chr10, 
   stae003_desc LIKE type_t.chr500, 
   stae004 LIKE type_t.chr10, 
   stbb002 LIKE stbb_t.stbb002, 
   stbb002_desc LIKE type_t.chr500, 
   stbb003 LIKE stbb_t.stbb003, 
   stbb003_desc LIKE type_t.chr500, 
   stbb004 LIKE stbb_t.stbb004, 
   stbb005 LIKE stbb_t.stbb005, 
   stbb006 LIKE stbb_t.stbb006, 
   stbb007 LIKE stbb_t.stbb007, 
   stbb008 LIKE stbb_t.stbb008, 
   stbb014 LIKE stbb_t.stbb014, 
   stbb019 LIKE stbb_t.stbb019, 
   stbb009 LIKE stbb_t.stbb009, 
   stbb010 LIKE stbb_t.stbb010, 
   stbb013 LIKE stbb_t.stbb013, 
   stbbsite LIKE stbb_t.stbbsite, 
   stbbsite_desc LIKE type_t.chr500, 
   stbb012 LIKE stbb_t.stbb012, 
   stbb011 LIKE stbb_t.stbb011, 
   stbb017 LIKE stbb_t.stbb017, 
   stbbunit LIKE stbb_t.stbbunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stbadocno LIKE stba_t.stbadocno,
      b_stbadocdt LIKE stba_t.stbadocdt,
      b_stbaunit LIKE stba_t.stbaunit,
   b_stbaunit_desc LIKE type_t.chr80,
      b_stba001 LIKE stba_t.stba001,
   b_stba001_desc LIKE type_t.chr80,
      b_stba002 LIKE stba_t.stba002,
   b_stba002_desc LIKE type_t.chr80,
   b_stbb009 LIKE stbb_t.stbb009
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_type               LIKE type_t.chr1   #'1'時代表是 astt320 '2'時代表是 astt322  '4' 代表astt810
DEFINE g_errno              LIKE type_t.chr100
DEFINE g_stbe002_def_flag   LIKE type_t.chr1   #160511-00034#1 160510 by lori add
DEFINE g_stbe010_def_flag   LIKE type_t.chr1   #160511-00034#1 160510 by lori add
DEFINE g_stba013_def_flag   LIKE type_t.chr1   #160511-00034#1 160510 by lori add  #160518-00077#1 160518 lori rename
#add by geza 20150801(S)
 TYPE type_g_stbb2_d RECORD
       stbpseq LIKE stbp_t.stbpseq, 
   stbp001 LIKE stbp_t.stbp001, 
   stbp002 LIKE stbp_t.stbp002, 
   stbp003 LIKE stbp_t.stbp003, 
   stbp004 LIKE stbp_t.stbp004, 
   stbp005 LIKE stbp_t.stbp005, 
   stbp006 LIKE stbp_t.stbp006, 
   stbp007 LIKE stbp_t.stbp007, 
   stbp008 LIKE stbp_t.stbp008, 
   stbp009 LIKE stbp_t.stbp009
       END RECORD

DEFINE g_stbb2_d          DYNAMIC ARRAY OF type_g_stbb2_d
DEFINE g_stbb2_d_t        type_g_stbb2_d
DEFINE g_stbb2_d_o        type_g_stbb2_d
DEFINE g_stbb2_d_mask_o   DYNAMIC ARRAY OF type_g_stbb2_d #轉換遮罩前資料
DEFINE g_stbb2_d_mask_n   DYNAMIC ARRAY OF type_g_stbb2_d #轉換遮罩後資料       
DEFINE g_wc2_table2       STRING       
#add by geza 20150801(E)
DEFINE g_site_flag    LIKE type_t.num5   #161024-00025#4 by 08172
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stba_m          type_g_stba_m
DEFINE g_stba_m_t        type_g_stba_m
DEFINE g_stba_m_o        type_g_stba_m
DEFINE g_stba_m_mask_o   type_g_stba_m #轉換遮罩前資料
DEFINE g_stba_m_mask_n   type_g_stba_m #轉換遮罩後資料
 
   DEFINE g_stbadocno_t LIKE stba_t.stbadocno
 
 
DEFINE g_stbb_d          DYNAMIC ARRAY OF type_g_stbb_d
DEFINE g_stbb_d_t        type_g_stbb_d
DEFINE g_stbb_d_o        type_g_stbb_d
DEFINE g_stbb_d_mask_o   DYNAMIC ARRAY OF type_g_stbb_d #轉換遮罩前資料
DEFINE g_stbb_d_mask_n   DYNAMIC ARRAY OF type_g_stbb_d #轉換遮罩後資料
 
 
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
 
{<section id="astt320.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5 #150308-00001#5  By geza 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   IF NOT cl_null(g_argv[1]) THEN
      LET g_type = g_argv[1]
   END IF
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT stbaunit,'',stbadocdt,stbadocno,stba002,'',stba013,'',stba010,stba000, 
       stba003,stba005,'',stba004,'',stba014,stba015,stba016,stbastus,stba006,stba007,stba001,'',stba022, 
       '',stba025,stbasite,stba026,stba011,'',stba012,'','',stba008,'',stba009,'',stbaownid,'',stbaowndp, 
       '',stbacrtid,'',stbacrtdp,'',stbacrtdt,stbamodid,'',stbamoddt,stbacnfid,'',stbacnfdt", 
                      " FROM stba_t",
                      " WHERE stbaent= ? AND stbadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt320_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stbaunit,t0.stbadocdt,t0.stbadocno,t0.stba002,t0.stba013,t0.stba010, 
       t0.stba000,t0.stba003,t0.stba005,t0.stba004,t0.stba014,t0.stba015,t0.stba016,t0.stbastus,t0.stba006, 
       t0.stba007,t0.stba001,t0.stba022,t0.stba025,t0.stbasite,t0.stba026,t0.stba011,t0.stba012,t0.stba008, 
       t0.stba009,t0.stbaownid,t0.stbaowndp,t0.stbacrtid,t0.stbacrtdp,t0.stbacrtdt,t0.stbamodid,t0.stbamoddt, 
       t0.stbacnfid,t0.stbacnfdt,t1.ooefl003 ,t2.pmaal004 ,t3.mhael023 ,t4.oocql004 ,t5.staal003 ,t6.ooefl003 , 
       t7.ooefl003 ,t8.ooail003 ,t9.oodbl004 ,t10.ooag011 ,t11.ooefl003 ,t12.ooag011 ,t13.ooefl003 , 
       t14.ooag011 ,t15.ooefl003 ,t16.ooag011 ,t17.ooag011",
               " FROM stba_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbaunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stba002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN mhael_t t3 ON t3.mhaelent="||g_enterprise||" AND t3.mhael001=t0.stba013 AND t3.mhael022='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2060' AND t4.oocql002=t0.stba005 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN staal_t t5 ON t5.staalent="||g_enterprise||" AND t5.staal001=t0.stba004 AND t5.staal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.stba001 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stba022 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stba011 AND t8.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t9 ON t9.oodblent="||g_enterprise||" AND t9.oodbl001='' AND t9.oodbl002=t0.stba012 AND t9.oodbl003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stba008  ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.stba009 AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stbaownid  ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stbaowndp AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t14 ON t14.ooagent="||g_enterprise||" AND t14.ooag001=t0.stbacrtid  ",
               " LEFT JOIN ooefl_t t15 ON t15.ooeflent="||g_enterprise||" AND t15.ooefl001=t0.stbacrtdp AND t15.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t16 ON t16.ooagent="||g_enterprise||" AND t16.ooag001=t0.stbamodid  ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.stbacnfid  ",
 
               " WHERE t0.stbaent = " ||g_enterprise|| " AND t0.stbadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt320_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt320 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt320_init()   
 
      #進入選單 Menu (="N")
      CALL astt320_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt320
      
   END IF 
   
   CLOSE astt320_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #150308-00001#5  By geza 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt320.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt320_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5  # 150308-00001#5  By geza 150309
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
      CALL cl_set_combo_scc_part('stbastus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stba003','6013') 
   CALL cl_set_combo_scc('stba006','6072') 
   CALL cl_set_combo_scc('stbb030','6932') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   LET g_errshow = 1   #160516-00014#10 160603 by sakura
   CALL cl_set_combo_scc_part('stba003','6013','1,2,3,4,5')
   CALL cl_set_combo_scc('stba006','6702')
#  CALL cl_set_combo_scc('stbb004','6006')
   CALL cl_set_combo_scc_part('stbb004','6006','1,2')
   CALL cl_set_combo_scc('stae004','6004')
   CALL cl_set_combo_scc('stbb010','6724')
   CALL cl_set_combo_scc('stbb013','6724')
   CALL cl_set_combo_scc('stbp004','6854') #add by geza 20150802
   
   CALL s_aooi500_create_temp() RETURNING l_success  #150308-00001#5  By geza 150309
   
   IF g_type = '1'  THEN        #add by geza  20150615         
      CALL cl_set_comp_visible("stba015",FALSE)
      CALL cl_set_comp_visible("stba013",FALSE)
      CALL cl_set_toolbaritem_visible("case_end",FALSE)
      CALL cl_set_toolbaritem_visible("produce_sheet",FALSE)
      CALL cl_set_toolbaritem_visible("astt320_pay",FALSE)      #150603-00023#1--add by dongsz
      CALL cl_set_toolbaritem_visible("astt320_pay_detail",FALSE)      #150603-00023#1--add by dongsz
      CALL cl_set_comp_required("stba010",TRUE)     #add by geza  20150610
      CALL cl_set_comp_visible("stbb015",TRUE)      #add by geza  20150610
      CALL cl_set_comp_visible("stbb016",TRUE)      #add by geza  20150610
      CALL cl_set_toolbaritem_visible("get_info",FALSE)
      CALL cl_set_comp_visible("stba016",FALSE)     #add by geza  20150703 
      CALL cl_set_combo_scc_part('stba006','6702','1,2,8,9,11,12,13,15,16,19')     #add by pengxin  20160316
      CALL cl_set_comp_visible("stba013,stba025,stba026",FALSE)                    #160310-00019#1 20160323 s983961--ADD   #160518-00077#1 160518 by lori mod stba024->stba013 
   END IF
   
   IF g_type = '2' THEN
      CALL cl_set_comp_visible("stba015",TRUE)
      CALL cl_set_comp_visible("stba013",TRUE)
      CALL cl_set_combo_scc('stba015','6821')
      CALL cl_set_toolbaritem_visible("case_end",TRUE)
      CALL cl_set_toolbaritem_visible("produce_sheet",TRUE)
      CALL cl_set_toolbaritem_visible("astt320_pay",TRUE)       #150603-00023#1--add by dongsz
      CALL cl_set_toolbaritem_visible("astt320_pay_detail",TRUE)       #150603-00023#1--add by dongsz
      CALL cl_set_comp_required("stba010",FALSE)     #add by geza  20150610   
      CALL cl_set_comp_visible("stbb015",FALSE)      #add by geza  20150610
      CALL cl_set_comp_visible("stbb016",FALSE)      #add by geza  20150610
      CALL cl_set_toolbaritem_visible("get_info",FALSE)
      CALL cl_set_comp_visible("stba016",TRUE)                   #add by geza  20150703  
      CALL cl_set_combo_scc_part('stba006','6702','1,16')        #add by pengxin 20160316   
      CALL cl_set_comp_visible("stba013,stba025,stba026",FALSE)  #160310-00019#1 20160323 s983961--ADD  #160518-00077#1 160518 by lori mod stba024->stba013   
   END IF 
   
   IF g_type = '3'  THEN        #add by geza  20150615         
      CALL cl_set_comp_visible("stba015",FALSE)
      CALL cl_set_comp_visible("stba013",FALSE)
      CALL cl_set_toolbaritem_visible("case_end",FALSE)
      CALL cl_set_toolbaritem_visible("produce_sheet",FALSE)
      CALL cl_set_toolbaritem_visible("astt320_pay",FALSE)      #150603-00023#1--add by dongsz
      CALL cl_set_toolbaritem_visible("astt320_pay_detail",FALSE)      #150603-00023#1--add by dongsz
      CALL cl_set_comp_required("stba010",TRUE)     #add by geza  20150610
      CALL cl_set_comp_visible("stbb015",TRUE)      #add by geza  20150610
      CALL cl_set_comp_visible("stbb016",TRUE)      #add by geza  20150610
      #CALL cl_set_toolbaritem_visible("get_info",TRUE)          #mark by geza  20151231
      CALL cl_set_toolbaritem_visible("get_info",FALSE)          #add by geza  20151231  
      CALL cl_set_comp_visible("stba016",FALSE)                  #add by geza  20150703 
      CALL cl_set_combo_scc_part('stba006','6702','1,2')         #add by pengxin 20160316
      CALL cl_set_comp_visible("stba013,stba025,stba026",FALSE)  #160310-00019#1 20160323 s983961--ADD #160518-00077#1 160518 by lori mod stba024->stba013
   END IF
   
   #160310-00019#1 20160323 s983961--add(s)
   IF g_type = '4'  THEN          
      CALL cl_set_comp_visible("stba015",FALSE)
     #CALL cl_set_comp_visible("stba013,stba013_desc",FALSE)   #160518-00077#1 160518 by lori mark
      CALL cl_set_toolbaritem_visible("case_end",FALSE)
      CALL cl_set_toolbaritem_visible("produce_sheet",FALSE)
      CALL cl_set_toolbaritem_visible("astt320_pay",FALSE)      
      CALL cl_set_toolbaritem_visible("astt320_pay_detail",FALSE)     
      CALL cl_set_comp_required("stba010",TRUE)     
      CALL cl_set_comp_visible("stbb015",TRUE)      
      CALL cl_set_comp_visible("stbb016",TRUE)      
      CALL cl_set_toolbaritem_visible("get_info",FALSE)
      CALL cl_set_comp_visible("stba016",FALSE)    
      #CALL cl_set_combo_scc_part('stba006','6702','1,2,16,20,21')     #160613-00045#5 20160616 mark by beckxie 
      CALL cl_set_combo_scc_part('stba006','6702','1,2,12,14,16,18,20,21,23')   #160613-00045#5 20160616 add by beckxie##add 14 by zhangnan
      CALL cl_set_comp_visible("stba022,stba022_desc",FALSE)
      CALL cl_set_combo_scc_part('stba003','6013','5')  
      CALL cl_set_comp_required('stbb003',TRUE)  #add by geza 20160628 #160604-00009#115     
   END IF
   #160310-00019#1 20160323 s983961--add(e)
   
   CALL astt320_set_no_visible_b()   #160510-00010#5 160514 by lori add
   CALL astt320_set_visible_b()      #160510-00010#5 160514 by lori add
   
   
   #end add-point
   
   #初始化搜尋條件
   CALL astt320_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt320.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt320_ui_dialog()
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
   DEFINE l_stbb009_sum  LIKE stbb_t.stbb009   #150603-00023#1--add by dongsz
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
            CALL astt320_insert()
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
         INITIALIZE g_stba_m.* TO NULL
         CALL g_stbb_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt320_init()
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
               
               CALL astt320_fetch('') # reload data
               LET l_ac = 1
               CALL astt320_ui_detailshow() #Setting the current row 
         
               CALL astt320_idx_chk()
               #NEXT FIELD stbbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stbb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt320_idx_chk()
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
               CALL astt320_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         #add by geza 20150801(S)        
         DISPLAY ARRAY g_stbb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt320_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作

               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_detail_idx)
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL astt320_idx_chk()
               #add-point:page2自定義行為

               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為

            #end add-point
         
         END DISPLAY  
         #add by geza 20150801(E)         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt320_browser_fill("")
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
               CALL astt320_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt320_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt320_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            CALL astt320_set_no_visible_b()   #160510-00010#5 160514 by lori add
            CALL astt320_set_visible_b()      #160510-00010#5 160514 by lori add
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt320_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt320_set_act_visible()   
            CALL astt320_set_act_no_visible()
            IF NOT (g_stba_m.stbadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                                  " stbadocno = '", g_stba_m.stbadocno, "' "
 
               #填到對應位置
               CALL astt320_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stba_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbb_t" 
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
               CALL astt320_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stba_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stbb_t" 
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
                  CALL astt320_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt320_fetch("F")
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
               CALL astt320_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt320_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt320_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt320_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt320_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt320_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt320_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt320_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt320_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt320_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt320_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stbb_d)
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
               NEXT FIELD stbbseq
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
               CALL astt320_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt320_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION produce_sheet
            LET g_action_choice="produce_sheet"
            IF cl_auth_chk_act("produce_sheet") THEN
               
               #add-point:ON ACTION produce_sheet name="menu.produce_sheet"
               IF g_stba_m.stba000 = 'astt322' THEN
                  IF cl_ask_confirm('ast-00324') THEN                  
                     IF cl_null(g_stba_m.stba010)  THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "" 
                        LET g_errparam.code   = 'ast-00325'
                        LET g_errparam.popup  = FALSE 
                        CALL cl_err()
                        CONTINUE DIALOG 
                     ELSE   
                        INITIALIZE g_errno TO NULL
                        CALL astt320_fetch('') 
                        CALL astt320_produce_sheet(g_stba_m.stbadocno) RETURNING g_errno
                        IF NOT cl_null(g_errno) THEN
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = "" 
                           LET g_errparam.code   = g_errno
                           LET g_errparam.popup  = FALSE 
                           CALL cl_err()
                           CONTINUE DIALOG             
                        END IF 
                        CALL astt320_fetch('')  
                     END IF                           
                  ELSE
                     CONTINUE DIALOG 
                  END IF 
               END IF                
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION astt320_pay_detail
            LET g_action_choice="astt320_pay_detail"
            IF cl_auth_chk_act("astt320_pay_detail") THEN
               
               #add-point:ON ACTION astt320_pay_detail name="menu.astt320_pay_detail"
               #150505-00002#1--add by dongsz--str---
               CALL s_pay_09(g_stba_m.stbadocno)
               LET g_action_choice= ""
               #150505-00002#1--add by dongsz--end---
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt320_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt320_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               #add by Naysa #160604-00009#59(S)
               IF g_type='4' THEN
                  LET g_rep_wc = " stbaent ="|| g_enterprise ||" AND stbadocno ='"|| g_stba_m.stbadocno||"'"             
               END IF
               #add by Naysa #160604-00009#59(E)
               #END add-point
               &include "erp/ast/astt320_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               #add by Naysa #160604-00009#59(S)
               IF g_type='4' THEN
                  LET g_rep_wc = " stbaent ="|| g_enterprise ||" AND stbadocno ='"|| g_stba_m.stbadocno||"'"             
               END IF
               #add by Naysa #160604-00009#59(E)
               #END add-point
               &include "erp/ast/astt320_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query_papers
            LET g_action_choice="query_papers"
            IF cl_auth_chk_act("query_papers") THEN
               
               #add-point:ON ACTION query_papers name="menu.query_papers"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt320_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION astt320_pay
            LET g_action_choice="astt320_pay"
            IF cl_auth_chk_act("astt320_pay") THEN
               
               #add-point:ON ACTION astt320_pay name="menu.astt320_pay"
               #150603-00023#1--add by dongsz--str---
               IF g_stba_m.stbastus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00334'
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               ELSE
                  IF g_stba_m.stba015 <> '1' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00333'
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_action_choice= ""
                     EXIT DIALOG
                  END IF
                  SELECT SUM(stbb009) INTO l_stbb009_sum
                    FROM stbb_t
                   WHERE stbbent = g_enterprise
                     AND stbbdocno = g_stba_m.stbadocno
                  IF cl_null(l_stbb009_sum) THEN
                     LET l_stbb009_sum = 0
                  END IF
                  IF l_stbb009_sum = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'art-00576'
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_action_choice= ""
                     EXIT DIALOG
                  END IF
                  CALL s_pay('stba_t',1,g_stba_m.stbadocno)
                  CALL astt320_show()
               END IF
               SELECT stba015 INTO g_stba_m.stba015
                 FROM stba_t
                WHERE stbaent = g_enterprise
                  AND stbadocno = g_stba_m.stbadocno
               DISPLAY BY NAME g_stba_m.stba015
               LET g_action_choice= ""
               #150603-00023#1--add by dongsz--end---
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION get_info
            LET g_action_choice="get_info"
            IF cl_auth_chk_act("get_info") THEN
               
               #add-point:ON ACTION get_info name="menu.get_info"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt320_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION case_end
            LET g_action_choice="case_end"
            IF cl_auth_chk_act("case_end") THEN
               
               #add-point:ON ACTION case_end name="menu.case_end"
               IF g_stba_m.stba000 = 'astt322' THEN
                  IF cl_ask_confirm('lib-003') THEN                   
                     CALL astt320_fetch('') 
                    
                     INITIALIZE g_errno TO NULL
                     CALL astt320_case_end(g_stba_m.stbadocno) RETURNING g_errno
                     IF NOT cl_null(g_errno) THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "" 
                        LET g_errparam.code   = g_errno
                        LET g_errparam.popup  = FALSE 
                        CALL cl_err()
                        CONTINUE DIALOG             
                     END IF 
                     CALL astt320_fetch('')                      
                  ELSE
                     CONTINUE DIALOG           
                  END IF  
               END IF                
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt320_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt320_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt320_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stba_m.stbadocdt)
 
 
 
         
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
 
{<section id="astt320.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt320_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stbasite') RETURNING l_where
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
   #add by geza 20150615(S)
   let l_wc=l_wc, " AND ",l_where
   IF g_type='1' THEN
      LET l_wc=l_wc," AND stba000='astt320' " 
   END IF
   IF g_type='2' THEN
      LET l_wc=l_wc," AND stba000='astt322' " 
   END IF
   IF g_type='3' THEN
      LET l_wc=l_wc," AND stba000='astt323' " 
   END IF
   #160310-00019#1 20160323 s983961--add(s)
   IF g_type='4' THEN
      LET l_wc=l_wc," AND stba000='astt810' " 
   END IF
   #160310-00019#1 20160323 s983961--add(e)
   #add by geza 20150615(E)
   #add by geza 20151231(S)
   IF cl_null(g_wc2_table2) THEN
      LET g_wc2_table2 = " 1=1"
   END IF
   #add by geza 20151231(E)
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stbadocno ",
                      " FROM stba_t ",
                      " ",
                      " LEFT JOIN stbb_t ON stbbent = stbaent AND stbadocno = stbbdocno ", "  ",
                      #add-point:browser_fill段sql(stbb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stbaent = " ||g_enterprise|| " AND stbbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stba_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stbadocno ",
                      " FROM stba_t ", 
                      "  ",
                      "  ",
                      " WHERE stbaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stba_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   IF g_wc2 = " 1=1" AND g_wc2_table2 <> " 1=1" THEN
      LET l_sub_sql = " SELECT UNIQUE stbadocno ",
                      " FROM stba_t ",
                      " ",
                      " LEFT JOIN stbp_t ON stbpent = stbaent AND stbadocno = stbpdocno ", "  ",
                      " ", 
                      " ", 
                      " WHERE stbaent = '" ||g_enterprise|| "' AND stbpent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", g_wc2_table2, cl_sql_add_filter("stba_t")
   END IF                      
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
      INITIALIZE g_stba_m.* TO NULL
      CALL g_stbb_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbastus,t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002, 
          t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stba_t t0",
                  "  ",
                  "  LEFT JOIN stbb_t ON stbbent = stbaent AND stbadocno = stbbdocno ", "  ", 
                  #add-point:browser_fill段sql(stbb_t1) name="browser_fill.join.stbb_t1"
               "  LEFT JOIN stbp_t ON stbpent = stbaent AND stbadocno = stbpdocno ", "  ", 
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbaunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stba001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stba002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stba_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stbastus,t0.stbadocno,t0.stbadocdt,t0.stbaunit,t0.stba001,t0.stba002, 
          t1.ooefl003 ,t2.ooefl003 ,t3.pmaal004 ",
                  " FROM stba_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stbaunit AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stba001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stba002 AND t3.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.stbaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stba_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql, " AND ",g_wc2_table2      #add by geza 20150802
   #end add-point
   LET g_sql = g_sql, " ORDER BY stbadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stba_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stbadocno,g_browser[g_cnt].b_stbadocdt, 
          g_browser[g_cnt].b_stbaunit,g_browser[g_cnt].b_stba001,g_browser[g_cnt].b_stba002,g_browser[g_cnt].b_stbaunit_desc, 
          g_browser[g_cnt].b_stba001_desc,g_browser[g_cnt].b_stba002_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         ##add by zhangnan --str 增加单身的合计金额的显示
         SELECT SUM(stbb009) INTO g_browser[g_cnt].b_stbb009
         FROM stbb_t 
         WHERE stbbdocno=g_browser[g_cnt].b_stbadocno
           AND stbbent=g_enterprise
         IF cl_null(g_browser[g_cnt].b_stbb009) THEN 
            LET g_browser[g_cnt].b_stbb009 =0
         END IF 
         ##add by zhangnan --end 
         #end add-point
      
         #遮罩相關處理
         CALL astt320_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stbadocno) THEN
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
 
{<section id="astt320.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt320_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stba_m.stbadocno = g_browser[g_current_idx].b_stbadocno   
 
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   CALL astt320_stba_t_mask()
   CALL astt320_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt320.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt320_ui_detailshow()
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
 
{<section id="astt320.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt320_ui_browser_refresh()
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
      IF g_browser[l_i].b_stbadocno = g_stba_m.stbadocno 
 
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
 
{<section id="astt320.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt320_construct()
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
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stba_m.* TO NULL
   CALL g_stbb_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stbaunit,stbadocdt,stbadocno,stba002,stba013,stba010,stba000,stba003, 
          stba005,stba004,stba014,stba015,stba016,stbastus,stba006,stba007,stba001,stba022,stba025,stba026, 
          stba011,stba012,l_amount1,stba008,stba009,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt, 
          stbamodid,stbamoddt,stbacnfid,stbacnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stbacrtdt>>----
         AFTER FIELD stbacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stbamoddt>>----
         AFTER FIELD stbamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbacnfdt>>----
         AFTER FIELD stbacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stbapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stbaunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaunit
            #add-point:ON ACTION controlp INFIELD stbaunit name="construct.c.stbaunit"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_14()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbasite',g_site,'c') #150308-00001#5  By geza add 'c'
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stbaunit  #顯示到畫面上
            NEXT FIELD stbaunit                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaunit
            #add-point:BEFORE FIELD stbaunit name="construct.b.stbaunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaunit
            
            #add-point:AFTER FIELD stbaunit name="construct.a.stbaunit"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocdt
            #add-point:BEFORE FIELD stbadocdt name="construct.b.stbadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocdt
            
            #add-point:AFTER FIELD stbadocdt name="construct.a.stbadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocdt
            #add-point:ON ACTION controlp INFIELD stbadocdt name="construct.c.stbadocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocno
            #add-point:ON ACTION controlp INFIELD stbadocno name="construct.c.stbadocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            IF g_type = '1' THEN
               LET g_qryparam.where = " stba000 = 'astt320' "
            END IF
            IF g_type = '2' THEN
               LET g_qryparam.where = " stba000 = 'astt322' "
            END IF
            IF g_type = '3' THEN
               LET g_qryparam.where = " stba000 = 'astt323' "
            END IF
            #160310-00019#1 20160323 s983961--add(s)
            IF g_type = '4' THEN
               LET g_qryparam.where = " stba000 = 'astt810' "
            END IF
            #160310-00019#1 20160323 s983961--add(e)
            CALL q_stbadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbadocno  #顯示到畫面上
            NEXT FIELD stbadocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocno
            #add-point:BEFORE FIELD stbadocno name="construct.b.stbadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocno
            
            #add-point:AFTER FIELD stbadocno name="construct.a.stbadocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba002
            #add-point:ON ACTION controlp INFIELD stba002 name="construct.c.stba002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba002  #顯示到畫面上
            NEXT FIELD stba002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba002
            #add-point:BEFORE FIELD stba002 name="construct.b.stba002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba002
            
            #add-point:AFTER FIELD stba002 name="construct.a.stba002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba013
            #add-point:ON ACTION controlp INFIELD stba013 name="construct.c.stba013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            
            #160518-00077#1 160518 by lori mod--(S)
            IF g_type = '4' THEN
               #CALL q_mhbc001_1()  #160516-00014#10 160603 by sakura mark
               CALL q_stje008_2()   #160516-00014#10 160603 by sakura add
            ELSE   
               CALL q_mhae001_2()     
            END IF
            #160518-00077#1 160518 by lori mod--(E)
            
            DISPLAY g_qryparam.return1 TO stba013 
            NEXT FIELD stba013 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba013
            #add-point:BEFORE FIELD stba013 name="construct.b.stba013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba013
            
            #add-point:AFTER FIELD stba013 name="construct.a.stba013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba010
            #add-point:ON ACTION controlp INFIELD stba010 name="construct.c.stba010"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160511-00034#1 160510 by lori mark---(S)
            ##160310-00019#1 20160323 s983961--ADD(s)
            #IF g_type='4' THEN 
            #   LET g_qryparam.where = " stan002 = '5'  "
            #END IF
            ##160310-00019#1 20160323 s983961--ADD(e)            
            #CALL q_stan001_2()                           
            #160511-00034#1 160510 by lori mark---(E)
            
            #160511-00034#1 160510 by lori add---(S)
            IF g_type='4' THEN
               CALL q_stje001()
            ELSE
               CALL q_stan001_2()      
            END IF
            #160511-00034#1 160510 by lori add---(E)
            
            DISPLAY g_qryparam.return1 TO stba010  
            NEXT FIELD stba010    
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba010
            #add-point:BEFORE FIELD stba010 name="construct.b.stba010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba010
            
            #add-point:AFTER FIELD stba010 name="construct.a.stba010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba000
            #add-point:BEFORE FIELD stba000 name="construct.b.stba000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba000
            
            #add-point:AFTER FIELD stba000 name="construct.a.stba000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba000
            #add-point:ON ACTION controlp INFIELD stba000 name="construct.c.stba000"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba003
            #add-point:BEFORE FIELD stba003 name="construct.b.stba003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba003
            
            #add-point:AFTER FIELD stba003 name="construct.a.stba003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba003
            #add-point:ON ACTION controlp INFIELD stba003 name="construct.c.stba003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stba005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba005
            #add-point:ON ACTION controlp INFIELD stba005 name="construct.c.stba005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '2060'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba005  #顯示到畫面上
            NEXT FIELD stba005                     #返回原欄位            

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba005
            #add-point:BEFORE FIELD stba005 name="construct.b.stba005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba005
            
            #add-point:AFTER FIELD stba005 name="construct.a.stba005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba004
            #add-point:ON ACTION controlp INFIELD stba004 name="construct.c.stba004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba004  #顯示到畫面上
            NEXT FIELD stba004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba004
            #add-point:BEFORE FIELD stba004 name="construct.b.stba004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba004
            
            #add-point:AFTER FIELD stba004 name="construct.a.stba004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba014
            #add-point:BEFORE FIELD stba014 name="construct.b.stba014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba014
            
            #add-point:AFTER FIELD stba014 name="construct.a.stba014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba014
            #add-point:ON ACTION controlp INFIELD stba014 name="construct.c.stba014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba015
            #add-point:BEFORE FIELD stba015 name="construct.b.stba015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba015
            
            #add-point:AFTER FIELD stba015 name="construct.a.stba015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba015
            #add-point:ON ACTION controlp INFIELD stba015 name="construct.c.stba015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba016
            #add-point:BEFORE FIELD stba016 name="construct.b.stba016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba016
            
            #add-point:AFTER FIELD stba016 name="construct.a.stba016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba016
            #add-point:ON ACTION controlp INFIELD stba016 name="construct.c.stba016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbastus
            #add-point:BEFORE FIELD stbastus name="construct.b.stbastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbastus
            
            #add-point:AFTER FIELD stbastus name="construct.a.stbastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbastus
            #add-point:ON ACTION controlp INFIELD stbastus name="construct.c.stbastus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba006
            #add-point:BEFORE FIELD stba006 name="construct.b.stba006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba006
            
            #add-point:AFTER FIELD stba006 name="construct.a.stba006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba006
            #add-point:ON ACTION controlp INFIELD stba006 name="construct.c.stba006"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stba007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba007
            #add-point:ON ACTION controlp INFIELD stba007 name="construct.c.stba007"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stba007()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba007  #顯示到畫面上
            NEXT FIELD stba007                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba007
            #add-point:BEFORE FIELD stba007 name="construct.b.stba007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba007
            
            #add-point:AFTER FIELD stba007 name="construct.a.stba007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba001
            #add-point:ON ACTION controlp INFIELD stba001 name="construct.c.stba001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001_23()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stba001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stba001',g_site,'c') #150308-00001#5  By geza add 'c'
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23()  
            END IF
            DISPLAY g_qryparam.return1 TO stba001  #顯示到畫面上
            NEXT FIELD stba001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba001
            #add-point:BEFORE FIELD stba001 name="construct.b.stba001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba001
            
            #add-point:AFTER FIELD stba001 name="construct.a.stba001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba022
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba022
            #add-point:ON ACTION controlp INFIELD stba022 name="construct.c.stba022"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stba022  #顯示到畫面上
            NEXT FIELD stba022                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba022
            #add-point:BEFORE FIELD stba022 name="construct.b.stba022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba022
            
            #add-point:AFTER FIELD stba022 name="construct.a.stba022"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba025
            #add-point:BEFORE FIELD stba025 name="construct.b.stba025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba025
            
            #add-point:AFTER FIELD stba025 name="construct.a.stba025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba025
            #add-point:ON ACTION controlp INFIELD stba025 name="construct.c.stba025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba026
            #add-point:BEFORE FIELD stba026 name="construct.b.stba026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba026
            
            #add-point:AFTER FIELD stba026 name="construct.a.stba026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba026
            #add-point:ON ACTION controlp INFIELD stba026 name="construct.c.stba026"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stba011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba011
            #add-point:ON ACTION controlp INFIELD stba011 name="construct.c.stba011"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooaj002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba011  #顯示到畫面上
            NEXT FIELD stba011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba011
            #add-point:BEFORE FIELD stba011 name="construct.b.stba011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba011
            
            #add-point:AFTER FIELD stba011 name="construct.a.stba011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba012
            #add-point:ON ACTION controlp INFIELD stba012 name="construct.c.stba012"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site 
            CALL q_oodb002_3()                          #呼叫開窗
            
            NEXT FIELD stba012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba012
            #add-point:BEFORE FIELD stba012 name="construct.b.stba012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba012
            
            #add-point:AFTER FIELD stba012 name="construct.a.stba012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_amount1
            #add-point:BEFORE FIELD l_amount1 name="construct.b.l_amount1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_amount1
            
            #add-point:AFTER FIELD l_amount1 name="construct.a.l_amount1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.l_amount1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_amount1
            #add-point:ON ACTION controlp INFIELD l_amount1 name="construct.c.l_amount1"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stba008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba008
            #add-point:ON ACTION controlp INFIELD stba008 name="construct.c.stba008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba008  #顯示到畫面上
            NEXT FIELD stba008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba008
            #add-point:BEFORE FIELD stba008 name="construct.b.stba008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba008
            
            #add-point:AFTER FIELD stba008 name="construct.a.stba008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stba009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba009
            #add-point:ON ACTION controlp INFIELD stba009 name="construct.c.stba009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today
            CALL q_ooeg001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stba009  #顯示到畫面上
            NEXT FIELD stba009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba009
            #add-point:BEFORE FIELD stba009 name="construct.b.stba009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba009
            
            #add-point:AFTER FIELD stba009 name="construct.a.stba009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaownid
            #add-point:ON ACTION controlp INFIELD stbaownid name="construct.c.stbaownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbaownid  #顯示到畫面上
            NEXT FIELD stbaownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaownid
            #add-point:BEFORE FIELD stbaownid name="construct.b.stbaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaownid
            
            #add-point:AFTER FIELD stbaownid name="construct.a.stbaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaowndp
            #add-point:ON ACTION controlp INFIELD stbaowndp name="construct.c.stbaowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbaowndp  #顯示到畫面上
            NEXT FIELD stbaowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaowndp
            #add-point:BEFORE FIELD stbaowndp name="construct.b.stbaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaowndp
            
            #add-point:AFTER FIELD stbaowndp name="construct.a.stbaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacrtid
            #add-point:ON ACTION controlp INFIELD stbacrtid name="construct.c.stbacrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacrtid  #顯示到畫面上
            NEXT FIELD stbacrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtid
            #add-point:BEFORE FIELD stbacrtid name="construct.b.stbacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacrtid
            
            #add-point:AFTER FIELD stbacrtid name="construct.a.stbacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stbacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacrtdp
            #add-point:ON ACTION controlp INFIELD stbacrtdp name="construct.c.stbacrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacrtdp  #顯示到畫面上
            NEXT FIELD stbacrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtdp
            #add-point:BEFORE FIELD stbacrtdp name="construct.b.stbacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacrtdp
            
            #add-point:AFTER FIELD stbacrtdp name="construct.a.stbacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacrtdt
            #add-point:BEFORE FIELD stbacrtdt name="construct.b.stbacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbamodid
            #add-point:ON ACTION controlp INFIELD stbamodid name="construct.c.stbamodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbamodid  #顯示到畫面上
            NEXT FIELD stbamodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbamodid
            #add-point:BEFORE FIELD stbamodid name="construct.b.stbamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbamodid
            
            #add-point:AFTER FIELD stbamodid name="construct.a.stbamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbamoddt
            #add-point:BEFORE FIELD stbamoddt name="construct.b.stbamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stbacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbacnfid
            #add-point:ON ACTION controlp INFIELD stbacnfid name="construct.c.stbacnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbacnfid  #顯示到畫面上
            NEXT FIELD stbacnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacnfid
            #add-point:BEFORE FIELD stbacnfid name="construct.b.stbacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbacnfid
            
            #add-point:AFTER FIELD stbacnfid name="construct.a.stbacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbacnfdt
            #add-point:BEFORE FIELD stbacnfdt name="construct.b.stbacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stbbseq,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002,stbb003,stbb004, 
          stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013,stbbsite,stbb012,stbb011, 
          stbb017
           FROM s_detail1[1].stbbseq,s_detail1[1].stbb001,s_detail1[1].stbb030,s_detail1[1].stbb031, 
               s_detail1[1].stbb015,s_detail1[1].stbb016,s_detail1[1].stbb002,s_detail1[1].stbb003,s_detail1[1].stbb004, 
               s_detail1[1].stbb005,s_detail1[1].stbb006,s_detail1[1].stbb007,s_detail1[1].stbb008,s_detail1[1].stbb014, 
               s_detail1[1].stbb019,s_detail1[1].stbb009,s_detail1[1].stbb010,s_detail1[1].stbb013,s_detail1[1].stbbsite, 
               s_detail1[1].stbb012,s_detail1[1].stbb011,s_detail1[1].stbb017
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbseq
            #add-point:BEFORE FIELD stbbseq name="construct.b.page1.stbbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbseq
            
            #add-point:AFTER FIELD stbbseq name="construct.a.page1.stbbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbseq
            #add-point:ON ACTION controlp INFIELD stbbseq name="construct.c.page1.stbbseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb001
            #add-point:ON ACTION controlp INFIELD stbb001 name="construct.c.page1.stbb001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb001  #顯示到畫面上
            NEXT FIELD stbb001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb001
            #add-point:BEFORE FIELD stbb001 name="construct.b.page1.stbb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb001
            
            #add-point:AFTER FIELD stbb001 name="construct.a.page1.stbb001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb030
            #add-point:BEFORE FIELD stbb030 name="construct.b.page1.stbb030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb030
            
            #add-point:AFTER FIELD stbb030 name="construct.a.page1.stbb030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb030
            #add-point:ON ACTION controlp INFIELD stbb030 name="construct.c.page1.stbb030"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb031
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb031
            #add-point:ON ACTION controlp INFIELD stbb031 name="construct.c.page1.stbb031"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            #160510-00010#5 160514 by lori add---(S)
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            IF s_aooi500_setpoint(g_prog,'stbb031') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbb031',g_site,'c')
               CALL q_ooef001_24()                   
            ELSE
               #CALL q_ooef001_1()        #161024-00025#2 mark
               CALL q_ooef001_24()        #161024-00025#2 add
            END IF    
            
            DISPLAY g_qryparam.return1 TO stbb031  
            NEXT FIELD stbb031                     
            #160510-00010#5 160514 by lori add---(E)

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb031
            #add-point:BEFORE FIELD stbb031 name="construct.b.page1.stbb031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb031
            
            #add-point:AFTER FIELD stbb031 name="construct.a.page1.stbb031"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb015
            #add-point:BEFORE FIELD stbb015 name="construct.b.page1.stbb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb015
            
            #add-point:AFTER FIELD stbb015 name="construct.a.page1.stbb015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb015
            #add-point:ON ACTION controlp INFIELD stbb015 name="construct.c.page1.stbb015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb016
            #add-point:BEFORE FIELD stbb016 name="construct.b.page1.stbb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb016
            
            #add-point:AFTER FIELD stbb016 name="construct.a.page1.stbb016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb016
            #add-point:ON ACTION controlp INFIELD stbb016 name="construct.c.page1.stbb016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb002
            #add-point:ON ACTION controlp INFIELD stbb002 name="construct.c.page1.stbb002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 =g_site 
            CALL q_ooaj002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb002  #顯示到畫面上
            NEXT FIELD stbb002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb002
            #add-point:BEFORE FIELD stbb002 name="construct.b.page1.stbb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb002
            
            #add-point:AFTER FIELD stbb002 name="construct.a.page1.stbb002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb003
            #add-point:ON ACTION controlp INFIELD stbb003 name="construct.c.page1.stbb003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site 
            CALL q_oodb002_3()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb003  #顯示到畫面上
            NEXT FIELD stbb003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb003
            #add-point:BEFORE FIELD stbb003 name="construct.b.page1.stbb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb003
            
            #add-point:AFTER FIELD stbb003 name="construct.a.page1.stbb003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb004
            #add-point:BEFORE FIELD stbb004 name="construct.b.page1.stbb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb004
            
            #add-point:AFTER FIELD stbb004 name="construct.a.page1.stbb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb004
            #add-point:ON ACTION controlp INFIELD stbb004 name="construct.c.page1.stbb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb005
            #add-point:BEFORE FIELD stbb005 name="construct.b.page1.stbb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb005
            
            #add-point:AFTER FIELD stbb005 name="construct.a.page1.stbb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb005
            #add-point:ON ACTION controlp INFIELD stbb005 name="construct.c.page1.stbb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb006
            #add-point:BEFORE FIELD stbb006 name="construct.b.page1.stbb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb006
            
            #add-point:AFTER FIELD stbb006 name="construct.a.page1.stbb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb006
            #add-point:ON ACTION controlp INFIELD stbb006 name="construct.c.page1.stbb006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb007
            #add-point:BEFORE FIELD stbb007 name="construct.b.page1.stbb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb007
            
            #add-point:AFTER FIELD stbb007 name="construct.a.page1.stbb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb007
            #add-point:ON ACTION controlp INFIELD stbb007 name="construct.c.page1.stbb007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb008
            #add-point:BEFORE FIELD stbb008 name="construct.b.page1.stbb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb008
            
            #add-point:AFTER FIELD stbb008 name="construct.a.page1.stbb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb008
            #add-point:ON ACTION controlp INFIELD stbb008 name="construct.c.page1.stbb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb014
            #add-point:BEFORE FIELD stbb014 name="construct.b.page1.stbb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb014
            
            #add-point:AFTER FIELD stbb014 name="construct.a.page1.stbb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb014
            #add-point:ON ACTION controlp INFIELD stbb014 name="construct.c.page1.stbb014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb019
            #add-point:BEFORE FIELD stbb019 name="construct.b.page1.stbb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb019
            
            #add-point:AFTER FIELD stbb019 name="construct.a.page1.stbb019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb019
            #add-point:ON ACTION controlp INFIELD stbb019 name="construct.c.page1.stbb019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb009
            #add-point:BEFORE FIELD stbb009 name="construct.b.page1.stbb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb009
            
            #add-point:AFTER FIELD stbb009 name="construct.a.page1.stbb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb009
            #add-point:ON ACTION controlp INFIELD stbb009 name="construct.c.page1.stbb009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb010
            #add-point:BEFORE FIELD stbb010 name="construct.b.page1.stbb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb010
            
            #add-point:AFTER FIELD stbb010 name="construct.a.page1.stbb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb010
            #add-point:ON ACTION controlp INFIELD stbb010 name="construct.c.page1.stbb010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb013
            #add-point:BEFORE FIELD stbb013 name="construct.b.page1.stbb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb013
            
            #add-point:AFTER FIELD stbb013 name="construct.a.page1.stbb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb013
            #add-point:ON ACTION controlp INFIELD stbb013 name="construct.c.page1.stbb013"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stbbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbsite
            #add-point:ON ACTION controlp INFIELD stbbsite name="construct.c.page1.stbbsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_14()                           #呼叫開窗    #161024-00025#3 mark
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbbsite',g_site,'c')     #161024-00025#3 add
            CALL q_ooef001_24()              #161024-00025#3 add
            DISPLAY g_qryparam.return1 TO stbbsite  #顯示到畫面上
            NEXT FIELD stbbsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbsite
            #add-point:BEFORE FIELD stbbsite name="construct.b.page1.stbbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbsite
            
            #add-point:AFTER FIELD stbbsite name="construct.a.page1.stbbsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb012
            #add-point:ON ACTION controlp INFIELD stbb012 name="construct.c.page1.stbb012"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today #
            CALL q_ooeg001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb012  #顯示到畫面上
            NEXT FIELD stbb012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb012
            #add-point:BEFORE FIELD stbb012 name="construct.b.page1.stbb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb012
            
            #add-point:AFTER FIELD stbb012 name="construct.a.page1.stbb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb011
            #add-point:ON ACTION controlp INFIELD stbb011 name="construct.c.page1.stbb011"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')
            CALL q_rtax001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stbb011  #顯示到畫面上
            NEXT FIELD stbb011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb011
            #add-point:BEFORE FIELD stbb011 name="construct.b.page1.stbb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb011
            
            #add-point:AFTER FIELD stbb011 name="construct.a.page1.stbb011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb017
            #add-point:BEFORE FIELD stbb017 name="construct.b.page1.stbb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb017
            
            #add-point:AFTER FIELD stbb017 name="construct.a.page1.stbb017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb017
            #add-point:ON ACTION controlp INFIELD stbb017 name="construct.c.page1.stbb017"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      #add by geza 20150801(S)
      CONSTRUCT g_wc2_table2 ON stbpseq,stbp001,stbp002,stbp003,stbp004,stbp005,stbp006,stbp007,stbp008, 
          stbp009
           FROM s_detail2[1].stbpseq,s_detail2[1].stbp001,s_detail2[1].stbp002,s_detail2[1].stbp003, 
               s_detail2[1].stbp004,s_detail2[1].stbp005,s_detail2[1].stbp006,s_detail2[1].stbp007,s_detail2[1].stbp008, 
               s_detail2[1].stbp009
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct

            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbpseq
            #add-point:BEFORE FIELD stbpseq

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbpseq
            
            #add-point:AFTER FIELD stbpseq

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbpseq
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbpseq
            #add-point:ON ACTION controlp INFIELD stbpseq

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp001
            #add-point:BEFORE FIELD stbp001

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp001
            
            #add-point:AFTER FIELD stbp001

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp001
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp001
            #add-point:ON ACTION controlp INFIELD stbp001

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp002
            #add-point:BEFORE FIELD stbp002

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp002
            
            #add-point:AFTER FIELD stbp002

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp002
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp002
            #add-point:ON ACTION controlp INFIELD stbp002

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp003
            #add-point:BEFORE FIELD stbp003

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp003
            
            #add-point:AFTER FIELD stbp003

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp003
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp003
            #add-point:ON ACTION controlp INFIELD stbp003

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp004
            #add-point:BEFORE FIELD stbp004

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp004
            
            #add-point:AFTER FIELD stbp004

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp004
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp004
            #add-point:ON ACTION controlp INFIELD stbp004

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp005
            #add-point:BEFORE FIELD stbp005

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp005
            
            #add-point:AFTER FIELD stbp005

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp005
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp005
            #add-point:ON ACTION controlp INFIELD stbp005

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp006
            #add-point:BEFORE FIELD stbp006

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp006
            
            #add-point:AFTER FIELD stbp006

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp006
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp006
            #add-point:ON ACTION controlp INFIELD stbp006

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp007
            #add-point:BEFORE FIELD stbp007

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp007
            
            #add-point:AFTER FIELD stbp007

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp007
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp007
            #add-point:ON ACTION controlp INFIELD stbp007

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp008
            #add-point:BEFORE FIELD stbp008

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp008
            
            #add-point:AFTER FIELD stbp008

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp008
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp008
            #add-point:ON ACTION controlp INFIELD stbp008

            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stbp009
            #add-point:BEFORE FIELD stbp009

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stbp009
            
            #add-point:AFTER FIELD stbp009

            #END add-point
            
 
         #Ctrlp:construct.c.page2.stbp009
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stbp009
            #add-point:ON ACTION controlp INFIELD stbp009

            #END add-point
 
   
       
      END CONSTRUCT
      #add by geza 20150801(E)
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
                  WHEN la_wc[li_idx].tableid = "stba_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stbb_t" 
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
 
{<section id="astt320.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt320_filter()
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
      CONSTRUCT g_wc_filter ON stbadocno,stbadocdt,stbaunit,stba001,stba002
                          FROM s_browse[1].b_stbadocno,s_browse[1].b_stbadocdt,s_browse[1].b_stbaunit, 
                              s_browse[1].b_stba001,s_browse[1].b_stba002
 
         BEFORE CONSTRUCT
               DISPLAY astt320_filter_parser('stbadocno') TO s_browse[1].b_stbadocno
            DISPLAY astt320_filter_parser('stbadocdt') TO s_browse[1].b_stbadocdt
            DISPLAY astt320_filter_parser('stbaunit') TO s_browse[1].b_stbaunit
            DISPLAY astt320_filter_parser('stba001') TO s_browse[1].b_stba001
            DISPLAY astt320_filter_parser('stba002') TO s_browse[1].b_stba002
      
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
 
      CALL astt320_filter_show('stbadocno')
   CALL astt320_filter_show('stbadocdt')
   CALL astt320_filter_show('stbaunit')
   CALL astt320_filter_show('stba001')
   CALL astt320_filter_show('stba002')
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt320_filter_parser(ps_field)
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
 
{<section id="astt320.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt320_filter_show(ps_field)
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
   LET ls_condition = astt320_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt320_query()
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
   CALL g_stbb_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt320_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt320_browser_fill("")
      CALL astt320_fetch("")
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
      CALL astt320_filter_show('stbadocno')
   CALL astt320_filter_show('stbadocdt')
   CALL astt320_filter_show('stbaunit')
   CALL astt320_filter_show('stba001')
   CALL astt320_filter_show('stba002')
   CALL astt320_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt320_fetch("F") 
      #顯示單身筆數
      CALL astt320_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt320_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
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
   
   LET g_stba_m.stbadocno = g_browser[g_current_idx].b_stbadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt320_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt320_set_act_visible()   
   CALL astt320_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
       SELECT ooef019 INTO l_ooef019
         FROM ooef_t 
        WHERE ooefent = g_enterprise  AND ooef001 = g_site  
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = l_ooef019
         LET g_ref_fields[2] = g_stba_m.stba012
         CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_stba_m.stba012_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stba_m.stba012_desc
   
   CALL cl_set_act_visible("modify,modify_detail,delete",TRUE)   
   #IF g_stba_m.stbastus != 'N' OR g_stba_m.stba006<>'1'  THEN
   #160310-00019#1 20160323 s983961--mod(s)
   #IF g_stba_m.stbastus NOT MATCHES '[NDR]' OR g_stba_m.stba006<>'1'  THEN  #MOD BY zhujing 2015-6-16
   #   CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   #END IF
   
   IF g_stba_m.stbastus NOT MATCHES '[NDR]' OR g_stba_m.stba006<>'1' AND g_stba_m.stba006<>'20' AND g_stba_m.stba006<>'21' THEN  
      CALL cl_set_act_visible("modify,modify_detail",FALSE)
   END IF   
   
   IF g_stba_m.stbastus NOT MATCHES '[NDR]' OR g_stba_m.stba006<>'1'  THEN  
      CALL cl_set_act_visible("delete",FALSE)
   END IF
   #160310-00019#1 20160323 s983961--mod(e)
   #161115-00015#1 -s by 08172
   IF g_stba_m.stbastus NOT MATCHES '[NDR]' OR g_stba_m.stba006 <> '1' THEN 
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF
   #161115-00015#1 -e by 08172   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stba_m_t.* = g_stba_m.*
   LET g_stba_m_o.* = g_stba_m.*
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #重新顯示   
   CALL astt320_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt320_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_insert       LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stbb_d.clear()   
 
 
   INITIALIZE g_stba_m.* TO NULL             #DEFAULT 設定
   
   LET g_stbadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stba_m.stbaownid = g_user
      LET g_stba_m.stbaowndp = g_dept
      LET g_stba_m.stbacrtid = g_user
      LET g_stba_m.stbacrtdp = g_dept 
      LET g_stba_m.stbacrtdt = cl_get_current()
      LET g_stba_m.stbamodid = g_user
      LET g_stba_m.stbamoddt = cl_get_current()
      LET g_stba_m.stbastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stba_m_t.*=g_stba_m.*     
#      LET g_stba_m.stbaunit=g_site

      LET r_insert=TRUE
      CALL s_aooi500_default(g_prog,'stbaunit',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbaunit
      IF NOT r_insert THEN
         RETURN 
      END IF

      CALL s_aooi500_default(g_prog,'stba001',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stba001
      IF NOT r_insert THEN
         RETURN 
      END IF
      
      LET g_stba_m.stbasite=g_site
      #add by geza 20151024(S)
      #抓取结算法人
      SELECT ooef017 INTO g_stba_m.stba022
        FROM ooef_t
       WHERE ooefent=g_enterprise
         AND ooef001=g_stba_m.stbaunit
      CALL astt320_stba022_ref()   
      #add by geza 20151024(E)
      LET g_stba_m.stbadocdt=g_today
      LET g_stba_m.stba006='1'
      #LET g_stba_m.stba008=g_user  #mark by geza 20151201
      #LET g_stba_m.stba009=g_dept  #mark by geza 20151201
      LET g_stba_m.stbastus='N'
      LET g_stba_m.l_amount1=0
      #add by geza 20150611(S)
      IF g_type = '1' THEN
         LET g_stba_m.stba000 = 'astt320'
         LET g_stba_m.stba014 = '1'
      END IF
      IF g_type = '2' THEN
         LET g_stba_m.stba000 = 'astt322'
         LET g_stba_m.stba015 = '1'
         LET g_stba_m.stba014 = '3'
      END IF
      IF g_type = '3' THEN
         LET g_stba_m.stba000 = 'astt323'
         LET g_stba_m.stba014 = '4'
      END IF
      #160310-00019#1 20160323 s983961--add(s)
      IF g_type = '4' THEN
         LET g_stba_m.stba000 = 'astt810'      
         LET g_stba_m.stba003 = '5'
         DISPLAY BY NAME g_stba_m.stbadocdt
      END IF
      #160310-00019#1 20160323 s983961--add(e)
      #add by geza 20150611(E)
      #預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stba_m.stbaunit,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stba_m.stbadocno = r_doctype

      SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stbaunit
         AND ooefl002=g_dlang  
         
      SELECT oofa011 INTO g_stba_m.stba008_desc
        FROM oofa_t
       WHERE oofa002='2'
         AND oofa003=g_stba_m.stba008
         AND oofaent=g_enterprise #160905-00007#16 add
         
      SELECT ooefl003 INTO g_stba_m.stba009_desc
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stba009
         AND ooefl002=g_dlang        
         
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbaownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbamodid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbamodid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbamodid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacnfid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacnfid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacnfid_desc         


      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stba_m_t.* = g_stba_m.*
      LET g_stba_m_o.* = g_stba_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
 
 
 
    
      CALL astt320_input("a")
      
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
         INITIALIZE g_stba_m.* TO NULL
         INITIALIZE g_stbb_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt320_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stbb_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt320_set_act_visible()   
   CALL astt320_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt320_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt320_cl
   
   CALL astt320_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt320_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002, 
       g_stba_m.stba002_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010,g_stba_m.stba000, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba004,g_stba_m.stba004_desc, 
       g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007, 
       g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stba022,g_stba_m.stba022_desc,g_stba_m.stba025, 
       g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba011_desc,g_stba_m.stba012,g_stba_m.stba012_desc, 
       g_stba_m.l_amount1,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid, 
       g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt 
 
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #功能已完成,通報訊息中心
   CALL astt320_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt320_modify()
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
   LET g_stba_m_t.* = g_stba_m.*
   LET g_stba_m_o.* = g_stba_m.*
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   CALL s_transaction_begin()
   
   OPEN astt320_cl USING g_enterprise,g_stba_m.stbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt320_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt320_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt320_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt320_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stbadocno_t = g_stba_m.stbadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stba_m.stbamodid = g_user 
LET g_stba_m.stbamoddt = cl_get_current()
LET g_stba_m.stbamodid_desc = cl_get_username(g_stba_m.stbamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stba_m.stbastus MATCHES "[DR]" THEN
         LET g_stba_m.stbastus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt320_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stba_t SET (stbamodid,stbamoddt) = (g_stba_m.stbamodid,g_stba_m.stbamoddt)
          WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stba_m.* = g_stba_m_t.*
            CALL astt320_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stba_m.stbadocno != g_stba_m_t.stbadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stbb_t SET stbbdocno = g_stba_m.stbadocno
 
          WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m_t.stbadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stbb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
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
   CALL astt320_set_act_visible()   
   CALL astt320_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
   #填到對應位置
   CALL astt320_browser_fill("")
 
   CLOSE astt320_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt320_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt320.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt320_input(p_cmd)
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
   DEFINE l_ooef004    LIKE ooef_t.ooef004
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_errno      STRING
   DEFINE l_oodb006    LIKE oodb_t.oodb006
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   DEFINE r_insert     LIKE type_t.num5
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_stau004    LIKE stau_t.stau004
   DEFINE r_period     LIKE type_t.num5
   DEFINE r_period2    LIKE type_t.num5
   DEFINE l_stae006    LIKE stae_t.stae006
   DEFINE l_stae005    LIKE stae_t.stae005
   DEFINE l_stan005    LIKE stan_t.stan005
   DEFINE l_stan017    LIKE stan_t.stan017
   DEFINE l_stan018    LIKE stan_t.stan018
   DEFINE l_staq003    LIKE staq_t.staq003
   DEFINE  l_pmaa004   LIKE pmaa_t.pmaa004
   DEFINE l_stan029    LIKE stan_t.stan029
   DEFINE l_stbb018    LIKE stbb_t.stbb018
   #160310-00019#1 20160325 s983961--add(s)
   DEFINE l_stia  RECORD   
          stia001      LIKE   stia_t.stia001,        #來源類型
          stia002      LIKE   stia_t.stia002,        #來源單號
          stia003      LIKE   stia_t.stia003,        #商戶編號
          stia004      LIKE   stia_t.stia004,        #商戶連絡電話
          stia005      LIKE   stia_t.stia005,        #主品牌
          stia006      LIKE   stia_t.stia006,        #鋪位編號
          stia007      LIKE   stia_t.stia007,        #鋪位版本
          stia008      LIKE   stia_t.stia008,        #樓棟編號
          stia009      LIKE   stia_t.stia009,        #樓層編號
          stia010      LIKE   stia_t.stia010,        #品類編號
          stia011      LIKE   stia_t.stia011,        #費用編號
          stia012      LIKE   stia_t.stia012,        #預定金額
          stia013      LIKE   stia_t.stia013,        #費用單號
          stia014      LIKE   stia_t.stia014,        #業務人員
          stia015      LIKE   stia_t.stia015,        #業務部門
          stia016      LIKE   stia_t.stia016,        #備註
          stiadocdt    LIKE   stia_t.stiadocdt,      #單據日期
          stiaent      LIKE   stia_t.stiaent,        #企業編號
          stiasite     LIKE   stia_t.stiasite,       #營運據點
          stiastus     LIKE   stia_t.stiastus,       #狀態碼
          stiaunit     LIKE   stia_t.stiaunit        #制定組織
                       END RECORD
   DEFINE l_stic       RECORD   
          stic001      LIKE  stic_t.stic001,        #預租類型
          stic002      LIKE  stic_t.stic002,        #商戶編號
          stic003      LIKE  stic_t.stic003,        #商戶連絡電話
          stic004      LIKE  stic_t.stic004,        #預租開始日期
          stic005      LIKE  stic_t.stic005,        #預租結束日期
          stic006      LIKE  stic_t.stic006,        #原合約編號最
          stic007      LIKE  stic_t.stic007,        #新合約編號最
          stic008      LIKE  stic_t.stic008,        #合約開始日期
          stic009      LIKE  stic_t.stic009,        #合約結束日期
          stic010      LIKE  stic_t.stic010,        #鋪位編號攀期
          stic011      LIKE  stic_t.stic011,        #鋪位版本攀期
          stic012      LIKE  stic_t.stic012,        #樓棟編號攀期
          stic013      LIKE  stic_t.stic013,        #樓層編號攀期
          stic014      LIKE  stic_t.stic014,        #品類編號攀期
          stic015      LIKE  stic_t.stic015,        #主品牌蘀攀期
          stic016      LIKE  stic_t.stic016,        #收銀方式攀期
          stic017      LIKE  stic_t.stic017,        #費用單號攀期
          stic018      LIKE  stic_t.stic018,        #費用編號攀期
          stic019      LIKE  stic_t.stic019,        #預收金額攀期
          stic020      LIKE  stic_t.stic020,        #業務人員攀期
          stic021      LIKE  stic_t.stic021,        #業務部門攀期
          stic022      LIKE  stic_t.stic022,        #終止日期攀期
          stic023      LIKE  stic_t.stic023,        #終止人員攀期
          stic024      LIKE  stic_t.stic024,        #終止部門攀期
          stic025      LIKE  stic_t.stic025,        #備註退門攀期
          sticcnfdt    LIKE  stic_t.sticcnfdt,        #資料確認日
          sticcnfid    LIKE  stic_t.sticcnfid,        #資料確認者
          sticcrtdp    LIKE  stic_t.sticcrtdp,        #資料建立部門
          sticcrtdt    LIKE  stic_t.sticcrtdt,        #資料創建日销
          sticcrtid    LIKE  stic_t.sticcrtid,        #資料建立者销
          sticdocdt    LIKE  stic_t.sticdocdt,        #單據日期耀销
          sticdocno    LIKE  stic_t.sticdocno,        #單據編號耀销
          sticent      LIKE  stic_t.sticent,        #企業編號紀號耀销
          sticmoddt    LIKE  stic_t.sticmoddt,        #最近修改日销
          sticmodid    LIKE  stic_t.sticmodid,        #資料修改者销
          sticowndp    LIKE  stic_t.sticowndp,        #資料所屬部門
          sticownid    LIKE  stic_t.sticownid,        #資料所有者销
          sticsite     LIKE  stic_t.sticsite,        #營運據點最者销
          sticstus     LIKE  stic_t.sticstus,        #狀態碼鸀最者销
          sticunit     LIKE  stic_t.sticunit         #應用組織最者销
                       END RECORD                       
   DEFINE l_sql        STRING    
   #160310-00019#1 20160325 s983961--add(e)      

   DEFINE l_where      STRING              #160511-00034#1 160510 by lori add
   DEFINE l_def_flag   LIKE type_t.chr1    #160511-00034#1 160510 by lori add 
   DEFINE l_stje028    LIKE stje_t.stje028   #160516-00014#10 160603 by sakura add
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
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002, 
       g_stba_m.stba002_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010,g_stba_m.stba000, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba004,g_stba_m.stba004_desc, 
       g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007, 
       g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stba022,g_stba_m.stba022_desc,g_stba_m.stba025, 
       g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba011_desc,g_stba_m.stba012,g_stba_m.stba012_desc, 
       g_stba_m.l_amount1,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid, 
       g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt 
 
   
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
   LET g_forupd_sql = "SELECT stbbseq,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002,stbb003,stbb004, 
       stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013,stbbsite,stbb012,stbb011, 
       stbb017,stbbunit FROM stbb_t WHERE stbbent=? AND stbbdocno=? AND stbbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt320_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt320_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt320_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013, 
       g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014, 
       g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001, 
       g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.l_amount1, 
       g_stba_m.stba008,g_stba_m.stba009
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
  
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.l_amount1,g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba003,g_stba_m.stba004, 
       g_stba_m.stba004_desc,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba006, 
       g_stba_m.stba007,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbasite,g_stba_m.stbastus,g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc, 
       g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid, 
       g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt320.input.head" >}
      #單頭段
      INPUT BY NAME g_stba_m.stbaunit,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013, 
          g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014, 
          g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001, 
          g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.l_amount1, 
          g_stba_m.stba008,g_stba_m.stba009 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt320_cl USING g_enterprise,g_stba_m.stbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt320_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt320_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt320_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            LET g_stbe002_def_flag = ''   #160511-00034#1 160510 by lori add
            LET g_stbe010_def_flag = ''   #160511-00034#1 160510 by lori add
            LET g_stba013_def_flag = ''   #160511-00034#1 160510 by lori add   #160518-00077#1 160518 lori rename
            
            CALL astt320_set_entry(p_cmd)
            CALL astt320_set_no_entry(p_cmd)
            IF p_cmd = 'a' THEN
               IF NOT cl_null(g_stba_m.stba001) AND NOT cl_null(g_stba_m.stbadocdt) THEN
                  CALL s_asti206_check(g_stba_m.stba001,g_stba_m.stbadocdt,g_prog) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err() 
                     LET g_stba_m.stbadocdt=''
                  END IF
                END IF
            END IF            
            #end add-point
            CALL astt320_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbaunit
            
            #add-point:AFTER FIELD stbaunit name="input.a.stbaunit"
            IF  NOT cl_null(g_stba_m.stbaunit) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stbaunit != g_stba_m_t.stbaunit )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stbaunit != g_stba_m_o.stbaunit ) THEN    #160824-00007#181 Add By Ken 161114
                  CALL s_aooi500_chk(g_prog,'stbaunit',g_stba_m.stbaunit,g_site)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stba_m.stbaunit
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     #LET g_stba_m.stbaunit = g_stba_m_t.stbaunit  #160824-00007#181 Mark By Ken 161114
                     LET g_stba_m.stbaunit = g_stba_m_o.stbaunit   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #add by geza 20151024(S)
               #抓取结算法人
               SELECT ooef017 INTO g_stba_m.stba022
                 FROM ooef_t
                WHERE ooefent=g_enterprise
                  AND ooef001=g_stba_m.stbaunit
               CALL astt320_stba022_ref()   
               #add by geza 20151024(E)
            END IF      
            LET g_site_flag = TRUE  #161024-00025#4 by 08172
            CALL astt320_set_entry(p_cmd)
            CALL astt320_set_no_entry(p_cmd)
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stbaunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stbaunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stbaunit_desc
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbaunit
            #add-point:BEFORE FIELD stbaunit name="input.b.stbaunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbaunit
            #add-point:ON CHANGE stbaunit name="input.g.stbaunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocdt
            #add-point:BEFORE FIELD stbadocdt name="input.b.stbadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocdt
            
            #add-point:AFTER FIELD stbadocdt name="input.a.stbadocdt"
            IF  NOT cl_null(g_stba_m.stbadocdt) THEN
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stbadocdt != g_stba_m_t.stbadocdt )) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stbadocdt != g_stba_m_o.stbadocdt ) THEN   #160824-00007#181 Add By Ken 161114
                  #結算會計期檢查
                  IF NOT cl_null(g_stba_m.stba001) AND NOT cl_null(g_stba_m.stbadocdt) THEN
                     CALL s_asti206_check(g_stba_m.stba001,g_stba_m.stbadocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        #LET g_stba_m.stbadocdt = g_stba_m_t.stbadocdt    #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stbadocdt = g_stba_m_o.stbadocdt     #160824-00007#181 Add By Ken 161114
                        NEXT FIELD CURRENT
                     END IF
                  END IF

               END IF
            END IF
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbadocdt
            #add-point:ON CHANGE stbadocdt name="input.g.stbadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbadocno
            #add-point:BEFORE FIELD stbadocno name="input.b.stbadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbadocno
            
            #add-point:AFTER FIELD stbadocno name="input.a.stbadocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stba_m.stbadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stbadocno != g_stbadocno_t )) THEN 
                  IF NOT s_aooi200_chk_slip(g_site,'',g_stba_m.stbadocno,g_prog) THEN
                     LET g_stba_m.stbadocno =  g_stba_m_t.stbadocno                    
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbadocno
            #add-point:ON CHANGE stbadocno name="input.g.stbadocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba002
            
            #add-point:AFTER FIELD stba002 name="input.a.stba002"
            IF  NOT cl_null(g_stba_m.stba002) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba002 != g_stba_m_t.stba002 )) THEN    #160511-00034#1 160510 by lori mark
               IF g_stba_m.stba002 != g_stba_m_o.stba002 OR cl_null(g_stba_m_o.stba002) THEN          #160511-00034#1 160510 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stba_m.stba002
                  IF NOT cl_chk_exist("v_pmaa001_1") THEN
                     LET g_stba_m.stba002 =  g_stba_m_o.stba002   #160511-00034#1 160510 by lori mod
                     NEXT FIELD CURRENT
                  END IF

                  IF NOT cl_null(g_stba_m.stba010) THEN                #160511-00034#1 160510 by lori add
                     LET l_stan005 = ''                                #160511-00034#1 160510 by lori add
                     IF g_type <> '4' THEN                             #160511-00034#1 160510 by lori add
                        #判斷判断供应商跟合同里面的供应商是否一致
                        SELECT stan005 
                          INTO l_stan005
                          FROM stan_t
                         WHERE stanent = g_enterprise 
                           AND stan001 = g_stba_m.stba010
                     ELSE                                             #160511-00034#1 160510 by lori add 
                        #160511-00034#1 160510 by lori add---(S)
                        SELECT stje007 
                          INTO l_stan005
                          FROM stje_t
                         WHERE stjeent = g_enterprise
                           AND stje001 = g_stba_m.stba010                         
                        #160511-00034#1 160510 by lori add---(E)                        
                     END IF                                           #160511-00034#1 160510 by lori add
                     
                     IF  l_stan005 != g_stba_m.stba002 THEN
                         LET g_stba_m.stba002 =  g_stba_m_o.stba002   #160511-00034#1 160510 by lori add
                         INITIALIZE g_errparam TO NULL
                         LET g_errparam.code = "ast-00316"
                         LET g_errparam.extend = g_stba_m.stba010
                         LET g_errparam.popup = TRUE
                         CALL cl_err()
                     
                         NEXT FIELD CURRENT
                     END IF 
                  END IF
                  
                  IF g_type <> '4' THEN                             #160511-00034#1 160510 by lori add
                     IF NOT cl_null(g_stba_m.stba002) AND cl_null(g_stba_m.stba010)  THEN                     
                        LET l_cnt = 0
                        SELECT COUNT(*) INTO l_cnt
                          FROM stan_t
                         WHERE stanent=g_enterprise
                           AND stan005=g_stba_m.stba002                    
                           AND stanstus='Y'
                           #AND stan017<=g_stba_m.stbadocdt #mark by geza 20150703(S)
                           #AND stan018>=g_stba_m.stbadocdt #mark by geza 20150703(S)
                            AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
                         #asti206結算會計期檢查
                                
                         IF l_cnt = 1 THEN
                            CALL astt320_stba002_ref()
                         END IF                       
                     END IF
                  END IF                                            #160511-00034#1 160510 by lori add
                  
                  #交款人带值#add by geza 20150703   
                  IF g_type='2' THEN  
                     #IF g_stba_m.stba002 != g_stba_m_t.stba002 OR g_stba_m_t.stba002 IS NULL  THEN   #160824-00007#181 Mark By Ken 161114
                     IF g_stba_m.stba002 != g_stba_m_o.stba002 OR g_stba_m_o.stba002 IS NULL  THEN    #160824-00007#181 Add By Ken 161114
                        INITIALIZE l_pmaa004 TO NULL
                        SELECT pmaa004 INTO l_pmaa004
                          FROM pmaa_t
                         WHERE pmaaent = g_enterprise
                           AND pmaa001 = g_stba_m.stba002
                         IF l_pmaa004 = '2'  THEN
                            INITIALIZE g_ref_fields TO NULL
                            LET g_ref_fields[1] = g_stba_m.stba002
                            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                            LET g_stba_m.stba016 = '', g_rtn_fields[1] , ''
                            DISPLAY BY NAME g_stba_m.stba016
                         ELSE
                            LET  g_stba_m.stba016 = ''                  
                         END IF   
                     END IF
                  END IF
               
               END IF

               #160310-00019#1 s983961--add(e)
               #mark by geza 20160624 #160604-00009#69(S)
               #160511-00034#1 160510 by lori add---(S)
#               LET l_success = ''
#               LET l_def_flag = ''
#               
#               CALL astt320_stba_def(1) RETURNING l_success,l_def_flag
#               IF l_success THEN
#                  IF l_def_flag = 'Y' THEN
#                     LET g_stbe002_def_flag = 'Y'
#                  END IF   
#               END IF
               #160511-00034#1 160510 by lori add---(E)
               #mark by geza 20160624 #160604-00009#69(E)
               #add by geza 20160624 #160604-00009#69(S)
               #合同不为空，判断合同和供应商是否存在合同
               IF g_type='4' THEN 
                  IF g_stba_m.stba010 IS NOT NULL THEN
                     LET l_cnt = 0 
                     SELECT COUNT(*) INTO l_cnt
                       FROM stje_t
                      WHERE stjeent = g_enterprise 
                        AND stje001 = g_stba_m.stba010
                        AND stje007 = g_stba_m.stba002
                        AND stjestus = 'Y'
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00316'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()      
                        LET g_stba_m.stba002 = g_stba_m_o.stba002                     
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  CALL astt320_get_stje007()
               END IF   
               #add by geza 20160624 #160604-00009#69(E)
            END IF
            
            IF cl_null(g_stba_m.stba002) THEN
               LET  g_stba_m.stba016 = ''
            END IF
            CALL astt320_set_entry(p_cmd)        #add by geza 20150703 
            CALL astt320_set_no_entry(p_cmd)     #add by geza 20150703 
            #add by geza 20150703(E)
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba002
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba002_desc 
            
            LET g_stba_m_o.stba002 = g_stba_m.stba002       #160511-00034#1 160510 by lori mod    
            LET g_stba_m_o.* = g_stba_m.*    #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba002
            #add-point:BEFORE FIELD stba002 name="input.b.stba002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba002
            #add-point:ON CHANGE stba002 name="input.g.stba002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba013
            
            #add-point:AFTER FIELD stba013 name="input.a.stba013"
            #160518-00077#1 160518 lori mark and add---(E)
            #IF NOT cl_null(g_stba_m.stba013) THEN 
            #   #應用 a17 樣板自動產生(Version:2)
            #   #欄位存在檢查
            #   #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
            #   INITIALIZE g_chkparam.* TO NULL
            #   LET g_chkparam.arg1 = g_stba_m.stba013
            #   IF cl_chk_exist("v_mhae001") THEN  
            #   ELSE
            #      #檢查失敗時後續處理
            #      NEXT FIELD CURRENT
            #   END IF
            #END IF
            #
            LET g_stba_m.stba013_desc = ''
            DISPLAY BY NAME g_stba_m.stba013_desc
            IF NOT cl_null(g_stba_m.stba013) THEN
               IF g_stba_m.stba013 != g_stba_m_o.stba013 OR cl_null(g_stba_m_o.stba013) THEN
                  IF g_type = '4' THEN
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_stba_m.stba013     
                     IF NOT cl_chk_exist("v_mhbe001") THEN
                        LET g_stba_m.stba013 = g_stba_m_o.stba013
                        CALL astt320_stba013_ref()
                        NEXT FIELD CURRENT
                     END IF 
                     #mark by geza 20160624 #160604-00009#69(S)
#                     LET l_success = ''
#                     LET l_def_flag = ''
#                     
#                     CALL astt320_stba_def(3) RETURNING l_success,l_def_flag
#                     IF l_success THEN
#                        IF l_def_flag = 'Y' THEN
#                           LET g_stba013_def_flag = 'Y'
#                        END IF   
#                     END IF
                     #mark by geza 20160624 #160604-00009#69(E)
                     #add by geza 20160624 #160604-00009#69(S)
                     #合同不为空，判断合同和铺位是否存在合同
                     IF g_type='4' THEN 
                        IF g_stba_m.stba010 IS NOT NULL THEN
                           LET l_cnt = 0 
                           SELECT COUNT(*) INTO l_cnt
                             FROM stje_t
                            WHERE stjeent = g_enterprise 
                              AND stje001 = g_stba_m.stba010
                              AND stje008 = g_stba_m.stba013
                              AND stjestus = 'Y'
                           IF l_cnt = 0 THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'ast-00650'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              LET g_errparam.replace[1] = g_stba_m.stba013
                              CALL cl_err()      
                              LET g_stba_m.stba013 = g_stba_m_o.stba013                     
                              NEXT FIELD CURRENT
                           END IF
                        END IF
                        CALL astt320_get_stje008()
                     END IF   
                     #add by geza 20160624 #160604-00009#69(E)
                  ELSE
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_stba_m.stba013
                     IF cl_chk_exist("v_mhae001") THEN  
                     ELSE
                        LET g_stba_m.stba013 = g_stba_m_o.stba013
                        CALL astt320_stba013_ref()
                        NEXT FIELD CURRENT
                     END IF                  
                  END IF
               END IF
            END IF 
            
            CALL astt320_stba013_ref()
            CALL astt320_set_entry(p_cmd)
            CALL astt320_set_no_entry(p_cmd)
            LET g_stba_m_o.stba013 = g_stba_m_o.stba013
            #160518-00077#1 160518 lori mark and add---(E)
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba013
            #add-point:BEFORE FIELD stba013 name="input.b.stba013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba013
            #add-point:ON CHANGE stba013 name="input.g.stba013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba010
            #add-point:BEFORE FIELD stba010 name="input.b.stba010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba010
            
            #add-point:AFTER FIELD stba010 name="input.a.stba010"
            IF NOT cl_null(g_stba_m.stba010) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba010 != g_stba_m_t.stba010 )) THEN    #160511-00034#1 160510 by lori mark
               IF g_stba_m.stba010 != g_stba_m_o.stba010 OR cl_null(g_stba_m_o.stba010) THEN          #160511-00034#1 160510 by lori add
                  IF g_type!='4' THEN   #160310-00019#1 s983961--add
                     IF g_stba_m.stba006 != '20' OR cl_null(g_stba_m.stba007) THEN
                        INITIALIZE g_chkparam.* TO NULL
                        LET g_chkparam.arg1 = g_stba_m.stba010            
                        IF NOT cl_chk_exist("v_stan001") THEN
                           LET g_stba_m.stba010 = g_stba_m_o.stba010                                  #160511-00034#1 160510 by lori mod         
                           NEXT FIELD CURRENT
                        END IF 
                        #合約生效日期範圍判斷  #mark by geza 20150703(S) 
#                        IF NOT cl_null(g_stba_m.stbadocdt) THEN
#                           SELECT stan017,stan018 INTO l_stan017,l_stan018 
#                             FROM stan_t
#                            WHERE stanent=g_enterprise
#                              AND stan001=g_stba_m.stba010
#                              AND stanstus='Y' 
#                           IF l_stan017>g_stba_m.stbadocdt OR l_stan018<g_stba_m.stbadocdt THEN
#                              LET g_stba_m.stba010 = g_stba_m_t.stba010
#                              INITIALIZE g_errparam TO NULL
#                              LET g_errparam.code = "ast-00047"
#                              LET g_errparam.extend = g_stba_m.stba010
#                              LET g_errparam.popup = TRUE
#                              CALL cl_err()
#                       
#                              NEXT FIELD CURRENT
#                           END IF  
#                        END IF
                        #add by geza 20150703(E)
                        #add by geza 20150703(S)  
                        SELECT stan029  INTO l_stan029
                          FROM stan_t
                         WHERE stanent=g_enterprise
                           AND stan001=g_stba_m.stba010
                           AND stanstus='Y' 
                        IF l_stan029 = '5' THEN
                           LET g_stba_m.stba010 = g_stba_m_o.stba010   #160511-00034#1 160510 by lori mod
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00366"
                           LET g_errparam.extend = g_stba_m.stba010
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                        
                           NEXT FIELD CURRENT
                        END IF 
                        IF l_stan029 = '7' THEN
                           LET g_stba_m.stba010 = g_stba_m_o.stba010   #160511-00034#1 160510 by lori mod
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00367"
                           LET g_errparam.extend = g_stba_m.stba010
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                        
                           NEXT FIELD CURRENT
                        END IF                 
                        #add by geza 20150703(E)
                        CALL astt320_stba010_ref()
                        #交款人带值#add by geza 20150703   
                        IF g_type='2' AND g_stba_m.stba002 IS NOT NULL THEN
                           #IF g_stba_m.stba002 != g_stba_m_t.stba002 OR g_stba_m_t.stba002 IS NULL  THEN   #160824-00007#181 Mark By Ken 161114          
                           IF g_stba_m.stba002 != g_stba_m_o.stba002 OR g_stba_m_o.stba002 IS NULL  THEN    #160824-00007#181 Add By Ken 161114           
                              INITIALIZE l_pmaa004 TO NULL
                              SELECT pmaa004 INTO l_pmaa004
                                FROM pmaa_t
                               WHERE pmaaent = g_enterprise
                                 AND pmaa001 = g_stba_m.stba002
                               IF l_pmaa004 = '2'  THEN
                                  INITIALIZE g_ref_fields TO NULL
                                  LET g_ref_fields[1] = g_stba_m.stba002
                                  CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                                  LET g_stba_m.stba016 = '', g_rtn_fields[1] , ''
                                  DISPLAY BY NAME g_stba_m.stba016
                               ELSE
                                  LET  g_stba_m.stba016 = ''       
                               END IF   
                           END IF
                        END IF
                     END IF  
                  ELSE
                     #160604-00009#69 #add by geza 20160624(S)
                     LET l_cnt = 0 
                     SELECT COUNT(*) INTO l_cnt
                       FROM stje_t
                      WHERE stjeent = g_enterprise 
                        AND stje001 = g_stba_m.stba010
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00651'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()      
                        LET g_stba_m.stba010 = g_stba_m_o.stba010                     
                        NEXT FIELD CURRENT
                     END IF
                     LET l_cnt = 0 
                     SELECT COUNT(*) INTO l_cnt
                       FROM stje_t
                      WHERE stjeent = g_enterprise 
                        AND stje001 = g_stba_m.stba010
                        AND stjestus = 'Y'
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00652'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()      
                        LET g_stba_m.stba010 = g_stba_m_o.stba010                     
                        NEXT FIELD CURRENT
                     END IF    
                     CALL astt320_get_stje001()                     
                     #160604-00009#69 #add by geza 20160624(E)
                     #mark by geza 20160624 #160604-00009#69(S)
                     #160310-00019#1 s983961--add(s)
#                     INITIALIZE g_chkparam.* TO NULL                        #160511-00034#1 160510 by lori add
#                     LET g_chkparam.arg1 = g_stba_m.stba010            
#                     IF NOT cl_chk_exist("v_stje001") THEN
#                        LET g_stba_m.stba010 = g_stba_m_o.stba010           #160511-00034#1 160510 by lori mod        
#                        NEXT FIELD CURRENT
#                     END IF 
                     #160310-00019#1 s983961--add(e)

                     #160511-00034#1 160510 by lori add---(S)
#                     LET l_success = ''
#                     LET l_def_flag = ''
#                     
#                     CALL astt320_stba_def(2) RETURNING l_success,l_def_flag
#                     IF l_success THEN
#                        IF l_def_flag = 'Y' THEN
#                           LET g_stbe010_def_flag = 'Y'
#                        END IF   
#                     END IF
                     #160511-00034#1 160510 by lori add---(E)
                     #mark by geza 20160624 #160604-00009#69(E)
                  END IF   
               #add by geza 20150703(E)   
               END IF
            END IF
            
            IF cl_null(g_stba_m.stba002) THEN
               LET  g_stba_m.stba016 = ''
            END IF            
            CALL astt320_set_entry(p_cmd)               #add by geza 20150703 
            CALL astt320_set_no_entry(p_cmd)            #add by geza 20150703
           #LET g_stba_m_t.stba002 = g_stba_m.stba002   #160511-00034#1 160510 by lori mark
            LET g_stba_m_o.stba002 = g_stba_m.stba002   #160511-00034#1 160510 by lori add
            LET g_stba_m_o.* = g_stba_m.*    #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba010
            #add-point:ON CHANGE stba010 name="input.g.stba010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba000
            #add-point:BEFORE FIELD stba000 name="input.b.stba000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba000
            
            #add-point:AFTER FIELD stba000 name="input.a.stba000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba000
            #add-point:ON CHANGE stba000 name="input.g.stba000"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba003
            #add-point:BEFORE FIELD stba003 name="input.b.stba003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba003
            
            #add-point:AFTER FIELD stba003 name="input.a.stba003"
            IF  NOT cl_null(g_stba_m.stba003) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba003 != g_stba_m_t.stba003 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba003 != g_stba_m_o.stba003 ) THEN   #160824-00007#181 Add By Ken 161114
                  CALL astt320_stba003_ref() 
               END IF               
            END IF  
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba003
            #add-point:ON CHANGE stba003 name="input.g.stba003"
            IF  NOT cl_null(g_stba_m.stba003) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba003 != g_stba_m_t.stba003 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba003 != g_stba_m_o.stba003 ) THEN    #160824-00007#181 Add By Ken 161114
                  CALL astt320_stba003_ref() 
               END IF               
            END IF           
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba005
            
            #add-point:AFTER FIELD stba005 name="input.a.stba005"



            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba005
            #add-point:BEFORE FIELD stba005 name="input.b.stba005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba005
            #add-point:ON CHANGE stba005 name="input.g.stba005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba004
            
            #add-point:AFTER FIELD stba004 name="input.a.stba004"



            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba004
            #add-point:BEFORE FIELD stba004 name="input.b.stba004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba004
            #add-point:ON CHANGE stba004 name="input.g.stba004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba014
            #add-point:BEFORE FIELD stba014 name="input.b.stba014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba014
            
            #add-point:AFTER FIELD stba014 name="input.a.stba014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba014
            #add-point:ON CHANGE stba014 name="input.g.stba014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba015
            #add-point:BEFORE FIELD stba015 name="input.b.stba015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba015
            
            #add-point:AFTER FIELD stba015 name="input.a.stba015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba015
            #add-point:ON CHANGE stba015 name="input.g.stba015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba016
            #add-point:BEFORE FIELD stba016 name="input.b.stba016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba016
            
            #add-point:AFTER FIELD stba016 name="input.a.stba016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba016
            #add-point:ON CHANGE stba016 name="input.g.stba016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbastus
            #add-point:BEFORE FIELD stbastus name="input.b.stbastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbastus
            
            #add-point:AFTER FIELD stbastus name="input.a.stbastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbastus
            #add-point:ON CHANGE stbastus name="input.g.stbastus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba006
            #add-point:BEFORE FIELD stba006 name="input.b.stba006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba006
            
            #add-point:AFTER FIELD stba006 name="input.a.stba006"
            #160310-00019#1 20160325 s983961--add(s)
            IF  NOT cl_null(g_stba_m.stba006) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba006 != g_stba_m_t.stba006 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba006 != g_stba_m_o.stba006 ) THEN   #160824-00007#181 Add By Ken 161114
                  IF NOT cl_null(g_stba_m.stba007) THEN
                     #確認資料無重複
                     IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stba_t WHERE "||"stbaent = '" ||g_enterprise|| "' AND "||"stba007 = '"||g_stba_m.stba007 ||"'  AND "||"stbastus != 'X' ",'std-00004',0) THEN 
                        #LET g_stba_m.stba006  = g_stba_m_t.stba006  #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stba006  = g_stba_m_o.stba006   #160824-00007#181 Add By Ken 161114
                        NEXT FIELD CURRENT
                     END IF     
                     
                      CALL cl_set_comp_entry('stbb016',FALSE)      
                     IF g_type='4'  THEN
                        LET l_success = TRUE                   
                        IF g_stba_m.stba006 = '20' THEN
                            INITIALIZE g_chkparam.* TO NULL
                            LET g_chkparam.arg1 = g_stba_m.stba007
                            IF NOT cl_chk_exist("v_stba007") THEN
                              #LET g_stba_m.stba006  = g_stba_m_t.stba006  #160824-00007#181 Mark By Ken 161114
                              LET g_stba_m.stba006  = g_stba_m_o.stba006   #160824-00007#181 Add By Ken 161114                              
                              NEXT FIELD CURRENT
                            ELSE
                               LET g_stba_m.stba014 = '7'          
                                                                         
                               #帶出意向協議
                               SELECT stiaent,stiasite,stiaunit,stiadocdt,
                               stia001,stia002, stia003, stia004,  stia005, 
                               stia006,stia007, stia008, stia009,  stia010,
                               stia011,stia012, stia013, stia014,  stia015,
                               stia016,stiastus
                                 INTO l_stia.stiaent,l_stia.stiasite,l_stia.stiaunit,l_stia.stiadocdt,            
                                      l_stia.stia001,l_stia.stia002,l_stia.stia003,l_stia.stia004,l_stia.stia005, 
                                      l_stia.stia006,l_stia.stia007,l_stia.stia008,l_stia.stia009,l_stia.stia010, 
                                      l_stia.stia011,l_stia.stia012,l_stia.stia013,l_stia.stia014,l_stia.stia015,
                                      l_stia.stia016,l_stia.stiastus
                                 FROM stia_t
                                WHERE stiadocno = g_stba_m.stba007 AND stiaent = g_enterprise
                                
                               #單頭
                               #幣別/稅別
                               SELECT pmab033,pmab034 INTO g_stba_m.stba011,g_stba_m.stba012
                                 FROM pmab_t
                                WHERE pmabent = g_enterprise AND pmabsite = l_stia.stiasite AND pmab001 = l_stia.stia003  
                               LET g_stba_m.stbasite  = l_stia.stiasite
                               LET g_stba_m.stbaunit  = l_stia.stiaunit
                               LET g_stba_m.stbadocdt = g_today
                               LET g_stba_m.stba002 = l_stia.stia003  
                               LET g_stba_m.stba003 = '5'      
                               LET g_stba_m.stba006 = '20'   
                               LET g_stba_m.stba008 = l_stia.stia014  
                               LET g_stba_m.stba009 = l_stia.stia015   
                               LET g_stba_m.stba015 = 'N'   
                               LET g_stba_m.stba013 = l_stia.stia006      #160518-00077#1 160518 by lori mod stba024->stba013
                               LET g_stba_m.stba026 = l_stia.stiadocdt       
                               LET g_stba_m.stbastus  = 'N' 
                               LET g_stba_m.l_amount1 = l_stia.stia012                               
                               #供應商說明
                               INITIALIZE g_ref_fields TO NULL
                               LET g_ref_fields[1] = g_stba_m.stba002
                               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                               LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
                               DISPLAY BY NAME g_stba_m.stba002_desc 
                               #鋪位名稱
                               CALL astt320_stba013_ref()
                               #應用組織名稱
                               SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
                                 FROM ooefl_t
                                WHERE ooeflent=g_enterprise
                                  AND ooefl001=g_stba_m.stbaunit
                                  AND ooefl002=g_dlang  
                               #人員名稱   
                               SELECT oofa011 INTO g_stba_m.stba008_desc
                                 FROM oofa_t
                                WHERE oofa002='2'
                                  AND oofa003=g_stba_m.stba008
                                  AND oofaent=g_enterprise #160905-00007#16 add
                              DISPLAY BY NAME g_stba_m.stba008_desc      
                               #部門名稱   
                               SELECT ooefl003 INTO g_stba_m.stba009_desc
                                 FROM ooefl_t
                                WHERE ooeflent=g_enterprise
                                  AND ooefl001=g_stba_m.stba009
                                  AND ooefl002=g_dlang       
                               DISPLAY BY NAME g_stba_m.stba009_desc                                   
                               #單身  
                               LET g_stbb_d[1].stbbsite  = l_stia.stiasite   
                               LET g_stbb_d[1].stbbunit  = l_stia.stiaunit   
                               LET g_stbb_d[1].stbbseq   = '1' 
                               LET g_stbb_d[1].stbb001   = l_stia.stia011
                               LET g_stbb_d[1].stbb005   = g_today  
                               LET g_stbb_d[1].stbb006   = g_today 
                               LET g_stbb_d[1].stbb009   = l_stia.stia012   
                               LET g_stbb_d[1].stbb011   = l_stia.stia010
                               LET g_stbb_d[1].stbb015   = 'N'
                               LET g_stbb_d[1].stbb016   = 'N'
                               #費用編號說明
                               INITIALIZE g_ref_fields TO NULL
                               LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
                               CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
                               LET g_stbb_d[l_ac].stbb001_desc = '', g_rtn_fields[1] , ''
                               DISPLAY g_stbb_d[l_ac].stbb001_desc TO stbb001_desc    
                                                              
                            END IF
                        END IF                        
                        IF g_stba_m.stba006 = '21' THEN
                           INITIALIZE g_chkparam.* TO NULL
                           LET g_chkparam.arg1 = g_stba_m.stba007
                           IF NOT cl_chk_exist("v_stba007_1") THEN
                              #LET g_stba_m.stba006  = g_stba_m_t.stba006  #160824-00007#181 Mark By Ken 161114
                              LET g_stba_m.stba006  = g_stba_m_o.stba006   #160824-00007#181 Add By Ken 161114                              
                              NEXT FIELD CURRENT
                           ELSE
                              LET g_stba_m.stba014 = '8'   
                              SELECT sticent, sticsite, sticunit,  sticdocdt, sticdocno,
                                     stic001, stic002,  stic003,   stic004,   stic005,  stic006,
                                     stic007, stic008,  stic009,   stic010,   stic011,  stic012,
                                     stic013, stic014,  stic015,   stic016,   stic017,  stic018,
                                     stic019, stic020,  stic021,   stic022,   stic023,  stic024,
                                     stic025, sticstus
                                INTO  l_stic.sticent,l_stic.sticsite ,l_stic.sticunit ,l_stic.sticdocdt,l_stic.sticdocno,
                                      l_stic.stic001,l_stic.stic002  ,l_stic.stic003  ,l_stic.stic004  ,l_stic.stic005  ,l_stic.stic006,
                                      l_stic.stic007,l_stic.stic008  ,l_stic.stic009  ,l_stic.stic010  ,l_stic.stic011  ,l_stic.stic012,
                                      l_stic.stic013,l_stic.stic014  ,l_stic.stic015  ,l_stic.stic016  ,l_stic.stic017  ,l_stic.stic018,
                                      l_stic.stic019,l_stic.stic020  ,l_stic.stic021  ,l_stic.stic022  ,l_stic.stic023  ,l_stic.stic024,
                                      l_stic.stic025,l_stic.sticstus
                                FROM stic_t   
                               WHERE sticent = g_enterprise AND sticdocno = g_stba_m.stba007                                   
                              #單頭
                              #幣別/稅別
                              SELECT pmab033,pmab034 INTO g_stba_m.stba011,g_stba_m.stba012
                                FROM pmab_t
                               WHERE pmabent = g_enterprise AND pmabsite = l_stic.sticsite AND pmab001 = l_stic.stic002
                               
                              LET g_stba_m.stbasite = l_stic.sticsite
                              LET g_stba_m.stbaunit  = l_stic.sticunit
                              LET g_stba_m.stbadocdt = g_today
                              LET g_stba_m.stba002 = l_stic.stic002 
                              LET g_stba_m.stba003 = '5'   
                              LET g_stba_m.stba006 = '21'   
                              LET g_stba_m.stba008 = g_user
                              LET g_stba_m.stba009 = g_dept                                 
                              IF NOT cl_null(l_stic.stic007) THEN
                                LET g_stba_m.stba010 = l_stic.stic007
                              ELSE
                                LET g_stba_m.stba010 = l_stic.stic006   
                              END IF  
                              LET g_stba_m.stba015 = 'N'     
                              LET g_stba_m.stba013 = l_stic.stic010   #160518-00077#1 160518 by lori mod stba024->stba913
                              LET g_stba_m.stba025 = ''
                              LET g_stba_m.stba026 = l_stic.sticdocdt   
                              LET g_stba_m.stbastus  = 'N'        
                              LET g_stba_m.l_amount1 =  l_stic.stic019   
                              #供應商說明
                              INITIALIZE g_ref_fields TO NULL
                              LET g_ref_fields[1] = g_stba_m.stba002
                              CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                              LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
                              DISPLAY BY NAME g_stba_m.stba002_desc 
                              #鋪位名稱
                              CALL astt320_stba013_ref()
                              #應用組織名稱
                              SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stbaunit
                                 AND ooefl002=g_dlang  
                              #人員名稱   
                              SELECT oofa011 INTO g_stba_m.stba008_desc
                                FROM oofa_t
                               WHERE oofa002='2'
                                 AND oofa003=g_stba_m.stba008
                                 AND oofaent=g_enterprise #160905-00007#16 add
                              DISPLAY BY NAME g_stba_m.stba008_desc        
                              #部門名稱   
                              SELECT ooefl003 INTO g_stba_m.stba009_desc
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stba009
                                 AND ooefl002=g_dlang         
                              DISPLAY BY NAME g_stba_m.stba009_desc                                     
                              #單身
                              LET g_stbb_d[1].stbbsite  = l_stic.sticsite   
                              LET g_stbb_d[1].stbbseq   = '1' 
                              LET g_stbb_d[1].stbb001   = l_stic.stic018
                              LET g_stbb_d[1].stbb005   = g_today   
                              LET g_stbb_d[1].stbb006   = g_today    
                              LET g_stbb_d[1].stbb009   = l_stic.stic019  
                              LET g_stbb_d[1].stbb011   = l_stic.stic014 
                              LET g_stbb_d[1].stbb015   = 'N'
                              LET g_stbb_d[1].stbb016   = 'N'
                              #費用編號說明
                              INITIALIZE g_ref_fields TO NULL
                              LET g_ref_fields[1] = g_stbb_d[1].stbb001
                              CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
                              LET g_stbb_d[1].stbb001_desc = '', g_rtn_fields[1] , ''
                              DISPLAY g_stbb_d[1].stbb001_desc TO stbb001_desc                                  
                           END IF
                        END IF
                                                                                          
                     END IF
                  END IF
                  LET g_stba_m_t.stba006 =  g_stba_m.stba006
               END IF              
            END IF
            
            IF g_type = '4' AND NOT cl_null(g_stba_m.stba006) AND NOT cl_null(g_stba_m.stba007) THEN
               CALL cl_set_comp_entry("stba006,stba007",FALSE)     
               CALL cl_set_comp_entry("stbadocdt,stba002,stba003,stba006,stba008",FALSE)            
               CALL cl_set_comp_entry("stba009,stba010,stba015,stba013,stba026",FALSE)      #160518-00077#1 160518 by lori mod stba024->stba013
            END IF   
            #160310-00019#1 20160325 s983961--add(e)
            LET g_stba_m_o.* =  g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba006
            #add-point:ON CHANGE stba006 name="input.g.stba006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba007
            #add-point:BEFORE FIELD stba007 name="input.b.stba007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba007
            
            #add-point:AFTER FIELD stba007 name="input.a.stba007"
            #160310-00019#1 20160325 s983961--add(s)
            IF  NOT cl_null(g_stba_m.stba007) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba007 != g_stba_m_t.stba007 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba007 != g_stba_m_o.stba007 ) THEN    #160824-00007#181 Add By Ken 161114
                  IF NOT cl_null(g_stba_m.stba006) THEN
                     #確認資料無重複
                     IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stba_t WHERE "||"stbaent = '" ||g_enterprise|| "' AND "||"stba007 = '"||g_stba_m.stba007 ||"'  AND "||"stbastus != 'X' ",'std-00004',0) THEN 
                        #LET g_stba_m.stba007  = g_stba_m_t.stba007  #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stba007  = g_stba_m_o.stba007   #160824-00007#181 Add By Ken 161114
                        NEXT FIELD CURRENT
                     END IF     
                     
                     IF g_type='4'  THEN
                        LET l_success = TRUE                  
                        IF g_stba_m.stba006 = '20' THEN
                            INITIALIZE g_chkparam.* TO NULL
                            LET g_chkparam.arg1 = g_stba_m.stba007
                            IF NOT cl_chk_exist("v_stba007") THEN
                              #LET g_stba_m.stba007  = g_stba_m_t.stba007  #160824-00007#181 Mark By Ken 161114
                              LET g_stba_m.stba007  = g_stba_m_o.stba007   #160824-00007#181 Add By Ken 161114
                              NEXT FIELD CURRENT
                            ELSE
                               LET g_stba_m.stba014 = '7'          
                               CALL cl_set_comp_required("stba010",FALSE)                               
                               #帶出意向協議
                               SELECT stiaent,stiasite,stiaunit,stiadocdt,
                               stia001,stia002, stia003, stia004,  stia005, 
                               stia006,stia007, stia008, stia009,  stia010,
                               stia011,stia012, stia013, stia014,  stia015,
                               stia016,stiastus
                                 INTO l_stia.stiaent,l_stia.stiasite,l_stia.stiaunit,l_stia.stiadocdt,            
                                      l_stia.stia001,l_stia.stia002,l_stia.stia003,l_stia.stia004,l_stia.stia005, 
                                      l_stia.stia006,l_stia.stia007,l_stia.stia008,l_stia.stia009,l_stia.stia010, 
                                      l_stia.stia011,l_stia.stia012,l_stia.stia013,l_stia.stia014,l_stia.stia015,
                                      l_stia.stia016,l_stia.stiastus
                                 FROM stia_t
                                WHERE stiadocno = g_stba_m.stba007 AND stiaent = g_enterprise                                
                               #單頭
                               LET g_stba_m.stbasite  = l_stia.stiasite
                               LET g_stba_m.stbaunit  = l_stia.stiaunit
                               LET g_stba_m.stbadocdt = g_today
                               LET g_stba_m.stba002 = l_stia.stia003  
                               LET g_stba_m.stba003 = '5'      
                               LET g_stba_m.stba006 = '20'   
                               LET g_stba_m.stba008 = g_user
                               LET g_stba_m.stba009 = g_dept   
                               LET g_stba_m.stba015 = 'N'   
                               LET g_stba_m.stba013 = l_stia.stia006     #160518-00077#1 160518 by lori mod stba024->stba013
                               LET g_stba_m.stba026 = l_stia.stiadocdt       
                               LET g_stba_m.stbastus  = 'N' 
                               LET g_stba_m.l_amount1 = l_stia.stia012   
                               #供應商說明
                              INITIALIZE g_ref_fields TO NULL
                              LET g_ref_fields[1] = g_stba_m.stba002
                              CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                              LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
                              DISPLAY BY NAME g_stba_m.stba002_desc 
                              #鋪位名稱
                              CALL astt320_stba013_ref()
                              #應用組織名稱
                              SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stbaunit
                                 AND ooefl002=g_dlang  
                              #人員名稱   
                              SELECT oofa011 INTO g_stba_m.stba008_desc
                                FROM oofa_t
                               WHERE oofa002='2'
                                 AND oofa003=g_stba_m.stba008
                                 AND oofaent=g_enterprise #160905-00007#16 add
                              DISPLAY BY NAME g_stba_m.stba008_desc        
                              #部門名稱   
                              SELECT ooefl003 INTO g_stba_m.stba009_desc
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stba009
                                 AND ooefl002=g_dlang   
                               DISPLAY BY NAME g_stba_m.stba009_desc                                     
                               #單身  
                               LET g_stbb_d[1].stbbsite  = l_stia.stiasite   
                               LET g_stbb_d[1].stbbunit  = l_stia.stiaunit   
                               LET g_stbb_d[1].stbbseq   = '1' 
                               LET g_stbb_d[1].stbb001   = l_stia.stia011
                               LET g_stbb_d[1].stbb005   = g_today  
                               LET g_stbb_d[1].stbb006   = g_today 
                               LET g_stbb_d[1].stbb009   = l_stia.stia012   
                               LET g_stbb_d[1].stbb011   = l_stia.stia010 
                               #費用編號說明
                               INITIALIZE g_ref_fields TO NULL
                               LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
                               CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
                               LET g_stbb_d[l_ac].stbb001_desc = '', g_rtn_fields[1] , ''
                               DISPLAY g_stbb_d[l_ac].stbb001_desc TO stbb001_desc                                       
                            END IF
                        END IF                        
                        IF g_stba_m.stba006 = '21' THEN
                           INITIALIZE g_chkparam.* TO NULL
                           LET g_chkparam.arg1 = g_stba_m.stba007
                           IF NOT cl_chk_exist("v_stba007_1") THEN
                              #LET g_stba_m.stba007  = g_stba_m_t.stba007  #160824-00007#181 Mark By Ken 161114
                              LET g_stba_m.stba007  = g_stba_m_o.stba007   #160824-00007#181 Add By Ken 161114                              
                              NEXT FIELD CURRENT
                           ELSE
                              LET g_stba_m.stba014 = '8'   
                              SELECT sticent, sticsite, sticunit,  sticdocdt, sticdocno,
                                     stic001, stic002,  stic003,   stic004,   stic005,  stic006,
                                     stic007, stic008,  stic009,   stic010,   stic011,  stic012,
                                     stic013, stic014,  stic015,   stic016,   stic017,  stic018,
                                     stic019, stic020,  stic021,   stic022,   stic023,  stic024,
                                     stic025, sticstus
                                INTO  l_stic.sticent,l_stic.sticsite ,l_stic.sticunit ,l_stic.sticdocdt,l_stic.sticdocno,
                                      l_stic.stic001,l_stic.stic002  ,l_stic.stic003  ,l_stic.stic004  ,l_stic.stic005  ,l_stic.stic006,
                                      l_stic.stic007,l_stic.stic008  ,l_stic.stic009  ,l_stic.stic010  ,l_stic.stic011  ,l_stic.stic012,
                                      l_stic.stic013,l_stic.stic014  ,l_stic.stic015  ,l_stic.stic016  ,l_stic.stic017  ,l_stic.stic018,
                                      l_stic.stic019,l_stic.stic020  ,l_stic.stic021  ,l_stic.stic022  ,l_stic.stic023  ,l_stic.stic024,
                                      l_stic.stic025,l_stic.sticstus
                                FROM stic_t   
                               WHERE sticent = g_enterprise AND sticdocno = g_stba_m.stba007                                   
                              #單頭
                              LET g_stba_m.stbasite = l_stic.sticsite
                              LET g_stba_m.stbaunit  = l_stic.sticunit
                              LET g_stba_m.stbadocdt = g_today
                              LET g_stba_m.stba000 = 'astt810'
                              LET g_stba_m.stba002 = l_stic.stic002 
                              LET g_stba_m.stba003 = '5'   
                              LET g_stba_m.stba006 = '21'   
                              LET g_stba_m.stba008 = g_user
                              LET g_stba_m.stba009 = g_dept
                              IF NOT cl_null(l_stic.stic007) THEN
                                LET g_stba_m.stba010 = l_stic.stic007
                              ELSE
                                LET g_stba_m.stba010 = l_stic.stic006   
                              END IF  
                              LET g_stba_m.stba015 = 'N'     
                              LET g_stba_m.stba013 = l_stic.stic010   #160518-00077#1 160518 by lori mod stba024->stba013
                              LET g_stba_m.stba025 = ''
                              LET g_stba_m.stba026 = l_stic.sticdocdt   
                              LET g_stba_m.stbastus  = 'N'             
                              LET g_stba_m.l_amount1 = l_stic.stic019   
                              #供應商說明
                              INITIALIZE g_ref_fields TO NULL
                              LET g_ref_fields[1] = g_stba_m.stba002
                              CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                              LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
                              DISPLAY BY NAME g_stba_m.stba002_desc 
                              #鋪位名稱
                              CALL astt320_stba013_ref()
                              #應用組織名稱
                              SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stbaunit
                                 AND ooefl002=g_dlang  
                              #人員名稱   
                              SELECT oofa011 INTO g_stba_m.stba008_desc
                                FROM oofa_t
                               WHERE oofa002='2'
                                 AND oofa003=g_stba_m.stba008
                                 AND oofaent=g_enterprise #160905-00007#16 add
                              DISPLAY BY NAME g_stba_m.stba008_desc    
                              #部門名稱   
                              SELECT ooefl003 INTO g_stba_m.stba009_desc
                                FROM ooefl_t
                               WHERE ooeflent=g_enterprise
                                 AND ooefl001=g_stba_m.stba009
                                 AND ooefl002=g_dlang      
                              DISPLAY BY NAME g_stba_m.stba009_desc                                 
                              #單身
                              LET g_stbb_d[1].stbbsite  = l_stic.sticsite   
                              LET g_stbb_d[1].stbbseq   = '1' 
                              LET g_stbb_d[1].stbb001   = l_stic.stic018
                              LET g_stbb_d[1].stbb005   = g_today   
                              LET g_stbb_d[1].stbb006   = g_today    
                              LET g_stbb_d[1].stbb009   = l_stic.stic019  
                              LET g_stbb_d[1].stbb011   = l_stic.stic014      
                              #費用編號說明
                              INITIALIZE g_ref_fields TO NULL
                              LET g_ref_fields[1] = g_stbb_d[1].stbb001
                              CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
                              LET g_stbb_d[1].stbb001_desc = '', g_rtn_fields[1] , ''
                              DISPLAY g_stbb_d[1].stbb001_desc TO stbb001_desc                                      
                           END IF
                        END IF
                                                                                          
                     END IF
                  END IF
               END IF
            END IF
            
            IF g_type = '4' AND NOT cl_null(g_stba_m.stba006) AND NOT cl_null(g_stba_m.stba007) THEN
               CALL cl_set_comp_entry("stba006,stba007",FALSE)     
               CALL cl_set_comp_entry("stbadocdt,stba002,stba003,stba006,stba008",FALSE)            
               CALL cl_set_comp_entry("stba009,stba010,stba015,stba013,stba026",FALSE)    #160518-00077#1 160518 by lori mod stba024->stba013
            END IF   
            #160310-00019#1 20160325 s983961--add(e)
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba007
            #add-point:ON CHANGE stba007 name="input.g.stba007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba001
            
            #add-point:AFTER FIELD stba001 name="input.a.stba001"
            IF  NOT cl_null(g_stba_m.stba001) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba001 != g_stba_m_t.stba001 )) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba001 != g_stba_m_o.stba001 ) THEN    #160824-00007#181 Add By Ken 161114
                  IF s_aooi500_setpoint(g_prog,'stba001') THEN
                     CALL s_aooi500_chk(g_prog,'stba001',g_stba_m.stba001,g_site)
                      RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = g_stba_m.stba001
                        LET g_errparam.code   = l_errno
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        
                        #LET g_stba_m.stba001 = g_stba_m_t.stba001  #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stba001 = g_stba_m_o.stba001   #160824-00007#181 Add By Ken 161114
                        NEXT FIELD CURRENT
                     END IF
                  ELSE
                     INITIALIZE g_chkparam.* TO NULL
                       #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_stba_m.stba001
                     IF NOT cl_chk_exist("v_ooef001_31") THEN
                        #LET g_stba_m.stba001 = g_stba_m_t.stba001  #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stba001 = g_stba_m_o.stba001   #160824-00007#181 Add By Ken 161114                        
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  
               END IF
               IF NOT cl_null(g_stba_m.stbadocdt) THEN
                     CALL s_asti206_check(g_stba_m.stba001,g_stba_m.stbadocdt,g_prog) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = l_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        #LET g_stba_m.stba001 = g_stba_m_t.stba001  #160824-00007#181 Mark By Ken 161114
                        LET g_stba_m.stba001 = g_stba_m_o.stba001   #160824-00007#181 Add By Ken 161114                        
                        NEXT FIELD CURRENT
                     END IF
               END IF
            END IF    

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba001
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba001_desc
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114        


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba001
            #add-point:BEFORE FIELD stba001 name="input.b.stba001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba001
            #add-point:ON CHANGE stba001 name="input.g.stba001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba022
            
            #add-point:AFTER FIELD stba022 name="input.a.stba022"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba022
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba022_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba022_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba022
            #add-point:BEFORE FIELD stba022 name="input.b.stba022"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba022
            #add-point:ON CHANGE stba022 name="input.g.stba022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba025
            #add-point:BEFORE FIELD stba025 name="input.b.stba025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba025
            
            #add-point:AFTER FIELD stba025 name="input.a.stba025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba025
            #add-point:ON CHANGE stba025 name="input.g.stba025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba026
            #add-point:BEFORE FIELD stba026 name="input.b.stba026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba026
            
            #add-point:AFTER FIELD stba026 name="input.a.stba026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba026
            #add-point:ON CHANGE stba026 name="input.g.stba026"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba011
            
            #add-point:AFTER FIELD stba011 name="input.a.stba011"
            IF  NOT cl_null(g_stba_m.stba011) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba011 != g_stba_m_t.stba011 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba011 != g_stba_m_o.stba011 ) THEN    #160824-00007#181 Add By Ken 161114
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stba_m.stba011               
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooaj002") THEN
                     #LET g_stba_m.stba011 = g_stba_m_t.stba011   #160824-00007#181 Mark By Ken 161114
                     LET g_stba_m.stba011 = g_stba_m_o.stba011    #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF

               END IF
            END IF 

            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba011
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba011_desc
            LET g_stba_m_o.* = g_stba_m.*  #160824-00007#181 Add By Ken 161114

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba011
            #add-point:BEFORE FIELD stba011 name="input.b.stba011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba011
            #add-point:ON CHANGE stba011 name="input.g.stba011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba012
            
            #add-point:AFTER FIELD stba012 name="input.a.stba012"
            IF  NOT cl_null(g_stba_m.stba012) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stba_m.stba012 != g_stba_m_t.stba012 )) THEN    #160824-00007#181 Mark By Ken 161114
               IF (g_stba_m.stba012 != g_stba_m_o.stba012 ) THEN    #160824-00007#181 Add By Ken 161114
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數 
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_stba_m.stba012                  
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_oodb002") THEN
                     #LET g_stba_m.stba012 = g_stba_m_t.stba012  #160824-00007#181 Mark By Ken 161114
                     LET g_stba_m.stba012 = g_stba_m_o.stba012   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            
            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stba_m.stba012
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba012_desc
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba012
            #add-point:BEFORE FIELD stba012 name="input.b.stba012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba012
            #add-point:ON CHANGE stba012 name="input.g.stba012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_amount1
            #add-point:BEFORE FIELD l_amount1 name="input.b.l_amount1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_amount1
            
            #add-point:AFTER FIELD l_amount1 name="input.a.l_amount1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_amount1
            #add-point:ON CHANGE l_amount1 name="input.g.l_amount1"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba008
            
            #add-point:AFTER FIELD stba008 name="input.a.stba008"
            IF NOT cl_null(g_stba_m.stba008) THEN
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND g_stba_m.stba008 != g_stba_m_t.stba008) THEN   #160824-00007#181 Mark By Ken 161114
               IF g_stba_m.stba008 != g_stba_m_o.stba008 THEN    #160824-00007#181 Add By Ken 161114
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stba_m.stba008
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooag001") THEN
                     #LET g_stba_m.stba008 =  g_stba_m_t.stba008  #160824-00007#181 Mark By Ken 161114               
                     LET g_stba_m.stba008 =  g_stba_m_o.stba008   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF 
            END IF     
            IF cl_null(g_stba_m.stba009) THEN
               SELECT ooag003 INTO g_stba_m.stba009
                FROM ooag_t
               WHERE ooagent=g_enterprise
                 AND ooag001=g_stba_m.stba008  
               SELECT ooefl003 INTO g_stba_m.stba009_desc
                FROM ooefl_t
               WHERE ooeflent=g_enterprise
                 AND ooefl001=g_stba_m.stba009
                 AND ooefl002=g_dlang 
                 
               DISPLAY BY NAME g_stba_m.stba009
               DISPLAY BY NAME g_stba_m.stba009_desc 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stba_m.stba008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba008_desc
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba008
            #add-point:BEFORE FIELD stba008 name="input.b.stba008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba008
            #add-point:ON CHANGE stba008 name="input.g.stba008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stba009
            
            #add-point:AFTER FIELD stba009 name="input.a.stba009"
            IF NOT cl_null(g_stba_m.stba009) THEN
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND g_stba_m.stba009 != g_stba_m_t.stba009) THEN   #160824-00007#181 Mark By Ken 161114
               IF g_stba_m.stba009 != g_stba_m_o.stba009 THEN    #160824-00007#181 Add By Ken 161114
                 INITIALIZE g_chkparam.* TO NULL
		           LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stba_m.stba009
                  LET g_chkparam.arg2 = g_today
		            LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                        #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                     #LET g_stba_m.stba009 = g_stba_m_t.stba009  #160824-00007#181 Mark By Ken 161114
                     LET g_stba_m.stba009 = g_stba_m_o.stba009   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF 
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba009_desc
            LET g_stba_m_o.* = g_stba_m.*   #160824-00007#181 Add By Ken 161114


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stba009
            #add-point:BEFORE FIELD stba009 name="input.b.stba009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stba009
            #add-point:ON CHANGE stba009 name="input.g.stba009"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stbaunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbaunit
            #add-point:ON ACTION controlp INFIELD stbaunit name="input.c.stbaunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stbaunit            #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbaunit',g_stba_m.stbaunit,'i') #150308-00001#5  By geza add 'i'
            CALL q_ooef001_24()

            LET  g_stba_m.stbaunit = g_qryparam.return1              

            DISPLAY g_stba_m.stbaunit TO stbaunit              #
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stbaunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stbaunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stbaunit_desc
            
            NEXT FIELD stbaunit                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocdt
            #add-point:ON ACTION controlp INFIELD stbadocdt name="input.c.stbadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbadocno
            #add-point:ON ACTION controlp INFIELD stbadocno name="input.c.stbadocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stbadocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise            
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stba_m.stbadocno = g_qryparam.return1              

            DISPLAY g_stba_m.stbadocno TO stbadocno              #

            NEXT FIELD stbadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba002
            #add-point:ON ACTION controlp INFIELD stba002 name="input.c.stba002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba002             #給予default值
            LET g_qryparam.default2 = "" #g_stba_m.pmaal004 #交易對象簡稱
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_10()                                #呼叫開窗

            LET g_stba_m.stba002 = g_qryparam.return1              
            #LET g_stba_m.pmaal004 = g_qryparam.return2             
            DISPLAY g_stba_m.stba002 TO stba002              #
            IF NOT cl_null(g_stba_m.stba002) AND NOT cl_null(g_stba_m.stbadocdt) AND cl_null(g_stba_m.stba010)  THEN
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM stan_t
                WHERE stanent=g_enterprise
                  AND stan005=g_stba_m.stba002
                 
                  AND stanstus='Y'
               #   AND stan017<=g_stba_m.stbadocdt #mark by geza 20150703
               #   AND stan018>=g_stba_m.stbadocdt #mark by geza 20150703
                  AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
                #asti206結算會計期檢查
                       
                IF l_cnt = 1 THEN
                   CALL astt320_stba002_ref()
                END IF     
                  
                     
            END IF
            
                 
            #DISPLAY g_stba_m.pmaal004 TO pmaal004 #交易對象簡稱
            NEXT FIELD stba002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba013
            #add-point:ON ACTION controlp INFIELD stba013 name="input.c.stba013"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stba_m.stba013      

            #160518-00077#1 160518 by lori mod---(S)
            IF g_type = '4' THEN
               #CALL q_mhbc001_1()  #160516-00014#10 160603 by sakura mark
               #mark by geza 20160624 #160604-00009#69(s)
#               #160516-00014#10 160603 by sakura add(S)
#               IF NOT cl_null(g_stba_m.stba013) THEN
#                  LET g_qryparam.where = " stje007 = '",g_stba_m.stba002,"'"
#               ELSE
#                  LET g_qryparam.where = " stje011 <= '",g_today,"' AND stje012 >= '",g_today,"'"
#               END IF
#               CALL q_stje008_2()
               #160516-00014#10 160603 by sakura add(E)
               #mark by geza 20160624 #160604-00009#69(e)
               #add by geza 20160624 #160604-00009#69(S)
               IF g_stba_m.stba002 IS NOT NULL THEN
                  LET g_qryparam.where = " stje007 = '",g_stba_m.stba002,"'"
               END IF
               IF g_stba_m.stba010 IS NOT NULL THEN
                  IF g_qryparam.where IS NULL THEN
                     LET g_qryparam.where = " stje001 = '",g_stba_m.stba010,"'"
                  ELSE    
                     LET g_qryparam.where = g_qryparam.where," AND stje001 = '",g_stba_m.stba010,"'"
                  END IF                
               END IF
               CALL q_stje008_1()   
               #add by geza 20160624 #160604-00009#69(E)
            ELSE    
               LET g_qryparam.arg1 = g_site
               CALL q_mhae001_2()                 
            END IF
            #160518-00077#1 160518 by lori mod---(E)
            
            LET g_stba_m.stba013 = g_qryparam.return1      
            DISPLAY g_stba_m.stba013 TO stba013       
            CALL astt320_stba013_ref()
            
            NEXT FIELD stba013              

            #END add-point
 
 
         #Ctrlp:input.c.stba010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba010
            #add-point:ON ACTION controlp INFIELD stba010 name="input.c.stba010"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba010             #給予default值

            #160511-00034#1 160510 by lori mark---(S)
            ##給予arg     
            #IF NOT cl_null(g_stba_m.stba002) THEN 
            #   LET g_qryparam.where = " stan005 ='",g_stba_m.stba002,"'" #s
            #END IF
            #
            ##160310-00019#1 20160323 s983961--ADD(s)
            #IF g_type='4' THEN 
            #   LET g_qryparam.where = " stan002 = '5'  "
            #END IF   
            ##160310-00019#1 20160323 s983961--ADD(e)
            #CALL q_stan001_2()                                #呼叫開窗
            #160511-00034#1 160510 by lori mark---(E) 

            #160511-00034#1 160510 by lori add---(S)
            IF g_type='4' THEN
               #mark by geza 20160624 #160604-00009#69(S)
#               LET l_where = " stje005 IN ('2','3','4','5','6') "  #Modify By Ken 160615加上6
#               
#               IF NOT cl_null(g_stba_m.stba002) THEN 
#                  LET l_where = l_where," AND stje007 ='",g_stba_m.stba002,"'" 
#               END IF   
#
#               LET g_qryparam.where = l_where
               #mark by geza 20160624 #160604-00009#69(e)
               #add by geza 20160624 #160604-00009#69(S)
               IF g_stba_m.stba002 IS NOT NULL THEN
                  LET g_qryparam.where = " stje007 = '",g_stba_m.stba002,"'"
               END IF
               IF g_stba_m.stba013 IS NOT NULL THEN
                  IF g_qryparam.where IS NULL THEN
                     LET g_qryparam.where = " stje008 = '",g_stba_m.stba013,"'"
                  ELSE    
                     LET g_qryparam.where = g_qryparam.where," AND stje008 = '",g_stba_m.stba013,"'"
                  END IF                
               END IF
               #add by geza 20160624 #160604-00009#69(E)
               CALL q_stje001()
            ELSE
               IF NOT cl_null(g_stba_m.stba002) THEN 
                  LET g_qryparam.where = " stan005 ='",g_stba_m.stba002,"'" 
               END IF            
               CALL q_stan001_2()      
            END IF
            #160511-00034#1 160510 by lori add---(E)
            
            LET g_stba_m.stba010 = g_qryparam.return1  
            DISPLAY g_stba_m.stba010 TO stba010   
                                                   
            NEXT FIELD stba010                    

            #END add-point
 
 
         #Ctrlp:input.c.stba000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba000
            #add-point:ON ACTION controlp INFIELD stba000 name="input.c.stba000"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba003
            #add-point:ON ACTION controlp INFIELD stba003 name="input.c.stba003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba005
            #add-point:ON ACTION controlp INFIELD stba005 name="input.c.stba005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba004
            #add-point:ON ACTION controlp INFIELD stba004 name="input.c.stba004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba014
            #add-point:ON ACTION controlp INFIELD stba014 name="input.c.stba014"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba015
            #add-point:ON ACTION controlp INFIELD stba015 name="input.c.stba015"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba016
            #add-point:ON ACTION controlp INFIELD stba016 name="input.c.stba016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbastus
            #add-point:ON ACTION controlp INFIELD stbastus name="input.c.stbastus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba006
            #add-point:ON ACTION controlp INFIELD stba006 name="input.c.stba006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba007
            #add-point:ON ACTION controlp INFIELD stba007 name="input.c.stba007"
            #160310-00019#1 20160325 s983961--add(s)
            IF NOT cl_null(g_stba_m.stba006) THEN
               CASE g_stba_m.stba006
                 WHEN '20'               
                    INITIALIZE g_qryparam.* TO NULL
                    LET g_qryparam.state = 'i'
                    LET g_qryparam.reqry = FALSE
                    CALL q_stiadocno()
                    LET g_stba_m.stba007 = g_qryparam.return1
                  WHEN '21'   
                    INITIALIZE g_qryparam.* TO NULL
                    LET g_qryparam.state = 'i'
                    LET g_qryparam.reqry = FALSE
                    CALL q_sticdocno()
                    LET g_stba_m.stba007 = g_qryparam.return1
               END CASE               
            END IF
            #160310-00019#1 20160323 s983961--add(e)
            #END add-point
 
 
         #Ctrlp:input.c.stba001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba001
            #add-point:ON ACTION controlp INFIELD stba001 name="input.c.stba001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba001             #給予default值

            #給予arg
            IF s_aooi500_setpoint(g_prog,'stba001') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stba001',g_stba_m.stba001,'i') #150308-00001#5  By geza add 'i'
               CALL q_ooef001_24()
            ELSE            
               CALL q_ooef001_23()                                #呼叫開窗
            END IF

            LET g_stba_m.stba001 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba001
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba001_desc
            DISPLAY g_stba_m.stba001 TO stba001              #

            NEXT FIELD stba001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba022
            #add-point:ON ACTION controlp INFIELD stba022 name="input.c.stba022"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba025
            #add-point:ON ACTION controlp INFIELD stba025 name="input.c.stba025"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba026
            #add-point:ON ACTION controlp INFIELD stba026 name="input.c.stba026"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba011
            #add-point:ON ACTION controlp INFIELD stba011 name="input.c.stba011"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba011             #給予default值
            LET g_qryparam.default2 = "" #g_stba_m.ooail003 #說明
            #給予arg
            LET g_qryparam.arg1 =g_site


            CALL q_ooaj002_3()                                #呼叫開窗

            LET g_stba_m.stba011 = g_qryparam.return1              
            #LET g_stba_m.ooail003 = g_qryparam.return2 
            DISPLAY g_stba_m.stba011 TO stba011              #
            #DISPLAY g_stba_m.ooail003 TO ooail003 #說明
            NEXT FIELD stba011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba012
            #add-point:ON ACTION controlp INFIELD stba012 name="input.c.stba012"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba012             #給予default值
            LET g_qryparam.default2 = "" #g_stba_m.oodb002 #稅別代碼
            #給予arg
            LET g_qryparam.arg1 = g_stba_m.stbaunit


            CALL q_oodb002_8()                                #呼叫開窗

            LET g_stba_m.stba012 = g_qryparam.return1              
            #LET g_stba_m.oodb002 = g_qryparam.return2 
            DISPLAY g_stba_m.stba012 TO stba012              #
            #DISPLAY g_stba_m.oodb002 TO oodb002 #稅別代碼
            



            SELECT ooef019 INTO l_ooef019
              FROM ooef_t 
              WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = l_ooef019
            LET g_ref_fields[2] = g_stba_m.stba012
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba012_desc
            
            NEXT FIELD stba012                          #返回原欄位

            #END add-point
 
 
         #Ctrlp:input.c.l_amount1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_amount1
            #add-point:ON ACTION controlp INFIELD l_amount1 name="input.c.l_amount1"
            
            #END add-point
 
 
         #Ctrlp:input.c.stba008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba008
            #add-point:ON ACTION controlp INFIELD stba008 name="input.c.stba008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stba_m.stba008 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stba_m.stba008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba008_desc
            DISPLAY g_stba_m.stba008 TO stba008              #

            NEXT FIELD stba008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stba009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stba009
            #add-point:ON ACTION controlp INFIELD stba009 name="input.c.stba009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stba_m.stba009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today #

            
            CALL q_ooeg001_4()                                #呼叫開窗

            LET g_stba_m.stba009 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stba_m.stba009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stba_m.stba009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stba_m.stba009_desc
            DISPLAY g_stba_m.stba009 TO stba009              #

            NEXT FIELD stba009                          #返回原欄位


            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stba_m.stbadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_stba_m.stbadocno,g_stba_m.stbadocdt,g_prog) RETURNING l_success,g_stba_m.stbadocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG                  
               END IF 
               
               IF g_stba_m.stba006 = '21' OR g_stba_m.stba006 = '20' AND NOT cl_null(g_stba_m.stba007) THEN
                  CALL astt810_stba007_ref(g_stba_m.stba006,g_stba_m.stba007) RETURNING l_success  
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')  
                     NEXT FIELD stba007                      
                  END IF                     
               END IF
               #end add-point
               
               INSERT INTO stba_t (stbaent,stbaunit,stbadocdt,stbadocno,stba002,stba013,stba010,stba000, 
                   stba003,stba005,stba004,stba014,stba015,stba016,stbastus,stba006,stba007,stba001, 
                   stba022,stba025,stbasite,stba026,stba011,stba012,stba008,stba009,stbaownid,stbaowndp, 
                   stbacrtid,stbacrtdp,stbacrtdt,stbamodid,stbamoddt,stbacnfid,stbacnfdt)
               VALUES (g_enterprise,g_stba_m.stbaunit,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002, 
                   g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003,g_stba_m.stba005, 
                   g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
                   g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025, 
                   g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008, 
                   g_stba_m.stba009,g_stba_m.stbaownid,g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp, 
                   g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stba_m:",SQLERRMESSAGE 
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
                  CALL astt320_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt320_b_fill()
                  CALL astt320_b_fill2('0')
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
               CALL astt320_stba_t_mask_restore('restore_mask_o')
               
               UPDATE stba_t SET (stbaunit,stbadocdt,stbadocno,stba002,stba013,stba010,stba000,stba003, 
                   stba005,stba004,stba014,stba015,stba016,stbastus,stba006,stba007,stba001,stba022, 
                   stba025,stbasite,stba026,stba011,stba012,stba008,stba009,stbaownid,stbaowndp,stbacrtid, 
                   stbacrtdp,stbacrtdt,stbamodid,stbamoddt,stbacnfid,stbacnfdt) = (g_stba_m.stbaunit, 
                   g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010, 
                   g_stba_m.stba000,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014, 
                   g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007, 
                   g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite,g_stba_m.stba026, 
                   g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
                   g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
                   g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt)
                WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stba_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt320_stba_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stba_m_t)
               LET g_log2 = util.JSON.stringify(g_stba_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stbadocno_t = g_stba_m.stbadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt320.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stbb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stbb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt320_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stbb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            CALL astt320_set_entry(p_cmd)
            CALL astt320_set_no_entry(p_cmd)
            CALL astt320_set_no_visible_b()   #160510-00010#5 160514 by lori add
            CALL astt320_set_visible_b()      #160510-00010#5 160514 by lori add
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            CALL astt320_set_entry(p_cmd)
            CALL astt320_set_no_entry(p_cmd)           
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
            OPEN astt320_cl USING g_enterprise,g_stba_m.stbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt320_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt320_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stbb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stbb_d[l_ac].stbbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stbb_d_t.* = g_stbb_d[l_ac].*  #BACKUP
               LET g_stbb_d_o.* = g_stbb_d[l_ac].*  #BACKUP
               CALL astt320_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               IF g_stbb_d[l_ac].stbb001 IS NOT NULL THEN
            
                  SELECT stae006 
                    INTO l_stae006
                    FROM stae_t
                   WHERE staeent = g_enterprise 
                     AND stae001 = g_stbb_d[l_ac].stbb001
                  IF l_stae006 = '1' OR l_stae006 = '2' THEN
                     CALL cl_set_comp_entry('stbb004',FALSE)
                  ELSE 
                     CALL cl_set_comp_entry('stbb004',TRUE)               
                  END IF
               END IF   
               #end add-point  
               CALL astt320_set_no_entry_b(l_cmd)
               IF NOT astt320_lock_b("stbb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt320_bcl INTO g_stbb_d[l_ac].stbbseq,g_stbb_d[l_ac].stbb001,g_stbb_d[l_ac].stbb030, 
                      g_stbb_d[l_ac].stbb031,g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016,g_stbb_d[l_ac].stbb002, 
                      g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb004,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006, 
                      g_stbb_d[l_ac].stbb007,g_stbb_d[l_ac].stbb008,g_stbb_d[l_ac].stbb014,g_stbb_d[l_ac].stbb019, 
                      g_stbb_d[l_ac].stbb009,g_stbb_d[l_ac].stbb010,g_stbb_d[l_ac].stbb013,g_stbb_d[l_ac].stbbsite, 
                      g_stbb_d[l_ac].stbb012,g_stbb_d[l_ac].stbb011,g_stbb_d[l_ac].stbb017,g_stbb_d[l_ac].stbbunit 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stbb_d_t.stbbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stbb_d_mask_o[l_ac].* =  g_stbb_d[l_ac].*
                  CALL astt320_stbb_t_mask()
                  LET g_stbb_d_mask_n[l_ac].* =  g_stbb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt320_show()
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
            INITIALIZE g_stbb_d[l_ac].* TO NULL 
            INITIALIZE g_stbb_d_t.* TO NULL 
            INITIALIZE g_stbb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stbb_d[l_ac].stbb014 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_site_flag = FALSE  #161024-00025#4 by 08172
            LET g_stbb_d[g_detail_idx].stbb002 = g_stba_m.stba011     
#            LET g_stbb_d[g_detail_idx].stbb003 = g_stba_m.stba012
#            SELECT ooef019 INTO l_ooef019
#              FROM ooef_t 
#              WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = l_ooef019
#            LET g_ref_fields[2] = g_stbb_d[l_ac].stbb003
#            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
#            LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc  
             #160516-00014#10 160603 by sakura add(S)
             IF g_type = '4' THEN
                 SELECT stje028 INTO l_stje028
                   FROM stje_t
                  WHERE stjeent = g_enterprise
                    AND stje001 = g_stba_m.stba010
                 LET g_stbb_d[g_detail_idx].stbb011 = l_stje028
                 LET g_stbb_d[l_ac].stbb009 = NULL   #160604-00009#58 160618 by sakura add                 
             ELSE
             #160516-00014#10 160603 by sakura add(E)
                # 所属品类给合同品类，所属部门给单头部门 
                # add by geza 20150625 (S)
                SELECT staq003 INTO l_staq003 
                  FROM staq_t 
                 WHERE staqent = g_enterprise
                   AND staq001 = g_stba_m.stba010             
                   AND staq005 = 'Y'
                LET g_stbb_d[g_detail_idx].stbb011 = l_staq003
             END IF   #160516-00014#10 160603 by sakura add
             LET g_stbb_d[g_detail_idx].stbb012 = g_stba_m.stba009
            #160516-00014#10 160603 by sakura add(S)
            
            #160516-00014#10 160603 by sakura add(S)
            # add by geza 20150625 (E)
            #end add-point
            LET g_stbb_d_t.* = g_stbb_d[l_ac].*     #新輸入資料
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt320_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt320_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stbb_d[li_reproduce_target].* = g_stbb_d[li_reproduce].*
 
               LET g_stbb_d[li_reproduce_target].stbbseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            SELECT MAX(stbbseq) INTO g_stbb_d[l_ac].stbbseq
              FROM stbb_t
             WHERE stbbent= g_enterprise
               AND stbbdocno= g_stba_m.stbadocno
            IF cl_null(g_stbb_d[l_ac].stbbseq) THEN
               LET g_stbb_d[l_ac].stbbseq=1
            ELSE
               LET  g_stbb_d[l_ac].stbbseq=g_stbb_d[l_ac].stbbseq+1
            END IF 
            DISPLAY g_stbb_d[l_ac].stbbseq TO stbbseq
            
            #mark by geza 20151024(S)
#            CALL s_aooi500_default(g_prog,'stbbsite',g_stba_m.stbasite) RETURNING r_insert,g_stbb_d[l_ac].stbbsite
#            IF NOT r_insert THEN
#               CANCEL INSERT 
#            END IF   
            #mark by geza 20151024(E)
            LET g_stbb_d[l_ac].stbbsite = g_stba_m.stbaunit  #add by geza 20151024
            IF cl_null(g_stbb_d[l_ac].stbb005) THEN
               LET g_stbb_d[l_ac].stbb005=g_today
            END IF    
            LET g_stbb_d[l_ac].stbb010='1'
            LET g_stbb_d[l_ac].stbb013='1'  
            DISPLAY g_stbb_d[l_ac].stbb010 TO stbb010
            DISPLAY g_stbb_d[l_ac].stbb013 TO stbb013            
            DISPLAY g_stbb_d[l_ac].stbb005 TO stbb005
            DISPLAY g_stbb_d[l_ac].stbbsite TO stbbsite  
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbbsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbbsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbbsite_desc           
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
            SELECT COUNT(1) INTO l_count FROM stbb_t 
             WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno
 
               AND stbbseq = g_stbb_d[l_ac].stbbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stba_m.stbadocno
               LET gs_keys[2] = g_stbb_d[g_detail_idx].stbbseq
               CALL astt320_insert_b('stbb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stbb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt320_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               CALL astt320_stbb009_sum()   #160604-00009#58 160618 by sakura add
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
               LET gs_keys[01] = g_stba_m.stbadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stbb_d_t.stbbseq
 
            
               #刪除同層單身
               IF NOT astt320_delete_b('stbb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt320_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt320_key_delete_b(gs_keys,'stbb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt320_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt320_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stbb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stbb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbseq
            #add-point:BEFORE FIELD stbbseq name="input.b.page1.stbbseq"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbseq
            
            #add-point:AFTER FIELD stbbseq name="input.a.page1.stbbseq"
            #此段落由子樣板a05產生
            IF  g_stba_m.stbadocno IS NOT NULL AND g_stbb_d[g_detail_idx].stbbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stba_m.stbadocno != g_stbadocno_t OR g_stbb_d[g_detail_idx].stbbseq != g_stbb_d_t.stbbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stbb_t WHERE "||"stbbent = '" ||g_enterprise|| "' AND "||"stbbdocno = '"||g_stba_m.stbadocno ||"' AND "|| "stbbseq = '"||g_stbb_d[g_detail_idx].stbbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbbseq
            #add-point:ON CHANGE stbbseq name="input.g.page1.stbbseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb001
            
            #add-point:AFTER FIELD stbb001 name="input.a.page1.stbb001"
            IF NOT cl_null(g_stbb_d[l_ac].stbb001) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb001<>g_stbb_d_t.stbb001)) THEN   #160510-00010#5 160514 by lori mark
               IF g_stbb_d[l_ac].stbb001 <> g_stbb_d_o.stbb001 OR cl_null(g_stbb_d_o.stbb001) THEN     #160510-00010#5 160514 by lori add
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb001
                  IF NOT cl_chk_exist("v_stae001") THEN
                     LET g_stbb_d[l_ac].stbb001 =  g_stbb_d_o.stbb001                                  #160510-00010#5 160514 by lori mod 
                     NEXT FIELD CURRENT
                  END IF
                  CALL astt320_stbb001_ref()

                  #權責發生制費用不可以跨月錄入                  
                  IF NOT cl_null(g_stbb_d[l_ac].stbb001) AND NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                     LET l_stae005=''
                     SELECT stae005 INTO l_stae005
                       FROM stae_t
                      WHERE staeent=g_enterprise
                        AND stae001=g_stbb_d[l_ac].stbb001
                        AND staestus='Y'
                     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                        IF YEAR(g_stbb_d[l_ac].stbb006)-YEAR(g_stbb_d[l_ac].stbb005)>0 OR MONTH(g_stbb_d[l_ac].stbb006)-MONTH(g_stbb_d[l_ac].stbb005)>0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00084"
                           LET g_errparam.extend = ""
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                       
                           LET g_stbb_d[l_ac].stbb006 = g_stbb_d_t.stbb006
                           LET g_stbb_d[l_ac].stbb001 = g_stbb_d_t.stbb001
                           LET g_stbb_d[l_ac].stbb004 = g_stbb_d_t.stbb004
                           LET g_stbb_d[l_ac].stbb007 = g_stbb_d_t.stbb007
                           LET g_stbb_d[l_ac].stbb008 = g_stbb_d_t.stbb008
                           LET g_stbb_d[l_ac].stbb014 = g_stbb_d_t.stbb014
                           NEXT FIELD CURRENT
                        END IF   
                     END IF
                  END IF
                  
                  CALL astt320_stbb003_init() #add by geza 20151215                              
                  
                  #160510-00010#5 160514 by lori add---(S)
                  LET g_stbb_d[l_ac].stbb015 = ''   #160512-00003#9 160518 by lori add 
                  LET g_stbb_d[l_ac].stbb016 = ''   #160512-00003#9 160518 by lori add 
                  LET g_stbb_d[l_ac].stbb030 = ''
                  LET g_stbb_d[l_ac].stbb031 = ''
                  LET g_stbb_d[l_ac].stbb031_desc = ''
                  
                  CALL s_expense_get_stae_info(g_stbb_d[l_ac].stbb001)
                     RETURNING g_stbb_d[l_ac].stbb016,g_stbb_d[l_ac].stbb015,   #160512-00003#9 160518 by lori add 
                               g_stbb_d[l_ac].stbb030,g_stbb_d[l_ac].stbb031
                  
                  IF g_stbb_d[l_ac].stbb030 = '1' AND cl_null(g_stbb_d[l_ac].stbb031) THEN
                     #LET g_stbb_d[l_ac].stbb030 = g_stba_m.stbasite   #160516-00014#10 160603 by sakura mark
                     LET g_stbb_d[l_ac].stbb031 = g_stba_m.stbasite    #160516-00014#10 160603 by sakura add
                  END IF
                  
                  #160516-00014#10 160603 by sakura add(S)
                  IF g_stbb_d[l_ac].stbb030 = '3' THEN
                     LET g_stbb_d[l_ac].stbb031 = ''
                  END IF
                  #160516-00014#10 160603 by sakura add(E)
                  
                  LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_department_desc(g_stbb_d[l_ac].stbb031)                  
                  #160510-00010#5 160514 by lori add---(E)   
               END IF
               
               #判断价格类型的栏位开启与关闭
               SELECT stae006 
                 INTO l_stae006
                 FROM stae_t
                WHERE staeent = g_enterprise 
                  AND stae001 = g_stbb_d[l_ac].stbb001 
               IF l_stae006 = '1' OR l_stae006 = '2' THEN
                  CALL cl_set_comp_entry('stbb004',FALSE)
               ELSE 
                  CALL cl_set_comp_entry('stbb004',TRUE)               
               END IF 
            END IF             
            
            CALL astt320_set_entry_b(l_cmd)
            CALL astt320_set_no_entry_b(l_cmd)
            
            #160510-00010#5 160514 by lori add---(S)
            CALL astt320_set_no_require_b()
            CALL astt320_set_require_b() 
            
            LET g_stbb_d_o.stbb001 = g_stbb_d[l_ac].stbb001 
            LET g_stbb_d_o.stbb015 = g_stbb_d[l_ac].stbb015
            LET g_stbb_d_o.stbb016 = g_stbb_d[l_ac].stbb016
            LET g_stbb_d_o.stbb030 = g_stbb_d[l_ac].stbb030  
            LET g_stbb_d_o.stbb031 = g_stbb_d[l_ac].stbb031              
            #160510-00010#5 160514 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb001
            #add-point:BEFORE FIELD stbb001 name="input.b.page1.stbb001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb001
            #add-point:ON CHANGE stbb001 name="input.g.page1.stbb001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb030
            #add-point:BEFORE FIELD stbb030 name="input.b.page1.stbb030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb030
            
            #add-point:AFTER FIELD stbb030 name="input.a.page1.stbb030"
            #160510-00010#5 160514 by lori add---(S)
            IF NOT cl_null(g_stbb_d[l_ac].stbb030) THEN
               IF g_stbb_d[l_ac].stbb030 != g_stbb_d_o.stbb030 OR cl_null(g_stbb_d_o.stbb030) THEN
                  LET g_stbb_d[l_ac].stbb031 = ''
                  LET g_stbb_d[l_ac].stbb031_desc = ''
               END IF
            END IF
            
            CALL astt320_set_entry_b(l_cmd)
            CALL astt320_set_no_entry_b(l_cmd)
            CALL astt320_set_no_require_b()
            CALL astt320_set_require_b()
            
            LET g_stbb_d_o.stbb030 = g_stbb_d[l_ac].stbb030  
            LET g_stbb_d_o.stbb031 = g_stbb_d[l_ac].stbb031  
            #160510-00010#5 160514 by lori add---(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb030
            #add-point:ON CHANGE stbb030 name="input.g.page1.stbb030"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb031
            
            #add-point:AFTER FIELD stbb031 name="input.a.page1.stbb031"
            #160510-00010#5 160514 by lori add---(S)
            LET g_stbb_d[l_ac].stbb031_desc = ' '
            DISPLAY BY NAME g_stbb_d[l_ac].stbb031_desc
            IF NOT cl_null(g_stbb_d[l_ac].stbb031) THEN
               IF g_stbb_d[l_ac].stbb031 != g_stbb_d_o.stbb031 OR cl_null(g_stbb_d_o.stbb031) THEN
                  #160516-00014#10 160603 by sakura add(S)
                  IF g_stbb_d[l_ac].stbb030 = '3' THEN
                    INITIALIZE g_chkparam.* TO NULL
                    LET g_chkparam.err_str[1] = "apm-00026:apm-01098"                    
                    LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb031
#                    IF NOT cl_chk_exist("v_pmaa001_10") THEN    #160913-00034#4 by 08172
                    IF NOT cl_chk_exist("v_pmaa001_1") THEN      #160913-00034#4 by 08172
                       LET g_stbb_d[l_ac].stbb031 = g_stbb_d_o.stbb031
                       LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_trading_partner_abbr_desc(g_stbb_d[l_ac].stbb031)
                       NEXT FIELD CURRENT
                    END IF                     
                  ELSE
                  #160516-00014#10 160603 by sakura add(E)                  
                     IF s_aooi500_setpoint(g_prog,'stbb031') THEN
                        LET l_success = ''
                        LET l_errno = ''       
                        CALL s_aooi500_chk(g_prog,'stbb031',g_stbb_d[l_ac].stbb031,g_stba_m.stbasite) 
                           RETURNING l_success,l_errno
                           
                        IF NOT l_success THEN                     
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = l_errno
                           LET g_errparam.extend = g_stbb_d[l_ac].stbb031
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           
                           LET g_stbb_d[l_ac].stbb031 = g_stbb_d_o.stbb031 
                           LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_department_desc(g_stbb_d[l_ac].stbb031)
                           NEXT FIELD CURRENT
                        END IF                     
                     ELSE
                        INITIALIZE g_chkparam.* TO NULL
                        LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb031               
                        IF NOT cl_chk_exist("v_ooef001") THEN
                           LET g_stbb_d[l_ac].stbb031 = g_stbb_d_o.stbb031 
                           LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_department_desc(g_stbb_d[l_ac].stbb031)
                           NEXT FIELD CURRENT
                        END IF
                     END IF
                END IF   #160516-00014#10 160603 by sakura add
               END IF
            END IF
            #160516-00014#10 160603 by sakura add(S)
            IF g_stbb_d[l_ac].stbb030 = '3' THEN
               LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_trading_partner_abbr_desc(g_stbb_d[l_ac].stbb031)
            ELSE
            #160516-00014#10 160603 by sakura add(E)
               LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_department_desc(g_stbb_d[l_ac].stbb031)
            END IF   #160516-00014#10 160603 by sakura add
            LET g_stbb_d_o.stbb031 = g_stbb_d[l_ac].stbb031  
            #160510-00010#5 160514 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb031
            #add-point:BEFORE FIELD stbb031 name="input.b.page1.stbb031"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb031
            #add-point:ON CHANGE stbb031 name="input.g.page1.stbb031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb015
            #add-point:BEFORE FIELD stbb015 name="input.b.page1.stbb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb015
            
            #add-point:AFTER FIELD stbb015 name="input.a.page1.stbb015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb015
            #add-point:ON CHANGE stbb015 name="input.g.page1.stbb015"
            IF g_stbb_d[l_ac].stbb015 = 'N' THEN
               LET g_stbb_d[l_ac].stbb016 = 'N'
            END IF
            CALL astt320_set_entry_b(l_cmd)
            CALL astt320_set_no_entry_b(l_cmd)
            CALL astt320_stbb003_init() #add by geza 20151215 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb016
            #add-point:BEFORE FIELD stbb016 name="input.b.page1.stbb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb016
            
            #add-point:AFTER FIELD stbb016 name="input.a.page1.stbb016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb016
            #add-point:ON CHANGE stbb016 name="input.g.page1.stbb016"
            CALL astt320_stbb003_init() #add by geza 20151215 
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb002
            
            #add-point:AFTER FIELD stbb002 name="input.a.page1.stbb002"
            IF NOT cl_null(g_stbb_d[l_ac].stbb002) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb002<>g_stbb_d_t.stbb002)) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stbb_d[l_ac].stbb002<>g_stbb_d_o.stbb002) THEN    #160824-00007#181 Add By Ken 161114
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site  
                  LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb002                
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooaj002") THEN 
                     #LET g_stbb_d[l_ac].stbb002 =  g_stbb_d_t.stbb002  #160824-00007#181 Mark By Ken 161114
                     LET g_stbb_d[l_ac].stbb002 =  g_stbb_d_o.stbb002   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
                     CALL s_curr_round('',g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb009,'2') RETURNING g_stbb_d[l_ac].stbb009 
                  END IF                   
               END IF
            END IF
            DISPLAY g_stbb_d[l_ac].stbb009 TO stbb009   
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb002
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb002_desc 
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb002
            #add-point:BEFORE FIELD stbb002 name="input.b.page1.stbb002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb002
            #add-point:ON CHANGE stbb002 name="input.g.page1.stbb002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb003
            
            #add-point:AFTER FIELD stbb003 name="input.a.page1.stbb003"
            IF NOT cl_null(g_stbb_d[l_ac].stbb003) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb003<>g_stbb_d_t.stbb003)) THEN #mark by geza 20160628 #160604-00009#115
                  INITIALIZE g_chkparam.* TO NULL
                    #設定g_chkparam.*的參數 
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_stbb_d[l_ac].stbb003                  
                  #160318-00025#34  2016/04/14  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
                  #160318-00025#34  2016/04/14  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_oodb002") THEN
                     LET g_stbb_d[l_ac].stbb003 =  g_stbb_d_t.stbb003
                     NEXT FIELD CURRENT
                  END IF
                  
               #END IF #mark by geza 20160628 #160604-00009#115
              
            END IF


            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb003
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc        
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb003
            #add-point:BEFORE FIELD stbb003 name="input.b.page1.stbb003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb003
            #add-point:ON CHANGE stbb003 name="input.g.page1.stbb003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb004
            #add-point:BEFORE FIELD stbb004 name="input.b.page1.stbb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb004
            
            #add-point:AFTER FIELD stbb004 name="input.a.page1.stbb004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb004
            #add-point:ON CHANGE stbb004 name="input.g.page1.stbb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb005
            #add-point:BEFORE FIELD stbb005 name="input.b.page1.stbb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb005
            
            #add-point:AFTER FIELD stbb005 name="input.a.page1.stbb005"
            IF NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb005<>g_stbb_d_t.stbb005)) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stbb_d[l_ac].stbb005<>g_stbb_d_o.stbb005) THEN   #160824-00007#181 Add By Ken 161114
                  IF NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                     IF g_stbb_d[l_ac].stbb006<g_stbb_d[l_ac].stbb005 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ain-00128"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                       
                        #LET g_stbb_d[l_ac].stbb005 =  g_stbb_d_t.stbb005  #160824-00007#181 Mark By Ken 161114
                        LET g_stbb_d[l_ac].stbb005 =  g_stbb_d_o.stbb005   #160824-00007#181 Add By Ken 161114
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  
                  #權責發生制費用不可以跨月錄入                  
                  IF NOT cl_null(g_stbb_d[l_ac].stbb001) AND NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                     LET l_stae005=''
                     SELECT stae005 INTO l_stae005
                       FROM stae_t
                      WHERE staeent=g_enterprise
                        AND stae001=g_stbb_d[l_ac].stbb001
                        AND staestus='Y'
                     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                        IF YEAR(g_stbb_d[l_ac].stbb006)-YEAR(g_stbb_d[l_ac].stbb005)>0 OR MONTH(g_stbb_d[l_ac].stbb006)-MONTH(g_stbb_d[l_ac].stbb005)>0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00084"
                           LET g_errparam.extend = ""
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                       
                           #160824-00007#181 Mark By Ken 161114(S)
                           #LET g_stbb_d[l_ac].stbb005 = g_stbb_d_t.stbb005
                           #LET g_stbb_d[l_ac].stbb007 = g_stbb_d_t.stbb007
                           #LET g_stbb_d[l_ac].stbb008 = g_stbb_d_t.stbb008
                           #LET g_stbb_d[l_ac].stbb014 = g_stbb_d_t.stbb014
                           #160824-00007#181 Mark By Ken 161114(E)
                           #160824-00007#181 Add By Ken 161114(S)
                           LET g_stbb_d[l_ac].stbb005 = g_stbb_d_o.stbb005
                           LET g_stbb_d[l_ac].stbb007 = g_stbb_d_o.stbb007
                           LET g_stbb_d[l_ac].stbb008 = g_stbb_d_o.stbb008
                           LET g_stbb_d[l_ac].stbb014 = g_stbb_d_o.stbb014                           
                           #160824-00007#181 Add By Ken 161114(E)
                           NEXT FIELD CURRENT
                        END IF   
                     END IF
                  END IF 
               END IF
            END IF
            #mark by geza 20151024(S)
            #add by geza 20150826(S)
            #开始日期结束日期都不为空，抓取结算日期
#            IF NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
#               #CALL s_settle_date_get_stbb019(g_stba_m.stba010,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,'1')      #mark by geza 20151024 
#               #      RETURNING  l_stbb018,g_stbb_d[l_ac].stbb019                                                       #mark by geza 20151024 
#
#            END IF
            #add by geza 20150826(E)
            #mark by geza 20151024(E)
            
            #add by geza 20151024(S)
            #开始日期结束日期门店都不为空，抓取结算日期
            IF NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) AND NOT cl_null(g_stbb_d[l_ac].stbbsite) THEN
               CALL s_expense_get_stbb019(g_stba_m.stba010,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbbsite)           
                    RETURNING  l_stbb018,g_stbb_d[l_ac].stbb019                                                                            
         
            END IF
            #add by geza 20151024(E)
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb005
            #add-point:ON CHANGE stbb005 name="input.g.page1.stbb005"
            CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt320')
            RETURNING r_success,r_stau004,r_period,r_period2
            LET g_stbb_d[l_ac].stbb007 = r_stau004
            LET g_stbb_d[l_ac].stbb008 = r_period
            LET g_stbb_d[l_ac].stbb014 = r_period2
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb006
            #add-point:BEFORE FIELD stbb006 name="input.b.page1.stbb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb006
            
            #add-point:AFTER FIELD stbb006 name="input.a.page1.stbb006"
            IF NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb006<>g_stbb_d_t.stbb006)) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stbb_d[l_ac].stbb006<>g_stbb_d_o.stbb006) THEN   #160824-00007#181 Add By Ken 161114
                  IF NOT cl_null(g_stbb_d[l_ac].stbb005) THEN
                     IF g_stbb_d[l_ac].stbb006<g_stbb_d[l_ac].stbb005 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "ain-00128"
                        LET g_errparam.extend = ""
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        #160824-00007#181 Mark By Ken 161114(S)
                        #LET g_stbb_d[l_ac].stbb006 =  g_stbb_d_t.stbb006
                        #LET g_stbb_d[l_ac].stbb007 = g_stbb_d_t.stbb007
                        #LET g_stbb_d[l_ac].stbb008 = g_stbb_d_t.stbb008
                        #LET g_stbb_d[l_ac].stbb014 = g_stbb_d_t.stbb014
                        #160824-00007#181 Mark By Ken 161114(E)
                        #160824-00007#181 Add By Ken 161114(S)
                        LET g_stbb_d[l_ac].stbb006 = g_stbb_d_o.stbb006
                        LET g_stbb_d[l_ac].stbb007 = g_stbb_d_o.stbb007
                        LET g_stbb_d[l_ac].stbb008 = g_stbb_d_o.stbb008
                        LET g_stbb_d[l_ac].stbb014 = g_stbb_d_o.stbb014                        
                        #160824-00007#181 Add By Ken 161114(E)
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  
                  
                  #權責發生制費用不可以跨月錄入                  
                  IF NOT cl_null(g_stbb_d[l_ac].stbb001) AND NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
                     LET l_stae005=''
                     SELECT stae005 INTO l_stae005
                       FROM stae_t
                      WHERE staeent=g_enterprise
                        AND stae001=g_stbb_d[l_ac].stbb001
                        AND staestus='Y'
                     IF NOT cl_null(l_stae005) AND l_stae005='2' THEN
                        IF YEAR(g_stbb_d[l_ac].stbb006)-YEAR(g_stbb_d[l_ac].stbb005)>0 OR MONTH(g_stbb_d[l_ac].stbb006)-MONTH(g_stbb_d[l_ac].stbb005)>0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "ast-00084"
                           LET g_errparam.extend = ""
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                       
                           #LET g_stbb_d[l_ac].stbb006 = g_stbb_d_t.stbb006  #160824-00007#181 Mark By Ken 161114
                           LET g_stbb_d[l_ac].stbb006 = g_stbb_d_o.stbb006   #160824-00007#181 Add By Ken 161114
                           
                           NEXT FIELD CURRENT
                        END IF   
                     END IF
                  END IF 

                END IF
#               CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt320')
#               RETURNING r_success,r_stau004,r_period,r_period2
#               LET g_stbb_d[l_ac].stbb007 = r_stau004
#               LET g_stbb_d[l_ac].stbb008 = r_period
#               LET g_stbb_d[l_ac].stbb014 = r_period2
            END IF
            
            IF cl_null(g_stbb_d[l_ac].stbb006) THEN
                LET g_stbb_d[l_ac].stbb007 = ''
                LET g_stbb_d[l_ac].stbb008 = ''
                LET g_stbb_d[l_ac].stbb014 = ''
                DISPLAY g_stbb_d[l_ac].stbb007 TO stbb007
                DISPLAY g_stbb_d[l_ac].stbb008 TO stbb008
                DISPLAY g_stbb_d[l_ac].stbb014 TO stbb014
             
            END IF 
            #mark by geza 20151024(S)   
            #add by geza 20150826(S)
            #开始日期结束日期都不为空，抓取结算日期
#            IF NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) THEN
#               CALL s_settle_date_get_stbb019(g_stba_m.stba010,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,'1') RETURNING  l_stbb018,g_stbb_d[l_ac].stbb019
#            END IF
            #add by geza 20150826(E)
            #mark by geza 20151024(E)
            #add by geza 20151024(S)
            #开始日期结束日期都不为空，抓取结算日期
            IF NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) AND NOT cl_null(g_stbb_d[l_ac].stbbsite) THEN
               CALL s_expense_get_stbb019(g_stba_m.stba010,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbbsite)           
                    RETURNING  l_stbb018,g_stbb_d[l_ac].stbb019                                                                            
         
            END IF
            #add by geza 20151024(E)
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb006
            #add-point:ON CHANGE stbb006 name="input.g.page1.stbb006"
            IF NOT cl_null(g_stbb_d[l_ac].stbb006)  THEN
               CALL s_asti206_get_period(g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stba_m.stba001,'astt320')
               RETURNING r_success,r_stau004,r_period,r_period2
               LET g_stbb_d[l_ac].stbb007 = r_stau004
               LET g_stbb_d[l_ac].stbb008 = r_period
               LET g_stbb_d[l_ac].stbb014 = r_period2
            END IF 
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb007
            #add-point:BEFORE FIELD stbb007 name="input.b.page1.stbb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb007
            
            #add-point:AFTER FIELD stbb007 name="input.a.page1.stbb007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb007
            #add-point:ON CHANGE stbb007 name="input.g.page1.stbb007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb008
            #add-point:BEFORE FIELD stbb008 name="input.b.page1.stbb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb008
            
            #add-point:AFTER FIELD stbb008 name="input.a.page1.stbb008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb008
            #add-point:ON CHANGE stbb008 name="input.g.page1.stbb008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb014
            #add-point:BEFORE FIELD stbb014 name="input.b.page1.stbb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb014
            
            #add-point:AFTER FIELD stbb014 name="input.a.page1.stbb014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb014
            #add-point:ON CHANGE stbb014 name="input.g.page1.stbb014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb019
            #add-point:BEFORE FIELD stbb019 name="input.b.page1.stbb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb019
            
            #add-point:AFTER FIELD stbb019 name="input.a.page1.stbb019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb019
            #add-point:ON CHANGE stbb019 name="input.g.page1.stbb019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb009
            #add-point:BEFORE FIELD stbb009 name="input.b.page1.stbb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb009
            
            #add-point:AFTER FIELD stbb009 name="input.a.page1.stbb009"
            IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbb009<>g_stbb_d_t.stbb009)) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stbb_d[l_ac].stbb009<>g_stbb_d_o.stbb009) THEN   #160824-00007#181 Add By Ken 161114
                  IF NOT cl_null(g_stbb_d[l_ac].stbb002) THEN
                     CALL s_curr_round('',g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb009,'2') RETURNING g_stbb_d[l_ac].stbb009 
                  END IF
               END IF
            END IF
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*   #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb009
            #add-point:ON CHANGE stbb009 name="input.g.page1.stbb009"
         
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb010
            #add-point:BEFORE FIELD stbb010 name="input.b.page1.stbb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb010
            
            #add-point:AFTER FIELD stbb010 name="input.a.page1.stbb010"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb010
            #add-point:ON CHANGE stbb010 name="input.g.page1.stbb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb013
            #add-point:BEFORE FIELD stbb013 name="input.b.page1.stbb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb013
            
            #add-point:AFTER FIELD stbb013 name="input.a.page1.stbb013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb013
            #add-point:ON CHANGE stbb013 name="input.g.page1.stbb013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbbsite
            
            #add-point:AFTER FIELD stbbsite name="input.a.page1.stbbsite"
            IF NOT cl_null(g_stbb_d[l_ac].stbbsite) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stbb_d[l_ac].stbbsite<>g_stbb_d_t.stbbsite)) THEN   #160824-00007#181 Mark By Ken 161114
               IF (g_stbb_d[l_ac].stbbsite<>g_stbb_d_o.stbbsite) THEN   #160824-00007#181 Add By Ken 161114
                  CALL s_aooi500_chk(g_prog,'stbbsite',g_stbb_d[l_ac].stbbsite,g_stba_m.stbasite)
                   RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stbb_d[l_ac].stbbsite
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     #LET g_stbb_d[l_ac].stbbsite=g_stbb_d_t.stbbsite  #160824-00007#181 Mark By Ken 161114
                     LET g_stbb_d[l_ac].stbbsite=g_stbb_d_o.stbbsite   #160824-00007#181 Add By Ken 161114
                     NEXT FIELD CURRENT
                  END IF                  

               END IF                  
               #add by geza 20151024(S)
               #门店属于当头法人
               LET l_cnt = 0 
               SELECT COUNT(*) INTO l_cnt
                 FROM ooef_t
                WHERE ooefent=g_enterprise
                  AND ooef001=g_stbb_d[l_ac].stbbsite
                  AND ooef017=g_stba_m.stba022 
               IF l_cnt <= 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stbb_d[l_ac].stbbsite
                  LET g_errparam.code   = 'ast-00498'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  
                  #LET g_stbb_d[l_ac].stbbsite=g_stbb_d_t.stbbsite  #160824-00007#181 Mark By Ken 161114
                  LET g_stbb_d[l_ac].stbbsite=g_stbb_d_o.stbbsite   #160824-00007#181 Add By Ken 161114                  
                  NEXT FIELD CURRENT
               END IF                
               #add by geza 20151024(E)
               #add by geza 20151024(S)
               #开始日期结束日期都不为空，抓取结算日期
               IF NOT cl_null(g_stbb_d[l_ac].stbb005) AND NOT cl_null(g_stbb_d[l_ac].stbb006) AND NOT cl_null(g_stbb_d[l_ac].stbbsite) THEN
                  CALL s_expense_get_stbb019(g_stba_m.stba010,g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbbsite)           
                       RETURNING  l_stbb018,g_stbb_d[l_ac].stbb019                                                                            
               
               END IF
               #add by geza 20151024(E)
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbbsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbbsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbbsite_desc
            #161024-00025#4 -s by 08172
            LET g_site_flag = TRUE
            CALL astt320_set_entry_b(p_cmd)
            CALL astt320_set_no_entry_b(p_cmd)
            #161024-00025#4 -e by 08172
            LET g_stbb_d_o.* = g_stbb_d[l_ac].*  #160824-00007#181 Add By Ken 161114
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbbsite
            #add-point:BEFORE FIELD stbbsite name="input.b.page1.stbbsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbbsite
            #add-point:ON CHANGE stbbsite name="input.g.page1.stbbsite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb012
            
            #add-point:AFTER FIELD stbb012 name="input.a.page1.stbb012"
            IF NOT cl_null(g_stbb_d[l_ac].stbb012) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb012
               LET g_chkparam.arg2 = g_today
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooeg001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_stbb_d[l_ac].stbb012 = g_stbb_d_t.stbb012
                  NEXT FIELD CURRENT
               END IF


            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb012
            #add-point:BEFORE FIELD stbb012 name="input.b.page1.stbb012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb012
            #add-point:ON CHANGE stbb012 name="input.g.page1.stbb012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb011
            
            #add-point:AFTER FIELD stbb011 name="input.a.page1.stbb011"
            IF NOT cl_null(g_stbb_d[l_ac].stbb011) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stbb_d[l_ac].stbb011
               LET g_chkparam.arg2 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')
               LET g_chkparam.err_str[1] = "ast-00215:sub-01302|arti202|",cl_get_progname("arti202",g_lang,"2"),"|:EXEPROGarti202"  #160318-00025#34  add
               #add by geza 20150702(S)
               IF NOT cl_null(g_stba_m.stba010) THEN
                  #160523-00004#1 160601 by lori add---(S)
                  CASE g_type
                     WHEN '4'   #租賃
                        LET g_qryparam.where = " EXISTS (SELECT 1 FROM stjk_t ",
                                               "          WHERE stjkent = rtaxent ",
                                               "            AND stjk002 = rtax001 ",
                                               "            AND stjk001 = '",g_stba_m.stba010,"') "
                                               
                     OTHERWISE
                  #160523-00004#1 160601 by lori add---(E)               
                        LET g_chkparam.where = " EXISTS (SELECT 1 FROM staq_t WHERE  staqent = ",g_enterprise," AND staq003 = rtax001 AND staq001 = '",g_stba_m.stba010,"' ) "
                  END CASE   #160523-00004#1 160601 by lori add
               END IF
               #add by geza 20150702(E)
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_rtax001_2") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_stbb_d[l_ac].stbb011 = g_stbb_d_t.stbb011
                  NEXT FIELD CURRENT
               END IF


            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb011
            #add-point:BEFORE FIELD stbb011 name="input.b.page1.stbb011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb011
            #add-point:ON CHANGE stbb011 name="input.g.page1.stbb011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stbb017
            #add-point:BEFORE FIELD stbb017 name="input.b.page1.stbb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stbb017
            
            #add-point:AFTER FIELD stbb017 name="input.a.page1.stbb017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stbb017
            #add-point:ON CHANGE stbb017 name="input.g.page1.stbb017"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbseq
            #add-point:ON ACTION controlp INFIELD stbbseq name="input.c.page1.stbbseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb001
            #add-point:ON ACTION controlp INFIELD stbb001 name="input.c.page1.stbb001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb001             #給予default值
            LET g_qryparam.default2 = "" #g_stbb_d[l_ac].stael004 #助記碼
            LET g_qryparam.default3 = "" #g_stbb_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stae001()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb001 = g_qryparam.return1              
            #LET g_stbb_d[l_ac].stael004 = g_qryparam.return2 
            #LET g_stbb_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stbb_d[l_ac].stbb001 TO stbb001              #
            #DISPLAY g_stbb_d[l_ac].stael004 TO stael004 #助記碼
            #DISPLAY g_stbb_d[l_ac].stael003 TO stael003 #說明
            CALL astt320_stbb001_ref()            
            NEXT FIELD stbb001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb030
            #add-point:ON ACTION controlp INFIELD stbb030 name="input.c.page1.stbb030"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb031
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb031
            #add-point:ON ACTION controlp INFIELD stbb031 name="input.c.page1.stbb031"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            #160510-00010#5 160514 by lori add---(S)
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb031
            #160516-00014#10 160603 by sakura add(S)
            IF g_stbb_d[l_ac].stbb030 = '3' THEN
               CALL q_pmaa001()
            ELSE
            #160516-00014#10 160603 by sakura add(E)
               IF s_aooi500_setpoint(g_prog,'stbb031') THEN
                  LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbb031',g_stba_m.stbasite,'i')
                  CALL q_ooef001_24()                   
               ELSE
                  #CALL q_ooef001_1()           #161024-00025#2 mark
                  CALL q_ooef001_24()           #161024-00025#2 add  
               END IF
            END IF   #160516-00014#10 160603 by sakura add               
 
            LET g_stbb_d[l_ac].stbb031 = g_qryparam.return1
            LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_department_desc(g_stbb_d[l_ac].stbb031)            
            DISPLAY BY NAME g_stbb_d[l_ac].stbb031,g_stbb_d[l_ac].stbb031_desc
                                                       
            NEXT FIELD stbb031                        
            #160510-00010#5 160514 by lori add---(S)
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb015
            #add-point:ON ACTION controlp INFIELD stbb015 name="input.c.page1.stbb015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb016
            #add-point:ON ACTION controlp INFIELD stbb016 name="input.c.page1.stbb016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb002
            #add-point:ON ACTION controlp INFIELD stbb002 name="input.c.page1.stbb002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb002             #給予default值

            #給予arg
            LET g_qryparam.arg1 =g_site #

            
            CALL q_ooaj002_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb002 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb002
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb002_desc
            DISPLAY g_stbb_d[l_ac].stbb002 TO stbb002              #

            NEXT FIELD stbb002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb003
            #add-point:ON ACTION controlp INFIELD stbb003 name="input.c.page1.stbb003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site

            
            CALL q_oodb002_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb003 = g_qryparam.return1              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb003
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc  
            DISPLAY g_stbb_d[l_ac].stbb003 TO stbb003              #

            NEXT FIELD stbb003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb004
            #add-point:ON ACTION controlp INFIELD stbb004 name="input.c.page1.stbb004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb005
            #add-point:ON ACTION controlp INFIELD stbb005 name="input.c.page1.stbb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb006
            #add-point:ON ACTION controlp INFIELD stbb006 name="input.c.page1.stbb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb007
            #add-point:ON ACTION controlp INFIELD stbb007 name="input.c.page1.stbb007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb008
            #add-point:ON ACTION controlp INFIELD stbb008 name="input.c.page1.stbb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb014
            #add-point:ON ACTION controlp INFIELD stbb014 name="input.c.page1.stbb014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb019
            #add-point:ON ACTION controlp INFIELD stbb019 name="input.c.page1.stbb019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb009
            #add-point:ON ACTION controlp INFIELD stbb009 name="input.c.page1.stbb009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb010
            #add-point:ON ACTION controlp INFIELD stbb010 name="input.c.page1.stbb010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb013
            #add-point:ON ACTION controlp INFIELD stbb013 name="input.c.page1.stbb013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stbbsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbbsite
            #add-point:ON ACTION controlp INFIELD stbbsite name="input.c.page1.stbbsite"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbbsite           #給予default值

            #給予arg   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbbsite',g_stba_m.stbasite,'i') #150308-00001#5  By geza add 'i'
            CALL q_ooef001_24()

            LET g_stbb_d[l_ac].stbbsite = g_qryparam.return1              
                         
            #LET g_stbb_d[l_ac].ooefl003 = g_qryparam.return2 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbbsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbbsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbbsite_desc            
            DISPLAY g_stbb_d[l_ac].stbbsite TO stbbsite              #
            #DISPLAY g_stbb_d[l_ac].ooefl003 TO ooefl003 #說明(簡稱)
            NEXT FIELD stbbsite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb012
            #add-point:ON ACTION controlp INFIELD stbb012 name="input.c.page1.stbb012"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today #

            CALL q_ooeg001_4()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb012 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb012 TO stbb012              #

            NEXT FIELD stbb012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb011
            #add-point:ON ACTION controlp INFIELD stbb011 name="input.c.page1.stbb011"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stbb_d[l_ac].stbb011             #給予default值

            #給予arg
            LET g_qryparam.arg1 = cl_get_para(g_enterprise,g_site,'E-CIR-0001')
            #add by geza 20150702(S)
            IF NOT cl_null(g_stba_m.stba010) THEN
               #160523-00004#1 160601 by lori add---(S)
               CASE g_type
                  WHEN '4'   #租賃
                     LET g_qryparam.where = " EXISTS (SELECT 1 FROM stjk_t ",
                                            "          WHERE stjkent = rtaxent ",
                                            "            AND stjk002 = rtax001 ",
                                            "            AND stjk001 = '",g_stba_m.stba010,"') "
                                            
                  OTHERWISE
               #160523-00004#1 160601 by lori add---(E)
                     LET g_qryparam.where = " EXISTS (SELECT 1 FROM staq_t WHERE  staqent = ",g_enterprise,
                                            "                              AND staq003 = rtax001 AND staq001 = '",g_stba_m.stba010,"' ) "
               END CASE   #160523-00004#1 160601 by lori add
            END IF
            #add by geza 20150702(E)
            CALL q_rtax001_3()                                #呼叫開窗

            LET g_stbb_d[l_ac].stbb011 = g_qryparam.return1              

            DISPLAY g_stbb_d[l_ac].stbb011 TO stbb011              #

            NEXT FIELD stbb011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stbb017
            #add-point:ON ACTION controlp INFIELD stbb017 name="input.c.page1.stbb017"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stbb_d[l_ac].* = g_stbb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt320_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stbb_d[l_ac].stbbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stbb_d[l_ac].* = g_stbb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt320_stbb_t_mask_restore('restore_mask_o')
      
               UPDATE stbb_t SET (stbbdocno,stbbseq,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002, 
                   stbb003,stbb004,stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013, 
                   stbbsite,stbb012,stbb011,stbb017,stbbunit) = (g_stba_m.stbadocno,g_stbb_d[l_ac].stbbseq, 
                   g_stbb_d[l_ac].stbb001,g_stbb_d[l_ac].stbb030,g_stbb_d[l_ac].stbb031,g_stbb_d[l_ac].stbb015, 
                   g_stbb_d[l_ac].stbb016,g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb004, 
                   g_stbb_d[l_ac].stbb005,g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbb007,g_stbb_d[l_ac].stbb008, 
                   g_stbb_d[l_ac].stbb014,g_stbb_d[l_ac].stbb019,g_stbb_d[l_ac].stbb009,g_stbb_d[l_ac].stbb010, 
                   g_stbb_d[l_ac].stbb013,g_stbb_d[l_ac].stbbsite,g_stbb_d[l_ac].stbb012,g_stbb_d[l_ac].stbb011, 
                   g_stbb_d[l_ac].stbb017,g_stbb_d[l_ac].stbbunit)
                WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno 
 
                  AND stbbseq = g_stbb_d_t.stbbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stbb_d[l_ac].* = g_stbb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stbb_d[l_ac].* = g_stbb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stba_m.stbadocno
               LET gs_keys_bak[1] = g_stbadocno_t
               LET gs_keys[2] = g_stbb_d[g_detail_idx].stbbseq
               LET gs_keys_bak[2] = g_stbb_d_t.stbbseq
               CALL astt320_update_b('stbb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt320_stbb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stbb_d[g_detail_idx].stbbseq = g_stbb_d_t.stbbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stba_m.stbadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stbb_d_t.stbbseq
 
                  CALL astt320_key_update_b(gs_keys,'stbb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stba_m),util.JSON.stringify(g_stbb_d_t)
               LET g_log2 = util.JSON.stringify(g_stba_m),util.JSON.stringify(g_stbb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            CALL astt320_stbb009_sum()   #160604-00009#58 160618 by sakura add
            #end add-point
            CALL astt320_unlock_b("stbb_t","'1'")
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
               LET g_stbb_d[li_reproduce_target].* = g_stbb_d[li_reproduce].*
 
               LET g_stbb_d[li_reproduce_target].stbbseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stbb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stbb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt320.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx)      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stbaunit
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbbseq
 
               #add-point:input段modify_detail 

               #end add-point  
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stbadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stbbseq
 
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
 
{<section id="astt320.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt320_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019 LIKE ooef_t.ooef019
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt320_b_fill() #單身填充
      CALL astt320_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt320_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   #160604-00009#58 160618 by sakura mark(S)
   #        SELECT SUM(stbb009) INTO g_stba_m.l_amount1
   #           FROM stba_t,stbb_t
   #          WHERE stbaent=stbbent
   #            AND stbadocno=stbbdocno
   #            AND stbaent=g_enterprise
   #            AND stbadocno=g_stba_m.stbadocno
   #160604-00009#58 160618 by sakura mark(E)
   CALL astt320_stbb009_sum()   #160604-00009#58 160618 by sakura add

   #end add-point
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt320_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002, 
       g_stba_m.stba002_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010,g_stba_m.stba000, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba004,g_stba_m.stba004_desc, 
       g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007, 
       g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stba022,g_stba_m.stba022_desc,g_stba_m.stba025, 
       g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba011_desc,g_stba_m.stba012,g_stba_m.stba012_desc, 
       g_stba_m.l_amount1,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid, 
       g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt 
 
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
   FOR l_ac = 1 TO g_stbb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"



            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
            CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
            LET g_stbb_d[l_ac].stae004 = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stae003
            DISPLAY BY NAME g_stbb_d[l_ac].stae004

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stae003
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2058' AND oocql002 =? AND oocql003 ='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stae003_desc
           

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stbb_d[l_ac].stbb003
            CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc  
                   
            
            
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt320_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt320_detail_show()
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
 
{<section id="astt320.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt320_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stba_t.stbadocno 
   DEFINE l_oldno     LIKE stba_t.stbadocno 
 
   DEFINE l_master    RECORD LIKE stba_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stbb_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE r_insert       LIKE type_t.num5
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
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stbadocno_t = g_stba_m.stbadocno
 
    
   LET g_stba_m.stbadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stba_m.stbaownid = g_user
      LET g_stba_m.stbaowndp = g_dept
      LET g_stba_m.stbacrtid = g_user
      LET g_stba_m.stbacrtdp = g_dept 
      LET g_stba_m.stbacrtdt = cl_get_current()
      LET g_stba_m.stbamodid = g_user
      LET g_stba_m.stbamoddt = cl_get_current()
      LET g_stba_m.stbastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
      LET g_stba_m.stbacnfid = ""
      LET g_stba_m.stbacnfdt = ""
#     LET g_stba_m.stbaunit=g_site

      LET r_insert=TRUE
      CALL s_aooi500_default(g_prog,'stbaunit',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stbaunit
      IF NOT r_insert THEN
         RETURN 
      END IF

      CALL s_aooi500_default(g_prog,'stba001',g_stba_m.stbasite) RETURNING r_insert,g_stba_m.stba001
      IF NOT r_insert THEN
         RETURN 
      END IF
      
      LET g_stba_m.stbasite=g_site
      LET g_stba_m.stbadocdt=g_today
      LET g_stba_m.stba006='1'
      LET g_stba_m.stba008=g_user
      LET g_stba_m.stba009=g_dept
      LET g_stba_m.stbastus='N'
      LET g_stba_m.l_amount1=0
      
      SELECT ooefl003 INTO g_stba_m.stbaunit_desc 
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stbaunit
         AND ooefl002=g_dlang  
         
      SELECT oofa011 INTO g_stba_m.stba008_desc
        FROM oofa_t
       WHERE oofa002='2'
         AND oofa003=g_stba_m.stba008
         AND oofaent=g_enterprise #160905-00007#16 add
         
      SELECT ooefl003 INTO g_stba_m.stba009_desc
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stba009
         AND ooefl002=g_dlang        
         
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaunit
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaunit_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaunit_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stba001
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stba001_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stba001_desc
      
     INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaownid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbaownid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaownid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbaowndp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbaowndp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbaowndp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacrtdp
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stba_m.stbacrtdp_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacrtdp_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbamodid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbamodid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbamodid_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stbacnfid
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stbacnfid_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stbacnfid_desc  
      
      #add by geza 20150611(S)
      IF g_type = '1' THEN
         LET g_stba_m.stba000 = 'astt320'
         LET g_stba_m.stba014 = '1'
      END IF
      IF g_type = '2' THEN
         LET g_stba_m.stba000 = 'astt322'
         LET g_stba_m.stba015 = '1'
         LET g_stba_m.stba014 = '3'
      END IF
      IF g_type = '3' THEN
         LET g_stba_m.stba000 = 'astt323'
         LET g_stba_m.stba014 = '4'
      END IF
      #160310-00019#1 20160323 s983961--add(s)
      IF g_type = '4' THEN
         LET g_stba_m.stba000 = 'astt810'
      END IF
      #160310-00019#1 20160323 s983961--add(e)
      
      LET g_stbe002_def_flag = ''   #160511-00034#1 160510 by lori add
      LET g_stbe010_def_flag = ''   #160511-00034#1 160510 by lori add
      LET g_stba013_def_flag = ''   #160511-00034#1 160510 by lori add   #160518-00077#1 160518 lori rename
      #add by geza 20150611(E)
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stba_m.stbastus 
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
   
   
   CALL astt320_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stba_m.* TO NULL
      INITIALIZE g_stbb_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt320_show()
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
   CALL astt320_set_act_visible()   
   CALL astt320_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stbaent = " ||g_enterprise|| " AND",
                      " stbadocno = '", g_stba_m.stbadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt320_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt320_idx_chk()
   
   LET g_data_owner = g_stba_m.stbaownid      
   LET g_data_dept  = g_stba_m.stbaowndp
   
   #功能已完成,通報訊息中心
   CALL astt320_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt320_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stbb_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt320_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stbb_t
    WHERE stbbent = g_enterprise AND stbbdocno = g_stbadocno_t
 
    INTO TEMP astt320_detail
 
   #將key修正為調整後   
   UPDATE astt320_detail 
      #更新key欄位
      SET stbbdocno = g_stba_m.stbadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stbb_t SELECT * FROM astt320_detail
   
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
   DROP TABLE astt320_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stbadocno_t = g_stba_m.stbadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt320_delete()
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
   
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt320_cl USING g_enterprise,g_stba_m.stbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt320_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt320_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stba_m_mask_o.* =  g_stba_m.*
   CALL astt320_stba_t_mask()
   LET g_stba_m_mask_n.* =  g_stba_m.*
   
   CALL astt320_show()
   
   #add-point:delete段before ask name="delete.before_ask"
 
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt320_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stbadocno_t = g_stba_m.stbadocno
 
 
      DELETE FROM stba_t
       WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stba_m.stbadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      #160310-00019#1 20160325 s983961--add(s)
      IF NOT s_aooi200_del_docno(g_stba_m.stbadocno,g_stba_m.stbadocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #160310-00019#1 20160325 s983961--add(e)
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stbb_t
       WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stba_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt320_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stbb_d.clear() 
 
     
      CALL astt320_ui_browser_refresh()  
      #CALL astt320_ui_headershow()  
      #CALL astt320_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt320_browser_fill("")
         CALL astt320_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt320_cl
 
   #功能已完成,通報訊息中心
   CALL astt320_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt320.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt320_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stbb_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt320_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stbbseq,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002,stbb003, 
             stbb004,stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013,stbbsite, 
             stbb012,stbb011,stbb017,stbbunit ,t1.stael003 ,t2.ooefl003 ,t3.ooail003 ,t4.oodbl004 ,t5.ooefl003 FROM stbb_t", 
                
                     " INNER JOIN stba_t ON stbaent = " ||g_enterprise|| " AND stbadocno = stbbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stbb001 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=stbb031 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t3 ON t3.ooailent="||g_enterprise||" AND t3.ooail001=stbb002 AND t3.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t4 ON t4.oodblent="||g_enterprise||" AND t4.oodbl001='' AND t4.oodbl002=stbb003 AND t4.oodbl003='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=stbbsite AND t5.ooefl002='"||g_dlang||"' ",
 
                     " WHERE stbbent=? AND stbbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stbb_t.stbbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt320_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt320_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stba_m.stbadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stba_m.stbadocno INTO g_stbb_d[l_ac].stbbseq,g_stbb_d[l_ac].stbb001, 
          g_stbb_d[l_ac].stbb030,g_stbb_d[l_ac].stbb031,g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016, 
          g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb004,g_stbb_d[l_ac].stbb005, 
          g_stbb_d[l_ac].stbb006,g_stbb_d[l_ac].stbb007,g_stbb_d[l_ac].stbb008,g_stbb_d[l_ac].stbb014, 
          g_stbb_d[l_ac].stbb019,g_stbb_d[l_ac].stbb009,g_stbb_d[l_ac].stbb010,g_stbb_d[l_ac].stbb013, 
          g_stbb_d[l_ac].stbbsite,g_stbb_d[l_ac].stbb012,g_stbb_d[l_ac].stbb011,g_stbb_d[l_ac].stbb017, 
          g_stbb_d[l_ac].stbbunit,g_stbb_d[l_ac].stbb001_desc,g_stbb_d[l_ac].stbb031_desc,g_stbb_d[l_ac].stbb002_desc, 
          g_stbb_d[l_ac].stbb003_desc,g_stbb_d[l_ac].stbbsite_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         IF g_stbb_d[l_ac].stbb030 = '3' THEN
            LET g_stbb_d[l_ac].stbb031_desc = s_desc_get_trading_partner_abbr_desc(g_stbb_d[l_ac].stbb031)   #160516-00014#10 160603 by sakura add
         END IF
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
   CALL astt320_b_fill_2()  #add by geza 20150801
   #end add-point
   
   CALL g_stbb_d.deleteElement(g_stbb_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt320_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stbb_d.getLength()
      LET g_stbb_d_mask_o[l_ac].* =  g_stbb_d[l_ac].*
      CALL astt320_stbb_t_mask()
      LET g_stbb_d_mask_n[l_ac].* =  g_stbb_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt320_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stbb_t
       WHERE stbbent = g_enterprise AND
         stbbdocno = ps_keys_bak[1] AND stbbseq = ps_keys_bak[2]
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
         CALL g_stbb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt320_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stbb_t
                  (stbbent,
                   stbbdocno,
                   stbbseq
                   ,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002,stbb003,stbb004,stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013,stbbsite,stbb012,stbb011,stbb017,stbbunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stbb_d[g_detail_idx].stbb001,g_stbb_d[g_detail_idx].stbb030,g_stbb_d[g_detail_idx].stbb031, 
                       g_stbb_d[g_detail_idx].stbb015,g_stbb_d[g_detail_idx].stbb016,g_stbb_d[g_detail_idx].stbb002, 
                       g_stbb_d[g_detail_idx].stbb003,g_stbb_d[g_detail_idx].stbb004,g_stbb_d[g_detail_idx].stbb005, 
                       g_stbb_d[g_detail_idx].stbb006,g_stbb_d[g_detail_idx].stbb007,g_stbb_d[g_detail_idx].stbb008, 
                       g_stbb_d[g_detail_idx].stbb014,g_stbb_d[g_detail_idx].stbb019,g_stbb_d[g_detail_idx].stbb009, 
                       g_stbb_d[g_detail_idx].stbb010,g_stbb_d[g_detail_idx].stbb013,g_stbb_d[g_detail_idx].stbbsite, 
                       g_stbb_d[g_detail_idx].stbb012,g_stbb_d[g_detail_idx].stbb011,g_stbb_d[g_detail_idx].stbb017, 
                       g_stbb_d[g_detail_idx].stbbunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stbb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt320_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stbb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt320_stbb_t_mask_restore('restore_mask_o')
               
      UPDATE stbb_t 
         SET (stbbdocno,
              stbbseq
              ,stbb001,stbb030,stbb031,stbb015,stbb016,stbb002,stbb003,stbb004,stbb005,stbb006,stbb007,stbb008,stbb014,stbb019,stbb009,stbb010,stbb013,stbbsite,stbb012,stbb011,stbb017,stbbunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stbb_d[g_detail_idx].stbb001,g_stbb_d[g_detail_idx].stbb030,g_stbb_d[g_detail_idx].stbb031, 
                  g_stbb_d[g_detail_idx].stbb015,g_stbb_d[g_detail_idx].stbb016,g_stbb_d[g_detail_idx].stbb002, 
                  g_stbb_d[g_detail_idx].stbb003,g_stbb_d[g_detail_idx].stbb004,g_stbb_d[g_detail_idx].stbb005, 
                  g_stbb_d[g_detail_idx].stbb006,g_stbb_d[g_detail_idx].stbb007,g_stbb_d[g_detail_idx].stbb008, 
                  g_stbb_d[g_detail_idx].stbb014,g_stbb_d[g_detail_idx].stbb019,g_stbb_d[g_detail_idx].stbb009, 
                  g_stbb_d[g_detail_idx].stbb010,g_stbb_d[g_detail_idx].stbb013,g_stbb_d[g_detail_idx].stbbsite, 
                  g_stbb_d[g_detail_idx].stbb012,g_stbb_d[g_detail_idx].stbb011,g_stbb_d[g_detail_idx].stbb017, 
                  g_stbb_d[g_detail_idx].stbbunit) 
         WHERE stbbent = g_enterprise AND stbbdocno = ps_keys_bak[1] AND stbbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stbb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt320_stbb_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt320.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt320_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt320.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt320_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt320.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt320_lock_b(ps_table,ps_page)
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
   #CALL astt320_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stbb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt320_bcl USING g_enterprise,
                                       g_stba_m.stbadocno,g_stbb_d[g_detail_idx].stbbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt320_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt320.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt320_unlock_b(ps_table,ps_page)
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
      CLOSE astt320_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt320_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stbadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stbadocno",TRUE)
      CALL cl_set_comp_entry("stbadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stbaunit",TRUE)
      CALL cl_set_comp_required('stbaunit',TRUE)
      CALL cl_set_comp_entry('stbadocdt',TRUE)
      CALL cl_set_comp_entry("stba006,stba007",TRUE)     
      CALL cl_set_comp_entry("stba002,stba003,stba006,stba008",TRUE)            
      CALL cl_set_comp_entry("stba009,stba010,stba015,stba013",TRUE)   #160518-00077#1 160518 by lori mod stba024->stba013
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry('stbb002',TRUE)
   
   CALL cl_set_comp_entry('stbb004',TRUE)
   CALL cl_set_comp_entry("stba011",TRUE)
   CALL cl_set_comp_entry("stba012",TRUE)
   CALL cl_set_comp_entry("stba002",TRUE)                    #add by geza 20150625
   CALL cl_set_comp_entry("stba010",TRUE)                    #add by geza 20150625  
   CALL cl_set_comp_entry("stba009",TRUE)                    #add by geza 20150625  
   CALL cl_set_comp_entry("stba016",TRUE)                    #add by geza 20150703 
   CALL cl_set_comp_entry("stba006,stba007",TRUE)            #160310-00019#1 20160323 s983961--ADD
   CALL cl_set_comp_entry("stba005,stba008,stba013",TRUE)    #160511-00034#1 160510 by lori add   #160518-00077#1 160518 by lori mod stba024->stba013
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt320_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_stae006    LIKE stae_t.stae006
   DEFINE  l_cnt       LIKE type_t.num10 #5                #檢查重複用  
   DEFINE  l_pmaa004   LIKE pmaa_t.pmaa004            
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stbadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stbadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stbadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stbaunit') OR g_site_flag THEN
      CALL cl_set_comp_entry("stbaunit",FALSE)
   END IF
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry('stbb002',FALSE)
      CALL cl_set_comp_entry('stbb003',FALSE)
   END IF 
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stbaunit",FALSE)
      CALL cl_set_comp_entry("stba002",FALSE)    #add by geza 20150625
      CALL cl_set_comp_entry("stba010",FALSE)    #add by geza 20150625  
      CALL cl_set_comp_entry("stba009",FALSE)    #add by geza 20150625  
   END IF
   
   #单身有资料，关闭单头的币别栏位和税别栏位
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt
     FROM stbb_t
    WHERE stbbent = g_enterprise AND stbbdocno = g_stba_m.stbadocno
   IF l_cnt > 0 THEN
      CALL cl_set_comp_entry("stba011",FALSE)
      CALL cl_set_comp_entry("stba012",FALSE)
      CALL cl_set_comp_entry("stba002",FALSE)    #add by geza 20150625
      CALL cl_set_comp_entry("stba010",FALSE)    #add by geza 20150625  
      CALL cl_set_comp_entry("stba009",FALSE)    #add by geza 20150625  
   END IF
   #供应商类型不是一次性交易对象，关闭交款人栏位  #add by geza 20150703 (S)
   IF g_type='2' THEN
     IF cl_null(g_stba_m.stba002) THEN
        CALL cl_set_comp_entry("stba016",FALSE)
     ELSE   
        INITIALIZE l_pmaa004 TO NULL
        SELECT pmaa004 INTO l_pmaa004
          FROM pmaa_t
         WHERE pmaaent = g_enterprise
           AND pmaa001 = g_stba_m.stba002
         IF l_pmaa004 != '2'  THEN
            CALL cl_set_comp_entry("stba016",FALSE)   
         END IF
      END IF   
   END IF    
   
   #160511-00034#1 160510 by lori mark and add---(S)
   ##160310-00019#1 20160323 s983961--ADD(s)
   #IF g_type = '4' AND NOT cl_null(g_stba_m.stba006) AND NOT cl_null(g_stba_m.stba007) THEN
   #   CALL cl_set_comp_entry("stba006,stba007",FALSE)     
   #   CALL cl_set_comp_entry("stbadocdt,stba002,stba003,stba006,stba008",FALSE)            
   #   CALL cl_set_comp_entry("stba009,stba010,stba015,stba024,stba026",FALSE) 
   #END IF   
   ##160310-00019#1 20160323 s983961--ADD(e)
   IF g_stba_m.stba002 <> '1' THEN
      CALL cl_set_comp_entry("stba006,stba007",FALSE)  
   END IF
   #160511-00034#1 160510 by lori mark and add---(E)
   
   #160511-00034#1 160510 by lori add---(S)
   IF g_type = '4' THEN
      CALL cl_set_comp_entry("stba003",FALSE)   
      #透過供應商帶值的欄位不可維護
      IF g_stbe002_def_flag = 'Y' THEN
         IF NOT cl_null(g_stba_m.stba010) THEN
            CALL cl_set_comp_entry("stba005,stba004,stba008,stba009,stba011,stba012,stba013",FALSE)    #160518-00077#1 160518 by lori mod stba024->stba013
         END IF      
      END IF
      
      #透過合約帶值的欄位不可維護
      IF g_stbe010_def_flag = 'Y' THEN
         IF NOT cl_null(g_stba_m.stba010) THEN
            CALL cl_set_comp_entry("stba005,stba004,stba008,stba009,stba011,stba012,stba013",FALSE)   #160518-00077#1 160518 by lori mod stba024->stba013
         END IF                     
      END IF
      
      #透過鋪位帶值的欄位不可維護
      IF g_stba013_def_flag = 'Y' THEN   #160518-00077#1 160518 lori mod stba024->stba013
         IF NOT cl_null(g_stba_m.stba010) THEN
            CALL cl_set_comp_entry("stba002,stba005,stba004,stba008,stba009,stba010,stba011,stba012",FALSE)
         END If   
      END IF  
   END IF   
   #160511-00034#1 160510 by lori add---(E)     
   #add by geza 20150703(E)    
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt320_set_entry_b(p_cmd)
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
      CALL cl_set_comp_entry("stbbsite",TRUE)
      CALL cl_set_comp_entry("stbbseq,stbb001",TRUE)     
      CALL cl_set_comp_entry("stbb005,stbb006,stbb009,stbb011",TRUE)     
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry('stbb016',TRUE)  
   CALL cl_set_comp_entry("stbb031",TRUE)      #160510-00010#5 160514 by lori add
   CALL cl_set_comp_entry("stbb030",TRUE)   #160516-00014#10 160603 by sakura add
   CALL cl_set_comp_entry("stbb003",TRUE)   #160604-00009#115 add by geza 20160628
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt320_set_no_entry_b(p_cmd)
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
#   IF NOT s_aooi500_comp_entry(g_prog,'stbbsite') THEN   #161024-00025#4 by 08172
   IF NOT s_aooi500_comp_entry(g_prog,'stbbsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stbbsite",FALSE)
   END IF 
   IF g_stbb_d[l_ac].stbb015 = 'N' THEN
      CALL cl_set_comp_entry('stbb016',FALSE)      
   END IF
   
   ##160310-00019#1 20160323 s983961--ADD(s)
   #IF g_type = '4' AND NOT cl_null(g_stba_m.stba006) AND NOT cl_null(g_stba_m.stba007) THEN
   #   CALL cl_set_comp_entry("stbbseq,stbb001",FALSE)     
   #   CALL cl_set_comp_entry("stbb005,stbb006,stbb009,stbb011",FALSE)              
   #END IF   
   ##160310-00019#1 20160323 s983961--ADD(e)
   
   #160510-00010#5 160514 by lori add---(S)
   IF g_stbb_d[l_ac].stbb030 = '1' OR g_stbb_d[l_ac].stbb030 = '2' THEN   #160516-00014#10 160603 by sakura add stbb030 = 2
      CALL cl_set_comp_entry("stbb031",FALSE)
   END IF   
   #160510-00010#5 160514 by lori add---(E)
   CALL cl_set_comp_entry("stbb030",FALSE)   #160516-00014#10 160603 by sakura add
   #astt810可以该单身的税，其他不行
   #160604-00009#115 add by geza 20160628(S)
   IF g_type <> '4' THEN
      CALL cl_set_comp_entry("stbb003",FALSE)
   END IF
   #160604-00009#115 add by geza 20160628(E)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt320_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt320_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   #IF g_stba_m.stbastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
   #   CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   #END IF
   #160310-00019#1 20160323 s983961--mod(s)
   #IF g_stba_m.stba006 != '1' THEN   # N未確認/D抽單/R已拒絕允許修改
   #   CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   #END IF
   
   IF g_stba_m.stba006 != '1' AND g_stba_m.stba006 != '20' AND g_stba_m.stba006 != '21'  THEN   
      CALL cl_set_act_visible("modify,modify_detail", FALSE)
   END IF
   
   #IF g_stba_m.stba006 != '1' THEN   # N未確認/D抽單/R已拒絕允許修改
   #   CALL cl_set_act_visible("delete", FALSE)
   #END IF
   #160310-00019#1 20160323 s983961--mod(e)
   #161115-00015#1 -s by 08172
   IF g_stba_m.stbastus NOT MATCHES '[NDR]' OR g_stba_m.stba006 <> '1' THEN 
      CALL cl_set_act_visible("modify,modify_detail,delete",FALSE)
   END IF
   #161115-00015#1 -e by 08172
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt320_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt320.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt320_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt320.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt320_default_search()
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
      LET ls_wc = ls_wc, " stbadocno = '", g_argv[02], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stba_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stbb_t" 
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
 
{<section id="astt320.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt320_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   DEFINE l_cnm          INT 
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stba_m.stbastus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stba_m.stbadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt320_cl USING g_enterprise,g_stba_m.stbadocno
   IF STATUS THEN
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt320_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
       g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
       g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
       g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
       g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
       g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
       g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
       g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
       g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
       g_stba_m.stbacnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt320_action_chk() THEN
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno,g_stba_m.stba002, 
       g_stba_m.stba002_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010,g_stba_m.stba000, 
       g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba004,g_stba_m.stba004_desc, 
       g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus,g_stba_m.stba006,g_stba_m.stba007, 
       g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stba022,g_stba_m.stba022_desc,g_stba_m.stba025, 
       g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba011_desc,g_stba_m.stba012,g_stba_m.stba012_desc, 
       g_stba_m.l_amount1,g_stba_m.stba008,g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc, 
       g_stba_m.stbaownid,g_stba_m.stbaownid_desc,g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid, 
       g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp,g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
       g_stba_m.stbamodid_desc,g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt 
 
 
   CASE g_stba_m.stbastus
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
         CASE g_stba_m.stbastus
            
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
         CALL cl_set_act_visible("signing,withdraw",FALSE)
         CASE g_stba_m.stbastus
            WHEN "N"
               #HIDE OPTION "open"
               CALL cl_set_act_visible("unconfirmed",FALSE)
               #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
               IF cl_bpm_chk() THEN
                  CALL cl_set_act_visible("signing",TRUE)
                  CALL cl_set_act_visible("confirmed",FALSE)
               END IF
               
            WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
               
            WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)

            WHEN "X"
               #HIDE OPTION "invalid"
               CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)

            WHEN "Y"
               #HIDE OPTION "confirmed"
               CALL cl_set_act_visible("invalid,confirmed",FALSE)
            WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
               CALL cl_set_act_visible("withdraw",TRUE)
               CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
               
            WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
               CALL cl_set_act_visible("confirmed",TRUE)
               CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)

         END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt320_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt320_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt320_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt320_cl
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
      g_stba_m.stbastus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   LET l_success = TRUE
   LET g_stba_m.stbacnfdt=cl_get_current()
   LET g_stba_m.stbamoddt=cl_get_current()
   CASE lc_state 
      WHEN 'Y' 
         SELECT stbastus INTO  g_stba_m.stbastus 
           FROM stba_t 
          WHERE stbadocno = g_stba_m.stbadocno
            AND stbaent = g_enterprise 

         CALL s_astt320_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-014') THEN
               #150527-00027#1 add by geza (S)
               #astt320审核更新结算底稿，astt322,astt323不更新
               IF g_type = '1'  THEN   #160310-00019#1 s983961--mark              
                   CALL s_transaction_begin()
                   CALL s_astt320_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
                   UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=g_stba_m.stbacnfdt
                        WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno               
                   IF NOT l_success THEN
                      CALL s_transaction_end('N','0')
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = l_errno
                      LET g_errparam.extend = g_stba_m.stbadocno
                      LET g_errparam.popup = TRUE
                      CALL cl_err()
                   
                      RETURN
                   ELSE
                      CALL s_transaction_end('Y','1')
                   END IF
               END IF 
               IF g_type = '2' THEN
                  CALL s_transaction_begin()
                  UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=g_stba_m.stbacnfdt
                       WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno               
                 
                 IF SQLCA.SQLcode THEN  
                     CALL s_transaction_end('N','0')
                     
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','1')
                  END IF               
               END IF
               IF g_type = '3' THEN
                  CALL s_transaction_begin()
                  
                  CALL astt320_produce_sheet(g_stba_m.stbadocno) RETURNING g_errno
                  IF NOT cl_null(g_errno) THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     RETURN           
                  END IF 
                  UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=g_stba_m.stbacnfdt
                       WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno               
                 
                 IF SQLCA.SQLcode THEN  
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','1')
                  END IF               
               END IF   
               #150527-00027#1 add by geza (E)             
               #160310-00019#1 s983961--add(s)                 
               IF g_type = '4'  THEN                     
                  CALL s_transaction_begin()
                  
                  #160512-00003#9 160518 by lori add---(S)
                  LET l_success = ''
                  LET l_errno = ''
                  CALL s_astt320_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
                  
                  IF NOT l_success THEN 
                     CALL s_transaction_end('N','0')
                     
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = l_errno
                     LET g_errparam.extend = g_stba_m.stbadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  ELSE
                     CALL s_transaction_end('Y','1')                  
                  END IF 
                  #160512-00003#9 160518 by lori add---(E)                  
               END IF
               #160310-00019#1 s983961--add(e) 
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#1 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            RETURN
         END IF  
         
      WHEN 'N'
         SELECT stbastus INTO  g_stba_m.stbastus 
           FROM stba_t 
          WHERE stbadocno = g_stba_m.stbadocno
            AND stbaent = g_enterprise 
            
         CALL s_astt320_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt320_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
               ##add by zhangnan --str
               IF g_type = '4' THEN 
                  SELECT COUNT(*) INTO l_cnm   FROM stbc_t 
                  WHERE stbcent=g_enterprise 
                    AND stbc003='3'
                    AND stbc004= g_stba_m.stbadocno
                  IF l_cnm > 0 THEN 
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00850"
                      LET g_errparam.extend = g_stba_m.stbadocno
                      LET g_errparam.popup = TRUE
                      CALL cl_err()
                      LET l_success = FALSE
                   END IF
                 END IF 
               ##add by zhangnan --end                  
               UPDATE stba_t SET stbacnfid = '',stbacnfdt='',stbamodid = g_user,stbamoddt=g_stba_m.stbamoddt
                    WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno                     
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#1 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            RETURN            
         END IF
      
         
      WHEN 'X'
         SELECT stbastus INTO  g_stba_m.stbastus 
           FROM stba_t 
          WHERE stbadocno = g_stba_m.stbadocno
            AND stbaent = g_enterprise 
            
         CALL s_astt320_conf_chk(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno
         
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt320_conf_upd(g_stba_m.stbadocno,lc_state) RETURNING l_success,l_errno  
               UPDATE stba_t SET stbamodid = g_user,stbamoddt=g_stba_m.stbamoddt
                    WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
               ##mark by zhangnan --liuxin shuo 
               #IF g_type = '4' and g_stba_m.stba006='2' THEN
               #    UPDATE stjm_t SET stjm015='N',
               #                       stjm016=''
               #     WHERE stjment=g_enterprise
               #       AND stjm016=g_stba_m.stbadocno
               #END IF
               #add by zhangnan --str               
               IF g_type = '4' THEN 
                  SELECT COUNT(*) INTO l_cnm   FROM stbc_t 
                  WHERE stbcent=g_enterprise 
                    AND stbc003='3'
                    AND stbc004= g_stba_m.stbadocno
                  IF l_cnm > 0 THEN 
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = "ast-00850"
                      LET g_errparam.extend = g_stba_m.stbadocno
                      LET g_errparam.popup = TRUE
                      CALL cl_err()
                      LET l_success = FALSE
                   END IF
                 END IF
                ##add by zhangnan --end                  
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#1 add
               RETURN            
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_stba_m.stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            RETURN            
         END IF            
      
     OTHERWISE 
         EXIT CASE          
   END CASE 
   #end add-point
   
   LET g_stba_m.stbamodid = g_user
   LET g_stba_m.stbamoddt = cl_get_current()
   LET g_stba_m.stbastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stba_t 
      SET (stbastus,stbamodid,stbamoddt) 
        = (g_stba_m.stbastus,g_stba_m.stbamodid,g_stba_m.stbamoddt)     
    WHERE stbaent = g_enterprise AND stbadocno = g_stba_m.stbadocno
 
    
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
      EXECUTE astt320_master_referesh USING g_stba_m.stbadocno INTO g_stba_m.stbaunit,g_stba_m.stbadocdt, 
          g_stba_m.stbadocno,g_stba_m.stba002,g_stba_m.stba013,g_stba_m.stba010,g_stba_m.stba000,g_stba_m.stba003, 
          g_stba_m.stba005,g_stba_m.stba004,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
          g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba022,g_stba_m.stba025,g_stba_m.stbasite, 
          g_stba_m.stba026,g_stba_m.stba011,g_stba_m.stba012,g_stba_m.stba008,g_stba_m.stba009,g_stba_m.stbaownid, 
          g_stba_m.stbaowndp,g_stba_m.stbacrtid,g_stba_m.stbacrtdp,g_stba_m.stbacrtdt,g_stba_m.stbamodid, 
          g_stba_m.stbamoddt,g_stba_m.stbacnfid,g_stba_m.stbacnfdt,g_stba_m.stbaunit_desc,g_stba_m.stba002_desc, 
          g_stba_m.stba013_desc,g_stba_m.stba005_desc,g_stba_m.stba004_desc,g_stba_m.stba001_desc,g_stba_m.stba022_desc, 
          g_stba_m.stba011_desc,g_stba_m.stba012_desc,g_stba_m.stba008_desc,g_stba_m.stba009_desc,g_stba_m.stbaownid_desc, 
          g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp_desc,g_stba_m.stbamodid_desc, 
          g_stba_m.stbacnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stba_m.stbaunit,g_stba_m.stbaunit_desc,g_stba_m.stbadocdt,g_stba_m.stbadocno, 
          g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba013,g_stba_m.stba013_desc,g_stba_m.stba010, 
          g_stba_m.stba000,g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba005_desc,g_stba_m.stba004, 
          g_stba_m.stba004_desc,g_stba_m.stba014,g_stba_m.stba015,g_stba_m.stba016,g_stba_m.stbastus, 
          g_stba_m.stba006,g_stba_m.stba007,g_stba_m.stba001,g_stba_m.stba001_desc,g_stba_m.stba022, 
          g_stba_m.stba022_desc,g_stba_m.stba025,g_stba_m.stbasite,g_stba_m.stba026,g_stba_m.stba011, 
          g_stba_m.stba011_desc,g_stba_m.stba012,g_stba_m.stba012_desc,g_stba_m.l_amount1,g_stba_m.stba008, 
          g_stba_m.stba008_desc,g_stba_m.stba009,g_stba_m.stba009_desc,g_stba_m.stbaownid,g_stba_m.stbaownid_desc, 
          g_stba_m.stbaowndp,g_stba_m.stbaowndp_desc,g_stba_m.stbacrtid,g_stba_m.stbacrtid_desc,g_stba_m.stbacrtdp, 
          g_stba_m.stbacrtdp_desc,g_stba_m.stbacrtdt,g_stba_m.stbamodid,g_stba_m.stbamodid_desc,g_stba_m.stbamoddt, 
          g_stba_m.stbacnfid,g_stba_m.stbacnfid_desc,g_stba_m.stbacnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt320_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt320_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt320.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt320_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stbb_d.getLength() THEN
         LET g_detail_idx = g_stbb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbb_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   #add by geza 20150802
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stbb2_d.getLength() THEN
         LET g_detail_idx = g_stbb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stbb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stbb2_d.getLength() TO FORMONLY.cnt
   END IF
    #add by geza 20150802
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt320_b_fill2(pi_idx)
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
   
   CALL astt320_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt320_fill_chk(ps_idx)
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
 
{<section id="astt320.status_show" >}
PRIVATE FUNCTION astt320_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt320.mask_functions" >}
&include "erp/ast/astt320_mask.4gl"
 
{</section>}
 
{<section id="astt320.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt320_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt320_show()
   CALL astt320_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
#   CALL s_astt320_conf_chk(g_stba_m.stbadocno,g_stba_m.stbastus) RETURNING l_success,l_errno   #160728-00017#1 by 08172
   CALL s_astt320_conf_chk(g_stba_m.stbadocno,'W') RETURNING l_success,l_errno   #160728-00017#1 by 08172
   #MOD BY zhujing 2015-6-16  添加报错消息
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = g_stba_m.stbadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE astt320_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stba_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stbb_d))
 
 
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
   #CALL astt320_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt320_ui_headershow()
   CALL astt320_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt320_draw_out()
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
   CALL astt320_ui_headershow()  
   CALL astt320_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt320.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt320_set_pk_array()
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
   LET g_pk_array[1].values = g_stba_m.stbadocno
   LET g_pk_array[1].column = 'stbadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt320.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt320.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt320_msgcentre_notify(lc_state)
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
   CALL astt320_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stba_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt320.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt320_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT stbastus  INTO g_stba_m.stbastus
     FROM stba_t
    WHERE stbaent = g_enterprise
      AND stbadocno = g_stba_m.stbadocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stba_m.stbastus
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
        LET g_errparam.extend = g_stba_m.stbadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt320_set_act_visible()
        CALL astt320_set_act_no_visible()
        CALL astt320_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt320.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 结案
# Date & Author..: 2015/05/29 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_case_end(p_stbadocno)
DEFINE r_errno        LIKE type_t.chr100
DEFINE p_stbadocno    LIKE stba_t.stbadocno
   LET r_errno = NULL
   IF g_stba_m_t.stbastus != 'Y' THEN
      LET r_errno = "ast-00297"
      RETURN r_errno
   END IF
   IF g_stba_m_t.stbastus = 'Y' THEN 
      CASE g_stba_m_t.stba015
         WHEN '1'
            UPDATE stba_t SET stba015 = '4' WHERE stbadocno = p_stbadocno AND stbaent = g_enterprise
            IF SQLCA.SQLcode THEN
               LET r_errno =SQLCA.sqlcode
               RETURN r_errno
            END IF  
         WHEN '4'
            UPDATE stba_t SET stba015 = '1' WHERE stbadocno = p_stbadocno AND stbaent = g_enterprise
            IF SQLCA.SQLcode THEN
               LET r_errno =SQLCA.sqlcode
               RETURN r_errno
            END IF
         WHEN '3'   
            LET r_errno = "ast-00340"
            RETURN r_errno 
         OTHERWISE
            LET r_errno = "ast-00296"
            RETURN r_errno 
      END CASE            
   END IF
   RETURN r_errno
END FUNCTION

################################################################################
# Descriptions...: 产生费用单
# Date & Author..: 2015/05/29 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_produce_sheet(p_stbadocno)
DEFINE r_errno        LIKE type_t.chr100
DEFINE p_stbadocno    LIKE stba_t.stbadocno
DEFINE l_stba010      LIKE stba_t.stba010
DEFINE l_stbastus     LIKE stba_t.stbastus
#161111-00028#5---modify----begin--------
#DEFINE l_stba RECORD  LIKE stba_t.*
#DEFINE l_stbb RECORD  LIKE stbb_t.*
DEFINE l_stba RECORD  #費用單資料表
       stbaent LIKE stba_t.stbaent, #企業編號
       stbasite LIKE stba_t.stbasite, #營運據點
       stbaunit LIKE stba_t.stbaunit, #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001 LIKE stba_t.stba001, #結算中心
       stba002 LIKE stba_t.stba002, #供應商編號
       stba003 LIKE stba_t.stba003, #經營方式
       stba004 LIKE stba_t.stba004, #結算方式
       stba005 LIKE stba_t.stba005, #結算類型
       stba006 LIKE stba_t.stba006, #來源類型
       stba007 LIKE stba_t.stba007, #來源單號
       stba008 LIKE stba_t.stba008, #人員
       stba009 LIKE stba_t.stba009, #部門
       stbastus LIKE stba_t.stbastus, #狀態碼
       stbaownid LIKE stba_t.stbaownid, #資料所屬者
       stbaowndp LIKE stba_t.stbaowndp, #資料所有部門
       stbacrtid LIKE stba_t.stbacrtid, #資料建立者
       stbacrtdp LIKE stba_t.stbacrtdp, #資料建立部門
       stbacrtdt LIKE stba_t.stbacrtdt, #資料創建日
       stbamodid LIKE stba_t.stbamodid, #資料修改者
       stbamoddt LIKE stba_t.stbamoddt, #最近修改日
       stbacnfid LIKE stba_t.stbacnfid, #資料確認者
       stbacnfdt LIKE stba_t.stbacnfdt, #資料確認日
       stba010 LIKE stba_t.stba010, #合約編號
       stba011 LIKE stba_t.stba011, #幣別
       stba012 LIKE stba_t.stba012, #稅別
       stba013 LIKE stba_t.stba013, #專櫃編號/鋪位編號
       stba014 LIKE stba_t.stba014, #費用類型
       stba015 LIKE stba_t.stba015, #交款狀態
       stba000 LIKE stba_t.stba000, #程式編號
       stba016 LIKE stba_t.stba016, #交款人
       stba017 LIKE stba_t.stba017, #結算帳期
       stba018 LIKE stba_t.stba018, #結算日期
       stba019 LIKE stba_t.stba019, #開始日期
       stba020 LIKE stba_t.stba020, #結束日期
       stba021 LIKE stba_t.stba021, #成本總額
       stba022 LIKE stba_t.stba022, #法人
       stba023 LIKE stba_t.stba023, #會員折扣金額
       stba024 LIKE stba_t.stba024, #no_use
       stba025 LIKE stba_t.stba025, #合約帳期
       stba026 LIKE stba_t.stba026, #計算日期
       stba027 LIKE stba_t.stba027  #促銷協議項次
       END RECORD
DEFINE l_stbb RECORD  #費用單明細資料表
       stbbent LIKE stbb_t.stbbent, #企業編號
       stbbunit LIKE stbb_t.stbbunit, #應用組織
       stbbsite LIKE stbb_t.stbbsite, #營運據點
       stbbdocno LIKE stbb_t.stbbdocno, #單據編號
       stbbseq LIKE stbb_t.stbbseq, #項次
       stbb001 LIKE stbb_t.stbb001, #費用編號
       stbb002 LIKE stbb_t.stbb002, #幣別
       stbb003 LIKE stbb_t.stbb003, #稅別
       stbb004 LIKE stbb_t.stbb004, #價款類別
       stbb005 LIKE stbb_t.stbb005, #起始日期
       stbb006 LIKE stbb_t.stbb006, #截止日期
       stbb007 LIKE stbb_t.stbb007, #結算會計期
       stbb008 LIKE stbb_t.stbb008, #財務會計期
       stbb009 LIKE stbb_t.stbb009, #費用金額
       stbb010 LIKE stbb_t.stbb010, #承擔對象
       stbb011 LIKE stbb_t.stbb011, #所屬品類
       stbb012 LIKE stbb_t.stbb012, #所屬部門
       stbb013 LIKE stbb_t.stbb013, #結算對象
       stbb014 LIKE stbb_t.stbb014, #財務會計期別
       stbb015 LIKE stbb_t.stbb015, #納入結算單否
       stbb016 LIKE stbb_t.stbb016, #票扣否
       stbb017 LIKE stbb_t.stbb017, #備註
       stbb018 LIKE stbb_t.stbb018, #結算帳期
       stbb019 LIKE stbb_t.stbb019, #結算日期
       stbb020 LIKE stbb_t.stbb020, #日結成本類型
       stbb021 LIKE stbb_t.stbb021, #調整日期
       stbb022 LIKE stbb_t.stbb022, #商品編號
       stbb023 LIKE stbb_t.stbb023, #庫區編號
       stbb024 LIKE stbb_t.stbb024, #专柜编号
       stbb025 LIKE stbb_t.stbb025, #應收金額
       stbb026 LIKE stbb_t.stbb026, #實收金額
       stbb027 LIKE stbb_t.stbb027, #費率
       stbb028 LIKE stbb_t.stbb028, #成本金額
       stbb029 LIKE stbb_t.stbb029, #促銷銷售額
       stbb030 LIKE stbb_t.stbb030, #費用歸屬類型
       stbb031 LIKE stbb_t.stbb031, #費用歸屬組織
       stbb032 LIKE stbb_t.stbb032, #銷售數量
       stbb033 LIKE stbb_t.stbb033  #銷售單位
       END RECORD

#161111-00028#5---modify----end----------
DEFINE l_success      LIKE type_t.num5
DEFINE l_errno        LIKE type_t.chr100
DEFINE r_doctype      LIKE type_t.chr10

   LET r_errno = NULL
   IF g_type = '2' THEN
      IF g_stba_m_t.stba015 = '3' THEN 
         LET r_errno = "ast-00339"
         RETURN r_errno
      END  IF
      IF g_stba_m_t.stba015 != '1' THEN 
         LET r_errno = "ast-00298"
         RETURN r_errno
      END  IF
      
      SELECT stba010 INTO l_stba010 
        FROM stba_t
       WHERE stbaent = g_enterprise
         AND stbadocno = p_stbadocno
      IF cl_null(l_stba010) THEN
         LET r_errno = "ast-00299"
         RETURN r_errno  
      END IF
      SELECT stbastus INTO l_stbastus 
        FROM stba_t
       WHERE stbaent = g_enterprise
         AND stbadocno = p_stbadocno
      IF l_stbastus != 'Y' THEN
         LET r_errno = "ast-00300"
         RETURN r_errno  
      END IF
   END IF
   
     #161111-00028#5---modify--begin---
   #ELECT stba_t.* INTO l_stba.*
   SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,stba007,stba008,
          stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,stbamoddt,stbacnfid,stbacnfdt,
          stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,stba017,stba018,stba019,stba020,stba021,
          stba022,stba023,stba024,stba025,stba026,stba027 INTO l_stba.*
   #161111-00028#5---modify--end---
     FROM stba_t
    WHERE stbaent=g_enterprise 
      AND stbadocno=p_stbadocno 
    
   INITIALIZE l_stba.stbadocno TO NULL
   INITIALIZE l_stba.stba015 TO NULL
   INITIALIZE l_stba.stba013 TO NULL
   LET l_stba.stba000 = 'astt320'
   #add by geza 20151231(S)
   IF g_type = '2' THEN 
      LET l_stba.stba006 = '13' 
   ELSE
      LET l_stba.stba006 = '19'   
      LET l_stba.stbastus = 'Y'
   END IF
   #add by geza 20151231(E)
   #LET l_stba.stba006 = '13'  
   LET l_stba.stba007 = g_stba_m.stbadocno
   
   
   CALL s_transaction_begin() 
   UPDATE stba_t SET stba015 = '3' WHERE stbadocno = p_stbadocno AND stbaent = g_enterprise
   
   #抓取默認單別arti200的設定
   CALL s_arti200_get_def_doc_type(g_stba_m.stbaunit,'astt320','1') RETURNING l_success,r_doctype
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
      LET r_errno = "apm-00003"
      RETURN r_errno                  
   END IF
   
   CALL s_aooi200_gen_docno(g_site,r_doctype,g_stba_m.stbadocdt,'astt320') RETURNING l_success,l_stba.stbadocno
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
      LET r_errno = "apm-00003"
      RETURN r_errno                  
   END IF   
   
   #161111-00028#5---modify--begin---
  #INSERT INTO stba_t VALUES(l_stba.*) 
   INSERT INTO stba_t (stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,
                       stba007,stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,
                       stbamoddt,stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,
                       stba017,stba018,stba019,stba020,stba021,stba022,stba023,stba024,stba025,stba026,stba027)
    VALUES(l_stba.stbaent,l_stba.stbasite,l_stba.stbaunit,l_stba.stbadocno,l_stba.stbadocdt,l_stba.stba001,l_stba.stba002,l_stba.stba003,l_stba.stba004,l_stba.stba005,l_stba.stba006,
           l_stba.stba007,l_stba.stba008,l_stba.stba009,l_stba.stbastus,l_stba.stbaownid,l_stba.stbaowndp,l_stba.stbacrtid,l_stba.stbacrtdp,l_stba.stbacrtdt,l_stba.stbamodid,
           l_stba.stbamoddt,l_stba.stbacnfid,l_stba.stbacnfdt,l_stba.stba010,l_stba.stba011,l_stba.stba012,l_stba.stba013,l_stba.stba014,l_stba.stba015,l_stba.stba000,l_stba.stba016,
           l_stba.stba017,l_stba.stba018,l_stba.stba019,l_stba.stba020,l_stba.stba021,l_stba.stba022,l_stba.stba023,l_stba.stba024,l_stba.stba025,l_stba.stba026,l_stba.stba027) 
   #161111-00028#5---modify--end---  
   IF SQLCA.SQLcode THEN
      CALL s_transaction_end('N','0')
      LET r_errno =SQLCA.sqlcode
      RETURN r_errno
   END IF 
   
   DECLARE s_astt322_stbb_cs CURSOR FOR 
                #161111-00028#5---modify--begin---
                #  SELECT stbb_t.*
                   SELECT stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb002,stbb003,stbb004,stbb005,stbb006,
                          stbb007,stbb008,stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,stbb015,stbb016,stbb017,stbb018,
                          stbb019,stbb020,stbb021,stbb022,stbb023,stbb024,stbb025,stbb026,stbb027,stbb028,stbb029,stbb030,
                          stbb031,stbb032,stbb033
                #161111-00028#5---modify--end---
                     FROM stbb_t 
                    WHERE stbbent=g_enterprise 
                      AND stbbdocno=p_stbadocno 

   INITIALIZE l_stbb.* TO NULL
   
   FOREACH s_astt322_stbb_cs INTO l_stbb.*
      LET  l_stbb.stbbdocno = l_stba.stbadocno
      #161111-00028#5---modify--begin---
      #INSERT INTO stbb_t VALUES(l_stbb.*)
      INSERT INTO stbb_t (stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb002,stbb003,stbb004,stbb005,stbb006,
                          stbb007,stbb008,stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,stbb015,stbb016,stbb017,
                          stbb018,stbb019,stbb020,stbb021,stbb022,stbb023,stbb024,stbb025,stbb026,stbb027,stbb028,
                          stbb029,stbb030,stbb031,stbb032,stbb033)
        VALUES(l_stbb.stbbent,l_stbb.stbbunit,l_stbb.stbbsite,l_stbb.stbbdocno,l_stbb.stbbseq,l_stbb.stbb001,l_stbb.stbb002,l_stbb.stbb003,l_stbb.stbb004,l_stbb.stbb005,l_stbb.stbb006,
               l_stbb.stbb007,l_stbb.stbb008,l_stbb.stbb009,l_stbb.stbb010,l_stbb.stbb011,l_stbb.stbb012,l_stbb.stbb013,l_stbb.stbb014,l_stbb.stbb015,l_stbb.stbb016,l_stbb.stbb017,
               l_stbb.stbb018,l_stbb.stbb019,l_stbb.stbb020,l_stbb.stbb021,l_stbb.stbb022,l_stbb.stbb023,l_stbb.stbb024,l_stbb.stbb025,l_stbb.stbb026,l_stbb.stbb027,l_stbb.stbb028,
               l_stbb.stbb029,l_stbb.stbb030,l_stbb.stbb031,l_stbb.stbb032,l_stbb.stbb033)
      #161111-00028#5---modify--end---
      
      IF SQLCA.SQLcode THEN
         CALL s_transaction_end('N','0')
         LET r_errno =SQLCA.sqlcode
         RETURN r_errno
      END IF          
   END FOREACH
 
   CALL s_astt320_conf_upd(l_stba.stbadocno,'Y') RETURNING l_success,l_errno            
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
      LET r_errno =l_errno
      RETURN r_errno
   ELSE
      CALL s_transaction_end('Y','1')
   END IF
 
   RETURN r_errno
END FUNCTION

################################################################################
# Descriptions...: 销售明细显示
# Memo...........:
# Usage..........: CALL astt320_b_fill_2()
# Date & Author..: 20150801 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_b_fill_2()
DEFINE p_wc2      STRING
DEFINE li_idx     LIKE type_t.num10

   CALL g_stbb2_d.clear()

   LET g_sql = "SELECT  UNIQUE stbpseq,stbp001,stbp002,stbp003,stbp004,stbp005,stbp006,stbp007, 
       stbp008,stbp009  FROM stbp_t",   
               " INNER JOIN stba_t ON stbadocno = stbpdocno ",
  
               "",
               
               
               " WHERE stbpent=? AND stbpdocno=?"   
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:b_fill段sql_before
  
   #end add-point
   IF NOT cl_null(g_wc2_table2) THEN
      LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
   END IF
   
   
   LET g_sql = g_sql, " ORDER BY stbp_t.stbpseq"
   
   #add-point:單身填充控制
  
   #end add-point
   
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE astt320_pb2 FROM g_sql
   DECLARE b_fill_cs2 CURSOR FOR astt320_pb2

  
   LET l_ac = 1
   
   OPEN b_fill_cs2 USING g_enterprise,g_stba_m.stbadocno
                                            
   FOREACH b_fill_cs2 INTO g_stbb2_d[l_ac].stbpseq,g_stbb2_d[l_ac].stbp001,g_stbb2_d[l_ac].stbp002, 
       g_stbb2_d[l_ac].stbp003,g_stbb2_d[l_ac].stbp004,g_stbb2_d[l_ac].stbp005,g_stbb2_d[l_ac].stbp006, 
       g_stbb2_d[l_ac].stbp007,g_stbb2_d[l_ac].stbp008,g_stbb2_d[l_ac].stbp009
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
     
      #add-point:b_fill段資料填充
  
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

   
   CALL g_stbb2_d.deleteElement(g_stbb2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt320_pb2
 
 
   
   LET li_idx = l_ac
   

   LET g_stbb2_d_mask_o.* =  g_stbb2_d.*
   FOR l_ac = 1 TO g_stbb2_d.getLength()
      LET g_stbb2_d_mask_o[l_ac].* =  g_stbb2_d[l_ac].*
      LET g_stbb2_d_mask_n[l_ac].* =  g_stbb2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
END FUNCTION

################################################################################
# Descriptions...: 供應商依照合約帶出經營方式、結算類型、結算方式
# Memo...........:
# Usage..........: CALL astt320_stba003_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140408 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt320_stba003_ref()
DEFINE l_count      LIKE type_t.num5
DEFINE l_stan001    LIKE stan_t.stan001

   IF cl_null(g_stba_m.stba002) THEN
      RETURN
   END IF

   LET g_stba_m.stba004=''
   LET g_stba_m.stba005=''
   SELECT stan010,stan009 INTO g_stba_m.stba005,g_stba_m.stba004
     FROM stan_t
    WHERE stanent=g_enterprise
      AND stan005=g_stba_m.stba002
      AND stan002=g_stba_m.stba003
      AND stanstus='Y'
     # AND stan017<=g_today  #mark by geza 20150703
     # AND stan018>g_today   #mark by geza 20150703
      AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
   
  DISPLAY BY NAME g_stba_m.stba003
  DISPLAY BY NAME g_stba_m.stba004
  DISPLAY BY NAME g_stba_m.stba005
  
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stba_m.stba005
  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stba_m.stba005_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stba_m.stba005_desc

  #160511-00034#1 1560510 by lori mark---(S)
  #INITIALIZE g_ref_fields TO NULL
  #LET g_ref_fields[1] = g_stba_m.stba004
  #CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
  #LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
  #DISPLAY BY NAME g_stba_m.stba004_desc  
  #160511-00034#1 1560510 by lori mark---(E)
  
  CALL astt320_stba004_ref()   #160511-00034#1 1560510 by lori add
END FUNCTION

################################################################################
# Descriptions...: 取結算方式說明
# Memo...........:
# Usage..........: CALL astt320_stba004_ref()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/10 By Lori
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_stba004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba004_desc   
END FUNCTION

################################################################################
# Descriptions...: 分銷合約帶出資料
# Memo...........:
# Usage..........: CALL astt320_stba010_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/03/16 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_stba010_ref()
DEFINE  l_success             LIKE type_t.num5
DEFINE  l_errno               LIKE type_t.chr100
DEFINE  l_ooef019             LIKE ooef_t.ooef019

   #带出供应商、经营方式、结算方式、结算类型、结算中心、币别、税别
   SELECT stan005,stan002,stan009,stan010,stan015,stan006,stan007 INTO 
          g_stba_m.stba002,g_stba_m.stba003,g_stba_m.stba004,g_stba_m.stba005,g_stba_m.stba001,g_stba_m.stba011,g_stba_m.stba012  
     FROM stan_t
    WHERE stanent=g_enterprise
      AND stan001=g_stba_m.stba010
      AND stanstus='Y' 
   #   AND stan017<=g_stba_m.stbadocdt     #mark by geza 20150703
   #   AND stan018>=g_stba_m.stbadocdt     #mark by geza 20150703
      AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
   
   #add by geza 20151201(S)
   #人员带合同的签订人员
   SELECT stan014 INTO g_stba_m.stba008
     FROM stan_t
    WHERE stanent=g_enterprise
      AND stan001=g_stba_m.stba010                
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stba_m.stba008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba008_desc  
   
   #部门带合同的部门和名称
   SELECT stan038 INTO g_stba_m.stba009
     FROM stan_t
    WHERE stanent = g_enterprise  
      AND stan001 = g_stba_m.stba010
   SELECT ooefl003 INTO g_stba_m.stba009_desc
     FROM ooefl_t
    WHERE ooeflent=g_enterprise
      AND ooefl001=g_stba_m.stba009
      AND ooefl002=g_dlang             
   #add by geza 20151201(E)  
   
   DISPLAY BY NAME g_stba_m.stba002 
   DISPLAY BY NAME g_stba_m.stba003 
   DISPLAY BY NAME g_stba_m.stba004 
   DISPLAY BY NAME g_stba_m.stba005
   DISPLAY BY NAME g_stba_m.stba001
   DISPLAY BY NAME g_stba_m.stba011
   DISPLAY BY NAME g_stba_m.stba012
   DISPLAY BY NAME g_stba_m.stba008       #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba008_desc  #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba009       #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba009_desc  #add by geza 20151201
        
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba002
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba002_desc  
   
   #160511-00034#1 1560510 by lori mark---(S)
   #INITIALIZE g_ref_fields TO NULL
   #LET g_ref_fields[1] = g_stba_m.stba004
   #CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   #LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
   #DISPLAY BY NAME g_stba_m.stba004_desc  
   #160511-00034#1 1560510 by lori mark---(E)

   CALL astt320_stba004_ref()   #160511-00034#1 1560510 by lori add
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba005_desc


   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba011
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba011_desc

   SELECT ooef019 INTO l_ooef019
     FROM ooef_t 
     WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooef019
   LET g_ref_fields[2] = g_stba_m.stba012
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba012_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba012_desc
END FUNCTION

################################################################################
# Descriptions...: 取專櫃/鋪位說明
# Memo...........:
# Usage..........: CALL astt320_stba013_ref()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/10 By Lori
# Modify.........: 2016/05/18 By Lori      #160518-00077#1
################################################################################
PRIVATE FUNCTION astt320_stba013_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba013
      
   IF g_type = '4' THEN   
      CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent="||g_enterprise||" AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
   ELSE
      CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   END IF   
   
   LET g_stba_m.stba013_desc = '', g_rtn_fields[1] , ''   
   DISPLAY BY NAME g_stba_m.stba013_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt320_stba022_ref()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_stba022_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba022
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba022_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba022_desc
END FUNCTION

################################################################################
# Descriptions...: 依來源單號 帶出意向/預租協議資料
# Memo...........:
# Usage..........: CALL astt810_stba007_ref(p_stba006,p_stba007)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20160326 BY s983961
# Modify.........:
################################################################################
PRIVATE FUNCTION astt810_stba007_ref(p_stba006,p_stba007)
DEFINE p_stba007      LIKE  stba_t.stba007
DEFINE p_stba006      LIKE  stba_t.stba006
DEFINE r_success      LIKE   type_t.num5
DEFINE l_stia         RECORD   
       stia001        LIKE   stia_t.stia001,        #來源類型
       stia002        LIKE   stia_t.stia002,        #來源單號
       stia003        LIKE   stia_t.stia003,        #商戶編號
       stia004        LIKE   stia_t.stia004,        #商戶連絡電話
       stia005        LIKE   stia_t.stia005,        #主品牌
       stia006        LIKE   stia_t.stia006,        #鋪位編號
       stia007        LIKE   stia_t.stia007,        #鋪位版本
       stia008        LIKE   stia_t.stia008,        #樓棟編號
       stia009        LIKE   stia_t.stia009,        #樓層編號
       stia010        LIKE   stia_t.stia010,        #品類編號
       stia011        LIKE   stia_t.stia011,        #費用編號
       stia012        LIKE   stia_t.stia012,        #預定金額
       stia013        LIKE   stia_t.stia013,        #費用單號
       stia014        LIKE   stia_t.stia014,        #業務人員
       stia015        LIKE   stia_t.stia015,        #業務部門
       stia016        LIKE   stia_t.stia016,        #備註
       stiadocdt      LIKE   stia_t.stiadocdt,      #單據日期
       stiaent        LIKE   stia_t.stiaent,        #企業編號
       stiasite       LIKE   stia_t.stiasite,       #營運據點
       stiastus       LIKE   stia_t.stiastus,       #狀態碼
       stiaunit       LIKE   stia_t.stiaunit        #制定組織
                      END RECORD  
DEFINE l_stic   RECORD   
       stic001        LIKE  stic_t.stic001,        #預租類型
       stic002        LIKE  stic_t.stic002,        #商戶編號
       stic003        LIKE  stic_t.stic003,        #商戶連絡電話
       stic004        LIKE  stic_t.stic004,        #預租開始日期
       stic005        LIKE  stic_t.stic005,        #預租結束日期
       stic006        LIKE  stic_t.stic006,        #原合約編號最
       stic007        LIKE  stic_t.stic007,        #新合約編號最
       stic008        LIKE  stic_t.stic008,        #合約開始日期
       stic009        LIKE  stic_t.stic009,        #合約結束日期
       stic010        LIKE  stic_t.stic010,        #鋪位編號攀期
       stic011        LIKE  stic_t.stic011,        #鋪位版本攀期
       stic012        LIKE  stic_t.stic012,        #樓棟編號攀期
       stic013        LIKE  stic_t.stic013,        #樓層編號攀期
       stic014        LIKE  stic_t.stic014,        #品類編號攀期
       stic015        LIKE  stic_t.stic015,        #主品牌蘀攀期
       stic016        LIKE  stic_t.stic016,        #收銀方式攀期
       stic017        LIKE  stic_t.stic017,        #費用單號攀期
       stic018        LIKE  stic_t.stic018,        #費用編號攀期
       stic019        LIKE  stic_t.stic019,        #預收金額攀期
       stic020        LIKE  stic_t.stic020,        #業務人員攀期
       stic021        LIKE  stic_t.stic021,        #業務部門攀期
       stic022        LIKE  stic_t.stic022,        #終止日期攀期
       stic023        LIKE  stic_t.stic023,        #終止人員攀期
       stic024        LIKE  stic_t.stic024,        #終止部門攀期
       stic025        LIKE  stic_t.stic025,        #備註退門攀期
       sticcnfdt      LIKE  stic_t.sticcnfdt,        #資料確認日
       sticcnfid      LIKE  stic_t.sticcnfid,        #資料確認者
       sticcrtdp      LIKE  stic_t.sticcrtdp,        #資料建立部門
       sticcrtdt      LIKE  stic_t.sticcrtdt,        #資料創建日销
       sticcrtid      LIKE  stic_t.sticcrtid,        #資料建立者销
       sticdocdt      LIKE  stic_t.sticdocdt,        #單據日期耀销
       sticdocno      LIKE  stic_t.sticdocno,        #單據編號耀销
       sticent        LIKE  stic_t.sticent,        #企業編號紀號耀销
       sticmoddt      LIKE  stic_t.sticmoddt,        #最近修改日销
       sticmodid      LIKE  stic_t.sticmodid,        #資料修改者销
       sticowndp      LIKE  stic_t.sticowndp,        #資料所屬部門
       sticownid      LIKE  stic_t.sticownid,        #資料所有者销
       sticsite       LIKE  stic_t.sticsite,        #營運據點最者销
       sticstus       LIKE  stic_t.sticstus,        #狀態碼鸀最者销
       sticunit       LIKE  stic_t.sticunit         #應用組織最者销
                      END RECORD                    
DEFINE  l_success     LIKE type_t.num5
DEFINE  l_err_cnt     LIKE type_t.num5
DEFINE  l_sql         STRING
DEFINE  l_seq         LIKE type_t.num5  

    INITIALIZE l_stic.* TO NULL
    LET l_success = ''   
    LET r_success = TRUE
    LET l_success = TRUE
    
    IF p_stba006 = '20' THEN
       #帶出意向協議
       SELECT stiaent,stiasite,stiaunit,stiadocdt,
       stia001,stia002, stia003, stia004,  stia005, 
       stia006,stia007, stia008, stia009,  stia010,
       stia011,stia012, stia013, stia014,  stia015,
       stia016,stiastus
         INTO l_stia.stiaent,l_stia.stiasite,l_stia.stiaunit,l_stia.stiadocdt,            
              l_stia.stia001,l_stia.stia002,l_stia.stia003,l_stia.stia004,l_stia.stia005, 
              l_stia.stia006,l_stia.stia007,l_stia.stia008,l_stia.stia009,l_stia.stia010, 
              l_stia.stia011,l_stia.stia012,l_stia.stia013,l_stia.stia014,l_stia.stia015,
              l_stia.stia016,l_stia.stiastus
         FROM stia_t
        WHERE stiadocno = g_stba_m.stba007 AND stiaent = g_enterprise
         
       LET l_sql = "INSERT INTO stbb_t(stbbent  ,stbbunit ,stbbsite ,stbbdocno,stbbseq  , ",   #企業編號,應用組織,營運據點,單據編號,項次
                   "                   stbb001  ,stbb005  ,stbb006  ,stbb009  ,stbb011)   ",   #費用編號,起始日期,截止日期,費用金額,所屬品類 
                   "VALUES (?   ,?   ,?   ,?  ,?  , ", 
                   "        ?   ,?   ,?   ,?  ,? )  "
       PREPARE astt810_stbb_ins FROM l_sql  
       EXECUTE astt810_stbb_ins USING
       l_stia.stiaent   ,l_stia.stiaunit   ,l_stia.stiasite   ,g_stba_m.stbadocno ,'1'   , 
       l_stia.stia011   ,g_today           ,g_today           ,l_stia.stia012     ,l_stia.stia010    
         
       IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "EXECUTE:astt810_stbb_ins" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()     
         LET r_success = FALSE         
         RETURN r_success
       END IF          
    END IF
    
    IF p_stba006 = '21' THEN
       SELECT sticent, sticsite, sticunit,  sticdocdt, sticdocno,
              stic001, stic002,  stic003,   stic004,   stic005,  stic006,
              stic007, stic008,  stic009,   stic010,   stic011,  stic012,
              stic013, stic014,  stic015,   stic016,   stic017,  stic018,
              stic019, stic020,  stic021,   stic022,   stic023,  stic024,
              stic025, sticstus
         INTO  l_stic.sticent,l_stic.sticsite ,l_stic.sticunit ,l_stic.sticdocdt,l_stic.sticdocno,
               l_stic.stic001,l_stic.stic002  ,l_stic.stic003  ,l_stic.stic004  ,l_stic.stic005  ,l_stic.stic006,
               l_stic.stic007,l_stic.stic008  ,l_stic.stic009  ,l_stic.stic010  ,l_stic.stic011  ,l_stic.stic012,
               l_stic.stic013,l_stic.stic014  ,l_stic.stic015  ,l_stic.stic016  ,l_stic.stic017  ,l_stic.stic018,
               l_stic.stic019,l_stic.stic020  ,l_stic.stic021  ,l_stic.stic022  ,l_stic.stic023  ,l_stic.stic024,
               l_stic.stic025,l_stic.sticstus
         FROM stic_t   
        WHERE sticent = g_enterprise AND sticdocno = p_stba007 
          
       #寫入費用單/交款單單身
       LET l_sql = "INSERT INTO stbb_t(stbbent  ,stbbunit ,stbbsite ,stbbdocno,stbbseq  , ",   #企業編號,應用組織,營運據點,單據編號,項次
                   "                   stbb001  ,stbb005  , ",   #費用編號,起始日期
                   "                   stbb006  ,stbb009  , ",   #截止日期,費用金額
                   "                   stbb011  ) ",   #所屬品類
                   "VALUES (?   ,?    ,?    ,?   ,?    , ", 
                   "        ?   ,?    , ",
                   "        ?   ,?    , ",
                   "        ?         ) "
       PREPARE astt812_stbb_ins FROM l_sql 
       EXECUTE astt812_stbb_ins USING
       g_enterprise     ,l_stic.sticunit   ,l_stic.sticsite  ,g_stba_m.stbadocno ,'1', 
       l_stic.stic018   ,g_today,
       g_today          ,l_stic.stic019    ,
       l_stic.stic014       
       
       IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "EXECUTE:astt812_stba_ins" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()      
         LET r_success = FALSE
         RETURN r_success
       END IF  
    END IF
    
    RETURN r_success  
END FUNCTION

################################################################################
# Descriptions...: 單頭預設值, 輸入供應商, 合約, 鋪位編號時自動帶值
# Memo...........:
# Usage..........: CALL astt320_stba_def(p_sour_type)
#                  RETURNING r_success,r_def_flag 
# Input parameter: p_sour_type   帶值來源, 1.供應商, 2.合約, 3.鋪位
# Return code....: r_success     處理結果
#                  r_def_flag    是否有帶值(因供應商或鋪位可能對應多筆資料故不帶值)
# Date & Author..: 2016/05/10 By Lori
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_stba_def(p_sour_type)
   DEFINE p_sour_type    LIKE type_t.num5
   DEFINE r_success      LIKE type_t.num5
   DEFINE r_def_flag     LIKE type_t.chr1
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_sql          STRING
   DEFINE l_stje001      LIKE stje_t.stje001
   DEFINE l_stje007      LIKE stje_t.stje007
   DEFINE l_stje008      LIKE stje_t.stje008
   
   LET r_success = TRUE
   LET r_def_flag = 'N'
   LET l_stje001 = NULL
   LET l_stje007 = NULL
   LET l_stje008 = NULL
   
   #add by geza 20160623 #160604-00009#89(S)
   #不是租赁费用单不走下面逻辑
   IF g_type <> '4' THEN      
      RETURN r_success,r_def_flag
   END IF
   #add by geza 20160623 #160604-00009#89(E)
   
   LET l_sql = "SELECT stje001,stje007,stje008,stje031,stje032, ",   #合約編號,商戶編號,鋪位編號,結算方式,結算類型
               "       stje036,stje038,stje017,stje018, ",           #幣別,稅別,簽部人員,簽訂部門
               "       stje030",                                     #結算中心   #160604-00009#58 160618 by sakura add 
               "  FROM stje_t ",
               " WHERE stjeent = ",g_enterprise
               
   IF NOT cl_null(g_stba_m.stba010) THEN              
      LET l_sql = l_sql," AND stje001 = '",g_stba_m.stba010,"' "
   END IF
   
   IF NOT cl_null(g_stba_m.stba002) THEN              
      LET l_sql = l_sql," AND stje007 = '",g_stba_m.stba002,"' "
   END IF

   
   IF NOT cl_null(g_stba_m.stba013) THEN                             #160518-00077#1 160518 by lori mod stba024->stba013 
      LET l_sql = l_sql," AND stje008 = '",g_stba_m.stba013,"' "     #160518-00077#1 160518 by lori mod stba024->stba013
   END IF
   
   LET l_sql = l_sql," AND stje005 IN ('2','3','4','5','6') "        #Modify By Ken 160615加上6
   
   PREPARE astt320_sel_stje FROM l_sql
   DISPLAY "SOUR SQL: ",l_sql
   
   LET l_sql = "SELECT COUNT(*) FROM (",l_sql,") "
   PREPARE astt320_cnt_stje FROM l_sql
   
   CASE p_sour_type
      WHEN 1    #供應商
         LET g_stba_m.stba010 = NULL
         LET g_stba_m.stba013 = NULL                                              #160518-00077#1 160518 by lori mod stba024->stba013    
         LET g_stba_m.stba013_desc = NULL                                         #160518-00077#1 160518 by lori mod stba024->stba013
         DISPLAY BY NAME g_stba_m.stba010,g_stba_m.stba013,g_stba_m.stba013_desc  #160518-00077#1 160518 by lori mod stba024->stba013
         
         LET l_cnt = 0
         EXECUTE astt320_cnt_stje INTO l_cnt
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "PREPARE astt320_cnt_stje" 
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err()      
            
            LET r_success = FALSE
            RETURN r_success,r_def_flag
         END IF
         
         IF l_cnt = 1 THEN
            LET r_def_flag = 'Y'
         ELSE
            LET g_stba_m_o.stba010 = g_stba_m.stba010
            LET g_stba_m_o.stba013 = g_stba_m.stba013   #160518-00077#1 160518 by lori mod stba024->stba013
         END IF   
      WHEN 2    #合約
         LET r_def_flag = 'Y'
      WHEN 3    #鋪位
         LET g_stba_m.stba002 = NULL
         LET g_stba_m.stba002_desc = NULL
         LET g_stba_m.stba010 = NULL
         DISPLAY BY NAME g_stba_m.stba002,g_stba_m.stba002_desc,g_stba_m.stba010
         
         LET l_cnt = 0
         EXECUTE astt320_cnt_stje INTO l_cnt
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "PREPARE astt320_cnt_stje" 
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE 
            CALL cl_err()      
            
            LET r_success = FALSE
            RETURN r_success,r_def_flag
         END IF
      
         IF l_cnt = 1 THEN
            LET r_def_flag = 'Y'
         ELSE
            LET g_stba_m_o.stba002 = g_stba_m.stba002
            LET g_stba_m_o.stba010 = g_stba_m.stba010
         END IF     
   END CASE

   IF g_stba_m.stba002 <> g_stba_m.stba002 THEN
      LET g_stba_m.stba005 = NULL
      LET g_stba_m.stba004 = NULL
      LET g_stba_m.stba010 = NULL
      LET g_stba_m.stba011 = NULL
      LET g_stba_m.stba012 = NULL
      LET g_stba_m.stba008 = NULL
      LET g_stba_m.stba009 = NULL
      LET g_stba_m.stba013 = NULL        #160518-00077#1 160518 by lori mod stba024->stba013
      LET g_stba_m.stba025 = NULL
      LET g_stba_m.stba005_desc = NULL
      LET g_stba_m.stba004_desc = NULL
      LET g_stba_m.stba011_desc = NULL
      LET g_stba_m.stba012_desc = NULL
      LET g_stba_m.stba008_desc = NULL
      LET g_stba_m.stba009_desc = NULL 
      LET g_stba_m.stba013_desc = NULL   #160518-00077#1 160518 by lori mod stba024->stba013      
   END IF
   
   LET g_stba_m.stba011 = NULL
   LET g_stba_m.stba005 = NULL
   LET g_stba_m.stba004 = NULL
   LET g_stba_m.stba011 = NULL
   LET g_stba_m.stba012 = NULL
   LET g_stba_m.stba008 = NULL
   LET g_stba_m.stba009 = NULL
   LET g_stba_m.stba025 = NULL
   LET g_stba_m.stba001 = NULL   #160604-00009#58 160618 by sakura add
   LET g_stba_m.stba005_desc = NULL
   LET g_stba_m.stba004_desc = NULL
   LET g_stba_m.stba011_desc = NULL
   LET g_stba_m.stba012_desc = NULL
   LET g_stba_m.stba008_desc = NULL
   LET g_stba_m.stba009_desc = NULL
   LET g_stba_m.stba001_desc = NULL   #160604-00009#58 160618 by sakura add
   
   IF r_def_flag = 'Y' THEN   
      EXECUTE astt320_sel_stje INTO l_stje001, l_stje007, l_stje008,       #合約編號,商戶編號,鋪位編號
                                    g_stba_m.stba004, g_stba_m.stba005,    #結算方式,結算類型
                                    g_stba_m.stba011, g_stba_m.stba012,    #幣別,稅別
                                    g_stba_m.stba008, g_stba_m.stba009,    #簽部人員,簽訂部門
                                    g_stba_m.stba001                       #結算中心   #160604-00009#58 160618 by sakura add 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "Select stje_t" 
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE 
         CALL cl_err()      
         
         LET r_success = FALSE
         RETURN r_success,r_def_flag
      END IF
      
      IF NOT cl_null(l_stje001) THEN
         LET l_sql = "SELECT stjoseq ",
                     "  FROM stjo_t ",
                     " WHERE stjoent = ",g_enterprise,
                     "   AND stjo001 = '",l_stje001,"' ",
                     "   AND stjo005 = 'N' ",
                     " ORDER BY stjoseq "
         PREPARE astt320_get_stjo002_pre FROM l_sql
         DECLARE astt320_get_stjo002_cur CURSOR FOR astt320_get_stjo002_pre
         FOREACH astt320_get_stjo002_cur INTO g_stba_m.stba025 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "Select stjo_t" 
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE 
               CALL cl_err() 
               
               LET r_success = FALSE
               RETURN r_success,r_def_flag
            END IF
            
            IF NOT cl_null(g_stba_m.stba025) THEN
               EXIT FOREACH
            END IF
         END FOREACH              
      END IF

      IF cl_null(g_stba_m.stba002) THEN
         LET g_stba_m.stba002 = l_stje007
         LET g_stba_m.stba002_desc = s_desc_get_trading_partner_abbr_desc(g_stba_m.stba002)
         DISPLAY BY NAME g_stba_m.stba002,g_stba_m.stba002_desc
      END IF

      IF cl_null(g_stba_m.stba010) THEN
         LET g_stba_m.stba010 = l_stje001
         DISPLAY BY NAME g_stba_m.stba010
      END IF
      
      #160518-00077#1 160518 by lori mod---(S)
      #stba024->stba013
      IF cl_null(g_stba_m.stba013) THEN
         LET g_stba_m.stba013 = l_stje008
         DISPLAY BY NAME g_stba_m.stba013
         CALL astt320_stba013_ref()
      END IF
      #160518-00077#1 160518 by lori mod---(E)

      LET g_stba_m.stba005_desc = s_desc_get_acc_desc('2060',g_stba_m.stba005)
      LET g_stba_m.stba011_desc = s_desc_get_currency_desc(g_stba_m.stba011)
      LET g_stba_m.stba012_desc = s_desc_get_tax_desc1(g_stba_m.stbasite,g_stba_m.stba012)
      LET g_stba_m.stba008_desc = s_desc_get_person_desc(g_stba_m.stba008)
      LET g_stba_m.stba009_desc = s_desc_get_department_desc(g_stba_m.stba009)
      LET g_stba_m.stba001_desc = s_desc_get_department_desc(g_stba_m.stba001)   #160604-00009#58 160618 by sakura add
      CALL astt320_stba004_ref()                   
      
      DISPLAY BY NAME g_stba_m.stba010, g_stba_m.stba013,   #160518-00077#1 160518 by lori mod stba024->stba013
                      g_stba_m.stba005, g_stba_m.stba004, g_stba_m.stba011, 
                      g_stba_m.stba012, g_stba_m.stba008, g_stba_m.stba009,
                      g_stba_m.stba025,
                      g_stba_m.stba005_desc, g_stba_m.stba004_desc,
                      g_stba_m.stba011_desc, g_stba_m.stba012_desc, 
                      g_stba_m.stba008_desc, g_stba_m.stba009_desc,
                      g_stba_m.stba001_desc, g_stba_m.stba001_desc   #160604-00009#58 160618 by sakura add                                            
   END IF
   
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba010 = g_stba_m.stba010
   LET g_stba_m_o.stba013 = g_stba_m.stba013   #160518-00077#1 160518 by lori mod stba024->stba013
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba011 = g_stba_m.stba011
   LET g_stba_m_o.stba012 = g_stba_m.stba012
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   LET g_stba_m_o.stba025 = g_stba_m.stba025
   LET g_stba_m_o.stba001 = g_stba_m.stba001   #160604-00009#58 160618 by sakura add
   
   
   RETURN r_success,r_def_flag
END FUNCTION

################################################################################
# Descriptions...: 費用編號帶出費用說明、費用總類、費用性質、稅別、價款類別
# Memo...........:
# Usage..........: CALL astt320_stbb001_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140403 By huangrh
# Modify.........: 20150609 by geza
################################################################################
PUBLIC FUNCTION astt320_stbb001_ref()
DEFINE l_ooef019 LIKE ooef_t.ooef019   
DEFINE l_stae010 LIKE stae_t.stae010
   LET g_stbb_d[l_ac].stae003=''
   LET g_stbb_d[l_ac].stae004=''
   LET g_stbb_d[l_ac].stbb004=''
   LET g_stbb_d[l_ac].stbb030=''   #160516-00014#10 160603 by sakura add
#   LET g_stbb_d[l_ac].stbb003=''
#   LET g_stbb_d[l_ac].stbb002=''
   #LET g_stbb_d[l_ac].stbb009=0      #160604-00009#58 160618 by sakura mark
   LET g_stbb_d[l_ac].stbb009= NULL   #160604-00009#58 160618 by sakura add

   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb001_desc = '', g_rtn_fields[1] , ''
   DISPLAY g_stbb_d[l_ac].stbb001_desc TO stbb001_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stbb_d[l_ac].stbb001
   CALL ap_ref_array2(g_ref_fields,"SELECT stae003,stae004,stae006,stae013 FROM stae_t WHERE staeent='"||g_enterprise||"' AND stae001=? ","") RETURNING g_rtn_fields  #160516-00014#10 160603 by sakura add stae013
   LET g_stbb_d[l_ac].stae003 = '', g_rtn_fields[1] , ''
   LET g_stbb_d[l_ac].stae004 = '', g_rtn_fields[2] , ''
   LET g_stbb_d[l_ac].stbb004 = '', g_rtn_fields[3] , ''
   LET g_stbb_d[l_ac].stbb030 = '', g_rtn_fields[4] , ''   #160516-00014#10 160603 by sakura add
#   LET g_stbb_d[l_ac].stbb003 = '', g_rtn_fields[4] , ''
   DISPLAY g_stbb_d[l_ac].stae003 TO stae003
   DISPLAY g_stbb_d[l_ac].stae004 TO stae004
   DISPLAY g_stbb_d[l_ac].stbb004 TO stbb004
   DISPLAY g_stbb_d[l_ac].stbb030 TO stbb030   #160516-00014#10 160603 by sakura add
#  DISPLAY g_stbb_d[l_ac].stbb003 TO stbb003
   # add by geza 20150628 (S)
   #mark by geza 20151215(S)
#   SELECT stae010 INTO l_stae010
#     FROM stae_t
#    WHERE stae001 = g_stbb_d[l_ac].stbb001
#   IF NOT cl_null(l_stae010) THEN
#      LET g_stbb_d[l_ac].stbb003 = l_stae010
#   ELSE
#      LET g_stbb_d[l_ac].stbb003 = g_stba_m.stba012    
#   END IF 
#   SELECT ooef019 INTO l_ooef019
#     FROM ooef_t 
#     WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
   #mark by geza 20151215(E)

   # add by geza 20150628 (E)
   #幣別
   #mark by geza 20150628(S)
#   SELECT pmab033 INTO g_stbb_d[l_ac].stbb002
#     FROM pmab_t
#    WHERE pmabent=g_enterprise
#      AND pmabsite='ALL'
#      AND pmab001=g_stba_m.stba002 
    #mark by geza 20150628(E)
   IF NOT cl_null(g_stbb_d[l_ac].stbb009) THEN
      CALL s_curr_round('',g_stbb_d[l_ac].stbb002,g_stbb_d[l_ac].stbb009,'2') RETURNING g_stbb_d[l_ac].stbb009 
   END IF      
      
      
   #稅別   
#   IF cl_null(g_stbb_d[l_ac].stbb003) THEN   
#      SELECT pmab034 INTO g_stbb_d[l_ac].stbb003
#        FROM pmab_t
#       WHERE pmabent=g_enterprise
#         AND pmabsite='ALL'
#         AND pmab001=g_stba_m.stba002
#   END IF   
   DISPLAY g_stbb_d[l_ac].stbb009 TO stbb009   
#   DISPLAY g_stbb_d[l_ac].stbb002 TO stbb002
#   DISPLAY g_stbb_d[l_ac].stbb003 TO stbb003

    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stbb_d[l_ac].stae003
    CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2058' AND oocql002 =? AND oocql003 ='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stbb_d[l_ac].stae003_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stbb_d[l_ac].stae003_desc
   
#    INITIALIZE g_ref_fields TO NULL
#    LET g_ref_fields[1] = g_stbb_d[l_ac].stbb002
#    CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
#    LET g_stbb_d[l_ac].stbb002_desc = '', g_rtn_fields[1] , ''
#    DISPLAY BY NAME g_stbb_d[l_ac].stbb002_desc

#    INITIALIZE g_ref_fields TO NULL
#    LET g_ref_fields[1] = g_stbb_d[l_ac].stbb003
#    CALL ap_ref_array2(g_ref_fields,"SELECT DISTINCT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
#    LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
#    DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc  
   #帶出納入結算單否，票扣否   #add by geza 20150609(S)
     IF g_stba_m.stba006 = '1' THEN
        SELECT stae011,stae007 INTO g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016
          FROM stae_t
         WHERE staeent = g_enterprise   
           AND stae001 = g_stbb_d[l_ac].stbb001
        
        IF cl_null(g_stbb_d[l_ac].stbb015) THEN
           LET g_stbb_d[l_ac].stbb015 = 'Y' 
        END IF
        IF cl_null(g_stbb_d[l_ac].stbb016) THEN
           LET g_stbb_d[l_ac].stbb016 = 'N' 
        END IF
        DISPLAY g_stbb_d[l_ac].stbb015 TO stbb015   
        DISPLAY g_stbb_d[l_ac].stbb016 TO stbb016
     END IF
     #add by geza 20150609(E)
END FUNCTION

################################################################################
# Descriptions...: 供應商依照合約帶出經營方式、結算類型、結算方式
# Memo...........:
# Usage..........: CALL astt320_stba002_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20140403 By huangrh
# Modify.........:
################################################################################
PUBLIC FUNCTION astt320_stba002_ref()
DEFINE l_count      LIKE type_t.num5
DEFINE l_stan001    LIKE stan_t.stan001
DEFINE  l_ooef019             LIKE ooef_t.ooef019
   LET g_stba_m.stba010=''
   LET g_stba_m.stba003=''
   LET g_stba_m.stba004=''
   LET g_stba_m.stba005=''
   LET g_stba_m.stba001=''
   LET g_stba_m.stba011=''
   LET g_stba_m.stba012=''


   LET l_count=0
   SELECT count(*) INTO l_count
     FROM stan_t
    WHERE stanent=g_enterprise
      AND stan005=g_stba_m.stba002
      AND stanstus='Y'
   #   AND stan017<=g_stba_m.stbadocdt #mark by geza 20150703
   #   AND stan018>g_stba_m.stbadocdt #mark by geza 20150703
      AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
   #若多筆合約，任意取一筆   
   IF NOT cl_null(l_count) AND l_count>1 THEN
#      SELECT MAX(stan001) INTO l_stan001
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today   
#      SELECT stan002,stan010,stan009 INTO g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stan001=l_stan001
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today         
   ELSE   
#      SELECT stan002,stan010,stan009 INTO g_stba_m.stba003,g_stba_m.stba005,g_stba_m.stba004
#        FROM stan_t
#       WHERE stanent=g_enterprise
#         AND stan005=g_stba_m.stba002
#         AND stanstus='Y'
#         AND stan017<=g_today
#         AND stan018>g_today
      SELECT stan001,stan002,stan009,stan010,stan015,stan006,stan007 INTO 
             g_stba_m.stba010,g_stba_m.stba003,g_stba_m.stba004,g_stba_m.stba005,g_stba_m.stba001,g_stba_m.stba011,g_stba_m.stba012  
        FROM stan_t
       WHERE stanent=g_enterprise
         AND stan005=g_stba_m.stba002
         AND stanstus='Y' 
        # AND stan017<=g_stba_m.stbadocdt   #mark by geza 20150703
        # AND stan018>g_stba_m.stbadocdt    #mark by geza 20150703
         AND (stan029 !='5' AND stan029 != '7') #add by geza 20150703
      
      #add by geza 20151201(S)
      #人员带合同的签订人员
      SELECT stan014 INTO g_stba_m.stba008
        FROM stan_t
       WHERE stanent=g_enterprise
         AND stan001=g_stba_m.stba010                
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stba_m.stba008
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET g_stba_m.stba008_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stba_m.stba008_desc  
      
      #部门带合同的部门和名称
      SELECT stan038 INTO g_stba_m.stba009
        FROM stan_t
       WHERE stanent = g_enterprise  
         AND stan001 = g_stba_m.stba010
      SELECT ooefl003 INTO g_stba_m.stba009_desc
        FROM ooefl_t
       WHERE ooeflent=g_enterprise
         AND ooefl001=g_stba_m.stba009
         AND ooefl002=g_dlang             
      #add by geza 20151201(E)               
   END IF
   
#  DISPLAY BY NAME g_stba_m.stba003
#  DISPLAY BY NAME g_stba_m.stba004
#  DISPLAY BY NAME g_stba_m.stba005

   DISPLAY BY NAME g_stba_m.stba010 
   DISPLAY BY NAME g_stba_m.stba003 
   DISPLAY BY NAME g_stba_m.stba004 
   DISPLAY BY NAME g_stba_m.stba005
   DISPLAY BY NAME g_stba_m.stba001
   DISPLAY BY NAME g_stba_m.stba011
   DISPLAY BY NAME g_stba_m.stba012
   DISPLAY BY NAME g_stba_m.stba008       #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba008_desc  #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba009       #add by geza 20151201
   DISPLAY BY NAME g_stba_m.stba009_desc  #add by geza 20151201
   
#  INITIALIZE g_ref_fields TO NULL
#  LET g_ref_fields[1] = g_stba_m.stba002
#  CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
#  LET g_stba_m.stba002_desc = '', g_rtn_fields[1] , ''
#  DISPLAY BY NAME g_stba_m.stba002_desc  
#            
#  INITIALIZE g_ref_fields TO NULL
#  LET g_ref_fields[1] = g_stba_m.stba005
#  CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
#  LET g_stba_m.stba005_desc = '', g_rtn_fields[1] , ''
#  DISPLAY BY NAME g_stba_m.stba005_desc
#
#  INITIALIZE g_ref_fields TO NULL
#  LET g_ref_fields[1] = g_stba_m.stba004
#  CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
#  LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
#  DISPLAY BY NAME g_stba_m.stba004_desc      
#  
   #160511-00034#1 1560510 by lori mark---(S)
   #INITIALIZE g_ref_fields TO NULL
   #LET g_ref_fields[1] = g_stba_m.stba004
   #CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   #LET g_stba_m.stba004_desc = '', g_rtn_fields[1] , ''
   #DISPLAY BY NAME g_stba_m.stba004_desc    
   #160511-00034#1 1560510 by lori mark---(E)
   
   CALL astt320_stba004_ref()   #160511-00034#1 1560510 by lori add
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba005
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba005_desc


   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stba_m.stba011
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba011_desc
   
    SELECT ooef019 INTO l_ooef019
     FROM ooef_t 
     WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit  
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooef019
   LET g_ref_fields[2] = g_stba_m.stba012
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stba_m.stba012_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stba_m.stba012_desc

END FUNCTION

################################################################################
# Descriptions...: 单身税别取值
# Memo...........:
# Usage..........: CALL astt320_stbb003_init()
#                  RETURNING 回传参数
# Date & Author..: 20150914 By geza
# Modify.........: 2016/06/09 By Lori     
################################################################################
PRIVATE FUNCTION astt320_stbb003_init()
DEFINE l_ooef019 LIKE ooef_t.ooef019 
DEFINE  l_cnt                 LIKE type_t.num10
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t 
     WHERE ooefent = g_enterprise  AND ooef001 = g_stba_m_t.stbaunit 
     
   #票扣否=Y，税带合同里面的，票扣否=N，税带费用编号asti203里面的
   IF g_stbb_d[l_ac].stbb016 = 'Y' THEN
      #160608-00001#1 160609 by lori add---(S)
      IF g_type = '4' THEN 
         SELECT stje038 INTO g_stbb_d[l_ac].stbb003
           FROM stje_t
          WHERE stjeent = g_enterprise
            AND stje001 = g_stba_m.stba010      
      ELSE
      #160608-00001#1 160609 by lori add---(E)   
         SELECT stan007 INTO g_stbb_d[l_ac].stbb003
           FROM stan_t
          WHERE stanent = g_enterprise
            AND stan001 = g_stba_m.stba010
      END IF    #160608-00001#1 160609 by lori add
      
   ELSE
      SELECT stae010 INTO g_stbb_d[l_ac].stbb003
        FROM stae_t
       WHERE staeent = g_enterprise
         AND stae001 = g_stbb_d[l_ac].stbb001
   END IF

   #add by geza 20160615 #160604-00009#43(S)
   #费用编号存在于合同定义账期，非票扣的时候（从asti203中）改抓 定义账期的税别,其他的抓合同的税
   #租赁
   IF g_type = '4' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stji_t
       WHERE stji001 = g_stba_m.stba010
         AND stjient = g_enterprise
         AND stji002 = g_stbb_d[l_ac].stbb001 
##     mark  by zn 20160712      
#         IF g_stbb_d[l_ac].stbb016 = 'N' AND l_cnt > 0 THEN
#            SELECT stji010 INTO g_stbb_d[l_ac].stbb003 #定义账期的税别  
#              FROM stji_t
#             WHERE stji001 = g_stba_m.stba010
#               AND stjient = g_enterprise
#               AND stji002 = g_stbb_d[l_ac].stbb001                    
#         ELSE
#            LET g_stbb_d[l_ac].stbb003 = g_stba_m.stba012          #给合同对应的税
#         END IF
      IF  l_cnt > 0 THEN
         SELECT stji010,stji007,stji008
         INTO g_stbb_d[l_ac].stbb003,g_stbb_d[l_ac].stbb015,g_stbb_d[l_ac].stbb016
           FROM stji_t
          WHERE stji001 = g_stba_m.stba010
            AND stjient = g_enterprise
            AND stji002 = g_stbb_d[l_ac].stbb001                    
      END IF
   END IF   
   #add by geza 20160615 #160604-00009#43(E)

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooef019
   LET g_ref_fields[2] = g_stbb_d[l_ac].stbb003
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stbb_d[l_ac].stbb003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stbb_d[l_ac].stbb003_desc  
   
END FUNCTION

################################################################################
# Descriptions...: 單身欄位隱藏
# Memo...........:
# Usage..........: CALL astt320_set_visible_b()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/14 By Lori   #160510-00010#5 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_set_visible_b()
   IF g_type <> '4' OR g_stba_m.stba003 <> '5' THEN
      CALL cl_set_comp_visible("stbb030,stbb031,stbb031_desc",FALSE)
   END IF    
END FUNCTION

################################################################################
# Descriptions...: 單身欄位取消隱藏
# Memo...........:
# Usage..........: CALL astt320_set_no_visible_b()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/14 By Lori   #160510-00010#5 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_set_no_visible_b()
   CALL cl_set_comp_visible("stbb030,stbb031,stbb031_desc",TRUE)
END FUNCTION

################################################################################
# Descriptions...: 單身欄位必填
# Memo...........:
# Usage..........: CALL astt320_set_require_b()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/14 By Lori   #160510-00010#5 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_set_require_b()
   IF g_stbb_d[l_ac].stbb030 <> '1' THEN
      CALL cl_set_comp_required("stbb031",TRUE)
   END IF  
END FUNCTION

################################################################################
# Descriptions...: 單身欄位非必填
# Memo...........:
# Usage..........: CALL astt320_set_no_require_b()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/05/14 By Lori   #160510-00010#5 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_set_no_require_b()
   CALL cl_set_comp_required("stbb031",FALSE) 
END FUNCTION

################################################################################
# Descriptions...: 單身費用金額加總 顯示到單頭費用總額
# Memo...........:
# Usage..........: CALL astt320_stbb009_sum()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/06/18 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_stbb009_sum()
    SELECT SUM(stbb009) INTO g_stba_m.l_amount1
      FROM stba_t,stbb_t
     WHERE stbaent = stbbent
       AND stbadocno = stbbdocno
       AND stbaent = g_enterprise
       AND stbadocno = g_stba_m.stbadocno
    DISPLAY BY NAME g_stba_m.l_amount1
END FUNCTION

################################################################################
# Descriptions...: 取得租賃合約資訊
# Memo...........:
# Usage..........: CALL astt320_get_stje001()
# Return code....: 無
# Date & Author..: 2016/06/24 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_get_stje001()
DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_sql          STRING
   
   
   LET l_sql = "SELECT stje007,stje008,stje031,stje032, ",   #合約編號,商戶編號,鋪位編號,結算方式,結算類型
               "       stje036,stje038,stje017,stje018, ",           #幣別,稅別,簽部人員,簽訂部門
               "       stje030",                                     #結算中心   #160604-00009#58 160618 by sakura add 
               "  FROM stje_t ",
               " WHERE stjeent = ",g_enterprise,
               " AND stjestus = 'Y' " ,                      #add by geza 20160719 #160604-00009#153  
               " AND stje001 = '",g_stba_m.stba010,"' "

  
   PREPARE astt320_sel_stje1 FROM l_sql

        
   EXECUTE astt320_sel_stje1 INTO g_stba_m.stba002,g_stba_m.stba013,       #合約編號,商戶編號,鋪位編號
                                  g_stba_m.stba004, g_stba_m.stba005,    #結算方式,結算類型
                                  g_stba_m.stba011, g_stba_m.stba012,    #幣別,稅別
                                  g_stba_m.stba008, g_stba_m.stba009,    #簽部人員,簽訂部門
                                  g_stba_m.stba001                       #結算中心   #160604-00009#58 160618 by sakura add 
      
   LET l_sql = "SELECT MIN(stjoseq) ",
               "  FROM stjo_t ",
               " WHERE stjoent = ",g_enterprise,
               "   AND stjo001 = '",g_stba_m.stba010,"' ",
               "   AND stjo005 = 'N' "
   PREPARE astt320_get_stjo002_pre1 FROM l_sql
   EXECUTE astt320_get_stjo002_pre1 INTO g_stba_m.stba025 
             

   LET g_stba_m.stba002_desc = s_desc_get_trading_partner_abbr_desc(g_stba_m.stba002)
   DISPLAY BY NAME g_stba_m.stba002,g_stba_m.stba002_desc
   
   DISPLAY BY NAME g_stba_m.stba013
   CALL astt320_stba013_ref()
    
   LET g_stba_m.stba005_desc = s_desc_get_acc_desc('2060',g_stba_m.stba005)
   LET g_stba_m.stba011_desc = s_desc_get_currency_desc(g_stba_m.stba011)
   LET g_stba_m.stba012_desc = s_desc_get_tax_desc1(g_stba_m.stbasite,g_stba_m.stba012)
   LET g_stba_m.stba008_desc = s_desc_get_person_desc(g_stba_m.stba008)
   LET g_stba_m.stba009_desc = s_desc_get_department_desc(g_stba_m.stba009)
   LET g_stba_m.stba001_desc = s_desc_get_department_desc(g_stba_m.stba001)   #160604-00009#58 160618 by sakura add
   CALL astt320_stba004_ref()                   
   
   DISPLAY BY NAME g_stba_m.stba010, g_stba_m.stba013,   #160518-00077#1 160518 by lori mod stba024->stba013
                   g_stba_m.stba005, g_stba_m.stba004, g_stba_m.stba011, 
                   g_stba_m.stba012, g_stba_m.stba008, g_stba_m.stba009,
                   g_stba_m.stba025,
                   g_stba_m.stba005_desc, g_stba_m.stba004_desc,
                   g_stba_m.stba011_desc, g_stba_m.stba012_desc, 
                   g_stba_m.stba008_desc, g_stba_m.stba009_desc,
                   g_stba_m.stba001_desc, g_stba_m.stba001_desc   #160604-00009#58 160618 by sakura add                                            
   
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba010 = g_stba_m.stba010
   LET g_stba_m_o.stba013 = g_stba_m.stba013   #160518-00077#1 160518 by lori mod stba024->stba013
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba011 = g_stba_m.stba011
   LET g_stba_m_o.stba012 = g_stba_m.stba012
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   LET g_stba_m_o.stba025 = g_stba_m.stba025
   LET g_stba_m_o.stba001 = g_stba_m.stba001   #160604-00009#58 160618 by sakura add
   
   
END FUNCTION

################################################################################
# Descriptions...: 根据供应商取得租賃合約資訊
# Memo...........:
# Usage..........: CALL astt320_get_stje007()
# Return code....: 無
# Date & Author..: 2016/06/24 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_get_stje007()
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_sql          STRING
   
   
   LET l_sql = "SELECT stje001,stje007,stje008,stje031,stje032, ",   #合約編號,商戶編號,鋪位編號,結算方式,結算類型
               "       stje036,stje038,stje017,stje018, ",           #幣別,稅別,簽部人員,簽訂部門
               "       stje030",                                     #結算中心   #160604-00009#58 160618 by sakura add 
               "  FROM stje_t ",
               " WHERE stjeent = ",g_enterprise,
               " AND stjestus = 'Y' " ,                      #add by geza 20160719 #160604-00009#153 
               " AND stje007 = '",g_stba_m.stba002,"' "
   
   
   PREPARE astt320_sel_stje007 FROM l_sql
   DISPLAY "SOUR SQL: ",l_sql
   
   LET l_sql = "SELECT COUNT(*) FROM (",l_sql,") "
   PREPARE astt320_cnt_stje007 FROM l_sql
         
   LET l_cnt = 0
   EXECUTE astt320_cnt_stje007 INTO l_cnt

   
   IF l_cnt = 1 THEN
      EXECUTE astt320_sel_stje007 INTO g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba013,       #合約編號,商戶編號,鋪位編號
                                       g_stba_m.stba004, g_stba_m.stba005,    #結算方式,結算類型
                                       g_stba_m.stba011, g_stba_m.stba012,    #幣別,稅別
                                       g_stba_m.stba008, g_stba_m.stba009,    #簽部人員,簽訂部門
                                       g_stba_m.stba001                       #結算中心   #160604-00009#58 160618 by sakura add 
      
      LET l_sql = "SELECT MIN(stjoseq) ",
                  "  FROM stjo_t ",
                  " WHERE stjoent = ",g_enterprise,
                  "   AND stjo001 = '",g_stba_m.stba010,"' ",
                  "   AND stjo005 = 'N' "
      PREPARE astt320_get_stjo002_pre2 FROM l_sql
      EXECUTE astt320_get_stjo002_pre2 INTO g_stba_m.stba025             


      LET g_stba_m.stba002_desc = s_desc_get_trading_partner_abbr_desc(g_stba_m.stba002)
      DISPLAY BY NAME g_stba_m.stba002,g_stba_m.stba002_desc
 
      DISPLAY BY NAME g_stba_m.stba010

      DISPLAY BY NAME g_stba_m.stba013
      CALL astt320_stba013_ref()


      LET g_stba_m.stba005_desc = s_desc_get_acc_desc('2060',g_stba_m.stba005)
      LET g_stba_m.stba011_desc = s_desc_get_currency_desc(g_stba_m.stba011)
      LET g_stba_m.stba012_desc = s_desc_get_tax_desc1(g_stba_m.stbasite,g_stba_m.stba012)
      LET g_stba_m.stba008_desc = s_desc_get_person_desc(g_stba_m.stba008)
      LET g_stba_m.stba009_desc = s_desc_get_department_desc(g_stba_m.stba009)
      LET g_stba_m.stba001_desc = s_desc_get_department_desc(g_stba_m.stba001)   #160604-00009#58 160618 by sakura add
      CALL astt320_stba004_ref()                   
      
      DISPLAY BY NAME g_stba_m.stba010, g_stba_m.stba013,   #160518-00077#1 160518 by lori mod stba024->stba013
                      g_stba_m.stba005, g_stba_m.stba004, g_stba_m.stba011, 
                      g_stba_m.stba012, g_stba_m.stba008, g_stba_m.stba009,
                      g_stba_m.stba025,
                      g_stba_m.stba005_desc, g_stba_m.stba004_desc,
                      g_stba_m.stba011_desc, g_stba_m.stba012_desc, 
                      g_stba_m.stba008_desc, g_stba_m.stba009_desc,
                      g_stba_m.stba001_desc, g_stba_m.stba001_desc   #160604-00009#58 160618 by sakura add   
   END IF   
    
   
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba010 = g_stba_m.stba010
   LET g_stba_m_o.stba013 = g_stba_m.stba013   #160518-00077#1 160518 by lori mod stba024->stba013
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba011 = g_stba_m.stba011
   LET g_stba_m_o.stba012 = g_stba_m.stba012
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   LET g_stba_m_o.stba025 = g_stba_m.stba025
   LET g_stba_m_o.stba001 = g_stba_m.stba001   #160604-00009#58 160618 by sakura add
   
END FUNCTION

################################################################################
# Descriptions...: 根据铺位取得租賃合約資訊
# Memo...........:
# Usage..........: CALL astt320_get_stje008()
# Return code....: 無
# Date & Author..: 2016/06/24 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astt320_get_stje008()
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_sql          STRING
   
   
   LET l_sql = "SELECT stje001,stje007,stje008,stje031,stje032, ",   #合約編號,商戶編號,鋪位編號,結算方式,結算類型
               "       stje036,stje038,stje017,stje018, ",           #幣別,稅別,簽部人員,簽訂部門
               "       stje030",                                     #結算中心   #160604-00009#58 160618 by sakura add 
               "  FROM stje_t ",
               " WHERE stjeent = ",g_enterprise,
               " AND stjestus = 'Y' " ,                      #add by geza 20160719 #160604-00009#153 
               " AND stje008 = '",g_stba_m.stba013,"' "
   
   
   PREPARE astt320_sel_stje008 FROM l_sql
   DISPLAY "SOUR SQL: ",l_sql
   
   LET l_sql = "SELECT COUNT(*) FROM (",l_sql,") "
   PREPARE astt320_cnt_stje008 FROM l_sql
         
   LET l_cnt = 0
   EXECUTE astt320_cnt_stje008 INTO l_cnt

   
   IF l_cnt = 1 THEN
      EXECUTE astt320_sel_stje008 INTO g_stba_m.stba010,g_stba_m.stba002,g_stba_m.stba013,       #合約編號,商戶編號,鋪位編號
                                       g_stba_m.stba004, g_stba_m.stba005,    #結算方式,結算類型
                                       g_stba_m.stba011, g_stba_m.stba012,    #幣別,稅別
                                       g_stba_m.stba008, g_stba_m.stba009,    #簽部人員,簽訂部門
                                       g_stba_m.stba001                       #結算中心   #160604-00009#58 160618 by sakura add 
      
      LET l_sql = "SELECT MIN(stjoseq) ",
                  "  FROM stjo_t ",
                  " WHERE stjoent = ",g_enterprise,
                  "   AND stjo001 = '",g_stba_m.stba010,"' ",
                  "   AND stjo005 = 'N' "
      PREPARE astt320_get_stjo002_pre3 FROM l_sql
      EXECUTE astt320_get_stjo002_pre3 INTO g_stba_m.stba025             


      LET g_stba_m.stba002_desc = s_desc_get_trading_partner_abbr_desc(g_stba_m.stba002)
      DISPLAY BY NAME g_stba_m.stba002,g_stba_m.stba002_desc
 
      DISPLAY BY NAME g_stba_m.stba010

      DISPLAY BY NAME g_stba_m.stba013
      CALL astt320_stba013_ref()


      LET g_stba_m.stba005_desc = s_desc_get_acc_desc('2060',g_stba_m.stba005)
      LET g_stba_m.stba011_desc = s_desc_get_currency_desc(g_stba_m.stba011)
      LET g_stba_m.stba012_desc = s_desc_get_tax_desc1(g_stba_m.stbasite,g_stba_m.stba012)
      LET g_stba_m.stba008_desc = s_desc_get_person_desc(g_stba_m.stba008)
      LET g_stba_m.stba009_desc = s_desc_get_department_desc(g_stba_m.stba009)
      LET g_stba_m.stba001_desc = s_desc_get_department_desc(g_stba_m.stba001)   #160604-00009#58 160618 by sakura add
      CALL astt320_stba004_ref()                   
      
      DISPLAY BY NAME g_stba_m.stba010, g_stba_m.stba013,   #160518-00077#1 160518 by lori mod stba024->stba013
                      g_stba_m.stba005, g_stba_m.stba004, g_stba_m.stba011, 
                      g_stba_m.stba012, g_stba_m.stba008, g_stba_m.stba009,
                      g_stba_m.stba025,
                      g_stba_m.stba005_desc, g_stba_m.stba004_desc,
                      g_stba_m.stba011_desc, g_stba_m.stba012_desc, 
                      g_stba_m.stba008_desc, g_stba_m.stba009_desc,
                      g_stba_m.stba001_desc, g_stba_m.stba001_desc   #160604-00009#58 160618 by sakura add   
   END IF   
    
   
   LET g_stba_m_o.stba002 = g_stba_m.stba002
   LET g_stba_m_o.stba010 = g_stba_m.stba010
   LET g_stba_m_o.stba013 = g_stba_m.stba013   #160518-00077#1 160518 by lori mod stba024->stba013
   LET g_stba_m_o.stba005 = g_stba_m.stba005
   LET g_stba_m_o.stba004 = g_stba_m.stba004
   LET g_stba_m_o.stba011 = g_stba_m.stba011
   LET g_stba_m_o.stba012 = g_stba_m.stba012
   LET g_stba_m_o.stba008 = g_stba_m.stba008
   LET g_stba_m_o.stba009 = g_stba_m.stba009
   LET g_stba_m_o.stba025 = g_stba_m.stba025
   LET g_stba_m_o.stba001 = g_stba_m.stba001   #160604-00009#58 160618 by sakura add
END FUNCTION

 
{</section>}
 
