#該程式未解開Section, 採用最新樣板產出!
{<section id="astm403.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2015-12-29 10:40:08), PR版次:0006(2017-02-03 13:34:19)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000036
#+ Filename...: astm403
#+ Description: 百貨合約模板維護作業
#+ Creator....: 06254(2015-12-23 09:28:52)
#+ Modifier...: 06254 -SD/PR- 06189
 
{</section>}
 
{<section id="astm403.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#Memos
#160818-00017#38 2016/08/23  By 08734  删除修改未重新判断状态码
#161024-00025#12 2016/10/26  By 02481  组织开窗aooi500规范调整
#170202-00003#1  2017/02/02  By 02749  調整舊值備份變數
#170202-00016#1  新增的时候多语言栏位开窗
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
PRIVATE type type_g_stfn_m        RECORD
       stfnsite LIKE stfn_t.stfnsite, 
   stfnsite_desc LIKE type_t.chr80, 
   stfnunit LIKE stfn_t.stfnunit, 
   stfnunit_desc LIKE type_t.chr80, 
   stfn001 LIKE stfn_t.stfn001, 
   stfnl003 LIKE stfnl_t.stfnl003, 
   stfn004 LIKE stfn_t.stfn004, 
   stfn004_desc LIKE type_t.chr80, 
   stfn005 LIKE stfn_t.stfn005, 
   stfn005_desc LIKE type_t.chr80, 
   stfn006 LIKE stfn_t.stfn006, 
   stfn006_desc LIKE type_t.chr80, 
   stfn007 LIKE stfn_t.stfn007, 
   stfn007_desc LIKE type_t.chr80, 
   stfn003 LIKE stfn_t.stfn003, 
   stfn003_desc LIKE type_t.chr80, 
   stfn002 LIKE stfn_t.stfn002, 
   stfn008 LIKE stfn_t.stfn008, 
   stfn009 LIKE stfn_t.stfn009, 
   stfnstus LIKE stfn_t.stfnstus, 
   stfnownid LIKE stfn_t.stfnownid, 
   stfnownid_desc LIKE type_t.chr80, 
   stfnowndp LIKE stfn_t.stfnowndp, 
   stfnowndp_desc LIKE type_t.chr80, 
   stfncrtid LIKE stfn_t.stfncrtid, 
   stfncrtid_desc LIKE type_t.chr80, 
   stfncrtdp LIKE stfn_t.stfncrtdp, 
   stfncrtdp_desc LIKE type_t.chr80, 
   stfncrtdt LIKE stfn_t.stfncrtdt, 
   stfnmodid LIKE stfn_t.stfnmodid, 
   stfnmodid_desc LIKE type_t.chr80, 
   stfnmoddt LIKE stfn_t.stfnmoddt, 
   stfncnfid LIKE stfn_t.stfncnfid, 
   stfncnfid_desc LIKE type_t.chr80, 
   stfncnfdt LIKE stfn_t.stfncnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stfo_d        RECORD
       stfoseq LIKE stfo_t.stfoseq, 
   stfo002 LIKE stfo_t.stfo002, 
   stfo002_desc LIKE type_t.chr500, 
   stfo018 LIKE stfo_t.stfo018, 
   stfo019 LIKE stfo_t.stfo019, 
   stfo003 LIKE stfo_t.stfo003, 
   stfo004 LIKE stfo_t.stfo004, 
   stfo005 LIKE stfo_t.stfo005, 
   stfo006 LIKE stfo_t.stfo006, 
   stfo007 LIKE stfo_t.stfo007, 
   stfo020 LIKE stfo_t.stfo020, 
   stfo008 LIKE stfo_t.stfo008, 
   stfo008_desc LIKE type_t.chr500, 
   stfo009 LIKE stfo_t.stfo009, 
   stfo009_desc LIKE type_t.chr500, 
   stfo010 LIKE stfo_t.stfo010, 
   stfo011 LIKE stfo_t.stfo011, 
   stfo012 LIKE stfo_t.stfo012, 
   stfo013 LIKE stfo_t.stfo013, 
   stfo014 LIKE stfo_t.stfo014, 
   stfo026 LIKE stfo_t.stfo026, 
   stfo015 LIKE stfo_t.stfo015, 
   stfo016 LIKE stfo_t.stfo016, 
   stfo017 LIKE stfo_t.stfo017, 
   stfo021 LIKE stfo_t.stfo021, 
   stfo022 LIKE stfo_t.stfo022, 
   stfo023 LIKE stfo_t.stfo023, 
   stfo024 LIKE stfo_t.stfo024, 
   stfo025 LIKE stfo_t.stfo025, 
   stfosite LIKE stfo_t.stfosite, 
   stfounit LIKE stfo_t.stfounit
       END RECORD
PRIVATE TYPE type_g_stfo2_d RECORD
       stfpsite LIKE stfp_t.stfpsite, 
   stfpunit LIKE stfp_t.stfpunit, 
   stfpseq LIKE stfp_t.stfpseq, 
   stfp002 LIKE stfp_t.stfp002, 
   stfp002_desc LIKE type_t.chr500, 
   stfp021 LIKE stfp_t.stfp021, 
   stfp020 LIKE stfp_t.stfp020, 
   stfp003 LIKE stfp_t.stfp003, 
   stfp004 LIKE stfp_t.stfp004, 
   stfp018 LIKE stfp_t.stfp018, 
   stfp019 LIKE stfp_t.stfp019, 
   stfp019_desc LIKE type_t.chr500, 
   stfp005 LIKE stfp_t.stfp005, 
   stfp006 LIKE stfp_t.stfp006, 
   stfp007 LIKE stfp_t.stfp007, 
   stfp008 LIKE stfp_t.stfp008, 
   stfp008_desc LIKE type_t.chr500, 
   stfp009 LIKE stfp_t.stfp009, 
   stfp009_desc LIKE type_t.chr500, 
   stfp010 LIKE stfp_t.stfp010, 
   stfp011 LIKE stfp_t.stfp011, 
   stfp012 LIKE stfp_t.stfp012, 
   stfp013 LIKE stfp_t.stfp013, 
   stfp014 LIKE stfp_t.stfp014, 
   stfpacti LIKE stfp_t.stfpacti, 
   stfp015 LIKE stfp_t.stfp015, 
   stfp016 LIKE stfp_t.stfp016, 
   stfp017 LIKE stfp_t.stfp017, 
   stfp022 LIKE stfp_t.stfp022, 
   stfp023 LIKE stfp_t.stfp023, 
   stfp024 LIKE stfp_t.stfp024, 
   stfp025 LIKE stfp_t.stfp025, 
   stfp026 LIKE stfp_t.stfp026
       END RECORD
PRIVATE TYPE type_g_stfo3_d RECORD
       stfrsite LIKE stfr_t.stfrsite, 
   stfrunit LIKE stfr_t.stfrunit, 
   stfracti LIKE stfr_t.stfracti, 
   stfrseq LIKE stfr_t.stfrseq, 
   stfr003 LIKE stfr_t.stfr003, 
   stfr002 LIKE stfr_t.stfr002, 
   stfr002_desc LIKE type_t.chr500, 
   stfr004 LIKE stfr_t.stfr004, 
   stfr005 LIKE stfr_t.stfr005, 
   stfr006 LIKE stfr_t.stfr006, 
   stfr007 LIKE stfr_t.stfr007, 
   stfr008 LIKE stfr_t.stfr008, 
   stfr009 LIKE stfr_t.stfr009
       END RECORD
PRIVATE TYPE type_g_stfo4_d RECORD
       stfssite LIKE stfs_t.stfssite, 
   stfsunit LIKE stfs_t.stfsunit, 
   stfs002 LIKE stfs_t.stfs002, 
   stfs002_desc LIKE type_t.chr500, 
   stfsstus LIKE stfs_t.stfsstus
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stfn001 LIKE stfn_t.stfn001,
      b_stfn002 LIKE stfn_t.stfn002,
      b_stfn003 LIKE stfn_t.stfn003,
   b_stfn003_desc LIKE type_t.chr80,
      b_stfn004 LIKE stfn_t.stfn004,
      b_stfn005 LIKE stfn_t.stfn005,
      b_stfn006 LIKE stfn_t.stfn006,
   b_stfn006_desc LIKE type_t.chr80,
      b_stfn007 LIKE stfn_t.stfn007,
   b_stfn007_desc LIKE type_t.chr80,
      b_stfn008 LIKE stfn_t.stfn008,
      b_stfnsite LIKE stfn_t.stfnsite,
      b_stfnunit LIKE stfn_t.stfnunit
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_field        LIKE type_t.chr10
DEFINE g_sys_0060     LIKE type_t.chr1
DEFINE g_ins_site_flag       LIKE type_t.chr1       #紀錄新增單據cracunit是否已輸入  #161024-00025#12--add
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stfn_m          type_g_stfn_m
DEFINE g_stfn_m_t        type_g_stfn_m
DEFINE g_stfn_m_o        type_g_stfn_m
DEFINE g_stfn_m_mask_o   type_g_stfn_m #轉換遮罩前資料
DEFINE g_stfn_m_mask_n   type_g_stfn_m #轉換遮罩後資料
 
   DEFINE g_stfn001_t LIKE stfn_t.stfn001
 
 
DEFINE g_stfo_d          DYNAMIC ARRAY OF type_g_stfo_d
DEFINE g_stfo_d_t        type_g_stfo_d
DEFINE g_stfo_d_o        type_g_stfo_d
DEFINE g_stfo_d_mask_o   DYNAMIC ARRAY OF type_g_stfo_d #轉換遮罩前資料
DEFINE g_stfo_d_mask_n   DYNAMIC ARRAY OF type_g_stfo_d #轉換遮罩後資料
DEFINE g_stfo2_d          DYNAMIC ARRAY OF type_g_stfo2_d
DEFINE g_stfo2_d_t        type_g_stfo2_d
DEFINE g_stfo2_d_o        type_g_stfo2_d
DEFINE g_stfo2_d_mask_o   DYNAMIC ARRAY OF type_g_stfo2_d #轉換遮罩前資料
DEFINE g_stfo2_d_mask_n   DYNAMIC ARRAY OF type_g_stfo2_d #轉換遮罩後資料
DEFINE g_stfo3_d          DYNAMIC ARRAY OF type_g_stfo3_d
DEFINE g_stfo3_d_t        type_g_stfo3_d
DEFINE g_stfo3_d_o        type_g_stfo3_d
DEFINE g_stfo3_d_mask_o   DYNAMIC ARRAY OF type_g_stfo3_d #轉換遮罩前資料
DEFINE g_stfo3_d_mask_n   DYNAMIC ARRAY OF type_g_stfo3_d #轉換遮罩後資料
DEFINE g_stfo4_d          DYNAMIC ARRAY OF type_g_stfo4_d
DEFINE g_stfo4_d_t        type_g_stfo4_d
DEFINE g_stfo4_d_o        type_g_stfo4_d
DEFINE g_stfo4_d_mask_o   DYNAMIC ARRAY OF type_g_stfo4_d #轉換遮罩前資料
DEFINE g_stfo4_d_mask_n   DYNAMIC ARRAY OF type_g_stfo4_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
DEFINE g_master_multi_table_t    RECORD
      stfnl001 LIKE stfnl_t.stfnl001,
      stfnl003 LIKE stfnl_t.stfnl003
      END RECORD
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
DEFINE g_wc2_table3   STRING
 
DEFINE g_wc2_table4   STRING
 
 
 
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
 
{<section id="astm403.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5  #161024-00025#12--add
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
   LET g_forupd_sql = " SELECT stfnsite,'',stfnunit,'',stfn001,'',stfn004,'',stfn005,'',stfn006,'',stfn007, 
       '',stfn003,'',stfn002,stfn008,stfn009,stfnstus,stfnownid,'',stfnowndp,'',stfncrtid,'',stfncrtdp, 
       '',stfncrtdt,stfnmodid,'',stfnmoddt,stfncnfid,'',stfncnfdt", 
                      " FROM stfn_t",
                      " WHERE stfnent= ? AND stfn001=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm403_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stfnsite,t0.stfnunit,t0.stfn001,t0.stfn004,t0.stfn005,t0.stfn006, 
       t0.stfn007,t0.stfn003,t0.stfn002,t0.stfn008,t0.stfn009,t0.stfnstus,t0.stfnownid,t0.stfnowndp, 
       t0.stfncrtid,t0.stfncrtdp,t0.stfncrtdt,t0.stfnmodid,t0.stfnmoddt,t0.stfncnfid,t0.stfncnfdt,t1.ooefl003 , 
       t2.ooefl003 ,t3.staal003 ,t4.oocql004 ,t5.ooail003 ,t6.oocql004 ,t7.ooibl004 ,t8.ooag011 ,t9.ooefl003 , 
       t10.ooag011 ,t11.ooefl003 ,t12.ooag011 ,t13.ooag011",
               " FROM stfn_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stfnsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stfnunit AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t3 ON t3.staalent="||g_enterprise||" AND t3.staal001=t0.stfn004 AND t3.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='2060' AND t4.oocql002=t0.stfn005 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t5 ON t5.ooailent="||g_enterprise||" AND t5.ooail001=t0.stfn006 AND t5.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t6 ON t6.oocqlent="||g_enterprise||" AND t6.oocql001='2127' AND t6.oocql002=t0.stfn007 AND t6.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooibl_t t7 ON t7.ooiblent="||g_enterprise||" AND t7.ooibl002=t0.stfn003 AND t7.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stfnownid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stfnowndp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stfncrtid  ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.stfncrtdp AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.stfnmodid  ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stfncnfid  ",
 
               " WHERE t0.stfnent = " ||g_enterprise|| " AND t0.stfn001 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astm403_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astm403 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astm403_init()   
 
      #進入選單 Menu (="N")
      CALL astm403_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astm403
      
   END IF 
   
   CLOSE astm403_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   LET l_success = ''                              #161024-00025#12--add
   CALL s_aooi500_drop_temp() RETURNING l_success  #161024-00025#12--add
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astm403.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astm403_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   DEFINE l_success LIKE type_t.num5  #161024-00025#12--add
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
   LET g_detail_idx_list[4] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stfnstus','50','N,Y,X')
 
      CALL cl_set_combo_scc('stfn002','6013') 
   CALL cl_set_combo_scc('stfo004','6006') 
   CALL cl_set_combo_scc('stfo005','6007') 
   CALL cl_set_combo_scc('stfo006','6008') 
   CALL cl_set_combo_scc('stfo007','6009') 
   CALL cl_set_combo_scc('stfp018','8310') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
   CALL g_idx_group.addAttribute("'3',","1")
   CALL g_idx_group.addAttribute("'4',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   LET l_success = ''                               #161024-00025#12--add 
   CALL s_aooi500_create_temp() RETURNING l_success #161024-00025#12--add
   CALL cl_set_combo_scc('stfp004','6006')
   CALL cl_set_combo_scc('stfp005','6007')
   CALL cl_set_combo_scc('stfp006','6008')
   CALL cl_set_combo_scc('stfp007','6009')
   CALL cl_set_combo_scc('stfr003','6848')
   CALL cl_set_combo_scc('stfr004','6006')
   CALL cl_set_combo_scc('stfn008','6201')
   #CALL cl_set_combo_scc_part('stfn002','6013','4,5') #mark by dengdd 160328
   
   #add by dengdd 
   #联营合同是否呈现租赁合同
   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0060') RETURNING g_sys_0060
   IF g_sys_0060 = 'Y' THEN 
      CALL cl_set_combo_scc_part('stfn002','6013','4,5')
      CALL cl_set_combo_scc_part('b_stfn002','6013','4,5')
   ELSE
      CALL cl_set_combo_scc_part('stfn002','6013','4')
      CALL cl_set_combo_scc_part('b_stfn002','6013','4')
   END IF 
   #add by dengdd 
   #end add-point
   
   #初始化搜尋條件
   CALL astm403_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astm403.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astm403_ui_dialog()
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
            CALL astm403_insert()
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
         INITIALIZE g_stfn_m.* TO NULL
         CALL g_stfo_d.clear()
         CALL g_stfo2_d.clear()
         CALL g_stfo3_d.clear()
         CALL g_stfo4_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astm403_init()
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
               
               CALL astm403_fetch('') # reload data
               LET l_ac = 1
               CALL astm403_ui_detailshow() #Setting the current row 
         
               CALL astm403_idx_chk()
               #NEXT FIELD stfoseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stfo_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm403_idx_chk()
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
               CALL astm403_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stfo2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm403_idx_chk()
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
               CALL astm403_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_stfo3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm403_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("'3',",l_ac)
               
               #add-point:page3, before row動作 name="ui_dialog.body3.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 3
               #顯示單身筆數
               CALL astm403_idx_chk()
               #add-point:page3自定義行為 name="ui_dialog.body3.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_3)
            
         
            #add-point:page3自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_stfo4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astm403_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[4] = l_ac
               CALL g_idx_group.addAttribute("'4',",l_ac)
               
               #add-point:page4, before row動作 name="ui_dialog.body4.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'4',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 4
               #顯示單身筆數
               CALL astm403_idx_chk()
               #add-point:page4自定義行為 name="ui_dialog.body4.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_4)
            
         
            #add-point:page4自定義行為 name="ui_dialog.body4.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astm403_browser_fill("")
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
               CALL astm403_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astm403_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astm403_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astm403_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astm403_set_act_visible()   
            CALL astm403_set_act_no_visible()
            IF NOT (g_stfn_m.stfn001 IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stfnent = " ||g_enterprise|| " AND",
                                  " stfn001 = '", g_stfn_m.stfn001, "' "
 
               #填到對應位置
               CALL astm403_browser_fill("")
            END IF
         
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
               INITIALIZE g_wc2_table3 TO NULL
 
               INITIALIZE g_wc2_table4 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stfn_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stfo_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stfp_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "stfr_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "stfs_t" 
                        LET g_wc2_table4 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
                  OR NOT cl_null(g_wc2_table4)
 
 
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
 
                  IF g_wc2_table4 <> " 1=1" AND NOT cl_null(g_wc2_table4) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table4
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL astm403_browser_fill("F")   #browser_fill()會將notice區塊清空
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
 
               INITIALIZE g_wc2_table4 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stfn_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stfo_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stfp_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "stfr_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "stfs_t" 
                        LET g_wc2_table4 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
                  OR NOT cl_null(g_wc2_table4)
 
 
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
 
                  IF g_wc2_table4 <> " 1=1" AND NOT cl_null(g_wc2_table4) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table4
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astm403_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astm403_fetch("F")
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
               CALL astm403_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astm403_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm403_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astm403_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm403_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astm403_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm403_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astm403_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm403_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astm403_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm403_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stfo_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stfo2_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_stfo3_d)
                  LET g_export_id[3]   = "s_detail3"
                  LET g_export_node[4] = base.typeInfo.create(g_stfo4_d)
                  LET g_export_id[4]   = "s_detail4"
 
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
               NEXT FIELD stfoseq
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
               CALL astm403_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astm403_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astm403_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astm403_insert()
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
               CALL astm403_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astm403_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
               CALL g_curr_diag.setCurrentRow("s_detail3",1)
               CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stfn004
            LET g_action_choice="prog_stfn004"
            IF cl_auth_chk_act("prog_stfn004") THEN
               
               #add-point:ON ACTION prog_stfn004 name="menu.prog_stfn004"
               #應用 a41 樣板自動產生(Version:2)
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'asti201'
               LET la_param.param[1] = g_stfn_m.stfn004

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
 


               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astm403_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astm403_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astm403_set_pk_array()
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
 
{<section id="astm403.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astm403_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING  #161024-00025#12--add
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
   #161024-00025#12--add--begin------------
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'stfnsite') RETURNING l_where  
   LET l_wc = l_wc," AND ",l_where
   #161024-00025#12--add--end------------
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stfn001 ",
                      " FROM stfn_t ",
                      " ",
                      " LEFT JOIN stfo_t ON stfoent = stfnent AND stfn001 = stfo001 ", "  ",
                      #add-point:browser_fill段sql(stfo_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stfp_t ON stfpent = stfnent AND stfn001 = stfp001", "  ",
                      #add-point:browser_fill段sql(stfp_t1) name="browser_fill.cnt.join.stfp_t1"
                      
                      #end add-point
 
                      " LEFT JOIN stfr_t ON stfrent = stfnent AND stfn001 = stfr001", "  ",
                      #add-point:browser_fill段sql(stfr_t1) name="browser_fill.cnt.join.stfr_t1"
                      
                      #end add-point
 
                      " LEFT JOIN stfs_t ON stfsent = stfnent AND stfn001 = stfs001", "  ",
                      #add-point:browser_fill段sql(stfs_t1) name="browser_fill.cnt.join.stfs_t1"
                      
                      #end add-point
 
 
 
                      " LEFT JOIN stfnl_t ON stfnlent = "||g_enterprise||" AND stfn001 = stfnl001 AND stfnl002 = '",g_dlang,"' ", 
                      " ", 
                      " ",                      
 
                      " ",                      
 
                      " ",                      
 
 
 
                      " WHERE stfnent = " ||g_enterprise|| " AND stfoent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stfn_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stfn001 ",
                      " FROM stfn_t ", 
                      "  ",
                      "  LEFT JOIN stfnl_t ON stfnlent = "||g_enterprise||" AND stfn001 = stfnl001 AND stfnl002 = '",g_dlang,"' ",
                      " WHERE stfnent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stfn_t")
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
      INITIALIZE g_stfn_m.* TO NULL
      CALL g_stfo_d.clear()        
      CALL g_stfo2_d.clear() 
      CALL g_stfo3_d.clear() 
      CALL g_stfo4_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stfn001,t0.stfn002,t0.stfn003,t0.stfn004,t0.stfn005,t0.stfn006,t0.stfn007,t0.stfn008,t0.stfnsite,t0.stfnunit Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stfnstus,t0.stfn001,t0.stfn002,t0.stfn003,t0.stfn004,t0.stfn005, 
          t0.stfn006,t0.stfn007,t0.stfn008,t0.stfnsite,t0.stfnunit,t1.ooibl004 ,t2.ooail003 ,t3.oocql004 ", 
 
                  " FROM stfn_t t0",
                  "  ",
                  "  LEFT JOIN stfo_t ON stfoent = stfnent AND stfn001 = stfo001 ", "  ", 
                  #add-point:browser_fill段sql(stfo_t1) name="browser_fill.join.stfo_t1"
                  
                  #end add-point
                  "  LEFT JOIN stfp_t ON stfpent = stfnent AND stfn001 = stfp001", "  ", 
                  #add-point:browser_fill段sql(stfp_t1) name="browser_fill.join.stfp_t1"
                  
                  #end add-point
 
                  "  LEFT JOIN stfr_t ON stfrent = stfnent AND stfn001 = stfr001", "  ", 
                  #add-point:browser_fill段sql(stfr_t1) name="browser_fill.join.stfr_t1"
                  
                  #end add-point
 
                  "  LEFT JOIN stfs_t ON stfsent = stfnent AND stfn001 = stfs001", "  ", 
                  #add-point:browser_fill段sql(stfs_t1) name="browser_fill.join.stfs_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
                  " ",                      
 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooibl_t t1 ON t1.ooiblent="||g_enterprise||" AND t1.ooibl002=t0.stfn003 AND t1.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t2 ON t2.ooailent="||g_enterprise||" AND t2.ooail001=t0.stfn006 AND t2.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2127' AND t3.oocql002=t0.stfn007 AND t3.oocql003='"||g_dlang||"' ",
 
               " LEFT JOIN stfnl_t ON stfnlent = "||g_enterprise||" AND stfn001 = stfnl001 AND stfnl002 = '",g_dlang,"' ",
                  " WHERE t0.stfnent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stfn_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stfnstus,t0.stfn001,t0.stfn002,t0.stfn003,t0.stfn004,t0.stfn005, 
          t0.stfn006,t0.stfn007,t0.stfn008,t0.stfnsite,t0.stfnunit,t1.ooibl004 ,t2.ooail003 ,t3.oocql004 ", 
 
                  " FROM stfn_t t0",
                  "  ",
                                 " LEFT JOIN ooibl_t t1 ON t1.ooiblent="||g_enterprise||" AND t1.ooibl002=t0.stfn003 AND t1.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t2 ON t2.ooailent="||g_enterprise||" AND t2.ooail001=t0.stfn006 AND t2.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2127' AND t3.oocql002=t0.stfn007 AND t3.oocql003='"||g_dlang||"' ",
 
               " LEFT JOIN stfnl_t ON stfnlent = "||g_enterprise||" AND stfn001 = stfnl001 AND stfnl002 = '",g_dlang,"' ",
                  " WHERE t0.stfnent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stfn_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stfn001 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stfn_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stfn001,g_browser[g_cnt].b_stfn002, 
          g_browser[g_cnt].b_stfn003,g_browser[g_cnt].b_stfn004,g_browser[g_cnt].b_stfn005,g_browser[g_cnt].b_stfn006, 
          g_browser[g_cnt].b_stfn007,g_browser[g_cnt].b_stfn008,g_browser[g_cnt].b_stfnsite,g_browser[g_cnt].b_stfnunit, 
          g_browser[g_cnt].b_stfn003_desc,g_browser[g_cnt].b_stfn006_desc,g_browser[g_cnt].b_stfn007_desc 
 
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
         CALL astm403_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stfn001) THEN
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
 
{<section id="astm403.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astm403_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stfn_m.stfn001 = g_browser[g_current_idx].b_stfn001   
 
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
   CALL astm403_stfn_t_mask()
   CALL astm403_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astm403.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astm403_ui_detailshow()
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
      CALL g_curr_diag.setCurrentRow("s_detail4",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astm403_ui_browser_refresh()
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
      IF g_browser[l_i].b_stfn001 = g_stfn_m.stfn001 
 
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
 
{<section id="astm403.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astm403_construct()
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
   INITIALIZE g_stfn_m.* TO NULL
   CALL g_stfo_d.clear()        
   CALL g_stfo2_d.clear() 
   CALL g_stfo3_d.clear() 
   CALL g_stfo4_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
   INITIALIZE g_wc2_table3 TO NULL
 
   INITIALIZE g_wc2_table4 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stfnsite,stfnunit,stfn001,stfnl003,stfn004,stfn005,stfn006,stfn007,stfn003, 
          stfn002,stfn008,stfn009,stfnstus,stfnownid,stfnowndp,stfncrtid,stfncrtdp,stfncrtdt,stfnmodid, 
          stfnmoddt,stfncnfid,stfncnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stfncrtdt>>----
         AFTER FIELD stfncrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stfnmoddt>>----
         AFTER FIELD stfnmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stfncnfdt>>----
         AFTER FIELD stfncnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stfnpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnsite
            #add-point:BEFORE FIELD stfnsite name="construct.b.stfnsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnsite
            
            #add-point:AFTER FIELD stfnsite name="construct.a.stfnsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfnsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnsite
            #add-point:ON ACTION controlp INFIELD stfnsite name="construct.c.stfnsite"
            #161024-00025#612----add---begin-----------------        
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfnsite',g_site,'c')
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stfnsite  
            NEXT FIELD stfnsite  
            #161024-00025#612----add---end-----------------         
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnunit
            #add-point:BEFORE FIELD stfnunit name="construct.b.stfnunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnunit
            
            #add-point:AFTER FIELD stfnunit name="construct.a.stfnunit"
             
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfnunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnunit
            #add-point:ON ACTION controlp INFIELD stfnunit name="construct.c.stfnunit"
            #161024-00025#612----add---begin-----------------   
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfnunit',g_site,'c')
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stfnunit  
            NEXT FIELD stfnunit
            #161024-00025#612----add---end----------------- 
            #END add-point
 
 
         #Ctrlp:construct.c.stfn001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn001
            #add-point:ON ACTION controlp INFIELD stfn001 name="construct.c.stfn001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1=g_site
            CALL q_stfn001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfn001  #顯示到畫面上
            NEXT FIELD stfn001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn001
            #add-point:BEFORE FIELD stfn001 name="construct.b.stfn001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn001
            
            #add-point:AFTER FIELD stfn001 name="construct.a.stfn001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnl003
            #add-point:BEFORE FIELD stfnl003 name="construct.b.stfnl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnl003
            
            #add-point:AFTER FIELD stfnl003 name="construct.a.stfnl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfnl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnl003
            #add-point:ON ACTION controlp INFIELD stfnl003 name="construct.c.stfnl003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfn004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn004
            #add-point:ON ACTION controlp INFIELD stfn004 name="construct.c.stfn004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfn004  #顯示到畫面上
            NEXT FIELD stfn004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn004
            #add-point:BEFORE FIELD stfn004 name="construct.b.stfn004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn004
            
            #add-point:AFTER FIELD stfn004 name="construct.a.stfn004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn005
            #add-point:ON ACTION controlp INFIELD stfn005 name="construct.c.stfn005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfn005  #顯示到畫面上
            NEXT FIELD stfn005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn005
            #add-point:BEFORE FIELD stfn005 name="construct.b.stfn005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn005
            
            #add-point:AFTER FIELD stfn005 name="construct.a.stfn005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn006
            #add-point:ON ACTION controlp INFIELD stfn006 name="construct.c.stfn006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfn006  #顯示到畫面上
            NEXT FIELD stfn006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn006
            #add-point:BEFORE FIELD stfn006 name="construct.b.stfn006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn006
            
            #add-point:AFTER FIELD stfn006 name="construct.a.stfn006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn007
            #add-point:ON ACTION controlp INFIELD stfn007 name="construct.c.stfn007"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2127()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfn007  #顯示到畫面上
            NEXT FIELD stfn007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn007
            #add-point:BEFORE FIELD stfn007 name="construct.b.stfn007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn007
            
            #add-point:AFTER FIELD stfn007 name="construct.a.stfn007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn003
            #add-point:BEFORE FIELD stfn003 name="construct.b.stfn003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn003
            
            #add-point:AFTER FIELD stfn003 name="construct.a.stfn003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn003
            #add-point:ON ACTION controlp INFIELD stfn003 name="construct.c.stfn003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn002
            #add-point:BEFORE FIELD stfn002 name="construct.b.stfn002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn002
            
            #add-point:AFTER FIELD stfn002 name="construct.a.stfn002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn002
            #add-point:ON ACTION controlp INFIELD stfn002 name="construct.c.stfn002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn008
            #add-point:BEFORE FIELD stfn008 name="construct.b.stfn008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn008
            
            #add-point:AFTER FIELD stfn008 name="construct.a.stfn008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn008
            #add-point:ON ACTION controlp INFIELD stfn008 name="construct.c.stfn008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn009
            #add-point:BEFORE FIELD stfn009 name="construct.b.stfn009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn009
            
            #add-point:AFTER FIELD stfn009 name="construct.a.stfn009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfn009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn009
            #add-point:ON ACTION controlp INFIELD stfn009 name="construct.c.stfn009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnstus
            #add-point:BEFORE FIELD stfnstus name="construct.b.stfnstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnstus
            
            #add-point:AFTER FIELD stfnstus name="construct.a.stfnstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfnstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnstus
            #add-point:ON ACTION controlp INFIELD stfnstus name="construct.c.stfnstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfnownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnownid
            #add-point:ON ACTION controlp INFIELD stfnownid name="construct.c.stfnownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfnownid  #顯示到畫面上
            NEXT FIELD stfnownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnownid
            #add-point:BEFORE FIELD stfnownid name="construct.b.stfnownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnownid
            
            #add-point:AFTER FIELD stfnownid name="construct.a.stfnownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfnowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnowndp
            #add-point:ON ACTION controlp INFIELD stfnowndp name="construct.c.stfnowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfnowndp  #顯示到畫面上
            NEXT FIELD stfnowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnowndp
            #add-point:BEFORE FIELD stfnowndp name="construct.b.stfnowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnowndp
            
            #add-point:AFTER FIELD stfnowndp name="construct.a.stfnowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfncrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfncrtid
            #add-point:ON ACTION controlp INFIELD stfncrtid name="construct.c.stfncrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfncrtid  #顯示到畫面上
            NEXT FIELD stfncrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfncrtid
            #add-point:BEFORE FIELD stfncrtid name="construct.b.stfncrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfncrtid
            
            #add-point:AFTER FIELD stfncrtid name="construct.a.stfncrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfncrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfncrtdp
            #add-point:ON ACTION controlp INFIELD stfncrtdp name="construct.c.stfncrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfncrtdp  #顯示到畫面上
            NEXT FIELD stfncrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfncrtdp
            #add-point:BEFORE FIELD stfncrtdp name="construct.b.stfncrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfncrtdp
            
            #add-point:AFTER FIELD stfncrtdp name="construct.a.stfncrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfncrtdt
            #add-point:BEFORE FIELD stfncrtdt name="construct.b.stfncrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfnmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnmodid
            #add-point:ON ACTION controlp INFIELD stfnmodid name="construct.c.stfnmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfnmodid  #顯示到畫面上
            NEXT FIELD stfnmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnmodid
            #add-point:BEFORE FIELD stfnmodid name="construct.b.stfnmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnmodid
            
            #add-point:AFTER FIELD stfnmodid name="construct.a.stfnmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnmoddt
            #add-point:BEFORE FIELD stfnmoddt name="construct.b.stfnmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stfncnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfncnfid
            #add-point:ON ACTION controlp INFIELD stfncnfid name="construct.c.stfncnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfncnfid  #顯示到畫面上
            NEXT FIELD stfncnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfncnfid
            #add-point:BEFORE FIELD stfncnfid name="construct.b.stfncnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfncnfid
            
            #add-point:AFTER FIELD stfncnfid name="construct.a.stfncnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfncnfdt
            #add-point:BEFORE FIELD stfncnfdt name="construct.b.stfncnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stfoseq,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006,stfo007, 
          stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015,stfo016,stfo017, 
          stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit
           FROM s_detail1[1].stfoseq,s_detail1[1].stfo002,s_detail1[1].stfo018,s_detail1[1].stfo019, 
               s_detail1[1].stfo003,s_detail1[1].stfo004,s_detail1[1].stfo005,s_detail1[1].stfo006,s_detail1[1].stfo007, 
               s_detail1[1].stfo020,s_detail1[1].stfo008,s_detail1[1].stfo009,s_detail1[1].stfo010,s_detail1[1].stfo011, 
               s_detail1[1].stfo012,s_detail1[1].stfo013,s_detail1[1].stfo014,s_detail1[1].stfo026,s_detail1[1].stfo015, 
               s_detail1[1].stfo016,s_detail1[1].stfo017,s_detail1[1].stfo021,s_detail1[1].stfo022,s_detail1[1].stfo023, 
               s_detail1[1].stfo024,s_detail1[1].stfo025,s_detail1[1].stfosite,s_detail1[1].stfounit 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfoseq
            #add-point:BEFORE FIELD stfoseq name="construct.b.page1.stfoseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfoseq
            
            #add-point:AFTER FIELD stfoseq name="construct.a.page1.stfoseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfoseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfoseq
            #add-point:ON ACTION controlp INFIELD stfoseq name="construct.c.page1.stfoseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo002
            #add-point:BEFORE FIELD stfo002 name="construct.b.page1.stfo002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo002
            
            #add-point:AFTER FIELD stfo002 name="construct.a.page1.stfo002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo002
            #add-point:ON ACTION controlp INFIELD stfo002 name="construct.c.page1.stfo002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo018
            #add-point:BEFORE FIELD stfo018 name="construct.b.page1.stfo018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo018
            
            #add-point:AFTER FIELD stfo018 name="construct.a.page1.stfo018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo018
            #add-point:ON ACTION controlp INFIELD stfo018 name="construct.c.page1.stfo018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo019
            #add-point:BEFORE FIELD stfo019 name="construct.b.page1.stfo019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo019
            
            #add-point:AFTER FIELD stfo019 name="construct.a.page1.stfo019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo019
            #add-point:ON ACTION controlp INFIELD stfo019 name="construct.c.page1.stfo019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo003
            #add-point:BEFORE FIELD stfo003 name="construct.b.page1.stfo003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo003
            
            #add-point:AFTER FIELD stfo003 name="construct.a.page1.stfo003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo003
            #add-point:ON ACTION controlp INFIELD stfo003 name="construct.c.page1.stfo003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo004
            #add-point:BEFORE FIELD stfo004 name="construct.b.page1.stfo004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo004
            
            #add-point:AFTER FIELD stfo004 name="construct.a.page1.stfo004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo004
            #add-point:ON ACTION controlp INFIELD stfo004 name="construct.c.page1.stfo004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo005
            #add-point:BEFORE FIELD stfo005 name="construct.b.page1.stfo005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo005
            
            #add-point:AFTER FIELD stfo005 name="construct.a.page1.stfo005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo005
            #add-point:ON ACTION controlp INFIELD stfo005 name="construct.c.page1.stfo005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo006
            #add-point:BEFORE FIELD stfo006 name="construct.b.page1.stfo006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo006
            
            #add-point:AFTER FIELD stfo006 name="construct.a.page1.stfo006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo006
            #add-point:ON ACTION controlp INFIELD stfo006 name="construct.c.page1.stfo006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo007
            #add-point:BEFORE FIELD stfo007 name="construct.b.page1.stfo007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo007
            
            #add-point:AFTER FIELD stfo007 name="construct.a.page1.stfo007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo007
            #add-point:ON ACTION controlp INFIELD stfo007 name="construct.c.page1.stfo007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo020
            #add-point:BEFORE FIELD stfo020 name="construct.b.page1.stfo020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo020
            
            #add-point:AFTER FIELD stfo020 name="construct.a.page1.stfo020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo020
            #add-point:ON ACTION controlp INFIELD stfo020 name="construct.c.page1.stfo020"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stfo008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo008
            #add-point:ON ACTION controlp INFIELD stfo008 name="construct.c.page1.stfo008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfo008  #顯示到畫面上
            NEXT FIELD stfo008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo008
            #add-point:BEFORE FIELD stfo008 name="construct.b.page1.stfo008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo008
            
            #add-point:AFTER FIELD stfo008 name="construct.a.page1.stfo008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo009
            #add-point:ON ACTION controlp INFIELD stfo009 name="construct.c.page1.stfo009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfo009  #顯示到畫面上
            NEXT FIELD stfo009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo009
            #add-point:BEFORE FIELD stfo009 name="construct.b.page1.stfo009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo009
            
            #add-point:AFTER FIELD stfo009 name="construct.a.page1.stfo009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo010
            #add-point:BEFORE FIELD stfo010 name="construct.b.page1.stfo010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo010
            
            #add-point:AFTER FIELD stfo010 name="construct.a.page1.stfo010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo010
            #add-point:ON ACTION controlp INFIELD stfo010 name="construct.c.page1.stfo010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo011
            #add-point:BEFORE FIELD stfo011 name="construct.b.page1.stfo011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo011
            
            #add-point:AFTER FIELD stfo011 name="construct.a.page1.stfo011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo011
            #add-point:ON ACTION controlp INFIELD stfo011 name="construct.c.page1.stfo011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo012
            #add-point:BEFORE FIELD stfo012 name="construct.b.page1.stfo012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo012
            
            #add-point:AFTER FIELD stfo012 name="construct.a.page1.stfo012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo012
            #add-point:ON ACTION controlp INFIELD stfo012 name="construct.c.page1.stfo012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo013
            #add-point:BEFORE FIELD stfo013 name="construct.b.page1.stfo013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo013
            
            #add-point:AFTER FIELD stfo013 name="construct.a.page1.stfo013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo013
            #add-point:ON ACTION controlp INFIELD stfo013 name="construct.c.page1.stfo013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo014
            #add-point:BEFORE FIELD stfo014 name="construct.b.page1.stfo014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo014
            
            #add-point:AFTER FIELD stfo014 name="construct.a.page1.stfo014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo014
            #add-point:ON ACTION controlp INFIELD stfo014 name="construct.c.page1.stfo014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo026
            #add-point:BEFORE FIELD stfo026 name="construct.b.page1.stfo026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo026
            
            #add-point:AFTER FIELD stfo026 name="construct.a.page1.stfo026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo026
            #add-point:ON ACTION controlp INFIELD stfo026 name="construct.c.page1.stfo026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo015
            #add-point:BEFORE FIELD stfo015 name="construct.b.page1.stfo015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo015
            
            #add-point:AFTER FIELD stfo015 name="construct.a.page1.stfo015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo015
            #add-point:ON ACTION controlp INFIELD stfo015 name="construct.c.page1.stfo015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo016
            #add-point:BEFORE FIELD stfo016 name="construct.b.page1.stfo016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo016
            
            #add-point:AFTER FIELD stfo016 name="construct.a.page1.stfo016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo016
            #add-point:ON ACTION controlp INFIELD stfo016 name="construct.c.page1.stfo016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo017
            #add-point:BEFORE FIELD stfo017 name="construct.b.page1.stfo017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo017
            
            #add-point:AFTER FIELD stfo017 name="construct.a.page1.stfo017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo017
            #add-point:ON ACTION controlp INFIELD stfo017 name="construct.c.page1.stfo017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo021
            #add-point:BEFORE FIELD stfo021 name="construct.b.page1.stfo021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo021
            
            #add-point:AFTER FIELD stfo021 name="construct.a.page1.stfo021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo021
            #add-point:ON ACTION controlp INFIELD stfo021 name="construct.c.page1.stfo021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo022
            #add-point:BEFORE FIELD stfo022 name="construct.b.page1.stfo022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo022
            
            #add-point:AFTER FIELD stfo022 name="construct.a.page1.stfo022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo022
            #add-point:ON ACTION controlp INFIELD stfo022 name="construct.c.page1.stfo022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo023
            #add-point:BEFORE FIELD stfo023 name="construct.b.page1.stfo023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo023
            
            #add-point:AFTER FIELD stfo023 name="construct.a.page1.stfo023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo023
            #add-point:ON ACTION controlp INFIELD stfo023 name="construct.c.page1.stfo023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo024
            #add-point:BEFORE FIELD stfo024 name="construct.b.page1.stfo024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo024
            
            #add-point:AFTER FIELD stfo024 name="construct.a.page1.stfo024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo024
            #add-point:ON ACTION controlp INFIELD stfo024 name="construct.c.page1.stfo024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo025
            #add-point:BEFORE FIELD stfo025 name="construct.b.page1.stfo025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo025
            
            #add-point:AFTER FIELD stfo025 name="construct.a.page1.stfo025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfo025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo025
            #add-point:ON ACTION controlp INFIELD stfo025 name="construct.c.page1.stfo025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfosite
            #add-point:BEFORE FIELD stfosite name="construct.b.page1.stfosite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfosite
            
            #add-point:AFTER FIELD stfosite name="construct.a.page1.stfosite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfosite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfosite
            #add-point:ON ACTION controlp INFIELD stfosite name="construct.c.page1.stfosite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfounit
            #add-point:BEFORE FIELD stfounit name="construct.b.page1.stfounit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfounit
            
            #add-point:AFTER FIELD stfounit name="construct.a.page1.stfounit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stfounit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfounit
            #add-point:ON ACTION controlp INFIELD stfounit name="construct.c.page1.stfounit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stfpsite,stfpunit,stfpseq,stfp002,stfp021,stfp020,stfp003,stfp004,stfp018, 
          stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012,stfp013,stfp014,stfpacti, 
          stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025,stfp026
           FROM s_detail2[1].stfpsite,s_detail2[1].stfpunit,s_detail2[1].stfpseq,s_detail2[1].stfp002, 
               s_detail2[1].stfp021,s_detail2[1].stfp020,s_detail2[1].stfp003,s_detail2[1].stfp004,s_detail2[1].stfp018, 
               s_detail2[1].stfp019,s_detail2[1].stfp005,s_detail2[1].stfp006,s_detail2[1].stfp007,s_detail2[1].stfp008, 
               s_detail2[1].stfp009,s_detail2[1].stfp010,s_detail2[1].stfp011,s_detail2[1].stfp012,s_detail2[1].stfp013, 
               s_detail2[1].stfp014,s_detail2[1].stfpacti,s_detail2[1].stfp015,s_detail2[1].stfp016, 
               s_detail2[1].stfp017,s_detail2[1].stfp022,s_detail2[1].stfp023,s_detail2[1].stfp024,s_detail2[1].stfp025, 
               s_detail2[1].stfp026
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpsite
            #add-point:BEFORE FIELD stfpsite name="construct.b.page2.stfpsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpsite
            
            #add-point:AFTER FIELD stfpsite name="construct.a.page2.stfpsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfpsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpsite
            #add-point:ON ACTION controlp INFIELD stfpsite name="construct.c.page2.stfpsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpunit
            #add-point:BEFORE FIELD stfpunit name="construct.b.page2.stfpunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpunit
            
            #add-point:AFTER FIELD stfpunit name="construct.a.page2.stfpunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfpunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpunit
            #add-point:ON ACTION controlp INFIELD stfpunit name="construct.c.page2.stfpunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpseq
            #add-point:BEFORE FIELD stfpseq name="construct.b.page2.stfpseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpseq
            
            #add-point:AFTER FIELD stfpseq name="construct.a.page2.stfpseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfpseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpseq
            #add-point:ON ACTION controlp INFIELD stfpseq name="construct.c.page2.stfpseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stfp002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp002
            #add-point:ON ACTION controlp INFIELD stfp002 name="construct.c.page2.stfp002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfp002  #顯示到畫面上
            NEXT FIELD stfp002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp002
            #add-point:BEFORE FIELD stfp002 name="construct.b.page2.stfp002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp002
            
            #add-point:AFTER FIELD stfp002 name="construct.a.page2.stfp002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp021
            #add-point:BEFORE FIELD stfp021 name="construct.b.page2.stfp021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp021
            
            #add-point:AFTER FIELD stfp021 name="construct.a.page2.stfp021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp021
            #add-point:ON ACTION controlp INFIELD stfp021 name="construct.c.page2.stfp021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp020
            #add-point:BEFORE FIELD stfp020 name="construct.b.page2.stfp020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp020
            
            #add-point:AFTER FIELD stfp020 name="construct.a.page2.stfp020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp020
            #add-point:ON ACTION controlp INFIELD stfp020 name="construct.c.page2.stfp020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp003
            #add-point:BEFORE FIELD stfp003 name="construct.b.page2.stfp003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp003
            
            #add-point:AFTER FIELD stfp003 name="construct.a.page2.stfp003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp003
            #add-point:ON ACTION controlp INFIELD stfp003 name="construct.c.page2.stfp003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp004
            #add-point:BEFORE FIELD stfp004 name="construct.b.page2.stfp004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp004
            
            #add-point:AFTER FIELD stfp004 name="construct.a.page2.stfp004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp004
            #add-point:ON ACTION controlp INFIELD stfp004 name="construct.c.page2.stfp004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp018
            #add-point:BEFORE FIELD stfp018 name="construct.b.page2.stfp018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp018
            
            #add-point:AFTER FIELD stfp018 name="construct.a.page2.stfp018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp018
            #add-point:ON ACTION controlp INFIELD stfp018 name="construct.c.page2.stfp018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp019
            #add-point:BEFORE FIELD stfp019 name="construct.b.page2.stfp019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp019
            
            #add-point:AFTER FIELD stfp019 name="construct.a.page2.stfp019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp019
            #add-point:ON ACTION controlp INFIELD stfp019 name="construct.c.page2.stfp019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp005
            #add-point:BEFORE FIELD stfp005 name="construct.b.page2.stfp005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp005
            
            #add-point:AFTER FIELD stfp005 name="construct.a.page2.stfp005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp005
            #add-point:ON ACTION controlp INFIELD stfp005 name="construct.c.page2.stfp005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp006
            #add-point:BEFORE FIELD stfp006 name="construct.b.page2.stfp006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp006
            
            #add-point:AFTER FIELD stfp006 name="construct.a.page2.stfp006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp006
            #add-point:ON ACTION controlp INFIELD stfp006 name="construct.c.page2.stfp006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp007
            #add-point:BEFORE FIELD stfp007 name="construct.b.page2.stfp007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp007
            
            #add-point:AFTER FIELD stfp007 name="construct.a.page2.stfp007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp007
            #add-point:ON ACTION controlp INFIELD stfp007 name="construct.c.page2.stfp007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stfp008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp008
            #add-point:ON ACTION controlp INFIELD stfp008 name="construct.c.page2.stfp008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfp008  #顯示到畫面上
            NEXT FIELD stfp008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp008
            #add-point:BEFORE FIELD stfp008 name="construct.b.page2.stfp008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp008
            
            #add-point:AFTER FIELD stfp008 name="construct.a.page2.stfp008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp009
            #add-point:ON ACTION controlp INFIELD stfp009 name="construct.c.page2.stfp009"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfp009  #顯示到畫面上
            NEXT FIELD stfp009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp009
            #add-point:BEFORE FIELD stfp009 name="construct.b.page2.stfp009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp009
            
            #add-point:AFTER FIELD stfp009 name="construct.a.page2.stfp009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp010
            #add-point:BEFORE FIELD stfp010 name="construct.b.page2.stfp010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp010
            
            #add-point:AFTER FIELD stfp010 name="construct.a.page2.stfp010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp010
            #add-point:ON ACTION controlp INFIELD stfp010 name="construct.c.page2.stfp010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp011
            #add-point:BEFORE FIELD stfp011 name="construct.b.page2.stfp011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp011
            
            #add-point:AFTER FIELD stfp011 name="construct.a.page2.stfp011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp011
            #add-point:ON ACTION controlp INFIELD stfp011 name="construct.c.page2.stfp011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp012
            #add-point:BEFORE FIELD stfp012 name="construct.b.page2.stfp012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp012
            
            #add-point:AFTER FIELD stfp012 name="construct.a.page2.stfp012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp012
            #add-point:ON ACTION controlp INFIELD stfp012 name="construct.c.page2.stfp012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp013
            #add-point:BEFORE FIELD stfp013 name="construct.b.page2.stfp013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp013
            
            #add-point:AFTER FIELD stfp013 name="construct.a.page2.stfp013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp013
            #add-point:ON ACTION controlp INFIELD stfp013 name="construct.c.page2.stfp013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp014
            #add-point:BEFORE FIELD stfp014 name="construct.b.page2.stfp014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp014
            
            #add-point:AFTER FIELD stfp014 name="construct.a.page2.stfp014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp014
            #add-point:ON ACTION controlp INFIELD stfp014 name="construct.c.page2.stfp014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpacti
            #add-point:BEFORE FIELD stfpacti name="construct.b.page2.stfpacti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpacti
            
            #add-point:AFTER FIELD stfpacti name="construct.a.page2.stfpacti"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfpacti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpacti
            #add-point:ON ACTION controlp INFIELD stfpacti name="construct.c.page2.stfpacti"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp015
            #add-point:BEFORE FIELD stfp015 name="construct.b.page2.stfp015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp015
            
            #add-point:AFTER FIELD stfp015 name="construct.a.page2.stfp015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp015
            #add-point:ON ACTION controlp INFIELD stfp015 name="construct.c.page2.stfp015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp016
            #add-point:BEFORE FIELD stfp016 name="construct.b.page2.stfp016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp016
            
            #add-point:AFTER FIELD stfp016 name="construct.a.page2.stfp016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp016
            #add-point:ON ACTION controlp INFIELD stfp016 name="construct.c.page2.stfp016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp017
            #add-point:BEFORE FIELD stfp017 name="construct.b.page2.stfp017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp017
            
            #add-point:AFTER FIELD stfp017 name="construct.a.page2.stfp017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp017
            #add-point:ON ACTION controlp INFIELD stfp017 name="construct.c.page2.stfp017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp022
            #add-point:BEFORE FIELD stfp022 name="construct.b.page2.stfp022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp022
            
            #add-point:AFTER FIELD stfp022 name="construct.a.page2.stfp022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp022
            #add-point:ON ACTION controlp INFIELD stfp022 name="construct.c.page2.stfp022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp023
            #add-point:BEFORE FIELD stfp023 name="construct.b.page2.stfp023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp023
            
            #add-point:AFTER FIELD stfp023 name="construct.a.page2.stfp023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp023
            #add-point:ON ACTION controlp INFIELD stfp023 name="construct.c.page2.stfp023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp024
            #add-point:BEFORE FIELD stfp024 name="construct.b.page2.stfp024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp024
            
            #add-point:AFTER FIELD stfp024 name="construct.a.page2.stfp024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp024
            #add-point:ON ACTION controlp INFIELD stfp024 name="construct.c.page2.stfp024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp025
            #add-point:BEFORE FIELD stfp025 name="construct.b.page2.stfp025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp025
            
            #add-point:AFTER FIELD stfp025 name="construct.a.page2.stfp025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp025
            #add-point:ON ACTION controlp INFIELD stfp025 name="construct.c.page2.stfp025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp026
            #add-point:BEFORE FIELD stfp026 name="construct.b.page2.stfp026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp026
            
            #add-point:AFTER FIELD stfp026 name="construct.a.page2.stfp026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stfp026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp026
            #add-point:ON ACTION controlp INFIELD stfp026 name="construct.c.page2.stfp026"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
      CONSTRUCT g_wc2_table3 ON stfrsite,stfrunit,stfracti,stfrseq,stfr003,stfr002,stfr004,stfr005,stfr006, 
          stfr007,stfr008,stfr009
           FROM s_detail3[1].stfrsite,s_detail3[1].stfrunit,s_detail3[1].stfracti,s_detail3[1].stfrseq, 
               s_detail3[1].stfr003,s_detail3[1].stfr002,s_detail3[1].stfr004,s_detail3[1].stfr005,s_detail3[1].stfr006, 
               s_detail3[1].stfr007,s_detail3[1].stfr008,s_detail3[1].stfr009
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body3.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 3)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrsite
            #add-point:BEFORE FIELD stfrsite name="construct.b.page3.stfrsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrsite
            
            #add-point:AFTER FIELD stfrsite name="construct.a.page3.stfrsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfrsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrsite
            #add-point:ON ACTION controlp INFIELD stfrsite name="construct.c.page3.stfrsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrunit
            #add-point:BEFORE FIELD stfrunit name="construct.b.page3.stfrunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrunit
            
            #add-point:AFTER FIELD stfrunit name="construct.a.page3.stfrunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfrunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrunit
            #add-point:ON ACTION controlp INFIELD stfrunit name="construct.c.page3.stfrunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfracti
            #add-point:BEFORE FIELD stfracti name="construct.b.page3.stfracti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfracti
            
            #add-point:AFTER FIELD stfracti name="construct.a.page3.stfracti"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfracti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfracti
            #add-point:ON ACTION controlp INFIELD stfracti name="construct.c.page3.stfracti"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrseq
            #add-point:BEFORE FIELD stfrseq name="construct.b.page3.stfrseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrseq
            
            #add-point:AFTER FIELD stfrseq name="construct.a.page3.stfrseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfrseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrseq
            #add-point:ON ACTION controlp INFIELD stfrseq name="construct.c.page3.stfrseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr003
            #add-point:BEFORE FIELD stfr003 name="construct.b.page3.stfr003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr003
            
            #add-point:AFTER FIELD stfr003 name="construct.a.page3.stfr003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr003
            #add-point:ON ACTION controlp INFIELD stfr003 name="construct.c.page3.stfr003"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.stfr002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr002
            #add-point:ON ACTION controlp INFIELD stfr002 name="construct.c.page3.stfr002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfr002  #顯示到畫面上
            NEXT FIELD stfr002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr002
            #add-point:BEFORE FIELD stfr002 name="construct.b.page3.stfr002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr002
            
            #add-point:AFTER FIELD stfr002 name="construct.a.page3.stfr002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr004
            #add-point:BEFORE FIELD stfr004 name="construct.b.page3.stfr004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr004
            
            #add-point:AFTER FIELD stfr004 name="construct.a.page3.stfr004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr004
            #add-point:ON ACTION controlp INFIELD stfr004 name="construct.c.page3.stfr004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr005
            #add-point:BEFORE FIELD stfr005 name="construct.b.page3.stfr005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr005
            
            #add-point:AFTER FIELD stfr005 name="construct.a.page3.stfr005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr005
            #add-point:ON ACTION controlp INFIELD stfr005 name="construct.c.page3.stfr005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr006
            #add-point:BEFORE FIELD stfr006 name="construct.b.page3.stfr006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr006
            
            #add-point:AFTER FIELD stfr006 name="construct.a.page3.stfr006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr006
            #add-point:ON ACTION controlp INFIELD stfr006 name="construct.c.page3.stfr006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr007
            #add-point:BEFORE FIELD stfr007 name="construct.b.page3.stfr007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr007
            
            #add-point:AFTER FIELD stfr007 name="construct.a.page3.stfr007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr007
            #add-point:ON ACTION controlp INFIELD stfr007 name="construct.c.page3.stfr007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr008
            #add-point:BEFORE FIELD stfr008 name="construct.b.page3.stfr008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr008
            
            #add-point:AFTER FIELD stfr008 name="construct.a.page3.stfr008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr008
            #add-point:ON ACTION controlp INFIELD stfr008 name="construct.c.page3.stfr008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr009
            #add-point:BEFORE FIELD stfr009 name="construct.b.page3.stfr009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr009
            
            #add-point:AFTER FIELD stfr009 name="construct.a.page3.stfr009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.stfr009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr009
            #add-point:ON ACTION controlp INFIELD stfr009 name="construct.c.page3.stfr009"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
      CONSTRUCT g_wc2_table4 ON stfssite,stfsunit,stfs002,stfsstus
           FROM s_detail4[1].stfssite,s_detail4[1].stfsunit,s_detail4[1].stfs002,s_detail4[1].stfsstus 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body4.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 4)
       #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stfscrtdt>>----
 
         #----<<stfsmoddt>>----
         
         #----<<stfscnfdt>>----
         
         #----<<stfspstdt>>----
 
 
 
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfssite
            #add-point:BEFORE FIELD stfssite name="construct.b.page4.stfssite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfssite
            
            #add-point:AFTER FIELD stfssite name="construct.a.page4.stfssite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.stfssite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfssite
            #add-point:ON ACTION controlp INFIELD stfssite name="construct.c.page4.stfssite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfsunit
            #add-point:BEFORE FIELD stfsunit name="construct.b.page4.stfsunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfsunit
            
            #add-point:AFTER FIELD stfsunit name="construct.a.page4.stfsunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.stfsunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfsunit
            #add-point:ON ACTION controlp INFIELD stfsunit name="construct.c.page4.stfsunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfs002
            #add-point:BEFORE FIELD stfs002 name="construct.b.page4.stfs002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfs002
            
            #add-point:AFTER FIELD stfs002 name="construct.a.page4.stfs002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.stfs002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfs002
            #add-point:ON ACTION controlp INFIELD stfs002 name="construct.c.page4.stfs002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfsstus
            #add-point:BEFORE FIELD stfsstus name="construct.b.page4.stfsstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfsstus
            
            #add-point:AFTER FIELD stfsstus name="construct.a.page4.stfsstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.stfsstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfsstus
            #add-point:ON ACTION controlp INFIELD stfsstus name="construct.c.page4.stfsstus"
            
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
 
            INITIALIZE g_wc2_table4 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stfn_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stfo_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stfp_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
                  WHEN la_wc[li_idx].tableid = "stfr_t" 
                     LET g_wc2_table3 = la_wc[li_idx].wc
 
                  WHEN la_wc[li_idx].tableid = "stfs_t" 
                     LET g_wc2_table4 = la_wc[li_idx].wc
 
 
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
 
   IF g_wc2_table4 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table4
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astm403_filter()
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
      CONSTRUCT g_wc_filter ON stfn001,stfn002,stfn003,stfn004,stfn005,stfn006,stfn007,stfn008,stfnsite, 
          stfnunit
                          FROM s_browse[1].b_stfn001,s_browse[1].b_stfn002,s_browse[1].b_stfn003,s_browse[1].b_stfn004, 
                              s_browse[1].b_stfn005,s_browse[1].b_stfn006,s_browse[1].b_stfn007,s_browse[1].b_stfn008, 
                              s_browse[1].b_stfnsite,s_browse[1].b_stfnunit
 
         BEFORE CONSTRUCT
               DISPLAY astm403_filter_parser('stfn001') TO s_browse[1].b_stfn001
            DISPLAY astm403_filter_parser('stfn002') TO s_browse[1].b_stfn002
            DISPLAY astm403_filter_parser('stfn003') TO s_browse[1].b_stfn003
            DISPLAY astm403_filter_parser('stfn004') TO s_browse[1].b_stfn004
            DISPLAY astm403_filter_parser('stfn005') TO s_browse[1].b_stfn005
            DISPLAY astm403_filter_parser('stfn006') TO s_browse[1].b_stfn006
            DISPLAY astm403_filter_parser('stfn007') TO s_browse[1].b_stfn007
            DISPLAY astm403_filter_parser('stfn008') TO s_browse[1].b_stfn008
            DISPLAY astm403_filter_parser('stfnsite') TO s_browse[1].b_stfnsite
            DISPLAY astm403_filter_parser('stfnunit') TO s_browse[1].b_stfnunit
      
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
 
      CALL astm403_filter_show('stfn001')
   CALL astm403_filter_show('stfn002')
   CALL astm403_filter_show('stfn003')
   CALL astm403_filter_show('stfn004')
   CALL astm403_filter_show('stfn005')
   CALL astm403_filter_show('stfn006')
   CALL astm403_filter_show('stfn007')
   CALL astm403_filter_show('stfn008')
   CALL astm403_filter_show('stfnsite')
   CALL astm403_filter_show('stfnunit')
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astm403_filter_parser(ps_field)
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
 
{<section id="astm403.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astm403_filter_show(ps_field)
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
   LET ls_condition = astm403_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astm403_query()
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
   CALL g_stfo_d.clear()
   CALL g_stfo2_d.clear()
   CALL g_stfo3_d.clear()
   CALL g_stfo4_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astm403_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astm403_browser_fill("")
      CALL astm403_fetch("")
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
   LET g_detail_idx_list[4] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL astm403_filter_show('stfn001')
   CALL astm403_filter_show('stfn002')
   CALL astm403_filter_show('stfn003')
   CALL astm403_filter_show('stfn004')
   CALL astm403_filter_show('stfn005')
   CALL astm403_filter_show('stfn006')
   CALL astm403_filter_show('stfn007')
   CALL astm403_filter_show('stfn008')
   CALL astm403_filter_show('stfnsite')
   CALL astm403_filter_show('stfnunit')
   CALL astm403_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astm403_fetch("F") 
      #顯示單身筆數
      CALL astm403_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astm403_fetch(p_flag)
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
   
   LET g_stfn_m.stfn001 = g_browser[g_current_idx].b_stfn001
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
   #遮罩相關處理
   LET g_stfn_m_mask_o.* =  g_stfn_m.*
   CALL astm403_stfn_t_mask()
   LET g_stfn_m_mask_n.* =  g_stfn_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm403_set_act_visible()   
   CALL astm403_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stfn_m_t.* = g_stfn_m.*
   LET g_stfn_m_o.* = g_stfn_m.*
   
   LET g_data_owner = g_stfn_m.stfnownid      
   LET g_data_dept  = g_stfn_m.stfnowndp
   
   #重新顯示   
   CALL astm403_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.insert" >}
#+ 資料新增
PRIVATE FUNCTION astm403_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert      LIKE type_t.num5  #161024-00025#12--add
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stfo_d.clear()   
   CALL g_stfo2_d.clear()  
   CALL g_stfo3_d.clear()  
   CALL g_stfo4_d.clear()  
 
 
   INITIALIZE g_stfn_m.* TO NULL             #DEFAULT 設定
   
   LET g_stfn001_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stfn_m.stfnownid = g_user
      LET g_stfn_m.stfnowndp = g_dept
      LET g_stfn_m.stfncrtid = g_user
      LET g_stfn_m.stfncrtdp = g_dept 
      LET g_stfn_m.stfncrtdt = cl_get_current()
      LET g_stfn_m.stfnmodid = g_user
      LET g_stfn_m.stfnmoddt = cl_get_current()
      LET g_stfn_m.stfnstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stfn_m.stfn009 = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
     #LET g_stfn_m.stfnsite=g_site  #161024-00025#12-mark
     #LET g_stfn_m.stfnunit=g_site  #161024-00025#12-mark
      
      #161024-00025#12--add----begin---------
      LET g_ins_site_flag = ''   
      CALL s_aooi500_default(g_prog,'stfnsite',g_stfn_m.stfnsite)
         RETURNING l_insert,g_stfn_m.stfnsite
      IF l_insert = FALSE THEN
         RETURN
      END IF
      
      LET g_stfn_m.stfnunit = g_stfn_m.stfnsite 
      
      #161024-00025#12--add---end------------
      
      LET g_stfn_m.stfn002='4'
      LET g_stfn_m.stfn008='2'
      LET g_stfn_m.stfn006='CNY'
      
      CALL astm403_stfn006_ref()
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stfn_m_t.* = g_stfn_m.*
      LET g_stfn_m_o.* = g_stfn_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfn_m.stfnstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
    
      CALL astm403_input("a")
      
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
         INITIALIZE g_stfn_m.* TO NULL
         INITIALIZE g_stfo_d TO NULL
         INITIALIZE g_stfo2_d TO NULL
         INITIALIZE g_stfo3_d TO NULL
         INITIALIZE g_stfo4_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astm403_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stfo_d.clear()
      #CALL g_stfo2_d.clear()
      #CALL g_stfo3_d.clear()
      #CALL g_stfo4_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm403_set_act_visible()   
   CALL astm403_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stfn001_t = g_stfn_m.stfn001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stfnent = " ||g_enterprise|| " AND",
                      " stfn001 = '", g_stfn_m.stfn001, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm403_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astm403_cl
   
   CALL astm403_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
   
   #遮罩相關處理
   LET g_stfn_m_mask_o.* =  g_stfn_m.*
   CALL astm403_stfn_t_mask()
   LET g_stfn_m_mask_n.* =  g_stfn_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc, 
       g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004,g_stfn_m.stfn004_desc,g_stfn_m.stfn005,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006,g_stfn_m.stfn006_desc,g_stfn_m.stfn007,g_stfn_m.stfn007_desc,g_stfn_m.stfn003, 
       g_stfn_m.stfn003_desc,g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid, 
       g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp,g_stfn_m.stfnowndp_desc,g_stfn_m.stfncrtid,g_stfn_m.stfncrtid_desc, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmodid_desc, 
       g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfid_desc,g_stfn_m.stfncnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stfn_m.stfnownid      
   LET g_data_dept  = g_stfn_m.stfnowndp
   
   #功能已完成,通報訊息中心
   CALL astm403_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.modify" >}
#+ 資料修改
PRIVATE FUNCTION astm403_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
   DEFINE l_wc2_table3   STRING
 
   DEFINE l_wc2_table4   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stfn_m_t.* = g_stfn_m.*
   LET g_stfn_m_o.* = g_stfn_m.*
   
   IF g_stfn_m.stfn001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stfn001_t = g_stfn_m.stfn001
 
   CALL s_transaction_begin()
   
   OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm403_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
   #檢查是否允許此動作
   IF NOT astm403_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stfn_m_mask_o.* =  g_stfn_m.*
   CALL astm403_stfn_t_mask()
   LET g_stfn_m_mask_n.* =  g_stfn_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
   #LET l_wc2_table3 = g_wc2_table3
   #LET l_wc2_table3 = " 1=1"
 
   #LET l_wc2_table4 = g_wc2_table4
   #LET l_wc2_table4 = " 1=1"
 
 
 
   
   CALL astm403_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
   #LET  g_wc2_table3 = l_wc2_table3 
 
   #LET  g_wc2_table4 = l_wc2_table4 
 
 
 
    
   WHILE TRUE
      LET g_stfn001_t = g_stfn_m.stfn001
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stfn_m.stfnmodid = g_user 
LET g_stfn_m.stfnmoddt = cl_get_current()
LET g_stfn_m.stfnmodid_desc = cl_get_username(g_stfn_m.stfnmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astm403_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stfn_t SET (stfnmodid,stfnmoddt) = (g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt)
          WHERE stfnent = g_enterprise AND stfn001 = g_stfn001_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stfn_m.* = g_stfn_m_t.*
            CALL astm403_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stfn_m.stfn001 != g_stfn_m_t.stfn001
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stfo_t SET stfo001 = g_stfn_m.stfn001
 
          WHERE stfoent = g_enterprise AND stfo001 = g_stfn_m_t.stfn001
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stfo_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
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
         
         UPDATE stfp_t
            SET stfp001 = g_stfn_m.stfn001
 
          WHERE stfpent = g_enterprise AND
                stfp001 = g_stfn001_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stfp_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
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
         
         UPDATE stfr_t
            SET stfr001 = g_stfn_m.stfn001
 
          WHERE stfrent = g_enterprise AND
                stfr001 = g_stfn001_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update3"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stfr_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update3"
         
         #end add-point
 
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update4"
         
         #end add-point
         
         UPDATE stfs_t
            SET stfs001 = g_stfn_m.stfn001
 
          WHERE stfsent = g_enterprise AND
                stfs001 = g_stfn001_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update4"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stfs_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update4"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astm403_set_act_visible()   
   CALL astm403_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stfnent = " ||g_enterprise|| " AND",
                      " stfn001 = '", g_stfn_m.stfn001, "' "
 
   #填到對應位置
   CALL astm403_browser_fill("")
 
   CLOSE astm403_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm403_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astm403.input" >}
#+ 資料輸入
PRIVATE FUNCTION astm403_input(p_cmd)
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
   DEFINE  r_str           STRING
   DEFINE  r_errno         LIKE type_t.chr50
   DEFINE  r_ooia002       LIKE ooia_t.ooia002
   DEFINE  r_no            LIKE type_t.chr10
   DEFINE  l_success       LIKE type_t.num5
   DEFINE l_errno          LIKE type_t.chr50
   DEFINE l_where          STRING
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
   DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc, 
       g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004,g_stfn_m.stfn004_desc,g_stfn_m.stfn005,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006,g_stfn_m.stfn006_desc,g_stfn_m.stfn007,g_stfn_m.stfn007_desc,g_stfn_m.stfn003, 
       g_stfn_m.stfn003_desc,g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid, 
       g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp,g_stfn_m.stfnowndp_desc,g_stfn_m.stfncrtid,g_stfn_m.stfncrtid_desc, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmodid_desc, 
       g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfid_desc,g_stfn_m.stfncnfdt
   
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
   LET g_forupd_sql = "SELECT stfoseq,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006,stfo007, 
       stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015,stfo016,stfo017, 
       stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit FROM stfo_t WHERE stfoent=? AND stfo001=?  
       AND stfoseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm403_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stfpsite,stfpunit,stfpseq,stfp002,stfp021,stfp020,stfp003,stfp004,stfp018, 
       stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012,stfp013,stfp014,stfpacti, 
       stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025,stfp026 FROM stfp_t WHERE stfpent=? AND  
       stfp001=? AND stfpseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm403_bcl2 CURSOR FROM g_forupd_sql
 
   #add-point:input段define_sql name="input.define_sql3"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stfrsite,stfrunit,stfracti,stfrseq,stfr003,stfr002,stfr004,stfr005,stfr006, 
       stfr007,stfr008,stfr009 FROM stfr_t WHERE stfrent=? AND stfr001=? AND stfrseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql3"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm403_bcl3 CURSOR FROM g_forupd_sql
 
   #add-point:input段define_sql name="input.define_sql4"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stfssite,stfsunit,stfs002,stfsstus FROM stfs_t WHERE stfsent=? AND stfs001=?  
       AND stfs002=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql4"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astm403_bcl4 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astm403_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astm403_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004, 
       g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002,g_stfn_m.stfn008, 
       g_stfn_m.stfn009,g_stfn_m.stfnstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astm403.input.head" >}
      #單頭段
      INPUT BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004, 
          g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002,g_stfn_m.stfn008, 
          g_stfn_m.stfn009,g_stfn_m.stfnstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION update_item
            LET g_action_choice="update_item"
            IF cl_auth_chk_act("update_item") THEN
               
               #add-point:ON ACTION update_item name="input.master_input.update_item"
#               IF NOT cl_null(g_stfn_m.stfn001) THEN
#                  CALL n_stfnl(g_stfn_m.stfn001)
#                  INITIALIZE g_ref_fields TO NULL
#                  LET g_ref_fields[1] = g_stfn_m.stfn001
#                  CALL ap_ref_array2(g_ref_fields," SELECT stfnl003 FROM stfnl_t WHERE stfnl001 = ? AND stfnl002 = '"||g_lang||"'","") RETURNING g_rtn_fields
#                  LET g_stfn_m.stfnl003 = g_rtn_fields[1]
#                  DISPLAY BY NAME g_stfn_m.stfnl003
#               END IF
               #add by geza 20170203 #170202-00016#1(S)
               IF NOT cl_null(g_stfn_m.stfn001) THEN
                  CALL n_stfnl(g_stfn_m.stfn001)
                  INITIALIZE g_ref_fields TO NULL
                  LET g_ref_fields[1] = g_stfn_m.stfn001
                  CALL ap_ref_array2(g_ref_fields," SELECT stfnl003 FROM stfnl_t WHERE stfnl001 = ? AND stfnl002 = '"||g_lang||"'","") RETURNING g_rtn_fields
                  LET g_stfn_m.stfnl003 = g_rtn_fields[1]
                  DISPLAY BY NAME g_stfn_m.stfnl003
               END IF
               #add by geza 20170203 #170202-00016#1(E)
               #END add-point
            END IF
 
 
 
 
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm403_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            LET g_master_multi_table_t.stfnl001 = g_stfn_m.stfn001
LET g_master_multi_table_t.stfnl003 = g_stfn_m.stfnl003
 
            IF l_cmd_t = 'r' THEN
               LET g_master_multi_table_t.stfnl001 = ''
LET g_master_multi_table_t.stfnl003 = ''
 
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astm403_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astm403_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnsite
            
            #add-point:AFTER FIELD stfnsite name="input.a.stfnsite"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfnsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfnsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfnsite_desc
            
            #161024-00025#12---add---begin-------------
            IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stfn_m.stfnsite != g_stfn_m_t.stfnsite OR g_stfn_m_t.stfnsite IS null)) THEN
               CALL s_aooi500_chk(g_prog,'stfnsite',g_stfn_m.stfnsite,g_stfn_m.stfnsite)
                 RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stfn_m.stfnsite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stfn_m.stfnsite = g_stfn_m_t.stfnsite
                  DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc
                  NEXT FIELD CURRENT
               ELSE
                  LET g_ins_site_flag = 'Y'  
                  
               END IF
            END IF   
            CALL astm403_set_entry(p_cmd)      
            CALL astm403_set_no_entry(p_cmd)   
            #161024-00025#12---add---end-------------
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnsite
            #add-point:BEFORE FIELD stfnsite name="input.b.stfnsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfnsite
            #add-point:ON CHANGE stfnsite name="input.g.stfnsite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnunit
            
            #add-point:AFTER FIELD stfnunit name="input.a.stfnunit"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfnunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfnunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfnunit_desc
            #161024-00025#12---add---begin-------------
            IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stfn_m.stfnunit != g_stfn_m_t.stfnunit OR g_stfn_m_t.stfnunit IS null)) THEN
               CALL s_aooi500_chk(g_prog,'stfnunit',g_stfn_m.stfnunit,g_stfn_m.stfnsite)
                 RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stfn_m.stfnunit
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_stfn_m.stfnunit = g_stfn_m_t.stfnunit
                  DISPLAY BY NAME g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc
                  NEXT FIELD CURRENT
               ELSE
                  LET g_ins_site_flag = 'Y'  
                  
               END IF
            END IF   
            CALL astm403_set_entry(p_cmd)      
            CALL astm403_set_no_entry(p_cmd)   
            #161024-00025#12---add---end-------------

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnunit
            #add-point:BEFORE FIELD stfnunit name="input.b.stfnunit"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfnunit
            #add-point:ON CHANGE stfnunit name="input.g.stfnunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn001
            #add-point:BEFORE FIELD stfn001 name="input.b.stfn001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn001
            
            #add-point:AFTER FIELD stfn001 name="input.a.stfn001"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_stfn_m.stfn001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stfn_m.stfn001 != g_stfn001_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfn_t WHERE "||"stfnent = '" ||g_enterprise|| "' AND "||"stfn001 = '"||g_stfn_m.stfn001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn001
            #add-point:ON CHANGE stfn001 name="input.g.stfn001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnl003
            #add-point:BEFORE FIELD stfnl003 name="input.b.stfnl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnl003
            
            #add-point:AFTER FIELD stfnl003 name="input.a.stfnl003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfnl003
            #add-point:ON CHANGE stfnl003 name="input.g.stfnl003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn004
            
            #add-point:AFTER FIELD stfn004 name="input.a.stfn004"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfn004
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfn004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfn004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn004
            #add-point:BEFORE FIELD stfn004 name="input.b.stfn004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn004
            #add-point:ON CHANGE stfn004 name="input.g.stfn004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn005
            
            #add-point:AFTER FIELD stfn005 name="input.a.stfn005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfn005
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfn005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfn005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn005
            #add-point:BEFORE FIELD stfn005 name="input.b.stfn005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn005
            #add-point:ON CHANGE stfn005 name="input.g.stfn005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn006
            
            #add-point:AFTER FIELD stfn006 name="input.a.stfn006"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfn006
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfn006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfn006_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn006
            #add-point:BEFORE FIELD stfn006 name="input.b.stfn006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn006
            #add-point:ON CHANGE stfn006 name="input.g.stfn006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn007
            
            #add-point:AFTER FIELD stfn007 name="input.a.stfn007"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfn007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2127' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfn007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfn007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn007
            #add-point:BEFORE FIELD stfn007 name="input.b.stfn007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn007
            #add-point:ON CHANGE stfn007 name="input.g.stfn007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn003
            
            #add-point:AFTER FIELD stfn003 name="input.a.stfn003"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfn_m.stfn003
            CALL ap_ref_array2(g_ref_fields,"SELECT ooibl004 FROM ooibl_t WHERE ooiblent='"||g_enterprise||"' AND ooibl002=? AND ooibl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfn_m.stfn003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfn_m.stfn003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn003
            #add-point:BEFORE FIELD stfn003 name="input.b.stfn003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn003
            #add-point:ON CHANGE stfn003 name="input.g.stfn003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn002
            #add-point:BEFORE FIELD stfn002 name="input.b.stfn002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn002
            
            #add-point:AFTER FIELD stfn002 name="input.a.stfn002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn002
            #add-point:ON CHANGE stfn002 name="input.g.stfn002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn008
            #add-point:BEFORE FIELD stfn008 name="input.b.stfn008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn008
            
            #add-point:AFTER FIELD stfn008 name="input.a.stfn008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn008
            #add-point:ON CHANGE stfn008 name="input.g.stfn008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfn009
            #add-point:BEFORE FIELD stfn009 name="input.b.stfn009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfn009
            
            #add-point:AFTER FIELD stfn009 name="input.a.stfn009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfn009
            #add-point:ON CHANGE stfn009 name="input.g.stfn009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfnstus
            #add-point:BEFORE FIELD stfnstus name="input.b.stfnstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfnstus
            
            #add-point:AFTER FIELD stfnstus name="input.a.stfnstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfnstus
            #add-point:ON CHANGE stfnstus name="input.g.stfnstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stfnsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnsite
            #add-point:ON ACTION controlp INFIELD stfnsite name="input.c.stfnsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfnsite             #給予default值

            #給予arg
#            CALL s_aooi500_q_where(g_prog,'steasite',g_stea_m.steasite,'i') RETURNING l_where
#            LET g_qryparam.where = l_where

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfnsite',g_site,'i') #161024-00025#12--add
            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stfn_m.stfnsite = g_qryparam.return1              

            DISPLAY g_stfn_m.stfnsite TO stfnsite              #
            CALL astm403_stfnsite_ref()
            NEXT FIELD stfnsite  
            #END add-point
 
 
         #Ctrlp:input.c.stfnunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnunit
            #add-point:ON ACTION controlp INFIELD stfnunit name="input.c.stfnunit"
            #161024-00025#12--add---begin--------------
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfnunit',g_site,'i') 
            CALL q_ooef001_24()                                #呼叫開窗          
            DISPLAY g_qryparam.return1 TO stfnunit  #顯示到畫面上
            NEXT FIELD stfnunit                     #返回原欄位 
            #161024-00025#12--add---end--------------            
            #END add-point
 
 
         #Ctrlp:input.c.stfn001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn001
            #add-point:ON ACTION controlp INFIELD stfn001 name="input.c.stfn001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfnl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnl003
            #add-point:ON ACTION controlp INFIELD stfnl003 name="input.c.stfnl003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfn004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn004
            #add-point:ON ACTION controlp INFIELD stfn004 name="input.c.stfn004"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfn004             #給予default值
            LET g_qryparam.default2 = "" #g_stfn_m.staal003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL q_staa001()                                #呼叫開窗

            LET g_stfn_m.stfn004 = g_qryparam.return1              
            #LET g_stfn_m.staal003 = g_qryparam.return2 
            DISPLAY g_stfn_m.stfn004 TO stfn004              #
            CALL astm403_stfn004_ref()
            #DISPLAY g_stfn_m.staal003 TO staal003 #說明
            NEXT FIELD stfn004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stfn005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn005
            #add-point:ON ACTION controlp INFIELD stfn005 name="input.c.stfn005"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfn005             #給予default值
            LET g_qryparam.default2 = "" #g_stfn_m.oocql004 #說明
            #給予arg
            LET g_qryparam.arg1 = "2060" #s


            CALL q_oocq002()                                #呼叫開窗

            LET g_stfn_m.stfn005 = g_qryparam.return1              
            #LET g_stfn_m.oocql004 = g_qryparam.return2 
            DISPLAY g_stfn_m.stfn005 TO stfn005              #
            CALL astm403_stfn005_ref()
            #DISPLAY g_stfn_m.oocql004 TO oocql004 #說明
            NEXT FIELD stfn005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stfn006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn006
            #add-point:ON ACTION controlp INFIELD stfn006 name="input.c.stfn006"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfn006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_aooi001_1()                                #呼叫開窗

            LET g_stfn_m.stfn006 = g_qryparam.return1              

            DISPLAY g_stfn_m.stfn006 TO stfn006              #
            CALL astm403_stfn006_ref()

            NEXT FIELD stfn006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stfn007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn007
            #add-point:ON ACTION controlp INFIELD stfn007 name="input.c.stfn007"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfn007             #給予default值
            LET g_qryparam.default2 = "" #g_stfn_m.oocql004 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_oocq002_2127()                                #呼叫開窗

            LET g_stfn_m.stfn007 = g_qryparam.return1              
            #LET g_stfn_m.oocql004 = g_qryparam.return2 
            DISPLAY g_stfn_m.stfn007 TO stfn007              #
            CALL astm403_stfn007_ref()
            #DISPLAY g_stfn_m.oocql004 TO oocql004 #說明
            NEXT FIELD stfn007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stfn003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn003
            #add-point:ON ACTION controlp INFIELD stfn003 name="input.c.stfn003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfn_m.stfn003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_ooib002_1()                                #呼叫開窗

            LET g_stfn_m.stfn003 = g_qryparam.return1              

            DISPLAY g_stfn_m.stfn003 TO stea035              #
            CALL astm403_stfn003_ref()
            NEXT FIELD stfn003                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stfn002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn002
            #add-point:ON ACTION controlp INFIELD stfn002 name="input.c.stfn002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfn008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn008
            #add-point:ON ACTION controlp INFIELD stfn008 name="input.c.stfn008"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfn009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfn009
            #add-point:ON ACTION controlp INFIELD stfn009 name="input.c.stfn009"
            
            #END add-point
 
 
         #Ctrlp:input.c.stfnstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfnstus
            #add-point:ON ACTION controlp INFIELD stfnstus name="input.c.stfnstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stfn_m.stfn001
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               
               #end add-point
               
               INSERT INTO stfn_t (stfnent,stfnsite,stfnunit,stfn001,stfn004,stfn005,stfn006,stfn007, 
                   stfn003,stfn002,stfn008,stfn009,stfnstus,stfnownid,stfnowndp,stfncrtid,stfncrtdp, 
                   stfncrtdt,stfnmodid,stfnmoddt,stfncnfid,stfncnfdt)
               VALUES (g_enterprise,g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001,g_stfn_m.stfn004, 
                   g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
                   g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp, 
                   g_stfn_m.stfncrtid,g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt, 
                   g_stfn_m.stfncnfid,g_stfn_m.stfncnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stfn_m:",SQLERRMESSAGE 
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
         IF g_stfn_m.stfn001 = g_master_multi_table_t.stfnl001 AND
         g_stfn_m.stfnl003 = g_master_multi_table_t.stfnl003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'stfnlent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stfn_m.stfn001
            LET l_field_keys[02] = 'stfnl001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stfnl001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'stfnl002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stfn_m.stfnl003
            LET l_fields[01] = 'stfnl003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'stfnl_t')
         END IF 
 
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astm403_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astm403_b_fill()
                  CALL astm403_b_fill2('0')
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
               CALL astm403_stfn_t_mask_restore('restore_mask_o')
               
               UPDATE stfn_t SET (stfnsite,stfnunit,stfn001,stfn004,stfn005,stfn006,stfn007,stfn003, 
                   stfn002,stfn008,stfn009,stfnstus,stfnownid,stfnowndp,stfncrtid,stfncrtdp,stfncrtdt, 
                   stfnmodid,stfnmoddt,stfncnfid,stfncnfdt) = (g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
                   g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003, 
                   g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid, 
                   g_stfn_m.stfnowndp,g_stfn_m.stfncrtid,g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid, 
                   g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfdt)
                WHERE stfnent = g_enterprise AND stfn001 = g_stfn001_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stfn_t:",SQLERRMESSAGE 
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
         IF g_stfn_m.stfn001 = g_master_multi_table_t.stfnl001 AND
         g_stfn_m.stfnl003 = g_master_multi_table_t.stfnl003  THEN
         ELSE 
            LET l_var_keys[01] = g_enterprise
            LET l_field_keys[01] = 'stfnlent'
            LET l_var_keys_bak[01] = g_enterprise
            LET l_var_keys[02] = g_stfn_m.stfn001
            LET l_field_keys[02] = 'stfnl001'
            LET l_var_keys_bak[02] = g_master_multi_table_t.stfnl001
            LET l_var_keys[03] = g_dlang
            LET l_field_keys[03] = 'stfnl002'
            LET l_var_keys_bak[03] = g_dlang
            LET l_vars[01] = g_stfn_m.stfnl003
            LET l_fields[01] = 'stfnl003'
            CALL cl_multitable(l_var_keys,l_field_keys,l_vars,l_fields,l_var_keys_bak,'stfnl_t')
         END IF 
 
               
               #將遮罩欄位進行遮蔽
               CALL astm403_stfn_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stfn_m_t)
               LET g_log2 = util.JSON.stringify(g_stfn_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stfn001_t = g_stfn_m.stfn001
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astm403.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stfo_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            LET g_field = 'stfo'
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stfo_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm403_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stfo_d.getLength()
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
            OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm403_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stfo_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stfo_d[l_ac].stfoseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stfo_d_t.* = g_stfo_d[l_ac].*  #BACKUP
               LET g_stfo_d_o.* = g_stfo_d[l_ac].*  #BACKUP
               CALL astm403_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astm403_set_no_entry_b(l_cmd)
               IF NOT astm403_lock_b("stfo_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm403_bcl INTO g_stfo_d[l_ac].stfoseq,g_stfo_d[l_ac].stfo002,g_stfo_d[l_ac].stfo018, 
                      g_stfo_d[l_ac].stfo019,g_stfo_d[l_ac].stfo003,g_stfo_d[l_ac].stfo004,g_stfo_d[l_ac].stfo005, 
                      g_stfo_d[l_ac].stfo006,g_stfo_d[l_ac].stfo007,g_stfo_d[l_ac].stfo020,g_stfo_d[l_ac].stfo008, 
                      g_stfo_d[l_ac].stfo009,g_stfo_d[l_ac].stfo010,g_stfo_d[l_ac].stfo011,g_stfo_d[l_ac].stfo012, 
                      g_stfo_d[l_ac].stfo013,g_stfo_d[l_ac].stfo014,g_stfo_d[l_ac].stfo026,g_stfo_d[l_ac].stfo015, 
                      g_stfo_d[l_ac].stfo016,g_stfo_d[l_ac].stfo017,g_stfo_d[l_ac].stfo021,g_stfo_d[l_ac].stfo022, 
                      g_stfo_d[l_ac].stfo023,g_stfo_d[l_ac].stfo024,g_stfo_d[l_ac].stfo025,g_stfo_d[l_ac].stfosite, 
                      g_stfo_d[l_ac].stfounit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stfo_d_t.stfoseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stfo_d_mask_o[l_ac].* =  g_stfo_d[l_ac].*
                  CALL astm403_stfo_t_mask()
                  LET g_stfo_d_mask_n[l_ac].* =  g_stfo_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm403_show()
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
            INITIALIZE g_stfo_d[l_ac].* TO NULL 
            INITIALIZE g_stfo_d_t.* TO NULL 
            INITIALIZE g_stfo_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stfo_d[l_ac].stfo018 = "N"
      LET g_stfo_d[l_ac].stfo019 = "N"
      LET g_stfo_d[l_ac].stfo020 = "Y"
      LET g_stfo_d[l_ac].stfo010 = "0"
      LET g_stfo_d[l_ac].stfo026 = "Y"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT MAX(stfoseq)+1 INTO  g_stfo_d[l_ac].stfoseq FROM stfo_t
             WHERE stfoent = g_enterprise AND stfo001 = g_stfn_m.stfn001
            IF cl_null( g_stfo_d[l_ac].stfoseq ) THEN             
               LET g_stfo_d[l_ac].stfoseq = 1
            END IF
            LET g_stfo_d[l_ac].stfo012=100
            LET g_stfo_d[l_ac].stfounit=g_stfn_m.stfnunit
            LET g_stfo_d[l_ac].stfosite=g_stfn_m.stfnsite
            #end add-point
            LET g_stfo_d_t.* = g_stfo_d[l_ac].*     #新輸入資料
            LET g_stfo_d_o.* = g_stfo_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm403_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astm403_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stfo_d[li_reproduce_target].* = g_stfo_d[li_reproduce].*
 
               LET g_stfo_d[li_reproduce_target].stfoseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stfo_t 
             WHERE stfoent = g_enterprise AND stfo001 = g_stfn_m.stfn001
 
               AND stfoseq = g_stfo_d[l_ac].stfoseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys[2] = g_stfo_d[g_detail_idx].stfoseq
               CALL astm403_insert_b('stfo_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stfo_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm403_b_fill()
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
               LET gs_keys[01] = g_stfn_m.stfn001
 
               LET gs_keys[gs_keys.getLength()+1] = g_stfo_d_t.stfoseq
 
            
               #刪除同層單身
               IF NOT astm403_delete_b('stfo_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm403_key_delete_b(gs_keys,'stfo_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astm403_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stfo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stfo_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfoseq
            #add-point:BEFORE FIELD stfoseq name="input.b.page1.stfoseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfoseq
            
            #add-point:AFTER FIELD stfoseq name="input.a.page1.stfoseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stfn_m.stfn001 IS NOT NULL AND g_stfo_d[g_detail_idx].stfoseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stfn_m.stfn001 != g_stfn001_t OR g_stfo_d[g_detail_idx].stfoseq != g_stfo_d_t.stfoseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfo_t WHERE "||"stfoent = '" ||g_enterprise|| "' AND "||"stfo001 = '"||g_stfn_m.stfn001 ||"' AND "|| "stfoseq = '"||g_stfo_d[g_detail_idx].stfoseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfoseq
            #add-point:ON CHANGE stfoseq name="input.g.page1.stfoseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo002
            
            #add-point:AFTER FIELD stfo002 name="input.a.page1.stfo002"
            LET g_stfo_d[l_ac].stfo002_desc = ''
            DISPLAY BY NAME g_stfo_d[l_ac].stfo002_desc           
            IF NOT cl_null(g_stfo_d[l_ac].stfo002) THEN
               IF NOT astm403_stfo002_chk(g_stfo_d[l_ac].stfo002) THEN
                  LET g_stfo_d[l_ac].stfo002 = g_stfo_d_t.stfo002
                  CALL astm403_stfo002_ref()
                  SELECT stae006 INTO g_stfo_d[l_ac].stfo004
                    FROM stae_t 
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo_d[l_ac].stfo002
                  DISPLAY BY NAME g_stfo_d[l_ac].stfo004 
                  NEXT FIELD stfo002
               END IF
               
               IF (g_stfo_d[l_ac].stfo002 <> g_stfo_d_o.stfo002 AND 
                   NOT cl_null(g_stfo_d_o.stfo002)) OR (l_cmd = 'a' AND cl_null(g_stfo_d_o.stfo002)) THEN
                 
                  SELECT stae006 INTO g_stfo_d[l_ac].stfo004
                    FROM stae_t 
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo_d[l_ac].stfo002
                  CALL astm403_stfo002_ref()
                  DISPLAY BY NAME g_stfo_d[l_ac].stfo002_desc,g_stfo_d[l_ac].stfo004
                  IF g_stfo_d[l_ac].stfo004 = '3' THEN
                     LET g_stfo_d[l_ac].stfo004 = ''
                  END IF                    
                 #費用合約設定asti204
                 CALL astm403_default('4',g_stfo_d[l_ac].stfo002)
               END IF    
               CALL astm403_stfo002_ref()
            ELSE
               LET g_stfo_d[l_ac].stfo002_desc = ''
               LET g_stfo_d[l_ac].stfo004 = ''
            END IF
            
            LET g_stfo_d_o.stfo002 = g_stfo_d[l_ac].stfo002
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo002
            #add-point:BEFORE FIELD stfo002 name="input.b.page1.stfo002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo002
            #add-point:ON CHANGE stfo002 name="input.g.page1.stfo002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo018
            #add-point:BEFORE FIELD stfo018 name="input.b.page1.stfo018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo018
            
            #add-point:AFTER FIELD stfo018 name="input.a.page1.stfo018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo018
            #add-point:ON CHANGE stfo018 name="input.g.page1.stfo018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo019
            #add-point:BEFORE FIELD stfo019 name="input.b.page1.stfo019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo019
            
            #add-point:AFTER FIELD stfo019 name="input.a.page1.stfo019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo019
            #add-point:ON CHANGE stfo019 name="input.g.page1.stfo019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo003
            #add-point:BEFORE FIELD stfo003 name="input.b.page1.stfo003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo003
            
            #add-point:AFTER FIELD stfo003 name="input.a.page1.stfo003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo003
            #add-point:ON CHANGE stfo003 name="input.g.page1.stfo003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo004
            #add-point:BEFORE FIELD stfo004 name="input.b.page1.stfo004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo004
            
            #add-point:AFTER FIELD stfo004 name="input.a.page1.stfo004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo004
            #add-point:ON CHANGE stfo004 name="input.g.page1.stfo004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo005
            #add-point:BEFORE FIELD stfo005 name="input.b.page1.stfo005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo005
            
            #add-point:AFTER FIELD stfo005 name="input.a.page1.stfo005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo005
            #add-point:ON CHANGE stfo005 name="input.g.page1.stfo005"
            CALL astm403_set_entry_b(p_cmd)
            CALL astm403_set_no_required_b()
            CALL astm403_set_required_b()
            CALL astm403_set_no_entry_b(p_cmd)
            IF g_stfo_d[l_ac].stfo005 = '1' THEN 
                LET g_stfo_d[l_ac].stfo007 = '2'
             END IF 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo006
            #add-point:BEFORE FIELD stfo006 name="input.b.page1.stfo006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo006
            
            #add-point:AFTER FIELD stfo006 name="input.a.page1.stfo006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo006
            #add-point:ON CHANGE stfo006 name="input.g.page1.stfo006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo007
            #add-point:BEFORE FIELD stfo007 name="input.b.page1.stfo007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo007
            
            #add-point:AFTER FIELD stfo007 name="input.a.page1.stfo007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo007
            #add-point:ON CHANGE stfo007 name="input.g.page1.stfo007"
            IF g_stfo_d[l_ac].stfo005 = '1' AND g_stfo_d[l_ac].stfo007 != '2' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "" 
               LET g_errparam.code   = 'ast-00464'
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET g_stfo_d[l_ac].stfo007 = g_stfo_d_t.stfo007
               NEXT FIELD stfo007
            END IF 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo020
            #add-point:BEFORE FIELD stfo020 name="input.b.page1.stfo020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo020
            
            #add-point:AFTER FIELD stfo020 name="input.a.page1.stfo020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo020
            #add-point:ON CHANGE stfo020 name="input.g.page1.stfo020"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo008
            
            #add-point:AFTER FIELD stfo008 name="input.a.page1.stfo008"
            LET g_stfo_d[l_ac].stfo008_desc = ''
            IF NOT cl_null(g_stfo_d[l_ac].stfo008) THEN
               IF NOT astm403_stfo008_chk(g_stfo_d[l_ac].stfo008) THEN
                  LET g_stfo_d[l_ac].stfo008 = g_stfo_d_t.stfo008
                  CALL astm403_stfo008_ref()
                  NEXT FIELD stfo008
               END IF
            END IF
            CALL astm403_stfo008_ref()
        
            
           


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo008
            #add-point:BEFORE FIELD stfo008 name="input.b.page1.stfo008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo008
            #add-point:ON CHANGE stfo008 name="input.g.page1.stfo008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo009
            
            #add-point:AFTER FIELD stfo009 name="input.a.page1.stfo009"
            LET g_stfo_d[l_ac].stfo009_desc = ''
            IF NOT cl_null(g_stfo_d[l_ac].stfo009) THEN
               IF NOT astm403_stfo008_chk(g_stfo_d[l_ac].stfo009) THEN
                  LET g_stfo_d[l_ac].stfo009 = g_stfo_d_t.stfo009
                  CALL astm403_stfo009_ref()
                  NEXT FIELD stfo009
               END IF
            END IF
            CALL astm403_stfo009_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo009
            #add-point:BEFORE FIELD stfo009 name="input.b.page1.stfo009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo009
            #add-point:ON CHANGE stfo009 name="input.g.page1.stfo009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo010
            #add-point:BEFORE FIELD stfo010 name="input.b.page1.stfo010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo010
            
            #add-point:AFTER FIELD stfo010 name="input.a.page1.stfo010"
            IF NOT cl_null(g_stfo_d[l_ac].stfo010) THEN
               IF g_stfo_d[l_ac].stfo010 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stfo_d[l_ac].stfo010 = g_stfo_d_t.stfo010
                  NEXT FIELD stfo010
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo010
            #add-point:ON CHANGE stfo010 name="input.g.page1.stfo010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo011
            #add-point:BEFORE FIELD stfo011 name="input.b.page1.stfo011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo011
            
            #add-point:AFTER FIELD stfo011 name="input.a.page1.stfo011"
            IF NOT cl_null( g_stfo_d[l_ac].stfo011) THEN
               IF g_stfo_d[l_ac].stfo011 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stfo_d[l_ac].stfo011 = g_stfo_d_t.stfo011
                  NEXT FIELD stfo011
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo011
            #add-point:ON CHANGE stfo011 name="input.g.page1.stfo011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo012
            #add-point:BEFORE FIELD stfo012 name="input.b.page1.stfo012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo012
            
            #add-point:AFTER FIELD stfo012 name="input.a.page1.stfo012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo012
            #add-point:ON CHANGE stfo012 name="input.g.page1.stfo012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo013
            #add-point:BEFORE FIELD stfo013 name="input.b.page1.stfo013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo013
            
            #add-point:AFTER FIELD stfo013 name="input.a.page1.stfo013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo013
            #add-point:ON CHANGE stfo013 name="input.g.page1.stfo013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo014
            #add-point:BEFORE FIELD stfo014 name="input.b.page1.stfo014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo014
            
            #add-point:AFTER FIELD stfo014 name="input.a.page1.stfo014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo014
            #add-point:ON CHANGE stfo014 name="input.g.page1.stfo014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo026
            #add-point:BEFORE FIELD stfo026 name="input.b.page1.stfo026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo026
            
            #add-point:AFTER FIELD stfo026 name="input.a.page1.stfo026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo026
            #add-point:ON CHANGE stfo026 name="input.g.page1.stfo026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo015
            #add-point:BEFORE FIELD stfo015 name="input.b.page1.stfo015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo015
            
            #add-point:AFTER FIELD stfo015 name="input.a.page1.stfo015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo015
            #add-point:ON CHANGE stfo015 name="input.g.page1.stfo015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo016
            #add-point:BEFORE FIELD stfo016 name="input.b.page1.stfo016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo016
            
            #add-point:AFTER FIELD stfo016 name="input.a.page1.stfo016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo016
            #add-point:ON CHANGE stfo016 name="input.g.page1.stfo016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo017
            #add-point:BEFORE FIELD stfo017 name="input.b.page1.stfo017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo017
            
            #add-point:AFTER FIELD stfo017 name="input.a.page1.stfo017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo017
            #add-point:ON CHANGE stfo017 name="input.g.page1.stfo017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo021
            #add-point:BEFORE FIELD stfo021 name="input.b.page1.stfo021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo021
            
            #add-point:AFTER FIELD stfo021 name="input.a.page1.stfo021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo021
            #add-point:ON CHANGE stfo021 name="input.g.page1.stfo021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo022
            #add-point:BEFORE FIELD stfo022 name="input.b.page1.stfo022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo022
            
            #add-point:AFTER FIELD stfo022 name="input.a.page1.stfo022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo022
            #add-point:ON CHANGE stfo022 name="input.g.page1.stfo022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo023
            #add-point:BEFORE FIELD stfo023 name="input.b.page1.stfo023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo023
            
            #add-point:AFTER FIELD stfo023 name="input.a.page1.stfo023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo023
            #add-point:ON CHANGE stfo023 name="input.g.page1.stfo023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo024
            #add-point:BEFORE FIELD stfo024 name="input.b.page1.stfo024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo024
            
            #add-point:AFTER FIELD stfo024 name="input.a.page1.stfo024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo024
            #add-point:ON CHANGE stfo024 name="input.g.page1.stfo024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfo025
            #add-point:BEFORE FIELD stfo025 name="input.b.page1.stfo025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfo025
            
            #add-point:AFTER FIELD stfo025 name="input.a.page1.stfo025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfo025
            #add-point:ON CHANGE stfo025 name="input.g.page1.stfo025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfosite
            #add-point:BEFORE FIELD stfosite name="input.b.page1.stfosite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfosite
            
            #add-point:AFTER FIELD stfosite name="input.a.page1.stfosite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfosite
            #add-point:ON CHANGE stfosite name="input.g.page1.stfosite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfounit
            #add-point:BEFORE FIELD stfounit name="input.b.page1.stfounit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfounit
            
            #add-point:AFTER FIELD stfounit name="input.a.page1.stfounit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfounit
            #add-point:ON CHANGE stfounit name="input.g.page1.stfounit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stfoseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfoseq
            #add-point:ON ACTION controlp INFIELD stfoseq name="input.c.page1.stfoseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo002
            #add-point:ON ACTION controlp INFIELD stfo002 name="input.c.page1.stfo002"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo_d[l_ac].stfo002             #給予default值
            LET g_qryparam.default2 = "" #g_steb_d[l_ac].stae001 #費用編號
            LET g_qryparam.default3 = "" #g_steb_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stae001()                                #呼叫開窗

            LET g_stfo_d[l_ac].stfo002 = g_qryparam.return1              
            #LET g_steb_d[l_ac].stae001 = g_qryparam.return2 
            #LET g_steb_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stfo_d[l_ac].stfo002 TO stfo002              #
            CALL astm403_stfo002_ref()
            #DISPLAY g_steb_d[l_ac].stae001 TO stae001 #費用編號
            #DISPLAY g_steb_d[l_ac].stael003 TO stael003 #說明
            NEXT FIELD stfo002 
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo018
            #add-point:ON ACTION controlp INFIELD stfo018 name="input.c.page1.stfo018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo019
            #add-point:ON ACTION controlp INFIELD stfo019 name="input.c.page1.stfo019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo003
            #add-point:ON ACTION controlp INFIELD stfo003 name="input.c.page1.stfo003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo004
            #add-point:ON ACTION controlp INFIELD stfo004 name="input.c.page1.stfo004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo005
            #add-point:ON ACTION controlp INFIELD stfo005 name="input.c.page1.stfo005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo006
            #add-point:ON ACTION controlp INFIELD stfo006 name="input.c.page1.stfo006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo007
            #add-point:ON ACTION controlp INFIELD stfo007 name="input.c.page1.stfo007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo020
            #add-point:ON ACTION controlp INFIELD stfo020 name="input.c.page1.stfo020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo008
            #add-point:ON ACTION controlp INFIELD stfo008 name="input.c.page1.stfo008"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo_d[l_ac].stfo008             #給予default值
            LET g_qryparam.default2 = "" #g_stfo_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stfo_d[l_ac].stabl004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "4" #s
            LET g_qryparam.arg2 = g_stfn_m.stfn005 #s

            CALL q_stab001_3()                                #呼叫開窗

            LET g_stfo_d[l_ac].stfo008 = g_qryparam.return1              
            #LET g_stfo_d[l_ac].stabl003 = g_qryparam.return2 
            #LET g_stfo_d[l_ac].stabl004 = g_qryparam.return3 
            DISPLAY g_stfo_d[l_ac].stfo008 TO stfo008              #
            #DISPLAY g_stfo_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stfo_d[l_ac].stabl004 TO stabl004 #助記碼
            NEXT FIELD stfo008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo009
            #add-point:ON ACTION controlp INFIELD stfo009 name="input.c.page1.stfo009"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo_d[l_ac].stfo009             #給予default值
            LET g_qryparam.default2 = "" #g_stfo_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stfo_d[l_ac].stabl004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "4" #s
            LET g_qryparam.arg2 = g_stfn_m.stfn005 #s

            CALL q_stab001_3()                                #呼叫開窗

            LET g_stfo_d[l_ac].stfo009 = g_qryparam.return1              
            #LET g_stfo_d[l_ac].stabl003 = g_qryparam.return2 
            #LET g_stfo_d[l_ac].stabl004 = g_qryparam.return3 
            DISPLAY g_stfo_d[l_ac].stfo009 TO stfo009              #
            #DISPLAY g_stfo_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stfo_d[l_ac].stabl004 TO stabl004 #助記碼
            NEXT FIELD stfo009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo010
            #add-point:ON ACTION controlp INFIELD stfo010 name="input.c.page1.stfo010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo011
            #add-point:ON ACTION controlp INFIELD stfo011 name="input.c.page1.stfo011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo012
            #add-point:ON ACTION controlp INFIELD stfo012 name="input.c.page1.stfo012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo013
            #add-point:ON ACTION controlp INFIELD stfo013 name="input.c.page1.stfo013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo014
            #add-point:ON ACTION controlp INFIELD stfo014 name="input.c.page1.stfo014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo026
            #add-point:ON ACTION controlp INFIELD stfo026 name="input.c.page1.stfo026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo015
            #add-point:ON ACTION controlp INFIELD stfo015 name="input.c.page1.stfo015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo016
            #add-point:ON ACTION controlp INFIELD stfo016 name="input.c.page1.stfo016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo017
            #add-point:ON ACTION controlp INFIELD stfo017 name="input.c.page1.stfo017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo021
            #add-point:ON ACTION controlp INFIELD stfo021 name="input.c.page1.stfo021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo022
            #add-point:ON ACTION controlp INFIELD stfo022 name="input.c.page1.stfo022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo023
            #add-point:ON ACTION controlp INFIELD stfo023 name="input.c.page1.stfo023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo024
            #add-point:ON ACTION controlp INFIELD stfo024 name="input.c.page1.stfo024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfo025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfo025
            #add-point:ON ACTION controlp INFIELD stfo025 name="input.c.page1.stfo025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfosite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfosite
            #add-point:ON ACTION controlp INFIELD stfosite name="input.c.page1.stfosite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stfounit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfounit
            #add-point:ON ACTION controlp INFIELD stfounit name="input.c.page1.stfounit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stfo_d[l_ac].* = g_stfo_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stfo_d[l_ac].stfoseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stfo_d[l_ac].* = g_stfo_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astm403_stfo_t_mask_restore('restore_mask_o')
      
               UPDATE stfo_t SET (stfo001,stfoseq,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006, 
                   stfo007,stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015, 
                   stfo016,stfo017,stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit) = (g_stfn_m.stfn001, 
                   g_stfo_d[l_ac].stfoseq,g_stfo_d[l_ac].stfo002,g_stfo_d[l_ac].stfo018,g_stfo_d[l_ac].stfo019, 
                   g_stfo_d[l_ac].stfo003,g_stfo_d[l_ac].stfo004,g_stfo_d[l_ac].stfo005,g_stfo_d[l_ac].stfo006, 
                   g_stfo_d[l_ac].stfo007,g_stfo_d[l_ac].stfo020,g_stfo_d[l_ac].stfo008,g_stfo_d[l_ac].stfo009, 
                   g_stfo_d[l_ac].stfo010,g_stfo_d[l_ac].stfo011,g_stfo_d[l_ac].stfo012,g_stfo_d[l_ac].stfo013, 
                   g_stfo_d[l_ac].stfo014,g_stfo_d[l_ac].stfo026,g_stfo_d[l_ac].stfo015,g_stfo_d[l_ac].stfo016, 
                   g_stfo_d[l_ac].stfo017,g_stfo_d[l_ac].stfo021,g_stfo_d[l_ac].stfo022,g_stfo_d[l_ac].stfo023, 
                   g_stfo_d[l_ac].stfo024,g_stfo_d[l_ac].stfo025,g_stfo_d[l_ac].stfosite,g_stfo_d[l_ac].stfounit) 
 
                WHERE stfoent = g_enterprise AND stfo001 = g_stfn_m.stfn001 
 
                  AND stfoseq = g_stfo_d_t.stfoseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stfo_d[l_ac].* = g_stfo_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfo_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stfo_d[l_ac].* = g_stfo_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys_bak[1] = g_stfn001_t
               LET gs_keys[2] = g_stfo_d[g_detail_idx].stfoseq
               LET gs_keys_bak[2] = g_stfo_d_t.stfoseq
               CALL astm403_update_b('stfo_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astm403_stfo_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stfo_d[g_detail_idx].stfoseq = g_stfo_d_t.stfoseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stfn_m.stfn001
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stfo_d_t.stfoseq
 
                  CALL astm403_key_update_b(gs_keys,'stfo_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo_d_t)
               LET g_log2 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astm403_unlock_b("stfo_t","'1'")
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
               LET g_stfo_d[li_reproduce_target].* = g_stfo_d[li_reproduce].*
 
               LET g_stfo_d[li_reproduce_target].stfoseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stfo_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stfo_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stfo2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stfo2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm403_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stfo2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stfo2_d[l_ac].* TO NULL 
            INITIALIZE g_stfo2_d_t.* TO NULL 
            INITIALIZE g_stfo2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_stfo2_d[l_ac].stfp010 = "0"
      LET g_stfo2_d[l_ac].stfpacti = "Y"
      LET g_stfo2_d[l_ac].stfp026 = "0"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_stfo2_d_t.* = g_stfo2_d[l_ac].*     #新輸入資料
            LET g_stfo2_d_o.* = g_stfo2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm403_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astm403_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stfo2_d[li_reproduce_target].* = g_stfo2_d[li_reproduce].*
 
               LET g_stfo2_d[li_reproduce_target].stfpseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            SELECT MAX(stfpseq)+1 INTO  g_stfo2_d[l_ac].stfpseq FROM stfp_t
             WHERE stfpent = g_enterprise AND stfp001 = g_stfn_m.stfn001
            IF cl_null( g_stfo2_d[l_ac].stfpseq ) THEN             
               LET g_stfo2_d[l_ac].stfpseq = 1
            END IF 
            LET g_stfo2_d[l_ac].stfp004 = '2'
            LET g_stfo2_d[l_ac].stfp005 = '1'
            LET g_stfo2_d[l_ac].stfp006 = '3'
            LET g_stfo2_d[l_ac].stfp007 = '2'
            LET g_stfo2_d[l_ac].stfpsite = g_stfn_m.stfnsite
            LET g_stfo2_d[l_ac].stfpunit = g_stfn_m.stfnunit
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
            OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm403_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stfo2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stfo2_d[l_ac].stfpseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stfo2_d_t.* = g_stfo2_d[l_ac].*  #BACKUP
               LET g_stfo2_d_o.* = g_stfo2_d[l_ac].*  #BACKUP
               CALL astm403_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astm403_set_no_entry_b(l_cmd)
               IF NOT astm403_lock_b("stfp_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm403_bcl2 INTO g_stfo2_d[l_ac].stfpsite,g_stfo2_d[l_ac].stfpunit,g_stfo2_d[l_ac].stfpseq, 
                      g_stfo2_d[l_ac].stfp002,g_stfo2_d[l_ac].stfp021,g_stfo2_d[l_ac].stfp020,g_stfo2_d[l_ac].stfp003, 
                      g_stfo2_d[l_ac].stfp004,g_stfo2_d[l_ac].stfp018,g_stfo2_d[l_ac].stfp019,g_stfo2_d[l_ac].stfp005, 
                      g_stfo2_d[l_ac].stfp006,g_stfo2_d[l_ac].stfp007,g_stfo2_d[l_ac].stfp008,g_stfo2_d[l_ac].stfp009, 
                      g_stfo2_d[l_ac].stfp010,g_stfo2_d[l_ac].stfp011,g_stfo2_d[l_ac].stfp012,g_stfo2_d[l_ac].stfp013, 
                      g_stfo2_d[l_ac].stfp014,g_stfo2_d[l_ac].stfpacti,g_stfo2_d[l_ac].stfp015,g_stfo2_d[l_ac].stfp016, 
                      g_stfo2_d[l_ac].stfp017,g_stfo2_d[l_ac].stfp022,g_stfo2_d[l_ac].stfp023,g_stfo2_d[l_ac].stfp024, 
                      g_stfo2_d[l_ac].stfp025,g_stfo2_d[l_ac].stfp026
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stfo2_d_mask_o[l_ac].* =  g_stfo2_d[l_ac].*
                  CALL astm403_stfp_t_mask()
                  LET g_stfo2_d_mask_n[l_ac].* =  g_stfo2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm403_show()
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
               LET gs_keys[01] = g_stfn_m.stfn001
               LET gs_keys[gs_keys.getLength()+1] = g_stfo2_d_t.stfpseq
            
               #刪除同層單身
               IF NOT astm403_delete_b('stfp_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm403_key_delete_b(gs_keys,'stfp_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astm403_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_stfo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stfo2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM stfp_t 
             WHERE stfpent = g_enterprise AND stfp001 = g_stfn_m.stfn001
               AND stfpseq = g_stfo2_d[l_ac].stfpseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys[2] = g_stfo2_d[g_detail_idx].stfpseq
               CALL astm403_insert_b('stfp_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stfo_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm403_b_fill()
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
               LET g_stfo2_d[l_ac].* = g_stfo2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl2
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
               LET g_stfo2_d[l_ac].* = g_stfo2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astm403_stfp_t_mask_restore('restore_mask_o')
                              
               UPDATE stfp_t SET (stfp001,stfpsite,stfpunit,stfpseq,stfp002,stfp021,stfp020,stfp003, 
                   stfp004,stfp018,stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012, 
                   stfp013,stfp014,stfpacti,stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025, 
                   stfp026) = (g_stfn_m.stfn001,g_stfo2_d[l_ac].stfpsite,g_stfo2_d[l_ac].stfpunit,g_stfo2_d[l_ac].stfpseq, 
                   g_stfo2_d[l_ac].stfp002,g_stfo2_d[l_ac].stfp021,g_stfo2_d[l_ac].stfp020,g_stfo2_d[l_ac].stfp003, 
                   g_stfo2_d[l_ac].stfp004,g_stfo2_d[l_ac].stfp018,g_stfo2_d[l_ac].stfp019,g_stfo2_d[l_ac].stfp005, 
                   g_stfo2_d[l_ac].stfp006,g_stfo2_d[l_ac].stfp007,g_stfo2_d[l_ac].stfp008,g_stfo2_d[l_ac].stfp009, 
                   g_stfo2_d[l_ac].stfp010,g_stfo2_d[l_ac].stfp011,g_stfo2_d[l_ac].stfp012,g_stfo2_d[l_ac].stfp013, 
                   g_stfo2_d[l_ac].stfp014,g_stfo2_d[l_ac].stfpacti,g_stfo2_d[l_ac].stfp015,g_stfo2_d[l_ac].stfp016, 
                   g_stfo2_d[l_ac].stfp017,g_stfo2_d[l_ac].stfp022,g_stfo2_d[l_ac].stfp023,g_stfo2_d[l_ac].stfp024, 
                   g_stfo2_d[l_ac].stfp025,g_stfo2_d[l_ac].stfp026) #自訂欄位頁簽
                WHERE stfpent = g_enterprise AND stfp001 = g_stfn_m.stfn001
                  AND stfpseq = g_stfo2_d_t.stfpseq #項次 
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stfo2_d[l_ac].* = g_stfo2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfp_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stfo2_d[l_ac].* = g_stfo2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys_bak[1] = g_stfn001_t
               LET gs_keys[2] = g_stfo2_d[g_detail_idx].stfpseq
               LET gs_keys_bak[2] = g_stfo2_d_t.stfpseq
               CALL astm403_update_b('stfp_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astm403_stfp_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stfo2_d[g_detail_idx].stfpseq = g_stfo2_d_t.stfpseq 
                  ) THEN
                  LET gs_keys[01] = g_stfn_m.stfn001
                  LET gs_keys[gs_keys.getLength()+1] = g_stfo2_d_t.stfpseq
                  CALL astm403_key_update_b(gs_keys,'stfp_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo2_d_t)
               LET g_log2 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpsite
            #add-point:BEFORE FIELD stfpsite name="input.b.page2.stfpsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpsite
            
            #add-point:AFTER FIELD stfpsite name="input.a.page2.stfpsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfpsite
            #add-point:ON CHANGE stfpsite name="input.g.page2.stfpsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpunit
            #add-point:BEFORE FIELD stfpunit name="input.b.page2.stfpunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpunit
            
            #add-point:AFTER FIELD stfpunit name="input.a.page2.stfpunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfpunit
            #add-point:ON CHANGE stfpunit name="input.g.page2.stfpunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpseq
            #add-point:BEFORE FIELD stfpseq name="input.b.page2.stfpseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpseq
            
            #add-point:AFTER FIELD stfpseq name="input.a.page2.stfpseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stfn_m.stfn001 IS NOT NULL AND g_stfo2_d[g_detail_idx].stfpseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stfn_m.stfn001 != g_stfn001_t OR g_stfo2_d[g_detail_idx].stfpseq != g_stfo2_d_t.stfpseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfp_t WHERE "||"stfpent = '" ||g_enterprise|| "' AND "||"stfp001 = '"||g_stfn_m.stfn001 ||"' AND "|| "stfpseq = '"||g_stfo2_d[g_detail_idx].stfpseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfpseq
            #add-point:ON CHANGE stfpseq name="input.g.page2.stfpseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp002
            
            #add-point:AFTER FIELD stfp002 name="input.a.page2.stfp002"
            LET g_stfo2_d[l_ac].stfp002_desc = ''
            DISPLAY BY NAME g_stfo2_d[l_ac].stfp002_desc           
            IF NOT cl_null(g_stfo2_d[l_ac].stfp002) THEN
               IF NOT astm403_stfo002_chk(g_stfo2_d[l_ac].stfp002) THEN
                  LET g_stfo2_d[l_ac].stfp002 = g_stfo2_d_t.stfp002
                  #   价款类别
                  SELECT stae006
                    INTO g_stfo2_d[l_ac].stfp004
                    FROM stae_t
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo2_d[l_ac].stfp002
                  CALL astm403_stfp002_ref()
                  DISPLAY BY NAME g_stfo2_d[l_ac].stfp004
                  NEXT FIELD stfp002
               END IF
               IF (g_stfo2_d[l_ac].stfp002 <> g_stfo2_d_o.stfp002 AND NOT cl_null(g_stfo2_d_o.stfp002)) OR (l_cmd = 'a' AND cl_null(g_stfo2_d_o.stfp002)) THEN
                  #   价款类别/
                  SELECT stae006
                    INTO g_stfo2_d[l_ac].stfp004
                    FROM stae_t
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo2_d[l_ac].stfp002
                  CALL astm403_stfp002_ref()
                  DISPLAY BY NAME g_stfo2_d[l_ac].stfp002_desc,g_stfo2_d[l_ac].stfp004
                  IF g_stfo2_d[l_ac].stfp004 = '3' THEN
                     LET g_stfo2_d[l_ac].stfp004 = ''
                  END IF
               END IF    
            ELSE
               LET g_stfo2_d[l_ac].stfp002_desc = ''
               LET g_stfo2_d[l_ac].stfp004 = ''
            END IF
            LET g_stfo2_d_o.stfp002 = g_stfo2_d[l_ac].stfp002
            
            CALL astm403_stfp002_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp002
            #add-point:BEFORE FIELD stfp002 name="input.b.page2.stfp002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp002
            #add-point:ON CHANGE stfp002 name="input.g.page2.stfp002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp021
            #add-point:BEFORE FIELD stfp021 name="input.b.page2.stfp021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp021
            
            #add-point:AFTER FIELD stfp021 name="input.a.page2.stfp021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp021
            #add-point:ON CHANGE stfp021 name="input.g.page2.stfp021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp020
            #add-point:BEFORE FIELD stfp020 name="input.b.page2.stfp020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp020
            
            #add-point:AFTER FIELD stfp020 name="input.a.page2.stfp020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp020
            #add-point:ON CHANGE stfp020 name="input.g.page2.stfp020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp003
            #add-point:BEFORE FIELD stfp003 name="input.b.page2.stfp003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp003
            
            #add-point:AFTER FIELD stfp003 name="input.a.page2.stfp003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp003
            #add-point:ON CHANGE stfp003 name="input.g.page2.stfp003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp004
            #add-point:BEFORE FIELD stfp004 name="input.b.page2.stfp004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp004
            
            #add-point:AFTER FIELD stfp004 name="input.a.page2.stfp004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp004
            #add-point:ON CHANGE stfp004 name="input.g.page2.stfp004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp018
            #add-point:BEFORE FIELD stfp018 name="input.b.page2.stfp018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp018
            
            #add-point:AFTER FIELD stfp018 name="input.a.page2.stfp018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp018
            #add-point:ON CHANGE stfp018 name="input.g.page2.stfp018"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp019
            
            #add-point:AFTER FIELD stfp019 name="input.a.page2.stfp019"
            IF NOT cl_null(g_stfo2_d[l_ac].stfp019) THEN 
               IF g_stfo2_d[l_ac].stfp019 <> g_stfo2_d_o.stfp019 OR cl_null(g_stfo2_d_o.stfp019) THEN   #170202-00003#1 170202 by 02749 add
                  IF NOT astm403_stfp018_chk() THEN
                    #LET g_stfo2_d[l_ac].stfp019 = g_stfo2_d_t.stfp019   #170202-00003#1 1700202 by 02749 mark
                     LET g_stfo2_d[l_ac].stfp019 = g_stfo2_d_o.stfp019   #170202-00003#1 1700202 by 02749 add
                     NEXT FIELD stfp019
                  END IF 
                  #检查款别编号依据点设置否
                  CALL s_money_chk('1',g_stfn_m.stfnsite,g_stfo2_d[l_ac].stfp019)
                       RETURNING l_success,r_errno,r_no,r_ooia002
                  IF NOT cl_null(r_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = r_errno
                     LET g_errparam.extend = g_stfo2_d[l_ac].stfp019
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                    #LET g_stfo2_d[l_ac].stfp019 = g_stfo2_d_t.stfp019   #170202-00003#1 1700202 by 02749 mark
                     LET g_stfo2_d[l_ac].stfp019 = g_stfo2_d_o.stfp019   #170202-00003#1 1700202 by 02749 add
                     NEXT FIELD stfp019
                  END IF
                  
                 #IF l_cmd = 'a' OR (l_cmd ='u' AND g_stfo2_d[l_ac].stfp019 != g_stfo2_d_t.stfp019)  THEN    #170202-00003#1 170202 by 02749 mark
                     #获取标准手续费费率
                     LET g_stfo2_d[l_ac].stfp011 = ''   #170202-00003#1 1700202 by 02749 add
                     CALL s_money_ooie_get('','ooie031',g_stfn_m.stfnsite,g_stfo2_d[l_ac].stfp019) RETURNING g_stfo2_d[l_ac].stfp011
                 #END IF   #170202-00003#1 170202 by 02749 mark
               END IF      #170202-00003#1 1700202 by 02749 add
            END IF 
            CALL astm403_stfp019_ref()

            LET g_stfo2_d_o.stfp019 = g_stfo2_d[l_ac].stfp019   #170202-00003#1 1700202 by 02749 add
            LET g_stfo2_d_o.stfp011 = g_stfo2_d[l_ac].stfp011   #170202-00003#1 1700202 by 02749 add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp019
            #add-point:BEFORE FIELD stfp019 name="input.b.page2.stfp019"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp019
            #add-point:ON CHANGE stfp019 name="input.g.page2.stfp019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp005
            #add-point:BEFORE FIELD stfp005 name="input.b.page2.stfp005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp005
            
            #add-point:AFTER FIELD stfp005 name="input.a.page2.stfp005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp005
            #add-point:ON CHANGE stfp005 name="input.g.page2.stfp005"
            CALL astm403_set_comp_entry_stfp()
            IF g_stfo2_d[l_ac].stfp005 = '1' THEN 
               LET g_stfo2_d[l_ac].stfp010 = ''
               LET g_stfo2_d[l_ac].stfp007 = '2'
            ELSE
               LET g_stfo2_d[l_ac].stfp009 = ''
               LET g_stfo2_d[l_ac].stfp011 = ''
            END IF
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp006
            #add-point:BEFORE FIELD stfp006 name="input.b.page2.stfp006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp006
            
            #add-point:AFTER FIELD stfp006 name="input.a.page2.stfp006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp006
            #add-point:ON CHANGE stfp006 name="input.g.page2.stfp006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp007
            #add-point:BEFORE FIELD stfp007 name="input.b.page2.stfp007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp007
            
            #add-point:AFTER FIELD stfp007 name="input.a.page2.stfp007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp007
            #add-point:ON CHANGE stfp007 name="input.g.page2.stfp007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp008
            
            #add-point:AFTER FIELD stfp008 name="input.a.page2.stfp008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp008
            CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfo2_d[l_ac].stfp008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfo2_d[l_ac].stfp008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp008
            #add-point:BEFORE FIELD stfp008 name="input.b.page2.stfp008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp008
            #add-point:ON CHANGE stfp008 name="input.g.page2.stfp008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp009
            
            #add-point:AFTER FIELD stfp009 name="input.a.page2.stfp009"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp009
            CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfo2_d[l_ac].stfp009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfo2_d[l_ac].stfp009_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp009
            #add-point:BEFORE FIELD stfp009 name="input.b.page2.stfp009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp009
            #add-point:ON CHANGE stfp009 name="input.g.page2.stfp009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp010
            #add-point:BEFORE FIELD stfp010 name="input.b.page2.stfp010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp010
            
            #add-point:AFTER FIELD stfp010 name="input.a.page2.stfp010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp010
            #add-point:ON CHANGE stfp010 name="input.g.page2.stfp010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp011
            #add-point:BEFORE FIELD stfp011 name="input.b.page2.stfp011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp011
            
            #add-point:AFTER FIELD stfp011 name="input.a.page2.stfp011"
            LET g_stfo2_d_o.stfp011 = g_stfo2_d[l_ac].stfp011   #170202-00003#1 1700202 by 02749 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp011
            #add-point:ON CHANGE stfp011 name="input.g.page2.stfp011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp012
            #add-point:BEFORE FIELD stfp012 name="input.b.page2.stfp012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp012
            
            #add-point:AFTER FIELD stfp012 name="input.a.page2.stfp012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp012
            #add-point:ON CHANGE stfp012 name="input.g.page2.stfp012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp013
            #add-point:BEFORE FIELD stfp013 name="input.b.page2.stfp013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp013
            
            #add-point:AFTER FIELD stfp013 name="input.a.page2.stfp013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp013
            #add-point:ON CHANGE stfp013 name="input.g.page2.stfp013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp014
            #add-point:BEFORE FIELD stfp014 name="input.b.page2.stfp014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp014
            
            #add-point:AFTER FIELD stfp014 name="input.a.page2.stfp014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp014
            #add-point:ON CHANGE stfp014 name="input.g.page2.stfp014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfpacti
            #add-point:BEFORE FIELD stfpacti name="input.b.page2.stfpacti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfpacti
            
            #add-point:AFTER FIELD stfpacti name="input.a.page2.stfpacti"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfpacti
            #add-point:ON CHANGE stfpacti name="input.g.page2.stfpacti"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp015
            #add-point:BEFORE FIELD stfp015 name="input.b.page2.stfp015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp015
            
            #add-point:AFTER FIELD stfp015 name="input.a.page2.stfp015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp015
            #add-point:ON CHANGE stfp015 name="input.g.page2.stfp015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp016
            #add-point:BEFORE FIELD stfp016 name="input.b.page2.stfp016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp016
            
            #add-point:AFTER FIELD stfp016 name="input.a.page2.stfp016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp016
            #add-point:ON CHANGE stfp016 name="input.g.page2.stfp016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp017
            #add-point:BEFORE FIELD stfp017 name="input.b.page2.stfp017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp017
            
            #add-point:AFTER FIELD stfp017 name="input.a.page2.stfp017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp017
            #add-point:ON CHANGE stfp017 name="input.g.page2.stfp017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp022
            #add-point:BEFORE FIELD stfp022 name="input.b.page2.stfp022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp022
            
            #add-point:AFTER FIELD stfp022 name="input.a.page2.stfp022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp022
            #add-point:ON CHANGE stfp022 name="input.g.page2.stfp022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp023
            #add-point:BEFORE FIELD stfp023 name="input.b.page2.stfp023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp023
            
            #add-point:AFTER FIELD stfp023 name="input.a.page2.stfp023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp023
            #add-point:ON CHANGE stfp023 name="input.g.page2.stfp023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp024
            #add-point:BEFORE FIELD stfp024 name="input.b.page2.stfp024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp024
            
            #add-point:AFTER FIELD stfp024 name="input.a.page2.stfp024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp024
            #add-point:ON CHANGE stfp024 name="input.g.page2.stfp024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp025
            #add-point:BEFORE FIELD stfp025 name="input.b.page2.stfp025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp025
            
            #add-point:AFTER FIELD stfp025 name="input.a.page2.stfp025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp025
            #add-point:ON CHANGE stfp025 name="input.g.page2.stfp025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfp026
            #add-point:BEFORE FIELD stfp026 name="input.b.page2.stfp026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfp026
            
            #add-point:AFTER FIELD stfp026 name="input.a.page2.stfp026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfp026
            #add-point:ON CHANGE stfp026 name="input.g.page2.stfp026"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.stfpsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpsite
            #add-point:ON ACTION controlp INFIELD stfpsite name="input.c.page2.stfpsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfpunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpunit
            #add-point:ON ACTION controlp INFIELD stfpunit name="input.c.page2.stfpunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfpseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpseq
            #add-point:ON ACTION controlp INFIELD stfpseq name="input.c.page2.stfpseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp002
            #add-point:ON ACTION controlp INFIELD stfp002 name="input.c.page2.stfp002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo2_d[l_ac].stfp002             #給予default值
            LET g_qryparam.default2 = "" #g_stfo2_d[l_ac].stae001 #费用编号
            LET g_qryparam.default3 = "" #g_stfo2_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stae001()                                #呼叫開窗

            LET g_stfo2_d[l_ac].stfp002 = g_qryparam.return1              
            #LET g_stfo2_d[l_ac].stae001 = g_qryparam.return2 
            #LET g_stfo2_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stfo2_d[l_ac].stfp002 TO stfp002              #
            #DISPLAY g_stfo2_d[l_ac].stae001 TO stae001 #费用编号
            #DISPLAY g_stfo2_d[l_ac].stael003 TO stael003 #說明
            NEXT FIELD stfp002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp021
            #add-point:ON ACTION controlp INFIELD stfp021 name="input.c.page2.stfp021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp020
            #add-point:ON ACTION controlp INFIELD stfp020 name="input.c.page2.stfp020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp003
            #add-point:ON ACTION controlp INFIELD stfp003 name="input.c.page2.stfp003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp004
            #add-point:ON ACTION controlp INFIELD stfp004 name="input.c.page2.stfp004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp018
            #add-point:ON ACTION controlp INFIELD stfp018 name="input.c.page2.stfp018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp019
            #add-point:ON ACTION controlp INFIELD stfp019 name="input.c.page2.stfp019"
             INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo2_d[l_ac].stfp019
            IF NOT cl_null(g_stfo2_d[l_ac].stfp018) THEN 
               LET g_qryparam.where = " ooia009 = 0 AND ooia002 = '",g_stfo2_d[l_ac].stfp018,"'"
            ELSE
               LET g_qryparam.where = " ooia009 = 0 "
            END IF
            #获取aooi901、aooi905设置条件
            CALL s_money_where(g_stfn_m.stfnsite) RETURNING r_str
            LET g_qryparam.where = g_qryparam.where," AND ",r_str
            CALL q_ooia001()
            LET g_stfo2_d[l_ac].stfp019 = g_qryparam.return1    
            CALL astm403_stfp019_ref()            
            DISPLAY g_stfo2_d[l_ac].stfp019 TO stfp019
            NEXT FIELD stfp019                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp005
            #add-point:ON ACTION controlp INFIELD stfp005 name="input.c.page2.stfp005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp006
            #add-point:ON ACTION controlp INFIELD stfp006 name="input.c.page2.stfp006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp007
            #add-point:ON ACTION controlp INFIELD stfp007 name="input.c.page2.stfp007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp008
            #add-point:ON ACTION controlp INFIELD stfp008 name="input.c.page2.stfp008"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo2_d[l_ac].stfp008             #給予default值
            LET g_qryparam.default2 = "" #g_stfo2_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stfo2_d[l_ac].stabl004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "4"                   #s
            LET g_qryparam.arg2 = g_stfn_m.stfn005 

            CALL q_stab001_3()                                #呼叫開窗

            LET g_stfo2_d[l_ac].stfp008 = g_qryparam.return1              
            #LET g_stfo2_d[l_ac].stabl003 = g_qryparam.return2 
            #LET g_stfo2_d[l_ac].stabl004 = g_qryparam.return3 
            DISPLAY g_stfo2_d[l_ac].stfp008 TO stfp008              #
            #DISPLAY g_stfo2_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stfo2_d[l_ac].stabl004 TO stabl004 #助記碼
            NEXT FIELD stfp008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp009
            #add-point:ON ACTION controlp INFIELD stfp009 name="input.c.page2.stfp009"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo2_d[l_ac].stfp009             #給予default值
            LET g_qryparam.default2 = "" #g_stfo2_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stfo2_d[l_ac].stabl004 #助記碼
            #給予arg
            LET g_qryparam.arg1 = "4"                   #s
            LET g_qryparam.arg2 = g_stfn_m.stfn005 

            CALL q_stab001_3()                                #呼叫開窗

            LET g_stfo2_d[l_ac].stfp009 = g_qryparam.return1              
            #LET g_stfo2_d[l_ac].stabl003 = g_qryparam.return2 
            #LET g_stfo2_d[l_ac].stabl004 = g_qryparam.return3 
            DISPLAY g_stfo2_d[l_ac].stfp009 TO stfp009              #
            #DISPLAY g_stfo2_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stfo2_d[l_ac].stabl004 TO stabl004 #助記碼
            NEXT FIELD stfp009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp010
            #add-point:ON ACTION controlp INFIELD stfp010 name="input.c.page2.stfp010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp011
            #add-point:ON ACTION controlp INFIELD stfp011 name="input.c.page2.stfp011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp012
            #add-point:ON ACTION controlp INFIELD stfp012 name="input.c.page2.stfp012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp013
            #add-point:ON ACTION controlp INFIELD stfp013 name="input.c.page2.stfp013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp014
            #add-point:ON ACTION controlp INFIELD stfp014 name="input.c.page2.stfp014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfpacti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfpacti
            #add-point:ON ACTION controlp INFIELD stfpacti name="input.c.page2.stfpacti"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp015
            #add-point:ON ACTION controlp INFIELD stfp015 name="input.c.page2.stfp015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp016
            #add-point:ON ACTION controlp INFIELD stfp016 name="input.c.page2.stfp016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp017
            #add-point:ON ACTION controlp INFIELD stfp017 name="input.c.page2.stfp017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp022
            #add-point:ON ACTION controlp INFIELD stfp022 name="input.c.page2.stfp022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp023
            #add-point:ON ACTION controlp INFIELD stfp023 name="input.c.page2.stfp023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp024
            #add-point:ON ACTION controlp INFIELD stfp024 name="input.c.page2.stfp024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp025
            #add-point:ON ACTION controlp INFIELD stfp025 name="input.c.page2.stfp025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stfp026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfp026
            #add-point:ON ACTION controlp INFIELD stfp026 name="input.c.page2.stfp026"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stfo2_d[l_ac].* = g_stfo2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm403_unlock_b("stfp_t","'2'")
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
               LET g_stfo2_d[li_reproduce_target].* = g_stfo2_d[li_reproduce].*
 
               LET g_stfo2_d[li_reproduce_target].stfpseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stfo2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stfo2_d.getLength()+1
            END IF
            
      END INPUT
      INPUT ARRAY g_stfo3_d FROM s_detail3.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_3)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body3.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stfo3_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm403_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stfo3_d.getLength()
            #add-point:資料輸入前 name="input.body3.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stfo3_d[l_ac].* TO NULL 
            INITIALIZE g_stfo3_d_t.* TO NULL 
            INITIALIZE g_stfo3_d_o.* TO NULL 
            #公用欄位給值(單身3)
            
            #自定義預設值(單身3)
                  LET g_stfo3_d[l_ac].stfracti = "Y"
      LET g_stfo3_d[l_ac].stfr007 = "0"
      LET g_stfo3_d[l_ac].stfr008 = "0"
      LET g_stfo3_d[l_ac].stfr009 = "0.00"
 
            #add-point:modify段before備份 name="input.body3.insert.before_bak"
            
            #end add-point
            LET g_stfo3_d_t.* = g_stfo3_d[l_ac].*     #新輸入資料
            LET g_stfo3_d_o.* = g_stfo3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm403_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body3.insert.after_set_entry_b"
            
            #end add-point
            CALL astm403_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stfo3_d[li_reproduce_target].* = g_stfo3_d[li_reproduce].*
 
               LET g_stfo3_d[li_reproduce_target].stfrseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body3.before_insert"
             SELECT MAX(stfrseq)+1 INTO  g_stfo3_d[l_ac].stfrseq FROM stfr_t
             WHERE stfrent = g_enterprise AND stfr001 = g_stfn_m.stfn001
            IF cl_null( g_stfo3_d[l_ac].stfrseq ) THEN             
               LET g_stfo3_d[l_ac].stfrseq = 1
            END IF
            LET g_stfo3_d[l_ac].stfr004='2'
            LET g_stfo3_d[l_ac].stfrsite= g_stfn_m.stfnsite
            LET g_stfo3_d[l_ac].stfrunit= g_stfn_m.stfnunit
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body3.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[3] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 3
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm403_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stfo3_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stfo3_d[l_ac].stfrseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stfo3_d_t.* = g_stfo3_d[l_ac].*  #BACKUP
               LET g_stfo3_d_o.* = g_stfo3_d[l_ac].*  #BACKUP
               CALL astm403_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body3.after_set_entry_b"
               
               #end add-point  
               CALL astm403_set_no_entry_b(l_cmd)
               IF NOT astm403_lock_b("stfr_t","'3'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm403_bcl3 INTO g_stfo3_d[l_ac].stfrsite,g_stfo3_d[l_ac].stfrunit,g_stfo3_d[l_ac].stfracti, 
                      g_stfo3_d[l_ac].stfrseq,g_stfo3_d[l_ac].stfr003,g_stfo3_d[l_ac].stfr002,g_stfo3_d[l_ac].stfr004, 
                      g_stfo3_d[l_ac].stfr005,g_stfo3_d[l_ac].stfr006,g_stfo3_d[l_ac].stfr007,g_stfo3_d[l_ac].stfr008, 
                      g_stfo3_d[l_ac].stfr009
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stfo3_d_mask_o[l_ac].* =  g_stfo3_d[l_ac].*
                  CALL astm403_stfr_t_mask()
                  LET g_stfo3_d_mask_n[l_ac].* =  g_stfo3_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm403_show()
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
               
               #add-point:單身3刪除前 name="input.body3.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stfn_m.stfn001
               LET gs_keys[gs_keys.getLength()+1] = g_stfo3_d_t.stfrseq
            
               #刪除同層單身
               IF NOT astm403_delete_b('stfr_t',gs_keys,"'3'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm403_key_delete_b(gs_keys,'stfr_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身3刪除中 name="input.body3.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astm403_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身3刪除後 name="input.body3.a_delete"
               
               #end add-point
               LET l_count = g_stfo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body3.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stfo3_d.getLength() + 1) THEN
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
               
            #add-point:單身3新增前 name="input.body3.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stfr_t 
             WHERE stfrent = g_enterprise AND stfr001 = g_stfn_m.stfn001
               AND stfrseq = g_stfo3_d[l_ac].stfrseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身3新增前 name="input.body3.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys[2] = g_stfo3_d[g_detail_idx].stfrseq
               CALL astm403_insert_b('stfr_t',gs_keys,"'3'")
                           
               #add-point:單身新增後3 name="input.body3.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stfo_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm403_b_fill()
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
               LET g_stfo3_d[l_ac].* = g_stfo3_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl3
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
               LET g_stfo3_d[l_ac].* = g_stfo3_d_t.*
            ELSE
               #add-point:單身page3修改前 name="input.body3.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身3)
               
               
               #將遮罩欄位還原
               CALL astm403_stfr_t_mask_restore('restore_mask_o')
                              
               UPDATE stfr_t SET (stfr001,stfrsite,stfrunit,stfracti,stfrseq,stfr003,stfr002,stfr004, 
                   stfr005,stfr006,stfr007,stfr008,stfr009) = (g_stfn_m.stfn001,g_stfo3_d[l_ac].stfrsite, 
                   g_stfo3_d[l_ac].stfrunit,g_stfo3_d[l_ac].stfracti,g_stfo3_d[l_ac].stfrseq,g_stfo3_d[l_ac].stfr003, 
                   g_stfo3_d[l_ac].stfr002,g_stfo3_d[l_ac].stfr004,g_stfo3_d[l_ac].stfr005,g_stfo3_d[l_ac].stfr006, 
                   g_stfo3_d[l_ac].stfr007,g_stfo3_d[l_ac].stfr008,g_stfo3_d[l_ac].stfr009) #自訂欄位頁簽 
 
                WHERE stfrent = g_enterprise AND stfr001 = g_stfn_m.stfn001
                  AND stfrseq = g_stfo3_d_t.stfrseq #項次 
                  
               #add-point:單身page3修改中 name="input.body3.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stfo3_d[l_ac].* = g_stfo3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfr_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stfo3_d[l_ac].* = g_stfo3_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys_bak[1] = g_stfn001_t
               LET gs_keys[2] = g_stfo3_d[g_detail_idx].stfrseq
               LET gs_keys_bak[2] = g_stfo3_d_t.stfrseq
               CALL astm403_update_b('stfr_t',gs_keys,gs_keys_bak,"'3'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astm403_stfr_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stfo3_d[g_detail_idx].stfrseq = g_stfo3_d_t.stfrseq 
                  ) THEN
                  LET gs_keys[01] = g_stfn_m.stfn001
                  LET gs_keys[gs_keys.getLength()+1] = g_stfo3_d_t.stfrseq
                  CALL astm403_key_update_b(gs_keys,'stfr_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo3_d_t)
               LET g_log2 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo3_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page3修改後 name="input.body3.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrsite
            #add-point:BEFORE FIELD stfrsite name="input.b.page3.stfrsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrsite
            
            #add-point:AFTER FIELD stfrsite name="input.a.page3.stfrsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfrsite
            #add-point:ON CHANGE stfrsite name="input.g.page3.stfrsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrunit
            #add-point:BEFORE FIELD stfrunit name="input.b.page3.stfrunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrunit
            
            #add-point:AFTER FIELD stfrunit name="input.a.page3.stfrunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfrunit
            #add-point:ON CHANGE stfrunit name="input.g.page3.stfrunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfracti
            #add-point:BEFORE FIELD stfracti name="input.b.page3.stfracti"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfracti
            
            #add-point:AFTER FIELD stfracti name="input.a.page3.stfracti"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfracti
            #add-point:ON CHANGE stfracti name="input.g.page3.stfracti"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfrseq
            #add-point:BEFORE FIELD stfrseq name="input.b.page3.stfrseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfrseq
            
            #add-point:AFTER FIELD stfrseq name="input.a.page3.stfrseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stfn_m.stfn001 IS NOT NULL AND g_stfo3_d[g_detail_idx].stfrseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stfn_m.stfn001 != g_stfn001_t OR g_stfo3_d[g_detail_idx].stfrseq != g_stfo3_d_t.stfrseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfr_t WHERE "||"stfrent = '" ||g_enterprise|| "' AND "||"stfr001 = '"||g_stfn_m.stfn001 ||"' AND "|| "stfrseq = '"||g_stfo3_d[g_detail_idx].stfrseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfrseq
            #add-point:ON CHANGE stfrseq name="input.g.page3.stfrseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr003
            #add-point:BEFORE FIELD stfr003 name="input.b.page3.stfr003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr003
            
            #add-point:AFTER FIELD stfr003 name="input.a.page3.stfr003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr003
            #add-point:ON CHANGE stfr003 name="input.g.page3.stfr003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr002
            
            #add-point:AFTER FIELD stfr002 name="input.a.page3.stfr002"
            LET g_stfo3_d[l_ac].stfr002_desc = ''
            DISPLAY BY NAME g_stfo3_d[l_ac].stfr002_desc           
            IF NOT cl_null(g_stfo3_d[l_ac].stfr002) THEN
               IF NOT astm403_stfo002_chk(g_stfo3_d[l_ac].stfr002) THEN
                  LET g_stfo3_d[l_ac].stfr002 = g_stfo3_d_t.stfr002
                  SELECT stae006
                    INTO g_stfo3_d[l_ac].stfr004
                    FROM stae_t
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo3_d[l_ac].stfr002
                  CALL astm403_stfr002_ref()
                  DISPLAY BY NAME g_stfo3_d[l_ac].stfr004
                  NEXT FIELD stfr002
               END IF
               IF (g_stfo3_d[l_ac].stfr002 <> g_stfo3_d_o.stfr002 AND NOT cl_null(g_stfo3_d_o.stfr002)) OR (l_cmd = 'a' AND cl_null(g_stfo3_d_o.stfr002)) THEN
                 
                  SELECT stae006 
                    INTO g_stfo3_d[l_ac].stfr004
                    FROM stae_t
                   WHERE staeent = g_enterprise
                     AND stae001 = g_stfo3_d[l_ac].stfr002
                  CALL astm403_stfr002_ref()
                  DISPLAY BY NAME g_stfo3_d[l_ac].stfr004
                  IF g_stfo3_d[l_ac].stfr004 = '3' THEN
                     LET g_stfo3_d[l_ac].stfr004 = ''
                  END IF
               END IF    
            ELSE
               LET g_stfo3_d[l_ac].stfr002_desc = ''
               LET g_stfo3_d[l_ac].stfr004 = ''
            END IF
            
            CALL astm403_stfr002_ref()


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr002
            #add-point:BEFORE FIELD stfr002 name="input.b.page3.stfr002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr002
            #add-point:ON CHANGE stfr002 name="input.g.page3.stfr002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr004
            #add-point:BEFORE FIELD stfr004 name="input.b.page3.stfr004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr004
            
            #add-point:AFTER FIELD stfr004 name="input.a.page3.stfr004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr004
            #add-point:ON CHANGE stfr004 name="input.g.page3.stfr004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr005
            #add-point:BEFORE FIELD stfr005 name="input.b.page3.stfr005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr005
            
            #add-point:AFTER FIELD stfr005 name="input.a.page3.stfr005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr005
            #add-point:ON CHANGE stfr005 name="input.g.page3.stfr005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr006
            #add-point:BEFORE FIELD stfr006 name="input.b.page3.stfr006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr006
            
            #add-point:AFTER FIELD stfr006 name="input.a.page3.stfr006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr006
            #add-point:ON CHANGE stfr006 name="input.g.page3.stfr006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr007
            #add-point:BEFORE FIELD stfr007 name="input.b.page3.stfr007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr007
            
            #add-point:AFTER FIELD stfr007 name="input.a.page3.stfr007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr007
            #add-point:ON CHANGE stfr007 name="input.g.page3.stfr007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr008
            #add-point:BEFORE FIELD stfr008 name="input.b.page3.stfr008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr008
            
            #add-point:AFTER FIELD stfr008 name="input.a.page3.stfr008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr008
            #add-point:ON CHANGE stfr008 name="input.g.page3.stfr008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfr009
            #add-point:BEFORE FIELD stfr009 name="input.b.page3.stfr009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfr009
            
            #add-point:AFTER FIELD stfr009 name="input.a.page3.stfr009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfr009
            #add-point:ON CHANGE stfr009 name="input.g.page3.stfr009"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page3.stfrsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrsite
            #add-point:ON ACTION controlp INFIELD stfrsite name="input.c.page3.stfrsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfrunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrunit
            #add-point:ON ACTION controlp INFIELD stfrunit name="input.c.page3.stfrunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfracti
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfracti
            #add-point:ON ACTION controlp INFIELD stfracti name="input.c.page3.stfracti"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfrseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfrseq
            #add-point:ON ACTION controlp INFIELD stfrseq name="input.c.page3.stfrseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr003
            #add-point:ON ACTION controlp INFIELD stfr003 name="input.c.page3.stfr003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr002
            #add-point:ON ACTION controlp INFIELD stfr002 name="input.c.page3.stfr002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo3_d[l_ac].stfr002             #給予default值
            LET g_qryparam.default2 = "" #g_stfo3_d[l_ac].stae001 #费用编号
            LET g_qryparam.default3 = "" #g_stfo3_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stae001()                                #呼叫開窗

            LET g_stfo3_d[l_ac].stfr002 = g_qryparam.return1              
            #LET g_stfo3_d[l_ac].stae001 = g_qryparam.return2 
            #LET g_stfo3_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stfo3_d[l_ac].stfr002 TO stfr002              #
            #DISPLAY g_stfo3_d[l_ac].stae001 TO stae001 #费用编号
            #DISPLAY g_stfo3_d[l_ac].stael003 TO stael003 #說明
            NEXT FIELD stfr002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr004
            #add-point:ON ACTION controlp INFIELD stfr004 name="input.c.page3.stfr004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr005
            #add-point:ON ACTION controlp INFIELD stfr005 name="input.c.page3.stfr005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr006
            #add-point:ON ACTION controlp INFIELD stfr006 name="input.c.page3.stfr006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr007
            #add-point:ON ACTION controlp INFIELD stfr007 name="input.c.page3.stfr007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr008
            #add-point:ON ACTION controlp INFIELD stfr008 name="input.c.page3.stfr008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.stfr009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfr009
            #add-point:ON ACTION controlp INFIELD stfr009 name="input.c.page3.stfr009"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page3 after_row name="input.body3.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stfo3_d[l_ac].* = g_stfo3_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl3
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm403_unlock_b("stfr_t","'3'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page3 after_row2 name="input.body3.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body3.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stfo3_d[li_reproduce_target].* = g_stfo3_d[li_reproduce].*
 
               LET g_stfo3_d[li_reproduce_target].stfrseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stfo3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stfo3_d.getLength()+1
            END IF
            
      END INPUT
      INPUT ARRAY g_stfo4_d FROM s_detail4.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_4)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body4.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stfo4_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm403_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'4',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stfo4_d.getLength()
            #add-point:資料輸入前 name="input.body4.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stfo4_d[l_ac].* TO NULL 
            INITIALIZE g_stfo4_d_t.* TO NULL 
            INITIALIZE g_stfo4_d_o.* TO NULL 
            #公用欄位給值(單身4)
            #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stfo4_d[l_ac].stfsstus = 'N'
 
 
 
            #自定義預設值(單身4)
                  LET g_stfo4_d[l_ac].stfsstus = "Y"
 
            #add-point:modify段before備份 name="input.body4.insert.before_bak"
            
            #end add-point
            LET g_stfo4_d_t.* = g_stfo4_d[l_ac].*     #新輸入資料
            LET g_stfo4_d_o.* = g_stfo4_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm403_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body4.insert.after_set_entry_b"
            
            #end add-point
            CALL astm403_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stfo4_d[li_reproduce_target].* = g_stfo4_d[li_reproduce].*
 
               LET g_stfo4_d[li_reproduce_target].stfs002 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body4.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body4.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[4] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 4
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astm403_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stfo4_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stfo4_d[l_ac].stfs002 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stfo4_d_t.* = g_stfo4_d[l_ac].*  #BACKUP
               LET g_stfo4_d_o.* = g_stfo4_d[l_ac].*  #BACKUP
               CALL astm403_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body4.after_set_entry_b"
               
               #end add-point  
               CALL astm403_set_no_entry_b(l_cmd)
               IF NOT astm403_lock_b("stfs_t","'4'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm403_bcl4 INTO g_stfo4_d[l_ac].stfssite,g_stfo4_d[l_ac].stfsunit,g_stfo4_d[l_ac].stfs002, 
                      g_stfo4_d[l_ac].stfsstus
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stfo4_d_mask_o[l_ac].* =  g_stfo4_d[l_ac].*
                  CALL astm403_stfs_t_mask()
                  LET g_stfo4_d_mask_n[l_ac].* =  g_stfo4_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astm403_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body4.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body4.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body4.b_delete_ask"
               
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
               
               #add-point:單身4刪除前 name="input.body4.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_stfn_m.stfn001
               LET gs_keys[gs_keys.getLength()+1] = g_stfo4_d_t.stfs002
            
               #刪除同層單身
               IF NOT astm403_delete_b('stfs_t',gs_keys,"'4'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astm403_key_delete_b(gs_keys,'stfs_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astm403_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身4刪除中 name="input.body4.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astm403_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身4刪除後 name="input.body4.a_delete"
               
               #end add-point
               LET l_count = g_stfo_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body4.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stfo4_d.getLength() + 1) THEN
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
               
            #add-point:單身4新增前 name="input.body4.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stfs_t 
             WHERE stfsent = g_enterprise AND stfs001 = g_stfn_m.stfn001
               AND stfs002 = g_stfo4_d[l_ac].stfs002
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身4新增前 name="input.body4.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys[2] = g_stfo4_d[g_detail_idx].stfs002
               CALL astm403_insert_b('stfs_t',gs_keys,"'4'")
                           
               #add-point:單身新增後4 name="input.body4.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stfo_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm403_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body4.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stfo4_d[l_ac].* = g_stfo4_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl4
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
               LET g_stfo4_d[l_ac].* = g_stfo4_d_t.*
            ELSE
               #add-point:單身page4修改前 name="input.body4.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身4)
               
               #將遮罩欄位還原
               CALL astm403_stfs_t_mask_restore('restore_mask_o')
                              
               UPDATE stfs_t SET (stfs001,stfssite,stfsunit,stfs002,stfsstus) = (g_stfn_m.stfn001,g_stfo4_d[l_ac].stfssite, 
                   g_stfo4_d[l_ac].stfsunit,g_stfo4_d[l_ac].stfs002,g_stfo4_d[l_ac].stfsstus) #自訂欄位頁簽 
 
                WHERE stfsent = g_enterprise AND stfs001 = g_stfn_m.stfn001
                  AND stfs002 = g_stfo4_d_t.stfs002 #項次 
                  
               #add-point:單身page4修改中 name="input.body4.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stfo4_d[l_ac].* = g_stfo4_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfs_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stfo4_d[l_ac].* = g_stfo4_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stfn_m.stfn001
               LET gs_keys_bak[1] = g_stfn001_t
               LET gs_keys[2] = g_stfo4_d[g_detail_idx].stfs002
               LET gs_keys_bak[2] = g_stfo4_d_t.stfs002
               CALL astm403_update_b('stfs_t',gs_keys,gs_keys_bak,"'4'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astm403_stfs_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stfo4_d[g_detail_idx].stfs002 = g_stfo4_d_t.stfs002 
                  ) THEN
                  LET gs_keys[01] = g_stfn_m.stfn001
                  LET gs_keys[gs_keys.getLength()+1] = g_stfo4_d_t.stfs002
                  CALL astm403_key_update_b(gs_keys,'stfs_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo4_d_t)
               LET g_log2 = util.JSON.stringify(g_stfn_m),util.JSON.stringify(g_stfo4_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page4修改後 name="input.body4.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfssite
            #add-point:BEFORE FIELD stfssite name="input.b.page4.stfssite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfssite
            
            #add-point:AFTER FIELD stfssite name="input.a.page4.stfssite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfssite
            #add-point:ON CHANGE stfssite name="input.g.page4.stfssite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfsunit
            #add-point:BEFORE FIELD stfsunit name="input.b.page4.stfsunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfsunit
            
            #add-point:AFTER FIELD stfsunit name="input.a.page4.stfsunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfsunit
            #add-point:ON CHANGE stfsunit name="input.g.page4.stfsunit"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfs002
            
            #add-point:AFTER FIELD stfs002 name="input.a.page4.stfs002"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stfn_m.stfn001 IS NOT NULL AND g_stfo4_d[g_detail_idx].stfs002 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stfn_m.stfn001 != g_stfn001_t OR g_stfo4_d[g_detail_idx].stfs002 != g_stfo4_d_t.stfs002)) THEN 
               
               #161024-00025#12---add------------begin-----------
              IF s_aooi500_setpoint(g_prog,'stfs002') THEN 
                 CALL s_aooi500_chk(g_prog,'stfs002',g_stfo4_d[g_detail_idx].stfs002,g_stfn_m.stfnsite)
                   RETURNING l_success,l_errno
                 IF NOT l_success THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = g_stfo4_d[g_detail_idx].stfs002
                    LET g_errparam.code   = l_errno
                    LET g_errparam.popup  = TRUE
                    CALL cl_err()
                    LET g_stfo4_d[g_detail_idx].stfs002 = g_stfo4_d_t.stfs002
                    CALL astm403_stfs002_ref()
                    DISPLAY BY NAME g_stfo4_d[l_ac].stfs002_desc
                    NEXT FIELD CURRENT
                 ELSE
                    LET g_ins_site_flag = 'Y'  
                    
                 END IF
               
               ELSE
                  IF NOT astm403_stfs002_chk() THEN
                     LET g_stfo4_d[g_detail_idx].stfs002 = g_stfo4_d_t.stfs002
                     CALL astm403_stfs002_ref()
                     NEXT FIELD CURRENT
                 END IF
               END IF
               #161024-00025#12---add------------end-----------
               
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stfs_t WHERE "||"stfsent = '" ||g_enterprise|| "' AND "||"stfs001 = '"||g_stfn_m.stfn001 ||"' AND "|| "stfs002 = '"||g_stfo4_d[g_detail_idx].stfs002 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stfo4_d[l_ac].stfs002
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stfo4_d[l_ac].stfs002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stfo4_d[l_ac].stfs002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfs002
            #add-point:BEFORE FIELD stfs002 name="input.b.page4.stfs002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfs002
            #add-point:ON CHANGE stfs002 name="input.g.page4.stfs002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfsstus
            #add-point:BEFORE FIELD stfsstus name="input.b.page4.stfsstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfsstus
            
            #add-point:AFTER FIELD stfsstus name="input.a.page4.stfsstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfsstus
            #add-point:ON CHANGE stfsstus name="input.g.page4.stfsstus"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page4.stfssite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfssite
            #add-point:ON ACTION controlp INFIELD stfssite name="input.c.page4.stfssite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.stfsunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfsunit
            #add-point:ON ACTION controlp INFIELD stfsunit name="input.c.page4.stfsunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.page4.stfs002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfs002
            #add-point:ON ACTION controlp INFIELD stfs002 name="input.c.page4.stfs002"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stfo4_d[l_ac].stfs002             #給予default值

            #給予arg
            #161024-00025#12---ADD---BEGIN-----------
            CALL s_aooi500_q_where(g_prog,'stfs002',g_stfn_m.stfnsite,'i') RETURNING l_where
            LET g_qryparam.where = l_where


            CALL q_ooef001_24()                                #呼叫開窗
            #161024-00025#12---ADD---BEGIN-----------

            LET g_stfo4_d[l_ac].stfs002 = g_qryparam.return1              

            DISPLAY g_stfo4_d[l_ac].stfs002 TO stfs002              #
            CALL astm403_stfs002_ref()
            NEXT FIELD stfs002 
            #END add-point
 
 
         #Ctrlp:input.c.page4.stfsstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfsstus
            #add-point:ON ACTION controlp INFIELD stfsstus name="input.c.page4.stfsstus"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page4 after_row name="input.body4.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stfo4_d[l_ac].* = g_stfo4_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astm403_bcl4
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm403_unlock_b("stfs_t","'4'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page4 after_row2 name="input.body4.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body4.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stfo4_d[li_reproduce_target].* = g_stfo4_d[li_reproduce].*
 
               LET g_stfo4_d[li_reproduce_target].stfs002 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stfo4_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stfo4_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astm403.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
         CALL DIALOG.setCurrentRow("s_detail3",g_idx_group.getValue("'3',"))
         CALL DIALOG.setCurrentRow("s_detail4",g_idx_group.getValue("'4',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stfn001
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stfoseq
               WHEN "s_detail2"
                  NEXT FIELD stfpsite
               WHEN "s_detail3"
                  NEXT FIELD stfrsite
               WHEN "s_detail4"
                  NEXT FIELD stfssite
 
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
         LET g_detail_idx_list[4] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
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
         LET g_detail_idx_list[4] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail3",1)
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astm403_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astm403_b_fill() #單身填充
      CALL astm403_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astm403_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stfn_m.stfn001
   CALL ap_ref_array2(g_ref_fields," SELECT stfnl003 FROM stfnl_t WHERE stfnlent = '"||g_enterprise||"' AND stfnl001 = ? AND stfnl002 = '"||g_dlang||"'","") RETURNING g_rtn_fields 
   LET g_stfn_m.stfnl003 = g_rtn_fields[1] 
   DISPLAY g_stfn_m.stfnl003 TO stfnl003
   #end add-point
   
   #遮罩相關處理
   LET g_stfn_m_mask_o.* =  g_stfn_m.*
   CALL astm403_stfn_t_mask()
   LET g_stfn_m_mask_n.* =  g_stfn_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc, 
       g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004,g_stfn_m.stfn004_desc,g_stfn_m.stfn005,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006,g_stfn_m.stfn006_desc,g_stfn_m.stfn007,g_stfn_m.stfn007_desc,g_stfn_m.stfn003, 
       g_stfn_m.stfn003_desc,g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid, 
       g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp,g_stfn_m.stfnowndp_desc,g_stfn_m.stfncrtid,g_stfn_m.stfncrtid_desc, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmodid_desc, 
       g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfid_desc,g_stfn_m.stfncnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfn_m.stfnstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stfo_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stfo2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
   FOR l_ac = 1 TO g_stfo3_d.getLength()
      #add-point:show段單身reference name="show.body3.reference"
      
      #end add-point
   END FOR
   FOR l_ac = 1 TO g_stfo4_d.getLength()
      #add-point:show段單身reference name="show.body4.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astm403_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astm403_detail_show()
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
 
{<section id="astm403.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astm403_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stfn_t.stfn001 
   DEFINE l_oldno     LIKE stfn_t.stfn001 
 
   DEFINE l_master    RECORD LIKE stfn_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stfo_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stfp_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE stfr_t.* #此變數樣板目前無使用
 
   DEFINE l_detail4    RECORD LIKE stfs_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_insert      LIKE type_t.num5  #161024-00025#12--add
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
   
   IF g_stfn_m.stfn001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stfn001_t = g_stfn_m.stfn001
 
    
   LET g_stfn_m.stfn001 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stfn_m.stfnownid = g_user
      LET g_stfn_m.stfnowndp = g_dept
      LET g_stfn_m.stfncrtid = g_user
      LET g_stfn_m.stfncrtdp = g_dept 
      LET g_stfn_m.stfncrtdt = cl_get_current()
      LET g_stfn_m.stfnmodid = g_user
      LET g_stfn_m.stfnmoddt = cl_get_current()
      LET g_stfn_m.stfnstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stfn_m.stfnstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astm403_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stfn_m.* TO NULL
      INITIALIZE g_stfo_d TO NULL
      INITIALIZE g_stfo2_d TO NULL
      INITIALIZE g_stfo3_d TO NULL
      INITIALIZE g_stfo4_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astm403_show()
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
   CALL astm403_set_act_visible()   
   CALL astm403_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stfn001_t = g_stfn_m.stfn001
 
   
   #組合新增資料的條件
   LET g_add_browse = " stfnent = " ||g_enterprise|| " AND",
                      " stfn001 = '", g_stfn_m.stfn001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astm403_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astm403_idx_chk()
   
   LET g_data_owner = g_stfn_m.stfnownid      
   LET g_data_dept  = g_stfn_m.stfnowndp
   
   #功能已完成,通報訊息中心
   CALL astm403_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astm403_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stfo_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stfp_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE stfr_t.* #此變數樣板目前無使用
 
   DEFINE l_detail4    RECORD LIKE stfs_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astm403_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stfo_t
    WHERE stfoent = g_enterprise AND stfo001 = g_stfn001_t
 
    INTO TEMP astm403_detail
 
   #將key修正為調整後   
   UPDATE astm403_detail 
      #更新key欄位
      SET stfo001 = g_stfn_m.stfn001
 
      #更新共用欄位
      #應用 a13 樣板自動產生(Version:4)
      #, stfsstus = "Y" 
 
 
 
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stfo_t SELECT * FROM astm403_detail
   
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
   DROP TABLE astm403_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stfp_t 
    WHERE stfpent = g_enterprise AND stfp001 = g_stfn001_t
 
    INTO TEMP astm403_detail
 
   #將key修正為調整後   
   UPDATE astm403_detail SET stfp001 = g_stfn_m.stfn001
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stfp_t SELECT * FROM astm403_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm403_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table3.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stfr_t 
    WHERE stfrent = g_enterprise AND stfr001 = g_stfn001_t
 
    INTO TEMP astm403_detail
 
   #將key修正為調整後   
   UPDATE astm403_detail SET stfr001 = g_stfn_m.stfn001
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table3.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stfr_t SELECT * FROM astm403_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table3.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm403_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table3.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table4.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stfs_t 
    WHERE stfsent = g_enterprise AND stfs001 = g_stfn001_t
 
    INTO TEMP astm403_detail
 
   #將key修正為調整後   
   UPDATE astm403_detail SET stfs001 = g_stfn_m.stfn001
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table4.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stfs_t SELECT * FROM astm403_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table4.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm403_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table4.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stfn001_t = g_stfn_m.stfn001
 
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astm403_delete()
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
   
   IF g_stfn_m.stfn001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   LET g_master_multi_table_t.stfnl001 = g_stfn_m.stfn001
LET g_master_multi_table_t.stfnl003 = g_stfn_m.stfnl003
 
   
   CALL s_transaction_begin()
 
   OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm403_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astm403_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT astm403_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stfn_m_mask_o.* =  g_stfn_m.*
   CALL astm403_stfn_t_mask()
   LET g_stfn_m_mask_n.* =  g_stfn_m.*
   
   CALL astm403_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astm403_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stfn001_t = g_stfn_m.stfn001
 
 
      DELETE FROM stfn_t
       WHERE stfnent = g_enterprise AND stfn001 = g_stfn_m.stfn001
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stfn_m.stfn001,":",SQLERRMESSAGE  
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
      
      DELETE FROM stfo_t
       WHERE stfoent = g_enterprise AND stfo001 = g_stfn_m.stfn001
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
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
      DELETE FROM stfp_t
       WHERE stfpent = g_enterprise AND
             stfp001 = g_stfn_m.stfn001
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
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
      DELETE FROM stfr_t
       WHERE stfrent = g_enterprise AND
             stfr001 = g_stfn_m.stfn001
      #add-point:單身刪除中 name="delete.body.m_delete3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete3"
      
      #end add-point
 
      #add-point:單身刪除前 name="delete.body.b_delete4"
      
      #end add-point
      DELETE FROM stfs_t
       WHERE stfsent = g_enterprise AND
             stfs001 = g_stfn_m.stfn001
      #add-point:單身刪除中 name="delete.body.m_delete4"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete4"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stfn_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astm403_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stfo_d.clear() 
      CALL g_stfo2_d.clear()       
      CALL g_stfo3_d.clear()       
      CALL g_stfo4_d.clear()       
 
     
      CALL astm403_ui_browser_refresh()  
      #CALL astm403_ui_headershow()  
      #CALL astm403_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      INITIALIZE l_var_keys_bak TO NULL 
   INITIALIZE l_field_keys   TO NULL 
   LET l_var_keys_bak[01] = g_enterprise
   LET l_field_keys[01] = 'stfnlent'
   LET l_var_keys_bak[02] = g_master_multi_table_t.stfnl001
   LET l_field_keys[02] = 'stfnl001'
   CALL cl_multitable_delete(l_field_keys,l_var_keys_bak,'stfnl_t')
 
      
      #單身多語言刪除
      
      
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astm403_browser_fill("")
         CALL astm403_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astm403_cl
 
   #功能已完成,通報訊息中心
   CALL astm403_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astm403.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astm403_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stfo_d.clear()
   CALL g_stfo2_d.clear()
   CALL g_stfo3_d.clear()
   CALL g_stfo4_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astm403_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stfoseq,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006, 
             stfo007,stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015, 
             stfo016,stfo017,stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit ,t1.stael003 , 
             t2.stabl003 ,t3.stabl003 FROM stfo_t",   
                     " INNER JOIN stfn_t ON stfnent = " ||g_enterprise|| " AND stfn001 = stfo001 ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stfo002 AND t1.stael002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t2 ON t2.stablent="||g_enterprise||" AND t2.stabl001=stfo008 AND t2.stabl002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t3 ON t3.stablent="||g_enterprise||" AND t3.stabl001=stfo009 AND t3.stabl002='"||g_dlang||"' ",
 
                     " WHERE stfoent=? AND stfo001=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stfo_t.stfoseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm403_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astm403_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stfn_m.stfn001   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stfn_m.stfn001 INTO g_stfo_d[l_ac].stfoseq,g_stfo_d[l_ac].stfo002, 
          g_stfo_d[l_ac].stfo018,g_stfo_d[l_ac].stfo019,g_stfo_d[l_ac].stfo003,g_stfo_d[l_ac].stfo004, 
          g_stfo_d[l_ac].stfo005,g_stfo_d[l_ac].stfo006,g_stfo_d[l_ac].stfo007,g_stfo_d[l_ac].stfo020, 
          g_stfo_d[l_ac].stfo008,g_stfo_d[l_ac].stfo009,g_stfo_d[l_ac].stfo010,g_stfo_d[l_ac].stfo011, 
          g_stfo_d[l_ac].stfo012,g_stfo_d[l_ac].stfo013,g_stfo_d[l_ac].stfo014,g_stfo_d[l_ac].stfo026, 
          g_stfo_d[l_ac].stfo015,g_stfo_d[l_ac].stfo016,g_stfo_d[l_ac].stfo017,g_stfo_d[l_ac].stfo021, 
          g_stfo_d[l_ac].stfo022,g_stfo_d[l_ac].stfo023,g_stfo_d[l_ac].stfo024,g_stfo_d[l_ac].stfo025, 
          g_stfo_d[l_ac].stfosite,g_stfo_d[l_ac].stfounit,g_stfo_d[l_ac].stfo002_desc,g_stfo_d[l_ac].stfo008_desc, 
          g_stfo_d[l_ac].stfo009_desc   #(ver:78)
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
    
   #判斷是否填充
   IF astm403_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stfpsite,stfpunit,stfpseq,stfp002,stfp021,stfp020,stfp003,stfp004, 
             stfp018,stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012,stfp013, 
             stfp014,stfpacti,stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025,stfp026 ,t4.stael003 , 
             t5.ooial003 ,t6.stabl003 ,t7.stabl003 FROM stfp_t",   
                     " INNER JOIN  stfn_t ON stfnent = " ||g_enterprise|| " AND stfn001 = stfp001 ",
 
                     "",
                     
                                    " LEFT JOIN stael_t t4 ON t4.staelent="||g_enterprise||" AND t4.stael001=stfp002 AND t4.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooial_t t5 ON t5.ooialent="||g_enterprise||" AND t5.ooial001=stfp019 AND t5.ooial002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t6 ON t6.stablent="||g_enterprise||" AND t6.stabl001=stfp008 AND t6.stabl002='"||g_dlang||"' ",
               " LEFT JOIN stabl_t t7 ON t7.stablent="||g_enterprise||" AND t7.stabl001=stfp009 AND t7.stabl002='"||g_dlang||"' ",
 
                     " WHERE stfpent=? AND stfp001=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stfp_t.stfpseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm403_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astm403_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stfn_m.stfn001   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stfn_m.stfn001 INTO g_stfo2_d[l_ac].stfpsite,g_stfo2_d[l_ac].stfpunit, 
          g_stfo2_d[l_ac].stfpseq,g_stfo2_d[l_ac].stfp002,g_stfo2_d[l_ac].stfp021,g_stfo2_d[l_ac].stfp020, 
          g_stfo2_d[l_ac].stfp003,g_stfo2_d[l_ac].stfp004,g_stfo2_d[l_ac].stfp018,g_stfo2_d[l_ac].stfp019, 
          g_stfo2_d[l_ac].stfp005,g_stfo2_d[l_ac].stfp006,g_stfo2_d[l_ac].stfp007,g_stfo2_d[l_ac].stfp008, 
          g_stfo2_d[l_ac].stfp009,g_stfo2_d[l_ac].stfp010,g_stfo2_d[l_ac].stfp011,g_stfo2_d[l_ac].stfp012, 
          g_stfo2_d[l_ac].stfp013,g_stfo2_d[l_ac].stfp014,g_stfo2_d[l_ac].stfpacti,g_stfo2_d[l_ac].stfp015, 
          g_stfo2_d[l_ac].stfp016,g_stfo2_d[l_ac].stfp017,g_stfo2_d[l_ac].stfp022,g_stfo2_d[l_ac].stfp023, 
          g_stfo2_d[l_ac].stfp024,g_stfo2_d[l_ac].stfp025,g_stfo2_d[l_ac].stfp026,g_stfo2_d[l_ac].stfp002_desc, 
          g_stfo2_d[l_ac].stfp019_desc,g_stfo2_d[l_ac].stfp008_desc,g_stfo2_d[l_ac].stfp009_desc   #(ver:78) 
 
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
 
   #判斷是否填充
   IF astm403_fill_chk(3) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body3.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stfrsite,stfrunit,stfracti,stfrseq,stfr003,stfr002,stfr004,stfr005, 
             stfr006,stfr007,stfr008,stfr009 ,t8.stael003 FROM stfr_t",   
                     " INNER JOIN  stfn_t ON stfnent = " ||g_enterprise|| " AND stfn001 = stfr001 ",
 
                     "",
                     
                                    " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=stfr002 AND t8.stael002='"||g_dlang||"' ",
 
                     " WHERE stfrent=? AND stfr001=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body3.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table3) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table3 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stfr_t.stfrseq"
         
         #add-point:單身填充控制 name="b_fill.sql3"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm403_pb3 FROM g_sql
         DECLARE b_fill_cs3 CURSOR FOR astm403_pb3
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs3 USING g_enterprise,g_stfn_m.stfn001   #(ver:78)
                                               
      FOREACH b_fill_cs3 USING g_enterprise,g_stfn_m.stfn001 INTO g_stfo3_d[l_ac].stfrsite,g_stfo3_d[l_ac].stfrunit, 
          g_stfo3_d[l_ac].stfracti,g_stfo3_d[l_ac].stfrseq,g_stfo3_d[l_ac].stfr003,g_stfo3_d[l_ac].stfr002, 
          g_stfo3_d[l_ac].stfr004,g_stfo3_d[l_ac].stfr005,g_stfo3_d[l_ac].stfr006,g_stfo3_d[l_ac].stfr007, 
          g_stfo3_d[l_ac].stfr008,g_stfo3_d[l_ac].stfr009,g_stfo3_d[l_ac].stfr002_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill3.fill"
         
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
   IF astm403_fill_chk(4) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body4.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stfssite,stfsunit,stfs002,stfsstus ,t9.ooefl003 FROM stfs_t", 
                
                     " INNER JOIN  stfn_t ON stfnent = " ||g_enterprise|| " AND stfn001 = stfs001 ",
 
                     "",
                     
                                    " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=stfs002 AND t9.ooefl002='"||g_dlang||"' ",
 
                     " WHERE stfsent=? AND stfs001=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body4.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table4) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table4 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stfs_t.stfs002"
         
         #add-point:單身填充控制 name="b_fill.sql4"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm403_pb4 FROM g_sql
         DECLARE b_fill_cs4 CURSOR FOR astm403_pb4
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs4 USING g_enterprise,g_stfn_m.stfn001   #(ver:78)
                                               
      FOREACH b_fill_cs4 USING g_enterprise,g_stfn_m.stfn001 INTO g_stfo4_d[l_ac].stfssite,g_stfo4_d[l_ac].stfsunit, 
          g_stfo4_d[l_ac].stfs002,g_stfo4_d[l_ac].stfsstus,g_stfo4_d[l_ac].stfs002_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill4.fill"
         
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
   
   CALL g_stfo_d.deleteElement(g_stfo_d.getLength())
   CALL g_stfo2_d.deleteElement(g_stfo2_d.getLength())
   CALL g_stfo3_d.deleteElement(g_stfo3_d.getLength())
   CALL g_stfo4_d.deleteElement(g_stfo4_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astm403_pb
   FREE astm403_pb2
 
   FREE astm403_pb3
 
   FREE astm403_pb4
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stfo_d.getLength()
      LET g_stfo_d_mask_o[l_ac].* =  g_stfo_d[l_ac].*
      CALL astm403_stfo_t_mask()
      LET g_stfo_d_mask_n[l_ac].* =  g_stfo_d[l_ac].*
   END FOR
   
   LET g_stfo2_d_mask_o.* =  g_stfo2_d.*
   FOR l_ac = 1 TO g_stfo2_d.getLength()
      LET g_stfo2_d_mask_o[l_ac].* =  g_stfo2_d[l_ac].*
      CALL astm403_stfp_t_mask()
      LET g_stfo2_d_mask_n[l_ac].* =  g_stfo2_d[l_ac].*
   END FOR
   LET g_stfo3_d_mask_o.* =  g_stfo3_d.*
   FOR l_ac = 1 TO g_stfo3_d.getLength()
      LET g_stfo3_d_mask_o[l_ac].* =  g_stfo3_d[l_ac].*
      CALL astm403_stfr_t_mask()
      LET g_stfo3_d_mask_n[l_ac].* =  g_stfo3_d[l_ac].*
   END FOR
   LET g_stfo4_d_mask_o.* =  g_stfo4_d.*
   FOR l_ac = 1 TO g_stfo4_d.getLength()
      LET g_stfo4_d_mask_o[l_ac].* =  g_stfo4_d[l_ac].*
      CALL astm403_stfs_t_mask()
      LET g_stfo4_d_mask_n[l_ac].* =  g_stfo4_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astm403_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stfo_t
       WHERE stfoent = g_enterprise AND
         stfo001 = ps_keys_bak[1] AND stfoseq = ps_keys_bak[2]
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
         CALL g_stfo_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stfp_t
       WHERE stfpent = g_enterprise AND
             stfp001 = ps_keys_bak[1] AND stfpseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stfo2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete3"
      
      #end add-point    
      DELETE FROM stfr_t
       WHERE stfrent = g_enterprise AND
             stfr001 = ps_keys_bak[1] AND stfrseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete3"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_stfo3_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete3"
      
      #end add-point    
   END IF
 
   LET ls_group = "'4',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete4"
      
      #end add-point    
      DELETE FROM stfs_t
       WHERE stfsent = g_enterprise AND
             stfs001 = ps_keys_bak[1] AND stfs002 = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete4"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'4'" THEN 
         CALL g_stfo4_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete4"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astm403_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stfo_t
                  (stfoent,
                   stfo001,
                   stfoseq
                   ,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006,stfo007,stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015,stfo016,stfo017,stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stfo_d[g_detail_idx].stfo002,g_stfo_d[g_detail_idx].stfo018,g_stfo_d[g_detail_idx].stfo019, 
                       g_stfo_d[g_detail_idx].stfo003,g_stfo_d[g_detail_idx].stfo004,g_stfo_d[g_detail_idx].stfo005, 
                       g_stfo_d[g_detail_idx].stfo006,g_stfo_d[g_detail_idx].stfo007,g_stfo_d[g_detail_idx].stfo020, 
                       g_stfo_d[g_detail_idx].stfo008,g_stfo_d[g_detail_idx].stfo009,g_stfo_d[g_detail_idx].stfo010, 
                       g_stfo_d[g_detail_idx].stfo011,g_stfo_d[g_detail_idx].stfo012,g_stfo_d[g_detail_idx].stfo013, 
                       g_stfo_d[g_detail_idx].stfo014,g_stfo_d[g_detail_idx].stfo026,g_stfo_d[g_detail_idx].stfo015, 
                       g_stfo_d[g_detail_idx].stfo016,g_stfo_d[g_detail_idx].stfo017,g_stfo_d[g_detail_idx].stfo021, 
                       g_stfo_d[g_detail_idx].stfo022,g_stfo_d[g_detail_idx].stfo023,g_stfo_d[g_detail_idx].stfo024, 
                       g_stfo_d[g_detail_idx].stfo025,g_stfo_d[g_detail_idx].stfosite,g_stfo_d[g_detail_idx].stfounit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stfo_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stfp_t
                  (stfpent,
                   stfp001,
                   stfpseq
                   ,stfpsite,stfpunit,stfp002,stfp021,stfp020,stfp003,stfp004,stfp018,stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012,stfp013,stfp014,stfpacti,stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025,stfp026) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stfo2_d[g_detail_idx].stfpsite,g_stfo2_d[g_detail_idx].stfpunit,g_stfo2_d[g_detail_idx].stfp002, 
                       g_stfo2_d[g_detail_idx].stfp021,g_stfo2_d[g_detail_idx].stfp020,g_stfo2_d[g_detail_idx].stfp003, 
                       g_stfo2_d[g_detail_idx].stfp004,g_stfo2_d[g_detail_idx].stfp018,g_stfo2_d[g_detail_idx].stfp019, 
                       g_stfo2_d[g_detail_idx].stfp005,g_stfo2_d[g_detail_idx].stfp006,g_stfo2_d[g_detail_idx].stfp007, 
                       g_stfo2_d[g_detail_idx].stfp008,g_stfo2_d[g_detail_idx].stfp009,g_stfo2_d[g_detail_idx].stfp010, 
                       g_stfo2_d[g_detail_idx].stfp011,g_stfo2_d[g_detail_idx].stfp012,g_stfo2_d[g_detail_idx].stfp013, 
                       g_stfo2_d[g_detail_idx].stfp014,g_stfo2_d[g_detail_idx].stfpacti,g_stfo2_d[g_detail_idx].stfp015, 
                       g_stfo2_d[g_detail_idx].stfp016,g_stfo2_d[g_detail_idx].stfp017,g_stfo2_d[g_detail_idx].stfp022, 
                       g_stfo2_d[g_detail_idx].stfp023,g_stfo2_d[g_detail_idx].stfp024,g_stfo2_d[g_detail_idx].stfp025, 
                       g_stfo2_d[g_detail_idx].stfp026)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stfo2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert3"
      
      #end add-point 
      INSERT INTO stfr_t
                  (stfrent,
                   stfr001,
                   stfrseq
                   ,stfrsite,stfrunit,stfracti,stfr003,stfr002,stfr004,stfr005,stfr006,stfr007,stfr008,stfr009) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stfo3_d[g_detail_idx].stfrsite,g_stfo3_d[g_detail_idx].stfrunit,g_stfo3_d[g_detail_idx].stfracti, 
                       g_stfo3_d[g_detail_idx].stfr003,g_stfo3_d[g_detail_idx].stfr002,g_stfo3_d[g_detail_idx].stfr004, 
                       g_stfo3_d[g_detail_idx].stfr005,g_stfo3_d[g_detail_idx].stfr006,g_stfo3_d[g_detail_idx].stfr007, 
                       g_stfo3_d[g_detail_idx].stfr008,g_stfo3_d[g_detail_idx].stfr009)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_stfo3_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert3"
      
      #end add-point
   END IF
 
   LET ls_group = "'4',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert4"
      
      #end add-point 
      INSERT INTO stfs_t
                  (stfsent,
                   stfs001,
                   stfs002
                   ,stfssite,stfsunit,stfsstus) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stfo4_d[g_detail_idx].stfssite,g_stfo4_d[g_detail_idx].stfsunit,g_stfo4_d[g_detail_idx].stfsstus) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert4"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'4'" THEN 
         CALL g_stfo4_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert4"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astm403_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stfo_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astm403_stfo_t_mask_restore('restore_mask_o')
               
      UPDATE stfo_t 
         SET (stfo001,
              stfoseq
              ,stfo002,stfo018,stfo019,stfo003,stfo004,stfo005,stfo006,stfo007,stfo020,stfo008,stfo009,stfo010,stfo011,stfo012,stfo013,stfo014,stfo026,stfo015,stfo016,stfo017,stfo021,stfo022,stfo023,stfo024,stfo025,stfosite,stfounit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stfo_d[g_detail_idx].stfo002,g_stfo_d[g_detail_idx].stfo018,g_stfo_d[g_detail_idx].stfo019, 
                  g_stfo_d[g_detail_idx].stfo003,g_stfo_d[g_detail_idx].stfo004,g_stfo_d[g_detail_idx].stfo005, 
                  g_stfo_d[g_detail_idx].stfo006,g_stfo_d[g_detail_idx].stfo007,g_stfo_d[g_detail_idx].stfo020, 
                  g_stfo_d[g_detail_idx].stfo008,g_stfo_d[g_detail_idx].stfo009,g_stfo_d[g_detail_idx].stfo010, 
                  g_stfo_d[g_detail_idx].stfo011,g_stfo_d[g_detail_idx].stfo012,g_stfo_d[g_detail_idx].stfo013, 
                  g_stfo_d[g_detail_idx].stfo014,g_stfo_d[g_detail_idx].stfo026,g_stfo_d[g_detail_idx].stfo015, 
                  g_stfo_d[g_detail_idx].stfo016,g_stfo_d[g_detail_idx].stfo017,g_stfo_d[g_detail_idx].stfo021, 
                  g_stfo_d[g_detail_idx].stfo022,g_stfo_d[g_detail_idx].stfo023,g_stfo_d[g_detail_idx].stfo024, 
                  g_stfo_d[g_detail_idx].stfo025,g_stfo_d[g_detail_idx].stfosite,g_stfo_d[g_detail_idx].stfounit)  
 
         WHERE stfoent = g_enterprise AND stfo001 = ps_keys_bak[1] AND stfoseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfo_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfo_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm403_stfo_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stfp_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astm403_stfp_t_mask_restore('restore_mask_o')
               
      UPDATE stfp_t 
         SET (stfp001,
              stfpseq
              ,stfpsite,stfpunit,stfp002,stfp021,stfp020,stfp003,stfp004,stfp018,stfp019,stfp005,stfp006,stfp007,stfp008,stfp009,stfp010,stfp011,stfp012,stfp013,stfp014,stfpacti,stfp015,stfp016,stfp017,stfp022,stfp023,stfp024,stfp025,stfp026) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stfo2_d[g_detail_idx].stfpsite,g_stfo2_d[g_detail_idx].stfpunit,g_stfo2_d[g_detail_idx].stfp002, 
                  g_stfo2_d[g_detail_idx].stfp021,g_stfo2_d[g_detail_idx].stfp020,g_stfo2_d[g_detail_idx].stfp003, 
                  g_stfo2_d[g_detail_idx].stfp004,g_stfo2_d[g_detail_idx].stfp018,g_stfo2_d[g_detail_idx].stfp019, 
                  g_stfo2_d[g_detail_idx].stfp005,g_stfo2_d[g_detail_idx].stfp006,g_stfo2_d[g_detail_idx].stfp007, 
                  g_stfo2_d[g_detail_idx].stfp008,g_stfo2_d[g_detail_idx].stfp009,g_stfo2_d[g_detail_idx].stfp010, 
                  g_stfo2_d[g_detail_idx].stfp011,g_stfo2_d[g_detail_idx].stfp012,g_stfo2_d[g_detail_idx].stfp013, 
                  g_stfo2_d[g_detail_idx].stfp014,g_stfo2_d[g_detail_idx].stfpacti,g_stfo2_d[g_detail_idx].stfp015, 
                  g_stfo2_d[g_detail_idx].stfp016,g_stfo2_d[g_detail_idx].stfp017,g_stfo2_d[g_detail_idx].stfp022, 
                  g_stfo2_d[g_detail_idx].stfp023,g_stfo2_d[g_detail_idx].stfp024,g_stfo2_d[g_detail_idx].stfp025, 
                  g_stfo2_d[g_detail_idx].stfp026) 
         WHERE stfpent = g_enterprise AND stfp001 = ps_keys_bak[1] AND stfpseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfp_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfp_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm403_stfp_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stfr_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update3"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astm403_stfr_t_mask_restore('restore_mask_o')
               
      UPDATE stfr_t 
         SET (stfr001,
              stfrseq
              ,stfrsite,stfrunit,stfracti,stfr003,stfr002,stfr004,stfr005,stfr006,stfr007,stfr008,stfr009) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stfo3_d[g_detail_idx].stfrsite,g_stfo3_d[g_detail_idx].stfrunit,g_stfo3_d[g_detail_idx].stfracti, 
                  g_stfo3_d[g_detail_idx].stfr003,g_stfo3_d[g_detail_idx].stfr002,g_stfo3_d[g_detail_idx].stfr004, 
                  g_stfo3_d[g_detail_idx].stfr005,g_stfo3_d[g_detail_idx].stfr006,g_stfo3_d[g_detail_idx].stfr007, 
                  g_stfo3_d[g_detail_idx].stfr008,g_stfo3_d[g_detail_idx].stfr009) 
         WHERE stfrent = g_enterprise AND stfr001 = ps_keys_bak[1] AND stfrseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update3"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfr_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfr_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm403_stfr_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update3"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
   LET ls_group = "'4',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stfs_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update4"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astm403_stfs_t_mask_restore('restore_mask_o')
               
      UPDATE stfs_t 
         SET (stfs001,
              stfs002
              ,stfssite,stfsunit,stfsstus) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stfo4_d[g_detail_idx].stfssite,g_stfo4_d[g_detail_idx].stfsunit,g_stfo4_d[g_detail_idx].stfsstus)  
 
         WHERE stfsent = g_enterprise AND stfs001 = ps_keys_bak[1] AND stfs002 = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update4"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfs_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stfs_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astm403_stfs_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update4"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astm403_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astm403.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astm403_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astm403.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astm403_lock_b(ps_table,ps_page)
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
   #CALL astm403_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stfo_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astm403_bcl USING g_enterprise,
                                       g_stfn_m.stfn001,g_stfo_d[g_detail_idx].stfoseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm403_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stfp_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm403_bcl2 USING g_enterprise,
                                             g_stfn_m.stfn001,g_stfo2_d[g_detail_idx].stfpseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm403_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
   #鎖定整組table
   #LET ls_group = "'3',"
   #僅鎖定自身table
   LET ls_group = "stfr_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm403_bcl3 USING g_enterprise,
                                             g_stfn_m.stfn001,g_stfo3_d[g_detail_idx].stfrseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm403_bcl3:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
   #鎖定整組table
   #LET ls_group = "'4',"
   #僅鎖定自身table
   LET ls_group = "stfs_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm403_bcl4 USING g_enterprise,
                                             g_stfn_m.stfn001,g_stfo4_d[g_detail_idx].stfs002
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astm403_bcl4:",SQLERRMESSAGE 
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
 
{<section id="astm403.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astm403_unlock_b(ps_table,ps_page)
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
      CLOSE astm403_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm403_bcl2
   END IF
 
   LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm403_bcl3
   END IF
 
   LET ls_group = "'4',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm403_bcl4
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astm403_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stfn001",TRUE)
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stfnunit,stfnsite",TRUE)  #161024-00025#12--add
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astm403_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stfn001",FALSE)
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
   #161024-00025#12-----add---begin-----------
   IF NOT s_aooi500_comp_entry(g_prog,'stfnunit') THEN
      CALL cl_set_comp_entry("stfnunit",FALSE)
   END IF
   
   IF (NOT s_aooi500_comp_entry(g_prog,'stfnsite') OR g_ins_site_flag = 'Y') THEN
      CALL cl_set_comp_entry("stfnsite",FALSE)
   END IF
   #161024-00025#12-----add---end-----------
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astm403_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
    DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   DEFINE l_field   LIKE staf_t.staf003
   DEFINE l_n       LIKE type_t.num5
   DEFINE l_inaa130  LIKE inaa_t.inaa130
   DEFINE l_stee004 LIKE stee_t.stee004
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
       
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("stfo003,stfo005,stfo006,stfo007,stfo008,stfo009,stfo010,stfo011,stfo013,stfo014",TRUE)
   IF NOT cl_null(g_stfo_d[l_ac].stfo002) THEN
         #檢查費用編號+經營方式是否存在asti204
         
         SELECT COUNT(*) INTO l_n FROM staf_t
          WHERE stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
         IF l_n > 0 THEN
            DECLARE sel_staf CURSOR FOR 
             SELECT staf003,staf004,staf005 FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
            FOREACH sel_staf INTO l_staf003,l_staf004,l_staf005
               CASE l_staf003
                  WHEN 'stao004'
                     LET l_field = "stfo003"                 
                  WHEN 'stao006'
                     LET l_field = "stfo005"
                  WHEN 'stao007'
                     LET l_field = "stfo006"
                  WHEN 'stao008'
                     LET l_field = "stfo007"
                  WHEN 'stao009'
                     LET l_field = "stfo008"
                  WHEN 'stao010'
                     LET l_field = "stfo009"
                  WHEN 'stao011'
                     LET l_field = "stfo010"
                  WHEN 'stao012'
                     LET l_field = "stfo011"                 
                  WHEN 'stao017'
                     LET l_field = "stfo013"
                  WHEN 'stao018'
                     LET l_field = "stfo014"
                  
                  OTHERWISE
                     CONTINUE FOREACH
               END CASE
               IF l_staf004 = 'Y' THEN
                  CALL cl_set_comp_entry(l_field,TRUE)
               END IF
            END FOREACH 
         ELSE
            CALL astm403_default_entry_b()
         END IF    
      ELSE
         CALL astm403_default_entry_b() 
      END IF 
    
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astm403_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   DEFINE l_field   LIKE staf_t.staf003
   DEFINE l_n       LIKE type_t.num5
   DEFINE l_inaa130  LIKE inaa_t.inaa130
   DEFINE l_stee004 LIKE stee_t.stee004
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF NOT cl_null(g_stfo_d[l_ac].stfo002) THEN
         #檢查費用編號+經營方式是否存在asti204
         
         SELECT COUNT(*) INTO l_n FROM staf_t
          WHERE stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
         IF l_n > 0 THEN
            DECLARE sel_staf_ne CURSOR FOR 
             SELECT staf003,staf004,staf005 FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
            FOREACH sel_staf_ne INTO l_staf003,l_staf004,l_staf005
               CASE l_staf003
                  WHEN 'stao004'
                     LET l_field = "stfo003"                 
                  WHEN 'stao006'
                     LET l_field = "stfo005"
                  WHEN 'stao007'
                     LET l_field = "stfo006"
                  WHEN 'stao008'
                     LET l_field = "stfo007"
                  WHEN 'stao009'
                     LET l_field = "stfo008"
                  WHEN 'stao010'
                     LET l_field = "stfo009"
                  WHEN 'stao011'
                     LET l_field = "stfo010"
                  WHEN 'stao012'
                     LET l_field = "stfo011" 
                  
                  OTHERWISE
                     CONTINUE FOREACH
                END CASE
               IF l_staf004 = 'N' THEN
                  CALL cl_set_comp_entry(l_field,FALSE)
               END IF
            END FOREACH 
         ELSE
            CALL astm403_default_no_entry_b()
         END IF
      ELSE
         CALL astm403_default_no_entry_b()
      END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astm403_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   IF g_stfn_m.stfnstus MATCHES "[NDR]" THEN
      CALL cl_set_act_visible("modify,delete,modify_detail",TRUE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   END IF
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astm403_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astm403_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm403.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astm403_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astm403.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astm403_default_search()
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
      LET ls_wc = ls_wc, " stfn001 = '", g_argv[01], "' AND "
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
 
         INITIALIZE g_wc2_table4 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stfn_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stfo_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stfp_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "stfr_t" 
                  LET g_wc2_table3 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "stfs_t" 
                  LET g_wc2_table4 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
            OR NOT cl_null(g_wc2_table3)
 
            OR NOT cl_null(g_wc2_table4)
 
 
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
 
            IF g_wc2_table4 <> " 1=1" AND NOT cl_null(g_wc2_table4) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table4
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
 
{<section id="astm403.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astm403_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stfn_m.stfn001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astm403_cl USING g_enterprise,g_stfn_m.stfn001
   IF STATUS THEN
      CLOSE astm403_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astm403_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit,g_stfn_m.stfn001, 
       g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003,g_stfn_m.stfn002, 
       g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp,g_stfn_m.stfncrtid, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid, 
       g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp_desc, 
       g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc,g_stfn_m.stfncnfid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT astm403_action_chk() THEN
      CLOSE astm403_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc, 
       g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004,g_stfn_m.stfn004_desc,g_stfn_m.stfn005,g_stfn_m.stfn005_desc, 
       g_stfn_m.stfn006,g_stfn_m.stfn006_desc,g_stfn_m.stfn007,g_stfn_m.stfn007_desc,g_stfn_m.stfn003, 
       g_stfn_m.stfn003_desc,g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid, 
       g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp,g_stfn_m.stfnowndp_desc,g_stfn_m.stfncrtid,g_stfn_m.stfncrtid_desc, 
       g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmodid_desc, 
       g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfid_desc,g_stfn_m.stfncnfdt
 
   CASE g_stfn_m.stfnstus
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
         CASE g_stfn_m.stfnstus
            
            WHEN "N"
               HIDE OPTION "open"
            WHEN "Y"
               HIDE OPTION "valid"
            WHEN "X"
               HIDE OPTION "void"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      
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
      g_stfn_m.stfnstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astm403_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stfn_m.stfnmodid = g_user
   LET g_stfn_m.stfnmoddt = cl_get_current()
   LET g_stfn_m.stfnstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stfn_t 
      SET (stfnstus,stfnmodid,stfnmoddt) 
        = (g_stfn_m.stfnstus,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt)     
    WHERE stfnent = g_enterprise AND stfn001 = g_stfn_m.stfn001
 
    
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
      EXECUTE astm403_master_referesh USING g_stfn_m.stfn001 INTO g_stfn_m.stfnsite,g_stfn_m.stfnunit, 
          g_stfn_m.stfn001,g_stfn_m.stfn004,g_stfn_m.stfn005,g_stfn_m.stfn006,g_stfn_m.stfn007,g_stfn_m.stfn003, 
          g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009,g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnowndp, 
          g_stfn_m.stfncrtid,g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdt,g_stfn_m.stfnmodid,g_stfn_m.stfnmoddt, 
          g_stfn_m.stfncnfid,g_stfn_m.stfncnfdt,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit_desc,g_stfn_m.stfn004_desc, 
          g_stfn_m.stfn005_desc,g_stfn_m.stfn006_desc,g_stfn_m.stfn007_desc,g_stfn_m.stfn003_desc,g_stfn_m.stfnownid_desc, 
          g_stfn_m.stfnowndp_desc,g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfnmodid_desc, 
          g_stfn_m.stfncnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stfn_m.stfnsite,g_stfn_m.stfnsite_desc,g_stfn_m.stfnunit,g_stfn_m.stfnunit_desc, 
          g_stfn_m.stfn001,g_stfn_m.stfnl003,g_stfn_m.stfn004,g_stfn_m.stfn004_desc,g_stfn_m.stfn005, 
          g_stfn_m.stfn005_desc,g_stfn_m.stfn006,g_stfn_m.stfn006_desc,g_stfn_m.stfn007,g_stfn_m.stfn007_desc, 
          g_stfn_m.stfn003,g_stfn_m.stfn003_desc,g_stfn_m.stfn002,g_stfn_m.stfn008,g_stfn_m.stfn009, 
          g_stfn_m.stfnstus,g_stfn_m.stfnownid,g_stfn_m.stfnownid_desc,g_stfn_m.stfnowndp,g_stfn_m.stfnowndp_desc, 
          g_stfn_m.stfncrtid,g_stfn_m.stfncrtid_desc,g_stfn_m.stfncrtdp,g_stfn_m.stfncrtdp_desc,g_stfn_m.stfncrtdt, 
          g_stfn_m.stfnmodid,g_stfn_m.stfnmodid_desc,g_stfn_m.stfnmoddt,g_stfn_m.stfncnfid,g_stfn_m.stfncnfid_desc, 
          g_stfn_m.stfncnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astm403_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astm403_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm403.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astm403_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stfo_d.getLength() THEN
         LET g_detail_idx = g_stfo_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stfo_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stfo_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stfo2_d.getLength() THEN
         LET g_detail_idx = g_stfo2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stfo2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stfo2_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_stfo3_d.getLength() THEN
         LET g_detail_idx = g_stfo3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stfo3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stfo3_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 4 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_stfo4_d.getLength() THEN
         LET g_detail_idx = g_stfo4_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stfo4_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stfo4_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astm403_b_fill2(pi_idx)
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
   
   CALL astm403_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astm403_fill_chk(ps_idx)
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
      (cl_null(g_wc2_table3) OR g_wc2_table3.trim() = '1=1')  AND 
      (cl_null(g_wc2_table4) OR g_wc2_table4.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astm403.status_show" >}
PRIVATE FUNCTION astm403_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astm403.mask_functions" >}
&include "erp/ast/astm403_mask.4gl"
 
{</section>}
 
{<section id="astm403.signature" >}
   
 
{</section>}
 
{<section id="astm403.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astm403_set_pk_array()
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
   LET g_pk_array[1].values = g_stfn_m.stfn001
   LET g_pk_array[1].column = 'stfn001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm403.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astm403.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astm403_msgcentre_notify(lc_state)
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
   CALL astm403_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stfn_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astm403.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astm403_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT stfnstus  INTO g_stfn_m.stfnstus
     FROM stfn_t
    WHERE stfnent = g_enterprise
      AND stfn001 = g_stfn_m.stfn001

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stfn_m.stfnstus
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
        LET g_errparam.extend = g_stfn_m.stfn001
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astm403_set_act_visible()
        CALL astm403_set_act_no_visible()
        CALL astm403_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astm403.other_function" readonly="Y" >}

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
PRIVATE FUNCTION astm403_stfn005_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfn_m.stfn005
    CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfn_m.stfn005_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfn_m.stfn005_desc
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
PRIVATE FUNCTION astm403_stfn004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stfn_m.stfn004
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stfn_m.stfn004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stfn_m.stfn004_desc
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
PRIVATE FUNCTION astm403_stfn006_ref()
     INITIALIZE g_ref_fields TO NULL
     LET g_ref_fields[1] = g_stfn_m.stfn006
     CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
     LET g_stfn_m.stfn006_desc = '', g_rtn_fields[1] , ''
     DISPLAY BY NAME g_stfn_m.stfn006_desc
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
PRIVATE FUNCTION astm403_stfn003_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfn_m.stfn003
    CALL ap_ref_array2(g_ref_fields,"SELECT ooibl004 FROM ooibl_t WHERE ooiblent='"||g_enterprise||"' AND ooibl002=? AND ooibl003='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfn_m.stfn003_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfn_m.stfn003_desc
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
PRIVATE FUNCTION astm403_stfn007_ref()
     INITIALIZE g_ref_fields TO NULL
     LET g_ref_fields[1] = g_stfn_m.stfn007
     CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='2127' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
     LET g_stfn_m.stfn007_desc = '', g_rtn_fields[1] , ''
     DISPLAY BY NAME g_stfn_m.stfn007_desc
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
PRIVATE FUNCTION astm403_stfo002_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo_d[l_ac].stfo002
    CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo_d[l_ac].stfo002_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo_d[l_ac].stfo002_desc
  
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
PRIVATE FUNCTION astm403_stfo008_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo_d[l_ac].stfo008
    CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo_d[l_ac].stfo008_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo_d[l_ac].stfo008_desc
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
PRIVATE FUNCTION astm403_stfo009_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo_d[l_ac].stfo009
    CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo_d[l_ac].stfo009_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo_d[l_ac].stfo009_desc
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
PRIVATE FUNCTION astm403_stfp002_ref()
     INITIALIZE g_ref_fields TO NULL
     LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp002
     CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
     LET g_stfo2_d[l_ac].stfp002_desc = '', g_rtn_fields[1] , ''
     DISPLAY BY NAME g_stfo2_d[l_ac].stfp002_desc
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
PRIVATE FUNCTION astm403_stfp008_ref()
     INITIALIZE g_ref_fields TO NULL
     LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp008
     CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
     LET g_stfo2_d[l_ac].stfp008_desc = '', g_rtn_fields[1] , ''
     DISPLAY BY NAME g_stfo2_d[l_ac].stfp008_desc
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
PRIVATE FUNCTION astm403_stfp009_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp009
    CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo2_d[l_ac].stfp009_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo2_d[l_ac].stfp009_desc
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
PRIVATE FUNCTION astm403_stfp019_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo2_d[l_ac].stfp019
    CALL ap_ref_array2(g_ref_fields,"SELECT ooial003 FROM ooial_t WHERE ooialent='"||g_enterprise||"' AND ooial001=? AND ooial002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo2_d[l_ac].stfp019_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo2_d[l_ac].stfp019_desc
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
PRIVATE FUNCTION astm403_stfo002_chk(p_stae001)
DEFINE p_stae001  LIKE stae_t.stae001
DEFINE l_staestus LIKE stae_t.staestus
DEFINE l_stae010  LIKE stae_t.stae010
DEFINE l_n        LIKE type_t.num5
DEFINE l_ooef019  LIKE ooef_t.ooef019

   SELECT staestus INTO l_staestus FROM stae_t
    WHERE stae001 = p_stae001 AND staeent = g_enterprise
   
   IF STATUS = 100 OR  cl_null(l_staestus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00001'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   ELSE
      IF l_staestus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00002'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

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
PRIVATE FUNCTION astm403_stfo008_chk(p_stab001)
DEFINE p_stab001   LIKE stab_t.stab001
DEFINE l_stabstus  LIKE stab_t.stabstus
DEFINE l_n         LIKE type_t.num5

   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_stab001
   IF NOT cl_chk_exist("v_stab001") THEN
      RETURN FALSE
   END IF
   
   SELECT COUNT(*) INTO l_n FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
    WHERE  stabent = g_enterprise AND stab001= p_stab001 AND stat001 = '4' AND stat002 = g_stfn_m.stfn005     #add by yangxf
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00189'
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
PRIVATE FUNCTION astm403_stfp018_chk()
DEFINE l_ooia008   LIKE ooia_t.ooia008
DEFINE l_ooia009   LIKE ooia_t.ooia009
DEFINE l_ooia007   LIKE ooia_t.ooia007
DEFINE l_ooiastus  LIKE ooia_t.ooiastus
   IF cl_null(g_stfo2_d[l_ac].stfp018) THEN 
      RETURN 
   END IF
   SELECT ooiastus,ooia008,ooia009 INTO l_ooiastus,l_ooia008,l_ooia009
     FROM ooia_t
    WHERE ooiaent = g_enterprise
      AND ooia001 = g_stfo2_d[l_ac].stfp019
      AND ooia002 = g_stfo2_d[l_ac].stfp018
   CASE 
      WHEN SQLCA.SQLCODE = 100  
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'aoo-00195'
           LET g_errparam.extend = g_stfo2_d[l_ac].stfp019
           LET g_errparam.popup = TRUE
           CALL cl_err()
           RETURN FALSE
      WHEN l_ooiastus <> 'Y' 
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'anm-00094'
           LET g_errparam.extend = g_stfo2_d[l_ac].stfp019
           LET g_errparam.popup = TRUE
           CALL cl_err()
           RETURN FALSE
      WHEN l_ooia009 <> 0
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'ast-00382'
           LET g_errparam.extend = g_stfo2_d[l_ac].stfp019
           LET g_errparam.popup = TRUE
           CALL cl_err()
           RETURN FALSE
   END CASE 
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
PRIVATE FUNCTION astm403_default(p_stfn002,p_stfo002)
DEFINE p_stfn002 LIKE stfn_t.stfn002
DEFINE p_stfo002 LIKE stfo_t.stfo002
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf006 LIKE staf_t.staf006

    DECLARE sel_staf_d CURSOR FOR 
     SELECT staf003,staf006 FROM staf_t
      WHERE  stafent = g_enterprise AND staf001= p_stfo002 AND staf002 = p_stfn002
      
   FOREACH sel_staf_d INTO l_staf003,l_staf006
         CASE l_staf003
             WHEN 'stao004'
                LET g_stfo_d[l_ac].stfo003 = l_staf006
             WHEN 'stao005'
                IF NOT cl_null(l_staf006) THEN
                   LET g_stfo_d[l_ac].stfo004 = l_staf006
                END IF
             WHEN 'stao006'
                LET g_stfo_d[l_ac].stfo005 = l_staf006
             WHEN 'stao007'
                LET g_stfo_d[l_ac].stfo006 = l_staf006
             WHEN 'stao008'
                LET g_stfo_d[l_ac].stfo007 = l_staf006
             WHEN 'stao009'
                LET g_stfo_d[l_ac].stfo008 = l_staf006
                CALL astm403_stfo008_ref()
             WHEN 'stao010'
                LET g_stfo_d[l_ac].stfo009 = l_staf006
                CALL astm403_stfo009_ref()
             WHEN 'stao011'
                LET g_stfo_d[l_ac].stfo010 = l_staf006
             WHEN 'stao012'
                LET g_stfo_d[l_ac].stfo011 = l_staf006
         END CASE
   END FOREACH 
   DISPLAY BY NAME g_stfo_d[l_ac].stfo004,g_stfo_d[l_ac].stfo005,g_stfo_d[l_ac].stfo006,
                   g_stfo_d[l_ac].stfo007,g_stfo_d[l_ac].stfo008,g_stfo_d[l_ac].stfo008_desc,g_stfo_d[l_ac].stfo009,g_stfo_d[l_ac].stfo009_desc,
                   g_stfo_d[l_ac].stfo010,g_stfo_d[l_ac].stfo011

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
PRIVATE FUNCTION astm403_init_required()
    CALL cl_set_comp_required("steb005,steb006,steb007,steb008,steb009,steb010,steb013,steb014",TRUE)
    CALL cl_set_comp_required("steb003,steb011",FALSE)
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
PRIVATE FUNCTION astm403_set_required_b()
DEFINE l_n     LIKE type_t.num5
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf004 LIKE staf_t.staf004
DEFINE l_staf005 LIKE staf_t.staf005
DEFINE l_field   LIKE staf_t.staf003 

      IF NOT cl_null(g_stfo_d[l_ac].stfo002) THEN
         #檢查費用編號+經營方式是否存在asti204
         
         SELECT COUNT(*) INTO l_n FROM staf_t
          WHERE stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
         IF l_n > 0 THEN
            DECLARE sel_staf_q CURSOR FOR 
             SELECT staf003,staf004,staf005 FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
            FOREACH sel_staf_q INTO l_staf003,l_staf004,l_staf005
               CASE l_staf003
                  WHEN 'stao004'
                     LET l_field = "stfo003"
                  WHEN 'stao009'
                     LET l_field = "stfo008"
                  WHEN 'stao010'
                     LET l_field = "stfo009"
                  WHEN 'stao011'
                     LET l_field = "stfo010"
                  WHEN 'stao012'
                     LET l_field = "stfo011"
                  OTHERWISE
                     CONTINUE FOREACH
               END CASE 
               IF l_staf005 = 'Y' THEN
                  CALL cl_set_comp_required(l_field,TRUE)
               END IF
            END FOREACH
         ELSE
            CALL astm403_default_required_b()     
         END IF    
      ELSE
         CALL astm403_default_required_b()
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_set_no_required_b()
DEFINE l_n     LIKE type_t.num5
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf004 LIKE staf_t.staf004
DEFINE l_staf005 LIKE staf_t.staf005
DEFINE l_field  LIKE staf_t.staf003

  
      CALL astm403_init_required()
      IF NOT cl_null(g_stfo_d[l_ac].stfo002) THEN
         #檢查費用編號+經營方式是否存在asti204
         
         SELECT COUNT(*) INTO l_n FROM staf_t
          WHERE stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
         IF l_n > 0 THEN
            DECLARE sel_staf_nq CURSOR FOR 
             SELECT staf003,staf004,staf005 FROM staf_t
              WHERE  stafent = g_enterprise AND staf001= g_stfo_d[l_ac].stfo002 AND staf002 = '4'
            FOREACH sel_staf_nq INTO l_staf003,l_staf004,l_staf005
                CASE l_staf003
                  WHEN 'stao004'
                     LET l_field = "stfo003"
                  WHEN 'stao009'
                     LET l_field = "stfo008"
                  WHEN 'stao010'
                     LET l_field = "stfo009"
                  WHEN 'stao011'
                     LET l_field = "stfo010"
                  WHEN 'stao012'
                     LET l_field = "stfo011"
                  OTHERWISE
                     CONTINUE FOREACH
               END CASE 
               IF l_staf005 = 'N' THEN
                  CALL cl_set_comp_required(l_field,FALSE)
               END IF
            END FOREACH 
         ELSE
            CALL astm403_default_no_required_b()
         END IF 
      ELSE
         CALL astm403_default_no_required_b()  
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_default_entry_b()
      IF g_stfo_d[l_ac].stfo005 = '1' THEN    #變動      
          CALL cl_set_comp_entry('stfo008,stfo009',TRUE)
       ELSE                                    #固定
          CALL cl_set_comp_entry('stfo010',TRUE)
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_default_no_entry_b()
    IF g_stfo_d[l_ac].stfo005 = '2' THEN    #固定                                   #固定
       LET g_stfo_d[l_ac].stfo008 = ''
       LET g_stfo_d[l_ac].stfo008_desc = ''
       LET g_stfo_d[l_ac].stfo009 = ''
       LET g_stfo_d[l_ac].stfo009_desc = ''
       CALL cl_set_comp_entry('stfo008,stfo009,stfo011',FALSE)
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_default_required_b()
     IF g_stfo_d[l_ac].stfo005 = '1' THEN    #變動
         IF NOT cl_null(g_stfo_d[l_ac].stfo008) OR NOT cl_null(g_stfo_d[l_ac].stfo010) THEN 
            CALL cl_set_comp_required('stfo008,stfo010',TRUE)
         ELSE
            CALL cl_set_comp_required('stfo008,stfo010',FALSE)
         END IF 
         CALL cl_set_comp_required('stfo009,stfo011',TRUE)
      ELSE                                    #固定
         IF g_stfo_d[l_ac].stfo005 = '2' THEN 
            CALL cl_set_comp_required('stfo010',TRUE)
            CALL cl_set_comp_required('stfo011',FALSE)
         END IF 
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_default_no_required_b()
     IF g_stfo_d[l_ac].stfo005 = '1' THEN    #變動
         CALL cl_set_comp_required('stfo008',FALSE)
         IF cl_null(g_stfo_d[l_ac].stfo008) THEN
            CALL cl_set_comp_required('stfo010',FALSE)
         END IF      
      ELSE                                    #固定
         LET g_stfo_d[l_ac].stfo011 = ''
         CALL cl_set_comp_required('stfo009,stfo011',FALSE)
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_set_comp_entry_stfp()
   IF g_stfo2_d[l_ac].stfp020 = 'Y' THEN 
      CALL cl_set_comp_entry("stfp021",TRUE)
   ELSE
      CALL cl_set_comp_entry("stfp021",FALSE)
   END IF 
   CALL cl_set_comp_required("stfp010",FALSE)
   #计算类型1.变动
   IF g_stfo2_d[l_ac].stfp005 = '1' THEN 
      CALL cl_set_comp_entry("stfp008,stfp009,stfp010,stfp011",TRUE)
      CALL cl_set_comp_required("stfp009,stfp011",TRUE)
      IF NOT cl_null(g_stfo2_d[l_ac].stfp008) OR NOT cl_null(g_stfo2_d[l_ac].stfp010) THEN 
         CALL cl_set_comp_entry("stfp008,stfp010",TRUE)
         CALL cl_set_comp_required("stfp008,stfp010",TRUE)
      ELSE
         CALL cl_set_comp_required("stfp008,stfp010",FALSE)
      END IF  
   ELSE
      IF g_stfo2_d[l_ac].stfp005 = '2' THEN 
         CALL cl_set_comp_entry("stfp010",TRUE)
         CALL cl_set_comp_required("stfp010",TRUE)
         CALL cl_set_comp_entry("stfp008,stfp011",FALSE)
         CALL cl_set_comp_required("stfp011",FALSE)
      END IF 
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
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_stfr002_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stfo3_d[l_ac].stfr002
    CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stfo3_d[l_ac].stfr002_desc = '', g_rtn_fields[1] , ''
    DISPLAY BY NAME g_stfo3_d[l_ac].stfr002_desc
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
PRIVATE FUNCTION astm403_stfs002_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stfo4_d[l_ac].stfs002
  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stfo4_d[l_ac].stfs002_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stfo4_d[l_ac].stfs002_desc
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
PRIVATE FUNCTION astm403_stfnsite_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stfn_m.stfnsite
  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stfn_m.stfnsite_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stfn_m.stfnsite_desc
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
PRIVATE FUNCTION astm403_stfnunit_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stfn_m.stfnunit
  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stfn_m.stfnunit_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stfn_m.stfnunit_desc
END FUNCTION

################################################################################
# Descriptions...: 门店逻辑检查
# Memo...........:
# Usage..........: CALL astm403_stfs002_chk()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: add By 161024-00025#12
# Modify.........:
################################################################################
PRIVATE FUNCTION astm403_stfs002_chk()
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = g_stfo4_d[g_detail_idx].stfs002

   IF NOT cl_chk_exist("v_ooef001_35") THEN 
      RETURN FALSE
   END IF
   RETURN TRUE

END FUNCTION

 
{</section>}
 
